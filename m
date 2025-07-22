Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA3B0E195
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 18:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A27410E309;
	Tue, 22 Jul 2025 16:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="brCJh20j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388BF10E309
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 16:20:53 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-23c8a5053c2so54263895ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753201253; x=1753806053;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZwHRFu4FSql/d/NwVvAy0lekcQX4lLK0gqetRRULkuc=;
 b=brCJh20jLGFPQIG9Z15ztKBBcQ0bch4e9dqONR5/Kai9mbRpDxnythTcmN+U9zTavi
 k7tJQnuN6ksfDs9vW59NJXmlUwhBSVvUi/OmhzhmjND6RoI5MfDyefHu6HI/tF19Udcp
 rtX/QGpSOp4Q0oYdRSUozaClMxJfogaSfuKJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753201253; x=1753806053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZwHRFu4FSql/d/NwVvAy0lekcQX4lLK0gqetRRULkuc=;
 b=uj7ajqxvFi9epOp2g43RAqJJNw3aDYiaq+w0mXcxSa0hF/eVhwIl6gVhahX2F9b095
 NLkFF9A0ZBrZ3jbsnlC3F4Sd1TYCKkTlTYRuKIp9ddtjK74yaOQ3LBxAM04vJFhZcJaX
 zYe4lztf635IYPigjxU2MfSI1yHOMOdHxaQxiFxQ63jznJxOUQwrHbTniPQ2+2RhCJcS
 Xac0oaCJOlYEkXL8hJRsWNvCYEo7nBV0N7rOa/GT8BvAZ+voyGM1KhEOPciUD5JZv7VC
 k9qMVx+0/xlLOa6XrIZgzM6ss2JILx7FI0arMxbd9er+eqhS/xrW8kkrTM+04dDVz6hv
 yTqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7/uPZNXSR5wzrUlPAlsKo9xGP6WGji8ANEZ8bTkqewbpXpxJD0to0JyrBt27n0gQV5HEjtrsRJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpK5yBY1IRaju78VhO4z/Wr3cuUZrNAtiNpkVb0KKWL+kexkVT
 8RmkGOwVG+x2PRAcjZF9UFHMiicD/N6iX9TyatGNXYAoHdFfTurKxo+6L7ZcBmtoz9g3g7X4djg
 ygeY=
X-Gm-Gg: ASbGncvKFiRhIr7kVlMcg19E0JjcOAzESV4b4oV+37K3Pzb/7F5fGTUlB/FsYNXcjuO
 mU6XExJHbpdSDyCzWzAk3G2XyfaA11x06C7H8ckslI1AsySjdhatbLutZ95wKYpEfsxo4Woo8ad
 +3YboJkNLsPhiNsOzxJbAtKCkaqo64YgnW1VQU1Z9+CoIGrw/ZlmxXahl1WSec8b+TuaPMKwdgj
 ROMOUKvCnqWngKMoUP7sbW7OYovsX5QNwkBS46QzgxKbm+CXdM3lPj8zYRYVc6m7GKzYd+BXCJ1
 bvIdboa80+VceSwf3Iy2QLJCztgygEeudKVyETo2iifrx22lhzdDLo6IXVA01ZrCf/fT1c8ixiK
 Cd/IF5kOJK/5DJnZq+AdrejX2S9n78y5IrOCAFBQ9EnaHH7u19027Xag5MxWIO6SJXZFqDhbR
X-Google-Smtp-Source: AGHT+IEW+NwocNBqvgPFNXB+SdAQujYnJQC5XalmMafLtnW2P9LXGKENBhGgA2Ie6b2WNuTqK8Dk5A==
X-Received: by 2002:a17:903:3c6c:b0:235:f51f:c9e4 with SMTP id
 d9443c01a7336-23e24f49430mr390671335ad.12.1753201252663; 
 Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3c95sm79446475ad.34.2025.07.22.09.20.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3138b2f0249so4449530a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkNCSY27fc5DeP1ej0DOxrNwKH243WXeUXMOYeMl8YZ05qjGoWC0+014VmoWFNX0Qtwedb/u9MKwI=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3f8d:b0:316:d69d:49fb with SMTP id
 98e67ed59e1d1-31c9e70915amr41164532a91.14.1753201251543; Tue, 22 Jul 2025
 09:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-2-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:20:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
X-Gm-Features: Ac12FXwtfJseOxsGp7nVtSJKfbTvysXVQqEuN_xMYIUstfIqb9Hrqert7fbtJBI
Message-ID: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] drm: Create mipi_dsi_dual* macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jianhua Lu <lujianhua000@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

Hi,

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
> mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
> by two parallel serial interfaces. This allows for the reduction of code
> duplication in drivers for these panels.
>
> Remove mipi_dsi_dual_dcs_write_seq_multi definition from
> panel-novatek-nt36523.c to avoid the duplicate definition. Make novatek
> driver pass mipi_dsi_context struct as a pointer.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c                |  48 ++
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
>  include/drm/drm_mipi_dsi.h                    |  95 +++
>  3 files changed, 541 insertions(+), 406 deletions(-)

Just because I was curious and wanted to confirm my claim that this
would result in a nice space savings for novatek, I ran bloat-o-meter
on the novatek module comparing before and after your patch:

add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-8754 (-8754)
Function                                     old     new   delta
elish_csot_init_sequence.d                   758     379    -379
elish_boe_init_sequence.d                    846     423    -423
elish_csot_init_sequence                    9136    5380   -3756
elish_boe_init_sequence                    10192    5996   -4196
Total: Before=3D33880, After=3D25126, chg -25.84%

So the new way of defining mipi_dsi_dual_dcs_write_seq_multi() did
indeed give a pretty sweet space savings! :-)

This patch looks good to me now. Thanks for putting up with all my
requests. I know this is a lot bigger than you thought it would be
when you posted your first patch, but I appreciate you sticking with
it!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

My plan would be to give this series another week on the list. If
there is no additional feedback then I'll plan to land it.


-Doug
