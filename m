Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F127FA0D9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B336A10E296;
	Mon, 27 Nov 2023 13:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896AE10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 26FB1CE0EBC;
 Mon, 27 Nov 2023 13:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756C5C433C8;
 Mon, 27 Nov 2023 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701091347;
 bh=2JKjpQ+5QKANLP+xGmPCkybvq6kf6sMCsdtq+PhVm3o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bCbLnI25DgO/3NhVtGI6COesZn76ioTqblgX0vP1w6UCsafKA1UsKw7/uB3q5Si7E
 p3Kwxii8gLbZ2pI48nGZ95j7tCxkjRhPDeDT7MIb1pu3byNgX7F9a4EJOuREIhO0KE
 omLxzqv8kaY+/4fjVKkhTbtcao3YOMTD+yEee7TTDbDD0gN9sSx0tOisOzv+002ZU9
 NSNR9SnqbE5j0LVkbDbzY9ZBG53CmO/nLruMScsiR115l2tUbzLKTvIGkd4MoZGRKI
 eyfyZQWOIpSFd+X71z4OeyFouedfd4sC93e34la6eVNuzs3w8/gDNq1j5lW7DL4YbT
 QcrR/GgjDKUdg==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH 00/31] Fix and improve Rockchip RK3128 support
Message-Id: <170109134007.42627.12929766893521974712.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 29 Aug 2023 19:16:16 +0200, Alex Bee wrote:
> this series fixes some issues I found when testing my "new" RK3128 board
> with the mainline kernel and adds some core functionality like SMP bringup,
> usb and networking.
> 
> The propably most distinctive change is the split up of the DTs for the
> different SoCs of this platform: RK3126 and RK3128. Even if I'm not adding
> a RK3126 board in this series: I think this change should be done as early
> as possible in order to avoid issues in future.
> Actually it should have been done like that in the first place.
> 
> [...]

Applied, thanks!

[08/31] phy: rockchip-inno-usb2: Split ID interrupt phy registers
        commit: 2fda59099462ee700e424ba3ac928d13ad6389a8
[09/31] phy: phy-rockchip-inno-usb2: Add RK3128 support
        commit: 62ff41017e147472b07de6125c3be82ce02a8dd7

Best regards,
-- 
~Vinod


