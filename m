Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EEC540E9B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D6D10F13D;
	Tue,  7 Jun 2022 18:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 18:58:14 UTC
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net
 [46.105.63.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4627110F032
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:14 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.109.138.52])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 8310E24564
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:20:55 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 584D32B3FFAE5;
 Tue,  7 Jun 2022 18:20:48 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fca0d426-c27e-4a09-a8fa-96d11bc6cef4,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/panel: Use backlight helpers
Date: Tue,  7 Jun 2022 20:20:23 +0200
Message-Id: <20220607182026.1121992-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10882667026634475142
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedt
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
Cc: Stephen Kitt <steve@sk2.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

backlight_properties.fb_blank is deprecated. The states it represents
are handled by other properties; but instead of accessing those
properties directly, drivers should use the helpers provided by
backlight.h.

This will ultimately allow fb_blank to be removed.

Stephen Kitt (3):
  drm/panel: Use backlight helper
  drm/panel: panel-dsi-cm: Use backlight helpers
  drm/panel: sony-acx565akm: Use backlight helpers

 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  7 +-----
 drivers/gpu/drm/panel/panel-dsi-cm.c          | 24 ++++---------------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c  | 11 ++-------
 3 files changed, 7 insertions(+), 35 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.30.2

