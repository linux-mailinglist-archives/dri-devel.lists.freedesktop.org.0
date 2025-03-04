Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92FA4E11A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15110E5F7;
	Tue,  4 Mar 2025 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lAkwVwle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B2610E5F8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA311442CA;
 Tue,  4 Mar 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741098994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8EvkOn89F5QZDvcJq9vYrskcjOylWrbLL0SNGSyLh+c=;
 b=lAkwVwlevPRHAYDSePz+X5qIlxlMjHpCa7OWbyUKAHp4dgUtEhBIDN+HPXpWRTBrW8sfUy
 iowXL68vtXAnZD/cuEkl0CRCLstndm7bGHPLio14zHmbUK7NIB4c/48mA4iNocAxrSNxze
 PgPKcy95gEYhrAhLc2Z7BX4leRTFiE+X36EW+fHvv0nMJBe/P3wGyg7oZ83DRbaBqKOjx+
 ctOrC3jOTd72OTsfdkQ1YC66gZWHmwRjf64EVjE5bgeAzDzs6vBO871dPgS+0ynEsp2fm+
 mN/oFAhM1AE9hiVcRaDYadKl2JFbY3NKER4i1fhsm0Wf3M9TU4pZyeKyz6DhfQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH libdrm 0/2] Add an option to configure the plain pattern in
 modetest
Date: Tue, 04 Mar 2025 15:36:28 +0100
Message-Id: <20250304-color-option-v1-0-be521604fbff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwPx2cC/yWM0QrCMAxFf6Xk2WKdDtl+RfbQZXEGbDPTKsLYv
 xvc47ncc1YopEwFereC0ocLSzY4HRzgI+aZPE/G0ISmDedw8ShPUS9LtaPv2oCIY0dxuoIpi9K
 dv//cbdhZ6fW2at1HGGMha6TEtXeiPHM+psgZhm37Afza5YGNAAAA
X-Change-ID: 20250304-color-option-950cccb9ead7
To: dri-devel@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=18+VljALAmI5Z83A6A784gsNzk8FUJSoYAzyVCv91WA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnxw/xGiLeSp1L52AqpaBunuukemkobZx0RkyGt
 zvo53RKxtqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ8cP8QAKCRAgrS7GWxAs
 4o9vEADJrOExKW7FLX0nrVxCciUjLR65cFirDBc2rI7gD+5wI/XLd8EVxcP8cbBjwaR4MusUSHC
 Mq7BaKGV7V4c68NTMyAO2vSVwnfAvhAlXzu15mcIDxAgN8bhXvQOud7XFhm2fQIzPUbVR49Gp2a
 4CG8p5oSD+ItJQLHZA3GIm4iCYBTwyNuqEeluQJouYTf9kVWwdOmXeZGIAWVb4RLoQw/APxozHE
 hore3VTiqaFsZ5WHdMXaD8oBhB665SP96vUxDUqPijecBz8zyWwAmf0ADP9FW7RNC47awQa2UDO
 9p2b8xVzNi8DbROmOdd8duavvpR0iyh5Uups5woovmfskAU+yTMC5gOdXUcISBep+8NwgrVtWQX
 irlbuy+rkViJP00EL3Lec0vTraVKTsomUY/dLYTVtbk6sNIe5gvlbEpbIlvNmxw4S9zVxpf/20d
 rjfk/FA0v04ZAPnPYXl8/VS79c7VPkzJvrQAVhW58hmPGizcDepd47sNNMO7ZBqQbuv9tQbtxKQ
 qznGLn86m5gXFl2SUd9HYlMjr35kkHZkmOmsXBzOGOM2TaUtQUR5aKBvTLZi+dOuB6cRq9SO2G2
 hzYmKz1TS+SHsK5ihuphVwp0YxN6I3+7lqRMSEC3N1zoQZ8E9Pk/ih3hX4Fjom2+Pq3MkBN63oL
 3GXa7Pg32HCS/TQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfehueeguefhjeeuhffhjeekueduiefggfduheefkeelteelieevveeihfevueeinecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

modetest is a very useful tool to test displays, but to debug issues on 
electrical level, it is often usefull to choose a certain bit pattern for 
color.

Add an option in modetest, so you don't have to recompile for each new 
color you want to use.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (2):
      util: Add option to change the color for plain pattern
      modetest: Add color configuration for plain pattern

 tests/modetest/buffers.c  |  5 +++--
 tests/modetest/buffers.h  |  3 ++-
 tests/modetest/modetest.c | 22 +++++++++++++++++-----
 tests/util/pattern.c      | 19 +++++++++++++------
 tests/util/pattern.h      |  1 +
 5 files changed, 36 insertions(+), 14 deletions(-)
---
base-commit: a7eb2cfd53a70fcd9ba9dcfad80a3994642f362f
change-id: 20250304-color-option-950cccb9ead7

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

