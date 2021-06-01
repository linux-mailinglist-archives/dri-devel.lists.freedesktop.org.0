Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06AC3973B8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 15:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DFA6EA5E;
	Tue,  1 Jun 2021 13:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD986EA5E;
 Tue,  1 Jun 2021 13:01:26 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id 11so3325064plk.12;
 Tue, 01 Jun 2021 06:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEdF81igRGCuLRLhACg38eVCDeweT0WOlvNRgIH+krM=;
 b=qfUAZi9VrDyX+Ln4lZBpLNU+gQdg8vJDG8XmSBSOrTRSJzfWnWI7/O9apz11O16MOZ
 5eeon0ETT0A2xDfRAJQLj2GJCcI/f6oYJSJUGxHPcBpCqX3zjQog83egYX7KatfTQbd0
 ONWIGzgHs/7L/Jk/ic1pKNqaLkvHUIbMS1zTsYnhb9iPKacnNFMbTUVipzsfIDYuYbgx
 lSArJSQrRuttJBas1nCPUJDCBbMQvmRBzc/IgYca1a3GOYmEaDjz0QS7TjGQMgOdXgBA
 n/hiwOHeefUzfnV6x6sQjPP/Le0zeIXYWSk6pswj82LXabYCzq3lDfklLZ2Kh5+S29tt
 Uu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEdF81igRGCuLRLhACg38eVCDeweT0WOlvNRgIH+krM=;
 b=TpV7FmFwBdFatnV5OvY7rD5/Ywozlp9R5T+vTtTuaiD5doGX/S5V7sA5+tXDBbwueY
 RLhwe+CQAtxCcahc4QuLTvsLdO9ssFgpLMmml8UNHskFf+KlpImtPMIRjKLDq3C/to4P
 hoDfAu1eoTgZ1iLoB7ZajmEfJM+jf6eEygz5Caw6tI5J1SzJuTb7mQTd8gak5q5Z1zS/
 LL3sqYregfO63DcmTSWePIkHAb0rUbJfxMfTO+t01sU1RMw6urgblif+0jUBelRT/mza
 T63WbuV/t5EULZLuMGTz6StcbeZTo1YG1dHwmusEIT/y0olCK8hMlmyw1lZAOSviiT9a
 s3gg==
X-Gm-Message-State: AOAM530DGe23tOGRoKWrcOf9oV1+IFD1+0t2UviuvAodcPXVAKVC2LaU
 2kYpfXiHONmFyf1WZN5vcLKx/iwBjVDs/Sedla8=
X-Google-Smtp-Source: ABdhPJwXzL0oxpDRdLR2y4uaeSIWjOP5B3JMkn3hL6GPphsoW43dt468ly73rVxjDKSjmHaXqgVO35kb4tQp35Ki3K0=
X-Received: by 2002:a17:902:f682:b029:106:2ff0:db1d with SMTP id
 l2-20020a170902f682b02901062ff0db1dmr7275354plg.74.1622552486289; Tue, 01 Jun
 2021 06:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
