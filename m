Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C83902F3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 15:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE1A6E3E5;
	Fri, 16 Aug 2019 13:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF736E3E5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 13:26:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7GDQFXl010809;
 Fri, 16 Aug 2019 08:26:15 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7GDQFWn086334
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Aug 2019 08:26:15 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:26:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 16 Aug 2019 08:26:14 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7GDQDo1082574;
 Fri, 16 Aug 2019 08:26:13 -0500
Subject: Re: [PATCH 2/2] drm/omap: displays: Remove unused panel drivers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-3-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <39fa9c2e-5483-992f-1ce7-9126944867b8@ti.com>
Date: Fri, 16 Aug 2019 16:26:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816122228.9475-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565961975;
 bh=PSfcQQxC9SDae3BZ4SDqEycCflPrw6hpK7RZjgmERh4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=X6H4bdQ2WF5Rx36MMs2CDsXvW2ns9VBnz20IvMkqoMWqNR13iYBMcW1Lnb3khtnTw
 xtT1JYVARlEGroDHx2p+aSfQV1kn5rXVPn5FeFECzeI+Po4bn+3y2BhWiDj1BgYO4N
 btnyqc0wsMjR1Uggts89KH/mSQvoybFwzyXdUI1Q=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDgvMjAxOSAxNToyMiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBkcm1fcGFuZWwt
YmFzZWQgZHJpdmVycyBmb3IgdGhlIEFDWDU2NUFLTSwgTEIwMzVRMDIsIExTMDM3VjdEVzAxLAo+
IE5MODA0OEhMMTEsIFREMDI4VFRFQzEgYW5kIFREMDQzTVRFQTEgYXJlIGF2YWlsYWJsZSwgcmVt
b3ZlIHRoZQo+IG9tYXBkcm0tc3BlY2lmaWMgZHJpdmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9LY29uZmlnICAgICAgfCAgMzgg
LQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvTWFrZWZpbGUgICAgIHwgICA2
IC0KPiAgIC4uLi9kaXNwbGF5cy9wYW5lbC1sZ3BoaWxpcHMtbGIwMzVxMDIuYyAgICAgICB8IDI1
MSAtLS0tLS0KPiAgIC4uLi9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLW5lYy1ubDgwNDhobDExLmMg
ICB8IDI3MSAtLS0tLS0tCj4gICAuLi4vZGlzcGxheXMvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEu
YyAgICAgICAgfCAyNjIgLS0tLS0tCj4gICAuLi4vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1zb255
LWFjeDU2NWFrbS5jICAgfCA3NTUgLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAuLi4vb21hcGRybS9k
aXNwbGF5cy9wYW5lbC10cG8tdGQwMjh0dGVjMS5jICAgfCAzOTAgLS0tLS0tLS0tCj4gICAuLi4v
b21hcGRybS9kaXNwbGF5cy9wYW5lbC10cG8tdGQwNDNtdGVhMS5jICAgfCA1MTMgLS0tLS0tLS0t
LS0tCj4gICAuLi4vZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLWJvb3QtaW5pdC5jICAgfCAg
IDcgLQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCAyNDkzIGRlbGV0aW9ucygtKQo+ICAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWxncGhpbGlw
cy1sYjAzNXEwMi5jCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZGlzcGxheXMvcGFuZWwtbmVjLW5sODA0OGhsMTEuYwo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLXNoYXJwLWxzMDM3djdkdzAx
LmMKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5
cy9wYW5lbC1zb255LWFjeDU2NWFrbS5jCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYwo+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLXRwby10
ZDA0M210ZWExLmMKClJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5A
dGkuY29tPgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
