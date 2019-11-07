Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8034F41BC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02646F87F;
	Fri,  8 Nov 2019 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2E16E369
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 6D2DC290AB6
Received: by jupiter.universe (Postfix, from userid 1000)
 id A4F654800A1; Thu,  7 Nov 2019 18:23:53 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCHv1 2/2] drm/panel: simple: Add support for AUO G156XTN01.0 panel
Date: Thu,  7 Nov 2019 18:23:31 +0100
Message-Id: <20191107172331.14362-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191107172331.14362-1-sebastian.reichel@collabora.com>
References: <20191107172331.14362-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRpbWluZ3MgZm9yIHRoZSBBVU8gRzE1NlhUTjAxLjAgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5
OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNDZjYTU5ZGI2ODE5Li40OWEzZjNiM2Q0YmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTg1OCw2ICs4NTgsMjkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19nMTMzaGFuMDEgPSB7CiAJLmJ1c19m
b3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9KRUlEQSwKIH07CiAKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fZzE1Nnh0bjAxX21vZGUgPSB7CisJLmNs
b2NrID0gNzYwMDAsCisJLmhkaXNwbGF5ID0gMTM2NiwKKwkuaHN5bmNfc3RhcnQgPSAxMzY2ICsg
MzMsCisJLmhzeW5jX2VuZCA9IDEzNjYgKyAzMyArIDY3LAorCS5odG90YWwgPSAxNTYwLAorCS52
ZGlzcGxheSA9IDc2OCwKKwkudnN5bmNfc3RhcnQgPSA3NjggKyA0LAorCS52c3luY19lbmQgPSA3
NjggKyA0ICsgNCwKKwkudnRvdGFsID0gODA2LAorCS52cmVmcmVzaCA9IDYwLAorfTsKKworc3Rh
dGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19nMTU2eHRuMDEgPSB7CisJLm1vZGVzID0g
JmF1b19nMTU2eHRuMDFfbW9kZSwKKwkubnVtX21vZGVzID0gMSwKKwkuYnBjID0gOCwKKwkuc2l6
ZSA9IHsKKwkJLndpZHRoID0gMzQ0LAorCQkuaGVpZ2h0ID0gMTk0LAorCX0sCit9OworCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGRpc3BsYXlfdGltaW5nIGF1b19nMTg1aGFuMDFfdGltaW5ncyA9IHsK
IAkucGl4ZWxjbG9jayA9IHsgMTIwMDAwMDAwLCAxNDQwMDAwMDAsIDE3NTAwMDAwMCB9LAogCS5o
YWN0aXZlID0geyAxOTIwLCAxOTIwLCAxOTIwIH0sCkBAIC0zMTQzLDYgKzMxNjYsOSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0s
IHsKIAkJLmNvbXBhdGlibGUgPSAiYXVvLGcxMzNoYW4wMSIsCiAJCS5kYXRhID0gJmF1b19nMTMz
aGFuMDEsCisJfSwgeworCQkuY29tcGF0aWJsZSA9ICJhdW8sZzE1Nnh0bjAxIiwKKwkJLmRhdGEg
PSAmYXVvX2cxNTZ4dG4wMSwKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0gImF1byxnMTg1aGFuMDEi
LAogCQkuZGF0YSA9ICZhdW9fZzE4NWhhbjAxLAotLSAKMi4yNC4wLnJjMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
