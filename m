Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9A18DF96
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41846E312;
	Sat, 21 Mar 2020 10:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE0C6EB6D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 21:35:39 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t21so5705333lfe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 14:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCDsP/U4Ms1AhLHpI7SZoQLxQGHhjcNRvpYOI8469D8=;
 b=umvvKuUp0qCw0SMhrr9YFFX35Pb2FD3pqboXfGroPGL0ICbyN1BL7SZXZFp02pzaWh
 V6kcLZhvWlcSBhhPi0qxn1Gm3lHSw7/xV1fsPRwfhPfoMxivbqqXKQuL8YDEM2tI3Fz7
 2LYuvxK/wv522r8zC/uM1rvq96H8vvsreGNxpjDAtRfnpTCG6lhSnKJAF2Ipn4Epvz20
 UhCqFfkMUjXMrR72JvKuhxhz5Bwb/EV2cnpcARjBLhiNIQIHedi9GDbgA3gNwk71YLyV
 j2F/YJRipjLIEkMV990PRiUIF4lLERdU4a7XBZHRqtSvo1oNMLIu8c2YvuZxu7oOLLcd
 4gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCDsP/U4Ms1AhLHpI7SZoQLxQGHhjcNRvpYOI8469D8=;
 b=E7vrSii9zMgXMEIhftLh8SzmKZ5ryPlD8uGSzCg+wQDXF5jb9lQxyfj3c3+F4ceCvX
 xKEYhNzm0uXniQZFUtcDsWs9ovT9JDrK9YHRaC5vlyR3XyLBZjbvN6lncZJEAceks9dW
 U4rMfTdarynFO+BipGPUruSIaZEi3eGaI/YSnQxDXDxv7uChOzH8EXOh7qudNfZUcBrt
 nt4NMjDfKHZVodahn2fiZ+245LqU1QsRj6/1o1YLZVk8lHO5BlQ/vztdEtNXa06fauxK
 F99rvcvNV+xtpWv/q7UXmG4VuZydg5Ebpz8gK4qmdHqfI3rid5guN47AAKWz/0VFszfx
 Cqog==
X-Gm-Message-State: ANhLgQ14PtqeANUoGEtVLxZaRVzmFrw3FMaQVFmBxn+yk6z8w61NpEpO
 nMnkmFTdaENiAxWv1LMmIhwugPoVJAngwjrqq9xb
X-Google-Smtp-Source: ADFU+vvhJxTDjPKM0Tsq1MZWycwDxA87bamtVlGnPU4b7YpTwEb/JWmpXMOT57yZxKG1ocPE4lHlHg3iBmmLX09BNR4=
X-Received: by 2002:a05:6512:1054:: with SMTP id
 c20mr6439799lfb.69.1584740136982; 
 Fri, 20 Mar 2020 14:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <1931035.d46ecxlGCF@saphira>
 <CAKT=dDmMs1VOFst3gVUbsAp8yFuvV9e+zq0DqayBQ8G7+utc7g@mail.gmail.com>
 <12494517.uLZWGnKmhe@solembum>
In-Reply-To: <12494517.uLZWGnKmhe@solembum>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Fri, 20 Mar 2020 14:35:25 -0700
Message-ID: <CAKT=dD=L8T6vC3N6-ntGmA0qbAULmLv0a81rRS4VSVzC-zL3Kg@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Rohan Garg <rohan.garg@collabora.com>
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:31 +0000
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Kenny Ho <y2kenny@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: multipart/mixed; boundary="===============0461172036=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0461172036==
Content-Type: multipart/alternative; boundary="000000000000ed872905a15010d6"

--000000000000ed872905a15010d6
Content-Type: text/plain; charset="UTF-8"

Hi Rohan,

Thanks for your reply! We'd like the standardization to happen in the drm
layer so it can be carried along, however, debugfs has already been
deprecated in Android kernel and tracking per pid is most likely a doable
solution only in the device driver layer. So...since we'd still like the
low-cost run-time query system, we eventually end up doing the
tracepoint[1] + eBPF solution. We standardized a gpu memory total
tracepoint in upstream linux. Then the GPU vendors integrate into their
kernel driver to track those global and per-process total counters. Then we
wrote a bpf c program to track this tracepoint and maintain a map for the
userspace to poke at.

Best regards,
Yiwei

[1] https://lore.kernel.org/lkml/20200302235044.59163-1-zzyiwei@google.com



On Fri, Mar 20, 2020 at 5:07 AM Rohan Garg <rohan.garg@collabora.com> wrote:

