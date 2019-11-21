Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C2105882
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 18:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC826F4B6;
	Thu, 21 Nov 2019 17:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293EC6F4B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 17:22:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 6B708291CC3
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv3/RFC 0/4] AFBC rework and support for Rockchip
Date: Thu, 21 Nov 2019 18:22:43 +0100
Message-Id: <20191121172247.31150-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119083429.GA2881@jamwan02-TSP300>
References: <20191119083429.GA2881@jamwan02-TSP300>
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
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djIuLnYzOgoKLSBhZGRyZXNzZWQgKHNvbWUpIGNvbW1lbnRzIGZyb20gRGFuaWVsIFN0b25lLCBM
aXZpdSBEdWRhdSwgRGFuaWVsIFZldHRlcgphbmQgQnJpYW4gU3RhcmtleSAtIHRoYW5rIHlvdSBh
bGwKCkluIHRoaXMgaXRlcmF0aW9uIHNvbWUgcmV3b3JrIGhhcyBiZWVuIGRvbmUuIFRoZSBjaGVj
a2luZyBsb2dpYyBpcyBub3cgbW92ZWQKdG8gZnJhbWVidWZmZXJfY2hlY2soKSBzbyBpdCBpcyBj
b21tb24gdG8gYWxsIGRyaXZlcnMuIEJ1dCB0aGUgY29tbW9uIHBhcnQKaXMgbm90IGdvb2QgZm9y
IGtvbWVkYSwgc28gdGhpcyBzZXJpZXMgaXMgbm90IGdvb2QgZm9yIG1lcmdpbmcgeWV0LgpJIGtp
bmRseSBhc2sgZm9yIGZlZWRiYWNrIHdoZXRoZXIgdGhlIGNoYW5nZXMgYXJlIGluIHRoZSByaWdo
dCBkaXJlY3Rpb24uCkkgYWxzbyBraW5kbHkgYXNrIGZvciBpbnB1dCBvbiBob3cgdG8gYWNjb21t
b2RhdGUga29tZWRhLgoKVGhlIENPTkZJR19EUk1fQUZCQyBvcHRpb24gaGFzIGJlZW4gZWxpbWlu
YXRlZCBpbiBmYXZvdXIgb2YgYWRkaW5nCmRybV9hZmJjLmMgdG8gZHJtX2ttc19oZWxwZXIuCgp2
MS4udjI6CgpUaGlzIHNlcmllcyBhZGRzIEFGQkMgc3VwcG9ydCBmb3IgUm9ja2NoaXAuIEl0IGlz
IGluc3BpcmVkIGJ5OgoKaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVt
b3MvdGhpcmRfcGFydHkva2VybmVsLysvcmVmcy9oZWFkcy9mYWN0b3J5LWdydS05MDE3LkItY2hy
b21lb3MtNC40L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKCi0g
YWRkcmVzc2VkIGNvbW1lbnRzIGZyb20gRGFuaWVsIFN0b25lLCBBeWFuIEhhbGRlciwgTWloYWls
IEF0YW5hc3NvdgotIGNvZGluZyBzdHlsZSBmaXhlcwoKQW5kcnplaiBQaWV0cmFzaWV3aWN6ICg0
KToKICBkcm0vYXJtOiBGYWN0b3Igb3V0IGdlbmVyaWMgYWZiYyBoZWxwZXJzCiAgZHJtL21hbGlk
cDogdXNlIGFmYmMgaGVscGVycwogIGRybS9rb21lZGE6IFVzZSBhZmJjIGhlbHBlcgogIGRybS9y
b2NrY2hpcDogQWRkIHN1cHBvcnQgZm9yIGFmYmMKCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ZyYW1lYnVmZmVyLmMgICB8ICAxNyArLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRw
X2Rydi5jICAgICAgICAgICAgICB8IDEyMSArKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fYWZiYy5jICAgICAgICAgICAgICAgICAgICB8ICA4NCArKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2RybV9mb3VyY2MuYyAgICAgICAgICAgICAgICAgIHwgIDExICstCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgICAgICAgICAgICAgfCAgNzEgKysrKysrKystCiBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgICAgfCAgMjkgKysrKwog
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyAgIHwgMTQyICsrKysr
KysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
aCAgIHwgIDEyICsrCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5j
ICAgfCAgODQgKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9hZmJjLmggICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzNSArKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgNDg1IGluc2VydGlvbnMo
KyksIDEyMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2FmYmMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9hZmJjLmgKCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
