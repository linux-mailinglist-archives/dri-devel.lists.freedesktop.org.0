Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99068B072
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809BD10E269;
	Sun,  5 Feb 2023 14:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2C10E272
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:56:36 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pOgRN-0007OK-2c; Sun, 05 Feb 2023 15:56:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/rockchip: Drop unbalanced obj unref
Date: Sun,  5 Feb 2023 15:56:22 +0100
Message-Id: <167560896727.1025063.1209601146004303880.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119231734.2884543-1-robdclark@gmail.com>
References: <20230119231734.2884543-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Sandy Huang <hjc@rock-chips.com>,
 Daniel Kurtz <djkurtz@chromium.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023 15:17:34 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In the error path, rockchip_drm_gem_object_mmap() is dropping an obj
> reference that it doesn't own.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Drop unbalanced obj unref
      commit: 8ee3b0e85f6ccd9e6c527bc50eaba774c3bb18d0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