In-Reply-To: <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 1 Jun 2021 09:01:14 -0400
Message-ID: <CAAxE2A6OHPSqmARKS_M1dxKJ-vuTcqn7dJQgW8T1qE6AahnzXw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009323d005c3b3f0f8"
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009323d005c3b3f0f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue., Jun. 1, 2021, 08:51 Christian K=C3=B6nig, <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 01.06.21 um 14:30 schrieb Daniel Vetter:
> > On Tue, Jun 1, 2021 at 2:10 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 01.06.21 um 12:49 schrieb Michel D=C3=A4nzer:
> >>> On 2021-06-01 12:21 p.m., Christian K=C3=B6nig wrote:
> >>>> Am 01.06.21 um 11:02 schrieb Michel D=C3=A4nzer:
> >>>>> On 2021-05-27 11:51 p.m., Marek Ol=C5=A1=C3=A1k wrote:
> >>>>>> 3) Compositors (and other privileged processes, and display
> flipping) can't trust imported/exported fences. They need a timeout
> recovery mechanism from the beginning, and the following are some possibl=
e
> solutions to timeouts:
> >>>>>>
> >>>>>> a) use a CPU wait with a small absolute timeout, and display the
> previous content on timeout
> >>>>>> b) use a GPU wait with a small absolute timeout, and conditional
> rendering will choose between the latest content (if signalled) and
> previous content (if timed out)
> >>>>>>
> >>>>>> The result would be that the desktop can run close to 60 fps even
> if an app runs at 1 fps.
> >>>>> FWIW, this is working with
> >>>>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even
> with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to
> provide the same dma-buf poll semantics as other drivers and high priorit=
y
> GFX contexts via EGL_IMG_context_priority which can preempt lower priorit=
y
> ones).
> >>>> Yeah, that is really nice to have.
> >>>>
> >>>> One question is if you wait on the CPU or the GPU for the new surfac=
e
> to become available?
> >>> It's based on polling dma-buf fds, i.e. CPU.
> >>>
> >>>> The former is a bit bad for latency and power management.
> >>> There isn't a choice for Wayland compositors in general, since there
> can be arbitrary other state which needs to be applied atomically togethe=
r
> with the new buffer. (Though in theory, a compositor might get fancy and
> special-case surface commits which can be handled by waiting on the GPU)
> >>>
> >>> Latency is largely a matter of scheduling in the compositor. The
> latency incurred by the compositor shouldn't have to be more than
> single-digit milliseconds. (I've seen total latency from when the client
> starts processing a (static) frame to when it starts being scanned out as
> low as ~6 ms with
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than
> typical with Xorg)
> >> Well let me describe it like this:
> >>
> >> We have an use cases for 144 Hz guaranteed refresh rate. That
> >> essentially means that the client application needs to be able to spit
> >> out one frame/window content every ~6.9ms. That's tough, but doable.
> >>
> >> When you now add 6ms latency in the compositor that means the client
> >> application has only .9ms left for it's frame which is basically
> >> impossible to do.
> >>
> >> See for the user fences handling the display engine will learn to read
> >> sequence numbers from memory and decide on it's own if the old frame o=
r
> >> the new one is scanned out. To get the latency there as low as possibl=
e.
> > This won't work with implicit sync at all.
> >
> > If you want to enable this use-case with driver magic and without the
> > compositor being aware of what's going on, the solution is EGLStreams.
> > Not sure we want to go there, but it's definitely a lot more feasible
> > than trying to stuff eglstreams semantics into dma-buf implicit
> > fencing support in a desperate attempt to not change compositors.
>
> Well not changing compositors is certainly not something I would try
> with this use case.
>
> Not changing compositors is more like ok we have Ubuntu 20.04 and need
> to support that we the newest hardware generation.
>
> > I still think the most reasonable approach here is that we wrap a
> > dma_fence compat layer/mode over new hw for existing
> > userspace/compositors. And then enable userspace memory fences and the
> > fancy new features those allow with a new model that's built for them.
>
> Yeah, that's basically the same direction I'm heading. Question is how
> to fix all those details.
>
> > Also even with dma_fence we could implement your model of staying with
> > the previous buffer (or an older buffer at that's already rendered),
> > but it needs explicit involvement of the compositor. At least without
> > adding eglstreams fd to the kernel and wiring up all the relevant
> > extensions.
>
> Question is do we already have some extension which allows different
> textures to be selected on the fly depending on some state?
>

There is no such extension for sync objects, but it can be done with
queries, like occlusion queries. There is also no timeout option and it can
only do "if" and "if not", but not "if .. else"

Marek



> E.g. something like use new frame if it's available and old frame
> otherwise.
>
> If you then apply this to the standard dma_fence based hardware or the
> new user fence based one is then pretty much irrelevant.
>
> Regards,
> Christian.
>
> > -Daniel
> >
> >>>> Another question is if that is sufficient as security for the displa=
y
> server or if we need further handling down the road? I mean essentially w=
e
> are moving the reliability problem into the display server.
> >>> Good question. This should generally protect the display server from
> freezing due to client fences never signalling, but there might still be
> corner cases.
> >>>
> >>>
> >
>
>

--0000000000009323d005c3b3f0f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue., Jun. 1, 2021, 08:51 Christian K=C3=B6nig, &lt=
;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Am 01.06=
.21 um 14:30 schrieb Daniel Vetter:<br>
&gt; On Tue, Jun 1, 2021 at 2:10 PM Christian K=C3=B6nig<br>
&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Am 01.06.21 um 12:49 schrieb Michel D=C3=A4nzer:<br>
&gt;&gt;&gt; On 2021-06-01 12:21 p.m., Christian K=C3=B6nig wrote:<br>
&gt;&gt;&gt;&gt; Am 01.06.21 um 11:02 schrieb Michel D=C3=A4nzer:<br>
&gt;&gt;&gt;&gt;&gt; On 2021-05-27 11:51 p.m., Marek Ol=C5=A1=C3=A1k wrote:=
<br>
&gt;&gt;&gt;&gt;&gt;&gt; 3) Compositors (and other privileged processes, an=
d display flipping) can&#39;t trust imported/exported fences. They need a t=
imeout recovery mechanism from the beginning, and the following are some po=
ssible solutions to timeouts:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; a) use a CPU wait with a small absolute timeout, a=
nd display the previous content on timeout<br>
&gt;&gt;&gt;&gt;&gt;&gt; b) use a GPU wait with a small absolute timeout, a=
nd conditional rendering will choose between the latest content (if signall=
ed) and previous content (if timed out)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; The result would be that the desktop can run close=
 to 60 fps even if an app runs at 1 fps.<br>
