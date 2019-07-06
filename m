Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8F61AFC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6851F89A1A;
	Mon,  8 Jul 2019 07:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8E56E375
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:01 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 84E84C000C;
 Sat,  6 Jul 2019 14:06:57 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 07/19] clk: renesas: r8a77990: Add CMM clocks
Date: Sat,  6 Jul 2019 16:07:34 +0200
Message-Id: <20190706140746.29132-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: muroya@ksk.co.jp, Geert Uytterhoeven <geert+renesas@glider.be>,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGNsb2NrIGRlZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4z
IEUzLgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTkwLWNwZy1tc3Ny
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5MC1jcGctbXNzci5jIGIvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOGE3Nzk5MC1jcGctbXNzci5jCmluZGV4IDk1NzA0MDRiYWE1OC4uY2VhYmY1NWMyMWMy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTkwLWNwZy1tc3NyLmMKKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5MC1jcGctbXNzci5jCkBAIC0xODMsNiArMTgz
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc3NyX21vZF9jbGsgcjhhNzc5OTBfbW9kX2Nsa3Nb
XSBfX2luaXRjb25zdCA9IHsKIAogCURFRl9NT0QoImVoY2kwIiwJCSA3MDMsCVI4QTc3OTkwX0NM
S19TM0QyKSwKIAlERUZfTU9EKCJoc3VzYiIsCQkgNzA0LAlSOEE3Nzk5MF9DTEtfUzNEMiksCisJ
REVGX01PRCgiY21tMSIsCQkJIDcxMCwJUjhBNzc5OTBfQ0xLX1MxRDEpLAorCURFRl9NT0QoImNt
bTAiLAkJCSA3MTEsCVI4QTc3OTkwX0NMS19TMUQxKSwKIAlERUZfTU9EKCJjc2k0MCIsCQkgNzE2
LAlSOEE3Nzk5MF9DTEtfQ1NJMCksCiAJREVGX01PRCgiZHUxIiwJCQkgNzIzLAlSOEE3Nzk5MF9D
TEtfUzFEMSksCiAJREVGX01PRCgiZHUwIiwJCQkgNzI0LAlSOEE3Nzk5MF9DTEtfUzFEMSksCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
