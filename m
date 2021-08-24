Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411F3F562B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 04:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F96289B57;
	Tue, 24 Aug 2021 02:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D371589B57
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 02:58:37 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso794546pjh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cR4LFc7S07bWHTemhgUSaM7+YiJk/gSHobFlY19oG8U=;
 b=HzQlA7kVyZcfnvGLEDf69hx8YOKNKekkd58wq0xVJYZxGmMAM2QV52kvKCq2R5sPl9
 DYXXTCSn68pbKs01tWF+IKDCWVzwu/w9ha8RwV+yBLf1qedcNX8EBdEecvijJ+qss7EM
 8W53CiP9kAjMdgxO3XJk6nLmteK+wtfOpIwoikFpXEy3SqugiijTWBQuyjkmWc8R47/Q
 GcvdhdthXKHfa2RUBWU9uZIT38ZrUDOdKDuz7L9MzXMVdoMAROVcOMXSZ72OBpyxVvCc
 EqHc4J38QWTtun/HByXOhvlTWevwka42InpoxdEUhg63S9FmVaCiquRiRr/66m/u+Fkk
 1fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cR4LFc7S07bWHTemhgUSaM7+YiJk/gSHobFlY19oG8U=;
 b=ndTGrgyIiDWCHOvKEL9C5YzqcSEFgGaLUf1Z7i93agBaDJAofJ7iI0UTgm7QQ+r8CD
 4m27NutN+R8kKA4sgi7L6QxvgfDRJ9CKs7GLqNN1ouy8wOGa94CTr03paNHKcMrCLMcx
 2wij876ctggekQ/cdgUXzIqGSA6dbekgEa7up+fR/vXy3FwHPf4y/eCJMI7Q6Rua+xGt
 fNa+ARXXIrbTTSLuAJpv3MgSsICmrexgbXSnH2B07/X+bZ9NMkcIYjik135cGVA210p+
 Dxq4AeXOO4PcUSNAXacl/vrJSypfOJpQU2HFyypBKVnTfIWrZp3CuPZlRjUs0nn3kW5D
 UKwg==
X-Gm-Message-State: AOAM531qogEEuSiH78+6Ij65jJRRFVlslJYUN1QIyfIDDF/9FEFxFf5P
 xBTZF6cpV1b637BHZT8MB4Fwmg==
X-Google-Smtp-Source: ABdhPJyHLbIOrGSNtbbJc1v7CQb/74OAs+mRskKm2Dp5/tbVuu04vcTkktt8Ab1BiXjzk218qBJi1w==
X-Received: by 2002:a17:90a:4812:: with SMTP id
 a18mr1917135pjh.40.1629773917317; 
 Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id o14sm19982112pgl.85.2021.08.23.19.58.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Aug 2021 19:58:37 -0700 (PDT)
Date: Tue, 24 Aug 2021 10:58:31 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Sony Tulip Truly NT35521 driver
Message-ID: <20210824025831.GB22595@dragon>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
 <20210809051008.6172-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809051008.6172-3-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Aug 09, 2021 at 01:10:08PM +0800, Shawn Guo wrote:
> It adds a DRM panel driver for Sony Tulip Truly NT35521 5.24" 1280x720
> DSI panel, which can be found on Sony Xperia M4 Aqua phone.  The panel
> backlight is managed through DSI link.
> 
> The driver is built using linux-mdss-dsi-panel-driver-generator[1], and
> additionally modeling the 5V control GPIOs with regulators and adding
> Backlight GPIO support.
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Sam, Stephan,

Thank you for the review comments on v1!  How does v2 look to you?

Shawn
