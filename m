Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB99D9179
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 06:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407C10E182;
	Tue, 26 Nov 2024 05:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="XyzJR7sK";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Owp0V1wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1710E182
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 05:45:51 +0000 (UTC)
X-UUID: adeb03f8abb911efbd192953cf12861f-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gMrOwOHF8SFu55K3UGuIMBkXTmCOmdyO+2Zk08ETKU8=; 
 b=XyzJR7sKTIgVyisEoE5aZHGlu/df/hzwGn2RcLoYnXAZLBXva3oqLSyLTud3lnRUZJjVuy2bX3tqA5++LMtW7vJuvrbZ6PSi4NQCWUYYXnACCCXzBOKnyeE3mI8X9591uzoZcyuFSm8Eoj18wpAs+TryVQof6XQOn05eaGUKSvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:0417379a-39b4-4a44-9bf7-ada89b0c3e76, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:d7148223-634f-4016-85ba-2d63e55c9400,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: adeb03f8abb911efbd192953cf12861f-20241126
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 916234454; Tue, 26 Nov 2024 13:45:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 13:45:42 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 13:45:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyS8V+wlvJ/UHg6P4DkkMFoqF9DTvkRh7QKVc4/zVoUAbmtCti3cwJPCzsgxqOQGLLpKkclNzytSXTl1iWZBHqOYOf2rXmxeJROAgYsF8qoMRZbRSZ3npeDKWbWO3ynYpmqtvIafn++gleC7vvIx/SMfV0h0TFezAYUNX7gOnlhwMwH9sRBDRxRvyVKQ67ZLE1nBfdvjOR831PgZphR7dm/XdoxKpZTLROP+JI7Gem3WzO7FuPzCw1ZNu/4aV6ZQhV6p/ccFqlGKykLkhSJ2iUplVV1mgIo0Rn9Rr4HMFKLviORX6NIGNKf7HAOiOLrHwRL3pkQEqj2viskMHMp0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRoDlarksefar5jN/4V6Q/pKWh6UdBgHlS5Jsh3t9vI=;
 b=XNMbDA0jpImgrw9B/ITdjbE4j++A8shVhGXM2JmeYaSI7W+Ov/qi5b10crFBGTWx+AS38ICjI51Br7UjLINdpzW0ZxrJb688dzyP1EE1OCsM4O4VagdaY1zKZBAdKlyPcavsOhk2+Moyqopczlz/H0OU86iseYWwbQXMaYUEWWb5KbEf2+H4Rjk7OsrCloWMILv91+YP9fSbK6HOArBE+p0NLYO9SNT22W0D5FTk+BBQYlpqLy0IPuPhUDziz3op1uqsOR/BlBWavsGZt8MbapqTahlSVRDsHxWbFYieYt29PbRz4dcmxeMuyIuW0br/v9//y/7uhcO43emljp+Eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRoDlarksefar5jN/4V6Q/pKWh6UdBgHlS5Jsh3t9vI=;
 b=Owp0V1waluIpdUelP0wEmiEZBVRwgIcLD4z5SNSg9jfh87XRgtRlOhUlpIs64utZtnGVRPHJD5Vsby6TA1qJTQUmgmVflOTZWHnuzVw9QpyMCnqPfxfjybZ0/IkB58wzV6a+VfPnd672W9+TYHexMRXv/jOFu+Dx3uIuekkWpKg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8602.apcprd03.prod.outlook.com (2603:1096:990:91::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 05:45:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 05:45:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 5/6] drm/mediatek: mtk_dpi: Add checks for
 reg_h_fre_con existence
Thread-Topic: [PATCH v1 5/6] drm/mediatek: mtk_dpi: Add checks for
 reg_h_fre_con existence
