Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B315B0939
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19D46EBBF;
	Thu, 12 Sep 2019 07:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23CE46E029
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 03:35:15 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 12 Sep 2019 11:35:14 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id x8C3Z9JK094786;
 Thu, 12 Sep 2019 11:35:09 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 12 Sep 2019 11:35:10 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v3 1/2] dt-bindings: Add binding for IT6505.
Date: Thu, 12 Sep 2019 11:32:28 +0800
Message-ID: <1568259199-5827-2-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
References: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw x8C3Z9JK094786
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgoKQWRkIGEgRFQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBJVDY1MDUuCgpTaWduZWQtb2ZmLWJ5OiBBbGxlbiBDaGVuIDxh
bGxlbi5jaGVuQGl0ZS5jb20udHc+CgpTaWduZWQtb2ZmLWJ5OiBQaS1Ic3VuIFNoaWggPHBpaHN1
bkBjaHJvbWl1bS5vcmc+CgotLS0KY3Jvcy1lYyBkb2VzIG5vdCBoYXZlIGFuIGFzc29jaWF0ZWQg
ZHJpdmVyIHRoYXQgdXNlcyB0aGUgc3RhbmRhcmQgTGludXggVVNCLUMgZHJpdmVyIGNsYXNzLgpl
eHRjb24gaXMgdXNlZCB0byBtb2RlbCB0aGUgVHlwZS1DIGNvbm5lY3Rvci4oY3JidWcuY29tLzk4
MjkzMikKLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQgICAg
ICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3ZlbmRvci1wcmVmaXhlcy55YW1sICAgICAgIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnR4dAoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9p
dGUsaXQ2NTA1LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi43MmRhMGM0
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0CkBAIC0wLDAgKzEsMjggQEAKK2lURSBpdDY1MDUg
RFAgYnJpZGdlIGJpbmRpbmdzCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisgICAgICAgIC0gY29t
cGF0aWJsZTogIml0ZSxpdDY1MDUiCisgICAgICAgIC0gcmVnOiBpMmMgYWRkcmVzcyBvZiB0aGUg
YnJpZGdlCisgICAgICAgIC0gb3ZkZC1zdXBwbHk6IEkvTyB2b2x0YWdlCisgICAgICAgIC0gcHdy
MTgtc3VwcGx5OiBDb3JlIHZvbHRhZ2UKKyAgICAgICAgLSBpbnRlcnJ1cHRzOiBpbnRlcnJ1cHQg
c3BlY2lmaWVyIG9mIElOVCBwaW4KKyAgICAgICAgLSByZXNldC1ncGlvczogZ3BpbyBzcGVjaWZp
ZXIgb2YgUkVTRVQgcGluCisJLSBocGQtZ3Bpb3M6CisJCUhvdHBsdWcgZGV0ZWN0IEdQSU8uCisJ
CUluZGljYXRlcyB3aGljaCBHUElPIHNob3VsZCBiZSB1c2VkIGZvciBob3RwbHVnIGRldGVjdGlv
bgorCS0gcG9ydEBbeF06IFNvQyBzcGVjaWZpYyBwb3J0IG5vZGVzIHdpdGggZW5kcG9pbnQgZGVm
aW5pdGlvbnMgYXMgZGVmaW5lZAorCQlpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0CisKK0V4YW1wbGU6CisJZHAtYnJp
ZGdlQDVjIHsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIml0ZSxpdDY1MDUiOworICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTUyIElSUV9UWVBFX0VER0VfUklTSU5HIDE1MiAw
PjsKKyAgICAgICAgICAgICAgICByZWcgPSA8MHg1Yz47CisgICAgICAgICAgICAgICAgcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IjsKKyAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8Jml0NjUw
NV9waW5zPjsKKyAgICAgICAgICAgICAgICBvdmRkLXN1cHBseSA9IDwmbXQ2MzU4X3ZzaW0xX3Jl
Zz47CisgICAgICAgICAgICAgICAgcHdyMTgtc3VwcGx5ID0gPCZpdDY1MDVfcHAxOF9yZWc+Owor
ICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZwaW8gMTc5IDE+OworICAgICAgICAgICAg
ICAgIGhwZC1ncGlvcyA9IDwmcGlvIDkgMD47CisgICAgICAgICAgICAgICAgZXh0Y29uID0gPCZ1
c2JjX2V4dGNvbj47CisgICAgICAgIH07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggOTY3ZTc4Yy4uZmIzYjY0
MyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbApAQCAtNDYxLDYgKzQ2MSw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgog
ICAgIGRlc2NyaXB0aW9uOiBJbnRlcnNpbAogICAiXmlzc2ksLioiOgogICAgIGRlc2NyaXB0aW9u
OiBJbnRlZ3JhdGVkIFNpbGljb24gU29sdXRpb25zIEluYy4KKyAgIl5pdGUsLioiOgorICAgIGRl
c2NyaXB0aW9uOiBJVEUgVGVjaC4gSW5jLgogICAiXml0ZWFkLC4qIjoKICAgICBkZXNjcmlwdGlv
bjogSVRFQUQgSW50ZWxsaWdlbnQgU3lzdGVtcyBDby5MdGQKICAgIl5pd2F2ZSwuKiI6Ci0tIAox
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
