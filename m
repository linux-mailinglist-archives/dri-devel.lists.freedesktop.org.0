Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A28A0A13
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AAC10EF12;
	Thu, 11 Apr 2024 07:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="KVrnXEqf";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XQICvkXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923D10EE89
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 06:30:59 +0000 (UTC)
X-UUID: 0cefde38f7cd11ee935d6952f98a51a9-20240411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rV3BQTgxbicXVQQKiiM48OaSRXX0ld/KrFkduT4mNyg=; 
 b=KVrnXEqfTXt2TlA8Iu2IwVtRgpLtJKoyITbNabywmDvAfjFd1tgIBXtN6aCLjRh8GZfLRiZMJOUdEX4LI/QmNkzp62vldrkDseuBzvMfR4uSECRGxyDhiPOpj8twic2Gh8o0zUjqBUJ2TXRF6jp04qe/PGrKuDXcjua5FID2HxI=;
X-CID-CACHE: Type:Local,Time:202404111423+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:73349049-9627-4d09-9807-0c3c294f5376, IP:0,
 U
 RL:0,TC:-9,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-9
X-CID-META: VersionHash:6f543d0, CLOUDID:005f8b82-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:1,Content:0,EDM:-3,IP:nil,URL
 :0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
 R:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0cefde38f7cd11ee935d6952f98a51a9-20240411
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 841324495; Thu, 11 Apr 2024 14:30:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Apr 2024 14:30:53 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Apr 2024 14:30:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGLZ5mTiWZBrnFzaoVdpjjZbCvnUiwx1dndKs4JQJkOUApa1ddgumSlg3KNgCQow5bd7qLZMIsBE1jfL1MHCXNzZ/zvYzqRxaiJ/84qjnUlc3stlvv0l9E8oWAbkKyFQ0XuU6eumCebQLVkSt70UfJoBoARRR2ht0lfXU6/PZgCS5g2NYPiE7KAUC1EHZd/3zVJOwnMcqtQwDO0jh5+C9OeK+OvbeIcH65zv6yf2gRxZ8lj0oVzjhMpWof84vnyWtWgGfcrP1HVwdxPQDrkhmdmx33fKFOGBdIOC5xKUza/uLkByti5aJmCUjCH6iysRmxiBSV65upulLA7wuUGpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVMQA05wDd8o1b1ftzlkl0wCsxpwfXCErN4QCf6GuBI=;
 b=b9dVCx7c8TiID8bBhMeUuNAmbVyahHXlcJibq05PyiEmpTZtKAEn4dHSS+yTp7qse+Mh5ZkrkOVVBXaHQXNP/vUOZ5xLMZxXyts6HYkHzliQGqMmNLN0g+2zySQpDHBfsc3RlIWbNz5HAVx1/NmU9jBwZOLkN8qL/jC8onE4SOkOKk9ll0XqgHSlS9vrMEMW7oJxeYQWWYe+qBHZct98AvIeZxkmtF88LB9eyB5OweLDOn5cHZoN0uu/h+xet0J7MFZ5V65jCImpeltx+FTuyJHiY1ghr4XCj3ihJkhToZSfXmm9MjD1lM+arOcD4JVyrzZLYjEYQS0BJX4ZS8R9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVMQA05wDd8o1b1ftzlkl0wCsxpwfXCErN4QCf6GuBI=;
 b=XQICvkXP6A1hLTYQwv+q95m79vvAZ821Ba9zvMtY1PtHhbK4x0n5wZs7L+j78u6adW3RaufKfU+douHeQ8ChkukP89bUd/37K5S5R7rxBIOAnZNAXALVqESlmbBo1orHMxyQgYypz/0dfnK83aUfMHUORWq2ap4oJsrRP7IUEmY=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by SEYPR03MB6457.apcprd03.prod.outlook.com (2603:1096:101:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 06:30:50 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3%5]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 06:30:50 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "kishon@kernel.org"
 <kishon@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] drm/mediatek/dp: The register is written with the
 parsed DTS SSC value.
