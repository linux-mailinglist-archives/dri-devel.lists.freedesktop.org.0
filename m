Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749659034ED
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 10:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B455910E568;
	Tue, 11 Jun 2024 08:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="k/9pWVds";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rD4/h3lF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9A410E568
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:10:18 +0000 (UTC)
X-UUID: 073d23e227ca11efa54bbfbb386b949c-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/tkLkahNPnNxKkDvrDT82xrTkOp6Hf71e+m6oncKCec=; 
 b=k/9pWVds4Om7cWroL++So5Rxrn+df98vX0FukxzLULDTiDWcXLrh3PgG3PHi+afCi3YdrCjclbUY8ovf8B3E4m4RRIL2y4lJ45cYjf/aHSKbXCJaLMPZoocSyBJU9N998VQorQzEzMuuqm8YmAt+qH4faMJgVCIJa/0vlV4d+Wk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:f810eb62-d975-4e85-919e-db476c5d5c2d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:53317288-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 073d23e227ca11efa54bbfbb386b949c-20240611
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1697885189; Tue, 11 Jun 2024 16:10:13 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 16:10:11 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jun 2024 16:10:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrN28ErmbBDOjGQRjHRepu4JVSFAef1Ed4Kkxdggd9d12i/KWl8WYXiw4w3qeoGjqW/9iuqNyFJC+Tkfus2qL8qq61kBzRGhLVnNNiEoBMx/Lsl2S8YAFw955GGcm8pN3hf59AWvx/eLk0s77RQyEh5S6R02ygdUDtjr3VJ0lDPHMfpp0BE1yurvednJP7hyb1Eklo0Uvn36XdlY8OApZ/d3Ag1MjkLSxg1zrBXcekbGkprE2slI1RsyeDUj40EAL6dqRMT3mWMsbZqXzXT9iV3gDgcvha2nEaU4K5c3OMv9QmfAv5R//tceppPr6dhbjzcDfFKthI0qkvVfGLBk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oayYdQy9HTaOMuG3Umc96C5y7CJVlZPu+PdlaCkF4uA=;
 b=Y8rsmyp7I1WY4Eeym/4U5m9hpiDQ584qi4iYFz8VVAQQouL69bd8Occ9pRnfgGKxvySf1RFnXevGsNlf7uG+bG1hNIsaFWuxdWCRfVPktWhRxa0Qbh6WvDbDPSdqdLGw0RpuRXHkHYMknzX20/k8FwIvPYBP4d9x6+qKVoFK4cd3SDWwNBIpV7YabUr2hMxQA2caAz45gEtIDw+EYqkwdEz++MR6V4sdBUeP++eUKZGJR+J9D0W3ZIu9s/39X9TEyDBzPiggSiVEs0Lbv8qOqHNKmv1ApCxmxXFyB/1o8HtRldC8GEfQmWLqvNM5QvB2SjXbqjhjce+SpRwRmQx+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oayYdQy9HTaOMuG3Umc96C5y7CJVlZPu+PdlaCkF4uA=;
 b=rD4/h3lFaGBSNQjWr8mqBQpgMEY2ntHsY9z8q/BUIbYb0tEv6Ir3pDLgaNQOLfPoT6eQj6QgZXBNb01CLP0cB7DdgWQTU5dTdMbhgrW3CYX5LfvQRlcv7/f9ba4/muu+ESw/86CSmXiHNO+vSfS3uB4ydENBOus8ZIMO8l8nACI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7331.apcprd03.prod.outlook.com (2603:1096:400:412::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17; Tue, 11 Jun
 2024 08:10:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.014; Tue, 11 Jun 2024
 08:10:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 08/16] drm/mediatek: Support RGBA8888 and RGBX8888 in
 OVL on MT8195
Thread-Topic: [PATCH v8 08/16] drm/mediatek: Support RGBA8888 and RGBX8888 in
 OVL on MT8195
