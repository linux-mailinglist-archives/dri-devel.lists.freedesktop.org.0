Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BF88F592
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 03:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D69110E668;
	Thu, 28 Mar 2024 02:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="a5/4n3Th";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iBJxC04l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EE910E668
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:52:55 +0000 (UTC)
X-UUID: 4417d0e8ecae11ee935d6952f98a51a9-20240328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pwE2MQEpou5hl+G+/2Dt8lnuI831wnGSp2ubxNeNWcM=; 
 b=a5/4n3Thv2Slega8pVSbh9fnr7/4AM+LyTRDxIDrhiHUCf/gYilYuEGAKvVX9Ln3QmNlgnF17z08bubnh0qc4Zpun19LPow5QWfr8FON0X5f+/rSCaR2xa0e0ggB7carq9+Q+VKXf4an92H/QMLUQhBzubFRw4ijVlG3c77PJ7A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:274a1270-8715-4567-9f1d-2e308f385cb0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:109e8585-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4417d0e8ecae11ee935d6952f98a51a9-20240328
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1198741759; Thu, 28 Mar 2024 10:52:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Mar 2024 10:52:49 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Mar 2024 10:52:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWeO9syU8SYPgjlnPjL4YcG/HN5Y34TybRcMmxSynUL865sEDQ5i5Eb6aqQ1LWH9suP1vivCIobJ8UWAW5x5zuZoHnX3tN+S3C76rvq/A6zZryP2/KNoLIOlLCU4YT12c2GiTAYf9PldhAGpU06biHr8MgNi6oBkkcHN104sEWuvh8gIwVl00PdwhnddBCqYpPBVtjhgDihv6EY3G9i1hdvzo3Qi+m/J1Lt2R1f7rmdlk/rTHCnPBKrqoruBpOl9FJgLLv2R6Pbe8r4gyh+f/7qYsB6L2u82SkkbllVhUlyYepVASAWD5dDNBQk7W8ms7wgalEc8pobwprOKXTUcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+QnnWoNN8lN2XdEvwkfpFM+MzDT+9PfJIuKxcTaPkc=;
 b=CGIrfcOIwh3q0joEKZgtzSFgYDfZCvo8FKm5zojUy6hHRWD8p5xI2/t6dCsmOTmxKjDTEnzN1y1LHKPKYqZUP8bDk1eRUN9lRle1xbG1n+hUFWHuidj95Nbc3RgwiHvku2uai3e9EYX8Viwl5u1j9Fmym/2BS47CcgcNxZy3RNiTv2fpL1i/NmY9VtTej8lOJnnDrH8re+Tjfo7G3IU+B4TNVHuW3GIBcEes3eMXepryPZnWLyOaOOEe7qiyC0dQG0YCB+QftpjxptSnKDVEDhe9/zguVtYkHHD+BPp5dudf2Yo/Lq/Ln0eJkUQgpw9+sKSsvJ+JbabwOXgx7yNB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+QnnWoNN8lN2XdEvwkfpFM+MzDT+9PfJIuKxcTaPkc=;
 b=iBJxC04lurbG7w0KHMAn8czgiphUsYV3OX8gQkcjgqOReS8klC50rSIVyez2fgSy6sNtG6k4Sdv3r7cMLZgzRWNT2dC75nUGC6rkOnnwX8KvYW/2QXxcqzQqaGetIYxZ+ZV55iKX26bL29Gz9YK3x9EWxftRwhj4LXPZiqUQqD0=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB7674.apcprd03.prod.outlook.com (2603:1096:400:426::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 02:52:47 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8031:ae41:afdd:d0a4]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8031:ae41:afdd:d0a4%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 02:52:47 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 07/14] drm/mediatek: Support alpha blending in display
 driver
Thread-Topic: [PATCH v6 07/14] drm/mediatek: Support alpha blending in display
 driver
