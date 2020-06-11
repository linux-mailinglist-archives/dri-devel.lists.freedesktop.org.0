Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C011F658E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 12:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359076E07F;
	Thu, 11 Jun 2020 10:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898C86E041
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 10:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 638E02A38CE
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 0/5] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date: Thu, 11 Jun 2020 12:23:51 +0200
Message-Id: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
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
LXRvLURWSSBlbmNvZGVyCnRvIGpzb24tc2NoZW1hLgoKVGhpcyBhbHNvIGZpeGVzIGEgbWlub3Ig
YnVnIGluIHRoZSB0aS10ZnA0MTAgZHJpdmVyIHRoYXQgd291bGQgY2F1c2UgYQp3cm9uZyBjYWxj
dWxhdGlvbiBvZiB0aGUgc2V0dXAgYW5kIGhvbGQgdGltZXMgd2hlbiB0aGUgZGUtc2tldyBmZWF0
dXJlCmlzIGVuYWJsZWQuIFRoZSByZXRyaWV2YWwgb2YgdGhlIGRlLXNrZXcgdmFsdWUgZnJvbSB0
aGUgRFQgaGFzIGFsc28gYmVlbgp1cGRhdGVkIHRvIHJlZmxlY3QgdGhlIGJpbmRpbmcgY2hhbmdl
cy4KCkNoYW5nZXMgaW4gdjM6CgogIC0gdGksdGZwNDEwLnlhbWwKICAgIC0gT3JpZ2luYWwgdHJh
bnNsYXRpb24gdG8geWFtbCBzZXBhcmF0ZWQgaW50byBpdHMgb3duIGNvbW1pdCB3aXRoIG5vCiAg
ICAgIGFkZGl0aW9uYWwgY2hhbmdlcyAoTGF1cmVudCBQaW5jaGFydCkuCiAgICAtIFJlZGVmaW5p
dGlvbiBvZiB0aSxkZXNrZXcgcHJvcGVydHkgaW4gaXRzIG93biBjb21taXQgKExhdXJlbnQpLgog
ICAgLSBSZW1vdmFsIG9mIHVubmVjZXNzYXJ5IHRleHQgKExhdXJlbnQpLgogICAgLSBOZXcgY29u
ZGl0aW9uYWwgY29uc3RyYWludCBmb3IgdGksZGVza2V3IChMYXVyZW50KS4KICAgIC0gInBvcnRz
IiBub2RlIHNldCBhcyBvcHRpb25hbCAoUm9iIEhlcnJpbmcpLgoKICAtIGRvdmUtc2JjLWE1MTAu
ZHRzOiByZW1vdmVkLiBUaGlzIGNvbWVzIGZyb20gUm9iJ3Mgc3VnZ2VzdGlvbiB0aGF0CiAgICB0
aGUgInBvcnRzIiBub2RlIHNob3VsZCBiZSBvcHRpb25hbCBpbnN0ZWFkIG9mIGRlZmluaW5nIGVt
cHR5IHBvcnQKICAgIG5vZGVzIGluIERUcyBmaWxlcy4KCiAgLSB0aS10ZnA0MTAuYwogICAgLSBP
cmlnaW5hbCBjaGFuZ2VzIHNwbGl0IGludG8gdHdvIGNvbW1pdHMuIFRoZSBmaXJzdCBvbmUgY2hh
bmdlcyB0aGUKICAgICAgZGF0YXR5cGUgYW5kIHJldHJpZXZhbCBvZiB0aGUgZGVza2V3IHByb3Bl
cnR5LiBUaGUgc2Vjb25kIG9uZQogICAgICBmaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgaG9sZCBh
bmQgc2V0dXAgdGltZXMgKExhdXJlbnQpLgoKVGhlIGJpbmRpbmdzIGhhdmUgYmVlbiB0ZXN0ZWQg
d2l0aDoKCiAgbWFrZSBkdF9iaW5kaW5nX2NoZWNrIEFSQ0g9PGFyY2g+IERUX1NDSEVNQV9GSUxF
Uz08Li4udGksdGZwNDEwLnlhbWw+CiAgbWFrZSBkdGJzX2NoZWNrIEFSQ0g9PGFyY2g+IERUX1ND
SEVNQV9GSUxFUz08Li4udGksdGZwNDEwLnlhbWw+Cgpmb3IgPGFyY2g+ID0gYXJtIGFuZCBhcm02
NC4KVGhpcyB1bmNvdmVyZWQgYSBudW1iZXIgb2YgZHRzIGZpbGVzIHRoYXQgdXNlIHRoZSBURlA0
MTAgYnV0IG5vdCB0aHJvdWdoCkkyQyBhbmQgZG9uJ3QgZGVmaW5lIHRoZSB0aSxkZXNrZXcgcHJv
cGVydHkuIFRoZXNlIHNob3VsZCBiZSBmaXhlZCBhdApzb21lIHBvaW50LgoKUmljYXJkbyBDYcOx
dWVsbyAoNSk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHRpLHRmcDQxMC50eHQ6IGNvbnZlcnQg
dG8geWFtbAogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiB0aSx0ZnA0MTAueWFtbDogUmVkZWZpbmUg
dGksZGVza2V3IHByb3BlcnR5CiAgZHJtL2JyaWRnZTogdGZwNDEwOiBmaXggZGUtc2tldyB2YWx1
ZSByZXRyaWV2YWwgZnJvbSBEVAogIGRybS9icmlkZ2U6IHRmcDQxMDogRml4IHNldHVwIGFuZCBo
b2xkIHRpbWUgY2FsY3VsYXRpb24KICBkdC1iaW5kaW5nczogZGlzcGxheTogdGksdGZwNDEwLnlh
bWw6IG1ha2UgdGhlIHBvcnRzIG5vZGUgb3B0aW9uYWwKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvdGksdGZwNDEwLnR4dCAgICAgfCAgNjYgLS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGksdGZwNDEwLnlhbWwgICAgfCAxMzAgKysrKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jICAgICAgICAgICAgfCAgMTAgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS90aSx0ZnA0MTAudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRmcDQxMC55YW1sCgotLSAKMi4xOC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
