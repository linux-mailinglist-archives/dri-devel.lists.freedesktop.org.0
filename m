Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C385EF3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EB16E7F7;
	Thu,  8 Aug 2019 09:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766A46E80A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 09:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A4A543F5A8;
 Thu,  8 Aug 2019 11:46:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0qLONXksmMC; Thu,  8 Aug 2019 11:46:41 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AE44F3F41B;
 Thu,  8 Aug 2019 11:46:39 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8F30F360301;
 Thu,  8 Aug 2019 11:46:39 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-fixes-5.3
Date: Thu,  8 Aug 2019 11:46:15 +0200
Message-Id: <20190808094615.31040-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1565257599; bh=U/IVeumW1Gj2s8FDOIo74/4KyyxdE6fvV3BEFetcp/o=;
 h=From:To:Cc:Subject:Date:From;
 b=G6/lsRHL0kHY40yQkMzrRnUHge1ERmhpeDH4AlkgCzb1bMCnsSoIE2tfgGFu+jTby
 CWBpUsKKoFP3WqwFYCATW5YSX/11yxiPHt2/cT4GMqpleIws0GErVZ3DqPZ/PQS+BR
 /4d6bPl4wYW9pV827LT3rCW94l6EqG2u4H+F9fkg=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="G6/lsRHL";
 dkim-atps=neutral
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas@shipmail.org>,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwgRGFuaWVsCgpBIHNpbmdsZSBtZW1vcnkgbGVhayBmaXggZnJvbSBDb2xpbiBJYW4gS2lu
Zy4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZjUzNjU3OWMxNDgyNDk1MDVi
Mzg4ZDUyNWFjMTg2NmUwODBmZDY2YToKCiAgTWVyZ2UgdGFnICdkcm0tZml4ZXMtNS4zLTIwMTkt
MDgtMDcnIG9mIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8g
ZHJtLWZpeGVzICgyMDE5LTA4LTA4IDEzOjI1OjUwICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfnRo
b21hc2gvbGludXgvIHZtd2dmeC1maXhlcy01LjMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA2YjdjM2I4NmYwYjYzMTM0YjJhYjU2NTA4OTIxYTA4NTNmZmE2ODdhOgoKICBkcm0vdm13
Z2Z4OiBmaXggbWVtb3J5IGxlYWsgd2hlbiB0b28gbWFueSByZXRyaWVzIGhhdmUgb2NjdXJyZWQg
KDIwMTktMDgtMDggMTE6MjI6NTQgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNvbGluIElhbiBLaW5nICgxKToK
ICAgICAgZHJtL3Ztd2dmeDogZml4IG1lbW9yeSBsZWFrIHdoZW4gdG9vIG1hbnkgcmV0cmllcyBo
YXZlIG9jY3VycmVkCgogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
