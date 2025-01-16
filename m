Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB3A1379E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F3E10E172;
	Thu, 16 Jan 2025 10:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DC910E172;
 Thu, 16 Jan 2025 10:18:05 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-5162571e761so152078e0c.2; 
 Thu, 16 Jan 2025 02:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022683; x=1737627483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEBC4YtYCJgyImQmIlExzdfeh9O+mJTPH+y0EtpZi1E=;
 b=etYm8cxJEEsGbZ8gcfOnYTiHP3JH9PUb4SOMjfN1GIZJXWIdqBGkxNVGYnV0/E80tw
 lgJvfk8NF7oIilodvhoMkMaWtGysSBDsefkPJ7a1s41qNwBs9YxnZu/4+MT5zAstYzC3
 fib8BefTzOri5Un9wq83LP4Mwq6JeMfUQj+Q/ddx3fYhFP2IeuBKqizNhhwNcK2SR1Yk
 xdtMXUgr/SGJlSbqQnzNxQ/jCo0W8vWgWH6v5FfJfgOcQur9t8Csvh88dZTb8U5AuMQM
 wJeUuTPXzWP3J9Rz2NDIKjhWyvUOMH3KZGhNPeibU4YOKArvI2cQ36axCshApvss8aHF
 yKtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmKeoiOPptT9/3s0u2+2vnSbSbcJzA7CsOzpho+Gx6oxHZ0W7tTBfymXPDNC/h+XRbDqnucAGaqrUcllE=@lists.freedesktop.org,
 AJvYcCVQXsmjlO06UI0ZwgLjQK0cjaO601Yg1v5WYT3zuCeEjljnMbcyUff7KygciAfARQkJcj/w7Vp1mfOO@lists.freedesktop.org,
 AJvYcCVXZl4+S3CFzmuKw6XG3hqMpn0/6XmRG3QgBWORaVa32/MmljzVgZTH1zszlw4kzvCSJWzQ0GBTuww=@lists.freedesktop.org,
 AJvYcCX1DqAWmnvEnyU7O8KYC5X/trrgw4DR+FFcCOwC5f6F9Npmr5bUsr5z1L9NXsPQAuuQ8HDcCZuFNQ==@lists.freedesktop.org,
 AJvYcCXeK1V1SC/AAm9ZWRsJ5lqNlXNhq+OtvKmeqWw2LJBZY/tCMV8bHtH518dht6dO7YNQM1EvrPPlHHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWR6sqxPS+JcalIHuU7HzT+QUoCC3rmGUVPOJptwCZiFcsvH1P
 z10jdaqkeks138Wm2fcymW638ukaFRGqShZQDVb6PFH2rViYaz1Pyafx83yBlqY=
X-Gm-Gg: ASbGnctryj/aaC9q9rhx54z4PHbodUb068XXgXfG1L4Tf9j1ck7usdayxUcFvEr1DhD
 WiZeebcqW5FDUf8M+XinCwHsd9XuXDvOMpackyAAsbpR6VgAsFDnJs66GNWWM2F7B4SVR+jCDJD
 kKbMRWw5AsJIo1R2QNeV5dEgdTf1ABBFUG2wGngUbr1HbBCe2eNoXR2fwdleN/YqGFYYiIRPyOK
 sClSvQV2SiRUNQ06vR7wYInLS3pogDLonJezTR42Wx+s7qOL4jXgcTZFuFNiDxnNvSAwhhQ4CKc
 Zd4poy6Ys/LmzEYKDTc=
