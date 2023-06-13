Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59872DFD6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122B10E35C;
	Tue, 13 Jun 2023 10:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A5510E35C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:40:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so6522050e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686652820; x=1689244820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RdczPZ7i6NweZc4Vs1GEhNBw4P6SDuu4rOPlRce3Cp8=;
 b=AUbPJ07Z1odDHtCnZ823RkphdvcZ3F/p41LyifJZBZRycWLx87uEthbAheLUd9d4fw
 QvGkzgij5648YDEodj6ptRqC3+VUPZMSTPRxfifNBvFk5k/G8mO9kSrJUgsPUDjdDQf2
 kTU3N5IYasoX9y19jal1hK3/EAY3Gdp4ouqToLfnrCAWts9kY7jbGAedRlMQMqFpKqCy
 eb1lJENWNoO1+j3VwToC/V/8Akbn4QHdPdYSHoF7cFV/ajJMbhAiqrkPreFsPsLO2TV4
 MDumvPKSRlKZUoPI2Otf7G3PXB8R+eOO8N757C70cMrALim/UT87sS73D5gj3sewQNnL
 sDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652820; x=1689244820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdczPZ7i6NweZc4Vs1GEhNBw4P6SDuu4rOPlRce3Cp8=;
 b=fN2FA9jWBYk0DHrE7rtVcn+CCHJmqPnc/yAidWArZpo1aZKMmvzQaKiRjK3hlhfrBG
 Dp4TtIqANFZNIZ6EGjuzD6P5WKni3VlOsOJWXwwb8H6LIJmLb9ACAyF0UNWT/7bD4XLN
 aBLqLMnUGQ+h59XFchqzJGGCTJu3T9YLrX/UlGNFt7f4pcVeuMH0/6E5J50n1myAskre
 k5O7+GYXvUyq6f15cWPRAe9YHneSoTKLKU3dO1MW03CDFl8jc7D3XSWyfsttNvPfeP03
 MrvSecg0ExiWjXTL862H4Qm1saJub753aX2wjVwQhW25hFMvuFmwsVoIOKXEnftPe4Mj
 LzYg==
X-Gm-Message-State: AC+VfDz0wWC5+nzoROX93wz0bxf1vA5SKWBV33ebLBVtZFxRHx0gqlDA
 d3T5RxBC+bPp3cfybv0IMdxXww==
X-Google-Smtp-Source: ACHHUZ4WVznCWcsmGLMHRuA7VS6Lfj4mur40fa3EhFHuVyQQIFEL0bzMUHobk+R5es5R/aHSdgmKUw==
X-Received: by 2002:a19:6402:0:b0:4f6:2cd8:5ff4 with SMTP id
 y2-20020a196402000000b004f62cd85ff4mr5562119lfb.2.1686652820609; 
 Tue, 13 Jun 2023 03:40:20 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b0030fa166d8a1sm12458137wrx.34.2023.06.13.03.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:40:20 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:40:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/38] backlight/lv5207lp: Rename struct
 lv5207lp_platform_data.fbdev to 'dev'
Message-ID: <20230613104018.GF169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-7-tzimmermann@suse.de>
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
 linux-kernel@vger.kernel.org, michael.j.ruhl@intel.com,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:44PM +0200, Thomas Zimmermann wrote:
> Rename struct lv5207lp_platform_data.fbdev to 'dev', as it stores a
> pointer to the Linux platform device; not the fbdev device. Makes
> the code easier to understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
