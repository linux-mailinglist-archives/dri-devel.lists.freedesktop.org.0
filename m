Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611DA50446
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC0610E7EC;
	Wed,  5 Mar 2025 16:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kkXfABA9";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oN+kKtB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43110E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:12:50 +0000 (UTC)
X-UUID: abe93658f9dc11ef8eb9c36241bbb6fb-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KIqguIiFjxOboERGwQ2MEXbvB5fT6rUnrxxOi7DPxEE=; 
 b=kkXfABA9koztDDMx8Jj50w9y1xws9fcclstGTsAGznzExZ7v8GjoYemzWSIiyGiFJeoBwh4XJAOQRg0DDF5AwLhvysecLgWMt0IVzgA3FTMninScIM4n2s53Zc+x5xwqIWpuBioBThsGKqgsx8koJRg5NVUbn93h6uz9NkNFjtk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:b6bd0230-92f2-41fa-9775-54d738079b8e, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:382f0fce-23b9-4c94-add0-e827a7999e28,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: abe93658f9dc11ef8eb9c36241bbb6fb-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1234408657; Thu, 06 Mar 2025 00:12:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 00:12:43 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 00:12:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BveLYxb1rmxt8/mSvMdmoxJ6DnDBLIbh/UFciVMRX2e1hitvqcu7izaGvsQe0zb3xl2bIxOKoVngjkVleXpxpDrGaA3fd4S9XA3qVs3v06tfrOAxNH4z6ryRPOAEHGDhRDhuaklqjRct+c00P2W/FDJlWDayqc7nHCWAZFmllXnZhlQIdqSpSM6UzCEw/aYFpcCU9DGon2w9tJc7iDE1521eNYb2rOWBdWHjrB0rNJf8E2WPRS3YcGko9m4SacTRIqgFjcy+Fxr1YBrvMH5vjMoCSy7jqzdEvVs+vxPtMHwi5iqsZfE5ZNcILNtyagcoi9F1iozZ4lQVEVrDHjRKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hg0T3rx+HW9AYBBekGOd01W9cEvUq8zCRinn2715ixc=;
 b=sV4Y7v4Tb3T1IJ9GVVoFsa64foEzgQvdpY+VwaoAW3H0e4/CkBLinnwa19sb7n8jTLDvZjckB+WGDZXrgJWNe3Al2pELlvz0Y5in9l/s+3dmO9quw9iQhS8grzOY0Y461qlzCtsC46NWb5BM6AkS3sh7JGBd4Hh/Fm9W3OXImgbMNenezV+kSTvwV+lqr7sj371r6r2Yi97zbDpvhWCQSx60MtSpC6lSPL3EG2zeraBIltt7mPWsOtFkcHQr1sTeBZZvcMQjQiZNCD0ep27NX9i6XxlBTsAs94yqDA1ktH9T1xAfSLcwqXKsEZ9rVH2zMn8T3TNt8e4+zFIsBPAY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg0T3rx+HW9AYBBekGOd01W9cEvUq8zCRinn2715ixc=;
 b=oN+kKtB4vAkakEdzzU6XAhgJVIpD6SYCNFoPBiaprogRhEHl7zBWgKrsQNG7OZ0msNpNtf5bOsPqgAS2kKMSGbyvhKzb0Z77SbNVNIWe7gdneXCAmcPd/kYNbQ0ZuwQKeDTejr1FwhKZwGPYnDvwxjpgGEaWVpGOOmmCMOwZ6ZM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB7282.apcprd03.prod.outlook.com (2603:1096:400:21d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:12:39 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 16:12:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
 <treapking@chromium.org>
Subject: Re: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbgchAmC8ygt6ujEmjaToxU9ar8rNiz7WAgAH/jgA=
Date: Wed, 5 Mar 2025 16:12:39 +0000
Message-ID: <ddcf01c82f92ee461875e1122b009b7fca691127.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
 <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
In-Reply-To: <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB7282:EE_
x-ms-office365-filtering-correlation-id: 0f687ae8-4cff-4ff6-c8d9-08dd5c008d2c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZjU2dlhSbVVwekdYeWR3WGllQ1lGMVptK1p3ZFI0MG9KRW9oTjVnVUhWa0FS?=
 =?utf-8?B?TzVucnVLVVlMRkRsamJzQ2FIZzFtNmR6d21PQk1PN1dPYkNmQlBOWFZOZlVa?=
 =?utf-8?B?RlR6TUhOWEVDQkVNNVh5cDhpeHNPQXZQZWQwOVBRaGR6bFpuQVREY2QyNXZ2?=
 =?utf-8?B?cVU0MEJyRnFrMUNyU2lQQUdLc1lpckY4NGdLZytLcXpscXZDR09NZitGUlNH?=
 =?utf-8?B?K09tRmtJcFZUYXFDY2pBVEZMWlBxTHFLMjNHbEJHaWFjU2FRTnBCNGZZSGht?=
 =?utf-8?B?OGdHS0lmaDM1VXNXTTcxdGd3Y2psVFE4akw1Um9RUkxSaVR6L3R5by8yUFBD?=
 =?utf-8?B?MWFyazdkQkZnOHo2WGllcm9Ra3Zxa2dHNWVOVUQ5bml0bDVSUXlpZ2FGZEht?=
 =?utf-8?B?eDFHd2IrTnJmb1dsSGRkenIxcUk2L3E1elNvb0lwMDltdXI5RXlGY1NxNzlh?=
 =?utf-8?B?b0FzKzFYTjJUUG14eG9Tb0wyd1F0aEc4MWxpMUxmUjg3ZmVMMFFwNlVpTHo5?=
 =?utf-8?B?aXpJUDdWdlQvRUtoNlFqMFpwZW5NYlBCN1Y0ajg3d2VYUkRCN2N0dy9KKzB3?=
 =?utf-8?B?NEtRdG1tOEY4MkdOQTFzeW4zTnNvUDlscGFTVkxNMXVoTGI2bHMrY1FoMjBx?=
 =?utf-8?B?OG40SFBVQkp2ZURCdnN0Ym02cCt2QU9zdHlPeU5mQW8vL1VEM04wdHpXVDQ3?=
 =?utf-8?B?WHlQTDN2blREdDZlcWFYQ3dSUEt6RjFDeGtKTGxNY2JGUjZ2NXUxaWRvcDg1?=
 =?utf-8?B?cXlvemN4SXRaWXY0U2ZSckViYmRzeGRKeG90MXF1OWMxVlliTkJ0eDZ1OXpS?=
 =?utf-8?B?ektIbkhrYm1aWThVbUJwYmlmREVRSENkbGZ1YTFxbk93NVhHOFVaZm9PRitX?=
 =?utf-8?B?aFdDa0p6dHN6bVNQTktQb241RzdUZU05VWhmSDhuREJVL0VSQ3BGaklQMkpG?=
 =?utf-8?B?U0pMckZmREdsTWxCYU5XYjY1bUlnaGhGN3Z4OEhPdm1TM2JQUkt3anVOSFJK?=
 =?utf-8?B?WndyYlkvVHZlV3JlVkZPbTVJcWQrQno4YkJ4T2F2WTgvVFJiK3FZSnErWlhz?=
 =?utf-8?B?Y0RERmZuckJ1SHY4cmtRdVVHQzJVQVpMcnU1cGowNG83Z1Izbkx1UVhhMHdS?=
 =?utf-8?B?WUlQa2dZWGl2OC9YZk5EZHJMcnlGNzdHMW00emxPZktCZStIMEtoY1hpL3Nu?=
 =?utf-8?B?SHl6ZFlYMUtzMHRLTkFGRVl3ODRwRXUyVVlreVVuRksxU0Q0T2NRVldMYVNn?=
 =?utf-8?B?QkpRREZpeXQvNUhjdWxUamJJbjQ3NldPYWZwaFlFMTlUQnBPRWtTUW9vM0xF?=
 =?utf-8?B?a2pudFdmN3hBL0RSL0g3alN0YlI2R0U1OUtycTFCQnM3dFJCVXcxUytXc1Q0?=
 =?utf-8?B?L2NjaE40RnhuNUtWZFRrOWtLdGFaQmhKRkZOb29DSW9OSDIvNDJCMStLa2pL?=
 =?utf-8?B?SWNyaU1FL2FEc2Z6dHZnZnY1NlNKOEE1MnJhUVFBMGdzYXZHUk14SVdyUUdw?=
 =?utf-8?B?a2htVzg1LzJuT2tyZllDUS8wYjJjT1dUVkk3cTJycTR1dGoxa0RqSHpYbSsv?=
 =?utf-8?B?R2RNbThkWU40YVl0SnoxUE5XR2ludG9sd0pvdkYyanBueWZNaElqY1I2eVZy?=
 =?utf-8?B?cHJ1YlBrM1BuZW16V3dsYmd5QjRJdXdkV1pNVCt5MkpNOHVUaWtrby9sMEF1?=
 =?utf-8?B?V1o1THFMTGhBamlPSXRmbXFIek1pekVheVZDeXIvdDd1SU8rdVd4QTRlUmR0?=
 =?utf-8?B?eWI5SWljcHY3TXF1UFpweGRhblRBZlU2ZmhpUE40YTlzRHNreStvaG40N3hk?=
 =?utf-8?B?Q2ZvQlNFelE1aXduWTdZWnpySWJRRDVtb1RQMCtDQ2VMUnd6SUlZMWhRSkVz?=
 =?utf-8?B?clVadDF1OUx1NW4rR3Fjd1NpMkNnUklGcVBVaU1zZ0dnTVNFRi8ra0xaU2hD?=
 =?utf-8?Q?uraorS1W967+nNKtxRfJp3rhkJdpzDo1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0tlaXpVSXJZbGhyNmx3cEROM1pDWW01aTdaSERHdnZsazRlTDlzVVZDNXBC?=
 =?utf-8?B?NmdiTDgvSDZxaHIzZm5PUmx3Y0xRT2JlelVyN2FvZWl4MVdDWTY4cFVtdjBU?=
 =?utf-8?B?UDhHU2o2WFVIMFFVN1VMUGtRVmRrT25wQXhDVmt3WHJMQyttNVd6TmR3cTZp?=
 =?utf-8?B?Sm9zSzlPQlRqQVBTeVN2VnBGMDVCODVicy9sc3U4amtKdWtBWXBLdnZOTStZ?=
 =?utf-8?B?Qk9RSHJGVy81SVhGU0U3MmgrdjFjNkhIOTBxRkhHQ01UZHY4WmZZeTBNREN5?=
 =?utf-8?B?aUkzM0JicVZPMnlGWVB2Skp1QWlRY0RIQVNlb0c3ckw4T3IvR2w3S1FzeHNV?=
 =?utf-8?B?SnJic0NYVWhuZ2FweHpiTXlDdWhEWkFhU2ZGSGNJdDRzMlZSekpwN2swakNw?=
 =?utf-8?B?OHRHYVVHRnJEdWQrNTloMEl3Yi9wOVROdmFhdGxBMjNLMGRIL2puOHEwVDV5?=
 =?utf-8?B?MFpsUlNzbG5BNE82QStxTzFwY1l2Q1JkUG1oMjhPSlFIczdRbERTeXFGWGZW?=
 =?utf-8?B?M2VrbVhYOU5IYnZtMXI2cTUrakt5azMrYVM3NW0wVEJmVUdBbDh2b1NrcGg4?=
 =?utf-8?B?UXNiVTFhbzFaOEJzWnQ1Rno1SS91U1BlenBKUTlya1pXOUpiSlJaOTF0bk1S?=
 =?utf-8?B?L3NGd3ZnNFcrcE1uWHVVS1YwK1ZvVnJ5UHcrNjM0ci9zZ0dybEFCRmx0RmU1?=
 =?utf-8?B?dDNVOVBYTUJMUUJtT0ZnV3JIV1JZTXZUeVZnTTBwRjljVkgybktDcndTd25O?=
 =?utf-8?B?YkhIOU9WVy9uTzMrYlozV041M1IwTWZqd1hQNmJORjFoVVFnZ2RJTUJYamE0?=
 =?utf-8?B?SG4yT2xJWGpEUEh2V1VSV09tTEpzNzhPajBYN1ZLajFIVnRhVTBvRzkrSW1y?=
 =?utf-8?B?VTU2Q0ZrWXBZT0VvRWdsSjllZVczUnFJaC96a1B1cnhOeGtRVHZVTFhRTjkr?=
 =?utf-8?B?Vno1bHlIRURZTVFRTTgwejgySlNjQ3U5dE5XOUg3U1F0bVZKSWc2c2ZKaE04?=
 =?utf-8?B?N0RrT2U0Q1R2R1JmcGdOWFFZV3V4bEUzaXRNRTJJK0dNcVlJaWdTb0dxSUR5?=
 =?utf-8?B?UkcrNjRwaDJjR09BQWtnbGROaVFxM2wvTWpTOFhuLzVWVmFuSDhlakJlWlh6?=
 =?utf-8?B?ZTNIa3AraEc0RWZldmIvRzVOMit3dEFBMVdSd2dxOG9lWjBYS0tzbk1hQTFO?=
 =?utf-8?B?YjJtNnFRUEFJQ0t1QTZuVExlZTQwTCtNR0FrdzdLUDZMd0hyQktHOU1Id1dM?=
 =?utf-8?B?cjk5VWZ3UHNBYzFxdEtQdDRGdmQrbGpYbHhOZGNDalB0V0dNS1dLS3Z5aC83?=
 =?utf-8?B?MC9hTTdIMExvaWpsUmNocWJJd1Uzb3NxcER4ejJYaUlzT3FtaDZ6YWR6T1E1?=
 =?utf-8?B?L1ArcDAzTElKZEVGLzc0QjE0SDBGZE1HZGxlTW1zVEl5MjZiUFdPUGlwRG9x?=
 =?utf-8?B?ZDVucGNVVVBOcnRXSkZvWExJMm04VGhKR0VZL2g5MW9vSURKalBEZ2lxVHEx?=
 =?utf-8?B?cW1UOVN1UDA0NVd5MW1IQ0YvNG1pK2x3eU1kWHhtNzFoQklqMFg4NVJkWGgz?=
 =?utf-8?B?aUw4TjRLT0M5ZkNWZzE4eTdRbURQcjVuejVGNUdlSGJ5L1JmSjF0UTVJMlY1?=
 =?utf-8?B?b3k5OTRZa0VIZ2xrcFlmOXdvQkFRLzNMMHMyMXZqeFNPWk9kVEpzWGkvV1g1?=
 =?utf-8?B?NTFDWGNZYlpJdVpMbi9nWkN3Z2IvMEVhNjlRK1ZmMktrZHk3eXQ3dUF0UFVp?=
 =?utf-8?B?UFljV3E1cytLekVSZEFOWE51eEc4VFBiQ3JiTWZWQTUyMi91dVlQc2RoRXhG?=
 =?utf-8?B?endvS1R2TU9zcGROaEtiL09PejBHTGVmWnRndWEzTTUrQzUyd1kzeDg3NldZ?=
 =?utf-8?B?Q1NsOE1WcHUwZlJZb1pXR294MG1kYmd3SFM0d01TVUhzUlVrYldpbDZ4M2pu?=
 =?utf-8?B?b2RHSDU1dUJwM3Fkd0VTRmllUEQ5ZVRYWlVOcWhCbXFldmlUblVZOVdLOVR3?=
 =?utf-8?B?ZVJZeTlVekJkbGZGaEZOelJ5YjE3aTNLSVVyQU5KL2puaEZmTG8yRWg1cTda?=
 =?utf-8?B?VGdyODAzejZiODZKaUFzT2R6K1hRVnlYZ2FCY0xSVS83dVBFa0F3UnpEc1cr?=
 =?utf-8?B?YnhPZmhoMlFFM0o5TjVyb2taS3FhdHhOYjZaRUEvOG51VlpqSzNPRVM4ZGE3?=
 =?utf-8?B?Znc9PQ==?=
Content-ID: <9E6AF4080D27AB4D918E0E4380509151@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f687ae8-4cff-4ff6-c8d9-08dd5c008d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 16:12:39.4147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2F/jClZ8CsElujZtKhbX140nnr0IAdF16i5UOyQDfGRE+3clsGiS5gP8qNNK7WJwWCjFnMzTjOBhp76igFfml4NHJbfBbrmLr6DhEohMvlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7282
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1032750557.1852308053"
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

--__=_Part_Boundary_006_1032750557.1852308053
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDEwOjQxICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTgvMDIvMjUgMDY6NDEsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFRvIHN1cHBvcnQgaGFyZHdhcmUgd2l0aG91dCBzdWJz
eXMgSURzIG9uIG5ldyBTb0NzLCBhZGQgYQ0KPiA+IHByb2dyYW1taW5nDQo+ID4gZmxvdyB0aGF0
IGNoZWNrcyB3aGV0aGVyIHRoZSBzdWJzeXMgSUQgaXMgdmFsaWQuIElmIHRoZSBzdWJzeXMgSUQN
Cj4gPiBpcw0KPiA+IGludmFsaWQsIHRoZSBmbG93IHdpbGwgY2FsbCAyIGFsdGVybmF0aXZlIENN
RFEgQVBJczoNCj4gPiBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rfd3JpdGVfc192YWx1
ZSgpIHRvIGFjaGlldmUgdGhlIHNhbWUNCj4gPiBmdW5jdGlvbmFsaXR5Lg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyB8IDE0ICsrKysr
KysrKysrLS0tDQo+ID4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMgfCAxMSAr
KysrKysrKystLQ0KPiA+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmMNCj4gPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ID4g
aW5kZXggYmI0NjM5Y2EwYjhjLi5jZTk0OWI4NjNiMDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuYw0KPiA+IEBAIC0xNjcsOSArMTY3LDE3IEBAIHN0YXRpYyB2b2lkIG10a19t
bXN5c191cGRhdGVfYml0cyhzdHJ1Y3QNCj4gPiBtdGtfbW1zeXMgKm1tc3lzLCB1MzIgb2Zmc2V0
LCB1MzIgbWFzaywNCj4gPiDCoMKgwqDCoMKgIHUzMiB0bXA7DQo+ID4gDQo+ID4gwqDCoMKgwqDC
oCBpZiAobW1zeXMtPmNtZHFfYmFzZS5zaXplICYmIGNtZHFfcGt0KSB7DQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSBjbWRxX3BrdF93cml0ZV9tYXNrKGNtZHFfcGt0LCBtbXN5
cy0NCj4gPiA+Y21kcV9iYXNlLnN1YnN5cywNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtbXN5
cy0+Y21kcV9iYXNlLm9mZnNldCArDQo+ID4gb2Zmc2V0LCB2YWwsDQo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWFzayk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXQgKz0g
bW1zeXMtPmNtZHFfYmFzZS5vZmZzZXQ7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAobW1zeXMtPmNtZHFfYmFzZS5zdWJzeXMgIT0gQ01EUV9TVUJTWVNfSU5WQUxJRCkgew0KPiAN
Cj4gWW91J3JlIHN0aWxsIGFueXdheSBwYXNzaW5nIHRoZSBzdWJzeXMgdG8gY21kcV9wa3Rfd3Jp
dGVfbWFzaygpLA0KPiByaWdodD8hDQo+IFdoeSBkb24ndCB5b3UganVzdCBoYW5kbGUgdGhpcyBp
biBjbWRxX3BrdF93cml0ZV9tYXNrKCkgdGhlbj8gOy0pDQo+IA0KPiBJIGNhbiBzZWUgdGhpcyBw
YXR0ZXJuIGJlaW5nIHJlcGVhdGVkIG92ZXIgYW5kIG92ZXIgaW4gYm90aA0KPiBkcm0vbWVkaWF0
ZWsgYW5kIE1EUDMNCj4gZHJpdmVycywgYW5kIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byBkdXBsaWNh
dGUgdGhpcyBtYW55IHRpbWVzIHdoZW4geW91DQo+IGNhbiB3cml0ZSBpdA0KPiBqdXN0IG9uY2Uu
DQo+IA0KPiBXb3VsZCd2ZSBhbHNvIGJlZW4gZmFzdGVyIGZvciB5b3UgdG8gaW1wbGVtZW50Li4u
IDotRA0KPiANCg0KSSB0aGluayBkaWQgaXQgaW4gdGhlIHNlcmllcyBWMToNCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTEyMTA0
MjYwMi4zMjczMC01LWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQoNCkJlY2F1c2UgaXQnbGwg
bmVlZCB0byBwYXNzaW5nIHRoZSBiYXNlX3BhIGFuZCB0aGF0IHdpbGwgbmVlZCB0byBjaGFuZ2UN
CnRoZSBpbnRlcmZhY2UgZm9yIG9yaWdpbmFsIEFQSXMuDQoNCkFuZCBDSyB0aGluayB0aGF0J3Mg
bm90IGEgbmVjZXNzYXJ5IHRvIGNoYW5nZSB0aGUgQVBJcy4gSXQgY2FuIGJlIGRvbmUNCmJ5IGNt
ZHFfcGt0X2Fzc2lnbigpICsgY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKCkgaW4gdGhlIGNs
aWVudA0KZHJpdmVycy4gVGhlbiB5b3UgY2FuIHNlZSB0aGlzIHBhdHRlcm4gaW4gZXZlcnl3aGVy
ZS4gOi0pDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0K

--__=_Part_Boundary_006_1032750557.1852308053
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDMtMDQmIzMyO2F0
JiMzMjsxMDo0MSYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzE4LzAyLzI1JiMzMjsw
Njo0MSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7VG8mIzMyO3N1cHBvcnQmIzMyO2hhcmR3YXJlJiMzMjt3aXRob3V0JiMzMjtzdWJz
eXMmIzMyO0lEcyYjMzI7b24mIzMyO25ldyYjMzI7U29DcywmIzMyO2FkZCYjMzI7YQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7cHJvZ3JhbW1pbmcNCiZndDsmIzMyOyZndDsmIzMyO2Zsb3cmIzMyO3RoYXQm
IzMyO2NoZWNrcyYjMzI7d2hldGhlciYjMzI7dGhlJiMzMjtzdWJzeXMmIzMyO0lEJiMzMjtpcyYj
MzI7dmFsaWQuJiMzMjtJZiYjMzI7dGhlJiMzMjtzdWJzeXMmIzMyO0lEDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtpcw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW52YWxpZCwmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7
d2lsbCYjMzI7Y2FsbCYjMzI7MiYjMzI7YWx0ZXJuYXRpdmUmIzMyO0NNRFEmIzMyO0FQSXM6DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtjbWRxX3BrdF9hc3NpZ24oKSYjMzI7YW5kJiMzMjtjbWRxX3BrdF93
cml0ZV9zX3ZhbHVlKCkmIzMyO3RvJiMzMjthY2hpZXZlJiMzMjt0aGUmIzMyO3NhbWUNCiZndDsm
IzMyOyZndDsmIzMyO2Z1bmN0aW9uYWxpdHkuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsmbHQ7amFz
b24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjtkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyYj
MzI7fCYjMzI7MTQmIzMyOysrKysrKysrKysrLS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsm
IzMyO2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tdXRleC5jJiMzMjt8JiMzMjsxMSYjMzI7Kysr
KysrKysrLS0NCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMzI7MiYjMzI7ZmlsZXMmIzMyO2No
YW5nZWQsJiMzMjsyMCYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzUmIzMyO2RlbGV0aW9ucygtKQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7
YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgm
IzMyO2JiNDYzOWNhMGI4Yy4uY2U5NDliODYzYjA1JiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsm
IzMyOy0tLSYjMzI7YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KJmd0OyYjMzI7
Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTE2Nyw5JiMzMjsrMTY3LDE3JiMzMjtAQCYjMzI7c3RhdGlj
JiMzMjt2b2lkJiMzMjttdGtfbW1zeXNfdXBkYXRlX2JpdHMoc3RydWN0DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjttdGtfbW1zeXMmIzMyOyptbXN5cywmIzMyO3UzMiYjMzI7b2Zmc2V0LCYjMzI7dTMyJiMz
MjttYXNrLA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMzMjt1MzImIzMyO3RtcDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtpZiYjMzI7KG1tc3lzLSZndDtjbWRx
X2Jhc2Uuc2l6ZSYjMzI7JmFtcDsmYW1wOyYjMzI7Y21kcV9wa3QpJiMzMjt7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjstJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtyZXQmIzMyOz0mIzMyO2NtZHFfcGt0X3dyaXRl
X21hc2soY21kcV9wa3QsJiMzMjttbXN5cy0NCiZndDsmIzMyOyZndDsmIzMyOyZndDtjbWRxX2Jh
c2Uuc3Vic3lzLA0KJmd0OyYjMzI7Jmd0OyYjMzI7LSYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7bW1zeXMtJmd0O2NtZHFfYmFzZS5v
ZmZzZXQmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyO29mZnNldCwmIzMyO3ZhbCwNCiZndDsmIzMy
OyZndDsmIzMyOy0mIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzMyO21hc2spOw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMzI7b2Zmc2V0JiMzMjsrPSYjMzI7bW1zeXMtJmd0O2NtZHFfYmFzZS5vZmZzZXQ7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtpZiYjMzI7KG1tc3lzLSZndDtjbWRx
X2Jhc2Uuc3Vic3lzJiMzMjshPSYjMzI7Q01EUV9TVUJTWVNfSU5WQUxJRCkmIzMyO3sNCiZndDsm
IzMyOw0KJmd0OyYjMzI7WW91JiMzOTtyZSYjMzI7c3RpbGwmIzMyO2FueXdheSYjMzI7cGFzc2lu
ZyYjMzI7dGhlJiMzMjtzdWJzeXMmIzMyO3RvJiMzMjtjbWRxX3BrdF93cml0ZV9tYXNrKCksDQom
Z3Q7JiMzMjtyaWdodCYjNjM7IQ0KJmd0OyYjMzI7V2h5JiMzMjtkb24mIzM5O3QmIzMyO3lvdSYj
MzI7anVzdCYjMzI7aGFuZGxlJiMzMjt0aGlzJiMzMjtpbiYjMzI7Y21kcV9wa3Rfd3JpdGVfbWFz
aygpJiMzMjt0aGVuJiM2MzsmIzMyOzstKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjtjYW4m
IzMyO3NlZSYjMzI7dGhpcyYjMzI7cGF0dGVybiYjMzI7YmVpbmcmIzMyO3JlcGVhdGVkJiMzMjtv
dmVyJiMzMjthbmQmIzMyO292ZXImIzMyO2luJiMzMjtib3RoDQomZ3Q7JiMzMjtkcm0vbWVkaWF0
ZWsmIzMyO2FuZCYjMzI7TURQMw0KJmd0OyYjMzI7ZHJpdmVycywmIzMyO2FuZCYjMzI7aXQmIzM5
O3MmIzMyO25vdCYjMzI7bmVjZXNzYXJ5JiMzMjt0byYjMzI7ZHVwbGljYXRlJiMzMjt0aGlzJiMz
MjttYW55JiMzMjt0aW1lcyYjMzI7d2hlbiYjMzI7eW91DQomZ3Q7JiMzMjtjYW4mIzMyO3dyaXRl
JiMzMjtpdA0KJmd0OyYjMzI7anVzdCYjMzI7b25jZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7V291
bGQmIzM5O3ZlJiMzMjthbHNvJiMzMjtiZWVuJiMzMjtmYXN0ZXImIzMyO2ZvciYjMzI7eW91JiMz
Mjt0byYjMzI7aW1wbGVtZW50Li4uJiMzMjs6LUQNCiZndDsmIzMyOw0KDQpJJiMzMjt0aGluayYj
MzI7ZGlkJiMzMjtpdCYjMzI7aW4mIzMyO3RoZSYjMzI7c2VyaWVzJiMzMjtWMToNCmh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTEy
MTA0MjYwMi4zMjczMC01LWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQoNCkJlY2F1c2UmIzMy
O2l0JiMzOTtsbCYjMzI7bmVlZCYjMzI7dG8mIzMyO3Bhc3NpbmcmIzMyO3RoZSYjMzI7YmFzZV9w
YSYjMzI7YW5kJiMzMjt0aGF0JiMzMjt3aWxsJiMzMjtuZWVkJiMzMjt0byYjMzI7Y2hhbmdlDQp0
aGUmIzMyO2ludGVyZmFjZSYjMzI7Zm9yJiMzMjtvcmlnaW5hbCYjMzI7QVBJcy4NCg0KQW5kJiMz
MjtDSyYjMzI7dGhpbmsmIzMyO3RoYXQmIzM5O3MmIzMyO25vdCYjMzI7YSYjMzI7bmVjZXNzYXJ5
JiMzMjt0byYjMzI7Y2hhbmdlJiMzMjt0aGUmIzMyO0FQSXMuJiMzMjtJdCYjMzI7Y2FuJiMzMjti
ZSYjMzI7ZG9uZQ0KYnkmIzMyO2NtZHFfcGt0X2Fzc2lnbigpJiMzMjsrJiMzMjtjbWRxX3BrdF93
cml0ZV9zX21hc2tfdmFsdWUoKSYjMzI7aW4mIzMyO3RoZSYjMzI7Y2xpZW50DQpkcml2ZXJzLiYj
MzI7VGhlbiYjMzI7eW91JiMzMjtjYW4mIzMyO3NlZSYjMzI7dGhpcyYjMzI7cGF0dGVybiYjMzI7
aW4mIzMyO2V2ZXJ5d2hlcmUuJiMzMjs6LSkNCg0KUmVnYXJkcywNCkphc29uLUpIJiMzMjtMaW4N
Cg0KJmd0OyYjMzI7Q2hlZXJzLA0KJmd0OyYjMzI7QW5nZWxvDQoNCjwvcHJlPg0KPC9wPjwvYm9k
eT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElB
VEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSAN
CmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdl
ZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUg
bGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25h
dGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24s
IHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBh
bmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRz
KSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0
aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0t
Pg==

--__=_Part_Boundary_006_1032750557.1852308053--

