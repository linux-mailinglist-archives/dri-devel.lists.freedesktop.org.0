Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A518E81462
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFC289D5E;
	Mon,  5 Aug 2019 08:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20051.outbound.protection.outlook.com [40.107.2.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8B389D5E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:40:52 +0000 (UTC)
Received: from VI1PR08CA0264.eurprd08.prod.outlook.com (2603:10a6:803:dc::37)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Mon, 5 Aug
 2019 08:40:48 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0264.outlook.office365.com
 (2603:10a6:803:dc::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Mon, 5 Aug 2019 08:40:47 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 5 Aug 2019 08:40:46 +0000
Received: ("Tessian outbound 1e6e633a5b56:v26");
 Mon, 05 Aug 2019 08:40:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc347d17b374c023
X-CR-MTA-TID: 64aa7808
Received: from a605b71e38b9.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34622C4C-1D02-4B57-B3AC-5B41A1CBE432.1; 
 Mon, 05 Aug 2019 08:40:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a605b71e38b9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Aug 2019 08:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3SzBNkSG3U+Lry+kt7xKxCZijwBKE7atmbz/dHDkp/pb8N2kay/sYzxnA5WZS6h5MRhbHdBP/u58BrFEG7FuOx1NpaJHzfhWOEqfnXMpq1PS1of2kUAM/jMsuHlLzVyaMOvxCsjAT2RGqvG8goXN41XC5b8AM1X5uAWw+TKnxJmuszFBD86hSUpT7tfyde8y9ynZCrkCteVk11H2SVwQwlWHB48BFV/FvBN/JY061742Tb8auL+5RRHKiX4eI55KKKvrJ+Rs8ZmIrailFFOun0sLVMbHGe3TsqFaOmizaueNTm89SPIFaF0au00dg/lP3O1keOP+UlxnTd5BYZyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vp6aG4sKqr/LQ8Xi/AfLJ5ouovrCgNMRFrKkMXJXGY=;
 b=VfY+Fc+9+zvOOuABBcMmewSAUlSH52EnT6MxC8o038Arty5ccMl4qa8b2Zt1EIQl4kAlzgVF6GAQhGm41/NRcss60RUYujH1Srg0Wc9rboIjpovCdbosxdFlNsTTQxbJiBrgsHyyRt+t8SCxxKDitnNkbNFKyzER/v/kuY1W/oYzM54PBcZOwphyme0K8K+jMtlvcUhrVL0uUcnB3X6orZbZSRXAsBo8heniBboSyaI0lNYH/4PbZYzPMSz2spzsCIVuboO9v0dGAeqluMUXLoAkfmFg/YQ9kDb9GvP7ZBGaE9Igwhdr2YdnbvZXF62CGCsMmk5KDXnaZVcLt4DVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4959.eurprd08.prod.outlook.com (10.255.158.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 08:40:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 08:40:39 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Topic: [PATCH] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Index: AQHVSUA0/7/jB3Z3jkicHuuMk5vdZKbsQGEA
Date: Mon, 5 Aug 2019 08:40:38 +0000
Message-ID: <20190805084032.GA25315@jamwan02-TSP300>
References: <20190802143951.4436-1-mihail.atanassov@arm.com>
In-Reply-To: <20190802143951.4436-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:2e::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8bde4bd3-7d36-4a86-71b4-08d719809c47
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4959; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4959:|AM6PR08MB4952:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4952AE1F33C8C010C2CC694EB3DA0@AM6PR08MB4952.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:901;OLM:901;
x-forefront-prvs: 01208B1E18
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(199004)(189003)(68736007)(6246003)(33656002)(14454004)(6862004)(54906003)(81166006)(81156014)(58126008)(4326008)(2906002)(8676002)(316002)(33716001)(478600001)(6116002)(3846002)(229853002)(66946007)(5024004)(8936002)(99286004)(66556008)(66476007)(305945005)(7736002)(486006)(446003)(11346002)(476003)(25786009)(256004)(64756008)(76176011)(6636002)(66446008)(71190400001)(71200400001)(55236004)(186003)(1076003)(5660300002)(102836004)(26005)(6486002)(66066001)(386003)(9686003)(6512007)(6506007)(86362001)(6436002)(52116002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4959;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: bF3Sco0sIFq6VB0KSKc/JvJ9BGjQ6OfRS18kyylF/41YkSEIw8el+Fv44BhpXLd95uxG7iGTOK1uprmxUYkhWiNxV0+zXGVf2BEk233vyVnzy3InJ+hdT0fQHqRQJS/6xuO1KF3BRbi183vm8SIEk84zQCpNIxgNnD2AjRXxOs7JJK6X2ixMEJ4ck8XF+HNtStvL3ErjfMJgf49OLOuaaW2gTk4QOAHZcA2UumHXPZwWQHFKew1g2KhQaTONQ3JGgQFsTCSOOuZqw5LczTVv3CLCzJxbabE66LEw17dSvf+wZhGpGgL1/IYxxiesilQq5zk2nOL6qMxn52n9FU/w2wSBROKIU/uQWXi1XBkfEn0a8VeXRSwbqe7m9kpJmXMjqdmmEGp63K/bm2gcVf2ZyST/nKw5WzL/6dcvGsovm8g=
Content-ID: <BAAD54D554A4C74BBE758086FE240BC2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4959
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(189003)(199004)(26826003)(54906003)(186003)(356004)(58126008)(76130400001)(70206006)(6636002)(3846002)(99286004)(70586007)(63350400001)(126002)(486006)(476003)(76176011)(336012)(36906005)(229853002)(47776003)(26005)(66066001)(6486002)(22756006)(316002)(11346002)(446003)(6512007)(63370400001)(9686003)(478600001)(1076003)(2906002)(50466002)(102836004)(6506007)(6246003)(97756001)(6862004)(46406003)(23726003)(33656002)(386003)(86362001)(7736002)(305945005)(4326008)(6116002)(8676002)(5024004)(8746002)(81166006)(25786009)(14454004)(5660300002)(8936002)(33716001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4952;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2a882cef-e683-4c40-db4d-08d7198097a8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR08MB4952; 
NoDisclaimer: True
X-Forefront-PRVS: 01208B1E18
X-Microsoft-Antispam-Message-Info: CLLRGgk9GXcZl0Es+NXVmlOLnHoa2iHqT6drunL+fgke+PSYW+UA/KoRjMCqcJU2zVnweRFcY7NY+Ci7D3b+1xFwJmGDu26l9gnUpSy3rBOhjWIOZ3fVo8GMjsOHtGP9N8pjZ3DqE8GHbKDbawE5ft7C/gl34I9++JAvmzilPhQDDcs6iW4rrYG4GggqULaLlhNFZf2eegsGwlOWuAvyddT4vLPP+WReV/NzeBFBmy222m/5lT8wQIRngMRYdqw0sC3vYmz+MwhIvjjhXTdmNZlZUnPGKw/2npdKAqp+nflONWfVkLQYhpFgljQ7J7WyMtsv1WN37ImlFGhpcUFusz6Z1D1my8rcijHokp4yRFmhnNnnyGgw8c2KeYvzvLJ/tcN3f9GGfPVR5j7IN7fmReRcNF32qimpmtsV3vDVGKU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 08:40:46.3880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bde4bd3-7d36-4a86-71b4-08d719809c47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vp6aG4sKqr/LQ8Xi/AfLJ5ouovrCgNMRFrKkMXJXGY=;
 b=nGIhuBBd/wkxKb9RVSpWx5oPB0hr5PmOk54VtGFrz4mHznVQWKTlC2cy9Y7os8xzXiWNRd/QmLNEb8hf40JlmbmgEH9KhZHsd6xvKvJrt0wp9YEp1RHYaZTlkrLykoJBJBHwxIk6pT4HNJBi22iwOjxD+J2v+ZeOR4DktPlMaxY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vp6aG4sKqr/LQ8Xi/AfLJ5ouovrCgNMRFrKkMXJXGY=;
 b=nGIhuBBd/wkxKb9RVSpWx5oPB0hr5PmOk54VtGFrz4mHznVQWKTlC2cy9Y7os8xzXiWNRd/QmLNEb8hf40JlmbmgEH9KhZHsd6xvKvJrt0wp9YEp1RHYaZTlkrLykoJBJBHwxIk6pT4HNJBi22iwOjxD+J2v+ZeOR4DktPlMaxY=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsOgoKT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTA6NDA6MTlQTSArMDgwMCwgTWlo
YWlsIEF0YW5hc3NvdiB3cm90ZToKPiBUaGUgJ21lbW9yeS1yZWdpb24nIHByb3BlcnR5IG9mIHRo
ZSBrb21lZGEgZGlzcGxheSBkcml2ZXIgRFQgYmluZGluZwo+IGFsbG93cyB0aGUgdXNlIG9mIGEg
J3Jlc2VydmVkLW1lbW9yeScgbm9kZSBmb3IgYnVmZmVyIGFsbG9jYXRpb25zLiBBZGQKPiB0aGUg
cmVxdWlzaXRlIG9mX3Jlc2VydmVkX21lbV9kZXZpY2Vfe2luaXQscmVsZWFzZX0gY2FsbHMgdG8g
YWN0dWFsbHkKPiBtYWtlIHVzZSBvZiB0aGUgbWVtb3J5IGlmIHByZXNlbnQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyB8IDcg
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiBpbmRleCBjZmE1
MDY4ZDlkMWUuLjJlYzg3N2FkMjYwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCj4gQEAgLTYsNiArNiw3IEBACj4gICAqLwo+ICAj
aW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KPiAgI2luY2x1
ZGUgPGRybS9kcm1fb2YuaD4KPiBAQCAtMzIsNiArMzMsNyBAQCBzdGF0aWMgdm9pZCBrb21lZGFf
dW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCQlyZXR1cm47Cj4gIAo+ICAJa29tZWRhX2tt
c19kZXRhY2gobWRydi0+a21zKTsKPiArCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShk
ZXYpOwo+ICAJa29tZWRhX2Rldl9kZXN0cm95KG1kcnYtPm1kZXYpOwo+ICAKPiAgCWRldl9zZXRf
ZHJ2ZGF0YShkZXYsIE5VTEwpOwo+IEBAIC01Myw2ICs1NSwxMSBAQCBzdGF0aWMgaW50IGtvbWVk
YV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCQlnb3RvIGZyZWVfbWRydjsKPiAgCX0KPiAg
Cj4gKwkvKiBHZXQgdGhlIG9wdGlvbmFsIGZyYW1lYnVmZmVyIG1lbW9yeSByZXNvdXJjZSAqLwo+
ICsJZXJyID0gb2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9pbml0KGRldik7Cj4gKwlpZiAoZXJyICYm
IGVyciAhPSAtRU5PREVWKQo+ICsJCWdvdG8gZGVzdHJveV9tZGV2Owo+ICsKCkhpIE1paGFpbDoK
ClRoYW5rcyBmb3IgeW91ciBwYXRjaC4KClNpbmNlIHdlIGhhdmUgYSBkZWRpY2F0ZWQgZnVuY3Rp
b24gZm9yIERUIHBhcnNpbmc6ICJrb21lZGFfcGFyc2VfZHQiLApzZWVtcyB3ZSdkIG1vdmUgdGhp
cyBpbnRvIGl0IGFzIHdlbGwuCgp0aGFuayB5b3UKSmFtZXMKCj4gIAltZHJ2LT5rbXMgPSBrb21l
ZGFfa21zX2F0dGFjaChtZHJ2LT5tZGV2KTsKPiAgCWlmIChJU19FUlIobWRydi0+a21zKSkgewo+
ICAJCWVyciA9IFBUUl9FUlIobWRydi0+a21zKTsKPiAtLSAKPiAyLjIyLjAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
