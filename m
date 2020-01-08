Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B974A134FB7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 00:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D5389A9A;
	Wed,  8 Jan 2020 23:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1020 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2020 23:00:04 UTC
Received: from manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F2A892BC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 23:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by manjaro.org (Postfix) with ESMTP id 998C236E4DCD;
 Wed,  8 Jan 2020 23:43:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFgckuw6szdY; Wed,  8 Jan 2020 23:42:59 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/1] Regression in rockchipdrm
Date: Wed,  8 Jan 2020 23:39:48 +0100
Message-Id: <20200108223949.355975-1-t.schramm@manjaro.org>
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, Tobias Schramm <t.schramm@manjaro.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 2589c4025f13 ("drm/rockchip: Avoid drm_dp_link helpers") changed
the datatype used for storing the display port data rate to u8.
A u8 is not sufficient to store the data rate, resulting in a crash due
to incorrect calculations.

This series resolves the issue by restoring the data types changed in
commit 2589c4025f13 to their original type.

Tobias Schramm (1):
  drm/rockchip: fix integer type used for storing dp data rate and lane
    count

 drivers/gpu/drm/rockchip/cdn-dp-core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
