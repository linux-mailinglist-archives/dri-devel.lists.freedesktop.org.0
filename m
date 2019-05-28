Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 443012CD5D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E776E277;
	Tue, 28 May 2019 17:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F48A88E88
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:39:57 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5C1A780F3;
 Tue, 28 May 2019 09:40:15 +0000 (UTC)
Date: Tue, 28 May 2019 02:39:52 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190528093952.GM5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoqIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IFsxOTA1MjggMDk6
MTldOgo+IE9uIDI3LzA1LzIwMTkgMTQ6MjEsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cj4gCj4gPj4g
TG9va3MgZ29vZCB0byBtZS4gRm9yIHNvbWUgcmVhc29uIEkgY2FuJ3QgYm9vdCA1LjItcmMyIChv
biB4MTUpIHNvIEkgaGF2ZW4ndAo+ID4+IGJlZW4gYWJsZSB0byB0ZXN0IHlldC4gSSdsbCBwaWNr
IHRoZSBzZXJpZXMgdXAgaW4gYW55IGNhc2UsIGFuZCBJJ2xsIHRlc3QgaXQKPiA+PiB3aGVuIEkg
Z2V0IHRoZSBrZXJuZWwgYm9vdGluZy4KPiA+IAo+ID4gR3JlYXQgZ29vZCB0byBoYXZlIHRoZXNl
IG1lcmdlZCBmaW5hbGx5IDopCj4gPiAKPiA+IEhtbSBJIHdvbmRlciBpZiBzb21lIHgxNSBtb2Rl
bHMgYXJlIGFmZmVjdGVkIGJ5IHRoZSBTb0MgdmFyaWFudAo+ID4gY2hhbmdlcyBxdWV1ZWQgaW4g
bXkgZml4ZXMgYnJhbmNoPwo+IAo+IFRoaXMgaXMgd2hhdCBJIHNlZSB3aXRoIGVhcmx5Y29uLCBv
biBsaW51eC1vbWFwIGZpeGVzIGJyYW5jaC4gSSB0aGluayB0aGlzIGxvb2tzCj4gc2ltaWxhciB0
byB3aGF0IEkgc2F3IHdpdGggZHJhNzYgX3dpdGhvdXRfIHRoZSBmaXhlcy4KCk9LIHNvdW5kcyBs
aWtlIHdlIG5lZWQgdG8gdXNlIHNvbWUgZGlmZmVyZW50IFNvQyBzcGVjaWZpYyAuZHRzaSBmaWxl
LAppcyB0aGlzIG1heWJlIHgxNSByZXYgYz8KCllvdSBjYW4gZGV0ZWN0IHdoaWNoIG1vZHVsZXMg
ZmFpbCBiYXNlZCBvbiB0aGUgbW9kdWxlIGJhc2UgYWRkcmVzcwpmb3IgcmV2aXNpb24gcmVnaXN0
ZXIgc2VlbiB3aXRoIHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0Y2guIFRoZW4KdGhvc2UgbmVlZCB0
byBiZSB0YWdnZWQgd2l0aCBzdGF0dXMgPSAiZGlzYWJsZWQiIGF0IHRoZSBtb2R1bGUKbGV2ZWwg
aW4gdGhlIFNvQyBzcGVjaWZpYyBkdHNpIGZpbGUuCgpSZWdhcmRzLAoKVG9ueQoKODwgLS0tLS0t
LS0tLS0tLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3RpLXN5c2MuYyBiL2RyaXZlcnMvYnVz
L3RpLXN5c2MuYwotLS0gYS9kcml2ZXJzL2J1cy90aS1zeXNjLmMKKysrIGIvZHJpdmVycy9idXMv
dGktc3lzYy5jCkBAIC0yMDY5LDYgKzIwNjksOCBAQCBzdGF0aWMgaW50IHN5c2NfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3Qgc3lzYyAqZGRhdGE7CiAJaW50IGVy
cm9yOwogCisJZGV2X2luZm8oJnBkZXYtPmRldiwgInByb2JpbmcgZGV2aWNlXG4iKTsKKwogCWRk
YXRhID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZGRhdGEpLCBHRlBfS0VSTkVM
KTsKIAlpZiAoIWRkYXRhKQogCQlyZXR1cm4gLUVOT01FTTsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
