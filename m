Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25277CD280
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 05:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2353110E35D;
	Wed, 18 Oct 2023 03:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EED10E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 03:07:03 +0000 (UTC)
X-UUID: 6734ee466d6311eea33bb35ae8d461a2-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Pcl7oEYuEl4KfOfZDXcACXyYbHAp76nlqtQmPOeDQoU=; 
 b=F82oar9kwAMvM3yrSNNpfKc8PjM310sObiAOSuqWfIbjdw6OU3jk6m6dVzgv3WxPcWrG1gqf1CPMYVgR09QWa0zxGVzBG+QuL0xTk+aik14anzFFjcoctRpvA8PMPEXwv0gHg2fd8e+21DGsxJLDIqj0IPeiVz01HsoEFopcrxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:11fc88ef-5d3f-4907-a016-1d076f452e20, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:62f10ec0-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6734ee466d6311eea33bb35ae8d461a2-20231018
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1701527424; Wed, 18 Oct 2023 11:06:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 11:06:58 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 11:06:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKpuDKCKYPBd0WZGrUB/lFj6D3FFNYFM2i36up8lUV3nTDBjNjSlfb5IyQtmOCHAph4aH5s4ItYhnocsMjUlvwsCCId+qAhYOPUhE/DdjL+u6bKSQH1ULhO2sM3faqwLeOa2AXcS4BlvYHlr4HQ8uB7lh2RImAt2VFeqtvTNO+PgcTPAo/amh5FDaQUJxeyWjZvCu6aq3wu+uLLVIdoKGHauosndQYUM4NA8Yf2kxIfQCNn4SYwqmdNcxw8MuB2MXz61BjmG2wNBu2v3MK1Liv9V9J/xFMPA19DnRFOdFZXZ2hC4szuXY8pltPgCYww+Ry6vl/9JslhAwRjk2v5SpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pcl7oEYuEl4KfOfZDXcACXyYbHAp76nlqtQmPOeDQoU=;
 b=jXucJTRJO128s4+gfMoXeyRGt83iwipp788ptjpwYdB36+pQ1GI/E/Wqg3Dq3jiP4YLwgZZab6U8PiRMTUdcq6GtDZHFuJ7XdERhHjnS/qSgCJgWSHDSNQyxcMNmZ+QmypuSB0jp1vtmfdIu84MtkRrntGbh+Gpd0wx2xVc/37rIB+1zA2jWhwSR8pNbU0X6T68ZUIP6ubPiERydfd6g1fjuEyBe6F7I2DjJkjvOq7Fkit3vgu8zB/9oZp8l+GpXHIzAf+z/emZTN8yPRrsq3mYuGjO/lxtYbfoB272VNcjRsmWsP9XNUzt++bmzp2O1OeSMP6ov/27pGteRKBAN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pcl7oEYuEl4KfOfZDXcACXyYbHAp76nlqtQmPOeDQoU=;
 b=A0rMolI+5OmvK0zMNBtDuv06//S4I+oyV74s7MEGaccRSPycZtThoyzFugwqert322lkV6//5Na3US/zRoIv7xGQPFjh/GxyeZOfJ80HPHVcF8mI9JT3PEKdU8ntf8z0q4URlDPFZKcgXRG4KdAEtGjKHXCgkTG8NgTIcP0uKFI=
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com (2603:1096:4:17a::6) by
 TYSPR03MB7306.apcprd03.prod.outlook.com (2603:1096:400:414::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 03:06:55 +0000
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::a001:6b8f:9f59:31d7]) by SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::a001:6b8f:9f59:31d7%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 03:06:55 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Thread-Topic: [PATCH v7 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Thread-Index: AQHZ/OfdryCp2vSJfUeOrv6EqonmHbBHSBKAgAeeaQA=
Date: Wed, 18 Oct 2023 03:06:55 +0000
Message-ID: <324f170c69387c5587688ae7bee5ddf95bc94576.camel@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-3-moudy.ho@mediatek.com>
 <0e972a0a-af27-4837-a80c-cbab0002d368@linaro.org>
In-Reply-To: <0e972a0a-af27-4837-a80c-cbab0002d368@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6343:EE_|TYSPR03MB7306:EE_
x-ms-office365-filtering-correlation-id: b2848955-fa26-4a87-ef97-08dbcf8748e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yk2KehSLgNFD5zcQyG2n/48SdG9W1A54CF97kWx29CJilXmNtM5d16VObh6z14Nb3Ae+R0Rg4s/Lj4okCd15FUL9agyeeGRFzot1y4rrkY43/hnh3/ee8GpvUKbwpRrq6rLATF3ntVTQfvTXOT0cGnErE/FzMQshgITyBb4NW0Zl/ILvRtQNy9AKDzn+hG+P4WPZwyQA1NfCIBtAHWOrWxq1S5mepaduwb2wBCcP3M5myrLDWhoLz4ruw89cSEKgiJqgMvqhwfDItmNwRt2muPoKKz4aabjsd+l1oEaRH5Gsud3K2Q0mGmK9xr0lpye44maiUYOjjdPreDhPBHQvvuCDAUShDDD/zBvdvGd1nZm3BFQ8+mKE9PBjci42v1jXLYWRcFO8J7osfbpc70et+QLvbG+Z08HIlrsDTV4AELPDy8YVc6icyxoYsN7Xur9d+npL9f7kRrvOY4zIx6QIfBnUT/BxNLsa8V08vejRpOijYrqxsQjJuJRYUQzFdTBi/4lWixAPaumSqecAkw1VQilrt0kNzjro+0SXdpHUbeH6+qTYHSJuR1BWzYJmSNJHeyS9xP0xi2H49/2w+Axjc09t1SSFxLoTuEHxU3pHWadN7CgIQvgQoV9sDU+qVb4iEKlaYtigP489wGDXE7uhNVfni9RxbqsmGLk6IHmKDRCFFK1UCJkoa3JXbAMyohMX4tLM/V1C88K+fAZDz+Zfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6343.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(316002)(6486002)(91956017)(76116006)(66446008)(66476007)(66946007)(64756008)(54906003)(110136005)(66556008)(508600001)(122000001)(38100700002)(85182001)(921005)(38070700005)(2616005)(26005)(86362001)(71200400001)(83380400001)(36756003)(53546011)(6506007)(2906002)(6512007)(7416002)(4001150100001)(41300700001)(5660300002)(4326008)(8936002)(8676002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2pVRXFobmRvRkNWSXRVMGU0cnAvbm0xRWI3RkQrV0cvZkZZbHBocXV4WlIy?=
 =?utf-8?B?QVpOdldlaVV6Mms3RlZBZXN5VXZsMXB0NXM5Z05DSGg1YnlDcWc2UVBFWFB3?=
 =?utf-8?B?b1FUcnNGVzczcWtNZGJMRTE4Mnc5SVdqcE05bkU2NzVqVDd6b0ZjODZRRm5L?=
 =?utf-8?B?VytibnlCQ21tOXZkSy94Sm1mVW81V0VTVmUveGl3UyswdDlNYjNxdDRET1U3?=
 =?utf-8?B?WHltTzA1UDlFVFJSSXZwelhMbHB1bE1tc3B2QTJ4UVJ4N1RtaUlTTzJHVlVO?=
 =?utf-8?B?UDdrTGlucm9FczYwNjRSMkFQNmdyQmR1ZTFXejBCN3lCc3hqTFZxQkI5STUr?=
 =?utf-8?B?dHlRVStUZy9YTGJlY0dmQUJPa3d0YTlmSnRWYkNSZlBhVGdrNzVOQlp2a1VB?=
 =?utf-8?B?SXRoVU95Y0pGNklKcjBEV1VsSXdMalVGblhLUE9jWlI4SGJzdzZoYnlING9O?=
 =?utf-8?B?ekZKUEhPaFNmejhtQ2IzMEF3d3hQcUQ3Z2REOW1sWXFXK0NVbFFpNzdRMkh5?=
 =?utf-8?B?LzBwZWRRYlV3Y2F4NGlnL3J5ZnVzUGxNamNXVlBvM1QrK1FzV0swUDN6Q3hq?=
 =?utf-8?B?amxESHpnTlhHZEttQVorR0hGVnFhSWR6VnRLaklTUDV3S0dnU05PVmw0VWlW?=
 =?utf-8?B?eklsQTM2TEhwNlNoTjd2RWxCZGh4L0tKY2ZGNTAva1RIUDJMaDlxT2dsMEtS?=
 =?utf-8?B?dVV2Ty9oWkRaQy9KZDEzVmEyVmE4YUpCSVFsMC9NT2MweTBpU2xqdFE2bGk3?=
 =?utf-8?B?T0p3S3diRUlvL0pXZjF3M1dPSk5GNWRHSldnOE5KR2k1MkFQaWVjcjUxWGho?=
 =?utf-8?B?YXN6N1VoN2RCYmRCMTI1c3Uyd2VCeEVGbHVING8rdGNKZmJWOGFsUW5rL0My?=
 =?utf-8?B?Z25MdHByN2lJcjZ6L1RldEo0djdHUE9Fb3FnRDVFOXAvR0R4dTlMSFlldzRn?=
 =?utf-8?B?TytSVW1zcmtCWUJFQTRZTzRDYTBGY0loajNXZjFVNDQ0T0dPMjBFaHlJNlRQ?=
 =?utf-8?B?Zld1bmFtV2ZGR3V0U1VyUlBkSlM2SjY0S21tcWJIa3IvWDRhUkdZMzVHMnpv?=
 =?utf-8?B?M0JBZTNJTXRSQ1ZwdVdZbmZWcHU3bzRYSGJyVFZVd2tnMHZscE5NRFpsZ2dx?=
 =?utf-8?B?RUhHZWlmZjA3bXRtUlEwVi9SSjUyOFlxTkM1bWRMYyt2eUNoSm5USUJ4c0dR?=
 =?utf-8?B?VGY5UGE5Q0NwZzZ3Y2ZSTzhtN0g3RDMxMW9rb0V1MTZzMVI3RC9kWmtXSFow?=
 =?utf-8?B?R01DdFF1cldTM0htZ2RSZnp5SU4rem92cGpjTk9pMEdNd2lVSzZYZi9acml1?=
 =?utf-8?B?N0o2WnVoc3pNdEptUUgyaGlUWWZKcFc0TVRaT2FUdmhvbm5YMFdWeTlnOGVF?=
 =?utf-8?B?eS9mMnhxVmgwcmZ6ZlZoWVNVcEUzVnVHbzBVYUkyc2ttYTBIVTBJRVJRZmxF?=
 =?utf-8?B?MWcybWJyeGtBRDF3VkQxbzROOTZLOE5mT2VmczlvVTQ0dTRmREwrckNRdnc4?=
 =?utf-8?B?akc0NVRDSEJ3enZjd1VJTVRYbVQyVkMrc1N2d3RBbEV4dlllL2daVHlTc29w?=
 =?utf-8?B?NDdxMjh1TGFONzFVcWhsWlllK0ZpV3ErSXpSdWtCanloclA0d0lQQ041cmdr?=
 =?utf-8?B?ZnA3ZzZLYkxVdStDSGJVV0pXZFBSbTRqYVIxOEhRWURvZDNKQlEzZ2l3Ujhy?=
 =?utf-8?B?VUg5VTgrbHR6VnN4Nmhmd2V0SGFydEl5K3JJMlhhdGtmbmlEdGQ2TnpDMXEw?=
 =?utf-8?B?eW5yMUxBMC9XTFBld1IxZ0ZRbnZJTEJMemp2NHhoN0lKTWozdGdwSmNGUEIw?=
 =?utf-8?B?SU1CUUxpdDA0TkRmS1F2eUYzL1RKZkxZYk1YOXdrWkpNaEEvM0dZbzJ0bkFq?=
 =?utf-8?B?SEoraXozMVo3UG1tMUxKUGxpRUhmYzI1eFI1TnVkU2M4ZGtOWVFIdlB3cngy?=
 =?utf-8?B?ekxsUjNZWVdaVjhreWljQ3dXdERHVUJZRk92UTZaTFlrVVMwVm45QWZnQzFE?=
 =?utf-8?B?cmNBRnluY2o4TnVxQm5oYWJjT3UwZldqNVlzeGVTNTdVSjhtRUFoVDNWL29a?=
 =?utf-8?B?eFgwUnNaN3cvRHpxaG1GS0ZQZUhRRFFTUGxLVTVDRFFBcjlVM1RHNWc5VHFy?=
 =?utf-8?Q?beo4JYrHdDyK2eyXyJ2gChreg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51D2561126D6AC47B86D5E8B5DCC7702@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6343.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2848955-fa26-4a87-ef97-08dbcf8748e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 03:06:55.3326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1OY8poR6vZQl8dWbUvPU6cPJ9eZf1km1te8J5wbG5NXNV1A2micwwnASQWYeT5ECsX+FRCG5xVnHu5oa0Y0Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7306
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--22.949700-8.000000
X-TMASE-MatchedRID: Y6GLOewO+JjUL3YCMmnG4ia1MaKuob8PC/ExpXrHizwzFWOYrWw6A2U3
 2iueu2qCfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+Cx+Mk6ACsw4JtzOQo7mTgA+kWx
 lYwMcCHs0I6tvv/X3qnZZam/y4zv5OXJUfyM1K01swYo64ufkVZWr6iSXWtgPmJxnCO+EnWd576
 my5IxjutMXiMahVA63Kt5gnPe/N6l/G9eO50lO1p4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
 QCUU+jzjoczmuoPCq2UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--22.949700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2036ED7646EC7D99BEB57D6F3B2B1123BA167A3E6E0BCEFD7FF5C9F73D399B9C2000:8
X-MTK: N
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTEwLTEzIGF0IDA4OjQ2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCg0KSGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIGFzc2lzdGluZyB3
aXRoIHRoZSByZXZpZXcuDQoNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhl
IHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIE9uIDEyLzEwLzIwMjMgMTA6NDAsIE1vdWR5IEhv
IHdyb3RlOg0KPiANCj4gPiAgDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAg
IHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNv
bnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBjb25zdDogbWVkaWF0ZWssbXQ4MTgzLW1kcDMtcmRt
YQ0KPiA+ICsNCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAg
ICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICAgIC0g
ZGVzY3JpcHRpb246IFJETUEgY2xvY2sNCj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjog
UlNaIGNsb2NrIChzaGFyZWQgU1JBTSB3aXRoIFJETUEpDQo+ID4gKw0KPiA+ICsgICAgICAgIG1i
b3hlczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0
aW9uOiB1c2VkIGZvciAxc3QgZGF0YSBwaXBlIGZyb20gUkRNQQ0KPiA+ICsgICAgICAgICAgICAt
IGRlc2NyaXB0aW9uOiB1c2VkIGZvciAybmQgZGF0YSBwaXBlIGZyb20gUkRNQQ0KPiANCj4gaW50
ZXJydXB0czoNCj4gICBmYWxzZQ0KPiANCg0KQXMgQW5nZWxvIHByb3ZpZGVkIGFkZGl0aW9uYWwg
Y2xhcmlmaWNhdGlvbiBpbiBbMTUvMTZdLCBleHBsYWluaW5nIHRoYXQNCmNlcnRhaW4gY29uZGl0
aW9ucyBpbiBbMi8xNl0gYW5kIFszLzE2XSB3ZXJlIGludGVudGlvbmFsbHkgb21pdHRlZCBkdWUN
CnRvIHRoZSBuZWVkIHRvIGludGVncmF0ZSB0aGUgc2FtZSBJUCB3aXRoIGRpZmZlcmVudCBvcGVy
YXRpb25zLg0KQXBvbG9naWVzIGZvciBhbnkgaW5jb252ZW5pZW5jZSB0aGlzIGhhcyBjYXVzZWQg
eW91Lg0KDQo+ID4gKw0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAtIG1ib3hl
cw0KPiA+ICsgICAgICAgIC0gbWVkaWF0ZWssZ2NlLWV2ZW50cw0KPiA+ICsNCj4gPiArICAtIGlm
Og0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4g
KyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAgY29uc3Q6IG1lZGlhdGVrLG10
ODE5NS12ZG8xLXJkbWENCj4gPiArDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0
aWVzOg0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsg
ICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBSRE1BIGNsb2NrDQo+IA0KPiBtYm94ZXM6IGZhbHNl
DQo+IG1lZGlhdGVrLGdjZS1ldmVudHM6IGZhbHNlDQo+IA0KPiBJIGFtIG5vdCBzbyBzdXJlIGl0
IGlzIGFjdHVhbGx5ICJzaW1wbGVyIiB0byBtZXJnZSB0aGVzZS4gVGhleSBhcmUNCj4gcXVpdGUN
Cj4gZGlmZmVyZW50LiBZb3Ugd2lsbCBlbmQgdXAgd2l0aCB1bm1hbmFnZWFibGUgYWxsT2YgIHdp
dGggYSBsb3Qgb2YNCj4gYnJhbmNoZXMgKHdoaWNoIHN1cHBvc2VkbHkgeW91IHdhbnQgdG8gcmVt
b3ZlKS4NCj4gDQo+IA0KDQpVcG9uIGV4YW1pbmluZyB0aGUgbWlub3IgaGFyZHdhcmUgY2hhbmdl
cyBpbiBNRFAgZm9yIE1UODE4MyBhbmQgTVQ4MTk1DQpSRE1BIChbMy8xNl0pLCBpdCBhcHBlYXJz
IHRoYXQgYnJhbmNoaW5nIGNhbm5vdCBiZSBhdm9pZGVkLiBIb3dldmVyLA0KY29uc29saWRhdGlu
ZyB0aGVzZSBjaGFuZ2VzIGhhcyB0aGUgYWRkaXRpb25hbCBhZHZhbnRhZ2Ugb2YgYWRkcmVzc2lu
Zw0KUm9iJ3MgY29uY2VybnMgZnJvbSB2NC4gUGVyaGFwcyB3ZSBjYW4gY29uc2lkZXIgdGhlIGN1
cnJlbnQgY2hhbmdlcyBhcw0KYSBmb3JtIG9mIHByb2dyZXNzLg0KDQpTaW5jZXJlbHksDQpNb3Vk
eQ0KDQo+ID4gKw0KPiA+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiAgDQo+ID4g
IGV4YW1wbGVzOg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=
