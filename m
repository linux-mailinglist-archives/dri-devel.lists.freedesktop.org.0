Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9496D055
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2D10E6A3;
	Thu,  5 Sep 2024 07:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A70C10E6A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:25:44 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2057835395aso4427965ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 00:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725521144; x=1726125944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWF3d5CZAE6FQa8cQgLDyunLL5+EiNEmxwaWt34sNTY=;
 b=PxcdvnIBLLbxuXZtotAfs8pc4sIWs94czH+GfLiKAk994kSqe/tLaIPP5yg2jZgzP8
 gbWm9T1iioLt/1wWQ9IlJNGN/dIX1NdRJM/nPsHoXnUE1FQYwrgJI9sJv++BpXp2Ehpj
 jlXP5Un/B1v6cU6Nc3QT+XntxCql4sOxF6ANYdQrNC1c2EBDBHN/xazHsbYKRSGaIaPF
 Qa2kndoRL5cEwmCsMF37ZCxbh61x1YWH8pwik4PZ2iLSnR1K4AGJSjNcbtzCBdbfcTKp
 4WWRZ5MhMAzEEE2+3Rf5yXucbcyP4Lt2bSXXUwUeFndf73wSUnEskGzl9+SfS1iAGpJs
 /jlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY2pgMA9QAfO3RNciOUbz30oeLIQheEmGGLLdjLpVTKXK96Qt4InGlrF9fZJVGBvjy1ewtol5iIjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIN1OIuqQg1/IJx4wj0oHtW2XBtq1KPDQdNQpZzS16Gwlj3dXf
 q16m+CEThvG0GqC45xZEWUMV+mR8c0Wk6ULJYzyHsO7e4mXR3Ur4
X-Google-Smtp-Source: AGHT+IFMnOvpW82/5MfGgSUynTFsXrs4aTyyIzgK4cEezwML2xWL6vrWpxzCX6SNUHQHvPrWg6EbMw==
X-Received: by 2002:a17:903:1245:b0:1fc:6c23:8a3b with SMTP id
 d9443c01a7336-2050c354a4bmr257050595ad.17.1725521143483; 
 Thu, 05 Sep 2024 00:25:43 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea67c98sm23282035ad.252.2024.09.05.00.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 00:25:43 -0700 (PDT)
Date: Thu, 5 Sep 2024 07:25:27 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, deller@gmx.de, gpiccoli@igalia.com,
 mikelley@microsoft.com, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/hyperv_fb: Convert comma to semicolon
Message-ID: <Ztlc52c6fIz3azbn@liuwe-devbox-debian-v2>
References: <20240902074402.3824431-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902074402.3824431-1-nichen@iscas.ac.cn>
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

On Mon, Sep 02, 2024 at 03:44:02PM +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: d786e00d19f9 ("drivers: hv, hyperv_fb: Untangle and refactor Hyper-V panic notifiers")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Applied to hyperv-fixes, thanks!

> ---
>  drivers/video/fbdev/hyperv_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 8fdccf033b2d..7fdb5edd7e2e 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1189,7 +1189,7 @@ static int hvfb_probe(struct hv_device *hdev,
>  	 * which is almost at the end of list, with priority = INT_MIN + 1.
>  	 */
>  	par->hvfb_panic_nb.notifier_call = hvfb_on_panic;
> -	par->hvfb_panic_nb.priority = INT_MIN + 10,
> +	par->hvfb_panic_nb.priority = INT_MIN + 10;
>  	atomic_notifier_chain_register(&panic_notifier_list,
>  				       &par->hvfb_panic_nb);
>  
> -- 
> 2.25.1
> 
