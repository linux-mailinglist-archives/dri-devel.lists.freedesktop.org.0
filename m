Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68927A844
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE8F6E41A;
	Mon, 28 Sep 2020 07:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8806EDB4
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 07:41:17 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 34so4308277pgo.13
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=OaqWuxy2M9eImPpuAf5glJGxxD92OtFncd8r97AgYM4=;
 b=O0dm9hMEqc1vEs0A9s9u8sPtT4XYPZ+egumnSlp7wUZCtw2BJSRbP/BmWpow8IJPxL
 Xr4GAJvwYtoZjZdrGgwyAlfx6tFy5hmlmjfsBeeKYS9zlsvk3uFiD3LvQqHc/Uy+OV6p
 nQ0seqgfAIQ5iuHLtYk83rKNW9diUkuC+45Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=OaqWuxy2M9eImPpuAf5glJGxxD92OtFncd8r97AgYM4=;
 b=BTOveoGjJAmcjEtBbDcVVuvg/BzKHF2spUl/L/ZwBQrrPJIV7c8sOg9ed8ICZNzTlK
 GUO7sybIIyyX1aPYkhp06XvpJue6idpEcyK9KrQxjWerveAmDoQ/I2PTeLre5OZYO7Of
 zsDb5Zija4EcQDsSXL3aSuU3p9mQX6Kot6Ajc3NAIBTKaWKOCcTDyVrtxkqTibqXOYQC
 OZPWuBTaqASF4xEqChMwjEkkyRYpqvSrPI+e/Q9f6MvbfrOB6ykM7l6mrs42T6qa2mPI
 IENqg2LWJpv9I388MHc+n8w3/LBTA/epca4MNx1tUgdOw8QxbUUfJDre3Iy7rY5gCRGz
 UMSQ==
X-Gm-Message-State: AOAM533QeieHjuvvbDso9lXyr6+u+HtchbEkj2AyD9bcCoBJiFMl1SiD
 zw9+QqAPtYh05eXQBd+8MMwE2g==
X-Google-Smtp-Source: ABdhPJzEAKDRyk+rvxA2q8CkeH8Jl0KDYYDLphxH3dmvJ35XQzgM6LZvJ3fC1/ASAZVYwNv2FOMcew==
X-Received: by 2002:a63:490d:: with SMTP id w13mr2027849pga.24.1601106077143; 
 Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id m188sm4836662pfd.56.2020.09.26.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 00:41:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200926025512.15145-1-abhinavk@codeaurora.org>
References: <20200926025512.15145-1-abhinavk@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: fix incorrect function prototype of
 dp_debug_get()
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Sat, 26 Sep 2020 00:41:15 -0700
Message-ID: <160110607539.310579.6954031617378004352@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-09-25 19:55:12)
> Fix the incorrect function prototype for dp_debug_get()
> in the dp_debug module to address compilation warning.
> Also add prototype for msm_dp_debugfs_init() for fixing compilation
> issue with other defconfigs.
> 
> changes in v2:
>         - add prototype for msm_dp_debugfs_init()
> 
> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
