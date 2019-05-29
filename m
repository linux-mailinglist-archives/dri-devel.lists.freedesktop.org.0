Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF62DBA3
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5176E2C8;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 376C26E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 08:10:43 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 851638027;
 Wed, 29 May 2019 08:11:01 +0000 (UTC)
Date: Wed, 29 May 2019 01:10:38 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190529081038.GP5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
 <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
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
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkwNTI5IDA3OjA2XToK
PiBPbiAyOC8wNS8yMDE5IDEzOjE4LCBUb255IExpbmRncmVuIHdyb3RlOgo+IAo+ID4gPiBNeSBi
b2FyZCBpcyB4MTUgcmV2IEEzLCBhdHRhY2hlZCB0byBBTTUgRVZNLiBJJ3ZlIGFsc28gYXR0YWNo
ZWQgbXkga2VybmVsCj4gPiA+IGNvbmZpZy4KPiA+IAo+ID4gU3RyYW5nZSB0aGF0IHRoaXMgaXMg
bm90IGFmZmVjdGluZyBvdGhlciB4MTU/IEkgdGhpbmsgdGltZXIxMiB3b3VsZAo+ID4gYmUgYmxv
Y2tlZCBvbiBIUyBkZXZpY2VzIHRob3VnaD8KPiAKPiBTZWVtcyB0aGF0IHRoZSBrZXJuZWwgY29u
ZmlnIGFmZmVjdHMuIG9tYXAycGx1c19kZWZjb25maWcgYm9vdHMgb2suCgpPSywgdGhpcyBsaW5l
IGluIHlvdXIgb29wczoKClVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0
IHZpcnR1YWwgYWRkcmVzcyA1YTVhNWE1YQoKUHJvYmFibHkgbWVhbnMgd2UgaGl0IHNvbWUgc2xh
YiBwb2lzb24gd2l0aCBERUJVR19TTEFCIHNldC4KTG9va3MgbGlrZSB5b3VyIGNvbmZpZyBib290
cyBmaW5lIHdpdGggREVCVUdfU0xBQiBkaXNhYmxlZApmb3IgbWUuCgpBcyB0aGlzIG9ubHkgaGFw
cGVucyBmb3IgdGltZXIxMiwgSSB3b25kZXIgaWYgd2UncmUgYWdhaW4KaGl0dGluZyBzb21lIHVu
Y29tcHJlc3MgaXNzdWUgd2l0aCBjb3JydXB0ZWQgZHRiLiBDaGFuZ2luZwp1LWJvb3QgZnRkYWRk
ciBoaWdoZXIgdXAgbWlnaHQgcG9zc2libHkgbWFrZSBpdCBnbyBhd2F5LgpPciBlbHNlIHRoZXJl
J3MgYSBidWcgZWxzZXdoZXJlIDopCgpSZWdhcmRzLAoKVG9ueQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
