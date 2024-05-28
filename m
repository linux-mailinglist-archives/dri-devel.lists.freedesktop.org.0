Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161848D111F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 02:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B740710FDA6;
	Tue, 28 May 2024 00:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ocMjjhQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4A610FDA6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:48:30 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5238b5c07efso339334e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716857308; x=1717462108; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WqyKqJsE6pp+l2O4SC+W159s+eImxbzOSm8NXJ1OA58=;
 b=ocMjjhQNZMvT3Hs8t9vkfbGGureXe2xFGzfqGptUF9mmT/N10cEiULdQh5VoDn88/v
 h8P2q056BNuFbGmDk8PSIthuGxoniwp2U7rFHCEetVp6bP+c0NhVCE2okT9gnED168yO
 0IsQ1z3TzyUAbneSkKx85HRmQQeUlkCV5r0QcvJ3T0De0K9WIwxBNdvPXy9/izTMCfuN
 tbZwIYOC+WUoiB8KRCp3QpdIAzA5uksqVS3+6aeUBUctc41GkWVjukB1rV90IINjPY7L
 W8EWcdPI17jfdaLqsy2SMCBk1PO5Xvcm1uX2kmJFJDEUlbtWtr6wMqbx70GXCdUBQHWS
 gIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716857308; x=1717462108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqyKqJsE6pp+l2O4SC+W159s+eImxbzOSm8NXJ1OA58=;
 b=rN+mhz/gXZyQynzw1FHIV3yWcYJ6qFFeZSChZTVKKfta/Bi95H3UQVhbHSEbjaZf3x
 mBUesCEPTL44rJzGcjPv5EQVdRmdXmcJcUV9s37+rXr5nA5KlVMyY0D0M4rAFliU3g3P
 SU7+WInRT9etzh5vGQbAGXUNfZnvORG3xguljrMdtbX7gjWQmWb2TSOMKqzK3ivfDwJz
 raMBajIH5NP7vTpjzM77U1K0w0wqdwkiPiG5XSXbF0MAjV58gqoV2ATQqQwZLcvrDOxP
 sHO3nf7bgQ+EWhBCWMXaYFRmvSqxwpJZiiCVxO1pPb1o970jNmLMEriaZ6TlamDUCfvE
 l9GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbLEHoIepCOLIqFVDFlXu1AomxjtdfsDIuUG1BmUssDoqooITa1y0VuX8udejymfcBPMO37EmnYSlc5ej4LUqtkfOS1kE6Z6Oy3FasfDB0
X-Gm-Message-State: AOJu0YymL1ZwWJMSkqLc0IIQ1q52aH00Vm8Hds+Ham9Gp5Ezz9+FBZ45
 JiRANC9rrcmROYt3I+m1MsHbiutCPaFXx4jwYnS2shqNaGZ41ALIf/Lnpt+OZd8=
X-Google-Smtp-Source: AGHT+IEkY3dLBPQpnDZeVlJ5g4IQ99DKVk9uniY+rjpvwvxmpQU+WYyWo8C0Uczxxy+AfmQzepE2XA==
X-Received: by 2002:a19:6912:0:b0:51d:998e:e0c1 with SMTP id
 2adb3069b0e04-5296410ad52mr7332337e87.13.1716857308562; 
 Mon, 27 May 2024 17:48:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm816295e87.67.2024.05.27.17.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 17:48:28 -0700 (PDT)
Date: Tue, 28 May 2024 03:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
Message-ID: <zdlreka3shviepb3p7cq4ulv7f6e2lz7b4af3pdqntnbqikmhq@uoiyu473v5e5>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
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

On Mon, May 27, 2024 at 10:21:49PM +0800, Jun Nie wrote:
> Enable compression bit in cfg2 register for DSC in the DSI case
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
