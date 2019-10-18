Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B90DCEBA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED31C6EBBA;
	Fri, 18 Oct 2019 18:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81AA6EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:52:10 +0000 (UTC)
Received: from VE1PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:803:104::44)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 18 Oct
 2019 18:52:06 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VE1PR08CA0031.outlook.office365.com
 (2603:10a6:803:104::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Fri, 18 Oct 2019 18:52:06 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 18:52:04 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 18 Oct 2019 18:51:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b47ee850cf6557d
X-CR-MTA-TID: 64aa7808
Received: from 580cf3fefe47.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F3AB3C4-A1BC-45E6-A3BB-6977E5574D11.1; 
 Fri, 18 Oct 2019 18:51:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 580cf3fefe47.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 18:51:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOZv1W+ch192xi7Wqh8O/Nh5ZveQYwQ9CdlBleBv/5g1a0Tuoyw3TQB3l/nCsqsN3ehPpPCo8cu1953OJ5Q+RaCfZ5Z2fXkKve+5I02IDUChrrtAsrZxNPo9IQm/9Mcc3b4ZiLP8rQR3g/GAwMIfjXlyIQ+lBU+AVuvvoCof15ECktCLE8rPcu+R9Z0fKe3A1zKBmjC8wRG9WKKvi6ya88R4vRjZbpSoEp3OkEPnNepsO0qbX4u4qVFnm5r3YlACM0byKv7rgK1SJX/mLmHu+bDsvnWgZ/ZUg6Iy66S8oorpUo3qZ13g05Wy2BhUdjwM5PVm1lqAszuzBMqLf9Lz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHF+gAzf95UgWGG/O3ff0/g0s2gOsiAmeEV2+zePag4=;
 b=Miwu6LBK86O9CnDF3ENMnLQqF+aqkO+ifpzy7hKAPRuewtEyEqlJEfr9HYBfltYIJqSLD46XllOTsofPYnJJZiGK34A474yynTGKrUaMV+27gxcEpnB8y6Dc5JdOPzMHEXefzmiMqwDSKbSaxTaKzeLQoQXl0GOdeiR239jiXDETFG17DuY2eRSW06yBvC9KpbZ3B7TQ/qUpQnGoDFfFEQRD1fKOGSpNAwyiEgAqw45+wsCzptFPa9VW1e4bzIdj3OC7B9ExJO76VGaZII6tAjCpm4x+T0N4f0D8B0VByvwUwckllabbYOT8pyT8ah5+iTosCr3QHTBvDrgZAoRUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB3778.eurprd08.prod.outlook.com (20.178.23.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 18:51:51 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::f009:c530:6569:cf6f]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::f009:c530:6569:cf6f%4]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 18:51:51 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOF+0BJBq1hEUK86gknnLECMKczS0sAgAfTZICAF6gMgIAADdeAgAc/QoCAA7QPgIABrHYAgAAEJoCAABjGgIAA2T6AgACS/YCAAALsAA==