Thread-Index: AQHat/O/H0LpcxS9O0CpWiyDO5MGV7HCPaQA
Date: Tue, 11 Jun 2024 08:10:09 +0000
Message-ID: <32f449f826a5e48c8acdc3ee8c1bab7864b86d2d.camel@mediatek.com>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-9-shawn.sung@mediatek.com>
In-Reply-To: <20240606092635.27981-9-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7331:EE_
x-ms-office365-filtering-correlation-id: ff9a6d7a-c8a3-4728-2122-08dc89ede921
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|366007|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?VzJ4clVNd01NZWlHYUllT1BJTXRDaFhOUWZYOVZiNXVEcUxyaVFwd3RBQ1Za?=
 =?utf-8?B?TFZITXU3VVN1aGt6MUVRNDVrMzY2UzVYUFlsQUl5UDkvQVNLQ09EQ2gvbDBY?=
 =?utf-8?B?Z0R4WHlWcXNlT0ZHOFplRnBHeHpLbUVXR0djWHF4b1V5Q05tT0o4WDk1eHlX?=
 =?utf-8?B?RDVtNjl2eXltYmxtQllQazhJajdGc09IUFNWMXJMbFBmcmYwQmloaCt1cWlQ?=
 =?utf-8?B?ZFFsZUV6cVk2K3B0aU5zN2UvZ1pLMUo0UCtsMzhtUDlUMU1zaC8wS2JmbTIw?=
 =?utf-8?B?UWNzSmxaV0g5OWUyL3pVOEdkQzRET01TSzBFeXV3Z1hYWm9oTzhUT3k4c1B5?=
 =?utf-8?B?SnF4eGZEdjJDRU5PcGZGK1RjOUVTd2E1MW9MdHhDcnRoa1p4VnpkSEhxK09w?=
 =?utf-8?B?UlN6MEN5VGpmb3kvTnpvTE1vMERDZDVkY3RWV2tjZ3NQYU1md3F2U2pDRGZk?=
 =?utf-8?B?TzdqaDJDRXBZTHprNkdlWmV3eVRXZ2lWcTNFR1FzUU4yaVRQdkpHWDV3MEJO?=
 =?utf-8?B?REJSTzk0Y1lSQjMwS2NDK2hOWm5TMExISFFaRE9SL25USVdBQ0FmMDVyS3Y4?=
 =?utf-8?B?b1RlVVdhcDRPbmNhWUlQZzdKY2Vla0VsbUMzZnQySUF4a3h6SW1CZVlUa2JB?=
 =?utf-8?B?azZCZC90em5yaUFJQUp6cnJ1Y0plOW1Ja3M0SWFkNnNLK0RHVldObGhFd1hp?=
 =?utf-8?B?dTBtZ1pPaFdNNXlyV2tsTEx6OVFpcVFzT0ZMUFZGN1RrRXhtMURmbkdMV0Nm?=
 =?utf-8?B?M0h5NWt2VnFKWDhvRlJvRFZHMkRMRUV5SjhudUF5elRQcjljOVNybzBIdHdu?=
 =?utf-8?B?NWNSM3l3TzNTdFhtOHpJUlNKdmhzNFVNM3ZYNFc5Q0N1WjhtNWk0Vkp5NTQ0?=
 =?utf-8?B?MzMvbExLZ0VlQXZPd0ROZDE2YVh1TUFhdWtMb3RldENhOEJ4UnV2L3pPd1hS?=
 =?utf-8?B?U1FMWnFjQ2RORHYvd0lDd00xS0xmcUN5VXdkK2NSNldkWHk3TU10SUQ4L01Z?=
 =?utf-8?B?Z0dycXE1V0NqUlBrWlpkazlZaEpGTkYxV1NyRWdDNzVDWE02SHJvNmpXbGhM?=
 =?utf-8?B?WEpqS1luVjlZY3Vmd2tmWi9uSFVQQjhKemdYWXJOT0U2K1U2TXVUK25xVE9C?=
 =?utf-8?B?bVorTVJ6aVo0Mm1sL2RNMzhET3FSRCtxZWNSV1h5OWxmL0ZabFJQOU5PQktq?=
 =?utf-8?B?bVprK2V4NXczUkxtNEdiUExJMlRQR2huQXRmS2NCYnBUc3I5T1kwNzk3M2U0?=
 =?utf-8?B?akJLMWQ5MzFIeXVVK2VndEN2QWx4akkvUDl0dEpaQ1l0VUo1Mnp5bThwYnFv?=
 =?utf-8?B?M1A1TDRRb0h1M3FmMFRoeUhZdFFhSUd5WSs3Q1R3SllVL0ZFcEVPZUllTkVQ?=
 =?utf-8?B?YUd5VEk5dFdzL2ViZHRVVFZtMldZMnZwMTVYU3FPRFJMYzhWSnZTN3IrUkNp?=
 =?utf-8?B?ajBBdFo5bzhXd3FqZDBLeGh4bG56ZWhlZGZiUEJYZnh6MDNlMzArQTk4UjNJ?=
 =?utf-8?B?M2tZSytJbUF3VWtTUUI5c0F2cWl5cXpLUjlsbTlKak1rWHMyUC9JUnE0SnRV?=
 =?utf-8?B?dU43VDluRHpWVmFWYkw4TTA0bE01NXVNSmJMcFhTRHZwWTR0UEdtWDFuaDFV?=
 =?utf-8?B?Y09weURYMi9TZFEza1lUOFhJRUN4OTlMNDQwRUZzclVXTnN0dHpsK3hvbmxk?=
 =?utf-8?B?bFlPTE8yQjVxMklaYk13TXg5RWRmeGxlT29sSWpRdkQxcFZzSklrRFpRL2xG?=
 =?utf-8?B?QWMrMjBnbUNUTW82TWNHS0tPd1F0TGhDZW9jNU9hNDY4YTNtRm9oeXRMM1dx?=
 =?utf-8?Q?4AZkVEVMh9UGpSo/G4hvuQwCs1lPLbllIXbhs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnVRbWFWLzM2OWFDMkZVYmJWR1RXejVIaDMwbDhaV1lFcWhzUE1OZlBqVGU0?=
 =?utf-8?B?a2M3QlRYM1ROOER2VTBsWVI5L0lJbUNGSElaS1RsWDJRNjJ1a0hFRGhlaCty?=
 =?utf-8?B?cnFsdzZpZVJMeUJsbXpscTNpZEdndm1PMGp1d3hJUmtSVElEQkJNRGsyMHVM?=
 =?utf-8?B?UC9kN2VTQjVYU3UxaTZzbFM2a0J3MWQ5djkzUjlMN29GZVppdEdJYWdDa2J4?=
 =?utf-8?B?elE0T0Y1Y0Rld2FWdTB6T2dXcktNV2VTUEg3ZElJa1BuMjRTbGJ2TWxMMFFS?=
 =?utf-8?B?azIyS2tkZ29kT3BGd3RjUFVVVk1zVXVSU3F4NkFQUDluUlBLUHBDbDBydGxy?=
 =?utf-8?B?MGVjR1V4ZDV6RkZwdHQ2YWw5QWhzZlBjQWJ6dXh0dFdqYnpJYithUUFWUDdT?=
 =?utf-8?B?aXh0T2Q5cVZSMUo2R2NabTN0ZDlkTHFWM2JqNCt4Y2VOS1BENDhveitBakFO?=
 =?utf-8?B?dENsTUJhVytQWG1Tdk5nVlNTeVlsbFExZE14WGxtRGV2TDVTbjFsQVh4UC9p?=
 =?utf-8?B?bjByL1ozV2U5NTFIc2xuR0ZVVmZNa24yTlBudVovTm1qNmQ4c0pIK29PTGdH?=
 =?utf-8?B?ck41VEp1OWNuYzIwYnJqRnhiUDhGT0hwU0o1akJSdVJCMXVTR05jQURJWTdS?=
 =?utf-8?B?WDcreXpzN2RTa3dSOWkrQWJaak5OdmNhQlZwWGN5aUxtdlJ3a2lhaXpHWERq?=
 =?utf-8?B?OGtWMFhsdzR1aDgvZStuUkJ2UDBUQzN3RTN2U2pNdzdGRTdRSVQzdHV3Q01n?=
 =?utf-8?B?SzMxZ0VsSWFMT1N6d3lvMUFnV2QvNHFwNFByQzh2VFJqWkYwYnlhamFETjZ1?=
 =?utf-8?B?b0U4eUJTMlZIbjVUYWJxcFZrVjRpZlpLcE9kbVdpa0swTEdUb3BZK3hweWdE?=
 =?utf-8?B?OTFTNVhZY0QvbTJydUo5cmhTQzVoOU1Samh1U2RMaVdzWmlaRFo4U2NLMzZ0?=
 =?utf-8?B?SFNSYy85MlZjL09tT2tONk82ZzhuS29jQlMrWkxsRFJTcUdxZTA1dngvaDJB?=
 =?utf-8?B?L1hjMCtPWHNPTVU1dVF5bDFoVGJzR25vamR6OE9CeXF4RWpFMnZma2tZbHNm?=
 =?utf-8?B?MkEySlcxTHpXNXh2ZFl0dDk5MWhUMHptaWRuZzJGeGNoa1p2SC9LbWNOYVh2?=
 =?utf-8?B?bFc1UnNCcmYzMjE1bGpnZ3RDZWJ6ZVZldzdCa3VaQ0hSNEphQ3c1QVNmSUhZ?=
 =?utf-8?B?NTZNZ1BUd2VLcXhGbC9UeVdPRWZLMG8rOVlHTUJkVHZablhPSUdwRHArRVMv?=
 =?utf-8?B?WGJFMmpCbEQ3YTZ2cVVPREFHeXp3djdDUzhqU3ZjQi9RMXNOcVFUK0psdVk4?=
 =?utf-8?B?OWhxd2RKMUV2NjBiWld3NE1LQ1k4NXBuWXVmMUh4WTF0WTNDSnNwNVRoSlkz?=
 =?utf-8?B?TzBPOTFJNlc4cnlXT2hGUldqT0V0RzYvRVRTZnBLczdBSFVud1ZuNFdiYWVo?=
 =?utf-8?B?WlZFQWdCSVc3c0R1aWd0YlAwZnBUQm85emhYUnVnS2V1SHZ4V3dQV1Y5cWtz?=
 =?utf-8?B?ZVZDem9WaHp4cElRdDVFUWg0VDdyTVlnTFQ4WGhnRFhQanhYVjBqaHdOTm5R?=
 =?utf-8?B?aDRDY3Y4UFZ4VjNSS2RWNEQ0UXo2Z1RrNHduMTBhVE13YnZ4ZzhGdWJBZm52?=
 =?utf-8?B?ZW4xSHc0N2lKWVhsVzVkeXpHOWtMZ1VTaHVHQVI5S21OLzRvS0JHb2VFYzdI?=
 =?utf-8?B?QXVCc2R4a1R5OGN4VStiUzVLeWVhT1BhQTJsTmxYSUdWbWpLNlg4cGtpdVZR?=
 =?utf-8?B?Q0dPNEtCTlJBdEJ3NjI4em1sV3NZMkpKOVlXQjdNeGlxeWRJR3J0Z3IwOFYx?=
 =?utf-8?B?RE15eWpmTUdvVk9FRXVScnByR0E2UWxuMXljakV4NlU5VXR3Y24yMzdRWHF1?=
 =?utf-8?B?dnJRT1N5OFB3cnBQUXU3MXY2TW5WQ1Jsck9oR21IQnRIYzFnZ0kvYVNTMllm?=
 =?utf-8?B?MzlMS1ZvOWFqZGJPUHo4OHJwNFI5UWFtYlpUWW50d3MrTW95eW1abkR0bFNw?=
 =?utf-8?B?d3lHejg1QnV5TGwzNlBtR2pONkhUbjMwNS9wU2JsTXBXWVA3WjNFa2ZtWlQ4?=
 =?utf-8?B?cFQ2K3E3d2RqKzRza0FxZFBuV2x3eElwSkxRUDhYODl1cERyLy9oUXNMaHc0?=
 =?utf-8?Q?zTrgCE+MPWve7HUD+tx5JLCg/?=
