Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A261216F900
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEEB6E15B;
	Wed, 26 Feb 2020 08:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A8D6E8B4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:49:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so1612636wrp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 02:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qvxBxV40TcJIJLO3Ak9rL5n5Z5cRmIQmAn99im24fac=;
 b=NXaA0AxrBsw0PiED/wu5oAlIugHDcLVleHM6WJemvRn1zjMg+CL9RtUIFTGVDB1ufh
 F3PdRnujr3yHd11tjD7MYcu8bu/+tGT+N88bFMZhnYqUkEli0zglutAhZjnyNc0/i/CY
 dHxjazAJDp1mWsdZlnqQn+y6EOjDJaK2cBVUQuWAlNRlHKFScdgRpfi3pTWEuAsFMk50
 fyJKqQFOQrBNxScEBl8zuxRJy9+901G99Je8X4zm2yByLodphoZofIjNHIMJ8/VLzPQg
 3XnWbrCOkLmnlhOeS3nfcHaU7J3ff56qjQSnCvvR9gw73/poO0ORS1mm3GwwOes8iOtm
 Hh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qvxBxV40TcJIJLO3Ak9rL5n5Z5cRmIQmAn99im24fac=;
 b=XaXguDI0bWZKkVvDdfAhqSJvdnM3Wtx1gRcYT4pfKDs/wGARDAb6fpCf2JeIPiifUi
 ltRA2DCFz3Tm7Kq6vhNCQNfLwV5dxNnb3wJj0G87N73CYo1rLs5zTe/1JkTBA2xC3Xmy
 5ckEh4UYdndC8fk8ndfDnWWYloRvDUW+DMUcOOfFihiRRZuEOuGJeSjtm8c1Ja7Mm5cA
 NXOyvCbNG5cX/tiX+32ZYB9bojS+imoF+8ICruNDX1YpaiGBfZDOt/g4oX3DNTesifFr
 TXB0QA8v4mq6T7yTamarVETd3ksZTRSrJFH//eqv5nzFMqcdx+Gv3gOESHiAVokkvzUr
 41Rg==
X-Gm-Message-State: APjAAAXAAgvJn+yg2uLpA4iC1PxYYy1VK3wmuYH8NVd49+fiAo8zM3bZ
 IYKPwCqcPz7t5OvlfZ8pRYA=
X-Google-Smtp-Source: APXvYqwE82o1PHG1mNSBjfme6ORF0zg+KbPukhHHmTEGr/59HWm+mQeP5u4pY7urYGWwmuA1z5W/dA==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr71310102wrx.336.1582627756154; 
 Tue, 25 Feb 2020 02:49:16 -0800 (PST)
Received: from [192.168.1.94] (93-41-244-45.ip84.fastwebnet.it. [93.41.244.45])
 by smtp.gmail.com with ESMTPSA id s15sm23542690wrp.4.2020.02.25.02.49.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 02:49:15 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Elida KD35T133 panels
To: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org
References: <20200223150711.194482-1-heiko@sntech.de>
 <20200223150711.194482-3-heiko@sntech.de>
From: Francesco Lavra <francescolavra.fl@gmail.com>
Message-ID: <026a2176-cded-d6ea-7fab-d1425ab3dd5d@gmail.com>
Date: Tue, 25 Feb 2020 11:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200223150711.194482-3-heiko@sntech.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sam@ravnborg.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, robh+dt@kernel.org,
 linux-rockchip@lists.infradead.org, thierry.reding@gmail.com,
 robin.murphy@arm.com, christoph.muellner@theobroma-systems.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/20 4:07 PM, Heiko Stuebner wrote:
> +static int kd35t133_unprepare(struct drm_panel *panel)
> +{
> +	struct kd35t133 *ctx = panel_to_kd35t133(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev, "failed to set display off: %d\n",
> +			      ret);
> +
> +	mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to enter sleep mode: %d\n",
> +			      ret);

It looks like you forgot to assign the return value from 
mipi_dsi_dcs_enter_sleep_mode() to ret.

> +		return ret;
> +	}
> +
> +	regulator_disable(ctx->iovcc);
> +	regulator_disable(ctx->vdd);
> +
> +	ctx->prepared = false;
> +
> +	return 0;
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
