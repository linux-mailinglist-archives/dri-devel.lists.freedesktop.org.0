Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9341EB71B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 10:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A71089D87;
	Tue,  2 Jun 2020 08:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BD489D87
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 08:13:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0528DWxd017543;
 Tue, 2 Jun 2020 03:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591085612;
 bh=W/u4Gfn8Bq+eBQ50ZyVyRSF3E4LsSNzZM/DU8aita/I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=doCaxwsbt8NFkstWB1KPdIFMfNjNNLipev6pIncVThGfebFxJlpuA8OL30Yng3UFj
 6Xe2UD2dJJh6/C1MfVGr3uoMTVjo1fodAEdjUUk3YKDlZW/eOLr4jL1NI1mIx6CbK0
 kR7YE9RNq8m1Q48wvNO5pRUPz0/9jAUcSJxqHqjc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0528DWEE024193
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Jun 2020 03:13:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Jun
 2020 03:13:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Jun 2020 03:13:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0528DTnO024976;
 Tue, 2 Jun 2020 03:13:29 -0500
Subject: Re: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
To: <santosh.shilimkar@oracle.com>, Jyri Sarha <jsarha@ti.com>,
 <dri-devel@lists.freedesktop.org>, <ssantosh@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <cover.1581671951.git.jsarha@ti.com>
 <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <973b69f2-bbe1-3c1b-615f-751bb8d5d83e@ti.com>
Date: Tue, 2 Jun 2020 11:13:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
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
Cc: mark.rutland@arm.com, praneeth@ti.com, robh+dt@kernel.org,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FudG9zaCwKCk9uIDE0LzAyLzIwMjAgMTk6NDAsIHNhbnRvc2guc2hpbGlta2FyQG9yYWNs
ZS5jb20gd3JvdGU6Cj4gT24gMi8xNC8yMCAxOjIyIEFNLCBKeXJpIFNhcmhhIHdyb3RlOgo+PiBS
ZXNlbmQgYmVjYXVzZSB0aGUgZWFybGllciByZWNpcGllbnQgbGlzdCB3YXMgd3JvbmcuCj4+Cj4+
IE5vdyB0aGF0IGRybS90aWRzcyBpcyBxdWV1ZWQgZm9yIG1haW5saW5lLCBsZXRzIGFkZCBkaXNw
bGF5IHN1cHBvcnQgZm9yCj4+IGsyZy1ldm0uIFRoZXJlIGlzIG5vIGh1cnJ5IHNpbmNlIHRpZHNz
IGlzIG91dCBvbmx5IGluIHY1LjcsIGJ1dCBpdAo+PiBzaG91bGQgbm90IGhhcm0gdG8gaGF2ZSB0
aGUgZHRzIGNoYW5nZXMgaW4gcGxhY2UgYmVmb3JlIHRoYXQuCj4+Cj4+IEp5cmkgU2FyaGEgKDIp
Ogo+PiDCoMKgIEFSTTogZHRzOiBrZXlzdG9uZS1rMmc6IEFkZCBEU1Mgbm9kZQo+PiDCoMKgIEFS
TTogZHRzOiBrZXlzdG9uZS1rMmctZXZtOiBhZGQgSERNSSB2aWRlbyBzdXBwb3J0Cj4+Cj4+IMKg
IGFyY2gvYXJtL2Jvb3QvZHRzL2tleXN0b25lLWsyZy1ldm0uZHRzIHwgMTAxICsrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMva2V5c3RvbmUtazJnLmR0c2nC
oMKgwqAgfMKgIDIyICsrKysrKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25z
KCspCj4+Cj4gT2suIFdpbGwgYWRkIHRoaXMgdG8gdGhlIG5leHQgcXVldWUuCgpXaGF0IGhhcHBl
bmVkIHdpdGggdGhpcyBvbmU/IEl0IHVzZWQgdG8gYmUgaW4gbGludXgtbmV4dCwgYnV0IG5vdyBJ
IGRvbid0IHNlZSBpdCBhbnltb3JlLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