Thread-Index: AQHbO0oK/HjljofgE0OU1gp4Pu5A17LJFkKA
Date: Tue, 26 Nov 2024 05:45:37 +0000
Message-ID: <7566e9629d834c07b75324a4925d45c9d0f71958.camel@mediatek.com>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124420.133914-6-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8602:EE_
x-ms-office365-filtering-correlation-id: 288c9135-c106-4984-4f09-08dd0ddd8e19
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ckZrMXdGaDhOVm1ROFUrZ2dpdDE4YlJpV3ExMFBaK3V1bEhFTU9LOCs3WnZG?=
 =?utf-8?B?ZjF6QWxCZFJic2xkdjMvVWFoVlM0ejB0VnByT2dtMmpPWHRnVGZSZU1tMWV6?=
 =?utf-8?B?TU4vbzdubW8zUlVQb0l4TS9MK05Xc0EybVpiTUhId0NnaVNWMmZEWVU1aXFI?=
 =?utf-8?B?YjFxQmVkNTVObWsvRXhBWHUrbmo0N2JZYVdQdjRmQ1NWd2dvbHdOYW8vSDN4?=
 =?utf-8?B?ZEZoMHRFV3p0QXlYWk13VDBYVkxSc3V0bmZydmhPdloxYllmTk8rTXZOUFd4?=
 =?utf-8?B?VUFZZTRGWVZNUDRkN24xcVZPNzJrRExjZU9aaTdaRUF0SnYrbUNUOVRpU2Nl?=
 =?utf-8?B?eHN6bForWm02WWZySzZRL1h4ZjJLWXYyR0wyV2VrOVB5OU9QSTNQaVdlbFI3?=
 =?utf-8?B?OGRWSVR2NFZoOUdaWjdOYUVqVlJJeHVGSklJY2hKa3dFSTJ5bTdPS0k0cjI0?=
 =?utf-8?B?MytSWFdKcUtXSkhXcUhBQi91cnpBRlFUSFIzWE9icEd6RGU0NUZmT0pib0o2?=
 =?utf-8?B?YmN6QXprMzV1SXVkNlFyeVVybzhPa2h3bC9CT1Z4VWlkRTdSK3hlV0t2SXF6?=
 =?utf-8?B?bEMzSUtFNmxxbW1RdTJ2UVFzSURCdzIyM0lPenZmMVRGczRtWUlQU3FGWUVK?=
 =?utf-8?B?WGk3WVpJeUVFTEMramppTVNxYUYzdkNXaGF4UzFlY0ZxclZ5TS9FR2xHU2ZN?=
 =?utf-8?B?aXl0bkZSOWN6ZWF1eHorU0J5emdib0UxRU5URWVpa3pDMERidXRBS2NUTnZW?=
 =?utf-8?B?TDFrRXkyNm1yTDF2eXVQUnpKdWFZWnExY2h0VE5PcFkvZ2xONXRWT3JiQzF0?=
 =?utf-8?B?VlQzdGlJWGpKbnVzUjg3dG5zTTRlTGI0OVVla1VtQjdtK2toYzlZZ0E1VUo4?=
 =?utf-8?B?aFo2ZitTcHBXU2t4bW9HcHl1TVFsUTlEaG83NEJtdDdUalhZZEZZRE1HcXZr?=
 =?utf-8?B?MjlJbkl6bjBoTDdhd1k5cG1MLzN3eTVKVTc3WE45Y1UzRmdNNkRnNVdkZHRK?=
 =?utf-8?B?RXVxQUw5QTZqbVNZdUNFWVRJRkszczdhTzJoelZkNWJablpOOEZpTU9mVjYw?=
 =?utf-8?B?bnNvb3hqZXJnbXNFeGh3cFZESmxsZTBZblFwVnFQN21La1VOdmZIUEJJZHNR?=
 =?utf-8?B?TW5nUnd4azZDU3gxbTdBazREQjBLdVh4VXZ4enEwenV6VTlDRXhSUTQ4d3dG?=
 =?utf-8?B?cGVwSEtCb0dvVXIvVmhmanBJWXBER2hVS1d5Z00zcG5YUzZrMmFTV3VMUWp4?=
 =?utf-8?B?T1dRT0l1UThlbkZucjkwTFNtaHVDNVhGUUNDWldRSml6V0hoNmkvYWYyb0Ry?=
 =?utf-8?B?NXNad3F3dTBLZzRyeWJzMFM2cm51eGZDdzRzSFMxSmp3MG9pNFQvdnF5eEgz?=
 =?utf-8?B?TGcxeFJtTDV3VkxLTFFQOFlsMG9lTUZ5eG1pUzc1V0ljSkI3cVA0NVp6SVVi?=
 =?utf-8?B?SXY4QXNGOXl3dFB0d3BaN2VFSVp0VkluR1NjNTZRUXMxVDZEY2NBYnIyaFpO?=
 =?utf-8?B?SHR0SWxnbFhXU1VtNld5RjJ6cWtMSkthdmZ5T2g1SEpJbzR1OGNRa0k3THRX?=
 =?utf-8?B?eEF0L3hIclpjdGlzTE5PeHdKaDlPUGhBQ1ArTDdTUXNwekxudlllY2tjbEhh?=
 =?utf-8?B?cTFheFQ1NE10ZS9qMU45ekg3WmR4WEpZSUZhOURoQnkzalZTNXBNK09KYkhw?=
 =?utf-8?B?dmRIZ2g4SmxkT3VEZW8zMEFqUkxyNjd2ZUdqc2RVSnVRMHFrNUNnWTUzdnd4?=
 =?utf-8?B?V1pMYWsrUmhkUnFsek4xZVlpKy8rTVBUTFgzdU53cDZRMWpVemFpd1RQRGN1?=
 =?utf-8?B?cUF3eVp5NVU5cTQ3S09GNXdEL2J1R0daeGlBbVJucVdEODF4RTZ6aTBWNVRY?=
 =?utf-8?B?MDVtcXh2cDdlRE9qQ0hvTGpQVG1OQmdvR0JMaXJxNFRMb0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elg5cWpneHRleU9sTmhSdWtZdWhwd3gzVEd6ZXFaTEVQZFdZb3FWaUtISkls?=
 =?utf-8?B?dDZJR1dIejMxUEJZdERlZlJ6bGZDWEtITHJjVzlMMVVqcm5iMnFTQ0VtMXpX?=
 =?utf-8?B?d05jWEtIY3dseWRrc0RURVhKOFc0YkU0Z1FXSGJoeU80bm9XZER0K1JFL2g1?=
 =?utf-8?B?Tkx5cWllcHlVL3VtajhuaGdjdFpCblpJUFU2NFh4aVcrV1Uwcm1BNW04VXEx?=
 =?utf-8?B?TncrczJ5clNyWVByTk1GYm9yQzZ1WDQ1N2dqRHN2T2NwY2JqeEtkNjJGTVNa?=
 =?utf-8?B?cDB0NU9BYzlZQ0pMc2ZSTDlaZjFadEtKU2hMeFc5aHYvRG83ZnlzZlNyN1B1?=
 =?utf-8?B?WnV2anp3azV3dWJEVXUzbXdoaFZVMEM0WDhrbTdkZlhIdXRaa0lDbWQ5V2FZ?=
 =?utf-8?B?ckZqMThUejVpUVdqMUI0bmNZbG43akRaQjVNOGpodE1YeTF0M28xaU1ZcEFC?=
 =?utf-8?B?VDhGc2NXcTlYOHp3VGRxbW1wMzhWYXd5bjJoSmJtWWpZUlZ6UkgrT1QvM0pR?=
 =?utf-8?B?OC9GYzdSenFxUWVvZnZqa0JpMFp0U2JINnQ2WS9LQkNZR2FpM3FCcWhPMDhI?=
 =?utf-8?B?UHlGdTA4U0YrS2Vkc0FJb2tPWE1jelVUWWRUOWNUSzl1cHoyUm5oeGhGRHJs?=
 =?utf-8?B?T2ZkN2w4TFU2NlRmRGJtWUFoM3NmamRvOG1qSUE1ck5wdGJKVkR0U2tKaTFt?=
 =?utf-8?B?eWRvc3oxMlkxTDJNYkFHUGw2T1haV0tJQVBIK1ZkQVZJa1J5a2dCeE5QV3dz?=
 =?utf-8?B?QVovblhQSmNDL2tEeGRnSlBUZ3BSRDVQVjhHM2tYZG05UmF0RTV4OGVxVnFk?=
 =?utf-8?B?blUrRFR0VWZpajBTblRpZUNiaEk3WE01bVllYy80MTh0b0p6T21CbjR2bkFJ?=
 =?utf-8?B?aE1SWC9xUlFGTlFpcW0rTU5aRGhtTEExZTdOeGNLT2pzdnZHdTlFaitXMEJr?=
 =?utf-8?B?N2Q4ajhKN0tIZGhjWFlVUk8wR3RmeXFhd05acTlFd0lJU29UOUJ0R3ZmTWor?=
 =?utf-8?B?ekRKN21jT0V5V25VenAxeFBoYmFBMUIxMUdBUnFKd1NRQms5OHpaTmswek52?=
 =?utf-8?B?QllsbzQzMUVsZlByOGVMek9SenNJYld6MWtKSjlhcXQ3RnI0dzk0bjQzT3lL?=
 =?utf-8?B?bDRCUkJWVmlpbGRZYitYVDM5R0tnNUQ1OEpIS05sQi9Ga2RWNUtTYjJKV1Qx?=
 =?utf-8?B?U250a24zZFlyMVFaVTNOS1hFbStXeFJldTBaZER1b3hDZGFwWVE4b25yNnJM?=
 =?utf-8?B?bVgveUxPRUIrT1c2QktoU3ZWUFd3M0NBc3pwYkwwMFNUUGhQVnhJT04vUEdR?=
 =?utf-8?B?bStqdDhUNGNxa0VCamZFQ1d2Y2VoR0g2QkVhcis3cEhkckYzR3Q4bW81a1lu?=
 =?utf-8?B?V1B5RWJEa2ZpOVVVQ242cWdTdGY4T1NyZDRhbG9QeFoyNTZhcE9NZEF3Rk9h?=
 =?utf-8?B?eDNLc3lJUmlxYzNtazJKeWZYK2dNRGhQZGMrSGpPVjhJbnBxUzhEY3J3dkww?=
 =?utf-8?B?YUxRMTUzRDFEUXZRTFF2RElNUDBSTG1GL3hnQVo0bXJKMW9zeWNqVVFhL2Er?=
 =?utf-8?B?TkpkcW1IZy9Md1RmTFlzb3N6Q1BsQm1KeUtyMDZtVjdnZXNzNXRmUHRTdjlz?=
 =?utf-8?B?MnZxbVNGaEZOUG50enJ6VWhnQTF5QlRNZlA4eitrbkhNS2VKNUo3WldWQjJQ?=
 =?utf-8?B?KzQxZWlybHNBVTluRFpDbHQ2azhCZ3dZK2tjL1pwRWM1THV6K2NxOUZKS0Y4?=
 =?utf-8?B?YzRkVjJpR1Z1VTJscEZZbUtGMTFXU3dLTzBDZ1o5L2plbzA4S1VuaUVaL1Rp?=
 =?utf-8?B?alZvWlVTbkJOdmlPM29TNVA4b29vYy9CUXBJTHY5bWpOVVVVQzlNTnFVQmRu?=
 =?utf-8?B?UDAwS0RBUkJSdzljc2FDMmNOTGFpRXhiQnIxbnNFdzZ4dW0zY0cwTFBzU0pG?=
 =?utf-8?B?OTZTRXNWd0RrUkMzeHNmR01ycnhsNjRSR2ZaMG9oU2h4NjhoTk5kb3c5MCtx?=
 =?utf-8?B?bU05RUFCLzgxd0Z2dFBSRTROZjFjQzJldlZtRDNaaUM2ODVGYkZyMHRmR1ZV?=
 =?utf-8?B?TGd1ZmdWR1cyempEMmQ2TE9pZVpYdVJpMzZ2dm5sVTB5M1A2TmdPa3JZUUc0?=
 =?utf-8?Q?SY2ZoqbR8Bp3sYnb0c60NR5aW?=
