Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C4F41B2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD2F6F85F;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB6B6E40C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:06:23 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vA7B6Ddgt
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Nov 2019 12:06:13 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v2 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date: Thu,  7 Nov 2019 12:06:05 +0100
Message-Id: <fbe9f4a20fd55d111afe8f09d03c154a82cf5ba5.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573124781; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=24fF1xUH22DnXnm6wMQiB8qNar/ohuK/dXnbgHGAvcQ=;
 b=ifYw5QCJmeHuTgmY1H/vFYRx4ZwMuZM669DbTkluNJbYnUdNRwU45+1cL0yoeUOP2d
 OwbRzmOSbJME8uBN00yviOuDfpFP7A4CrZkCFNDVkEL0q8yY6z2r6eSJ8j22KjSq/5k4
 ZesxS1S2+CyfTIKjwTSlW999bRrSB0sCHyv6O7SWix/23+OspsVHe/tKdOZpHP2/q5xd
 mmns4h/6z1dZpbtrpWQAHLRGJAHQ9ohj8JEVG/jovi8gzhFOZeIl9HdqFYIse0jlqXrC
 7SE9Z+ufCGLr9qXCcrWBB6v+nE6mdzlcHWu7o8OAHs0DeCLsromvsKOceRVXHW/iAdH7
 YlfA==
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCBpbnRlcnJ1cHQuCgpUZXN0ZWQgb24gQmVhZ2xlQm9uZSBCbGFjay4KClNpZ25lZC1v
ZmYtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9hbTMzeHguZHRzaSB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2FtMzN4eC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW0zM3h4LmR0c2kKaW5kZXgg
YTlkODQ4ZDUwYjIwLi5kYmZiOWQ1YWE5MTUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2FtMzN4eC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4eC5kdHNpCkBAIC00ODAs
MTAgKzQ4MCwxMSBAQAogCQkJI3NpemUtY2VsbHMgPSA8MT47CiAJCQlyYW5nZXMgPSA8MCAweDU2
MDAwMDAwIDB4MTAwMDAwMD47CiAKLQkJCS8qCi0JCQkgKiBDbG9zZWQgc291cmNlIFBvd2VyVlIg
ZHJpdmVyLCBubyBjaGlsZCBkZXZpY2UKLQkJCSAqIGJpbmRpbmcgb3IgZHJpdmVyIGluIG1haW5s
aW5lCi0JCQkgKi8KKwkJCXNneDogZ3B1QDAgeworCQkJCWNvbXBhdGlibGUgPSAidGksYW0zMzV4
LXNneDUzMC0xMjUiLCAiaW1nLHNneDUzMC0xMjUiLCAiaW1nLHNneDUzMCI7CisJCQkJcmVnID0g
PDB4MDAgMHgxMDAwMDAwPjsJLyogMTYgTUIgKi8KKwkJCQlpbnRlcnJ1cHRzID0gPDM3PjsKKwkJ
CX07CiAJCX07CiAJfTsKIH07Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
