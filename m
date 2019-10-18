Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFB2DDBAA
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E3F89D4D;
	Sun, 20 Oct 2019 00:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E976EBB4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:47 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkWDLD
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:32 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/7] ARM: DTS: am33xx: add sgx gpu child node
Date: Fri, 18 Oct 2019 20:46:25 +0200
Message-Id: <fd15fe04514a26ba308df040ea92cb864ebdffcd.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424405; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=cJdq0SDEvpnBl8IRrj/mGYOVcbLhacfbQeiycT5TI1k=;
 b=VrBHa4b8nvjE+ZHfTMunUoXs3cBrxUni+kFVZ1htEp3CaQSRjT4a6o0CQRcSJxB+A8
 DX36qrh+TSj2yAgTrjvDz6baiVMRxjlHikbqkYg4GjC8UOI6LeR+Csu1USsFeO51ASDx
 4YhB9tlmY+bkNL7/EnnMFyHM7RIQJ1Yt1GMH2gzPCMdMYM0otcCzWhwVVn8Bv3VcMqlC
 eYikCBDIPYcv+26ge40oapO4B8exrmtfWkRYubijudQWZMixIWwLNaqumnZN+6zOnKkL
 NWy1tXeEi0//en5TjAGMUGV35mNgG52CTSfiuQqPKgTBlOoEeIqNOLvsGBIcuZMdtP6r
 WIjg==
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

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0LgoKVGVzdGVkIG9uIEJlYWdsZUJvbmUgQmxhY2su
CgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0zM3h4LmR0c2kgfCAxMSArKysrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9hbTMzeHguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4
eC5kdHNpCmluZGV4IGE5ZDg0OGQ1MGIyMC4uZTc2YTQ3OTkxZGUzIDEwMDY0NAotLS0gYS9hcmNo
L2FybS9ib290L2R0cy9hbTMzeHguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hbTMzeHgu
ZHRzaQpAQCAtNDgwLDEwICs0ODAsMTMgQEAKIAkJCSNzaXplLWNlbGxzID0gPDE+OwogCQkJcmFu
Z2VzID0gPDAgMHg1NjAwMDAwMCAweDEwMDAwMDA+OwogCi0JCQkvKgotCQkJICogQ2xvc2VkIHNv
dXJjZSBQb3dlclZSIGRyaXZlciwgbm8gY2hpbGQgZGV2aWNlCi0JCQkgKiBiaW5kaW5nIG9yIGRy
aXZlciBpbiBtYWlubGluZQotCQkJICovCisJCQlzZ3g6IHNneEAwIHsKKwkJCQljb21wYXRpYmxl
ID0gImltZyxzZ3g1MzAtMTI1IiwgImltZyxzZ3g1MzAiLCAidGksb21hcC1hbTMzNXgtc2d4NTMw
LTEyNSI7CisJCQkJcmVnID0gPDB4MDAgMHgxMDAwMDAwPjsJLyogMTYgTUIgKi8KKwkJCQlyZWct
bmFtZXMgPSAic2d4IjsKKwkJCQlpbnRlcnJ1cHRzID0gPDM3PjsKKwkJCQl0aW1lciA9IDwmdGlt
ZXI3PjsKKwkJCX07CiAJCX07CiAJfTsKIH07Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
