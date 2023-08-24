Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AAB786E69
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C102710E522;
	Thu, 24 Aug 2023 11:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA2288DA9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:50:12 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5928e293260so194687b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google; t=1692877812; x=1693482612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7fdr9oJOmB6EYUAFev6Cp6SGBd5rMCvqsWMa+J6pNU=;
 b=ammouUmA4+cS0GNI8WlsRJle1J7IyjSMNRA1zgJf+rrLBb7cyZaj8wZnwh7xL8D7vq
 767RSyqzR4WRXRy1I2dxBdUY1Pzr6zZWthlvZq0y1t6/HdEQcvnrkNPmgJlDkBQ/ADW/
 R4a234qo9QVLPwi5EQwEEjoMTyGJOEpZpFg6DTwXxr9BJuoEUBWtg8y5JokZmzFDSidM
 54q9J7x+7IeMsPYxcqBd7QUQmWXCO5Th6ULsW34ye2dwnHOH2Qm3/pdrLCMbQ3Om+y77
 Q6SgTYLajho96t8UJXby+e0Q8KX6BDcyZKtLw5p1oy7Ag/UK7U8aEq9ruXWxOjudTKuY
 b4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692877812; x=1693482612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7fdr9oJOmB6EYUAFev6Cp6SGBd5rMCvqsWMa+J6pNU=;
 b=XzSok4aHZv0wa0IfXDLs9qmPrMmNnbHf9eu45e9/2Yv1ppV2YOkgLxN24uDNqBcs2N
 jOy8pE6mpj/0tp5+ZeOuZIrAUQ8GbJs4Daeq5uBswclE839qXmqKFUeiA837++o3M94i
 dSlyparjv2tmOwpvjk2K6C9iMQeJXRyv99VA4j8Zk7t+pmh5cJWJ3Y/BnMNlEcuoJ02q
 OXzyoG9JaNx+IL0d4LI9uOOVevjBRS9i0Bb1Z7zYQhSdj3IPfL+mSkxzp+EFLUp+jYcL
 wxHy5macuQtggBMV9/tU3wWh/ISpo6X3JH5HZ9y7vxWXe3YB4/831r/ojyjZAMB0qXO9
 jNnw==
X-Gm-Message-State: AOJu0Yzdvg/OrJ0NQ+aEuOEhM/cPXrhCohJKWPTT71Jp+TjV+Wbelgl5
 xnpVLUeeoEMst/jiZs3wm0V8LtMdSRVUkZLsKDZw2Q==
X-Google-Smtp-Source: AGHT+IGkFMBPFJtdQikySLHZxZq8iU3FK+t4EEeY4PhiaQ1tapJCkHCwD4Kdv350EoTfq1yfe+e7UxTElC+BJ5/IX2E=
X-Received: by 2002:a81:8395:0:b0:586:ab46:2c54 with SMTP id
 t143-20020a818395000000b00586ab462c54mr8663787ywf.5.1692877811986; Thu, 24
 Aug 2023 04:50:11 -0700 (PDT)
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
 <CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com>
 <2498b1a3-6597-c112-82cd-58b44ca188f0@amd.com>
 <CAOFGe97ZEy_fstHK+Hm5rJpfXJmw0ODhq0uoC6JAXDYkWpMpWQ@mail.gmail.com>
In-Reply-To: <CAOFGe97ZEy_fstHK+Hm5rJpfXJmw0ODhq0uoC6JAXDYkWpMpWQ@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 24 Aug 2023 13:50:00 +0200
Message-ID: <CAP+8YyE=R_uHHsH10s20VoS1BX5=CjOXS+Atm1uW9nqHvNkaTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Faith Ekstrand <faith@gfxstrand.net>
Content-Type: multipart/alternative; boundary="000000000000a1cc740603a9d467"
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
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a1cc740603a9d467
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 6:55=E2=80=AFPM Faith Ekstrand <faith@gfxstrand.net=
> wrote:

> On Tue, Aug 22, 2023 at 4:51=E2=80=AFAM Christian K=C3=B6nig <christian.k=
oenig@amd.com>
> wrote:
>
>> Am 21.08.23 um 21:46 schrieb Faith Ekstrand:
>>
>> On Mon, Aug 21, 2023 at 1:13=E2=80=AFPM Christian K=C3=B6nig <christian.=
koenig@amd.com>
>> wrote:
>>
>>> [SNIP]
>>> So as long as nobody from userspace comes and says we absolutely need t=
o
>>> optimize this use case I would rather not do it.
>>>
>>
>> This is a place where nouveau's needs are legitimately different from AM=
D
>> or Intel, I think.  NVIDIA's command streamer model is very different fr=
om
>> AMD and Intel.  On AMD and Intel, each EXEC turns into a single small
>> packet (on the order of 16B) which kicks off a command buffer.  There ma=
y
>> be a bit of cache management or something around it but that's it.  From
>> there, it's userspace's job to make one command buffer chain to another
>> until it's finally done and then do a "return", whatever that looks like=
.
>>
>> NVIDIA's model is much more static.  Each packet in the HW/FW ring is an
>> address and a size and that much data is processed and then it grabs the
>> next packet and processes. The result is that, if we use multiple buffer=
s
>> of commands, there's no way to chain them together.  We just have to pas=
s
>> the whole list of buffers to the kernel.
>>
>>
>> So far that is actually completely identical to what AMD has.
>>
>> A single EXEC ioctl / job may have 500 such addr+size packets depending
>> on how big the command buffer is.
>>
>>
>> And that is what I don't understand. Why would you need 100dreds of such
>> addr+size packets?
>>
>
> Well, we're not really in control of it.  We can control our base pushbuf
> size and that's something we can tune but we're still limited by the
> client.  We have to submit another pushbuf whenever:
>
>  1. We run out of space (power-of-two growth is also possible but the siz=
e
> is limited to a maximum of about 4MiB due to hardware limitations.)
>  2. The client calls a secondary command buffer.
>  3. Any usage of indirect draw or dispatch on pre-Turing hardware.
>
> At some point we need to tune our BO size a bit to avoid (1) while also
> avoiding piles of tiny BOs.  However, (2) and (3) are out of our control.
>
> This is basically identical to what AMD has (well on newer hw there is an
>> extension in the CP packets to JUMP/CALL subsequent IBs, but this isn't
>> widely used as far as I know).
>>
>
> According to Bas, RADV chains on recent hardware.
>

well:

1) on GFX6 and older we can't chain at all
2) on Compute/DMA we can't chain at all
3) with VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT we can't chain between
cmdbuffers
4) for some secondary use cases we can't chain.

so we have to do the "submit multiple" dance in many cases.

>
>
>> Previously the limit was something like 4 which we extended to because
>> Bas came up with similar requirements for the AMD side from RADV.
>>
>> But essentially those approaches with 100dreds of IBs doesn't sound like
>> a good idea to me.
>>
>
> No one's arguing that they like it.  Again, the hardware isn't designed t=
o
> have a kernel in the way. It's designed to be fed by userspace. But we're
> going to have the kernel in the middle for a while so we need to make it
> not suck too bad.
>
> ~Faith
>
> It gets worse on pre-Turing hardware where we have to split the batch for
>> every single DrawIndirect or DispatchIndirect.
>>
>> Lest you think NVIDIA is just crazy here, it's a perfectly reasonable
>> model if you assume that userspace is feeding the firmware.  When that's
>> happening, you just have a userspace thread that sits there and feeds th=
e
>> ringbuffer with whatever is next and you can marshal as much data throug=
h
>> as you want. Sure, it'd be nice to have a 2nd level batch thing that get=
s
>> launched from the FW ring and has all the individual launch commands but
>> it's not at all necessary.
>>
>> What does that mean from a gpu_scheduler PoV? Basically, it means a
>> variable packet size.
>>
>> What does this mean for implementation? IDK.  One option would be to
>> teach the scheduler about actual job sizes. Another would be to virtuali=
ze
>> it and have another layer underneath the scheduler that does the actual
>> feeding of the ring. Another would be to decrease the job size somewhat =
and
>> then have the front-end submit as many jobs as it needs to service
>> userspace and only put the out-fences on the last job. All the options
>> kinda suck.
>>
>>
>> Yeah, agree. The job size Danilo suggested is still the least painful.
>>
>> Christian.
>>
>>
>> ~Faith
>>
>>
>>

--000000000000a1cc740603a9d467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 22, 2023 at 6:55=E2=80=AF=
PM Faith Ekstrand &lt;<a href=3D"mailto:faith@gfxstrand.net">faith@gfxstran=
d.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Aug 22, 2023 at 4:51=E2=80=AFAM Christian K=C3=B6nig &l=
t;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank">christian.k=
oenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">

 =20
  <div>
    Am 21.08.23 um 21:46 schrieb Faith Ekstrand:<br>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 21, 2023 at
            1:13=E2=80=AFPM Christian K=C3=B6nig &lt;<a href=3D"mailto:chri=
stian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">[SNIP]<br>
            So as long as nobody from userspace comes and says we
            absolutely need to <br>
            optimize this use case I would rather not do it.<br>
          </blockquote>
          <div><br>
          </div>
          <div>This is a place where nouveau&#39;s needs are legitimately
            different from AMD or Intel, I think.=C2=A0 NVIDIA&#39;s comman=
d
            streamer model is very different from AMD and Intel.=C2=A0 On A=