&gt;&gt;&gt;&gt;&gt; FWIW, this is working with<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://gitlab.gnome.org/GNOME/mutter/-/mer=
ge_requests/1880" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
itlab.gnome.org/GNOME/mutter/-/merge_requests/1880</a> , even with implicit=
 sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the sam=
e dma-buf poll semantics as other drivers and high priority GFX contexts vi=
a EGL_IMG_context_priority which can preempt lower priority ones).<br>
&gt;&gt;&gt;&gt; Yeah, that is really nice to have.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; One question is if you wait on the CPU or the GPU for the =
new surface to become available?<br>
&gt;&gt;&gt; It&#39;s based on polling dma-buf fds, i.e. CPU.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The former is a bit bad for latency and power management.<=
br>
&gt;&gt;&gt; There isn&#39;t a choice for Wayland compositors in general, s=
ince there can be arbitrary other state which needs to be applied atomicall=
y together with the new buffer. (Though in theory, a compositor might get f=
ancy and special-case surface commits which can be handled by waiting on th=
e GPU)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Latency is largely a matter of scheduling in the compositor. T=
he latency incurred by the compositor shouldn&#39;t have to be more than si=
ngle-digit milliseconds. (I&#39;ve seen total latency from when the client =
starts processing a (static) frame to when it starts being scanned out as l=
ow as ~6 ms with <a href=3D"https://gitlab.gnome.org/GNOME/mutter/-/merge_r=
equests/1620" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitla=
b.gnome.org/GNOME/mutter/-/merge_requests/1620</a>, lower than typical with=
 Xorg)<br>
&gt;&gt; Well let me describe it like this:<br>
&gt;&gt;<br>
&gt;&gt; We have an use cases for 144 Hz guaranteed refresh rate. That<br>
&gt;&gt; essentially means that the client application needs to be able to =
spit<br>
&gt;&gt; out one frame/window content every ~6.9ms. That&#39;s tough, but d=
oable.<br>
&gt;&gt;<br>
&gt;&gt; When you now add 6ms latency in the compositor that means the clie=
nt<br>
&gt;&gt; application has only .9ms left for it&#39;s frame which is basical=
ly<br>
&gt;&gt; impossible to do.<br>
&gt;&gt;<br>
&gt;&gt; See for the user fences handling the display engine will learn to =
read<br>
&gt;&gt; sequence numbers from memory and decide on it&#39;s own if the old=
 frame or<br>
&gt;&gt; the new one is scanned out. To get the latency there as low as pos=
sible.<br>
&gt; This won&#39;t work with implicit sync at all.<br>
&gt;<br>
&gt; If you want to enable this use-case with driver magic and without the<=
br>
&gt; compositor being aware of what&#39;s going on, the solution is EGLStre=
ams.<br>
&gt; Not sure we want to go there, but it&#39;s definitely a lot more feasi=
ble<br>
&gt; than trying to stuff eglstreams semantics into dma-buf implicit<br>
&gt; fencing support in a desperate attempt to not change compositors.<br>
<br>
Well not changing compositors is certainly not something I would try <br>
with this use case.<br>
<br>
Not changing compositors is more like ok we have Ubuntu 20.04 and need <br>
to support that we the newest hardware generation.<br>
<br>
&gt; I still think the most reasonable approach here is that we wrap a<br>
&gt; dma_fence compat layer/mode over new hw for existing<br>
&gt; userspace/compositors. And then enable userspace memory fences and the=
<br>
&gt; fancy new features those allow with a new model that&#39;s built for t=
hem.<br>
<br>
Yeah, that&#39;s basically the same direction I&#39;m heading. Question is =
how <br>
to fix all those details.<br>
<br>
&gt; Also even with dma_fence we could implement your model of staying with=
<br>
&gt; the previous buffer (or an older buffer at that&#39;s already rendered=
),<br>
&gt; but it needs explicit involvement of the compositor. At least without<=
br>
&gt; adding eglstreams fd to the kernel and wiring up all the relevant<br>
&gt; extensions.<br>
<br>
Question is do we already have some extension which allows different <br>
textures to be selected on the fly depending on some state?<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">There is no such=
 extension for sync objects, but it can be done with queries, like occlusio=
n queries. There is also no timeout option and it can only do &quot;if&quot=
; and &quot;if not&quot;, but not &quot;if .. else&quot;</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Marek</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
E.g. something like use new frame if it&#39;s available and old frame other=
wise.<br>
<br>
If you then apply this to the standard dma_fence based hardware or the <br>
new user fence based one is then pretty much irrelevant.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; -Daniel<br>
&gt;<br>
&gt;&gt;&gt;&gt; Another question is if that is sufficient as security for =
the display server or if we need further handling down the road? I mean ess=
entially we are moving the reliability problem into the display server.<br>
&gt;&gt;&gt; Good question. This should generally protect the display serve=
r from freezing due to client fences never signalling, but there might stil=
l be corner cases.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--0000000000009323d005c3b3f0f8--
