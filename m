Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC24AD6A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 23:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB8D6E25B;
	Tue, 18 Jun 2019 21:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92216E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:36:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id BB3BF2610BE
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] RK3288 Gamma LUT
Date: Tue, 18 Jun 2019 18:34:03 -0300
Message-Id: <20190618213406.7667-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGV0J3Mgc3VwcG9ydCBHYW1tYSBMVVQgY29uZmlndXJhdGlvbiBvbiBSSzMyODggU29Dcy4KCklu
IG9yZGVyIHRvIGRvIHNvLCB0aGlzIHNlcmllcyBhZGRzIGEgbmV3IGFuZCBvcHRpb25hbAphZGRy
ZXNzIHJlc291cmNlLgogICAgCkEgc2VwYXJhdGUgYWRkcmVzcyByZXNvdXJjZSBpcyByZXF1aXJl
ZCBiZWNhdXNlIG9uIHRoaXMgUkszMjg4LAp0aGUgTFVUIGFkZHJlc3MgaXMgYWZ0ZXIgdGhlIE1N
VSBhZGRyZXNzLCB3aGljaCBpcyByZXF1ZXN0ZWQKYnkgdGhlIGlvbW11IGRyaXZlci4gVGhpcyBw
cmV2ZW50cyB0aGUgRFJNIGRyaXZlcgpmcm9tIHJlcXVlc3RpbmcgYW4gZW50aXJlIHJlZ2lzdGVy
IHNwYWNlLgoKVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gd29ya3MgZm9yIFJHQiAxMC1iaXQg
dGFibGVzLCBhcyB0aGF0CmlzIHdoYXQgc2VlbXMgdG8gd29yayBvbiBSSzMyODguCgpUaGlzIGhh
cyBiZWVuIHRlc3RlZCBvbiBSb2NrMiBTcXVhcmUgYm9hcmQsIHVzaW5nCmEgaGFja2VkICdtb2Rl
dGVzdCcgdG9vbCwgd2l0aCBsZWdhY3kgYW5kIGF0b21pYyBBUElzLiAKClRoYW5rcywKRXplCgpD
aGFuZ2VzIGZyb20gUkZDOgoqIFJlcXVlc3QgKGFuIG9wdGlvbmFsKSBhZGRyZXNzIHJlc291cmNl
IGZvciB0aGUgTFVULgoqIEFkZCBkZXZpY2V0cmVlIGNoYW5nZXMuCiogRHJvcCBzdXBwb3J0IGZv
ciBSSzMzOTksIHdoaWNoIGRvZXNuJ3Qgc2VlbSB0byB3b3JrCiAgb3V0IG9mIHRoZSBib3ggYW5k
IG5lZWRzIG1vcmUgcmVzZWFyY2guCiogU3VwcG9ydCBwYXNzLXRocnUgc2V0dGluZyB3aGVuIEdB
TU1BX0xVVCBpcyBOVUxMLgoqIEFkZCBhIGNoZWNrIGZvciB0aGUgZ2FtbWEgc2l6ZSwgYXMgc3Vn
Z2VzdGVkIGJ5IElsaWEuCiogTW92ZSBnYW1tYSBzZXR0aW5nIHRvIGF0b21pY19jb21taXRfdGFp
bCwgYXMgcG9pbnRlZAogIG91dCBieSBKYWNvcG8vTGF1cmVudCwgaXMgdGhlIGNvcnJlY3Qgd2F5
LgoKRXplcXVpZWwgR2FyY2lhICgzKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogcm9ja2NoaXA6
IGRvY3VtZW50IFZPUCBnYW1tYSBMVVQgYWRkcmVzcwogIGRybS9yb2NrY2hpcDogQWRkIG9wdGlv
bmFsIHN1cHBvcnQgZm9yIENSVEMgZ2FtbWEgTFVUCiAgQVJNOiBkdHM6IHJvY2tjaGlwOiBBZGQg
UkszMjg4IFZPUCBnYW1tYSBMVVQgYWRkcmVzcwoKIC4uLi9kaXNwbGF5L3JvY2tjaGlwL3JvY2tj
aGlwLXZvcC50eHQgICAgICAgICB8ICAxMCArLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0
c2kgICAgICAgICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX2ZiLmMgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV92b3AuYyAgIHwgMTA2ICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuaCAgIHwgICA3ICsrCiBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jICAgfCAgIDIgKwogNiBmaWxlcyBjaGFuZ2VkLCAx
MzEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
