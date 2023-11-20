Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9307F1940
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 18:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DA910E10F;
	Mon, 20 Nov 2023 17:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537A810E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 17:02:33 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r57fJ-0000jr-95; Mon, 20 Nov 2023 18:02:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/rockchip: vop2: Add NV20 and NV30 support
Date: Mon, 20 Nov 2023 18:02:19 +0100
Message-Id: <170049972584.1779880.3039151921455735557.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025213248.2641962-1-jonas@kwiboo.se>
References: <20231025213248.2641962-1-jonas@kwiboo.se>
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
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Christopher Obbard <chris.obbard@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 21:32:46 +0000, Jonas Karlman wrote:
> Add support for the 10-bit 4:2:2 and 4:4:4 formats NV20 and NV30.
> 
> These formats can be tested using modetest [1]:
> 
>   modetest -P <plane_id>@<crtc_id>:1920x1080@<format>
> 
> e.g. on a ROCK 3 Model A (rk3568):
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Add NV20 and NV30 support
      commit: 5fc6aa7db080fd90ef00846aac04e8a211088132

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