Thread-Index: AQHafBntLyISVSK1Jk6jUuOtPIloGrFDgMsAgAj9CIA=
Date: Thu, 28 Mar 2024 02:52:47 +0000
Message-ID: <8ace5f5e5039b8f0a314f92ed083baff7021c379.camel@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
 <20240322052829.9893-8-shawn.sung@mediatek.com>
 <d170ccc1b2e6275cfc6df32f90d2c1b11295f019.camel@mediatek.com>
In-Reply-To: <d170ccc1b2e6275cfc6df32f90d2c1b11295f019.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB7674:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwjmH0LqnQh970w9XTAYRiEU8e3WdYZvqO3l8jXKadfveT3F8iLwsG+wM3oFa7ePPUz8pD5nMlI+gcWqxYjNZjdvWvVgzdOlCi53ARhMNOF832zHuczKXlN1QqZ2lqHFkkLwibGuEVf63QWo3062MRwYPichgrgtdKr2OzLkFbNM8O8zl9q/wbh1CSQDkLKWN75BD/OI8q0cphuZAdFpCmJpOE+yfHK0riGMTW9sVN6iIU4Arr+DyVnbwgjgY/pRouzFbzCaMhSZZh0bHFtib+Spk5wJRchJONGs3nbcFsZ3Nv7kS3ZAleh+W22JZMiBM2+lLlPfsqgy9ArFhDBJXw7fVBTP+NSzRYmDe1bGGPdDctoKVcuPEGSfHrRh/Ne8RPbERV723Cw8E8U8XM9E3i7t0+LrlBpPqsd20UB/1hYbsmMhW6VJmtggXrT03XB9BHTEOfwNVcF0v9JNK/UeDv2fsQUd2spqCkvl2zSfgwkg/ry91aodzKzhlunzRtRxKqe4VH/12SjzTYrP2h92upTrbG8DxzEu/CUbln2nviy0OL+Wi/O4jGvgvdqMAd/hBUE4Lcw5KwBHp/kyti2CW8Tx7JMxnVKyYv34HMxdgqhmvl4ntn5+wM2l1OMts0VeS+t/NUr0ftCpzxlpMKT9GWQrd8qUMJVZagT+oOuGiXI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWhmSWlPWWRjN0VYelYzRUdLOERJbHRrN0NFVHFyVkZhNk1GOTBUZnhVYm1J?=
 =?utf-8?B?VS9SQVl6d3Roam5iSGtTSWdNYkFRTFBqQ29sM2REMXJBOFVhVFpoc0pDRGlm?=
 =?utf-8?B?ODl5bFNoTXh6dEo2UHpTNXE2L0Zmc0Y0WDNGSVlPNVVmTGkyaC9tODFIOUZL?=
 =?utf-8?B?c1Y5R3U2U0NGWDRjOXVkdFpCMEx3enVOc1JZUitOMnN5WU02VC9pSEhidE5D?=
 =?utf-8?B?U2h4cGV2OEZrU0lTSEMwRkhLV0NKOHh5UHIvbzZKN1RSZkpZS3JMeEVBcWdo?=
 =?utf-8?B?NjVkOGhESERaczBBUDF0K25OQ2RDL2hTN0FXMXpJVUVkdE12MHFWNXJMdlNv?=
 =?utf-8?B?NHNwSktzTGtGRFJmajd0V3Q2RlJ3MVdET254ckt6clo0Q2VYYkpwS2xGbWVG?=
 =?utf-8?B?QmtadWxJQnVUZFRVRFNnS3VkREV2RU0yR2ZjNWF5OW9qUVMwOU5CYW55cWFH?=
 =?utf-8?B?RlJHYlEvNldtVmZiUXY2a09EbUhWTWVURnlpNC9udE0za1Y1WHhjUnlKYkUz?=
 =?utf-8?B?WTNoVkowVjJBMkRQbUlodkJWWElGeUp1K013TEtlZzJ3dUZCYktPcUtXMytI?=
 =?utf-8?B?OGhZRHlLZVk5NGljbDk3MFdkY2FMRzlORUIyUHZBMDI1Ym9GSk05QWFtbU0w?=
 =?utf-8?B?QlRLV2ZZeWx6UzAwWkdUZUdDWTdiRVJKQVFxVlMrb0syZU1uRVJWbzlFY1Bn?=
 =?utf-8?B?UHBHRjB1WTk3dGNvdU1KWUVXMndvSlVteXJ3aWJGdDZubHE2VE4xMUZmbkpY?=
 =?utf-8?B?enN4d0NQQUlreDNLSkx2dnRDdS96a2NwZmRTNVlQVGJENFhWTDZUUU9lb3Jr?=
 =?utf-8?B?T1hnR2F2NUpLZTQ0WFZGZHI3dnFwaUxQZVl1S0RpMktVbVJmODhCNEIxK2ht?=
 =?utf-8?B?SnJpWFlqVWNZRjJkWGlDWkxMODJqOVZlZHhxcHJjTHI5cVhrd2lSOWxSek5m?=
 =?utf-8?B?WFhaWEJUZUpWN1ZaRHNZU21vY3NqdWdYQXk0MSt0NVI2N0o2VEtSUzNZa2wx?=
 =?utf-8?B?aEVSRXBhVWtNWU1ySHZLZXUzRi9WamVneW5mOUthLzg4S053NCtDWHNYK0Uw?=
 =?utf-8?B?ZGhmSWloaUUxUjYreVJLY3dzQmNlcVZBbDdGUllPNE05b3NkS1RnbFNJMTly?=
 =?utf-8?B?ZktaVVVyMnBtMGhsTUVFclIybUpqVVJuMWo2T3FlejIzVzRrQlFRQ0tUMmg4?=
 =?utf-8?B?VjJLRHlxaS81UU9yT05qSjJvMmZ6bEc2VjJYcWxrVXpDOTVNeU9Camx5b3d6?=
 =?utf-8?B?dUM3clFXTDBTa3BpMUtCc1R4K2tobmxMTmNzRXJhMHJRVFE1b1BoQk9yaEJm?=
 =?utf-8?B?OXZNOGl6azA1Z3ZIc01BaXoyRXhVYzJyTzFYbHp2OEpZN3lKcS9XYWxPano4?=
 =?utf-8?B?TUExZ0p1Y0FyaFpMbnNwZFFuL3RtRnJnWHFRVGNiQlYxQTNJUXFWUlBRMVBX?=
 =?utf-8?B?ellQTk1rTVpYOHBnMlNSMTE1cnd6TW9lSXJGZjBuVEZuRnc4YXc2cmcwSnJY?=
 =?utf-8?B?UFo1TFRTWUdRdVg1Sm5FYXJQOE9Cd3VmV3dobUU4d1VDWmdjV1pGUkVnVWJy?=
 =?utf-8?B?SHlrbk5CNzhJeURBdG51Yk9LbW5mdUE4YktnTVNtOGYzM29ZbkdDa1drZ1Vk?=
 =?utf-8?B?OC9hWWUxeks3RFR6ZUlqT3hEcWxjb3ZTNEdCOVlnNEhUL0JBL1pTUE8xWUU0?=
 =?utf-8?B?eUhmTEJXRVNPYVB1elZ5cWtySHo4amI1dldLdjNNQTlzbWFaUGl0bkF4UFda?=
 =?utf-8?B?Qk5YYkJkQzFJdWVhOW11YjJqTVdEdHdkcGhwcHdVaE5iL0h3dGxjYU5UZ2xN?=
 =?utf-8?B?cHpXRFB3MWxPSzZIMy9wRkw4aUJkU0x0aGJjN3YzMmErRGNCUVM1cUF4QUJ0?=
 =?utf-8?B?Yk9PRENuZEhSS2Y3QXBTZlJUby85emswNEtmWStFZ3RoZlpnODUzRHNva3hK?=
 =?utf-8?B?QUZldHJJMlY2NVZCekxwVksyVDVacGt1VDdrM05nSmUzT05zU0NCcnJXVW9N?=
 =?utf-8?B?YW5WaWVhZG1BcXBDcEhuMzcyUkZueVdUY0p3NDhlNjhTRTdpMkF5WG9TOEpn?=
 =?utf-8?B?L1BaZ3FKaDMzY0NvSmpNMzZKR2s2dHRKeHZtSVFzK1hCcUo0UTgyLy9XL0Fh?=
 =?utf-8?B?TkVjaVRHYjNOZEt4OWJtdnQzd29mT3hwZ3ZON2hzVUtCUTI4RlB6emtvV0Zr?=
 =?utf-8?B?Wmc9PQ==?=
