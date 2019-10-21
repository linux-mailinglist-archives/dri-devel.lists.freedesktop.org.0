Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BCDEE26
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 15:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C116E0E7;
	Mon, 21 Oct 2019 13:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D62A6E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 13:42:36 +0000 (UTC)
Received: from AM6PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:20b:b2::29)
 by AM0PR08MB4065.eurprd08.prod.outlook.com (2603:10a6:208:12d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 21 Oct
 2019 13:42:33 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by AM6PR08CA0017.outlook.office365.com
 (2603:10a6:20b:b2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 13:42:33 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 13:42:32 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Mon, 21 Oct 2019 13:42:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48fcaf8f549d9f92
X-CR-MTA-TID: 64aa7808
Received: from 84494209b4f2.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF677C97-3AAC-4E25-84CC-E450A83748F7.1; 
 Mon, 21 Oct 2019 13:42:24 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84494209b4f2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 13:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgbG+yHKBsmtEh1xGT6MITKBK8k6I921PIVatfZ0JDKgvoYVN3oBL9oNtwG8MVMdWgAssdHpZJfYoOty9G7eG1Jzk07++y5P1GcaXWnCmVmxu0OOT8a/k4mZVzrMq+unCCKpIwmWHELB4MM4zJGiTzDMudld/OHMBH9vcAMgo31W1iJ4vFVkMPOdGxJPh5NewaDFcBtxFlgskLRWLWwqijR/NJILqezlkcSaCDwh+Zdw4vm1eKN4guAVNVb6UdkjNuUyi0tLeqnlvxCwXAu9tKHu81HnocK0TSEVS/Tzd3ZAV9MKlo1bQS/ImKke8AU+TvL+3EdHTe0gjQISD1+30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFjVYJUAgwy0Lb91imj1bSlCNu46WVVt7WPYXMRLAb8=;
 b=Dut6h8zKBjZ3h/R65NXjTUIKMwcr2ygdwVSe+0rg/vxDhfkroXE8notKDDhrtO0DT0FMK2s/LWGZmFEl2zilFFApuzZThPIxJaV9LVCie3gSn31XgnM/cNlvFwN9zHGpoRbb8B6qX++2PNkPXI7X4/Wib4Q1f25i26RqTBjGA0Nl5J+VHsk+TkbzMqrIGM9wHfug/GgWTMprLs0nbkXMpFhhZUjWx61lVtqkeAhN07MA2ZHI26hJ4wEy2YSnkU/lqJBYIuIir+Zzh7tQOcadBwyjSb5HVebJ/zwIUmLZYAHztASITGC1zsLXKUgf7zeJ3O/WHnVRJv1YvsFz73Amwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3200.eurprd08.prod.outlook.com (52.133.15.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 13:42:22 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 13:42:22 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: drm/komeda: Dump SC_ENH_* registers from scaler block
Thread-Topic: drm/komeda: Dump SC_ENH_* registers from scaler block
Thread-Index: AQHVg/o0KxTrmwItXUCRsuGzgIiHJadlIsWA
Date: Mon, 21 Oct 2019 13:42:22 +0000
Message-ID: <2007868.TRdzCC70Pn@e123338-lin>
References: <20191015105936.50039-1-mihail.atanassov@arm.com>
 <20191016081732.GA16502@jamwan02-TSP300>
In-Reply-To: <20191016081732.GA16502@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::13) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 534e90e2-08ce-4bb8-2d84-08d7562c862e
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3200:|VI1PR08MB3200:|AM0PR08MB4065:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB40655437E680956A01B1A9088F690@AM0PR08MB4065.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:243;OLM:243;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(199004)(189003)(14454004)(66066001)(6116002)(76176011)(8936002)(81156014)(8676002)(6636002)(2906002)(3846002)(6862004)(486006)(33716001)(476003)(81166006)(86362001)(478600001)(11346002)(446003)(66476007)(66556008)(64756008)(66446008)(66946007)(52116002)(25786009)(26005)(9686003)(229853002)(99286004)(186003)(316002)(5660300002)(6246003)(7736002)(386003)(102836004)(6512007)(6486002)(256004)(54906003)(14444005)(6436002)(71200400001)(71190400001)(4326008)(6506007)(305945005)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3200;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5+w2O/zDI2RSHHHN/WGi/ALkSZ39O7aCqO0VF88za1RIgAjyoWGwwqVwTh/8VkHRXmp6wFs5vr8jQmYZzA4PBThal4mrdtBzJY1xsAXH93azQebrQyVoM85JclJ5aL9zO8bSnPO7flcNToPvY6BlnPjOS7Mq9RkMPe3RxLeAzUOB1yDmI4B2vLf0uY5m9r9k7wtDjJ8Hqb/Si0lCFQ3ttIwnb9YxO7rFqf75Yv0+4e9CxdtY/xSY55sIDN0TArepXrhfOcpXUP5uEN1oqZ2Czl02TmEqV8+vbdYTcvrXMgvqzAaDvXHGOX4v68uJHb+aP/FztNV3UeFt0NLSQ6suOovUIc6/MiQf4Lb2UfinFlQFAQSN/9hbKu064sNxMpw+NHL6OFfXXyKSJx98I9TsdWyJCV8eMo+3NgJRTkbna5Hom9uYYaOeslQlpGnq2svo
Content-ID: <009174014AA0154EA8732811A9E1E04D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3200
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(76130400001)(186003)(63350400001)(70586007)(5660300002)(99286004)(70206006)(26005)(305945005)(50466002)(6862004)(478600001)(486006)(14444005)(446003)(46406003)(476003)(33716001)(126002)(76176011)(26826003)(11346002)(66066001)(6506007)(6486002)(316002)(386003)(7736002)(6512007)(9686003)(47776003)(54906003)(8936002)(25786009)(81166006)(6116002)(23726003)(8676002)(86362001)(356004)(6636002)(102836004)(97756001)(81156014)(3846002)(229853002)(8746002)(336012)(6246003)(4326008)(22756006)(2906002)(107886003)(14454004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4065;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f36e0597-17eb-4df1-7221-08d7562c8018
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HXDHlTLykxQi8kMfXQiF+69SmpSeGEDptvaViDzKetEuJOd41oN/M2C1bIxRPvzml8qbgdKIQU+AAt1hKw1IMFOJrCFlSyr5bDC89b/cFw3BtBF/lF1cYDQyQNUGWznUpGmgOiv8OygEtYSliwXJlOJ5/18TJhFOZCMTykSu0x0GzKv2H1DEMPib8CM7vH/1Hr0WrbXYxI60uBmQPjU7Bam3Kw6ta1BE83RuPSobeQaz+5ZHZ4sZzosp1/Bqj4rx0lh/8xZwijd2UZ0dyuIZBZwkXLVzJN/EyhSHlbSE9TAVgkqF5msee+d/qPX0Nuaf7R+fNMQfaXIVroy1iSc2I4Sc+hTIeU5ZKjno9UdgNA6scNrYxyFvA3Pa1fd3XgScH+esx/LLyCqBXJmV5K6dREZkk1kjn3q//Sq80UyJ6Y=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 13:42:32.5397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 534e90e2-08ce-4bb8-2d84-08d7562c862e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4065
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFjVYJUAgwy0Lb91imj1bSlCNu46WVVt7WPYXMRLAb8=;
 b=rpYInWLQziejGuRjznXl23zuWz4zCYC4uvnu1eoPpx3zFg0lYgedXN8vLiA0pOIrIcQW49kAUBTgeEqbtdfY9k9Sc1o0Vj1y+0O/Fa5edPHj6qoxoPIVtkP4CnX1UpJMGAuT/vXOfvV6BjWirAZs+n/nWGJJWT4kYXcLak2vMfU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFjVYJUAgwy0Lb91imj1bSlCNu46WVVt7WPYXMRLAb8=;
 b=rpYInWLQziejGuRjznXl23zuWz4zCYC4uvnu1eoPpx3zFg0lYgedXN8vLiA0pOIrIcQW49kAUBTgeEqbtdfY9k9Sc1o0Vj1y+0O/Fa5edPHj6qoxoPIVtkP4CnX1UpJMGAuT/vXOfvV6BjWirAZs+n/nWGJJWT4kYXcLak2vMfU=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCAxNiBPY3RvYmVyIDIwMTkgMDk6MTc6MzkgQlNUIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0
IDExOjAwOjAxQU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPiAtLS0K
PiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyB8
IDE0ICsrKysrKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ID4gaW5kZXggYzNkMjljMGIwNTFi
Li43MjUyZmMzODdmYmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ID4gQEAgLTcwMyw3ICs3MDMs
NyBAQCBzdGF0aWMgdm9pZCBkNzFfc2NhbGVyX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVu
dCAqYywKPiA+ICAKPiA+ICBzdGF0aWMgdm9pZCBkNzFfc2NhbGVyX2R1bXAoc3RydWN0IGtvbWVk
YV9jb21wb25lbnQgKmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4gPiAgewo+ID4gLQl1MzIgdls5
XTsKPiA+ICsJdTMyIHZbMTBdOwo+ID4gIAo+ID4gIAlkdW1wX2Jsb2NrX2hlYWRlcihzZiwgYy0+
cmVnKTsKPiA+ICAKPiA+IEBAIC03MjMsNiArNzIzLDE4IEBAIHN0YXRpYyB2b2lkIGQ3MV9zY2Fs
ZXJfZHVtcChzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikK
PiA+ICAJc2VxX3ByaW50ZihzZiwgIlNDX0hfREVMVEFfUEg6XHRcdDB4JVhcbiIsIHZbNl0pOwo+
ID4gIAlzZXFfcHJpbnRmKHNmLCAiU0NfVl9JTklUX1BIOlx0XHQweCVYXG4iLCB2WzddKTsKPiA+
ICAJc2VxX3ByaW50ZihzZiwgIlNDX1ZfREVMVEFfUEg6XHRcdDB4JVhcbiIsIHZbOF0pOwo+ID4g
Kwo+ID4gKwlnZXRfdmFsdWVzX2Zyb21fcmVnKGMtPnJlZywgMHgxMzAsIDEwLCB2KTsKPiA+ICsJ
c2VxX3ByaW50ZihzZiwgIlNDX0VOSF9MSU1JVFM6XHRcdDB4JVhcbiIsIHZbMF0pOwo+ID4gKwlz
ZXFfcHJpbnRmKHNmLCAiU0NfRU5IX0NPRUZGMDpcdFx0MHglWFxuIiwgdlsxXSk7Cj4gPiArCXNl
cV9wcmludGYoc2YsICJTQ19FTkhfQ09FRkYxOlx0XHQweCVYXG4iLCB2WzJdKTsKPiA+ICsJc2Vx
X3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjI6XHRcdDB4JVhcbiIsIHZbM10pOwo+ID4gKwlzZXFf
cHJpbnRmKHNmLCAiU0NfRU5IX0NPRUZGMzpcdFx0MHglWFxuIiwgdls0XSk7Cj4gPiArCXNlcV9w
cmludGYoc2YsICJTQ19FTkhfQ09FRkY0Olx0XHQweCVYXG4iLCB2WzVdKTsKPiA+ICsJc2VxX3By
aW50ZihzZiwgIlNDX0VOSF9DT0VGRjU6XHRcdDB4JVhcbiIsIHZbNl0pOwo+ID4gKwlzZXFfcHJp
bnRmKHNmLCAiU0NfRU5IX0NPRUZGNjpcdFx0MHglWFxuIiwgdls3XSk7Cj4gPiArCXNlcV9wcmlu
dGYoc2YsICJTQ19FTkhfQ09FRkY3Olx0XHQweCVYXG4iLCB2WzhdKTsKPiA+ICsJc2VxX3ByaW50
ZihzZiwgIlNDX0VOSF9DT0VGRjg6XHRcdDB4JVhcbiIsIHZbOV0pOwo+ID4gIH0KPiA+Cj4gCj4g
TG9va3MgZ29vZCB0byBtZS4KPiAKPiBSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKVGhhbmtzLCBhcHBs
aWVkIHRvIGRybS1taXNjLW5leHQgLSAKMmI2ZjU4ODNlZGNjNDdlZjYxNDY4MzIxMTJhMDEyNTgx
MGQyOGY3OC4KCj4gCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBrb21lZGFfY29tcG9uZW50X2Z1
bmNzIGQ3MV9zY2FsZXJfZnVuY3MgPSB7Cj4gCgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
