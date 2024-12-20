Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F89F8E03
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 09:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6578610EF1A;
	Fri, 20 Dec 2024 08:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eKVzW5Sd";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GbYGN2Fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E172810EF1A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 08:31:46 +0000 (UTC)
X-UUID: d56fd4c0beac11efbd192953cf12861f-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pTCcAvw9hq0jEggvmqGEiWvZWn1mSXZ0Vb7SkO6HA00=; 
 b=eKVzW5Sdm//YXkvy2AxttJMqfyKkznIycRWeFmaz8P0S0qpYAHdost88O6trvkBDilUHEJbhtx6cT07beLFeyk4Qr6vfZqX2ESn5NfOY2RZ3ZUk3UB1uzf+Bq9iXAqWBFSAEi6RdEGz/0MY0pAFi+9aIYVCX9SaEWCDNqe4TWpY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:f82959d6-b595-4e08-9acb-645cf75c0c1f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:df2ca036-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d56fd4c0beac11efbd192953cf12861f-20241220
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 675582756; Fri, 20 Dec 2024 16:31:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 16:31:38 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 16:31:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZnxNS8bpdlUEx8+z/oDG2hU1QqYIfmSCmgi3LPgFBDRdciCyJY2PSRCEBshzgXy0jjWuHBeqa7PFkd2Im1wUtSKig9EFKTQFjiUjJbLZAmONo66FU64L1LmO6bxyUWCzqJaYl4wOFXbEDepjNQDoDwbiGyMm5tp9MDJ9SoAQFZMBObv9cm0k8ISY5ZIOUdftyoXyOSM/D8oLm/lLvviBRL5wDXPPyFU1bc/lKolZiYU56G8B+99mwli3AEXPjT6ULtEwPR7mh7SQC9PVlOkx+SxqURLpnA6INXteqbvrp6q9itIk5arCAkbObSA3e/r+IGRyC+qrqFiF9HIY8eTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZN9r6kWmP3bMH9YjAhYfByAdnCUbDPijyZ484Gl54w=;
 b=Q65BodCSgXstg2em9bfnLLVj720IHBo+dTKWdb4QmgZJ2KkcDB13VdKdxh2d4z1WACZpEOYilcnPMQ3mVtrp+DM9aM2ASJ6eVvoH+gBDcrJr9rksU7feAmg1JtH6bVTBY3ucRbkpVP3yjyCOPAP1Hx46i0J0CSH7bZu6jr1SXjiv6RTHPfHQukQgeCylexZSxyCKa8dUzAIfmIXK8u486OrKnyPRDCz2jF+NICUSMTjxGO0VkGHBOxtX0ocIz98Mvrme7eCUQI2IVHP8ObzQCSrqlfY0fkX0peteKpP8YPzlrciJBTBBr5uDg0eD2VbifI8AAF2E3gndPePZKd0w8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZN9r6kWmP3bMH9YjAhYfByAdnCUbDPijyZ484Gl54w=;
 b=GbYGN2FllYwpCx6EWQNUqT51vqiXgJ8VLbPEnQNY5mAYk7sj6euTo7UsTnz5+lsDcWzh58Ze7J7/9RPpZ4OahMoE0UM++JRn8CyO3o5ZMwFPLaIn7h1gEJYsdELh5dxkpMFNUeh49afPyFzdmM6vmNCKOhYc08wkcVrnfOUuLqc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7942.apcprd03.prod.outlook.com (2603:1096:400:474::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 08:31:35 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 08:31:35 +0000
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
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 23/33] drm/mediatek: mtk_hdmi: Use devm managed version
 of drm_bridge_add
Thread-Topic: [PATCH v3 23/33] drm/mediatek: mtk_hdmi: Use devm managed
 version of drm_bridge_add
