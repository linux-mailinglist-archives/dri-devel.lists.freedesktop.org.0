Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF4A36334
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227BD10ED08;
	Fri, 14 Feb 2025 16:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jdKTYfMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F4610ED08;
 Fri, 14 Feb 2025 16:35:18 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fc288da33eso280412a91.0; 
 Fri, 14 Feb 2025 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739550918; x=1740155718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBW9iWXTPjCNPPFKZqtUELqSmwKsFRdC2nvcBo4TH2E=;
 b=jdKTYfMrrNZNbT+o8q9iFB0cWP77yF3hqt8W+hLIe+Iw5I+VLNgPYWaT9HGxapiRnG
 JfvUaERYXZIfOzu8DIpAmWae62N+BX9lgObuPTMViHj9Vik/T29iZ9+e0RRIGixkbdZk
 0kxya7EK2iFiNIWAPT/Uhze9iftqyhwMu1iTk/srLAYmPwEmVUQEjB8iofrv7yc3WcXb
 uu7qNvSM8VE4gGVDtPcKUalWBSpWppscF49cYiEzFxuHE/IHMAkglviEGzop3zND8c//
 OsvXJ6lgG8MLz1XmaA0a8g8KX9OhGMmvTQvcq5f2V2egc/Gss7y20YxD5E5+jrJnOn98
 g+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739550918; x=1740155718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBW9iWXTPjCNPPFKZqtUELqSmwKsFRdC2nvcBo4TH2E=;
 b=soJeaaXBZ8p4M4s+DoY+FJe5hKka2LuzcHKYEWPKPnljhJdxwnSPvAk6oA5AvT+Z4K
 q4sIp+fd73J3wDOKVkc+gWxqwKlpOD/ZlfKNpBZun1QN+Ln+OAc76nZnssM+/Y9GtDe4
 aWKxFJ0vqOLG/L3dwd91lAHbRA0lHo7mrRuboAPxxUkFOb98ETYiqLoLgPDapRzIBAjU
 UViLJid9AH1HUdr32SWOPzn85iOra7oLX1D7PHQFGUCk0XG4QtGLp7UHqnwaVJPF00+x
 0qtnPx0CouXsdiIL8PA5jaGcYimh1CDNQTwuH//Ei992nmtVOsj7bQo8HvS1gR8B4hl6
 Z2Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV39tVFBx5NDbnaekWIkpWLQKfv/OYBPSMfojrRg9vDU1f72O8tsSsIWxdNtv6cPyLCGHJqcRd@lists.freedesktop.org,
 AJvYcCWkulo3wXA2vPqg20nmgS94+Q09WnBMgTGVhgpfavcVeIqdXl5tmAqkpKPJXKtsHxlKp/vDDyiSV01d@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcQr7YwaqRQ1baCpiOGwaGfOz/vC5hEQklH8Mx7VkXk8/ZGxMm
 9WlOAhW10dxSr8ybNbDDn5x26tbPWmfj+jYKYvUHKca2ZiuxRKrOYUNIHMm15QC3UKfbHTPual0
 fVdq8tmmmlGcO1va+LTdWhyXsvSg=
X-Gm-Gg: ASbGncudmthRwkdwdV3SMZjkApzDs/9C5ohET0mB07clounL8yoZ2m+Lf0cRRBKI2RP
 9pGDu0PPQySXiuDNwhMUj+8KKmRaS4eSjuTynOyLKB7mo3wtHT5H6YyMHlc2SXr4Ar3LtEXAN
X-Google-Smtp-Source: AGHT+IFAg9ohgjgbuT0seCKh4CYhM69eIUuttE9yM1Ug2c4COFaR3gXGRNbaouKY5oxT95jalAAWCU/oCmaDR+/btRg=
X-Received: by 2002:a17:90b:2f85:b0:2fa:2011:c85d with SMTP id
 98e67ed59e1d1-2fc2d04fe0fmr2165699a91.7.1739550918086; Fri, 14 Feb 2025
 08:35:18 -0800 (PST)
MIME-Version: 1.0
References: <20241219-amdgpu-fix-enum-float-conversion-again-again-v1-1-ef2c619724b1@kernel.org>
 <CADnq5_NKWH7UC_ow825aAtF1tZXJTVOwDWaqDR8_4Y6EmPXUiA@mail.gmail.com>
 <20250214162813.GA3221808@ax162>
In-Reply-To: <20250214162813.GA3221808@ax162>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Feb 2025 11:35:06 -0500
X-Gm-Features: AWEUYZl0Bz3gbkMM-U-AbQ0SraEE3UTPUbx05TeMQKPklIWTUPqv6fEy5wiUN_o
Message-ID: <CADnq5_M6cHLmrKevSFtzwBh4quekM6hcHnAvc+x=c-N4=Ydeqg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Disable -Wenum-float-conversion for
 dml2_dpmm_dcn4.c
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Austin Zheng <Austin.Zheng@amd.com>, 
 Dillon Varone <dillon.varone@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev
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

On Fri, Feb 14, 2025 at 11:28=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, Dec 19, 2024 at 05:21:41PM -0500, Alex Deucher wrote:
> > On Thu, Dec 19, 2024 at 12:23=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > >
> > > Commit be4e3509314a ("drm/amd/display: DML21 Reintegration For Variou=
s
> > > Fixes") blew away commit fdedd77b0eb3 ("drm/amd/display: Reapply
> > > 2fde4fdddc1f"), which itself was a reapplication for the same reason,
> > > which results in that compiler warning returning:
> > >
> > >   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/d=
ml2_dpmm_dcn4.c:215:58: error: arithmetic between enumeration type 'enum de=
ntist_divider_range' and floating-point type 'double' [-Werror,-Wenum-float=
-conversion]
> > >     215 |         divider =3D (unsigned int)(DFS_DIVIDER_RANGE_SCALE_=
FACTOR * (vco_freq_khz / clock_khz));
> > >         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Just disable the warning for the whole file via Makefile to avoid hav=
ing
> > > to reapply the same fix every time the code syncs from wherever it is
> > > actually maintained.
> > >
> > > Fixes: be4e3509314a ("drm/amd/display: DML21 Reintegration For Variou=
s Fixes")
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > If you would prefer reapplying the local fix, feel free to do so, but=
 I
> > > would like for it to be in the upstream source so it does not have to
> > > keep being applied.
> >
> > I've reapplied the original fix and I've confirmed that the fix will
> > be pushed to the DML tree as well this time.
>
> Did that actually end up happening? Commit 1b30456150e5
> ("drm/amd/display: DML21 Reintegration") in next-20250214 reintroduces
> this warning... I guess it may be a timing thing because the author date
> is three weeks ago or so. Should I send my "Reapply" patch or will you
> take care of it?

<sigh>  I'll reapply.  Come on guys.  Please make sure this makes it's
way into the DML code this time if it hasn't already.

Thanks,

Alex
