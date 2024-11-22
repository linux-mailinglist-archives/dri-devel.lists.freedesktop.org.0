Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42479D57EA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C08B10E00B;
	Fri, 22 Nov 2024 02:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ivO6yn9D";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bb/DHJt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8674F10E00B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:00:29 +0000 (UTC)
X-UUID: 7f1245b0a87511efbd192953cf12861f-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=QtM92xwiyDwUQ4e90nnxLBxuoj6dn/XpkLY0CO7tuTU=; 
 b=ivO6yn9DMbrevK1wRwI1itcuzoDM/dXmR1R5dvWDaA8GO1uHeUXDtxaXjrKsKrz8jh1zoLvcdbHuPmMqtIgpk54EJ6bElHAB6AqnesYvpvZjXrxKvrBy8Qw4SYoHAQzf965p0zkFVumtf0Ifes6Bmqkr+UnU9x4fOhgv9IJRIE8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:ce4f91cb-4b11-4826-ac65-73af9fe61ffb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:bf7934b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7f1245b0a87511efbd192953cf12861f-20241122
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 781111575; Fri, 22 Nov 2024 10:00:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 10:00:05 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 10:00:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpjuXbqkFkmubJbwFdWKAl1RzGvbwqV7iBMw+Btg7a2yQ1O+IBctIavcyMrlz9npIHluWdKiWPqHK18J8jNw5I3OA7S3RNM2eI6EUzj+0/CnqPlM2WQz4NQhgT93eRei5xI0GJyALBUTMNnQZ1Kj8IGWyt7KTLBu5WdvrF1u9gUaEirXxfRQNlBjRjRHBV5zYkArOAW66pFwJRw/dhnZPS1pHI8NXv4HBTIHpn28xOdQPstLMb4m/H4+IWc+qIK5qkjdRTTBo8Io5D2ZtignGv/egKyEMQcEvpcA/cAATFFqOKgjgGIeuhszDdx75zuo5oMD/Z+RuieVxNvuUI4Wtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce61/CGhcvp0oSqvbBHCrKFebQtrdx/QYeDhtcgmk+o=;
 b=jcGEkXLWhwviSTjIrQPFTgMIrG7P/HMeV6bSLVha21Xerr+VbZCE4YiyTisrSGKSfsVb9Dh+JFvKrDCeNk+DMWuQl9meycyPb36UlCr5KmsTzWzf4t9X7NZuk90673loC4g0rNAOd2sQDiKosyEPZ5IsB7GzkvnF28FqyzRbphsSCBgHDrb4DsuMqKi8rgOZeaJGiuQdRc4u1snXUOO+jCG1PTTwZ/WkyQanY2BnlozTpn8qhTeJtbLyXHHsdWNswdx7c56cO3wPmz5RHdZVWPoxLt6lytO3gpUXfWi+uGQhFiIjK77a8pcWeVW2O5TlqKK28UG6azq4iVGRbka55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce61/CGhcvp0oSqvbBHCrKFebQtrdx/QYeDhtcgmk+o=;
 b=bb/DHJt7DUB48rR5LPw9iRrWpDnML4EAB7qfZbqLTlUeC4IXK58296XYb4bRKfDxdmyKKrdPzu5YyZEZ+nlJlOfWAGI45ycDzLz3zmjRR25Vm0+b4/jP09g1slyqksFnV5JkhYm1L62j35u5O9YCUjpLxWFuXJtHq56UxEJUWMQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7998.apcprd03.prod.outlook.com (2603:1096:101:17b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Fri, 22 Nov
 2024 02:00:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 02:00:01 +0000
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
Subject: Re: [PATCH v1 1/6] dt-bindings: display: mediatek: dpi: Add MT8195
 and MT8188 compat
Thread-Topic: [PATCH v1 1/6] dt-bindings: display: mediatek: dpi: Add MT8195
 and MT8188 compat
Thread-Index: AQHbO0n/dkZEGC5E/E2WmK44ZSC/prLCjeaA
Date: Fri, 22 Nov 2024 02:00:01 +0000
Message-ID: <953400d7e4722794daaf0d3faac2d35f2e415062.camel@mediatek.com>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124420.133914-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7998:EE_
x-ms-office365-filtering-correlation-id: 5bdb03f0-48cc-43bb-08e1-08dd0a99604f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y3VtdWRhTUZGdThQdXlnalp0aVlxYVJvQTVyYVJLWTVxQUU0UTVlVml4QWZY?=
 =?utf-8?B?L0J5NmlCcE9TaGw2dFlOclpielo5U3o0M0I2WUtXZ2hmRVJLNzdwOTBFR0xI?=
 =?utf-8?B?aGQrU0tPSGk0dXJXMXhZVFZ3N284cVBuNlBDUlJ5QWp2OEhJbnRCSGVuYmlE?=
 =?utf-8?B?VzM2Nk1CNmVBaUt2ejluSzRPK1VLOW1uSE9wejQycXJZZE8yd3B1NFYwMmQz?=
 =?utf-8?B?ZG1vZVN6ZVdsY2I1clNZTGQ1SzFlZU9Wa3dCTG85NnZqbE5mM1lKcklvcDlD?=
 =?utf-8?B?YUplVHZ6RzMwbFdZZDBXNm1kNXV3MjlxS2R2MkliK0ZBMnFIa0IxWXZPbG1k?=
 =?utf-8?B?dkVXMjNPbEJ5djZLSWZ5YkU3cDY0dCtUWmJDZzJvbFBJM2tkUm0wTEdhOEFM?=
 =?utf-8?B?dUtNbFNhaDFnVnAyNGU3Z1JTYnRhYkpjcGRhNFY0VnZ2N29zb1IxNGlxOUFB?=
 =?utf-8?B?ZVd3THpQOEYreEVmUHR3RG1KR252MXNZU2xnbkRmdFdTZ2dreVlIOEZ4UXRU?=
 =?utf-8?B?VEQ3SXpBaS9oNFdVR1p1em9QaHZjRHFCMWlLdVYvU2NCYTlxY2M2ZW1WeEsx?=
 =?utf-8?B?L2ZQSWVMK1J2b2FHaFNWVG9PTENlMUZaVU9JUFFOZ0t1VUZ0Z1BTS3lCa3B0?=
 =?utf-8?B?dHhFK08rYlVPd3pPM0NQNjdybmdzSWNkTlNpUEYvMTVWQUk5c3lYaUpRQk1l?=
 =?utf-8?B?SUZBdm5oZUl5UUFWYndjcEJsejU4RVYrVW1NbmRhNVVTOTVBMEhLK3NuVzY1?=
 =?utf-8?B?bm1UYUF4UnNqS0VCOEppZyt4YzY4MEo0cG04Z3p0Y0hucVo5ZUdybWJ1S2Fm?=
 =?utf-8?B?c0RBM0Ruekl5Qm4rUWZZRk5wZ0x0ay92aDJ5UWhmVXZTYkcwLytoWWVoYUlL?=
 =?utf-8?B?SktYVldyMmlabEZMVHBUTlF0bEVnWi9vKzhjL3I3REtjazFad0RLNSsvN1Q2?=
 =?utf-8?B?MnFWRHVrZG8wK0Q3RmVGdXY5emhEeHVoWS9MTFYvZmVRazFLTjFWRE9GNzhn?=
 =?utf-8?B?Y1NYeENZancxcUYrMW5mdnczdHZuZEtMbDFSa0RSOGd3QmVlam91THhzTXVP?=
 =?utf-8?B?UHRyWW5lZFdnQzFmQ0ZqUDZqRDFWUjB6NVp2OXc1VkI5OEJOY0NlVG9nQ0RO?=
 =?utf-8?B?SGZHbm9HTEt5NytZZzlUaG8vbUljNDdPczc5cVdJYktKaDBJSUpUNm8zSDB0?=
 =?utf-8?B?VVNFOE5wM3duY0FZdGVUQnJmSXl3YzVCQWJtK2lPeEhZWkhFWXlTV004V1pN?=
 =?utf-8?B?WEtMMHArT3hLZWdJdGpFRmNPV1ZqdFMzUUpyOHh4NkNCR05TWTYxUDZaNFFS?=
 =?utf-8?B?bkhMSG9wazU4a3FtL0VaaGEwZldsNnRLRjJZd0ZIRWRSTENveEJWeWhpTUk5?=
 =?utf-8?B?QmE3OHliZSt5dlFPTFFIeFY4Q0RVdUVtSXJSbk1CNkhVZ05ycHM2dlErQW8r?=
 =?utf-8?B?a2x2M3FWWC9LcDdLRUxRajE3UWlodVhWZ1BJK3U2ZWtvQUIwaUJ2OFNnYkE2?=
 =?utf-8?B?MmozRWdNbmxVVmEyNTUxb3RkNVdwSGFxUldrN3ZSbjRqUDNDS3F0dStoQ1ZY?=
 =?utf-8?B?ZkhMNWZiUkgyelJ3N0J1WEFvbmhVM1BYaFBrS2VSdThxb080L1BuUEt1eXln?=
 =?utf-8?B?cWNRcjFqbkxheTNSUm1GczdvOE81M2JValhxWEpibTJscDFwdWRFYmpCWEZr?=
 =?utf-8?B?aFBJVWRmbVFRSEUzb3oyNERqQnZXVitlOVIrSkIzMFFEWTdHNTVQNXZZSTVN?=
 =?utf-8?B?K3FuVnZabGxQZitYZ2t6aFUrVTVCYStNbXk1cGNlOHJQZ2lnSjJZWFVSc2tC?=
 =?utf-8?B?WDNEd3owWmxUREtIWlFDZEN1UEVvR1kvbnA4SzVSVXViN2JLZUEwYk92QzRx?=
 =?utf-8?B?Y2czQTU3L3luMVFzcXJFT3orY2k3OWx4Z2VQNGlZYm5LUHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVJTTHRycW1IbzJNcG54OHU0dXYrK1dvQkwvY04xNm1zRytaUmVMOUdrMmM1?=
 =?utf-8?B?LzNNZDJIblM3NzNnMnE4RXJjUkZ0QXNTQ0hJcWJpeHRSM2ZrOTBlVmV6MVFR?=
 =?utf-8?B?WmMxRE1yM1hPbTZWaUVjNnVRUDNTSTY3VUF3c04vYzVKTHB3RWQvTUE2eTdW?=
 =?utf-8?B?NlJvTkUySWNIdWxEaTdNckIxRlhDSFNESEJ2VXhIc0ZFQmt6UmdhWkJkb3JY?=
 =?utf-8?B?cG1ESEphY0hMaVFkWVlJZkxaY3lZNjlSdDFDNFlOQUhVdWRLSXo3cGlrdGhJ?=
 =?utf-8?B?Um05WTI1RStjZWNhSHFEaU5NcEYyLzNSeEpQaDdnZUNoU2RJcnNyaEQ5T2s3?=
 =?utf-8?B?QWRmNmxHUTJ4TXRvdzYxMVVMejVic0MyMTkybzdnZ01KYk8yRExDSkVBQ0VS?=
 =?utf-8?B?S2NKWUJFUkxOdzlqWTVNRHFjK2R5MFJnQW10eUx0NGxuUml4REVJU3NTbjBH?=
 =?utf-8?B?YytjUlRYZVB3SE5xcmdRYlY5eDVIWmpZdnAxUlJZOUwrS1BFemxsZEtjNml1?=
 =?utf-8?B?aEJFVDZtSVlyMzdzdmR5MkVnNTNkVVJFTW0rY0VEbmdzcWthRlVaMnZsNGpD?=
 =?utf-8?B?bUNSVTZnR1NGM3Q0THQ3VHhyZ1hlci9hQTFlaU9ZN0dOaEVPZFJFVW5mOWlr?=
 =?utf-8?B?cWMwa2EwRFBNa2VrOTFFaklJYnVhY000Z3p2eDVkQW8wQTNlSE5NQTZqL2VW?=
 =?utf-8?B?cHB5T0RPOUtBWWVYc0ZGTmc1K2Y3elo5dzg3Y0NqNjgzcThNWFNIcVU0cTVC?=
 =?utf-8?B?QW5lbHh1YS9UeG5BOGFwdzllZkJxVTNDQlpheE9kc3oxWXJXM0V5akFkVG1l?=
 =?utf-8?B?blIrbHpQQW5RWDJ3aVB4eHlmQ084RFVtNlFDaDdQOTdRbUdHY3Y0S0hJM2Zh?=
 =?utf-8?B?am0rUlh1RmpuWUQzZHBsZGlvbkpmYXI0NEdVNkdwVTkrVzQzZDJ6SWp0Z2p5?=
 =?utf-8?B?YVFwY01QSGFzT3Fyd2IzSEFhZmhhL1Uwd0RKTnUzOXd1MWN0K0ZBRUdxZXR6?=
 =?utf-8?B?VlNHRDVTRy9ncDh4b3ZnaEhTbkYwMWQvYXRFZERuNDN5SmNpRDdQSURKeUdz?=
 =?utf-8?B?QXlFZ0tOZllWZVlDNVR3bCtpMFRXRnY3NlFHNVRPU09wdjRrWEdSdDRzVmpP?=
 =?utf-8?B?d3Ntd3Fqa00vc0l4QzJ1ZlNXbGhEOGhxVld1dFlxcjVrMElSbjFseDdPbVJm?=
 =?utf-8?B?L2h1NVZIU0VrSjQyS1hUNE1VVFZ0Rm5LNG1KZDBEQ0NCY3pseW8xUk1RZklp?=
 =?utf-8?B?MkJKb2xmVGpNaHFmOWhGS3NKcTNIZG1qL1g4OW1DNlpUWUFna0QvYXI3VWxP?=
 =?utf-8?B?TDBFbm1ySExNcEx1MkRCRVEwTmJEeW0vR1NITXJGVmdvQWpCVk1xZnREeDR3?=
 =?utf-8?B?cFh2QWVlK0RuVmw4ZnpFV2dqalJ6aDNBUHVHeTJQMXh5UFpJTDBESXdjVHBp?=
 =?utf-8?B?QmJreEVhMUJycDA3MUhmbE42bFplYkpOb1laOTlFWjF4aTlQMTFMS2ZuSGlY?=
 =?utf-8?B?dldtN1NxSXJGN21Nai9uL3cya1gyT1hQRDcyamd3dTZ1bW1ONTZMdGpxQThW?=
 =?utf-8?B?M1JVN1M2UEtwaVhDR3BuNXIvSXBIN2p4YmVJQXhBRi9QSDhsamZtSm5SUWJ0?=
 =?utf-8?B?NjZQSURvQkw4MXN5TjZ0ZVU1dzRnbzd3bnpodnJGc1VLVitCZ0w1OTE5RURy?=
 =?utf-8?B?S2ZiVXNaOVVYaUFaeTN4QXZFZnYxZDRLRWhUOXhlL0VkVVJlYk43aE1nYVc2?=
 =?utf-8?B?NDNDVWUrM3J4R3I0SDd6dklIMFpBaUkrS3lRSlpIb24zRDF1Mm5QV0c0MEQy?=
 =?utf-8?B?NlZ3UktSdjhwVG1Uc2tQNmdEUjhpZUJySGU3Z2VnRzEyM2ZqUmhGckVKSW5D?=
 =?utf-8?B?SGEwaGxhdTZkSy9vZDdkRXJ4ZmY4ZDhoeGR3Y1dKV1lrclJqbURXQUhCOVAr?=
 =?utf-8?B?RDNPMnpHalBvSG9teDhOSm1sRGVabzd6Q24wOE1JYUtYTitWNVhtUWFxZ243?=
 =?utf-8?B?aGZ6L2tUbjJvUjJJcUovZkluL1B6Qm8wNmNUMDVrNU5QTE9GaTJ5UktpdTRw?=
 =?utf-8?B?aTYwV24wdWIyOG1TRmpSamIreWxUeDZjTG9OKytkbk1UV0xTUHNRblM3WHBn?=
 =?utf-8?Q?ozMRWdkJ8C5qccVoL6RVMV91i?=
Content-ID: <8D0490A8DE27294C91A2BF251A15BF47@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdb03f0-48cc-43bb-08e1-08dd0a99604f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 02:00:01.8468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1QYm+PHwGK+rtA+c3Nq9+Kq34J/EhTMiiKXc90Vo/QGYgP3+SAWAE+aY2ZTwF7sikEnxuIgUpunMJqVHYSWyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7998
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1502534601.1494760710"
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

--__=_Part_Boundary_008_1502534601.1494760710
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ0ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgY29tcGF0aWJsZXMg
Zm9yIHRoZSBEaWdpdGFsIFBhcmFsbGVsIEludGVyZmFjZSAoRFBJKSBibG9jaw0KPiBmb3VuZCBp
biB0aGUgTVQ4MTk1IGFuZCBNVDgxODggU29DczogaW5zaWRlIG9mIHRoZSBjaGlwLCB0aGlzIG9u
ZQ0KPiBpcyBkaXJlY3RseSBjb25uZWN0ZWQgdG8gdGhlIEhETUkgYmxvY2suDQoNClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBB
bmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tPg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwgICB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55
YW1sDQo+IGluZGV4IGI1NjdlM2Q1OGFhMS4uZWYxODBhNjNlZTcyIDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkcGkueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbA0KPiBAQCAtMjcsNiArMjcsNyBAQCBwcm9w
ZXJ0aWVzOg0KPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LWRwLWludGYNCj4gICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5Mi1kcGkNCj4gICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5
NS1kcC1pbnRmDQo+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtZHBpDQo+ICAgICAgICAt
IGl0ZW1zOg0KPiAgICAgICAgICAgIC0gZW51bToNCj4gICAgICAgICAgICAgICAgLSBtZWRpYXRl
ayxtdDY3OTUtZHBpDQo+IEBAIC0zNSw2ICszNiwxMCBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAg
ICAgIC0gZW51bToNCj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgzNjUtZHBpDQo+ICAg
ICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTkyLWRwaQ0KPiArICAgICAgLSBpdGVtczoN
Cj4gKyAgICAgICAgICAtIGVudW06DQo+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4
LWRwaQ0KPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1kcGkNCj4gDQo+ICAg
IHJlZzoNCj4gICAgICBtYXhJdGVtczogMQ0KPiAtLQ0KPiAyLjQ3LjANCj4gDQo=

--__=_Part_Boundary_008_1502534601.1494760710
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDQmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO2NvbXBhdGlibGVz
JiMzMjtmb3ImIzMyO3RoZSYjMzI7RGlnaXRhbCYjMzI7UGFyYWxsZWwmIzMyO0ludGVyZmFjZSYj
MzI7KERQSSkmIzMyO2Jsb2NrDQomZ3Q7JiMzMjtmb3VuZCYjMzI7aW4mIzMyO3RoZSYjMzI7TVQ4
MTk1JiMzMjthbmQmIzMyO01UODE4OCYjMzI7U29DczomIzMyO2luc2lkZSYjMzI7b2YmIzMyO3Ro
ZSYjMzI7Y2hpcCwmIzMyO3RoaXMmIzMyO29uZQ0KJmd0OyYjMzI7aXMmIzMyO2RpcmVjdGx5JiMz
Mjtjb25uZWN0ZWQmIzMyO3RvJiMzMjt0aGUmIzMyO0hETUkmIzMyO2Jsb2NrLg0KDQpSZXZpZXdl
ZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7
RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjsuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sJiMzMjsmIzMyOyYjMzI7fCYj
MzI7NSYjMzI7KysrKysNCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMy
OzUmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQm
IzMyO2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZHBpLnlhbWwmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwNCiZndDsmIzMyO2luZGV4JiMzMjti
NTY3ZTNkNThhYTEuLmVmMTgwYTYzZWU3MiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2Ev
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssZHBpLnlhbWwNCiZndDsmIzMyOysrKyYjMzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbA0KJmd0OyYjMzI7QEAm
IzMyOy0yNyw2JiMzMjsrMjcsNyYjMzI7QEAmIzMyO3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7
bWVkaWF0ZWssbXQ4MTg4LWRwLWludGYNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDgxOTItZHBp
DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTk1LWRwLWludGYNCiZndDsmIzMyOysmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVr
LG10ODE5NS1kcGkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
LSYjMzI7aXRlbXM6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7ZW51bToNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOy0mIzMyO21lZGlhdGVrLG10Njc5NS1kcGkNCiZndDsmIzMyO0BAJiMzMjstMzUsNiYjMzI7
KzM2LDEwJiMzMjtAQCYjMzI7cHJvcGVydGllczoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtlbnVtOg0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MzY1LWRwaQ0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0m
IzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTkyLWRwaQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2l0ZW1zOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7ZW51bToNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTg4LWRwaQ0KJmd0OyYjMzI7KyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7Y29uc3Q6
JiMzMjttZWRpYXRlayxtdDgxOTUtZHBpDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyO3JlZzoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttYXhJdGVtczomIzMy
OzENCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ3LjANCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwv
cD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_008_1502534601.1494760710--

