Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B599C58B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E3E10E3F8;
	Mon, 14 Oct 2024 09:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="NQLFbF9p";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LxDS0K0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2A10E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:25:57 +0000 (UTC)
X-UUID: 4e0639a28a0e11ef8b96093e013ec31c-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gn1FT0reNTmJ+zugATVJcWXSsCfLOhqVHxr8KqCn+TQ=; 
 b=NQLFbF9pzTp3rXGkOTTqeXu1oSGb8F61SIKQDRgaknRkgyZGl5s+PoP7Icj7F4muO8Hk7S6gGgqTOAJtSL4auOZKjLxUd78bCnNKu/UauDXnfTh4j/EddyXxytaLqPxtkQ+1bRsb1zSQ70REUJlN324G+UOg8KaIU8o4lO35UEs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:bd6b6f90-8a75-489b-a2f4-6ad6ec58f6a2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:815ec006-3d5c-41f6-8d90-a8be388b5b5b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4e0639a28a0e11ef8b96093e013ec31c-20241014
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1242413381; Mon, 14 Oct 2024 17:25:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 02:25:50 -0700
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 17:25:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PETsJghtKY00aMJyF5MSzP8Nk9QWJj4LnKcUfznTIIeWBgk96KlmgPlgRxyEDMgGS/LCOKHVHZX0r3uVFapjn81NkBqNCYs/HHlGEn68ctg4vgmNw47WDc6dnRpfTTfjBQdvffQ7xP9iOvvzqIIxRoE0BPtSggdSeokdD+sHGhsGsfsO3xOP+CENlVbB/hkOdsWZucqERHx90556ixUbXGKXe1YMHdFRjQt2JCUWGocRTFQGxbSdOlypnzcmzzAzGeYUFKWkQ/3zdVW2ut2k0oJxd5AUA8kxUgPpag2OehAPEA22x8DBoXU4RgvqduLeYLApouPkcKaOkyXSGou5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrcAGVXZpqI4mJeADYSH4eEkh3mixj1MudnhP7IXhUU=;
 b=hCF0ntgrRwVWgvekYAP1akWWIV8nF8lLw4+2xoAc6DVf98V0Raz8em7j4ek5ramvAtrdxh44dORrsyHk36z0YtGA0ELZtUt/HBuBTYk5dE4VngmPLjzKiPmdVaMx9eNEEbavAPbqwkrQhogK5pFqVvZx+9AWSR4YypoaXnjxgCPoysjOC7ZjRuEz0rtEFfEqTn5y4z3eOjBOGmSeV+NNii2eACKbA+VeuDsofl8j65czrVQ/2eNmestyyrPCbN39DlJMJAuLjePXzD75VREAXeMo/u6hMIhHAKDnkz0mF1Yniqi2mHcZpLS+93pITzlidf3C9FI4lCA0Z/3epKtYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrcAGVXZpqI4mJeADYSH4eEkh3mixj1MudnhP7IXhUU=;
 b=LxDS0K0p5ud+7z/mQ3SILz2f9bsUHckkbeiJ5VaV9RLml7onFWDLsWrg51JuZRlxq3l8F/3Evj5p49CWVQXA0z/i9MolmXiWzCspNCM73ClWgwyAb48kvJ3g6UdYVq5bY94tP04LsFVDgHMwc5gUfr/YTcbTB+4XtiK3sKvpTqM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7908.apcprd03.prod.outlook.com (2603:1096:990:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:25:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:25:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLKGAZ2A
Date: Mon, 14 Oct 2024 09:25:47 +0000
Message-ID: <42224ac92b95b3fec2c7df429d3f1016b67b38a3.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7908:EE_
x-ms-office365-filtering-correlation-id: a73d1e4c-39db-4296-8c6a-08dcec322f8e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V20rY09uQVRlM3MrbEQ0d0s0MncxK3FFeW92eHM5NUVuODR1OFY0bVVwMzB0?=
 =?utf-8?B?aVIzblpWUDN5ZmZMVU1TY0ZYcUNRQ2c1YWMzeDJvR2VWQkk4NmVhcjZGOUhv?=
 =?utf-8?B?Vmp6UXFkY1NnQnZ1ejBUdzFLeEllUzFDQ0lNSXZMWkxzNXE4bFdXRWsvL3pJ?=
 =?utf-8?B?dmpLZ05SR1VlK0lDZlZHY3NBd3BNNXdnQ1RrMnQ3cnBycndhMlhXSEFHWmh2?=
 =?utf-8?B?eXBYL0ZLaFJWSkI0SFZvMnRJbTY4SFNVbXlOdUs3eHZrdGZhSUg1ZVdaenFK?=
 =?utf-8?B?OE5NdFAybVdSYzdueldVNksyTGIwdTY0T1B6NkF6VWpBMlVudUNFdFRGMmxq?=
 =?utf-8?B?WlpGSG9aWjQ1VVBNaFMrV3lRUFBzL2hDd2FkKzBUbmNtV2ErdHFBTmlQWE5F?=
 =?utf-8?B?OWF2MzJJenQ2RVUycW1CMTV2VU9uSk9aMFAxbnEyb2ZEU2krT3l1dCthY05K?=
 =?utf-8?B?ZU50Mkp2OHBWN3pxY2tJM0FkVWhyaExnUEFGYzJCbzBTSlk5bUQ3a1ZjdnBj?=
 =?utf-8?B?MGM5WG9Db0JuQmlCSE54UjlUbzliSXZSeHBsNm1KU3VRQnFRYWM2OTR0d1Zj?=
 =?utf-8?B?ZVhxM21jOXIzaEJwOWljUzFCS0tSYlZKSTFTQktVU0V3NHNtU1hqT3cxNk5Q?=
 =?utf-8?B?WUd0TVJleE1NZGx5am1DVXUwbFNhaEVqOXV6a2FYVFNCcjJYMkcyQlFSWktD?=
 =?utf-8?B?alhHZnpDdTl4NUtNVTk4UkZvUFR2dUFsZnE3TjBNL2hIVkYxVytDMWd6YnZ3?=
 =?utf-8?B?b2lTWUE4VHJySFhrZkxieTN3cFlwbGFtL1YrRGhGZ2c4TTlnbFZlclBURms5?=
 =?utf-8?B?d1ExcmdzakFjVjhMbVhudzJsSisyQ1ZGMitXU2FRTjZ4enBBY2NBTWFNTHJo?=
 =?utf-8?B?RTNkTkdpdHNkYUdSdklRK1I0VDF1M0x5TzNEaGVTOU9RVnp4WUt6ekJzTGhT?=
 =?utf-8?B?UXJQOWdJUnpWQ1IzNFVLR1lONXhOa2JpbzlSMXhqV3dPRVpKbHQ2MHpLemdV?=
 =?utf-8?B?Y2FrT3BuSVAvWmtiWWpyUW1BSURGekJFVDRhc3pFY2FqMGZyL2pia1doUWh4?=
 =?utf-8?B?V0VaT3hIV1Q1TGE1K012MFdickdYTzJNRnhiUlFpMjlvRjlnVVBFbnY5dHNz?=
 =?utf-8?B?SG1XTjhNdTJ5ZXJLSkw0SXo4M3ByVGM4bldFTWtVeWlzU2p6a0dMRUdKN0xS?=
 =?utf-8?B?YTRmbFZUbzA3RnlKVkdmcHpjek1OWjFzaTNiMEhLTlozUnVEUkU0Sm9WbFd2?=
 =?utf-8?B?cmtRK3FyZGp5RU42dmJ3b2tPaXU4K2FHOVlFemRlajBYTUw3cmJEanBtbi9s?=
 =?utf-8?B?alJQOVlXYXlydlh2SjkzVklrZzVqdnlGaVNJV3Y5UURaVW5OZW9zWHF3Nk5i?=
 =?utf-8?B?KzdXTjh3ZGtNRnM0dUE4R1puK0Y2K0FsN3VNN2t5ZzQwQ0JiajlSS29yNVVU?=
 =?utf-8?B?cWZidWhDMVhhV3NrbjgrSGI5REJsbDZaMmg0MGkwL0hVWnJlOUZ3RXZCVVBI?=
 =?utf-8?B?SWZOalhzVXRJT1VWT3lCeWZ3MmlOTkg1cVdlcWp1dTk1UnhNcFNpYWFVRjFh?=
 =?utf-8?B?NCtZYzBrYmVtUmlQVUQvNksyS1JTTTEyOWRzMzlvWS9jai9GeDVEYmh6dVdl?=
 =?utf-8?B?dy9EN1B6Q0UzTTFkQVdNRFUvcnJoY3I0c2NyaTRoWG1ld00ybkdIeXljRDBu?=
 =?utf-8?B?UmlpNFpxaHhBbzdQMFlSRW81Sk9QVGdDTHNwYk5qR3VIZ1l5VTNQQ1RLWFRu?=
 =?utf-8?B?bmYxRHBnM0V6bXZvSkxZZDRnR2xYODNJMUJSV3EvdmdJWitKZXY5cXZRWUFK?=
 =?utf-8?B?b3JzdXNTN3RiZmlHSnorUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUJTanZNaEdRelF0YVNUOW9KaU9idTY2cmZCbnZwTDlRbUY3QnMrK1Nxd0lR?=
 =?utf-8?B?bzVzcW1hMDRtRlRQYStXK3I4OHZsWkV0RGpRRUFRWmpFVHRuWEJIMWo5ZWpZ?=
 =?utf-8?B?bzVoRTk1akEvVkZyQVphTXBKZmRabnFMTERmTTA5aytSN0dxdzkrK0ZBM3By?=
 =?utf-8?B?TzhCTUthMlY3emtRTDByL0QzNVg3am4rV2l5QlJnZ1JJUC9hekZvY1VxbXV0?=
 =?utf-8?B?Y3Y2RFk1Z21ZTUFzQU0yRnByZnBBQ1RsWGNzMklyQk5xVWZhMkxaRzlNUWNC?=
 =?utf-8?B?MUVsQWlIN0M1Q1VERG5reEhhdUlOKzJEVm52YlpmRTk3Z0JQTnFNNlF1VFFZ?=
 =?utf-8?B?ZHZvdjNDbEd0ZWtEZittVUlVeDVGdC9CSzNCTnorREY5RUFEbHVBYU1weHNy?=
 =?utf-8?B?Q2JJLzN0N0R4TkRGM3FQSTJ6V1BiR0xrN3NFYmkySTdwVGVaeGV6MzBsc0Uw?=
 =?utf-8?B?SWZGK3dyeWVUdUNxREcxRHRFLzZWcVFtVHVwd2h5Wk9pS1VZWU5JUms0NVJy?=
 =?utf-8?B?SnVwNXdCbG0zc0t4Q3BFMDM2RURrckJDeXY3bm9aT3dCdjlQM1JXSDdNN1h3?=
 =?utf-8?B?dkY0SUxPc1VKR1hzQ1lXQXNKTk5qSWV2b21PbGVRWjJtbG01TnNDQmdrS2dQ?=
 =?utf-8?B?TXoxUHJGTEVTNm5KbVlwZGIrZEE0R05FSC9oMVRLMVJQdHgvdXdxbFJJWFM5?=
 =?utf-8?B?TUFrdWRRYXJ3L2xNTTQ2K1QrU1orYW1Zd0JacHNrV2YyVzRHQlRJNGdMRzEv?=
 =?utf-8?B?elhadmxtZGZNdVdrSVRvWXJiN016bXJHWTEyUlhod0ZhRE5XLzVEanErU2RU?=
 =?utf-8?B?Z1Ftd2hyOFpqWFJIbHlOQnpSblRrbW1oWmJJcDZKMnIvUFVSbFBlTEFnbHJu?=
 =?utf-8?B?V3RZK0o4ZDJIM2pINkYyTXI3MlZPYktQQnFzTGcxNmdGcEZJNm1Gc042VVhs?=
 =?utf-8?B?cGxJTHdHQUxZOFJtbG0rYTFZZnJXak4vc2dGVHpvVkEvWCs4cUpJTCtPUEpk?=
 =?utf-8?B?M1pMeVBSR2d2WndMN2VoLzBQTVlvS0lmWWhYbFJBZ240ajFPbjhxSGdoRnpr?=
 =?utf-8?B?dnNYTk80QnZXUTZHbjJrSGZXSC9WR01qTUZtSndFQncyZWYwVVFmcjVjRWsw?=
 =?utf-8?B?VS9JZWhBdE44YmwrWWpydFdCN0FiaUxwUk5FNnhKUnhGM3B2V3dWZmhIaE5T?=
 =?utf-8?B?QmxkbU5INGdmbUJyOUlnTElKVjRlSWIzK1I3aXBzOThGZmFLTVNiQkRmR1J3?=
 =?utf-8?B?RnZBTHRjY2pzSjduNk1IT25yYk40VUZ5VjBLRmRYL0tPSTJscUdqdXdueHJO?=
 =?utf-8?B?T1owNTFTNkJuVFc4R0I1Q3NoZ1VWSnYwTkwrZEdRMHRRaTU5dmt6WkkxMlBn?=
 =?utf-8?B?RFVoUUY2akNyd1hBWXRkVGhsdmp4MzBhOGNFcEhOUEJ3Q3BoR1RtZkJ4OGVi?=
 =?utf-8?B?T2dXZjd0MWV2cFJqaGt1QWk5U0NDdFA3NG5jUFBKdnZ1YWNzZnIwOUJXa2w3?=
 =?utf-8?B?NDNLNzdrMkhoWUlJVTJka0NuSnU3WDRYZVlMdHJ2WXhhUDFOM1hFM01vcWVt?=
 =?utf-8?B?NExGUk91eUZSTlZSMEJzVXpTRHRUVTFFK0tMMEhTMzdFMWRjdmxvdy9td0g2?=
 =?utf-8?B?bTdONEROdDNZT2JGOVVhc0ZveU4wSmJxMG90amdNVWs1azdVRUJqbi9UZDlR?=
 =?utf-8?B?blByUUlCWTNMYllIbWFHSzd0cFN3RkhFeXpjYzNLTm1vejdDK29rTXVnQ1hM?=
 =?utf-8?B?amlPOHpNeWJpWkFkM2Q2WDc0VmlPb1R4T3lkMzl0M3o2RG5ZOVE2MmliWEdI?=
 =?utf-8?B?Nkh4SkpCSjE4SVN6OXNLNStENHNyOVpuczVuZTNtRzR5dEx2RExXaUF4Nmlv?=
 =?utf-8?B?MFhvWFdFd0RhbVdwdjZNNUhMc21USmtpRGZBdW1oMHI3M0tsR0ZxQWRLU1Nu?=
 =?utf-8?B?a2p4TG9uWjBESlVzS0NIV3V1cHE3NC9wRWh0dVc1aG55ZUdPMkQvU0ZBaGFy?=
 =?utf-8?B?YXFsaUNFN0dnbVRRdlVEaEdhTHAvMkJ6KzY1Y0RmdlFCcDN2WU9aR2w1ZG1Q?=
 =?utf-8?B?dVdUaXA4TmE4YmxMMUNYRk40cVNzNVNRQ245RTFndWJzT2J3ZTFkRFhZZkJY?=
 =?utf-8?Q?vaZwTH6Np1Jp1nHaSddYyfzYl?=
Content-ID: <A6022AAFAB36CD4B8233E20C9A55AC29@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73d1e4c-39db-4296-8c6a-08dcec322f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 09:25:47.0130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2daBHXKYN2QVFqnhb7cD+VzRxd3sePpfHGBRT5zkCt6hNYgi3MkLVbqJ1KIt9deRYlE7nxtcCHcAZk/lQ9GRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7908
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_114319559.1431844410"
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

--__=_Part_Boundary_009_114319559.1431844410
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0YXRpYyBpbnQgc2V0X3Rlc3RfbW9kZWwoc3RydWN0IHNlbmlu
Zl9jdHggKmN0eCwgY2hhciBlbmFibGUpDQo+ICt7DQoNCldpdGhvdXQgdGVzdCBjb2RlLCB0aGlz
IGRyaXZlciBzdGlsbCB3b3JrLCBzbyB0ZXN0IGNvZGUgaXMgYWR2YW5jZWQgZnVuY3Rpb24uDQpT
ZXBhcmF0ZSB0ZXN0IGNvZGUgdG8gYSB0ZXN0IHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAr
CXN0cnVjdCBzZW5pbmZfdmMgKnZjW10gPSB7IE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwg
fTsNCj4gKwlpbnQgaSA9IDAsIHJldCA9IDAsIHZjX3VzZWQgPSAwOw0KPiArCXN0cnVjdCBzZW5p
bmZfbXV4ICptdXg7DQo+ICsJaW50IHByZWZfaWR4W10gPSB7IDAsIDEsIDIsIDMsIDQgfTsNCj4g
Kw0KPiArCWlmIChjdHgtPmlzX3Rlc3RfbW9kZWwgPT0gMSkgew0KPiArCQl2Y1t2Y191c2VkKytd
ID0gbXRrX2NhbV9zZW5pbmZfZ2V0X3ZjX2J5X3BhZChjdHgsIFBBRF9TUkNfUkFXMCk7DQo+ICsJ
fSBlbHNlIGlmIChjdHgtPmlzX3Rlc3RfbW9kZWwgPT0gMikgew0KPiArCQl2Y1t2Y191c2VkKytd
ID0gbXRrX2NhbV9zZW5pbmZfZ2V0X3ZjX2J5X3BhZChjdHgsIFBBRF9TUkNfUkFXMCk7DQo+ICsJ
CXZjW3ZjX3VzZWQrK10gPSBtdGtfY2FtX3NlbmluZl9nZXRfdmNfYnlfcGFkKGN0eCwgUEFEX1NS
Q19SQVcxKTsNCj4gKwkJdmNbdmNfdXNlZCsrXSA9IG10a19jYW1fc2VuaW5mX2dldF92Y19ieV9w
YWQoY3R4LCBQQURfU1JDX1JBVzIpOw0KPiArCX0gZWxzZSBpZiAoY3R4LT5pc190ZXN0X21vZGVs
ID09IDMpIHsNCj4gKwkJdmNbdmNfdXNlZCsrXSA9IG10a19jYW1fc2VuaW5mX2dldF92Y19ieV9w
YWQoY3R4LCBQQURfU1JDX1JBVzApOw0KPiArCQl2Y1t2Y191c2VkKytdID0gbXRrX2NhbV9zZW5p
bmZfZ2V0X3ZjX2J5X3BhZChjdHgsIFBBRF9TUkNfUERBRjApOw0KPiArCX0gZWxzZSB7DQo+ICsJ
CWRldl9pbmZvKGN0eC0+ZGV2LCAidGVzdG1vZGVsJWQgaW52YWxpZFxuIiwgY3R4LT5pc190ZXN0
X21vZGVsKTsNCj4gKwkJcmV0dXJuIC0xOw0KPiArCX0NCj4gKw0KPiArCWZvciAoOyBpIDwgdmNf
dXNlZDsgKytpKSB7DQo+ICsJCWlmICghdmNbaV0pIHsNCj4gKwkJCWRldl9pbmZvKGN0eC0+ZGV2
LCAidmMgbm90IGZvdW5kXG4iKTsNCj4gKwkJCXJldHVybiAtMTsNCj4gKwkJfQ0KPiArCX0NCj4g
Kw0KPiArCWlmIChlbmFibGUpIHsNCj4gKwkJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dl
dChjdHgtPmRldik7DQo+ICsJCWlmIChyZXQgPCAwKSB7DQo+ICsJCQlkZXZfaW5mbyhjdHgtPmRl
diwgImZhaWxlZCBhdCBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0XG4iKTsNCj4gKwkJCXJldHVy
biByZXQ7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoY3R4LT5jb3JlLT5jbGtbQ0xLX1RPUF9DQU1U
TV0pDQo+ICsJCQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoY3R4LT5jb3JlLT5jbGtbQ0xLX1RP
UF9DQU1UTV0pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlm
b3IgKGkgPSAwOyBpIDwgdmNfdXNlZDsgKytpKSB7DQo+ICsJCQltdXggPSBtdGtfY2FtX3Nlbmlu
Zl9tdXhfZ2V0X3ByZWYoY3R4LA0KPiArCQkJCQkJCSAgcHJlZl9pZHgsDQo+ICsJCQkJCQkJICBB
UlJBWV9TSVpFKHByZWZfaWR4KSk7DQo+ICsJCQlpZiAoIW11eCkNCj4gKwkJCQlyZXR1cm4gLUVC
VVNZOw0KPiArCQkJdmNbaV0tPm11eCA9IG11eC0+aWR4Ow0KPiArCQkJdmNbaV0tPmNhbSA9IGN0
eC0+cGFkMmNhbVt2Y1tpXS0+b3V0X3BhZF07DQo+ICsJCQl2Y1tpXS0+ZW5hYmxlID0gMTsNCj4g
Kw0KPiArCQkJZGV2X2luZm8oY3R4LT5kZXYsDQo+ICsJCQkJICJ0ZXN0IG1vZGUgbXV4ICVkLCBj
YW0gJWQsIHBpeGVsIG1vZGUgJWRcbiIsDQo+ICsJCQkJIHZjW2ldLT5tdXgsIHZjW2ldLT5jYW0s
IHZjW2ldLT5waXhlbF9tb2RlKTsNCj4gKw0KPiArCQkJbXRrX2NhbV9zZW5pbmZfc2V0X3Rlc3Rf
bW9kZWwoY3R4LCB2Y1tpXS0+bXV4LA0KPiArCQkJCQkJICAgICAgdmNbaV0tPmNhbSwNCj4gKwkJ
CQkJCSAgICAgIHZjW2ldLT5waXhlbF9tb2RlKTsNCj4gKw0KPiArCQkJaWYgKHZjW2ldLT5vdXRf
cGFkID09IFBBRF9TUkNfUERBRjApDQo+ICsJCQkJbWRlbGF5KDQwKTsNCj4gKwkJCWVsc2UNCj4g
KwkJCQl1c2xlZXBfcmFuZ2UoNDAsIDYwKTsNCj4gKwkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCW10
a19jYW1fc2VuaW5mX3NldF9pZGxlKGN0eCk7DQo+ICsJCW10a19jYW1fc2VuaW5mX3JlbGVhc2Vf
bXV4KGN0eCk7DQo+ICsNCj4gKwkJaWYgKGN0eC0+Y29yZS0+Y2xrW0NMS19UT1BfQ0FNVE1dKQ0K
PiArCQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGN0eC0+Y29yZS0+Y2xrW0NMS19UT1BfQ0FNVE1d
KTsNCj4gKw0KPiArCQlwbV9ydW50aW1lX3B1dF9zeW5jKGN0eC0+ZGV2KTsNCj4gKwl9DQo+ICsN
Cj4gKwljdHgtPnN0cmVhbWluZyA9IGVuYWJsZTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0K
PiArDQoNCg==

--__=_Part_Boundary_009_114319559.1431844410
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjtk
cml2ZXImIzMyO29mJiMzMjt0aGUmIzMyO01lZGlhVGVrJiMzMjtTZW5zb3ImIzMyO0ludGVyZmFj
ZSwNCiZndDsmIzMyO2ZvY3VzaW5nJiMzMjtvbiYjMzI7aW50ZWdyYXRpb24mIzMyO3dpdGgmIzMy
O3RoZSYjMzI7TWVkaWFUZWsmIzMyO0lTUCYjMzI7Q0FNU1lTLiYjMzI7VGhlDQomZ3Q7JiMzMjtz
ZW5pbmYmIzMyO2RldmljZSYjMzI7YnJpZGdlcyYjMzI7Y2FtZXJhJiMzMjtzZW5zb3JzJiMzMjth
bmQmIzMyO3RoZSYjMzI7SVNQJiMzMjtzeXN0ZW0sDQomZ3Q7JiMzMjtwcm92aWRpbmcmIzMyO21h
bmFnZW1lbnQmIzMyO2ZvciYjMzI7c2Vuc29yJiMzMjtkYXRhJiMzMjtyb3V0aW5nJiMzMjthbmQm
IzMyO3Byb2Nlc3NpbmcuDQomZ3Q7JiMzMjtLZXkmIzMyO2ZlYXR1cmVzJiMzMjtpbmNsdWRlJiMz
MjtWNEwyJiMzMjtmcmFtZXdvcmsmIzMyO2NvbnRyb2wsJiMzMjthbmQmIzMyO2R5bmFtaWMNCiZn
dDsmIzMyO2hhbmRsaW5nJiMzMjtvZiYjMzI7c3RyZWFtJiMzMjtjb25maWd1cmF0aW9ucyYjMzI7
YW5kJiMzMjt2aXJ0dWFsJiMzMjtjaGFubmVscy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMyO1lhbmcmIzMyOyZsdDtTaHUtaHNpYW5nLllhbmdA
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3Rh
dGljJiMzMjtpbnQmIzMyO3NldF90ZXN0X21vZGVsKHN0cnVjdCYjMzI7c2VuaW5mX2N0eCYjMzI7
KmN0eCwmIzMyO2NoYXImIzMyO2VuYWJsZSkNCiZndDsmIzMyOyt7DQoNCldpdGhvdXQmIzMyO3Rl
c3QmIzMyO2NvZGUsJiMzMjt0aGlzJiMzMjtkcml2ZXImIzMyO3N0aWxsJiMzMjt3b3JrLCYjMzI7
c28mIzMyO3Rlc3QmIzMyO2NvZGUmIzMyO2lzJiMzMjthZHZhbmNlZCYjMzI7ZnVuY3Rpb24uDQpT
ZXBhcmF0ZSYjMzI7dGVzdCYjMzI7Y29kZSYjMzI7dG8mIzMyO2EmIzMyO3Rlc3QmIzMyO3BhdGNo
Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7c2VuaW5mX3ZjJiMzMjsq
dmNbXSYjMzI7PSYjMzI7eyYjMzI7TlVMTCwmIzMyO05VTEwsJiMzMjtOVUxMLCYjMzI7TlVMTCwm
IzMyO05VTEwmIzMyO307DQomZ3Q7JiMzMjsraW50JiMzMjtpJiMzMjs9JiMzMjswLCYjMzI7cmV0
JiMzMjs9JiMzMjswLCYjMzI7dmNfdXNlZCYjMzI7PSYjMzI7MDsNCiZndDsmIzMyOytzdHJ1Y3Qm
IzMyO3NlbmluZl9tdXgmIzMyOyptdXg7DQomZ3Q7JiMzMjsraW50JiMzMjtwcmVmX2lkeFtdJiMz
Mjs9JiMzMjt7JiMzMjswLCYjMzI7MSwmIzMyOzIsJiMzMjszLCYjMzI7NCYjMzI7fTsNCiZndDsm
IzMyOysNCiZndDsmIzMyOytpZiYjMzI7KGN0eC0mZ3Q7aXNfdGVzdF9tb2RlbCYjMzI7PT0mIzMy
OzEpJiMzMjt7DQomZ3Q7JiMzMjsrdmNbdmNfdXNlZCsrXSYjMzI7PSYjMzI7bXRrX2NhbV9zZW5p
bmZfZ2V0X3ZjX2J5X3BhZChjdHgsJiMzMjtQQURfU1JDX1JBVzApOw0KJmd0OyYjMzI7K30mIzMy
O2Vsc2UmIzMyO2lmJiMzMjsoY3R4LSZndDtpc190ZXN0X21vZGVsJiMzMjs9PSYjMzI7MikmIzMy
O3sNCiZndDsmIzMyOyt2Y1t2Y191c2VkKytdJiMzMjs9JiMzMjttdGtfY2FtX3NlbmluZl9nZXRf
dmNfYnlfcGFkKGN0eCwmIzMyO1BBRF9TUkNfUkFXMCk7DQomZ3Q7JiMzMjsrdmNbdmNfdXNlZCsr
XSYjMzI7PSYjMzI7bXRrX2NhbV9zZW5pbmZfZ2V0X3ZjX2J5X3BhZChjdHgsJiMzMjtQQURfU1JD
X1JBVzEpOw0KJmd0OyYjMzI7K3ZjW3ZjX3VzZWQrK10mIzMyOz0mIzMyO210a19jYW1fc2VuaW5m
X2dldF92Y19ieV9wYWQoY3R4LCYjMzI7UEFEX1NSQ19SQVcyKTsNCiZndDsmIzMyOyt9JiMzMjtl
bHNlJiMzMjtpZiYjMzI7KGN0eC0mZ3Q7aXNfdGVzdF9tb2RlbCYjMzI7PT0mIzMyOzMpJiMzMjt7
DQomZ3Q7JiMzMjsrdmNbdmNfdXNlZCsrXSYjMzI7PSYjMzI7bXRrX2NhbV9zZW5pbmZfZ2V0X3Zj
X2J5X3BhZChjdHgsJiMzMjtQQURfU1JDX1JBVzApOw0KJmd0OyYjMzI7K3ZjW3ZjX3VzZWQrK10m
IzMyOz0mIzMyO210a19jYW1fc2VuaW5mX2dldF92Y19ieV9wYWQoY3R4LCYjMzI7UEFEX1NSQ19Q
REFGMCk7DQomZ3Q7JiMzMjsrfSYjMzI7ZWxzZSYjMzI7ew0KJmd0OyYjMzI7K2Rldl9pbmZvKGN0
eC0mZ3Q7ZGV2LCYjMzI7JnF1b3Q7dGVzdG1vZGVsJWQmIzMyO2ludmFsaWQmIzkyO24mcXVvdDss
JiMzMjtjdHgtJmd0O2lzX3Rlc3RfbW9kZWwpOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7LTE7DQom
Z3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2ZvciYjMzI7KDsmIzMyO2kmIzMyOyZs
dDsmIzMyO3ZjX3VzZWQ7JiMzMjsrK2kpJiMzMjt7DQomZ3Q7JiMzMjsraWYmIzMyOyghdmNbaV0p
JiMzMjt7DQomZ3Q7JiMzMjsrZGV2X2luZm8oY3R4LSZndDtkZXYsJiMzMjsmcXVvdDt2YyYjMzI7
bm90JiMzMjtmb3VuZCYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjstMTsNCiZn
dDsmIzMyOyt9DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoZW5h
YmxlKSYjMzI7ew0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7cG1fcnVudGltZV9yZXN1bWVfYW5k
X2dldChjdHgtJmd0O2Rldik7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQmIzMyOyZsdDsmIzMyOzAp
JiMzMjt7DQomZ3Q7JiMzMjsrZGV2X2luZm8oY3R4LSZndDtkZXYsJiMzMjsmcXVvdDtmYWlsZWQm
IzMyO2F0JiMzMjtwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0JiM5MjtuJnF1b3Q7KTsNCiZndDsm
IzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsr
aWYmIzMyOyhjdHgtJmd0O2NvcmUtJmd0O2Nsa1tDTEtfVE9QX0NBTVRNXSkNCiZndDsmIzMyOyty
ZXQmIzMyOz0mIzMyO2Nsa19wcmVwYXJlX2VuYWJsZShjdHgtJmd0O2NvcmUtJmd0O2Nsa1tDTEtf
VE9QX0NBTVRNXSk7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJuJiMz
MjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZm9yJiMzMjsoaSYjMzI7PSYjMzI7MDsmIzMy
O2kmIzMyOyZsdDsmIzMyO3ZjX3VzZWQ7JiMzMjsrK2kpJiMzMjt7DQomZ3Q7JiMzMjsrbXV4JiMz
Mjs9JiMzMjttdGtfY2FtX3NlbmluZl9tdXhfZ2V0X3ByZWYoY3R4LA0KJmd0OyYjMzI7KyYjMzI7
JiMzMjtwcmVmX2lkeCwNCiZndDsmIzMyOysmIzMyOyYjMzI7QVJSQVlfU0laRShwcmVmX2lkeCkp
Ow0KJmd0OyYjMzI7K2lmJiMzMjsoIW11eCkNCiZndDsmIzMyOytyZXR1cm4mIzMyOy1FQlVTWTsN
CiZndDsmIzMyOyt2Y1tpXS0mZ3Q7bXV4JiMzMjs9JiMzMjttdXgtJmd0O2lkeDsNCiZndDsmIzMy
Oyt2Y1tpXS0mZ3Q7Y2FtJiMzMjs9JiMzMjtjdHgtJmd0O3BhZDJjYW1bdmNbaV0tJmd0O291dF9w
YWRdOw0KJmd0OyYjMzI7K3ZjW2ldLSZndDtlbmFibGUmIzMyOz0mIzMyOzE7DQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsrZGV2X2luZm8oY3R4LSZndDtkZXYsDQomZ3Q7JiMzMjsrJiMzMjsmcXVvdDt0
ZXN0JiMzMjttb2RlJiMzMjttdXgmIzMyOyVkLCYjMzI7Y2FtJiMzMjslZCwmIzMyO3BpeGVsJiMz
Mjttb2RlJiMzMjslZCYjOTI7biZxdW90OywNCiZndDsmIzMyOysmIzMyO3ZjW2ldLSZndDttdXgs
JiMzMjt2Y1tpXS0mZ3Q7Y2FtLCYjMzI7dmNbaV0tJmd0O3BpeGVsX21vZGUpOw0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7K210a19jYW1fc2VuaW5mX3NldF90ZXN0X21vZGVsKGN0eCwmIzMyO3ZjW2ld
LSZndDttdXgsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dmNbaV0t
Jmd0O2NhbSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt2Y1tpXS0m
Z3Q7cGl4ZWxfbW9kZSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyh2Y1tpXS0mZ3Q7
b3V0X3BhZCYjMzI7PT0mIzMyO1BBRF9TUkNfUERBRjApDQomZ3Q7JiMzMjsrbWRlbGF5KDQwKTsN
CiZndDsmIzMyOytlbHNlDQomZ3Q7JiMzMjsrdXNsZWVwX3JhbmdlKDQwLCYjMzI7NjApOw0KJmd0
OyYjMzI7K30NCiZndDsmIzMyOyt9JiMzMjtlbHNlJiMzMjt7DQomZ3Q7JiMzMjsrbXRrX2NhbV9z
ZW5pbmZfc2V0X2lkbGUoY3R4KTsNCiZndDsmIzMyOyttdGtfY2FtX3NlbmluZl9yZWxlYXNlX211
eChjdHgpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoY3R4LSZndDtjb3JlLSZndDtj
bGtbQ0xLX1RPUF9DQU1UTV0pDQomZ3Q7JiMzMjsrY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGN0eC0m
Z3Q7Y29yZS0mZ3Q7Y2xrW0NMS19UT1BfQ0FNVE1dKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytw
bV9ydW50aW1lX3B1dF9zeW5jKGN0eC0mZ3Q7ZGV2KTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsrY3R4LSZndDtzdHJlYW1pbmcmIzMyOz0mIzMyO2VuYWJsZTsNCiZndDsmIzMy
OysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQoN
CjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4q
KioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_114319559.1431844410--

