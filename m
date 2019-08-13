Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B538B134
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E326E077;
	Tue, 13 Aug 2019 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB196E077
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:36:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D7a5EY030490;
 Tue, 13 Aug 2019 02:36:05 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D7a4VS130972
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 02:36:04 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 02:36:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 02:36:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D7a28e015407;
 Tue, 13 Aug 2019 02:36:02 -0500
Subject: Re: [PATCH 29/60] drm/omap: Use the drm_panel_bridge API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-26-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f74048fc-4419-68a2-0664-df25015c0e3c@ti.com>
Date: Tue, 13 Aug 2019 10:36:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-26-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565681765;
 bh=NQZHduAa/9Mru4ddvTnELSsFTj50+J6F5pEXefU9WC4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NdmlonqnLmTbNbzu9FDAKetH8ucN0tJVWInRjV4T4lJtGCgjWw9eeoeLYqqztD1ZW
 DSdnB/WD5Ttzk678bdI9ijjzbXpWnYhj8A9t6joLX1xo2tvJKbNnGz6hy6R7RM4fQa
 b2B+E6EmfR0zi9lxgQMUMFqJTeuGZzPaS1ruT8qI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDcvMjAxOSAyMToxOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBSZXBsYWNlIHRo
ZSBtYW51YWwgcGFuZWwgaGFuZGxpbmcgY29kZSBieSBhIGRybV9wYW5lbF9icmlkZ2UuIFRoaXMK
PiBzaW1wbGlmaWVzIHRoZSBkcml2ZXIgYW5kIGFsbG93cyBhbGwgY29tcG9uZW50cyBpbiB0aGUg
ZGlzcGxheSBwaXBlbGluZQo+IHRvIGJlIHRyZWF0ZWQgYXMgYnJpZGdlcywgcGF2aW5nIHRoZSB3
YXkgdG8gZ2VuZXJpYyBjb25uZWN0b3IgaGFuZGxpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Jhc2UuYyAgICAgICB8IDEyICsrKystLS0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL291dHB1dC5jICAgICB8IDMzICsrKysr
KysrKysrKysrKysrKysrKy0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25u
ZWN0b3IuYyB8ICA5IC0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2
LmMgICAgICAgfCAxMyAtLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2VuY29kZXIuYyAgIHwgMTMgLS0tLS0tLS0tLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
