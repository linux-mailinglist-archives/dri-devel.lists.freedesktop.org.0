Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA961262B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 00:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F1910E068;
	Sat, 29 Oct 2022 22:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1910E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 22:08:55 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oou0V-0008NZ-Ni; Sun, 30 Oct 2022 00:08:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: john@metanate.com,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1] drm: rockchip: remove rockchip_drm_framebuffer_init()
 function
Date: Sun, 30 Oct 2022 00:08:42 +0200
Message-Id: <166708118163.1656095.18036790011991165334.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <ebe91504-c5df-99e4-635f-832218584051@gmail.com>
References: <ebe91504-c5df-99e4-635f-832218584051@gmail.com>
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
 hjc@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Oct 2022 23:35:03 +0200, Johan Jonker wrote:
> The function rockchip_drm_framebuffer_init() was in use
> in the rockchip_drm_fbdev.c file, but that is now replaced
> by a generic fbdev setup. Reduce the image size by
> removing the rockchip_drm_framebuffer_init() and sub function
> rockchip_fb_alloc() and cleanup the rockchip_drm_fb.h header file.
> 
> 
> [...]

Applied, thanks!

[1/1] drm: rockchip: remove rockchip_drm_framebuffer_init() function
      commit: 4016379301a33e8bd0c2ef5c02f5d7f6a4afece4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