Content-ID: <7F223FC47ABD7C4DB1681896C1A3CF9F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9a6d7a-c8a3-4728-2122-08dc89ede921
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 08:10:09.0788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PqhigNIFPX2q1el1RwqaewJVOkz6+aMP2BPp790IKUk00XcfUE+38nnabqB7szbDSFgg8LiOI+GSKxK/97hblA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7331
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_2003211493.1516468519"
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

--__=_Part_Boundary_005_2003211493.1516468519
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDYtMDYgYXQgMTc6MjYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCBSR0JBODg4OCBhbmQgUkdCWDg4ODggZm9ybWF0cyBpbiBPVkwg
b24gTVQ4MTk1Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
IHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBpbmRleCBkOTcwY2RjZTA2YmMuLjcz
ODI0NGE2MTY0ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
Yw0KPiBAQCAtMTE0LDYgKzExNCw4IEBAIHN0YXRpYyBjb25zdCB1MzIgbXQ4MTk1X2Zvcm1hdHNb
XSA9IHsNCj4gIAlEUk1fRk9STUFUX1hCR1I4ODg4LA0KPiAgCURSTV9GT1JNQVRfWEJHUjIxMDEw
MTAsDQo+ICAJRFJNX0ZPUk1BVF9BQkdSMjEwMTAxMCwNCj4gKwlEUk1fRk9STUFUX1JHQlg4ODg4
LA0KPiArCURSTV9GT1JNQVRfUkdCQTg4ODgsDQo+ICAJRFJNX0ZPUk1BVF9SR0JYMTAxMDEwMiwN
Cj4gIAlEUk1fRk9STUFUX1JHQkExMDEwMTAyLA0KPiAgCURSTV9GT1JNQVRfUkdCODg4LA0K

