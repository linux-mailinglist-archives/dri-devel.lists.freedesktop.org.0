Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B517A59A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 12:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774D06E483;
	Tue, 30 Jul 2019 10:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515956E483
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 10:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvPYvz2Z9v9Xc+38VNfdxcgREGJD69Ymjv3XHmXV67TpaaPPNieoTyAl3uGkRBBn0rts6+h8waOOLY3euoY0H/gULHWXRTQqoCjctdjZDGYsBFwH9dK7ONNHEiOVTCB8KzTUNGprd2Uk88sFvKgquzkkXiGFTZwYON8G1miRSqSKb+ZBb5frslDKNTu4oQ322+X/1lpWJA3SSj8NiWeVtV/i8phAZ1yf3bIbzs7i65W3qXm5s0q2g9BkX97SYqVm690O/Cl5Hnl/2Oz0AmIN9RnCMKQUhfKzNRrKV4SAbYLEDgTCHOVPiQ6ghV8922IydCIK8xbjnam2uVTCQkAenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH5BscU8zvW1k1xTHcmw6TDV9zDAeVG7XWqs9fHyjac=;
 b=JyUESPvVV8PgoXGfED2JQpfWBpD8h+clVQ5tbvY2UJvQhntpYPcIjmYiQSNmX4OYQq5tZMugkX23dn/Nq01mEOTX+Lzfmf0GX8zVncEdHCpxP/6c7T4DZGG2b3pVef55+8NFv6ZixT2GC/BjQ8wAZcW0aNugld91vX1LPweYuiSHj5ylSPtn+Sox08rn3y/vp15p8ejqd1YZ57rluJWZG5mE0FBAlz0i0B5XB5JKklI5xxYOMKaZNoR8ZBND+5eUiG9VZOuyNLcxkCto1rMHxUo44twvl2hhbcroruNj05B2e60PhXjja5UbEGtWuRw4pCBZQ/UYBOK4mrDv40CRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0049.namprd12.prod.outlook.com (2603:10b6:3:103::11)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Tue, 30 Jul
 2019 10:07:54 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0049.outlook.office365.com
 (2603:10b6:3:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 10:07:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 10:07:53 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 30 Jul
 2019 05:07:52 -0500
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Daniel Vetter
 <daniel@ffwll.ch>
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <20190730092728.GM15868@phenom.ffwll.local>
 <43e4a527-8895-c958-5717-b1f7530571d7@amd.com>
 <20190730093631.GO15868@phenom.ffwll.local>
 <f3137289-7ed7-e47d-a853-6d93a086fdd0@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <926156d1-5204-84d4-49ce-7dc72b64024e@amd.com>
Date: Tue, 30 Jul 2019 18:07:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f3137289-7ed7-e47d-a853-6d93a086fdd0@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(6666004)(14444005)(486006)(110136005)(16576012)(2486003)(16526019)(70586007)(11346002)(336012)(70206006)(478600001)(58126008)(446003)(426003)(126002)(476003)(2616005)(5660300002)(76176011)(36756003)(966005)(23676004)(316002)(7736002)(53546011)(50466002)(65826007)(26005)(186003)(67846002)(31696002)(229853002)(3846002)(68736007)(6116002)(2906002)(305945005)(6246003)(4326008)(64126003)(356004)(81166006)(81156014)(2870700001)(8676002)(8936002)(31686004)(6306002)(65956001)(65806001)(47776003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2417; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acce6a9e-45e4-480f-56b8-08d714d5c990
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BL0PR12MB2417; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BL0PR12MB241743E6A85C6D7E0618F65FB4DC0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nzGsachFXwDiKIeP9I6xcLbmHcMwPPgAEM+UplL/DC5d3p3wvrXNaRAnAVh1WrL2Rs8d5Cokm+CQjswH1p5QLjayDadWYz/zAjkz8RkgvbDxdKiD5D3qlmk+jaGOka6syyY1vtdPjyDxJ5AChD7CBTM3Mo1VL7IKDmFeZfyvHNFibOqIRDjbDEpFG+I/80dfaXds9RCJ+kPIw4y8qBeu+bNrRIKt+SqbkLAYNEitiXH+gx5JH8XCNhkh4AEvEG7Z8S/jMPK5132RGze4UMouIDlei6NaoMnqaQv5RYyibKBK4k/FpbCNKxAWF0T+L2O8/GuNFj6DUvyLr5PMHHS8pVGPh7qSyLUsFodvLDg3YtdzzF6nJgzPhMjjKKm+q1DRlhhJideJB1LirpGTLo+gYeIpWrzW6bWtEKaO/Wun9UI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 10:07:53.6432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acce6a9e-45e4-480f-56b8-08d714d5c990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH5BscU8zvW1k1xTHcmw6TDV9zDAeVG7XWqs9fHyjac=;
 b=RpZo8XjYYofSfl1r3m3061c69yxh91v6BI8PtYdkzHrOaAoLAGbfZjs2MLEtYqd3H4ergh1BP8zBI/eIxhvkqYxmW0iKkdsUJjOnLMch5scVx0Ru9jBHfOSxols7Gy7y4UbGswTAXQRLgoX30PRT8UcovwX54/PY2HFyVyK49kI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE55bm0MDfmnIgzMOaXpSAxNzo0MCwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4g
T24gMzAvMDcvMjAxOSAxMjozNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gVHVlLCBKdWwg
MzAsIDIwMTkgYXQgMDU6MzE6MjZQTSArMDgwMCwgemhvdWNtMSB3cm90ZToKPj4+Cj4+PiBPbiAy
MDE55bm0MDfmnIgzMOaXpSAxNzoyNywgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+PiBPbiBNb24s
IEp1bCAyOSwgMjAxOSBhdCAwNDoyMDozOVBNICswODAwLCBDaHVubWluZyBaaG91IHdyb3RlOgo+
Pj4+PiBJdCBpcyBub3JtYWwgdGhhdCBiaW5hcnkgc3luY29iaiByZXBsYWNlcyB0aGUgdW5kZXJs
eWluZyBmZW5jZS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2
aWQxLnpob3VAYW1kLmNvbT4KPj4+PiBEbyB3ZSBoaXQgdGhpcyB3aXRoIG9uZSBvZiB0aGUgc3lu
Y29iaiBpZ3RzPwo+Pj4gVW5mb3J0dXJuYXRlbHksIE5vLCBJdCdzIG9ubHkgaGl0IGluIEFNREdQ
VSBwYXRoLCB3aGljaCBjb21iaW5lcyAKPj4+IHRpbWVsaW5lCj4+PiBhbmQgYmluYXJ5IHRvIHNh
bWUgcGF0aCB3aGVuIHRpbWVsaW5lIGlzIGVuYWJsZWQuCj4KPgo+IFdlIGNhbiB0b3RhbGx5IGJ1
aWxkIHRoYXQgY2FzZSB3aXRoIHN3X2ZlbmNlcyB3aGljaCBpcyB3aGF0IG9uZSBvZiB0aGUgCj4g
SUdUIHRlc3RzIGRvZXMuCk9LLCBUaGFuayB5b3UuCgotRGF2aWQKPgo+Cj4gLUxpb25lbAo+Cj4K
Pj4gTG9va3MgbGlrZSBsaW9uZWwgaGFzIHNvbWV0aGluZywgbWF5YmUgaGVscCByZXZpZXcgdGhh
dD8KPj4gLURhbmllbAo+Pgo+Pj4gLURhdmlkCj4+Pj4gLURhbmllbAo+Pj4+Cj4+Pj4+IC0tLQo+
Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMyAtLS0KPj4+Pj4gwqDC
oCAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIAo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fc3luY29iai5jCj4+Pj4+IGluZGV4IDkyOWY3YzY0ZjlhMi4uYmM3ZWMxNjc5ZTRkIDEwMDY0
NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+Pj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+Pj4+PiBAQCAtMTUxLDkgKzE1MSw2IEBAIHZv
aWQgZHJtX3N5bmNvYmpfYWRkX3BvaW50KHN0cnVjdCBkcm1fc3luY29iaiAKPj4+Pj4gKnN5bmNv
YmosCj4+Pj4+IMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnN5bmNvYmotPmxvY2spOwo+Pj4+PiDC
oMKgwqDCoMKgwqAgcHJldiA9IGRybV9zeW5jb2JqX2ZlbmNlX2dldChzeW5jb2JqKTsKPj4+Pj4g
LcKgwqDCoCAvKiBZb3UgYXJlIGFkZGluZyBhbiB1bm9yZGVyIHBvaW50IHRvIHRpbWVsaW5lLCB3
aGljaCBjb3VsZCAKPj4+Pj4gY2F1c2UgcGF5bG9hZCByZXR1cm5lZCBmcm9tIHF1ZXJ5X2lvY3Rs
IGlzIDAhICovCj4+Pj4+IC3CoMKgwqAgaWYgKHByZXYgJiYgcHJldi0+c2Vxbm8gPj0gcG9pbnQp
Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3Jk
ZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4iKTsKPj4+Pj4gwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9j
aGFpbl9pbml0KGNoYWluLCBwcmV2LCBmZW5jZSwgcG9pbnQpOwo+Pj4+PiDCoMKgwqDCoMKgwqAg
cmN1X2Fzc2lnbl9wb2ludGVyKHN5bmNvYmotPmZlbmNlLCAmY2hhaW4tPmJhc2UpOwo+Pj4+PiAt
LSAKPj4+Pj4gMi4xNy4xCj4+Pj4+Cj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
