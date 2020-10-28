Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90129CED2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3596EC41;
	Wed, 28 Oct 2020 08:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B796E47E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 06:06:16 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 10so2307510pfp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 23:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9EPUQ9ajfJzWj+hnvbYTUCoABm2jCaPKDMKTD4VLJ+o=;
 b=FXluIHWspusLqK/Kg/uNQGa3Bqh2HOqioMgW1IjaXnh/FVi2SHaED4wWlJqfymNCjv
 RCWtKoRJo73Ynh6NZ9t3K4I8FQPZpNfwelkrIsVMCGwuqw6GNB3hBI1+bqZB6jEcvlci
 0HQawnOCc1YGigoQk/GhqbQOqZxZ92Ktw9J7Cy55LUugsDre4quH3JYisIqgPn2iOL1E
 bjckKD+vobH+WAuFwQrfBYjXE/cVNAdPKcgxiR+EM2T4ROMHT7SXbmfqQmn2bMQ1/jrR
 oqhMtpoaH6wzA3odYkft7wgHgGBOlQNjbCkdKVz+0aa6JCZ0GmMyXiC/Khl65EWIPbpU
 CPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9EPUQ9ajfJzWj+hnvbYTUCoABm2jCaPKDMKTD4VLJ+o=;
 b=UXJqGpTM207WNU9ydXe82gmTvUHw0DwHkBSritXA2542H42UTS6f06amEcEJnv3e6p
 pD977ZlMJhuEvVHi5J6/oMedKjlYR3RHhxwCmsQX3igntaEc0eiH8xILXne65UNIMMpe
 JtAtD+G0HsOwDHCs+KwS0SAmXp3fHZ1j4gxr1OrE1DN4sAqcx9bNlHc2JgrqM4gvl9X9
 7l1FLz9BuReumT6JyBIyCe9pcgTmUVw/IWEBmKtt4fkjGj5TKOjdFO53C5ilQmvD8fG+
 t2U+AFe7LnibplB3+v1FBJ2uly/TNNVTUGSePAb+if+iPbSjEZicSstpM1ko8NoUjjrh
 QBDw==
X-Gm-Message-State: AOAM532NtVYcfV5MQjSW5Hm0PiznFoZFfSgH4uf5qpdlgXvsteAQhG/e
 Gy4DL/91kuc+Fd95ahhD9fVBMQ==
X-Google-Smtp-Source: ABdhPJyab+BLUolrAaQS6Z5bkxxLTZ0qmvvT/57deuMD2GISr2XjIBTS9myTIcIcl7KRpP8uHevBhA==
X-Received: by 2002:a63:c851:: with SMTP id l17mr4887683pgi.31.1603865176097; 
 Tue, 27 Oct 2020 23:06:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 23sm3988680pgr.53.2020.10.27.23.06.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:06:15 -0700 (PDT)
Date: Wed, 28 Oct 2020 11:36:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <frank@allwinnertech.com>
Subject: Re: [PATCH 0/3] Introduce devm_pm_opp_set_* API
Message-ID: <20201028060613.qva32sirae4dtj6x@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-1-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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

On 12-10-20, 21:55, Frank Lee wrote:
> Hi, this patchset introduce devm_pm_opp_set_prop_name() and
> devm_pm_opp_set_supported_hw().
> 
> Yangtao Li (3):
>   opp: Add devres wrapper for dev_pm_opp_set_supported_hw
>   opp: Add devres wrapper for dev_pm_opp_set_prop_name
>   drm/msm: Convert to devm_pm_opp_set_supported_hw
> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 +-
>  drivers/opp/core.c                    | 80 +++++++++++++++++++++++++++
>  include/linux/pm_opp.h                | 14 +++++
>  3 files changed, 95 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
