Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F3823E52
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 10:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9498910E3B0;
	Thu,  4 Jan 2024 09:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883A110E3E9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 09:10:37 +0000 (UTC)
X-UUID: 1bd2d588aae111eea2298b7352fd921d-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=S70ad117y+aVhDU0Z/OPecUpf8T4N5vV1bqe+RcI/9E=; 
 b=CNgnUTGKbAHgdTz2hM1XIpeUpoiDBUwG+kCEEYyPW1oijhEFuLDILUY7a1SK3f6hDqpFrCvg02neVHUaQ4x0wjEpxSMRx6FjQ1OtfrFRKvl1l9Epng+NfEOgT1ErMwdxDcaCZs+SOjch0n9f25xCuOdj2m/D9+4KVWVuHXKCLc4=;
X-CID-CACHE: Type:Local,Time:202401041656+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:dbdccacb-a0b1-40cd-9141-ba660ceaf70f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:e591fb7e-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1bd2d588aae111eea2298b7352fd921d-20240104
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1788376822; Thu, 04 Jan 2024 17:10:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 17:10:29 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 17:10:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSE+zIJ9uKtLOH27kz4NNKL3pKUni4YY3/POHMrVFkj0L90Wf6JT6K1JKBJ/SMCp3Jxvv5uzwfSCHB+SyC+oVtM9CFfy7ktCsvM7q1FypxifBValBJUIO70A3xSon6aTMj53nPnXByKhv9bm3kIkIkJ9s+5rUZr9nd6AqKIbiYXuZlAf1UQMY5DwEZtRlvVquA+YeGqF7JpvnzEh3srQqPg+d9R99BqqKyihc2fL69UpSKNvX105zpLXUDUhEySITfdxDOUqXyV0t5GiZdoPBhJ0itNJJXNfi3Vx5XP9/Vlz9oxXl/PSik9PNL3NHi83Nc5vt7391ly81H5WxgbQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDemUndNfC2c1KaETmY3ga7hEW/YNKPUMSl6aFFh33c=;
 b=kGMEAU6ZGild1tZtq13jbBkJxf0IKPvOG9mDyxbZEPH5djc9anIh4Z/ZTIip5ff76FaZ2w29pmY3mZ8g3+fQKwhVDaycnrJpiGkacntTE0B4j8scxH3t8fcZDIRDJz4iHm3Q+w/0fxV8UdjOYn75ieYwXUujpn6Xnruh7GacX+Piy7RlbtRp4QbuZ2CB01z8CRLKTRBUUgrjeRDqJl+PV04xzr11E7ux0vkodDGSdFd2Mi0FJQbgg34iQ5+9JtquztZyWr8bbQWLhtIMl9CHdXMTzfUi7qFdb/b+9y3JRlzVmes2mUNg0i4nOmFX2k+l2bX47ekUbHtxZhPMiVdn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDemUndNfC2c1KaETmY3ga7hEW/YNKPUMSl6aFFh33c=;
 b=dYGYZL3sUaOi8tFD3e01u6yIVhOFMtrNwMAAwhoF6iDUsnr+hjCUcQ2zC6nQtG0S1gAVPVeJfd5jUn4t1Lv6qXITqzlDd0kQDofGDG4Ek3fIQO4qbTdcNUxKZo8yHz7y4V3I2saaQyEYK2xccIe6NGWULTNThakWxWtLzPAFTts=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6428.apcprd03.prod.outlook.com (2603:1096:400:1ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 09:10:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 09:10:27 +0000
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
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrDJnk0A
Date: Thu, 4 Jan 2024 09:10:27 +0000
Message-ID: <6e185fb7860cff63241e116964ea84e37607aa83.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6428:EE_
x-ms-office365-filtering-correlation-id: 507d85a9-949d-4dca-c2c2-08dc0d04fe08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FarD8hw08H72gxd1tpeT2noCYBx/+lAcJVx1y5L93JPQ1qrk1/848q9INPMg8dH56RkFjb1oPLPcKbdvSLK3EdytEIN3AHgICzittpIlJhd6K7owkbRc8O0wq3r/QjMcXyhNi+iMkmrKgVpqQuZI9UnsVzAtkc2FjZZVsNRuO3ySCONguKthfc1Nx5lMMBmDBmgv8ntSAtLEzDFDZXCFvRo6YvNxiXG4IsaeNgUgZyDnHglj92IPYH+w4k1/+KjuZtLEH4Y6GdmSKyIasCComFw+NtMs3axU7wD35fUaYaokiok3/6tGjMCqSUhZ1prnpO3Mtz4J8YzAWRysg/ji6E+ji5NGB7lGZbvBj70ClPuHo6+Yn3EYB91AelBzB7Nk45QvJJYyY/5Vnd1FsJccNBq/byRBlaWI3lEqIvXtxABjKJcgmRPRwNKSgqkIki2nF47zOLgN6X6GiRmhHTpYKixlfTEy9COWmime8nNgIKtk1zajL1EBbFaeo1eY6tNJEAudFOw48gbCED+VOWeHZmwMynXl2mBR2zhx+ju+RrFN7pe66BsJJU2UsMuZzClhlcdod11r+fs+COCnGqElYFxzH4LdNtrNaS5tQsENLga1BYwPO+0cC3LIX3TAD60Rb1R6s1XDk3ve2jLMmWFWAPIiT2MpFk+QP4ZKONIJZR8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(4001150100001)(2906002)(4744005)(5660300002)(478600001)(7416002)(38070700009)(4326008)(36756003)(85182001)(316002)(110136005)(66556008)(41300700001)(54906003)(66946007)(66476007)(76116006)(66446008)(64756008)(6506007)(6512007)(8676002)(107886003)(6486002)(86362001)(8936002)(2616005)(26005)(71200400001)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmUrWXladWZEbGRvU2hkUnk5UG9mL0k0VzlzU1ZwRlc5dHNLQXduSDRYM3VY?=
 =?utf-8?B?ZmhXN05KdFhXWWZtenhFYlpibkxIdHhJQm9YMlhTRVFyVGMrR2ZEZ3JFV2px?=
 =?utf-8?B?OWdPS2JvblRvOUtNNDNFMzdEa25LRVBGMk5mZ3NYWjJia0YyNXRTZlZNR3Ry?=
 =?utf-8?B?VVZSZ1g0akw5THBxNFM2bStsa1VoOCt3MytKam1Ud0k3M1cxRFRoWURhZTNW?=
 =?utf-8?B?bE5JQWZLZFRVNmVtdTZVaDd2eFE1d2lDY3gxNk13SXRSZC9maU14ZC9tRzJv?=
 =?utf-8?B?dUk0dDQzWUlSV0VtU2pZRjZjaEROZ2dLaXZYbWxWL1hFdVIxVnRkY3ZVMDhZ?=
 =?utf-8?B?MVBkbVh5Y3hHZ1hJM1prRHEvSUIwWDF0TTRCR3Y4a0VHUCsrQmZDUGdodSta?=
 =?utf-8?B?bkVjQllpNEs0UFRyZVNPUUFaamNKZUxtRU5zK1FMZHVoWjdUdUlYajF5RFpS?=
 =?utf-8?B?TnQyTHBCekFQaTg3TUIxR2hQVWVVUnZCRm1UWnIwbmV5d2x6VlU1L1lucEo3?=
 =?utf-8?B?c0creUhxMDl1Z29SdFkrMnludHhsMExOTW5lVm1RYkJoYWpWanpuUVMxaXVk?=
 =?utf-8?B?VTl3djBBL3liSFRYajd6K1RYNCsyUnh6V2djbnRPMSs0YncyUmxPWFIwUzNw?=
 =?utf-8?B?dkVjNnF4OUg1a2xDamgza3U5bkQrZmhCemNYYmp5SFNSeHU2Rm1vbEMzYzFw?=
 =?utf-8?B?emZJdEkzcUNmSkMzeXZwWmhjTEQ1WTN4NzFWaGlGWGdreDFzcUQ1MDU0SzNi?=
 =?utf-8?B?OFVPQzlwY2YxZ05nYUdvMEFYU2ZaZnlOMjhvV1RDK2phQ0lLaEdsc3RWQVp1?=
 =?utf-8?B?Ri9zYitQK0piQlNIYXJyWC9WM0M4Nm0wYkRIQ1pPRytCOUMwdGFoMi9UTHlD?=
 =?utf-8?B?WmtxY3VObks1bDY5WER2eUphZmdqU1ZIeXFJYzFWazBjTHBaWjkvS3BzT3F4?=
 =?utf-8?B?d3NtVS9Xdm03bUQrT2ZKOFl1WWgxRVlCMWhpOGhlNjNsOUNVSTh4Snd4MGxz?=
 =?utf-8?B?OGpxeGNaSk5ML3ZOeXhZZ29vcnlYOVdZZU9ibXVKdW12MWdRQW9tWDNySkx4?=
 =?utf-8?B?MFlyS0t5a00xR2tJdytLaG5BTnhaU2x4YmFnTVJ3UFQwOHJacGFiaWZiUXFt?=
 =?utf-8?B?Z0JsUW1ndkcvU3dXT1BzYURFQ1FMMzZ3Ly8ydS9TM3lnOUd6T1h3VmlEb0da?=
 =?utf-8?B?dHhYVzFuY2d6WWVvNkNjZitSeGZEbjdSZlBqSHp1ZkI0TWRLclNISWpmUzNI?=
 =?utf-8?B?Y2puazJDUElxTFJGd0NOcFhnSURpaWFJZUZFdm8vWEJuR1NuYXc2d3R4QktX?=
 =?utf-8?B?WW9STklRSjhQKzh0YksvYUdwUnp4bDhROTdTcDI3aGYrRDN4ZFhUVmF6VUVS?=
 =?utf-8?B?cUh4eUIxc240VXB4eWVDNkQ3UlRCa1l5OExaZ2FLTEJEV0kzN1lGSnExcVA0?=
 =?utf-8?B?TWhtUnJyVFd6U2JhMWtVQmRsS253NVZTSXhvaW03bWgrQ0VmaUQ3cGxTaS9k?=
 =?utf-8?B?eUNZOVNhc1pTU1VYaHVZOUpMUzMzcTZHcGpzWmJ5OU5GTzNOQnZ2MHZBN2h1?=
 =?utf-8?B?TlliaXNydExRendNS2ZlemNDdWYwa0Y1N2Z4emRjWXJJNlZhTUZuOU1wNHNI?=
 =?utf-8?B?eXJIbDl3V0RRcElLcnhPeEdGdFVBUit3ZDhkWmtNV1ZzclA0S2wzZ2g5VzAx?=
 =?utf-8?B?UGEwcUZqUW95U2xXU3lsR0FDTEtHVVJnbDlTZXlid0MwQ2tBd01VdVBJWFZM?=
 =?utf-8?B?SzFlQ0VVclZSbERoQ0VWRHlBeDJTYURWdzBVUUwrM2JQU1o4d1JpY1NuZlFq?=
 =?utf-8?B?clI4eUFnSkoxZCtQWlZaY2hoTEpTMkcrUTV5cEl6VUNzQTVyUC9mQjNLei9a?=
 =?utf-8?B?bWMyc3JHOFBETm1oaDN1THVUbjFwNmtHMmRlU2lmUjZFeUxHcDFWY0RtNk1v?=
 =?utf-8?B?RlpMbDNiLyt1NGRJL0NyTGtURHJ5QWMxMlVXdmN1eWVTZ0g0WEIzSWFtZ0NJ?=
 =?utf-8?B?YUYwMjJUeHdPaGEwMzh2bnZnZ0dYSFBqdnQ5Q0UxSnp6TTVLMDFqRjhCR3NF?=
 =?utf-8?B?MTBjSTlEZGhZRWxiZ0FTdldpNXJka3RyTjlDV3RuVXVHTzlSWmlRenJjOTZs?=
 =?utf-8?Q?nLV3k6v/je/ItU+Y3KRonjKOa?=
Content-ID: <D9207C2B88D5EA428F599FC773DC886F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507d85a9-949d-4dca-c2c2-08dc0d04fe08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 09:10:27.2595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJP46wzbdRaa9za9XluSZl6ajIvX9HSV+H5OFx0Ls4CZ3L54um5AzpRzefxI+o2oSxHRpygAqcioG1pPS6g5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6428
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1746481108.503779741"
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

--__=_Part_Boundary_004_1746481108.503779741
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtGcmksJiMzMjsy
MDIzLTExLTI0JiMzMjthdCYjMzI7MTY6NTMmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjt0ZWUmIzMyO2NsaWVudCYjMzI7YXBwbGljYXRpb24sJiMz
MjtIRENQJiMzMjsxLngmIzMyO2FuZCYjMzI7Mi54JiMzMjthdXRoZW50aWNhdGlvbiYjMzI7Zm9y
DQomZ3Q7JiMzMjtEaXNwbGF5UG9ydA0KJmd0OyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO3RoZSYj
MzI7SERDUCYjMzI7ZmVhdHVyZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO21hYy5zaGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO1RpbWVvdXQmIzMy
O3JlbGF0aXZlJiMzMjsqLw0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO0hEQ1AyX0FLRVNFTkRDRVJU
X1dEVCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOzEwMCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy8v
JiMzMjsxMDBtcw0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO0hEQ1AyX0FLRVNFTkRIUFJJTUVfTk9f
U1RPUkVEX1dEVCYjMzI7JiMzMjsmIzMyOzEwMDAmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Ly8m
IzMyOzFzZWMNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtIRENQMl9BS0VTRU5ESFBSSU1FX1NUT1JF
RF9XRFQmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsyMDAmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsvLyYjMzI7MjAwbXMNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtIRENQMl9BS0VT
RU5EUEFJUklOR0lORk9fV0RUJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OzIwMCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy8vJiMzMjsyMDBtcw0KJmd0OyYjMzI7
KyNkZWZpbmUmIzMyO0hEQ1AyX0xDU0VORExQUklNRV9XRFQmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7NyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsvLyYjMzI7N21zDQomZ3Q7JiMzMjsrI2Rl
ZmluZSYjMzI7SERDUDJfRU5DX0VOX1RJTUVSJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7MjAwJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Ly8mIzMyOzIwMCYjMzI7bXMNCiZn
dDsmIzMyOysjZGVmaW5lJiMzMjtIRENQMl9SRVBBVVRIU0VORFJFQ1ZJRF9XRFQmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjszMDAwJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOy8vJiMzMjszJiMzMjtzZWMNCg0KSXMmIzMyO3RoaXMmIzMyO0hEQ1BfMl8yX1JFQ1ZJ
RF9MSVNUX1RJTUVPVVRfTVMmIzYzOyYjMzI7SWYmIzMyO3RoZXNlJiMzMjthcmUmIzMyO2RlZmlu
ZWQmIzMyO2luJiMzMjtIRENQDQpzcGVjaWZpY2F0aW9uLCYjMzI7bW92ZSYjMzI7dGhlc2UmIzMy
O2RlZmluaXRpb24mIzMyO3RvJiMzMjtpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9oZGNwLmgNCg0K
UmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtIRENQMl9SRVBfU0VORF9BQ0sm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsyMDAwJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOy8vJiMzMjsyJiMzMjtTZWMNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtIRENQMl9SRVBBVVRI
U1RSRUFNUkRZX1dEVCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7MTAwJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Ly8mIzMyOzEwMCYjMzI7bXMN
CiZndDsmIzMyOysNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+
PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGlj
ZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlz
IGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25m
aWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBm
cm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBi
ZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNl
LCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBj
b3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVu
aW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJl
IHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBl
LW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBk
byBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBw
ZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_1746481108.503779741
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICsvKiBUaW1lb3V0IHJlbGF0aXZlICovDQo+
ICsjZGVmaW5lIEhEQ1AyX0FLRVNFTkRDRVJUX1dEVCAgICAgICAgICAgICAgIDEwMCAgICAgIC8v
IDEwMG1zDQo+ICsjZGVmaW5lIEhEQ1AyX0FLRVNFTkRIUFJJTUVfTk9fU1RPUkVEX1dEVCAgIDEw
MDAgICAgIC8vIDFzZWMNCj4gKyNkZWZpbmUgSERDUDJfQUtFU0VOREhQUklNRV9TVE9SRURfV0RU
ICAgICAgMjAwICAgICAgLy8gMjAwbXMNCj4gKyNkZWZpbmUgSERDUDJfQUtFU0VORFBBSVJJTkdJ
TkZPX1dEVCAgICAgICAgMjAwICAgICAgLy8gMjAwbXMNCj4gKyNkZWZpbmUgSERDUDJfTENTRU5E
TFBSSU1FX1dEVCAgICAgICAgICAgICAgNyAgICAgICAgLy8gN21zDQo+ICsjZGVmaW5lIEhEQ1Ay
X0VOQ19FTl9USU1FUiAgICAgICAgICAgICAgICAgIDIwMCAgICAgIC8vIDIwMCBtcw0KPiArI2Rl
ZmluZSBIRENQMl9SRVBBVVRIU0VORFJFQ1ZJRF9XRFQgICAgICAgICAzMDAwICAgICAvLyAzIHNl
Yw0KDQpJcyB0aGlzIEhEQ1BfMl8yX1JFQ1ZJRF9MSVNUX1RJTUVPVVRfTVM/IElmIHRoZXNlIGFy
ZSBkZWZpbmVkIGluIEhEQ1ANCnNwZWNpZmljYXRpb24sIG1vdmUgdGhlc2UgZGVmaW5pdGlvbiB0
byBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9oZGNwLmgNCg0KUmVnYXJkcywNCkNLDQoNCj4gKyNk
ZWZpbmUgSERDUDJfUkVQX1NFTkRfQUNLICAgICAgICAgICAgICAgICAgMjAwMCAgICAgLy8gMiBT
ZWMNCj4gKyNkZWZpbmUgSERDUDJfUkVQQVVUSFNUUkVBTVJEWV9XRFQgICAgICAgICAgMTAwICAg
ICAgLy8gMTAwIG1zDQo+ICsNCg==

--__=_Part_Boundary_004_1746481108.503779741--

