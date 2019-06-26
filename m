Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5556449
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8226E31D;
	Wed, 26 Jun 2019 08:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4554D6E204;
 Wed, 26 Jun 2019 02:22:06 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 49C903EE74;
 Wed, 26 Jun 2019 02:22:05 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Tue, 25 Jun 2019 22:21:44 -0400
Message-Id: <20190626022148.23712-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626022148.23712-1-masneyb@onstation.org>
References: <20190626022148.23712-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1561515725;
 bh=OXpAhLy5srruCKMhwhvoAj0B2oecFMLNetfymmEW4Eg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yu9N++HXluSC7if/HhprtF0gPOTHMDYHeTbWS5ufkbnJ8KHq1/Dqulfxkem//oKuJ
 F4co2TuaAO7Hweaeq8aCrNuEduy6I3QbId2O4f0J9nlxGmhSEcZSsnkKNvqo//RCbL
 PW33jIlHDDqjzJRe2YbQ4ntNpgTyXGDvklvU3g/k=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2MjoKLSBBZGQgYTN4eCBleGFtcGxlIHdpdGggT0NNRU0KCkNoYW5nZXMgc2luY2UgdjE6Ci0g
Tm9uZQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQgICB8IDUw
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNt
L2dtdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
Z211LnR4dAppbmRleCA5MGFmNWIwYTU2YTkuLmU1NTk2OTk0ZGY3YiAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKQEAg
LTMxLDYgKzMxLDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAtIGlvbW11czogcGhhbmRsZSB0
byB0aGUgYWRyZW5vIGlvbW11CiAtIG9wZXJhdGluZy1wb2ludHMtdjI6IHBoYW5kbGUgdG8gdGhl
IE9QUCBvcGVyYXRpbmcgcG9pbnRzCiAKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIG9jbWVtOiBw
aGFuZGxlIHRvIHRoZSBPbiBDaGlwIE1lbW9yeSAoT0NNRU0pIHRoYXQncyBwcmVzZW50IG9uIHNv
bWUgU25hcGRyYWdvbgorICAgICAgICAgU29Dcy4gU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwuCisKIEV4YW1wbGU6CiAKIC8gewpA
QCAtNjMsMyArNjcsNDkgQEAgRXhhbXBsZToKIAkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ211
X29wcF90YWJsZT47CiAJfTsKIH07CisKK2EzeHggZXhhbXBsZSB3aXRoIE9DTUVNIHN1cHBvcnQ6
CisKKy8geworCS4uLgorCisJZ3B1OiBhZHJlbm9AZmRiMDAwMDAgeworCQljb21wYXRpYmxlID0g
InFjb20sYWRyZW5vLTMzMC4yIiwKKwkJICAgICAgICAgICAgICJxY29tLGFkcmVubyI7CisJCXJl
ZyA9IDwweGZkYjAwMDAwIDB4MTAwMDA+OworCQlyZWctbmFtZXMgPSAia2dzbF8zZDBfcmVnX21l
bW9yeSI7CisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
KwkJaW50ZXJydXB0LW5hbWVzID0gImtnc2xfM2QwX2lycSI7CisJCWNsb2NrLW5hbWVzID0gImNv
cmUiLAorCQkgICAgICAgICAgICAgICJpZmFjZSIsCisJCSAgICAgICAgICAgICAgIm1lbV9pZmFj
ZSI7CisJCWNsb2NrcyA9IDwmbW1jYyBPWElMSV9HRlgzRF9DTEs+LAorCQkgICAgICAgICA8Jm1t
Y2MgT1hJTElDWF9BSEJfQ0xLPiwKKwkJICAgICAgICAgPCZtbWNjIE9YSUxJQ1hfQVhJX0NMSz47
CisJCW9jbWVtID0gPCZvY21lbT47CisJCXBvd2VyLWRvbWFpbnMgPSA8Jm1tY2MgT1hJTElDWF9H
RFNDPjsKKwkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CisJCWlvbW11
cyA9IDwmZ3B1X2lvbW11IDA+OworCX07CisKKwlvY21lbTogb2NtZW1AZmRkMDAwMDAgeworCQlj
b21wYXRpYmxlID0gInFjb20sbXNtODk3NC1vY21lbSI7CisKKwkJcmVnID0gPDB4ZmRkMDAwMDAg
MHgyMDAwPiwKKwkJICAgICAgPDB4ZmVjMDAwMDAgMHgxODAwMDA+OworCQlyZWctbmFtZXMgPSAi
Y3RybCIsCisJCSAgICAgICAgICAgICAibWVtIjsKKworCQljbG9ja3MgPSA8JnJwbWNjIFJQTV9T
TURfT0NNRU1HWF9DTEs+LAorCQkgICAgICAgICA8Jm1tY2MgT0NNRU1DWF9PQ01FTU5PQ19DTEs+
OworCQljbG9jay1uYW1lcyA9ICJjb3JlIiwKKwkJICAgICAgICAgICAgICAiaWZhY2UiOworCisJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwxPjsKKworCQlnbXUtc3Jh
bUAwIHsKKwkJCXJlZyA9IDwweDAgMHgxMDAwMDA+OworCQl9OworCX07Cit9OwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
