Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112772DFCE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C4110E35A;
	Tue, 13 Jun 2023 10:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD010E35A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:39:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30fa23e106bso2764990f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686652779; x=1689244779;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L+0q/8B3X2O+bLieXF8c9g+8ohNwELNU1kRNH19cJQQ=;
 b=mp5t8BFsJLvB4B2RBPo6x6uNyPCi8jDPJJpT5/LpidCyzOQv4FCXKrMWr1ZoGeWb2S
 1dBOQjE7wNbB2/NIq8xC5IgXRwNRGlVnZW3Z4RXFfWXN3WDAjIuuNAySekfhnk34w5wO
 NzDIjtTF8SXSuX25qLMn3huo8p/83/zQMv/5E4FEAXUWYyMCx8Mo+LAzcn9buVVIEf25
 xq6WyCppmw0R4kg6OL44jDGiDE0u+RRVrPQ0ZksXnqIcz16sfbXTylvjE97DH2Pg1vn+
 u4HS9GU54OKGBiesVcpBbKbzyQtzvsmO+sXxWBrgzd+eRZlTzu8i2amAs2BDVfmzc8Gh
 L22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652779; x=1689244779;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+0q/8B3X2O+bLieXF8c9g+8ohNwELNU1kRNH19cJQQ=;
 b=kqdjzPIfURuZ+6VDiYO8KSpsPpGkzLjYYRsjs55jEQbzCDHeWy+vNCZUrsw0a5vOLU
 MgjhalvOhzjJuYo4h4ONpMCdqerm0a2KVaRcs2qagjI8KykXYM7GZlyXFyhgRhTN5MG/
 YPgB8aXTDARUPhpgcjpMt29QdSVIgwdjtWjcfIpKSQh5EXQK4BtebfbnKV0cb/bPx+JB
 LFbW31ky2O6IEdltMKEiYxDSduDYSFpg/r3et46u2Ea/T1D0m2S4gAIxPJz4UOaJs/e+
 9yX+tz5IwONZ9v6jalLUKoLszV94TThHNL2rMvYh0T7/RGt5gZVo/cBZou3SwDTL+Lyy
 QEug==
X-Gm-Message-State: AC+VfDzRXPzU0QrnAA2byLTMYDejkj8vluRi3XdT/esC0yaYQ3WJVqHm
 vd3W80AdVvJEukVFAybUtWfDNA==
X-Google-Smtp-Source: ACHHUZ4QXHWcQ+EF1TxBMcwYsV+sIp0eKcDzBEmcY5jt8MfrsM/QF7URk3vwRqxNRqLqrU6BbwKwDg==
X-Received: by 2002:a5d:508a:0:b0:30f:caf6:5bde with SMTP id
 a10-20020a5d508a000000b0030fcaf65bdemr1780025wrt.32.1686652779043; 
 Tue, 13 Jun 2023 03:39:39 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5482000000b0030fbc96bdffsm7123579wrv.25.2023.06.13.03.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:39:38 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:39:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 05/38] backlight/lv5207lp: Compare against struct
 fb_info.device
Message-ID: <20230613103936.GE169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-6-tzimmermann@suse.de>
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
 Yoshinori Sato <ysato@users.sourceforge.jp>, geert+renesas@glider.be,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>,
 michael.j.ruhl@intel.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 stable@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:43PM +0200, Thomas Zimmermann wrote:
> Struct lv5207lp_platform_data refers to a platform device within
> the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
>
> Fixes: 82e5c40d88f9 ("backlight: Add Sanyo LV5207LP backlight driver")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.12+
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
