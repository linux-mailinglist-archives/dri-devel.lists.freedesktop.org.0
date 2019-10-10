Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B7D20F2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AC76EA91;
	Thu, 10 Oct 2019 06:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7216EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 06:47:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A6lOu2076120;
 Thu, 10 Oct 2019 01:47:24 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A6lOeF121766
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 01:47:24 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 01:47:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 01:47:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A6lM6R097714;
 Thu, 10 Oct 2019 01:47:22 -0500
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
To: Tony Lindgren <tony@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
Date: Thu, 10 Oct 2019 09:47:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008142153.GD5610@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570690044;
 bh=2NGrdRhVIoqIsmWEZIYwhT9Oqhp/c16vKGI/TuQoJAk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MHjM9V635XgecZ6pTSWcyFvBfSrZfsO3ksWR3bnCyHHYSIVYfbzXbqML+Tht7hJYj
 Dnv0aYwVVQEs6iIs03/AlZV+n0Y+jGKudkZMRUIYs2K+3fUBn81YxRe3UnTIvivSPz
 yt5zjLJdxbqD4qtdWeckthFxr8AHJvzhV1dFBsmA=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTAvMjAxOSAxNzoyMSwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPiAqIFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IFsxOTEwMDggMTQ6MTddOgo+PiBPbiAwOC8xMC8y
MDE5IDE3OjEzLCBUb255IExpbmRncmVuIHdyb3RlOgo+Pj4gKiBUb21pIFZhbGtlaW5lbiA8dG9t
aS52YWxrZWluZW5AdGkuY29tPiBbMTkwOTMwIDEwOjM4XToKPj4+PiBJZiB1c2VfbWNsayBpcyBm
YWxzZSwgbWNsa19tb2RlIGlzIHdyaXR0ZW4gdG8gYSByZWdpc3RlciB3aXRob3V0Cj4+Pj4gaW5p
dGlhbGl6YXRpb24uIFRoaXMgZG9lc24ndCBjYXVzZSBhbnkgaWxsIGVmZmVjdHMgYXMgdGhlIHdy
aXR0ZW4gdmFsdWUKPj4+PiBpcyBub3QgdXNlZCB3aGVuIHVzZV9tY2xrIGlzIGZhbHNlLgo+Pj4+
Cj4+Pj4gVG8gZml4IHRoaXMsIHdyaXRlIHVzZV9tY2xrIG9ubHkgd2hlbiB1c2VfbWNsayBpcyB0
cnVlLgo+Pj4KPj4+IEhleSBuaWNlIGNhdGNoLiBCYXNlZCBvbiBhIHF1aWNrIHRlc3QgbG9va3Mg
bGlrZSB0aGlzIGZpeGVzIGFuCj4+PiBpc3N1ZSB3aGVyZSBwb3dlciBjb25zdW1wdGlvbiBzdGF5
cyBoaWdoZXIgYWZ0ZXIgdXNpbmcgSERNSS4KPj4+Cj4+PiBXb3VsZCBiZSBuaWNlIHRvIGhhdmUg
bWVyZ2VkIGluIHRoZSB2NS40LXJjIHNlcmllczoKPj4+Cj4+PiBUZXN0ZWQtYnk6IFRvbnkgTGlu
ZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+Cj4+Cj4+IFJlYWxseT8gT2ssIHdlbGwsIHRoZW4gaXQg
d2FzIGEgZ29vZCByYW5kb20gZmluZCA9KS4KPiAKPiBZZWFoIHNvIGl0IHNlZW1zIDopIEVhcmxp
ZXIgSSB0aG91Z2h0IHRoZXJlJ3Mgc3RpbGwgc29tZQo+IGNsa2N0cmwgc2V0dGluZyB3cm9uZyBh
ZnRlciB1c2luZyBIRE1JLCBidXQgZGlkIG5vdCBzZWUKPiBhbnl0aGluZyBkaWZmaW5nIHRoZSBj
bGtjdHJsIHJlZ2lzdGVycyBiZWZvcmUgYW5kIGFmdGVyCj4gYW5kIGdhdmUgdXAuCj4gCj4+IEkg
ZGlkIGFscmVhZHkgcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQsIGFzIEkgdGhvdWdodCBpdCBk
b2VzIG5vdCBoYXZlIGFueQo+PiByZWFsIGVmZmVjdC4gSSdsbCBjaGVjayBpZiBpdCdzIG9rIHRv
IHB1c2ggdG8gZHJtLW1pc2MtZml4ZXMgdG9vLCB3aXRoIENjCj4+IHN0YWJsZS4KPiAKPiBPSyBn
cmVhdCB0aGFua3MuCgpQdXNoaW5nIHRoaXMgdG8gZml4ZXMgdG9vIHdvdWxkIGNhdXNlIGNvbmZs
aWN0cywgc28gd2Ugc2hvdWxkbid0IHB1c2ggCndpdGhvdXQgZ29vZCByZWFzb24uIEhvdyBtdWNo
IHBvd2VyIHNhdmluZyB5b3Ugc2VlPwoKSSB0aGluayB0aGlzIGNhbiBzdGlsbCBiZSBzZW50IHRv
IHN0YWJsZSBsYXRlciwgYWZ0ZXIgaXQgaGFzIGJlZW4gbWVyZ2VkIAp0byBtYWlubGluZS4KCiAg
VG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFp
a2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
