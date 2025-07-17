Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C665B0983B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCC010E863;
	Thu, 17 Jul 2025 23:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PwTs46Cl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7079110E8A9;
 Thu, 17 Jul 2025 21:37:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-60c4f796446so2182689a12.1; 
 Thu, 17 Jul 2025 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752788235; x=1753393035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrtASW4nJI5s0TcFU7BZl03KBcG7L4TmJyfK+6pQD+I=;
 b=PwTs46ClAkl/yeuTEKLBQHZj4b+1pd77mjOl4NnXzw1jnPmi2/xto3N1R33vrmsxSU
 rl+x7IPt3N35/AlgsbNtM23cApSrEZnWTaY/6EYB35Vrf6QEXnF8UwAZENGkbiy5hcuE
 3uoQBkro4cUlIY122mZDlHoAKacLC+M0WsEQYGEDSLEzxrrYlS+6Hp/4scfiRw5aJjgm
 Qf7f6kq6i0/XUa/kNEQEP9LRt0UY4VTIt4w9isQ0rIYKLH82Yv+6fnC+AN/EPj7TJN/8
 TYjeIkNY7ryuV1QIG9BBqmDpKQJELG5E9DPCfkoo9ywerZVJfXVeCcHae6RxUp9qM4XD
 HqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752788235; x=1753393035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrtASW4nJI5s0TcFU7BZl03KBcG7L4TmJyfK+6pQD+I=;
 b=QH5gM2o/aDA3y9j9+oGPhlhwa36co5tSLxVsR3qg7DSaJJHZxYJyohEVyzraRdXuGx
 kwMwUqr5lMdQBXu3EUyh1rTRv6syx9f5py8rZl1D87ngVs1s4sRbGk/ZK4rrilr8UJEk
 y3JzG5vi1lq2Edhpq/vpTZR3OoazLrqeDm0eHo8mXdcXqdbPs5pff7b9M5XTijgt8iiY
 kdQKKwJqLTGSzZx0ANakoIengcmiwIuu+wucWmnlFwnuRYF2IhbuMYrKWdgnfx03y0Bv
 zstYLeDto66j2T56CVQjOY9XAl97CghPJjWgVnEwSUfli9nii1bAhkXu8Wvdwn+fCueO
 WLMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZfdqTVQ/tS3eIwoHIbyhftllAy5kbqI0d0kLiJEJTC5PvoNg+ucSRjenGRw5K3KWmJq7xbkXXqLQ=@lists.freedesktop.org,
 AJvYcCXBqFkTs6mx7BX3VEIVzic2UpKePpw1B+zxpcvBuOgcNygQLShfbKevgu0RA7Cg6+nKzHshKw23qE8d@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYfvwwab9tnyB6WoN+BdA7klyWYgam+3IsshZxwUR03G+4ay1l
 oBUrN1tkg3nUCWQ/qTlhOrbqPxWPKJpqHYwQ8ECyqws42Cij2qV9d2M1r6l04tXOYfKaaUoADeI
 X8h2Bc1O4B93aY6ox/ylD8J8naovJSg==
X-Gm-Gg: ASbGncuG2eFTdDSDEFQcDjL5pTzUoXTXMxj+xo8cVXw/5ukwIrEIAB12zuU9Uz1PP+f
 pkFnxPAS5puP8NDb64T19YC209HO07eX7Btiy68iCvNC/O3m95ksN8s1zbnJyxlA7I/KlZUlTfo
 C0iXn8H/CoEILqkHB02XN59vk/uIkLV/6Fv3ToP34O/0hF3P1Qp/Dc6CvhDMTLDzgCHEE37hcdZ
 rap/wOpZMW9l2lP4E4y4df+Wi90X7pAfMe6g+Y=
X-Google-Smtp-Source: AGHT+IFVlRN4WGIlFsUPwjfESSFGLiHpyki75MoVraFsVt7ReruuctGVWu4zLsO1ep8kuBhcM77A+tPIk089SPdJwm0=
X-Received: by 2002:a05:6402:2685:b0:611:d497:e8a8 with SMTP id
 4fb4d7f45d1cf-612823da4c1mr8091202a12.27.1752788234592; Thu, 17 Jul 2025
 14:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
