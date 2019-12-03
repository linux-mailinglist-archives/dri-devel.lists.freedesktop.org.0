Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B010FFD7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A626E5E1;
	Tue,  3 Dec 2019 14:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FD86E5DB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 14:15:24 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D199C27FB0C;
 Tue,  3 Dec 2019 14:15:22 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Date: Tue,  3 Dec 2019 15:15:04 +0100
Message-Id: <20191203141515.3597631-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWltcyBhdCBhZGRpbmcgc3VwcG9ydCBmb3IgcnVudGltZSBidXMt
Zm9ybWF0Cm5lZ290aWF0aW9uIGJldHdlZW4gYWxsIGVsZW1lbnRzIG9mIHRoZQonZW5jb2RlciAt
PiBicmlkZ2VzIC0+IGNvbm5lY3Rvci9kaXNwbGF5JyBzZWN0aW9uIG9mIHRoZSBwaXBlbGluZS4K
CkluIG9yZGVyIHRvIHN1cHBvcnQgdGhhdCwgd2UgbmVlZCBkcm0gYnJpZGdlcyB0byBmdWxseSB0
YWtlIHBhcnQgaW4gdGhlCmF0b21pYyBzdGF0ZSB2YWxpZGF0aW9uIHByb2Nlc3MsIHdoaWNoIHJl
cXVpcmVzIGFkZGluZyBhCmRybV9icmlkZ2Vfc3RhdGUgYW5kIGEgbmV3IGRybV9icmlkZ2VfZnVu
Y3MuYXRvbWljX2NoZWNrKCkgaG9vay4KT25jZSB0aG9zZSBiYXNpYyBidWlsZGluZyBibG9ja3Mg
YXJlIGluIHBsYWNlLCB3ZSBjYW4gYWRkIG5ldyBob29rcyB0bwphbGxvdyBidXMgZm9ybWF0IG5l
Z290aWF0aW9uICh0aG9zZSBhcmUgY2FsbGVkIGp1c3QgYmVmb3JlCi0+YXRvbWljX2NoZWNrKCkp
LiBUaGUgYnVzIGZvcm1hdCBzZWxlY3Rpb24gaXMgZG9uZSBhdCBydW50aW1lIGJ5CnRlc3Rpbmcg
YWxsIHBvc3NpYmxlIGNvbWJpbmF0aW9ucyBhY3Jvc3MgdGhlIHdob2xlIGJyaWRnZSBjaGFpbiB1
bnRpbApvbmUgaXMgcmVwb3J0ZWQgdG8gd29yay4KCk5vIE1ham9yIGNoYW5nZXMgaW4gdGhpcyB2
NC4gSSB0aGluayBJIGFkZHJlc3NlZCBhbGwgY29tbWVudHMgSSBnb3QKZnJvbSBOZWlsIGFuZCBM
YXVyZW50ICh0aGFua3MgZm9yIHRoZSBkZXRhaWxlZCByZXZpZXdzIEJUVykuIE5vdGUgdGhhdAp0
aGlzIHZlcnNpb24gb25seSBjb250YWlucyBjb3JlIGNoYW5nZXMuIE9uY2UgdGhvc2UgY2hhbmdl
cyBhcmUgbWVyZ2VkCkknbGwgc2VuZCB0aGUgaW14L3BhbmVsL2x2ZHMtY29kZWMgc3BlY2lmaWMg
Yml0cy4KCkEgbW9yZSBkZXRhaWxlZCBjaGFuZ2Vsb2cgaXMgcHJvdmlkZWQgaW4gZWFjaCBwYXRj
aC4KClRoaXMgcGF0Y2ggc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGhlcmUgWzFdLgoKVGhhbmtz
LAoKQm9yaXMKClsxXWh0dHBzOi8vZ2l0aHViLmNvbS9iYnJlemlsbG9uL2xpbnV4LTBkYXkvY29t
bWl0cy9kcm0tYnJpZGdlLWJ1c2ZtdC12NAoKQm9yaXMgQnJlemlsbG9uICgxMSk6CiAgZHJtL2Jy
aWRnZTogUmVuYW1lIGJyaWRnZSBoZWxwZXJzIHRhcmdldGluZyBhIGJyaWRnZSBjaGFpbgogIGRy
bS9icmlkZ2U6IEludHJvZHVjZSBkcm1fYnJpZGdlX2dldF9uZXh0X2JyaWRnZSgpCiAgZHJtOiBT
dG9wIGFjY2Vzc2luZyBlbmNvZGVyLT5icmlkZ2UgZGlyZWN0bHkKICBkcm0vYnJpZGdlOiBNYWtl
IHRoZSBicmlkZ2UgY2hhaW4gYSBkb3VibGUtbGlua2VkIGxpc3QKICBkcm0vYnJpZGdlOiBBZGQg
dGhlIGRybV9mb3JfZWFjaF9icmlkZ2VfaW5fY2hhaW4oKSBoZWxwZXIKICBkcm0vYnJpZGdlOiBB
ZGQgdGhlIGRybV9icmlkZ2VfZ2V0X3ByZXZfYnJpZGdlKCkgaGVscGVyCiAgZHJtL2JyaWRnZTog
Q2xhcmlmeSB0aGUgYXRvbWljIGVuYWJsZS9kaXNhYmxlIGhvb2tzIHNlbWFudGljcwogIGRybS9i
cmlkZ2U6IEFkZCBhIGRybV9icmlkZ2Vfc3RhdGUgb2JqZWN0CiAgZHJtL2JyaWRnZTogUGF0Y2gg
YXRvbWljIGhvb2tzIHRvIHRha2UgYSBkcm1fYnJpZGdlX3N0YXRlCiAgZHJtL2JyaWRnZTogQWRk
IGFuIC0+YXRvbWljX2NoZWNrKCkgaG9vawogIGRybS9icmlkZ2U6IEFkZCB0aGUgbmVjZXNzYXJ5
IGJpdHMgdG8gc3VwcG9ydCBidXMgZm9ybWF0IG5lZ290aWF0aW9uCgogLi4uL2RybS9icmlkZ2Uv
YW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jICAgIHwgIDQxICstCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pYy5jICAgICAgICAgICAgICAgICAgfCAgMzkgKwogZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmMgICAgICAgICAgIHwgIDUzICstCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2JyaWRnZS5jICAgICAgICAgICAgICAgICAgfCA3NTYgKysrKysrKysrKysrKysrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYyAgICAgICAgICAgICAgICAgfCAgMTUgKy0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgICAgICAgICAgICB8ICAgNCArLQogZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jICAgICAgIHwgIDEzICstCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vZWRwL2VkcF9icmlkZ2UuYyAgICAgICAgICB8ICAxMCArLQogZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2VuY29kZXIuYyAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jICAgICAgICB8ICAxMCArLQogZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfZHNpLmMgICAgICAgICAgICAgICAgIHwgIDE4ICstCiBpbmNsdWRlL2RybS9k
cm1fYXRvbWljLmggICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogaW5jbHVkZS9kcm0vZHJt
X2JyaWRnZS5oICAgICAgICAgICAgICAgICAgICAgIHwgNDA0ICsrKysrKysrKy0KIGluY2x1ZGUv
ZHJtL2RybV9lbmNvZGVyLmggICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogMTYgZmlsZXMg
Y2hhbmdlZCwgMTE3NCBpbnNlcnRpb25zKCspLCAyMTQgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
