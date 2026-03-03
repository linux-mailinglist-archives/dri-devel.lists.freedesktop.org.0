Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEuUC1mUpmnmRQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:57:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D2E1EA705
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEFF10E650;
	Tue,  3 Mar 2026 07:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="relAx/oO";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ikACuDcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57B610E650
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 07:57:07 +0000 (UTC)
X-UUID: 8fb50f3a16d611f1b7fc4fdb8733b2bc-20260303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=IKyX7DtUGS+wIaz9ljqg8ayucMvWeZmuZcacLbiMavg=; 
 b=relAx/oOjhNjkc6KbxEbi2TxydPqTU9YX/XqUznpUklubInW3jNVp3lDHtTxCRxnDFDtcWt2bOmfpkY1lYJZvSZ0xUXzBO5r5EfzX1kEk5BhylFfngS0QF7g9Y34y/IrXWh9y8c7pu9YAoGCk/jFTvIXPgLFAr1zDzxrYOCN1Q8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:a5831392-337b-4c8f-b243-eb778079e7de, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:b0fc757b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS:nil
 ,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8fb50f3a16d611f1b7fc4fdb8733b2bc-20260303
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2031740105; Tue, 03 Mar 2026 15:57:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 15:57:01 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 15:57:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxUqH+E0fvfdVgmiZqlBtAPx+kNwBthOv+zXIXsh1N65JXWfOfqqEeKxY1UxbmQhHDFA1cYAy+CQ6pc83nDOC2GnfJ2klo4gmvwOTjkKm84w/VxZvELhyT4mdBKAdoHnSxugoVCGVBCtMiIx1L2MbWyYglmJNJBu8+8ICrzIMDxAelME2eojHrV7xgJUSR/g5+xRfCWzSyh1EU3/RdXimEWRW/85QPHdgiaAn/h9beK/nndAohYz0Qj6yigSB8K43iWNjylOAJyqi877PfcJu7kIcaK5IBs4uwxKJLEOBc3QP5WYg4jQJzd/aEw1LqqLFVMimVe/TzRiC0+tMboo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKyX7DtUGS+wIaz9ljqg8ayucMvWeZmuZcacLbiMavg=;
 b=XG0cObvxd6w7vvxxNcIZuelYCW9aPVtf+dOg1bhS9t7CeJ6VW9OfGzWb1XnwjiboM7GOKMVcQCgTm3vcyi8Uu9dqceeaRIDXKI7P0QWyKSA5WcfgErbu/N/F8ID2O736pkLW9hQlfOeFRjNypq+nGHej4gHiu6+90CZBe40QPlXgHad+xXJSHdm/52nqRPFWXr7Hde2wzHhQ8hzPi5Js7LnfWV37pbzu5RUCI5wjxYGPqNTcmX2cMyibpfOGr8j1e8dF3megGcwqMpJ57uTyaCmk8C2OXfG9+ZymHvY57EeTRgtJhJSTjCcmPNRMnwCu2CKVHYFlgQd8JFW7PGeN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKyX7DtUGS+wIaz9ljqg8ayucMvWeZmuZcacLbiMavg=;
 b=ikACuDcTx66SMBRnOLEiL55dBjzocXepDtJbFqALWTOiwvlxU31Qhu3c9fXqJUukN8yvMoBsWkyRMx3h2FF8DeNBxtfsZXxdayyqzHxInT5dKk8fsiBsnmreJ/ckTJX95zLMll01LWplF4iM00s8DyJlkkkIufay/HtW0E/vCXE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6881.apcprd03.prod.outlook.com (2603:1096:400:264::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:56:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:56:54 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Thread-Topic: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Thread-Index: AQHcpOFKeerDVVvn8keTXR6yIV+Y0LWStpuAgABdjgCACWiqgA==
Date: Tue, 3 Mar 2026 07:56:53 +0000
Message-ID: <dcb797934bdb4467037559ee5e91bee0a568c03a.camel@mediatek.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
 <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
 <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
 <CAORyz2Ki5aPNbcY5-_mRwFgwT46VN_pRV2iP7z7x3snzrbKz=g@mail.gmail.com>
In-Reply-To: <CAORyz2Ki5aPNbcY5-_mRwFgwT46VN_pRV2iP7z7x3snzrbKz=g@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6881:EE_
x-ms-office365-filtering-correlation-id: 97a2892a-f880-4f56-e373-08de78fa6f83
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|7416014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: puoG4vEhTADN1WsOc+sGx2ZXwsd6tXYrzhvhRCLvrNViw7YKxGK4SPvFew9tw9sEa1ofbX3/hshRCaI3FRds+A6G7m9BaAcxESb7iDPWRGSIL/hutFA0wOTMgpUeij8bf+wWDM5hyxgCuqF8fUwqyYbK6noj/G242GRkNu35lWM0ShinCP3J6RMPlsnM99XUdy9q29Sk4f7zheCaRZbS2BRE9QEKSKMcxHGL+J4Dx68SPw1vDAYhqwwd65B1yf1xd/CFJa4YU2hL9VdLgd/UEIeiVhMqu+awT8UkiH44vjmvDv38HWxevluvPmIDXdqLq6WcmOH+t0XojLo3egSxQU8Gwtyqt1lICabX9d0peDW9Cr6ppH6cqObwtJ4IrXg7HLTat8uHptF2+kxyFVeZCDbqS4J26jSnWG5tmuut+31r3YnMsGzy7He774E5DAr6YL8In4PxWh+d7dbaacFPvQzVLMDVndUSn+OZYuvQRXeuJ0MODq/jXxnbSzqgpAyFT87i9sOwHmc48O3UxMeClLYTYnnjIWq6bZ6ELmy/yV6DYHjl5ecL71D1fq3ylv54pN7+zLqez8tMKolN3jW+hg7MjLmnQ11zG5kWmkyH8giIg+hlGRG1vt4jOg5XjINHhezOaH/mLHraOA37zK8tCJFAuJdj+5p6Q7skyVNGKP6uFz7LTZlSZlKGSa2QneASEunJHgZVoSZRy3x0hi5tPKEHCXiVfpyJG5qPC34c08cAqkpPlq1mWnnLBu14kqwTQawPaXldtAfl5UQDhem6FHOotmEr9IyugXCnhp8aGDw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(7416014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU9ieVJteSs2QXA0WUZiMmNZTVFFRldKSjJ2Rm81cU1YWDFuMTFlamFuVTNS?=
 =?utf-8?B?MDVVMDlzSitWV2xUNXhiRC9kWGxjZnl2WGM5QXVnWkRlVURtZzNTaWVWQ2FC?=
 =?utf-8?B?UTAzcGJFM2RFMFJYbFFMTXVxcHJ0VWpZZGMvNk52NGFReDNZQW41ekJPTEZ5?=
 =?utf-8?B?VDNqTExoWXA3SDN1dWJQbi9wcDFVWWZlRVZ1TTF6emg0WUJxeW0xMlRPMEJQ?=
 =?utf-8?B?eFZGTTdjczhpY1FxTHRSd2JnbVZWRXROSEZmbFRoK2xQWkZ2eU1QNGtIczdq?=
 =?utf-8?B?aHVaaUF6bDUrWVZMOXd1NUZUUWt6TnBFTngrOTlvYWJmTlRrTW96VDd1WXNP?=
 =?utf-8?B?ZU5QRkFWaW1PMWZUa1hHZ3RnVzlCMUdHd1ZnN3FnQmJjVE1BcERFaEpRbGlJ?=
 =?utf-8?B?WUFLQ2ZpdUNZWDVnSEh4V2k0U1ZqMUFaQVVYTHBCL3E4TVpzTkZibklCb2ZD?=
 =?utf-8?B?clJOaGF6dFdyVVhzREEwcVJFZEZwZWJzTHZaeEV4bjBXbjluaUlGSDZ4WXQv?=
 =?utf-8?B?dWpvZmE2QTNRMjRNdThrbkxlMVh5T1RzTFJXUmc5c3NTaWE2Sm5mMXk1WSsr?=
 =?utf-8?B?THp0dW5kb2Z4c2E0RUUzSDJsVHpmVHpveHVTb21NNmtPNmo1bTZzV0tvazBK?=
 =?utf-8?B?YWFCQ3pGQlhndHZVd1R0TjJpOFdobm5oNllWa2ZJNllON0NxNHMyQ2VER0Ev?=
 =?utf-8?B?UVoxSTlVbml6S2pEZFRyVERaNGxReWlJZVk1cGlUK3FqWkhUVTNXZmU4cUJB?=
 =?utf-8?B?SzBuRVN5amFUZmVUckNzWWpENlBpRHZvT2k5d0thMEhaTzB1UXdBUU1tMG9h?=
 =?utf-8?B?c2YzRUxua2FpSXVoVnJSUFk5NkYzRXJaRmQ3WVZsQmJPTStEUkIxMXRMNkEv?=
 =?utf-8?B?K05sNHRROERlSHpweXJXYTVpeWlaQ3BGRWpsL2RlTkg2b3pVMmVlRXlSRHlp?=
 =?utf-8?B?NTEvc01OU2tGT2t5MHo5NWhyZWdqTDIvWmxRUFRkVENwT3ptZFArMy85YUg5?=
 =?utf-8?B?VGVvWFZ2anROWWVFcUVBd3pDUW82U1F0blJFZGZyTWM4UjVMcWdQNis5SWRs?=
 =?utf-8?B?eUZnbWVtZStDR0ExcVBGRzBybHdIYURicStOYmZOREx1NkNyN0cyKzk3VkdZ?=
 =?utf-8?B?UExjZ2EwU1hJVkZKeWFMdHNwcUsyWGpzSWFJNHhld291cFlJTk5kUSthUER2?=
 =?utf-8?B?SkwzWjNyMVBPTXRBOFU0MXJGQlFFWXU4ZFBjbVZwb2tOc1hzclhwMnVnTXBp?=
 =?utf-8?B?N1lpbFNEYm44RWdxRU44bkg0RzB5WVVmMjQyZVhOVGFPbmxqaUhXMEdnRVpj?=
 =?utf-8?B?RmlNYkR5T0dSbkpNY2hSMG5MKzJuOWlsVnBUc0cyM0RZZTkrOTlyN3dKQk5E?=
 =?utf-8?B?MWV6T1pGQW1qeVJoUHBvby9FOGQyUCswcm0vSFVIVytDbmU5MjdBSXFGWmxB?=
 =?utf-8?B?bG1TMDl4K24vLzBPRmVEaGE0Qnk4SXVkbkczVHAyOUdKandFL0JOQVFHTWpR?=
 =?utf-8?B?dkYwclVsR2E3ZFRsVFR6OEtOakl4d2kxcndQOWtLdmRISDk2azJmbmwyc0Fj?=
 =?utf-8?B?dnNuaUVRcDhiM3R0ZEdVc2NEKzlNai8rSTdsZUl4VHdIc20ySXBHTHdaQXhW?=
 =?utf-8?B?aWtzQ1QyZ05Ib2NPb1hCa0lEaHFhdmdLOCtmT1RyRHY5a1drVUhlMWdVN1ZW?=
 =?utf-8?B?N2VhVkVlNzFQWEZYd05LdVBqOUFYR0x6ZFhCVHB0ZGkrRzVoM2s4S0k4Mmxv?=
 =?utf-8?B?T3lnQk1XZ1VMSHp0M2xmZWllUkYzNFk2MW1NWUlwdU5zZlZiakFkZ28yMGFV?=
 =?utf-8?B?S0Z2VHZGVTViSEt2Rno3UVYyUTRDaGU2MFIwMVR0cFVYT21iRHVBenRjc3Y2?=
 =?utf-8?B?WWJjS25wS2lRaXZjZXRNOWtHaVM4S3RTOEZlRlRyV1NrM2c0OGhRVHNtckt0?=
 =?utf-8?B?Z0pUZ3RZUi9xbWtCc0tveStEVUFJNHc2a0hVSmswQjUwR01ieWxqTmJtR0p0?=
 =?utf-8?B?cXpjUmUyQWhnQk1lbWdyN2ljbC82QVcvTEdBdTltTVdCV2lRZVFMMmtTT0hr?=
 =?utf-8?B?NEoyU2FxblMzd25Yb3dUbStCTEVJaWxWeXZoV29RK2xPRUt5WXVPdUczOTdD?=
 =?utf-8?B?c2N2a0J3V2llbmQza0wwbzIvNmViZHh3SDFScEwyK1oxVkVUZVNJNkkxR3Nn?=
 =?utf-8?B?cHhGbmV0SHlBMXpPK21yUlZiQThOQjJ3NHUzb2xjbTZhR3dmZzhCdUl6a0Vi?=
 =?utf-8?B?Q3pVNnJJc1U3MW9IUzFucnY0RU9mcVZUckxBVG1BeEZoQjR5bXk1a2EzUUtO?=
 =?utf-8?B?a1ZULzhMYThvbFR5ckpoM01mZjgzOEZiNGJBTXRobXR2bDZoOE42UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3B281BD36568443BD6F0D47F5E07322@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hks+EAeuhq4Yz641JTBgp9YjxkhAgWOfOGFUF9TPXh4QT6uR52KTycsyMWePpv6bpoHLRt8IMIOzXO71VhoY1cp+AY8bdaFExSeXWMdWx+QdKatW7lZqK/g+gS7sZ1OgQMbtfMVr2NH7nl4dOeTNA9MDneVMyjuROJMigKs9czbDW4zrDDF/flHM0yjKwGoET4HnJeM6bAgDMgBtxB+8DDk2IipXYlCQkgo9b4FRqGUItFGMNU8lBGXWHBdecuFBFWz9Bbf85Jaw4mmvO8+8us2n+/n9oXYBYXn7+IqjkBimjM/xtu5ZoN4a6JeS0gxcNzVVWqasK7v7cej9J3nzYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a2892a-f880-4f56-e373-08de78fa6f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:56:54.0063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXmPwCG1XFWGOJ2k7j1L5dnFQ23tEXif7+KgxlOouTiRAluCInZI0jHXYI7dz/1nOSNKHUePjyeOCbS/7SNqvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6881
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: D8D2E1EA705
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:robh@kernel.org,m:Chunfeng.Yun@mediatek.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:mripard@kernel.org,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:vkoul@kernel.org,m:devicetree@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk+dt@kernel.org,m:p.zabel@pengutronix.de,m:conor+dt@kernel.org,m:airlied@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:matthias.bgg@gmail.com,m:neil.armstrong@linaro.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,urldefense.com:url,mediatek.com:dkim,mediatek.com:mid];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,mediatek.com,ffwll.ch,suse.de,collabora.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,pengutronix.de,gmail.com,linux.intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

T24gV2VkLCAyMDI2LTAyLTI1IGF0IDA5OjE1ICswMTAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gPiA+IFRoZSBtdDgxNjcgRFNJIGNvbnRyb2xsZXIgaXMgZnVs
bHkgY29tcGF0aWJsZSB3aXRoIHRoZSBvbmUgZm91bmQgaW4NCj4gPiA+IG10MjcwMS4gRGV2aWNl
IHRyZWUgZG9jdW1lbnRhdGlvbiBpcyBhbHJlYWR5IHByZXNlbnQgdXBzdHJlYW0uDQo+ID4gDQo+
ID4gSWYgbXQ4MTY3IERTSSBpcyBmdWxseSBjb21wYXRpYmxlIHdpdGggbXQyNzAxIERTSSwgSSB0
aGluayB0aGUgYmluZGluZyBkb2N1bWVudCBhbmQgZGV2aWNlIHRyZWUgc2hvdWxkIGJlIG1vZGlm
aWVkLg0KPiA+IEluIGRldmljZSB0cmVlLA0KPiA+IA0KPiA+ICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE2Ny1kc2kiLCAibWVkaWF0ZWssbXQyNzAxLWRzaSI7DQo+ID4gDQo+ID4gQW5k
IHRoaXMgcGF0Y2ggaXMgbm90IG5lY2Vzc2FyeS4NCj4gDQo+IEhpLCBpZiBJIHVuZGVyc3RhbmQg
eW91ciByZXZpZXcgY29ycmVjdGx5IHRoYXQncyB3aGF0IHYyIFsxXSBvZiB0aGlzDQo+IHBhdGNo
IGRpZCwgYnV0IHRoZSBjaGFuZ2Ugd2FzIHJlamVjdGVkIGR1cmluZyByZXZpZXcuDQo+IA0KPiBB
cyBmYXIgYXMgSSBjYW4gc2VlIHRoZXJlIGlzIG5vIHdpbi13aW4gc29sdXRpb24gaGVyZS4gVGhp
cyB0cmlja3kNCj4gc2l0dWF0aW9uIGRlcml2ZXMgZnJvbSB0aGUgZmFjdCB0aGF0IGluIGxhc3Qg
eWVhcidzIHN1Ym1pc3Npb25zIHRoZQ0KPiBjaGFuZ2Ugd2FzIG9ubHkgcGFydGlhbGx5IG1lcmdl
ZCAtIHRoZSBiaW5kaW5ncyB3ZW50IHVwc3RyZWFtIHdoaWxlDQo+IHRoZSBkcml2ZXIgZGlkIG5v
dCwgYW5kIG5vdyB3ZSBoYXZlIHRvIHdvcmsgYXJvdW5kIHRoaXMuIEluIHYzIEkgdHJpZWQNCj4g
dG8gYWRkcmVzcyB0aGUgaXNzdWUgYnkgYWN0dWFsbHkgaW1wbGVtZW50aW5nIHdoYXQgdGhlIGJp
bmRpbmcNCj4gZG9jdW1lbnQgc2F5cy4NCj4gSSdsbCBiZSBoYXBweSB0byByZXN1Ym1pdCB2NCBi
dXQgSSBuZWVkIHRvIGtub3cgd2hhdCdzIHRoZSBjb25zZW5zdXMgaGVyZS4NCg0KWW91IG1lYW4g
S3J6eXN6dG9mJ3MgY29tbWVudD8NCkhlIGhhcyB0d28gY29tbWVudC4NClRoZSBmaXJzdCBpcyAn
cmVtb3ZlJy4gWW91IGFjdHVhbGx5IG5vdCByZW1vdmUgIm1lZGlhdGVrLG10ODE2Ny1kc2kiLiBZ
b3UgY2hhbmdlIGl0Lg0KVGhlIHNlY29uZCBpcyBhYm91dCBmYWxsYmFjay4gSSdtIGFsc28gbm90
IHN1cmUgd2h5IGhlIHNheXMgaXQncyBOQUsuIEFsc28gYSBiYWQgd29yZGluZz8NCkFmdGVyIEFu
Z2VsbydzIGNvbW1lbnQsIEtyenlzenRvZiBkb2VzIG5vdCByZXNwb25zZS4NCkkgYWxzbyBkbyBu
b3Qga25vdyB3aGF0IEtyenlzenRvZiB0aGluay4NCkkgYWdyZWUgd2l0aCBBbmdlbG8uIFNpbmds
ZSAibWVkaWF0ZWssbXQ4MTY3LWRzaSIgZG9lcyBub3QgcmVmbGVjdCB0aGUgaGFyZHdhcmUgY29t
cGF0aWJsZSBidXQgZmFsbGJhY2sgZG9lcy4NCk1heWJlIGRlc2NyaWJlIG1vcmUgaW5mb3JtYXRp
b24gKGhhcmR3YXJlKSB0byBLcnp5c3p0b2YsIGFuZCBhc2sgd2hhdCdzIHRoZSBiZXR0ZXIgd2F5
IHRvIGRvLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gWzFdIGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvZmY5MjBhN2NjOTRmMmIwYzAzZDRiYjU1MTQyMDMwZmRl
ZDMwZDA3Yy4xNzcxMjU4NDA3LmdpdC5sLnNjb3JjaWFAZ21haWwuY29tL19fOyEhQ1RSTktBOXdN
ZzBBUmJ3IWxJQm5DUmt5Yk0xb3hvQVJiNzBKbExNUGxYSEtxVzlkd1NtVnFYR3N2ajNMRTloc1d1
SU5rUGd0cmxyOEpsOC1hdE92ellvTWp0YXZIT3IzJA0KPiANCj4gPiA+IA0KPiA+ID4gU2lnbmVk
LW9mZi1ieTogTHVjYSBMZW9uYXJkbyBTY29yY2lhIDxsLnNjb3JjaWFAZ21haWwuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEgKw0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gDQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gPiA+IGluZGV4IGFmNDg3MWRlOWU0Yy4uYWQxMGU4
NmIxNjFkIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiA+
ID4gQEAgLTEzMDEsNiArMTMwMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2
ZXJfZGF0YSBtdDgxODhfZHNpX2RyaXZlcl9kYXRhID0gew0KPiA+ID4gDQo+ID4gPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RzaV9vZl9tYXRjaFtdID0gew0KPiA+ID4g
ICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kc2kiLCAuZGF0YSA9ICZt
dDI3MDFfZHNpX2RyaXZlcl9kYXRhIH0sDQo+ID4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTY3LWRzaSIsIC5kYXRhID0gJm10MjcwMV9kc2lfZHJpdmVyX2RhdGEgfSwN
Cj4gPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiwgLmRh
dGEgPSAmbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSB9LA0KPiA+ID4gICAgICAgICB7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE4My1kc2kiLCAuZGF0YSA9ICZtdDgxODNfZHNpX2RyaXZlcl9k
YXRhIH0sDQo+ID4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg2LWRz
aSIsIC5kYXRhID0gJm10ODE4Nl9kc2lfZHJpdmVyX2RhdGEgfSwNCj4gPiA+IC0tDQo+ID4gPiAy
LjQzLjANCj4gPiA+IA0KPiA+ID4gDQo+IC0tDQo+IEx1Y2EgTGVvbmFyZG8gU2NvcmNpYQ0KPiBs
LnNjb3JjaWFAZ21haWwuY29tDQoNCg==