Thread-Topic: [PATCH v1 1/1] drm/mediatek/dp: The register is written with the
 parsed DTS SSC value.
Thread-Index: AQHahXwGjAzd+9TbM02omPlvxIpuLLFWGOuAgACKTgCADAVkgA==
Date: Thu, 11 Apr 2024 06:30:50 +0000
Message-ID: <bc785b80e109fc04c5973ee4efad115e0c3907c4.camel@mediatek.com>
References: <20240403040517.3279-1-liankun.yang@mediatek.com>
 <c0986506-ba8b-4c52-88f8-119c23b8778c@kernel.org>
 <86dd866a-8ead-4fd1-993a-672d4947ba84@kernel.org>
In-Reply-To: <86dd866a-8ead-4fd1-993a-672d4947ba84@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|SEYPR03MB6457:EE_
x-ms-office365-filtering-correlation-id: b3c8acf6-a130-4c66-fdea-08dc59f0ee26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KXkVyXO85aLTyoa427GRFuA0wYzLytUlh4IQlIMJIHi7p4JHPdeCMEOYN5AWO3i45ADvFObAbP0Xe/gKRObTVWPZapAfIrvA4VPta+5nQzlyvmm2hr26zqplUh8/e3UXjJFC0QNZQS7jKwCj5/yIVorssewjKIBnH8xVmhmXvk/tmF0o9gcxH7eIcI+Id48natoNkLTCEdDUA69/1ZEBFEvSVlTiaRtDxLx6k0C0YTM6HeBA1WYdk5TmRHKDP36+WaP55zjc4m5jiyAx02aytDXVzM3WuPci3EDHk2W8yuEXjnDdAziP1O3FwaBXtp+c0oH0XxoshuM7IMM07LlmjB3TMMdopZbgoswS5uHVq2zwQI761EEoR4jGxXelCQ37ZIWBXTylbv3wvFEpUWc2vRTvsgqqJn+R142lKXFe4LktXGwXyUZrRjUmeLSrk2J9UoOirRUiQY9/Cfj7FSqbcgIiuCKEAJibhYIgWiFASqJPhKJ134SoG3Ju6Kjwwz8Lf3dsY9i2SvOvQ180bY6/nXPuA3st6sZikIuxpPFFG1UFO3g3Ohep9Y/Eceph2gMFe6veG4fwAczZKR7bp2FXhvnJ5LNLJ5MkGcT4BzERkAHapdYnbuxyBHPOGBeGZhWTozu4ohXyFn7p7E8YXGtO/WEeRRTnYicsOFIaplqom4UoM1fRBWEHlA5mCgX8ivwki08M1fyTc/gImVNxVz3wIFU9R5q/Hg1KjwFKs2KLUe8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB5760.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNxY0UvNnRIQjh4emhQYy9HK0kveGtrVkQ3U1pldEVyK2NIb1VCOTNBdmcz?=
 =?utf-8?B?NlMyMElYVmZkYjJWY1NwdVpOb21lVm9rSDIyTGlHaGlGSlZVMGdDY1VSZmxH?=
 =?utf-8?B?WW1DN2pDekF5bndCU1B5QTAyTzV4YSt5ODJRTW51eklISktNNjQwMld2eGpm?=
 =?utf-8?B?aUxGTHdHSGxMVUdzSnhyVmt5UmhYUjBJL3YzaE0yMlpTT0psckE5dmsyWVFF?=
 =?utf-8?B?SjE1OXJqVmQ5UFdWU0M0TzdWWmhwRmFYbHFuZk9hNitiOVFmbGEzZGV6KzZF?=
 =?utf-8?B?RVBTWG54Nko0UDN0b1JTTnUzRS9leGJlK0pxM3BqZGlReHA5SmFST0F6U1oz?=
 =?utf-8?B?SEpMc1BpSS9XVDFUeEd1Q2tkOFUwVHJnOEx5WlFPT3FCaHpqeUZVbVpHaG9J?=
 =?utf-8?B?UW1hTndybFA1MDJOaFIwWS9kdXd2NTZDOG85ZVFzNlF5K01aOTluSDFsa1Vr?=
 =?utf-8?B?NVlseGxVVVZVd0xycEdEaW9nUG0rbmpobUJlNmlwMHpEQ1ZaWUlsQkdvVlhI?=
 =?utf-8?B?MkE3ajk5dVZBSXRxYjFFLzA2dERYalpQWTlCVFJJRmc2K0NRRUJYamV6R0I3?=
 =?utf-8?B?Nk9aQWZjeE9LdWZkTGtNdHlWcU9yQXQ3QnJvUFp1YzA2TkgrdCtpTE42clZU?=
 =?utf-8?B?NzQrbHEyMTdVSnhZYnF4WnY3RXBubWhXOWtjZjJraWFWZzZsYmphbkdGbUFs?=
 =?utf-8?B?NndGZmVjdUZYVHIxZEYzekc5TCtranJMNkpGK3J0Vk9NRWRUa29rclhWVHpt?=
 =?utf-8?B?QkhMQmFNYkFEb2o1dFFTWjJxZ1VPSFVsWWdBRmRqUVdzNEtCYnJDVlI2clUy?=
 =?utf-8?B?ckdQLzRCb3VJYzhQQlF3aTRjS2R4ekc5Mk5MUG5pdHBBNjJEaVczd00xbHBR?=
 =?utf-8?B?b0pmMDFQRDZhZ2hjSkNuMFptbEFUOFloSDVQaTIwcnljMWF5dmpXRm5BOERH?=
 =?utf-8?B?VmJZNXRWcVJnQ1B0T0RaYjFNYWd4UXgzN1kySzVsTjR3cCs4Qk1mOFpnd1Bu?=
 =?utf-8?B?TWpZQWxybGgrRytiYklRWlA3Q2lsQ1hDUjJ5R3F5ck1sQWdlSFRLbmJFcm5H?=
 =?utf-8?B?UWZaYURCd0IwMVlBaVZxS0JabE9lM3BEWGxpaU1YMlFHbFMrb2I3dEJzSndL?=
 =?utf-8?B?L1NLVzV3RVRpWFJJb2syZ1p0NVJIQ2tnUFlYN1JYRy9CMWg1RHozdElqUGVF?=
 =?utf-8?B?ZmZIUDlZTmRNS0Zud3QwZUwwNFFTYklNOEF6NFowR3RaV3EwYTBaeEdKTXJZ?=
 =?utf-8?B?cVp4ZktJNlR4QlFuVndUMlRvWHB6LzNsQ2hFWTh3SkpoT2dlZGdxRGZEczZt?=
 =?utf-8?B?RnlhWEhaTnE4QUppRUZMOFN4VkVZbVlwS3ZuK0RaclhyRGhxQXJGQ3NNTjhQ?=
 =?utf-8?B?dDVvaUdDYmo2eExDUEFZNHZCN0NnY3g1YkIzSEJBcU9hb0xxOG1yNEp5Ly9l?=
 =?utf-8?B?bElET0EzTXFnQ0VjNmNqVWFPbzI1L0tKZGpBV0xHeFllOVRKTFNWQXVLMmhR?=
 =?utf-8?B?SHcyVEZOVTVSZGUreTdwMGpObXhaZUNvWS9KWVI2RWFLcFl4ME16SVg2Y29D?=
 =?utf-8?B?WjBYNWgyMWpNc09KbjZNeHNNZmIrM0l5N1RWSEtFc08wRzdJMjQvN2Rjc2l2?=
 =?utf-8?B?LzBEQ1gvaDZOR2hEVm0zL1BaODRRYi9OSHJvR3gzaVA3N2M1NGFoL1RhR0Jw?=
 =?utf-8?B?UjlhNk0zUVFOck9XOUlTRFg2elU1Ymh5ZTB6UVlvdWJPSDBTWHdMNjQzRVVL?=
 =?utf-8?B?QndhUWE0UE5xUklxVmNSazR5SEhsN2NSMVFYNWVFVVRhT29PeERFQ0QwS0Y4?=
 =?utf-8?B?RzRQZmtWTE1BTE5tSjRib3BrbWgrMVppSEwwd3lCczVQRjBzTGtXeUVhbzJ5?=
 =?utf-8?B?TFpIWWtpRFNramp4c3ozSEdQc2VROUlFTHZVRnNNT09RL2pKSFRUNUthQXZo?=
 =?utf-8?B?K2h2WFI3VlpTdHhKaEFXNGNXaUhDemhBSWg1Y3VvS1VpWEVmcW9FVzBnNTIr?=
 =?utf-8?B?bXl4cnljUy9iZjcyeFJtVGpmQXBLUmNtWm5nR2RjcFBqM1d4aWpocklmM1BR?=
 =?utf-8?B?VzJncktLUlJEblEwcGg0aGgrV3hvN2Q1SlA0R0g5dHBobXk0NXhRSHZFamJr?=
 =?utf-8?B?UzlXTDNtR2YybUNxdHBvbElMaUI3TTdaT1NQdXVabk5lQ1cwTEhVbzJBU3hZ?=
 =?utf-8?B?YkE9PQ==?=
