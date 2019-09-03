Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2CA7C69
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60A0891EF;
	Wed,  4 Sep 2019 07:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id E829689356
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 11:05:27 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 03 Sep 2019 18:55:44 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id x83AtcHq074927;
 Tue, 3 Sep 2019 18:55:38 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 3 Sep 2019 18:55:39 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v2 1/2] dt-bindings: Add binding for IT6505.
Date: Tue, 3 Sep 2019 18:51:53 +0800
Message-ID: <1567507915-9844-2-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1567507915-9844-1-git-send-email-allen.chen@ite.com.tw>
References: <1567507915-9844-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw x83AtcHq074927
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM
 DRIVERS" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgoKQWRkIGEgRFQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBJVDY1MDUuCgpTaWduZWQtb2ZmLWJ5OiBBbGxlbiBDaGVuIDxh
bGxlbi5jaGVuQGl0ZS5jb20udHc+CgotLS0KQ29tbWVudHMgaW4gdjEgd291bGQgYmUgYWRkcmVz
c2VkIGxhdGVyIGluIHYzLgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2
NTA1LnR4dCAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKwogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dCAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
aXRlLGl0NjUwNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MC4uYzM1MDZhYwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnR4dApAQCAtMCwwICsxLDMwIEBACitp
VEUgaXQ2NTA1IERQIGJyaWRnZSBiaW5kaW5ncworCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorICAg
ICAgICAtIGNvbXBhdGlibGU6ICJpdGUsaXQ2NTA1IgorICAgICAgICAtIHJlZzogaTJjIGFkZHJl
c3Mgb2YgdGhlIGJyaWRnZQorICAgICAgICAtIG92ZGQtc3VwcGx5OiBJL08gdm9sdGFnZQorICAg
ICAgICAtIHB3cjE4LXN1cHBseTogQ29yZSB2b2x0YWdlCisgICAgICAgIC0gaW50ZXJydXB0czog
aW50ZXJydXB0IHNwZWNpZmllciBvZiBJTlQgcGluCisgICAgICAgIC0gcmVzZXQtZ3Bpb3M6IGdw
aW8gc3BlY2lmaWVyIG9mIFJFU0VUIHBpbgorCitFeGFtcGxlOgorCWl0NjUwNWRwdHg6IGl0NjUw
NWRwdHhANWMgeworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiaXRlLGl0NjUwNSI7Cisg
ICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgICAgIGludGVycnVw
dC1wYXJlbnQgPSA8JnBpbz47CisgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxNTIgSVJR
X1RZUEVfRURHRV9SSVNJTkcgMTUyIDA+OworICAgICAgICAgICAgICAgIHJlZyA9IDwweDVjPjsK
KyAgICAgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworICAgICAgICAgICAg
ICAgIHBpbmN0cmwtMCA9IDwmaXQ2NTA1X3BpbnM+OworICAgICAgICAgICAgICAgIG92ZGQtc3Vw
cGx5ID0gPCZtdDYzNThfdnNpbTFfcmVnPjsKKyAgICAgICAgICAgICAgICBwd3IxOC1zdXBwbHkg
PSA8Jml0NjUwNV9wcDE4X3JlZz47CisgICAgICAgICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JnBp
byAxNzkgMT47CisgICAgICAgICAgICAgICAgaHBkLWdwaW9zID0gPCZwaW8gOSAwPjsKKyAgICAg
ICAgICAgICAgICBleHRjb24gPSA8JnVzYmNfZXh0Y29uPjsKKyAgICAgICAgICAgICAgICBwb3J0
IHsKKyAgICAgICAgICAgICAgICAgICAgICAgIGl0NjUwNV9pbjogZW5kcG9pbnQgeworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+Owor
ICAgICAgICAgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICB9
OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXBy
ZWZpeGVzLnR4dAppbmRleCAyYzNmYzUxLi5jMDg4NjQ2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dApAQCAtMTg0LDYg
KzE4NCw3IEBAIGlvbQlJb21lZ2EgQ29ycG9yYXRpb24KIGlzZWUJSVNFRSAyMDA3IFMuTC4KIGlz
aWwJSW50ZXJzaWwKIGlzc2kJSW50ZWdyYXRlZCBTaWxpY29uIFNvbHV0aW9ucyBJbmMuCitpdGUJ
aVRFIFRlY2guIEluYy4KIGl0ZWFkCUlURUFEIEludGVsbGlnZW50IFN5c3RlbXMgQ28uTHRkCiBp
d2F2ZSAgaVdhdmUgU3lzdGVtcyBUZWNobm9sb2dpZXMgUHZ0LiBMdGQuCiBqZGkJSmFwYW4gRGlz
cGxheSBJbmMuCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
