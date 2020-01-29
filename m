Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27214CF00
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8826F5F1;
	Wed, 29 Jan 2020 17:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A96F5EF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:03:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TH38f7125953;
 Wed, 29 Jan 2020 11:03:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580317388;
 bh=g6X3JxNTLRFUy2jBFHftDNK/a0/OoLRTQJFdw87B4jg=;
 h=From:To:CC:Subject:Date;
 b=rlHyNa+EZuNVZLY4zPHvi1/fKn/r39moc8HByA8F5EgEJ5FyDKMPnsSw0ZjC4q/fV
 plYgcLAPzEOvdbG8kxKR+maeS7nQ8Wa3EFsQqw8lRxkZZjgjHzKEvyuiQIoOY+nPk/
 3VlGnaiYkOf6w9mNbbGiFJMCQ0xmT8CeIKotZ9cI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TH38AN038585;
 Wed, 29 Jan 2020 11:03:08 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 11:03:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 11:03:07 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TH33Iv102348;
 Wed, 29 Jan 2020 11:03:04 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <tony@atomide.com>, <bcousson@baylibre.com>, <devicetree@vger.kernel.org>, 
 <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] ARM: dts: keystone-k2g-evm: Display support
Date: Wed, 29 Jan 2020 19:03:01 +0200
Message-ID: <cover.1580317147.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com, praneeth@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that drm/tidss is queued for mainline, lets add display support for
k2g-evm. There is no hurry since tidss is out only in v5.7, but it
should not harm to have the dts changes in place before that.

Jyri Sarha (2):
  ARM: dts: keystone-k2g: Add DSS node
  ARM: dts: keystone-k2g-evm: add HDMI video support

 arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
 2 files changed, 123 insertions(+)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
