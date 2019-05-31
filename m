Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46130E08
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 14:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA41892B6;
	Fri, 31 May 2019 12:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13447892B6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 12:23:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VCNZIo115859;
 Fri, 31 May 2019 07:23:35 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VCNZpr039855
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 May 2019 07:23:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 31
 May 2019 07:23:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 31 May 2019 07:23:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VCNWQC031859;
 Fri, 31 May 2019 07:23:33 -0500
Subject: Re: [PATCHv6 3/4] drm/omap: add framedone interrupt support
To: Sebastian Reichel <sre@kernel.org>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <20190523200756.25314-4-sebastian.reichel@collabora.com>
 <9eb23a5d-438e-7b25-e7cb-8b734a150e43@ti.com>
 <20190529215530.mi3fjlsaziq22mw5@earth.universe>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <bbe14265-4499-4a55-ef94-9def2df365d7@ti.com>
Date: Fri, 31 May 2019 15:23:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529215530.mi3fjlsaziq22mw5@earth.universe>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559305415;
 bh=s5BHi330exWmUynpqb3iUBypm5V6BAHHNT54lxakjVA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aQKXDnGdpv2gEhPpPuFA0HXuKGGuRolwmTMAlhjUjJKl71A2mXvmPJOWIl1PSpTpS
 0b0Xeka1tz5O/qnoglvbWwln2l4EEzQe8W+vnbe4WWTAoe1WKWHWsR5U4Cna/fMajp
 LhLdga4wdStzbDyMxcEgka0AmK59q9CuxvcwZJUA=
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDUvMjAxOSAwMDo1NSwgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cgo+IE9oIHNvcnJ5
LCBJIG1pc3NlZCB0aGUgcGFydCB0aGF0IG9tYXBfaXJxX3dhaXRfaW5pdCgpIGFjdHVhbGx5Cj4g
ZW5hYmxlcyB0aGUgZnJhbWVkb25lIGlycS4gSXQgc2hvdWxkIGJlIGVub3VnaCB0byBqdXN0IGRy
b3AgdGhlCj4gd2FybmluZyAoYW5kIHRoZSBjdXJseSBicmFja2V0cykgdG8ga2VlcCBleGlzdGlu
ZyBiZWhhdmlvdXIuIFRoZQo+IGNvZGUgZXhpdHMgZWFybHkgd2l0aCB0aGUgYWJvdmUgd2Fybmlu
ZyBmb3IgYW55IGV4aXN0aW5nIGNvZGUgKHNpbmNlCj4gdGhhdCBkb2VzIG5vdCByZWdpc3RlciBh
IGZyYW1lZG9uZSBoYW5kbGVyKS4gRFNJIG9uIHRoZSBvdGhlciBoYW5kCj4gZG9lcyBub3QgcmVh
Y2ggdGhlIG9tYXBfaXJxX3dhaXRfaW5pdCgpIHBhcnQuIFJlZ2FyZGluZyBjb21iaW5pbmcKPiB0
aGUgbG9naWM6IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgdG8gY29tYmluZSByaWdo
dCBub3cuCj4gSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIHNpbXBsaWZ5IHRoZSBsb2dpYyBhZnRl
ciBEU0kgaGFzIGJlZW4KPiBjb252ZXJ0ZWQgdG8gZHJtX3BhbmVsIHN0eWxlLCBzaW5jZSB0aGlz
IHdpbGwgbW92ZSB0aGUgdXBkYXRlIGxvZ2ljCj4gZm9yIHRoZSBzY3JlZW4gY29udGVudCBmcm9t
IHRoZSBwYW5lbCBkcml2ZXIgdG8gRFNJIGNvcmUuCj4gCj4gVExEUjogSXQncyBlbm91Z2ggdG8g
cmVtb3ZlIHRoZSB3YXJuaW5nLiBEbyB5b3UgbmVlZCBhIG5ldwo+IHN1Ym1pc3Npb24gZm9yIHRo
aXM/CgpPay4gTm8sIEkgY2FuIGVkaXQgdGhlIHBhdGNoLgoKTmlrb2xhdXMsIGFyZSB5b3UgYWJs
ZSB0byB0ZXN0IERTSSB2aWRlb21vZGUgd2l0aCB0aGVzZSBwYXRjaGVzPwoKICBUb21pCgotLSAK
VGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVs
c2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNp
bGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
