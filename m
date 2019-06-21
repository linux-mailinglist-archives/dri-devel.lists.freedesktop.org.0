Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F144F04C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 23:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537756E927;
	Fri, 21 Jun 2019 21:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD026E927
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 21:13:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 13480260195
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] RK3288 Gamma LUT
Date: Fri, 21 Jun 2019 18:13:43 -0300
Message-Id: <20190621211346.1324-1-ezequiel@collabora.com>
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
cyBiZWVuIHRlc3RlZCBvbiBhIFJvY2syIFNxdWFyZSBib2FyZCwgdXNpbmcKYSBoYWNrZWQgJ21v
ZGV0ZXN0JyB0b29sLCB3aXRoIGxlZ2FjeSBhbmQgYXRvbWljIEFQSXMuIAoKVGhhbmtzLApFemUK
CkNoYW5nZXMgZnJvbSB2MToKKiBkcm9wIGV4cGxpY2l0IGxpbmVhciBMVVQgYWZ0ZXIgZmluZGlu
ZyBhIHByb3BlcgogIHdheSB0byBkaXNhYmxlIGdhbW1hIGNvcnJlY3Rpb24uCiogYXZvaWQgc2V0
dGluZyBnYW1tYSBpcyB0aGUgQ1JUQyBpcyBub3QgYWN0aXZlLgoqIHMvaW50L3Vuc2lnbmVkIGlu
dCBhcyBzdWdnZXN0ZWQgYnkgSmFjb3BvLgoqIG9ubHkgZW5hYmxlIGNvbG9yIG1hbmFnZW1lbnQg
YW5kIHNldCBnYW1tYSBzaXplCiAgaWYgZ2FtbWEgTFVUIGlzIHN1cHBvcnRlZCwgc3VnZ2VzdGVk
IGJ5IERvdWcuCiogZHJvcCB0aGUgcmVnLW5hbWVzIHVzYWdlLCBhbmQgaW5zdGVhZCBqdXN0IHVz
ZSBpbmRleGVkIHJlZwogIHNwZWNpZmllcnMsIHN1Z2dlc3RlZCBieSBEb3VnLgoKQ2hhbmdlcyBm
cm9tIFJGQzoKKiBSZXF1ZXN0IChhbiBvcHRpb25hbCkgYWRkcmVzcyByZXNvdXJjZSBmb3IgdGhl
IExVVC4KKiBBZGQgZGV2aWNldHJlZSBjaGFuZ2VzLgoqIERyb3Agc3VwcG9ydCBmb3IgUkszMzk5
LCB3aGljaCBkb2Vzbid0IHNlZW0gdG8gd29yawogIG91dCBvZiB0aGUgYm94IGFuZCBuZWVkcyBt
b3JlIHJlc2VhcmNoLgoqIFN1cHBvcnQgcGFzcy10aHJ1IHNldHRpbmcgd2hlbiBHQU1NQV9MVVQg
aXMgTlVMTC4KKiBBZGQgYSBjaGVjayBmb3IgdGhlIGdhbW1hIHNpemUsIGFzIHN1Z2dlc3RlZCBi
eSBJbGlhLgoqIE1vdmUgZ2FtbWEgc2V0dGluZyB0byBhdG9taWNfY29tbWl0X3RhaWwsIGFzIHBv
aW50ZWQKICBvdXQgYnkgSmFjb3BvL0xhdXJlbnQsIGlzIHRoZSBjb3JyZWN0IHdheS4KCkV6ZXF1
aWVsIEdhcmNpYSAoMyk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJvY2tjaGlwOiBkb2N1bWVu
dCBWT1AgZ2FtbWEgTFVUIGFkZHJlc3MKICBkcm0vcm9ja2NoaXA6IEFkZCBvcHRpb25hbCBzdXBw
b3J0IGZvciBDUlRDIGdhbW1hIExVVAogIEFSTTogZHRzOiByb2NrY2hpcDogQWRkIFJLMzI4OCBW
T1AgZ2FtbWEgTFVUIGFkZHJlc3MKCiAuLi4vZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3Au
dHh0ICAgICAgICAgfCAgIDYgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpICAgICAg
ICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV9mYi5jICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wLmMgICB8IDExNCArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wLmggICB8ICAgNyArKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX3ZvcF9yZWcuYyAgIHwgICAyICsKIDYgZmlsZXMgY2hhbmdlZCwgMTMzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
