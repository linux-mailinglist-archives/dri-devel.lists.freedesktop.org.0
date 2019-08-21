Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307598D3B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118636EA8C;
	Thu, 22 Aug 2019 08:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300114.outbound.protection.outlook.com [40.107.130.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF78825E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 11:59:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcbQLRXhUhHYmsNavmspj0qGsQOFs3PfMP6ny9rKqSMc0FyQRYtH26AmS4nfV6mYGvsU7anYRdnHAAIOaJ6+QV2i7VCkqYG3IOWBvpf3tmjc70hnAgkVTK7POdMApLY+45S5LmUESbQvwTfnafeHnLAOBfvsZrPa8zC1DCDBLM39hv/P51F7MNcg+xMfG+C0OebE/gbnK9uKa2zylYfJNIemkJh7un9RLkORQXJ/FQ1FTYWivNzWFlCNdLXhxeCfKll5EKLpef82VFdsG/g802Fygn6iIOVxO/Zkb/Sw9rUIYubhJTTX26zVqRsq86/qQPrLBbWJ4JXgCQ263GmqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEL/B5T9Yj9wDNOmaX9FT8+AevNZ785C9cgfOJceSYM=;
 b=XnkTQbu9aRaODhLwTMCqwO8OoERvO7RZkVVuER+OsTx8TEMdkgBIM/BuX6MnYyZCYmhKZ6Br6VJp6T1cT9Yo7WotmxkSSvllmEzSZnu6JQJpF+76tpQWNXpNbIBGSTuDUJZemPIq0bDpxzduSJvTlQQ8rnCnWAvfsIjH2A5SO1KS50smau7IGmD7BqIhQn9VeLZHKOo0ITz/wScQ0B1yeCAeg7sgdnU1twtg1lKNXnFbhenW0CkGRRw+oDE++8aiwstgYrfw4gUnwDXCY32byMcMrPbGuK2IMEr1gcmJO+K3dB8WZaEUeRDaIVvZ/qKeY9wRQzjXKTG4MelO6LHVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM (52.132.240.17) by
 KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM (52.132.242.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.4; Wed, 21 Aug 2019 11:59:19 +0000
Received: from KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM
 ([fe80::c402:2ce2:cafa:8b1e]) by KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM
 ([fe80::c402:2ce2:cafa:8b1e%8]) with mapi id 15.20.2220.000; Wed, 21 Aug 2019
 11:59:19 +0000
From: Wei Hu <weh@microsoft.com>
To: Michael Kelley <mikelley@microsoft.com>, "rdunlap@infradead.org"
 <rdunlap@infradead.org>, "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>, "info@metux.net"
 <info@metux.net>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>, Iouri Tarassov <iourit@microsoft.com>
Subject: RE: [PATCH] video: hyperv: hyperv_fb: Support deferred IO for Hyper-V
 frame buffer driver
Thread-Topic: [PATCH] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVUcL5xwYcgiTbLE2rph4+nLCFt6cBbYBAgAQTWPA=
Date: Wed, 21 Aug 2019 11:59:18 +0000
Message-ID: <KL1P15301MB026487D86E439FA67B25C42CBBAA0@KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM>
References: <20190813103548.2008-1-weh@microsoft.com>
 <DM5PR21MB0137E0BB19D8A0E6385BB316D7A90@DM5PR21MB0137.namprd21.prod.outlook.com>
In-Reply-To: <DM5PR21MB0137E0BB19D8A0E6385BB316D7A90@DM5PR21MB0137.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-18T22:41:11.4651147Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ccd13015-0c82-412f-bb9a-41c31ca9a93d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [167.220.255.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d91bb9a-d139-481a-737b-08d7262eff75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600158)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:KL1P15301MB0343; 
x-ms-traffictypediagnostic: KL1P15301MB0343:|KL1P15301MB0343:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1P15301MB0343FAC996A3DBA52B81518DBBAA0@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(13464003)(199004)(189003)(6436002)(8990500004)(102836004)(7416002)(66476007)(11346002)(8676002)(53546011)(9686003)(55016002)(10290500003)(33656002)(2501003)(66446008)(76116006)(64756008)(81166006)(81156014)(74316002)(71200400001)(1250700005)(66946007)(25786009)(86362001)(71190400001)(66556008)(305945005)(2201001)(7736002)(5660300002)(14444005)(256004)(486006)(66066001)(110136005)(6246003)(53936002)(476003)(446003)(14454004)(99286004)(26005)(8936002)(22452003)(186003)(316002)(2906002)(52536014)(76176011)(3846002)(6116002)(7696005)(229853002)(6636002)(478600001)(6506007)(10090500001)(1511001)(241875001)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:KL1P15301MB0343;
 H:KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: raHwhlIaoGzzFSiic1z47czlX67l2UC31Hy3Ia7gsHrfFbpUqrtPMcK6K64JIJAimYK439gZxhjvGbU23GUGgQiOlVEol0hxxzzFF5sfW3q0qAXDkaghpowCcjjaoCulLt/R1IhaJklNwbNbjRAnRVNV8aSlviAMu/WKsAg40nVtiEAkpIJxenoXhjApvEl+tY9z5SjRBzFH6BHl2ddVVtthfizS7dOv+2/jPUAbi8a7M0Sqwp1tJ+RbiRdRnmsHPZOWhh6pJbtvkNUeVZ34JadSV29RTLMhp1ZqC/5uiMp6+Q1UitoZnlwRsiwbNaN76IIEHWlgY7CH8OO/XNxB8S/7/QvsqnEpqGVvdnaFU4UbemaXjI5gyE47WaS1OfAHK2XH7eulmRvzQKTt4jWcKnQ3GovwtP2zYhyysfHwfyk=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d91bb9a-d139-481a-737b-08d7262eff75
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 11:59:18.7715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9fn5VbpxX0LES9eFSvaac6mP9UWLqCclAbwmZvma2iPCXFep8PQXYo7aPkoNrmcanQm/JoJ7za7+nuzlbRLzYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0343
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEL/B5T9Yj9wDNOmaX9FT8+AevNZ785C9cgfOJceSYM=;
 b=d1CR/CaKVt0lr+Xq/woGPfBw4kEOoZyiRV7o22cihKzci2oF3mBdiTVba9KTW+TE0lk58myuLOX519wqq8Hxc71B3pzRc+otDsSNq5AWUJ1rthrLNS73B26uRSPDaLKUvz5JDky6Dnp2hkZQAiBqsD6pa4XFndjbCH+qglOI2HA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=weh@microsoft.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIE1pY2hhZWwuIFNlZSBteSByZXBseSBpbmxpbmUgdG8gc29tZSBvZiB5b3VyIGNvbW1l
bnRzLgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IE1pY2hhZWwgS2VsbGV5
IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPgo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDE5LCAyMDE5
IDY6NDEgQU0KPiBUbzogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT47IHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZzsgc2hjX3dvcmtAbWFpbC5ydTsKCj4gPiAtCW1zZy5kaXJ0LnJlY3RbMF0ueDEgPSAw
Owo+ID4gLQltc2cuZGlydC5yZWN0WzBdLnkxID0gMDsKPiA+IC0JbXNnLmRpcnQucmVjdFswXS54
MiA9IGluZm8tPnZhci54cmVzOwo+ID4gLQltc2cuZGlydC5yZWN0WzBdLnkyID0gaW5mby0+dmFy
LnlyZXM7Cj4gPiArCW1zZy5kaXJ0LnJlY3RbMF0ueDEgPSAoeDEgPCAwIHx8IHgxID4geDIpID8g
MCA6IHgxOwo+ID4gKwltc2cuZGlydC5yZWN0WzBdLnkxID0gKHkyIDwgMCB8fCB5MSA+IHkyKSA/
IDAgOiB5MTsKPiAKPiBUaGlzIHNob3VsZCBiZToKPiAKPiAJbXNnLmRpcnQucmVjdFswXS55MSA9
ICh5MSA8IDAgfHwgeTEgPiB5MikgPyAwIDogeTE7Cj4gCj4gQWxzbywgdGhyb3VnaG91dCB0aGUg
Y29kZSwgSSBkb24ndCB0aGluayB0aGVyZSBhcmUgYW55IHBsYWNlcyB3aGVyZQo+IHggb3IgeSBj
b29yZGluYXRlIHZhbHVlcyBhcmUgZXZlciBuZWdhdGl2ZS4gIElOVF9NQVggb3IgMCBpcyB1c2Vk
IGFzIHRoZQo+IHNlbnRpbmVsIHZhbHVlIGluZGljYXRpbmcgIm5vdCBzZXQiLiAgU28gY2FuIGFs
bCB0aGUgdGVzdHMgZm9yIGxlc3MgdGhhbiAwCj4gbm93IGJlIGVsaW1pbmF0ZWQsIGJvdGggaW4g
dGhpcyBmdW5jdGlvbiBhbmQgaW4gb3RoZXIgZnVuY3Rpb25zPwo+IAo+ID4gKwltc2cuZGlydC5y
ZWN0WzBdLngyID0KPiA+ICsJCSh4MiA8IHgxIHx8IHgyID4gaW5mby0+dmFyLnhyZXMpID8gaW5m
by0+dmFyLnhyZXMgOiB4MjsKPiA+ICsJbXNnLmRpcnQucmVjdFswXS55MiA9Cj4gPiArCQkoeTIg
PCB5MSB8fCB5MiA+IGluZm8tPnZhci55cmVzKSA/IGluZm8tPnZhci55cmVzIDogeTI7Cj4gCj4g
SG93IGV4YWN0bHkgaXMgdGhlIGRpcnR5IHJlY3RhbmdsZSBzcGVjaWZpZWQgdG8gSHlwZXItVj8g
IFN1cHBvc2UgdGhlIGZyYW1lCj4gYnVmZmVyIHJlc29sdXRpb24gaXMgMTAweDIwMC4gIElmIHlv
dSB3YW50IHRvIHNwZWNpZnkgdGhlIGVudGlyZSByZWN0YW5nbGUsIHRoZQo+IGZpcnN0IGNvb3Jk
aW5hdGUgaXMgKDAsIDApLiAgQnV0IHdoYXQgaXMgdGhlIHNlY29uZCBjb29yZGluYXRlPyAgU2hv
dWxkIGl0IGJlCj4gKDk5LCAxOTkpIG9yICgxMDAsIDIwMCk/ICBUaGUgYWJvdmUgY29kZSAoYW5k
IG9yaWdpbmFsIGNvZGUpIGltcGxpZXMgaXQKPiBzaG91bGQgc3BlY2lmaWVkIGFzICgxMDAsIDIw
MCksIHdoaWNoIGlzIGFjdHVhbGx5IGEgcG9pbnQgb3V0c2lkZSB0aGUKPiBtYXhpbXVtIHJlc29s
dXRpb24sIHdoaWNoIGlzIGNvdW50ZXItaW50dWl0aXZlIGFuZCBtYWtlcyBtZSB3b25kZXIKPiBp
ZiB0aGUgY29kZSBpcyBjb3JyZWN0Lgo+IApbV2VpIEh1XSAKVGhlIGN1cnJlbnQgY29kZSB0cmVh
dCB0aGUgZW50aXJlIGZyYW1lYnVmZmVyIHJlY3RhbmdsZSBhcyAoMCwwKSAtPiAodmFyLnhyZXMs
IHZhci55cmVzKS4KRXZlcnkgdGltZSBpdCBzZW5kcyByZWZyZXNoIHJlcXVlc3QsIHRoZXNlIGFy
ZSB0d28gcG9pbnRzIHNlbnQgdG8gaG9zdCBhbmQgaG9zdApzZWVtcyBhY2NlcHQgaXQuIFNlZSB0
aGUgYWJvdmUgKHgxLCB5MSkgYW5kICh4MiwgeTIpICBpbiB0aGUgZGVsZXRlZCBsaW5lcy4KClNv
IGluIHlvdXIgZXhhbXBsZSB0aGUgc2Vjb25kIGNvb3JkaW5hdGUgaXMgKDEwMCwgMjAwKS4gCgoK
PiA+ICsvKiBEZWZlcnJlZCBJTyBjYWxsYmFjayAqLwo+ID4gK3N0YXRpYyB2b2lkIHN5bnRodmlk
X2RlZmVycmVkX2lvKHN0cnVjdCBmYl9pbmZvICpwLAo+ID4gKwkJCQkgc3RydWN0IGxpc3RfaGVh
ZCAqcGFnZWxpc3QpCj4gPiArewo+ID4gKwlzdHJ1Y3QgaHZmYl9wYXIgKnBhciA9IHAtPnBhcjsK
PiA+ICsJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gPiArCXVuc2lnbmVkIGxvbmcgc3RhcnQsIGVuZDsK
PiA+ICsJaW50IHkxLCB5MiwgbWlueSwgbWF4eTsKPiA+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsK
PiA+ICsKPiA+ICsJbWlueSA9IElOVF9NQVg7Cj4gPiArCW1heHkgPSAwOwo+ID4gKwo+ID4gKwls
aXN0X2Zvcl9lYWNoX2VudHJ5KHBhZ2UsIHBhZ2VsaXN0LCBscnUpIHsKPiA+ICsJCXN0YXJ0ID0g
cGFnZS0+aW5kZXggPDwgUEFHRV9TSElGVDsKPiA+ICsJCWVuZCA9IHN0YXJ0ICsgUEFHRV9TSVpF
IC0gMTsKPiA+ICsJCXkxID0gc3RhcnQgLyBwLT5maXgubGluZV9sZW5ndGg7Cj4gPiArCQl5MiA9
IGVuZCAvIHAtPmZpeC5saW5lX2xlbmd0aDsKPiAKPiBUaGUgYWJvdmUgZGl2aXNpb24gcm91bmRz
IGRvd24gYmVjYXVzZSBhbnkgcmVtYWluZGVyIGlzIGRpc2NhcmRlZC4gIEkKPiB3b25kZXJlZCB3
aGV0aGVyIHJvdW5kaW5nIGRvd24gaXMgY29ycmVjdCwgd2hpY2ggZ290IG1lIHRvIHRoaW5raW5n
Cj4gYWJvdXQgaG93IHRoZSBkaXJ0eSByZWN0YW5nbGUgaXMgc3BlY2lmaWVkLiAgSXMgeTIgdGhl
IGluZGV4IG9mIHRoZSBsYXN0Cj4gZGlydHkgcm93PyAgSWYgc28sIHRoYXQncyBub3QgY29uc2lz
dGVudCB3aXRoIHRoZSBjb2RlIGluIHN5bnRodmlkX3VwZGF0ZSgpLAo+IHdoaWNoIG1pZ2h0IGNo
b29zZSB2YXIueXJlcyBhcyB5MiwgYW5kIHRoYXQncyB0aGUgaW5kZXggb2YgYSByb3cgb3V0c2lk
ZQo+IG9mIHRoZSBmcmFtZSBidWZmZXIuCj4gCltXZWkgSHVdIApJbiB0aGlzIHBsYWNlIHdlIHRy
eSB0byBmaWd1cmUgb3V0IGFuZCBtZXJnZSBhbGwgdGhlIGZhdWx0ZWQgcGFnZXMgaW50byBvbmUK
YmlnIGRpcnR5IHJlY3RhbmdsZS4gQSBwYWdlIGluIG1lbW9yeSByZXByZXNlbnRzIG9uZSBvciBt
dWx0aXBsZSBsaW5lcyBpbgpmcmFtZSBidWZmZXIuIEZvciBleGFtcGxlLCBvbmUgZmF1bHRlZCBw
YWdlIGNvdWxkIHJlcHJlc2VudCBhbGwgdGhlIGxpbmVhciAKcGl4ZWxzIGZyb20gKHgsIHkpIHRv
ICh4LTEsIHkrMSkuIEluIHRoaXMgY2FzZSB3ZSBqdXN0IGZvcm0gdGhlIGRpcnR5IHJlY3Rhbmds
ZQphcyAoMCwgeSkgLT4gKHZhci54cmVzLCB5KzEpLiBBbHNvIGtlZXAgaW4gbWluZCB3ZSBuZWVk
IHRvIG1lcmdlIG11bHRpcGxlCnBhZ2VzLiBUaGF0J3Mgd2h5IGluIHRoZSBlbmQgdGhlIGRpcnR5
IHJlY3RhbmdsZSBpcyAoMCwgbWlueSkgLT4gKHZhci54cmVzLCBtYXh5KS4KCgo+ID4gKwkJaWYg
KHkyID4gcC0+dmFyLnlyZXMpCj4gPiArCQkJeTIgPSBwLT52YXIueXJlczsKPiA+ICsJCW1pbnkg
PSBtaW5fdChpbnQsIG1pbnksIHkxKTsKPiA+ICsJCW1heHkgPSBtYXhfdChpbnQsIG1heHksIHky
KTsKPiA+ICsKPiA+ICsJCS8qIENvcHkgZnJvbSBkaW8gc3BhY2UgdG8gbW1pbyBhZGRyZXNzICov
Cj4gPiArCQlpZiAocGFyLT5mYl9yZWFkeSkgewo+ID4gKwkJCXNwaW5fbG9ja19pcnFzYXZlKCZw
YXItPmRvY29weV9sb2NrLCBmbGFncyk7Cj4gPiArCQkJaHZmYl9kb2NvcHkocGFyLCBzdGFydCwg
UEFHRV9TSVpFKTsKPiA+ICsJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwYXItPmRvY29weV9s
b2NrLCBmbGFncyk7Cj4gPiArCQl9Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYgKHBhci0+ZmJfcmVh
ZHkpCj4gPiArCQlzeW50aHZpZF91cGRhdGUocCwgMCwgbWlueSwgcC0+dmFyLnhyZXMsIG1heHkp
Owo+ID4gK30KCgoKCj4gPiArCj4gPiArCQlpZiAoaiA9PSBpbmZvLT52YXIueXJlcykKPiA+ICsJ
CQlicmVhazsKPiA+ICsJCWh2ZmJfZG9jb3B5KHBhciwKPiA+ICsJCQkgICAgaiAqIGluZm8tPmZp
eC5saW5lX2xlbmd0aCArCj4gPiArCQkJICAgICh4MSAqIHNjcmVlbl9kZXB0aCAvIDgpLAo+ID4g
KwkJCSAgICAoeDIgLSB4MSArIDEpICogc2NyZWVuX2RlcHRoIC8gOCk7Cj4gCj4gV2hldGhlciB0
aGUgKzEgaXMgbmVlZGVkIGFib3ZlIGdldHMgYmFjayB0byB0aGUgcXVlc3Rpb24gSQo+IHJhaXNl
ZCBlYXJsaWVyIGFib3V0IGhvdyB0byBpbnRlcnByZXQgdGhlIGNvb3JkaW5hdGVzIC0tIHdoZXRo
ZXIKPiB0aGUgKHgyLCB5MikgY29vcmRpbmF0ZSBpcyBqdXN0IG91dHNpZGUgdGhlIGRpcnR5IHJl
Y3RhbmdsZSBvcgo+IGp1c3QgaW5zaWRlIHRoZSBkaXJ0eSByZWN0YW5nbGUuICBNb3N0IG9mIHRo
ZSBjb2RlIHNlZW1zIHRvIHRyZWF0Cj4gaXQgYXMgYmVpbmcganVzdCBvdXRzaWRlIHRoZSBkaXJ0
eSByZWN0YW5nbGUsIGluIHdoaWNoIGNhc2UgdGhlICsxCj4gc2hvdWxkIG5vdCBiZSB1c2VkLgo+
IApbV2VpIEh1XSAKVGhpcyBkaXJ0eSByZWN0YW5nbGUgaXMgbm90IGZyb20gcGFnZSBmYXVsdCwg
YnV0IHJhdGhlciBmcm9tIGZyYW1lIGJ1ZmZlcgpmcmFtZXdvcmsgd2hlbiB0aGUgc2NyZWVuIGlz
IGluIHRleHQgbW9kZS4gSSBhbSBub3QgMTAwJSBzdXJlIGlmIHRoZSBkaXJ0eQpyZWN0YW5nbGUg
Z2l2ZW4gZnJvbSBrZXJuZWwgaW5jbHVkZXMgb24gZXh0cmEgbGluZSBvdXRzaWRlIG9yIG5vdC4g
IEhlcmUgSSAKanVzdCBwbGF5IGl0IHNhZmUgYnkgY29weWluZyBvbmUgZXh0cmEgbGluZSBpbiB0
aGUgd29yc3QgY2FzZS4KClN1cHBvc2UgZGlydHkgcmVjdGFuZ2xlIG9ubHkgY29udGFpbiBvbmUg
cGl4ZWwsIGZvciBleGFtcGxlICgwLDApIGlzIHRoZSBvbmx5CnBpeGVsIGNoYW5nZWQgaW4gdGhl
IGVudGlyZSBmcmFtZSBidWZmZXIuIElmIGtlcm5lbCBzZW5kcyBtZSBkaXJ0eSByZWN0YW5nbGUg
YXMKKDAsIDApIC0+ICgwLCAwKSwgdGhlIGFib3ZlIGZ1bmN0aW9uIHdvcmtzIGNvcnJlY3RseS4g
SWYgdGhlIGtlcm5lbCBzZW5kcwogKDAsIDApIC0+ICgxLCAxKSwgdGhlbiB0aGUgYWJvdmUgZnVu
Y3Rpb24ganVzdCBjb3BpZXMgb25lIGV4dHJhIHJvdyBhbmQgb25lIGV4dHJhCmNvbHVtbiwgd2hp
Y2ggc2hvdWxkIGFsc28gYmUgZmluZS4gVGhlIGh2ZmJfZG9jb3B5KCkgdGFrZXMgY2FyZSBvZiB0
aGUgCmVkZ2UgY2FzZXMuCgpUaGFua3MsCldlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
