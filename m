Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4419114292
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 15:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF0B6E104;
	Thu,  5 Dec 2019 14:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9006E104
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 14:25:13 +0000 (UTC)
Received: from VI1PR08CA0275.eurprd08.prod.outlook.com (2603:10a6:803:dc::48)
 by VI1PR0802MB2544.eurprd08.prod.outlook.com (2603:10a6:800:b0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 14:25:11 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR08CA0275.outlook.office365.com
 (2603:10a6:803:dc::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 14:25:11 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 14:25:11 +0000
Received: ("Tessian outbound 25173d5f5683:v37");
 Thu, 05 Dec 2019 14:25:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d132f69c51e5f41
X-CR-MTA-TID: 64aa7808
Received: from 6099433ef415.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0D85104-A995-47C7-8473-587911C9D8E1.1; 
 Thu, 05 Dec 2019 14:25:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6099433ef415.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 14:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pmf1Gl0VXt0SFqFQeq1m4oEhzCQyRnBVonkFTbMxxsZXg4dnhKa6aSUQjWzn8xsneTZyy/cZH7JIPYlZo6oy8NtjBcGWm9TJd8xHaaNeG8Xmsx1TKcQD2FVo0bAsTCk1YSa49qH9rxHbeG/0n80OduRZz7CTnVede3azKZ2Uro7Eh4x5/U3e2hZf4LLq0Xv2hcqsFx9uzm+l6fsaOfZL1aaJAl7aGADD0vJ7dKs/oZpySMHnbgZFdd/o6dKFfkGaxUCGe3JOfgJbuVH1711Sj5bqSzKyBk657zfs3h4/+BJoRfQfaV5ySkpyPJ8I0O2ypqvLk9MYax+S1Ggl9YqkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJtvfZsldqtIlUTMNq33x3RIOAnle4BfQNeSJvULHP8=;
 b=O0LRMp8ALZJmaPqImaaFb1NAtrh9n08KHiFCJ9HhLnh1/bMwF+K/6AoXlkoMY3pu0JgwgnUDLb2FgbToktiriVOEec1UB1XvHoFMglxVdysYwgxsCwEJ3du/sRrhMyJ0rZQIoy88StCWkJyxJZ8L12vL0II4Kw+nBZV9P+/wjMQYwpHh3p0taSiM6jMVb89Et70Wx7tsV2oBy6CE4t7YIUJr9NaqO99/u4jR7d8kVEEx/g8CHjkYzGSWhnAwfQCIUZohB11Nmgqqvcewh9MiQPy+5xgVWgXXlj8vUkCBM55XOXhz6jk+FAAOesPY8+JOxr6Aj9AJkYtEBJv2c1KOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4462.eurprd08.prod.outlook.com (20.179.26.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Thu, 5 Dec 2019 14:25:03 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 14:25:03 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 01/28] drm: Introduce drm_bridge_init()
Thread-Topic: [PATCH v2 01/28] drm: Introduce drm_bridge_init()
Thread-Index: AQHVqpiuVXCS0RRq1UGHN2fVy/u6K6erfSAAgAAaBwA=
Date: Thu, 5 Dec 2019 14:25:03 +0000
Message-ID: <1769361.msXMbpdiVO@e123338-lin>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-2-mihail.atanassov@arm.com>
 <20191205124022.GA16034@pendragon.ideasonboard.com>
In-Reply-To: <20191205124022.GA16034@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad756371-39e1-48dd-d30f-08d7798eefd4
X-MS-TrafficTypeDiagnostic: VI1PR08MB4462:|VI1PR0802MB2544:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB25440746B3D5AE8791629A408F5C0@VI1PR0802MB2544.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:272;OLM:272;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(51914003)(14454004)(99286004)(5660300002)(9686003)(71200400001)(71190400001)(66556008)(186003)(66476007)(52116002)(33716001)(11346002)(66446008)(6512007)(54906003)(316002)(86362001)(229853002)(2906002)(478600001)(81166006)(25786009)(102836004)(14444005)(8676002)(6506007)(81156014)(305945005)(966005)(6486002)(64756008)(66946007)(4326008)(6916009)(26005)(8936002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4462;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uZoOwzpLWsSwCAdIpXRl5DX0DKrLQIQUr3nDv7p4vcRdQFs8GyVv5iUfQUSsOoKYJi3X1jJ7Nmo4rMl4MNU+sHC/k7iB53m1vWW46VZc1wFfSSFMflanmAyeJo6M3M6rxO/nqBD1fKKnRxadvlIyEodH2WbGlnJRklxZWmHLGyVwnj6ELT4dc5RI+Hyyz860cEMJDMYLPNuuCUJP+3ceQvJBabilUAm4pS1PShB+FvMcFNKSMYRG3fZlL2rDiEUiyQi1ipvUqO+i5p46P+MDHdScLr+boBimYC0AywHDpCVH8SPsAbUvyIf8bGIBLv/0+C1IFbwqLzcn4oPCmQ5opIu7lN9dPX3YxZIUFd0sdU3HUDI3/0Jx4LrBMwYmcqbAwUXB2qbbcZ+8lgydd5TSeKYdMv4s8AnireC98d41T5jOVSLtv2YuYJKX2KF03+GX1uXonOvGlyeW+kk4LdLxJsJ64MoIFhSx+HfLBkxNvFSEc99gOMP5kEE3hwUGMaZCec3VXLoaqCB0V6odhUxAy8EHeN7/sF5A+85pGHslJj0=
x-ms-exchange-transport-forked: True
Content-ID: <7D4E8321A104A64B8D1F0D662D5D9C49@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4462
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(51914003)(11346002)(6486002)(22756006)(102836004)(6862004)(229853002)(4326008)(9686003)(107886003)(23726003)(186003)(76176011)(25786009)(99286004)(6512007)(26005)(6506007)(305945005)(336012)(50466002)(2906002)(81156014)(97756001)(478600001)(54906003)(8676002)(81166006)(46406003)(26826003)(33716001)(966005)(316002)(8936002)(70206006)(14454004)(76130400001)(356004)(70586007)(14444005)(5660300002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2544;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 36f45192-e8c1-4f80-238a-08d7798eeae1
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvmGBpYYMbRCVI/NyyXjHoca9jAsHY6YIPIL7NTxQRnEspUO5yP3IMs3WxRGa3BWiZlGHgbZGlJ4PoSiNryZlfAfYx14OStQnyUHlMN89r5lt5NrP1Tpbt9TsNZnY8gujvxLaQFCJP73Rmnu61mFQMe8YEdT2yqdxgnCl03BSwjfCY/LlKInTjCyq1yfQkPdmQ+g9a4abIIIVleLsBq14L9YsVez/CC7Fk16B1Mz1zgswK4+eTuPMgRmeORZLLgQZILyPXMFpL5gvUVqemJQdYULmMuD6tKg29iOJ2xm7azcBSNQmToWkWJu+70yN5KhklQvjHqAY/oqUxUHtgREJe/7r21oRL/ye3/gPCWRdIugbAxXwpMLRBhUZWJsutyPNIUEhyWsZwakK7Ef1VPKMnxq+TlOnHb5MN11oQCq0Xe/2DuJqeDgAhqPwI2J52gviWdXDjq+xSFo212/WNI9oueh2f30JrREEnn89sH2SCVR9wXFMKTbECKDgm1SWOYIcJNNErOh7OgKuYsiYnLlYsI3Ko4JbCYPRKte/rY92WE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 14:25:11.1513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad756371-39e1-48dd-d30f-08d7798eefd4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2544
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJtvfZsldqtIlUTMNq33x3RIOAnle4BfQNeSJvULHP8=;
 b=VO0xD4rMq/fpNWn2aJbRLCOMVtN9sqFzLVtJX6xPRq4Il4yMvQ367hVc+stoYq2M/kkmdFB8uWMbRgxF/typ4xg08jAIabmoXbobwPx+n2vq/qFbXYSHXCznulLbhn5A1ZRpLOqVPkGHuDN03p4BiA+urpXYgADoTT6ae57b8NQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJtvfZsldqtIlUTMNq33x3RIOAnle4BfQNeSJvULHP8=;
 b=VO0xD4rMq/fpNWn2aJbRLCOMVtN9sqFzLVtJX6xPRq4Il4yMvQ367hVc+stoYq2M/kkmdFB8uWMbRgxF/typ4xg08jAIabmoXbobwPx+n2vq/qFbXYSHXCznulLbhn5A1ZRpLOqVPkGHuDN03p4BiA+urpXYgADoTT6ae57b8NQ=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFRodXJzZGF5LCA1IERlY2VtYmVyIDIwMTkgMTI6NDA6MjIgR01UIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgTWloYWlsLAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhl
IHBhdGNoLgoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3cyA6KS4KCj4gCj4gT24gV2VkLCBE
ZWMgMDQsIDIwMTkgYXQgMTE6NDg6MDJBTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToK
PiA+IEEgc2ltcGxlIGNvbnZlbmllbmNlIGZ1bmN0aW9uIHRvIGluaXRpYWxpemUgdGhlIHN0cnVj
dCBkcm1fYnJpZGdlLiBUaGUKPiA+IGdvYWwgaXMgdG8gc3RhbmRhcmRpemUgaW5pdGlhbGl6YXRp
b24gZm9yIGFueSBicmlkZ2UgcmVnaXN0ZXJlZCB3aXRoCj4gPiBkcm1fYnJpZGdlX2FkZCgpIHNv
IHRoYXQgd2UgY2FuIGxhdGVyIGFkZCBkZXZpY2UgbGlua3MgZm9yIGNvbnN1bWVycyBvZgo+ID4g
dGhvc2UgYnJpZGdlcy4KPiA+IAo+ID4gdjI6Cj4gPiAgLSBzL1dBUk5fT04oIWZ1bmNzKS9XQVJO
X09OKCFmdW5jcyB8fCAhZGV2KS8gYXMgc3VnZ2VzdGVkIGJ5IERhbmllbAo+ID4gIC0gZXhwYW5k
IG9uIHNvbWUga2VybmVsZG9jIGNvbW1lbnRzIGFzIHN1Z2dlc3RlZCBieSBEYW5pZWwKPiA+ICAt
IHVwZGF0ZSBjb21taXQgbWVzc2FnZSBhcyBzdWdnZXN0ZWQgYnkgRGFuaWVsCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgfCAzNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAg
ICB8IDE1ICsrKysrKysrKysrKysrLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gPiBpbmRleCBj
YmE1MzdjOTllNDMuLjUwZTFjMWI0NmUyMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYnJpZGdlLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiA+
IEBAIC02NCw3ICs2NCwxMCBAQCBzdGF0aWMgREVGSU5FX01VVEVYKGJyaWRnZV9sb2NrKTsKPiA+
ICBzdGF0aWMgTElTVF9IRUFEKGJyaWRnZV9saXN0KTsKPiA+ICAKPiA+ICAvKioKPiA+IC0gKiBk
cm1fYnJpZGdlX2FkZCAtIGFkZCB0aGUgZ2l2ZW4gYnJpZGdlIHRvIHRoZSBnbG9iYWwgYnJpZGdl
IGxpc3QKPiA+ICsgKiBkcm1fYnJpZGdlX2FkZCAtIGFkZCB0aGUgZ2l2ZW4gYnJpZGdlIHRvIHRo
ZSBnbG9iYWwgYnJpZGdlIGxpc3QuCj4gCj4gWW91IGFkZCBhIGZpbmFsIHBlcmlvZCBoZXJlIGFu
ZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBvZiBzdHJ1Y3QKPiBkcm1fYnJpZGdlLCBidXQgdGhlIG5l
dyBmdW5jdGlvbiB5b3UncmUgYWRkaW5nIGRvZXNuJ3QgaGF2ZSBvbmUgOi0pIEknZAo+IGRyb3Ag
dGhlIHBlcmlvZCBoZXJlIGFuZCBmb3IgZHJtX2JyaWRnZSB0byBiZSBjb25zaXN0ZW50IHdpdGgg
dGhlIHJlc3QKPiBvZiB0aGUgY29kZS4KPiAKPiA+ICsgKgo+ID4gKyAqIERyaXZlcnMgc2hvdWxk
IGNhbGwgZHJtX2JyaWRnZV9pbml0KCkgcHJpb3IgYWRkaW5nIGl0IHRvIHRoZSBsaXN0Lgo+IAo+
IHMvc2hvdWxkL3NoYWxsLwo+IHMvcHJpb3IgYWRkaW5nIGl0L3ByaW9yIHRvIGFkZGluZyB0aGUg
YnJpZGdlLwo+IAo+ID4gKyAqIERyaXZlcnMgc2hvdWxkIGNhbGwgZHJtX2JyaWRnZV9yZW1vdmUo
KSB0byBjbGVhbiB1cCB0aGUgYnJpZGdlIGxpc3QuCj4gCj4gSSdkIHJlcGxhY2UgdGhpcyBzZW50
ZW5jZSB3aXRoICJCZWZvcmUgZGVsZXRpbmcgYSBicmlkZ2UgKHVzdWFsbHkgd2hlbgo+IHRoZSBk
cml2ZXIgaXMgdW5ib3VuZCBmcm9tIHRoZSBkZXZpY2UpLCBkcml2ZXJzIHNoYWxsIGNhbGwKPiBk
cm1fYnJpZGdlX3JlbW92ZSgpIHRvIHJlbW92ZSBpdCBmcm9tIHRoZSBnbG9iYWwgbGlzdC4iCj4g
Cgo+ID4gICAqCj4gPiAgICogQGJyaWRnZTogYnJpZGdlIGNvbnRyb2wgc3RydWN0dXJlCj4gPiAg
ICovCj4gPiBAQCAtODksNiArOTIsMzUgQEAgdm9pZCBkcm1fYnJpZGdlX3JlbW92ZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9icmlkZ2Vf
cmVtb3ZlKTsKPiA+ICAKPiA+ICsvKioKPiA+ICsgKiBkcm1fYnJpZGdlX2luaXQgLSBpbml0aWFs
aXNlIGEgZHJtX2JyaWRnZSBzdHJ1Y3R1cmUKPiAKPiBpbml0aWFsaXNlIG9yIGluaXRpYWxpemUg
PyA6LSkKCkkgaGF2ZSBhYnNvbHV0ZWx5IG5vIGNsdWUgOikuIEp1ZGdpbmcgYnkgdGhlIHF1ZXN0
aW9uIEknbSBndWVzc2luZyB0aGUKY29ycmVjdCBhbnN3ZXIgZm9yIHRoZSBrZXJuZWwgaXMgVVMg
c3BlbGxpbmcuCgo+IAo+ID4gKyAqCj4gPiArICogQGJyaWRnZTogYnJpZGdlIGNvbnRyb2wgc3Ry
dWN0dXJlCj4gPiArICogQGZ1bmNzOiBjb250cm9sIGZ1bmN0aW9ucwo+ID4gKyAqIEBkZXY6IGRl
dmljZSBhc3NvY2lhdGVkIHdpdGggdGhpcyBkcm1fYnJpZGdlCj4gCj4gZGV2IGdvZXMgYmVmb3Jl
IGZ1bmNzCj4gCj4gPiArICogQHRpbWluZ3M6IHRpbWluZyBzcGVjaWZpY2F0aW9uIGZvciB0aGUg
YnJpZGdlOyBvcHRpb25hbCAobWF5IGJlIE5VTEwpCj4gPiArICogQGRyaXZlcl9wcml2YXRlOiBw
b2ludGVyIHRvIHRoZSBicmlkZ2UgZHJpdmVyIGludGVybmFsIGNvbnRleHQgKG1heSBiZSBOVUxM
KQo+IAo+IEknbSBub3QgdG9vIHN1cmUgYWJvdXQgdGhlIGxhc3QgdHdvIHBhcmFtZXRlcnMuIEhh
dmluZyBOVUxMLCBOVUxMIGluCj4gbW9zdCBjYWxsZXJzIGlzIGNvbmZ1c2luZywgYW5kIGhhdmlu
ZyBhIHZvaWQgKiBhcyBvbmUgb2YgdGhlIHBhcmFtZXRlcnMKPiBtZWFucyB0aGF0IHRoZSBjb21w
aWxlciB3b24ndCBjYXRjaCBlcnJvcnMgaWYgdGhlIHR3byBwYXJhbWV0ZXJzIGFyZQo+IHJldmVy
c2VkLiBJIHRoaW5rIHRoaXMgaXMgcXVpdGUgZXJyb3IgcHJvbmUuCj4gCj4gVGhlcmUgYXJlIHZl
cnkgZmV3IGRyaXZlcnMgdXNpbmcgZHJpdmVyX3ByaXZhdGUgKEkgY291bnQgNiBvZiB0aGVtLCB3
aXRoCj4gMiBhZGRpdGlvbmFsIGRyaXZlcnMgdGhhdCBzZXQgZHJpdmVyX3ByaXZhdGUgYnV0IG5l
dmVyIHVzZSBpdCkuIEhvdwo+IGFib3V0IGVtYmVkZGluZyB0aGUgYnJpZGdlIHN0cnVjdHVyZSBp
biB0aG9zZSA2IGRyaXZlcnMgYW5kIGdldHRpbmcgcmlkCj4gb2YgdGhlIGZpZWxkIGFsdG9nZXRo
ZXIgPyBUaGlzIGNvdWxkIGJlIHBhcnQgb2YgYSBzZXBhcmF0ZSBzZXJpZXMsIGJ1dAo+IGluIGFu
eSBjYXNlIEknZCBkcm9wIGRyaXZlcl9wcml2YXRlIGZyb20gZHJtX2JyaWRnZV9pbml0KCkuCgpP
aywgSSdsbCBkbyB0aGF0IGZpcnN0IGJlZm9yZSByZWZyZXNoaW5nIHRoaXMgc2VyaWVzLgoKPiAK
PiA+ICsgKi8KPiA+ICt2b2lkIGRybV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiArCQkgICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJp
ZGdlX2Z1bmNzICpmdW5jcywKPiA+ICsJCSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGlt
aW5ncyAqdGltaW5ncywKPiA+ICsJCSAgICAgdm9pZCAqZHJpdmVyX3ByaXZhdGUpCj4gPiArewo+
ID4gKwlXQVJOX09OKCFmdW5jcyB8fCAhZGV2KTsKPiA+ICsKPiA+ICsJYnJpZGdlLT5kZXYgPSBO
VUxMOwo+IAo+IE5VTEwgPyBTaG91bGRuJ3QgdGhpcyBiZSBkZXYgPwoKSGVoZSwgRGFuaWVsIGdv
dCBjYXVnaHQgb24gdGhhdCBvbmUsIHRvbyA6KS4gVGhpcyBpcyB0aGUgZHJtX2RldmljZSBwb2lu
dGVyCmZvciB0aGUgYm91bmQgY29uc3VtZXIsIG5vdCB0aGUgc3RydWN0IGRldmljZSB0aGF0IHRo
ZSBicmlkZ2UncyBsaWZldGltZQppcyB0aWVkIHRvLiBJIHdhcyBwbGFubmluZyB0byByZW5hbWUg
dGhlbSB3aXRoIG15IChldmVudHVhbCkgZGV2aWNlX2xpbmtzCmFkZGl0aW9uIChzb21lIGRpc2N1
c3Npb24gYXJvdW5kIGl0IGhlcmU6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC8zNDI0NzIvP3Nlcmllcz03MDAzOSZyZXY9MSkuCgpJIGd1ZXNzIGlmIEkgZG8gdGhlIGRy
bV9kZXZpY2UgcGFydCBvZiB0aGUgcmVuYW1lIGZpcnN0LCB0aGlzIHBhdGNoIHdpbGwKbG9vayBs
ZXNzIGNvbmZ1c2luZywgc28gSSdsbCBkbyB0aGF0IHRvby4KCj4gCj4gPiArCWJyaWRnZS0+ZW5j
b2RlciA9IE5VTEw7Cj4gPiArCWJyaWRnZS0+bmV4dCA9IE5VTEw7Cj4gPiArCj4gPiArI2lmZGVm
IENPTkZJR19PRgo+ID4gKwlicmlkZ2UtPm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gPiArI2Vu
ZGlmCj4gPiArCWJyaWRnZS0+dGltaW5ncyA9IHRpbWluZ3M7Cj4gPiArCWJyaWRnZS0+ZnVuY3Mg
PSBmdW5jczsKPiA+ICsJYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSA9IGRyaXZlcl9wcml2YXRlOwo+
ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKGRybV9icmlkZ2VfaW5pdCk7Cj4gPiArCj4gPiAgLyoq
Cj4gPiAgICogZHJtX2JyaWRnZV9hdHRhY2ggLSBhdHRhY2ggdGhlIGJyaWRnZSB0byBhbiBlbmNv
ZGVyJ3MgY2hhaW4KPiA+ICAgKgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlk
Z2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gaW5kZXggYzBhMjI4NmE4MWU5Li45
NDllNGY0MDFhNTMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gQEAgLTM3Myw3ICszNzMsMTYgQEAg
c3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyB7Cj4gPiAgfTsKPiA+ICAKPiA+ICAvKioKPiA+IC0g
KiBzdHJ1Y3QgZHJtX2JyaWRnZSAtIGNlbnRyYWwgRFJNIGJyaWRnZSBjb250cm9sIHN0cnVjdHVy
ZQo+ID4gKyAqIHN0cnVjdCBkcm1fYnJpZGdlIC0gY2VudHJhbCBEUk0gYnJpZGdlIGNvbnRyb2wg
c3RydWN0dXJlLgo+ID4gKyAqCj4gPiArICogQnJpZGdlIGRyaXZlcnMgc2hvdWxkIGNhbGwgZHJt
X2JyaWRnZV9pbml0KCkgdG8gaW5pdGlhbGl6ZSBhIGJyaWRnZQo+ID4gKyAqIGRyaXZlciwgYW5k
IHRoZW4gcmVnaXN0ZXIgaXQgd2l0aCBkcm1fYnJpZGdlX2FkZCgpLgo+IAo+IHMvYnJpZGdlIGRy
aXZlci9icmlkZ2Ugc3RydWN0dXJlLyAob3IgZHJtX2JyaWRnZSBzdHJ1Y3R1cmUpCj4gCj4gPiAr
ICoKPiA+ICsgKiBVc2VycyBvZiBicmlkZ2VzIGxpbmsgYSBicmlkZ2UgZHJpdmVyIGludG8gdGhl
aXIgb3ZlcmFsbCBkaXNwbGF5IG91dHB1dAo+ID4gKyAqIHBpcGVsaW5lIGJ5IGNhbGxpbmcgZHJt
X2JyaWRnZV9hdHRhY2goKS4KPiA+ICsgKgo+ID4gKyAqIE1vZHVsYXIgZHJpdmVycyBpbiBPRiBz
eXN0ZW1zIGNhbiBxdWVyeSB0aGUgbGlzdCBvZiByZWdpc3RlcmVkIGJyaWRnZXMKPiA+ICsgKiB3
aXRoIG9mX2RybV9maW5kX2JyaWRnZSgpLgo+ID4gICAqLwo+ID4gIHN0cnVjdCBkcm1fYnJpZGdl
IHsKPiA+ICAJLyoqIEBkZXY6IERSTSBkZXZpY2UgdGhpcyBicmlkZ2UgYmVsb25ncyB0byAqLwo+
ID4gQEAgLTQwMiw2ICs0MTEsMTAgQEAgc3RydWN0IGRybV9icmlkZ2Ugewo+ID4gIAo+ID4gIHZv
aWQgZHJtX2JyaWRnZV9hZGQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7Cj4gPiAgdm9pZCBk
cm1fYnJpZGdlX3JlbW92ZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiA+ICt2b2lkIGRy
bV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3QgZGV2aWNlICpk
ZXYsCj4gPiArCQkgICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzICpmdW5jcywKPiA+
ICsJCSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyAqdGltaW5ncywKPiA+ICsJ
CSAgICAgdm9pZCAqZHJpdmVyX3ByaXZhdGUpOwo+ID4gIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9k
cm1fZmluZF9icmlkZ2Uoc3RydWN0IGRldmljZV9ub2RlICpucCk7Cj4gPiAgaW50IGRybV9icmlk
Z2VfYXR0YWNoKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSwKPiA+ICAJCSAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwcmV2aW91cyk7Cj4gCj4g
CgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
