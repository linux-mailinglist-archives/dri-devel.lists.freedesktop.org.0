Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3141DDB93
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA74F89C2C;
	Sun, 20 Oct 2019 00:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158366EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:53 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkYDLI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:34 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 7/7] ARM: DTS: omap5: add sgx gpu child node
Date: Fri, 18 Oct 2019 20:46:30 +0200
Message-Id: <790e680db41f12c5962a5ed4ffe468615afe9716.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424412; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=xz95XaDLnnSMdaKFjAvNeNi9Kf9q1CPGUe86Ptqg0XY=;
 b=mLxClzI9IXptkqceJXH9xDGK46Y/UeLdpiAffdOcYzaS48KmVyvbzJo9fcj+QeJ6B5
 gie9bauiJ5jhcN2RpbD+DxUGx1lkdV8Eyh1qMFtRuRyuhV+2RL730lzfG376zQR3a/gO
 Y12f409lIrigFJpWodihAeAgnwXC6KO1a21LBUTT7hoohh/ufmIUh+ZKbKGKwb5lamXZ
 lelTsL8/JAJwfrV+eHzdbFuksIo9QPi2WQ0nKkRtT5mmcFt5sZhGsfkgcEEc0wDEgknl
 L60wRuOqzyDnQsIZpgJRi0aVHjeCOgEkNjax0oahmId6mvQcW6QKczaCXwUDcD7bYZVg
 IN1w==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0LgoKVGVzdGUgb24gUHlyYS1IYW5kaGVsZC4KClNp
Z25lZC1vZmYtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KLS0t
CiBhcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNpIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNp
CmluZGV4IDFmYjc5Mzc2MzhmMC4uMDQxYTA1YjFjYzRkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9vbWFwNS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kKQEAg
LTI3NCwxMCArMjc0LDE0IEBACiAJCQkjc2l6ZS1jZWxscyA9IDwxPjsKIAkJCXJhbmdlcyA9IDww
IDB4NTYwMDAwMDAgMHgyMDAwMDAwPjsKIAotCQkJLyoKLQkJCSAqIENsb3NlZCBzb3VyY2UgUG93
ZXJWUiBkcml2ZXIsIG5vIGNoaWxkIGRldmljZQotCQkJICogYmluZGluZyBvciBkcml2ZXIgaW4g
bWFpbmxpbmUKLQkJCSAqLworCQkJc2d4OiBzZ3hAMCB7CisJCQkJY29tcGF0aWJsZSA9ICJpbWcs
c2d4NTQ0LTExNiIsICJpbWcsc2d4NTQ0IiwgInRpLG9tYXAtb21hcDUtc2d4NTQ0LTExNiI7CisJ
CQkJcmVnID0gPDB4MCAweDEwMDAwPjsKKwkJCQlyZWctbmFtZXMgPSAic2d4IjsKKwkJCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMjEgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJdGltZXIgPSA8
JnRpbWVyMTE+OworCQkJCWltZyxjb3JlcyA9IDwyPjsKKwkJCX07CiAJCX07CiAKIAkJZHNzOiBk
c3NANTgwMDAwMDAgewotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
