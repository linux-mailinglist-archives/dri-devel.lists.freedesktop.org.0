Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967289DFB2F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 08:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774FC10E05D;
	Mon,  2 Dec 2024 07:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PBeXiV+H";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cjYeeqfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136B10E07E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 07:28:11 +0000 (UTC)
X-UUID: f7fc2a52b07e11efbd192953cf12861f-20241202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jHViGK8ZvpD9ITY3J5tfMAZRwjdEWaWnjC9ee3hpvFg=; 
 b=PBeXiV+HNoI87NlZEclc+bStDWAca6vF2i7bU7pHb5LFjiasDprK4HDM6+wDGHnvngkz6zuoQ0MSwrJvGwHIJ9NfjPAww2gYbSjIwVgXR/U4/eVPQyzSnfDyxm06ICIT37ShcZOIdt34b2kT/A7eJV8ptk6yuapSRTdoisaj31g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:f36d938f-d56a-4cb4-97d7-3983ea304c8d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:c193d123-634f-4016-85ba-2d63e55c9400,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7fc2a52b07e11efbd192953cf12861f-20241202
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1169130176; Mon, 02 Dec 2024 15:28:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Dec 2024 15:28:03 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Dec 2024 15:28:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pX60+LiFv02DBwQ7FaIUb85rcRu6bkwefCEQW6frpRAqooP388EmKyG5+ol/3I7ei4D6yvYa35xf1bE8BLUNy6h2NAVctGFKNh+D/HYHDUwSokjd0T25/pJGzKOOfI5+u2yzZX33KqOF9SpeloQW7JyxD96KnKH9ByIzcx/n8Tvl1/IBXw26E2cOup5ATpefX4X1Yd7GpuZMcXdyqv4puFhbLvuCQyHffmXbvOjgr1EHsQeRBnw6CKJ8eprHJNi2+7D5VQxYf8r/xTrWbRPNv8Ddw7aPwZEAwdxJzh0vKCVB0jwD2UAmXrjLmy1Y2FFHKU3TJoAvfeBzzPlm1ilezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wQHoBIegDyMXHtFXsj8Iq81EBQOYP/9KKuvSkI8+iw=;
 b=gQhAe5tJ7Ldo2NbP5XLjkaM1z/kYGm3ko4BAcZ5jb5Zv9gfeol2WniIs5lVTYzl48t3PAe5UfFUawnkgpFEdWCId+cS17TE7HvM856Psn82HQAU/ijS1XreJvMGf6lgobe96eYBRKcBcAH583vATPxiui56Lnf7rgDNv3MuOsB9gzHS76AxJBqydsfM1ORjX7OpTCrQIaqhgxcEyi+xG+A50K0I4EVp01m2c5By50/e1EUZhjwX0hc+LH+ZegkGCbHuH2q+n8kBSXEL7ZKH4Sd71YJhxWqPyEtAXvcv7zfly5JPfrPHqqQAriZ6OXMRNrZ0h0UnBuoSYAUiY+MHiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wQHoBIegDyMXHtFXsj8Iq81EBQOYP/9KKuvSkI8+iw=;
 b=cjYeeqfPUFUiByPNL3uOnTSfLa0bNLUyjAgedt9ehfNgqOaALdbzZr7+pALAfP5J1K+IIsxJCFnDMa5HONoWJiY6d8Y76W21qTkLOIwkJppWNu4z67NrTOdqdReJHjWcVoV2gUu9CIS+1CK8gvqrtuNfm5Uv5OF/mlq/xEpK1rA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6757.apcprd03.prod.outlook.com (2603:1096:4:1ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Mon, 2 Dec
 2024 07:27:59 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 07:27:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbO0pF3Zp6UXdpSEmkHbI6wNkmT7LSoNaA
Date: Mon, 2 Dec 2024 07:27:58 +0000
Message-ID: <559ac08df6614e47c3e8d9d8160b35c9e683c503.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6757:EE_
x-ms-office365-filtering-correlation-id: c6d9af49-449c-45fb-a611-08dd12a2d8ae
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y2x1aDNXUDNLcWF2Sk5pYXRubHhycmY4T2RkRjZJODRTdnA1RWxhdklsc21M?=
 =?utf-8?B?RjdpTGk1V2lmTzV1d3VjaVZ4VDVWTmNBdmpKblJIZEVkTTVFMjV1d3JVNlVp?=
 =?utf-8?B?Q2xvOW44dlV0bkdoczM2NjhJK1ZQNUZQMXBSOU53UStTbW9STHZoQW5qdWky?=
 =?utf-8?B?UDBTZmxjN2RHSWNSaGJOalNWTGdCdzhkcCtKMjZSdEFzY2VyREtPMnJCRlE4?=
 =?utf-8?B?UFJRUVNuM2cvNm81OWs2cFRmeXBkbUhaQzNhOXczU1k4TmNpWDdVK2ZFQjRO?=
 =?utf-8?B?K1VPN3F1R0I3ZFI3alVGbXNxRjZha2s1ajl6VmpnYkhuNDdoQXJ2ME1nMi90?=
 =?utf-8?B?ZDNKYlhMcklvNVJ6TVhRalVjTUlNZ2RhTStOSFBQS2RXNndUSjhkRVNPeC9q?=
 =?utf-8?B?dUVsUzZ1N0xmbG5LcFZsSEJhNzBtK0dzdnIwN3FxVHZ0YTVIRllqWFJ5SmFJ?=
 =?utf-8?B?djRFWnVpc3hXTUJlZHRnbkN1OTh1OUpJTXFDWXhzcmNDVnd1bEh0UWNWUkVJ?=
 =?utf-8?B?U0hYQmFhL3MydXlZSFZVcmRYMGlnUjU0c1hSdXFZRkJxYy9WMlNUUjVtU3h5?=
 =?utf-8?B?QzNhN0lrNVova3pvMFN0aUhtRmphMEdrTHIySGJabTkxN0g2aDJ1cEd2TGlG?=
 =?utf-8?B?TGNRR3h0Ylk5M0JQVWdObXJzMW1IL0hmK1VJZ0tQaWpjbDZDbEl2QW5EY1FX?=
 =?utf-8?B?NUxmY0JwcXZudURZSFpJa2dXYzFKVDhPaEQ3V0xzaWFsZmRSeDhEWDEvNzRY?=
 =?utf-8?B?NzZsUEdBbldYbFgrUHUrQVdDQWFqcWQyRVZMZG5uTVhMdVZzQXdFK0FBWXBH?=
 =?utf-8?B?Q1V6dnI2RGlqU3haQ2hlQjVnRWJYdEx0djJzOWFoalVBeWc5NmpucmtDQVJ5?=
 =?utf-8?B?bU1FTzhmVEsyZUs1ZGZUcHhqYkZGRUV1TFd3SkJMYkx2QUtMSHNnbVhmbEVF?=
 =?utf-8?B?cDB1Mkkvckk3cHVvTERJQmhXeCs1YnNCRjVHbk85UzlYZmphOTgxbVlwenpI?=
 =?utf-8?B?VUlEY2JZVjdOWXNhUUk1ZlJWVUVJSFJLcnUweEw3UHlWTi9pSHpVTVYxSm95?=
 =?utf-8?B?Zjk4M0NvZG96bGdRRzhLSkN4V2VIaDVRN2pRSDc4VVFySEJEbmVjWmgyWW5R?=
 =?utf-8?B?NDdOeXBoRzVHblJ4b2xwM3Y0V3crdXpJeUZVWFVVKy9zelJPai9tSU9OUjFE?=
 =?utf-8?B?T3VnNkpFcHR3amloQXFyNThpbm9LdEk1OFhQNzk4Mk5Md3hCRnFwT3NZeUwv?=
 =?utf-8?B?cE9WajVSR1BZRS9VM2tqS3JtQ3dYVkQ1LzR3a2c3UWZPeHBBR1VQejBST2RM?=
 =?utf-8?B?RzJCS2ZoOHRnWXFhbmtFRVVRZGdUZm14WktQQTZzcUNDZ3V2dFBvRldDSFAy?=
 =?utf-8?B?RzFWMFhKUC9kQUxIS0ZEYWlReDhWRGRrSElscDlyY0p4VDRIcnMybERTdmxL?=
 =?utf-8?B?SXVOVmRsMXpOK0dJWDI4RUdxVzlDMW9kYTJvdlplc2dmQlFiRlphbDVYUlBH?=
 =?utf-8?B?RDdVRVQ1dFBFQTlhWE9tejVSOFNHdWRXcmNPdnJzVTRBOUF6WnM5bDZMdGpI?=
 =?utf-8?B?MktNcHZoUHJsZ2pJbzBFdWs2clQ5dFQxTGNJMUxvMk1FMnB5QXpOdjdkQUMz?=
 =?utf-8?B?Y1JtMFI0enNXbllwS29sWXIxTFNyMEZzRDF5OUFuRU1FY1dIaWk2MEV4K21R?=
 =?utf-8?B?YUE5cllPUFdQS3l6ZmtCNlQxSXZacHRselpLN05YNlo3RTQwVVZuVEJJMTlZ?=
 =?utf-8?B?ckVBQ0d5SDdLUHBhMitaaWxkRzFDeWtBenkwS21tT3FvQmVCYnRHVGMvMldk?=
 =?utf-8?B?b1pUZW9uMHdYWHllWTJ3bk4vcVlKa0puNTNvNithV09JTUQwYTY5d1NJaDZo?=
 =?utf-8?B?d0VqT0xBSUxrRUY0SWdKNVNIL2hxWDhFSDhhNGMyY3Z6NGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm56QzNBa2x2dHZkQ01mV0k2ZlJRUlZNaHl3V2VsTG9CSGM0MkFlUkFQK2ww?=
 =?utf-8?B?SGVJaUVkUUZOcmRsdTk5N0IrV3RsaSszd3hTYU1KNDk5TldQSW4rMHNkL3JQ?=
 =?utf-8?B?RnpNL1Uya3BlbDcyYkdHUk9KZXpWU09Pbm9QNnVCak0vWmY1UVNESjFvcXhl?=
 =?utf-8?B?YitOQmtDdENYWUV1NWdCNnhPZzdwYi9OSEl5RU0zNllTQ2RpeEJrd1pWVEZU?=
 =?utf-8?B?emNxMUFmRlczVGl2cURocGtGTjFjRzdleGNkUWV4bXY1NmZ6eW9iNFhscnAx?=
 =?utf-8?B?TTNVWUdYanZKNUlUaTFoR0J2YXRCT3R3S2FMUFZ1OHJ2cmJmdzl2TEY4d3JN?=
 =?utf-8?B?cmhaYVJPdkJ6a1RIbWJyUUFYckRSVGV0aXViYmVYSXo2Z0tlUWh6RFdGTlhI?=
 =?utf-8?B?cm9nMzY1R21lNjZ5aHF4YlBEWmtjdHpHZSt0YTRYNEdYbmRHUllyd0VINHls?=
 =?utf-8?B?Sm5zTFVDd1hSWnNIaWZMdU9NeVUyMUhDYzJmakUvMkV2M0NjUGpCc2MrSGRX?=
 =?utf-8?B?N2NHVVBpNXlPZENSUUF4K3Q2MFlDcFRsUEJzZ1BsZWZOa3ptdGdlMnJMUVlE?=
 =?utf-8?B?a0xia3dIclZLSFdZVXE3aUQvRmovYXJ2Y2xKT3hHakVBak1ER0dLdmFUek9Q?=
 =?utf-8?B?TFZuYlhpMWxWTEZXLzVHTUx3TlFmbzhMblQrSFc0Z1B5cVMzRkNjUy94WWsv?=
 =?utf-8?B?eEZiQWNORjNrNDdLaHF0T0FwMVFmTkxwS3E3YjM0MEw4alpmZHp5aFY3OS9r?=
 =?utf-8?B?MW5ySFhXbDFhU01od3EwZ3VHQVBNdGF6eEJoUDdsem5qTFZheWU1V3lVUjFq?=
 =?utf-8?B?a2lxOXpxRm93K2FHMFpNeGkwN0lBNzdHZ3FJbFA5aVdubjR4bzBZWEFyUE5q?=
 =?utf-8?B?bGFnK3h0bitVdzExbWszRTV6Q3VtZjR3UXFTRE9FdXd2NjNYcnZDanhSdUpH?=
 =?utf-8?B?K3BZMnVUZ0Q2RVJRQkQyd0x1dlFMOUVQOEhxZ0JDa2lUaHVYTERhUU9ObkND?=
 =?utf-8?B?bFNpWE4rdXErVjRxajB4S1dkUExYYlJiUVRnSyt1bE1WVkxKVGROMlpBYzRV?=
 =?utf-8?B?cnZsMzRSR2tPT2VzeDA3cmRrRUcyUHJjNWZ1S2FpZVNjdzluUFVZcUhIcDVV?=
 =?utf-8?B?d1JiY0I0d2R1eVJCQ3c3cDFIZFo3TWRIcExXNHJVdlllem5vQ3lxRmV5aDJ1?=
 =?utf-8?B?bHhYclhhNEZKWDVyYlBlS3RzdFdsem1NSmtPZlA3R0ZBZDN6d2VXZHNZOGF2?=
 =?utf-8?B?SWlkMnlDT3FxeW03ZEE1SloyWFJYRUNJWUFQQ0RzNjYvK3ZNWndlZ2dNUGNx?=
 =?utf-8?B?bHJpbEdMY1IwTW9lRWxLU2VwYlNudTNuaVZSL3lxUW1IWWF2WWZUcWtxM3RT?=
 =?utf-8?B?azZodWQ3M0szSExyZW41WGVZZlVtNi9NOFZmSEtGdldtQnNpOFF6MTArT1Vs?=
 =?utf-8?B?dllKVlkwTWxXK1ZnbkZUNU8vbFNJUnNvdVZUMGYxbFdEK3JUQ0FHV1BIcjc5?=
 =?utf-8?B?U0pPTzhLZmpDaVpJcDd1a0hJbjJRYlZmbG1jTmVxUXV3c0ZBUFVnalp2c1hp?=
 =?utf-8?B?WkVXNHh6TkVTOU9BVkNnZzNFTVkvUzl0ZjFzaGhtUC9UZUIvSzlHN2hzK0tO?=
 =?utf-8?B?aGl2V3lwQnJjMVRzd2cranRRZTR2TDQvUmlma3Y2SXdoNmZuWDNPNnREaHpy?=
 =?utf-8?B?b2ZqTENzcmM3cE9LaVAyQ2Q1dWZ1cWF4S3NmSVRLNVEwakdjWllMTVRKTVpS?=
 =?utf-8?B?OVdHU1pCNUN5WGpUNE80RmtkTkxnMTkyZExNemFCcUpRTkdkSnk3VXlieXlG?=
 =?utf-8?B?NEJmS2hiSUdlKzErZmpZTXY0ajUvR0RZNXp3cW05WVVEalVqZW9IYXBZY2Y0?=
 =?utf-8?B?MmphWGtFd2RPc1c2U0FaTGdRREhySzVGMEljRzhQK3dNN3FMU2pYT1BaUFQ5?=
 =?utf-8?B?WGVrMDFKb0NhZjVlQWt3Y2NmQWJCWElQTlAwU3lkNXJVV0lTb2F1YmVpZm8w?=
 =?utf-8?B?ditWdE12ZUNNaUtlSHRTWjdCOTlkbndSK3N0VUZ0ZjlvOFd6eHpWbDlQRmZa?=
 =?utf-8?B?TXBrR3h4dUhwUDZDZHdadng1Wk90MWRKcHZGYXFUSk90Nm5KUElEaG1KL0Qw?=
 =?utf-8?Q?zQwNzAe4lR1tbKpbKkx0x0Ql1?=
Content-ID: <3BC6A3A7C444D643AA7AF02C9C2D270F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d9af49-449c-45fb-a611-08dd12a2d8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 07:27:58.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKLHXZlov1sh3eKWmXLpS6TzL9VAMb9itZvMi6vuxyG+gxRf4oGhg1k58Z/MQN6mC5ccCWR+fsyriEq0czXxGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6757
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_843431680.1927223487"
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

--__=_Part_Boundary_006_843431680.1927223487
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG5ld2VyIEhETUktVFggKEVuY29kZXIpIHYyIGFuZCBEREMgdjIgSVBzDQo+IGZvdW5kIGlu
IE1lZGlhVGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+
IGluY2x1ZGluZyBzdXBwb3J0IGZvciBkaXNwbGF5IG1vZGVzIHVwIHRvIDRrNjAgYW5kIGZvciBI
RE1JDQo+IEF1ZGlvLCBhcyBwZXIgdGhlIEhETUkgMi4wIHNwZWMuDQo+IA0KPiBIRENQIGFuZCBD
RUMgZnVuY3Rpb25hbGl0aWVzIGFyZSBhbHNvIHN1cHBvcnRlZCBieSB0aGlzIGhhcmR3YXJlLA0K
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGludCBtdGtfaGRt
aV92Ml9lbmFibGUoc3RydWN0IG10a19oZG1pICpoZG1pKQ0KPiArew0KPiArICAgICAgIGludCBy
ZXQ7DQo+ICsNCj4gKyAgICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGhkbWkt
PmRldik7DQoNCldoeSB0dXJuIG9uIHBvd2VyIHdoZW4gYXR0YWNoPw0KU2hvdWxkIGhvdC1wbHVn
IGRldGVjdGlvbiBiZSBhbHdheXMgb24gc28gcG93ZXIgb24gd2hlbiBhdHRhY2g/DQpJZiBzbywg
bWF5YmUgd2UgbmVlZCB0byB1c2UgQ0VDIHRvIGRldGVjdCBob3QtcGx1ZyBiZWNhdXNlIENFQyBo
YXMgbG93ZXIgcG93ZXIgYW5kIEhETUkgcG93ZXIgd291bGQgbm90IGJlIGFsd2F5cyBvbi4NCkFz
IHlvdSBkZXNjcmliZSBwcmV2aW91c2x5LCBDRUMganVzdCBuZWVkIHNvbWUgaGFjayB0byBzdXBw
b3J0IGJvdGggSERNSSBUeCBhbmQgSERNSSBSeC4NClNvIHRoZXJlIGlzIGEgc29mdHdhcmUgc29s
dXRpb24gdG8gdXNlIENFQyB0byBkZXRlY3QgaG90LXBsdWcgaW4gYSBsb3dlciBwb3dlciBtb2Rl
Lg0KQW5kIHYxIHVzZSBDRUMgdG8gZGV0ZWN0IGhvdC1wbHVnLCBzbyBpdCdzIHdvcnRoIHRvIG1h
a2UgdjEgYW5kIHYyIGhhcyB0aGUgc2FtZSBiZWhhdmlvci4NCg0KUmVnYXJkcywNCkNLDQoNCg0K
PiArICAgICAgIGlmIChyZXQpIHsNCj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoaGRtaS0+ZGV2
LCAiQ2Fubm90IHJlc3VtZSBIRE1JXG4iKTsNCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAgICAgbXRrX2hkbWlfdjJfY2xrX2VuYWJsZShoZG1p
KTsNCj4gKyAgICAgICBtdGtfaGRtaV9od19yZXNldChoZG1pKTsNCj4gKyAgICAgICBtdGtfaGRt
aV9zZXRfc3dfaHBkKGhkbWksIHRydWUpOw0KPiArDQo+ICsgICAgICAgcmV0dXJuIDA7DQo+ICt9
DQo+ICsNCg0KPiANCg==

--__=_Part_Boundary_006_843431680.1927223487
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQmIzMy
O2ZvciYjMzI7dGhlJiMzMjtuZXdlciYjMzI7SERNSS1UWCYjMzI7KEVuY29kZXIpJiMzMjt2MiYj
MzI7YW5kJiMzMjtEREMmIzMyO3YyJiMzMjtJUHMNCiZndDsmIzMyO2ZvdW5kJiMzMjtpbiYjMzI7
TWVkaWFUZWsmIzM5O3MmIzMyO01UODE5NSwmIzMyO01UODE4OCYjMzI7U29DJiMzMjthbmQmIzMy
O3RoZWlyJiMzMjt2YXJpYW50cywmIzMyO2FuZA0KJmd0OyYjMzI7aW5jbHVkaW5nJiMzMjtzdXBw
b3J0JiMzMjtmb3ImIzMyO2Rpc3BsYXkmIzMyO21vZGVzJiMzMjt1cCYjMzI7dG8mIzMyOzRrNjAm
IzMyO2FuZCYjMzI7Zm9yJiMzMjtIRE1JDQomZ3Q7JiMzMjtBdWRpbywmIzMyO2FzJiMzMjtwZXIm
IzMyO3RoZSYjMzI7SERNSSYjMzI7Mi4wJiMzMjtzcGVjLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtI
RENQJiMzMjthbmQmIzMyO0NFQyYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjthcmUmIzMyO2Fsc28m
IzMyO3N1cHBvcnRlZCYjMzI7YnkmIzMyO3RoaXMmIzMyO2hhcmR3YXJlLA0KJmd0OyYjMzI7YnV0
JiMzMjthcmUmIzMyO25vdCYjMzI7aW5jbHVkZWQmIzMyO2luJiMzMjt0aGlzJiMzMjtjb21taXQu
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5v
JiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGlj
JiMzMjtpbnQmIzMyO210a19oZG1pX3YyX2VuYWJsZShzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsq
aGRtaSkNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtpbnQmIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7cG1fcnVudGltZV9yZXN1bWVfYW5k
X2dldChoZG1pLSZndDtkZXYpOw0KDQpXaHkmIzMyO3R1cm4mIzMyO29uJiMzMjtwb3dlciYjMzI7
d2hlbiYjMzI7YXR0YWNoJiM2MzsNClNob3VsZCYjMzI7aG90LXBsdWcmIzMyO2RldGVjdGlvbiYj
MzI7YmUmIzMyO2Fsd2F5cyYjMzI7b24mIzMyO3NvJiMzMjtwb3dlciYjMzI7b24mIzMyO3doZW4m
IzMyO2F0dGFjaCYjNjM7DQpJZiYjMzI7c28sJiMzMjttYXliZSYjMzI7d2UmIzMyO25lZWQmIzMy
O3RvJiMzMjt1c2UmIzMyO0NFQyYjMzI7dG8mIzMyO2RldGVjdCYjMzI7aG90LXBsdWcmIzMyO2Jl
Y2F1c2UmIzMyO0NFQyYjMzI7aGFzJiMzMjtsb3dlciYjMzI7cG93ZXImIzMyO2FuZCYjMzI7SERN
SSYjMzI7cG93ZXImIzMyO3dvdWxkJiMzMjtub3QmIzMyO2JlJiMzMjthbHdheXMmIzMyO29uLg0K
QXMmIzMyO3lvdSYjMzI7ZGVzY3JpYmUmIzMyO3ByZXZpb3VzbHksJiMzMjtDRUMmIzMyO2p1c3Qm
IzMyO25lZWQmIzMyO3NvbWUmIzMyO2hhY2smIzMyO3RvJiMzMjtzdXBwb3J0JiMzMjtib3RoJiMz
MjtIRE1JJiMzMjtUeCYjMzI7YW5kJiMzMjtIRE1JJiMzMjtSeC4NClNvJiMzMjt0aGVyZSYjMzI7
aXMmIzMyO2EmIzMyO3NvZnR3YXJlJiMzMjtzb2x1dGlvbiYjMzI7dG8mIzMyO3VzZSYjMzI7Q0VD
JiMzMjt0byYjMzI7ZGV0ZWN0JiMzMjtob3QtcGx1ZyYjMzI7aW4mIzMyO2EmIzMyO2xvd2VyJiMz
Mjtwb3dlciYjMzI7bW9kZS4NCkFuZCYjMzI7djEmIzMyO3VzZSYjMzI7Q0VDJiMzMjt0byYjMzI7
ZGV0ZWN0JiMzMjtob3QtcGx1ZywmIzMyO3NvJiMzMjtpdCYjMzk7cyYjMzI7d29ydGgmIzMyO3Rv
JiMzMjttYWtlJiMzMjt2MSYjMzI7YW5kJiMzMjt2MiYjMzI7aGFzJiMzMjt0aGUmIzMyO3NhbWUm
IzMyO2JlaGF2aW9yLg0KDQpSZWdhcmRzLA0KQ0sNCg0KDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHJldCkmIzMyO3sNCiZndDsmIzMyOysmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtkZXZfZXJyKGhkbWktJmd0O2RldiwmIzMyOyZxdW90O0Nhbm5vdCYjMzI7
cmVzdW1lJiMzMjtIRE1JJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO30NCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO210a19oZG1pX3YyX2Nsa19lbmFibGUoaGRtaSk7DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfaGRtaV9od19yZXNldChoZG1pKTsNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19oZG1pX3NldF9z
d19ocGQoaGRtaSwmIzMyO3RydWUpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7K30NCiZndDsm
IzMyOysNCg0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_843431680.1927223487--

