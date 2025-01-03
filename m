Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F52DA00D79
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872AA10E0DB;
	Fri,  3 Jan 2025 18:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E3xqLXDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0453710E31B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 18:15:26 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso12609554e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 10:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735928064; x=1736532864; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Y4JwSeoM0m/lPtao+vqJ+AdOjzSwIcXzqCR3omVrak=;
 b=E3xqLXDSh6LyCM+tN/hY+m2Y169v2n43Qjh5XQF/RRgnOql8UinoS9FMoqOQOK9ATf
 nH1F94ewctoC13Qoy3bsODdD/UP2MIxUL8hWqAcWO0W0ja4raxcY93nG8OSugjfCREbV
 zMicfglm0qYAokNeLSAbJM9Wet2Ijz6bf7YVl3x2KE1WEIntimXzWo18p3D03jU5q0ie
 Bmv2OZVYO1JZ9incaotWjvIHHQAJEXe/sNDTMglDGjMd3V+h7WHoKgBse/2IfYSmR1cU
 bJh6fVNFj/WKapiXEwB6vCqs62JTDeCnh4d/VY6lqjgMqhsiqG9I5Ab+nM1Pq1UsODDW
 56Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735928064; x=1736532864;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Y4JwSeoM0m/lPtao+vqJ+AdOjzSwIcXzqCR3omVrak=;
 b=cCeR1lzbzMPCRvuSaBSsDAmSqX0KKKrQiZfrf2symOSokWWIFT9TJ9Y1LD5u34oi0L
 CbEhlSqEDF3tTXztFpLXJ8qT1A0K5/AnHZ7baaakd3C1QeLrcctCRGp/ti+NOCfx5p3u
 g/o3zfQlYqEAtho7RRTqQjI3COu3xIoxKrRACjLWswJi2lnBkqXxA8iZHEcHtC1UInur
 e35oARFnl8d8c4LCBOgEVMfdgjSRFIl8g/tsS1kYmvQvZ8VxusMu+ziPhCE47iKR4y6O
 /UJ3mJKVx00I0XuRWF8jcvu5Z7hcAL4eota7tdSq3wi4x96AewkZkucl+mdSKBOwm5l+
 i0nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUq2b+NTp/xYro99gUYaVAgLMzcVVmCtY5h+U3NqJillQaE+xk4TxkXCnj4JrtW2HhipewXmrBasY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHdazkdRAiKwdg6a0F0dnORKjHeJRXe1K0e0tziS9o8IAbgTZP
 EkeGebZ92HMAOj2FFUyV/UfKV0E6UwkSryspgY+Z76ORWesbRcWGjFl+7OC367s=
X-Gm-Gg: ASbGncvlwPVl6uqmV1VopjRNpABivNeeOxwmYYXQzGZ1iI0d00GglAOc1v5niWI2YnV
 u2S58QqP8m2OGaStNNL0BCsQsFaDa1K0Pz2dP6Obk/qcdp/ahH9zYcyJnMlWCOApnuybEeNGYix
 a/i1oPzuC+XZA49S3+pt3eRkxXZ1XcfpFc6uU1opje2ErH/cRP8ZMPrq97sWh90uoagnb2fYV7v
 UnmmGaxfCP3NSMlRavnBphCyF8OtWcb+EuN0JNwp5SYEFvG0R3VXgIcLRfy6Xl2JM8XxieCXV+/
 ltEq+F6W3tjc12mZd++hCCB8QlwEJvqxJ0+R
X-Google-Smtp-Source: AGHT+IF2R6X+amSgmYI1M2hsVzewhIkqcED2Q+UK8LKqYTzNEPxOIabfak9HeGNOr1CZ3JvtnYvr2Q==
X-Received: by 2002:a05:6512:3a90:b0:542:249c:2156 with SMTP id
 2adb3069b0e04-54229530077mr16555313e87.15.1735928064353; 
 Fri, 03 Jan 2025 10:14:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832a50sm4281635e87.266.2025.01.03.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:14:23 -0800 (PST)
Date: Fri, 3 Jan 2025 20:14:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ruanjinjie@huawei.com,
 jserv@ccns.ncku.edu.tw, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH] drm/tests: helpers: Fix compile wrarning
Message-ID: <rpeh5mcy4xumebqojfoevvfar5dw4jmvuwt3btjklr4gohqhfs@fjqt6nbcpf4k>
References: <20250103161758.1097313-1-eleanor15x@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103161758.1097313-1-eleanor15x@gmail.com>
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

On Sat, Jan 04, 2025 at 12:17:58AM +0800, Yu-Chun Lin wrote:
> Delete one line break to make the format correct, resolving the
> following warning during a W=1 build:
> 
> >> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line: for a KUnit test
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501032001.O6WY1VCW-lkp@intel.com/
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Reviewed where?

> Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