Thread-Index: AQHbUJqwCT+hudMz3ky8mhd1iwdRe7Lu0fIA
Date: Fri, 20 Dec 2024 08:31:35 +0000
Message-ID: <bb26fb95bc38087ebc1b915fead920fc3a01a077.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-24-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7942:EE_
x-ms-office365-filtering-correlation-id: eb4420ba-0937-4731-695f-08dd20d0b710
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RXNCajZ3aHBIck5yL3BQWVZSUDhCeDRNeHBGbHRpcVVKSmZtSWtIeWlkUGs4?=
 =?utf-8?B?NGJ6S0dvaVRkZ3YvZWo3cW03YUlMeFRjdm9QMDBCYVd5Z3JqZ3hjWlR3T20v?=
 =?utf-8?B?dnBNTGsrTDBUbXB3MlhVNHFSNUx5bkZJZ0RDQWh5VFY2QlMxWEd0NHdBZDJR?=
 =?utf-8?B?RWphaFY5Sjk3djdES3c4VmJZUThKSWd2cDl0QlRQZXVCenI2Q2RkV3RlNlVr?=
 =?utf-8?B?K1orWldMeTF2NUpreXdHRWh6dUlOQ2drOFMrNFdYTFRvSzlqU1FNR21pbTBr?=
 =?utf-8?B?aTdPUzVNUGZBWndCK3l0SjhlcnY2SmhjVkRaelhTaGZFLzdQUldqdHkzRTJR?=
 =?utf-8?B?MkNCUXRnckl6Nm9MZWQraWMvOGdwUHoyOWIyQXNkdXRlc2xzd085U3pVMVZl?=
 =?utf-8?B?RW9ETjZRbVZjUXpUVDJhb1BIUnlTRWRUWU5BakZidEtsV1BUUnFvL0g2eWY4?=
 =?utf-8?B?YVdPZjhMVmQ4anZYNW9TUU1zWG40bGh3VTJBTnF5SXpiQ25MZ0lqampuaWpi?=
 =?utf-8?B?cHc1alUwTnYwSGRKV2ZHVGpxSmlLVFZTV2M2NTBwT2xFclBBNjQ2dnVXUFRa?=
 =?utf-8?B?eXo3eFZzOFlIcEgvMnhIL0FYaTZEaFJXNEo4bVNUaS9Qakhld0dXRnBMZWYv?=
 =?utf-8?B?ZkVJdEpWWVF0VVJDbUFtdnZQb2M0WVNnTERnYWVicFp6VVRoTFBJcUI2WFZU?=
 =?utf-8?B?aTBranRGdGx3dXRPNlJ5M1R1RkZGOWxNaFNVeHBGazVDNHF4R2VEU2hwcEV3?=
 =?utf-8?B?VVU3UERRalFqYzZhSWN5R1JseFVXaXNXcUNBeGhJOURvbVRFTHV4K0FrdCtm?=
 =?utf-8?B?eFg1cUxibEl6SGVYelNyOVBtT2FBcHBjamZBRkhvek4vZFR4MzNhZEJzcTNj?=
 =?utf-8?B?RVVxYmg5b2pCdE0vU3ZZZS9XUG9GZUhLc2xnMkJQR3BTUC9xUmJFcWV0QU5h?=
 =?utf-8?B?Nnp6K1NrNElvZVBQL0FMNTU1N1pyblB3dTFiN25JbXJYanlXbzhkUkM2TnlJ?=
 =?utf-8?B?WnNKZ2g4UkZ2YWk5WUdIRWpnWjlGbkNlM2JDS2IrcmtPOVd6ei9RSVVaenJY?=
 =?utf-8?B?d2d2MmtxWVJMYzI4dEY2K1RzdWFOQmtZWDBJdzVaeHBqSFpSTFdmVEhxakdu?=
 =?utf-8?B?c2lEY3dVMUVjbjljbm8xSHU2SUkyOWQrdXB2RzBHclVJcUV3L0RxQ3BaT0pW?=
 =?utf-8?B?dEtjTHE2alZETGJ6bDNXeCtyR2p1VmhYSU5aZUJ0RnFTT1VNTWpGbFNLbHdz?=
 =?utf-8?B?bGUrOStVR2ZtczR0K0JianlUQ0tnaTdEUHdBcHhMbkpsTzlKV3RUSEJTN3Bn?=
 =?utf-8?B?Zmdzbm00a3A0MmI0eUo2Z3ZtMGRyemZCVWtzd1JGN0J2UkxzWUI2RmowV0Zi?=
 =?utf-8?B?OVFJM1FqNUp1dlNPTGtpUU9PWnpaZnFOb3JuVGR3ZWxWems1b3J0KzdpT0tJ?=
 =?utf-8?B?ZEVBNTdZRDl0UkVWSnFYeTM2dHNIVmtoby9ORTg2YlF6RTFMamw2UU9YMmJw?=
 =?utf-8?B?Tms4cS9YRGxKazBxZ1ZnaXFuMldjaDNndEEySkExYmlwYkt5QWpwMHBjdVEy?=
 =?utf-8?B?amEwU2JMWGQ0QlRFNENjbnNEQXJXYXNlL0F2WHdOc1UySkhhcDdRQWl3YTFP?=
 =?utf-8?B?SjZVZ1ZTVitwRk5FaThQZ1Fkc2MvNVVDeDNSVjZmbnpUNkUzYWtSYXh4VmZU?=
 =?utf-8?B?bUVhZEZRK2J4Nmw4Qi80Qk1GQVZwRU05cFdyd0EzTU9FQWtoY3M4UmVJQjFM?=
 =?utf-8?B?bmJCcVJrcGZmdG5paE1nNDk1dG5ZQnBOTDBxNk5BYjNvMmFUUW1qMEk3b2Mz?=
 =?utf-8?B?UWY2MlBCQ29sZjdUdERjcVpicElNRWpPSXY0R1piODRtSnZqV1czT3hLQVhl?=
 =?utf-8?B?aDlPNDNmeW1pbkFHelZhOFJqa1JUdFFYbVN2K0hNbDcrS1JQZTVpb2cvNDF3?=
 =?utf-8?Q?P97LDRWDATPlQPQeBQMqnIcrsxD6zu4m?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXBEN3VwK1dtWE96bkRsRDJrelNiNG82UHRqWU1MazFUVGNEWFBpYU94WVQx?=
 =?utf-8?B?Uk9IOHQyWUoyamJGQXVadWRvd3RraTN0TDhTaEtwWmRkbTNIbmFzTUlkZU5P?=
 =?utf-8?B?Y0FsSXd5SEtHd3FDK0t5WlUya0ppaDY3YkhhRExidngrMVNQUjVtd1QzUTAv?=
 =?utf-8?B?Z05nRC85OWpCM3BoUlBOWENFS0tMa1cwQVdJeEJrRGo4MFBMVktUTnpNVzdm?=
 =?utf-8?B?Z3k2TVQ0VElVSitySkVQV1ZSRDBmdjhheExUd2tMMnZHYm1henhHMjdSbkRt?=
 =?utf-8?B?MG1lRUJDcWxhZXp5MXZlN3F1ZVlYUkNVaG8zQzkzMHo4QTQ2QkdYN1FOSkNO?=
 =?utf-8?B?QlFXdE9wTWw0dFZpbFV6MVRoa05uUjc3eE84eERnNzBndU1ieVNZUVlvM1dh?=
 =?utf-8?B?eDNIa0cxNmhVZmxVay9HSTRmV3ZxbVFiTlg5eFRaeHdwMmhDTGsyRVptanNG?=
 =?utf-8?B?RVdRbUgxcGNDL2xWbkxqZVlxZkVFRWlyYzZsTStiS0Yrc3N6QzhTZ205cGJo?=
 =?utf-8?B?aGkyOVVRNHVscEF0S3R4WkRXTUJDVjJqYzBIMEttUm0wNmk2VW40cDE5MUNy?=
 =?utf-8?B?KzF3MjF5OGRMbGRMMHAxVHYrZExIMWJHZ2hGdDBIenhkRytYWHJ2ellCK0Q0?=
 =?utf-8?B?dE9uSmQyVCthcEN6R0JCVmlQZXJpK3oyaDhNN3hzZGllYU51VkVpUzhxY2Rn?=
 =?utf-8?B?eUtUVUQ5Qkt1NlcyYzlJVVhkSVp0eXh1RGoySjRWcFZEVzU4WEZIeFpFTmhz?=
 =?utf-8?B?RVFRcVhQZnZPcHpEUE84RDR5MSszNEZxeXVuYTFnb1lSVDEwdi9oUjVyWDVT?=
 =?utf-8?B?dmVxczNGdFVLSXdydmR6WU9BYzRFRDBDZzNWYmZRaXFqTllJdmtBNzkyc01W?=
 =?utf-8?B?SDhBaktjK3FGbmpLVlV1VFdjcXVTdUs4SGxlclpTc285aWFnc3ZobU1LWC9H?=
 =?utf-8?B?bEhBL0pvbVhod1RIZEIrc09rUjhDSWtNdkhTQUM4Q2FvSitMK2g5MTZGZmdW?=
 =?utf-8?B?MnVnRDhBMTRkZ0swZ09kd05KemhQYXBrdnZRajFEcXVOUThpOVl4ZHVNU3pV?=
 =?utf-8?B?dGZtTnBtOXlxOTRzSVNnZEVtSjdaWGV3RUJ0bWNscTlYY3J1MTQxNU5sOGkz?=
 =?utf-8?B?S3FSNkN0Wm9Ld2cwa1VrWjZYNHhHZUlZb1lTOWtEWkhobnJlcmF2N2Vmb3I5?=
 =?utf-8?B?TmRKUWJzZ0kwTTU5Tk84SUhpU01yd24rRmV5akVjSGNvMUQrb1Bvb2JSUktQ?=
 =?utf-8?B?T3dkZU1KZklFa3lmM2c3UnVIZDVuT3JqbmFoSzZuUHJZb2l4TlZvSDdkQ1pY?=
 =?utf-8?B?QVBkb1hEeTFKYU8wOWsvS1doTHYvT2x5YysvWUFSREE1alJxd0hSQnU3T0ww?=
 =?utf-8?B?WTFGSFdwb2pYUDNtODR1QmowaWV1LzRudFNxTU9wWUVFbzFqdmY0MFdXeVZm?=
 =?utf-8?B?ZlMxV1psdXhvU1BreEp3VGQyYkJxbEJKZzYxalFiQ0tYa0NtaEZNYVUzdStJ?=
 =?utf-8?B?Y3NBbmtLbGo5cHlnSWNFelh3bE1WbTllcGlCZ3VZc0RIZ3ZZd1hJNGNTQyt6?=
 =?utf-8?B?bG9pdTBIbzJsNEk0YnlmMit5b0ppUlVnN202UXVVUnROWFo2QmpOenVVaWdj?=
 =?utf-8?B?NDZ0Q04yMlBUVlM3WmhzOFVQZk0xZU1LWG45ZDZqeFVteGFBeE1MVkJ4WldB?=
 =?utf-8?B?NnhRWVAvRzQ1L2hsbVJPL0c3emdDZXhFaHRPZ29OSzc3VUQwK3l4eEpiNG1T?=
 =?utf-8?B?YkJMWlM4M3liU0FmREdib2lSTFcyWXVRbFNjRW5QN1I0eU55YzBVMXBFZmpu?=
 =?utf-8?B?SUdXZUl5Mi9OQUdRYUh3Y3cyMC9uZFZ2cDREQ2ptd2lNMUU4RndEOVgwNytS?=
 =?utf-8?B?NzJLMmVGaUIvZVh1SklFc0E2K0NIMTlqcGNac2lyeW5zQzJENHZNZVd2OGZw?=
 =?utf-8?B?TUllYnJEWTJsTElNY3lUMlZTZVFmTE1HelV3SEVrVHpMS3JkbElYR3hORUJW?=
 =?utf-8?B?YmZVdXBHdUJkZnUzRDRkWG1QdWJKZjZWVnlJOXpobkFySWsvbjJuSDBLTWlG?=
 =?utf-8?B?UkhZSytoa3lPb0RETzRjNjlHa0gvbWthOVg5bUhmUUpzOEJrbWpHQXFuRWJX?=
 =?utf-8?Q?BZLX+Vw4Gm/1fKLEGdbn1J3at?=
