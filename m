Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D536853ABF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 20:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717F010E7FE;
	Tue, 13 Feb 2024 19:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711F110E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 19:20:07 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rZyK2-0008K1-KX; Tue, 13 Feb 2024 20:20:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: robh+dt@kernel.org,
	Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org, markyao0591@gmail.com,
 devicetree@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, airlied@gmail.com,
 andy.yan@rock-chips.com, mripard@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de
Subject: Re: (subset) [PATCH v2 1/6] dt-bindings: display: rockchip: rockchip,
 dw-hdmi: remove port property
Date: Tue, 13 Feb 2024 20:20:01 +0100
Message-Id: <170785199080.3350387.14199175297568955666.b4-ty@sntech.de>
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

[1/6] dt-bindings: display: rockchip: rockchip,dw-hdmi: remove port property
      commit: 0d192c4c72ce00ab07a6b27f068607e21f754a46
[2/6] dt-bindings: display: rockchip,dw-hdmi: add power-domains property
      commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
