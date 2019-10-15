Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68716D70B2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EF86E61D;
	Tue, 15 Oct 2019 08:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40075.outbound.protection.outlook.com [40.107.4.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F3E6E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:04:46 +0000 (UTC)
Received: from VI1PR08CA0201.eurprd08.prod.outlook.com (2603:10a6:800:d2::31)
 by DB6PR0801MB1976.eurprd08.prod.outlook.com (2603:10a6:4:74::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.22; Tue, 15 Oct
 2019 08:04:42 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR08CA0201.outlook.office365.com
 (2603:10a6:800:d2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Tue, 15 Oct 2019 08:04:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 08:04:41 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Tue, 15 Oct 2019 08:04:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8715c1b15fbbe74b
X-CR-MTA-TID: 64aa7808
Received: from 093b645d2a86.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27E7B7F6-927A-415C-91BC-38D4112EB4AA.1; 
 Tue, 15 Oct 2019 08:04:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 093b645d2a86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 08:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hy2WWKKozQUAgFsiE+Q3dah/gcrUIKDvTcMnCouIjqhhHVbK806LxxOHPP/skTMdvNZM2nqqgN5z/p29jOiXNxqPJdDP5N3awwbELKcxl3lpW66Xk8zcgZN/EfJI7oZZQoGtKl0idRmMor11FBep2KtwPUDTEaASpOK5gb82/tvzB/UUpUOOD0TrXLaM8SWohBBcbShaiBjSubA0xWJlED3bmegEssZGdtQlhUJzjFnvFATxDXkpANFqaGrJrKHRnBCfQHLmtCd2zr7ViOvltl7Gf2zlsPHBqX22Lb/N02sdWwH80rvIYT949eQ/sKKIEgG5AEEYcKFSLDfjxassXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WhRMRQrwjD7YAw0JiHnUI2hP/O9QSykPVkZopOmPdM=;
 b=WfE4ak6qnz6c2KuRIMn1sK+vtXPaxDk17es2+IAHYk3hhVYqZh7YvT299PpNFDd9jlpfdvdO91a0iOTfuP8Z5R9EfMPvOne64sHQ7dhUYZs1Ia89dEEu1BdJ/SzwnszpdliL/tPBMkrafg56lUKctLfWeVerZaJFSiu9WZ2RvYYX2a9cVT8WqkqUepFMEABmEfzadnT/8Tn3O2jdH30ox1LoI9YMukH/u5uW0odZiLB2aT4+qEhucC3SUXzbZ5peD+a1YGf2Fqct6S4N4l29wgDwFVinEpxwlTDvGpRNp3CY0TO1uJ7qmYdOleSPqi/uOYozTUf5JtGJa0pvV4mEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4960.eurprd08.prod.outlook.com (10.255.158.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 08:04:26 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 08:04:26 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/bDNAzoDxuLVU+by7UkFix6lKdaUJkAgACbswCAACqhAIAAR3EA
Date: Tue, 15 Oct 2019 08:04:26 +0000
Message-ID: <20191015080420.GA22242@jamwan02-TSP300>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
 <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
 <20191015011604.GA26941@jamwan02-TSP300>
 <CAKb7Uvh7y20oikYR+UpabgXLHJM2i+2DPVyYSwE37d=NpheUGg@mail.gmail.com>
In-Reply-To: <CAKb7Uvh7y20oikYR+UpabgXLHJM2i+2DPVyYSwE37d=NpheUGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 93568cbb-c096-4d4f-52f7-08d7514654fb
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4960:|VE1PR08MB4960:|DB6PR0801MB1976:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB197667A723F9BFE56BB8357AB3930@DB6PR0801MB1976.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(39860400002)(376002)(366004)(346002)(189003)(199004)(6916009)(33656002)(256004)(6246003)(229853002)(6306002)(966005)(6436002)(66066001)(7736002)(305945005)(6512007)(9686003)(14454004)(58126008)(33716001)(54906003)(478600001)(316002)(6486002)(1076003)(26005)(2171002)(5660300002)(102836004)(66476007)(66946007)(6116002)(3846002)(66556008)(64756008)(66446008)(71200400001)(71190400001)(76176011)(386003)(6506007)(52116002)(99286004)(86362001)(11346002)(476003)(186003)(446003)(55236004)(53546011)(8936002)(25786009)(486006)(2906002)(4326008)(81166006)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4960;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UYE7Rr7reanK9RYS5WB2D1YsoF0UFePCCM4vBoWL4FKfPKI9SKSwuZEOskW16drf0zXaLgleTGxN2ETKXLmvlkWRreVUx9x8EkEL7AenJaRzT5RRcVDGBiUxOAEdpUkh/rXn1ARtKA0IiJMCqi27dm+OPDeETCD4vmj1Nzn8Z0+YvKSkjY5CkSdZX6GOrIhh2q7HTrYNFpeWBqpzyP+dhpJAY3Oq/QaAVMyymH3WUZbspGMp8SB1K9nLBJLW+/haRnGQDJGRgjVwYqP7/3ZVtX6c0XM3cFdxV/++GIUZqDMtEZVbQt3G6Wj7buoRd2VedVoaR+tDycRI4XvCw0x/JBaE3/iRS+1QEBQ8xkcXqkNFZ+D5+llSvUIajP4qRwAnIAPdfzoiYa+tSuETtqO9m3CxR5ZkQRKIUqHW6gLSsRlVyqMos0sGqb4pW6vAxxFB0dWqKDKG7+eYD90PKvdx8g==
Content-ID: <12E7DBFF2DC9DE4CA94DC451C6EEB50D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4960
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(9686003)(6512007)(1076003)(47776003)(76130400001)(86362001)(50466002)(5660300002)(4326008)(70206006)(66066001)(2171002)(6486002)(316002)(6306002)(6246003)(6862004)(229853002)(70586007)(58126008)(46406003)(54906003)(22756006)(23726003)(8676002)(26826003)(966005)(2906002)(446003)(6116002)(478600001)(3846002)(126002)(476003)(486006)(14454004)(336012)(33716001)(76176011)(356004)(6506007)(53546011)(11346002)(186003)(386003)(25786009)(102836004)(63350400001)(26005)(305945005)(97756001)(8936002)(8746002)(81156014)(81166006)(33656002)(99286004)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1976;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aad850d9-869b-4726-e57b-08d751464c13
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVcPGWjtXES9Vh+QG2Tr00++pL8OQYC5H8tkrWFv+eYWhl7+tGnClT2xLJKdLgE/g32uG/GBtIauz/L+Ym81LGP5rg1a72wouJR8AfWMOvwicRugl4+t71gEsnf4e5a3Ehu+cUj7cVbo9FMZ6ix8b78Tpr51cNpW342khllSinvsxjPiJ7ULw7VLwfsb2OH2z2jID8/U5R4i8YISEypOw6+dDOo4byHtHdLVuNcbUiFCPpE1K0hACQAosepGtgrQGGVlZqddXccHGtQV1xJXYMYogqez5A8pyS5gcPOTLlqs/R8m/eoiAh5p+KFaalb3RlcOp5mMO/HuNXgYIf9KSTfk62C+Bfg4RY1yqOOdYLFVLUiiDL1ssNiRfi4uSDMGsorU87jNkZLUUjsf2+2IBwJNb+ND4X94lz6h1/hpbLOzqJkyS25Etb2deC9amYbR487ySvzcyGy1ExnO2bLz+w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 08:04:41.1041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93568cbb-c096-4d4f-52f7-08d7514654fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1976
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WhRMRQrwjD7YAw0JiHnUI2hP/O9QSykPVkZopOmPdM=;
 b=DK/V7t4EJt+5t7gm7pogMYRALoqyISDpMLctXCcP2YuWHKz/GH74kJxzXunt/uGjn7WB6V9Pzx64Yb5w1kqXXrf7jN4d1TIOnwDTcINw8sXymeTpHcML8ZTicWyckSeGHl4c1sz2lb38FBZPLybnJEuNKfjoAOPXMIRygGJ3hjI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WhRMRQrwjD7YAw0JiHnUI2hP/O9QSykPVkZopOmPdM=;
 b=DK/V7t4EJt+5t7gm7pogMYRALoqyISDpMLctXCcP2YuWHKz/GH74kJxzXunt/uGjn7WB6V9Pzx64Yb5w1kqXXrf7jN4d1TIOnwDTcINw8sXymeTpHcML8ZTicWyckSeGHl4c1sz2lb38FBZPLybnJEuNKfjoAOPXMIRygGJ3hjI=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTE6NDg6MzhQTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgOToxNiBQTSBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKQo+IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4gd3JvdGU6Cj4g
PiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAxMTo1ODo0OEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3
cm90ZToKPiA+ID4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTo0MyBBTSBqYW1lcyBxaWFuIHdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKQo+ID4gPiA8amFtZXMucWlhbi53YW5nQGFybS5jb20+
IHdyb3RlOgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIg
c2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3MgY29tcGxlbWVudC4KPiA+ID4gPiArICovCj4gPiA+
ID4gK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9p
bnB1dCwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IG0sIHVpbnQzMl90IG4pCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIHU2NCBtYWcgPSAo
dXNlcl9pbnB1dCAmIH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7Cj4gPiA+ID4gKyAgICAgICBi
b29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsKPiA+ID4gPiArICAg
ICAgIHM2NCB2YWw7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgLyogdGhlIHJhbmdlIG9mIHNp
Z25lZCAycyBjb21wbGVtZW50IGlzIFstMl5uK20sIDJebittIC0gMV0gKi8KPiA+ID4KPiA+ID4g
VGhpcyBpbXBsaWVzIHRoYXQgbiA9IDMyLCBtID0gMCB3b3VsZCBhY3R1YWxseSB5aWVsZCBhIDMz
LWJpdCAyJ3MKPiA+ID4gY29tcGxlbWVudCBudW1iZXIuIElzIHRoYXQgd2hhdCB5b3UgbWVhbnQ/
Cj4gPgo+ID4gWWVzLCBzaW5jZSBtIGRvZXNuJ3QgaW5jbHVkZSBzaWduLWJpdCBTbyBhIFEwLjMy
IGlzIGEgMzNiaXQgdmFsdWUuCj4gCj4gVGhpcyBnb2VzIGNvdW50ZXIgdG8gd2hhdCB0aGUgd2lr
aXBlZGlhIHBhZ2Ugc2F5cyBbCj4gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUV8obnVt
YmVyX2Zvcm1hdCkgXToKPiAKPiAocmVmb3JtYXR0ZWQgc2xpZ2h0bHkgZm9yIHRleHQtb25seSBj
b25zdW1wdGlvbik6Cj4gCj4gIiIiCj4gRm9yIGV4YW1wbGUsIGEgUTE1LjEgZm9ybWF0IG51bWJl
cjoKPiAKPiAtIHJlcXVpcmVzIDE1KzEgPSAxNiBiaXRzCj4gLSBpdHMgcmFuZ2UgaXMgWy0yXjE0
LCAyXjE0IC0gMl4tMV0gPSBbLTE2Mzg0LjAsICsxNjM4My41XSA9IFsweDgwMDAsCj4gMHg4MDAx
IC4uLiAweEZGRkYsIDB4MDAwMCwgMHgwMDAxIC4uLiAweDdGRkUsIDB4N0ZGRl0KPiAtIGl0cyBy
ZXNvbHV0aW9uIGlzIDJeLTEgPSAwLjUKPiAiIiIKPiAKPiBUaGlzIHN1Z2dlc3RzIHRoYXQgdGhl
IHByb3BlciB3YXkgdG8gcmVwcmVzZW50IGEgc3RhbmRhcmQgMzItYml0IDIncwo+IGNvbXBsZW1l
bnQgaW50ZWdlciB3b3VsZCBiZSBRMzIuMC4KPgoKWWVzIHlvdSdyZSByaWdodCwgSSB3aWxsIHNl
bmQgYSBuZXcgdmVyc2lvbiB0byBjb3JyZWN0IHRoaXMgY29kZQphY2NvcmRpbmcgdG8gdGhlIFdp
a2kuCgpUaGFua3MKSmFtZXMKCj4gICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
