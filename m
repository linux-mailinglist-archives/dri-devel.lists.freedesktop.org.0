Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951E17415
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188528981D;
	Wed,  8 May 2019 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 586 seconds by postgrey-1.36 at gabe;
 Wed, 08 May 2019 08:04:08 UTC
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id B652D8938B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 08:04:08 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 08 May 2019 15:54:20 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id x487sFOA075568;
 Wed, 8 May 2019 15:54:15 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 8 May 2019 15:54:15 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH 1/3] dt-bindings: Add binding for IT6505.
Date: Wed, 8 May 2019 15:48:40 +0800
Message-ID: <1557301722-20827-2-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557301722-20827-1-git-send-email-allen.chen@ite.com.tw>
References: <1557301722-20827-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw x487sFOA075568
X-Mailman-Approved-At: Wed, 08 May 2019 08:41:38 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ben Whitten <ben.whitten@gmail.com>,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 Koen Kooi <koen@dominion.thruhere.net>, Johan Hovold <johan@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Thierry Reding <treding@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgoKQWRkIGEgRFQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBJVDY1MDUuCgpTaWduZWQtb2ZmLWJ5OiBBbGxlbiBDaGVuIDxh
bGxlbi5jaGVuQGl0ZS5jb20udHc+CgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9p
dGUsaXQ2NTA1LnR4dCAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKwogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dCAgICAgICAgfCAgMSArCiAyIGZp
bGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvaXRlLGl0NjUwNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMC4uYzM1MDZhYwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnR4dApAQCAtMCwwICsxLDMw
IEBACitpVEUgaXQ2NTA1IERQIGJyaWRnZSBiaW5kaW5ncworCitSZXF1aXJlZCBwcm9wZXJ0aWVz
OgorICAgICAgICAtIGNvbXBhdGlibGU6ICJpdGUsaXQ2NTA1IgorICAgICAgICAtIHJlZzogaTJj
IGFkZHJlc3Mgb2YgdGhlIGJyaWRnZQorICAgICAgICAtIG92ZGQtc3VwcGx5OiBJL08gdm9sdGFn
ZQorICAgICAgICAtIHB3cjE4LXN1cHBseTogQ29yZSB2b2x0YWdlCisgICAgICAgIC0gaW50ZXJy
dXB0czogaW50ZXJydXB0IHNwZWNpZmllciBvZiBJTlQgcGluCisgICAgICAgIC0gcmVzZXQtZ3Bp
b3M6IGdwaW8gc3BlY2lmaWVyIG9mIFJFU0VUIHBpbgorCitFeGFtcGxlOgorCWl0NjUwNWRwdHg6
IGl0NjUwNWRwdHhANWMgeworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiaXRlLGl0NjUw
NSI7CisgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgICAgIGlu
dGVycnVwdC1wYXJlbnQgPSA8JnBpbz47CisgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwx
NTIgSVJRX1RZUEVfRURHRV9SSVNJTkcgMTUyIDA+OworICAgICAgICAgICAgICAgIHJlZyA9IDww
eDVjPjsKKyAgICAgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworICAgICAg
ICAgICAgICAgIHBpbmN0cmwtMCA9IDwmaXQ2NTA1X3BpbnM+OworICAgICAgICAgICAgICAgIG92
ZGQtc3VwcGx5ID0gPCZtdDYzNThfdnNpbTFfcmVnPjsKKyAgICAgICAgICAgICAgICBwd3IxOC1z
dXBwbHkgPSA8Jml0NjUwNV9wcDE4X3JlZz47CisgICAgICAgICAgICAgICAgcmVzZXQtZ3Bpb3Mg
PSA8JnBpbyAxNzkgMT47CisgICAgICAgICAgICAgICAgaHBkLWdwaW9zID0gPCZwaW8gOSAwPjsK
KyAgICAgICAgICAgICAgICBleHRjb24gPSA8JnVzYmNfZXh0Y29uPjsKKyAgICAgICAgICAgICAg
ICBwb3J0IHsKKyAgICAgICAgICAgICAgICAgICAgICAgIGl0NjUwNV9pbjogZW5kcG9pbnQgewor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9v
dXQ+OworICAgICAgICAgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgICAgICB9OworICAg
ICAgICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnR4dAppbmRleCAyYzNmYzUxLi5jMDg4NjQ2IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dApAQCAt
MTg0LDYgKzE4NCw3IEBAIGlvbQlJb21lZ2EgQ29ycG9yYXRpb24KIGlzZWUJSVNFRSAyMDA3IFMu
TC4KIGlzaWwJSW50ZXJzaWwKIGlzc2kJSW50ZWdyYXRlZCBTaWxpY29uIFNvbHV0aW9ucyBJbmMu
CitpdGUJaVRFIFRlY2guIEluYy4KIGl0ZWFkCUlURUFEIEludGVsbGlnZW50IFN5c3RlbXMgQ28u
THRkCiBpd2F2ZSAgaVdhdmUgU3lzdGVtcyBUZWNobm9sb2dpZXMgUHZ0LiBMdGQuCiBqZGkJSmFw
YW4gRGlzcGxheSBJbmMuCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