Content-ID: <E38DE9230EDDBF46A9699629595B5FE8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112c8a8f-6e75-4e46-7751-08dc4ed2268b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 02:52:47.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOewYkaPq09PaYEJPMqWSLYuqeEmGz45/uPUFpjOSelwbO9lqym+IZDUu8llcid/q74ym2naiBbfmnhnqxqidg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7674
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.980200-8.000000
X-TMASE-MatchedRID: BFQSNthdAqLUL3YCMmnG4ia1MaKuob8Pkd8i2lgND8vYgrGDwuFJdtn7
 b/+Y15Iv2aE5ctzxluC0hbf/1vHT6irtEu4khs6L7spMO3HwKCAL8TGleseLPPt592eq2xoTyU7
 XgTs6W4IhJ/ufappeEpGTpe1iiCJq0u+wqOGzSV0LbigRnpKlKSPzRlrdFGDwnZPujXTsnepB6T
 6eWjOMszNNXhysVCCe3qURIMThdjvIWq6FUoB6/A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.980200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 610308F26FEC8D2CAA2F0CC3654FB64251BFBCB1805B42B17511860DC54BDFDB2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_581523823.1871103672"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_581523823.1871103672
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIEZyaSwgMjAyNC0wMy0yMiBhdCAwOTozNyArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfcGxhbmUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jDQo+
ID4gaW5kZXggMTcyM2Q0MzMzZjM3MS4uNWJmNzU3YTNlZjIwMiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gPiBAQCAtMzQ2LDYgKzM0NiwxNyBAQCBpbnQg
bXRrX3BsYW5lX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiBzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSwNCj4gPiAgCQkJRFJNX0lORk8oIkNyZWF0ZSByb3RhdGlvbiBwcm9wZXJ0eSBm
YWlsZWRcbiIpOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiArCWVyciA9IGRybV9wbGFuZV9jcmVhdGVf
YWxwaGFfcHJvcGVydHkocGxhbmUpOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQlEUk1fRVJST1Io
ImZhaWxlZCB0byBjcmVhdGUgcHJvcGVydHk6IGFscGhhXG4iKTsNCj4gPiArDQo+ID4gKwllcnIg
PSBkcm1fcGxhbmVfY3JlYXRlX2JsZW5kX21vZGVfcHJvcGVydHkocGxhbmUsDQo+ID4gKwkJCQkJ
CSAgIEJJVChEUk1fTU9ERV9CTEVORF9QDQo+ID4gUkVNVUxUSSkgfA0KPiA+ICsJCQkJCQkgICBC
SVQoRFJNX01PREVfQkxFTkRfQw0KPiA+IE9WRVJBR0UpIHwNCj4gPiArCQkJCQkJICAgQklUKERS
TV9NT0RFX0JMRU5EX1ANCj4gPiBJWEVMX05PTkUpKTsNCj4gDQo+IEFmdGVyIGFsbCBzdWIgZHJp
dmVyIHN1cHBvcnQgdGhlc2UgZnVuY3Rpb24sIHRoZW4gY3JlYXRlIGJsZW5kDQo+IHByb3BlcnR5
LiBTbyBtb3ZlIHRoaXMgcGF0Y2ggYWZ0ZXIgYWxsIHN1YiBkcml2ZXIgc3VwcG9ydCB0aGVzZSBi
bGVuZA0KPiBtb2RlLg0KPiANCg0KR290IGl0LiBXaWxsIHJlYXJyYW5nZSB0aGUgcGF0Y2hlcyBp
biB0aGUgbmV4dCB2ZXJzaW9uDQoNClRoYW5rcywNClNoYXduDQo=