X-Google-Smtp-Source: AGHT+IF9TFgOodKBAt0OPJ5TzU4xOCCmK1Q8WOWt2LByYPbEJIP3tweQ28RoRA3MxBcWMbq3JBJd+w==
X-Received: by 2002:a05:6102:26c8:b0:4af:bb06:62d with SMTP id
 ada2fe7eead31-4b3d0d9fd51mr31667011137.11.1737022682780; 
 Thu, 16 Jan 2025 02:18:02 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b608f4cb2fsm5326798137.12.2025.01.16.02.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 02:18:02 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4afefc876c6so133633137.2; 
 Thu, 16 Jan 2025 02:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU828ssXUtb/1MrPBNkZCgVdGP/s+pFRmGmKx80At/kijrCu1+G8ToaGykN5tLyKWNFFTtf6569PJ5O@lists.freedesktop.org,
 AJvYcCUp+AHGxuj0JtDMYvCaMlpqeSXTL5TUjrLc3vY0Uo4pYF1mFe1r64KqosvowekS9Sb8Cs6yGsaG388=@lists.freedesktop.org,
 AJvYcCVNv7VmTMVw9VPtcwqvw10Me7s8m5AtRPjOBTfFlRM3U2nfUAv4G+NZMte3t12/CVqDzRBeE3S8IQ==@lists.freedesktop.org,
 AJvYcCX61Vrq6QmUkTEfaCRtbPGBizsDMUFhH32FzpseeHNgcoHuZpNR/cTXpLExtkS0pnSR3epu2/iKkvQ=@lists.freedesktop.org,
 AJvYcCXqVppzdMx1LNDZuEBMO+MuLResNebQ8jCY5oSL9K9xivsd+jPZCC+m732KonIeZSNX73JsE8rhHsuVqjU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3a14:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b3d0dc0215mr29032050137.16.1737022681773; Thu, 16 Jan 2025
 02:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
In-Reply-To: <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jan 2025 11:17:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
X-Gm-Features: AbW1kvbCtGVmgNJ1oRyFqRTMVO1bCUCk0WwRoRvrPqq521tQuGLKMDrWmAM4CG4
Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 16/01/2025 10:09, Thomas Zimmermann wrote:
> > Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
> > [...]
> >>
> >> My point is that we have the current UAPI, and we have userspace using
> >> it, but we don't have clear rules what the ioctl does with specific
> >> parameters, and we don't document how it has to be used.
> >>
> >> Perhaps the situation is bad, and all we can really say is that
> >> CREATE_DUMB only works for use with simple RGB formats, and the
> >> behavior for all other formats is platform specific. But I think even
> >> that would be valuable in the UAPI docs.
> >
> > To be honest, I would not want to specify behavior for anything but the
> > linear RGB formats. If anything, I'd take Daniel's reply mail for
> > documentation as-is. Anyone stretching the UAPI beyond RGB is on their =
own.
> >
> >> Thinking about this, I wonder if this change is good for omapdrm or
> >> xilinx (probably other platforms too that support non-simple non-RGB
> >> formats via dumb buffers): without this patch, in both drivers, the
> >> pitch calculations just take the bpp as bit-per-pixels, align it up,
> >> and that's it.
> >>
> >> With this patch we end up using drm_driver_color_mode_format(), and
> >> aligning buffers according to RGB formats figured out via heuristics.
> >> It does happen to work, for the formats I tested, but it sounds like
> >> something that might easily not work, as it's doing adjustments based
> >> on wrong format.
> >>
> >> Should we have another version of drm_mode_size_dumb() which just
> >> calculates using the bpp, without the drm_driver_color_mode_format()
> >> path? Or does the drm_driver_color_mode_format() path provide some
> >> value for the drivers that do not currently do anything similar?
> >
> > With the RGB-only rule, using drm_driver_color_mode_format() makes
> > sense. It aligns dumb buffers and video=3D, provides error checking, an=
d
> > overall harmonizes code. The fallback is only required because of the
> > existing odd cases that already bend the UAPI's rules.
>
> I have to disagree here.
>
> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
> buffers are the only buffers you can get from the DRM driver. The dumb
> buffers have been used to allocate linear and multiplanar YUV buffers
> for a very long time on those platforms.
>
> I tried to look around, but I did not find any mentions that CREATE_DUMB
> should only be used for RGB buffers. Is anyone outside the core
> developers even aware of it?
>
> If we don't use dumb buffers there, where do we get the buffers? Maybe
> from a v4l2 device or from a gpu device, but often you don't have those.
> DMA_HEAP is there, of course.

Why can't there be a variant that takes a proper fourcc format instead of
an imprecise bpp value?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
