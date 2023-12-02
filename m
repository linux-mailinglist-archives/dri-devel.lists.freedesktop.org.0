Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7501801D99
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 16:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E0310E1F1;
	Sat,  2 Dec 2023 15:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D606310E1F1
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 15:57:23 +0000 (UTC)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r9SMq-0002DL-9W; Sat, 02 Dec 2023 16:57:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alex Bee <knaerzche@gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] Add power-controller and gpu for RK3128
Date: Sat,  2 Dec 2023 16:57:18 +0100
Message-Id: <170153263025.376455.12737085983971621612.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202125144.66052-1-knaerzche@gmail.com>
References: <20231202125144.66052-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Dec 2023 13:51:39 +0100, Alex Bee wrote:
> The first patch in this series fixes the pm-domain driver and adds
> power-domains which are currently missing. This touches the ABI which is
> not and was never used until now. Not all of them are used yet, but when
> the power-controller is added to the DT in patch 2 the ABI should not
> be changed again.
> Patch 3-5 are adding the the gpu compatible to dt-bindings, adding the gpu
> node and the respective operating points to SoC DT and finally enabling it
> for XPI-3128 board.
> 
> [...]

Applied, thanks!

[3/5] dt-bindings: gpu: mali-utgard: Add Rockchip RK3128 compatible
      commit: 5d86c15c3171c3ecebd84d53e30d9812b5591c84

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
