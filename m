Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6D848D0D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 12:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462CD112164;
	Sun,  4 Feb 2024 11:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DE9112164
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 11:17:40 +0000 (UTC)
Received: from [185.175.219.2] (helo=phil.fosdem.net)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rWaUq-00051V-9E; Sun, 04 Feb 2024 12:17:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Yao <markyao0591@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Ondrej Jirman <megi@xff.cz>, Maxime Ripard <mripard@kernel.org>,
 Segfault <awarnecke002@hotmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Manuel Traut <manut@mecka.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Arnaud Ferraris <aferraris@debian.org>, Conor Dooley <conor+dt@kernel.org>,
 Danct12 <danct12@riseup.net>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] arm64: rockchip: Pine64 PineTab2 support
Date: Sun,  4 Feb 2024 12:17:08 +0100
Message-Id: <170704542194.2517832.14847139781169519437.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
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

On Sat, 27 Jan 2024 10:48:41 +0100, Manuel Traut wrote:
> This adds support for the BOE TH101MB31IG002 LCD Panel used in PineTab2 [1] and
> PineTab-V [2] as well as the devictrees for the PineTab2 v0.1 and v2.0.
> 
> The BOE LCD Panel patch was retrieved from [3]. The function-name prefix has
> been adapted and the LCD init section was simplified.
> 
> The PineTab2 devicetree patch was retrieved from [4]. Some renaming was needed
> to pass the dtb-checks, the brightness-levels are specified as range and steps
> instead of a list of values.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: arm64: rockchip: Add Pine64 PineTab2
      commit: 6a0a5a2a71b3e3c4ae1ee0b34a496cbf2d980832
[4/4] arm64: dts: rockchip: Add devicetree for Pine64 PineTab2
      commit: 1b7e19448f8fbeee23111795f67a003431c40b27

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
