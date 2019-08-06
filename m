Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BD82CB2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404C86E2F5;
	Tue,  6 Aug 2019 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088F6E1B7;
 Tue,  6 Aug 2019 00:22:58 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 0DE2E3E99E;
 Tue,  6 Aug 2019 00:22:57 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v5 2/7] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Mon,  5 Aug 2019 20:22:24 -0400
Message-Id: <20190806002229.8304-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806002229.8304-1-masneyb@onstation.org>
References: <20190806002229.8304-1-masneyb@onstation.org>
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565050977;
 bh=R58vdw2delPC43paJyuY5JAdscP+E7cOYbKNHb+tbk4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D9dg1C3Rp9oXUL1YQApTVk4EZvlz0nfoHgUuOCIBCeu4Rdc9Nq5BII0PR4+lnhF2V
 yj7M6ZLFUwxRYW66rD/1WI898BotyrMftSIMAq9LVb1eICg0dxrs4jAqX/KhXcLYfw
 099y0IDRwRxL+hi+5H6cSQhZEHQplJkX+PSY3Pws=
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2NDoKLSBOb25lCgpDaGFuZ2VzIHNpbmNlIHYzOgotIGNvcnJlY3QgbGluayB0byBxY29tLG9j
bWVtLnlhbWwKCkNoYW5nZXMgc2luY2UgdjI6Ci0gQWRkIGEzeHggZXhhbXBsZSB3aXRoIE9DTUVN
CgpDaGFuZ2VzIHNpbmNlIHYxOgotIE5vbmUKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9nbXUudHh0ICAgfCA1MCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKaW5kZXggOTBhZjViMGE1NmE5Li42NzJkNTU3
Y2FiYTQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9nbXUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9nbXUudHh0CkBAIC0zMSw2ICszMSwxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogLSBpb21tdXM6IHBoYW5kbGUgdG8gdGhlIGFkcmVubyBpb21tdQogLSBvcGVyYXRpbmctcG9p
bnRzLXYyOiBwaGFuZGxlIHRvIHRoZSBPUFAgb3BlcmF0aW5nIHBvaW50cwogCitPcHRpb25hbCBw
cm9wZXJ0aWVzOgorLSBvY21lbTogcGhhbmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVN
KSB0aGF0J3MgcHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24KKyAgICAgICAgIFNvQ3MuIFNlZSBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tLG9jbWVtLnlhbWwuCisK
IEV4YW1wbGU6CiAKIC8gewpAQCAtNjMsMyArNjcsNDkgQEAgRXhhbXBsZToKIAkJb3BlcmF0aW5n
LXBvaW50cy12MiA9IDwmZ211X29wcF90YWJsZT47CiAJfTsKIH07CisKK2EzeHggZXhhbXBsZSB3
aXRoIE9DTUVNIHN1cHBvcnQ6CisKKy8geworCS4uLgorCisJZ3B1OiBhZHJlbm9AZmRiMDAwMDAg
eworCQljb21wYXRpYmxlID0gInFjb20sYWRyZW5vLTMzMC4yIiwKKwkJICAgICAgICAgICAgICJx
Y29tLGFkcmVubyI7CisJCXJlZyA9IDwweGZkYjAwMDAwIDB4MTAwMDA+OworCQlyZWctbmFtZXMg
PSAia2dzbF8zZDBfcmVnX21lbW9yeSI7CisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMyBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKKwkJaW50ZXJydXB0LW5hbWVzID0gImtnc2xfM2QwX2lycSI7CisJ
CWNsb2NrLW5hbWVzID0gImNvcmUiLAorCQkgICAgICAgICAgICAgICJpZmFjZSIsCisJCSAgICAg
ICAgICAgICAgIm1lbV9pZmFjZSI7CisJCWNsb2NrcyA9IDwmbW1jYyBPWElMSV9HRlgzRF9DTEs+
LAorCQkgICAgICAgICA8Jm1tY2MgT1hJTElDWF9BSEJfQ0xLPiwKKwkJICAgICAgICAgPCZtbWNj
IE9YSUxJQ1hfQVhJX0NMSz47CisJCW9jbWVtID0gPCZvY21lbT47CisJCXBvd2VyLWRvbWFpbnMg
PSA8Jm1tY2MgT1hJTElDWF9HRFNDPjsKKwkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1X29w
cF90YWJsZT47CisJCWlvbW11cyA9IDwmZ3B1X2lvbW11IDA+OworCX07CisKKwlvY21lbTogb2Nt
ZW1AZmRkMDAwMDAgeworCQljb21wYXRpYmxlID0gInFjb20sbXNtODk3NC1vY21lbSI7CisKKwkJ
cmVnID0gPDB4ZmRkMDAwMDAgMHgyMDAwPiwKKwkJICAgICAgPDB4ZmVjMDAwMDAgMHgxODAwMDA+
OworCQlyZWctbmFtZXMgPSAiY3RybCIsCisJCSAgICAgICAgICAgICAibWVtIjsKKworCQljbG9j
a3MgPSA8JnJwbWNjIFJQTV9TTURfT0NNRU1HWF9DTEs+LAorCQkgICAgICAgICA8Jm1tY2MgT0NN
RU1DWF9PQ01FTU5PQ19DTEs+OworCQljbG9jay1uYW1lcyA9ICJjb3JlIiwKKwkJICAgICAgICAg
ICAgICAiaWZhY2UiOworCisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9
IDwxPjsKKworCQlnbXUtc3JhbUAwIHsKKwkJCXJlZyA9IDwweDAgMHgxMDAwMDA+OworCQl9Owor
CX07Cit9OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
