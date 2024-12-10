Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD65C9EBF32
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 00:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24610E9EE;
	Tue, 10 Dec 2024 23:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EZsp/FYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1775610E9EE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 23:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733872703;
 bh=2xopEnnq5/pPO8ebcQ2iA7v0L/YlJ7nHPQG7P9WTTEk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=EZsp/FYRIFSmUXEd2TZUjJHZYAZKXEk2H2eiauaA0UN8wgqFeaCBYlQWGoSEpQnD7
 jFdNMcnVS6J7H5pUohRFkpVLEQ3EReBmUlNwzAusaBjaYdyLNuZCWTNBgyM3VIq0Z8
 S19sh8M7d4kWUgDkqyOWx+khUgj4v2HjctQeWzq4l20nLNfx3UKplW1DPBlbhw7QGD
 v3DW2aS/3Xy+tUXoANx3jX/1fWYreKuRbMQy7a3yyQrinMdlewtfJG1VvhnHRjkQNZ
 ysMuhjr/vY3P1KqZSsSCTcGJJ01iIKq60GEsMS3pPaLnC5+VULo9xk5YO8yQLcklB/
 3LYr+AHwfXYbQ==
Received: from [192.168.1.90] (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DDF7317E0B54;
 Wed, 11 Dec 2024 00:18:22 +0100 (CET)
Message-ID: <b15c0a3b-36dc-49f8-9dfc-4bac5beece9a@collabora.com>
Date: Wed, 11 Dec 2024 01:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for HDMI1 output on RK3588 SoC
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com>
Content-Language: en-US
In-Reply-To: <20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/7/24 11:32 PM, Cristian Ciocaltea wrote:
> The patches provide the basic support to handle the second HDMI output
> port found on Rockchip RK3588 SoC.
> 
> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
> validate this.

Please ignore this revision and use v2 [1] instead, as it fixes a pin 
conflict issue occurring when having CONFIG_SPI_ROCKCHIP_SFC enabled.

Thanks,
Cristian

[1] https://lore.kernel.org/all/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
