Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE874073D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 02:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EC810E023;
	Wed, 28 Jun 2023 00:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BA510E012;
 Wed, 28 Jun 2023 00:36:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fa94ea1caaso3802975e9.1; 
 Tue, 27 Jun 2023 17:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687912607; x=1690504607;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KSyQMNRIDW2sVBvZjUbWbTDiN/K/JBNAd9QdnzqxUV4=;
 b=lPQlGbTxW1W4Kl1mMmnpdJ/Wcyq8HNla6WCUjGDffyyWSHMjAbTvbBwKvC6VM1cfZ+
 y7ADmQ2cpumCZprCNDKKInYnNuB3VMQgREnMZYP6JKr8vKJGylGjmNXPPeDyyiRuRd7F
 FDKCfFZkIHXLOWb4ikoqMIvzUHT4/OfJ+lN12AIuEaMfUqSKue0nwBzlUBKai8HwAixp
 l3ntpfXYaUqX7zdBeSgOttN0F4Q7YI8xgnbaaExvmszSi97LEGgx4xQX7VhphXnLY6ov
 0I/uvaGapp9KKQQ8+BeeJnB60eBrv3YpVzuOu5QUBtPOneWilj8ulEzi9KhCTFI+tDCp
 Ot8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687912607; x=1690504607;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSyQMNRIDW2sVBvZjUbWbTDiN/K/JBNAd9QdnzqxUV4=;
 b=FxNLuli4aOuAcRIeAMcn2JYyeLHKvhsGhoXTwdluI0ixrTY0fGDnPhDhSuKxgpukTB
 uS3Cx2gZHC6r+cIaatB4VmsYlQRYxO854sMkhK+8TtYjkiXZJ97/1W/gCpPm0txVVG1M
 xCQZ/ZCgmxRlvxDEK3yotIYu6MlEu8i6gRh+pKTHVLaSfoGXNUqoNCV14rYo21zhap0s
 ZMh5esAJ/Hn2xauTgbs9ejJKVXJciWry8CuPV6SDXXho+xRbQV9Ojdc0Baag7/51yd06
 kRoCyBFexlVsUD1dJHC3C8KQgrrnCdYKWMQllmluVxLzOh3Oh7FcEaiePERzo3+DrxK0
 NvXA==
X-Gm-Message-State: AC+VfDzA5zmY3W43bNMaT6OjNuEVeRwdQYLeFp8k9yVnLYGmnNvLkJjj
 +PnLrurApnuAhXHrrv7/qwvy1xZD2EBXunW72pA=
X-Google-Smtp-Source: ACHHUZ6dB17cwxLqd1EMqnqww6hHHfLZThWe3HVfFiEnK/r6k/FuJ7DD9WvVkN7hZywn4svUznhFsw7DJpesb3dM/Uo=
X-Received: by 2002:a05:600c:3b1f:b0:3fa:125c:8d65 with SMTP id
 m31-20020a05600c3b1f00b003fa125c8d65mr16967718wms.3.1687912607203; Tue, 27
 Jun 2023 17:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CAAxE2A4Hquz9bJNSEaUtBoJC3qbLBPYXd8i3JX9AhNUx_iUKpg@mail.gmail.com>
 <4302638a-c33b-7355-5201-d3020f5b1525@igalia.com>
In-Reply-To: <4302638a-c33b-7355-5201-d3020f5b1525@igalia.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Jun 2023 20:36:11 -0400
Message-ID: <CAAxE2A4i50c34OFHMbrrk1g55zs0dodsPJvDcMGksLhApTy2NA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Content-Type: multipart/alternative; boundary="0000000000005d875605ff25c709"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005d875605ff25c709
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 5:31=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com>
wrote:

> Hi Marek,
>
> Em 27/06/2023 15:57, Marek Ol=C5=A1=C3=A1k escreveu:
> > On Tue, Jun 27, 2023, 09:23 Andr=C3=A9 Almeida <andrealmeid@igalia.com
> > <mailto:andrealmeid@igalia.com>> wrote:
> >
> >     +User Mode Driver
> >     +----------------
> >     +
> >     +The UMD should check before submitting new commands to the KMD if
> >     the device has
> >     +been reset, and this can be checked more often if the UMD requires
> >     it. After
> >     +detecting a reset, UMD will then proceed to report it to the
> >     application using
> >     +the appropriate API error code, as explained in the section below
> about
> >     +robustness.
> >
> >
> > The UMD won't check the device status before every command submission
> > due to ioctl overhead. Instead, the KMD should skip command submission
> > and return an error that it was skipped.
>
> I wrote like this because when reading the source code for
> vk::check_status()[0] and Gallium's si_flush_gfx_cs()[1], I was under
> the impression that UMD checks the reset status before every
> submission/flush.
>

