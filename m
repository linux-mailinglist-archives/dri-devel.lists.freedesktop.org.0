Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59893A595
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816A58924C;
	Sun,  9 Jun 2019 12:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FC189CAC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:11:28 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v57BBDPaO
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 7 Jun 2019 13:11:13 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/5] drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
Date: Fri,  7 Jun 2019 13:11:07 +0200
Message-Id: <d16aaa1ac93e4f15c13cd7d621de95836257676a.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559905886; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=7/qIHPW7YK3E/1WVa6JBhancuqJUkFLGU+ia6pFayDE=;
 b=S8LH07G9KtPWFZ2gV10UXn0MCCs231vqZZSsb1eoH71fTgAJIrZM2Ia+fdM2jY3Mat
 VADqsWCnWzi6Uzd+grum86WTkBLa1vUuXg7UDgQzQDwLTVRLAfSIEpPUnkm4h72YMmHT
 7LHyssfNSRSAUwjk96Hizwsh+zZ5pTjdD1hdFtbxBabCOK5X4jYndMBYZ90FDNa96FMS
 dxyABuQJ/dcckPdrLkSnCSNWTCPkbATWNSn8RfCEBjllltDH8+G90o7NWZShCXCvjy/b
 gSRh3QU7hMQ/lF4PnhNKQxjyEnxRoVwyAeI1IIcBgm9EfO0pjWlNqwpzPO4ml6g0F5ZA
 Cbxg==
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTaGFycCBMUTA3MFkzREczQiA3LjAiIFRG
VCBMQ0QgcGFuZWwuCgpUZXN0ZWQgb24gTGV0dXg3MDA0LgoKU2lnbmVkLW9mZi1ieTogSC4gTmlr
b2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jCmluZGV4IDU2OWJlNGVmZDhkMS4uNWIyNzgyOWM1YTc4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0yMjA0LDYgKzIyMDQsMzMgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwYW5lbF9kZXNjIHNhbXN1bmdfbHRuMTQwYXQyOV8zMDEgPSB7CiAJfSwKIH07CiAKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzaGFycF9scTA3MHkzZGczYl9tb2Rl
ID0geworCS5jbG9jayA9IDMzMjYwLAorCS5oZGlzcGxheSA9IDgwMCwKKwkuaHN5bmNfc3RhcnQg
PSA4MDAgKyA2NCwKKwkuaHN5bmNfZW5kID0gODAwICsgNjQgKyAxMjgsCisJLmh0b3RhbCA9IDgw
MCArIDY0ICsgMTI4ICsgNjQsCisJLnZkaXNwbGF5ID0gNDgwLAorCS52c3luY19zdGFydCA9IDQ4
MCArIDgsCisJLnZzeW5jX2VuZCA9IDQ4MCArIDggKyAyLAorCS52dG90YWwgPSA0ODAgKyA4ICsg
MiArIDM1LAorCS52cmVmcmVzaCA9IDYwLAorCS5mbGFncyA9IERJU1BMQVlfRkxBR1NfUElYREFU
QV9QT1NFREdFLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHNoYXJwX2xx
MDcweTNkZzNiID0geworCS5tb2RlcyA9ICZzaGFycF9scTA3MHkzZGczYl9tb2RlLAorCS5udW1f
bW9kZXMgPSAxLAorCS5icGMgPSA4LAorCS5zaXplID0geworCQkud2lkdGggPSAxNTIsCS8qIDE1
Mi40bW0gKi8KKwkJLmhlaWdodCA9IDkxLAkvKiA5MS40bW0gKi8KKwl9LAorCS5idXNfZm9ybWF0
ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFH
X0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9QT1NFREdFIHwKKwkJICAgICBEUk1fQlVT
X0ZMQUdfU1lOQ19EUklWRV9QT1NFREdFLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIHNoYXJwX2xxMDM1cTdkYjAzX21vZGUgPSB7CiAJLmNsb2NrID0gNTUwMCwK
IAkuaGRpc3BsYXkgPSAyNDAsCkBAIC0yNzg2LDYgKzI4MTMsOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBh
dGlibGUgPSAic2hhcnAsbHEwMzVxN2RiMDMiLAogCQkuZGF0YSA9ICZzaGFycF9scTAzNXE3ZGIw
MywKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gInNoYXJwLGxxMDcweTNkZzNiIiwKKwkJLmRhdGEg
PSAmc2hhcnBfbHEwNzB5M2RnM2IsCiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJzaGFycCxscTEw
MWsxbHkwNCIsCiAJCS5kYXRhID0gJnNoYXJwX2xxMTAxazFseTA0LAotLSAKMi4xOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
