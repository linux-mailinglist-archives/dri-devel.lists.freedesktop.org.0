Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD01FC5FA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 08:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991436E216;
	Wed, 17 Jun 2020 06:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BE16E216
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 06:05:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05H651rG119792;
 Wed, 17 Jun 2020 01:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592373901;
 bh=pjgQJY6FtV2aSO68aw+isVN5H6rQrBZ0BarV7CeclmA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ldFy59vnuaLA/u87+fSXcqQRsUB1FMfZ07OUnq32bevnq5CuqguFk6/XIN+tU3b5b
 QzajJXonGLbCTYhJ7liLkJqF8XcR6NM3wvFilkEO57mLXav1z5rVRgnlWTAQRsftd+
 mmEMIUL1z+KZBoKQCcf3OXJ7dxO5ulRadfJySHJE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05H651lZ051995
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jun 2020 01:05:01 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 01:05:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 17 Jun 2020 01:05:00 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05H64vko028969;
 Wed, 17 Jun 2020 01:04:57 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To: Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren
 <tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <d03dd04f-6f2c-25ba-fe1f-d5fc0dfb5c68@ti.com>
 <592501c9-2d94-b266-ae76-e383d3bffa29@ti.com>
 <20200616153042.GZ37466@atomide.com>
 <3f2855cc-48b8-ecb8-5d92-beeabe344b26@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d0488631-e2d8-115f-9900-5838147ec674@ti.com>
Date: Wed, 17 Jun 2020 09:04:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3f2855cc-48b8-ecb8-5d92-beeabe344b26@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDYvMjAyMCAxOTo1NiwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6Cj4gCj4gCj4gT24g
MTYvMDYvMjAyMCAxODozMCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPj4gKiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMjAwNjE2IDEzOjAyXToKPj4+IE9uIDExLzA2LzIw
MjAgMTc6MDAsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOgo+Pj4+IEkgdGhpbmssIHN1c3BlbmQg
bWlnaHQgYmUgZml4ZWQgaWYgYWxsIGRldmljZXMsIHdoaWNoIGFyZSBub3cgY2hpbGQgb2YgdGkt
c3lzYywgd2lsbCBkbwo+Pj4+IHBtX3J1bnRpbWVfZm9yY2VfeHh4KCkgY2FsbHMgYXQgbm9pcnEg
c3VzcGVuZCBzdGFnZSBieSBhZGRpbmc6Cj4+Pj4KPj4+PiDCoCDCoMKgwqDCoFNFVF9OT0lSUV9T
WVNURU1fU0xFRVBfUE1fT1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwKPj4+PiDCoCDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1fcnVudGltZV9mb3JjZV9y
ZXN1bWUpCj4+Pj4KPj4+PiBBbSBJIG1pc3Npbmcgc210aD8KPj4+Cj4+PiBJc24ndCB0aGlzIGFs
bW9zdCBleGFjdGx5IHRoZSBzYW1lIG15IHBhdGNoIGRvZXM/IEkganVzdCB1c2VkIHN1c3BlbmRf
bGF0ZQo+Pj4gYW5kIHJlc3VtZV9lYXJseS4gSXMgbm9pcnEgcGhhc2UgYmV0dGVyIHRoYW4gbGF0
ZSAmIGVhcmx5Pwo+Pgo+PiBXZWxsIHVwIHRvIHlvdSBhcyBmYXIgYXMgSSdtIGNvbmNlcm5lZC4g
VGhlIG5vaXJxIHBoYXNlIGNvbWVzIHdpdGggc2VyaW91cwo+PiBsaW1pdGF0aW9ucywgZm9yIGxl
dCdzIHNheSBpMmMgYnVzIHVzYWdlIGlmIG5lZWRlZC4gUHJvYmFibHkgYWxzbyBoYXJkZXIKPj4g
dG8gZGVidWcgZm9yIHN1c3BlbmQgYW5kIHJlc3VtZS4KPiAKPiBVbmZvcnR1bmF0ZWx5LCB5b3Ug
Y2FuJ3QgdXNlIFBNIHJ1bnRpbWUgZm9yY2UgQVBJIGF0IC5zdXNwZW5kKCkgc3RhZ2UgYXMgcG1f
cnVudGltZV9nZXQgd2lsbCBzdGlsbCAKPiB3b3JrIGFuZAo+IHRoZXJlIGlzIG5vIHN5bmMgYmV0
d2VlbiBzdXNwZW5kIGFuZCBwbV9ydW50aW1lLgo+IFRoZSBQTSBydW50aW1lIGZvcmNlIEFQSSBj
YW4gYmUgdXNlZCBvbmx5IGR1cmluZyBsYXRlL25vaXJxIGFzIGF0IHRoaXMgdGltZSBwbV9ydW50
aW1lIGlzIGRpc2FibGVkLgoKWWVzLCBidXQgd2hpY2ggb25lLi4uIERvIHlvdSBrbm93IHdoYXQg
dGhlIGRpZmYgaXMgd2l0aCBsYXRlL25vaXJxIGZyb20gZHJpdmVyJ3MgcGVyc3BlY3RpdmU/IEkg
Cmd1ZXNzIG5vaXJxIGlzIGF0b21pYyBjb250ZXh0LCBsYXRlIGlzIG50bz8KCkRpc3BjJ3Mgc3Vz
cGVuZCB1c2VzIHN5bmNocm9uaXplX2lycSgpLCBzbyB0aGF0IHJ1bGVzIG91dCBub2lycS4gQWx0
aG91Z2ggdGhlIGNhbGwgaXMgbm90IG5lZWRlZCBpZiAKdXNpbmcgbm9pcnEgdmVyc2lvbiwgc28g
dGhhdCBjb3VsZCBhbHNvIGJlIG1hbmFnZWQgd2l0aCBzbWFsbCBjaGFuZ2UuIEJ1dCBJIHdvbmRl
ciBpZiB0aGVyZSdzIGFueSAKYmVuZWZpdCBpbiB1c2luZyBub2lycSB2ZXJzdXMgbGF0ZS4KCiAg
VG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFp
a2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
