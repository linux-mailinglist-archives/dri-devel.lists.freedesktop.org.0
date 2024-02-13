Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D43853A52
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 19:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D95B10E050;
	Tue, 13 Feb 2024 18:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF09510E050
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 18:55:45 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rZxwC-00086B-1v; Tue, 13 Feb 2024 19:55:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, tzimmermann@suse.de, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org,
 megi@xff.cz, kernel@puri.sm, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, airlied@gmail.com, daniel@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, devicetree@vger.kernel.org,
 sam@ravnborg.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 0/7] Add Support for RK3566 Powkiddy RGB10MAX3
Date: Tue, 13 Feb 2024 19:55:20 +0100
Message-Id: <170785046231.3338864.13569806071230599737.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 12 Feb 2024 12:49:43 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RGB10MAX3 handheld gaming console.
> 
> [1] https://powkiddy.com/products/pre-sale-powkiddy-rgb10max3-handheld-game-console
> 
> Chris Morgan (7):
>   dt-bindings: display: st7703: Add Powkiddy RGB10MAX3 panel
>   drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
>   dt-bindings: display: Document ST7703 panel rotation
>   drm/panel: st7703: Add Panel Rotation Support
>   arm64: dts: rockchip: Update powkiddy rk2023 dtsi for RGB10MAX3
>   dt-bindings: arm: rockchip: Add Powkiddy RGB10MAX3
>   arm64: dts: rockchip: Add Powkiddy RGB10MAX3
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: st7703: Add Powkiddy RGB10MAX3 panel
      commit: 9913a60f318b6c88ea8385048952e3557464bb84
[2/7] drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
      commit: e0c732291250e205fb834881ad7ecf9ee3ffef45
[3/7] dt-bindings: display: Document ST7703 panel rotation
      commit: 20b18c2be4f3dcb5448ecc122484bef6c2852fdd
[4/7] drm/panel: st7703: Add Panel Rotation Support
      commit: 762195e5c26936b891fb54ba0183aa3ef366b41e

I've adapted the binding subjects to poin to the rocktech,jh057n00900
panel that gets changed and also dropped the one added newline as
requested by Guido.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
