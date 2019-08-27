Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF19DED4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021AF89842;
	Tue, 27 Aug 2019 07:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6044B89842
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:35:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7Z3ts119904;
 Tue, 27 Aug 2019 02:35:03 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7Z2wR032828
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:35:03 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:35:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:35:01 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7Z0RY065568;
 Tue, 27 Aug 2019 02:35:00 -0500
Subject: Re: [PATCH v2 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <ae7bbfac-56ad-7193-d328-f3e2008ad0e9@ti.com>
 <20190826135141.GF5031@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3ebdf5ff-4269-7ce8-d742-913966dcdfda@ti.com>
Date: Tue, 27 Aug 2019 10:34:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826135141.GF5031@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566891303;
 bh=KVTWHWomYqRH00vXlZpqd4duo3MXeOQhNyIorpi6UbI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kBfxFgsViZHNeZXJoHVbZMcA4D1sW2Eksq/A3aw4VodCU56G+FvaX5eluoitmSrbU
 P3D7TVkkcx0Q1UGbAfrS3pu4n33qB83qwMWUtc0Kxv56pGHFYcjQUxdBxixZSvBWC/
 UUDis1bVS7myrUkzp2I5CIVznX90cp4CkDWn+9A0=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAxNjo1MSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IE9uIE1vbiwgQXVnIDI2LCAyMDE5IGF0IDAzOjE1OjIzUE0gKzAzMDAsIFRvbWkgVmFsa2Vp
bmVuIHdyb3RlOgo+PiBPbiAyMC8wOC8yMDE5IDA0OjE2LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Ogo+Pgo+Pj4gVGhlIHBhdGNoZXMgY2FuIGJlIGZvdW5kIGF0Cj4+Pgo+Pj4gCWdpdDovL2xpbnV4
dHYub3JnL3BpbmNoYXJ0bC9tZWRpYS5naXQgb21hcGRybS9icmlkZ2UvZGV2ZWwKPj4KPj4gSSB0
b29rIHlvdXIgYnJhbmNoLCBib290ZWQgQU01IEVWTSAoSSBzZWUgeW91IGhhZCB0aGUgaGFjayBk
dHMgcGF0Y2ggaW4geW91ciBicmFuY2gpLCBhbmQ6Cj4+Cj4+IGluc21vZCBuZnMvd29yay9saW51
eC9kcml2ZXJzL21lZGlhL2NlYy9jZWMua28KPj4gaW5zbW9kIG5mcy93b3JrL2xpbnV4L2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9jZmJjb3B5YXJlYS5rbwo+PiBpbnNtb2QgbmZzL3dvcmsvbGlu
dXgvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2NmYmltZ2JsdC5rbwo+PiBpbnNtb2QgbmZzL3dv
cmsvbGludXgvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2NmYmZpbGxyZWN0LmtvCj4+IGluc21v
ZCBuZnMvd29yay9saW51eC9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1
aXJrcy5rbwo+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy9ncHUvZHJtL2RybS5rbwo+
PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy9ncHUvZHJtL2RybV9rbXNfaGVscGVyLmtv
Cj4+IGluc21vZCBuZnMvd29yay9saW51eC9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQx
MC5rbwo+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5
MDJ4LmtvCj4+IGluc21vZCBuZnMvd29yay9saW51eC9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmtvCj4+IGluc21vZCBuZnMvd29yay9saW51eC9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmtvCj4+IFsgICAyNS40ODcwMDJdIHBhbmVsLXNpbXBsZSBkaXNwbGF5OiBk
aXNwbGF5IHN1cHBseSBwb3dlciBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgo+PiBb
ICAgMjUuNDk1MjQxXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4gWyAg
IDI1LjQ5OTkwMF0gV0FSTklORzogQ1BVOiAwIFBJRDogMzAzIGF0IGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYzozNzggcGFuZWxfc2ltcGxlX3Byb2JlKzB4MzRjLzB4M2I0IFtw
YW5lbF9zaW1wbGVdCj4gCj4gSG93IGFtIEkgZXhwZWN0ZWQgdG8gc25lYWsgcGF0Y2hlcyBpbiBp
ZiB5b3UgdGVzdCB0aGVtID8gOi0pCj4gCj4gVGhpcyBoYXMgYmVlbiBpbnRyb2R1Y2VkIGJ5IGEg
cmVjZW50IHJlYmFzZSwgYW5kIEkndmUgb25seSB0ZXN0ZWQgdGhlCj4gc2VyaWVzIG9uIHRoZSBw
YW5kYWJvYXJkIHNpbmNlIHRoZW4uIEl0IGxvb2tzIGxpa2UgdGhlIHByb2JsZW0gY29tZXMKPiBm
cm9tCj4gCj4gY29tbWl0IGI4YTI5NDhmYTJiM2E1YTZkYTY3ZmQ1N2FhMDFjNzMxOGQ3OTUxMjUK
PiBBdXRob3I6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IERhdGU6ICAgVGh1
IEp1bCAxMSAxMzozNDo1MyAyMDE5IC0wNzAwCj4gCj4gICAgICBkcm0vcGFuZWw6IHNpbXBsZTog
QWRkIGFiaWxpdHkgdG8gb3ZlcnJpZGUgdHlwaWNhbCB0aW1pbmcKPiAKPiB3aGljaCBicmVha3Mg
b3VyIG91dC1vZi10cmVlIERULiBBcyBhIHNob3J0IHRlcm0gZml4IEkgY2FuIHNpbXBseSBkcm9w
Cj4gdGhlIHBhbmVsIHRpbWluZ3MgZnJvbSBEVCwgYnV0IEkgdGhpbmsgdGhpcyBpc3N1ZSBjYW4g
YWZmZWN0IG1vcmUKClNvIGp1c3QgcmVtb3ZpbmcgdGhlIHRpbWluZ3MgZnJvbSB0aGUgcGFuZWwn
cyBub2RlIHNob3VsZCBiZSBlbm91Z2g/IApTdGlsbCBjcmFzaGluZyBmb3IgbWUsIGFsdGhvdWdo
IHRoZSBwYW5lbCB3YXJuaW5nIGdvZXMgYXdheS4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51
cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
