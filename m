Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E657F1B48
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 17:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35CD6E250;
	Wed,  6 Nov 2019 16:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D486E250
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 16:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id F216A28FDCE
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v2 4/4] dt-bindings: display: add IMX MIPI DSI host controller
 doc
Date: Wed,  6 Nov 2019 18:30:31 +0200
Message-Id: <20191106163031.808061-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106163031.808061-1-adrian.ratiu@collabora.com>
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KUmV2
aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTam9lcmQgU2ltb25zIDxzam9lcmQuc2ltb25zQGNvbGxhYm9yYS5jb20+ClNpZ25l
ZC1vZmYtYnk6IE1hcnR5biBXZWxjaCA8bWFydHluLndlbGNoQGNvbGxhYm9yYS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFkcmlhbiBSYXRpdSA8YWRyaWFuLnJhdGl1QGNvbGxhYm9yYS5jb20+Ci0tLQog
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4dCAgICAgICAgIHwgNTYgKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgv
bWlwaS1kc2kudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi4zZjA1YzMyZWY5NjMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0CkBAIC0w
LDAgKzEsNTYgQEAKK0ZyZWVzY2FsZSBpLk1YNiBEVyBNSVBJIERTSSBIb3N0IENvbnRyb2xsZXIK
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKworVGhlIERTSSBo
b3N0IGNvbnRyb2xsZXIgaXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIHYxLjAxIElQ
Cit3aXRoIGEgY29tcGFuaW9uIFBIWSBJUC4KKworVGhlc2UgRFQgYmluZGluZ3MgZm9sbG93IHRo
ZSBTeW5vcHN5cyBEVyBNSVBJIERTSSBiaW5kaW5ncyBkZWZpbmVkIGluCitEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZHdfbWlwaV9kc2kudHh0IHdpdGgK
K3RoZSBmb2xsb3dpbmcgZGV2aWNlLXNwZWNpZmljIHByb3BlcnRpZXMuCisKK1JlcXVpcmVkIHBy
b3BlcnRpZXM6CisKKy0gI2FkZHJlc3MtY2VsbHM6IFNob3VsZCBiZSA8MT4uCistICNzaXplLWNl
bGxzOiBTaG91bGQgYmUgPDA+LgorLSBjb21wYXRpYmxlOiAiZnNsLGlteDZxLW1pcGktZHNpIiwg
InNucHMsZHctbWlwaS1kc2kiLgorLSByZWc6IFNlZSBkd19taXBpX2RzaS50eHQuCistIGludGVy
cnVwdHM6IFRoZSBjb250cm9sbGVyJ3MgQ1BVIGludGVycnVwdC4KKy0gY2xvY2tzLCBjbG9jay1u
YW1lczogUGhhbmRsZXMgdG8gdGhlIGNvbnRyb2xsZXIncyBwbGwgcmVmZXJlbmNlCisgIGNsb2Nr
KHJlZikgYW5kIEFQQiBjbG9jayhwY2xrKSwgYXMgZGVzY3JpYmVkIGluIFsxXS4KKy0gcG9ydHM6
IGEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZCBpbiBbMl0u
CistIGdwcjogU2hvdWxkIGJlIDwmZ3ByPi4KKyAgICAgICBQaGFuZGxlIHRvIHRoZSBpb211eGMt
Z3ByIHJlZ2lvbiBjb250YWluaW5nIHRoZSBtdWx0aXBsZXhlcgorICAgICAgIGNvbnRyb2wgcmVn
aXN0ZXIuCisKK1sxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xv
Y2stYmluZGluZ3MudHh0CitbMl0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0CisKK0V4YW1wbGU6CisKKwltaXBpX2RzaTogbWlwaUAy
MWUwMDAwIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+Owor
CQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1taXBpLWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIjsK
KwkJcmVnID0gPDB4MDIxZTAwMDAgMHg0MDAwPjsKKwkJaW50ZXJydXB0cyA9IDwwIDEwMiBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKKwkJZ3ByID0gPCZncHI+OworCQljbG9ja3MgPSA8JmNsa3MgSU1Y
NlFETF9DTEtfTUlQSV9DT1JFX0NGRz4sCisJCQkgPCZjbGtzIElNWDZRRExfQ0xLX01JUElfSVBH
PjsKKwkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsiOworCQlzdGF0dXMgPSAib2theSI7CisK
KwkJcG9ydHMgeworCQkJcG9ydEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJbWlwaV9tdXhfMDog
ZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmlwdTFfZGkwX21pcGk+OworCQkJ
CX07CisJCQl9OworCQkJcG9ydEAxIHsKKwkJCQlyZWcgPSA8MT47CisJCQkJbWlwaV9tdXhfMTog
ZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmlwdTFfZGkxX21pcGk+OworCQkJ
CX07CisJCQl9OworCQl9OworICAgICAgICB9OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
