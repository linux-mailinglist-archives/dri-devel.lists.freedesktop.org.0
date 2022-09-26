Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84A5EA771
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9EC10E6B2;
	Mon, 26 Sep 2022 13:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F164B10E6B2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:37:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id cc5so10278185wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=KmT8737fPacCpbfR4MFMQYGBKsGn/TS8+soZ+8lgu8A=;
 b=clbYS2trrlEmEU5PvY7GzPsFpNhx42e6ugi0cebf+mDl7GN0ScQiuWEWx9oI//xRW3
 FTsIkMUYWsosA6ETER1iOAZBFulSPna7QojcudDzV9Gjh6ZXF7wC4rGSegNcRu5Ft1Ph
 BS6EkAyFfofpLQODvC8UOkGzOjiBE8Yy9RhewoiXrazdtQ66dWSPD0UTCdZ7tMxEGtpm
 I0Nzso8+fmeqOPEcJjAJbcee0EBTKVECyF0ypE7k8ssYF55yfuv05pqxHCCE502HYHIV
 otu9flHASZ3pJZp9q8hAk/btIyXiBMmqy1X8bMDp2FfG2NTKuhiguBJbMQWww47+H0Yz
 AXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=KmT8737fPacCpbfR4MFMQYGBKsGn/TS8+soZ+8lgu8A=;
 b=CrE6nDm9eu3r8D7Avt6oXCib+T7ZrfaxW6bgklgmlwJimEc0gzPslXBwGurzgdRDqb
 P6Q/1LqNknjGCi+suQHpFGigWwraZ66LeNDBFPrt8jEx15znUwikVuG6MPm/UO5Ufi6+
 izQ8F8ExA9U/Wj/4KHF4US97pLLKbkQ++Mvsj5Yj7AVCCnSKEJPRBqofHTEUskZ+5ICY
 Zu9791dW+OP1Symum8/uspuXNWvXdcCxetsMgs2F8D9x1gmH7Xgd6bn720JlqvHi2fK9
 FzOV3e23JAYc1FPuSbbj23RnqonZ9rJX6cU9ybQL+/fgkaCyb4mR6T+oaBF7pPDLnEnm
 fuGw==
X-Gm-Message-State: ACrzQf2T5l+oN9kNCwvMAtVxCfUpbo7jrg07klwxIx5FgGzj6NZQPauw
 xrRWtVsWSGfl7If1XmVzsOU1nA==
X-Google-Smtp-Source: AMsMyM7qingDZgfmrbprEPmbkWZZkb8lMYITqDwe2EjvcBMstJgtHXpux5BlMKdCH7An7nEK+yxidg==
X-Received: by 2002:a05:6000:178d:b0:226:ffe8:72df with SMTP id
 e13-20020a056000178d00b00226ffe872dfmr13301991wrg.496.1664199473455; 
 Mon, 26 Sep 2022 06:37:53 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b003a5c244fc13sm11536200wms.2.2022.09.26.06.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:37:52 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:37:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] backlight: pwm_bl: Switch to use dev_err_probe()
 helper
Message-ID: <YzGrLsNrwEyL98nP@maple.lan>
References: <20220926133258.1104850-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926133258.1104850-1-yangyingliang@huawei.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org, lee@kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 09:32:58PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.

I'd prefer to have received these patches as a patchset rather than
individual patches... but it is a good change so:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
