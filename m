Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED460EB28F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 15:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42746E0B7;
	Thu, 31 Oct 2019 14:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7C6E0B7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 14:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id EE504290879
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 0/4] Genericize DW MIPI DSI bridge and add i.MX 6 driver
Date: Thu, 31 Oct 2019 16:26:29 +0200
Message-Id: <20191031142633.12460-1-adrian.ratiu@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGF2aW5nIGEgZ2VuZXJpYyBTeW5vcHNpcyBEZXNpZ25XYXJlIE1JUEktRFNJIGhvc3QgY29udHJv
bGxlciBicmlkZ2UKZHJpdmVyIGlzIGEgdmVyeSBnb29kIGlkZWEsIGhvd2V2ZXIgdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gaGFzCmhhcmRjb2RlZCBxdWl0ZSBhIGxvdCBvZiB0aGUgcmVnaXN0
ZXIgbGF5b3V0cyB1c2VkIGJ5IHRoZSB0d28gc3VwcG9ydGVkClNvQyB2ZW5kb3JzLCBTVE0gYW5k
IFJvY2tjaGlwLCB3aGljaCB1c2UgSVAgY29yZXMgdjEuMzAgYW5kIHYxLjMxLgoKVGhpcyBtYWtl
cyBpdCBoYXJkIHRvIHN1cHBvcnQgb3RoZXIgU29DIHZlbmRvcnMgbGlrZSB0aGUgRlNML05YUCBp
Lk1YIDYKd2hpY2ggdXNlIG9sZGVyIHYxLjAxIGNvcmVzIG9yIGZ1dHVyZSB2ZXJzaW9ucyBiZWNh
dXNlLCBiYXNlZCBvbiBoaXN0b3J5LApsYXlvdXQgY2hhbmdlcyBzaG91bGQgYWxzbyBiZSBleHBl
Y3RlZCBpbiBuZXcgRFNJIHZlcnNpb25zIC8gU29Dcy4KClRoaXMgcGF0Y2ggc2VyaWVzIGNvbnZl
cnRzIHRoZSBicmlkZ2UgYW5kIHBsYXRmb3JtIGRyaXZlcnMgdG8gYWNjZXNzCnJlZ2lzdGVycyB2
aWEgZ2VuZXJpYyByZWdtYXAgQVBJcyBhbmQgYWxsb3dzIGVhY2ggcGxhdGZvcm0gZHJpdmVyIHRv
CmNvbmZpZ3VyZSBpdHMgcmVnaXN0ZXIgbGF5b3V0IHZpYSBzdHJ1Y3QgcmVnX2ZpZWxkcywgdGhl
biBhZGRzIHN1cHBvcnQKZm9yIHRoZSBob3N0IGNvbnRyb2xsZXIgZm91bmQgb24gaS5NWCA2LgoK
SSBvbmx5IGhhdmUgaS5NWCBoYXJkd2FyZSB3aXRoIE1JUEktRFNJIHBhbmVsIGFuZCByZWxldmFu
dCBkb2N1bWVudGF0aW9uCmF2YWlsYWJsZSBmb3IgdGVzdGluZyBzbyBJJ2xsIHJlYWxseSBhcHBy
ZWNpYXRlIGl0IGlmIHNvbWVvbmUgY291bGQgdGVzdAp0aGUgc2VyaWVzIG9uIFJvY2tjaGlwIGFu
ZCBTVE0uLi4gZXllYmFsbGluZyByZWdpc3RlciBmaWVsZHMgY291bGQgb25seQpnZXQgbWUgc28g
ZmFyLCBzbyBzb3JyeSBpbiBhZHZhbmNlIGZvciBhbnkgYnJlYWthZ2UhCgpNYW55IHRoYW5rcyB0
byBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiBmb3IKc3Vn
Z2VzdGluZyB0aGUgcmVnbWFwIHNvbHV0aW9uIGFuZCB0byBMaXUgWWluZyA8WWluZy5MaXVAZnJl
ZXNjYWxlLmNvbT4KZm9yIGRvaW5nIHRoZSBpbml0aWFsIGkuTVggcGxhdGZvcm0gZHJpdmVyIGlt
cGxlbWVudGF0aW9uLgoKVGhpcyBzZXJpZXMgYXBwbGllcyBvbiB0b3Agb2YgbGF0ZXN0IGxpbnV4
LW5leHQgdHJlZSwgbmV4dC0yMDE5MTAzMS4KCkFkcmlhbiBSYXRpdSAoNCk6CiAgZHJtOiBicmlk
Z2U6IGR3X21pcGlfZHNpOiBhY2Nlc3MgcmVnaXN0ZXJzIHZpYSBhIHJlZ21hcAogIGRybTogYnJp
ZGdlOiBkd19taXBpX2RzaTogYWJzdHJhY3QgcmVnaXN0ZXIgYWNjZXNzIHVzaW5nIHJlZ19maWVs
ZHMKICBkcm06IGlteDogQWRkIGkuTVggNiBNSVBJIERTSSBob3N0IGRyaXZlcgogIGR0LWJpbmRp
bmdzOiBkaXNwbGF5OiBhZGQgSU1YIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlciBkb2MKCiAuLi4v
YmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0ICAgICAgICAgfCAgNTYgKysKIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDUxOCArKysrKysrKyst
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8
ICAgNyArCiBkcml2ZXJzL2dwdS9kcm0vaW14L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9ncHUvZHJtL2lteC9kd19taXBpX2RzaS1pbXguYyAgICAgICAgIHwgNTAy
ICsrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2Nr
Y2hpcC5jICAgfCAxNTQgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0
bS5jICAgICAgICAgfCAxNjAgKysrKystCiBpbmNsdWRlL2RybS9icmlkZ2UvZHdfbWlwaV9kc2ku
aCAgICAgICAgICAgICAgfCAgNjAgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTE4NSBpbnNlcnRpb25z
KCspLCAyNzMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4dAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pbXgvZHdfbWlwaV9kc2ktaW14LmMKCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
