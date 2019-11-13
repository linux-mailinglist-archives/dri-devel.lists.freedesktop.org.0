Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB832FC117
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED266E1B6;
	Thu, 14 Nov 2019 08:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6E6ECBA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:04:14 +0000 (UTC)
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C1341C000F;
 Wed, 13 Nov 2019 10:04:07 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v7 0/7] drm: rcar-du: Add Color Management Module (CMM)
Date: Wed, 13 Nov 2019 11:05:49 +0100
Message-Id: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW4gYWRkaXRpb25hbCByb3VuZCBmb3IgY21tIHRvIGZpeCB0aGUgS0NvbmZpZyBpc3N1ZSByZXBv
cnRlZCBieSBEYXZlIHNwb3R0ZWQKd2hpbGUgY29sbGVjdGluZyBMYXVyZW50J3MgcHVsbCByZXF1
ZXN0IGZvciB0aGUgdjUuNSBtZXJnZSB3aW5kb3csIHdoaWNoIHdlJ3ZlCm5vdyBtaXNzZWQuCgpJ
IGNvdWxkIGhhdmUgc2VudCBhIDYuMiB2ZXJzaW9uIG9mIHRoZSBzaW5nbGUgMy83IHBhdGNoLCBi
dXQgZ2l2ZW4gSSBhbHJlYWR5CnNlbnQgYSA2LjEgZm9yIHRoaXMgc2FtZSBvbmUsIEkgYXNzdW1l
ZCBhIHNpbmdsZSBzZXJpZXMgd291bGQgaGF2ZSBiZWVuCmVhc2llciB0byBjb2xsZWN0LCBjb25z
aWRlcmluZyB3ZSdyZSBhbnl3YXkgbGF0ZSBmb3IgdGhpcyBtZXJnZSB3aW5kb3cuCgpUaGUgRFRT
IHBhdGNoZXMgaGF2ZSBiZWVuIGNvbGxlY3RlZCBieSBHZWVydCBhbHJlYWR5LgoKVGhhbmtzCiAg
IGoKCkRldGFpbGVkIHYxLT52NSBjaGFuZ2UgbG9nCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5
LzEwLzE1LzMzNwoKdjYtPnY3Ci0gSW5jbHVkZSB0aGUgdHdvIHVwZGF0ZXMgZm9yIDMvNyBhbmQg
NS83IEkndmUgc2VudCBhcyB2Ni4xIGFnYWluc3QgdGhlIHY2CiAgc2VyaWVzCi0gTWFrZSB0aGUg
RFJNX1JDQVJfQ01NIHN5bWJvbCBhIHRyaXN0YXRlIGFuZCBtYWtlIGl0IGltcGxpZWQgYnkgRFJN
X1JDQVJfRFUKICB0byBwcmV2ZW50IGhhdmluZyBEVSBidWlsdC1pbiBhbmQgQ01NIGhhcyBhIG1v
ZHVsZSwgd2hpY2ggY2F1c2VzIGxpbmthZ2UKICBlcnJvcnMgZHVlIHRvIHVucmVzb2x2ZWQgc3lt
Ym9scy4KCkphY29wbyBNb25kaSAoNyk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXMs
Y21tOiBBZGQgUi1DYXIgQ01NIGRvY3VtZW50YXRpb24KICBkdC1iaW5kaW5nczogZGlzcGxheSwg
cmVuZXNhcyxkdTogRG9jdW1lbnQgY21tcyBwcm9wZXJ0eQogIGRybTogcmNhci1kdTogQWRkIHN1
cHBvcnQgZm9yIENNTQogIGRybTogcmNhci1kdToga21zOiBJbml0aWFsaXplIENNTSBpbnN0YW5j
ZXMKICBkcm06IHJjYXItZHU6IGNydGM6IENvbnRyb2wgQ01NIG9wZXJhdGlvbnMKICBkcm06IHJj
YXItZHU6IGNydGM6IFJlZ2lzdGVyIEdBTU1BX0xVVCBwcm9wZXJ0aWVzCiAgZHJtOiByY2FyLWR1
OiBrbXM6IEV4cGFuZCBjb21tZW50IGluIHZzcHMgcGFyc2luZyByb3V0aW5lCgogLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCAgICAgICAgIHwgIDY3ICsrKysrKwogLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgICAgICAgICAgIHwgICA1ICsKIGRyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L0tjb25maWcgICAgICAgICAgICAgICB8ICAgOCArCiBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9jbW0uYyAgICAgICAgICAgIHwgMjEyICsrKysrKysrKysrKysrKysr
KwogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9jbW0uaCAgICAgICAgICAgIHwgIDU4ICsr
KysrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyAgICAgICAgfCAgNjUg
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuaCAgICAgICAgfCAg
IDIgKwogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuaCAgICAgICAgIHwgICAy
ICsKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYyAgICAgICB8ICAxMCAr
CiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2dyb3VwLmggICAgICAgfCAgIDIgKwog
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyAgICAgICAgIHwgIDgyICsrKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5oICAgICAgICB8ICAgNSAr
CiAxMyBmaWxlcyBjaGFuZ2VkLCA1MTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JlbmVzYXMsY21tLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2NtbS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9jbW0uaAoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
