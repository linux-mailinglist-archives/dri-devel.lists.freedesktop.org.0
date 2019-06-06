Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1523738586
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548B89BF0;
	Fri,  7 Jun 2019 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B49489354
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:53 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0700E20017;
 Thu,  6 Jun 2019 14:21:49 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 07/20] clk: renesas: r8a77990: Add CMM clocks
Date: Thu,  6 Jun 2019 16:22:07 +0200
Message-Id: <20190606142220.1392-8-jacopo+renesas@jmondi.org>
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
IEUzLgoKU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGku
b3JnPgotLS0KIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5OTAtY3BnLW1zc3IuYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3I4YTc3OTkwLWNwZy1tc3NyLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3
OTkwLWNwZy1tc3NyLmMKaW5kZXggOWEyNzhjNzVjOTE4Li44Y2RkMGU2ZmI3NGYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5OTAtY3BnLW1zc3IuYworKysgYi9kcml2ZXJz
L2Nsay9yZW5lc2FzL3I4YTc3OTkwLWNwZy1tc3NyLmMKQEAgLTE4Miw2ICsxODIsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3Nzk5MF9tb2RfY2xrc1tdIF9faW5pdGNv
bnN0ID0gewogCiAJREVGX01PRCgiZWhjaTAiLAkJIDcwMywJUjhBNzc5OTBfQ0xLX1MzRDQpLAog
CURFRl9NT0QoImhzdXNiIiwJCSA3MDQsCVI4QTc3OTkwX0NMS19TM0Q0KSwKKwlERUZfTU9EKCJj
bW0xIiwJCQkgNzEwLAlSOEE3Nzk5MF9DTEtfUzFEMSksCisJREVGX01PRCgiY21tMCIsCQkJIDcx
MSwJUjhBNzc5OTBfQ0xLX1MxRDEpLAogCURFRl9NT0QoImNzaTQwIiwJCSA3MTYsCVI4QTc3OTkw
X0NMS19DU0kwKSwKIAlERUZfTU9EKCJkdTEiLAkJCSA3MjMsCVI4QTc3OTkwX0NMS19TMUQxKSwK
IAlERUZfTU9EKCJkdTAiLAkJCSA3MjQsCVI4QTc3OTkwX0NMS19TMUQxKSwKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
