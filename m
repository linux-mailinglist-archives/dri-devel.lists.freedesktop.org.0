Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B887293
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 09:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B286ED05;
	Fri,  9 Aug 2019 07:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC356ED05
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 07:00:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79700Uf004931;
 Fri, 9 Aug 2019 02:00:00 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79700Nx101996
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Aug 2019 02:00:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 01:59:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 01:59:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x796xvb6062235;
 Fri, 9 Aug 2019 01:59:57 -0500
Subject: Re: [PATCH] omapdrm: no need to check return value of debugfs_create
 functions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
References: <20190613115749.GC26335@kroah.com>
 <20190808125053.GJ6055@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2d1fa29e-1441-2266-31f0-73a20cf3cebb@ti.com>
Date: Fri, 9 Aug 2019 09:59:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808125053.GJ6055@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565334001;
 bh=V85w8gs1/VPlm1WwfysvMOsv+zP0/dwEQlw6eLpfAGA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QESsgZY/XcauhTRWzrEAc7qrGPgqPWHmZzQpVL94BzP2mkOHEfcqf5OAGrK5pO5RH
 dmV66mEoah8P9xBhFN3jAlvLYCe7PSDCb5gER7xfEU7vurxbitu9ISIeWoWnA9kzf+
 6Cm7LIw3N6ITx9D+KEWT4cu8xmzvJ+EwHSr5zRFs=
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jyri Sarha <jsarha@ti.com>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, zhong jiang <zhongjiang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwOC8wOC8yMDE5IDE1OjUwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IEhpIEdy
ZWcsCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24gVGh1LCBKdW4gMTMsIDIw
MTkgYXQgMDE6NTc6NDlQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+PiBXaGVu
IGNhbGxpbmcgZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXZlciBjaGVj
ayB0aGUKPj4gcmV0dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3b3JrIG9yIG5vdCwgYnV0
IHRoZSBjb2RlIGxvZ2ljIHNob3VsZAo+PiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJh
c2VkIG9uIHRoaXMuCj4+Cj4+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgo+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+PiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+PiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+PiBDYzogU2ViYXN0aWFuIFJlaWNoZWwgPHNl
YmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Cj4+IENjOiBKeXJpIFNhcmhhIDxqc2FyaGFA
dGkuY29tPgo+PiBDYzogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT4KPj4gQ2M6IHpo
b25nIGppYW5nIDx6aG9uZ2ppYW5nQGh1YXdlaS5jb20+Cj4+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gCj4gVGhpcyBtYWtlcyBzZW5zZS4KPiAKPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IAo+IFRvbWksIHdpbGwgeW91IHRha2UgdGhpcyBwYXRjaCBpbiB5b3VyIHRyZWUgPwoK
WWVzLCBJJ2xsIHBpY2sgdGhpcyB1cC4gSSBwcmVzdW1lIGRlYnVnZnNfY3JlYXRlX2ZpbGUoKSB3
aWxsIGdpdmUgYSAKd2FybmluZyBwcmludCBpZiBpdCBmYWlscyB0byBjcmVhdGUgdGhlIGZpbGUs
IGluc3RlYWQgb2YgYmVpbmcgc2lsZW50LgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMg
RmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1
c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
