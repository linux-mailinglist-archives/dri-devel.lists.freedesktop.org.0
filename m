Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E28D2185E3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 13:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6BB6E1D2;
	Wed,  8 Jul 2020 11:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401D26E1D2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 11:17:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so2496482wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H/94gV2OrS1bi9DuK0dvzVPneLIcPLtL1oVf8zR732Y=;
 b=xwgUDhxwt2KM2ltnynRTtK4s26Z+Dzc6vQJoqYm+yLz5udjs/XU0Ca09sOyyHt3uyd
 h9+hshKFErad+yztXINMKdnqPYvx4tzk7w1PvzHKNjo9fs+bOs+ebbqALO4QvLIFtaMy
 AMYI6HGOaDx6vx7pnk8hGpNpXjy0y/9bwLQqFWTFC4fpST4S6MvfeG09Ob/ZXPHV/+zg
 MyI4w1q2gMoEa7avTiNwxap0hmckYsJH5Z8fct34IvyJgQ5+o5u1xoH+ISXqRB4aUBd6
 OKKmchr0SUSu+r8uhD0eRDEMT8n61Z5OL31C3LGo3/l2je30q/eXPWaBYpaf8xNbfYGD
 Hkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H/94gV2OrS1bi9DuK0dvzVPneLIcPLtL1oVf8zR732Y=;
 b=kyrxy/10S3tV8W0iVcUemS0XqJKc8VAADtwKfm2R0OXxWHwfZm56p0cy6K9jD1NnfU
 bbVM150JCUjUbybTrUy5ZOu3qj+BVdKduRJImUDz5aWkLEYJgDg4djwtttQqtXXHybY/
 P38YkYf05tyHpiPQunVl4lDpbxxRPotSH/ynQ9aB8AjM1Mma6QE96SELZzLaeYMX2NxM
 I/WjgXOx0B4fbayJB4XFA/vmOSuTm9vTFQRmxM74DhvZMg4AL0PUNULas9erwtlrOQAq
 q4s532VW6mlnTFzEzkEV+D/YvZ3HbMFoeSZ5nDgTA2I4l4lapUHccAopyi3vmjT72MLf
 An7w==
X-Gm-Message-State: AOAM5320D5GI9mP1/AwM0tmoEVhRrskSoX0FXIxRINCz8n0Zubk6mZ+H
 pe9xLrCbzCaEA37fGELtvQlXLJMqeCU=
X-Google-Smtp-Source: ABdhPJyfBMbOsYoH7aDjs9Mk8g6oLf4qy7y3gaIcEmyUhFmSTE2TW5BO/9XzUpKKcJKtzeHVzdad2A==
X-Received: by 2002:a1c:9a02:: with SMTP id c2mr9671717wme.16.1594207038921;
 Wed, 08 Jul 2020 04:17:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f15sm5088720wrx.91.2020.07.08.04.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 04:17:18 -0700 (PDT)
Date: Wed, 8 Jul 2020 12:17:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 19/20] backlight: make of_find_backlight static
Message-ID: <20200708111716.rsk2ogutkjpku7kc@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-20-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-20-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:45PM +0200, Sam Ravnborg wrote:
> There are no external users of of_find_backlight,
> as they have all changed to use the managed version.
> Make of_find_backlight static to prevent new external users.
> 
> v3:
>   - Move doc for devm_of_find_backlight out of this patch
> 
> v2:
>   - Editorial corrections (Daniel)
>   - Returns => RETURNS (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
