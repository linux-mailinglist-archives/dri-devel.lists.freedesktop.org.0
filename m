Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C372DFC6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A3B891B8;
	Tue, 13 Jun 2023 10:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F00B891B8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:39:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f8d5262dc8so1548345e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686652757; x=1689244757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xaDlJQeO3hH2pBiVZb8UiGCEOJUjl7lCHpBv/xucTak=;
 b=cpvNcFVPA6aGsusVPFb6hFFXQz+6VU2R47CMwhknwlsvy7rIY6Rk+tMn02L9wADk4J
 dtcDrAclhTphN3RmE89KGiy/Z0axMKS5LBRKNXku1MLQ6GEU9yGjd+kU+if4mdozIid7
 52AGaYdCsHmOUPFAhE1ldVMtIhfVu3VgCnQO0zPgDEVuiNZam0DkOX5JJILPJdtaOQQd
 j6O33lazYUT02LUBC2KJRy1LUMNEol9eEIRGr2MH6aIBMLahrL3J0XAhnLlEajROAVRs
 VB2tNLcH6Wm68U77Q1nN6s95j5W4YLQKkXWY0s1kDZ4kiRiqlMbOhAFVrzm/9SIUz7l3
 JZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652757; x=1689244757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaDlJQeO3hH2pBiVZb8UiGCEOJUjl7lCHpBv/xucTak=;
 b=LvU4TiU/uG6MPKkWvTtVJPcs0kKfjig6/KmX/IeOTVckjm+DxEug4CbDgyZJVIxVHZ
 MG4BdcXzHV85Pf31Y581NTnyHuvdLKvowJVgFnrDOPrAgWh8qtE+USyo8tuR4BPEXOfH
 ZTW7In3pWS5Ceek+Ku2LYW3UYKtNVYUwvFLILB3JlGSuiA0SK/dDCdcL+Il4H3PIcUeB
 KobyiLt/n1hY/b9RK+YXRgWatZbQuUpV07OosWhiPSsVhNeVsIe52bTC5jQ8A5z4Hwwh
 kAt0w3k2Y39LDLji3Rj7OKkggmgFYnEq6HcFG5EspETUQBuiplq5SpCPE+rPuHJJ2xOf
 b/tA==
X-Gm-Message-State: AC+VfDwm09p980KyFZ6yBP/LBLffNpUDAP39h4dcSCkU6pVY/Xz105hP
 9H2CGf2cefvxNs06hlqwtQLFrg==
X-Google-Smtp-Source: ACHHUZ5HyOHzcbog/cShZpBLWaDR0+w362TXtcaS+8aBiQA9iPPqkCG+m8GPuzzU6GS2TikA9g34VA==
X-Received: by 2002:a05:600c:518d:b0:3f8:643:182d with SMTP id
 fa13-20020a05600c518d00b003f80643182dmr9843519wmb.16.1686652757444; 
 Tue, 13 Jun 2023 03:39:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb51000000b00307bc4e39e5sm14976537wrs.117.2023.06.13.03.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:39:17 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:39:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/38] backlight/gpio_backlight: Rename field 'fbdev'
 to 'dev'
Message-ID: <20230613103915.GD169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-5-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 michael.j.ruhl@intel.com, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:42PM +0200, Thomas Zimmermann wrote:
> Rename the field 'fbdev' in struct gpio_backlight_platform_data and
> struct gpio_backlight to 'dev', as they store pointers to the Linux
> platform device; not the fbdev device. Makes the code easier to
> understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
