Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DE565AFC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800F10E826;
	Mon,  4 Jul 2022 16:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8A910E027
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 11:11:34 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o7xVi-00047D-2z; Sun, 03 Jul 2022 13:11:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Vetter <daniel@ffwll.ch>, Brian Norris <briannorris@chromium.org>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm/rockchip: vop: Don't crash for invalid
 duplicate_state()
Date: Sun,  3 Jul 2022 13:11:26 +0200
Message-Id: <165684667535.1187961.4152536263848598.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
References: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
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
 Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Jun 2022 17:26:52 -0700, Brian Norris wrote:
> It's possible for users to try to duplicate the CRTC state even when the
> state doesn't exist. drm_atomic_helper_crtc_duplicate_state() (and other
> users of __drm_atomic_helper_crtc_duplicate_state()) already guard this
> with a WARN_ON() instead of crashing, so let's do that here too.

Applied, thanks!

[1/1] drm/rockchip: vop: Don't crash for invalid duplicate_state()
      commit: 1449110b0dade8b638d2c17ab7c5b0ff696bfccb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
