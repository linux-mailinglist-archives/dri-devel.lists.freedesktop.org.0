Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D233E61B1B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DC589BA3;
	Mon,  8 Jul 2019 07:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E1E6E56D
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:03 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 01A25C000D;
 Sat,  6 Jul 2019 14:06:59 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 08/19] clk: renesas: r8a77995: Add CMM clocks
Date: Sat,  6 Jul 2019 16:07:35 +0200
Message-Id: <20190706140746.29132-9-jacopo+renesas@jmondi.org>
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
IEQzLgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTk1LWNwZy1tc3Ny
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5NS1jcGctbXNzci5jIGIvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOGE3Nzk5NS1jcGctbXNzci5jCmluZGV4IDY4NzA3Mjc3YjE3Yi4uOTYyYmIzMzdmMmU3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTk1LWNwZy1tc3NyLmMKKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5NS1jcGctbXNzci5jCkBAIC0xNDYsNiArMTQ2
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc3NyX21vZF9jbGsgcjhhNzc5OTVfbW9kX2Nsa3Nb
XSBfX2luaXRjb25zdCA9IHsKIAlERUZfTU9EKCJ2c3BicyIsCQkgNjI3LAlSOEE3Nzk5NV9DTEtf
UzBEMSksCiAJREVGX01PRCgiZWhjaTAiLAkJIDcwMywJUjhBNzc5OTVfQ0xLX1MzRDIpLAogCURF
Rl9NT0QoImhzdXNiIiwJCSA3MDQsCVI4QTc3OTk1X0NMS19TM0QyKSwKKwlERUZfTU9EKCJjbW0x
IiwJCQkgNzEwLAlSOEE3Nzk5NV9DTEtfUzFEMSksCisJREVGX01PRCgiY21tMCIsCQkJIDcxMSwJ
UjhBNzc5OTVfQ0xLX1MxRDEpLAogCURFRl9NT0QoImR1MSIsCQkJIDcyMywJUjhBNzc5OTVfQ0xL
X1MxRDEpLAogCURFRl9NT0QoImR1MCIsCQkJIDcyNCwJUjhBNzc5OTVfQ0xLX1MxRDEpLAogCURF
Rl9NT0QoImx2ZHMiLAkJCSA3MjcsCVI4QTc3OTk1X0NMS19TMkQxKSwKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
