Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE21D03B1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02DF6E8A4;
	Tue,  8 Oct 2019 23:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95AE6E8A4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:00:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 75A41283BB8
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] RK3288 Gamma LUT
Date: Tue,  8 Oct 2019 20:00:35 -0300
Message-Id: <20191008230038.24037-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
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

Rm9sbG93aW5nIFNlYW4ncyBjb21tZW50cywgaGVyZSdzIGEgbmV3IHZlcnNpb24uCgpPbiB0aGlz
IG5ldyBpdGVyYXRpb24sIHdlIG1vZGlmeSB0aGUgR0FNTUEgTFVUCm9uIC5hdG9taWNfZW5hYmxl
IGFuZCAuYXRvbWljX2JlZ2luLgoKV2l0aCB0aGlzIGNoYW5nZSwgdGhlIEdBTU1BIHNldHRpbmdz
IGFyZSBlZmZlY3RpdmVseQpyZS1hcHBsaWVkIGFmdGVyIHJlc3VtaW5nIHRoZSBtYWNoaW5lLCBz
byB0aGUgcHJldmlvdXMKcGF0Y2ggIlJGQzogZHJtL2F0b21pYy1oZWxwZXI6IFJlYXBwbHkgY29s
b3IgdHJhbnNmb3JtYXRpb24gYWZ0ZXIKcmVzdW1lIiBpcyBub3cgZHJvcHBlZC4KCkFsc28sIEkg
ZHJvcHBlZCBSZXZpZXdlZC1ieXMgdGFncyBvbiBwYXRjaCAyLCBnaXZlbgp0aGUgaW1wbGVtZW50
YXRpb24gaXMgYSBiaXQgZGlmZmVyZW50IG5vdy4KClRoYW5rcyEKCkV6ZXF1aWVsIEdhcmNpYSAo
Myk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJvY2tjaGlwOiBkb2N1bWVudCBWT1AgZ2FtbWEg
TFVUIGFkZHJlc3MKICBkcm0vcm9ja2NoaXA6IEFkZCBvcHRpb25hbCBzdXBwb3J0IGZvciBDUlRD
IGdhbW1hIExVVAogIEFSTTogZHRzOiByb2NrY2hpcDogQWRkIFJLMzI4OCBWT1AgZ2FtbWEgTFVU
IGFkZHJlc3MKCiAuLi4vZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0ICAgICAgICAg
fCAgIDYgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpICAgICAgICAgICAgICAgICB8
ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jICAgIHwg
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgICB8IDEy
NSArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wLmggICB8ICAgNSArCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9w
X3JlZy5jICAgfCAgIDIgKwogNiBmaWxlcyBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
