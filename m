Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1795163CAA9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 22:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D382310E02C;
	Tue, 29 Nov 2022 21:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7011C10E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 21:48:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A9ED80431;
 Tue, 29 Nov 2022 22:48:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1669758482;
 bh=mANR0UVrLcSrd9Dn90ATJVmgqbNIRPSwBxDgu+wIe9M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vL7xA2LWjrg3HdMONbIhy33xgvY5WxeAeBhVY+o+WgYQ2Knxt/aHvV1a241kQcGtN
 JxOUI7i1vk0bfJyeuNZDFFbBz0XLteCtdYqRt1t5Pczq3jfyUU75zSanOgodfD2pec
 BMCeRskb62vn18mchScNmFDNTW8T17aJZ+maITMLzARcGsE2yjHs/UlwjcvfxoCz8S
 iJQny+Qls8GYDzYHEwEfCz2RxSVkQ9IQwvoLWO6t7mWZwnZBakQPi/OzZv+Ywftl8X
 sazTSCXDi60pAd/cxRUVb2lk/KeI4uWokSOFE1s+L5ej9l9aVWKdhb5RMNX68IeCGv
 5Q67ZaXlv6W5w==
Message-ID: <bcfa5a05-892d-3a18-e5f3-a77ed74a62a9@denx.de>
Date: Tue, 29 Nov 2022 22:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 07/26] drm: mxsfb: Define and use generic PM ops
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191733.137897-8-paul@crapouillou.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221129191733.137897-8-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/22 20:17, Paul Cercueil wrote:
> Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
> "struct dev_pm_ops" that can be used by this driver, instead of using
> custom PM callbacks with the same behaviour.
> 
> v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
>      exported dev_pm_ops.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

[...]

Reviewed-by: Marek Vasut <marex@denx.de>