> Hi Yiwei
> After some deliberation on how to move forward with my BO Labeling
> patches[1],
> we've come up with the following structure for debugfs entries:
>
> /debugfs/dri/128/bo/<handle>/label
> /debugfs/dri/128/bo/<handle>/size
>
> My initial idea was to count the total memory allocated for a particular
> label
> in kernel space, but that turned out to be far too complicated to
> implement.
> Which is why we decided to move towards something simpler and handle
> collating
> this information on the userspace side of things.
>
> Would this satisfy most of the Android  teams requirements? I understand
> that
> it would leave out the memory tracking requirements tied to a specific
> PID,
> but correct me if I'm wrong, would this not possible with gralloc on
> Android?
>
> Cheers
> Rohan Garg
>
> [1] https://patchwork.freedesktop.org/patch/335508/?series=66752&rev=4
>
> On lunes, 6 de enero de 2020 21:47:21 (CET) Yiwei Zhang wrote:
> > Thanks, I'll check it out.
> >
> > Best,
> > Yiwei
> >
> > On Mon, Jan 6, 2020 at 2:46 AM Rohan Garg <rohan.garg@collabora.com>
> wrote:
> > > Hi Yiwei
> > >
> > > On jueves, 19 de diciembre de 2019 19:52:26 (CET) Yiwei Zhang wrote:
> > > > Hi Rohan,
> > > >
> > > > Thanks for pointing out the pids issue! Then the index would be
> > >
> > > {namespace
> > >
> > > > + pid(in that namespace)}. I'll grab a setup and play with the
> driver to
> > > > see what I can do. I know how to find an Intel or Freedreno setup,
> but
> > >
> > > I'd
> > >
> > > > still like to know is there a development friendly Mali setup?
> > >
> > > You should be able to setup a Mali T860 compatible device with this
> guide
> > > [1].
> > >
> > > Cheers
> > > Rohan Garg
> > >
> > > [1] https://panfrost.freedesktop.org/building-panfrost-mesa.html
>
>

--000000000000ed872905a15010d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rohan,<br><br>Thanks for your reply! We&#39;d like the =
standardization to happen in the drm layer so it can be carried along, howe=
ver, debugfs has already been deprecated in Android kernel and tracking per=
 pid is most likely a doable solution only in the device driver layer. So..=
.since we&#39;d still like the low-cost run-time query system, we eventuall=
y end up doing the tracepoint[1] + eBPF solution. We standardized a gpu mem=
ory total tracepoint in upstream linux. Then the GPU vendors integrate into=
 their kernel driver to track those global and per-process total counters. =
Then we wrote a bpf c program to track this tracepoint and maintain a map f=
or the userspace to poke at.<div><br></div><div>Best regards,</div><div>Yiw=
ei<br><br>[1] <a href=3D"https://lore.kernel.org/lkml/20200302235044.59163-=
1-zzyiwei@google.com">https://lore.kernel.org/lkml/20200302235044.59163-1-z=
zyiwei@google.com</a><br><div><br></div></div></div><br><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2020 at 5=
:07 AM Rohan Garg &lt;<a href=3D"mailto:rohan.garg@collabora.com">rohan.gar=
g@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Yiwei<br>
After some deliberation on how to move forward with my BO Labeling patches[=
1],<br>
we&#39;ve come up with the following structure for debugfs entries:<br>
<br>
/debugfs/dri/128/bo/&lt;handle&gt;/label<br>
/debugfs/dri/128/bo/&lt;handle&gt;/size<br>
<br>
My initial idea was to count the total memory allocated for a particular la=
bel <br>
in kernel space, but that turned out to be far too complicated to implement=
. <br>
Which is why we decided to move towards something simpler and handle collat=
ing <br>
this information on the userspace side of things.<br>
<br>
Would this satisfy most of the Android=C2=A0 teams requirements? I understa=
nd that <br>
it would leave out the memory tracking requirements tied to a specific PID,=
 <br>
but correct me if I&#39;m wrong, would this not possible with gralloc on An=
droid?<br>
<br>
Cheers<br>
Rohan Garg<br>
<br>
[1] <a href=3D"https://patchwork.freedesktop.org/patch/335508/?series=3D667=
52&amp;rev=3D4" rel=3D"noreferrer" target=3D"_blank">https://patchwork.free=
desktop.org/patch/335508/?series=3D66752&amp;rev=3D4</a><br>
<br>
On lunes, 6 de enero de 2020 21:47:21 (CET) Yiwei Zhang wrote:<br>
&gt; Thanks, I&#39;ll check it out.<br>
&gt; <br>
&gt; Best,<br>
&gt; Yiwei<br>
&gt; <br>
&gt; On Mon, Jan 6, 2020 at 2:46 AM Rohan Garg &lt;<a href=3D"mailto:rohan.=
garg@collabora.com" target=3D"_blank">rohan.garg@collabora.com</a>&gt; wrot=
e:<br>
&gt; &gt; Hi Yiwei<br>
&gt; &gt; <br>
&gt; &gt; On jueves, 19 de diciembre de 2019 19:52:26 (CET) Yiwei Zhang wro=
te:<br>
&gt; &gt; &gt; Hi Rohan,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks for pointing out the pids issue! Then the index would=
 be<br>
&gt; &gt; <br>
&gt; &gt; {namespace<br>
&gt; &gt; <br>
&gt; &gt; &gt; + pid(in that namespace)}. I&#39;ll grab a setup and play wi=
th the driver to<br>
&gt; &gt; &gt; see what I can do. I know how to find an Intel or Freedreno =
setup, but<br>
&gt; &gt; <br>
&gt; &gt; I&#39;d<br>
&gt; &gt; <br>
&gt; &gt; &gt; still like to know is there a development friendly Mali setu=
p?<br>
&gt; &gt; <br>
&gt; &gt; You should be able to setup a Mali T860 compatible device with th=
is guide<br>
&gt; &gt; [1].<br>
&gt; &gt; <br>
&gt; &gt; Cheers<br>
&gt; &gt; Rohan Garg<br>
&gt; &gt; <br>
&gt; &gt; [1] <a href=3D"https://panfrost.freedesktop.org/building-panfrost=
-mesa.html" rel=3D"noreferrer" target=3D"_blank">https://panfrost.freedeskt=
op.org/building-panfrost-mesa.html</a><br>
<br>
</blockquote></div>

--000000000000ed872905a15010d6--

--===============0461172036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0461172036==--
