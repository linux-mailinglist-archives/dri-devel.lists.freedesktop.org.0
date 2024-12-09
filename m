Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E129E8BCE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036A10E2A8;
	Mon,  9 Dec 2024 07:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Vhgd53Hq";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XUs/SesH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F710E2A8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:05:46 +0000 (UTC)
X-UUID: fac6eac4b5fb11ef99858b75a2457dd9-20241209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=piv681X3WG2qQxaWcGHAQh5cJgIkPNoS7rKm3nrrt2w=; 
 b=Vhgd53HqB//WXaPdYAcsAbqN4hB9rVgG4yAbUQeYc1PVKAMMccJyoUFdYGmJYIEmgKZ8X88MnR4mQ8lLJbc7onT++uH85PiFkkAFNsObaQ0/RjJA69gEmVIhA5PGz1SXni3Yy2KHj+hzkRRr21QkKwwVk8WUISdIFn9EX7J8Z0Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:8a6b2d00-40ef-4f52-93d2-b90799ff3e16, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:d35992a4-c699-437d-b877-50282f19c2c6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fac6eac4b5fb11ef99858b75a2457dd9-20241209
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1620219975; Mon, 09 Dec 2024 15:05:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Dec 2024 15:05:29 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Dec 2024 15:05:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsTSWU5LClEUnw8BxMmy9/68/09gpxwD4BRSY/wsJhYjRMQkYP6pCsdxdV5ziuPtEaYgpFXqe7RtLs7NITk/gxpP6RvfgbV97xFVW1LZnufGk/i0hyBvQz47+oe2lWgOCszXVKcxmjW+T2T2eKE3Wm/pZKLR1xf7bgw74OhXI98h240lhQys2UshCupX9Yu4AjXahIjj9q+6gGcyp7nNlrXW6xcEQfdL9BCMqQ2u2NGyVINdLnIqSET/gLi3mWswcubTmhIRF0hbnwAheekjGfa8kzNzzi76T3tbQZftlxjGDYftOkL5InmuAWbbAHPTCNpyPnF26OhMPTGfQ8guNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3yGpU8LKPrCbVECvPx527DT8D4MyG94Pofy2osgPVo=;
 b=rgrBhEotxsR9+qfGUsspozSdHEgtWz9BPgnKoJT8mHOgX4rUEFTGLWa8wWXTqzhy1byVHafcwjrM8ExLLR9aNZ4NEAkDPEg8QsQAIzmDba7TjaxxaL2ITyYNKkotStXFgrxkIFq8KbLDSGU1cUPY+0tyAnxd2dm2I6ysGHlikib+RKXfYe9ntlUyYvs0AUSSCsHU+qODGSeO5eIUva0+G/ehUSOcGnm5hULbQsnQt7+IPI0Il03+/yZZYnZrNEJsk+C89mjaa2yPYhABWZdGqwGVfbBvI2CPcTnhPABZq96T/9dKrmOGpFBvN7dm54/m6ND8d9xgdN1ziKpvqDnfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3yGpU8LKPrCbVECvPx527DT8D4MyG94Pofy2osgPVo=;
 b=XUs/SesHu0yolsqM8gCudkH/wHuxuFT2N7V7ISBy9+zVTORGLAImJ5Cr15seQa3zL41GBWdSHbf3EmGOjAaf2ykS2nVLO7Rx1EMIe7zGc6t7uDwfAFSHCZrVhwgR4qgA2yuKTU4vJmB3cT7ZZ8sy3WhBBY3Q8uPVUuDn/kpJ6NY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI6PR03MB8708.apcprd03.prod.outlook.com (2603:1096:4:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 9 Dec
 2024 07:05:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 07:05:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbRwuDKzLMLP8gmEqSnf1CFqiN77Ldg1eA
Date: Mon, 9 Dec 2024 07:05:24 +0000
Message-ID: <44ece79531b41ff5827a452cfb9b1e841a09be4f.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI6PR03MB8708:EE_
x-ms-office365-filtering-correlation-id: aa247788-538d-4351-1470-08dd181fda56
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Sy9HUWVpTC9lR1RoMWVIVjhWZ29JSjRUY2ZKRkR5NnNmODBKVS9NdnVzSEtk?=
 =?utf-8?B?eWlwSk5oajVTeSt6N29KajYyV0VkTkJTd2J6VlZUcW9tTk5KLzhHbzR1RFlV?=
 =?utf-8?B?anVmdmFBWTFXbDM4OXFkR01rbXdoaS8zVXl2YnhYOFg5Y3hiQmUySDJWQ29H?=
 =?utf-8?B?eDM3WnFoaW1ma3JqQUl6bGgvMllrWk9YTHdjQnJDNWJraFJWT3dhNmV6M2VS?=
 =?utf-8?B?eEtROE96QkFmVXFwcVBsdnVWZUhYbmdEMDdvUDRUWEM4RWlRdktpa0Flcnpj?=
 =?utf-8?B?OGlVek0vQkdKdmRXaFI3Q2NSL2k0bWtOVnFHVzVNNEhmamt5eU5iV1RCV3lx?=
 =?utf-8?B?SU9tYXlidW5yaXdDZWxhTnU5SWNSVUtCNlB5NzFVeVNRemZrUmNZQzV5TXpr?=
 =?utf-8?B?MCtaZ3FPdDEvdElqeGZXUGNWWG5xTzhGeU5YN1E3akh1S2VkTnFESFpMWkJZ?=
 =?utf-8?B?aXBVazlSV1RjaUx4S2VGY0dpZzNKNFhiVFdLYUsxWkdJUVZyRmJLSDZZeDNn?=
 =?utf-8?B?RGZ2akp0dHZkVkpyc2VtRFN0Y1JTKzJwaHdtbWZjMC96U2pHakhVWW5xSDB1?=
 =?utf-8?B?clBGSngxVE52Qkc3eHVDQmFNZnp0MXhYbE4xRmFUbGJpazUxaGN2K2RobFMy?=
 =?utf-8?B?OUJzdmlhbWhyTmZRL2lGRjMwRVdqdm96b3UxQTdEL0tvTE9rbHdSWjhRQ0hm?=
 =?utf-8?B?QmxQeVNGZGNYQXJwc3RKWlhCWjJKWTc2eXBxdW01VFJydkFpTjJKRysvTDdn?=
 =?utf-8?B?L3N5TWtYbnlld24wMUs5RGNKbUEraUYycjZSRDJ6bHdkRnpNOWRkNHZiTEdK?=
 =?utf-8?B?Rmc5bHgvRE9oK2ZubE5ad0R6dEtqUXRiL25VSWxQTmwvMm43Z0kyKzl2dUZY?=
 =?utf-8?B?d1RVN2lvTDNoR2I1R3BZOUtMd3E5MlkyanhVUVVQTnpPYkpqTnB6NG5MWWFU?=
 =?utf-8?B?SmI2V1hWMlNDT3hYZjk3bzR5cGRCdTZXeEpVNjVVeUdYU0k2Q1N1K2twbzNv?=
 =?utf-8?B?QUZZREk4c2wwYVoxUmZxR3FDOE15YnFHa3Z1ZjZNTER1alVpUkZCZkYvUkJU?=
 =?utf-8?B?aVBiL1BNNmk4WlJQOXQ5YUphVmZzYVQrTkJ6bnBzS3BraWVaaXJYS013aWh6?=
 =?utf-8?B?dmltWnlmeUw5dHVWQTJIWnc5dEl0SGcweTlTNVpSYjZYZk01UmFaVEU0dC9F?=
 =?utf-8?B?UE4wcHV0NzVJdzhHUEUySENHTVlEVnJDT2NzVGNyUFlPQ2czeU0xTWZzYkJF?=
 =?utf-8?B?c2tuN0M2azNYdC9RMVhYUC90S3VhaTgvNGF6WHpTN2tjZmViQ1laWFFrRVNH?=
 =?utf-8?B?Tng1UllCWFUrNVhWSVY4eXBHVDVUWmlFOTYyNnJUQmQ4QTd2VlZPbUU2SUtu?=
 =?utf-8?B?aU15ZS81dG1LU3VNbnA4K2JTQlFYQTJsbEt0Y2lMaWtXMkNNTjJCM2hWWXdr?=
 =?utf-8?B?L1FiUFczK25xcUpPYlVhaEl4SlQ0OGg4ZzZIN0xGOVNNR0cxOFhOSnJadlFs?=
 =?utf-8?B?M0tKRnJzcExxd1FhOEJZaktIUUEwbkFQSStOV2pkTm5ENzQ3YzZ0SXFlbWI2?=
 =?utf-8?B?cEJLRUgyRHhLRlFBNm1yU1dKTUFkQml3ajdjbWdqWnhIbHlacEplS0RJamp0?=
 =?utf-8?B?QjRCQWxlelZyYURSM0pYTGI3RGFlTUY4MWd0ZUZ6YkQvUVNHbUdUdThzZFl3?=
 =?utf-8?B?Wm9zWXRKM2N2WU1mRUsxb1V4ZGZaYjNYSkZXdWdESkNKdmdnZStNaUxHQjFD?=
 =?utf-8?B?K0RZUGYrcjU3SFdnbmlBdXprZTRzV0tGS3p5M2dJb1k2cVRMbU8zTlZRY05a?=
 =?utf-8?B?Qkt3bG9sZldMeWJYc242ODFKK3ovS210MlJqdzFmQzZFV1JmVEtNVkNxWmo0?=
 =?utf-8?B?dWFwd0JjYkgwOGdPand0ODJ2cWljcXYyeFpNMEd3eDFicmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHNCdWlzN2hHTEFJQlRBREVFRGFsSUd0cmtTcjJtQ0sxWGhEZEtLdmU2Wnhp?=
 =?utf-8?B?VlZWNlBCR2IwT3dHQ09nL0oxejE4QU9JYldaUExMOUJjQ0Z0ZTJNSEZ6Sjha?=
 =?utf-8?B?RW5YL2kreGlXVVNoUXJBRFI3TnhsT3kxTTd2WjRkR2dONGs4dTFUeEEvV0Rl?=
 =?utf-8?B?THZZNFdrTnlqRVFhZ29EUk9tTzFSNDRPSi9qdDhuank3dVFKMzlrRDl1OUx4?=
 =?utf-8?B?WGFQekNNcnUvM2N0YVNzUFFBOVJUcHFJbmJCSUY5dUh1REw1bFJBR2xXVFo5?=
 =?utf-8?B?dGU3TitKTENseGwvazBKVk4zclVOczBVeVJOcEJRZHhFZGVpdEl3ODdORytO?=
 =?utf-8?B?Ry81bjRBUGpZU3owaVpSSlRzMlo0SzF5dGZwS0hjdWZVckZlMFhWVThiZE92?=
 =?utf-8?B?dkpjTzBRM1lVY3BrbWo3dXI2VmMvby9Gd3BrOXU1enluTWRyQkFOVE5PNXB5?=
 =?utf-8?B?N3g1YVVJWnU2RWMzbXNibHpIYnF3K2cvSlVPYjNyd21GWE9USzJXQTZsbEJw?=
 =?utf-8?B?MVdYaHRSR3ZlTVFJa3M0QTQyNGozRWdoL0ExRzJ5eXl2QTdvSHlnUE4vUElQ?=
 =?utf-8?B?T1ZQdk16RmFQaDZvdC9CbnZBN04wMktlT240dS9DY2Iwemg4dE03eEhmSGli?=
 =?utf-8?B?bVFod0F4UzM3R1lIbHRUb2JuZE1ibTBUYkpsSnNQTTdGcG9jNTdSMnZTNmth?=
 =?utf-8?B?TC9OcXVSVFRLZ1ZRblVvWDcyZEhMR2d5Y25TT0tJamtoVm9RUnIwbVhIK3Ra?=
 =?utf-8?B?dEREQ3JNd1RYYTU0ZG02VEtTM3p5dGc2cGZkOXJlaUloeElDV3ZmK0VZaWtO?=
 =?utf-8?B?Mis1THJZUkM3VTdvV08xWjc4VnhaSVY1blJLY3BDaUkxYlRsaWFxUmxHazZ2?=
 =?utf-8?B?eVI1bTdtcXZMMVFwQndIMjJMVm1WQzNlL203cHRFcm1tOGRrOHREZE51R1RO?=
 =?utf-8?B?dWlPYWZNTTdZTFFtbXFDWlJ2ZENqTUJBc2FFcDMxRHd4cGg0L2s2SDVVSlZY?=
 =?utf-8?B?aXBWdklPc2lyN3k5MktoclBJeWdBaEV4YUtQTi9zcEpDYldRYlptWjdKTXlx?=
 =?utf-8?B?YmZEM25yZGg2MjhrRmpSQkxrTWp2d0dHR3M1bnJLd1ppb0hndEVYWUdGYUxk?=
 =?utf-8?B?RE5pUFBLNkJRT21zWDNubHJaMEUyNE92ZUlLU1V5WVNIdG4zc3IxZm5zTG1J?=
 =?utf-8?B?cm5ETE5ZN1o1Wi9DY3UrL3lETGIrdGl0UjE4dUJxK2JtT3RlN1pnZk1SLy84?=
 =?utf-8?B?UFllOXVnWmJmdTVqWVhZa2NMZCs3TnBnRno2T21UOG8xRXdoQ1Z4RkpUQ2Zo?=
 =?utf-8?B?UGxSZjYxR212N2Rhb3c0Nnp6VUx4S0pJRjgrZGRUdDFsZFZzVTJNUk5yMlpU?=
 =?utf-8?B?Y2lwRm1rUXdzRkRYQk45WWhLbUxhUDE1czhtb3ZEc2NoQlpzbVpiY3FjcGQ3?=
 =?utf-8?B?dGhESTI2WmV6TTZVd3Z1aDJJTnZKcGdFRUs5aW8yRXd4b3ZXRkh1bWVPZldk?=
 =?utf-8?B?emIwb2VDWWdhbFd4QndUbVBxVTYyWXFYNzJ6ZDUvNGJNOEtYdVZDWmRFRlhR?=
 =?utf-8?B?Mm9UeUlwU2dOUU9BclRqMldqazRGUlNDN2dSN0x4YnhJZkIxazl5UlhQQXB3?=
 =?utf-8?B?RkFzeUpseHVRQjZtVlpkQzlpYW1raDhLWEQ1ZHRvNHk1d28ySDNIb2svTjVk?=
 =?utf-8?B?NGZDTFhFSjdwMThPa08zazJQVmlhQkI3MlZhNDFEcEhZd1B3TmJBTS9hYW03?=
 =?utf-8?B?MW4zVG54eGxqNFFRdW5URG9kbTNMWlpxL2dMMUJtNk82SXhFVEhPWm43dEtB?=
 =?utf-8?B?OWtkZWcwa0o4SFVrMGVvVUlhYUhxWDR4NHUwV0M0UlRUYnBTUUxXdndqNTgy?=
 =?utf-8?B?VlBxM3o0REQ1RnRkbEh5aUtpeVB4R0V0U1B0UzFqNDM2YjNlVXBnTExRZ3Jm?=
 =?utf-8?B?VTYrVHZhTFZFNVdoZnFYVW1DYXU2U1pnTzUvU0NOTWlKTjF2cmZvWHZDa094?=
 =?utf-8?B?bjJmdGhoV0w0MzhjSUpra2VITzF0S3hRVHNhVklRVEdNb1ZNcE9PT1lVZ0pj?=
 =?utf-8?B?QXZsalRvL0JYcXV5dklSNjFMdTNENmhKanBqdmNOSHVscDA3a3pJd0xzcXZE?=
 =?utf-8?Q?sYQLpOO4kiOMhrW4NKYyLWRFH?=
Content-ID: <E1189FA86341674EBCB2C6A9150A69B6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa247788-538d-4351-1470-08dd181fda56
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 07:05:24.2525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2wstE3+/2m3wp+Lv0Bqgojme+kV4hsvpkjFE0tytzeSWKxvd8CU5Yv6pkObkWNWdxZNpnbC1VktmxKsc/zcGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8708
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.034400-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCrfUboIp1QbVuIwLnB3Aqp24vBuE2X0HlVwpnAAvAwazkaC
 qYviih52NKaasnxJAFjDDWg3cV0z4m0qYZR+CUBKQOktEo73GFCi16p3/NdojiXsSKMOe37ejxY
 yRBa/qJRVHsNBZf9aRPcCXjNqUmkUgBwKKRHe+ryk0tGfErVQaAeWp1XE0g3Zwon9/fGnMDLItl
 YeVf8EnnoSXXF5S6nc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.034400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E73D15B9134C0A27CBB5191CDE57352DA52C9E6DEBE20459BE2629B39F6B7E182000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_128590769.1910519433"
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

--__=_Part_Boundary_003_128590769.1910519433
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICtzdHJ1Y3QgbXRrX2hkbWlfdmVyX2NvbmYgew0KPiArICAgICAgIGNvbnN0IHN0cnVj
dCBkcm1fYnJpZGdlX2Z1bmNzICpicmlkZ2VfZnVuY3M7DQo+ICsgICAgICAgY29uc3Qgc3RydWN0
IGhkbWlfY29kZWNfb3BzICpjb2RlY19vcHM7DQo+ICsgICAgICAgY29uc3QgY2hhciAqIGNvbnN0
ICptdGtfaGRtaV9jbG9ja19uYW1lczsNCj4gKyAgICAgICBpbnQgbnVtX2Nsb2NrczsNCj4gKyAg
ICAgICBib29sIGhkcl9zdXBwb3J0Ow0KPiArfTsNCg0KQmVjYXVzZSB0aGlzIHBhdGNoIGlzIGEg
bGl0dGxlIGJpZy4gU28gSSB3b3VsZCBsaWtlIHRvIHNlcGFyYXRlIHN0cnVjdCBtdGtfaGRtaV92
ZXJfY29uZiByZWxhdGVkIHBhcnQgdG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guDQpUaGUgbW9kaWZp
Y2F0aW9uIGlzIHN0aWxsIGluIG10a19oZG1pLmMNCkFuZCB0aGUgcmVzdCBwYXJ0IGlzIG1vdmlu
ZyBjb21tb24gcGFydCB0byBtdGtfaGRtaV9jb21tb24uYw0KDQoNClJlZ2FyZHMsDQpDSw0K

--__=_Part_Boundary_003_128590769.1910519433
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTEyLTA1JiMzMjthdCYjMzI7MTI6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjthJiMzMjtuZXcmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0
aGUmIzMyO0hETUkmIzMyO1RYJiMzMjt2MiYjMzI7SVAsDQomZ3Q7JiMzMjtzcGxpdCYjMzI7b3V0
JiMzMjt0aGUmIzMyO2Z1bmN0aW9ucyYjMzI7dGhhdCYjMzI7d2lsbCYjMzI7YmUmIzMyO2NvbW1v
biYjMzI7YmV0d2VlbiYjMzI7dGhlJiMzMjthbHJlYWR5DQomZ3Q7JiMzMjtwcmVzZW50JiMzMjtt
dGtfaGRtaSYjMzI7KHYxKSYjMzI7ZHJpdmVyJiMzMjthbmQmIzMyO3RoZSYjMzI7bmV3JiMzMjtv
bmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO3Byb2JlJiMzMjtmbG93
JiMzMjtmb3ImIzMyO2JvdGgmIzMyO2RyaXZlcnMmIzMyO2lzJiMzMjs5MCUmIzMyO3NpbWlsYXIs
JiMzMjthZGQmIzMyO2EmIzMyO2NvbW1vbg0KJmd0OyYjMzI7cHJvYmUmIzMyO2Z1bmN0aW9uJiMz
Mjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y2FsbGVkJiMzMjtmcm9tJiMzMjtlYWNoJiMzMjtk
cml2ZXImIzM5O3MmIzMyOy5wcm9iZSgpDQomZ3Q7JiMzMjtjYWxsYmFjaywmIzMyO2F2b2lkaW5n
JiMzMjtsb3RzJiMzMjtvZiYjMzI7Y29kZSYjMzI7ZHVwbGljYXRpb24uDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfaGRtaV92
ZXJfY29uZiYjMzI7ew0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7ZHJtX2JyaWRnZV9mdW5jcyYjMzI7KmJyaWRnZV9mdW5j
czsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbnN0JiMz
MjtzdHJ1Y3QmIzMyO2hkbWlfY29kZWNfb3BzJiMzMjsqY29kZWNfb3BzOw0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y29uc3QmIzMyO2NoYXImIzMyOyomIzMy
O2NvbnN0JiMzMjsqbXRrX2hkbWlfY2xvY2tfbmFtZXM7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpbnQmIzMyO251bV9jbG9ja3M7DQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtib29sJiMzMjtoZHJfc3VwcG9ydDsNCiZn
dDsmIzMyOyt9Ow0KDQpCZWNhdXNlJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7aXMmIzMyO2EmIzMy
O2xpdHRsZSYjMzI7YmlnLiYjMzI7U28mIzMyO0kmIzMyO3dvdWxkJiMzMjtsaWtlJiMzMjt0byYj
MzI7c2VwYXJhdGUmIzMyO3N0cnVjdCYjMzI7bXRrX2hkbWlfdmVyX2NvbmYmIzMyO3JlbGF0ZWQm
IzMyO3BhcnQmIzMyO3RvJiMzMjthbiYjMzI7aW5kZXBlbmRlbnQmIzMyO3BhdGNoLg0KVGhlJiMz
Mjttb2RpZmljYXRpb24mIzMyO2lzJiMzMjtzdGlsbCYjMzI7aW4mIzMyO210a19oZG1pLmMNCkFu
ZCYjMzI7dGhlJiMzMjtyZXN0JiMzMjtwYXJ0JiMzMjtpcyYjMzI7bW92aW5nJiMzMjtjb21tb24m
IzMyO3BhcnQmIzMyO3RvJiMzMjttdGtfaGRtaV9jb21tb24uYw0KDQoNClJlZ2FyZHMsDQpDSw0K
DQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioq
KioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVz
c2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBw
cm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9z
dXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXll
ZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5h
dGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJl
Y2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4g
SWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBi
ZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_128590769.1910519433--

