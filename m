Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191D18C2C1E
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA010E142;
	Fri, 10 May 2024 21:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="de08xAd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96410E142
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:53:05 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-23d16b9bca7so1241241fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715377984; x=1715982784;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/extV98TSdFy/1bGvQt4l7C040wMqG+QLoAthDMEcc=;
 b=de08xAd/GoxoFC8tBJmJYNoBvcBmiduNDLfOeJfg9w3esi6YyKo1rh9T1ySvZu8fyJ
 i20/jht8xH7JNVyOrTZoWDLUgfpjQtMueLHi/9XC6tB1f9KnPvGj1sV0GSHoldIN7PGx
 +LQy6lQhv4GttXVqllWBtuRM4NLHq+UIobjBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377984; x=1715982784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/extV98TSdFy/1bGvQt4l7C040wMqG+QLoAthDMEcc=;
 b=BiaUGqRUuRb0aRwYFWg1p4ViuwRE7zfEBEbkKBlA1/l3Hlq26vUf3v/4Ez3TXifb+W
 UVDb7ekVkEFflsUm/RP0PXtkjpL+3p0jLtS3geOMbC7WUHrUpZZjsVnIr9kIKFSm3Jmb
 ktygVi0L9tMb03zPdFEdc6eTMZ/50qV3S0H6erneoNYpXvx+EjSfaqkWaY81A9hB/8/v
 Jnjwh4Jzmf5oEEYYXIDHh63kuG8VCWiFD6xcBcby4HfrQAWMKaZOVi2nDNMVw78xkWLU
 mg1ToHv/q65wDf2B5GyboE1Kpaz7uZXheAXLqLaXmrKBBc9pgxleAAHbU+hN+G1WNbMJ
 tp1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCU6pp4+hlFZJqpAFmSOLD7fhAfYmv5yzTxfmBZc1v4I3bHDG6cC+oKXx6+MG3RvOIyX13PwSpvPA1n63EnJipERShYMj48L96t4mZywPs
X-Gm-Message-State: AOJu0YwsZ2BvVWSn72vwR8yQBbucE2h6Bnqq4vY6sEH93OVYUkagKS8K
 G0/7xu3mkSzSxgsV6Ty0KP4Z8qQ84ut2elGZWhsYLnHyNTxq6saHFT+BQIiYnzwra4VM9FBzhAM
 =
X-Google-Smtp-Source: AGHT+IFJWXY8p+jc2+GpYMZIAXG34am78CGo6Mo8/V9bzn0recKn+KVpmPpEMvA/5P90Fsx72ua2vA==
X-Received: by 2002:a05:6870:568a:b0:23d:63cd:8b43 with SMTP id
 586e51a60fabf-24172a4515cmr4576778fac.7.1715377984289; 
 Fri, 10 May 2024 14:53:04 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf310713sm218062185a.109.2024.05.10.14.53.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:53:04 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso98661cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgZoTs4YOFXweAfSYxDyO36hrntW4Rzz1cTkvyczSab+71QBuEy3/PrauzKkCEljEs0Ra94wYfKlywvcRT3VZTbAA6QvP2yfeMtrrokaPE
X-Received: by 2002:a05:622a:192a:b0:439:d5e3:1f31 with SMTP id
 d75a77b69052e-43e094b27d5mr781411cf.4.1715377636922; Fri, 10 May 2024
 14:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-6-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-6-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:47:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uu2=6c_3Q44BK384cgSLX=++_bBbg6=CCqBaXnqcEK=g@mail.gmail.com>
Message-ID: <CAD=FV=Uu2=6c_3Q44BK384cgSLX=++_bBbg6=CCqBaXnqcEK=g@mail.gmail.com>
Subject: Re: [PATCH RFC 6/7] drm/panel: lg-sw43408: add missing error handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, May 9, 2024 at 3:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add missing error handling for the mipi_dsi_ functions that actually
> return error code instead of silently ignoring it.
>
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 33 ++++++++++++++++++++++++++=
------
>  1 file changed, 27 insertions(+), 6 deletions(-)

Looks right to me. Only slight nit would be that I'd put this as the
first patch in the series to make it obvious to anyone backporting it
to older kernels that it doesn't have any dependencies on the earlier
patches in the series. It's fairly obvious so this isn't a huge deal,
but still could be nice.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
