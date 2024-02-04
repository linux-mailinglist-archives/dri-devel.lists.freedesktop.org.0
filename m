Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EABA848D1A
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 12:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B632112173;
	Sun,  4 Feb 2024 11:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="o2N7X+iU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EDE112173
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 11:21:27 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TSRsf07MjzDqQx;
 Sun,  4 Feb 2024 11:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1707045686; bh=Vb3YmF683066tIPoSuDUcl9qbopdPekEaMtsmpdpHsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o2N7X+iU499azt0/4WdoUiz0OneM3eANP3GSZW+PdMWUoM2dOgJwJCj1s6GCufrJc
 tsOtvmRttNDhWvnaUYxXePrE5iH2J/KF/cpRSdYm7VlhOD+TayX6g8ccu8bCuH+mme
 JR+Fhl08DP2R0PCAIM39iBJHAcQ/NuZZHWiSUlpE=
X-Riseup-User-ID: F3B69E510B5B8F6ACC69F1E225E5734AF332A64007D9BE214E89A2D8B174F445
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TSRsV2pvdzJntZ;
 Sun,  4 Feb 2024 11:21:18 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Ondrej Jirman <megi@xff.cz>, Manuel Traut <manut@mecka.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Date: Sun, 04 Feb 2024 11:21:05 +0000
Message-ID: <2724385.mvXUDI8C0e@melttower>
In-Reply-To: <20240127-pinetab2-v4-4-37aab1c39194@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
 <20240127-pinetab2-v4-4-37aab1c39194@mecka.net>
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

Tested-by: Dang Huynh <danct12@riseup.net>

On Saturday, January 27, 2024 9:48:45 AM UTC Manuel Traut wrote:
> This includes support for both the v0.1 units that were sent to developers
> and the v2.0 units from production.


