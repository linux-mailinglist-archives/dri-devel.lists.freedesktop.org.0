Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D90C36CD5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B24B8961E;
	Thu,  6 Jun 2019 07:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE049898A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:41 +0000 (UTC)
X-UUID: eb367cf3db7e48d5bdea2deeab260d56-20190605
X-UUID: eb367cf3db7e48d5bdea2deeab260d56-20190605
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1175874861; Wed, 05 Jun 2019 19:43:34 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:31 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 01/27] dt-bindings: mediatek: add binding for mt8183 display
Date: Wed, 5 Jun 2019 19:42:40 +0800
Message-ID: <1559734986-7379-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpVcGRhdGUg
ZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGlvbiBmb3IgdGhlIGRpc3BsYXkgc3Vic3lzdGVt
IGZvcgpNZWRpYXRlayBNVDgxODMgU09DcwoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8
eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAzNCArKysrKysrKysrKysrLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAppbmRleCA4NDY5ZGU1Li43MDc3MGZlIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkaXNwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dApAQCAtMjcsMjAgKzI3LDIw
IEBAIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRwaS50eHQuCiAKIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9j
a3MpOgogLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssPGNoaXA+LWRpc3AtPGZ1bmN0aW9uPiIsIG9u
ZSBvZgotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiICAgLSBvdmVybGF5ICg0IGxheWVycywg
YmxlbmRpbmcsIGNzYykKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYSIgIC0gcmVhZCBETUEg
LyBsaW5lIGJ1ZmZlcgotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIiAgLSB3cml0ZSBETUEK
LQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiIC0gY29sb3IgcHJvY2Vzc29yCi0JIm1lZGlh
dGVrLDxjaGlwPi1kaXNwLWFhbCIgICAtIGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJvbGxl
cgotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIgLSBnYW1tYSBjb3JyZWN0aW9uCi0JIm1l
ZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAtIG1lcmdlIHN0cmVhbXMgZnJvbSB0d28gUkRNQSBz
b3VyY2VzCi0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXNwbGl0IiAtIHNwbGl0IHN0cmVhbSB0byB0
d28gZW5jb2RlcnMKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgIC0gZGF0YSBjb21wcmVz
c2lvbiBlbmdpbmUKLQkibWVkaWF0ZWssPGNoaXA+LWRzaSIgICAgICAgIC0gRFNJIGNvbnRyb2xs
ZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0Ci0JIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAgICAgICAt
IERQSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHBpLnR4dAotCSJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1tdXRleCIgLSBkaXNwbGF5IG11dGV4Ci0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAg
ICAtIG92ZXJkcml2ZQotICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10MjcxMiBh
bmQgbXQ4MTczLgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiICAgCQktIG92ZXJsYXkgKDQg
bGF5ZXJzLCBibGVuZGluZywgY3NjKQorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1yZG1hIiAgCQkt
IHJlYWQgRE1BIC8gbGluZSBidWZmZXIKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atd2RtYSIgIAkJ
LSB3cml0ZSBETUEKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiIAkJLSBjb2xvciBwcm9j
ZXNzb3IKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtYWFsIiAgIAkJLSBhZGFwdGl2ZSBhbWJpZW50
IGxpZ2h0IGNvbnRyb2xsZXIKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiIAkJLSBnYW1t
YSBjb3JyZWN0aW9uCisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAJCS0gbWVyZ2Ugc3Ry
ZWFtcyBmcm9tIHR3byBSRE1BIHNvdXJjZXMKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQi
IAkJLSBzcGxpdCBzdHJlYW0gdG8gdHdvIGVuY29kZXJzCisJIm1lZGlhdGVrLDxjaGlwPi1kaXNw
LXVmb2UiICAJCS0gZGF0YSBjb21wcmVzc2lvbiBlbmdpbmUKKwkibWVkaWF0ZWssPGNoaXA+LWRz
aSIgICAgICAgIAkJLSBEU0kgY29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRzaS50eHQKKwkibWVk
aWF0ZWssPGNoaXA+LWRwaSIgICAgICAgIAkJLSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVr
LGRwaS50eHQKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtbXV0ZXgiIAkJLSBkaXNwbGF5IG11dGV4
CisJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAJCS0gb3ZlcmRyaXZlCisgIHRoZSBzdXBw
b3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyLCBtdDgxNzMgYW5kIG10ODE4My4KIC0gcmVn
OiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sg
cmVnaXN0ZXIgc3BhY2UKIC0gaW50ZXJydXB0czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0
aGUgZnVuY3Rpb24gYmxvY2sgKHJlcXVpcmVkLCBleGNlcHQgZm9yCiAgIG1lcmdlIGFuZCBzcGxp
dCBmdW5jdGlvbiBibG9ja3MpLgpAQCAtNzEsNiArNzEsMTIgQEAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgewogCSNjbG9jay1jZWxscyA9IDwxPjsKIH07CiAKK2Rpc3BsYXlfY29t
cG9uZW50czogZGlzcHN5c0AxNDAwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTgzLWRpc3BsYXkiOworCQlyZWcgPSA8MCAweDE0MDAwMDAwIDAgMHgxMDAwPjsKKwkJcG93ZXIt
ZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5fRElTUD47Cit9OworCiBvdmww
OiBvdmxAMTQwMGMwMDAgewogCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3Atb3Zs
IjsKIAlyZWcgPSA8MCAweDE0MDBjMDAwIDAgMHgxMDAwPjsKLS0gCjEuOC4xLjEuZGlydHkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
