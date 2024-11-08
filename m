Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82C9C2531
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 19:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125A710EA2B;
	Fri,  8 Nov 2024 18:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ug4AraFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6EB10EA2B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ZyQm5LHQ7qaqkJe4rbzzejbyBxQj/F4IZoyO1Km+6Y=; b=ug4AraFizxch/gjn7NGcYmmfn6
 DAFUoHbNK05VP75BwTUGGyzf2EMoNndnP8sbJiEPNjDtVavUfiQqUzfn3hMAFNwB9olI9l2KEq7C4
 vKoLl+a/ICGem4ZG5nnpqkX790t86ndfUiQQ/LPVJvaB+bsqgsCrG40KbLNd4zQqmFhgGzxn4rRN+
 ksvnQeXygwP2VKxfeDMtr7Y9pxRNCly+PkQvHudTqZvtO8zhnOpCM20gqgUnX3a1dcKDqdu8mBemZ
 OdCU3CHBbnTrbh1Ie36SzRh78ckJ5zwatlEnsx9XL2vj6mwqpgsvvsB53WdeyROwmNG75AU5bvlEQ
 VeOxX+gQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9U9a-0008D2-Ds; Fri, 08 Nov 2024 19:56:18 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 0/3] drm: rockchip: vop2: Add VP clock resets support
Date: Fri, 08 Nov 2024 19:56:17 +0100
Message-ID: <1808477.VLH7GnMWUR@diego>
In-Reply-To: <20241108185212.198603-1-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Detlev,

Am Freitag, 8. November 2024, 19:50:38 CET schrieb Detlev Casanova:
> Detlev Casanova (3):
>   vop2: Add clock resets support
>   arm64: dts: rockchip: Add VOP clock resets for rk3588s
>   dt-bindings: display: vop2: Add VP clock resets

while it isn't that important for this short series, please try to
order things like:
- dt-binding-change
- driver implementing that binding
- dts-file change

because generally, dt-binding + driver changes go through one tree
while the dts-file changes go through another.


Heiko


