Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79522413130
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF676E92A;
	Tue, 21 Sep 2021 10:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711416E924
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:04:15 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mScdD-0001rd-SG; Tue, 21 Sep 2021 12:04:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, daniel@ffwll.ch,
 Souptick Joarder <jrdr.linux@gmail.com>, airlied@linux.ie
Cc: Heiko Stuebner <heiko@sntech.de>, kernel test robot <lkp@intel.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/rockchip: remove of_match_ptr()
Date: Tue, 21 Sep 2021 12:03:36 +0200
Message-Id: <163221857585.2031971.13481757624811469468.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210607184836.3502-1-jrdr.linux@gmail.com>
References: <20210607184836.3502-1-jrdr.linux@gmail.com>
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

On Tue, 8 Jun 2021 00:18:36 +0530, Souptick Joarder wrote:
> Kernel test robot throws below warning when CONFIG_OF
> is not set.
> 
> >> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:457:34:
> warning: unused variable 'rockchip_dp_dt_ids' [-Wunused-const-variable]
>    static const struct of_device_id rockchip_dp_dt_ids[] = {
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: remove of_match_ptr()
      commit: f7fc7a79bdbf20f2edef69dc62666a4f0cdac0e3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
