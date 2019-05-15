Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F632001E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F92892F1;
	Thu, 16 May 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5650F89257
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 16:06:35 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 453zvC5gQHz1rYWk;
 Wed, 15 May 2019 18:06:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 453zvC4xNQz1qqkL;
 Wed, 15 May 2019 18:06:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rCQpMR94fjUi; Wed, 15 May 2019 18:06:28 +0200 (CEST)
X-Auth-Info: iebjVXC79l8TiIzH4UC9D4oTSAg4lZ2Ww7N8E4Jdsqk=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 15 May 2019 18:06:28 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 2/2] drm/panel: simple: Add KOE tx14d24vm1bpa display
 support (320x240)
Date: Wed, 15 May 2019 18:06:12 +0200
Message-Id: <20190515160612.6529-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180412143715.6828-1-lukma@denx.de>
References: <20180412143715.6828-1-lukma@denx.de>
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
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
Cc: Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lukasz Majewski <lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciBLT0UncyA1LjciIGRpc3BsYXkuCgpTaWduZWQt
b2ZmLWJ5OiBMdWthc3ogTWFqZXdza2kgPGx1a21hQGRlbnguZGU+ClJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKLS0tClByZXZpb3VzIGRpc2N1c3Npb24gKGFuZCBS
b2IncyBSZXZpZXdlZC1ieSkgYWJvdXQgdGhpcyBwYXRjaApodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzEwMzM5NTk1LwoKSXQgbXVzdCBoYXZlIGJlZW4gbG9zdCBkdXJpbmcgdGhl
IGRldmVsb3BtZW50IHByb2Nlc3MsIHNvCkkgZG8gcmVzZW5kIGl0IG5vdy4KCkNoYW5nZXMgZm9y
IHY0OgotIFJlYmFzZSBvbiB0b3Agb2YgbmV3ZXN0IG1haW5saW5lIChubyBmdW5jdGlvbmFsIGNo
YW5nZXMpClNIQTE6IDVhYzk0MzMyMjQ4ZWUwMTc5NjRiYTM2OGNkZGE0Y2U2NDdlM2FiYTcKCkNo
YW5nZXMgZm9yIHYzIDoKLSBSZWJhc2UgdGhpcyBwYXRjaCBvbiB0b3Agb2YgbmV3ZXN0IGtlcm5l
bCAoNS4xLXJjMyk6CiAgU0hBMTogMTQ1ZjQ3YzczODFkNDNjNzg5Y2JhZDU1ZDRkYmZkMjhmYzZj
NDZhNAotIFNwbGl0IHRoaXMgcGF0Y2ggdG8gaGF2ZSBzZXBhcmF0ZSBEb2N1bWVudGF0aW9uIGVu
dHJ5Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMjYgKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmluZGV4IDU2OWJlNGVmZDhkMS4uYzNlNTkw
MGIwNGZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0xNTQ5LDYgKzE1
NDksMjkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGlubm9sdXhfemowNzBuYV8w
MXAgPSB7CiAJfSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxheV90aW1pbmcga29l
X3R4MTRkMjR2bTFicGFfdGltaW5nID0geworCS5waXhlbGNsb2NrID0geyA1NTgwMDAwLCA1ODUw
MDAwLCA2MjAwMDAwIH0sCisJLmhhY3RpdmUgPSB7IDMyMCwgMzIwLCAzMjAgfSwKKwkuaGZyb250
X3BvcmNoID0geyAzMCwgMzAsIDMwIH0sCisJLmhiYWNrX3BvcmNoID0geyAzMCwgMzAsIDMwIH0s
CisJLmhzeW5jX2xlbiA9IHsgMSwgNSwgMTcgfSwKKwkudmFjdGl2ZSA9IHsgMjQwLCAyNDAsIDI0
MCB9LAorCS52ZnJvbnRfcG9yY2ggPSB7IDYsIDYsIDYgfSwKKwkudmJhY2tfcG9yY2ggPSB7IDUs
IDUsIDUgfSwKKwkudnN5bmNfbGVuID0geyAxLCAyLCAxMSB9LAorCS5mbGFncyA9IERJU1BMQVlf
RkxBR1NfREVfSElHSCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBrb2Vf
dHgxNGQyNHZtMWJwYSA9IHsKKwkudGltaW5ncyA9ICZrb2VfdHgxNGQyNHZtMWJwYV90aW1pbmcs
CisJLm51bV90aW1pbmdzID0gMSwKKwkuYnBjID0gNiwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0g
MTE1LAorCQkuaGVpZ2h0ID0gODYsCisJfSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGlz
cGxheV90aW1pbmcga29lX3R4MzFkMjAwdm0wYmFhX3RpbWluZyA9IHsKIAkucGl4ZWxjbG9jayA9
IHsgMzk2MDAwMDAsIDQzMjAwMDAwLCA0ODAwMDAwMCB9LAogCS5oYWN0aXZlID0geyAxMjgwLCAx
MjgwLCAxMjgwIH0sCkBAIC0yNzA2LDYgKzI3MjksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCQkuY29tcGF0aWJsZSA9ICJpbm5v
bHV4LHpqMDcwbmEtMDFwIiwKIAkJLmRhdGEgPSAmaW5ub2x1eF96ajA3MG5hXzAxcCwKIAl9LCB7
CisJCS5jb21wYXRpYmxlID0gImtvZSx0eDE0ZDI0dm0xYnBhIiwKKwkJLmRhdGEgPSAma29lX3R4
MTRkMjR2bTFicGEsCisJfSwgewogCQkuY29tcGF0aWJsZSA9ICJrb2UsdHgzMWQyMDB2bTBiYWEi
LAogCQkuZGF0YSA9ICZrb2VfdHgzMWQyMDB2bTBiYWEsCiAJfSwgewotLSAKMi4xMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