Content-ID: <42B2C4FAAD305940B329808514E066E0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4420ba-0937-4731-695f-08dd20d0b710
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 08:31:35.2929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lojaYtZj+E7wwO2EAr0twCSjLXI+10uoCo0e0ydBD7g6+2RusBQToBQBwjUy85L0DzeGY4q7Y0wL1Psdg0hL9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7942
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1088335066.2083327508"
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

--__=_Part_Boundary_004_1088335066.2083327508
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBTaW1wbGlmeSB0aGUgcHJv
YmUvcmVtb3ZlIGZ1bmN0aW9ucyBieSB1c2luZyBkZXZtX2RybV9icmlkZ2VfYWRkKCkNCj4gYXMg
bm93IHRoZXJlIGlzIG5vIG1vcmUgbmVlZCB0byBtYW51YWxseSByZW1vdmUgdGhlIGJyaWRnZS4N
Cg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRl
bHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgfCAxMCArKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMNCj4gaW5kZXggMmQ1Y2Y3MzUyZWQyLi41ZDQ2ZDQ4NmM2OGYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBAIC0xNjc0LDE0ICsxNjc0LDE1IEBAIHN0YXRpYyBp
bnQgbXRrX2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAg
ICBoZG1pLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQTsNCj4gICAgICAg
ICBoZG1pLT5icmlkZ2UudmVuZG9yID0gIk1lZGlhVGVrIjsNCj4gICAgICAgICBoZG1pLT5icmlk
Z2UucHJvZHVjdCA9ICJPbi1DaGlwIEhETUkiOw0KPiAtICAgICAgIGRybV9icmlkZ2VfYWRkKCZo
ZG1pLT5icmlkZ2UpOw0KPiArDQo+ICsgICAgICAgcmV0ID0gZGV2bV9kcm1fYnJpZGdlX2FkZChk
ZXYsICZoZG1pLT5icmlkZ2UpOw0KPiArICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgYnJpZGdlXG4i
KTsNCj4gDQo+ICAgICAgICAgcmV0ID0gbXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsN
Cj4gLSAgICAgICBpZiAocmV0KSB7DQo+IC0gICAgICAgICAgICAgICBkcm1fYnJpZGdlX3JlbW92
ZSgmaGRtaS0+YnJpZGdlKTsNCj4gKyAgICAgICBpZiAocmV0KQ0KPiAgICAgICAgICAgICAgICAg
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiRmFpbGVkIHRvIGVuYWJsZSBhdWRpbyBjbG9ja3NcbiIpOw0KPiAtICAg
ICAgIH0NCj4gDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IEBAIC0xNjkwLDcgKzE2OTEs
NiBAQCBzdGF0aWMgdm9pZCBtdGtfaGRtaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsNCj4gDQo+IC0gICAgICAgZHJtX2JyaWRnZV9yZW1vdmUoJmhkbWkt
PmJyaWRnZSk7DQo+ICAgICAgICAgbXRrX2hkbWlfY2xrX2Rpc2FibGVfYXVkaW8oaGRtaSk7DQo+
ICB9DQo+IA0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

