Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E29D3E24
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 13:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A9C6EC16;
	Fri, 11 Oct 2019 11:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D236EC16
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 11:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 30AD3290DC9
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] AFBC for Rockchip
Date: Fri, 11 Oct 2019 13:18:09 +0200
Message-Id: <20191011111813.20851-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBBRkJDIHN1cHBvcnQgZm9yIFJvY2tjaGlwLgpJdCBpcyBpbnNwaXJl
ZCBieToKCmh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3RoaXJk
X3BhcnR5L2tlcm5lbC8rL3JlZnMvaGVhZHMvZmFjdG9yeS1ncnUtOTAxNy5CLWNocm9tZW9zLTQu
NC9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCgpUaGUgZmlyc3Qg
cGF0Y2ggZmFjdG9ycyBvdXQgc29tZSBhZmJjIGhlbHBlciBmdW5jdGlvbnMgZnJvbSBtYWxpZHAs
CmFzIHRoZXkgYXJlIHVzZWZ1bCBpbiBnZW5lcmFsLiBUaGUgc2Vjb25kIHBhdGNoIGFkZHMgaW1w
bGVtZW50YXRpb24gcHJvcGVyCm9mIEFGQkMgc3VwcG9ydCBmb3IgUm9ja2NoaXAuCgpBbmRyemVq
IFBpZXRyYXNpZXdpY3ogKDIpOgogIGRybS9hcm06IEZhY3RvciBvdXQgZ2VuZXJpYyBhZmJjIGhl
bHBlcnMKICBkcm0vcm9ja2NoaXA6IEFkZCBzdXBwb3J0IGZvciBhZmJjCgogZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0v
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hcm0v
S2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxp
ZHBfZHJ2LmMgICAgICAgICAgICB8ICA1OCArLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9h
ZmJjLmMgICAgICAgICAgICAgICAgICB8IDExNCArKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvS2NvbmZpZyAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyAgfCAgNDMgKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgMTQwICsrKysrKysrKysrKysrKysrKyst
CiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oIHwgIDEyICsrCiBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jIHwgIDg2ICsrKysrKysr
KysrLQogaW5jbHVkZS9kcm0vZHJtX2FmYmMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAyNSAr
KysrCiAxMSBmaWxlcyBjaGFuZ2VkLCA0MjcgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9hZmJjLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fYWZiYy5oCgotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
