Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C5B415B5F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8878E6E117;
	Thu, 23 Sep 2021 09:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C306E117
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 09:48:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t7so15310477wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6+eKVp8taoHSdR1ibPn1ZGg0knOd1Pb0ImjfZkR19aI=;
 b=GTnuaG2v8n/EfVqZaGG/LrTewIRWMm7WeWMV3j9m4TQfzK6B0a4MoXuq7vYMKR5sRe
 OhoSOfgq+MGSmZTFC4dvGYouByjVRmagaBS3cEfzpPL+bxGgJi88cjdg6u/Q8NdSHlnr
 TpmTZ8f9YvBm66pwkXvPEHOTo1NB6sQLvtvYiAGLUfBVIxL8WW+ScDnGVm6p0pMIKP9r
 IjZoQkoj9ZzeOJzbf75qrDRdryulrO0JYGBlK59x+4zuwE2eYvEVvBFRwLgVuVscci48
 Jto3AO2FZ9nqFAOzVOhfpYEIAnXDM00By37MSsbuC3c/36E4Y5BPxSno7NjlJkfb7C8+
 KtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6+eKVp8taoHSdR1ibPn1ZGg0knOd1Pb0ImjfZkR19aI=;
 b=LfJFPGpmJGe2TweJkXvM66r8t9OmzOB9NimOb7YNKukrQBYhvxUJHbaOb27po6TDF4
 v+XkYT/PKphihpVdyVFpV6PrUMCN5XdJfXuBfYM3x0KRpxfhrsEzWAwzXum+fqCG+Is0
 R+rMVSzppE0YKh+L0TLa5eqtbwX6rWwySdOiPDBrRTOeoYvkMONIHEiKK0QF1zoLhiND
 YNpSKq9SIL4GY7nXrqDj14UgtKQGmlMx1oGOrp4EiEneBx2Ow553EszDV2tG8szxGhuF
 2djK2pb42AMpHSa8wryDpVu3bUfHjAJSexJn37AOngv3qnClvaE90rcoHIgYz0KFJy9O
 U5XQ==
X-Gm-Message-State: AOAM532vMHwy9kOFNb5ci04FhEzQXHZmxaZ/tfInensseoqsPEa9rXaZ
 AITAovCT5oIv9LaxZekh3RgdfA==
X-Google-Smtp-Source: ABdhPJyibbde3vB1FCGt9d/JYvsj6NAS6zqNEXkWGRfCVwpJ0z2rvlY7kgpkBqqwzYJkFqg5Tz1gKg==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr3402523wmi.138.1632390517246; 
 Thu, 23 Sep 2021 02:48:37 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id g22sm7965648wmp.39.2021.09.23.02.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 02:48:36 -0700 (PDT)
Date: Thu, 23 Sep 2021 10:48:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: propagate errors from get_brightness()
Message-ID: <YUxNczBccLQeQGA5@google.com>
References: <20210907124751.6404-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907124751.6404-1-linux@weissschuh.net>
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

On Tue, 07 Sep 2021, Thomas Weißschuh wrote:

> backlight.h documents "struct backlight_ops->get_brightness()" to return
> a negative errno on failure.
> So far these errors have not been handled in the backlight core.
> This leads to negative values being exposed through sysfs although only
> positive values are documented to be reported.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> 
> v1: https://lore.kernel.org/dri-devel/20210906215525.15418-1-linux@weissschuh.net/
> 
> v1 -> v2:
> * use dev_err() instead of dev_warn() (Daniel Thompson)
> * Finish logging format string with newline (Daniel Thompson)
> * Log errno via dedicated error pointer format (Daniel Thompson)
> 
>  drivers/video/backlight/backlight.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
