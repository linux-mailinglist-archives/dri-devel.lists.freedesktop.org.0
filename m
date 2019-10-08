Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035E5CFC24
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653EA6E7CD;
	Tue,  8 Oct 2019 14:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9376E7CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:16:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98EGWkv015878;
 Tue, 8 Oct 2019 09:16:32 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98EGWBR001869
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 09:16:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 09:16:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 09:16:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98EGUrO083939;
 Tue, 8 Oct 2019 09:16:31 -0500
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
To: Tony Lindgren <tony@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
Date: Tue, 8 Oct 2019 17:16:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008141335.GB5610@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570544192;
 bh=jnDC12FV0Qb10eo+2ndFqRjIxX3wyikNU0NY3OYJzUM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xGFLkVv3oYhPfiKxF1O0lxJcJ4qIiE5Le14OGFcAQ35oiST5ED3a4aWHShapz8WpH
 9dh9Mj7UXzqsA0IG+BltEsMYje9eB4QgpcOIvDdzLMjyMzX1A8OmG8lLotG141FVGM
 rYfSvmQV7y/fKHPI7WKwCXRXwfEsgv4/8dO6+ZAM=
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

T24gMDgvMTAvMjAxOSAxNzoxMywgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPiAqIFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IFsxOTA5MzAgMTA6MzhdOgo+PiBJZiB1c2VfbWNs
ayBpcyBmYWxzZSwgbWNsa19tb2RlIGlzIHdyaXR0ZW4gdG8gYSByZWdpc3RlciB3aXRob3V0Cj4+
IGluaXRpYWxpemF0aW9uLiBUaGlzIGRvZXNuJ3QgY2F1c2UgYW55IGlsbCBlZmZlY3RzIGFzIHRo
ZSB3cml0dGVuIHZhbHVlCj4+IGlzIG5vdCB1c2VkIHdoZW4gdXNlX21jbGsgaXMgZmFsc2UuCj4+
Cj4+IFRvIGZpeCB0aGlzLCB3cml0ZSB1c2VfbWNsayBvbmx5IHdoZW4gdXNlX21jbGsgaXMgdHJ1
ZS4KPiAKPiBIZXkgbmljZSBjYXRjaC4gQmFzZWQgb24gYSBxdWljayB0ZXN0IGxvb2tzIGxpa2Ug
dGhpcyBmaXhlcyBhbgo+IGlzc3VlIHdoZXJlIHBvd2VyIGNvbnN1bXB0aW9uIHN0YXlzIGhpZ2hl
ciBhZnRlciB1c2luZyBIRE1JLgo+IAo+IFdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBtZXJnZWQgaW4g
dGhlIHY1LjQtcmMgc2VyaWVzOgo+IAo+IFRlc3RlZC1ieTogVG9ueSBMaW5kZ3JlbiA8dG9ueUBh
dG9taWRlLmNvbT4KClJlYWxseT8gT2ssIHdlbGwsIHRoZW4gaXQgd2FzIGEgZ29vZCByYW5kb20g
ZmluZCA9KS4KCkkgZGlkIGFscmVhZHkgcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQsIGFzIEkg
dGhvdWdodCBpdCBkb2VzIG5vdCBoYXZlIAphbnkgcmVhbCBlZmZlY3QuIEknbGwgY2hlY2sgaWYg
aXQncyBvayB0byBwdXNoIHRvIGRybS1taXNjLWZpeGVzIHRvbywgCndpdGggQ2Mgc3RhYmxlLgoK
ICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAy
MiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlw
YWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
