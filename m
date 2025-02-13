Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52DA349F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009C010E04C;
	Thu, 13 Feb 2025 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOrNIfaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0557410E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:35:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5450475df04so1089377e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464519; x=1740069319; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+g5BZbHHAPB1An6Dt98zb4sht9CAKT/HIRa43hMPclQ=;
 b=SOrNIfaq4GqQO+vD3bRjPrPcHUv7EG0nawU+o8wbhoMbqx3MbxDuE8sh0hHAd3C0lB
 fJEzW8fCJF6meiKWJNzcmv76fULxRW0Ds4uru+PlZ4kJjRy1Aw7o397nF7flhdYeIgCm
 wrh3um/y9K5LDrzanCMs7xEnp3O5D2CJ2qB/ic7ElPLDSV4Ce68GcUveq/4PozsRRaFJ
 XnVwC4oaZdA8fkh3nZuyMgngoFlRmxm5LCvpylUedH7WTDF3rN3/bLN05x+CiG1+SKxA
 WD4p58GHvs6ynGETi8p8TSJUKCRyVU0a8OMfDwG68uSp5q2O/GSoJ47MFhluMpkuLCtH
 yM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464519; x=1740069319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+g5BZbHHAPB1An6Dt98zb4sht9CAKT/HIRa43hMPclQ=;
 b=mGLO64x7yc4xzHnFtmsj8s1Uld3j+O9QRuXBv7vBqBlkQu2kpysCHBhOgo7fxVRDPO
 llKVGgbNaXsI+0fErcRKHnWAdo5FbdoyG4WrHfiblKMwQfCGoss4vajPDAO0Ez7ij9uj
 JeoKkbLpDg2EWwWkGMcPrgT470syWnSZwMKNZn0g5TmoK/cZoS1+xMJqcHnOm2W2F44R
 ArMqpPDBBoHf3H5AuIpYbkP7vSJGVI7Y5uvPhl9DfB3+uKdAHCAZpio09X+NHOa24s4h
 DBe5jllU1Z0EuVbf2w9mboNQaUGyor+7kj3daArGgLKPp3kEKWbnVUK90sf0WuzcoZfE
 +nJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPF2jPSD17B2mK2Yj41lseAIQUgrIoumxfAARO1A0qxP3u9q31SuO/M43JksU2gu6OyNbPneYK3MA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/Gx8qZFBgC0FTugpBD3w+JORUmUR9SuXLBSnOiBnxttL4xWrV
 WgmeX6Xpb7b/gAXFUwCbMYzh0Fwi6sGLJfMVvZ3DZ8h7rIk5aLLNly1CLb/HVow=
X-Gm-Gg: ASbGnctEOkf8NwtpPkLn8TD3e0E4RgxOC+6aV+WlpCmmCSf9rJ//g43tO5vWksTylro
 VtPKVt+sMrufU/ehzTehvHlOU60SglqbqbiRsRvZmF4aL+9fKmsVG+nyANbww2ccotNA71D8g4E
 Su+zIfeOvtKD4hQoTU1uXZ+bithdrqbhl4qH/v9yne2bRFlIcxDFsTbEkfkE5+9uKmNT/JKnB0D
 a92JyTht97cI/GB16cPdeP0AJjfUGHc+3THApcSYb+fs2v6wC9XN0g9Mb+dkph9NwCi8N/8ETio
 Ja/NW7pfLLbNNyPJgcK8fdelFy9c43MkDC/fRKVVGGawwDqu6Tvf1SDoMZLHXwsJfbh2OMA=
X-Google-Smtp-Source: AGHT+IGKjcVYYqdaHVsMaxCCVB5KBYPSpTeBQ8LjU/GvaZgQpd6IvYwsCf50qVtW9DHkVjgHmROd7w==
X-Received: by 2002:a05:6512:3b2c:b0:545:95b:a335 with SMTP id
 2adb3069b0e04-5451810cb35mr2704828e87.14.1739464519298; 
 Thu, 13 Feb 2025 08:35:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11ebd6sm215877e87.214.2025.02.13.08.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:35:17 -0800 (PST)
Date: Thu, 13 Feb 2025 18:35:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
Message-ID: <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:51PM +0100, Maxime Ripard wrote:
> Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> pointer to other currently bound entities. They are all considered
> relevant only for non-atomic drivers, and generally perceived as
> deprecated in favour of the equivalent pointers in the atomic states.

I think there is a significant difference between mentioned fields and
drm_bridge.encoder: the former fields are variable and can change. The
latter one is static and set at the bridge attachment time. Nevertheless
I think it is a good idea to deprecate it.

> 
> It used to be useful because we didn't have alternatives, but now that
> we do, let's make sure it's done for drm_bridge.encoder too.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

-- 
With best wishes
Dmitry
