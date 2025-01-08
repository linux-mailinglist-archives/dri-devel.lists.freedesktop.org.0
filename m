Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A72A06492
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1110E911;
	Wed,  8 Jan 2025 18:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YwkWd5Kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA8A10E911
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:33 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so170740841fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736361272; x=1736966072; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q0wdqde2rMSajt0mAhnfaexL5jNqsw0tPMrbAzFh/CU=;
 b=YwkWd5Knrxm0ULPkfopvtCs1MIzws/nn6VZjYYKUX8rd19f6w+4M0L8B24IqoFt+M7
 MgKxrSSdgK4y393xriOjL80mxC7tftlSnSm78sueziUfktGkeNV3VPDX+1SXSydAiUtW
 Ddc090Ds+PShZTwTiwE60DY8tlcYSk8lypHDFf9FQZqb+yGKDXYKr1jWCwiUBXilSdYU
 VP74Vh4bILTx3xrL3swrU2wSOink/GJwCIMZH6qAnpKjXMBha0hr/aANh5CXsvArLwK9
 YyUNw0E+l2N6y3QU+SLBEEgCA60NVLVDvL7kW7T+57FjUrQSJaQe4kqCkNZI4fq/23Ul
 eMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736361272; x=1736966072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0wdqde2rMSajt0mAhnfaexL5jNqsw0tPMrbAzFh/CU=;
 b=bya9eOTKQJAU2LFMQYg/AqRSPc8Px3JOsKK8V/k7SosoiKQwV/SJaZZCU4TldrzlFc
 X3hvPCH4JVWVZn3XNDdK/3MyTt3Ja1CJi2GVbGoEjNF/wDdpSSJcor2GKSc7RB++Dslm
 jw1IEwN8s3+u9hC+T4iwP3HToVy6MhxIQxFc29Ov2MDF//BKp+t76JuxQFYAx/xsWUks
 n+ICnjPMI9tDhASnYe0f4rRjco7UxXNhWHlQj2KZWk9yOEHWWx8QWo4pTVkf26HHST5K
 i9GHC7PVxOszxCAFddv0d3uY6LfcxFTUR3t78wNh9P9c9mkcwbCn/b6XtakWaRpHQhnj
 IotQ==
X-Gm-Message-State: AOJu0Yzmtn+qX2tU8ojInAp/GE9Tk1j1qw1TLeRWYPlR6c0u/21JGMLB
 Fr98LffWnoZwU1zXCX6//HpIdV4Ya7RYyM3i+Dyoa/qksck2QrmFCJFsLr2KUDYi5h50IwaP+TO
 F
X-Gm-Gg: ASbGncs9uTJodHeiNLjZx0+9P9inoTNfPN8Pw9aW710ZdBimROYRhK+doKppVVQXndv
 eBGVmmAekTdQKY9HNXbTsjwv17YY7S0nbm+Fhwuw9CsB3iXlgoT/zrf3hoBhFhGG9ZMLkpnV2dS
 haKVIODE+Vr1PtfOP3F82Q4RDAV77NtqmyyYSf9mKz4LUgQuSSfUZ8KHlrbnhl70mdZpb4DVltR
 vZZ4fAHQNicBqNEeg9zhc1ZzzjLo9TvikaKrEXMO5nlLJ4QO3klJEd4yTj3iLaETIkt1OCn5utP
 Xuo1KNNX4qPt6O8ld7aCFEeJwq518xJQXgER
X-Google-Smtp-Source: AGHT+IEfQuvAz8qqjLWNvZ6HRWyiWaUJ37bnb7fWxz68SYTP1X+DUKwyF5m/g2ghphz0lMhOl5ZsGw==
X-Received: by 2002:a2e:b887:0:b0:302:22e6:5f8 with SMTP id
 38308e7fff4ca-305f45b11b7mr11420411fa.22.1736361271656; 
 Wed, 08 Jan 2025 10:34:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbe9sm62260361fa.43.2025.01.08.10.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:34:30 -0800 (PST)
Date: Wed, 8 Jan 2025 20:34:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Manasi Navare <navaremanasi@google.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Message-ID: <zvcs4tcizuel4ggpwd6coxesx7pcivtuoskwaa3cuvxmtmqigv@f4pj5y5ojt4m>
References: <20250108172417.160831-1-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108172417.160831-1-simona.vetter@ffwll.ch>
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

On Wed, Jan 08, 2025 at 06:24:16PM +0100, Simona Vetter wrote:
> msm is automagically upgrading normal commits to full modesets, and
> that's a big no-no:
> 
> - for one this results in full on->off->on transitions on all these
>   crtc, at least if you're using the usual helpers. Which seems to be
>   the case, and is breaking uapi
> 
> - further even if the ctm change itself would not result in flicker,
>   this can hide modesets for other reasons. Which again breaks the
>   uapi
> 
> v2: I forgot the case of adding unrelated crtc state. Add that case
> and link to the existing kerneldoc explainers. This has come up in an
> irc discussion with Manasi and Ville about intel's bigjoiner mode.
> Also cc everyone involved in the msm irc discussion, more people
> joined after I sent out v1.
> 
> v3: Wording polish from Pekka and Thomas
> 
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Manasi Navare <navaremanasi@google.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
