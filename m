Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B77AEEDFC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 07:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385B510E4ED;
	Tue,  1 Jul 2025 05:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JAb43kap";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LzlZcJgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7CC10E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 05:50:57 +0000 (UTC)
X-UUID: 587b011c563f11f0b33aeb1e7f16c2b6-20250701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Z/KqqYA+D/XEjNtSM3ElznIb+9MtAoIHAoM3ItIiwXY=; 
 b=JAb43kapt5e7hUz/YA5qkRTFD1zTXwfL0V4Y9IwUhTsPyi9t5H7n5xeijbr8C1V/OLgebWysLBMvq4WFEJm/r4wCzbSNLd9MIOeXN5bwVJvyNj0OCeNizm3UGkf/S+rs+59JG/K6zkewDIZ081u01oUmfzDFhTjJsJmjUfHg3V8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:1cca179e-480a-48e0-8136-53d9dc4ac17d, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:572dbf73-15a7-4ae6-ad4b-94c27b45c266,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 587b011c563f11f0b33aeb1e7f16c2b6-20250701
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 954240100; Tue, 01 Jul 2025 13:50:51 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Jul 2025 13:50:48 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 1 Jul 2025 13:50:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgA6X/Yg+tsKw+g71vEv4hXa9/y1dK2ZehKowgfd9DEoB0rcoHDqYq2mkRkhYzVsi6pZZKrs+2kGwZ5V1JgYnPs3kDWnb1/XKkXrcbC8YCKGXUahJ0F8/PkVrT7Tr5OjXI/daUaqY3/IPU8R2hX1syY5yBIUAm1YnasSRAJ6uNs+krujGpbyZGXeQaCN25mJfyhnTSkIjuhabBtZaR6F6YXBLwKzT5MC3UYNy2NwBDshXZfJXZzw+nYXwyrFr35apmmaVmulM6DdsW5NAluwtZMTwLje6hbmVw0pMpHi3gJ8qeDjlMUXRXGGGvshq00SzhMOMy1CMI/4PAaQv3Rh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjdTlZBuiG6bi9aAaWGSubvHfAxrO66KKUxb/uROHeg=;
 b=j16Yn3BTD9RYW/UPsp+KT22xTbA5A6jfg5kXCS8Hz3j60M3Zq/l0EiS3/L+i4fjBrTw4xG4bccGIBrlpNaIa65LuIZmrAC09Qegv7jXayAtHkSbNoxveBCVKbOEubGXGvep7bxo7UH5pKq9a8IAB/yBHt7rc9fl8tUbURGoxo5NPwMGylgj35zbCQiNw8NDc18tk9/g0rV65WvgVYFxJ+2CoBvUZsyMjvuPYhDf4904kyoFL5D10bOIG7H19dL8/0wbErIRU/sQegDkABFTp/lJqCbeBIs0LO8VyqEwa0C///jhr2AMjGKwpziSyLZcZbWJjXYYHPDPEbgkXfnT2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjdTlZBuiG6bi9aAaWGSubvHfAxrO66KKUxb/uROHeg=;
 b=LzlZcJgcFL5SoXdBcOGNHLwD2aE+xrzcr2lPjjV9U6wB+E1CvJEIC1AwrcqOO7EI/7kgFJBYVCZsbe3Y3kpMiO5mvleIvhQ8mcBXdy14iFtsowKOH6rT4VqG6wbLC8r8SohwxPAtfNDkoalXXPH2pKZNbbDMMZmfrXT8gWigLlM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB7069.apcprd03.prod.outlook.com (2603:1096:101:d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 05:50:46 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:50:46 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
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
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
 <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Topic: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Index: AQHb0xtretbpi0s7ZUiTqZa8FSHZUrQW2FcAgAYZnoA=
Date: Tue, 1 Jul 2025 05:50:46 +0000
Message-ID: <23b7cc9681b69946562be50079ece0c6bd6308ff.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
 <20250601173355.1731140-7-jason-jh.lin@mediatek.com>
 <f12d0d954bea2b89d6f316db6b9bbfeea6b4db8e.camel@mediatek.com>
In-Reply-To: <f12d0d954bea2b89d6f316db6b9bbfeea6b4db8e.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB7069:EE_
x-ms-office365-filtering-correlation-id: 6b824ec1-fe81-4aac-f2c7-08ddb86339b3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?L1l2NXBoa3NZUmo3bm4rdXV5aElBbld3ckpOSGxlaHRwMHFHbDNoa3E0OXRY?=
 =?utf-8?B?UFA3SUYxS1N2aU81R2ZHVGJxWWYrc0Y2NGxleXN1UHBmVEcrVlVYMnJ5dUl4?=
 =?utf-8?B?MHZodGdpbWlqbktxYXVNVHlOUmdMQ0dYUjJYKzFmWUwxSjRKcGtwOTJqS2NZ?=
 =?utf-8?B?NDZyQlkrWVJUam9LeXNFaGVmem4zZld0V2orMGRZa21HdkFpMlZDYnEya2Iy?=
 =?utf-8?B?RWRCNjVsak5TU2llZ0M3QjJMZ3Z6OXpwSFE2ZGw2Y1ZzZnNGYTVtWkZXMDVG?=
 =?utf-8?B?M2V2MjR2QzlGZTNaTE1uU0JSQjgzZkxMMlZ5WWhWb20xWEpZOGhaRHdRc29M?=
 =?utf-8?B?QnllSS9OOWpaVmFmR1FmcSszUmtwOURheUlsRlMrNGZ6UkRzdFZuMmVQRktC?=
 =?utf-8?B?eXRKRjIwZUhTRVBBcnBHbGhwQXdwY21OVUZRanZ1b1hYVHF5ektiQWcxTkI0?=
 =?utf-8?B?ZVErUlYyT1pwam9TeG9LbWt2RlQyTEZkVnVPbmdEV3BaRHo3UCt2TFo5NFNE?=
 =?utf-8?B?aVNPRENHUUZTanhFNG9sUmNtVHFXeExONzdzUkFwem9JeHJDdWtPWWN4dUF4?=
 =?utf-8?B?MWUrMTZmMitwcTNkWHBoM3Fob2JPZUdUUVcvNURqR0RIVlp0S1FJQUlBZlJI?=
 =?utf-8?B?UU1kS2lobStpdFk0bjBTM29wbWF1V2JVZThxWE9rQW1ORXFuQzUwTExoTG5p?=
 =?utf-8?B?Vmd2dEQ0S1QzcENVekpVY016VmNoT3JNYzVTQjZUMFFzTmZSSmhubEZsbGU3?=
 =?utf-8?B?SUhuNDhPQjBCQTNoelpRQWtybWhLWFlRVEltNUVKOU9GZ2xVNEZTNWpBeDR3?=
 =?utf-8?B?dVdoZ2FFeWlKclpXT3JaSkc1QVFEU1d6SGNoeW56QlF5aFF6blJDVHJHcitK?=
 =?utf-8?B?a2pIdFZiSWxGM1p1eFJmWlFrK2MzUy9DUGdaWTg4YUVQYnI1ZlZCVEE5SkI0?=
 =?utf-8?B?WjgwMVk1L25uM3hnaEI4WFdvclBVZ21SbzBTK2NZOUJlUUZRN3R1VXkwdTZr?=
 =?utf-8?B?RDN6dGV5Rm1xZzdZOFI3OWtqS201YThKdzN1enpPQ21vbTkxSUx6NSs3ejFJ?=
 =?utf-8?B?WFM4cDBaK2pyeEl2bDdxU1hLc2ZNTFBmR3NlK0UzQ1BlZ1VVVXM3SVNvcDhy?=
 =?utf-8?B?NG9mTjgzS1JhMkdnWEIrT2F3WFF5ekJ1SU90dVVNN0pScUhGaUx1NEYyS2JB?=
 =?utf-8?B?VGZ2cWFZNTRZWmNMWnF0Ky9SdVVHKzhuTytndHl2cE9FL3phQmdBczhPVkZN?=
 =?utf-8?B?V0hwZjBqd1JVUWJ2QWtxbDVHYU9BSjZQcml5MlI3RXBLOXB5WTluL21aZ3hE?=
 =?utf-8?B?WUtyckVqZkdMVkRRSkRsL2RIUDNzQlR1K1g3QnRIcUJ0K3hIalVQdWNpaFlP?=
 =?utf-8?B?TEtISWI2ZTR1anp0bVhxZ0FlWmU1SFlDUmFFU3lFOEVyYk9rS01Lcjh2QUNi?=
 =?utf-8?B?ZVpqMkRLMjZjejM5eDdrcnB2TnV4TUowTGRhZzRiMUd1YVVWOWF5SllsQUpU?=
 =?utf-8?B?R0NyUkpwWWJXR3VneTdORElnUWZNVE5DblM0OVcxOXdqTDFMcFMyMXowNzQ4?=
 =?utf-8?B?TmtiejdXYUk1c21VMlRjOGQ1WG50bytNNXhHQ3V0ZHFyQWFGOXNBR3hIK0JT?=
 =?utf-8?B?b0lNeWJTYSthb3IzUUtjT1ZlUGhIdWJyYkk3MTJ6Vk9KOEFjbVBTTnM5aGt4?=
 =?utf-8?B?YUlOM0FyNGFneVJqVDdaTzVjQXJ4QWpNLzVqQlpnb1ZoWE1YMVZHbFcyck8x?=
 =?utf-8?B?WUtaZzRUY0lrK1V6SjJ0SEJUcGdtcGhJcTROS0dPMlBiU1Vqd0ExY3pEa1Jq?=
 =?utf-8?B?ZVhyTHR4UFZ1QmhhSW5aYkl5Wit2WGZIOXltYU5hL29DNkZQMHdKbVZZUkxu?=
 =?utf-8?B?Wi9NdUtCOXIxNmY3WVptaVg1TkQzRFkxd1FNM2NNQzQ3STNYMFVBNURSMDlt?=
 =?utf-8?B?bTVsNFpnS3hIbUNoV09rYmVIa09mM0pwQzZCN2EzeUlWYnJCdFZISUlHOHg0?=
 =?utf-8?B?SFhVS0JmZFF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDAyeEZnSGFJM043ZXZNV2pIdVdiVWIvQVdxbjdZNnd0d3RpVHMrQXdWb2Jt?=
 =?utf-8?B?Z0IxalgvczN5aDQvS08xZ0Jsb1hZU21wMWJMdFNhOWdyVSsvOEs5OEdTYlV3?=
 =?utf-8?B?Q21NeUh0enBaZlpKZHRnTlFLNWFYSEtFaXVDa3ZlcnVFUVBvdE90Q01wUThP?=
 =?utf-8?B?aW5yL015YTVMQU5Yb0crTXlzelNMMFc2YUJoaFRNK3hYaUdaMEJLZ1Ftc3Fo?=
 =?utf-8?B?NmU0bkJuMmE2TFZGS0FSN0s1c2dxUlRydlVmUGk4UEI5bGFRWXlBSllBZm9V?=
 =?utf-8?B?MUY5Z3l6Nm0zZ0diU2UvMGlGeThPcTRGckY1R0taUlB6VEw1SXZUbEdNalhT?=
 =?utf-8?B?ZjF6SDFlQ2x0bjExeGM1MUdISDdKTVZIZXhlR1dReXpQellmNzJCVzNISDVP?=
 =?utf-8?B?YXFGNk9pTi94Y1BzMWZqbEVoUEtXcng5UHE5THRqSDNlbkpRZnM1d3lpdVJX?=
 =?utf-8?B?cVVrTlY2aVFIRmhmNWxQRk1rY3dGdHJZK3VmdDdrT1RKUjZpdE5kcHdqT001?=
 =?utf-8?B?d1M1S3hwdFVjK1pCUlJBSWJZakpvbTFSK1VORnkwNnNmSzVtYTlNalo1RUJH?=
 =?utf-8?B?Q3R5QWZoQUZ5MTJ4OUJvMmVxUGJkM3Y5czdhSHRxa1NhdjY1cFhRZ0hPbHor?=
 =?utf-8?B?b2ZGcHQ4aGxaY0RZdzlyU0FqMk1GZnJQZ1l2Q21IWEpxVlFpbG9pZkhDYTIr?=
 =?utf-8?B?UFFPU2lXZVhTZ0FxYWo3Ni9TKzdJWkE2ZGhtZ3RxRHJ6WFhRWVlhRmhGcGJJ?=
 =?utf-8?B?VXFueDVHbjg1SjQyd04rcE1hRjVqYWxwMlBqNytzcUZSeWRZWncyN3ZnNXJl?=
 =?utf-8?B?b3lMcEZ4ZEpQQXZ0NDROTlBjb0JwMXU2UHJCRk04Y0xzbXJBc0s2TllIdXpl?=
 =?utf-8?B?WUZpd3ozWUt2eUh4NmVsUlhKOTR4eTl3RC9tZjR6OTNyZEl5dENjYmhidXpV?=
 =?utf-8?B?UHZXRnpUYmY0UkJDeU9ueTdJTUJLOG1RZVhBSVk0aXhabmRiL3J5dlZZMWV0?=
 =?utf-8?B?SXNOeExBbXNGdFpySEFTcis5L2c3Zy9YdnpEU0NoNWRzNnQwdGYrbEJXUnJ6?=
 =?utf-8?B?NE5FNExpNkIrdkVwSmM4TXJIYXVmaCtScHVhc3Y4VTFMbE1pRWtSRUt4SnEr?=
 =?utf-8?B?bEtnWnVZYXpJWW9MRmJpc1d3Q1h3K0RxdklIOXJ0d2hOQkdMY29PWFpwZ0FP?=
 =?utf-8?B?a1RNbEVvSHVLZkVwZWVDZ0hpT1N5Qm4zSHdVQnNaaFZFWjhxMjVPampoUjkw?=
 =?utf-8?B?M1djRWFpWEtKQVNPY1drL0dmd0VrWS9najVJWFB1djdhRDR1ZHN1dzBabmlN?=
 =?utf-8?B?bmZDUVYwcFlMR3IrVWVGei9jVmJPY3VISko5UHdZUnYvVWVYQ0lFSVJtNXhn?=
 =?utf-8?B?WHpHSThVa2pHb1IzTmFTZFhNbU4zS3JNQTh1SjdBNEV5eWZTcVFSM0FzOThK?=
 =?utf-8?B?bGJhV21XTVJGM0Q0a2tmSUJKUTZUdkVyczgzVkp5aTNDc1MvVFNYbVlBZjNt?=
 =?utf-8?B?UDZhMEl3eFZNSURNNFdscWFtYjR0V3FsZzF1SHU3c0FuQUNHdG94c1FEYkZu?=
 =?utf-8?B?ZCtjYWZIUHYxVHRRNnBXVFg3WWtGWkcrM2pvK2hDdXJHZFZEd0RjT0w1QjA5?=
 =?utf-8?B?a1Y2b0RhWkhFcGtHbWFHeEE0WXJsZFE5ZldleFl0TWF5RDFMbitKamVSRnl0?=
 =?utf-8?B?MUV4dHN3NDJ5ZWkxL3NhWE1XaHN2dkZOWjZzVGVVdlU4WUVqaTBEZGJOY280?=
 =?utf-8?B?a2lnazJQTVRLQ3RwMGFIZzYxbUN5QjJaT2NSQ1FzcThoQVBhTm12WHVLN3NY?=
 =?utf-8?B?OWxEUFFXNG1UTnhhUEZtSUtNV1FldDQ3L2R6dHdqQkZ0aDZqZmZPWml1REpN?=
 =?utf-8?B?OWo4TkZGbjgwbW5GdXJUTkNMbnlaaEp2T2FmeWJnR1QvM1BJRGhEcUlmZFg5?=
 =?utf-8?B?UFVNWXFYbG9BWE9wUXkzM1RJQzJvenF3a09uRlRqY1dESE1lS3FYL2doS2ls?=
 =?utf-8?B?MWpJSzlYSkZzRkRmNDU4VEdBU2RJRXFRUXdpdGNuQ1JLeFB2Smw1Ni9ZYjI1?=
 =?utf-8?B?cDVHczI2dDVIdk11N3ByQjFJOGNKY3U0WnVmTnMxMjdsb0ZJTWduZFdKN1N0?=
 =?utf-8?B?aHhvQzBuSERJbjFOa0FqTEdRakljV29kYnV6bG9mSmM5ajlqZ2JLcUF1RCtl?=
 =?utf-8?B?SGc9PQ==?=
Content-ID: <75B96E31BFB8F14D8AC0CD74B8EC1733@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b824ec1-fe81-4aac-f2c7-08ddb86339b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 05:50:46.5701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3lW6tSufilqSwsJXUYfO8ujFoIeMzk30hC+oCSt1BbvWfG3MhzGOUMtaJ5ZpHjcN5kwqgoqWWTJL/b8RTbpa4e5n7PQunS9biVdz0xmGnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7069
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1951099966.69172104"
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

--__=_Part_Boundary_002_1951099966.69172104
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA2LTI3IGF0IDA4OjQxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3Jv
dGU6DQo+ID4gVGhlIEdDRSBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiBjb25maWd1cmF0aW9uIHN1
cHBvcnRzIHRoZQ0KPiA+IGlzb2xhdGlvbiBvZg0KPiA+IEdDRSBoYXJkd2FyZSByZXNvdXJjZXMg
YWNyb3NzIGRpZmZlcmVudCBPUyBlbnZpcm9ubWVudHMuIEVhY2ggT1MgaXMNCj4gPiB0cmVhdGVk
IGFzIGEgdmlydHVhbCBtYWNoaW5lIChWTSkgZm9yIEdDRSBwdXJwb3Nlcy4NCj4gPiBUaGVyZSBh
cmUgNiBWTXMgYW5kIDEgaG9zdCBWTS4gVGhlIGhvc3QgVk0gaGFzIG1haW4gY29udHJvbCBvdmVy
DQo+ID4gdGhlDQo+ID4gR0NFIHZpcnR1YWxpemF0aW9uIHNldHRpbmdzIGZvciBhbGwgVk1zLg0K
PiA+IA0KPiA+IFRvIHByb3Blcmx5IGFjY2VzcyB0aGUgR0NFIHRocmVhZCByZWdpc3RlcnMsIGl0
IGlzIG5lY2Vzc2FyeSB0bw0KPiA+IGNvbmZpZ3VyZSBhY2Nlc3MgcGVybWlzc2lvbnMgZm9yIHNw
ZWNpZmljIEdDRSB0aHJlYWRzIGFzc2lnbmVkIHRvDQo+ID4gZGlmZmVyZW50IFZNcy4NCj4gPiBD
dXJyZW50bHksIHNpbmNlIG9ubHkgdGhlIGhvc3QgVk0gaXMgYmVpbmcgdXNlZCwgaXQgaXMgcmVx
dWlyZWQgdG8NCj4gPiBlbmFibGUgYWNjZXNzIHBlcm1pc3Npb25zIGZvciBhbGwgR0NFIHRocmVh
ZHMgZm9yIHRoZSBob3N0IFZNLg0KPiA+IA0KPiA+IFRoZXJlIGFyZSAyIFZNIGNvbmZpZ3VyYXRp
b25zOg0KPiA+IDEuIFZNX0lEX01BUA0KPiA+IFRoZXJlIGFyZSA0IHJlZ2lzdGVycyB0byBhbGxv
Y2F0ZSAzMiBHQ0UgdGhyZWFkcyBhY3Jvc3MgZGlmZmVyZW50DQo+ID4gVk1zOg0KPiA+IFZNX0lE
X01BUDAgZm9yIHRocmVhZHMgMC05LCBWTV9JRF9NQVAxIGZvciB0aHJlYWRzIDEwLTE5LA0KPiA+
IFZNX0lEX01BUDIgZm9yIHRocmVhZHMgMjAtMjksIGFuZCBWTV9JRF9NQVAzIGZvciB0aHJlYWRz
IDMwLTMxLg0KPiA+IEVhY2ggdGhyZWFkIGhhcyBhIDMtYml0IGNvbmZpZ3VyYXRpb24sIHdoZXJl
IHNldHRpbmcgYWxsIGJpdHMgdG8gMQ0KPiA+IGNvbmZpZ3VyZXMgdGhlIHRocmVhZCBmb3IgdGhl
IGhvc3QgVk0uDQo+ID4gDQo+ID4gMi4gVk1fQ1BSX0dTSVpFDQo+ID4gSXQgaXMgdXNlZCB0byBh
bGxvY2F0ZSB0aGUgQ1BSIFNSQU0gc2l6ZSB0byBlYWNoIFZNLiBFYWNoIFZNIGhhcyA0LQ0KPiA+
IGJpdA0KPiA+IGNvbmZpZ3VyYXRpb24sIHdoZXJlIHNldHRpbmcgYml0IDAtMyB0byBjb25maWd1
cmVzIHRoZSBzaXplIG9mIGhvc3QNCj4gPiBWTS4NCj4gPiBUaGlzIHNldHRpbmcgbXVzdCBiZSBj
b25maWd1cmVkIGJlZm9yZSB0aGUgVk0gY29uZmlndXJhdGlvbiB0bw0KPiA+IHByZXZlbnQNCj4g
PiByZXNvdXJjZSBsZWFrYWdlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiAN
Cj4gPiArDQo+ID4gwqBzdGF0aWMgdm9pZCBjbWRxX2djdGxfdmFsdWVfdG9nZ2xlKHN0cnVjdCBj
bWRxICpjbWRxLCBib29sDQo+ID4gZGRyX2VuYWJsZSkNCj4gPiDCoHsNCj4gPiDCoAl1MzIgdmFs
ID0gY21kcS0+cGRhdGEtPmNvbnRyb2xfYnlfc3cgPyBHQ0VfQ1RSTF9CWV9TVyA6IDA7DQo+ID4g
QEAgLTE2Miw2ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBjbWRxX2luaXQoc3RydWN0IGNtZHEgKmNt
ZHEpDQo+ID4gwqANCj4gPiDCoAlXQVJOX09OKGNsa19idWxrX2VuYWJsZShjbWRxLT5wZGF0YS0+
Z2NlX251bSwgY21kcS0NCj4gPiA+Y2xvY2tzKSk7DQo+ID4gwqANCj4gPiArCWNtZHFfdm1fdG9n
Z2xlKGNtZHEsIHRydWUpOw0KPiA+IMKgCWNtZHFfZ2N0bF92YWx1ZV90b2dnbGUoY21kcSwgdHJ1
ZSk7DQo+ID4gwqANCj4gPiDCoAl3cml0ZWwoQ01EUV9USFJfQUNUSVZFX1NMT1RfQ1lDTEVTLCBj
bWRxLT5iYXNlICsNCj4gPiBDTURRX1RIUl9TTE9UX0NZQ0xFUyk7DQo+ID4gQEAgLTMzNSw2ICsz
ODUsNyBAQCBzdGF0aWMgaW50IGNtZHFfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZQ0KPiA+
ICpkZXYpDQo+ID4gwqAJaWYgKHJldCkNCj4gPiDCoAkJcmV0dXJuIHJldDsNCj4gPiDCoA0KPiA+
ICsJY21kcV92bV90b2dnbGUoY21kcSwgdHJ1ZSk7DQo+ID4gwqAJY21kcV9nY3RsX3ZhbHVlX3Rv
Z2dsZShjbWRxLCB0cnVlKTsNCj4gPiDCoAlyZXR1cm4gMDsNCj4gPiDCoH0NCj4gPiBAQCAtMzQ0
LDYgKzM5NSw3IEBAIHN0YXRpYyBpbnQgY21kcV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmlj
ZQ0KPiA+ICpkZXYpDQo+ID4gwqAJc3RydWN0IGNtZHEgKmNtZHEgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gPiDCoA0KPiA+IMKgCWNtZHFfZ2N0bF92YWx1ZV90b2dnbGUoY21kcSwgZmFsc2Up
Ow0KPiA+ICsJY21kcV92bV90b2dnbGUoY21kcSwgZmFsc2UpOw0KPiANCj4gV2h5IHR1cm4gb2Zm
IHBlcm1pc3Npb24gd2hlbiBzdXNwZW5kPw0KPiBXaHkgbm90IGFsd2F5cyB0dXJuIG9uIHBlcm1p
c3Npb24/DQo+IA0KDQpZZXMsIHlvdSdyZSByaWdodCENCg0KVk0gcGVybWlzc2lvbiBzZXR0aW5n
cyBzaG91bGQgbm90IGJlIGRpc2FibGVkIG9yIHJlc2V0IGFmdGVyIGJvb3QgdXAuDQpCdXQgd2Ug
ZG9uJ3QgaGF2ZSB0aGUgSHlwZXJ2aXNvciB0byBrZWVwIHRoZSBHQ0UgSE9TVCBWTSBzZXR0aW5n
cywNCnNvIHdlIG5lZWQgdG8gY29uZmlndXJlIHRoZSBWTSBzZXR0aW5nIGFnYWluIGFmdGVyIGNt
ZHFfcmVzdW1lKCkgdG8NCmF2b2lkIHRoZSBHQ0UgVk0gc2V0dGluZ3MgYmVpbmcgY2xlYXJlZCBh
ZnRlciBjbWRxX3N1c3BlbmQoKS4NCg0KSSdsbCBkcm9wIHRoaXMgVk0gc2V0dGluZyBoZXJlIGFu
ZCByZW5hbWUgdGhlIEFQSSBhcyBjbWRxX3ZtX2luaXQoKQ0Kd2l0aG91dCB0aGUgZGlzYWJsZSBW
TSBzZXR0aW5ncyBmbG93Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQoNCj4gUmVnYXJkcywN
Cj4gQ0sNCj4gDQo+ID4gwqAJY2xrX2J1bGtfZGlzYWJsZShjbWRxLT5wZGF0YS0+Z2NlX251bSwg
Y21kcS0+Y2xvY2tzKTsNCj4gPiDCoAlyZXR1cm4gMDsNCj4gPiDCoH0NCj4gDQoNCg==

--__=_Part_Boundary_002_1951099966.69172104
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDYtMjcmIzMyO2F0
JiMzMjswODo0MSYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtNb24sJiMzMjsyMDI1LTA2LTAy
JiMzMjthdCYjMzI7MDE6MzEmIzMyOyswODAwLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGUmIzMyO0dDRSYjMzI7aGFyZHdhcmUmIzMyO3ZpcnR1
YWxpemF0aW9uJiMzMjtjb25maWd1cmF0aW9uJiMzMjtzdXBwb3J0cyYjMzI7dGhlDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtpc29sYXRpb24mIzMyO29mDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtHQ0UmIzMyO2hh
cmR3YXJlJiMzMjtyZXNvdXJjZXMmIzMyO2Fjcm9zcyYjMzI7ZGlmZmVyZW50JiMzMjtPUyYjMzI7
ZW52aXJvbm1lbnRzLiYjMzI7RWFjaCYjMzI7T1MmIzMyO2lzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0
cmVhdGVkJiMzMjthcyYjMzI7YSYjMzI7dmlydHVhbCYjMzI7bWFjaGluZSYjMzI7KFZNKSYjMzI7
Zm9yJiMzMjtHQ0UmIzMyO3B1cnBvc2VzLg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlcmUmIzMyO2Fy
ZSYjMzI7NiYjMzI7Vk1zJiMzMjthbmQmIzMyOzEmIzMyO2hvc3QmIzMyO1ZNLiYjMzI7VGhlJiMz
Mjtob3N0JiMzMjtWTSYjMzI7aGFzJiMzMjttYWluJiMzMjtjb250cm9sJiMzMjtvdmVyDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjt0aGUNCiZndDsmIzMyOyZndDsmIzMyO0dDRSYjMzI7dmlydHVhbGl6YXRp
b24mIzMyO3NldHRpbmdzJiMzMjtmb3ImIzMyO2FsbCYjMzI7Vk1zLg0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUbyYjMzI7cHJvcGVybHkmIzMyO2FjY2VzcyYjMzI7dGhl
JiMzMjtHQ0UmIzMyO3RocmVhZCYjMzI7cmVnaXN0ZXJzLCYjMzI7aXQmIzMyO2lzJiMzMjtuZWNl
c3NhcnkmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb25maWd1cmUmIzMyO2FjY2VzcyYjMzI7
cGVybWlzc2lvbnMmIzMyO2ZvciYjMzI7c3BlY2lmaWMmIzMyO0dDRSYjMzI7dGhyZWFkcyYjMzI7
YXNzaWduZWQmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmZXJlbnQmIzMyO1ZNcy4NCiZn
dDsmIzMyOyZndDsmIzMyO0N1cnJlbnRseSwmIzMyO3NpbmNlJiMzMjtvbmx5JiMzMjt0aGUmIzMy
O2hvc3QmIzMyO1ZNJiMzMjtpcyYjMzI7YmVpbmcmIzMyO3VzZWQsJiMzMjtpdCYjMzI7aXMmIzMy
O3JlcXVpcmVkJiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZW5hYmxlJiMzMjthY2Nlc3MmIzMy
O3Blcm1pc3Npb25zJiMzMjtmb3ImIzMyO2FsbCYjMzI7R0NFJiMzMjt0aHJlYWRzJiMzMjtmb3Im
IzMyO3RoZSYjMzI7aG9zdCYjMzI7Vk0uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyO1RoZXJlJiMzMjthcmUmIzMyOzImIzMyO1ZNJiMzMjtjb25maWd1cmF0aW9uczoNCiZn
dDsmIzMyOyZndDsmIzMyOzEuJiMzMjtWTV9JRF9NQVANCiZndDsmIzMyOyZndDsmIzMyO1RoZXJl
JiMzMjthcmUmIzMyOzQmIzMyO3JlZ2lzdGVycyYjMzI7dG8mIzMyO2FsbG9jYXRlJiMzMjszMiYj
MzI7R0NFJiMzMjt0aHJlYWRzJiMzMjthY3Jvc3MmIzMyO2RpZmZlcmVudA0KJmd0OyYjMzI7Jmd0
OyYjMzI7Vk1zOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Vk1fSURfTUFQMCYjMzI7Zm9yJiMzMjt0aHJl
YWRzJiMzMjswLTksJiMzMjtWTV9JRF9NQVAxJiMzMjtmb3ImIzMyO3RocmVhZHMmIzMyOzEwLTE5
LA0KJmd0OyYjMzI7Jmd0OyYjMzI7Vk1fSURfTUFQMiYjMzI7Zm9yJiMzMjt0aHJlYWRzJiMzMjsy
MC0yOSwmIzMyO2FuZCYjMzI7Vk1fSURfTUFQMyYjMzI7Zm9yJiMzMjt0aHJlYWRzJiMzMjszMC0z
MS4NCiZndDsmIzMyOyZndDsmIzMyO0VhY2gmIzMyO3RocmVhZCYjMzI7aGFzJiMzMjthJiMzMjsz
LWJpdCYjMzI7Y29uZmlndXJhdGlvbiwmIzMyO3doZXJlJiMzMjtzZXR0aW5nJiMzMjthbGwmIzMy
O2JpdHMmIzMyO3RvJiMzMjsxDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb25maWd1cmVzJiMzMjt0aGUm
IzMyO3RocmVhZCYjMzI7Zm9yJiMzMjt0aGUmIzMyO2hvc3QmIzMyO1ZNLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyLiYjMzI7Vk1fQ1BSX0dTSVpFDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtJdCYjMzI7aXMmIzMyO3VzZWQmIzMyO3RvJiMzMjthbGxvY2F0ZSYjMzI7dGhlJiMz
MjtDUFImIzMyO1NSQU0mIzMyO3NpemUmIzMyO3RvJiMzMjtlYWNoJiMzMjtWTS4mIzMyO0VhY2gm
IzMyO1ZNJiMzMjtoYXMmIzMyOzQtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiaXQNCiZndDsmIzMyOyZn
dDsmIzMyO2NvbmZpZ3VyYXRpb24sJiMzMjt3aGVyZSYjMzI7c2V0dGluZyYjMzI7Yml0JiMzMjsw
LTMmIzMyO3RvJiMzMjtjb25maWd1cmVzJiMzMjt0aGUmIzMyO3NpemUmIzMyO29mJiMzMjtob3N0
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtWTS4NCiZndDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO3NldHRp
bmcmIzMyO211c3QmIzMyO2JlJiMzMjtjb25maWd1cmVkJiMzMjtiZWZvcmUmIzMyO3RoZSYjMzI7
Vk0mIzMyO2NvbmZpZ3VyYXRpb24mIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwcmV2ZW50DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtyZXNvdXJjZSYjMzI7bGVha2FnZS4NCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpIJiMzMjtMaW4m
IzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1tzbmlwXQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDtzdGF0aWMmIzMyO3ZvaWQmIzMyO2NtZHFf
Z2N0bF92YWx1ZV90b2dnbGUoc3RydWN0JiMzMjtjbWRxJiMzMjsqY21kcSwmIzMyO2Jvb2wNCiZn
dDsmIzMyOyZndDsmIzMyO2Rkcl9lbmFibGUpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDt7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDt1MzImIzMyO3ZhbCYjMzI7PSYjMzI7Y21kcS0mZ3Q7cGRh
dGEtJmd0O2NvbnRyb2xfYnlfc3cmIzMyOyYjNjM7JiMzMjtHQ0VfQ1RSTF9CWV9TVyYjMzI7OiYj
MzI7MDsNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstMTYyLDYmIzMyOysyMTEsNyYjMzI7QEAm
IzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7Y21kcV9pbml0KHN0cnVjdCYjMzI7Y21kcSYjMzI7KmNt
ZHEpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO1dB
Uk5fT04oY2xrX2J1bGtfZW5hYmxlKGNtZHEtJmd0O3BkYXRhLSZndDtnY2VfbnVtLCYjMzI7Y21k
cS0NCiZndDsmIzMyOyZndDsmIzMyOyZndDtjbG9ja3MpKTsNCiZndDsmIzMyOyZndDsmIzMyOyYj
MTYwOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2NtZHFfdm1fdG9nZ2xlKGNtZHEsJiMzMjt0cnVlKTsN
CiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO2NtZHFfZ2N0bF92YWx1ZV90b2dnbGUoY21kcSwmIzMy
O3RydWUpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2
MDt3cml0ZWwoQ01EUV9USFJfQUNUSVZFX1NMT1RfQ1lDTEVTLCYjMzI7Y21kcS0mZ3Q7YmFzZSYj
MzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7Q01EUV9USFJfU0xPVF9DWUNMRVMpOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7QEAmIzMyOy0zMzUsNiYjMzI7KzM4NSw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtp
bnQmIzMyO2NtZHFfcnVudGltZV9yZXN1bWUoc3RydWN0JiMzMjtkZXZpY2UNCiZndDsmIzMyOyZn
dDsmIzMyOypkZXYpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDtpZiYjMzI7KHJldCkNCiZndDsm
IzMyOyZndDsmIzMyOyYjMTYwO3JldHVybiYjMzI7cmV0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMx
NjA7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrY21kcV92bV90b2dnbGUoY21kcSwmIzMyO3RydWUpOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7Y21kcV9nY3RsX3ZhbHVlX3RvZ2dsZShjbWRxLCYjMzI7
dHJ1ZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzE2MDt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTM0NCw2JiMzMjsrMzk1
LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7Y21kcV9ydW50aW1lX3N1c3BlbmQoc3Ry
dWN0JiMzMjtkZXZpY2UNCiZndDsmIzMyOyZndDsmIzMyOypkZXYpDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzE2MDtzdHJ1Y3QmIzMyO2NtZHEmIzMyOypjbWRxJiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRh
dGEoZGV2KTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMx
NjA7Y21kcV9nY3RsX3ZhbHVlX3RvZ2dsZShjbWRxLCYjMzI7ZmFsc2UpOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7K2NtZHFfdm1fdG9nZ2xlKGNtZHEsJiMzMjtmYWxzZSk7DQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1doeSYjMzI7dHVybiYjMzI7b2ZmJiMzMjtwZXJtaXNzaW9uJiMzMjt3aGVuJiMzMjtzdXNw
ZW5kJiM2MzsNCiZndDsmIzMyO1doeSYjMzI7bm90JiMzMjthbHdheXMmIzMyO3R1cm4mIzMyO29u
JiMzMjtwZXJtaXNzaW9uJiM2MzsNCiZndDsmIzMyOw0KDQpZZXMsJiMzMjt5b3UmIzM5O3JlJiMz
MjtyaWdodCENCg0KVk0mIzMyO3Blcm1pc3Npb24mIzMyO3NldHRpbmdzJiMzMjtzaG91bGQmIzMy
O25vdCYjMzI7YmUmIzMyO2Rpc2FibGVkJiMzMjtvciYjMzI7cmVzZXQmIzMyO2FmdGVyJiMzMjti
b290JiMzMjt1cC4NCkJ1dCYjMzI7d2UmIzMyO2RvbiYjMzk7dCYjMzI7aGF2ZSYjMzI7dGhlJiMz
MjtIeXBlcnZpc29yJiMzMjt0byYjMzI7a2VlcCYjMzI7dGhlJiMzMjtHQ0UmIzMyO0hPU1QmIzMy
O1ZNJiMzMjtzZXR0aW5ncywNCnNvJiMzMjt3ZSYjMzI7bmVlZCYjMzI7dG8mIzMyO2NvbmZpZ3Vy
ZSYjMzI7dGhlJiMzMjtWTSYjMzI7c2V0dGluZyYjMzI7YWdhaW4mIzMyO2FmdGVyJiMzMjtjbWRx
X3Jlc3VtZSgpJiMzMjt0bw0KYXZvaWQmIzMyO3RoZSYjMzI7R0NFJiMzMjtWTSYjMzI7c2V0dGlu
Z3MmIzMyO2JlaW5nJiMzMjtjbGVhcmVkJiMzMjthZnRlciYjMzI7Y21kcV9zdXNwZW5kKCkuDQoN
CkkmIzM5O2xsJiMzMjtkcm9wJiMzMjt0aGlzJiMzMjtWTSYjMzI7c2V0dGluZyYjMzI7aGVyZSYj
MzI7YW5kJiMzMjtyZW5hbWUmIzMyO3RoZSYjMzI7QVBJJiMzMjthcyYjMzI7Y21kcV92bV9pbml0
KCkNCndpdGhvdXQmIzMyO3RoZSYjMzI7ZGlzYWJsZSYjMzI7Vk0mIzMyO3NldHRpbmdzJiMzMjtm
bG93Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkgmIzMyO0xpbg0KDQomZ3Q7JiMzMjtSZWdhcmRzLA0K
Jmd0OyYjMzI7Q0sNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7Y2xrX2J1bGtf
ZGlzYWJsZShjbWRxLSZndDtwZGF0YS0mZ3Q7Z2NlX251bSwmIzMyO2NtZHEtJmd0O2Nsb2Nrcyk7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzE2MDt9DQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10
eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRp
YWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250
YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRz
KSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3
aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMg
aW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVu
dChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCBy
ZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFj
aG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
IGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlh
dGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29w
aWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91
ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWls
IHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_1951099966.69172104--