Content-ID: <6D8EA860EAEA9F4FA74E795FA7191BD5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288c9135-c106-4984-4f09-08dd0ddd8e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 05:45:37.9022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZtWIRyqxAOwnKw7C4MlqQFRZcAOaoOAladtLWizP/2NXtT03TJ5gLAyNYFx9o+trtQegJu5s5eDrCU7E2rP1dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8602
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.679300-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/sNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCrfUboIp1QbVBfVY7O+c8KYHgh3sKJBzP0dmDSBYfnJR39l
 SYY/1iRtDdoDFICLaZusvuz7LvPblJS12kaJxXhED2WXLXdz+Ae3+iQEtoSj42viB/Jr4D1Tt8r
 FozbGqQE/vIztt9VZYkZOl7WKIImrS77Co4bNJXQ9ejiC/BQPd+gD2vYtOFhgqtq5d3cxkNQ18G
 AoWAE2v1KMIwLkId6FXglNXAYkwvfqvA+MpPY1cgYoPwQxIIcE=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.679300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B4B20F178623B82FC9F780F053C3C9A2C792BE3C06F301D6C88D4ECE4A8B149F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1861833752.1575560489"
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

--__=_Part_Boundary_004_1861833752.1575560489
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ0ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIHN1cHBvcnQgZm9yIG5ld2VyIERQSSBpbnN0YW5jZXMgd2hpY2gNCj4gZG8gc3Vw
cG9ydCBkaXJlY3QtcGluIGJ1dCBkbyBub3QgaGF2ZSBhbnkgSF9GUkVfQ09OIHJlZ2lzdGVyLA0K
PiBsaWtlIHRoZSBvbmUgZm91bmQgaW4gTVQ4MTk1IGFuZCBNVDgxODgsIGFkZCBhIGJyYW5jaCB0
byBjaGVjaw0KPiBpZiB0aGUgcmVnX2hfZnJlX2NvbiB2YXJpYWJsZSB3YXMgZGVjbGFyZWQgaW4g
dGhlIG10a19kcGlfY29uZg0KPiBzdHJ1Y3R1cmUgZm9yIHRoZSBwcm9iZWQgU29DIERQSSB2ZXJz
aW9uLg0KPiANCj4gQXMgYSBub3RlLCB0aGlzIGlzIHVzZWZ1bCBzcGVjaWZpY2FsbHkgb25seSBm
b3IgY2FzZXMgaW4gd2hpY2gNCj4gdGhlIHN1cHBvcnRfZGlyZWN0X3BpbiB2YXJpYWJsZSBpcyB0
cnVlLCBzbyBtdDgxOTUtZHBpbnRmIGlzDQo+IG5vdCBhZmZlY3RlZCBieSBhbnkgaXNzdWUuDQoN
ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMgfCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IGluZGV4
IDM3OGI0OWI2YmRmYi4uNzk5MjNkMWJmYmM5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMNCj4gQEAgLTQzMCwxMiArNDMwLDEzIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfY29u
ZmlnX3N3YXBfaW5wdXQoc3RydWN0IG10a19kcGkgKmRwaSwgYm9vbCBlbmFibGUpDQo+IA0KPiAg
c3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfMm5faF9mcmUoc3RydWN0IG10a19kcGkgKmRwaSkN
Cj4gIHsNCj4gLSAgICAgICBtdGtfZHBpX21hc2soZHBpLCBkcGktPmNvbmYtPnJlZ19oX2ZyZV9j
b24sIEhfRlJFXzJOLCBIX0ZSRV8yTik7DQo+ICsgICAgICAgaWYgKGRwaS0+Y29uZi0+cmVnX2hf
ZnJlX2NvbikNCj4gKyAgICAgICAgICAgICAgIG10a19kcGlfbWFzayhkcGksIGRwaS0+Y29uZi0+
cmVnX2hfZnJlX2NvbiwgSF9GUkVfMk4sIEhfRlJFXzJOKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMg
dm9pZCBtdGtfZHBpX2NvbmZpZ19kaXNhYmxlX2VkZ2Uoc3RydWN0IG10a19kcGkgKmRwaSkNCj4g
IHsNCj4gLSAgICAgICBpZiAoZHBpLT5jb25mLT5lZGdlX3NlbF9lbikNCj4gKyAgICAgICBpZiAo
ZHBpLT5jb25mLT5lZGdlX3NlbF9lbiAmJiBkcGktPmNvbmYtPnJlZ19oX2ZyZV9jb24pDQo+ICAg
ICAgICAgICAgICAgICBtdGtfZHBpX21hc2soZHBpLCBkcGktPmNvbmYtPnJlZ19oX2ZyZV9jb24s
IDAsIEVER0VfU0VMX0VOKTsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNDcuMA0KPiANCg==

