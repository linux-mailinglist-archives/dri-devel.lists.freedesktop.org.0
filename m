Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA425F3D7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FC96E124;
	Mon,  7 Sep 2020 07:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 661 seconds by postgrey-1.36 at gabe;
 Sun, 06 Sep 2020 16:33:08 UTC
Received: from dmz.c-home.cz (gw.c-home.cz [89.24.150.100])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AF9D6E075
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Sep 2020 16:33:08 +0000 (UTC)
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
 by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 086GLoct011279;
 Sun, 6 Sep 2020 18:21:55 +0200 (CEST)
From: Martin Cerveny <m.cerveny@computer.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/2] drm/sun4i: sun8i-csc: Secondary CSC register correction
Date: Sun,  6 Sep 2020 18:21:38 +0200
Message-Id: <20200906162140.5584-1-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martin Cerveny <m.cerveny@computer.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The secondary video layer (VI) on "Allwinner V3s" displays
decoded video (YUV) in wrong colors. The secondary
CSC should be programmed. 
Let's correct CSC register offset and extend regmap size.

Regards.

Martin Cerveny (2):
  drm/sun4i: sun8i-csc: Secondary CSC register correction
  drm/sun4i: mixer: Extend regmap max_register

 drivers/gpu/drm/sun4i/sun8i_csc.h   | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
