Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A715D7D5BCA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C4F10E4B0;
	Tue, 24 Oct 2023 19:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E338610E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:48:43 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qvNO9-0007MI-BB; Tue, 24 Oct 2023 21:48:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v5 0/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
Date: Tue, 24 Oct 2023 21:48:26 +0200
Message-Id: <169817682323.1800793.13214115140253891113.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023173718.188102-1-jonas@kwiboo.se>
References: <20231023173718.188102-1-jonas@kwiboo.se>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Christopher Obbard <chris.obbard@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 17:37:13 +0000, Jonas Karlman wrote:
> This series add support for displaying 10-bit 4:2:0 and 4:2:2 formats produced
> by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.
> Also include 10-bit 4:4:4 support since VOP can support that also.
> 
> First patch adds new fourcc 10-bit YUV formats with 4:2:2/4:4:4 sub-sampling.
> Second patch adds support for displaying the new fourcc formats.
> 
> [...]

Applied, thanks!

[1/2] drm/fourcc: Add NV20 and NV30 YUV formats
      commit: 728c15b4b5f3369cbde73d5e0f14701ab370f985
[2/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
      commit: d4b384228562848e4b76b608a5876c92160e993c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
