Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32E38569
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B8989AFF;
	Fri,  7 Jun 2019 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DD38934F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:49 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B5F6520007;
 Thu,  6 Jun 2019 14:21:44 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 05/20] clk: renesas: r8a7795: Add CMM clocks
Date: Thu,  6 Jun 2019 16:22:05 +0200
Message-Id: <20190606142220.1392-6-jacopo+renesas@jmondi.org>
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
IEgzLgoKU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGku
b3JnPgotLS0KIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NS1jcGctbXNzci5jIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3
OTUtY3BnLW1zc3IuYwppbmRleCA4Njg0MmM5ZmQzMTQuLmU4ZjFkNWVjMDQ1NSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMKKysrIGIvZHJpdmVycy9j
bGsvcmVuZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMKQEAgLTIwMCw2ICsyMDAsMTAgQEAgc3RhdGlj
IHN0cnVjdCBtc3NyX21vZF9jbGsgcjhhNzc5NV9tb2RfY2xrc1tdIF9faW5pdGRhdGEgPSB7CiAJ
REVGX01PRCgiZWhjaTAiLAkJIDcwMywJUjhBNzc5NV9DTEtfUzNENCksCiAJREVGX01PRCgiaHN1
c2IiLAkJIDcwNCwJUjhBNzc5NV9DTEtfUzNENCksCiAJREVGX01PRCgiaHN1c2IzIiwJCSA3MDUs
CVI4QTc3OTVfQ0xLX1MzRDQpLAorCURFRl9NT0QoImNtbTMiLAkJCSA3MDgsCVI4QTc3OTVfQ0xL
X1MyRDEpLAorCURFRl9NT0QoImNtbTIiLAkJCSA3MDksCVI4QTc3OTVfQ0xLX1MyRDEpLAorCURF
Rl9NT0QoImNtbTEiLAkJCSA3MTAsCVI4QTc3OTVfQ0xLX1MyRDEpLAorCURFRl9NT0QoImNtbTAi
LAkJCSA3MTEsCVI4QTc3OTVfQ0xLX1MyRDEpLAogCURFRl9NT0QoImNzaTIxIiwJCSA3MTMsCVI4
QTc3OTVfQ0xLX0NTSTApLCAvKiBFUzEueCAqLwogCURFRl9NT0QoImNzaTIwIiwJCSA3MTQsCVI4
QTc3OTVfQ0xLX0NTSTApLAogCURFRl9NT0QoImNzaTQxIiwJCSA3MTUsCVI4QTc3OTVfQ0xLX0NT
STApLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
