Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A2A1597
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3DF6E090;
	Thu, 29 Aug 2019 10:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60076.outbound.protection.outlook.com [40.107.6.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38B46E090;
 Thu, 29 Aug 2019 10:11:44 +0000 (UTC)
Received: from VI1PR08CA0089.eurprd08.prod.outlook.com (2603:10a6:800:d3::15)
 by DB8PR08MB4953.eurprd08.prod.outlook.com (2603:10a6:10:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 10:11:40 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR08CA0089.outlook.office365.com
 (2603:10a6:800:d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 10:11:40 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 10:11:38 +0000
Received: ("Tessian outbound a25c4e5fef41:v27");
 Thu, 29 Aug 2019 10:11:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9758031ba9e3d252
X-CR-MTA-TID: 64aa7808
Received: from 5f50b514b8bb.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F143EF17-C1B1-4BF0-A11A-FEFCEE438F9C.1; 
 Thu, 29 Aug 2019 10:11:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f50b514b8bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 29 Aug 2019 10:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAvjvZcyeU7sKqgm6Xw+HKeHvEJNQrW8aJn1U7GvUw44wBoa8wE6HgVPL6wzS6ctLoKFSezSQ++WS46u7Ukm9f4+hNN+AuywBxbgRWTPp8HEEhdi+tHW0l4t6GHnPkFOdj0uUsVWK9lSUL0BT90rSJGvoFCIv2l3hNSe3utX9GYg9Iv3Az8fFfGmWUJg/CnuD0dWfgw8Rj1IfoYRMN0ZPHKgo3mNgDCSXZ1DjC980Oy7KaHLw8k2jBU8R2Xk2lQy2Oj7aL8yFA7VD6i2tJA5F86lrEoaBcnQ4A0fwBfT87GIILayPrAZP7GWXEtwgK2z7a0or25xBgecS+D+yJtI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so8tVzQYUHBv76vUpDTflbN6kStRIwNz524/8/18cOU=;
 b=m/zat2/JdxYJUNG0T4IChBayCCXSnoDfq/oO99giMXIVcBfEsOK4vlT7SlP48g8SleKv9i6XqJyqMu7zlXY1B/+CaLutrnQ8j8cFGfo49NAezm9edPP6eQ36Dn67kVr941Zgxi+VOnLvBPmk2dkckql/4SRfJ6sSCEuAoZnK4KET5lJvSL9Ln7UtrZMRe9n3K/miuNNFtUfkhQtLw3soXoCditByEDB0oNKYDzuJ4Yn02Rqahqfo1sfXXLoFlez0jGdp/CoCytz1gBPxC88Us+sdYeSIDk3dyd4Dz7rdpCcnW2lvs54//ki4eM1iJj1+TmUchyF17HIw14mwJXoXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5005.eurprd08.prod.outlook.com (10.255.159.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 10:11:25 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 10:11:25 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Thread-Topic: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Thread-Index: AQHVW7tNhT4OtrNfq06Dw4dS1RbAN6cR7LsA
Date: Thu, 29 Aug 2019 10:11:25 +0000
Message-ID: <20190829101118.GA9692@jamwan02-TSP300>
References: <20190826130637.176f6208@canb.auug.org.au>
In-Reply-To: <20190826130637.176f6208@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0bdaf94d-7b1e-47b3-6078-08d72c69481f
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5005; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5005:|DB8PR08MB4953:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB49538E737A0B0D776D7B043DB3A20@DB8PR08MB4953.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0144B30E41
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(199004)(189003)(53754006)(58126008)(53936002)(6916009)(6512007)(14454004)(52116002)(86362001)(316002)(6506007)(4326008)(54906003)(76176011)(25786009)(6116002)(99286004)(71190400001)(3846002)(66946007)(33716001)(66446008)(64756008)(66476007)(66556008)(476003)(186003)(6246003)(446003)(229853002)(386003)(71200400001)(305945005)(6436002)(26005)(2906002)(5660300002)(6486002)(8676002)(81166006)(256004)(7736002)(81156014)(11346002)(66066001)(1076003)(55236004)(33656002)(478600001)(486006)(102836004)(8936002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5005;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: dDHI0Ls5FE7kkXxdcjjIWc8VqeYo6GkYTGu74y5MiWspOmef7RTbcxGV/8yKUvReVWBOcnskM1jlFO6anMcLWg1fynpoKFXMJsmtcxVGe7VkoexFYWhtMFhjBiAT4ScTemjbVXQxbhwIt76RitECw/B8Txl52DJXPssIx2WwOFtN156liSjNKl+WfCQtgxKl35t3UBA5DKqTOxLYWDGglabzx4ih8tGS8UcRIEzUF+6RC9VR1kPcJefEuH14EOHABEVs8m1QG1+nSVXw52t/rnA8N6I+SacgM3YGD5TOXzZbjjvVZaeNGx/Y9k1ntLv0db59W8AqDLOYe5SIM+WsPN4I9jWFsmxnp1F/Oe2a/VOmMPy81nyWBHHI4oJjhHn7wEbdaIsMPnI2oWchdRy6/oCHr6eHEB8lfJXlcJH+4lI=
Content-ID: <F77339BA66CD934EBB209F8B716083D4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5005
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(189003)(199004)(53754006)(6246003)(336012)(6506007)(102836004)(8936002)(63350400001)(63370400001)(229853002)(8746002)(386003)(81156014)(126002)(8676002)(81166006)(9686003)(6512007)(76176011)(356004)(97756001)(186003)(58126008)(86362001)(6862004)(26005)(54906003)(7736002)(11346002)(6486002)(316002)(4326008)(47776003)(25786009)(486006)(476003)(450100002)(66066001)(36906005)(305945005)(22756006)(23726003)(99286004)(478600001)(70206006)(76130400001)(70586007)(446003)(33656002)(2906002)(1076003)(14454004)(5660300002)(3846002)(6116002)(46406003)(26826003)(50466002)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4953;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5dbb9259-c1af-40b7-9bf5-08d72c693fbd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB4953; 
NoDisclaimer: True
X-Forefront-PRVS: 0144B30E41
X-Microsoft-Antispam-Message-Info: ofYImeRj7yxqzbanhZLPcFLcs3Jbm4se3bjjtw0eQJ4aLHCC7isMwbEkpexA8PYEjUFgVbzpprAC1mZfJg3DVSIESu/dYDMjUK11aMSQhWLpudgzFe4es2cjsfQe0HoNSiEiEwTCKKBprGcD1r2ZrW8KklxuBQP0UCdIRSydGt8DH4E2/11Ixw5K0V8dFPl165NR3JDy3OjAk1fjnU9mB6H/Qs+amCbYg6dNsoNZEmrtjrC4X+A44xsYBWFUxFeTQNx7CIoOdimQa/rrJaj2fXZt2feazGk3D4SmjtBC4fIYxQ9UN3WhnFQioS2pwuNQVE0s5FgEOIl1yRctN3PGSKsuDok6QSDsb4kzFRksEd/6KyuwqKaUDRyWWB4obuVEl8swbEXVKzPLWSZUxeoXeOpAqdKGVeGH9ewDxunzab4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 10:11:38.8287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdaf94d-7b1e-47b3-6078-08d72c69481f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so8tVzQYUHBv76vUpDTflbN6kStRIwNz524/8/18cOU=;
 b=vNhlYVo8TrNeFNxhH/8sLQirpjTdkb8lFW3OCzC3X62yZXJeQGu4niajjRBQs0pYHdi37HBV61ip2cscjZnirYuu/UQDnr0/BnImjedoFe80F2PXH9HO75EvVk4xIMuVal/C4Cr/tgfsFB/6HGyE1TV/EwCL1ApX1TXf6HDIku0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so8tVzQYUHBv76vUpDTflbN6kStRIwNz524/8/18cOU=;
 b=vNhlYVo8TrNeFNxhH/8sLQirpjTdkb8lFW3OCzC3X62yZXJeQGu4niajjRBQs0pYHdi37HBV61ip2cscjZnirYuu/UQDnr0/BnImjedoFe80F2PXH9HO75EvVk4xIMuVal/C4Cr/tgfsFB/6HGyE1TV/EwCL1ApX1TXf6HDIku0=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDE6MDY6MzdQTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSBk
cm0gdHJlZSBnb3QgYSBjb25mbGljdCBpbjoKPiAKPiAgIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gCj4gYmV0d2VlbiBjb21taXQ6Cj4gCj4gICA1MWE0
NGEyOGVlZmQgKCJkcm0va29tZWRhOiBBZGQgbWlzc2luZyBvZl9ub2RlX2dldCgpIGNhbGwiKQo+
IAo+IGZyb20gdGhlIGRybS1taXNjLWZpeGVzIHRyZWUgYW5kIGNvbW1pdDoKPiAKPiAgIDg5NjVh
ZDg0MzNlYSAoImRybS9rb21lZGE6IEVuYWJsZSBkdWFsLWxpbmsgc3VwcG9ydCIpCj4gCj4gZnJv
bSB0aGUgZHJtIHRyZWUuCj4gCj4gSSBmaXhlZCBpdCB1cCAoc2VlIGJlbG93KSBhbmQgY2FuIGNh
cnJ5IHRoZSBmaXggYXMgbmVjZXNzYXJ5LiBUaGlzCj4gaXMgbm93IGZpeGVkIGFzIGZhciBhcyBs
aW51eC1uZXh0IGlzIGNvbmNlcm5lZCwgYnV0IGFueSBub24gdHJpdmlhbAo+IGNvbmZsaWN0cyBz
aG91bGQgYmUgbWVudGlvbmVkIHRvIHlvdXIgdXBzdHJlYW0gbWFpbnRhaW5lciB3aGVuIHlvdXIg
dHJlZQo+IGlzIHN1Ym1pdHRlZCBmb3IgbWVyZ2luZy4gIFlvdSBtYXkgYWxzbyB3YW50IHRvIGNv
bnNpZGVyIGNvb3BlcmF0aW5nCj4gd2l0aCB0aGUgbWFpbnRhaW5lciBvZiB0aGUgY29uZmxpY3Rp
bmcgdHJlZSB0byBtaW5pbWlzZSBhbnkgcGFydGljdWxhcmx5Cj4gY29tcGxleCBjb25mbGljdHMu
Cj4KCkhpIFN0ZXBoZW46ClNvcnJ5IGZvciB0aGUgY29uZmxpY3QsIGFuZCB0aGFuayB5b3UgdmVy
eSBtdWNoLgoKUmVnYXJkcwpKYW1lcwo+IC0tIAo+IENoZWVycywKPiBTdGVwaGVuIFJvdGh3ZWxs
Cj4gCj4gZGlmZiAtLWNjIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5jCj4gaW5kZXggOWQ0ZDUwNzVjYzY0LDFmZjdmNGIyYzYyMC4uMDAwMDAwMDAwMDAwCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+IEBA
QCAtMTI3LDcgLTEyOCw4ICsxMjksOCBAQEAgc3RhdGljIGludCBrb21lZGFfcGFyc2VfcGlwZV9k
dChzdHJ1Y3QgCj4gICAJcGlwZS0+b2Zfb3V0cHV0X3BvcnQgPQo+ICAgCQlvZl9ncmFwaF9nZXRf
cG9ydF9ieV9pZChucCwgS09NRURBX09GX1BPUlRfT1VUUFVUKTsKPiAgIAo+ICsgCXBpcGUtPmR1
YWxfbGluayA9IHBpcGUtPm9mX291dHB1dF9saW5rc1swXSAmJiBwaXBlLT5vZl9vdXRwdXRfbGlu
a3NbMV07Cj4gIC0JcGlwZS0+b2Zfbm9kZSA9IG5wOwo+ICArCXBpcGUtPm9mX25vZGUgPSBvZl9u
b2RlX2dldChucCk7Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
