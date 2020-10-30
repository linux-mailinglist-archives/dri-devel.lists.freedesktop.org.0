Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C42A207A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B83E6EB37;
	Sun,  1 Nov 2020 17:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E546EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 11:29:42 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z24so4966212pgk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4HxPaBB/T+MWPxFKC66xXUgQz4AK1HDV8G0JyKuoUvg=;
 b=t7vRuGsiD6S8SDyDNJjlcW3D8hieb4F/x0gVxEUf+xkByh3UB9sW2pw96lzzu3r+Sc
 V+SrFY6wvz08PUUrq6THVAwF+cugG5vc8oomA26kUp17NY6M2ckqjULm3B3ZkGJnktkO
 SIMxL5zOIB5J87De1aG/WYEx0UOwzgz/lZ+JL09V4ibwDp+FKjA4hn/ylfabNvovQlWC
 eJuwEMYWUjgJtSKqSYdH2kNNfOPHbBtkMmOBTEkdqAAvKGu7FfzI/ujLEq9tQG2cMMBW
 BzHzVflFIBIa+S2SEGutzMb6ivLVH372Vwk41qbEWa56/vLDj0vJfm4tH/NsJnGO/xeM
 2wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4HxPaBB/T+MWPxFKC66xXUgQz4AK1HDV8G0JyKuoUvg=;
 b=BZB72H/F/+3gLg2PNAvHHpZqcfbnAPnJoK2yTQDVPfhvX08Pt/Q51gqCHmPyl38GOH
 SuhEW6EVRlteUXv4R6Bj9QO1pa3dDDxFoBT58erDtV3E6P6h3XQ2B5YyP6tE4CYNfA4t
 mma2BK6BEaK3eMiaB5nZk13KiUWcTzz1sbyloAzq1XzcWWgCziIShP0KTy3Ur2kuVGjs
 IhuZ9m5AfM8Zv76rvge+KpwDPd72ZymriaeRv07c8f7udWdaW3Nd6au7S+ZYYi7sB2Js
 uqaAquHsuygZ3sGckfNCbT95AvupWfxxWCTD/GBeu/clb58EP7PPEWtSocLGKm2emu+t
 +vbA==
X-Gm-Message-State: AOAM533um6byfDzCosexKTA4no0rt8oL7c8GTtDOIDjjjVDi1CCHD8UB
 e7vnzMtJ9AwCRJPkB6PnrrgunQ==
X-Google-Smtp-Source: ABdhPJxY5sNazMK40l9kvzCEB3G/fXCnzLJIOMT7lDEBOFXgft5gwM3ZPlv3KogMw+kWQKDSe2XldQ==
X-Received: by 2002:a17:90b:3587:: with SMTP id
 mm7mr2453563pjb.234.1604057381701; 
 Fri, 30 Oct 2020 04:29:41 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 189sm5632707pfw.215.2020.10.30.04.29.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Oct 2020 04:29:40 -0700 (PDT)
Date: Fri, 30 Oct 2020 16:59:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <frank@allwinnertech.com>
Subject: Re: [PATCH 0/3] Introduce devm_pm_opp_set_* API
Message-ID: <20201030112938.uyqjvyfuklwjnmvc@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201028060613.qva32sirae4dtj6x@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028060613.qva32sirae4dtj6x@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: nm@ti.com, freedreno@lists.freedesktop.org, airlied@linux.ie,
 vireshk@kernel.org, tiny.windzz@gmail.com, linux-pm@vger.kernel.org,
 rjw@rjwysocki.net, dri-devel@lists.freedesktop.org, gustavoars@kernel.org,
 sboyd@kernel.org, linux-arm-msm@vger.kernel.org, kholk11@gmail.com,
 sean@poorly.run, linux-kernel@vger.kernel.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-10-20, 11:36, Viresh Kumar wrote:
> On 12-10-20, 21:55, Frank Lee wrote:
> > Hi, this patchset introduce devm_pm_opp_set_prop_name() and
> > devm_pm_opp_set_supported_hw().
> > 
> > Yangtao Li (3):
> >   opp: Add devres wrapper for dev_pm_opp_set_supported_hw
> >   opp: Add devres wrapper for dev_pm_opp_set_prop_name
> >   drm/msm: Convert to devm_pm_opp_set_supported_hw
> > 
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 +-
> >  drivers/opp/core.c                    | 80 +++++++++++++++++++++++++++
> >  include/linux/pm_opp.h                | 14 +++++
> >  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> Applied. Thanks.

And I have dropped all of them based on the discussion we are having.
Thanks.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
