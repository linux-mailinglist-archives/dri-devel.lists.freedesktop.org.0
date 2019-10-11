Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53720D3B54
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 10:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B276EBE4;
	Fri, 11 Oct 2019 08:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40078.outbound.protection.outlook.com [40.107.4.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E496EBE0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 08:38:09 +0000 (UTC)
Received: from VI1PR08CA0145.eurprd08.prod.outlook.com (2603:10a6:800:d5::23)
 by AM0PR08MB3009.eurprd08.prod.outlook.com (2603:10a6:208:66::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 08:38:05 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0145.outlook.office365.com
 (2603:10a6:800:d5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 08:38:05 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 08:38:04 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Fri, 11 Oct 2019 08:37:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18a55e67db5b86f3
X-CR-MTA-TID: 64aa7808
Received: from cdbdbaa94d86.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D2F009E-55F0-4339-A076-C8A348A2DDEE.1; 
 Fri, 11 Oct 2019 08:37:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdbdbaa94d86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Oct 2019 08:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg7VHAuAqSl1veZdR+DsnnafBFdjxz52ijXTZq7GIhPJgyPT2igY5ecd2ORJ25MMMLrvrXYw0UsgdiL5KCO5frwhiuv/KNGkD+dzLgYouZsYg7vHa4ajb7BHJ2vQSStaipeBujiO0hL1LOSdF0coRfW66aL961Q/y0fTahZFyTZzDpjdw0GryXRdFDd0TdT5MZ4dx9JyPgVUnnrlCdUaUvAGkFeUwoKh72DroUc96upl/HT9hA9gN6JQzRt2E7nFdqp3SrBldQ5g34Q/bjpCnqs/xIFizzPYByHnKl2+THyUwWjSmoQ9/4srNkNHXUZg9smZriRArXFtzEHB8udkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d28GGuu3K9YqFf3AYiW4eldKKm1MXDtrHAc9zcfNljY=;
 b=Q3dTNQ9N18KgMQqyzWKvkO5QDUVvyx6Nnvs3rUnKsqiWrj/TulBdDQFPZh2cX2PuSAzfaJwx4OGDhl5p5MaLg0Sn0E0GyWoy2dznWljRwYYikkawlPd5YjrtBYKSbtW5rBa6npkO+fpY1u7jZlkPJEXZ/SS/FoYOh5OtIDn+POcezaZKuFo17KrfFqh4Wdy6IwArkRHz3Dpj9o/waQBaUaEgAoTJsuhQJXP8FDv7ZVfN5YyT8aam2NzykaWbdzl1fbJbM0cwb6DoYRy1VHdEAILFOPw6LrW4OPcF86Fq/YF0e0TBQUobU5GRO7DKtC+DpIfOrI/eNelbu4BDJRMByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3630.eurprd08.prod.outlook.com (20.177.61.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 11 Oct 2019 08:37:49 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 08:37:49 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v2 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVf/clWn1lNlR63U6qt5ndUaDKFadVHmKA
Date: Fri, 11 Oct 2019 08:37:48 +0000
Message-ID: <25767213.BG6Th7YoJn@e123338-lin>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <20191011054459.17984-4-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-4-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::25) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 73af6529-a7c6-4911-e9f2-08d74e26556a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3630:|VI1PR08MB3630:|AM0PR08MB3009:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3009E9C0D166DE988DDDDBC68F970@AM0PR08MB3009.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(6862004)(6246003)(54906003)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(14454004)(6436002)(6512007)(9686003)(6486002)(25786009)(478600001)(7736002)(66066001)(4326008)(71190400001)(305945005)(6506007)(386003)(2906002)(6116002)(71200400001)(11346002)(99286004)(26005)(6636002)(476003)(486006)(229853002)(256004)(3846002)(446003)(81166006)(8676002)(81156014)(76176011)(8936002)(86362001)(52116002)(102836004)(186003)(5660300002)(33716001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3630;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qnFLkiTwq/6Ei3Oia1zwhVpwnYxR+2/cU2uYa7Q+Pq42qOz0nLweULSNpoDlZ2j6L7s3D7iENQwXc+QE5PeuCydarS8bNWKjO3WCNEDXQ2oJIDhvksvxm3ZehJZDPitNjlsUSl9JAIHV7RUkSrZ4+oJtj2CRQk/cP24aRQ/BJ46WE12wndKMAhdu0qWW5rFA0SvD2eqTJSZP902R2RgLJwvx/q+bBhBkEAyxS72w0Tuo/kChanohVOoI+P14izJ0/Csv19Bh5PsMZP6kwlkjT2IWteerFakRvHoDHFfOfpUS58KbGISeiuY1HSBK8KAmStJg4FFOZrYXDgXornQrAvCfWJ1xHaQzdIkO0lwcLVir3mI3LFtpkSD+W2FPLHx4g+jX/0CTYEI+2LRjPU70miLXr2nQ5bNvJvuVEGkg+1s=
Content-ID: <C83F7169AC8AF845AAFA7DF2C36259EC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3630
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(476003)(229853002)(486006)(26005)(99286004)(6636002)(446003)(3846002)(386003)(6506007)(305945005)(63350400001)(2906002)(126002)(11346002)(6116002)(23726003)(336012)(33716001)(5660300002)(186003)(102836004)(86362001)(8746002)(8936002)(76176011)(8676002)(81166006)(81156014)(50466002)(70586007)(14454004)(36906005)(316002)(54906003)(76130400001)(356004)(70206006)(6246003)(6862004)(22756006)(478600001)(7736002)(26826003)(66066001)(4326008)(47776003)(46406003)(97756001)(25786009)(9686003)(6512007)(6486002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3009;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0404b903-6eba-4682-c33c-08d74e264c03
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmUTLPc1RLMKLUV5eWL8/jPeM/PPKOLUDyJWDGKuWLaHhLZz4IudzNsuWAHra26OW185PnR9hAlj/qHAuWnRIpW6dkwb8/fHCK1u+xD/61GR/O7ekCLARbksxNd7oH5hPg5D5JQGMCbYWWHnmteDfryrZTNjav2rx/jm8YYTZNmm7xXetLFkOscI480aevhZlK5V7tYuS3RR9MQnxIT7Uztd0gjDB4tsIwNxVvgg+LPy1fbTre+Jcd8hH/u0YhhDJIREbp1P+mn+2vHPc174yUIW1arSVUrzuMzGh/t51RUT+6qlxNKYqLr3VJJBFOnPxhxBHVqFlCN2bqT9drEOBxtF2ZRbxIatSaQNrtAyfqUcP9Dr/pYpuoXUFTZaEg/25n70uXbDft72xGlv2rEW+YHjeMjFTgoxS1HukYmXCkY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 08:38:04.4437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73af6529-a7c6-4911-e9f2-08d74e26556a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3009
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d28GGuu3K9YqFf3AYiW4eldKKm1MXDtrHAc9zcfNljY=;
 b=Ehiesx1Kd2G66h6Z88EHi2RSD6P1Vabzz8WZSSRYR5MdwrkkMy7lYbllAUet51XomPjwMxH520FEUVRmwvPSY3uZno9JHPUkiUVZ3s3GRH+4Mn1osRLWQVSLgycpQ6XSAqEp2u2jMFlNPhlTqhIBay5gSkJqvgqPs5tzbRq7N7U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d28GGuu3K9YqFf3AYiW4eldKKm1MXDtrHAc9zcfNljY=;
 b=Ehiesx1Kd2G66h6Z88EHi2RSD6P1Vabzz8WZSSRYR5MdwrkkMy7lYbllAUet51XomPjwMxH520FEUVRmwvPSY3uZno9JHPUkiUVZ3s3GRH+4Mn1osRLWQVSLgycpQ6XSAqEp2u2jMFlNPhlTqhIBay5gSkJqvgqPs5tzbRq7N7U=
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
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAxMSBPY3RvYmVyIDIwMTkgMDY6NDU6NDIgQlNUIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IFRoaXMgZnVuY3Rpb24gaXMgZm9yIGNvbnZl
cnRpbmcgZHJtX2NvbG9yX2N0bSBtYXRyaXggdG8ga29tZWRhIGhhcmR3YXJlCj4gcmVxdWlyZWQg
cmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQgQ1NDIG1hdHJpeC4KPiAKPiB2MjoKPiAgIE1v
dmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMxXzMyX3RvX3EyXzEyKCkgdG8g
ZHJtIGNvcmUKPiAgIGFzIGEgc2hhcmVkIGhlbHBlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5j
b20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3Jf
bWdtdC5jIHwgMTQgKysrKysrKysrKysrKysKPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiBpbmRleCBjMTgwY2U3MGMyNmMuLmFkNjY4YWNj
YmRmNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiBAQCAtMTE3LDMgKzExNywxNyBAQCB2b2lkIGRybV9s
dXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1
MzIgKmNvZWZmcykKPiAgewo+ICAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywg
c2VjdG9yX3RibCwgQVJSQVlfU0laRShzZWN0b3JfdGJsKSk7Cj4gIH0KPiArCj4gK3ZvaWQgZHJt
X2N0bV90b19jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpj
b2VmZnMpCltuaXRdIENvdWxkIGRvIHdpdGggYW4gZXh0cmEgY29uc3Qgb3IgdHdvIG9uIHRoZSBk
cm1fcHJvcGVydHlfYmxvYiwKb3RoZXJ3aXNlLi4uCj4gK3sKPiArCXN0cnVjdCBkcm1fY29sb3Jf
Y3RtICpjdG07Cj4gKwl1MzIgaTsKPiArCj4gKwlpZiAoIWN0bV9ibG9iKQo+ICsJCXJldHVybjsK
PiArCj4gKwljdG0gPSBjdG1fYmxvYi0+ZGF0YTsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgS09N
RURBX05fQ1RNX0NPRUZGUzsgaSsrKQo+ICsJCWNvZWZmc1tpXSA9IGRybV9jb2xvcl9jdG1fczMx
XzMyX3RvX3FtX24oY3RtLT5tYXRyaXhbaV0sIDIsIDEyKTsKPiArfQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBp
bmRleCAwOGFiNjkyODE2NDguLjJmNDY2ODQ2NjExMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBAQCAt
MTgsNiArMTgsNyBAQAo+ICAjZGVmaW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKPiAgCj4gIHZv
aWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0
X2Jsb2IsIHUzMiAqY29lZmZzKTsKPiArdm9pZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJt
X3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1MzIgKmNvZWZmcyk7Cj4gIAo+ICBjb25zdCBzMzIg
KmtvbWVkYV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29kaW5nLCB1MzIgY29s
b3JfcmFuZ2UpOwo+ICAKPiAKLi4uClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhh
aWwuYXRhbmFzc292QGFybS5jb20+CgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