Content-ID: <BBDCF418A936584BB43E0718C0A54483@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c8acf6-a130-4c66-fdea-08dc59f0ee26
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 06:30:50.2214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWl86immqfuJJ1y41KPD2ne5PHhTyojhz5RKJBqMGwaWX7/VgrVvd0syzrvmTYTP+qvXT3A/ioLU0FR2lgwmDENZYxW75iVk62chrYhwRNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6457
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_190238023.1672763853"
X-Mailman-Approved-At: Thu, 11 Apr 2024 07:39:13 +0000
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

--__=_Part_Boundary_005_190238023.1672763853
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTA0LTAzIGF0IDE2OjU2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDAzLzA0LzIwMjQgMDg6NDEsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6DQo+ID4gT24gMDMvMDQvMjAyNCAwNjowNSwgTGlhbmt1biBZYW5nIHdyb3Rl
Og0KPiA+PiBbRGVzY3JpcHRpb25dDQo+ID4+IFNldmVyZSBzY3JlZW4gZmxpY2tlcmluZyBoYXMg
YmVlbiBvYnNlcnZlZCBvbiB0aGUgZXh0ZXJuYWwgZGlzcGxheQ0KPiA+PiB3aGVuIHRoZSBEUCBw
cm9qZWN0aW9uIGZ1bmN0aW9uIGlzIHVzZWQgd2l0aCB0aGUgbWFya2V0IGV4cGFuc2lvbg0KPiBk
b2NrLg0KPiA+Pg0KPiA+IA0KPiA+PiAraWYgKCFzdHJjbXAobW9kZV9uYW1lLCBSR19YVFBfR0xC
X1RYUExMX1NTQ19ERUxUQV9SQlIpKSB7DQo+ID4+ICtyZWdtYXBfdXBkYXRlX2JpdHMoZHBfcGh5
LT5yZWdzLCBzc2NfcmVnX29mZnNldCwNCj4gPj4gKyAgIFhUUF9HTEJfVFhQTExfU1NDX0RFTFRB
X1JCUl9ERUZBVUxULCByZWFkX3ZhbHVlKTsNCj4gPj4gK30gZWxzZSBpZiAoIXN0cmNtcChtb2Rl
X25hbWUsIFJHX1hUUF9HTEJfVFhQTExfU1NDX0RFTFRBX0hCUikpIHsNCj4gPj4gK3JlYWRfdmFs
dWUgPSByZWFkX3ZhbHVlIDw8IDE2IHwgMHgwMDAwOw0KPiA+PiArcmVnbWFwX3VwZGF0ZV9iaXRz
KGRwX3BoeS0+cmVncywgc3NjX3JlZ19vZmZzZXQsDQo+ID4+ICsgICBYVFBfR0xCX1RYUExMX1NT
Q19ERUxUQV9IQlJfREVGQVVMVCwgcmVhZF92YWx1ZSk7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4g
K3JldHVybiAwOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtzdGF0aWMgc3RydWN0IGRldmljZV9u
b2RlICptdGtfZHBfZ2V0X3NzY19ub2RlKHN0cnVjdCBwaHkgKnBoeSwNCj4gc3RydWN0IG10a19k
cF9waHkgKmRwX3BoeSkNCj4gPj4gK3sNCj4gPj4gK3N0cnVjdCBkZXZpY2Vfbm9kZSAqbW9kZV9u
b2RlID0gTlVMTDsNCj4gPj4gKw0KPiA+PiArbW9kZV9ub2RlID0gb2ZfZmluZF9ub2RlX2J5X25h
bWUoZHBfcGh5LT5kZXYtPm9mX25vZGUsDQo+IFNTQ19TRVRUSU5HKTsNCj4gPiANCj4gPiA/IT8h
DQo+ID4gWW91IGhhdmUgdGhlIG5vZGUsIHdoeSBkbyB5b3UgdHJ5IHRvIGZpbmQgaXQ/DQo+ID4g
DQo+IA0KPiBXYWl0LCB0aGF0IHdhcyBicmFpbmZ1Y2sgZnJvbSBteSBzaWRlIG9yIC1FTk9DT0ZG
RUUuIElnbm9yZS4NCj4gDQo+IEkgc3RpbGwgaGF2ZSBhIHF1ZXN0aW9uIHRob3VnaCwgd2hlcmUg
ZGlkIHlvdSBkb2N1bWVudCBuZXcgQUJJOg0KPiBkZXBlbmRlbmN5IG9uIHRoZSBub2RlIG5hbWUg
aGVyZT8NCj4gDQo+IEFsc28sIHdoeSB5b3UgYXJlIG5vdCBnb2luZyB0aHJvdWdoIGRpcmVjdCBj
aGlsZHJlbiAtDQo+IG9mX2dldF9jaGlsZF9ieV9uYW1lKCk/DQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0KPiANCj4gDQoNClNvcnJ5LCB0aGVyZSBpcyBmb3JtYXR0aW5nIGlzc3Vl
IGluIHRoZSBwcmV2aW91cyBlbWFpbC4NCg0KVGhlIGRwX3BoeSBkZXZpY2UgaGFzIGFscmVhZHkg
YmVlbiByZWdpc3RlcmVkIHRocm91Z2ggdGhlDQptdGtfZHBfcmVnaXN0ZXJfcGh5IGZ1bmN0aW9u
IGluIHRoZSBtdGtfZHAuYyBmaWxlLCANCnNvIGl0IGNhbm5vdCBiZSByZWRlZmluZWQgaW4gdGhl
IGR0cy4gQXZvaWQgdXNpbmcgb2ZfZ2V0X2NoaWxkX2J5X25hbWUNCmZvciB0aGlzIHB1cnBvc2Uu
DQoNClRvIGZpbmQgdGhlIG5vZGUgbmFtZSwgdXRpbGl6ZSBvZl9maW5kX25vZGVfYnlfbmFtZSBz
aW5jZSBpdCBoYXMNCmFscmVhZHkgYmVlbiByZWdpc3RlcmVkLg0KDQpCZXN0IHJlZ2FyZHMsDQpM
aWFua3VuIFlhbmcNCj4gDQo=

