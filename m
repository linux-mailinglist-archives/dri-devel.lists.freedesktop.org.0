Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC33263CB1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 07:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257DD89FCC;
	Thu, 10 Sep 2020 05:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947A789FCC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 05:46:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t10so5277461wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 22:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jp2JllZ5gaf/wkDbAJ0Fr7A6PIndQVfBIPe4O0e7aWQ=;
 b=IjxROTk3yBSkUFi3Qm0cueZsu6bNbsw02v2rGAaZfItp6ro+Gr9Ax7eXULiCZGwIC9
 RdRHtp9sEwZPS/+GFvKwxv5wg1Qwab1jmPJtwv1wQmjjHRZWfEafx5T1NZ6Eqxq4M+GF
 VWJ45O2Nn+YMUvaIjeqB+Mi9SLXueqyPhziH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Jp2JllZ5gaf/wkDbAJ0Fr7A6PIndQVfBIPe4O0e7aWQ=;
 b=CxA0kokcqz6dHlwUpRzE6II5rHdptgWFhPW493Y32eir2i678YyREzoZCU/Iw3vAVR
 r8fuwgmNjgNayxxULohIcz1lCHuh8cWcrJvr32fTQslifuqoN5pCoWhxTmE2rF/F972k
 uXjbThXSQcstg0MExHZNm0gT2taKgm+4/ttymp/UvaECtwSwPkHN0oDULN57HAx/qolv
 hY//ZDNEF1zrqp3WEvDOG4ji5Ebd9eHRJTn4UXEo/wTB0w47zJOLuNZTFhXwXYLNg/o/
 IKfpnw9KI7wvtWOh4HSUdpmtatXzIPLMmmrRYJFyDt8sxGzP2mivAvxAOSaAfpSX+AiN
 G8Mw==
X-Gm-Message-State: AOAM533wik+6ezg5gYPrhT/y67hautRO3OJpDthxXBINHrtS9mQd3/BH
 aPXqNnvdX2saymOUnilTrx+TGA==
X-Google-Smtp-Source: ABdhPJxWZBT5PzZVON187FsRsdEM7wN/MV5G/4fNZ4dEwEeOo5whxFhnyb5pPRwNvLZZgKmgCRfIJA==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr7860060wrq.204.1599716798216; 
 Wed, 09 Sep 2020 22:46:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u66sm2697658wme.1.2020.09.09.22.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:46:37 -0700 (PDT)
Date: Thu, 10 Sep 2020 07:46:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [PATCH -next] drm/bridge/tc358775: Remove unneeded semicolon
Message-ID: <20200910054631.GB438822@phenom.ffwll.local>
Mail-Followup-To: Zheng Bin <zhengbin13@huawei.com>, a.hajda@samsung.com,
 narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.co,
 jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
References: <20200909121900.103712-1-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909121900.103712-1-zhengbin13@huawei.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 yi.zhang@huawei.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.co
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 09, 2020 at 08:19:00PM +0800, Zheng Bin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/bridge/tc358775.c:488:2-3: Unneeded semicolon
> 
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>

Queued for 5.10, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index d951cdc58297..2272adcc5b4a 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -485,7 +485,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>  		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
>  	} else {
>  		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
> -	};
> +	}
>  	d2l_write(tc->i2c, LVCFG, val);
>  }
> 
> --
> 2.26.0.106.g9fadedd
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
