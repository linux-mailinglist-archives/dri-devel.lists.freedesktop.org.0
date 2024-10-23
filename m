Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA99ABE1C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 07:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07A10E02B;
	Wed, 23 Oct 2024 05:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Z8hRSA+E";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aXaWEbBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A886010E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 05:47:33 +0000 (UTC)
X-UUID: 49681a82910211efb88477ffae1fc7a5-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=HYnPWdEWHeyT0Q4OEya18mTdaW8R34RC5xNKGkXGA/M=; 
 b=Z8hRSA+EXVQUYzKjV0zY3qKHN5Tm+pIbIO1HPqE0c7NcT/+bNk7rBYjXj0TfJrPGPUNbWNkYEv6TxAgagVUZNyjCJagtgs5N2F/u+BYZ1z5PcX2lCd/u4VSmaJUd9MB0ohpq4BJ09Rz7uG4tRevB1/FDkmlFnugmUIw93ThAMiE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:a15356e3-4326-4c60-914e-bfe32545de82, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:8547b9cc-110e-4f79-849e-58237df93e70,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 49681a82910211efb88477ffae1fc7a5-20241023
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1041705095; Wed, 23 Oct 2024 13:47:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 13:47:25 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 13:47:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxA+0AtTSdW2RaoRb4jnzhFZlD9TVb/bAPze7ERS3JgChSM8whrj6jcj1LG1yTRJuHRidm4WOBYi/KMUgHjdu8qzc5z+0EmVsbTiWshFXORK5PVtp2JqI/z1niJ6bb4K4QnsbKsYKbj7JXD4m2EL4w7Xo2mOcR7ynzYR4wcSqAa4PTslVvK/W2Of4a5QhyfQXF+p1rXCEmGGYCtLsXnGesoRJ5JlB51Uop0HspnWHXTgM7FtlhqoNo+bXOmcpaD1EzpHRIFt0iHHoEOW5PcEWOSXC2lS04AyYQPkdE0Msp+YI7YN2WxvkiSYptBvPI3NUm5V15B0nSupteutKozFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxFE8FWBBnu0vMNize9ARyYLfjlHOmKJTSCoRvxR1HI=;
 b=pxin+qeB/tgS3tD849NEjMTX7lgKugUxrSSFqOPbsRr6bs7THkFIXGA077hq43koe74VBpGtvARB87UZPqQJgoNgR1xolGdjB25owGGuBw5BeMnsySAnXFpDvpXNTnOxSso6hD29IezATytNPMmaiiEqKwJMnVSOJUdZjW7yJmz1bpUcjDU+cN7/zTFas00Pw8bwY7lcly1EyFKJYlhCDlySsCw3bHhkgjuYFGu18gwivZJn7bpZ3zYUwpIn/BEug5ZQKaTL5voq5Yz4M39P56dFWzIEDEExM2pr8gZoBqmktZRwkb51tflUHpz+DXd+N5ofB9/Gel6WjFMG1IZ4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxFE8FWBBnu0vMNize9ARyYLfjlHOmKJTSCoRvxR1HI=;
 b=aXaWEbBCN2+zPhLtz3CuftOeYet06rkaFFWUz+R3ranRWJngJQHfppaKYYscgrlGjj+5QVkKBTRrl+QGUTdIjxNYhSN/pkHhml9FVOlyPNo2CEVEYvigjR320Rozjah5Uj+Iact0HC8+GdEWz82hPgoZ1PUBPXH6e1ulgfQNDAc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7641.apcprd03.prod.outlook.com (2603:1096:400:414::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 05:47:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 05:47:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
Thread-Topic: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
Thread-Index: AQHbBPAhuvzzYV7xi0ST3TPZ7S9mALKUFC2A
Date: Wed, 23 Oct 2024 05:47:21 +0000
Message-ID: <d0f766ce878ade8fe1b3952c36ea208910d2a695.camel@mediatek.com>
References: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
In-Reply-To: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7641:EE_
x-ms-office365-filtering-correlation-id: 2b206e30-41bd-48b3-d14f-08dcf3262a18
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V0RhTU5WQnZCNEtjTFpqK0gxc2xxa0FlTjFHQkRuSWI2VFlVcjJ0ZVREYzl6?=
 =?utf-8?B?RXFEWmVHWUp3MFBZWnl1cnFGekY1ajF3QlNDSzZlbnNrU3RNWTZtYk5Dcmk5?=
 =?utf-8?B?N3djNjNodWl4UDlWM3VmVUY5dysyQ2xYWUxma0lJengwQVlUelRJZDJibnRV?=
 =?utf-8?B?OUp0NWpPblk0aUhvU3JkeUF1Q2ZReitnZnBMYytLNDR4b2JqSEMra0xIUEJt?=
 =?utf-8?B?dE5sbVR6VXZZeHBEVE5FVnlWbWpCcnFnVlVFRlpKUzE5cUsxLytRMnJaTEFl?=
 =?utf-8?B?bnhpMzhQTWt5L3ZTNjArS2pRTXJTemtyaC9wV2VqcmZYM28rUS9STWl2R2NX?=
 =?utf-8?B?UG9lNG40dlYvdjUxZWwzdlI1Y0FjZW5XZ3NxM29NYlJmTStQSEJXeUdhZFRl?=
 =?utf-8?B?R21LUS9jRlluYW9vMGZJekFaUWprMzBjNE9yanBOQzJjRmt6YTQwMFZOaTdi?=
 =?utf-8?B?Y1l2cEtHMUl4Ky9hZ3FsRmQwZ1FVYldoWi8rK21XalVMTmI0b28yM3FLWm1G?=
 =?utf-8?B?N2J2VDgrVlJMeUo4UFdNUHI5VFpMei8xTU9CbXVMejRla09SM1ppeTNHSXF5?=
 =?utf-8?B?QkVuR3ZucElwVklLUEtkeGNCclBqc09VbE1XYkdVVGpmUmhNU0FJNFJIMCtS?=
 =?utf-8?B?V1RsZnhrdnQ4Y1FiZzMzMFZoMjh1S0JBK0M4QmIzYzhOc21vUHpzZHpwYTRz?=
 =?utf-8?B?aUdtcnNOSUgyNkYwV3NEMVZ1V0N2SU9RSWtXVWx4bUNieDJCTzNyV0NCYVpX?=
 =?utf-8?B?QU9peTc5cjkzSytJSVlhWWdxbEFLd3d0SGZXYkltQnFFUHh2QnZOTFUxNjBV?=
 =?utf-8?B?dVZYV2RFNXN4NGZvZ2VLUnV1SGV5emN3WkhoM2gvb3I3QnA5YWw5M1MzZEJm?=
 =?utf-8?B?SzRXUTR1bGUrMzM3YUxKUDN2QlY2a3JwVjc5Rm5UVDJvMjVSS2pXczlkQW9E?=
 =?utf-8?B?aDk5VWZ5cVN3bEU4cnUvR05qRVNlRzcwbkppSU83ZUJySlliUFlFMnVpUmUw?=
 =?utf-8?B?eGxqOHdsNHJucnNxeTlLdURJUEd2QUtVVGpXRWsyRXR5RzVCQ213VU1oazd3?=
 =?utf-8?B?SUlMVit2SFNWSkhYY3pXYXNIc2F2MGM3SldjKzhodGJYalZKbDBVMW16aW5w?=
 =?utf-8?B?cVd5WEhqUmNMNDJOYjZESWlZSHByMXNzUkt4SFJiUEdpcmQ3dGw5dWVkRmVh?=
 =?utf-8?B?T01NTHVMSlNzd3JlOStMc05jbFJUUml1QW1LVVdkUnJxYXNxenRrQ0trTlgx?=
 =?utf-8?B?dWFCdldBZG85M1JMOEYyS1BGVWc4Y0dzeFBaellZNkRBMWloQm5VemRhaDJh?=
 =?utf-8?B?YVNUTDAwMGZDa0xoQkpTeHpPQ0dKL1d4KzJ6OVJTYWc0UEQwb0grWXdxWXZn?=
 =?utf-8?B?ZU9RdkNsRDQ5cklpVmN1dW1GZTFranFWeXFnalBHMGhXNzFLNzlzOGk5bmND?=
 =?utf-8?B?NDdjWUtDdE5rU0FWcnZpQUs2VkI0OWxtdzM5YXIyV1FZSTZSaDRLUzh2SmtC?=
 =?utf-8?B?M3haTUJKVW1ldVpXYm1MSnd0VDlNUENsUGtnZ3lTN2dodVpjLzU1L1lPS296?=
 =?utf-8?B?dTBOTGlYS0J1YWxPS1FHTnlUYjVtQVowaSs0K3hFalRtaGhxWldDZHl1S3Z2?=
 =?utf-8?B?cCtTejJwdWVVOHNOUk45aUlDZGNCaE9DN2N2Rlc5amRPWjh4VUhNWGd3ak5W?=
 =?utf-8?B?V1hvK3dQQ0tUNS9hYVBDRk5KeFUwSFBYSnl1ckRtTHZCbzNwUWM4b0pVYWF3?=
 =?utf-8?B?eXdKZ24rYllRcjFlMnFiSTdHM0k0eExDVThoZkM5UW5zckJZN2gxYTdlQXZL?=
 =?utf-8?Q?8H8nGr4ha+bsMkMLvnyxd3nLPF8shO7E6U8Mw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0R1L29Ua1RXSkdMUmNGTXVHQ3BmYUp2VE5QVUdyYjNHdFluQU9tOWhkeWoy?=
 =?utf-8?B?Q3R0WXNiVDBSaTBsSGU1SHg5TmdJK3BFS0J3eVVwOUZ6SnJUT2YzYUVmWllp?=
 =?utf-8?B?Nlh2akp0eDRnT0Y1VUhPQW55T21nNFpYelJ1K2JGaWVnS3JJdTI5aXJhZno3?=
 =?utf-8?B?ejBJOHpQeHdFSzdmVDJnTFJNdG5HYVp2K2dWWDZtYU5RNGdwM0ttVjhxZGhp?=
 =?utf-8?B?TUw4Z1oxeDFzQ0dqcmxrbE0yVmZTakkyMlBYNkp4NXBsY0ZSRmRCUzFYdThM?=
 =?utf-8?B?Y2tVNzB5VDZlWXNvZUV0SjN5a2hGNXFKRnJwUkRYQWE5T2Q1Vkt6RU9qOEVQ?=
 =?utf-8?B?SmFwMkVvaW1vR3VpN0pveTdtRjFJUitVUUxWYngreG5JcnZsSWJRenlEQjVF?=
 =?utf-8?B?b0kzMFJPMmIrMGxmL2o0UlhVa01LOVFBbEM2bzd4bDJEdGoxTGVGS0lIZ1lp?=
 =?utf-8?B?Q0JKWTgzUmlnRGF2RDhMQW9oUFdJTFFTRGdacW54NlNTOXB1K1pKVGs5c1kv?=
 =?utf-8?B?M2VKV3hCeVpzV2pEdXRlNGFNMzhqOUdqcnc0bkplbXNlNndtUXIvYVdGaVJh?=
 =?utf-8?B?eUo4NzJHUDlybFZTYzNSek1Hb0NiZ2FzcUplNk9QMXg3dGhWWXR5eHR3bUVy?=
 =?utf-8?B?VkJ2eElLQzRYWE1TY1FZb2oxTW15YlVDakJXTkpGUEVJKzJibVB4MU1tUG8z?=
 =?utf-8?B?QlZSbU91TXhFMjNKTXI1UjVJOERMdXJrVmVsQWhKU01ldVBZV2VmZ2dnbXhs?=
 =?utf-8?B?anRFb1FDeklnNUpQMWUwQnpkNXNHVGF0cXM5Nk9qL2dFMTh4SnpTTFhsNlJv?=
 =?utf-8?B?MkIySGdzN0VNTGhFSThLR3RqamdhRkJ4Z3dWdWdsUEF5Rm5DSlF6cWVlREZZ?=
 =?utf-8?B?dmxQcm5lT1BreUFjcDZ6ZklZYmE3YkNMZkxrSlUwbGl5V1hRTmljd2poUVRW?=
 =?utf-8?B?YjR0bHRNcG1HWHVsbHN5U0pqWDZuWWNIWWpGS2ZQa3FwUWxnRFdCMHl4dUlE?=
 =?utf-8?B?RFY3dE9pSVZXVFVBQ21DQzl5TGpXM0dSNXNWQmk1aGNNcU9jdnZLVDNWV1V1?=
 =?utf-8?B?TzFrNlhVeXFLMnBBQ0tjWnQyTklCa0dqQncwVFlHYXZGdXN3WlY3VzAyU3lZ?=
 =?utf-8?B?RUJNSll2Zk9seDVhdjJoRVRNRlRBeFJUUnFuUDI4ajlDQUdSTlVhenJVbkpr?=
 =?utf-8?B?bmRwSlhpT0ZhSXFmYzk0MTdJTElhMDdJa2R2U3JaQ2VYd2tRRDFvY2NuaTdT?=
 =?utf-8?B?bTZYK1dkMU1XdUJLVkRnNUJTR2xwbFZxeUs2c3lNY1czbVVOMnRQbWdjaW1o?=
 =?utf-8?B?d1V4TFdrckhMZFFFVWRWbWk0UnNjVWFCMkZnTHFMQVpyZG5JTFoyVkltRHlY?=
 =?utf-8?B?OXIxMitrMHBkUjdyLy9VeGZjazl3YU1qd0EydmJMVGM4UnIrZnRiWWE1dFA5?=
 =?utf-8?B?b2x4WGxBTnFiOTdSbkU0dWVFZ3h4OUdlMlZ4QzdXUVllYzF2S3ZDVzdkMmN1?=
 =?utf-8?B?ZThnUEw4d1BTcTc2cHZyMFlQa2RkeFdmMmk5YkNXbm53bCtOZXdROVFZRzFC?=
 =?utf-8?B?c2ExblNPbHBGNmVtaDZ5T1kzWlRiUkN1MlJRcFFXUG5Fb21ibm5mbVR2MTg2?=
 =?utf-8?B?cDFSQndTRmNscWwzY01hWlY5Y0J0MVVIQUVncjFBRDlhWXB0dW1GUlBIamdJ?=
 =?utf-8?B?N1pwOHg3VTRLMDhoQVE2a3lqOEIvQTV3MjFUWjRBcmYxSFhVREkyc1luTlBU?=
 =?utf-8?B?MkhqT1NjOVdXNTV2dVBsdXpzZTlnQnBVb3RmUDlScHA1VEdZSXZNaThNUklH?=
 =?utf-8?B?ZG1wNVNCUVgvWjJkdTJ4TmxPOGV5emNWbTRleHp2dVN1bTZzMlFHL2wzdjhw?=
 =?utf-8?B?Zmd2V3RvajFUejRRZEhBUWdVRmsya3dXVjUwN2w0Q2JiNDBvUUNkSTN6d25t?=
 =?utf-8?B?bVZITDBaR1FTQlZYQjRIeVNwaWx2TjV1Ull4RDNqTmdOQWt1blV2ZjIxbmVs?=
 =?utf-8?B?cHI2SVlXdXB2WTlRYm5CYVRqV0dpcGF0dTkvbzdkZWZvR2NWaTg5VzBvQWFo?=
 =?utf-8?B?bnBnRGlqdWRHTmFwbmRmNmp5UUVMYm5xbjRwNzdHZDdEUkZhemV2RkQ4bkVw?=
 =?utf-8?Q?bjY0nbl8gp26s8RqUWCTPEclg?=
Content-ID: <2F8BF7A82E1E0E48B63D533219DAA076@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b206e30-41bd-48b3-d14f-08dcf3262a18
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 05:47:22.0260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVm6j4BmczTJX1gVI2ax4H1tJdp2uLSoGYWCZLJv1bSdX6SOFW+qhUR5jFyyZe0r59IIKMwXLnBxGLuSPXQhDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7641
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.729900-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0qD6/2ZgM6OaYxYkErIAqjRydRN/Yyg4pjljSRvSGpq3OPS7xLMT1Jh2ei
 q5HAdjcEZ0rSGs1qlKUi32jWt0JegWF08SJkeWbxDiyuN5FvFNkyQ5fRSh2650zabL4+/4cvRzx
 o0NEcVqeLzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7JQhrLH5KSJ0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.729900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 89E0F0157702583248E7F27947941784853CADBA6C865708548984F91409326A2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_403385416.20679173"
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

--__=_Part_Boundary_003_403385416.20679173
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIERhbjoNCg0KT24gVGh1LCAyMDI0LTA5LTEyIGF0IDExOjQ0ICswMzAwLCBEYW4gQ2FycGVu
dGVyIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNl
bmRlciBvciB0aGUgY29udGVudC4NCj4gIEluIG10a19jcnRjX2NyZWF0ZSgpLCBpZiB0aGUgY2Fs
bCB0byBtYm94X3JlcXVlc3RfY2hhbm5lbCgpIGZhaWxzIHRoZW4gd2UNCj4gc2V0IHRoZSAibXRr
X2NydGMtPmNtZHFfY2xpZW50LmNoYW4iIHBvaW50ZXIgdG8gTlVMTC4gIEluIHRoYXQgc2l0dWF0
aW9uLA0KPiB3ZSBkbyBub3QgY2FsbCBjbWRxX3BrdF9jcmVhdGUoKS4NCj4gDQo+IER1cmluZyB0
aGUgY2xlYW51cCwgd2UgbmVlZCB0byBjaGVjayBpZiB0aGUgIm10a19jcnRjLT5jbWRxX2NsaWVu
dC5jaGFuIg0KPiBpcyBOVUxMIGZpcnN0IGJlZm9yZSBjYWxsaW5nIGNtZHFfcGt0X2Rlc3Ryb3ko
KS4gIENhbGxpbmcNCj4gY21kcV9wa3RfZGVzdHJveSgpIGlzIHVubmVjZXNzYXJ5IGlmIHdlIGRp
ZG4ndCBjYWxsIGNtZHFfcGt0X2NyZWF0ZSgpIGFuZA0KPiBpdCB3aWxsIHJlc3VsdCBpbiBhIE5V
TEwgcG9pbnRlciBkZXJlZmVyZW5jZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRp
YXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiA3NjI3MTIyZmQxYzAgKCJkcm0vbWVkaWF0ZWs6IEFk
ZCBjbWRxX2hhbmRsZSBpbiBtdGtfY3J0YyIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50
ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2NydGMuYyB8IDMgKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMu
Yw0KPiBpbmRleCAxNzViMDBlNWEyNTMuLmMxNTAxMzc5MjU4MyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19jcnRjLmMNCj4gQEAgLTEyNyw5ICsxMjcsOCBAQCBzdGF0aWMgdm9pZCBt
dGtfY3J0Y19kZXN0cm95KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gIA0KPiAgbXRrX211dGV4
X3B1dChtdGtfY3J0Yy0+bXV0ZXgpOw0KPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NN
RFEpDQo+IC1jbWRxX3BrdF9kZXN0cm95KCZtdGtfY3J0Yy0+Y21kcV9jbGllbnQsICZtdGtfY3J0
Yy0+Y21kcV9oYW5kbGUpOw0KPiAtDQo+ICBpZiAobXRrX2NydGMtPmNtZHFfY2xpZW50LmNoYW4p
IHsNCj4gK2NtZHFfcGt0X2Rlc3Ryb3koJm10a19jcnRjLT5jbWRxX2NsaWVudCwgJm10a19jcnRj
LT5jbWRxX2hhbmRsZSk7DQo+ICBtYm94X2ZyZWVfY2hhbm5lbChtdGtfY3J0Yy0+Y21kcV9jbGll
bnQuY2hhbik7DQo+ICBtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbiA9IE5VTEw7DQo+ICB9DQo+
IC0tIA0KPiAyLjQ1LjINCj4gDQo+IA0K

--__=_Part_Boundary_003_403385416.20679173
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtEYW46DQoNCk9uJiMzMjtUaHUsJiMzMjsy
MDI0LTA5LTEyJiMzMjthdCYjMzI7MTE6NDQmIzMyOyswMzAwLCYjMzI7RGFuJiMzMjtDYXJwZW50
ZXImIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMy
O2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5r
cyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbCYjMzI7eW91JiMzMjto
YXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2Nv
bnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0luJiMzMjttdGtfY3J0Y19jcmVhdGUoKSwmIzMyO2lmJiMz
Mjt0aGUmIzMyO2NhbGwmIzMyO3RvJiMzMjttYm94X3JlcXVlc3RfY2hhbm5lbCgpJiMzMjtmYWls
cyYjMzI7dGhlbiYjMzI7d2UNCiZndDsmIzMyO3NldCYjMzI7dGhlJiMzMjsmcXVvdDttdGtfY3J0
Yy0mZ3Q7Y21kcV9jbGllbnQuY2hhbiZxdW90OyYjMzI7cG9pbnRlciYjMzI7dG8mIzMyO05VTEwu
JiMzMjsmIzMyO0luJiMzMjt0aGF0JiMzMjtzaXR1YXRpb24sDQomZ3Q7JiMzMjt3ZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2FsbCYjMzI7Y21kcV9wa3RfY3JlYXRlKCkuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO0R1cmluZyYjMzI7dGhlJiMzMjtjbGVhbnVwLCYjMzI7d2UmIzMyO25lZWQmIzMyO3RvJiMz
MjtjaGVjayYjMzI7aWYmIzMyO3RoZSYjMzI7JnF1b3Q7bXRrX2NydGMtJmd0O2NtZHFfY2xpZW50
LmNoYW4mcXVvdDsNCiZndDsmIzMyO2lzJiMzMjtOVUxMJiMzMjtmaXJzdCYjMzI7YmVmb3JlJiMz
MjtjYWxsaW5nJiMzMjtjbWRxX3BrdF9kZXN0cm95KCkuJiMzMjsmIzMyO0NhbGxpbmcNCiZndDsm
IzMyO2NtZHFfcGt0X2Rlc3Ryb3koKSYjMzI7aXMmIzMyO3VubmVjZXNzYXJ5JiMzMjtpZiYjMzI7
d2UmIzMyO2RpZG4mIzM5O3QmIzMyO2NhbGwmIzMyO2NtZHFfcGt0X2NyZWF0ZSgpJiMzMjthbmQN
CiZndDsmIzMyO2l0JiMzMjt3aWxsJiMzMjtyZXN1bHQmIzMyO2luJiMzMjthJiMzMjtOVUxMJiMz
Mjtwb2ludGVyJiMzMjtkZXJlZmVyZW5jZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUm
IzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rml4
ZXM6JiMzMjs3NjI3MTIyZmQxYzAmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtBZGQmIzMy
O2NtZHFfaGFuZGxlJiMzMjtpbiYjMzI7bXRrX2NydGMmcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7RGFuJiMzMjtDYXJwZW50ZXImIzMyOyZsdDtkYW4uY2FycGVudGVyQGxpbmFy
by5vcmcmZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19jcnRjLmMmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjsxJiMz
MjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspLCYjMzI7MiYjMzI7ZGVs
ZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfY3J0Yy5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MTc1YjAwZTVhMjUzLi5jMTUwMTM3
OTI1ODMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfY3J0Yy5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19jcnRjLmMNCiZndDsmIzMyO0BAJiMzMjstMTI3LDkmIzMyOysxMjcsOCYjMzI7QEAm
IzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2NydGNfZGVzdHJveShzdHJ1Y3QmIzMyO2RybV9j
cnRjJiMzMjsqY3J0YykNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO210a19tdXRleF9w
dXQobXRrX2NydGMtJmd0O211dGV4KTsNCiZndDsmIzMyOyYjMzI7I2lmJiMzMjtJU19SRUFDSEFC
TEUoQ09ORklHX01US19DTURRKQ0KJmd0OyYjMzI7LWNtZHFfcGt0X2Rlc3Ryb3koJmFtcDttdGtf
Y3J0Yy0mZ3Q7Y21kcV9jbGllbnQsJiMzMjsmYW1wO210a19jcnRjLSZndDtjbWRxX2hhbmRsZSk7
DQomZ3Q7JiMzMjstDQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsobXRrX2NydGMtJmd0O2NtZHFfY2xp
ZW50LmNoYW4pJiMzMjt7DQomZ3Q7JiMzMjsrY21kcV9wa3RfZGVzdHJveSgmYW1wO210a19jcnRj
LSZndDtjbWRxX2NsaWVudCwmIzMyOyZhbXA7bXRrX2NydGMtJmd0O2NtZHFfaGFuZGxlKTsNCiZn
dDsmIzMyOyYjMzI7bWJveF9mcmVlX2NoYW5uZWwobXRrX2NydGMtJmd0O2NtZHFfY2xpZW50LmNo
YW4pOw0KJmd0OyYjMzI7JiMzMjttdGtfY3J0Yy0mZ3Q7Y21kcV9jbGllbnQuY2hhbiYjMzI7PSYj
MzI7TlVMTDsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40
NS4yDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwh
LS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_403385416.20679173--

