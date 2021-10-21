Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D1436308
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C306EC70;
	Thu, 21 Oct 2021 13:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601076EC70
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:32:49 +0000 (UTC)
Received: from [217.24.245.82] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mdYBY-00017F-7z; Thu, 21 Oct 2021 15:32:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: airlied@linux.ie, daniel@ffwll.ch, hjc@rock-chips.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: Implement mmap as GEM object function
Date: Thu, 21 Oct 2021 15:32:35 +0200
Message-Id: <163482299856.848182.3787182193550815425.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624095502.8945-1-tzimmermann@suse.de>
References: <20210624095502.8945-1-tzimmermann@suse.de>
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

On Thu, 24 Jun 2021 11:55:02 +0200, Thomas Zimmermann wrote:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
> 
> The respective rockchip functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().

Applied, thanks!

Looks good on a general glance, but of course I don't have a firm
grasp on all drm internals, so hopefully all these tests we
have will suffice :-) .

[1/1] drm/rockchip: Implement mmap as GEM object function
      commit: f8b5307074f8be80a9806d85b01e5ba933dd0360

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