Date: Fri, 18 Oct 2019 18:51:50 +0000
Message-ID: <20191018185150.GA27705@arm.com>
References: <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
In-Reply-To: <20191018184123.GA10634@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::23) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9e9aedd8-3e4b-41fb-00bd-08d753fc44f3
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM0PR08MB3778:|AM0PR08MB3778:|AM6PR08MB3221:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB322194C13F022C28D0A03C83E46C0@AM6PR08MB3221.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(199004)(189003)(54906003)(45080400002)(486006)(478600001)(4326008)(446003)(11346002)(52116002)(76176011)(44832011)(6636002)(6862004)(2616005)(476003)(6246003)(25786009)(37006003)(5660300002)(36756003)(102836004)(1076003)(26005)(6512007)(2906002)(6306002)(99286004)(86362001)(6506007)(53546011)(186003)(386003)(561944003)(71190400001)(966005)(33656002)(66066001)(14454004)(66476007)(316002)(6116002)(3846002)(8936002)(81156014)(81166006)(256004)(66556008)(64756008)(66446008)(66946007)(14444005)(6436002)(229853002)(6486002)(7416002)(305945005)(71200400001)(7736002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3778;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PmH6xnQK0rK4/IMhAP1/4QoAxUiBC9Q77UVD24FmX9NmJF3XPwbqCvK2F3MHvxAuPhfNcY76cnBDWZzM2h6b40d3rfA8ewWgMhL11CWboxSFbcxiET8gytOGPGPO7sxNGZBYamZ1PMu0MsSbYgqWpLzNIVYSrNNZeYaJPQXGOaducB9lLgtdaA7UuduSj24ESD0m+G11rZwC0kO9O3gr0hXoaztYUaD4r/xhev0XQNPWt6fISfB7pDY1rZ88eXklOOa/pVz9AAJAsMmCwcWBxNpogBV2PjjMFHEu8DBX8AewkBTvJclHMb282XKM5cv05qIrcJL66LoeQYeh5QCJDXwwHprsFmahv+S+fCgqTNzLWM61gNMpLprObIlpiVzAjZxCX2Kn8UocTtwPj4PBVbsCQYEdadFPq1xhD/HL/tCz1oJdm0yXb1UQnhG+RPFxOd2rJxuryEtSzxmlC9y9ig==
Content-ID: <642C8E9FFFC88D46B6E706AB8CD6778A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3778
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(22756006)(33656002)(66066001)(2906002)(23726003)(8936002)(70586007)(81166006)(8676002)(76130400001)(86362001)(70206006)(8746002)(1076003)(81156014)(356004)(47776003)(3846002)(6636002)(6116002)(54906003)(37006003)(6512007)(316002)(26826003)(478600001)(6306002)(45080400002)(6862004)(63350400001)(6246003)(2616005)(186003)(6506007)(53546011)(446003)(99286004)(102836004)(76176011)(6486002)(305945005)(966005)(476003)(386003)(97756001)(229853002)(336012)(26005)(126002)(14454004)(486006)(7736002)(11346002)(4326008)(36906005)(14444005)(561944003)(5660300002)(46406003)(50466002)(25786009)(36756003)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3221;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: abf5f33f-28a5-4914-8ffe-08d753fc3c77
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/sXc82p13BNvErl4vYgDdbhFED1CwEbQ5avY6CohjRmYhKNIqC2U/SPPK7h+/r0RN7zBVNXFu17T6JUsFASF5rAOlgf3vKKSVN+PJBxn/jEME2NAPdMEQ010JOlG45rbycL9h2nStmaP3+XSVoz4eYwKzSdlUVa/D9/MA+OxQRmXc+2CX69IQ9gsLteA8KwX17ybgmTbhmtfZ72jl4hPlduxdX8NTVejUXOF+FXQRch154qgxEwbVc5ubdUvqNPxaml84hERz7DYxvwNC637VGlLK79AM21RYWFpiZYTw5VJnKEstCUKO5VWaJQhMJH6PB80/2MAVNaWa4Mmwobz5EpCMd7yzPi8/uMgTslhAxL7RZCrORd+h5GcwIDpCUVRBE1UWNYqWaz6RQyiJk2iriwN9cUs5awgkRuZlNUCyBLL4Umf2hmSjvKVXcjjF6LtVfpa9xqE4CH9qs143NVvA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 18:52:04.9314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9aedd8-3e4b-41fb-00bd-08d753fc44f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHF+gAzf95UgWGG/O3ff0/g0s2gOsiAmeEV2+zePag4=;
 b=RIrDxaN7OGX/InSw7nnkb9Z1BF1HR2rsnYQvaalDA01emoVFgucUbGtizayC/ZLup8AvQHEs3nSXz3gWm7l2BF85nzIpYvv12edPRh3ynWmJ8A+PD2+gQxP0BVCkuIAZFZo428eQ3KQwtoKsV6G+1UvazsqAWqRStfVyAzzFjRc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHF+gAzf95UgWGG/O3ff0/g0s2gOsiAmeEV2+zePag4=;
 b=RIrDxaN7OGX/InSw7nnkb9Z1BF1HR2rsnYQvaalDA01emoVFgucUbGtizayC/ZLup8AvQHEs3nSXz3gWm7l2BF85nzIpYvv12edPRh3ynWmJ8A+PD2+gQxP0BVCkuIAZFZo428eQ3KQwtoKsV6G+1UvazsqAWqRStfVyAzzFjRc=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Vincent Donnefort <Vincent.Donnefort@arm.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "Andrew F. Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kysgam9obi5zdHVsdHpAbGluYXJvLm9yZyAoU29ycnksIHNvbWVob3cgSSBhbSBtaXNzaW5nIHlv
dXIgZW1haWwgd2hpbGUKc2VuZGluZy4gOiggKQpPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAwNjo0
MToyNFBNICswMDAwLCBBeWFuIEhhbGRlciB3cm90ZToKPiBPbiBGcmksIE9jdCAxOCwgMjAxOSBh
dCAwOTo1NToxN0FNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4gT24gVGh1LCBPY3Qg
MTcsIDIwMTkgYXQgMDE6NTc6NDVQTSAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPiA+IE9u
IFRodSwgT2N0IDE3LCAyMDE5IGF0IDEyOjI5IFBNIEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gT24gMTAvMTcvMTkgMzoxNCBQTSwgSm9obiBTdHVsdHogd3JvdGU6
Cj4gPiA+ID4gPiBCdXQgaWYgdGhlIG9iamVjdGlvbiBzdGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJv
cG9zYWwgZm9yIGFuIGFsdGVybmF0aXZlCj4gPiA+ID4gPiB3YXkgdG8gZW51bWVyYXRlIGEgc3Vi
c2V0IG9mIENNQSBoZWFwcz8KPiA+ID4gPiA+Cj4gPiA+ID4gV2hlbiBpbiBzdGFnaW5nIElPTiBo
YWQgdG8gcmVhY2ggaW50byB0aGUgQ01BIGZyYW1ld29yayBhcyB0aGUgb3RoZXIKPiA+ID4gPiBk
aXJlY3Rpb24gd291bGQgbm90IGJlIGFsbG93ZWQsIHNvIGNtYV9mb3JfZWFjaF9hcmVhKCkgd2Fz
IGFkZGVkLiBJZgo+ID4gPiA+IERNQS1CVUYgaGVhcHMgaXMgbm90IGluIHN0YWdpbmcgdGhlbiB3
ZSBjYW4gZG8gdGhlIG9wcG9zaXRlLCBhbmQgaGF2ZQo+ID4gPiA+IHRoZSBDTUEgZnJhbWV3b3Jr
IHJlZ2lzdGVyIGhlYXBzIGl0c2VsZiB1c2luZyBvdXIgZnJhbWV3b3JrLiBUaGF0IHdheQo+ID4g
PiA+IHRoZSBDTUEgc3lzdGVtIGNvdWxkIGRlY2lkZSB3aGF0IGFyZWFzIHRvIGV4cG9ydCBvciBu
b3QgKG1heWJlIGJhc2VkIG9uCj4gPiA+ID4gYSBEVCBwcm9wZXJ0eSBvciBzaW1pbGFyKS4KPiA+
ID4gCj4gPiA+IE9rLiBUaG91Z2ggdGhlIENNQSBjb3JlIGRvZXNuJ3QgaGF2ZSBtdWNoIHNlbnNl
IG9mIERUIGRldGFpbHMgZWl0aGVyLAo+ID4gPiBzbyBpdCB3b3VsZCBwcm9iYWJseSBoYXZlIHRv
IGJlIGRvbmUgaW4gdGhlIHJlc2VydmVkX21lbSBsb2dpYywgd2hpY2gKPiA+ID4gZG9lc24ndCBm
ZWVsIHJpZ2h0IHRvIG1lLgo+ID4gPiAKPiA+ID4gSSdkIHByb2JhYmx5IGd1ZXNzIHdlIHNob3Vs
ZCBoYXZlIHNvbWUgc29ydCBvZiBkdCBiaW5kaW5nIHRvIGRlc2NyaWJlCj4gPiA+IGEgZG1hYnVm
IGNtYSBoZWFwIGFuZCBmcm9tIHRoYXQgbm9kZSBsaW5rIHRvIGEgQ01BIG5vZGUgdmlhIGEKPiA+
ID4gbWVtb3J5LXJlZ2lvbiBwaGFuZGxlLiBBbG9uZyB3aXRoIG1heWJlIHRoZSBkZWZhdWx0IGhl
YXAgYXMgd2VsbD8gTm90Cj4gPiA+IGVhZ2VyIHRvIGdldCBpbnRvIGFub3RoZXIgYmluZGluZyBy
ZXZpZXcgY3ljbGUsIGFuZCBJJ20gbm90IHN1cmUgd2hhdAo+ID4gPiBub24tRFQgc3lzdGVtcyB3
aWxsIGRvIHlldCwgYnV0IEknbGwgdGFrZSBhIHNob3QgYXQgaXQgYW5kIGl0ZXJhdGUuCj4gPiA+
IAo+ID4gPiA+IFRoZSBlbmQgcmVzdWx0IGlzIHRoZSBzYW1lIHNvIHdlIGNhbiBtYWtlIHRoaXMg
Y2hhbmdlIGxhdGVyIChpdCBoYXMgdG8KPiA+ID4gPiBjb21lIGFmdGVyIERNQS1CVUYgaGVhcHMg
aXMgaW4gYW55d2F5KS4KPiA+ID4gCj4gPiA+IFdlbGwsIEknbSBoZXNpdGFudCB0byBtZXJnZSBj
b2RlIHRoYXQgZXhwb3NlcyBhbGwgdGhlIENNQSBoZWFwcyBhbmQKPiA+ID4gdGhlbiBhZGQgcGF0
Y2hlcyB0aGF0IGJlY29tZXMgbW9yZSBzZWxlY3RpdmUsIHNob3VsZCBhbnlvbmUgZGVwZW5kIG9u
Cj4gPiA+IHRoZSBpbml0aWFsIGJlaGF2aW9yLiA6Lwo+ID4gCj4gPiBIb3cgYWJvdXQgb25seSBh
dXRvLWFkZGluZyB0aGUgc3lzdGVtIGRlZmF1bHQgQ01BIHJlZ2lvbiAoY21hLT5uYW1lID09Cj4g
PiAicmVzZXJ2ZWQiKT8KPiA+IAo+ID4gQW5kL29yIHRoZSBDTUEgYXV0by1hZGQgY291bGQgYmUg
YmVoaW5kIGEgY29uZmlnIG9wdGlvbj8gSXQgc2VlbXMgYQo+ID4gc2hhbWUgdG8gZnVydGhlciBk
ZWxheSB0aGlzLCBhbmQgdGhlIENNQSBoZWFwIGl0c2VsZiByZWFsbHkgaXMgdXNlZnVsLgo+ID4K
PiBBIGJpdCBvZiBhIGRldG91ciwgY29tbWluZyBiYWNrIHRvIHRoZSBpc3N1ZSB3aHkgdGhlIGZv
bGxvd2luZyBub2RlCj4gd2FzIG5vdCBnZXR0aW5nIGRldGVjdGVkIGJ5IHRoZSBkbWEtYnVmIGhl
YXBzIGZyYW1ld29yay4KPiAKPiAgICAgICAgIHJlc2VydmVkLW1lbW9yeSB7Cj4gICAgICAgICAg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwyPjsKPiAgICAgICAgICAgICAgICAgcmFuZ2VzOwo+IAo+ICAgICAgICAgICAgICAgICBk
aXNwbGF5X3Jlc2VydmVkOiBmcmFtZWJ1ZmZlckA2MDAwMDAwMCB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpbnV4LGNtYS1kZWZhdWx0Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dXNhYmxlOyA8PDw8PDw8PDw8PDwtLS0tLS0tLS0tLVRoaXMgd2FzIG1pc3NpbmcgaW4gb3VyCj4g
ZWFybGllciBub2RlCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHg2MDAwMDAw
MCAwIDB4MDgwMDAwMDA+Owo+ICAgICAgICAgICAgICAgICB9Owo+ICAKPiBRdW90aW5nIHJlc2Vy
dmVkLW1lbW9yeS50eHQgOi0KPiAiVGhlIG9wZXJhdGluZyBzeXN0ZW0gY2FuIHVzZSB0aGUgbWVt
b3J5IGluIHRoaXMgcmVnaW9uIHdpdGggdGhlIGxpbWl0YXRpb24gdGhhdAo+ICB0aGUgZGV2aWNl
IGRyaXZlcihzKSBvd25pbmcgdGhlIHJlZ2lvbiBuZWVkIHRvIGJlIGFibGUgdG8gcmVjbGFpbSBp
dCBiYWNrIgo+IAo+IFRodXMgYXMgcGVyIG15IG9ic2VydmF0aW9uLCB3aXRob3V0ICdyZXVzYWJs
ZScsIHJtZW1fY21hX3NldHVwKCkKPiByZXR1cm5zIC1FSU5WQUwgYW5kIHRoZSByZXNlcnZlZC1t
ZW1vcnkgaXMgbm90IGFkZGVkIGFzIGEgY21hIHJlZ2lvbi4KPiAKPiBXaXRoICdyZXVzYWJsZScs
IHJtZW1fY21hX3NldHVwKCkgc3VjY2VlZHMgLCBidXQgdGhlIGtlcm5lbCBjcmFzaGVzIGFzIGZv
bGxvd3MgOi0KPiAKPiBbICAgIDAuNDUwNTYyXSBXQVJOSU5HOiBDUFU6IDIgUElEOiAxIGF0IG1t
L2NtYS5jOjExMCBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGVjLzB4MjJjCj4gWyAgICAwLjQ1
ODQxNV0gTW9kdWxlcyBsaW5rZWQgaW46ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAo+IFsgICAgMC40NjE0NzBdIENQVTogMiBQSUQ6IDEgQ29tbTog
c3dhcHBlci8wIE5vdCB0YWludGVkIDUuMy4wLXJjNC0wMTM3Ny1nNTFkYmNmMDM4ODRjLWRpcnR5
ICMxNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBbICAg
IDAuNDcwMDE3XSBIYXJkd2FyZSBuYW1lOiBBUk0gSnVubyBkZXZlbG9wbWVudCBib2FyZCAocjAp
IChEVCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCj4gWyAgICAwLjQ3NTk1M10gcHN0YXRlOiA4MDAwMDAw
NSAoTnpjdiBkYWlmIC1QQU4gLVVBTykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+
IFsgICAgMC40ODA3NTVdIHBjIDogY21hX2luaXRfcmVzZXJ2ZWRfYXJlYXMrMHhlYy8weDIyYyAg
Cj4gWyAgICAwLjQ4NTY0M10gbHIgOiBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGU4LzB4MjJj
IAo+IDwtLS0tc25pcCByZWdpc3RlciBkdW1wIC0tLT4KPiAKPiBbICAgIDAuNjAwNjQ2XSBVbmFi
bGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZm
ZjdkZmZmZjgwMDAwMAo+IFsgICAgMC42MDg1OTFdIE1lbSBhYm9ydCBpbmZvOgo+IFsgICAgMC42
MTEzODZdICAgRVNSID0gMHg5NjAwMDAwNgo+IDwtLS1zbmlwIHVuaW50ZXJlc3RpbmcgYml0cyAt
LS0+Cj4gWyAgICAwLjY4MTA2OV0gcGMgOiBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweDExNC8w
eDIyYwo+IFsgICAgMC42ODYwNDNdIGxyIDogY21hX2luaXRfcmVzZXJ2ZWRfYXJlYXMrMHhlOC8w
eDIyYwo+IAo+IAo+IEkgYW0gbG9va2luZyBpbnRvIHRoaXMgbm93LiBNeSBmaW5hbCBvYmplY3Rp
dmUgaXMgdG8gZ2V0ICIvZGV2L2RtYV9oZWFwL2ZyYW1lYnVmZmVyIgo+IChhcyBhIGNtYSBoZWFw
KS4KPiBBbnkgbGVhZHM/Cj4gCj4gPiBDaGVlcnMsCj4gPiAtQnJpYW4KPiA+IAo+ID4gPiAKPiA+
ID4gU28sIDxzaWdoPiwgSSdsbCBzdGFydCBvbiB0aGUgcmV3b3JrIGZvciB0aGUgQ01BIGJpdHMu
Cj4gPiA+IAo+ID4gPiBUaGF0IHNhaWQsIEknbSBkZWZpbml0ZWx5IHdhbnRpbmcgdG8gbWFrZSBz
b21lIHByb2dyZXNzIG9uIHRoaXMgcGF0Y2gKPiA+ID4gc2VyaWVzLCBzbyBtYXliZSB3ZSBjYW4g
c3RpbGwgbWVyZ2UgdGhlIGNvcmUvaGVscGVycy9zeXN0ZW0gaGVhcCBhbmQKPiA+ID4ganVzdCBo
b2xkIHRoZSBjbWEgaGVhcCBmb3IgYSByZXdvcmsgb24gdGhlIGVudW1lcmF0aW9uIGJpdHMuIFRo
YXQgd2F5Cj4gPiA+IHdlIGNhbiBhdCBsZWFzdCBnZXQgb3RoZXIgZm9sa3Mgd29ya2luZyBvbiBz
d2l0Y2hpbmcgdGhlaXIgdmVuZG9yCj4gPiA+IGhlYXBzIGZyb20gSU9OLgo+ID4gPiAKPiA+ID4g
U3VtaXQ6IERvZXMgdGhhdCBzb3VuZCBvaz8gQXNzdW1pbmcgbm8gb3RoZXIgb2JqZWN0aW9ucywg
Y2FuIHlvdSB0YWtlCj4gPiA+IHRoZSB2MTEgc2V0IG1pbnVzIHRoZSBDTUEgaGVhcCBwYXRjaD8K
PiA+ID4gCj4gPiA+IHRoYW5rcwo+ID4gPiAtam9obgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
