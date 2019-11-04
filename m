Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59CEEDFA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 23:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387626E89C;
	Mon,  4 Nov 2019 22:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E586E89A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 22:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 30E5628B940
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv2 0/4] AFBC support for Rockchip
Date: Mon,  4 Nov 2019 23:12:24 +0100
Message-Id: <20191104221228.3588-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2485717.1SzL54aMiy@e123338-lin>
References: <2485717.1SzL54aMiy@e123338-lin>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-rockchip@lists.infradead.org, James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBBRkJDIHN1cHBvcnQgZm9yIFJvY2tjaGlwLiBJdCBpcyBpbnNwaXJl
ZCBieToKCmh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3RoaXJk
X3BhcnR5L2tlcm5lbC8rL3JlZnMvaGVhZHMvZmFjdG9yeS1ncnUtOTAxNy5CLWNocm9tZW9zLTQu
NC9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCgpUaGUgZmlyc3Qg
cGF0Y2ggZmFjdG9ycyBvdXQgc29tZSBhZmJjIGhlbHBlciBmdW5jdGlvbnMsIGFzIHRoZXkgYXJl
IHVzZWZ1bAppbiBnZW5lcmFsLiBUaGUgc2Vjb25kIGFuZCB0aGlyZCBwYXRjaGVzIHVzZSB0aGUg
aGVscGVycyBhbmQgdGhlIGZvdXJ0aCBwYXRjaAphZGRzIGltcGxlbWVudGF0aW9uIHByb3BlciBv
ZiBBRkJDIHN1cHBvcnQgZm9yIFJvY2tjaGlwLgoKdjEuLnYyOgoKLSBhZGRyZXNzZWQgY29tbWVu
dHMgZnJvbSBEYW5pZWwgU3RvbmUsIEF5YW4gSGFsZGVyLCBNaWhhaWwgQXRhbmFzc292Ci0gY29k
aW5nIHN0eWxlIGZpeGVzCgpBbmRyemVqIFBpZXRyYXNpZXdpY3ogKDQpOgogIGRybS9hcm06IEZh
Y3RvciBvdXQgZ2VuZXJpYyBhZmJjIGhlbHBlcnMKICBkcm0vbWFsaWRwOiB1c2UgYWZiYyBoZWxw
ZXJzCiAgZHJtL2tvbWVkYTogdXNlIGFmYmMgaGVscGVycwogIGRybS9yb2NrY2hpcDogQWRkIHN1
cHBvcnQgZm9yIGFmYmMKCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDggKwogZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oICAg
fCAgIDEgLQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyAgIHwg
IDQ0ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgICAgICAgICAgICAg
IHwgIDY2ICsrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2FmYmMuYyAgICAgICAgICAgICAg
ICAgICAgfCAxMjkgKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL0tj
b25maWcgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fZmIuYyAgICB8ICA0MiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wLmMgICB8IDE0MSArKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmggICB8ICAxMiArKwogZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyAgIHwgIDg0ICsrKysrKysrKystCiBpbmNs
dWRlL2RybS9kcm1fYWZiYy5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzYgKysrKysKIDEz
IGZpbGVzIGNoYW5nZWQsIDQ4MCBpbnNlcnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2FmYmMuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvZHJtL2RybV9hZmJjLmgKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
