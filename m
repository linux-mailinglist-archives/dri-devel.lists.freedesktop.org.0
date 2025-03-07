Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9BA56890
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CE010EB44;
	Fri,  7 Mar 2025 13:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="miJHPk/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0F10EB45
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:13:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so2092681e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741353202; x=1741958002; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7qBnbvBQpj2jwxMDYe1fKnlfY7YPbRd+OabRPrz9om0=;
 b=miJHPk/7mmfdiV+0GzCCILFzAdvFfXLA+2sdY0Ni6t9DLQluGDCliWWAgWueXib+Y2
 UQ4oUOQNEdFQCowhWIDi8m0BPMhywC6k2qHCjaEVXyG3TNY/eA1nuMK6/TKYw2NCzWbz
 fJJ5D9aDAZMCMe+Wlh9d+Aa3VMb6DV+3QUDu2k4BUi6kukx3x8gAOFWdMiSFYrM5tupF
 lqPqREoSk2sT2r0+nJx0nwMbwR07hXOHW/pj6fAUZ6H3Fxx/Y5GTCAHqKHAL6+Ee34mk
 oixwOzxh0bcrAdAO++2fykg0BP9SeCSJlNaRaP5BCCADkLnmwWy4IqGL9RwXqx064tX0
 IMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741353202; x=1741958002;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qBnbvBQpj2jwxMDYe1fKnlfY7YPbRd+OabRPrz9om0=;
 b=BXYECd+oUJySmmIFGxMsNJavpQdKXpTnhN4WcgEPz8pnqztSOEeWofV4WMOE4ebtNp
 0r2xw9yHvPMcQLP5pva+vgOcUhNPeZDI+syHJxUHLWjUq0KGYq2WvOlyuH3eFFxNGsRE
 l8xOj+/cluus+zLQlX+ejTpQNVOE1K++bY6eJXjVcENyPeSd06i4oauR2KjaYTCIST1D
 9V5tNNSEtqiBoWAEaTt7t+Ju74nbyUtUeGTFlMw4rSoD0BjWN4yG2O5DKnHrb/yA4tsb
 fQnaZNh1+pSElki4Cj8JQWZ0Ul95WYD6WMuLW40k4qCHE//WcanRMQuDgntvkulszNSL
 5Hmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlgWKJ/mMk21WKh6TIJQxUF1RqzFliVtM54fVmaocNKjREFttcAxytXsfG+AcbDktVbnppYCpjVvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdObXflS7kVKoOXxqFJ9g2UTd31RanXQccHE15CCUgpfmDUIAj
 iLDcI9SRZmIoV76tquSeKj5WNjM5Pnr8zrWIvRLKOpQXI56X6msswmclZXSzTrA=
X-Gm-Gg: ASbGncur1Jsnf4BuopqrKpsK9QYrZg86FYhqb6fv+3N+FmYv6CK0vZkLVCBGWLBGPPv
 z1V/61K8IEss5CdjIor97F1SHN4/po2A3ofGf1Vp6J5R3GMrzl2iwrlrOcFSdevnK6WZtCNlh8Y
 xOnKVueV+BurooOVXRT33t9620m57GXAnSC2+SE6hZnUEl/qf350QObd6HJXy/EwFRShQgujhmQ
 N4zHJDZI80rAjnoPlFVLkUr6BrqZDjYm66kE7CPqWn2Bvrd8rykd3R/a+mafPX0Xzt8NkPgmdxX
 x/oe45UV4K6MD+7MjadEaOh0wQ8rlSSE6yDzfCh4W0p/tlbQIvKMkU9i0WUWdZdSWgDoNA+eapH
 m8Wkt8TYeApqhfdnXtKXwO7oR
X-Google-Smtp-Source: AGHT+IGhwZPATNvZErxDU+8X/e0vev5Hp0nAe0eNi62GDkHDz6sZ0wFGAKUkjgtC1ZWOmPx0zSf+jg==
X-Received: by 2002:a05:6512:1112:b0:545:1049:eb44 with SMTP id
 2adb3069b0e04-54990eb8e4amr1139155e87.36.1741353202120; 
 Fri, 07 Mar 2025 05:13:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bd0absm486634e87.157.2025.03.07.05.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:13:20 -0800 (PST)
Date: Fri, 7 Mar 2025 15:13:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 9/9] drm/hisilicon/hibmc: Add vga connector
 detect functions
Message-ID: <x6mx5b3qson2xqw2xcr3y3bvgee7oyq7rl4va6g5mxjfw7y5dz@dbakefz5g3wu>
References: <20250307101640.4003229-1-shiyongbang@huawei.com>
 <20250307101640.4003229-10-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307101640.4003229-10-shiyongbang@huawei.com>
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

On Fri, Mar 07, 2025 at 06:16:40PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Because the connected VGA connector would make driver can't get the
> userspace call, adding detect_ctx in vga connector to make HPD active
> userspace.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
