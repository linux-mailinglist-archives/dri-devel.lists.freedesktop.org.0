Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C6853B3B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 20:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896CA10E770;
	Tue, 13 Feb 2024 19:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD13110E770
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 19:38:00 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rZybL-0008Re-Bt; Tue, 13 Feb 2024 20:37:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: robh+dt@kernel.org,
	Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, tzimmermann@suse.de,
 conor+dt@kernel.org, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 airlied@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 devicetree@vger.kernel.org, markyao0591@gmail.com,
 linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch
Subject: Re: (subset) [PATCH v2 1/6] dt-bindings: display: rockchip: rockchip,
 dw-hdmi: remove port property
Date: Tue, 13 Feb 2024 20:37:51 +0100
Message-Id: <170785305473.3362031.5919338158795795118.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
References: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
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

On Wed, 31 Jan 2024 22:14:29 +0100, Johan Jonker wrote:
> The hdmi-connector nodes are now functional and the new way to model
> hdmi ports nodes with both in and output port subnodes. Unfortunately
> with the conversion to YAML the old method with only an input port node
> was used. Later the new method was also added to the binding.
> A binding must be unambiguously, so remove the old port property
> entirely and make port@0 and port@1 a requirement as all
> upstream dts files are updated as well and because checking
> deprecated stuff is a bit pointless.
> Update the example to avoid use of the removed property.
> 
> [...]

Applied, thanks!

[3/6] ARM: dts: rockchip: fix rk3288 hdmi ports node
      commit: 585e4dc07100a6465b3da8d24e46188064c1c925
[4/6] ARM: dts: rockchip: fix rk322x hdmi ports node
      commit: 15a5ed03000cf61daf87d14628085cb1bc8ae72c
[5/6] arm64: dts: rockchip: fix rk3328 hdmi ports node
      commit: 1d00ba4700d1e0f88ae70d028d2e17e39078fa1c
[6/6] arm64: dts: rockchip: fix rk3399 hdmi ports node
      commit: f051b6ace7ffcc48d6d1017191f167c0a85799f6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