In-Reply-To: <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 17 Jul 2025 23:36:38 +0200
X-Gm-Features: Ac12FXyoN-ygLAdINlTQHq9O6GwthS9JPnfwymokk-OCpRjxgsVHQiOVjtDhOY4
Message-ID: <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Xilin Wu <sophon@radxa.com>, Dale Whinham <daleyo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Jul 2025 23:39:59 +0000
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

Le jeu. 17 juil. 2025 =C3=A0 23:10, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>
> On 7/17/25 10:27 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
> >>
> >> On 2025/7/15 01:35:42, Dale Whinham wrote:
> >>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>>
> >>> The OLED display in the Surface Pro 11 reports a maximum link rate of
> >>> zero in its DPCD, causing it to fail to probe correctly.
> >>>
> >>> The Surface Pro 11's DSDT table contains some XML with an
> >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> >>> (8.1Gbps/HBR3).
> >>>
> >>> Add a quirk to conditionally override the max link rate if its value
> >>> is zero specifically for this model.
> >>>
> >>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.=
com>
> >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> >>>   1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/=
dp/dp_panel.c
> >>> index 4e8ab75c771b..b2e65b987c05 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>> @@ -11,6 +11,8 @@
> >>>   #include <drm/drm_of.h>
> >>>   #include <drm/drm_print.h>
> >>>
> >>> +#include <linux/dmi.h>
> >>> +
> >>>   #define DP_MAX_NUM_DP_LANES 4
> >>>   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
> >>>
> >>> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_pa=
nel *msm_dp_panel)
> >>>       if (rc)
> >>>               return rc;
> >>>
> >>> +     /*
> >>> +      * for some reason the ATNA30DW01-1 OLED panel in the Surface P=
ro 11
> >>> +      * reports a max link rate of 0 in the DPCD. Fix it to match th=
e
> >>> +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
> >>> +      */
> >>> +     if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> >>> +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> >>> +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Ed=
ition")) {
> >>> +             dpcd[1] =3D DP_LINK_BW_8_1;
> >>> +     }
> >>> +
> >>
> >> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max li=
nk
> >> rate of 0. But I think eDP v1.4 panels need a different way to retriev=
e
> >> supported links rates, which could be found in the amdgpu [1], i915 [2=
]
> >> and nouveau [3] drivers.
> >
> > Thanks Xilin for the sharing and pointers into 3 other drivers, that
> > would explain the current limitation for Adreno GPUs. Fixing it would
> > require a big contribution independent of the actual SP11 enablement.
>
> FWIW Adreno is a wholly separate (from DPU - the display engine) block

Thanks Konrad, indeed I should have referred to the display engine.

> >
> > Is it a feature planned in the short-medium term within the MSM driver?
> > If not, would a quirk like [4] be acceptable upstream in the meanwhile?
>
> I'm not a display guy, but this looks like yet another block of code
> begging to be commonized across DP drivers,

I agree 100% in principle, but the 3 implementations are different today.

> so I wouldn't expect it to be a big blocker.

Well, it is for me :)

> Adding a panel quirk doesn't seem in order, as the panel is /probably/
> very much in spec, and it's the driver bit that's missing.

I agree that a quirk shouldn't be needed. I guess we'll work on
upstreaming everything else and keep an out-of-tree patch for this
issue for the moment That's a bit sad as this will block regular
users from easily installing / testing via the Ubuntu Concept ISO
for instance.

Or could the quirk be accepted temporarily with good comments
then reverted when the driver adds the missing support? I guess
it would depend on the time scale of this support landing.

Cheers,
J=C3=A9r=C3=B4me

> Konrad
>
> >
> > [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d26=
5cfb
> >
> > Thanks a lot,
> > J=C3=A9r=C3=B4me
> >
> >
> >
> >> [1]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
> >> [2]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/gpu/drm/i915/display/intel_dp.c#n4281
> >> [3]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/gpu/drm/nouveau/nouveau_dp.c#n101
> >>
> >>
> >>>       msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pa=
nel->aux, dpcd);
> >>>       link_info =3D &msm_dp_panel->link_info;
> >>>       link_info->revision =3D dpcd[DP_DPCD_REV];
> >>
> >>
> >> --
> >> Best regards,
> >> Xilin Wu <sophon@radxa.com>
> >
