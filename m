Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FDD3994
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AEB6EBA7;
	Fri, 11 Oct 2019 06:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9CB36EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:24:11 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 565B580BB;
 Thu, 10 Oct 2019 13:24:44 +0000 (UTC)
Date: Thu, 10 Oct 2019 06:24:07 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191010132407.GS5610@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
 <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
Cc: linux-omap@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkxMDEwIDA2OjQ4XToK
PiBPbiAwOC8xMC8yMDE5IDE3OjIxLCBUb255IExpbmRncmVuIHdyb3RlOgo+ID4gKiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkxMDA4IDE0OjE3XToKPiA+ID4gT24g
MDgvMTAvMjAxOSAxNzoxMywgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPiA+ID4gPiAqIFRvbWkgVmFs
a2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IFsxOTA5MzAgMTA6MzhdOgo+ID4gPiA+ID4g
SWYgdXNlX21jbGsgaXMgZmFsc2UsIG1jbGtfbW9kZSBpcyB3cml0dGVuIHRvIGEgcmVnaXN0ZXIg
d2l0aG91dAo+ID4gPiA+ID4gaW5pdGlhbGl6YXRpb24uIFRoaXMgZG9lc24ndCBjYXVzZSBhbnkg
aWxsIGVmZmVjdHMgYXMgdGhlIHdyaXR0ZW4gdmFsdWUKPiA+ID4gPiA+IGlzIG5vdCB1c2VkIHdo
ZW4gdXNlX21jbGsgaXMgZmFsc2UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRvIGZpeCB0aGlzLCB3
cml0ZSB1c2VfbWNsayBvbmx5IHdoZW4gdXNlX21jbGsgaXMgdHJ1ZS4KPiA+ID4gPiAKPiA+ID4g
PiBIZXkgbmljZSBjYXRjaC4gQmFzZWQgb24gYSBxdWljayB0ZXN0IGxvb2tzIGxpa2UgdGhpcyBm
aXhlcyBhbgo+ID4gPiA+IGlzc3VlIHdoZXJlIHBvd2VyIGNvbnN1bXB0aW9uIHN0YXlzIGhpZ2hl
ciBhZnRlciB1c2luZyBIRE1JLgo+ID4gPiA+IAo+ID4gPiA+IFdvdWxkIGJlIG5pY2UgdG8gaGF2
ZSBtZXJnZWQgaW4gdGhlIHY1LjQtcmMgc2VyaWVzOgo+ID4gPiA+IAo+ID4gPiA+IFRlc3RlZC1i
eTogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT4KPiA+ID4gCj4gPiA+IFJlYWxseT8g
T2ssIHdlbGwsIHRoZW4gaXQgd2FzIGEgZ29vZCByYW5kb20gZmluZCA9KS4KPiA+IAo+ID4gWWVh
aCBzbyBpdCBzZWVtcyA6KSBFYXJsaWVyIEkgdGhvdWdodCB0aGVyZSdzIHN0aWxsIHNvbWUKPiA+
IGNsa2N0cmwgc2V0dGluZyB3cm9uZyBhZnRlciB1c2luZyBIRE1JLCBidXQgZGlkIG5vdCBzZWUK
PiA+IGFueXRoaW5nIGRpZmZpbmcgdGhlIGNsa2N0cmwgcmVnaXN0ZXJzIGJlZm9yZSBhbmQgYWZ0
ZXIKPiA+IGFuZCBnYXZlIHVwLgo+ID4gCj4gPiA+IEkgZGlkIGFscmVhZHkgcHVzaCB0aGlzIHRv
IGRybS1taXNjLW5leHQsIGFzIEkgdGhvdWdodCBpdCBkb2VzIG5vdCBoYXZlIGFueQo+ID4gPiBy
ZWFsIGVmZmVjdC4gSSdsbCBjaGVjayBpZiBpdCdzIG9rIHRvIHB1c2ggdG8gZHJtLW1pc2MtZml4
ZXMgdG9vLCB3aXRoIENjCj4gPiA+IHN0YWJsZS4KPiA+IAo+ID4gT0sgZ3JlYXQgdGhhbmtzLgo+
IAo+IFB1c2hpbmcgdGhpcyB0byBmaXhlcyB0b28gd291bGQgY2F1c2UgY29uZmxpY3RzLCBzbyB3
ZSBzaG91bGRuJ3QgcHVzaAo+IHdpdGhvdXQgZ29vZCByZWFzb24uIEhvdyBtdWNoIHBvd2VyIHNh
dmluZyB5b3Ugc2VlPwoKU3VyZSBubyBydXNoIHdpdGggdGhpcyBvbmUuIEkgc2hvdWxkIGFsc28g
dGVzdCBhZ2FpbiB0aGF0IGl0CnJlYWxseSBmaXhlcyB0aGUgaXNzdWUgSSdtIHNlZWluZy4KCkht
bSBzbyB3aGF0IHJlZ2lzdGVyIGRvZXMgdGhpcyBjbG9jayBhY3R1YWxseSBjaGFuZ2U/CgpJJ20g
c2VlaW5nIGFuIGluY3JlYXNlIG9mIGZldyB0ZW5zIG9mIGV4dHJhIG1XLCB3aGljaCBtZWFucyBh
dApsZWFzdCBvbmUgZGF5IG9mIHN0YW5kYnkgdGltZSBsZXNzIGZvciBtZSA6KSBJdCBkb2VzIG5v
dCBoYXBwZW4KYWx3YXlzLCBtYXliZSBoYWxmIG9mIHRoZSB0aW1lLgoKPiBJIHRoaW5rIHRoaXMg
Y2FuIHN0aWxsIGJlIHNlbnQgdG8gc3RhYmxlIGxhdGVyLCBhZnRlciBpdCBoYXMgYmVlbiBtZXJn
ZWQgdG8KPiBtYWlubGluZS4KClllcyBzdXJlLgoKVGhhbmtzLAoKVG9ueQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