--__=_Part_Boundary_004_1861833752.1575560489
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDQmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjtzdXBwb3J0JiMzMjtmb3ImIzMyO25ld2VyJiMzMjtEUEkm
IzMyO2luc3RhbmNlcyYjMzI7d2hpY2gNCiZndDsmIzMyO2RvJiMzMjtzdXBwb3J0JiMzMjtkaXJl
Y3QtcGluJiMzMjtidXQmIzMyO2RvJiMzMjtub3QmIzMyO2hhdmUmIzMyO2FueSYjMzI7SF9GUkVf
Q09OJiMzMjtyZWdpc3RlciwNCiZndDsmIzMyO2xpa2UmIzMyO3RoZSYjMzI7b25lJiMzMjtmb3Vu
ZCYjMzI7aW4mIzMyO01UODE5NSYjMzI7YW5kJiMzMjtNVDgxODgsJiMzMjthZGQmIzMyO2EmIzMy
O2JyYW5jaCYjMzI7dG8mIzMyO2NoZWNrDQomZ3Q7JiMzMjtpZiYjMzI7dGhlJiMzMjtyZWdfaF9m
cmVfY29uJiMzMjt2YXJpYWJsZSYjMzI7d2FzJiMzMjtkZWNsYXJlZCYjMzI7aW4mIzMyO3RoZSYj
MzI7bXRrX2RwaV9jb25mDQomZ3Q7JiMzMjtzdHJ1Y3R1cmUmIzMyO2ZvciYjMzI7dGhlJiMzMjtw
cm9iZWQmIzMyO1NvQyYjMzI7RFBJJiMzMjt2ZXJzaW9uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtB
cyYjMzI7YSYjMzI7bm90ZSwmIzMyO3RoaXMmIzMyO2lzJiMzMjt1c2VmdWwmIzMyO3NwZWNpZmlj
YWxseSYjMzI7b25seSYjMzI7Zm9yJiMzMjtjYXNlcyYjMzI7aW4mIzMyO3doaWNoDQomZ3Q7JiMz
Mjt0aGUmIzMyO3N1cHBvcnRfZGlyZWN0X3BpbiYjMzI7dmFyaWFibGUmIzMyO2lzJiMzMjt0cnVl
LCYjMzI7c28mIzMyO210ODE5NS1kcGludGYmIzMyO2lzDQomZ3Q7JiMzMjtub3QmIzMyO2FmZmVj
dGVkJiMzMjtieSYjMzI7YW55JiMzMjtpc3N1ZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7
SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7
U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMy
OyZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMz
MjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYj
MzI7fCYjMzI7NSYjMzI7KysrLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdl
ZCwmIzMyOzMmIzMyO2luc2VydGlvbnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsm
IzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQom
Z3Q7JiMzMjtpbmRleCYjMzI7Mzc4YjQ5YjZiZGZiLi43OTkyM2QxYmZiYzkmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7
JiMzMjtAQCYjMzI7LTQzMCwxMiYjMzI7KzQzMCwxMyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9p
ZCYjMzI7bXRrX2RwaV9jb25maWdfc3dhcF9pbnB1dChzdHJ1Y3QmIzMyO210a19kcGkmIzMyOypk
cGksJiMzMjtib29sJiMzMjtlbmFibGUpDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGlj
JiMzMjt2b2lkJiMzMjttdGtfZHBpX2NvbmZpZ18ybl9oX2ZyZShzdHJ1Y3QmIzMyO210a19kcGkm
IzMyOypkcGkpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO210a19kcGlfbWFzayhkcGksJiMzMjtkcGktJmd0O2NvbmYtJmd0O3Jl
Z19oX2ZyZV9jb24sJiMzMjtIX0ZSRV8yTiwmIzMyO0hfRlJFXzJOKTsNCiZndDsmIzMyOysmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsoZHBpLSZndDtjb25mLSZndDty
ZWdfaF9mcmVfY29uKQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfbWFzayhk
cGksJiMzMjtkcGktJmd0O2NvbmYtJmd0O3JlZ19oX2ZyZV9jb24sJiMzMjtIX0ZSRV8yTiwmIzMy
O0hfRlJFXzJOKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0
YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RwaV9jb25maWdfZGlzYWJsZV9lZGdlKHN0cnVjdCYjMzI7
bXRrX2RwaSYjMzI7KmRwaSkNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7LSYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhkcGktJmd0O2NvbmYtJmd0O2VkZ2Vfc2Vs
X2VuKQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMy
OyhkcGktJmd0O2NvbmYtJmd0O2VkZ2Vfc2VsX2VuJiMzMjsmYW1wOyZhbXA7JiMzMjtkcGktJmd0
O2NvbmYtJmd0O3JlZ19oX2ZyZV9jb24pDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O210a19kcGlfbWFzayhkcGksJiMzMjtkcGktJmd0O2NvbmYtJmd0O3JlZ19oX2ZyZV9jb24sJiMz
MjswLCYjMzI7RURHRV9TRUxfRU4pOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsNCiZndDsm
IzMyOy0tDQomZ3Q7JiMzMjsyLjQ3LjANCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_1861833752.1575560489--

