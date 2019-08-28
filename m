Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D879F9FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 07:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3B389B33;
	Wed, 28 Aug 2019 05:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EF989B33
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 05:48:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S5m72M090170;
 Wed, 28 Aug 2019 00:48:07 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S5m7Lo094179
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Aug 2019 00:48:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 00:48:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 00:48:06 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S5m4AD011070;
 Wed, 28 Aug 2019 00:48:05 -0500
Subject: Re: [PATCH] drm/bridge: tc358767: Expose test mode functionality via
 debugfs
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20190826182524.5064-1-andrew.smirnov@gmail.com>
 <20190826220807.GK5031@pendragon.ideasonboard.com>
 <CAHQ1cqHuJNTH=HDfEP9de0Df_D45VV034riH4J3+ix23v=aM4Q@mail.gmail.com>
 <20190827080644.GF5054@pendragon.ideasonboard.com>
 <CAHQ1cqHqKvjB51UUbAHcm-=vp1O2-ncE23H8UuOz5gUJDP1wXQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <75c9c9b2-b5b2-44bc-3ffa-e69e069cf2bd@ti.com>
Date: Wed, 28 Aug 2019 08:48:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqHqKvjB51UUbAHcm-=vp1O2-ncE23H8UuOz5gUJDP1wXQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566971287;
 bh=5iPmxBNFAmOe0sdDGNM9TCYJMd88VRMWnVdbR8bUhvg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=A4qO+TJ0Jq9LOoJtcXrrEA6nfYdOBINWyppibfvcLKE6u6lwXaqYXu+6p1wbl4BFs
 Mcna+9Kd7RlNkazujE6sMel6xxI7mgmQBY8y3hK/KpmEiuJdWG5ralYZyhoCoZjZIa
 IvdNY5LZeOcPfoIt/asrRgHR92q9JO2Kz0EKCr0Q=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDgvMjAxOSAwMTo1MSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cgo+PiBUaGUgd2hvbGUg
cG9pbnQgb2YgYQo+PiBkcml2ZXIgaXMgdG8gYXZvaWQgbmVlZGluZyBkZXRhaWxlZCBrbm93bGVk
Z2Ugb2YgdGhlIGRldmljZSdzIGludGVybmFscwo+PiBpbiB1c2Vyc3BhY2UuCj4+Cj4gCj4gWW91
IHdvbid0IGF2b2lkIG5lZWRpbmcgZGV0YWlsZWQga25vd2xlZGdlIG9mIHRoZSBkZXZpY2UncyBp
bnRlcm5hbHMKPiBpZiB5b3UgZG9uJ3QgaGF2ZSBhIHByaW9yaSBrbm93bGVkZ2UgaW4gdGhlIGZv
cm0gb2YgYSBhZ3JlZWQgdXBvbi93ZWxsCj4ga25vd24gYWJzdHJhY3Rpb24geW91IGFyZSBleHBv
c2luZyBmcm9tIHRoZSBkcml2ZXIuIFRoZXJlIGlzIG5vIHN1Y2gKPiBhYnN0cmFjdGlvbiBpbiB0
aGlzIGNhc2UuIFdoZXRoZXIgeW91IHByZXNlbnQgInRzdGN0bCIgdGhhdCB0YWtlcyBhCj4gbWFn
aWMgdmFsdWUgb3IgInJlZCIsICJncmVlbiIsICJibHVlIiBhbmQgInBhdHRlcm4iIHRha2luZyBu
dW1iZXJzIGFuZAo+IHNwZWNpYWwgc3RyaW5ncywgYXMgYSB1c2VyLCB5b3Ugc3RpbGwgd291bGQg
aGF2ZSB0byBnbyByZWFkIHRoZSBkcml2ZXIKPiBjb2RlIGluIG9yZGVyIHRvIGZpZ3VyZSBvdXQg
aG93IHRoYXQgc3R1ZmYgd29ya3MuCj4gCj4gR2l2ZW4gaG93IHRoaXMgaXMgYW4gb2JzY3VyZSBf
ZGVidWdfIGZlYXR1cmUgZm9yIGEgbmljaGUgcGFydCwgSSB0aGluawo+IGV4cG9zaW5nIHJhdyBy
ZWdpc3RlciBhbmQgbGVhdmluZyBhIGNvbW1lbnQgaW4gdGhlIGRyaXZlciBzb3VyY2UgY29kZQo+
IGV4cGxhaW5pbmcgaG93IGl0IHdvcmtzIGlzIHJlYXNvbmFibHkgdXNlci1mcmllbmRseSAoZm9y
IGFsbCAxMCAtIDE1Cj4gdW5pcXVlIHVzZXJzIHRoYXQgdGhpcyBmZWF0dXJlIHdvdWxkIGV2ZXIg
aGF2ZSkuCj4gCj4gVG8gYXZvaWQgYW55IGZ1cnRoZXIgYmFjayBhbmQgZm9ydGggb2YgdGhpcyBz
dWJqZWN0LCBob3cgYWJvdXQgdGhlCj4gZm9sbG93aW5nLiBJZiB0aGlzIGlzIHVwIHRvIG1lLCB0
aGVuIEknZCBsaWtlIHRvIG1vdmUgZm9yd2FyZCB0byB2Mgo+IHdpdGggdGhlIGludGVyZmFjZSBh
cyBpcy4gSWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgdGhpcyBhbmQgaW5zaXN0Cj4gb24geW91
ciB2aXNpb24gb2YgdGhlIGludGVyZmFjZSwgcGxlYXNlIGxldCBtZSBrbm93IHdoYXQgaXQgbG9v
a3MgbGlrZQo+IChlLmcuIGlzIHdoYXQgSSBkZXNjcmliZWQgYWJvdmUgZ29vZCBlbm91Z2gpIGFu
ZCBJJ2xsIHJld29yayB2MiB0bwo+IGhhdmUgdGhhdC4KCkkgYWdyZWUsIEkgZG9uJ3Qgc2VlIGEg
cG9pbnQgaW4gYWRkaW5nIGEgcGlsZSBvZiBjb2RlIHRvIG1ha2UgYSBkZXZpY2UgCnNwZWNpZmlj
IGRlYnVnIGZlYXR1cmUgdG8gaGlkZSB0aGUgZGV2aWNlIGludGVybmFscy4gSWYgc29tZW9uZSBp
cyBnb2luZyAKdG8gdXNlIHRoaXMgZmVhdHVyZSwgbW9zdCBsaWtlbHkgaGUgZWl0aGVyIGhhcyB0
aGUgZGF0YXNoZWV0IG9yIGhlIGhhcyAKYmVlbiBhc2tlZCBieSBzb21lb25lIHdpdGggdGhlIGRh
dGFzaGVldCB0byB0cnkgdGhlIGZlYXR1cmUuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50
cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMv
QnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
