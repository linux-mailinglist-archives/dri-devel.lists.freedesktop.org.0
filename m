Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742521C6AAD
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E80589491;
	Wed,  6 May 2020 08:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB989491
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 08:01:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04681AAp085965;
 Wed, 6 May 2020 03:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588752070;
 bh=fBYH/OX0qOF7iUC5jWzL2Vp1Y/k89aTRhZ5X4WhtbVQ=;
 h=Subject:To:References:From:CC:Date:In-Reply-To;
 b=SH5rp8H6na/BZ2COWCJ33YYXkVuSiZG9LAsdvD2sQ4mA6+y9W05Z7J64OJkPjkapV
 5xslt58ms22BNBr+0RKUUddBHlzz9nCamW3YypoxOLZGzZ2AcwXIT/nyHkrkQVWAgQ
 I6UGuipTdXpM/rUgxLt6xdVtepEkXb2wEE44O/wQ=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04681AEP016756
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 May 2020 03:01:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 03:01:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 03:01:10 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046818LP058281;
 Wed, 6 May 2020 03:01:08 -0500
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
Date: Wed, 6 May 2020 11:01:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmljYXJkbywKCk9uIDA2LzA1LzIwMjAgMTA6MjEsIFJpY2FyZG8gQ2HDsXVlbG8gd3JvdGU6
Cj4gSGkgVG9taSwgdGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLgo+IAo+IE9uIG1hciAy
OC0wNC0yMDIwIDEyOjQ5OjI4LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4gSSBkb24ndCBxdWl0
ZSB1bmRlcnN0YW5kIHRoaXMuIFdlIGNhbm5vdCBoYXZlIG5lZ2F0aXZlIG51bWJlcnMgaW4gZHRz
IGZpbGVzPwo+PiBPciB3ZSBjYW4sIGJ1dCBkdF9iaW5kaW5nX2NoZWNrIGRvZXNuJ3QgaGFuZGxl
IHRoZW0gY29ycmVjdGx5PyBPciB0aGF0IGludDMyCj4+IGlzIG5vdCBzdXBwb3J0ZWQgaW4geWFt
bCBiaW5kaW5ncz8KPiAKPiBBRkFJQ1QsIHlvdSBjYW4gaGF2ZSBuZWdhdGl2ZSBudW1iZXJzIGlu
IGR0cyBmaWxlcyAoc2VlIFsxXSBhbmQgWzJdKSBhbmQKClRoaXMgaXMgYWxzbyBteSB1bmRlcnN0
YW5kaW5nIGFmdGVyIHNvbWUgZ29vZ2xpbmcuIEFuZCB0aGVyZSdzIGV2ZW4gb2ZfcHJvcGVydHlf
cmVhZF9zMzIoKSBpbiB0aGUgCmtlcm5lbC4KCj4gdGhlIERUIHNjaGVtYSBjZXJ0YWlubHkgc3Vw
cG9ydHMgc2lnbmVkIGludGVnZXJzLCBidXQgZHRfYmluZGluZ19jaGVjawo+IHNlZW1zIHRvIGlu
dGVycHJldCBhbGwgY2VsbHMgYXMgdW5zaWduZWQgMzJiaXQgaW50ZWdlcnMgYmVjYXVzZSB0aGF0
J3MKPiB3aGF0IHRoZXkgYXJlLCByZWFsbHkuIEluIGtlcm5lbCBjb2RlIHRoaXMgaXMgbm90IGEg
cHJvYmxlbSBiZWNhdXNlIHlvdQoKV2VsbCwgdGhpcyBpcyBpbiB0aGUgbml0cGljayBjYXRlZ29y
eSwgYW5kIG1heWJlIG5vdCBldmVuIHJlbGV2YW50LCBidXQgSSBkb24ndCB0aGluayB0aGF0J3Mg
CmNvcnJlY3QuIFRoZXkncmUganVzdCBiaXRzLiBTb21lIHBpZWNlcyBvZiBTVyBoYXBwZW4gdG8g
dXNlIHUzMiBjb250YWluZXJzIHRvIHN0b3JlIHRoZSBiaXRzLiBCdXQgCndoYXQgdGhlIGJpdHMg
bWVhbiBpcyBub3QgcmVsYXRlZCB0byB0aGUgY29udGFpbmVyLgoKPiBjYW4gY2FzdCB0aGUgdmFs
dWUgYmFjayB0byBhIHNpZ25lZCBpbnQgYmVmb3JlIHlvdSBydW4geW91ciBvd24gc2FuaXR5Cj4g
Y2hlY2tzIG9uIHRoZW0uCgpEb2Vzbid0IGFsbCB0aGlzIGp1c3QgcG9pbnQgdG8gYSBidWcgb3Ig
bWlzc2luZyBmZWF0dXJlIGluIGR0X2JpbmRpbmdfY2hlY2s/IFRoYXQncyBub3QgYSByZWFzb24g
dG8gCmNoYW5nZSB0aGUgQUJJLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
