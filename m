Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2B4B6F9A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AA110E438;
	Tue, 15 Feb 2022 15:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393BB10E438
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:16:39 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so23460754ooq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1ts+DysZBP3Fk9YvZ0HkFKUTlIrINUUB+qMVi+XB4xg=;
 b=ElJfexzG+s95N7RLESkvdDA0n8ZKZ8AXW7mszPN/VbW7YxdYaXwiLdi+X02TZJ2auL
 dO4zAtvAdBA0QyGCZv8HXijxnfmMQki9AklqFffIJxHJudkIMJ5MzrnhdInWp36503v4
 dblADlPE5En0kiHKxwTlKzeDSAMum4ZNHSSx27vgCaj2W+Xg97fo78VZl9T32RdFqbLl
 OB5ipmu5NA+d/PzTB1vpaY7yISkO/cNzmecvey2C6kH/tZ/Ge0t04ODAldv1RR65o6Vq
 tlE8fho5wOicehOlI3NLKqEKp99HHj13NWPx75LLArY59rLYgimAu5DLwXnB+9xFU6Rj
 uT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1ts+DysZBP3Fk9YvZ0HkFKUTlIrINUUB+qMVi+XB4xg=;
 b=owlHFNHKkLAojTd9XaJ+prHD7yaSGc1Ak8HYTOlWXUXb/Lb1HcIXLza7BJRUvgnzlE
 cOQBbmVHvCYzbeu0S8NompXG4HWSFWHgtug6kIAq/W1e9TZY0oxEm0r9ydm2KQTteBUH
 FpjsZjM9D53hLr+vVvfryeF6EK9PKZFuAefeum9tVcqP7MnfU23aOScK1rTw2ARfHSrR
 YAfA+rA8J5RpRiDNup6tbg4gdPWc42zUzyVUX5v4QvrQnhRM4abQ+pjJPMfURtvsTdI9
 U/sZXHMXGsxq0foSnawAxORRUeInf6fCe7PpcktmE6JTU9c2hGSCku6WDDN2RossOlik
 IUBQ==
X-Gm-Message-State: AOAM531nuFhc6AjT59G5ETkHO37P7iUChIq6rluB8JZfX0upm18xzldQ
 EPOvlzle5iUU5qoqndDyENra1g==
X-Google-Smtp-Source: ABdhPJwJfcwzqWijJtAs5kf1G4teVCQGSMOsW6WhptZhd7xMf9U1KQ0Qy7qSAZ1tX3OK5oGg/XkF1w==
X-Received: by 2002:a4a:d622:: with SMTP id n2mr1391443oon.19.1644938198461;
 Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id f16sm3086611oae.6.2022.02.15.07.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:16:37 -0800 (PST)
Date: Tue, 15 Feb 2022 09:16:35 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: drop unused access macros
Message-ID: <YgvD08auVa5Pbpgm@yoga>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:53 CST 2022, Dmitry Baryshkov wrote:

> The access macros BLK_foo are not used by the code, drop them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index cac0298aeb52..975ff3a4ae3d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -778,22 +778,6 @@ struct dpu_mdss_cfg {
>  	unsigned long mdss_irqs;
>  };
>  
> -/*
> - * Access Macros
> - */
> -#define BLK_MDP(s) ((s)->mdp)
> -#define BLK_CTL(s) ((s)->ctl)
> -#define BLK_VIG(s) ((s)->vig)
> -#define BLK_RGB(s) ((s)->rgb)
> -#define BLK_DMA(s) ((s)->dma)
> -#define BLK_CURSOR(s) ((s)->cursor)
> -#define BLK_MIXER(s) ((s)->mixer)
> -#define BLK_PINGPONG(s) ((s)->pingpong)
> -#define BLK_INTF(s) ((s)->intf)
> -#define BLK_AD(s) ((s)->ad)
> -#define BLK_DSPP(s) ((s)->dspp)
> -#define BLK_MERGE3d(s) ((s)->merge_3d)
> -
>  /**
>   * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
>   * hardcoded target specific catalog information in config structure
> -- 
> 2.34.1
> 