It only does that before every command submission when the context is
robust. When it's not robust, radeonsi doesn't do anything.


>
> Is your comment about of how things are currently implemented, or how
> they would ideally work? Either way I can apply your suggestion, I just
> want to make it clear.
>

Yes. Ideally, we would get the reply whether the context is lost from the
CS ioctl. This is not currently implemented.

Marek


>
> [0]
>
> https://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/vulkan/runtime/vk_=
device.h#L142
> [1]
>
> https://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/gallium/drivers/ra=
deonsi/si_gfx_cs.c#L83
>
> >
> > The only case where that won't be applicable is user queues where
> > drivers don't call into the kernel to submit work, but they do call int=
o
> > the kernel to create a dma_fence. In that case, the call to create a
> > dma_fence can fail with an error.
> >
> > Marek
>
>

--0000000000005d875605ff25c709
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 27, 2023 at 5:31=E2=80=AFPM Andr=C3=A9 Almeida &lt;<a hr=
ef=3D"mailto:andrealmeid@igalia.com">andrealmeid@igalia.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Marek,<br>
<br>
Em 27/06/2023 15:57, Marek Ol=C5=A1=C3=A1k escreveu:<br>
&gt; On Tue, Jun 27, 2023, 09:23 Andr=C3=A9 Almeida &lt;<a href=3D"mailto:a=
ndrealmeid@igalia.com" target=3D"_blank">andrealmeid@igalia.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:andrealmeid@igalia.com" target=3D"_blank"=
>andrealmeid@igalia.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+User Mode Driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0+----------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+The UMD should check before submitting new command=
s to the KMD if<br>
&gt;=C2=A0 =C2=A0 =C2=A0the device has<br>
&gt;=C2=A0 =C2=A0 =C2=A0+been reset, and this can be checked more often if =
the UMD requires<br>
&gt;=C2=A0 =C2=A0 =C2=A0it. After<br>
&gt;=C2=A0 =C2=A0 =C2=A0+detecting a reset, UMD will then proceed to report=
 it to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0application using<br>
&gt;=C2=A0 =C2=A0 =C2=A0+the appropriate API error code, as explained in th=
e section below about<br>
&gt;=C2=A0 =C2=A0 =C2=A0+robustness.<br>
&gt; <br>
&gt; <br>
&gt; The UMD won&#39;t check the device status before every command submiss=
ion <br>
&gt; due to ioctl overhead. Instead, the KMD should skip command submission=
 <br>
&gt; and return an error that it was skipped.<br>
<br>
I wrote like this because when reading the source code for <br>
vk::check_status()[0] and Gallium&#39;s si_flush_gfx_cs()[1], I was under <=
br>
the impression that UMD checks the reset status before every <br>
submission/flush.<br></blockquote><div><br></div><div>It only does that bef=
ore every command submission when the context is robust. When it&#39;s not =
robust, radeonsi doesn&#39;t do anything.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Is your comment about of how things are currently implemented, or how <br>
they would ideally work? Either way I can apply your suggestion, I just <br=
>
want to make it clear.<br></blockquote><div><br></div><div>Yes. Ideally, we=
 would get the reply whether the context is lost from the CS ioctl. This is=
 not currently implemented.<br></div><div><br></div><div>Marek<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[0] <br>
<a href=3D"https://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/vulkan/ru=
ntime/vk_device.h#L142" rel=3D"noreferrer" target=3D"_blank">https://elixir=
.bootlin.com/mesa/mesa-23.1.3/source/src/vulkan/runtime/vk_device.h#L142</a=
><br>
[1] <br>
<a href=3D"https://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/gallium/d=
rivers/radeonsi/si_gfx_cs.c#L83" rel=3D"noreferrer" target=3D"_blank">https=
://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/gallium/drivers/radeonsi/=
si_gfx_cs.c#L83</a><br>
<br>
&gt; <br>
&gt; The only case where that won&#39;t be applicable is user queues where =
<br>
&gt; drivers don&#39;t call into the kernel to submit work, but they do cal=
l into <br>
&gt; the kernel to create a dma_fence. In that case, the call to create a <=
br>
&gt; dma_fence can fail with an error.<br>
&gt; <br>
&gt; Marek<br>
<br>
</blockquote></div></div>

--0000000000005d875605ff25c709--
