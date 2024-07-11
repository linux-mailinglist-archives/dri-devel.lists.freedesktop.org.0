Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1792DE01
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 03:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B210E0E4;
	Thu, 11 Jul 2024 01:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qxk8XnB2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="N34sQkiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBEF10E0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 01:35:52 +0000 (UTC)
X-UUID: e491857c3f2511efb5b96b43b535fdb4-20240711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=50LGUjkbK/qXMUWYwjnrU7Igt+UTcvgPlnWbWb6X8ag=; 
 b=qxk8XnB2xnSKkWjOakc9TDaUr7Pj4Ayn3CzgLIIDj5WQ3U/qpewzBNVxQavypByPkuKY1tFRj3c/2k3gIorj4rXW2NQJtHWAbC2bgLRi07EV2lJb7k7ke7ZStyIO6XN6QwXsNiVs7uPx2ShfIy5tfrQKsmh5F2hk6AjLRw6BoLg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:ece74624-12e7-4fcd-b4e7-db843fb58fb2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:fc4033d5-0d68-4615-a20f-01d7bd41f0bb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e491857c3f2511efb5b96b43b535fdb4-20240711
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1115611437; Thu, 11 Jul 2024 09:35:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Jul 2024 09:35:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Jul 2024 09:35:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvsExhA90jHQFQFTG1l/TOCK9JcW17LduH/T37uc2cu3et9zOaBCNXwFzDtgdqsVxn/CVRYvE4IkHWx2u2J/U3o2AwUZT2kdVESwPY+kPBuCZ95qWW+UzqZO+qtq06ObxP8jhKwf/5yMYfEpuAEVr+y5Unw6Xh+8LSzLEz5P1eVdWamrWGps0nFhAVwFSEdwejnkCnPhbDhOKiXVRWjTdgBGeBsmOKR2KCS5sCVj4vx+C3G1YghibhnCwYnb6ajxOBhDi3XZWo3lHUMmYsMOBn0PRrD5j6bxpdp5e58wRoj8rTJg4NrlzdNUwZZyBg7STtiMel8vOEnsqYg/ia+BcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmcI9OdslMUECwLsh6zkWBebdq/i27+USk2pSl/zUNE=;
 b=DygUDsPLKUY6stbiMV2Ti5Vgf5PyO5G85IqvztK3LHK7Q8p43MpmPaNrEIYZwpJHUCqjIqqVGOk3/qr2yGDOA5Knqu7kPf+SG4Ncj6FYe1iHQer75gPYPqJgKugc5W0DgT+tRTUh9D1UvNod8cXd4lDGTNPYdQnuDUhr9ccgDmlgW8S7yHvuJa5bqu14oRJufc2qfjUcluoL9AYqhIBfhld07Bxezy3550A4b1tXNY7O6pVthZmyguo/AM/S9IEO/STdaesae87+WUPTSvHy/+WsrjnprI/oOB1R205skwfYGqNVYVcj79HwOe2+QH4AkcJxCpV4BeCNpOwdW9BfBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmcI9OdslMUECwLsh6zkWBebdq/i27+USk2pSl/zUNE=;
 b=N34sQkiOkVhQSuE/9VkhQW4b36ACwuHB6KtbRT4za6y/PCwxu0FL1RRoT9/4EJae8ekGOpX/ZHoE8aTPrljPl6nrTdWsx1l068AoTRkbZONXfkTh3syD6oaNl9mSGW6WYYiPIJDuO8TwviDbLPk6MhSt+zmSlLRu4hSzEN1C9vk=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TY0PR03MB8277.apcprd03.prod.outlook.com (2603:1096:405:16::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 01:35:41 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 01:35:41 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Subject: Re: [PATCH v3 3/5] drm/mediatek: Support "Pre-multiplied" blending in
 OVL
Thread-Topic: [PATCH v3 3/5] drm/mediatek: Support "Pre-multiplied" blending
 in OVL
Thread-Index: AQHa0qaWYIHHnJkOFUycAGyfPCK5hrHv3L0AgADjPAA=
Date: Thu, 11 Jul 2024 01:35:41 +0000
Message-ID: <3395f4b113a8cb5b689384bdb9599394fadae01e.camel@mediatek.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-3-289c187f9c6f@mediatek.com>
 <d6517e21-8f6f-44e9-b7ac-93e0860a5e7a@collabora.com>
In-Reply-To: <d6517e21-8f6f-44e9-b7ac-93e0860a5e7a@collabora.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TY0PR03MB8277:EE_
x-ms-office365-filtering-correlation-id: ec3ebdf9-e434-4230-9415-08dca149c67e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MHN2RHBSa1FlWHlCQjhjMlFwbUlZa1lJV25VTlh6dXkxTVR6cFNIbisyUVNT?=
 =?utf-8?B?WldLc3FQcHVIcWdTbTRYSFlCaUI1M2RZZ2FzQ1l4U1FNbWxkL1I3KysrV05O?=
 =?utf-8?B?NnBiTzM0NWJyRVh3Um1yeEoxNjdXQnFoWVpZdDYra2lJVzRuL2wrM1NaTi9Y?=
 =?utf-8?B?a09DKzQvRGpBbGtXM3V5RWJiT2xuSE9jbWxidHNmeGxSMjMxWHprRlRXQ3VS?=
 =?utf-8?B?a3orYnphaEdKcjdRNWZLakN3VjBLMzVDVjlJbUE0LzlydUN5UEtzTUZzNHU4?=
 =?utf-8?B?MDdrNU9TdXRxTmhWMDNwRnd2UnRHQWtkRTc4dUtRK05RQWM0ZHFwK29VRWg3?=
 =?utf-8?B?ZDlpQWxFMFFMeFg1VXNqMGVWYmYxWUM1M25ObU9oc0FsQmFVeEhGLzYzV0Fi?=
 =?utf-8?B?L282MTQ5VEpxaE9pQXJnREEvQy91WWY4T0xjYUJiVkZGVUxSZWNianpsTXQ4?=
 =?utf-8?B?cUhOV3l0NlFaNlJuUFMzYUF3TU5QYlYzeVBjbkV2bG5mdEFpSHpuU2hCcC9E?=
 =?utf-8?B?N3ZLbUFkbjg4eHRXSmkyV2pPQkFBL2pSYUcrZDMrdU5xN3JsbEhpU1Fjb2FM?=
 =?utf-8?B?aW5FcDYzM3J5VmJkU2NyV3BWSkRNWWoyZjFsem9vVXl1ODRjVGp0U0tyN2Fv?=
 =?utf-8?B?V2ZEVTRTNTlUVCswN3JTbFhMZVNQSG8vdG1COTQyZ3RtTjdWMHhTaEdaejdo?=
 =?utf-8?B?QnV4R3pLb1N4Q3YydVQ3QlBTNmZvNktCVzhOTWUrWEE1VVRrLy9ic2p2cTlm?=
 =?utf-8?B?UFJnZkppYWZMdThZUXFtMGdRTW9NaVFDUitmcHlZb3ZxcXAwdGZWTGpwcEJj?=
 =?utf-8?B?eGxqOENRMVNvaWdCbEp5M3JKYlk4ZFZnekFQcDc3M0dKT0ptTkZ2VUtQQXdo?=
 =?utf-8?B?WHVVd2NzZGRYd2RzQmcvRnpUV0JPRVJJcVhTVWFrc1dDdjhYdUtnQ1k5cVll?=
 =?utf-8?B?cTdUYW1wMFhmWHJrb2NyZGZZYm9BZ296d2JkcDcvdHNJMGM4VE1DZEJSWi9B?=
 =?utf-8?B?R1pXOHJyQTVyY3VYVzVRZldPd3FXWmZpTHBwZU9OdlFUTnZDTUNKQzk4Nm83?=
 =?utf-8?B?ZFlwL0hXcnJoN2kzK0FVL0ZrVVhlQmR1bVFtUW5DSmx1cUwvS1gzaVAvTXdk?=
 =?utf-8?B?WHI3ZnJ4dlBlMTVLTGtlamU5SUNYUXh6MThIRHRSU0xHNExpY2hIQXNObWMw?=
 =?utf-8?B?Z0F2RWZKc2ZuTVZkVEhudlEzRjNvNnAvWDIzRXdTdTRaWlR1M2hHQ2VkYXRp?=
 =?utf-8?B?V296M3NUNkdNOHZZVlU3MFJ1TnFsK29jNFEwbUE3UDN0WXZUVHE3VUs5Zlpk?=
 =?utf-8?B?MmdOM1RSQjBwNkpwaDluVk4vQTVmOVVyMnExbytNK2h2T1hsRjkvczIvQWNq?=
 =?utf-8?B?L1VrT084OUM4Wng0RjdsT1ZXRE5mMlo0d016ZTkxYkVlY1hYa3NoN0Jjd0Y4?=
 =?utf-8?B?ZDhxVUFYYXVBM2MvQjlhYUZpbG1MUTFDUkNzMWhDRmdTaG5rWE1GS2lkUGF2?=
 =?utf-8?B?MDlrY0REam5KMXlJWjAzSTVFTUFJTG1MclYxUU5GOWdjbnBEeEd6MUpEbFIx?=
 =?utf-8?B?cW1EZXFBOGhvVnU1RlZ1eDZuV2w1M2c4aTQrRjdpZi92cCtZT0ZaS2hPN0Nx?=
 =?utf-8?B?VExUQ05VNXNnYWdrQ05XaHV0eDBNdnNIak51S09BUFIvY1huaStpRy9EMWJG?=
 =?utf-8?B?MmFWZHU3MHhKK1N1TUVjdDRzVHp5bzlqN1kvMVA4N0l1S0pkUUlicWp1S09o?=
 =?utf-8?B?aGZJamZtc3g2a1lHeUR1QXY2aDNYYjZPSXV0VUtWM0xuRkE3WmJlQXQvWFZY?=
 =?utf-8?B?cG9BbzVVUEpQMFJKM2ZHa2lCK2tTWFVoV1Q0Vzk4V2V2ODIzTzFaRk9pM0FR?=
 =?utf-8?B?em8wTjVqaDNhN3c2UDJmSnJoVDJXUG5TSUJyblgxcFpiWEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVBoTHB1ZXhPK0ZEQnAvMWJaK3dXTllSWWVqYm5QU1VjN2tYeU84TkYyZnZN?=
 =?utf-8?B?M1c5SExlRml4eDhiKzNDMmJ5dm83Yno2VjJ2cndlL2xTa3lxbDB4a2lBZG1N?=
 =?utf-8?B?OHZjUGpDdDJ3ejVicjBVQytaVVN4RHNpWUVBOVluUGd4K0tlTUlGdHBvRWJ2?=
 =?utf-8?B?OGRwMWg5SVZpNkJobTdrbXJNMURKZ05PREJocFllZnI0V3FmVjh4TGZ6cVBJ?=
 =?utf-8?B?Q2tQVUtPellvREhIU2xqdTBrU2oyb1B1aElTSndWSEM1SXZUdE03UjhLTDNR?=
 =?utf-8?B?cTlQOHIzV3FCRHM0cWZ1YzRWeXZQenNlQ3d3cjg0NTNEWTN4cXF2VG5CYzJJ?=
 =?utf-8?B?OTJOekVhbzRwU3UyTDRKM0dCOVRiY01NNEdwdXd4Z1BSeC90ZnBINWdzRlU3?=
 =?utf-8?B?K1FJT2EwSy8weStqcGh2VG9OU3RwaHdTSjhtbHd2WlU2dTRGREhjN2lsUlcv?=
 =?utf-8?B?WTY2NUsvS0V0WGtVT0RReUNXYXNITUJWT21Fa2xtcUxUbEV3enAxVDJaT3Zr?=
 =?utf-8?B?akEzb2lWVmhCTFVrL2lkRTFnaEQyUE1hR0loNXhMWmZvTzllMEpGbXlBU2FR?=
 =?utf-8?B?azd4VHJYVnh1QVYreTBhRVRFZFVUbFZsU1liN3FNSmdSMlZ1UVNrNDBrQlZS?=
 =?utf-8?B?eHBLOW83enJwN1hCU2EyenpWT0o1S0s5cE1NMWU0alowdHlXMmlqUVhnNTNi?=
 =?utf-8?B?UktkOW1JUmJkRHlkVU5XMUhjQmFuMHNDMkhCbjZCMGtTcm5nL3lLNHN4Vm5X?=
 =?utf-8?B?WW1Ha2dpaGZ4b0NMVWR0aWdBbVRiM2RnL1FJV2cvcHVHeWtjYlBueWdoUG5F?=
 =?utf-8?B?NXVpSS90R2c4aUJBR29KK3QzRjVBb3VLNzZwZDV0aE1WMldWaUQ4MHl6dWJ0?=
 =?utf-8?B?VXNnMURWV0dTR1BVSmp1VHVvT1ZyajZZekt5NktXSnZvV1ViSk9OdEJEYlZN?=
 =?utf-8?B?Uk41RUlkcVU1WjZTQ0lCaTNaTnJCcC9WNzVTMk5YUnNhZERNQThnL3Jrd1RG?=
 =?utf-8?B?N2NMaGwvRDNtaDF2dGZlcVhXUTVtZ2xHWGNrWHBSQjk2WHJDdmZYVjJ3K2Nw?=
 =?utf-8?B?N2c2L0dqR2xndW0rdXhJQTdtdStib2VrSnV0czE2SG9ldlhkZCtWSEpYQVdK?=
 =?utf-8?B?KzFNTXBYY0k2b0thQjFOZ2JGeXFlNGlaRUorNVhmVHREQ3R6elNtMnBHTVo1?=
 =?utf-8?B?UG1HV2JITldTN1RsY2lOemRiaFo3Ylo0T01oQW5TaExKUDF2RnU3bXVPVkdh?=
 =?utf-8?B?cjg2ZGVTNFdvSUd5ekt1MGRCdmtIcTl3TndMTElOYjhOMXRkUENUUE42ckdy?=
 =?utf-8?B?aThHSmJjN1dmdStCNGs1ZzNjUXlUL1RuYkkxT1oxMThuQlFTRWlDYWh2OHM0?=
 =?utf-8?B?THpUVW1iRlR3YzBXdEFjNkFzUFhzY1NqNi9HVW9od1FxOE5uU0RqM0Z1YWhB?=
 =?utf-8?B?MTJxMDJ0aE43cmpnQ2FYTmdrNUlaWXBmNURjRENUekJPOHcyTG9lYXBKY1Q4?=
 =?utf-8?B?RVN3R1cvVHhGM0tHS01OQjlWdEZwblkyTjljTkFiT0JTeXp0Ri91OGhCZW9J?=
 =?utf-8?B?N2YrSXhZUlI0TW8xbzFJTU5PQW42R3grQktaTGJZSkM5RndHaWFTZlczdi9r?=
 =?utf-8?B?cHYwbXVSZldVVEJRMU1sZDkrc3c0SVJtTnJJMlNqVmRyUTlsbTdFK3AwM3Ni?=
 =?utf-8?B?QWxJc2ZZVjZORDk4TDc2U0ZRd1FMSFFsZXpKQ2h1ZHhlR0ZrUTJ4MDZZYWdZ?=
 =?utf-8?B?NHQzUndVRytXbHNzbWRibXpaajVQUEt5RUxxejRhWmEvL0FhMjF1R0tSd2pl?=
 =?utf-8?B?OFFkNEFqeFBRb0pha2FxV3VvRzNFMERveS93a2RBZ05CSXFkSVNWL2VwUnYx?=
 =?utf-8?B?SDgwRTNmaU93S2YrS1dWS3U1ZUJBTFBMOVA4Nm1QOHpMK2EyNW55LzlMTVZU?=
 =?utf-8?B?SEV1QmtmVFU5TEZhTlBsVDFMcHdHQjhXNDNJSXBoWENYdy9UZjlEQ2VNRTlr?=
 =?utf-8?B?WTBFVkhnbm1kQTRIZmVhOFM4bXlnU1Vjb256L0VsZFUvK0ZtWjJtYkFmcVY4?=
 =?utf-8?B?L2VVZG9QL3NmL3NXazJVMUptbDZ0dmdRTUZ5S3BSQ3pJVHZsdGJ1UGNENGxR?=
 =?utf-8?B?eHF0bTRienZjdGZuTmc2RDhGcWNIN2Z4Mmcxb2FBQUJVck5hRUt0bTAxYmhv?=
 =?utf-8?B?NVE9PQ==?=
Content-ID: <F8467E4786176A45A94A5C640FD4ABE7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3ebdf9-e434-4230-9415-08dca149c67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 01:35:41.4532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydsO/SKyTHmhhW0FA7c1v2ILy8g+JWzTmFZcaEJn/FXkz4AX9d117ujGAlCa72z51iuYziDumbahQIgfWDUrgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8277
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.704600-8.000000
X-TMASE-MatchedRID: ge9e+QLSeazUL3YCMmnG4kD6z8N1m1ALjLOy13Cgb49qSjxROy+AU/wt
 lOVHF2NRUmsNbSHn8eAimdSEVlqPpvZ+/QtM9+8z7spMO3HwKCDpJe7BSAYfSNiCsYPC4Ul2aUX
 s6FguVy39UzQlT7CKnyoM5W9/sYqJO6sfSrHWQFj0mf9msa5zwYEcpMn6x9cZ1TKQ8rVEUCjGEf
 otTZgUJWGrMb9FxqvtkZOl7WKIImrS77Co4bNJXQtuKBGekqUpI/NGWt0UYPA8/46Zr4jIEWJu6
 QrfKWsJkqE0403Raw030F/P3YSd57HFFY1cpJMy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.704600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5274FBCFA7500DC289E6C18CD7DEF7C0638BE1230B7E0E000CB41EFB7C53DAEF2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_139416183.305052824"
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

--__=_Part_Boundary_006_139416183.305052824
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBXZWQsIDIwMjQtMDctMTAgYXQgMTQ6MDIgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJbCAxMC8wNy8yNCAxMDo1MiwgSHNpYW8gQ2hp
ZW4gU3VuZyB2aWEgQjQgUmVsYXkgaGEgc2NyaXR0bzoNCj4gPiBGcm9tOiBIc2lhbyBDaGllbiBT
dW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBTdXBwb3J0ICJQcmUtbXVs
dGlwbGllZCIgYWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBpbiBPVkwuDQo+ID4gQmVmb3JlIHRoaXMg
cGF0Y2gsIG9ubHkgdGhlICJjb3ZlcmFnZSIgbW9kZSBpcyBzdXBwb3J0ZWQuDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAzMg0KPiA+ICsr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBpbmRleCBhZGQ2NzFjMzg2MTMuLjg5YjQz
OWRjZjNhNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMNCj4gPiBAQCAtNTYsOCArNTYsMTIgQEANCj4gPiAgICNkZWZpbmUgR01DX1RIUkVTSE9MRF9I
SUdICSgoMSA8PCBHTUNfVEhSRVNIT0xEX0JJVFMpIC8gNCkNCj4gPiAgICNkZWZpbmUgR01DX1RI
UkVTSE9MRF9MT1cJKCgxIDw8IEdNQ19USFJFU0hPTERfQklUUykgLyA4KQ0KPiA+ICAgDQo+ID4g
KyNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfTUFOCUJJVCgyMykNCj4gPiAgICNkZWZpbmUgT1ZMX0NP
Tl9CWVRFX1NXQVAJQklUKDI0KQ0KPiA+IC0jZGVmaW5lIE9WTF9DT05fTVRYX1lVVl9UT19SR0IJ
KDYgPDwgMTYpDQo+ID4gKw0KPiA+ICsvKiBPVkxfQ09OX1JHQl9TV0FQIHdvcmtzIG9ubHkgaWYg
T1ZMX0NPTl9DTFJGTVRfTUFOIGlzIGVuYWJsZWQgKi8NCj4gPiArI2RlZmluZSBPVkxfQ09OX1JH
Ql9TV0FQCUJJVCgyNSkNCj4gPiArDQo+ID4gICAjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1JHQgko
MSA8PCAxMikNCj4gPiAgICNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODgJKDIgPDwgMTIp
DQo+ID4gICAjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1JHQkE4ODg4CSgzIDw8IDEyKQ0KPiA+IEBA
IC02NSw2ICs2OSwxMSBAQA0KPiA+ICAgI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9CR1JBODg4OAko
T1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODggfA0KPiA+IE9WTF9DT05fQllURV9TV0FQKQ0KPiA+ICAg
I2RlZmluZSBPVkxfQ09OX0NMUkZNVF9VWVZZCSg0IDw8IDEyKQ0KPiA+ICAgI2RlZmluZSBPVkxf
Q09OX0NMUkZNVF9ZVVlWCSg1IDw8IDEyKQ0KPiA+ICsjZGVmaW5lIE9WTF9DT05fTVRYX1lVVl9U
T19SR0IJKDYgPDwgMTYpDQo+ID4gKyNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfUEFSR0I4ODg4ICgo
MyA8PCAxMikgfCBPVkxfQ09OX0NMUkZNVF9NQU4pDQo+IA0KPiANCj4gU2hvdWxkbid0IHRoaXMg
YmUgKE9WTF9DT05fQ0xSRk1UX1JHQkE4ODg4IHwgT1ZMX0NPTl9DTFJGTVRfTUFOKSA/Pw0KPiAN
Cj4gVGhhdCdzIGdldHRpbmcgd3JpdHRlbiB0byB0aGUgc2FtZSByZWdpc3Rlciwgc28gSSdkIGd1
ZXNzIHRoaXMgaXMNCj4gbGlrZSB0aGF0OyBidXQNCj4gdGhlbiwgaWYgaXQgaXMgbGlrZSB0aGF0
LCB3aHkgaXMgaXQgUEFSR0I4ODggYW5kIG5vdCBQUkdCQTg4OD8hDQo+IA0KDQpUaGFuayB5b3Ug
Zm9yIGhpZ2hsaWdodGluZyB0aGlzIGltcG9ydGFudCBwb2ludC4gQXMgd2hldGhlcg0KT1ZMX0NP
Tl9DTFJGTVRfTUFOIGJpdCBpcyBlbmFibGVkLCAoMyA8PCAxMikgbWVhbnMgZGlmZmVyZW50IGZv
cm1hdHMgaW4NCnRoZSBkYXRhc2hlZXQsIGFuZCB0aGlzIGZ1bmN0aW9uIGFsc28gY29uZnVzZWQg
dXMgdmVyeSBtdWNoIGF0IGZpcnN0Lg0KDQpUbyBwcmV2ZW50IGFueSBzaW1pbGFyIG1pc3VuZGVy
c3RhbmRpbmdzIGdvaW5nIGZvcndhcmQsIGluc3RlYWQgb2YNCnJldXNpbmcgdGhlIE1BQ1JPIHlv
dSBtZW50aW9uZWQsIHdlIGludGV0aW9uYWxseSByZWRlZmluZWQNCk9WTF9DT05fQ0xSRk1UX1BB
UkdCODg4OCB1c2luZyBiaXQgb3BlcmF0aW9uIGFnYWluLCBhbHRob3VnaCB0aGlzDQphcHByb2Fj
aCBzZWVtcyB0byBjYXVzZSBhbm90aGVyIGNvbmZ1c2lvbi4NCg0KUmVnYXJkcywNClNoYXduDQo=

--__=_Part_Boundary_006_139416183.305052824
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0FuZ2VsbywNCg0KT24mIzMyO1dlZCwmIzMy
OzIwMjQtMDctMTAmIzMyO2F0JiMzMjsxNDowMiYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2No
aW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0lsJiMzMjsxMC8wNy8y
NCYjMzI7MTA6NTIsJiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQm
IzMyO1JlbGF5JiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO0Zyb206JiMz
MjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNv
bSZndDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U3VwcG9ydCYjMzI7
JnF1b3Q7UHJlLW11bHRpcGxpZWQmcXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7bW9k
ZSYjMzI7b24mIzMyO2luJiMzMjtPVkwuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtCZWZvcmUmIzMyO3Ro
aXMmIzMyO3BhdGNoLCYjMzI7b25seSYjMzI7dGhlJiMzMjsmcXVvdDtjb3ZlcmFnZSZxdW90OyYj
MzI7bW9kZSYjMzI7aXMmIzMyO3N1cHBvcnRlZC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYj
MzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7UmV2
aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMmIzMyO3wmIzMyOzMyDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KJmd0OyYjMzI7Jmd0OyYj
MzI7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyNSYjMzI7aW5zZXJ0aW9u
cygrKSwmIzMyOzcmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyOyZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7YWRkNjcxYzM4
NjEzLi44OWI0MzlkY2YzYTYmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjth
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7Jmd0OyYj
MzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0
OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy01Niw4JiMzMjsrNTYsMTImIzMyO0BADQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOyYjMzI7I2RlZmluZSYjMzI7R01DX1RIUkVTSE9MRF9ISUdIKCgxJiMzMjsm
bHQ7Jmx0OyYjMzI7R01DX1RIUkVTSE9MRF9CSVRTKSYjMzI7LyYjMzI7NCkNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtHTUNfVEhSRVNIT0xEX0xPVygoMSYjMzI7Jmx0
OyZsdDsmIzMyO0dNQ19USFJFU0hPTERfQklUUykmIzMyOy8mIzMyOzgpDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrI2RlZmluZSYjMzI7T1ZMX0NPTl9D
TFJGTVRfTUFOQklUKDIzKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyNkZWZpbmUmIzMy
O09WTF9DT05fQllURV9TV0FQQklUKDI0KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7LSNkZWZpbmUmIzMy
O09WTF9DT05fTVRYX1lVVl9UT19SR0IoNiYjMzI7Jmx0OyZsdDsmIzMyOzE2KQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky8qJiMzMjtPVkxfQ09OX1JHQl9TV0FQJiMz
Mjt3b3JrcyYjMzI7b25seSYjMzI7aWYmIzMyO09WTF9DT05fQ0xSRk1UX01BTiYjMzI7aXMmIzMy
O2VuYWJsZWQmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrI2RlZmluZSYjMzI7T1ZMX0NPTl9S
R0JfU1dBUEJJVCgyNSkNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9SR0IoMSYjMzI7Jmx0OyZsdDsmIzMy
OzEyKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO09WTF9DT05fQ0xS
Rk1UX0FSR0I4ODg4KDImIzMyOyZsdDsmbHQ7JiMzMjsxMikNCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9SR0JBODg4OCgzJiMzMjsmbHQ7Jmx0
OyYjMzI7MTIpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTY1LDYmIzMyOys2OSwxMSYjMzI7
QEANCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZN
VF9CR1JBODg4OChPVkxfQ09OX0NMUkZNVF9BUkdCODg4OCYjMzI7fA0KJmd0OyYjMzI7Jmd0OyYj
MzI7T1ZMX0NPTl9CWVRFX1NXQVApDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7I2RlZmlu
ZSYjMzI7T1ZMX0NPTl9DTFJGTVRfVVlWWSg0JiMzMjsmbHQ7Jmx0OyYjMzI7MTIpDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyOyYjMzI7I2RlZmluZSYjMzI7T1ZMX0NPTl9DTFJGTVRfWVVZVig1JiMz
MjsmbHQ7Jmx0OyYjMzI7MTIpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrI2RlZmluZSYjMzI7T1ZMX0NP
Tl9NVFhfWVVWX1RPX1JHQig2JiMzMjsmbHQ7Jmx0OyYjMzI7MTYpDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrI2RlZmluZSYjMzI7T1ZMX0NPTl9DTFJGTVRfUEFSR0I4ODg4JiMzMjsoKDMmIzMyOyZsdDsm
bHQ7JiMzMjsxMikmIzMyO3wmIzMyO09WTF9DT05fQ0xSRk1UX01BTikNCiZndDsmIzMyOw0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtTaG91bGRuJiMzOTt0JiMzMjt0aGlzJiMzMjtiZSYjMzI7KE9WTF9D
T05fQ0xSRk1UX1JHQkE4ODg4JiMzMjt8JiMzMjtPVkxfQ09OX0NMUkZNVF9NQU4pJiMzMjsmIzYz
OyYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYXQmIzM5O3MmIzMyO2dldHRpbmcmIzMyO3dy
aXR0ZW4mIzMyO3RvJiMzMjt0aGUmIzMyO3NhbWUmIzMyO3JlZ2lzdGVyLCYjMzI7c28mIzMyO0km
IzM5O2QmIzMyO2d1ZXNzJiMzMjt0aGlzJiMzMjtpcw0KJmd0OyYjMzI7bGlrZSYjMzI7dGhhdDsm
IzMyO2J1dA0KJmd0OyYjMzI7dGhlbiwmIzMyO2lmJiMzMjtpdCYjMzI7aXMmIzMyO2xpa2UmIzMy
O3RoYXQsJiMzMjt3aHkmIzMyO2lzJiMzMjtpdCYjMzI7UEFSR0I4ODgmIzMyO2FuZCYjMzI7bm90
JiMzMjtQUkdCQTg4OCYjNjM7IQ0KJmd0OyYjMzI7DQoNClRoYW5rJiMzMjt5b3UmIzMyO2ZvciYj
MzI7aGlnaGxpZ2h0aW5nJiMzMjt0aGlzJiMzMjtpbXBvcnRhbnQmIzMyO3BvaW50LiYjMzI7QXMm
IzMyO3doZXRoZXINCk9WTF9DT05fQ0xSRk1UX01BTiYjMzI7Yml0JiMzMjtpcyYjMzI7ZW5hYmxl
ZCwmIzMyOygzJiMzMjsmbHQ7Jmx0OyYjMzI7MTIpJiMzMjttZWFucyYjMzI7ZGlmZmVyZW50JiMz
Mjtmb3JtYXRzJiMzMjtpbg0KdGhlJiMzMjtkYXRhc2hlZXQsJiMzMjthbmQmIzMyO3RoaXMmIzMy
O2Z1bmN0aW9uJiMzMjthbHNvJiMzMjtjb25mdXNlZCYjMzI7dXMmIzMyO3ZlcnkmIzMyO211Y2gm
IzMyO2F0JiMzMjtmaXJzdC4NCg0KVG8mIzMyO3ByZXZlbnQmIzMyO2FueSYjMzI7c2ltaWxhciYj
MzI7bWlzdW5kZXJzdGFuZGluZ3MmIzMyO2dvaW5nJiMzMjtmb3J3YXJkLCYjMzI7aW5zdGVhZCYj
MzI7b2YNCnJldXNpbmcmIzMyO3RoZSYjMzI7TUFDUk8mIzMyO3lvdSYjMzI7bWVudGlvbmVkLCYj
MzI7d2UmIzMyO2ludGV0aW9uYWxseSYjMzI7cmVkZWZpbmVkDQpPVkxfQ09OX0NMUkZNVF9QQVJH
Qjg4ODgmIzMyO3VzaW5nJiMzMjtiaXQmIzMyO29wZXJhdGlvbiYjMzI7YWdhaW4sJiMzMjthbHRo
b3VnaCYjMzI7dGhpcw0KYXBwcm9hY2gmIzMyO3NlZW1zJiMzMjt0byYjMzI7Y2F1c2UmIzMyO2Fu
b3RoZXImIzMyO2NvbmZ1c2lvbi4NCg0KUmVnYXJkcywNClNoYXduDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_006_139416183.305052824--

