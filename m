Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6D776079
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 15:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6C710E43F;
	Wed,  9 Aug 2023 13:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8E10E43F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:19:29 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qTj5u-0007GY-58; Wed, 09 Aug 2023 15:19:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Stone <daniels@collabora.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: Don't spam logs in atomic check
Date: Wed,  9 Aug 2023 15:19:20 +0200
Message-Id: <169158715143.3231933.6558900139688537065.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808104405.522493-1-daniels@collabora.com>
References: <20230808104405.522493-1-daniels@collabora.com>
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
Cc: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Aug 2023 11:44:05 +0100, Daniel Stone wrote:
> Userspace should not be able to trigger DRM_ERROR messages to spam the
> logs; especially not through atomic commit parameters which are
> completely legitimate for userspace to attempt.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Don't spam logs in atomic check
      commit: 43dae319b50fac075ad864f84501c703ef20eb2b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
