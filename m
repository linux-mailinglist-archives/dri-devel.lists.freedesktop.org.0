Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2206A2742C9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 15:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5136E864;
	Tue, 22 Sep 2020 13:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15156E864
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:19:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so17027295wrs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9GewOd7ipMCxF1aHwWxW4PsJZfwIrEIh8kBMz05Lk/w=;
 b=PzjE8iv+J3iIp+Oj4o3PfIPMtV8nUR7EAaBbIYDmYOpwjFlmejWWdMfF61ABZKnIML
 96KhiUwPwUKgo5Qo3t6TfKg5SFqQBL59u7bTjgQQv4SkvNWOxHUNtCDNQK+w8W1FHwKc
 P9m7bN1PVj3l46dRCfH2kjE28+5MztTu3wmxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9GewOd7ipMCxF1aHwWxW4PsJZfwIrEIh8kBMz05Lk/w=;
 b=dO+q285JgKbsPPT1xyXNeonzGJ7lNZvMIsjByBR6ArMn9D1eF+I0MEZVtEmin1u42y
 AiKdFbz4d1l8XcbSP0KP9cmW3tb+O2lokvAzMPWjCGH3aKunV7xrX7RPPhpZMefgI25q
 MnomgT4cFhN48915ftZRumX/505hn+ZRyJ7xczcQrTEuouhws8LgSqvfjrRMwIjg0WZy
 wsz3zr2yAnU3Y8sULq1jGkeOlHSstOQFsMxTBOkRVb4KvuHA8sMJxCMB4rbLH6hoMblT
 PzpPCuKBUGqC4Qy72FZs2e0KVoIMb6zm//Qkm8mfgPuha3rTbfNC73kb/5Ya4MtgQe90
 aGjQ==
X-Gm-Message-State: AOAM532p8mOW444PkKjrl+1sbM35ON1ugQCEG5qfH+PJZCqMMBFJBKvQ
 yVy1K8jt5/ipLSqDJlHtZh4jIw==
X-Google-Smtp-Source: ABdhPJzk2cI1GO9aUXv3aroOKwskrl9jpqIgCYu3y/tFOrzYAI88vNvGrwji8l2K4v5ufLKV4CXjgA==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr5457066wrn.109.1600780759566; 
 Tue, 22 Sep 2020 06:19:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y5sm26160278wrh.6.2020.09.22.06.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 06:19:18 -0700 (PDT)
Date: Tue, 22 Sep 2020 15:19:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/gma500: clean up indentation issues
Message-ID: <20200922131916.GM438822@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200920141407.32672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200920141407.32672-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 20, 2020 at 03:14:07PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of statements that are indented too deeply,
> remove the extraneous tabs and also an empty line.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 720a767118c9..50016a754172 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1501,8 +1501,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
>  	clock_recovery = false;
>  
>  	DRM_DEBUG_KMS("Start train\n");
> -		reg = DP | DP_LINK_TRAIN_PAT_1;
> -
> +	reg = DP | DP_LINK_TRAIN_PAT_1;
>  
>  	for (;;) {
>  		/* Use intel_dp->train_set[0] to set the voltage and pre emphasis values */
> @@ -1575,7 +1574,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
>  	cr_tries = 0;
>  
>  	DRM_DEBUG_KMS("\n");
> -		reg = DP | DP_LINK_TRAIN_PAT_2;
> +	reg = DP | DP_LINK_TRAIN_PAT_2;
>  
>  	for (;;) {
>  
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
