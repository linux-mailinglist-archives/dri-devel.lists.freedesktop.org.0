Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DB9BAD98
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3768510E2A1;
	Mon,  4 Nov 2024 08:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Dclvio3C";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KPk5dsUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353410E2A1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 08:04:12 +0000 (UTC)
X-UUID: 5d14099e9a8311efb88477ffae1fc7a5-20241104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=a8d36FlKvoFsvy6AFvJDT5W+Q4UMSZpNpIvdYvip1AU=; 
 b=Dclvio3CPb2thxAZv2GzcbEGYNdF5UCohWIKd2hy3dZ/nqFBLrSzD9bVizO9YwRJ+qFaB/DoieLVtWjAilAh4hBKgQ5bElCIQDTnroDPjNfKD2cAtWMhkz7fEUvjAkkF6DNHz1xb01jZnxjVgi2cjvuQ/JgQSOYuyUqGPtM6h0Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:38af7e3c-c4ca-4a10-82c4-93f3fc639191, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:0ffca548-ca13-40ea-8070-fa012edab362,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5d14099e9a8311efb88477ffae1fc7a5-20241104
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1898491940; Mon, 04 Nov 2024 16:04:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 16:04:05 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Nov 2024 16:04:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5oHIQDKzDDzzzGPEUtLu4No0r0fx+i3l3TsVKQxTQoIPHipm1eskkL2YdVsqLnUAWFNkVquiUtezHSXTIdCQLDBeVfxxqUb1MvQTyfVdOekzqLA4lh9vDwDpIQ+2ZnVqF8lVwA8teA2I6j/7hTF9xCr8vzPaK08V0CiQXHWzYN87VN1VLDzGPmhF1ioLTrn33s1wsqERIsECHMTCHwcg7wflpcRHFKTc2m3rsaBcN2xcVmjDjdpRS5ekS9KlBHP6etNbmJbSSUTBaL3xdF1NIjLMYmJ/BksxzYE10S8oZcQ9q5Zso5pqLTgt7n677Vj7mr621vW9/1/B/w228wFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/ai7aQ7fWJRMIw2LogJAAYPCdWu5M0ZmPIfS2mwfHU=;
 b=tASjt87I+EosspXN7L3CNxpnVqtgFOMpd2hv99eOYyYMMXXUvwuu8nMbN+nBbWl/UVWjgnOx7iQu/szKof5udBHX/VIBi/WswbGNQcfjcV9K16LepDg/LT+OZx9bqr05p5gSemA6UhmwpawLEqHgqdDJo7R/1WZJl0ItTdsh1tio1pQzYde8Lo11rVim1+BkVslEjPjbQVV0FqQ5nOjWwHXN4y0IvKuC2V84VrUfT5RZ4uAlRS343eItSWuUO810bqpLaLCUZClAk1nhUeQtkbxcIteln1U6ZEpzK2ZRlGV2RMQ8dDg3nu2MSSAuewN83KkclAC9sKcmNFRDqUyuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/ai7aQ7fWJRMIw2LogJAAYPCdWu5M0ZmPIfS2mwfHU=;
 b=KPk5dsUGsrEdxrQFRtR0/vO5hnRZ7Y9REKlyAkM095htcE8ZFr7ZgHN7ikse9/RoUDUSBIm19MAhwU9sA9hlISlKow8zoSw1M74kF7FeUATomdm6eHDZuFXzjqsovHudSLQCfsIOlB/u50xxLvi89bHPbvxtfa/QJBp86+H9cjs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7081.apcprd03.prod.outlook.com (2603:1096:400:33b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 08:04:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 08:04:02 +0000
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
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7Km67yA
Date: Mon, 4 Nov 2024 08:04:02 +0000
Message-ID: <e6336feb9043f1cf35949fb0c93aa18fc05415cd.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7081:EE_
x-ms-office365-filtering-correlation-id: 2cd506b0-89e2-4659-fd31-08dcfca73ef9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K3FEM3RnQk1KRnhpV05YSklFajJjdlN2ZVFoYy82dkVnUDhsdHdDN0Q4N1Z1?=
 =?utf-8?B?c2tBQytGZ1JOTlN0N3h4NGZFZEY0NWNwOUtEa1VzQUxDcVZLVU9qbUhkRzZI?=
 =?utf-8?B?VEhwYUg3M0NPbFZZdXhNc3lmekdrY0cxaFBFRi9pcUFuMzJTdS9RUVROcVVH?=
 =?utf-8?B?djU0NHpaWGNreE1Ed1dST0FEUG5BR0FnV0RJZHk4cVNlVERvUU1zUlQrNDlO?=
 =?utf-8?B?eXorSjQ2WXBBM2lnUzd4T0J0MU1tYjl4bjA4S241bDRLRkxJSHhITTc5RWxp?=
 =?utf-8?B?UmRHZjdsQVk1UG5lUDJ6MHQ4K21SRHFPa1duUDhrZzJIc3g3cTIvTDJHQWRO?=
 =?utf-8?B?Vllmalc5UDhDSHFlaU5hNkxnR2NCMVQzRm15dGtKVmt5MEp3VWtabnlEUjlo?=
 =?utf-8?B?QmdEclpvTlZZbXhEbXF6SFBkc2hLWHU2b2pmZitFT1duUEVBVVBxMC9YN25h?=
 =?utf-8?B?Yjh4Z3hvUzkyb3NNT2U0cmtGdElXbnFMUU05YnJkWUgvSTBnMmVoUmtNMXhD?=
 =?utf-8?B?RkEzSUdQaDlBNGsxdHQ2RUpJQWJia0IxdWo1V3JHSDUxRVZjdWtvS3ErVnFH?=
 =?utf-8?B?dDNxOXlXWDlmTEhlSnVXK2tUTnFPOFB4MUM5WWZNNm9LZkRJaGd4S2taRFUz?=
 =?utf-8?B?R0o4M0FGdWVBOVBuNUR0VWMyR2pKK2M0K0tJWm42Z0o3S09HZ3g2L0psayt2?=
 =?utf-8?B?RmpjZWJvQmQ3QUthVzk2cWVnenlqT3VvZlVXaDJBTkFQaW5hTWVPWmVyR1Az?=
 =?utf-8?B?RXVxbVBZUFJQeDNoU0RWdWtjT3NPNUd1Z0tvcS80c2NwRnFDTWNKb29tOGVu?=
 =?utf-8?B?b1cxQnpucWRiU1d0aHliVnhxSXVxSEtGR085eWtmb2JSR2d4dzg5QnpkUGhl?=
 =?utf-8?B?NVcwRzgvcnZySUJWT0h2T2RBM2RGM2t2V0lKWEp5aThEZUdFUVlmc0dORUht?=
 =?utf-8?B?TzdFZFRsUXMvQXpsT0tnU3BLUzB4aXBhQ0trTTFveHN0NUtXcGorYXZsQWtR?=
 =?utf-8?B?eU9kK1NzVXdCMDI2OUI4MEhVM21qQkpteUI3LzRFWVNyTWMvSy9WNVZxNVFv?=
 =?utf-8?B?Qm96cnpicDJTMlV1a0NaLzQ2Skp2R05iNnVXdm04MTlmeWZ1VUZyV1FKRlU3?=
 =?utf-8?B?ZXBEUG9DelBMK0pkZVdvRnFFajBIWnZkVlRoUXZKZy8xTHh6VG5oRERoOWxE?=
 =?utf-8?B?UXpjVm1kUGxZOXc4SlVtcCtyRm5SWjdYQlR4dWZkL3ZReE4xTExBcjZETmMr?=
 =?utf-8?B?UUlZNkRFZUtQSVBHL2pSV1VBYkROdmpYZEdWQ0NwNElGMWZZRVluZ0k4ZzYw?=
 =?utf-8?B?T3pjbjBRZHd4ZmlWdTdicS9HanVnZ0NNd1BrMUpyRzBVSGI3Nm9wZG1tRWhu?=
 =?utf-8?B?eStFRW9YallTU0tYYTgyOHAwblZQNUw5YWdsdTU5NTFLTzNHaldPTnhBQnA1?=
 =?utf-8?B?MkxlSVFvWFFQVjhFMmJWOG5KNlpncDJ6cC9jZHFzS09mY05HVEZOL2NicldD?=
 =?utf-8?B?eDcrOWJDaDV0WFp2SktHNVBudUtBMzFFTTR2R3h1QkZjMUlHcCt2M05VT0Ew?=
 =?utf-8?B?NzVmdUNtU3lmUXdyNTJaazV3VVFBMGNnOG8wT3hMeVVUaHlZZ1ZUdGdHMEZq?=
 =?utf-8?B?VXpzZTJFRlJNaHc0YnpaNkR5cXN0NklPVDlneG9kdmw5VlpxZHJhcVd3eHFS?=
 =?utf-8?B?YWZ4QkhDQTk4NWdpanY0ZGp6bUx1cjYrOTRGREFYSnBnSSs0djlHQWRGTFd6?=
 =?utf-8?B?aElNV2U5YmpnMnJOd1ppUzdVVm5VZDhFUVZCVmJiQk9yT0tWbjltMlpFQjRT?=
 =?utf-8?B?SCtBUEdmV2Fud3YyNmlpemFndlNrSjl0VXUwRG1mQUZYb281Tm53c0tFMzZH?=
 =?utf-8?Q?VwzRHnfcvvjtY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0Vob1gxRVBhL2xRVXR6UVN0dFh3UTcrOU93OGY0YnhPNnlDblJaV1RBQnpI?=
 =?utf-8?B?dFhvVVdmTDd6Q01lMDhad2Y3SjRLVUhaZm9zaFdZN2xSUjllTjZ6dlIxLzVG?=
 =?utf-8?B?Rm9hRmNIdEkycm1Wd3gyMUxJaWErMXBqTkMrY1MxdkF1V2V1NFQwa2pZZWRU?=
 =?utf-8?B?RkNCdGdJcTl4eCtsQVJVVzNJOXovQlV6Q2FrUHQ3M2g3aWVaVnowUHFmUjFR?=
 =?utf-8?B?eGFpUmpPQXJhNHhGRnRpRzhzeUVnTElUSnJISzhwcFFMMkpKWkxWSGF5NTFh?=
 =?utf-8?B?R3lqNmoyWnlvZWpTYmdNaDQ1OHE1Q1gwaGtmY3ZLUFNjVDdWbVJSeXdxYWI1?=
 =?utf-8?B?MG9HTDEvVEdIM1ZwbnNCYjkrUUNrQ3QzRGt3Rk5Na0M1ODl6KyswOU1JemdV?=
 =?utf-8?B?bGVWVzhlQWp0bENaUFJibW5BcEl1TnFBR2dyaVNHK0VOblg5RXNqRFpZV3k5?=
 =?utf-8?B?MVVyL1h0VnVLc2UwMXVNeGg1WjhuTzY1YnpqbWp6TTl4N21YRXEzVXprYnp6?=
 =?utf-8?B?cUVkMkEwZlZYZ3NsaE55RUxLbVJFdzJXN2lSS2RDT3hSZjlpQk1kOXkzUTNS?=
 =?utf-8?B?NU81Rm5QMzdkdkU4RnhaWUc1YUQrS3ozSEozV0RadHVPTWgzTHdZSEtvZ3I0?=
 =?utf-8?B?akFKOTBOVjNjQnVNMk8wbFE1RGVpWHJVUlhESFlUSkdFdjVRZ1M5dHJRcTRM?=
 =?utf-8?B?dE1ncmhDUXNNM3c2OXR5M3drVGlKNHlJT1FEc09pcHBwbnFuMkpaZ0NsUCsx?=
 =?utf-8?B?a2FZaForRWxlQTEwazJjTXJNZ1dXek14cjk1Q3QxQVlzNVFWUHBZaE9wRGpy?=
 =?utf-8?B?NDdmMWZBamN2MWZGbytQR21GQTIxQkVMdmdqQW84b2d6T2FEVk9zUWQxR3lD?=
 =?utf-8?B?S2diOERPTW1xK09ySk5FVENuTGNSYUYzZDJ0S1dvU2Y2VHF1ZURzUmxxY0s0?=
 =?utf-8?B?WHZmYXZYais0MHpiaEZHZk4rZUNUMjRDVkpFWHEzTnY2a0RrZEdCZnFnOVF1?=
 =?utf-8?B?VnpKRUp5OEhvdnV4eTgvR205azZQUHZITGVDbzEya2tEdFk5ZjRjRXozZkZY?=
 =?utf-8?B?eXZ6dm80VVhBS3pBaGdmTlFsL2hUSktRRGQvL0V5RlNsRE12RFZiVEs4am5B?=
 =?utf-8?B?RzUwTWFUOTQvdHpJRmxoK0dOYnZkVHhQR2tiMkFudU45b0VpVXBRY1NVenJ0?=
 =?utf-8?B?TmdDd1NldkdjclcvM2Jpb1M0QkNvZXBrK1duSTdQamw3dUxsRGlTclJkTEQ0?=
 =?utf-8?B?OG0yZi85NWp2WEhNVEpJZUtOZ2NabGQzbjVITzlLRTZndDhNVFgxMDBTSloy?=
 =?utf-8?B?Q0dJeXhtMGxEMkE5U1JDclpvMkgvcFFEdmYyZUpjYUprZlNPNDR0bkVaV2ZW?=
 =?utf-8?B?TkJWR0x4V1lvang2SGNqVlZVS1p3Q0F3QWRpNGQvbW5EQmdRN0FyQTZuQks4?=
 =?utf-8?B?N1FZZEY2d1QwM1Q0UVE2b2xrT0dPc0JScDlWd3ZRbit5bXFSRWhSZm1BY2hW?=
 =?utf-8?B?R2VqSERLWHArbURCcnU3Wnd5NmtmS0pZWFB5Q1h3bldjdWVOSm9UTDFyL0Z4?=
 =?utf-8?B?a2FLdUpVZnlxT0VuQzVCNXhLdHpsSFhhT3I1aWU2K1VEZVNhZU13dW5vS1Vk?=
 =?utf-8?B?KzlsTFVmVkJiVy9SUnE1RUFCUktnUTRId0hUZHdIdzlOZFVidnNrbUQyU2pl?=
 =?utf-8?B?SjQ0cDIwaVIyN3ZKcEV4dWh0c0dNTG9IR0dLdjNvTVNyaGJCTWtCUFhJNEhl?=
 =?utf-8?B?MUdhbDArSVRnRThXdFROVVNmVkZMcXJEdC9HdlorWDVraURld0swd1llRVo4?=
 =?utf-8?B?Z01BdUdmdHZDQ2dTb0FWbjN0YWdXRjErcSs1MTZuOUZaWjZwaXpwM0crOEIv?=
 =?utf-8?B?NTJqKzV5aXl3MXdIY0l1YlVDZmZHMC9kVmVSckZla2s0dlZxV2hVTkszNXlZ?=
 =?utf-8?B?OFFEelRMcnRSa2t5ZEpWb1haUmM0bzVXeTFIQVlLdzdoTlN6Zy9FNXRjcTc4?=
 =?utf-8?B?RmtvRzZaNjYxWXBwUWh2SHZlMVlEYWlYaTdNT3dYTllwREd4N3hMRGFkNjdn?=
 =?utf-8?B?NXVhN05tMmJySXBHK0dQU1pENkh3RzUwMU1CSnFVQ3RFdnBUL2lDYjZPWTdi?=
 =?utf-8?Q?zcGSBLLYm8fjNx3Sx690C02lo?=
Content-ID: <D6AB5FD8400DAE42AE6AB692D52FE359@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd506b0-89e2-4659-fd31-08dcfca73ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 08:04:02.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvaYlw7UbyekhiEImu69/wA9jPcxBH4BO3PgS8hfKhuoyNtBZojWFzaXONg87CTWXYwDmfMExsDIapgR4ilshg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7081
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_423106466.1550968740"
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

--__=_Part_Boundary_001_423106466.1550968740
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgYm9v
bCBtdGtfcmF3X2ZtdF9nZXRfcmVzKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsDQo+ICsJCQkJc3Ry
dWN0IHY0bDJfc3ViZGV2X2Zvcm1hdCAqZm10LA0KPiArCQkJCXN0cnVjdCBtdGtfY2FtX3Jlc291
cmNlICpyZXMpDQo+ICt7DQo+ICsJdm9pZCAqdXNlcl9wdHI7DQo+ICsJdTY0IGFkZHI7DQo+ICsN
Cj4gKwlhZGRyID0gKCh1NjQpZm10LT5yZXNlcnZlZFsxXSA8PCAzMikgfCBmbXQtPnJlc2VydmVk
WzJdOw0KDQpUaGUgY2FsbHN0YWNrIHRvIHRoaXMgZnVuY3Rpb24gaXM6DQoNCnN1YmRldl9kb19p
b2N0bCgpIC0+IG10a19yYXdfc2V0X2ZtdCgpIC0+IG10a19yYXdfdHJ5X3BhZF9mbXQoKSAtPiBt
dGtfcmF3X3NldF9zcmNfcGFkX2ZtdCgpIC0+IG10a19yYXdfZm10X2dldF9yZXMoKQ0KDQpJbiBz
dWJkZXZfZG9faW9jdGwoKSBbMV0sIGZtdC0+cmVzZXJ2ZWRbXSB3b3VsZCBiZSBjbGVhcmVkIHRv
IHplcm8uDQpJIGRvbid0IGtub3cgd2h5IHlvdSBjb3VsZCBnZXQgYSBub24temVybyBhZGRyIHZh
bHVlPw0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1z
dWJkZXYuYz9oPXY2LjEyLXJjNiNuNzUzDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJdXNlcl9wdHIg
PSAodm9pZCAqKWFkZHI7DQo+ICsJaWYgKCF1c2VyX3B0cikgew0KPiArCQlkZXZfaW5mbyhzZC0+
djRsMl9kZXYtPmRldiwgIiVzOiBtdGtfY2FtX3Jlc291cmNlIGlzIG51bGxcbiIsDQo+ICsJCQkg
X19mdW5jX18pOw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGNvcHlf
ZnJvbV91c2VyKHJlcywgKHZvaWQgX191c2VyICopdXNlcl9wdHIsIHNpemVvZigqcmVzKSkpIHsN
Cj4gKwkJZGV2X2luZm8oc2QtPnY0bDJfZGV2LT5kZXYsDQo+ICsJCQkgIiVzOiBjb3B5X2Zyb21f
dXNlciBmYWlsZWRtIHVzZXJfcHRyOiVwXG4iLA0KPiArCQkJIF9fZnVuY19fLCB1c2VyX3B0cik7
DQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlkZXZfZGJnKHNkLT52NGwyX2Rl
di0+ZGV2LA0KPiArCQkiJXM6c2Vuc29yOiVkLyVkLyVsbGQvJWQvJWQsIHJhdzolbGxkLyVkLyVk
LyVkLyVkLyVkLyVkLyVkLyVsbGRcbiIsDQo+ICsJCV9fZnVuY19fLA0KPiArCQlyZXMtPnNlbnNv
cl9yZXMuaGJsYW5rLCByZXMtPnNlbnNvcl9yZXMudmJsYW5rLA0KPiArCQlyZXMtPnNlbnNvcl9y
ZXMucGl4ZWxfcmF0ZSwgcmVzLT5zZW5zb3JfcmVzLmludGVydmFsLmRlbm9taW5hdG9yLA0KPiAr
CQlyZXMtPnNlbnNvcl9yZXMuaW50ZXJ2YWwubnVtZXJhdG9yLA0KPiArCQlyZXMtPnJhd19yZXMu
ZmVhdHVyZSwgcmVzLT5yYXdfcmVzLmJpbiwgcmVzLT5yYXdfcmVzLnBhdGhfc2VsLA0KPiArCQly
ZXMtPnJhd19yZXMucmF3X21heCwgcmVzLT5yYXdfcmVzLnJhd19taW4sIHJlcy0+cmF3X3Jlcy5y
YXdfdXNlZCwNCj4gKwkJcmVzLT5yYXdfcmVzLnN0cmF0ZWd5LCByZXMtPnJhd19yZXMucGl4ZWxf
bW9kZSwNCj4gKwkJcmVzLT5yYXdfcmVzLnRocm91Z2hwdXQpOw0KPiArDQo+ICsJcmV0dXJuIHJl
czsNCj4gK30NCj4gKw0KDQo=

--__=_Part_Boundary_001_423106466.1550968740
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjtJ
U1AmIzMyO3BpcGVsaW5lJiMzMjtkcml2ZXImIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYj
MzI7SVNQJiMzMjtyYXcmIzMyO2FuZCYjMzI7eXV2DQomZ3Q7JiMzMjttb2R1bGVzLiYjMzI7S2V5
JiMzMjtmdW5jdGlvbmFsaXRpZXMmIzMyO2luY2x1ZGUmIzMyO2RhdGEmIzMyO3Byb2Nlc3Npbmcs
JiMzMjtWNEwyJiMzMjtpbnRlZ3JhdGlvbiwNCiZndDsmIzMyO3Jlc291cmNlJiMzMjttYW5hZ2Vt
ZW50LCYjMzI7ZGVidWcmIzMyO3N1cHBvcnQsJiMzMjthbmQmIzMyO3ZhcmlvdXMmIzMyO2NvbnRy
b2wmIzMyO29wZXJhdGlvbnMuDQomZ3Q7JiMzMjtBZGRpdGlvbmFsbHksJiMzMjtJUlEmIzMyO2hh
bmRsaW5nLCYjMzI7cGxhdGZvcm0mIzMyO2RldmljZSYjMzI7bWFuYWdlbWVudCwmIzMyO2FuZCYj
MzI7TWVkaWFUZWsNCiZndDsmIzMyO0lTUCYjMzI7RE1BJiMzMjtmb3JtYXQmIzMyO3N1cHBvcnQm
IzMyO2FyZSYjMzI7YWxzbyYjMzI7aW5jbHVkZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5n
QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7K3N0
YXRpYyYjMzI7Ym9vbCYjMzI7bXRrX3Jhd19mbXRfZ2V0X3JlcyhzdHJ1Y3QmIzMyO3Y0bDJfc3Vi
ZGV2JiMzMjsqc2QsDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjt2NGwyX3N1YmRldl9mb3JtYXQmIzMy
OypmbXQsDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfY2FtX3Jlc291cmNlJiMzMjsqcmVzKQ0K
Jmd0OyYjMzI7K3sNCiZndDsmIzMyOyt2b2lkJiMzMjsqdXNlcl9wdHI7DQomZ3Q7JiMzMjsrdTY0
JiMzMjthZGRyOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2FkZHImIzMyOz0mIzMyOygodTY0KWZt
dC0mZ3Q7cmVzZXJ2ZWRbMV0mIzMyOyZsdDsmbHQ7JiMzMjszMikmIzMyO3wmIzMyO2ZtdC0mZ3Q7
cmVzZXJ2ZWRbMl07DQoNClRoZSYjMzI7Y2FsbHN0YWNrJiMzMjt0byYjMzI7dGhpcyYjMzI7ZnVu
Y3Rpb24mIzMyO2lzOg0KDQpzdWJkZXZfZG9faW9jdGwoKSYjMzI7LSZndDsmIzMyO210a19yYXdf
c2V0X2ZtdCgpJiMzMjstJmd0OyYjMzI7bXRrX3Jhd190cnlfcGFkX2ZtdCgpJiMzMjstJmd0OyYj
MzI7bXRrX3Jhd19zZXRfc3JjX3BhZF9mbXQoKSYjMzI7LSZndDsmIzMyO210a19yYXdfZm10X2dl
dF9yZXMoKQ0KDQpJbiYjMzI7c3ViZGV2X2RvX2lvY3RsKCkmIzMyO1sxXSwmIzMyO2ZtdC0mZ3Q7
cmVzZXJ2ZWRbXSYjMzI7d291bGQmIzMyO2JlJiMzMjtjbGVhcmVkJiMzMjt0byYjMzI7emVyby4N
CkkmIzMyO2RvbiYjMzk7dCYjMzI7a25vdyYjMzI7d2h5JiMzMjt5b3UmIzMyO2NvdWxkJiMzMjtn
ZXQmIzMyO2EmIzMyO25vbi16ZXJvJiMzMjthZGRyJiMzMjt2YWx1ZSYjNjM7DQoNClsxXSYjMzI7
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1zdWJkZXYuYyYjNjM7
aD12Ni4xMi1yYzYjbjc1Mw0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K3VzZXJfcHRyJiMz
Mjs9JiMzMjsodm9pZCYjMzI7KilhZGRyOw0KJmd0OyYjMzI7K2lmJiMzMjsoIXVzZXJfcHRyKSYj
MzI7ew0KJmd0OyYjMzI7K2Rldl9pbmZvKHNkLSZndDt2NGwyX2Rldi0mZ3Q7ZGV2LCYjMzI7JnF1
b3Q7JXM6JiMzMjttdGtfY2FtX3Jlc291cmNlJiMzMjtpcyYjMzI7bnVsbCYjOTI7biZxdW90OywN
CiZndDsmIzMyOysmIzMyO19fZnVuY19fKTsNCiZndDsmIzMyOytyZXR1cm4mIzMyO2ZhbHNlOw0K
Jmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KGNvcHlfZnJvbV91c2Vy
KHJlcywmIzMyOyh2b2lkJiMzMjtfX3VzZXImIzMyOyopdXNlcl9wdHIsJiMzMjtzaXplb2YoKnJl
cykpKSYjMzI7ew0KJmd0OyYjMzI7K2Rldl9pbmZvKHNkLSZndDt2NGwyX2Rldi0mZ3Q7ZGV2LA0K
Jmd0OyYjMzI7KyYjMzI7JnF1b3Q7JXM6JiMzMjtjb3B5X2Zyb21fdXNlciYjMzI7ZmFpbGVkbSYj
MzI7dXNlcl9wdHI6JXAmIzkyO24mcXVvdDssDQomZ3Q7JiMzMjsrJiMzMjtfX2Z1bmNfXywmIzMy
O3VzZXJfcHRyKTsNCiZndDsmIzMyOytyZXR1cm4mIzMyO2ZhbHNlOw0KJmd0OyYjMzI7K30NCiZn
dDsmIzMyOysNCiZndDsmIzMyOytkZXZfZGJnKHNkLSZndDt2NGwyX2Rldi0mZ3Q7ZGV2LA0KJmd0
OyYjMzI7KyZxdW90OyVzOnNlbnNvcjolZC8lZC8lbGxkLyVkLyVkLCYjMzI7cmF3OiVsbGQvJWQv
JWQvJWQvJWQvJWQvJWQvJWQvJWxsZCYjOTI7biZxdW90OywNCiZndDsmIzMyOytfX2Z1bmNfXywN
CiZndDsmIzMyOytyZXMtJmd0O3NlbnNvcl9yZXMuaGJsYW5rLCYjMzI7cmVzLSZndDtzZW5zb3Jf
cmVzLnZibGFuaywNCiZndDsmIzMyOytyZXMtJmd0O3NlbnNvcl9yZXMucGl4ZWxfcmF0ZSwmIzMy
O3Jlcy0mZ3Q7c2Vuc29yX3Jlcy5pbnRlcnZhbC5kZW5vbWluYXRvciwNCiZndDsmIzMyOytyZXMt
Jmd0O3NlbnNvcl9yZXMuaW50ZXJ2YWwubnVtZXJhdG9yLA0KJmd0OyYjMzI7K3Jlcy0mZ3Q7cmF3
X3Jlcy5mZWF0dXJlLCYjMzI7cmVzLSZndDtyYXdfcmVzLmJpbiwmIzMyO3Jlcy0mZ3Q7cmF3X3Jl
cy5wYXRoX3NlbCwNCiZndDsmIzMyOytyZXMtJmd0O3Jhd19yZXMucmF3X21heCwmIzMyO3Jlcy0m
Z3Q7cmF3X3Jlcy5yYXdfbWluLCYjMzI7cmVzLSZndDtyYXdfcmVzLnJhd191c2VkLA0KJmd0OyYj
MzI7K3Jlcy0mZ3Q7cmF3X3Jlcy5zdHJhdGVneSwmIzMyO3Jlcy0mZ3Q7cmF3X3Jlcy5waXhlbF9t
b2RlLA0KJmd0OyYjMzI7K3Jlcy0mZ3Q7cmF3X3Jlcy50aHJvdWdocHV0KTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOytyZXR1cm4mIzMyO3JlczsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioq
KioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdl
IChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3By
aWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUg
dW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGll
dmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3Nl
IHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlv
dSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_423106466.1550968740--

