Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E861262A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 00:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8892510E067;
	Sat, 29 Oct 2022 22:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD110E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 22:08:57 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oou0W-0008NZ-QN; Sun, 30 Oct 2022 00:08:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH] drm/rockchip: use pm_runtime_resume_and_get() instead of
 pm_runtime_get_sync()
Date: Sun, 30 Oct 2022 00:08:45 +0200
Message-Id: <166708118164.1656095.10960493289173279957.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615062644.96837-1-yuancan@huawei.com>
References: <20220615062644.96837-1-yuancan@huawei.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 06:26:44 +0000, Yuan Can wrote:
> Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to avoid
> device usage counter leak.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
      commit: e3558747ebe15306e6d0b75bd6d211436be4a7d5

I've dropped the lvds part and used the separate patch from your
Huawei-collegue Zhang Qilong

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
