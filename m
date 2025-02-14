Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C51A36190
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8F410ECEF;
	Fri, 14 Feb 2025 15:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tnjg0aAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C98910ECEF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:24:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450475df04so2183126e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546695; x=1740151495; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=43NqkkXmKkwdOYGO6ycij0gMr1OHesReBZTFUoOKNec=;
 b=Tnjg0aAsk2I4NgJe8tNYnk5P2CFwZdt8iMhQVnt9Wmm9TU21nYqawrC60hsg6Qv0Tl
 O+7Vi70kPlDed8YUmPPI0WxtJkwFtsLMbmcPbpV6FB3VgGfjuv2CemUMKoXvcfNUeszL
 7ZBLJlA3ADbUQ+i2PMTx5wLKlsbbEZW6LdLb8G+UBmKP55ue3R/6bn1m7lovSUljm1YU
 RuDqkRM5iDeEWZCNWWByucH8YzLDypzV1l0lhv1sZ8do5y5OFtom19QwgakpyZ/8VeZA
 Zu1B/6D9N05PXTkIGp64+kBneO1MPK4Ed0blNIj70OabCaMDZ59ooAUn6Zc1OPTDogw2
 M4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546695; x=1740151495;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43NqkkXmKkwdOYGO6ycij0gMr1OHesReBZTFUoOKNec=;
 b=Ag5RVSIJgj8RE+IEql/+6K0ivSqHTy2rlkFjWYMszOX3r/CLhWUpTFN3YxEDD9K+At
 4f1vuWxghaYlibHBiVKOSTlmfVxyXodUb1zNPonIGeDk8acf0zlRMeDWpt0abYLt8s0E
 xVBwSAzDuetLHet80qINNBiQ7ZJMqpQaODtpyrUJq3Bc8PqNsZHlepVj8teXiiD6A5Zz
 waza8ny/sO3l7BcOC+N4we9VuVDJqOcZ8JHSokNHPf0br9DRHz+u7OaVafpbkNOQrdOI
 c1k05Sl+5cjMQYfxxZwLtBNfrGUGQp3eutAU7ymz/Yud7Xw+V+JBWkvkVKvnrmBSGrwN
 qMMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH5qlDTPN2KJeGexFb4Sr8RU1QYgD7BFAoFyQMG7E2ptYynSzykC6+/FwpnBP704AZzUjwucWJ3nQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9yFC61TZVeOWbapi3Uzs2zieCzaKo1qbTOZOY+P19BaoyAp1X
 BYuiQPZrhOpE8wBQgsG2MdDB3yBxZphM7fflwulp85jPptuf7FsNIxg8cwe5H7A=
X-Gm-Gg: ASbGnctYjjeWkuSXWHfc6FSuMsTDQ8bt7IuM2jLNe4z79D1vYP1UFctBP9TtEmF0ZUf
 a3TOFiaINgVtwqd9A/Aen9V63iR33lKKyyIhT2Se4SGrVXDXp3k4YEvr4JbuIs+bCAI9MRlGGfM
 wpwFd+Hu10rSIHRspRsCkqWAq0csqiPo6p6H9NOeYGmpEFAWzaQAvdd47uqZyFZFzeWgntOlEum
 cqoDlIlxur0dUa+SKFvx7oZUy76NN4P5j6CNHGYdq0V5sgkViqpSiczMzwj+glaZYth+E93hvQ7
 U3sF607x5+hkDUxvB3yFM0DDsRDFf2gjNjQnTUQ/9gfCue/r4Yeom9HLAs8jsaAJT38nEew=
X-Google-Smtp-Source: AGHT+IFMMRc1GwytzG6k6ATLntN6Q3zbP4uW7Ri3VRuH1h0hGLW4B1KSA+4aA5975RklLNi1meEo1w==
X-Received: by 2002:a05:6512:3a84:b0:545:2837:17d0 with SMTP id
 2adb3069b0e04-54528371a46mr1151389e87.12.1739546694728; 
 Fri, 14 Feb 2025 07:24:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f083528sm556057e87.23.2025.02.14.07.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:24:54 -0800 (PST)
Date: Fri, 14 Feb 2025 17:24:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dsi: Minor whitespace and style cleanup
Message-ID: <7ppfvbbfvlfk4jtqw7acxqjm7flcfpx57ijyqcgc2x4qe6tlhr@jdldkmghceay>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-3-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-3-1bec50f37dc1@linaro.org>
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

On Fri, Feb 14, 2025 at 02:17:46PM +0100, Krzysztof Kozlowski wrote:
> Cleanup few obvious kernel coding style violations: missing or
> unnecessary braces in 'if-else', unnecessary break lines, incorrect
> breaking of long function declarations, unnecessary 'else' after a
> 'return'.  No functional impact expected.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 51 +++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
