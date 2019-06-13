Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B704562E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D730898CA;
	Fri, 14 Jun 2019 07:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896A189AEA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:02:53 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:44838 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFC-0003k6-C6; Thu, 13 Jun 2019 16:02:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRF8-00007Z-WE; Thu, 13 Jun 2019 16:02:23 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/18] drm/armada: add comments about HWC32 cursor colour
 format
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRF8-00007Z-WE@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:22 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/YRdgsgfrdYB46CJhogo5+pu4hXbPL6fB+Lr+vl+R8=; b=jLItS/QnABHU2T6uCrUPhLzLhe
 v09FAyrsiSMGmTZXb4zdzdslsBcIqa7bVzJHhM0+qH+O2vP9g9Sd7yvdyLXuNB0DPQTLs3HmYNy8n
 HnIOHpvpdJZSoPOuBVAn6YhBEU+SYZclKh/V5dox2DgEfbsE/9BI9Bx/T+MRlxU8UNRk2aEFPQcFj
 2SXYLxnromhvRA3TSoABoZkz/U0b0/DfVHYGzrZPYmZ/X9M5/CNgHXyBdt+pzcyo8l4M7wdmJCbwE
 V7u/ZAyqkIBZ1oCwu/KN9Ha8shhpK33YlkL7wFqtRX2kZ4UcB47b5C642IA1PvUQmguauppQrgkhd
 F9fOZr3g==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHNvbWUgY29tbWVudHMgYWJvdXQgdGhlIGZvcm1hdCBvZiB0aGUgSFdDMzIgY3Vyc29yIGNv
bG91ciBmb3JtYXQuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJt
bGludXgub3JnLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYyB8
IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm1hZGEvYXJtYWRhX2NydGMuYwppbmRleCA1OTkxZmViMWJjYzkuLmU4MWU1NzgyM2I2NiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYwpAQCAtNTE1LDYgKzUxNSwxMyBAQCBzdGF0
aWMgdm9pZCBhcm1hZGFfbG9hZF9jdXJzb3JfYXJnYih2b2lkIF9faW9tZW0gKmJhc2UsIHVpbnQz
Ml90ICpwaXgsCiAJCWZvciAoeCA9IDA7IHggPCB3aWR0aDsgeCsrLCBwKyspIHsKIAkJCXVpbnQz
Ml90IHZhbCA9ICpwOwogCisJCQkvKgorCQkJICogSW4gIkFSR0I4ODgiIChIV0MzMikgbW9kZSwg
d3JpdGluZyB0byB0aGUgU1JBTQorCQkJICogcmVxdWlyZXMgdGhlc2UgYml0cyB0byBjb250YWlu
OgorCQkJICogMzE6MjQgPSBhbHBoYSAyMzoxNiA9IGJsdWUgMTU6OCA9IGdyZWVuIDc6MCA9IHJl
ZAorCQkJICogU28sIGl0J3MgYWN0dWFsbHkgQUJHUjg4ODguICBUaGlzIGlzIGluZGVwZW5kZW50
CisJCQkgKiBvZiB0aGUgU1dBUFJCIGJpdHMgaW4gRE1BIGNvbnRyb2wgcmVnaXN0ZXIgMC4KKwkJ
CSAqLwogCQkJdmFsID0gKHZhbCAmIDB4ZmYwMGZmMDApIHwKIAkJCSAgICAgICh2YWwgJiAweDAw
MDAwMGZmKSA8PCAxNiB8CiAJCQkgICAgICAodmFsICYgMHgwMGZmMDAwMCkgPj4gMTY7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
