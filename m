Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143A4BC76D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F0E10F6BB;
	Sat, 19 Feb 2022 10:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F4910E890
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 13:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 905D41F45B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645104273;
 bh=lsIfh5sbMJI4WTP9N2IRqlEUycgB2AeckJcRBUnq8ao=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lzHbuZ2gFiSAjaNLa3T7PR090kaaJAVlPwS2PnJ5aCZaealX1zqQknnpf9CKbrOXf
 7Q+jbbY6uO0BagvCWblUzDl8sKDA8wwlUhOuq+9ZGVXMIoMdFFWxBZxrOYjdkGyo11
 TNrrOMr13ZDhgbRj2Uaoes4aX3gXj18eGIdAT6W2NXYZ378DLtDvVeoEZTJUuj3nlS
 LxV3WdDafBmp44y632lsfVRk/XNTVsv8Ua1KmzysetWUr5LIbOEa5tl8FS1KpTGDOx
 8ssWlTK+HinOWSB2ejLkLjmaJ5iT48yqyZNJiOmZhwlYGJ04+y2gwZQtNQkZUQY+2C
 ehK+5V3f8uP4g==
Message-ID: <b9b59c1d-5808-f348-62fb-257746df134d@collabora.com>
Date: Thu, 17 Feb 2022 16:24:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-22-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220217082954.2967889-22-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 11:29, Sascha Hauer пишет:
> @@ -28,6 +28,12 @@ config ROCKCHIP_VOP
>  	  This selects support for the VOP driver. You should enable it
>  	  on all older SoCs up to RK3399.
>  
> +config ROCKCHIP_VOP2
> +	bool "Rockchip VOP2 driver"
> +	help
> +	  This selects support for the VOP2 driver. You should enable it
> +	  on all newer SoCs beginning form RK3568.

s/form/from/

The ROCKCHIP_VOP option is "default y". Do you really want "default n"
for the VOP2?
