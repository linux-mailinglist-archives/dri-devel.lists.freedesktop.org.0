Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645342C640D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 12:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AA6EB8C;
	Fri, 27 Nov 2020 11:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7B46EB8C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:45:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ARBjP3f092480;
 Fri, 27 Nov 2020 05:45:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606477525;
 bh=g6KNlqoIDvu9JY8ZlxhjEAu/FsaRsM0aCN3qUSkC3vg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XuRw3A4lfGXTDvCKI5KOX/7jz3wUlJn4Yn1Pg6SnWiowWyH4TAmaOTB955CZ16GDz
 UUUMBd1VNBT9uJ6b1NAu55VMgyIh8wkmf3TDrC7g2/2Ujdgbq9u20kShDthrSGAkUW
 Rz48JXDNXA2pJu5fSF/Zzbt5ZqU30xJzkDyOzv28=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ARBjPCj115056
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Nov 2020 05:45:25 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 27
 Nov 2020 05:45:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 27 Nov 2020 05:45:24 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ARBjMaS001898;
 Fri, 27 Nov 2020 05:45:23 -0600
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
Date: Fri, 27 Nov 2020 13:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMTEvMjAyMCAwMToxNywgSXZheWxvIERpbWl0cm92IHdyb3RlOgo+IEhpIFRvbWksCj4g
Cj4gT24gMjYuMTEuMjAg0LMuIDE2OjExINGHLiwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+IEhp
IEFhcm8sIEl2YXlsbywKPj4KPj4gT24gMjQvMTEvMjAyMCAyMzowMywgSXZheWxvIERpbWl0cm92
IHdyb3RlOgo+Pgo+Pj4gSXMgdGhlcmUgYW55IHByb2dyZXNzIG9uIHRoZSBpc3N1ZT8gSSB0cmll
ZCA1LjkuMSBhbmQgc3RpbGwgbm90aGluZyBkaXNwbGF5ZWQuCj4+Cj4+IENhbiB5b3UgdGVzdCB0
aGUgYXR0YWNoZWQgcGF0Y2g/Cj4+Cj4gCj4gV2l0aCB0aGlzIHBhdGNoIEkgZG9uJ3Qgc2VlIG9v
cHMgdGhhdCBBYXJvIHJlcG9ydGVkLCBzbzoKPiAKPiBUZXN0ZWQtYnk6IEl2YXlsbyBEaW1pdHJv
diA8aXZvLmcuZGltaXRyb3YuNzVAZ21haWwuY29tPgo+IAo+IFNlZW1zIHRvIGZpeCB0aGUgcGFy
dGljdWxhciBpc3N1ZSwgaG93ZXZlciwgbm93IHdlIGdldCBhbm90aGVyIG9vcHMuIEFzIHRoaXMg
aXMgbm90IHVwc3RyZWFtIGtlcm5lbAo+IGJ1dCBvbmUgd2l0aCBQVlIgcmVsYXRlZCBwYXRjaGVz
LCBJIHdpbGwgdHJ5IGFnYWluIHdpdGggdmFuaWxsYSA1LjkuCj4gCj4gSnVzdCBpbiBjYXNlIG9v
cHMgcmluZ3MgYW55IGJlbGxzICh0aGUgbGluZSBpbiBxdWVzdGlvbiBpcwo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9tYWVtby1sZXN0ZS9kcm9pZDQtbGludXgvYmxvYi9tYWVtby01LjkvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyNMODAxKQoKRG8gdGhlIFBWUiBwYXRjaGVzIHRvdWNo
IG9tYXBkcm0/IFRoZSBjYWxsIHN0YWNrIGxvb2tzIGxpa2Ugbm9ybWFsIGJvb3QgdGltZSBwcm9i
aW5nIHN0dWZmLCBub3QKc29tZXRoaW5nIGhhcHBlbmluZyBsYXRlciAocG9zc2libHkgZnJvbSBQ
VlIpLgoKIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5r
YXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4g
S290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
