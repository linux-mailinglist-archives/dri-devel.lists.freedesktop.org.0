Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35525965A4E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8285D10E852;
	Fri, 30 Aug 2024 08:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n87VcqIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9801310E851
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 708D1A44209;
 Fri, 30 Aug 2024 08:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1355C4CEC2;
 Fri, 30 Aug 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725006617;
 bh=+qWkkkxG743ImM/aahK9UM7XRQPRK07QH/l7Lrn/2g4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n87VcqIld4h3oj7jmm7RfOPl4zckDOEs8srTmVTODlJPFoBWJTdLkpxKb/TTrDPNI
 RpHdWXpgebIFMc/qPmm4qzLIU/IUXikZBg9fEljw5P/AOGdNBkoPI9gH5NVY29Dhxj
 0X1uhyjUZT+Aui4Sd6KyzejiYNza+LZ5CXen9SIXDTegOWyX/nTpdat55CRq0o5GTY
 kwc8M8dElgz1oXzLOA1CYsDOeadPufbX+4woWWT7nRP10Yqzc9IYsRuD24HA4Io+QG
 F5nYBaRSeP36LV/Z3WWPzyZZZEr6rtTbrq62Rxt/JKgxUcvItsy5MM3zN18fyGINmP
 7xquAQuP5GK1g==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Chukun Pan <amadeus@jmu.edu.cn>, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>, 
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <01020191998a2fd4-4d7b091c-9c4c-4067-b8d9-fe7482074d6d-000000@eu-west-1.amazonses.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
 <01020191998a2fd4-4d7b091c-9c4c-4067-b8d9-fe7482074d6d-000000@eu-west-1.amazonses.com>
Subject: Re: (subset) [PATCH v3 04/11] dt-bindings: mfd: syscon: Add rk3576
 QoS register compatible
Message-Id: <172500660860.97285.13837050366813522297.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 09:30:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Wed, 28 Aug 2024 15:10:55 +0000, Detlev Casanova wrote:
> Document rk3576 compatible for QoS registers.
> 
> 

Applied, thanks!

[04/11] dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
        commit: 2f9709b8541dc742235743d19b8a6e2baa2e81d4

--
Lee Jones [李琼斯]

