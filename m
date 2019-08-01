Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4372F7D588
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 08:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4F96E375;
	Thu,  1 Aug 2019 06:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20046.outbound.protection.outlook.com [40.107.2.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAEA6E375
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 06:34:31 +0000 (UTC)
Received: from VI1PR08CA0156.eurprd08.prod.outlook.com (2603:10a6:800:d5::34)
 by DB6PR0801MB1845.eurprd08.prod.outlook.com (2603:10a6:4:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Thu, 1 Aug
 2019 06:34:28 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by VI1PR08CA0156.outlook.office365.com
 (2603:10a6:800:d5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Thu, 1 Aug 2019 06:34:28 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 1 Aug 2019 06:34:26 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Thu, 01 Aug 2019 06:34:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92f62b84ab8aed9d
X-CR-MTA-TID: 64aa7808
Received: from 8a46f9cee66c.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA1A1D31-740D-4E01-AB68-DB6D478D8A63.1; 
 Thu, 01 Aug 2019 06:34:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a46f9cee66c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 01 Aug 2019 06:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGZO2GnjAUes19lrQDuAx0lUqrj5Tksuo80y+DCy6EIp/nK7oyc/hrwRjDCcpWr58RD+Ha/WksYuEMXjzvkGJeCPoE6EMLCA7lnZcn7NT7pQoOBZuZzrExJrSBHNsAINe2Cqn7qAdfri8dDuPGNO4Bdw15P4e3dxWZZs2Xw/70S0ogH7GTUqYvSrHt/MQyNslJ0d47NGXW/vZWFLVDOpsb6BoZc67aGSOVIMM3gpEHu1kRwhBX/i9qjeipawOV9HnOb81U4A+pRUezinJHwTMxoRQ08pqiS05MJxKTK2KvALYI5GzNIGif21dil5hT927BBlZabPCFWIoODAFZxgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx5sLKG7dsxhqmVcbg30ChKt0SJMY0LZdj1aSvN+oNE=;
 b=ZZtzjxxevNemBHJ35U/GRKyZhYjJi7pFb5BY3DkyJu/nVfW+wXRM0hnZ/1Kj2n0oFLL4jEilERD5ZgnKnHFc17A+JeamcS4ueOLCLx5CXPuGj4IEOXa3ssHAL50cl+Qv/xUw2nEu1nWhSVTuCpShUebstWLI0ioryLo2gvcZEuWn++WqRZk+rIh2a4BFKOIN/LKtq9a7AkuYrPuFK8rAG3ktZKxaAgIs40bm+pNymjPD8n7Z7O8EGhnGGab+TUZxmqU8gez6dWTtv1r4L+HnAMBQiAztRmMCvSCDu9JkQBEd8f1Mmvyfdu/tWthh7jsFzruM2/Och50fKla6AxLuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4095.eurprd08.prod.outlook.com (20.178.127.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Thu, 1 Aug 2019 06:34:08 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 06:34:08 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/CyrPm3jrEukClo/Nxj8QL56bktjQAgAEg1oA=
Date: Thu, 1 Aug 2019 06:34:08 +0000
Message-ID: <20190801063351.GB17887@lowry.li@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0043.apcprd03.prod.outlook.com
 (2603:1096:202:17::13) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1a270a7a-033e-4ab2-a418-08d7164a4cc8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB4095; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4095:|DB6PR0801MB1845:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1845AAABC2B730C33A93A4BA9FDE0@DB6PR0801MB1845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1201;OLM:1201;
x-forefront-prvs: 01165471DB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(189003)(199004)(81156014)(229853002)(5660300002)(1076003)(8676002)(6436002)(53936002)(81166006)(186003)(6636002)(66066001)(7416002)(486006)(102836004)(6486002)(33656002)(26005)(52116002)(99286004)(71190400001)(71200400001)(2906002)(478600001)(25786009)(8936002)(6116002)(3846002)(6512007)(9686003)(256004)(11346002)(6246003)(66946007)(66446008)(64756008)(446003)(66476007)(66556008)(7736002)(6506007)(58126008)(386003)(76176011)(14454004)(305945005)(86362001)(61793004)(55236004)(68736007)(4326008)(6862004)(54906003)(316002)(36756003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4095;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: HodkPtl/cAIATleZd0wlTDH3wFl+4GiXgZ0DPwATOLu0xY0MDOwbY1ItXvq4rV/cDnRa71Jel0KfWP5AiX7tyPmJuoM+EuomsYN2JvRsJm35nXokg268GbgREqrXea61mtzdu6i9CNM1cUtbIkbMLiRLALL+T17dmIHGospaGGBQQlXTfQvs8tNGrQFsqN2b6oTVThP8HTVW5MSFi0Wk0NprCK1spXVijweq6oe39GPd1zABvdnLiHrXIPy1w0Ln1F67SSp4WiLHaZRO38j5O1v1V+deanbHmjz1Ueo5F/mdbRQQqLRU/Z1ZzS1zl/P8MQpP7hMhKHQOUtddgmuzkmOhozIJHhPgDhk4cRqSMP0CkgRs33Mv/ZdnKosCemMQhUKOYPuqsUN6Xamm91MMIPbhEi2972JqfhUBOoFsOjU=
Content-ID: <CEC00F5AA3D4F34AA45797ADCD4E9B13@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4095
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(199004)(189003)(76130400001)(11346002)(336012)(1076003)(4326008)(5660300002)(81166006)(58126008)(50466002)(36906005)(47776003)(70206006)(97756001)(102836004)(70586007)(66066001)(54906003)(316002)(126002)(36756003)(446003)(86362001)(2906002)(63350400001)(476003)(486006)(63370400001)(356004)(76176011)(8676002)(99286004)(6116002)(3846002)(6862004)(478600001)(6486002)(33656002)(26826003)(81156014)(25786009)(9686003)(6506007)(61793004)(14454004)(386003)(7736002)(6246003)(6636002)(46406003)(26005)(229853002)(6512007)(23726003)(8746002)(305945005)(22756006)(8936002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1845;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 76a3fa2f-372d-4d74-9962-08d7164a41b2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1845; 
NoDisclaimer: True
X-Forefront-PRVS: 01165471DB
X-Microsoft-Antispam-Message-Info: YlvN9eMCyrQq/2n7N/fHt+f7Oz1EtCaLUe7N6U+vffr23D+7LTMSMil7Pps7jvNgYEPso0rdKiOvXeazAkN+CaNCe01aox9h+wxhjs3IHvH4Mig27DD9K+5vmTvnSPz3XeKU3+zK7/97s6Eq47hi/o4jwG626WeYtE+puG1dSTLQA3sCkflKUPS0HNJShY39qT7eddZxkKd1fdIOpL5Sy9zhcPop/rO6P44Lo800Aqx2hx+/qlEpH1gu03oabfevZvYnebnYO6k17zpv3p+ewebZbUJBv5rahNgspBxuYK6H19hEDzBoqVTXqncP75Mh3ywHtPcih1Axn3cJxSc3BLFXumYE9aoEuBe6rMdyxkhf01aVC85dNxkUsFySXpFOvZO0U0nBwKjRqJQce2Qv2ur0K9UYHfMRs9JIW2WqzBE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:34:26.5991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a270a7a-033e-4ab2-a418-08d7164a4cc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx5sLKG7dsxhqmVcbg30ChKt0SJMY0LZdj1aSvN+oNE=;
 b=5kzrLnuDHGoZL6454nCRvEJ3yGHKOdwsm2wRwPTFQczYvxcwRcwX4afEHm0C3oaV05fvSlk4pA8pvOCojgC3wL31TKE+dd6bIbkkZrX/XP3mMoggxLvOpaosaPjQjGqPRWYr9IVQlXXYgGnUGLPuviL7fg3D9lwicAIsDuB0gIQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx5sLKG7dsxhqmVcbg30ChKt0SJMY0LZdj1aSvN+oNE=;
 b=5kzrLnuDHGoZL6454nCRvEJ3yGHKOdwsm2wRwPTFQczYvxcwRcwX4afEHm0C3oaV05fvSlk4pA8pvOCojgC3wL31TKE+dd6bIbkkZrX/XP3mMoggxLvOpaosaPjQjGqPRWYr9IVQlXXYgGnUGLPuviL7fg3D9lwicAIsDuB0gIQ=
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJpYW4sCgpPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAwOToyMDowNFBNICswODAwLCBCcmlh
biBTdGFya2V5IHdyb3RlOgo+IEhpIExvd3J5LAo+IAo+IFRoYW5rcyBmb3IgdGhpcyBjbGVhbnVw
Lgo+IAo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDExOjA0OjQ1QU0gKzAwMDAsIExvd3J5IExp
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiBEdXJpbmcgaXQgc2lnbmFscyB0aGUg
Y29tcGxldGlvbiBvZiBhIHdyaXRlYmFjayBqb2IsIGFmdGVyIHJlbGVhc2luZwo+ID4gdGhlIG91
dF9mZW5jZSwgd2UnZCBjbGVhciB0aGUgcG9pbnRlci4KPiA+IAo+ID4gQ2hlY2sgaWYgZmVuY2Ug
bGVmdCBvdmVyIGluIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2IoKSwgcmVsZWFzZSBpdC4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93
cnkubGlAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNr
LmMgfCAyMyArKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNr
LmMKPiA+IGluZGV4IGZmMTM4YjYuLjQzZDllM2IgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRl
YmFjay5jCj4gPiBAQCAtMzI0LDYgKzMyNCw5IEBAIHZvaWQgZHJtX3dyaXRlYmFja19jbGVhbnVw
X2pvYihzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYikKPiA+ICAJaWYgKGpvYi0+ZmIpCj4g
PiAgCQlkcm1fZnJhbWVidWZmZXJfcHV0KGpvYi0+ZmIpOwo+ID4gIAo+ID4gKwlpZiAoam9iLT5v
dXRfZmVuY2UpCj4gCj4gSSdtIHRoaW5raW5nIGl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIHNp
Z25hbCB0aGUgZmVuY2Ugd2l0aCBhbiBlcnJvcgo+IGhlcmUsIGlmIGl0J3Mgbm90IGFscmVhZHkg
c2lnbmFsZWQuIE90aGVyd2lzZSwgaWYgdGhlcmUncyBzb21lb25lCj4gd2FpdGluZyAod2hpY2gg
dGhlcmUgc2hvdWxkbid0IGJlKSwgdGhleSdyZSBnb2luZyB0byBiZSB3YWl0aW5nIGEgdmVyeQo+
IGxvbmcgdGltZSA6LSkKPiAKPiBUaGFua3MsCj4gLUJyaWFuCj4gCkhlcmUgaXQgaGFwcGVuZWQg
YXQgYXRvbWljX2NoZWNrIGZhaWxlZCBhbmQgdGVzdCBvbmx5IGNvbW1pdC4gRm9yIGJvdGgKY2Fz
ZXMsIHRoZSBjb21taXQgaGFzIGJlZW4gZHJvcHBlZCBhbmQgaXQncyBvbmx5IGEgY2xlYW4gdXAu
IFNvIGhlcmUgYmV0dGVyCm5vdCBiZSB0cmVhdGVkIGFzIGFuIGVycm9yIGNhc2U6KQoKU2luY2Ug
Zm9yIHVzZXJzcGFjZSwgaXQgc2hvdWxkIGhhdmUgYmVlbiBmYWlsZWQgb3IgYSB0ZXN0IG9ubHkg
Y2FzZSwgc28Kd3JpdGViYWNlIGZlbmNlIHNob3VsZCBub3QgYmUgc2lnbmFsZWQuCgpCZXN0IHJl
Z2FyZHMsCkxvd3J5Cj4gPiArCQlkbWFfZmVuY2VfcHV0KGpvYi0+b3V0X2ZlbmNlKTsKPiA+ICsK
PiA+ICAJa2ZyZWUoam9iKTsKPiA+ICB9CgotLSAKUmVnYXJkcywKTG93cnkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
