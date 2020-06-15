Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756C1F95C7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 13:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7010D89D7B;
	Mon, 15 Jun 2020 11:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CD089D7B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 11:59:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l26so14350099wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=719ofHTBd/I2peVm9y0TOXJ46xOp3IsPklsZWOMX6Ng=;
 b=iQBqKtaoUb41/1QY2TLxDwAHEYBfZFCmUjMJQZNtmyGtBWUuVy3F9B3Cb53/As2kCn
 w8LdlOL2O7nmWriJ5O52ZkFQWhXTih9egKBCn/xHrpYHpcMwRXAmY1rb0h0q8qkkLVy8
 l1hJI4uEkDi5fbiDRHv7GwLQoSuyV2VfrEKB5ECTpgKJ1vJkmNlS/3VhLzU8MxubHF4F
 BQTOkJUde9IQlvtRqmh20dLAoV7EggqCEgH6ZkKCUXk0eg7wCnG7EY3a45NjaenaikM4
 iZIp57nDyyGIKuzpt7FgqqJFZD+WUhJQVW3RyKUErLV5ev8TLcZuj1knLd+sP5bVIDIV
 8TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=719ofHTBd/I2peVm9y0TOXJ46xOp3IsPklsZWOMX6Ng=;
 b=NcNQuAFOukA1s3TKGWwpoPuJhBcj25e5edIzfnKprK9mHTj9AiOYf55Gna1rHOhnPO
 7po95v0p91Vxm83kQVxfDb1xyA1pDpnkeihXhNsTV/0cefsCFEqWjpLs1+Dr1aMXeFIr
 yDzt8z0aJQACJiQrjWdk3ZrQR/Jn1GbLoDcl/UEysVkwvXaHTDo5cDWSnCtI1969dBlx
 WBbEuYuQbKzG2NIYEYJsqX3mQ8PlJhmr9jFvinxYXDYb5h/CLORL/hqwh9AdcZrwjBZ4
 FPEJ6UQS68UwqsY4CQkOHrznlVam/ol6ou5wfJx6J138q+DDnpzJ2H3Ng3RJ58Ehqott
 3VMg==
X-Gm-Message-State: AOAM5337s8f8QGs0Gttd9wGnki4W7a0cpJt0GpeKqFi5ItOWWq2jB6Aa
 dFm7uxGgePfcBWFq6QkTkvsPMg==
X-Google-Smtp-Source: ABdhPJyMY/n1roSv+cYCo9nXkUw2jY0Aaoq25AgVCDcB5q2EJWWPzPzjrsggEnRh23lqIWvByW/4gA==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr12617874wmi.119.1592222379015; 
 Mon, 15 Jun 2020 04:59:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q5sm24022703wrm.62.2020.06.15.04.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 04:59:38 -0700 (PDT)
Date: Mon, 15 Jun 2020 12:59:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] drivers/video/backlight: Use kobj_to_dev() instead
Message-ID: <20200615115936.37pwp7cgmhznnyo4@holly.lan>
References: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 04:54:02PM +0800, Wang Qing wrote:
> Use kobj_to_dev() instead of container_of()
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/lm3533_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 => 100755 drivers/video/backlight/lm3533_bl.c
> 
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index ee09d1b..0c7830f
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -235,7 +235,7 @@ static struct attribute *lm3533_bl_attributes[] = {
>  static umode_t lm3533_bl_attr_is_visible(struct kobject *kobj,
>  					     struct attribute *attr, int n)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct lm3533_bl *bl = dev_get_drvdata(dev);
>  	umode_t mode = attr->mode;
>  
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
