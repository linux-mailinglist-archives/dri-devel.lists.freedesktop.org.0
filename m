Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC11FCA1B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 11:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4606E943;
	Wed, 17 Jun 2020 09:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8096E877
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id EA9E32A3876
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 0/4] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date: Wed, 17 Jun 2020 11:46:29 +0200
Message-Id: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgY29udmVydHMgdGhlIERUIGJpbmRpbmcgZm9yIHRoZSBUSSBURlA0MTAgRFBJ
LXRvLURWSSBlbmNvZGVyCnRvIGpzb24tc2NoZW1hLgoKSXQgYWxzbyBmaXhlcyBhIG1pbm9yIGJ1
ZyBpbiB0aGUgdGktdGZwNDEwIGRyaXZlciB0aGF0IGNhdXNlcyBhCndyb25nIGNhbGN1bGF0aW9u
IG9mIHRoZSBzZXR1cCBhbmQgaG9sZCB0aW1lcyB3aGVuIHRoZSBkZS1za2V3IGZlYXR1cmUKaXMg
ZW5hYmxlZC4gVGhlIHJldHJpZXZhbCBvZiB0aGUgZGUtc2tldyB2YWx1ZSBmcm9tIHRoZSBEVCBo
YXMgYWxzbyBiZWVuCnVwZGF0ZWQgdG8gcmVmbGVjdCB0aGUgYmluZGluZyBjaGFuZ2VzLgoKQ2hh
bmdlcyBpbiB2NDoKCiAgLSB0aSx0ZnA0MTAueWFtbDoKICAgIC0gInBvcnRzIiBub2RlIHNldCBi
YWNrIGFzIHJlcXVpcmVkIChMYXVyZW50IFBpbmNoYXJ0KS4gVGhpcyBtZWFucwogICAgICB0aGF0
IGRvdmUtc2JjLWE1MTAuZHRzIHdpbGwgbm90IGNvbXBseSB3aXRoIHRoZSBiaW5kaW5nIGFuZCB3
aWxsCiAgICAgIGhhdmUgdG8gYmUgZml4ZWQgYXQgc29tZSBwb2ludC4KClRoZSBiaW5kaW5ncyBo
YXZlIGJlZW4gdGVzdGVkIHdpdGg6CgogIG1ha2UgZHRfYmluZGluZ19jaGVjayBBUkNIPTxhcmNo
PiBEVF9TQ0hFTUFfRklMRVM9PC4uLnRpLHRmcDQxMC55YW1sPgogIG1ha2UgZHRic19jaGVjayBB
UkNIPTxhcmNoPiBEVF9TQ0hFTUFfRklMRVM9PC4uLnRpLHRmcDQxMC55YW1sPgoKZm9yIDxhcmNo
PiA9IGFybSBhbmQgYXJtNjQuClRoaXMgdW5jb3ZlcmVkIGEgbnVtYmVyIG9mIGR0cyBmaWxlcyB0
aGF0IHVzZSB0aGUgVEZQNDEwIGJ1dCBub3QgdGhyb3VnaApJMkMgYW5kIGRvbid0IGRlZmluZSB0
aGUgdGksZGVza2V3IHByb3BlcnR5LiBUaGVzZSBzaG91bGQgYWxzbyBiZSBmaXhlZC4KClJpY2Fy
ZG8gQ2HDsXVlbG8gKDQpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiB0aSx0ZnA0MTAudHh0OiBj
b252ZXJ0IHRvIHlhbWwKICBkdC1iaW5kaW5nczogZGlzcGxheTogdGksdGZwNDEwLnlhbWw6IFJl
ZGVmaW5lIHRpLGRlc2tldyBwcm9wZXJ0eQogIGRybS9icmlkZ2U6IHRmcDQxMDogZml4IGRlLXNr
ZXcgdmFsdWUgcmV0cmlldmFsIGZyb20gRFQKICBkcm0vYnJpZGdlOiB0ZnA0MTA6IEZpeCBzZXR1
cCBhbmQgaG9sZCB0aW1lIGNhbGN1bGF0aW9uCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3RpLHRmcDQxMC50eHQgICAgIHwgIDY2IC0tLS0tLS0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3RpLHRmcDQxMC55YW1sICAgIHwgMTMxICsrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyAgICAgICAgICAgIHwgIDEwICstCiAzIGZpbGVz
IGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
dGksdGZwNDEwLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbAoKLS0gCjIuMTguMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