--__=_Part_Boundary_005_2003211493.1516468519
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDYtMDYmIzMyO2F0JiMzMjsxNzoyNiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyO1JHQkE4ODg4JiMzMjthbmQmIzMyO1JHQlg4ODg4JiMzMjtmb3JtYXRzJiMz
MjtpbiYjMzI7T1ZMJiMzMjtvbiYjMzI7TVQ4MTk1Lg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMz
MjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hh
d24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jJiMzMjt8JiMzMjsyJiMzMjsrKw0K
Jmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MiYjMzI7aW5zZXJ0aW9u
cygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ZDk3MGNkY2UwNmJjLi43Mzgy
NDRhNjE2NGUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7QEAmIzMyOy0xMTQsNiYjMzI7KzEx
NCw4JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7dTMyJiMzMjttdDgxOTVfZm9ybWF0
c1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO0RSTV9GT1JNQVRfWEJHUjg4ODgsDQomZ3Q7
JiMzMjsmIzMyO0RSTV9GT1JNQVRfWEJHUjIxMDEwMTAsDQomZ3Q7JiMzMjsmIzMyO0RSTV9GT1JN
QVRfQUJHUjIxMDEwMTAsDQomZ3Q7JiMzMjsrRFJNX0ZPUk1BVF9SR0JYODg4OCwNCiZndDsmIzMy
OytEUk1fRk9STUFUX1JHQkE4ODg4LA0KJmd0OyYjMzI7JiMzMjtEUk1fRk9STUFUX1JHQlgxMDEw
MTAyLA0KJmd0OyYjMzI7JiMzMjtEUk1fRk9STUFUX1JHQkExMDEwMTAyLA0KJmd0OyYjMzI7JiMz
MjtEUk1fRk9STUFUX1JHQjg4OCwNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_2003211493.1516468519--