--__=_Part_Boundary_005_190238023.1672763853
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMDQtMDMmIzMyO2F0
JiMzMjsxNjo1NiYjMzI7KzAyMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMy
OzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYj
MzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUm
IzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVu
dC4NCiZndDsmIzMyOyYjMzI7T24mIzMyOzAzLzA0LzIwMjQmIzMyOzA4OjQxLCYjMzI7S3J6eXN6
dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyOzAz
LzA0LzIwMjQmIzMyOzA2OjA1LCYjMzI7TGlhbmt1biYjMzI7WWFuZyYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmZ3Q7Jmd0OyYjMzI7W0Rlc2NyaXB0aW9uXQ0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO1Nl
dmVyZSYjMzI7c2NyZWVuJiMzMjtmbGlja2VyaW5nJiMzMjtoYXMmIzMyO2JlZW4mIzMyO29ic2Vy
dmVkJiMzMjtvbiYjMzI7dGhlJiMzMjtleHRlcm5hbCYjMzI7ZGlzcGxheQ0KJmd0OyYjMzI7Jmd0
OyZndDsmIzMyO3doZW4mIzMyO3RoZSYjMzI7RFAmIzMyO3Byb2plY3Rpb24mIzMyO2Z1bmN0aW9u
JiMzMjtpcyYjMzI7dXNlZCYjMzI7d2l0aCYjMzI7dGhlJiMzMjttYXJrZXQmIzMyO2V4cGFuc2lv
bg0KJmd0OyYjMzI7ZG9jay4NCiZndDsmIzMyOyZndDsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmZ3Q7JiMzMjsraWYmIzMyOyghc3RyY21wKG1vZGVfbmFtZSwmIzMyO1JH
X1hUUF9HTEJfVFhQTExfU1NDX0RFTFRBX1JCUikpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYj
MzI7K3JlZ21hcF91cGRhdGVfYml0cyhkcF9waHktJmd0O3JlZ3MsJiMzMjtzc2NfcmVnX29mZnNl
dCwNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7WFRQX0dMQl9UWFBMTF9T
U0NfREVMVEFfUkJSX0RFRkFVTFQsJiMzMjtyZWFkX3ZhbHVlKTsNCiZndDsmIzMyOyZndDsmZ3Q7
JiMzMjsrfSYjMzI7ZWxzZSYjMzI7aWYmIzMyOyghc3RyY21wKG1vZGVfbmFtZSwmIzMyO1JHX1hU
UF9HTEJfVFhQTExfU1NDX0RFTFRBX0hCUikpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7
K3JlYWRfdmFsdWUmIzMyOz0mIzMyO3JlYWRfdmFsdWUmIzMyOyZsdDsmbHQ7JiMzMjsxNiYjMzI7
fCYjMzI7MHgwMDAwOw0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyOytyZWdtYXBfdXBkYXRlX2JpdHMo
ZHBfcGh5LSZndDtyZWdzLCYjMzI7c3NjX3JlZ19vZmZzZXQsDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyO1hUUF9HTEJfVFhQTExfU1NDX0RFTFRBX0hCUl9ERUZBVUxULCYj
MzI7cmVhZF92YWx1ZSk7DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7K30NCiZndDsmIzMyOyZndDsm
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7K3JldHVybiYjMzI7MDsNCiZndDsmIzMy
OyZndDsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
Z3Q7JiMzMjsrc3RhdGljJiMzMjtzdHJ1Y3QmIzMyO2RldmljZV9ub2RlJiMzMjsqbXRrX2RwX2dl
dF9zc2Nfbm9kZShzdHJ1Y3QmIzMyO3BoeSYjMzI7KnBoeSwNCiZndDsmIzMyO3N0cnVjdCYjMzI7
bXRrX2RwX3BoeSYjMzI7KmRwX3BoeSkNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjsrew0KJmd0OyYj
MzI7Jmd0OyZndDsmIzMyOytzdHJ1Y3QmIzMyO2RldmljZV9ub2RlJiMzMjsqbW9kZV9ub2RlJiMz
Mjs9JiMzMjtOVUxMOw0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmZ3Q7
JiMzMjsrbW9kZV9ub2RlJiMzMjs9JiMzMjtvZl9maW5kX25vZGVfYnlfbmFtZShkcF9waHktJmd0
O2Rldi0mZ3Q7b2Zfbm9kZSwNCiZndDsmIzMyO1NTQ19TRVRUSU5HKTsNCiZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiM2MzshJiM2MzshDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtZ
b3UmIzMyO2hhdmUmIzMyO3RoZSYjMzI7bm9kZSwmIzMyO3doeSYjMzI7ZG8mIzMyO3lvdSYjMzI7
dHJ5JiMzMjt0byYjMzI7ZmluZCYjMzI7aXQmIzYzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1dhaXQsJiMzMjt0aGF0JiMzMjt3YXMmIzMyO2JyYWluZnVjayYjMzI7
ZnJvbSYjMzI7bXkmIzMyO3NpZGUmIzMyO29yJiMzMjstRU5PQ09GRkVFLiYjMzI7SWdub3JlLg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjtzdGlsbCYjMzI7aGF2ZSYjMzI7YSYjMzI7cXVlc3Rp
b24mIzMyO3Rob3VnaCwmIzMyO3doZXJlJiMzMjtkaWQmIzMyO3lvdSYjMzI7ZG9jdW1lbnQmIzMy
O25ldyYjMzI7QUJJOg0KJmd0OyYjMzI7ZGVwZW5kZW5jeSYjMzI7b24mIzMyO3RoZSYjMzI7bm9k
ZSYjMzI7bmFtZSYjMzI7aGVyZSYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Fsc28sJiMzMjt3
aHkmIzMyO3lvdSYjMzI7YXJlJiMzMjtub3QmIzMyO2dvaW5nJiMzMjt0aHJvdWdoJiMzMjtkaXJl
Y3QmIzMyO2NoaWxkcmVuJiMzMjstDQomZ3Q7JiMzMjtvZl9nZXRfY2hpbGRfYnlfbmFtZSgpJiM2
MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlz
enRvZg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KU29ycnksJiMzMjt0aGVyZSYjMzI7aXMmIzMy
O2Zvcm1hdHRpbmcmIzMyO2lzc3VlJiMzMjtpbiYjMzI7dGhlJiMzMjtwcmV2aW91cyYjMzI7ZW1h
aWwuDQoNClRoZSYjMzI7ZHBfcGh5JiMzMjtkZXZpY2UmIzMyO2hhcyYjMzI7YWxyZWFkeSYjMzI7
YmVlbiYjMzI7cmVnaXN0ZXJlZCYjMzI7dGhyb3VnaCYjMzI7dGhlDQptdGtfZHBfcmVnaXN0ZXJf
cGh5JiMzMjtmdW5jdGlvbiYjMzI7aW4mIzMyO3RoZSYjMzI7bXRrX2RwLmMmIzMyO2ZpbGUsJiMz
MjsNCnNvJiMzMjtpdCYjMzI7Y2Fubm90JiMzMjtiZSYjMzI7cmVkZWZpbmVkJiMzMjtpbiYjMzI7
dGhlJiMzMjtkdHMuJiMzMjtBdm9pZCYjMzI7dXNpbmcmIzMyO29mX2dldF9jaGlsZF9ieV9uYW1l
DQpmb3ImIzMyO3RoaXMmIzMyO3B1cnBvc2UuDQoNClRvJiMzMjtmaW5kJiMzMjt0aGUmIzMyO25v
ZGUmIzMyO25hbWUsJiMzMjt1dGlsaXplJiMzMjtvZl9maW5kX25vZGVfYnlfbmFtZSYjMzI7c2lu
Y2UmIzMyO2l0JiMzMjtoYXMNCmFscmVhZHkmIzMyO2JlZW4mIzMyO3JlZ2lzdGVyZWQuDQoNCkJl
c3QmIzMyO3JlZ2FyZHMsDQpMaWFua3VuJiMzMjtZYW5nDQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8
L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioq
KiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxl
dGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0
YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250
ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJl
PjwhLS19LS0+

--__=_Part_Boundary_005_190238023.1672763853--

