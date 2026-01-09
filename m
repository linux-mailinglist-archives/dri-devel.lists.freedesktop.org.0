Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799AD0C104
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D55D10E941;
	Fri,  9 Jan 2026 19:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="EqSo1el8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C4B10E941
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 19:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=+24tglU3uRNfR8WBpyTeUFqEPV7UAKiBbfxKl2lF2eo=; b=EqSo1el8KT97vkoLiLwKnDxsAU
 SRwtc/OpfeAvG+rqYympG5yaWyUf3Yy4dMBKtBgm/P/Fu20Gv7tuwQpiUCFyxle+GdtxEalQGtlsP
 7vQb9MXRXEmYiDuv4hIoYIXXvBRdjnjhmPuLSu7AkFJZ4Gco7VnG5mD2sFbpAYuoibuFjDHioFNkB
 abjhG5J0tMatH75N/QbKHyV/VrxMBt83bc2gtTbar2r+QiiLuIij+4/x3S3AyA/uxN+OWZGiRN+qe
 7gMbA/Mrq+RrCE1ihwGz8dR81VM6rHzCi5mDm2lXBAeFTdoLP91HrVBEOjgy0mc+55SpLZXjm5HIc
 QQNRCvHw==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1veI6y-001fmF-JC; Fri, 09 Jan 2026 20:25:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, mripard@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, cristian.ciocaltea@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: (subset) [PATCH V3 0/3] Add HDMI for Gameforce Ace
Date: Fri,  9 Jan 2026 20:25:22 +0100
Message-ID: <176798671271.3432512.7495708105478828348.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251119225526.70588-1-macroalpha82@gmail.com>
References: <20251119225526.70588-1-macroalpha82@gmail.com>
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


On Wed, 19 Nov 2025 16:55:23 -0600, Chris Morgan wrote:
> Add support for the micro HDMI port for the Gameforce Ace. This port does
> not have a HPD pin so it requires making changes to the HDMI controller
> to support this configuration.
> 
> Changes since v1:
>  - Simplified checking of no-hpd parameter and changed to
>    device_property_read_bool() function.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp controller
      commit: db04f0d47dd1f18cf506a7dfa00035901be328a1
[2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
      commit: bafb6863dd8cea94e7dc2f90979b30292e8ea31c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
