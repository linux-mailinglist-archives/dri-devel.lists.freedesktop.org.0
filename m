Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC85160CE0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059AB6E530;
	Mon, 17 Feb 2020 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E590E6FA7B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696635;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=l2ioSw/GBEgoEsJDqdX898kUDDw9CYiqWmti4ETUA48=;
 b=OtTR4K+H2bcHAIROELnboeD36x1XKIMxEerT03Qn3KGhZ2ZZQN+7Lk1JI1ff17GSZB
 YdEf6u16FkNouMXBtUdh8Hes7IfYL00vUls2njgY61yAHLEvqYEnHTWiSyMIaBEDdz7b
 54BuTDo4cz53mZDk9a3uS4up8Yp8MMDWCxjTqGJdd563XEL/v+Ge+QeEaFz+jC8hXdAA
 1+Cj17q5fYufaFHIW3mBTecdVgsZ3HpnDMVL+wcbAI4bs0EWyvv5DiJRG5w6zSsBDyCJ
 0iZBm71YYLK2oFtr6xIdlhtc6qSp6io7cvrMND+sYlVLSsz3GcN3AeQBm6kbOrnLEJRF
 7yPg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1EGASFky
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 14 Feb 2020 17:10:28 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Boddie <paul@boddie.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 03/12] MIPS: CI20: defconfig: configure for supporting
 modules
Date: Fri, 14 Feb 2020 17:10:15 +0100
Message-Id: <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all drivers need to be compiled into the kernel.
Support building and loading of kernel modules.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be41df2a81fb..e0d3c9d4c2ae 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -1,4 +1,5 @@
 # CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_MODULES=y
 CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
