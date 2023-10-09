Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408D67BEC62
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AE110E2E6;
	Mon,  9 Oct 2023 21:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2053 seconds by postgrey-1.36 at gabe;
 Mon, 09 Oct 2023 21:11:31 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DB810E00F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:11:31 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qpx08-00058Z-0N; Mon, 09 Oct 2023 22:37:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arnd@arndb.de, dri-devel@lists.freedesktop.org,
 u.kleine-koenig@pengutronix.de, linux-rockchip@lists.infradead.org,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org, airlied@gmail.com,
 hjc@rock-chips.com, Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next] drm/rockchip: remove redundant of_match_ptr
Date: Mon,  9 Oct 2023 22:37:12 +0200
Message-Id: <169688381987.192795.13711895828418269641.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731125304.87059-1-wangzhu9@huawei.com>
References: <20230731125304.87059-1-wangzhu9@huawei.com>
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

On Mon, 31 Jul 2023 20:53:04 +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.
> 
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: remove redundant of_match_ptr
      commit: 63a06c9fe30bf84d1ab6f07d0e408bd1d4ccaf85

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