--__=_Part_Boundary_003_581523823.1871103672
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7RnJpLCYjMzI7MjAy
NC0wMy0yMiYjMzI7YXQmIzMyOzA5OjM3JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlm
ZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzE3MjNkNDMzM2YzNzEuLjViZjc1N2EzZWYyMDIm
IzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0z
NDYsNiYjMzI7KzM0NiwxNyYjMzI7QEAmIzMyO2ludCYjMzI7bXRrX3BsYW5lX2luaXQoc3RydWN0
JiMzMjtkcm1fZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7Jmd0OyYjMzI7c3RydWN0JiMzMjtk
cm1fcGxhbmUmIzMyOypwbGFuZSwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7RFJNX0lORk8oJnF1
b3Q7Q3JlYXRlJiMzMjtyb3RhdGlvbiYjMzI7cHJvcGVydHkmIzMyO2ZhaWxlZCYjOTI7biZxdW90
Oyk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtkcm1fcGxhbmVfY3JlYXRlX2FscGhhX3By
b3BlcnR5KHBsYW5lKTsNCiZndDsmIzMyOyZndDsmIzMyOytpZiYjMzI7KGVycikNCiZndDsmIzMy
OyZndDsmIzMyOytEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkJiMzMjt0byYjMzI7Y3JlYXRlJiMzMjtw
cm9wZXJ0eTomIzMyO2FscGhhJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZn
dDsmIzMyOyZndDsmIzMyOytlcnImIzMyOz0mIzMyO2RybV9wbGFuZV9jcmVhdGVfYmxlbmRfbW9k
ZV9wcm9wZXJ0eShwbGFuZSwNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtCSVQo
RFJNX01PREVfQkxFTkRfUA0KJmd0OyYjMzI7Jmd0OyYjMzI7UkVNVUxUSSkmIzMyO3wNCiZndDsm
IzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfQw0KJmd0OyYj
MzI7Jmd0OyYjMzI7T1ZFUkFHRSkmIzMyO3wNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7
JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUA0KJmd0OyYjMzI7Jmd0OyYjMzI7SVhFTF9OT05FKSk7
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0FmdGVyJiMzMjthbGwmIzMyO3N1YiYjMzI7ZHJpdmVyJiMz
MjtzdXBwb3J0JiMzMjt0aGVzZSYjMzI7ZnVuY3Rpb24sJiMzMjt0aGVuJiMzMjtjcmVhdGUmIzMy
O2JsZW5kDQomZ3Q7JiMzMjtwcm9wZXJ0eS4mIzMyO1NvJiMzMjttb3ZlJiMzMjt0aGlzJiMzMjtw
YXRjaCYjMzI7YWZ0ZXImIzMyO2FsbCYjMzI7c3ViJiMzMjtkcml2ZXImIzMyO3N1cHBvcnQmIzMy
O3RoZXNlJiMzMjtibGVuZA0KJmd0OyYjMzI7bW9kZS4NCiZndDsmIzMyOw0KDQpHb3QmIzMyO2l0
LiYjMzI7V2lsbCYjMzI7cmVhcnJhbmdlJiMzMjt0aGUmIzMyO3BhdGNoZXMmIzMyO2luJiMzMjt0
aGUmIzMyO25leHQmIzMyO3ZlcnNpb24NCg0KVGhhbmtzLA0KU2hhd24NCg0KPC9wcmU+DQo8L3A+
PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_003_581523823.1871103672--

