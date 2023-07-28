Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C59766C70
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245C10E1A2;
	Fri, 28 Jul 2023 12:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6139210E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 12:03:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso20544665e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690545787; x=1691150587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cFEa9MMxPQK3mIe8y2ZSoEZucFBC9apzwzTZ2gpfxUg=;
 b=WOWvFttnchRa1YQWyMjh/IMy1E+sMabw0JaGJJvGCydS8dFaH3Z5BvL0a8M9/Gaqlm
 bU9weHP63TkAt1c9UbvTR1qpReKo/6gk/bWTzDvBzX3qyOKbobVMQskfyOzyHWzAPBdV
 5Xq3fsXeRm60AcWT2yOmlpIwSSN61VV2cId7aJ6uuaGSbPrvVec2ylqpViKMtyKB6h6f
 Ip85NgpHLr8vq8hU9ATm2AvYJImuRAtKyClPjMdxwHQOekq6jaYiYIvfSdeojTQ0dx/W
 g/pw1K/sGQHOXEcklE82JNXjXNTVPTQeR5yDr7rL2oRV8qlAc64F6bDb63CsfrPNNnEo
 /etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690545787; x=1691150587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFEa9MMxPQK3mIe8y2ZSoEZucFBC9apzwzTZ2gpfxUg=;
 b=CJsrXE7jWPiho9W7yQIqt3pPGBqEI2xOrblusHPzJjra6IbVLKHrvRX1WufQz57hCI
 UTjXrQ37UD6SnfkgvbX4aepU8TECeg6WR6HhjvfM+2qubMPq1SrOxOw7nbuyc2z+zcCF
 bIUWzUaMSRrAD3kCFKHss34PShQwL2kfOMJa1ap5KgdVFQmo51+6K2up5xLadneOhvlQ
 ES8fCYT7jn8TkI2FSTIxwAhB7Ak/O9PeYHuRwox5bciT9vU8O8vUgd0cC+SlcnDY7mfG
 ZV77Tg43GB4UPua+aq6BCPInEWA8yRw55HBztgoyge+SHyKzGhMSh1OTjD3wSk7z97c8
 yBOA==
X-Gm-Message-State: ABy/qLZXOtAbtZ7t8Ar9n6PYJjKYT3f2nHs0DKm0B/awGuZvS5QNIRL3
 Culp9Ne8dOQAYmEZ6RjBcMUuzQM9GyFENiemZEs=
X-Google-Smtp-Source: APBJJlFBGflVyFrjukz9iK7ViiC7zKdOrBH5MmpCzudJpRLM2ZSR4SRJiG1L0RI1UeK1rfUMzqHF3A==
X-Received: by 2002:a7b:c4d4:0:b0:3fc:85c:5ef7 with SMTP id
 g20-20020a7bc4d4000000b003fc085c5ef7mr1524091wmk.22.1690545786731; 
 Fri, 28 Jul 2023 05:03:06 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 g17-20020adfe411000000b0031437299fafsm4692479wrm.34.2023.07.28.05.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 05:03:06 -0700 (PDT)
Date: Fri, 28 Jul 2023 15:03:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v3 3/3] drm/panel-simple: allow LVDS format override
Message-ID: <1cd00596-604d-4fbf-b9d1-9ee0f05cb373@kadam.mountain>
References: <20230523-simplepanel_support_nondefault_datamapping-v3-0-78ede374d3d9@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v3-3-78ede374d3d9@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v3-3-78ede374d3d9@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 01:54:40PM +0200, Johannes Zink wrote:
> @@ -556,7 +602,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	struct device_node *ddc;
>  	int connector_type;
>  	u32 bus_flags;
> -	int err;
> +	int err, ret;

I don't like this at all...

>  
>  	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>  	if (!panel)
> @@ -601,6 +647,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
>  	}
>  
> +	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
> +		/* Optional data-mapping property for overriding bus format */
> +		ret = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
> +		if (ret)
> +			goto free_ddc;

This *looks* like we are returning an error but we aren't.  I think we
should be.  If not then we need to have a discussion about that and
add some comments.

regards,
dan carpenter

> +	}
> +
>  	connector_type = desc->connector_type;
>  	/* Catch common mistakes for panels. */
>  	switch (connector_type) {
> 
> -- 
> 2.39.2
