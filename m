Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A63B89BFD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 12:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712766E4DE;
	Mon, 12 Aug 2019 10:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130081.outbound.protection.outlook.com [40.107.13.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA896E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 10:53:18 +0000 (UTC)
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by DB6PR0801MB1846.eurprd08.prod.outlook.com (2603:10a6:4:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Mon, 12 Aug
 2019 10:53:14 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Mon, 12 Aug 2019 10:53:14 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 12 Aug 2019 10:53:12 +0000
Received: ("Tessian outbound 578a71fe5eaa:v26");
 Mon, 12 Aug 2019 10:53:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35efab63fa2a806b
X-CR-MTA-TID: 64aa7808
Received: from fd417c9c4efb.1 (cr-mta-lb-1.cr-mta-net [104.47.13.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D15525B1-FAD6-467E-8DC1-21DDBD926FAA.1; 
 Mon, 12 Aug 2019 10:53:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd417c9c4efb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Aug 2019 10:53:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRuqkcCM9QNDOkbBZi1GZwL27K9oy2Is7zAH1gD0+zJhxtrZwtx6aH7bzwXx1YBX+rCH1tZTTTbSX1kKUMCLKPKcvE7lxeJaxESQZPJ39dut9zXUQivqcgIixOzjm9n3jGv94TwZNJnOXnvHggKrQ0kH+DT0IlJmIBYsz7RX+8fcYZUbzWf6XtvWJ5LhBpw/z4UzsVkhpHXbIIVDmtd1x3uXQ5jzpaDFWUoJc8pu2amVnrwBjrmjckFQmwN/NOG24AWCFDiVfIezBLebv1GLrzocn7ryftGxz2Pe+MZNUkLvNKubG458/AUhPowU3KFeM0TzqqzoOM487QTDpJnJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci5HU8tWWizDNnGoi7DKH7OhOZVra6V7y6kMv+eux4E=;
 b=W1P/oWnOnX+FUe7+GYfuw4DdE/ti6Ef49Zcp+iDScM5YgvyhFX7FLztS0bLS2Iv5tf9PZqII2HJrA5lvFo34bvrJCA2IC+gJIS5ZdDY/ECmv0HX8bOj57Nps2ltTCusGC1dcFaUN16Y5p0xH33ykZISLBTSnSJ6Ov+3SI2csWA2Bci3V8CQr58irruAOaLJslWUFtngXKeOZanDlOWgS53zZm+qqsLOOaiLqDutRxUrudgySuOj1SK0X3UjWzNJ8MGuQ2VZk2ygEq8TrK+vbbvfrcFJwWgVd7VGW95Mb0kihReu2P1yYqMuhW5npIHF+q0tyvRiA02n+tj2WOmT+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4654.eurprd08.prod.outlook.com (10.255.27.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Mon, 12 Aug 2019 10:52:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 10:52:59 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: drm/komeda: Adds internal bpp computing for arm afbc only format
 YU08 YU10
Thread-Topic: drm/komeda: Adds internal bpp computing for arm afbc only format
 YU08 YU10
Thread-Index: AQHVUPwa45rlrHJFJkaIagZP40lFIw==
Date: Mon, 12 Aug 2019 10:52:59 +0000
Message-ID: <20190812105252.GA7054@jamwan02-TSP300>
References: <1565073104-24047-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1565073104-24047-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0047.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d896d00-d24a-4862-6290-08d71f13456a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4654; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4654:|DB6PR0801MB1846:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB18460E16E4ED0DA47035819AB3D30@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
x-forefront-prvs: 012792EC17
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(486006)(229853002)(476003)(66476007)(66556008)(256004)(14444005)(66066001)(6636002)(6436002)(5660300002)(14454004)(6486002)(8936002)(33716001)(54906003)(446003)(58126008)(11346002)(66446008)(64756008)(478600001)(316002)(71190400001)(71200400001)(2906002)(3846002)(66946007)(53936002)(52116002)(99286004)(6246003)(4326008)(1076003)(76176011)(6512007)(386003)(86362001)(6506007)(33656002)(81166006)(81156014)(9686003)(8676002)(102836004)(7736002)(55236004)(25786009)(26005)(305945005)(186003)(6862004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4654;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: +DwiPc0XGDGauofxLA56FrZPidilVnMD5elsrR5NXn0dHyol5olc4p12sb8KnmZKWFuIqssGSbYdMkptqK6uAxKIFAvG7VB3cBvur0vJgjEjaQ9TLM7DU8LfJnEvUBSziUuwVKG17NRhTqoc9K0aCVeM2fRh/zFYQSJI0VJisTbVU1j3k8YOKavoTncAhID5GM/nIRQG5fBQvjjZ48wbKhAPqfrJ4r+qfC6TjVPkWn24sWnH0GThRVFQUoq6+I4HXwqwhIJUB6Qgtx1qFjZP8CGZX7MATpgtX9xWooox/rtqwwmDVV3SU4J2cO+rWgBdfEwt0VkYYrjMEWUxo1rU1Widrhja199E+RDXl1CnJFlYkb6X1jmeBxOv5t8c7pv8z9/WMO32rKXCAGOTh/u1t5OE6rpZjzE8ZZvxcCWn9Yk=
Content-ID: <BA0F9DE1EB2CAD46AA108282155017E3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4654
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(136003)(346002)(376002)(2980300002)(199004)(189003)(6116002)(8676002)(23726003)(14444005)(81166006)(81156014)(54906003)(478600001)(5660300002)(356004)(26826003)(3846002)(22756006)(6862004)(4326008)(25786009)(6246003)(46406003)(97756001)(305945005)(58126008)(7736002)(99286004)(14454004)(316002)(386003)(6506007)(50466002)(76176011)(70206006)(6512007)(9686003)(70586007)(336012)(86362001)(102836004)(8936002)(186003)(6636002)(476003)(6486002)(229853002)(2906002)(1076003)(33656002)(76130400001)(63350400001)(446003)(63370400001)(8746002)(47776003)(11346002)(66066001)(33716001)(126002)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1846;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a517b537-9f4e-4576-ee5c-08d71f133d5f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1846; 
NoDisclaimer: True
X-Forefront-PRVS: 012792EC17
X-Microsoft-Antispam-Message-Info: IZNKZceZMY2+qVpe75zuLYx06r0kwcH2rHKhiejbY0BewXiCTs6YJkFw8EaVhcbPfLi2ufxYfaxBwvvM69GJMgWd4KDSOV3xT2GBsAXOS91SvOp3/eDYJC00d9q+Em1iT0C0p2LMTRm2T0Ti7f4uopm+904EQqIqANFR4l8ctRAyR/24LqEIfr45Afrm/vd7EPcP3+OuAWWpTvVr6J73fZd1ThfVJ8HzwyZg0ifHz/0OLJLwWs85aiEcifW7ORpoGacH4g/KfV4H4h3nYv+uD1q/sfrja4w43vfnwoLVUuXE/3UkU1DONSMcMlDUiXv/jY+9Qy31iSFmlVq3HjtvOdFd3LzcDC56pDWT8HVXm7dF1WNcSdkCXNbpMo1OhSx/yNtiiGIXZkcHXwrtkBOqZy6tiWRuEyNU9BZTS6u+DE4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2019 10:53:12.5093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d896d00-d24a-4862-6290-08d71f13456a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci5HU8tWWizDNnGoi7DKH7OhOZVra6V7y6kMv+eux4E=;
 b=U3BtJhzuA9c6Fht3bVtYcYtx43nBD79llP7eBQzDz2pbKOFHmR2cMaQ+0Ovx2s5OVq+lridRLiI3TXhtOt4axOqYZv6aeTNqpF7k87xYFqR6grWKnu13TY9u+1UA1oEJ6FWIUE9l1VGTF0V3G3Dp5AU7mdxPHCz7S4831FgSseE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci5HU8tWWizDNnGoi7DKH7OhOZVra6V7y6kMv+eux4E=;
 b=U3BtJhzuA9c6Fht3bVtYcYtx43nBD79llP7eBQzDz2pbKOFHmR2cMaQ+0Ovx2s5OVq+lridRLiI3TXhtOt4axOqYZv6aeTNqpF7k87xYFqR6grWKnu13TY9u+1UA1oEJ6FWIUE9l1VGTF0V3G3Dp5AU7mdxPHCz7S4831FgSseE=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDY6MzE6NTZBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gVGhlIGRybV9mb3JtYXRfaW5mbyBkb2Vz
bid0IGhhdmUgYW55IGNwcCBvciBibG9ja19zaXplIChib3RoIGFyZSB6ZXJvKQo+IGluZm9ybWF0
aW9uIGZvciBhcm0gb25seSBhZmJjIGZvcm1hdCBZVTA4L1lVMTAuIHdlIG5lZWQgdG8gY29tcHV0
ZSBpdAo+IGJ5IG91cnNlbHZlcy4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IDEuIFJlbW92ZWQg
cmVkdW5kYW50IHdhcm5pbmcgY2hlY2sgaW4ga29tZWRhX2dldF9hZmJjX2Zvcm1hdF9icHAoKTsK
PiAyLiBSZW1vdmVkIGEgcmVkdW5kYW50IGVtcHR5IGxpbmU7Cj4gMy4gUmViYXNlZCB0aGUgYnJh
bmNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkg
PGxvd3J5LmxpQGFybS5jb20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZm9ybWF0X2NhcHMuYyAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICAuLi4v
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggICB8ICAzICsr
Kwo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMg
ICB8ICA1ICsrKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMKPiBpbmRleCBjZDRkOWY1Li5jOWExZWRiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1h
dF9jYXBzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mb3JtYXRfY2Fwcy5jCj4gQEAgLTM1LDYgKzM1LDI1IEBACj4gIAlyZXR1cm4gTlVMTDsKPiAg
fQo+ICAKPiArdTMyIGtvbWVkYV9nZXRfYWZiY19mb3JtYXRfYnBwKGNvbnN0IHN0cnVjdCBkcm1f
Zm9ybWF0X2luZm8gKmluZm8sIHU2NCBtb2RpZmllcikKPiArewo+ICsJdTMyIGJwcDsKPiArCj4g
Kwlzd2l0Y2ggKGluZm8tPmZvcm1hdCkgewo+ICsJY2FzZSBEUk1fRk9STUFUX1lVVjQyMF84QklU
Ogo+ICsJCWJwcCA9IDEyOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBEUk1fRk9STUFUX1lVVjQyMF8x
MEJJVDoKPiArCQlicHAgPSAxNTsKPiArCQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJYnBwID0g
aW5mby0+Y3BwWzBdICogODsKPiArCQlicmVhazsKPiArCX0KPiArCj4gKwlyZXR1cm4gYnBwOwo+
ICt9Cj4gKwo+ICAvKiBUd28gYXNzdW1wdGlvbnMKPiAgICogMS4gUkdCIGFsd2F5cyBoYXMgWVRS
Cj4gICAqIDIuIFRpbGVkIFJHQiBhbHdheXMgaGFzIFNDCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gaW5kZXgg
MzYzMTkxMC4uMzIyNzNjZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaAo+IEBAIC05Nyw2ICs5Nyw5IEBA
IHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqa29tZWRhX2dldF9mb3JtYXRfbmFtZSh1MzIgZm91
cmNjLCB1NjQgbW9kaWZpZXIpCj4gIGtvbWVkYV9nZXRfZm9ybWF0X2NhcHMoc3RydWN0IGtvbWVk
YV9mb3JtYXRfY2Fwc190YWJsZSAqdGFibGUsCj4gIAkJICAgICAgIHUzMiBmb3VyY2MsIHU2NCBt
b2RpZmllcik7Cj4gIAo+ICt1MzIga29tZWRhX2dldF9hZmJjX2Zvcm1hdF9icHAoY29uc3Qgc3Ry
dWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbywKPiArCQkJICAgICAgIHU2NCBtb2RpZmllcik7Cj4g
Kwo+ICB1MzIgKmtvbWVkYV9nZXRfbGF5ZXJfZm91cmNjX2xpc3Qoc3RydWN0IGtvbWVkYV9mb3Jt
YXRfY2Fwc190YWJsZSAqdGFibGUsCj4gIAkJCQkgIHUzMiBsYXllcl90eXBlLCB1MzIgKm5fZm10
cyk7Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZnJhbWVidWZmZXIuYwo+IGluZGV4IDNiMGE3MGUuLjFiMDFhNjIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZm
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zy
YW1lYnVmZmVyLmMKPiBAQCAtNDMsNyArNDMsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9mYl9jcmVh
dGVfaGFuZGxlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAo+ICAJc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIgPSAma2ZiLT5iYXNlOwo+ICAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqaW5mbyA9IGZiLT5mb3JtYXQ7Cj4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPiAt
CXUzMiBhbGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlciwg
bl9ibG9ja3M7Cj4gKwl1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGlnbm1lbnRfaCA9IDAsIGFsaWdu
bWVudF9oZWFkZXIsIG5fYmxvY2tzLCBicHA7Cj4gIAl1NjQgbWluX3NpemU7Cj4gIAo+ICAJb2Jq
ID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIG1vZGVfY21kLT5oYW5kbGVzWzBdKTsKPiBA
QCAtODgsOCArODgsOSBAQCBzdGF0aWMgaW50IGtvbWVkYV9mYl9jcmVhdGVfaGFuZGxlKHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiLAo+ICAJa2ZiLT5vZmZzZXRfcGF5bG9hZCA9IEFMSUdOKG5f
YmxvY2tzICogQUZCQ19IRUFERVJfU0laRSwKPiAgCQkJCSAgICBhbGlnbm1lbnRfaGVhZGVyKTsK
PiAgCj4gKwlicHAgPSBrb21lZGFfZ2V0X2FmYmNfZm9ybWF0X2JwcChpbmZvLCBmYi0+bW9kaWZp
ZXIpOwo+ICAJa2ZiLT5hZmJjX3NpemUgPSBrZmItPm9mZnNldF9wYXlsb2FkICsgbl9ibG9ja3Mg
Kgo+IC0JCQkgQUxJR04oaW5mby0+Y3BwWzBdICogQUZCQ19TVVBFUkJMS19QSVhFTFMsCj4gKwkJ
CSBBTElHTihicHAgKiBBRkJDX1NVUEVSQkxLX1BJWEVMUyAvIDgsCj4gIAkJCSAgICAgICBBRkJD
X1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gIAltaW5fc2l6ZSA9IGtmYi0+YWZiY19zaXplICsgZmIt
Pm9mZnNldHNbMF07Cj4gIAlpZiAobWluX3NpemUgPiBvYmotPnNpemUpIHsKCkxvb2tzIGdvb2Qg
dG8gbWUuCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
