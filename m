Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAHdJlxhnmn1UwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 03:41:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF0190FFD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 03:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBE310E1D9;
	Wed, 25 Feb 2026 02:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mMA0Vyj9";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="a3RMj0KI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C9810E1D9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 02:41:23 +0000 (UTC)
X-UUID: 737eb12811f311f1b7fc4fdb8733b2bc-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=t/5rCxajTUNuCd4cs1oaE5XY5NGginUoJX7vk7SQSec=; 
 b=mMA0Vyj9xm68gkMp2Cn/MUq08jKZ9lXzvtUG3kbwJPaHbVLxEqnbhsIoVZWj8wWXFY/PiMu+t4dbvd/LHPyRDynf3RpLB1cc0DGwhKjXSeiylecnVU1j6N6HuxC/Dr9uR0rXBby9N0pcFj9Ssb7pPXXlvrudbjFqDi0bTT2utys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:47a6ddc0-c63f-4a14-84e5-b480dc0875e1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:915b3c7b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 737eb12811f311f1b7fc4fdb8733b2bc-20260225
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 871331491; Wed, 25 Feb 2026 10:41:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 10:41:12 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 10:41:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrXmBWUjfnDL3yt2t+u3/YSyuOWZgFqr+vi+N/jxbcPUj6Jz534zWeTtD24Yj06UaWCFbdVlSsIHtmuEKPiilFC+dcsSPOoZpP9UfrfDwjdkh/jz5xz6chdeX0FzqooDCJNNhpUId2MHP03zH9tk/NNdWHfpge/aCEH3KN7cvPg673kZUFrYHQCzEWv8ooM1+0deTuPaTBoyM5Xkdtl4FkIrToIEuEV6y7hn7ec7tja6DEU3IuLOUqtnFWQi8B2tptbDTWqO8TimS3WTAhlUwhzRMRwmqDH9T23JAZn06LVtAEzul0NU4r2/SN/55WOlMKIzHV0Ss9bl7Z4EjI/5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF86GcUqIXAPJZboujCxbflL7szf619HZhme+zOctOg=;
 b=bZ1pKMmXUx0a1vHes1HR09IDfizIm1ExjI4Hj7BJ1UA/hVyG0RscuF0Vc9OdpHf3qLEiUn6GTmthf8LsS++UBaSfsblQM8HWwwLLof7N0Nsm/S6OJfS4Mh3g7REjaGL7POwZ8f2MEJ0/ZtU2FhzT5VTiySB1wKbH/9+JsR8lPcQy3C8bwj9IPtrXRgGqmfp2jOAIVsRHltN9wnTVCzJTZIGS+OQp8FkTUa5HiE6A/kNbQhag0aFJgbcBGDbdgo7iIznhBQ2NDh2pzi9G18ULaKqOnSFv0gc87UkXcFB9ZIaRyiguHj35rzmC65fcNfyWOM/1HqM3DxROCEEbDYpc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF86GcUqIXAPJZboujCxbflL7szf619HZhme+zOctOg=;
 b=a3RMj0KIKxcdui23cOFzTSMcZ8I00Ab9kyYDPZDXOrkL43C6U57SI20oJgWBiWatQho9RwiUDTRvT1EvEAMHpGNiSzTqvJZGpwd3VltAWwZyTf3O9aAGR8Ac9Rby+iB1SriRp2+KvqYSWqB05ehdvaWepmbPEW1QU+BZaqMVRpk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7159.apcprd03.prod.outlook.com (2603:1096:301:111::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:41:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 02:41:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Thread-Topic: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Thread-Index: AQHcpOFKeerDVVvn8keTXR6yIV+Y0LWStpuA
Date: Wed, 25 Feb 2026 02:41:03 +0000
Message-ID: <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
 <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 3a108148-5b9a-4ce8-9774-08de741751c1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Rk9XRURRelFlQnJWN3ZFSVpmc1ZFS3hYbDc4QXZmaGFQL2VzSWhVckJ6MUdt?=
 =?utf-8?B?SkRubzFNUEZPUkNVZU5tNmpZSUZZUGZha0ljZXkzYytGalUyRjVTVmYzdHVN?=
 =?utf-8?B?cU55QlFIWFZyc29OZFBGbUlzMFJaWGU1SktGa2lpcEdQbXhBY2VIbEk4a05V?=
 =?utf-8?B?Nzh3clczZHc4OWlnZWswVmM4MStkU0d5UGdBdlVuYTIydm5QNmNHdHNqSnda?=
 =?utf-8?B?U1Z3NUNEOWNyWHRUVTYzVmJNSHdUT1B4ZWtRdiswb2JSYUJkNUV3eExJOXZH?=
 =?utf-8?B?dktmVm91L2xFczBJZjIyMW1lZDdobTNVTXczd2FtaDFsOGhqMG5XRGFjRDJj?=
 =?utf-8?B?cWorNENDVGpaZDVUY1ZUMkFhRUQ3NGlVRmt3a2pHMnQyejhFMjBMT3VoYTAy?=
 =?utf-8?B?Y3UreE56ejAyVmhPR1BwMFhCV1AzMU1acUFNejZicTdNbGF3RXl5bzA2aUx3?=
 =?utf-8?B?ZGdSRE1zMG13eE02YitZc1dQNnJFQjdSOWNENDU3K3pHeEJ0d3pwK04rREpr?=
 =?utf-8?B?VndYSS8xcVh5aGF5WUJjMW00bElPOWt5eDBYdUc1NmNPRjE3SmtvSUxRQXVM?=
 =?utf-8?B?amdnZk9LMnpnQXk5bjVYZ0E1aU4zUmVCOEppWStRUFlLRVlaRGRJNEJTbkVj?=
 =?utf-8?B?RlQvVkx4L2xEUWtmbEgxOHRHR1M3emttU0p4RlZSY1AwcnRlWDhBMGhmc2RK?=
 =?utf-8?B?aU1pZ1dsVk91VEI0UlJQQnpuNzFHMzRicHljL3pqMjdGZ3dXQjZWSU9hRnJh?=
 =?utf-8?B?NjFVeEpKMC9WdE9EbUVEaHpSSGJ5RUsxVk1pTFZNNUhWT2FxdXhISzlBRnY3?=
 =?utf-8?B?Z0k3bkdkY3Y1Z3A0RDFSaFVBREFvRjRQdDlnZ3hVUTIvN2NNemtab3pZUzFq?=
 =?utf-8?B?YzBFb1FuNUFkQ3NHSThiQjE4WUMwZ0l6amREMFhyamM4V1BpcElJeDNZbHVw?=
 =?utf-8?B?eGpNRklsTEk4VGgwclhkeEg0dzFyMElNZXhmL2ZHWVlRUTNkRjMvZEFCQXN0?=
 =?utf-8?B?UFhtUEgwMXdoWi9KMFBUTWIwTWFnUHgzNDZPUFFUQyt1UHAzMHNhVnQvOU9W?=
 =?utf-8?B?SXJsUXZhQXhpdjhWTTVMWThrNm9BdW5nRHR0aURDeUh5NTVNekc1WWF1OVBz?=
 =?utf-8?B?NUpDZzlJZzRnTnUvN0VHSk16emsrZE5XckdrK3lLZFpIQ1FBTlBMeEl0Q1Zu?=
 =?utf-8?B?VUUvTjFKKzNNVWUyNWY1ODREWmQ1RTd3dUZsRnNabFBzNmdITktxMFFSamdF?=
 =?utf-8?B?a05Lam9zTGVWRWp6eUlyUEVwaGprQ3ZWb0t5SnFhVENnaEdmTExkaERvd2FT?=
 =?utf-8?B?MTBoN1ZlSmcwRDZnZUdpa1U4ZTVnYks1b1R4Y1VoY1RKM2t0L1d1UE4vbDRs?=
 =?utf-8?B?UENCd3RlRzdwSXBhUE14NklSTy9lSnVBTWphZkdmN0N2WnpxM3hvMjR3ZGd3?=
 =?utf-8?B?QlVIU3dwYUpSWWxKWkdMMlduY1FseVRtMFJmd0RLc29mRW0wK1U3M3FBR05k?=
 =?utf-8?B?SGM1OUkrT3premw5WGtMZlFRcGM5MHQzdWVDK2kyU3VRNmFnWE5uMDQyVkNu?=
 =?utf-8?B?OWJVZ3VNM1NIaUlwamhMR2ZoaGhGc1dObDdKYUpmTzhqbGNwM2pUZEZqMlRP?=
 =?utf-8?B?R0VxTDRjUUhlYnMvUlFiUEhmSWova2l3Y0RlTEs5UU1tYW02ckN2N1RkbkRN?=
 =?utf-8?B?UEZmVXNWaHNNWmpySW4xeElpazVOYlMvU3JBWDg2aXZnRlI0K2cvQTBvbVpl?=
 =?utf-8?B?OUdqelQrVHNBVzlmdUluMXBGYjFraHY0T2tvTjZFTTF2aWI5dDVtcVRtZExJ?=
 =?utf-8?B?eEJ3WXErN2ZUVXZsZW9NNEJ5cEZPVEtXa2lqNTFpb3c2dG92QXJXQldxR3hJ?=
 =?utf-8?B?UjV1UlU4eXhzNU11WUppV2Y1eXhqa0dxWXh4eXhFdFB4ZnFwbWI1dVdrK2Uv?=
 =?utf-8?B?ZWtYZTNmZlVnbStLUHlJaFN6WlNBOTNvbkhDUUhCMURoT2d5TUVQWVZEVzdZ?=
 =?utf-8?B?Sis5Y1kwci9zeW00RmlyRXNqS1h2OTAxcXVaUlVnYzJ5WVJCZ1BMakZmZ3FI?=
 =?utf-8?B?T1B0UHpKVGkwVzNJNFltVmdpUUZVS1gvRXNEVUVSQmlVYmgyOGl3WnVhc0JT?=
 =?utf-8?B?SCtUU3N0eVBSNS9QdzltMXRKUHBaU01iMDliMUxpK25GSiszT3pJbCtnQVZ4?=
 =?utf-8?Q?0OoLZsWP69CeKmSOxiMPn6I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1EvV3BRWi84dHI1QkpFdTh4Vnppd2tCck00ejBvaFoyRWhzdWtyUHZBZk9H?=
 =?utf-8?B?QVV2OEtUZTg3TllQU1ZYRlNZRytsUEs1RlkwZTZ5WHNZdXdUNGVUeTZCZDIr?=
 =?utf-8?B?K2FEVmllWFMvOVpQYmlXa2hUOEg5VjVTZm03dTg5MjVvZzl4SnBKSWRERUxm?=
 =?utf-8?B?Vk52WkQxNUorTEx5UmorMmZaYWtTLzVoeVZUN1E3Um1aaS91TkxPOFBub3RL?=
 =?utf-8?B?Ni8zQnNwS055eUVHdlpSUjhhR0s2enBEOEFuVFd1N2Y4Z2djcXBibDlOeURI?=
 =?utf-8?B?MmVKVEZJazNraFR5NUtYR2NzNlVPQTJwdStxcFF1NEJ5TEJYVTdSenBsUEoz?=
 =?utf-8?B?ZDUzamxJb2d3b3N2ZGNoOCtCMStXa0FtWXd5VS9zUm5yMFZMZUpSTXdFUGV4?=
 =?utf-8?B?M0YybUgwUXNiR1FISlB0Vys3OXovOG02WmNrVFBVVytaZXRQcnFtYWsvQ0Qx?=
 =?utf-8?B?S05JanlsNTA1Zlp4L2loeG41RGpFSENwWm9SYzNJL1QvUDRxWmpIQ25tbENR?=
 =?utf-8?B?YUxzcjJYcG5ZVmREODlxWjlqN2o2L2pWLzY3UG1MSXYwTzJSWXF4bVBRa1dk?=
 =?utf-8?B?WFVWanIzZ0pKVjNxVmxCY2o4WkNYaHVCcnlMR1cvNVBIWHV6V0lwWHdVSFR2?=
 =?utf-8?B?WWdZaWNkNlFwU0RmM2hnRGdoY1Vzc3dISDZ2dzZyMFJVUDl6bjRJWTNHS2xH?=
 =?utf-8?B?OTh6SVAreXdEMDRNUUtuY2hQREhWV0VMSkllV3RqUnQ2Z0RqR1VzWklJK3BC?=
 =?utf-8?B?cVVWYXJKUUtHQXR3V05lUDZpTzlYZm5TcmRTaWxNZENGQTh0YlRHMlI0cGVw?=
 =?utf-8?B?NHRMVWxMK0c2NHlJelcvYmk1U0gveEdiVy83R3N1WWRNZWVLeTBwcXRaYi90?=
 =?utf-8?B?NE5hakxiOWI3LzJDd1ZkbldqOEEyR09pL3ZxaW1SS2RZeHpDSGk0bVQ3YVh6?=
 =?utf-8?B?c1lnNTZRNXRGcEFxVnhsOG12T1pxd0JOK2poNUJ4clo5QXhJdWpicE00L2h1?=
 =?utf-8?B?SFFWQU1ZSC80dCtNZ1dERlBFTThNenhDeU1vRVZxTzI3QTRqR0JCQnE3Nm9k?=
 =?utf-8?B?akppRWdmWWo1dVk2ZzEyNFpGaHlSSWRCc1dOejUzOU5DMDhFbC82ckhMNUM4?=
 =?utf-8?B?SDhFd2NDWTRXZEU0U01XWmsxZTJCWDE3K3ZuTTJud0RaL1ZtNGdPM2kxR29u?=
 =?utf-8?B?cUNmeE95dDljWTBrT2dMbm50K09Fcy9HbGlnZXowOEFRZ211bHNJUVByTkxn?=
 =?utf-8?B?SkppNURwMkx5VkN6MnFXbGZJUUlWSVZwaVozVWdtVGY5eXF1MnowL1M0ZVdR?=
 =?utf-8?B?K25WMG9neVNpM2hDWlJTM20raTNoY3l1WkxFcisyTEJBdGt5NkpwdTdVL01P?=
 =?utf-8?B?QzBXdVp1TWxrNDBMenJGM2p2cTJFbEU1YUhuV0piTURuVTZlbFdPWlZLTmZB?=
 =?utf-8?B?UE9PNXh3NTVXSTVEVnUxd0Nxdk1pMTZBSFJMYXdLclkzemxZcFhQb0xlMENk?=
 =?utf-8?B?SldQQUNiMk1QaEU1Mi95YnF0Qi9rNWVOd2Q4NkJmaGttTVdZRFBXSk4vNUk5?=
 =?utf-8?B?c283Yk5mWDd6ZGpiWW8ramNaTURLUlZYSXBCdjVHWlNXcElTazczSWVJZTRV?=
 =?utf-8?B?ZjNkNk1pNnJ5Z3ArQ24zSGxyOUJQMjczM2FQUDdpdkx5eHJFN0RmcC84YzZt?=
 =?utf-8?B?QWhBdVBmd2hwczhIRStIUGsyNEsrVWV0dXVvU0xCNTdTSVRvWFRERkxEWHFu?=
 =?utf-8?B?b1dEWklvTWxxQmxycGRQSm5MTStvRXV1NU5HellzSkJFS2RGN2QwdVk4WURT?=
 =?utf-8?B?MTZBdXpYdEZjcENvQlJXZEUxMUYzNlZ4YjdNWXpzbDBvR2NLcXR4eUpRazBr?=
 =?utf-8?B?TjkvRWpGQ0E0Qk9MbHkxY2JUNnFxL2Y4MGc0R1prbjN5Z1B6U3FnMmZFNUJl?=
 =?utf-8?B?cS9lWUZaeTcweGJ3OWJTZnQzWlFmMkNaWld4TVBTRytLQTdvbHV4OGhkeTJC?=
 =?utf-8?B?UU10NnIxaEcrSlEzdVpGVmNpREw4SmdKc1FjQ255dW5pNUtNREhLNGJQUFBF?=
 =?utf-8?B?NlhEUGhnbi85RnZPQmdLWVlYdmZlbG9HdnUxUmhSOEJiYjU5RkE3ejF3N2ww?=
 =?utf-8?B?R01FRGY0Y05waWlrWjRqL3JRaDZ4ekVCcUcrQmxtZ3gvOCtPY3lmWFJ2VHY2?=
 =?utf-8?B?cXA3K2I4UmVvbFF1TUZrZkVMc0djVjZGcjFtbzhQMGNIaTdPNlFFRkRncHI0?=
 =?utf-8?B?eGtnSmhyOUl1UEc3NVZITEp0WXRHMnA5VWZXNzhvaGlBdFUzWjBuM0plVkVF?=
 =?utf-8?B?V05lOTFEcnYvaXN3Q2VkaWJaaXAxYU4vOFJGdjhpUXZyMlBQUElWQT09?=
Content-ID: <D605CE72D2C72A4298D19A2EF9561AAF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tidcGHRNlX7SIjX9fj3hYY7u+ZfcKP3Zo+6Xv0s77TW5l8jdMNVFBW4o3MCl33AzfOoRUZju8Aln73K1pgcHhesIKLExtB9L8Xt9piElxHudoFpClUm5aruHXj3Yev/Z7u2L/IbMkTzU5jCSG3XXsArDgYJmM1rwYYYE/b708WAs7b0SAxQ8wZaQZnlMQdBR1JWnm+A0bUfBJ8yVUj49OQz4aQRL0iUOa0CAxOuBzFD0jn44mOeb4nGhNP82C0e3STq/J0lksYYicNNTD/49aC6mO6fGjfoBui8kAZ+Nd2IyvKeWJ36V2eddQm+E7J8ngLcLa9lPMhvzeMwAFMugmg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a108148-5b9a-4ce8-9774-08de741751c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:41:03.7848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGKnZMyw6Z6ubW9AUiR9MIOUDYvM5Ve53ag9IdAsECMqlA+wPpKtvHwYHDgTx+8Ta7Ann64/IpolDhmtlJ6f/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7159
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_10681360.1573626776"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:robh@kernel.org,m:Chunfeng.Yun@mediatek.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:mripard@kernel.org,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:chunkuang.hu@kernel.org,m:vkoul@kernel.org,m:krzk+dt@kernel.org,m:linux-phy@lists.infradead.org,m:p.zabel@pengutronix.de,m:conor+dt@kernel.org,m:airlied@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:matthias.bgg@gmail.com,m:neil.armstrong@linaro.org,m:devicetree@vger.kernel.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	FREEMAIL_CC(0.00)[kernel.org,mediatek.com,suse.de,ffwll.ch,collabora.com,vger.kernel.org,linux.intel.com,lists.freedesktop.org,lists.infradead.org,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEDF0190FFD
X-Rspamd-Action: no action

--__=_Part_Boundary_001_10681360.1573626776
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE2OjIyICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gVGhlIG10ODE2NyBEU0kgY29udHJvbGxlciBpcyBmdWxseSBj
b21wYXRpYmxlIHdpdGggdGhlIG9uZSBmb3VuZCBpbg0KPiBtdDI3MDEuIERldmljZSB0cmVlIGRv
Y3VtZW50YXRpb24gaXMgYWxyZWFkeSBwcmVzZW50IHVwc3RyZWFtLg0KDQpJZiBtdDgxNjcgRFNJ
IGlzIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCBtdDI3MDEgRFNJLCBJIHRoaW5rIHRoZSBiaW5kaW5n
IGRvY3VtZW50IGFuZCBkZXZpY2UgdHJlZSBzaG91bGQgYmUgbW9kaWZpZWQuDQpJbiBkZXZpY2Ug
dHJlZSwNCg0KICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRzaSIsICJtZWRpYXRl
ayxtdDI3MDEtZHNpIjsNCg0KQW5kIHRoaXMgcGF0Y2ggaXMgbm90IG5lY2Vzc2FyeS4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTHVjYSBMZW9uYXJkbyBTY29yY2lhIDxsLnNjb3JjaWFAZ21haWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxICsN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQo+IGluZGV4IGFmNDg3MWRlOWU0Yy4uYWQxMGU4NmIxNjFkIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTEzMDEsNiArMTMwMSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDgxODhfZHNpX2RyaXZlcl9k
YXRhID0gew0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kc2lf
b2ZfbWF0Y2hbXSA9IHsNCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Mjcw
MS1kc2kiLCAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZlcl9kYXRhIH0sDQo+ICsgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZHNpIiwgLmRhdGEgPSAmbXQyNzAxX2RzaV9k
cml2ZXJfZGF0YSB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTcz
LWRzaSIsIC5kYXRhID0gJm10ODE3M19kc2lfZHJpdmVyX2RhdGEgfSwNCj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kc2kiLCAuZGF0YSA9ICZtdDgxODNfZHNpX2Ry
aXZlcl9kYXRhIH0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODYt
ZHNpIiwgLmRhdGEgPSAmbXQ4MTg2X2RzaV9kcml2ZXJfZGF0YSB9LA0KPiAtLQ0KPiAyLjQzLjAN
Cj4gDQo+IA0KDQo=

--__=_Part_Boundary_001_10681360.1573626776
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjYtMDItMjMmIzMyO2F0
JiMzMjsxNjoyMiYjMzI7KzAwMDAsJiMzMjtMdWNhJiMzMjtMZW9uYXJkbyYjMzI7U2NvcmNpYSYj
MzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYj
MzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0
YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUm
IzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtUaGUmIzMyO210ODE2NyYjMzI7RFNJJiMzMjtjb250cm9sbGVyJiMzMjtp
cyYjMzI7ZnVsbHkmIzMyO2NvbXBhdGlibGUmIzMyO3dpdGgmIzMyO3RoZSYjMzI7b25lJiMzMjtm
b3VuZCYjMzI7aW4NCiZndDsmIzMyO210MjcwMS4mIzMyO0RldmljZSYjMzI7dHJlZSYjMzI7ZG9j
dW1lbnRhdGlvbiYjMzI7aXMmIzMyO2FscmVhZHkmIzMyO3ByZXNlbnQmIzMyO3Vwc3RyZWFtLg0K
DQpJZiYjMzI7bXQ4MTY3JiMzMjtEU0kmIzMyO2lzJiMzMjtmdWxseSYjMzI7Y29tcGF0aWJsZSYj
MzI7d2l0aCYjMzI7bXQyNzAxJiMzMjtEU0ksJiMzMjtJJiMzMjt0aGluayYjMzI7dGhlJiMzMjti
aW5kaW5nJiMzMjtkb2N1bWVudCYjMzI7YW5kJiMzMjtkZXZpY2UmIzMyO3RyZWUmIzMyO3Nob3Vs
ZCYjMzI7YmUmIzMyO21vZGlmaWVkLg0KSW4mIzMyO2RldmljZSYjMzI7dHJlZSwNCg0KJiMzMjsm
IzMyOyYjMzI7JiMzMjtjb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxNjct
ZHNpJnF1b3Q7LCYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQyNzAxLWRzaSZxdW90OzsNCg0KQW5kJiMz
Mjt0aGlzJiMzMjtwYXRjaCYjMzI7aXMmIzMyO25vdCYjMzI7bmVjZXNzYXJ5Lg0KDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtMdWNhJiMzMjtMZW9uYXJkbyYjMzI7U2Nv
cmNpYSYjMzI7Jmx0O2wuc2NvcmNpYUBnbWFpbC5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyYjMzI7fCYjMzI7MSYj
MzI7Kw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5z
ZXJ0aW9uKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2FmNDg3MWRlOWU0Yy4uYWQxMGU4NmIx
NjFkJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYw0KJmd0OyYjMzI7QEAmIzMyOy0xMzAxLDYmIzMyOysxMzAxLDcmIzMyO0BAJiMz
MjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19kc2lfZHJpdmVyX2RhdGEmIzMy
O210ODE4OF9kc2lfZHJpdmVyX2RhdGEmIzMyOz0mIzMyO3sNCiZndDsmIzMyOw0KJmd0OyYjMzI7
JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZCYjMzI7bXRr
X2RzaV9vZl9tYXRjaFtdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21l
ZGlhdGVrLG10MjcwMS1kc2kmcXVvdDssJiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDI3MDFf
ZHNpX2RyaXZlcl9kYXRhJiMzMjt9LA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10
ODE2Ny1kc2kmcXVvdDssJiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDI3MDFfZHNpX2RyaXZl
cl9kYXRhJiMzMjt9LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxNzMt
ZHNpJnF1b3Q7LCYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXQ4MTczX2RzaV9kcml2ZXJfZGF0
YSYjMzI7fSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
Mjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTgzLWRzaSZx
dW90OywmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE4M19kc2lfZHJpdmVyX2RhdGEmIzMy
O30sDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7eyYj
MzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4Ni1kc2kmcXVvdDss
JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDgxODZfZHNpX2RyaXZlcl9kYXRhJiMzMjt9LA0K
Jmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDMuMA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KDQo8
L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBl
LW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Ns
b3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5r
IHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_10681360.1573626776--

