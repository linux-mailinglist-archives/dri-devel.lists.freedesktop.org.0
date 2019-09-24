Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA0BCD26
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D746EA86;
	Tue, 24 Sep 2019 16:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5744A89E8C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:46:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EF9D20673;
 Tue, 24 Sep 2019 16:45:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 06/70] drm/panel: simple: fix AUO g185han01
 horizontal blanking
Date: Tue, 24 Sep 2019 12:44:45 -0400
Message-Id: <20190924164549.27058-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343560;
 bh=XsLIRuRisxjNNPY6SKphj7kigAx9IKnjHsKH+Q7szps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KrIRDcV996LvqgWWPGy+CL5Nhookx7K+72ps1nSJrVraCG9mD/4DprG2sFKZsjk0a
 vuA79CmJHo30lDW28d8ynlZqirUqKnJFY97Q/Wf8IkostrBAZkw3mc+qDwmS37JvzR
 IrRPLkQATurKKKzsEq1RX72WXfjTOSYHa5BhevHY=
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpbIFVwc3RyZWFtIGNv
bW1pdCBmOGM2YmZjNjEyYjU2ZjAyZTFiOGZhZTY5OWRmZjEyNzM4YWFmODg5IF0KClRoZSBob3Jp
em9udGFsIGJsYW5raW5nIHBlcmlvZHMgYXJlIHRvbyBzaG9ydCwgYXMgdGhlIHZhbHVlcyBhcmUK
c3BlY2lmaWVkIGZvciBhIHNpbmdsZSBMVkRTIGNoYW5uZWwuIFNpbmNlIHRoaXMgcGFuZWwgaXMg
ZHVhbCBMVkRTCnRoZXkgbmVlZCB0byBiZSBkb3VibGVkLiBXaXRoIHRoaXMgY2hhbmdlIHRoZSBw
YW5lbCByZWFjaGVzIGl0cwpub21pbmFsIHZyZWZyZXNoIHJhdGUgb2YgNjBGcHMsIGluc3RlYWQg
b2YgdGhlIDY0RnBzIHdpdGggdGhlCmN1cnJlbnQgd3JvbmcgYmxhbmtpbmcuCgpQaGlsaXBwIFph
YmVsIGFkZGVkOgpUaGUgZGF0YXNoZWV0IHNwZWNpZmllcyA5NjAgYWN0aXZlIGNsb2NrcyArIDQw
LzEyOC8xNjAgY2xvY2tzIGJsYW5raW5nCm9uIGVhY2ggb2YgdGhlIHR3byBMVkRTIGNoYW5uZWxz
IChtaW4vdHlwaWNhbC9tYXgpLCBzbyBkb3VibGVkIHRoaXMgaXMKbm93IGNvcnJlY3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KUmV2aWV3ZWQt
Ynk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoL21zZ2lkLzE1NjI3NjQwNjAuMjM4NjkuMTIuY2FtZWxAcGVuZ3V0cm9uaXguZGUK
U2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYwppbmRleCAzOTdhMzA4NmVhYzhhLi45NWU0MzBmOWZlYTQzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC03MjMsOSArNzIzLDkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19nMTMzaGFuMDEgPSB7CiBzdGF0aWMgY29uc3Qgc3RydWN0
IGRpc3BsYXlfdGltaW5nIGF1b19nMTg1aGFuMDFfdGltaW5ncyA9IHsKIAkucGl4ZWxjbG9jayA9
IHsgMTIwMDAwMDAwLCAxNDQwMDAwMDAsIDE3NTAwMDAwMCB9LAogCS5oYWN0aXZlID0geyAxOTIw
LCAxOTIwLCAxOTIwIH0sCi0JLmhmcm9udF9wb3JjaCA9IHsgMTgsIDYwLCA3NCB9LAotCS5oYmFj
a19wb3JjaCA9IHsgMTIsIDQ0LCA1NCB9LAotCS5oc3luY19sZW4gPSB7IDEwLCAyNCwgMzIgfSwK
KwkuaGZyb250X3BvcmNoID0geyAzNiwgMTIwLCAxNDggfSwKKwkuaGJhY2tfcG9yY2ggPSB7IDI0
LCA4OCwgMTA4IH0sCisJLmhzeW5jX2xlbiA9IHsgMjAsIDQ4LCA2NCB9LAogCS52YWN0aXZlID0g
eyAxMDgwLCAxMDgwLCAxMDgwIH0sCiAJLnZmcm9udF9wb3JjaCA9IHsgNiwgMTAsIDQwIH0sCiAJ
LnZiYWNrX3BvcmNoID0geyAyLCA1LCAyMCB9LAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