MD
            and Intel, each EXEC turns into a single small packet (on
            the order of 16B) which kicks off a command buffer.=C2=A0 There
            may be a bit of cache management or something around it but
            that&#39;s it.=C2=A0 From there, it&#39;s userspace&#39;s job t=
o make one
            command buffer chain to another until it&#39;s finally done and
            then do a &quot;return&quot;, whatever that looks like.=C2=A0</=
div>
          <div><br>
          </div>
          <div>NVIDIA&#39;s model is much more static.=C2=A0 Each packet in=
 the
            HW/FW ring is an address and a size and that much data is
            processed and then it grabs the next packet and processes.
            The result is that, if we use multiple buffers of commands,
            there&#39;s no way to chain them together.=C2=A0 We just have t=
o pass
            the whole list of buffers to the kernel.</div>
        </div>
      </div>
    </blockquote>
    <br>
    So far that is actually completely identical to what AMD has.<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>A single EXEC ioctl / job may have 500 such addr+size
            packets depending on how big the command buffer is.</div>
        </div>
      </div>
    </blockquote>
    <br>
    And that is what I don&#39;t understand. Why would you need 100dreds of
    such addr+size packets?<br></div></blockquote><div><br></div><div>Well,=
 we&#39;re not really in control of it.=C2=A0 We can control our base pushb=
uf size and that&#39;s something we can tune but we&#39;re still limited by=
 the client.=C2=A0 We have to submit another pushbuf whenever:</div><div><b=
r></div><div>=C2=A01. We run out of space (power-of-two growth is also poss=
ible but the size is limited to a maximum of about 4MiB due to hardware lim=
itations.)<br></div><div>=C2=A02. The client calls a secondary command buff=
er.</div><div>=C2=A03. Any usage of indirect draw or dispatch on pre-Turing=
 hardware.</div><div><br></div><div>At some point we need to tune our BO si=
ze a bit to avoid (1) while also avoiding piles of tiny BOs.=C2=A0 However,=
 (2) and (3) are out of our control.<br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div>
    This is basically identical to what AMD has (well on newer hw there
    is an extension in the CP packets to JUMP/CALL subsequent IBs, but
    this isn&#39;t widely used as far as I know).<br></div></blockquote><di=
v><br></div><div>According to Bas, RADV chains on recent hardware.<br></div=
></div></div></blockquote><div>=C2=A0</div><div>well:</div><div><br></div><=
div>1) on GFX6 and older we can&#39;t chain at all<br></div><div>2) on Comp=
ute/DMA we can&#39;t chain at all<br></div><div>3) with=C2=A0<code>VK_COMMA=
ND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT</code> we can&#39;t chain between cmdb=
uffers<br></div><div>4) for some secondary use cases we can&#39;t chain.</d=
iv><div><br></div><div>so we have to do the &quot;submit multiple&quot; dan=
ce in many cases.<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div>
    Previously the limit was something like 4 which we extended to
    because Bas came up with similar requirements for the AMD side from
    RADV.<br>
    <br>
    But essentially those approaches with 100dreds of IBs doesn&#39;t sound
    like a good idea to me.<br></div></blockquote><div><br></div><div>No on=
e&#39;s arguing that they like it.=C2=A0 Again, the hardware isn&#39;t desi=
gned to have a kernel in the way. It&#39;s designed to be fed by userspace.=
 But we&#39;re going to have the kernel in the middle for a while so we nee=
d to make it not suck too bad.<br></div><div><br></div><div>~Faith<br></div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>It gets worse on pre-Turing hardware where we have to
            split the batch for every single DrawIndirect or
            DispatchIndirect.</div>
          <div><br>
          </div>
          <div>Lest you think NVIDIA is just crazy here, it&#39;s a
            perfectly reasonable model if you assume that userspace is
            feeding the firmware.=C2=A0 When that&#39;s happening, you just=
 have
            a userspace thread that sits there and feeds the ringbuffer
            with whatever is next and you can marshal as much data
            through as you want. Sure, it&#39;d be nice to have a 2nd level
            batch thing that gets launched from the FW ring and has all
            the individual launch commands but it&#39;s not at all
            necessary.</div>
          <div><br>
          </div>
          <div>What does that mean from a gpu_scheduler PoV? Basically,
            it means a variable packet size.<br>
          </div>
          <div><br>
          </div>
          <div>What does this mean for implementation? IDK.=C2=A0 One optio=
n
            would be to teach the scheduler about actual job sizes.
            Another would be to virtualize it and have another layer
            underneath the scheduler that does the actual feeding of the
            ring. Another would be to decrease the job size somewhat and
            then have the front-end submit as many jobs as it needs to
            service userspace and only put the out-fences on the last
            job. All the options kinda suck.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, agree. The job size Danilo suggested is still the least
    painful.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>~Faith<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div></div>
</blockquote></div></div>

--000000000000a1cc740603a9d467--
