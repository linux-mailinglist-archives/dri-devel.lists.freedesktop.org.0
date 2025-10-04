Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B9BB91BD
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 22:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC489854;
	Sat,  4 Oct 2025 20:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="dXYoDnl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041EF89854
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 20:22:50 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-27c369f898fso40050405ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1759609370; x=1760214170;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7iOjCRTv/UOLRas4QoQfI+GQphzTaP2e17HJMdbYUcY=;
 b=dXYoDnl31vZWPB/MI6h/HYhRHsDuihHYAYD6xGnc2bxnGdPGW9dFMzOeu/pCPqVMtk
 QyjzIO5+g67JkPq0unkuANTjz297mq1V9IZZz571EdHBfSvyX6yebHGKL7MfJbwV0rwd
 7SgkX5pDgDXeC6lFjRGJI/RzchLN5bKsccqBQk8An3dE/iMcp6ocYgYzrJNqJR5m7Iq2
 gTXvaWficQTCl/X/Da80Z6f2pVbFuFlTl48s6y0Zro8aRHWe5CajFR+fA4dYKCaIXVq3
 DQ31NraU5Cfk4dXjza45VtwiRzfECCYEyGtNGEBCKDQE31H/g2dXu8wvB6NXr7SMobrx
 8wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759609370; x=1760214170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iOjCRTv/UOLRas4QoQfI+GQphzTaP2e17HJMdbYUcY=;
 b=lZ/rXF2HJERAGXPpDPuEEFnQUAg5dAPqNeirz8IFl3Q2v/y/+oZVLIWfJGD5Bkhg5J
 NYmTSjrlBfy4iC93KwQD9neSDYXdpUfMCEzZrF6JGWhqCY6d+i75yhsRARJOaduNsUhv
 G/H8tK/kaanLINU/UJ+6MDwDn8jBGH13rRb56Sbgo0uyBmuPG06DF/JIsjZhjDdrDKjr
 xNTZlewMt4dg8TrgZsZTVP4+jJPXLSL+r5yngXHKybdxUuwGKjuq+H3Wun04op0mY+JG
 H/uA2atc/eITtUIi62th+ZE984Lvg7Bd66el6StiWMPHDFvXvdw1dD4onmCtETHQG6dj
 uTEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0So+ijKG+vzLsLPn1C7QJsLjJ99jhvUNkjrSIaASVD7V5Jo5uZ0JquAoiOjJR14p40cb5ka/tp8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEDfgwoWkyS8HRJ5bRZ34szkzFNeq/blEir/YY0246nS3ziRI+
 NgG2W9dYT2LGcS2COnDiAQNnTyrqYbnT3J7h5x/Yb0eyk/mQZOw9YBq931GcaEDuFeVJmPdOMDP
 un7sWRc60WfHhdJSxBb8GDy83f1BZWvU=
X-Gm-Gg: ASbGncsZcmIkXSpXppomwUrmHsZhHtXGV7ibTUW78KEc5JKOiiDliPTfJPIb+HWaHW2
 lAR6QI7JZBgI/pjDkRJQKCObu8MouA0qqbvvBmG4FKoyuC/qpfnx3BSensbrQbdcjn80z3PtU57
 kdHUem9gZl5ekFm2FncRGn5+Sd5W+3j7bYLi+OBWO8VUcAlECXGfvNdda4mDoG14kR0Sc8Xlya6
 KVRwS7gDtXtRoKp0XwwgtFt4gY9N63lHXovhgp09Ggmb7ZshuCUFQ4+5qPQo2D7vuLtuSSzAyE=
X-Google-Smtp-Source: AGHT+IEvFiFYb/yXN2Hbuqa0QsBGFUfYWmFw0Mzqwu753oWhqXU6HdGuLh/esJRyH1nG43WsG1wWRCjs/qzkq/JOeVw=
X-Received: by 2002:a17:903:8cc:b0:269:b6c8:4a4b with SMTP id
 d9443c01a7336-28e9a56172amr94357475ad.6.1759609370443; Sat, 04 Oct 2025
 13:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
 <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
