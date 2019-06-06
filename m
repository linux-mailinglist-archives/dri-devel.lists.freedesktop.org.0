Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690E3856A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492889B4D;
	Fri,  7 Jun 2019 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151728938B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:56 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6F85B20003;
 Thu,  6 Jun 2019 14:21:52 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 08/20] clk: renesas: r8a77995: Add CMM clocks
Date: Thu,  6 Jun 2019 16:22:08 +0200
Message-Id: <20190606142220.1392-9-jacopo+renesas@jmondi.org>
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
IEQzLgoKU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGku
b3JnPgotLS0KIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5OTUtY3BnLW1zc3IuYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3I4YTc3OTk1LWNwZy1tc3NyLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3
OTk1LWNwZy1tc3NyLmMKaW5kZXggZWVlMzg3NDg2NWE5Li5hY2Q1ZmFiYjc4NWEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5OTUtY3BnLW1zc3IuYworKysgYi9kcml2ZXJz
L2Nsay9yZW5lc2FzL3I4YTc3OTk1LWNwZy1tc3NyLmMKQEAgLTE0Niw2ICsxNDYsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3Nzk5NV9tb2RfY2xrc1tdIF9faW5pdGNv
bnN0ID0gewogCURFRl9NT0QoInZzcGJzIiwJCSA2MjcsCVI4QTc3OTk1X0NMS19TMEQxKSwKIAlE
RUZfTU9EKCJlaGNpMCIsCQkgNzAzLAlSOEE3Nzk5NV9DTEtfUzNEMiksCiAJREVGX01PRCgiaHN1
c2IiLAkJIDcwNCwJUjhBNzc5OTVfQ0xLX1MzRDIpLAorCURFRl9NT0QoImNtbTEiLAkJCSA3MTAs
CVI4QTc3OTk1X0NMS19TMUQxKSwKKwlERUZfTU9EKCJjbW0wIiwJCQkgNzExLAlSOEE3Nzk5NV9D
TEtfUzFEMSksCiAJREVGX01PRCgiZHUxIiwJCQkgNzIzLAlSOEE3Nzk5NV9DTEtfUzFEMSksCiAJ
REVGX01PRCgiZHUwIiwJCQkgNzI0LAlSOEE3Nzk5NV9DTEtfUzFEMSksCiAJREVGX01PRCgibHZk
cyIsCQkJIDcyNywJUjhBNzc5OTVfQ0xLX1MyRDEpLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
