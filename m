Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A8783107
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 21:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163AB10E295;
	Mon, 21 Aug 2023 19:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2088710E295
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 19:46:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso5547424e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1692647186; x=1693251986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VH/LIB2BBl9Xhwi9WvZVYemx6cbW4NSMo7wfC5sW4/U=;
 b=4lugpclUh6TGrOj/5r/ZpWy9qvRbxn+AVfyrfqJVd4x/iFGt58A9UPDlDN4TUk8bKc
 puBOh2kbF1JB3UIOGAYDWLoyDo390trTLn9vf6gjdWJM6Mao4lmeDSsxSQYAvovNPSvX
 2ZWfXVcYjA8sP0aHHTn9PSJS2fyLOdkLlw0ZdNhvNgp7eSbBK2dCxTKdrri7kT8QdG28
 wVOZNAD/ZFu6y1PIPwXSqBuNUJG3VtnTF4EN9CTEudmos0K8bka/AMbspuFpG1zVuMZr
 uCuqKPBZq8xF690+u98wJ/YWrI2hXE0VR9r5pjrzM37ULrYs+6s1gsZTaitWOOoMbJob
 ErBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692647186; x=1693251986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VH/LIB2BBl9Xhwi9WvZVYemx6cbW4NSMo7wfC5sW4/U=;
 b=SLUu6K/wqCWeBG7mkE0tQQcdvUVkNS5OTLrplifUlHxn5qqXE9bpdT0GprBUfENbv1
 KqkwJef6bvwKodvxKKnPX1ikXtCs1nI9ssTCsz9sPdTpoYBiUzio+P6umDWhilYo7Qkh
 hDqrPti1Ce8AZHdaixoOxMLvCb24PdH7Mx2sgwcXHMQjYyJzrvZiapLRA0y6Msx3mDZ+
 g5hC8GzXxFW1nEN2fA5VvXtmCMzLy1Xndf18LG3EUaCi5HmN7ZTv2hZnyvgObCezcpS7
 RNQdVcY40lFQv/sFAy/xLusYuo5AeVbd7KGWGmPCruIE9mwldFKvndUd5rIb4NGmq7TB
 owFg==
X-Gm-Message-State: AOJu0Yzwzqu4UPHax7eONscEyWu67NeZhfgy3JQD5dr7WvGPxaUHKqaA
 LeR6V2U3M9Y8CgdpK90aTwsWZngsYJ+39DILmqsr3Q==
X-Google-Smtp-Source: AGHT+IHZLI+rqqFi2GPtentGkSlxA7d7hS9xSHP8Tp++QKx+EH7Mwgia6K4BbFUz1JQ9+d4unHseC43vDh1rkRehVeg=
X-Received: by 2002:a05:6512:2114:b0:4fe:79c:7269 with SMTP id
 q20-20020a056512211400b004fe079c7269mr5305265lfr.67.1692647185853; Mon, 21
 Aug 2023 12:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
 <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
 <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
 <85107169-8a24-441f-6631-d99472d810f0@amd.com>
In-Reply-To: <85107169-8a24-441f-6631-d99472d810f0@amd.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 21 Aug 2023 14:46:14 -0500
Message-ID: <CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="0000000000003e498106037422ec"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003e498106037422ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 1:13=E2=80=AFPM Christian K=C3=B6nig <christian.koe=
nig@amd.com>
wrote:

> Am 21.08.23 um 20:01 schrieb Danilo Krummrich:
> > On 8/21/23 16:07, Christian K=C3=B6nig wrote:
> >> Am 18.08.23 um 13:58 schrieb Danilo Krummrich:
> >>> [SNIP]
> >>>> I only see two possible outcomes:
> >>>> 1. You return -EBUSY (or similar) error code indicating the the hw
> >>>> can't receive more commands.
> >>>> 2. Wait on previously pushed commands to be executed.
> >>>> (3. Your driver crash because you accidentally overwrite stuff in
> >>>> the ring buffer which is still executed. I just assume that's
> >>>> prevented).
> >>>>
> >>>> Resolution #1 with -EBUSY is actually something the UAPI should not
> >>>> do, because your UAPI then depends on the specific timing of
> >>>> submissions which is a really bad idea.
> >>>>
> >>>> Resolution #2 is usually bad because it forces the hw to run dry
> >>>> between submission and so degrade performance.
> >>>
> >>> I agree, that is a good reason for at least limiting the maximum job
> >>> size to half of the ring size.
> >>>
> >>> However, there could still be cases where two subsequent jobs are
> >>> submitted with just a single IB, which as is would still block
> >>> subsequent jobs to be pushed to the ring although there is still
> >>> plenty of space. Depending on the (CPU) scheduler latency, such a
> >>> case can let the HW run dry as well.
> >>
> >> Yeah, that was intentionally not done as well. The crux here is that
> >> the more you push to the hw the worse the scheduling granularity
> >> becomes. It's just that neither Xe nor Nouveau relies that much on
> >> the scheduling granularity at all (because of hw queues).
> >>
> >> But Xe doesn't seem to need that feature and I would still try to
> >> avoid it because the more you have pushed to the hw the harder it is
> >> to get going again after a reset.
> >>
> >>>
> >>> Surely, we could just continue decrease the maximum job size even
> >>> further, but this would result in further overhead on user and
> >>> kernel for larger IB counts. Tracking the actual job size seems to
> >>> be the better solution for drivers where the job size can vary over
> >>> a rather huge range.
> >>
> >> I strongly disagree on that. A larger ring buffer is trivial to
> allocate
> >
> > That sounds like a workaround to me. The problem, in the case above,
> > isn't that the ring buffer does not have enough space, the problem is
> > that we account for the maximum job size although the actual job size
> > is much smaller. And enabling the scheduler to track the actual job
> > size is trivial as well.
>
> That's what I agree on, so far I just didn't see the reason for doing it
> but at least a few reason for not doing it.
>
> >
> >> and if userspace submissions are so small that the scheduler can't
> >> keep up submitting them then your ring buffer size is your smallest
> >> problem.
> >>
> >> In other words the submission overhead will completely kill your
> >> performance and you should probably consider stuffing more into a
> >> single submission.
> >
> > I fully agree and that is also the reason why I want to keep the
> > maximum job size as large as possible.
> >
> > However, afaik with Vulkan it's the applications themselves deciding
> > when and with how many command buffers a queue is submitted (@Faith:
> > please correct me if I'm wrong). Hence, why not optimize for this case
> > as well? It's not that it would make another case worse, right?
>
> As I said it does make both the scheduling granularity as well as the
> reset behavior worse.
>
> In general I think we should try to push just enough work to the
> hardware to keep it busy and not as much as possible.
>
> So as long as nobody from userspace comes and says we absolutely need to
> optimize this use case I would rather not do it.
>

This is a place where nouveau's needs are legitimately different from AMD
or Intel, I think.  NVIDIA's command streamer model is very different from
AMD and Intel.  On AMD and Intel, each EXEC turns into a single small
packet (on the order of 16B) which kicks off a command buffer.  There may
be a bit of cache management or something around it but that's it.  From
there, it's userspace's job to make one command buffer chain to another
until it's finally done and then do a "return", whatever that looks like.

NVIDIA's model is much more static.  Each packet in the HW/FW ring is an
address and a size and that much data is processed and then it grabs the
next packet and processes. The result is that, if we use multiple buffers
of commands, there's no way to chain them together.  We just have to pass
the whole list of buffers to the kernel.  A single EXEC ioctl / job may
have 500 such addr+size packets depending on how big the command buffer
is.  It gets worse on pre-Turing hardware where we have to split the batch
for every single DrawIndirect or DispatchIndirect.

Lest you think NVIDIA is just crazy here, it's a perfectly reasonable model
if you assume that userspace is feeding the firmware.  When that's
happening, you just have a userspace thread that sits there and feeds the
ringbuffer with whatever is next and you can marshal as much data through
as you want. Sure, it'd be nice to have a 2nd level batch thing that gets
launched from the FW ring and has all the individual launch commands but
it's not at all necessary.

What does that mean from a gpu_scheduler PoV? Basically, it means a
variable packet size.

What does this mean for implementation? IDK.  One option would be to teach
the scheduler about actual job sizes. Another would be to virtualize it and
have another layer underneath the scheduler that does the actual feeding of
the ring. Another would be to decrease the job size somewhat and then have
the front-end submit as many jobs as it needs to service userspace and only
put the out-fences on the last job. All the options kinda suck.

~Faith

--0000000000003e498106037422ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Aug 21, 2023 at 1:13=E2=80=AFPM Christian K=C3=B6nig &lt;<a =
href=3D"mailto:christian.koenig@amd.com">christian.koenig@amd.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 21.08.2=
3 um 20:01 schrieb Danilo Krummrich:<br>
&gt; On 8/21/23 16:07, Christian K=C3=B6nig wrote:<br>
&gt;&gt; Am 18.08.23 um 13:58 schrieb Danilo Krummrich:<br>
&gt;&gt;&gt; [SNIP]<br>
&gt;&gt;&gt;&gt; I only see two possible outcomes:<br>
&gt;&gt;&gt;&gt; 1. You return -EBUSY (or similar) error code indicating th=
e the hw <br>
&gt;&gt;&gt;&gt; can&#39;t receive more commands.<br>
&gt;&gt;&gt;&gt; 2. Wait on previously pushed commands to be executed.<br>
&gt;&gt;&gt;&gt; (3. Your driver crash because you accidentally overwrite s=
tuff in <br>
&gt;&gt;&gt;&gt; the ring buffer which is still executed. I just assume tha=
t&#39;s <br>
&gt;&gt;&gt;&gt; prevented).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Resolution #1 with -EBUSY is actually something the UAPI s=
hould not <br>
&gt;&gt;&gt;&gt; do, because your UAPI then depends on the specific timing =
of <br>
&gt;&gt;&gt;&gt; submissions which is a really bad idea.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Resolution #2 is usually bad because it forces the hw to r=
un dry <br>
&gt;&gt;&gt;&gt; between submission and so degrade performance.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I agree, that is a good reason for at least limiting the maxim=
um job <br>
&gt;&gt;&gt; size to half of the ring size.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; However, there could still be cases where two subsequent jobs =
are <br>
&gt;&gt;&gt; submitted with just a single IB, which as is would still block=
 <br>
&gt;&gt;&gt; subsequent jobs to be pushed to the ring although there is sti=
ll <br>
&gt;&gt;&gt; plenty of space. Depending on the (CPU) scheduler latency, suc=
h a <br>
&gt;&gt;&gt; case can let the HW run dry as well.<br>
&gt;&gt;<br>
&gt;&gt; Yeah, that was intentionally not done as well. The crux here is th=
at <br>
&gt;&gt; the more you push to the hw the worse the scheduling granularity <=
br>
&gt;&gt; becomes. It&#39;s just that neither Xe nor Nouveau relies that muc=
h on <br>
&gt;&gt; the scheduling granularity at all (because of hw queues).<br>
&gt;&gt;<br>
&gt;&gt; But Xe doesn&#39;t seem to need that feature and I would still try=
 to <br>
&gt;&gt; avoid it because the more you have pushed to the hw the harder it =
is <br>
&gt;&gt; to get going again after a reset.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Surely, we could just continue decrease the maximum job size e=
ven <br>
&gt;&gt;&gt; further, but this would result in further overhead on user and=
 <br>
&gt;&gt;&gt; kernel for larger IB counts. Tracking the actual job size seem=
s to <br>
&gt;&gt;&gt; be the better solution for drivers where the job size can vary=
 over <br>
&gt;&gt;&gt; a rather huge range.<br>
&gt;&gt;<br>
&gt;&gt; I strongly disagree on that. A larger ring buffer is trivial to al=
locate <br>
&gt;<br>
&gt; That sounds like a workaround to me. The problem, in the case above, <=
br>
&gt; isn&#39;t that the ring buffer does not have enough space, the problem=
 is <br>
&gt; that we account for the maximum job size although the actual job size =
<br>
&gt; is much smaller. And enabling the scheduler to track the actual job <b=
r>
&gt; size is trivial as well.<br>
<br>
That&#39;s what I agree on, so far I just didn&#39;t see the reason for doi=
ng it <br>
but at least a few reason for not doing it.<br>
<br>
&gt;<br>
&gt;&gt; and if userspace submissions are so small that the scheduler can&#=
39;t <br>
&gt;&gt; keep up submitting them then your ring buffer size is your smalles=
t <br>
&gt;&gt; problem.<br>
&gt;&gt;<br>
&gt;&gt; In other words the submission overhead will completely kill your <=
br>
&gt;&gt; performance and you should probably consider stuffing more into a =
<br>
&gt;&gt; single submission.<br>
&gt;<br>
&gt; I fully agree and that is also the reason why I want to keep the <br>
&gt; maximum job size as large as possible.<br>
&gt;<br>
&gt; However, afaik with Vulkan it&#39;s the applications themselves decidi=
ng <br>
&gt; when and with how many command buffers a queue is submitted (@Faith: <=
br>
&gt; please correct me if I&#39;m wrong). Hence, why not optimize for this =
case <br>
&gt; as well? It&#39;s not that it would make another case worse, right?<br=
>
<br>
As I said it does make both the scheduling granularity as well as the <br>
reset behavior worse.<br>
<br>
In general I think we should try to push just enough work to the <br>
hardware to keep it busy and not as much as possible.<br>
<br>
So as long as nobody from userspace comes and says we absolutely need to <b=
r>
optimize this use case I would rather not do it.<br></blockquote><div><br><=
/div><div>This is a place where nouveau&#39;s needs are legitimately differ=
ent from AMD or Intel, I think.=C2=A0 NVIDIA&#39;s command streamer model i=
s very different from AMD and Intel.=C2=A0 On AMD and Intel, each EXEC turn=
s into a single small packet (on the order of 16B) which kicks off a comman=
d buffer.=C2=A0 There may be a bit of cache management or something around =
it but that&#39;s it.=C2=A0 From there, it&#39;s userspace&#39;s job to mak=
e one command buffer chain to another until it&#39;s finally done and then =
do a &quot;return&quot;, whatever that looks like.=C2=A0</div><div><br></di=
v><div>NVIDIA&#39;s model is much more static.=C2=A0 Each packet in the HW/=
FW ring is an address and a size and that much data is processed and then i=
t grabs the next packet and processes. The result is that, if we use multip=
le buffers of commands, there&#39;s no way to chain them together.=C2=A0 We=
 just have to pass the whole list of buffers to the kernel.=C2=A0 A single =
EXEC ioctl / job may have 500 such addr+size packets depending on how big t=
he command buffer is.=C2=A0 It gets worse on pre-Turing hardware where we h=
ave to split the batch for every single DrawIndirect or DispatchIndirect.</=
div><div><br></div><div>Lest you think NVIDIA is just crazy here, it&#39;s =
a perfectly reasonable model if you assume that userspace is feeding the fi=
rmware.=C2=A0 When that&#39;s happening, you just have a userspace thread t=
hat sits there and feeds the ringbuffer with whatever is next and you can m=
arshal as much data through as you want. Sure, it&#39;d be nice to have a 2=
nd level batch thing that gets launched from the FW ring and has all the in=
dividual launch commands but it&#39;s not at all necessary.</div><div><br><=
/div><div>What does that mean from a gpu_scheduler PoV? Basically, it means=
 a variable packet size.<br></div><div><br></div><div>What does this mean f=
or implementation? IDK.=C2=A0 One option would be to teach the scheduler ab=
out actual job sizes. Another would be to virtualize it and have another la=
yer underneath the scheduler that does the actual feeding of the ring. Anot=
her would be to decrease the job size somewhat and then have the front-end =
submit as many jobs as it needs to service userspace and only put the out-f=
ences on the last job. All the options kinda suck.</div><div><br></div><div=
>~Faith<br></div></div></div>

--0000000000003e498106037422ec--
