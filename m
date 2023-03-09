Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFC6B187D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 02:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE31410E76A;
	Thu,  9 Mar 2023 01:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF6710E76A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 01:07:33 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pa4ke-00041d-8q; Thu, 09 Mar 2023 02:07:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 0/4] drm/rockchip: dw_hdmi: Add 4k@30 support
Date: Thu,  9 Mar 2023 02:07:21 +0100
Message-Id: <167832398243.362678.10460061288778589921.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216102447.582905-1-s.hauer@pengutronix.de>
References: <20230216102447.582905-1-s.hauer@pengutronix.de>
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
Cc: Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>, Dan Johansen <strit@manjaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 11:24:43 +0100, Sascha Hauer wrote:
> One small fix compared to the last version, when checking for valid
> resolutions I accidently compared the current mode width with the
> maximum allowed height which resulted in wrong resolutions being
> discarded.
> 
> Changes since v5:
> - Fix wrong check width vs. height
> 
> [...]

Applied, thanks!

[1/4] drm/rockchip: vop: limit maximium resolution to hardware capabilities
      commit: 8e140cb60270ee8b5b41e80806323c668d8d4da9

Dropped the height check from the mode_valid function
and adding a suitable comment to the commit message.

[2/4] drm/rockchip: dw_hdmi: relax mode_valid hook
      commit: de13db32b0f89a040b50a51d129b9443159a660a
[3/4] drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
      commit: 83b61f817f43ed67572d1e241c9f552e0a8bfff4
[4/4] drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
      commit: d13b10ec6696b0c523fa21b65c7ff6f246a49560

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
