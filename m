Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBFB80063D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A77E10E7CD;
	Fri,  1 Dec 2023 08:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4C510E7CD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:52:54 +0000 (UTC)
X-UUID: 006c1518902711eea33bb35ae8d461a2-20231201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mUMS8vQeLIT9OWw8ZDDBRmg1/3oY2ne1FUPdqN+3ubU=; 
 b=f0yxy+snZKXyqb1Q3lgYB20CgjAnTMaAIC4LbZJWKYA+XYokZpX+sex8bdpfvGTikhxsPdpqErYxAok/Cf8DTtGbV1sufq8Jx8b1E0KAYQDvT0dXC46v1rPwzLWXUklC9QK4xe/mCtBfCx0noJwx9SiVB1D19M//WImUTc0eWnw=;
X-CID-CACHE: Type:Local,Time:202312011627+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:9cf91812-be92-43d2-9786-122361e66766, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:abefa75, CLOUDID:6e124b73-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 006c1518902711eea33bb35ae8d461a2-20231201
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2025847765; Fri, 01 Dec 2023 16:52:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Dec 2023 16:52:46 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Dec 2023 16:52:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLtMkcD6dV3Q9QmqxXsWoneyFL/Ig47AOrbYtFgHRRd9XcxQhlHoxpGzO2MLYqq6TZjn4UDEuiQ9CdQLXbHoxRVISwiKE3ZfYWhn5BJtyD7iA3j1YXM8Cx52LGsZQQl1JysKgq4reO6Nle776zw29nIZMGMX8spIdrfXMWrVlSjLyDUUK5+OZ7Bd13isT7OSyHze83gvETWtu8pn67gyJvdCBb+zjVWklN/o96F6q5O79C91pONnVCmZ6XfovkTFMYwnua4mb2NxV4ycZSeySaBYoa7LIYpR7t/nmAOAnnGZ31w3NoGHkmS6DbYMR6ekHdeRfE5UQVdOAFcyOoTFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wZkCvW8SjU5J7dzWWM8u8QtBfUdZVZcfB8VjN2b1hY=;
 b=BOTIuhkiRe3Ebj53OpN6OIRasuz/Gihd6ZsKp6VQ6Ql2nGjSMntl09YeIr48vSokEw0tVlZpse6t7sC2G5ejNWvi56/ORILsDVRa1i/DMf/5QIaTS+aJ53CKdKTNUcwlHzOljMdaY0+h591/x/1FLBQMLZqpSGMDtOH8NZYBRsHgLzQ06ck4amXnuqfw9qErGmDYm/+e3yONqs0BXfF67150aaaR5s1btuFhnClIXwjv/5yDKA3ytz6vaSxCLeEoeHbb6CqV7eNHmmvmu6JjX+C5l5eykrsTPftxpbu81rhq1GEA4ecSz4LhgB35KV0iN4TTGgwL7QqyYZbee4JUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wZkCvW8SjU5J7dzWWM8u8QtBfUdZVZcfB8VjN2b1hY=;
 b=npSDumx+PM3BpIAOZ/mFjwhiLTKzxT+NO0vDrmTb8pEF1jaaQ3o3jKWm7NQQPDD5bsU1u4at/YA1i3ND+pXhddlWhYgFLaQY4x8ap4cx+l2D4D248L0PMa2u+s7dbH37CcbXtTtddPILml4YXjXKE/cCcDs00VNTdbcLpeQtGgY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PSAPR03MB5352.apcprd03.prod.outlook.com (2603:1096:301:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 08:52:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 08:52:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrCUKhaA
Date: Fri, 1 Dec 2023 08:52:43 +0000
Message-ID: <cfa0f0daeaaf1d8909ad505cf7e36314d8a5367a.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PSAPR03MB5352:EE_
x-ms-office365-filtering-correlation-id: 61aaffac-cd7a-4e52-345b-08dbf24ae22f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5WgYEptym7jEXZl3MsuNgbB6nrxz4uLI3t13LXkOxtciQB3EEKfJn9IT9NAKfnWKJASao/egTblDP1wBBBkFVQXBNHGNqlm1NGQy3dFg8jcJpQlMbOTBeWgrz86IFWArhDrALQlBpa+oM8lkdurRUsKg1kdNfGcBMrZu7JmHEsxKLUvgSWKhICos6366SEhDvb9qTXb92m2hWTLhIMkoQ/+qgxcqfw4PcIQTfEiRyD0iyr9b+cl0Ra36TnOe2hK2lRvcTbconBjtAtvwRpIdD9ETv9cRze7kdh1UtSdkKeGsFSJh2zos7ua+l2gQe6GDxOLcpEZDNmI9QCmJn3xasRwwj5WUEaNrdOn5//yGg3rUUbbc8PR6SLc9dufSDln4BkaYI542leilibAOY73rc3lzR2mdDykEZNdS3y9n3s8ltQMaCofvrqC05mZpFlAKnvktQj7MWCZTEFpyb8PI8QS2PbGzaXAXdRbbBsRj3eiR1J8AGfc9hWr4NOHVA2NTYd4cyQk+k7SAJ/cwrKXPU50FUpLSjVcdRsm1DUcFT97xn1VzpbaPfBIdopKNAVyGljgBxsMXhThK7YAU9xj4Qw9XuquRlsWAWetzRp52v726ibcGNig+cvUZGrakxRpeZgRaE8Eq1hJdxunoCNUvCWIyDT/4qHSxzjlb56MuBs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38070700009)(4001150100001)(83380400001)(5660300002)(85182001)(41300700001)(2906002)(7416002)(71200400001)(2616005)(6506007)(107886003)(38100700002)(26005)(36756003)(6512007)(122000001)(6486002)(66446008)(110136005)(66946007)(66476007)(86362001)(76116006)(316002)(478600001)(64756008)(66556008)(8936002)(4326008)(8676002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2k2eVRlaXdINkdrdjY5VEhPVlQzeVRmOG56cXAxdnM4UjN5RTdmdVh0c3RZ?=
 =?utf-8?B?WXlldGJpQXZwSE9sNWNpMXBmUGZJZ1BYVDBKSWZ0bUIvNXVmN3Q5MU5aY2hS?=
 =?utf-8?B?NXlLT2ZNeGdHQ0JaNE5BMFF3TnYvMVZJeCtEOEhzUkl6N0ZnVXVxZktEbDc4?=
 =?utf-8?B?anZiZVhKNllpOEUyQUtjWkxybDdqZ0I3M094b254RnVKRzd2aEszZ2h0WEw1?=
 =?utf-8?B?amVLb3ZNL3RVWkE1Slp3R2ZUanVuZTZicUJHT0ljbnloSEdUc0xKM3RsdjZh?=
 =?utf-8?B?U0ZXK2tYcEJPSWZnN2RDSzlWL09xTFlyR29ZNXN0N2I4NHdjS0o4TDlGSmxI?=
 =?utf-8?B?ZjZnaXBqWS9HWW9PSzdDd2NlbVk0YnkwOWdlTGxVcTRBUktLLzE1c3hlVVdN?=
 =?utf-8?B?QzRtNThOWkxLZFpSZkduckg2YVcyM0VIeWo1K0RMdjltQTk4SzN5d3IvNWx0?=
 =?utf-8?B?N2xUUUNUMGJkZUNZYVcxVklNNHpkUmQyUERnNFR2QngwQ0I3Wmk3RzNiNzN5?=
 =?utf-8?B?bHJaNzk3MlU3SUJnQUU5WnpQMEt4V1RaTU1QTDlTS0xFaFZUWjZJYWc5TEN3?=
 =?utf-8?B?ODVRRzI1cTR3YzdCZWlPc2NQdjRNK2xyenBnL1VxNmM0YTJSVndUMXBWVkw2?=
 =?utf-8?B?dnR5azNxRTlUTXVmN2NlTG9nbnZJb0dON1Zmb09qb1ZOVm53bkExdkNYU0dV?=
 =?utf-8?B?WWw4ZjRaT0ZXSG5oMDNhS2lIUlNURHlzcThmV21VSFB3blU5dzZUUS95aXRr?=
 =?utf-8?B?by8rSmx5QTRCYlVZYnZ6VkN1ZzNGRWVlYTZBWkx3bTd2blBlMlNXKzZQN2RE?=
 =?utf-8?B?SUhKSGhXaDFhVCtUb0lpekw1SzBUTXhwT2NTOFZVRjdTT0JMcUcyZStHakwz?=
 =?utf-8?B?ZGVwemp5T2w0cFR4K3I2U2dtcnU5T1ArQkUzVmZYeUlkVDFSbHBFeEwwYWdK?=
 =?utf-8?B?QjNMdkJ5dWk0cXZOQ2xSWUx4TnY0dUl4S2M5MVlqV0NyclhUREM2RmZQUmFa?=
 =?utf-8?B?eURHWjJkWkUxRmpsVFZCQWFhU0swU0ZBYTVxUjQyajQ1aGlWOTdYalFlMm45?=
 =?utf-8?B?eEEwcWJLeUdOaXpkakpMQ01RcUR0Q3BRRGJlbFBuMFErWjdWYnBZaU5pbG96?=
 =?utf-8?B?M1NYZHUyTzhISnVVNytCV3dXMklkb0p1ZDVEZmM2djNZK0thblNOODhYRXQ5?=
 =?utf-8?B?aFVXbW0xaGVJY2RtdHdER2JaSTVrQ0s3YnJ0dnNKNjZiWUZaYnBzSGVQNDIr?=
 =?utf-8?B?THhpWHZVeWRjSTV3VnRCRXoyNHR5eFZDbVhtMWlaN3RnZEozdDRHOXdoOUFH?=
 =?utf-8?B?NEZTTmJvRDVkL1BMb2hhZTQ1ek5qVXNLYTU3Tm0vRm1XTFZiVnBqZlFJWTBm?=
 =?utf-8?B?T0t5MDE2ZFNjR2doZ3d0ZkdYVVJMSm1GZWlEOU42TEtxYWw1VjRwTjJzV3FX?=
 =?utf-8?B?ekQ3Ykt3RG9yNHVlZkdEcG54VzdxaDM2MlZSTk1EcURsMmJ3NHZnNFozTTli?=
 =?utf-8?B?cmw5dmVDdlQ3d0FHS3k4em1wQVVKQVJiWkpVKzBib2xhYVdsNWZSYWllVXZU?=
 =?utf-8?B?THFYTVp3S0NqUThKMGJIdVVVOGZhSS92NVVVUGwyekdZQno0OTZNQVFyMDhS?=
 =?utf-8?B?ZnltY3cxQVVBQ0NoTTg2dkZlT3VCZnA1Mmw5Mm9WZTBidmtTRzFKVStvbnNi?=
 =?utf-8?B?ejFYQXRpaDhWekZjTElTUDhqYWluVGZjVExxOG9zdGZIb01yenJFQi9Uck9F?=
 =?utf-8?B?WTF4UjY5Y2UrdzFhcUZNTXlvT2dHb1hIbHN0akx4UzZCTmNnTzh0Yml4eWRD?=
 =?utf-8?B?WUZpNUlKeEIrbDhERnhIV1FScmJMQ1Q4S1Z6bE4wWnE5Uy9Leit6TmhFM2Mw?=
 =?utf-8?B?N05qbkxZbkZYTi9Zalp3ZEdsdVBwZ1BJYmdDMThCaDgyK3l6OEUvdDJ4MWRS?=
 =?utf-8?B?UVZEN2VPNktLbE5oYUlCdWhTRVg4MXphN0RTZzZkM0VMTTBvTnB0Z2xuR0JL?=
 =?utf-8?B?Uk9Oa1RjOXR1dGowaHRzS1hsSm1JQnVWV1NCNmVuL2VaaXNPbk56VDBHVTNC?=
 =?utf-8?B?bXZ5T25lT1B2Z1F0YXBxbytYcFZ1TGJhT0Qwd2ZkZHZIT3MvVjZLQW1FajE1?=
 =?utf-8?Q?/CgTczoCQArNFoCyN2YaWVtmF?=
Content-ID: <5FC0CBE8020C4D4EBDD1848727305349@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aaffac-cd7a-4e52-345b-08dbf24ae22f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 08:52:43.8861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPnFgjIRaD6vAWxd0HsDwSrpdxzYDm/Tz71gs8ergp7aqVbpKrsn+syHOPphqkFodhBwx5C9cUpnRAqPa9RRjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5352
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.417400-8.000000
X-TMASE-MatchedRID: nVQUmLJJeybPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxcKZwALwMGs8uj
 Rkt05a7cM2MQQW7DL3i1q48Rh4wr9dB/8y3gYF9vogGd8wIUGIIHQj6IJQ7jnU4K0IMk2m3GyU7
 XgTs6W4LW423XW2hpe8BAWEWldCkNqZddSUIrsJJNa4UOfkJSNH0tCKdnhB58pTwPRvSoXL2y5/
 tFZu9S3Ku6xVHLhqfxIAcCikR3vq8A9JfeBNzyhici3CWbCRnjGhH8ZrSdEmgpU4FNkcqP9NBcw
 dt2lLWc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.417400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3DE737D08ECC18C878B13A1327D9E583F0186D1A119A86301205BD931A6C3FB72000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_561462648.843792134"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_561462648.843792134
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7TWFjOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0xMS0yNCYjMzI7YXQm
IzMyOzE2OjUzJiMzMjsrMDgwMCwmIzMyO21hYy5zaGVuJiMzMjt3cm90ZToNCiZndDsmIzMyO0Fk
ZCYjMzI7dGVlJiMzMjtjbGllbnQmIzMyO2FwcGxpY2F0aW9uLCYjMzI7SERDUCYjMzI7MS54JiMz
MjthbmQmIzMyOzIueCYjMzI7YXV0aGVudGljYXRpb24mIzMyO2Zvcg0KJmd0OyYjMzI7RGlzcGxh
eVBvcnQNCiZndDsmIzMyO3RvJiMzMjtzdXBwb3J0JiMzMjt0aGUmIzMyO0hEQ1AmIzMyO2ZlYXR1
cmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjttYWMuc2hlbiYjMzI7
Jmx0O21hYy5zaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0K
Jmd0OyYjMzI7K3N0YXRpYyYjMzI7aW50JiMzMjtkcF90ZWVfb3Bfc2VuZChzdHJ1Y3QmIzMyO2Rw
X3RlZV9wcml2YXRlJiMzMjsqZHBfdGVlX3ByaXYsJiMzMjt1OA0KJmd0OyYjMzI7KmJ1ZiwmIzMy
O3NpemVfdCYjMzI7bGVuLCYjMzI7dTMyJiMzMjtjbWRfaWQpDQomZ3Q7JiMzMjsrew0KJmd0OyYj
MzI7K2ludCYjMzI7cmM7DQomZ3Q7JiMzMjsrdTgmIzMyOyp0ZW1wX2J1ZjsNCiZndDsmIzMyOytz
dHJ1Y3QmIzMyO3RlZV9pb2N0bF9pbnZva2VfYXJnJiMzMjt0cmFuc2NlaXZlX2FyZ3M7DQomZ3Q7
JiMzMjsrc3RydWN0JiMzMjt0ZWVfcGFyYW0mIzMyO2NvbW1hbmRfcGFyYW1zWzRdOw0KJmd0OyYj
MzI7K3N0cnVjdCYjMzI7dGVlX3NobSYjMzI7KnNobSYjMzI7PSYjMzI7ZHBfdGVlX3ByaXYtJmd0
O3NobTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KGxlbiYjMzI7Jmd0OyYjMzI7TUFY
X0NPTU1BTkRfU0laRSkmIzMyO3sNCiZndDsmIzMyOytUTENFUlIoJnF1b3Q7JXM6JiMzMjtsZW49
JXpkJiMzMjtleGNlZWRzJiMzMjtNQVhfQ09NTUFORF9TSVpFJiMzMjtzdXBwb3J0ZWQNCiZndDsm
IzMyO2J5JiMzMjtkcCYjMzI7VEEmIzkyO24mcXVvdDssJiMzMjtfX2Z1bmNfXywmIzMyO2xlbik7
DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjstRUlPOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZn
dDsmIzMyOyttZW1zZXQoJmFtcDt0cmFuc2NlaXZlX2FyZ3MsJiMzMjswLCYjMzI7c2l6ZW9mKHRy
YW5zY2VpdmVfYXJncykpOw0KJmd0OyYjMzI7K21lbXNldChjb21tYW5kX3BhcmFtcywmIzMyOzAs
JiMzMjtzaXplb2YoY29tbWFuZF9wYXJhbXMpKTsNCiZndDsmIzMyOytkcF90ZWVfcHJpdi0mZ3Q7
cmVzcF9sZW4mIzMyOz0mIzMyOzA7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO0ludm9r
ZSYjMzI7RlRQTV9PUFRFRV9UQV9TVUJNSVRfQ09NTUFORCYjMzI7ZnVuY3Rpb24mIzMyO29mJiMz
MjtkcCYjMzI7VEEmIzMyOyovDQomZ3Q7JiMzMjsrdHJhbnNjZWl2ZV9hcmdzJiMzMjs9JiMzMjso
c3RydWN0JiMzMjt0ZWVfaW9jdGxfaW52b2tlX2FyZykmIzMyO3sNCiZndDsmIzMyOysuZnVuYyYj
MzI7PSYjMzI7Y21kX2lkLA0KJmd0OyYjMzI7Ky5zZXNzaW9uJiMzMjs9JiMzMjtkcF90ZWVfcHJp
di0mZ3Q7c2Vzc2lvbiwNCiZndDsmIzMyOysubnVtX3BhcmFtcyYjMzI7PSYjMzI7NCwNCiZndDsm
IzMyOyt9Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7Ky8qJiMzMjtGaWxsJiMzMjtGVFBNX09QVEVF
X1RBX1NVQk1JVF9DT01NQU5EJiMzMjtwYXJhbWV0ZXJzJiMzMjsqLw0KJmd0OyYjMzI7K2NvbW1h
bmRfcGFyYW1zWzBdJiMzMjs9JiMzMjsoc3RydWN0JiMzMjt0ZWVfcGFyYW0pJiMzMjt7DQomZ3Q7
JiMzMjsrLmF0dHImIzMyOz0mIzMyO1RFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfTUVNUkVGX0lO
UFVULA0KJmd0OyYjMzI7Ky51Lm1lbXJlZiYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Ky5zaG0mIzMy
Oz0mIzMyO3NobSwNCiZndDsmIzMyOysuc2l6ZSYjMzI7PSYjMzI7bGVuLA0KJmd0OyYjMzI7Ky5z
aG1fb2ZmcyYjMzI7PSYjMzI7MCwNCiZndDsmIzMyOyt9LA0KJmd0OyYjMzI7K307DQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsrdGVtcF9idWYmIzMyOz0mIzMyO3RlZV9zaG1fZ2V0X3ZhKHNobSwmIzMy
OzApOw0KJmd0OyYjMzI7K2lmJiMzMjsoSVNfRVJSKHRlbXBfYnVmKSkmIzMyO3sNCiZndDsmIzMy
OytUTENFUlIoJnF1b3Q7JXM6JiMzMjt0ZWVfc2htX2dldF92YSYjMzI7ZmFpbGVkJiMzMjtmb3Im
IzMyO3RyYW5zbWl0JiM5MjtuJnF1b3Q7LA0KJmd0OyYjMzI7X19mdW5jX18pOw0KJmd0OyYjMzI7
K3JldHVybiYjMzI7UFRSX0VSUih0ZW1wX2J1Zik7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K21lbWNweSh0ZW1wX2J1ZiwmIzMyO2J1ZiwmIzMyO2xlbik7DQoNCnRlbXBfYnVm
JiMzMjtpcyYjMzI7ZXF1YWwmIzMyO3RvJiMzMjtidWYsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7dGVt
cF9idWYuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrY29tbWFuZF9w
YXJhbXNbMV0mIzMyOz0mIzMyOyhzdHJ1Y3QmIzMyO3RlZV9wYXJhbSkmIzMyO3sNCiZndDsmIzMy
OysuYXR0ciYjMzI7PSYjMzI7VEVFX0lPQ1RMX1BBUkFNX0FUVFJfVFlQRV9NRU1SRUZfSU5PVVQs
DQomZ3Q7JiMzMjsrLnUubWVtcmVmJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsrLnNobSYjMzI7PSYj
MzI7c2htLA0KJmd0OyYjMzI7Ky5zaXplJiMzMjs9JiMzMjtNQVhfUkVTUE9OU0VfU0laRSwNCiZn
dDsmIzMyOysuc2htX29mZnMmIzMyOz0mIzMyO01BWF9DT01NQU5EX1NJWkUsDQomZ3Q7JiMzMjsr
fSwNCiZndDsmIzMyOyt9Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3JjJiMzMjs9JiMzMjt0ZWVf
Y2xpZW50X2ludm9rZV9mdW5jKGRwX3RlZV9wcml2LSZndDtjdHgsJiMzMjsmYW1wO3RyYW5zY2Vp
dmVfYXJncywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbW1hbmRfcGFyYW1zKTsN
CiZndDsmIzMyOytpZiYjMzI7KHJjJiMzMjsmbHQ7JiMzMjswJiMzMjt8fCYjMzI7dHJhbnNjZWl2
ZV9hcmdzLnJldCYjMzI7IT0mIzMyOzApJiMzMjt7DQomZ3Q7JiMzMjsrVExDRVJSKCZxdW90OyVz
OiYjMzI7aW52b2tlJiMzMjtlcnJvcjomIzMyOzB4JXgmIzkyO24mcXVvdDssJiMzMjtfX2Z1bmNf
XywNCiZndDsmIzMyO3RyYW5zY2VpdmVfYXJncy5yZXQpOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7
KHJjJiMzMjsmbHQ7JiMzMjswKSYjMzI7JiM2MzsmIzMyO3JjJiMzMjs6JiMzMjt0cmFuc2NlaXZl
X2FyZ3MucmV0Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOyt0ZW1wX2J1ZiYj
MzI7PSYjMzI7dGVlX3NobV9nZXRfdmEoc2htLA0KJmd0OyYjMzI7Y29tbWFuZF9wYXJhbXNbMV0u
dS5tZW1yZWYuc2htX29mZnMpOw0KJmd0OyYjMzI7K2lmJiMzMjsoSVNfRVJSKHRlbXBfYnVmKSkm
IzMyO3sNCiZndDsmIzMyOytUTENFUlIoJnF1b3Q7JXM6JiMzMjt0ZWVfc2htX2dldF92YSYjMzI7
ZmFpbGVkJiMzMjtmb3ImIzMyO3JlY2VpdmUmIzkyO24mcXVvdDssDQomZ3Q7JiMzMjtfX2Z1bmNf
Xyk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtQVFJfRVJSKHRlbXBfYnVmKTsNCiZndDsmIzMyOyt9
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO1Nhbml0eSYjMzI7Y2hlY2tzJiMzMjtsb29r
JiMzMjtnb29kLCYjMzI7Y2FjaGUmIzMyO3RoZSYjMzI7cmVzcG9uc2UmIzMyOyovDQomZ3Q7JiMz
MjsrbWVtY3B5KGRwX3RlZV9wcml2LSZndDtyZXNwX2J1ZiwmIzMyO3RlbXBfYnVmLCYjMzI7TUFY
X1JFU1BPTlNFX1NJWkUmIzMyOy8mIzMyOzIpOw0KJmd0OyYjMzI7K2RwX3RlZV9wcml2LSZndDty
ZXNwX2xlbiYjMzI7PSYjMzI7TUFYX1JFU1BPTlNFX1NJWkUmIzMyOy8mIzMyOzI7DQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCg0K
PC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_561462648.843792134
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGludCBkcF90ZWVfb3Bfc2VuZChzdHJ1
Y3QgZHBfdGVlX3ByaXZhdGUgKmRwX3RlZV9wcml2LCB1OA0KPiAqYnVmLCBzaXplX3QgbGVuLCB1
MzIgY21kX2lkKQ0KPiArew0KPiArCWludCByYzsNCj4gKwl1OCAqdGVtcF9idWY7DQo+ICsJc3Ry
dWN0IHRlZV9pb2N0bF9pbnZva2VfYXJnIHRyYW5zY2VpdmVfYXJnczsNCj4gKwlzdHJ1Y3QgdGVl
X3BhcmFtIGNvbW1hbmRfcGFyYW1zWzRdOw0KPiArCXN0cnVjdCB0ZWVfc2htICpzaG0gPSBkcF90
ZWVfcHJpdi0+c2htOw0KPiArDQo+ICsJaWYgKGxlbiA+IE1BWF9DT01NQU5EX1NJWkUpIHsNCj4g
KwkJVExDRVJSKCIlczogbGVuPSV6ZCBleGNlZWRzIE1BWF9DT01NQU5EX1NJWkUgc3VwcG9ydGVk
DQo+IGJ5IGRwIFRBXG4iLCBfX2Z1bmNfXywgbGVuKTsNCj4gKwkJcmV0dXJuIC1FSU87DQo+ICsJ
fQ0KPiArDQo+ICsJbWVtc2V0KCZ0cmFuc2NlaXZlX2FyZ3MsIDAsIHNpemVvZih0cmFuc2NlaXZl
X2FyZ3MpKTsNCj4gKwltZW1zZXQoY29tbWFuZF9wYXJhbXMsIDAsIHNpemVvZihjb21tYW5kX3Bh
cmFtcykpOw0KPiArCWRwX3RlZV9wcml2LT5yZXNwX2xlbiA9IDA7DQo+ICsNCj4gKwkvKiBJbnZv
a2UgRlRQTV9PUFRFRV9UQV9TVUJNSVRfQ09NTUFORCBmdW5jdGlvbiBvZiBkcCBUQSAqLw0KPiAr
CXRyYW5zY2VpdmVfYXJncyA9IChzdHJ1Y3QgdGVlX2lvY3RsX2ludm9rZV9hcmcpIHsNCj4gKwkJ
LmZ1bmMgPSBjbWRfaWQsDQo+ICsJCS5zZXNzaW9uID0gZHBfdGVlX3ByaXYtPnNlc3Npb24sDQo+
ICsJCS5udW1fcGFyYW1zID0gNCwNCj4gKwl9Ow0KPiArDQo+ICsJLyogRmlsbCBGVFBNX09QVEVF
X1RBX1NVQk1JVF9DT01NQU5EIHBhcmFtZXRlcnMgKi8NCj4gKwljb21tYW5kX3BhcmFtc1swXSA9
IChzdHJ1Y3QgdGVlX3BhcmFtKSB7DQo+ICsJCS5hdHRyID0gVEVFX0lPQ1RMX1BBUkFNX0FUVFJf
VFlQRV9NRU1SRUZfSU5QVVQsDQo+ICsJCS51Lm1lbXJlZiA9IHsNCj4gKwkJCS5zaG0gPSBzaG0s
DQo+ICsJCQkuc2l6ZSA9IGxlbiwNCj4gKwkJCS5zaG1fb2ZmcyA9IDAsDQo+ICsJCX0sDQo+ICsJ
fTsNCj4gKw0KPiArCXRlbXBfYnVmID0gdGVlX3NobV9nZXRfdmEoc2htLCAwKTsNCj4gKwlpZiAo
SVNfRVJSKHRlbXBfYnVmKSkgew0KPiArCQlUTENFUlIoIiVzOiB0ZWVfc2htX2dldF92YSBmYWls
ZWQgZm9yIHRyYW5zbWl0XG4iLA0KPiBfX2Z1bmNfXyk7DQo+ICsJCXJldHVybiBQVFJfRVJSKHRl
bXBfYnVmKTsNCj4gKwl9DQo+ICsNCj4gKwltZW1jcHkodGVtcF9idWYsIGJ1ZiwgbGVuKTsNCg0K
dGVtcF9idWYgaXMgZXF1YWwgdG8gYnVmLCBzbyBkcm9wIHRlbXBfYnVmLg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiArDQo+ICsJY29tbWFuZF9wYXJhbXNbMV0gPSAoc3RydWN0IHRlZV9wYXJhbSkgew0K
PiArCQkuYXR0ciA9IFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfTUVNUkVGX0lOT1VULA0KPiAr
CQkudS5tZW1yZWYgPSB7DQo+ICsJCQkuc2htID0gc2htLA0KPiArCQkJLnNpemUgPSBNQVhfUkVT
UE9OU0VfU0laRSwNCj4gKwkJCS5zaG1fb2ZmcyA9IE1BWF9DT01NQU5EX1NJWkUsDQo+ICsJCX0s
DQo+ICsJfTsNCj4gKw0KPiArCXJjID0gdGVlX2NsaWVudF9pbnZva2VfZnVuYyhkcF90ZWVfcHJp
di0+Y3R4LCAmdHJhbnNjZWl2ZV9hcmdzLA0KPiArCQkJCSAgICBjb21tYW5kX3BhcmFtcyk7DQo+
ICsJaWYgKHJjIDwgMCB8fCB0cmFuc2NlaXZlX2FyZ3MucmV0ICE9IDApIHsNCj4gKwkJVExDRVJS
KCIlczogaW52b2tlIGVycm9yOiAweCV4XG4iLCBfX2Z1bmNfXywNCj4gdHJhbnNjZWl2ZV9hcmdz
LnJldCk7DQo+ICsJCXJldHVybiAocmMgPCAwKSA/IHJjIDogdHJhbnNjZWl2ZV9hcmdzLnJldDsN
Cj4gKwl9DQo+ICsNCj4gKwl0ZW1wX2J1ZiA9IHRlZV9zaG1fZ2V0X3ZhKHNobSwNCj4gY29tbWFu
ZF9wYXJhbXNbMV0udS5tZW1yZWYuc2htX29mZnMpOw0KPiArCWlmIChJU19FUlIodGVtcF9idWYp
KSB7DQo+ICsJCVRMQ0VSUigiJXM6IHRlZV9zaG1fZ2V0X3ZhIGZhaWxlZCBmb3IgcmVjZWl2ZVxu
IiwNCj4gX19mdW5jX18pOw0KPiArCQlyZXR1cm4gUFRSX0VSUih0ZW1wX2J1Zik7DQo+ICsJfQ0K
PiArDQo+ICsJLyogU2FuaXR5IGNoZWNrcyBsb29rIGdvb2QsIGNhY2hlIHRoZSByZXNwb25zZSAq
Lw0KPiArCW1lbWNweShkcF90ZWVfcHJpdi0+cmVzcF9idWYsIHRlbXBfYnVmLCBNQVhfUkVTUE9O
U0VfU0laRSAvIDIpOw0KPiArCWRwX3RlZV9wcml2LT5yZXNwX2xlbiA9IE1BWF9SRVNQT05TRV9T
SVpFIC8gMjsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo=

--__=_Part_Boundary_006_561462648.843792134--