In-Reply-To: <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 22:22:38 +0200
X-Gm-Features: AS18NWDKVbe_cLdtewuohc2z1hdjWwhtLw5dUx7qZDgCz70wIOVm6d51SxXp1TM
Message-ID: <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
To: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dongjin Kim <tobetter@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000007818c506405afb9c"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007818c506405afb9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, Sep 29, 2025 at 1:58=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> > On 29 Sep 2025, at 1:24=E2=80=AFam, Martin Blumenstingl <martin.blumens=
tingl@googlemail.com> wrote:
> >
> > Hi Christian,
> >
> > On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
> > <christianshewitt@gmail.com> wrote:
> > [...]
> >> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv=
,
> >>                        m =3D 0xf7;
> >>                        frac =3D vic_alternate_clock ? 0x8148 : 0x10000=
;
> >>                        break;
> >> +               case 4830000:
> >> +                       m =3D 0xc9;
> >> +                       frac =3D 0xd560;
> >> +                       break;
> > Initially I thought this was wrong because it's only added for the
> > G12A (which is also used on G12B and SM1) code-path, leaving out the
> > GX SoCs.
> >
> > Was the 2560x1440 mode tested on a computer monitor or a TV?
> > I suspect it's the former, so I think it expected the code to take the
> > MESON_VCLK_TARGET_DMT path, which automatically calculates m and frac.
> >
> > I'll give it a try on Friday as I do have a computer monitor with that
> > resolution - so any hints for testing are welcome!
>
> The original patch is from Hardkernel sources - I=E2=80=99ve picked it se=
veral
> years ago and then updated values semi-recently after 1000ULL changes.
> The user who originally requested that I cherry-pick it (and tested it)
> was using an Odroid N2+ board (G12B) with a Dell monitor IIRC. It=E2=80=
=99s not
> tested by myself as I only have TV=E2=80=99s not monitors, so it will be =
good
> to have your confirmation (either way). If it=E2=80=99s wrong I=E2=80=99l=
l be happy to
> drop it - I=E2=80=99m just trying to upstream and offload some longer-run=
ning
> and allegedly good patches in the LibreELEC kernel patchset.
So I've tried it on a Le Potato (S905X SoC) board. This patch doesn't
do anything here (as expected, since it only targets the G12A and
later code-path).

Doing some more analysis, it seems that
meson_venc_hdmi_supported_mode() simply prevents using any mode with
more than 1920 pixels.
I attached a simple patch to overcome this (discarding any
meson_vclk.c changes):
$ cat /sys/class/drm/card1-HDMI-A-1/modes
2560x1440
2048x1152
1920x1200
1920x1080
...

My monitor's OSD tells me that I'm running at 2560x1440@60Hz.

@Neil, should we bump the limits in meson_venc.c to "4Kx2K@60" (that's
a quote from both, S905/GXBB and S905D3/SM1 datasheets), most likely
meaning: 4096x2160?


Best regards,
Martin

--0000000000007818c506405afb9c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="meson_venc-hdmi-support-1440p-screen.diff"
Content-Disposition: attachment; 
	filename="meson_venc-hdmi-support-1440p-screen.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mgcps9pr0>
X-Attachment-Id: f_mgcps9pr0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCmluZGV4IDNiZjBkNmU0ZmMzMC4uOGExMTEwMzc3
YTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKQEAgLTg2OCwxMCArODY4LDEwIEBA
IG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZSkKIAkJCSAgICBEUk1fTU9ERV9GTEFHX1BWU1lOQyB8IERSTV9NT0RFX0ZMQUdf
TlZTWU5DKSkKIAkJcmV0dXJuIE1PREVfQkFEOwogCi0JaWYgKG1vZGUtPmhkaXNwbGF5IDwgNDAw
IHx8IG1vZGUtPmhkaXNwbGF5ID4gMTkyMCkKKwlpZiAobW9kZS0+aGRpc3BsYXkgPCA0MDAgfHwg
bW9kZS0+aGRpc3BsYXkgPiAyNTYwKQogCQlyZXR1cm4gTU9ERV9CQURfSFZBTFVFOwogCi0JaWYg
KG1vZGUtPnZkaXNwbGF5IDwgNDgwIHx8IG1vZGUtPnZkaXNwbGF5ID4gMTkyMCkKKwlpZiAobW9k
ZS0+dmRpc3BsYXkgPCA0ODAgfHwgbW9kZS0+dmRpc3BsYXkgPiAyNTYwKQogCQlyZXR1cm4gTU9E
RV9CQURfVlZBTFVFOwogCiAJcmV0dXJuIE1PREVfT0s7Cg==
--0000000000007818c506405afb9c--
