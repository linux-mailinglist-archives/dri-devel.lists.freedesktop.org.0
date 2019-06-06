Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBDD3857A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04BD89B01;
	Fri,  7 Jun 2019 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2964B8934F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:51 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 92C6D20011;
 Thu,  6 Jun 2019 14:21:47 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 06/20] clk: renesas: r8a77965: Add CMM clocks
Date: Thu,  6 Jun 2019 16:22:06 +0200
Message-Id: <20190606142220.1392-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGNsb2NrIGRlZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4z
IE0zLU4uCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25k
aS5vcmc+Ci0tLQogZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk2NS1jcGctbXNzci5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9yZW5lc2FzL3I4YTc3OTY1LWNwZy1tc3NyLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4
YTc3OTY1LWNwZy1tc3NyLmMKaW5kZXggZWIxY2NhNThhMWUxLi41OGY3NWIwM2M4YmIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NjUtY3BnLW1zc3IuYworKysgYi9kcml2
ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTY1LWNwZy1tc3NyLmMKQEAgLTE3OCw2ICsxNzgsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3Nzk2NV9tb2RfY2xrc1tdIF9faW5p
dGNvbnN0ID0gewogCURFRl9NT0QoImVoY2kxIiwJCTcwMiwJUjhBNzc5NjVfQ0xLX1MzRDQpLAog
CURFRl9NT0QoImVoY2kwIiwJCTcwMywJUjhBNzc5NjVfQ0xLX1MzRDQpLAogCURFRl9NT0QoImhz
dXNiIiwJCTcwNCwJUjhBNzc5NjVfQ0xLX1MzRDQpLAorCURFRl9NT0QoImNtbTMiLAkJCTcwOCwJ
UjhBNzc5NjVfQ0xLX1MyRDEpLAorCURFRl9NT0QoImNtbTEiLAkJCTcxMCwJUjhBNzc5NjVfQ0xL
X1MyRDEpLAorCURFRl9NT0QoImNtbTAiLAkJCTcxMSwJUjhBNzc5NjVfQ0xLX1MyRDEpLAogCURF
Rl9NT0QoImNzaTIwIiwJCTcxNCwJUjhBNzc5NjVfQ0xLX0NTSTApLAogCURFRl9NT0QoImNzaTQw
IiwJCTcxNiwJUjhBNzc5NjVfQ0xLX0NTSTApLAogCURFRl9NT0QoImR1MyIsCQkJNzIxLAlSOEE3
Nzk2NV9DTEtfUzJEMSksCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
