Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18DB7F183C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 17:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2F10E05C;
	Mon, 20 Nov 2023 16:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10710E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 16:13:40 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r56ty-0000O8-VB; Mon, 20 Nov 2023 17:13:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v2] drm/rockchip: vop: Fix color for RGB888/BGR888 format
 on VOP full
Date: Mon, 20 Nov 2023 17:13:26 +0100
Message-Id: <170049679718.1726490.18211882317992551010.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026191500.2994225-1-jonas@kwiboo.se>
References: <20231026191500.2994225-1-jonas@kwiboo.se>
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

On Thu, 26 Oct 2023 19:14:58 +0000, Jonas Karlman wrote:
> Use of DRM_FORMAT_RGB888 and DRM_FORMAT_BGR888 on e.g. RK3288, RK3328
> and RK3399 result in wrong colors being displayed.
> 
> The issue can be observed using modetest:
> 
>   modetest -s <connector_id>@<crtc_id>:1920x1080-60@RG24
>   modetest -s <connector_id>@<crtc_id>:1920x1080-60@BG24
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full
      commit: bb0a05acd6121ff0e810b44fdc24dbdfaa46b642

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