--__=_Part_Boundary_004_1088335066.2083327508
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTEyLTE3JiMzMjthdCYjMzI7MTY6NDMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaW1wbGlmeSYjMzI7dGhlJiMz
Mjtwcm9iZS9yZW1vdmUmIzMyO2Z1bmN0aW9ucyYjMzI7YnkmIzMyO3VzaW5nJiMzMjtkZXZtX2Ry
bV9icmlkZ2VfYWRkKCkNCiZndDsmIzMyO2FzJiMzMjtub3cmIzMyO3RoZXJlJiMzMjtpcyYjMzI7
bm8mIzMyO21vcmUmIzMyO25lZWQmIzMyO3RvJiMzMjttYW51YWxseSYjMzI7cmVtb3ZlJiMzMjt0
aGUmIzMyO2JyaWRnZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5o
dUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMy
OyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMmIzMyO3wmIzMyOzEwJiMz
MjsrKysrKy0tLS0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs1
JiMzMjtpbnNlcnRpb25zKCspLCYjMzI7NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMz
MjtpbmRleCYjMzI7MmQ1Y2Y3MzUyZWQyLi41ZDQ2ZDQ4NmM2OGYmIzMyOzEwMDY0NA0KJmd0OyYj
MzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMz
MjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMy
O0BAJiMzMjstMTY3NCwxNCYjMzI7KzE2NzQsMTUmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYj
MzI7bXRrX2hkbWlfcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0
O2JyaWRnZS50eXBlJiMzMjs9JiMzMjtEUk1fTU9ERV9DT05ORUNUT1JfSERNSUE7DQomZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdl
LnZlbmRvciYjMzI7PSYjMzI7JnF1b3Q7TWVkaWFUZWsmcXVvdDs7DQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnByb2R1Y3Qm
IzMyOz0mIzMyOyZxdW90O09uLUNoaXAmIzMyO0hETUkmcXVvdDs7DQomZ3Q7JiMzMjstJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkcm1fYnJpZGdlX2FkZCgmYW1wO2hkbWktJmd0
O2JyaWRnZSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Rldm1fZHJtX2JyaWRnZV9hZGQoZGV2LCYjMzI7JmFt
cDtoZG1pLSZndDticmlkZ2UpOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJu
JiMzMjtkZXZfZXJyX3Byb2JlKGRldiwmIzMyO3JldCwmIzMyOyZxdW90O0ZhaWxlZCYjMzI7dG8m
IzMyO2FkZCYjMzI7YnJpZGdlJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7bXRrX2hk
bWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsocmV0KSYjMzI7ew0KJmd0OyYjMzI7LSYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO2RybV9icmlkZ2VfcmVtb3ZlKCZhbXA7aGRtaS0mZ3Q7YnJpZGdlKTsNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsocmV0KQ0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyO2Rldl9lcnJfcHJvYmUoZGV2LCYj
MzI7cmV0LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtl
bmFibGUmIzMyO2F1ZGlvJiMzMjtjbG9ja3MmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7LSYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYj
MzI7JiMzMjt9DQomZ3Q7JiMzMjtAQCYjMzI7LTE2OTAsNyYjMzI7KzE2OTEsNiYjMzI7QEAmIzMy
O3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2hkbWlfcmVtb3ZlKHN0cnVjdCYjMzI7cGxhdGZvcm1f
ZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1p
JiMzMjs9JiMzMjtwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCiZndDsmIzMyOw0KJmd0OyYj
MzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZHJtX2JyaWRnZV9yZW1vdmUo
JmFtcDtoZG1pLSZndDticmlkZ2UpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO210a19oZG1pX2Nsa19kaXNhYmxlX2F1ZGlvKGhkbWkpOw0KJmd0OyYj
MzI7JiMzMjt9DQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ3LjANCiZndDsm
IzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1088335066.2083327508--

