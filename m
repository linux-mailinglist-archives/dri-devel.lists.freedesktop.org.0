Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712F2CD6B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5E6E28A;
	Tue, 28 May 2019 17:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 242CA89C98
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:18:52 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AA3D080F3;
 Tue, 28 May 2019 10:19:10 +0000 (UTC)
Date: Tue, 28 May 2019 03:18:47 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190528101847.GN5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
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
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkwNTI4IDEwOjA1XToK
PiBPbiAyOC8wNS8yMDE5IDEyOjM5LCBUb255IExpbmRncmVuIHdyb3RlOgo+ID4gSGksCj4gPiAK
PiA+ICogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gWzE5MDUyOCAwOTox
OV06Cj4gPiA+IE9uIDI3LzA1LzIwMTkgMTQ6MjEsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cj4gPiA+
IAo+ID4gPiA+ID4gTG9va3MgZ29vZCB0byBtZS4gRm9yIHNvbWUgcmVhc29uIEkgY2FuJ3QgYm9v
dCA1LjItcmMyIChvbiB4MTUpIHNvIEkgaGF2ZW4ndAo+ID4gPiA+ID4gYmVlbiBhYmxlIHRvIHRl
c3QgeWV0LiBJJ2xsIHBpY2sgdGhlIHNlcmllcyB1cCBpbiBhbnkgY2FzZSwgYW5kIEknbGwgdGVz
dCBpdAo+ID4gPiA+ID4gd2hlbiBJIGdldCB0aGUga2VybmVsIGJvb3RpbmcuCj4gPiA+ID4gCj4g
PiA+ID4gR3JlYXQgZ29vZCB0byBoYXZlIHRoZXNlIG1lcmdlZCBmaW5hbGx5IDopCj4gPiA+ID4g
Cj4gPiA+ID4gSG1tIEkgd29uZGVyIGlmIHNvbWUgeDE1IG1vZGVscyBhcmUgYWZmZWN0ZWQgYnkg
dGhlIFNvQyB2YXJpYW50Cj4gPiA+ID4gY2hhbmdlcyBxdWV1ZWQgaW4gbXkgZml4ZXMgYnJhbmNo
Pwo+ID4gPiAKPiA+ID4gVGhpcyBpcyB3aGF0IEkgc2VlIHdpdGggZWFybHljb24sIG9uIGxpbnV4
LW9tYXAgZml4ZXMgYnJhbmNoLiBJIHRoaW5rIHRoaXMgbG9va3MKPiA+ID4gc2ltaWxhciB0byB3
aGF0IEkgc2F3IHdpdGggZHJhNzYgX3dpdGhvdXRfIHRoZSBmaXhlcy4KPiA+IAo+ID4gT0sgc291
bmRzIGxpa2Ugd2UgbmVlZCB0byB1c2Ugc29tZSBkaWZmZXJlbnQgU29DIHNwZWNpZmljIC5kdHNp
IGZpbGUsCj4gPiBpcyB0aGlzIG1heWJlIHgxNSByZXYgYz8KPiA+IAo+ID4gWW91IGNhbiBkZXRl
Y3Qgd2hpY2ggbW9kdWxlcyBmYWlsIGJhc2VkIG9uIHRoZSBtb2R1bGUgYmFzZSBhZGRyZXNzCj4g
PiBmb3IgcmV2aXNpb24gcmVnaXN0ZXIgc2VlbiB3aXRoIHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0
Y2guIFRoZW4KPiA+IHRob3NlIG5lZWQgdG8gYmUgdGFnZ2VkIHdpdGggc3RhdHVzID0gImRpc2Fi
bGVkIiBhdCB0aGUgbW9kdWxlCj4gPiBsZXZlbCBpbiB0aGUgU29DIHNwZWNpZmljIGR0c2kgZmls
ZS4KPiAKPiBbICAgIDEuMzcwNjA5XSB0aS1zeXNjIDRhZTIwMDAwLnRhcmdldC1tb2R1bGU6IHBy
b2JpbmcgZGV2aWNlCj4gCj4gVGhpcyBjaGFuZ2UgbGV0cyBtZSBib290LiBJIGRvbid0IGtub3cg
dGhhdCdzIHRoZSBjb3JyZWN0IHBsYWNlLCB0aG91Z2g6Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2FtNTcyOC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW01NzI4LmR0c2kK
PiBpbmRleCA4MmU1NDI3ZWY2YTkuLmM3NzhmOWE4NmIzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9hbTU3MjguZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNTcyOC5k
dHNpCj4gQEAgLTMxLDMgKzMxLDcgQEAKPiAmYXRsX3RtIHsKPiAgICAgICAgc3RhdHVzID0gImRp
c2FibGVkIjsKPiB9Owo+ICsKPiArJnRpbWVyMTIgewo+ICsgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsKPiArfTsKCk9LIHdlIHNob3VsZCBkaXNhYmxlIGl0IGF0IHRoZSB0YXJnZXQtbW9kdWxl
IGxldmVsIHRob3VnaC4gSW50ZXJlc3RpbmcKdGhhdCByZWFkaW5nIHRoZSByZXZpc2lvbiByZWdp
c3RlciB3b3JrcyB3aXRoIHRoZSBhYm92ZSwgb3IgbWF5YmUgeW91CnN0aWxsIGdldCBzb21lIHdh
cm5pbmc/Cgo+IE15IGJvYXJkIGlzIHgxNSByZXYgQTMsIGF0dGFjaGVkIHRvIEFNNSBFVk0uIEkn
dmUgYWxzbyBhdHRhY2hlZCBteSBrZXJuZWwKPiBjb25maWcuCgpTdHJhbmdlIHRoYXQgdGhpcyBp
cyBub3QgYWZmZWN0aW5nIG90aGVyIHgxNT8gSSB0aGluayB0aW1lcjEyIHdvdWxkCmJlIGJsb2Nr
ZWQgb24gSFMgZGV2aWNlcyB0aG91Z2g/CgpSZWdhcmRzLAoKVG9ueQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
