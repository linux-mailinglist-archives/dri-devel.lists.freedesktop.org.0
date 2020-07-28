Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E892231548
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 00:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A646E2E1;
	Tue, 28 Jul 2020 22:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1D6E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:02:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so19695563wrh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vqnKMLXqTkEdIlwdpguJGd/nIpB4YeuwS5l62z63FMw=;
 b=NDCu7QgcAq7+TW7f+5/b58wRYuFOxNU7md4Tk+HGctDkj+yK8BZE5ZExbD/h1lASPV
 hFurpdD9fO1Rj8h0Qbz33aWC27fLh7LVJNdqfbAJo6RTpRnc+FDhdre6+7FNB3lCsHjd
 cdLJ4W2jhZqC3T9bPV1wJPOW01YhcQvP8NgJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vqnKMLXqTkEdIlwdpguJGd/nIpB4YeuwS5l62z63FMw=;
 b=GSSrVbsRU4Bv+0pszCWWIdhDv0FwdKkvQyKXLoAbGwGGctm9OkocOZ0Hn9kbUhO2Rv
 mYVGonRFLfoZwhewR+vf3BQvm4edFBRMbdeLb+1TnRQdEc1ZY1oqEupLnaf4Dxn08S5n
 TwxqvC9T5ZS0CMKHEAR8/smahDBVxdFXbzdCRD1NvtCG6aXJmeBL6tBa4tfa3KIw52Vy
 ziQ0hlkNTIKLfnUj2X11B6uoBXiIJBjWDnbp3UUyTP3J6RG+tg4ywzJT9V9ZS3LZDUNq
 VuI3E0ykIFLtehWrwQScFnNjzPOb7+1TyGm4bJ56cC+VvO84LhieheOsJLIn6p8y6iFd
 MgaQ==
X-Gm-Message-State: AOAM532vu5uQZM9oryJKurqaxZ4BvWH3xUJrxz7zMLYj9KpOxDhciYIA
 nNff+eu9RarYE/syjMU7h0hx0g==
X-Google-Smtp-Source: ABdhPJxRQsWjsGbojKh939WX9+AjyfoL6oRNBjWQkv5BgfV9n7qdpTPTlymdET8fHHeG8IvyVPgXZg==
X-Received: by 2002:adf:de09:: with SMTP id b9mr14191027wrm.409.1595973728531; 
 Tue, 28 Jul 2020 15:02:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u1sm364997wrb.78.2020.07.28.15.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:02:07 -0700 (PDT)
Date: Wed, 29 Jul 2020 00:02:05 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-ID: <20200728220205.GJ6419@phenom.ffwll.local>
Mail-Followup-To: Wei Yongjun <weiyongjun1@huawei.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
 Hulk Robot <hulkci@huawei.com>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725063429.172139-1-weiyongjun1@huawei.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hyun Kwon,

Are you all sorted with drm-misc commit rights so you can push the 3
(maybe there's more) xlnx fixup patches to drm-misc-next-fixes?

Cheers, Daniel

On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> Fix typo in parameter description.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 821f7a71e182..3d53638ab15e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
>   */
>  static uint zynqmp_dp_power_on_delay_ms = 4;
>  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
>  
>  /* Link configuration registers */
>  #define ZYNQMP_DP_LINK_BW_SET				0x0
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
