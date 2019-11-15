Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C4FDB3A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B620589247;
	Fri, 15 Nov 2019 10:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA9866E3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 10:08:24 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 Nov 2019 18:05:14 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id xAFA57CE032119;
 Fri, 15 Nov 2019 18:05:07 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 15 Nov 2019 18:05:08 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v4 3/4] dt-bindings: Add binding for IT6505.
Date: Fri, 15 Nov 2019 17:52:19 +0800
Message-ID: <1573811564-320-4-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573811564-320-1-git-send-email-allen.chen@ite.com.tw>
References: <1573811564-320-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xAFA57CE032119
X-Mailman-Approved-At: Fri, 15 Nov 2019 10:23:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgoKQWRkIGEgRFQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBJVDY1MDUuCgpTaWduZWQtb2ZmLWJ5OiBBbGxlbiBDaGVuIDxh
bGxlbi5jaGVuQGl0ZS5jb20udHc+ClNpZ25lZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3Vu
QGNocm9taXVtLm9yZz4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUw
NS50eHQgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0CgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxp
dDY1MDUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2l0ZSxpdDY1MDUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwLi43
MmRhMGM0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0CkBAIC0wLDAgKzEsMjggQEAKK2lURSBp
dDY1MDUgRFAgYnJpZGdlIGJpbmRpbmdzCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisgICAgICAg
IC0gY29tcGF0aWJsZTogIml0ZSxpdDY1MDUiCisgICAgICAgIC0gcmVnOiBpMmMgYWRkcmVzcyBv
ZiB0aGUgYnJpZGdlCisgICAgICAgIC0gb3ZkZC1zdXBwbHk6IEkvTyB2b2x0YWdlCisgICAgICAg
IC0gcHdyMTgtc3VwcGx5OiBDb3JlIHZvbHRhZ2UKKyAgICAgICAgLSBpbnRlcnJ1cHRzOiBpbnRl
cnJ1cHQgc3BlY2lmaWVyIG9mIElOVCBwaW4KKyAgICAgICAgLSByZXNldC1ncGlvczogZ3BpbyBz
cGVjaWZpZXIgb2YgUkVTRVQgcGluCisJLSBocGQtZ3Bpb3M6CisJCUhvdHBsdWcgZGV0ZWN0IEdQ
SU8uCisJCUluZGljYXRlcyB3aGljaCBHUElPIHNob3VsZCBiZSB1c2VkIGZvciBob3RwbHVnIGRl
dGVjdGlvbgorCS0gcG9ydEBbeF06IFNvQyBzcGVjaWZpYyBwb3J0IG5vZGVzIHdpdGggZW5kcG9p
bnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZAorCQlpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0CisKK0V4YW1wbGU6CisJ
ZHAtYnJpZGdlQDVjIHsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIml0ZSxpdDY1MDUi
OworICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTUyIElSUV9UWVBFX0VER0VfUklTSU5H
IDE1MiAwPjsKKyAgICAgICAgICAgICAgICByZWcgPSA8MHg1Yz47CisgICAgICAgICAgICAgICAg
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKyAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8
Jml0NjUwNV9waW5zPjsKKyAgICAgICAgICAgICAgICBvdmRkLXN1cHBseSA9IDwmbXQ2MzU4X3Zz
aW0xX3JlZz47CisgICAgICAgICAgICAgICAgcHdyMTgtc3VwcGx5ID0gPCZpdDY1MDVfcHAxOF9y
ZWc+OworICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZwaW8gMTc5IDE+OworICAgICAg
ICAgICAgICAgIGhwZC1ncGlvcyA9IDwmcGlvIDkgMD47CisgICAgICAgICAgICAgICAgZXh0Y29u
ID0gPCZ1c2JjX2V4dGNvbj47CisgICAgICAgIH07Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
