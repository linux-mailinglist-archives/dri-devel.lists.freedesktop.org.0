Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC673A038BB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 08:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99B210EA9A;
	Tue,  7 Jan 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="vAk7XyFA";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="m388TZdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655B010E2F4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 07:26:56 +0000 (UTC)
X-UUID: c0cb5830ccc811efbd192953cf12861f-20250107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=UnEHbgeA+FO2irD1TIzWndaUB96sAjI+9vibpNjBsvA=; 
 b=vAk7XyFAGfHpN3bKPdqRZfuol4L3A7YZ1v2UvanQBy9O7BAUbKjh508KCM/rkUFCQgaaR14cUgRCx2/Rj7OpG448L+06FvIslRAuNvqgvURpDjr6lQ1um5muGuoPmpbiWYI5lYnTeRpgyEreT6e/gK142KA7AiqZ2Hp7KY0NrXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:ff1c07d2-b2d3-4984-bd26-1626216d857a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:cdb87c37-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c0cb5830ccc811efbd192953cf12861f-20250107
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 726802570; Tue, 07 Jan 2025 15:26:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 Jan 2025 15:26:45 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 Jan 2025 15:26:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG7/IvydQ3bwDXuP2Q+RO8Rc035OH+J8TnMhCTkr70+RfbrwQb/ToLeAcsk2044WY3LEBtIoAOliRW3y4v2UK04tqOmLpMiUEoHasWvaHMLDPfa4jqX5KAnsMCcKRmfS+hsU/tm8a2rNKt7Qw0jbn4pUaHCaxqU0GsKX+MWuSGwz8PaHM+lu1mJ1F1h7UusYUG3VncPZn9UN9sXOfHhGyeCoZpH2aotqm2XiDsjhHLNMROa50Lyi8xLn/+7QDL1MtXmQrbFmw7py1pxDyWPbrAZixRiwtt5FqSOkShqYMI/5jsGnkf4qks29s1F3ui8QeF5iIJ/EQoCF9D5vY/hTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yuiXW9EVAMRAphH4oiEjBHuDyubE+trbjldigKewdQ=;
 b=Ws0kUhLx/5p5K+Yqix66QkDNkcB7SgP5OAuivfW/EwL9Ip3oGw5oyzblD/WVJEYDpbq1kfaNIO0bRDuk5rANZ97VOxgbk8JxGpL8we5TCJN0plJ5M971ijWcqNgNwBCUYGrXLzV9EZP9KOkagZ+JopwvG9FnPPieTx2PY7Br2ltnJSTAbpZHTQ+QNieZMflJausms/MT6wJ8rpBTQCsXgazzdSH0l6foV8xHby3JIAEaxqMQxiDHL64nmBlhul0Lg8jXFB9QJQYAI/kkZcfcFKJf1U6AQlHykualCKXvHPwsu0ifosGc0/EUv+JuDa3PH8+uDbvhojh8kxW0W5q6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yuiXW9EVAMRAphH4oiEjBHuDyubE+trbjldigKewdQ=;
 b=m388TZdvz0xgMGO0c0ZR0L//hSCMJYyuIp9nPMSlcKeqPkG1RKrTI3wXhCaZnSn1+LFY6Lp9cZ3O3FZB3zG9p2QsQ580EZkF23XSlz6jVAkNfg94VlN4luJgkMDN1SJdpL6PMNPt8Wc65eaGByVZjOOiNiS2ySKRazUmr2WaRu0=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8096.apcprd03.prod.outlook.com (2603:1096:101:17f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 07:26:43 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 07:26:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mchehab@kernel.org" <mchehab@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
 <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbUjifwIYL/sR61UKff0WQOKSFC7L5ygoAgATKiACABsoBgIAFWIAAgAA70ICAABOqAA==
Date: Tue, 7 Jan 2025 07:26:43 +0000
Message-ID: <42def68200b28b5bea3cbf091907343976482132.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
 <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
 <11f168c11b4cea48cf51406c0afaf8f1f53ad90f.camel@mediatek.com>
 <6adfa5fe-7b68-4f8e-919d-7b7607fe617c@kernel.org>
 <90b38dd6e093c89a7383814db786321cbd4533f6.camel@mediatek.com>
 <420caebd-136f-4015-96cd-5f37b9c3f49b@kernel.org>
In-Reply-To: <420caebd-136f-4015-96cd-5f37b9c3f49b@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8096:EE_
x-ms-office365-filtering-correlation-id: 80dfdfba-60aa-4f83-1b4b-08dd2eeca2cf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RmJkejJ2cGlFdlFoNWpMMC9id2J0b2lxQnU4SzYxU1ZIM09ld1Ava0cyT0pp?=
 =?utf-8?B?R3FwU1Y2MUFKK1JGMjVua3JscHJYMEkxYkZhOGoyOTBMdnJVZTZWY1gxY002?=
 =?utf-8?B?ZVBaVXpubk5ocGd5QjN3NVE1L2xLL09jQ25zak1yS3BYSTVoaFU0amtTVGFE?=
 =?utf-8?B?Um1kbVVYUklKYjRTUHhxaDlvTlVmcmxKTnVKSFFsV0V6ODVhQWEwQ0g5dmY0?=
 =?utf-8?B?OUxtdzhOcnJSZU05WDl1UHA1WHhiVTZmb0Q2QjFtd215aE1KZ0IxTTNMeURx?=
 =?utf-8?B?cDhITFZMSCtXRVFLdGlXTWUvRUorY3Nac2pCaGdFZmtBbllKdHhwaDRDU0pn?=
 =?utf-8?B?YTUyeEFoU25RdVhDRTRRcU4rWi9PUDUyUG5aa25na21HL09MS0tsYS9iUnhn?=
 =?utf-8?B?TFVrVVFlZ1h3d0VTZXFjRzM4ZUdOalI1bGNOT21KZ0xvb3BPYkE2OU9zSW1X?=
 =?utf-8?B?bjdCenMzVFhHdmNiTlFDTDF3Z01PNzVpdlVoSlhtNWloaHQrOXNSTmZGTUFR?=
 =?utf-8?B?UHRZbWY1djJmc1N3c1hpZTB2OTArVFFodktKTXV3cG1SYWc2OHByb0pNTmlO?=
 =?utf-8?B?WkZoVytzUW8yZDYvOEJuTGNic25RWHBiWmdUUlFOYzRydXhZWW9xL1huU1lV?=
 =?utf-8?B?Ylh5Uy9OU04xR1pCN05OaTIzZU9laEZwLzFjV0pNZDlhbS8xcTFhZWhwVmVm?=
 =?utf-8?B?cStFeElaMk1UbHNtVml4dk1GM2F2amxUbVBGS0lqU2Y1OXhTcHRzU0FMVm1m?=
 =?utf-8?B?dzNjNzl6K09reWdzOWpncU1UQzNIQ1lzUDBqMEVBQUIyNXorS3pOR095MjFv?=
 =?utf-8?B?M1laMXhkUlBqWms0VCs2S3NMdTQ0VWNkY1ZoL1Q1Y09CNC96UFQ4OWVKY1NJ?=
 =?utf-8?B?dVZrZURFaEZYNVd1T0pTQzRsVDVPZWc3ZytNZFFSSERYaUFNMTNRTzNybnZh?=
 =?utf-8?B?NUt6dTQvbVU2cWpSMnY4bHBXbXlGS2xBZWFDSjRpZDFHVjhkaHVVMEg5T0Ro?=
 =?utf-8?B?anFsb0E0eUNlTTAzRWtYOWducFNtNEg2R3ZDMCt5V1RraFF6enlIM0k3a1dh?=
 =?utf-8?B?aGE2QW9UNU90TU1EZGRoWlErOTVtSEtDU0RrclVqaUZMVjdCeXFiRnBjdU03?=
 =?utf-8?B?RWFxd2pnMGtRRGQ0eElLazdzQ2pLRkM0cHQ4djA3RDkyTDFHTlBhUllwT2ZV?=
 =?utf-8?B?aDNwd21ZbVdFd092VG1ySXh1UU5ZRVlKbGY0Uzg5NWVxNkptdnRLR2s1MTVk?=
 =?utf-8?B?cXpOR0hEeDdjYUNQUEJiVjYxeXR2Kzg3UlBsMU9wK0lnUmlzWnhqNUdYcUlV?=
 =?utf-8?B?MXJaL2JLWkNqb0M5U0hIdlNWZng4NFVuZDFvSEtWUlc3K2J0Q0ovcUQxWjlY?=
 =?utf-8?B?dDFvSnZHUXo1SjNzUXVjRmxpQ1hWR0hvSCtYRk44ZDltdWQ4TC8vQ3ltcmlk?=
 =?utf-8?B?dzF0VWxDbDBBZDdMbXpJSTF3MVlMMWxnMnBqTXNpenErdUxkUlkyWmVNVjZ3?=
 =?utf-8?B?Z3Q1RGJOeVJHVjB2Q08zWlBTcjVaR243bnI5WmNraURTNW1hQ21QOEMxSHJQ?=
 =?utf-8?B?YlVKdXJRUG4vSTlrdGZYTFZ0MTFmZzUvbnRnT1BHSVJ2M1ZTK25EcDVENFJ4?=
 =?utf-8?B?d2xyck9CdUJFZjhqV1FmckFIMXJKSkFGeldnaEY2U1MxTEJoSnhmRjlFS2Mv?=
 =?utf-8?B?UjBvMFd2T0wwRmhUbXptaDVCdkZ1Um5SaXRXMTZ4RmV0dmY1MCtEL0ZaY2oy?=
 =?utf-8?B?VEJkMjN1eW4xd2M2T3RPK28zeVhEUGxKTVFkTHRacThaQmxrZmFWU2VYd2k5?=
 =?utf-8?B?U1lhelBza1ZWVjhuckZiL3p3VmpmOVBJL3g3QytIVHRrTDRsek9BZCtKb2xq?=
 =?utf-8?B?c2VDS1BENGlTN290T3dyUitTWGZSVVJUUkE3MEtua0tNSXJHZGdpcXE5b2tP?=
 =?utf-8?Q?DNX6SG+ig57ZughASD9xLRm7LYszL5L+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3NDaVZ6N0Y4TlFnN21YU0hkU1lTVHdicEFySHFRUms5UjdLWndYS29penBW?=
 =?utf-8?B?V1NhYzBGaDk4ay9QbkhrMVFPQWc0ais1ZWdpdWxPSmtzS3pzWFRVejZmUHhi?=
 =?utf-8?B?ZHdRVnF4cDdPc1g5NWhOb3NQK1NubWZXQ3RBbitmNm5pTm5nVVlMQUMrY3Jq?=
 =?utf-8?B?Ull3Yno0WGM3M2Jad2NGN1Zpd3Y3cEk0RWdTMGZXVEl3YWlHVkNkbkkrNkZK?=
 =?utf-8?B?eTgva21sMktkNGZ1dkVxalNMTWNVVXZnazMxenNpdi8xN3ltMVRLL3Zpam5M?=
 =?utf-8?B?NEtJQy9QOGZrWWZ4elJGTlVwWE5WRm95TG01dVJ2ZXVrREJjTTF5TlhMWUVq?=
 =?utf-8?B?N0EzNlloUndod3FrcmZsUWxWL2pWNHRQZ3NLN1RGK3c4c2pmbXYxcE1KSjRO?=
 =?utf-8?B?d3NIWDlYaUZhNU9Obm9OVTZ3Tm9yU0dERDFncmRLa0VEVEFxcW9TdjMwZmc3?=
 =?utf-8?B?TTF4NUYzVVd3eGVBM2szNW93cVUzYU1rdml3eWxXQzZ0dkp3aHZLcWZWQU1L?=
 =?utf-8?B?VDlORkMxa2pETXVZa1hMbDhRblZsRkRYS1dwVUlOazZENlFmMUQwR09sS01n?=
 =?utf-8?B?bmIxYzF1aTZpR0M0REQ0SGJadWRpcTZEOThZSmhpWklmaVErLzFZZjZVRUls?=
 =?utf-8?B?ZFRQMlo1eklGM1psVzBhUU1EQS84NWM0dVBSSFRmNUFlSEN2RTE0dm5nQnF3?=
 =?utf-8?B?Y2NvUVdnZmJaY2RHVGg5R1BLL0xZM2I2U2M1Ky9HT3liYkRoY1VUNENJMjEy?=
 =?utf-8?B?Snhqd3BuazBzS3J1T1ZTRXV2VnZ3azRPbE1RTDFEQ3phejNORW56WlE0cFU2?=
 =?utf-8?B?Q0NQbVVZQXJybWhIUEJ1RlVnVjZVNVFIeVRJdG53blhOMUF6ZGNJV3lIc2Z3?=
 =?utf-8?B?SWFzdW43NmExUnF4bjNQMjBKaE15cjQzbUNLRlpTcDBKNFUwQ09SZ2JzdndJ?=
 =?utf-8?B?MXp5cGNRRVR0djE0RjFUL1Vlak1mZXRBSFBPWXVCcVZPbExTc292c3M0K05R?=
 =?utf-8?B?bEZ4cThQUHlobkRUZjU3R1d2ZkNySnBYQnpTSG9nZ0RiOUxqc255L0tXcUJp?=
 =?utf-8?B?NFl0MER2OXIrcnI3aTU1aDNab0pHSnB2REFoNThOMWRSUy94Q29FMGZIVW9p?=
 =?utf-8?B?YWV5RDJDZ2tPYmZKK3pTS0k4UVI0cVZYVDJBMnhCZFlwMm9qdDhGeHowK3Q3?=
 =?utf-8?B?a0RNaHo1T3hrakJjZ1BUM0o5MDNTTUpQdisyeFFnZmFhZ0FhRkc4eTVTaEcy?=
 =?utf-8?B?VjdLby9xZWErblpWUUhmelQ4ZkVFcE9NV3VsYXhrcDZ1YkZPQmduZ3pEdU4z?=
 =?utf-8?B?eWlWeGFPc21ZNHlPRm9ScElDM2ZMWTBwMytNQXFyY05nUXRFc1ZVYXVFekg2?=
 =?utf-8?B?Q2lTbTVpRmNsS2JBMU1NaitnYXI1eUI2RHZSbnZIbGE2SkE2ZU9Dbm5FcEdG?=
 =?utf-8?B?dExCd2J1bGN2K0IzMjRYTzhLcS9YdFJCaXhQVkRIMWJ4UURaYnpRekRhWXU5?=
 =?utf-8?B?dG5UN3JHZFpOK3BRRnlJcEMrZDdHUEdORUtzcERmZ0lyWkFGaVdBM2ZLT0pJ?=
 =?utf-8?B?aTNMRTRoWGZwWHNjVHZxWDhabU5yWllPWkU2RHVhY2FtblZndDNRZ1JLcTRI?=
 =?utf-8?B?QWV5OC9NNHFiemd5SGdTbjZRcjhXUzZDTXZXSDI1TzJzMUxRckl0YUpYdFZa?=
 =?utf-8?B?eTA2cGlUZC83azR0aXpITjNoMXhNalZ3cUc0cGtmenJHM0dNbkozc1BkLzAr?=
 =?utf-8?B?RDdnNzlBdDFuNG9vSzVuVjNGc3FTbWdZclpGU2FHM0hFMkVOcmtURzJSZGtG?=
 =?utf-8?B?THNkTGZSUW9kdEE0VGZlNnJnZTVEc2xsZU9SOWFUeUtsK3lYSThCaExNcXA3?=
 =?utf-8?B?T2dpVjdtN1ltWlB4bjZycVdYVUxLQ3Jra1kvT0VrcGdNYnRLRllEVWFHQXRu?=
 =?utf-8?B?SFA2UU1RbUhIWW4weDdINEFidkVLVXdCK2VEZVROT2QwUWVWQXhnWmIzOWVK?=
 =?utf-8?B?Wk5sa2RzK1MxQUErN01LeXdlajJ6VHVaUnRoVWlmT2VFQzdJZjI4QnVjN3hP?=
 =?utf-8?B?V0ZwdDFtdzBmaTRPckJkcFl4dG9VTGxYVXA5allMRGg3NlZDSGRwRmFFaEUv?=
 =?utf-8?B?RXJoSmNucHNhNXMvQ2Foczc0SVgzdFc3U1NYakRRUjY1V3ZNQmdubFNIMERs?=
 =?utf-8?B?M1E9PQ==?=
Content-ID: <6456175C8C95A44FA9CA4359D96C4712@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dfdfba-60aa-4f83-1b4b-08dd2eeca2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 07:26:43.4646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6RWZXvHF+eBbaP1UEdkISaV8W6LnXf1kZIt7wRlIwalt+DgBi5I9sZlAkaNWi1jpTyI6iCLixIIiXDxV20DG2bWTOJ5dn/iVS3jQBhClSzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8096
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_905526908.585371093"
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

--__=_Part_Boundary_001_905526908.585371093
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAxLTA3IGF0IDA3OjE2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAwNy8wMS8yMDI1IDAzOjQyLCBKYXNvbi1KSCBM
aW4gKOael+edv+elpSkgd3JvdGU6DQo+ID4gPiANCj4gPiA+IEJlZm9yZSBwcm9jZWVkaW5nIHdp
dGggdGhpcyBoZWFkZXIgZnVydGhlciwgcGxlYXNlIGFuc3dlciB0bw0KPiA+ID4gYWJvdmUgLQ0K
PiA+ID4gd2h5DQo+ID4gPiBpbnRlcnJ1cHQgbnVtYmVycywgTU1JTyBhZGRyZXNzZXMgYW5kIHNv
bWUgb3RoZXIgdmFsdWVzIGFwcGVhcmluZw0KPiA+ID4gaW4NCj4gPiA+IERUUw0KPiA+ID4gYXJl
IG5vdCB1c2VkIGxpa2UgImJpbmRpbmcgaGVhZGVycyIuDQo+ID4gDQo+ID4gQmVjYXVzZSBpbnRl
cnJ1cHQgbnVtYmVycyBhbmQgTU1JTyBhZGRyZXNzZXMgYXJlIHRoZSByZWFsIG51bWJlcnMNCj4g
PiBvZg0KPiA+IGhhcmR3YXJlIHNldHRpbmdzLiBUaGVpciBkcml2ZXIgY2FuIGdldCB0aGVtIGRp
cmVjdGx5IGZyb20gdGhlaXINCj4gPiBkZXZpY2UNCj4gPiBub2RlIGluIERUUy4gVGhleSBhcmUg
YWN0dWFsIG51bWJlciB0byBiZSBzZXQgaW50byB0aGVpciBoYXJkd2FyZSwNCj4gPiBzbw0KPiA+
IHRoZXkgZG9uJ3QgbmVlZCB0byBiZSB0cmFuc2xhdGVkIGluIHRoZWlyIHBsYXRmb3JtIGRyaXZl
cnMuDQo+ID4gDQo+ID4gU28gSSB0aGluayBhbGwgdGhlIGRlZmluaXRpb25zIGluIHRoZSBgbWVk
aWF0ZWssbXQ4MTk2LWdjZS5oYCBhcmUNCj4gPiB0aGUNCj4gPiBzYW1lIGNhc2UuIFRoZXkgYXJl
IGFjdHVhbCBoYXJkd2FyZSBudW1iZXJzIGZvciBHQ0UgaGFyZHdhcmUgdG8NCj4gPiB1c2UuDQo+
ID4gSXQgc2hvdWxkIGJlIGRyb3AgZnJvbSB0aGUgaW5jbHVkZS9kdC1iaW5kaW5ncy8qLg0KPiAN
Cj4gSSBkaWQgbm90IGluc3BlY3QgYWxsIG9mIHRoZSBkZWZpbmVzIHlvdSBoYXZlIHRoZXJlLiBN
YXliZSBzb21lIGFyZQ0KPiB1c2VkDQo+IGJ5IGRyaXZlciwgc28gSSBkaWQgbm90IHByb3ZpZGUg
eW91IGRlZmluaXRpdmUgYW5zd2VyIG9uIGVudGlyZQ0KPiBoZWFkZXIuDQo+IFRoZSBjb21tZW50
IHdhcyBhZGRyZXNzaW5nIG9uZSBzcGVjaWZpYyBncm91cCBvZiBkZWZpbmVzIHdoaWNoIHdlcmUN
Cj4gbm90DQo+IHVzZWQgYXMgYSBiaW5kaW5nLg0KDQpBbGwgb2YgdGhlIGdjZSBiaW5kaW5nIGhl
YWRlcnMgaW4gYGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLypgIG9yDQpgaW5jbHVkZS9kdC1iaW5k
aW5ncy9tYWlsYm94LypgIGFyZSBub3QgdXNlZCBpbiBhbnkgZHJpdmVycyBhbmQgdGhleQ0KYXJl
IHRoZSBhY3R1YWwgaGFyZHdhcmUgSURzIG9yIHNldHRpbmdzIGZvciBHQ0UsIG5vdCB0aGUgYWJz
dHJhY3QNCmJpbmRpbmdzLg0KDQpNYXliZSBpdCBpcyBhZGRlZCBpbiB0aGUgd3JvbmcgcGxhY2Ug
ZnJvbSB0aGUgdmVyeSBmaXJzdCB0aW1lLg0KSSB0aGluayB0aGV5IHNob3VsZCBiZSBtb3ZlZCB0
byBkdHMgZm9sZGVyIHRvIG1ha2UgaXQgY29ycmVjdC4NCg0KPiANCj4gPiANCj4gPiANCj4gPiBC
VFcsIHRvIG1ha2UgdGhlc2UgbnVtYmVycyBtb3JlIHJlYWRhYmxlIGluIERUUywgY2FuIEkgbW92
ZQ0KPiA+IGBpbmNsdWRlL2R0LWJpbmRpbmdzL21haWxib3gvbWVkaWF0ZWssbXQ4MTk2LWdjZS5o
YCBpbnRvDQo+ID4gYGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk2LWdjZS5oYD8N
Cj4gDQo+IFllcywgc3VyZS4NCg0KT0ssIHRoZW4gSSdsbCBtb3ZlIGl0Lg0KDQpUaGFua3MgZm9y
IHlvdXIgcGF0aWVuY2UgdG8gbGV0IG1lIG1ha2UgaXQgY2xlYXIuDQoNClJlZ2FyZHMsDQpKYXNv
bi1KSC5MaW4NCg0KPiANCj4gPiANCj4gPiBKdXN0IGxpa2UgdGhlIGBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE2Ny1waW5mdW5jLmhgLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg0K

--__=_Part_Boundary_001_905526908.585371093
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDEtMDcmIzMyO2F0
JiMzMjswNzoxNiYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZp
ZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjswNy8wMS8yMDI1JiMzMjswMzo0MiwmIzMy
O0phc29uLUpIJiMzMjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90
ZToNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7QmVmb3JlJiMzMjtwcm9jZWVkaW5nJiMzMjt3aXRoJiMzMjt0aGlzJiMzMjtoZWFkZXImIzMy
O2Z1cnRoZXIsJiMzMjtwbGVhc2UmIzMyO2Fuc3dlciYjMzI7dG8NCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyO2Fib3ZlJiMzMjstDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt3aHkNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2ludGVycnVwdCYjMzI7bnVtYmVycywmIzMyO01NSU8m
IzMyO2FkZHJlc3NlcyYjMzI7YW5kJiMzMjtzb21lJiMzMjtvdGhlciYjMzI7dmFsdWVzJiMzMjth
cHBlYXJpbmcNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2luDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtEVFMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2FyZSYjMzI7bm90JiMz
Mjt1c2VkJiMzMjtsaWtlJiMzMjsmcXVvdDtiaW5kaW5nJiMzMjtoZWFkZXJzJnF1b3Q7Lg0KJmd0
OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtCZWNhdXNlJiMzMjtpbnRlcnJ1cHQm
IzMyO251bWJlcnMmIzMyO2FuZCYjMzI7TU1JTyYjMzI7YWRkcmVzc2VzJiMzMjthcmUmIzMyO3Ro
ZSYjMzI7cmVhbCYjMzI7bnVtYmVycw0KJmd0OyYjMzI7Jmd0OyYjMzI7b2YNCiZndDsmIzMyOyZn
dDsmIzMyO2hhcmR3YXJlJiMzMjtzZXR0aW5ncy4mIzMyO1RoZWlyJiMzMjtkcml2ZXImIzMyO2Nh
biYjMzI7Z2V0JiMzMjt0aGVtJiMzMjtkaXJlY3RseSYjMzI7ZnJvbSYjMzI7dGhlaXINCiZndDsm
IzMyOyZndDsmIzMyO2RldmljZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bm9kZSYjMzI7aW4mIzMyO0RU
Uy4mIzMyO1RoZXkmIzMyO2FyZSYjMzI7YWN0dWFsJiMzMjtudW1iZXImIzMyO3RvJiMzMjtiZSYj
MzI7c2V0JiMzMjtpbnRvJiMzMjt0aGVpciYjMzI7aGFyZHdhcmUsDQomZ3Q7JiMzMjsmZ3Q7JiMz
Mjtzbw0KJmd0OyYjMzI7Jmd0OyYjMzI7dGhleSYjMzI7ZG9uJiMzOTt0JiMzMjtuZWVkJiMzMjt0
byYjMzI7YmUmIzMyO3RyYW5zbGF0ZWQmIzMyO2luJiMzMjt0aGVpciYjMzI7cGxhdGZvcm0mIzMy
O2RyaXZlcnMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NvJiMzMjtJ
JiMzMjt0aGluayYjMzI7YWxsJiMzMjt0aGUmIzMyO2RlZmluaXRpb25zJiMzMjtpbiYjMzI7dGhl
JiMzMjsmIzk2O21lZGlhdGVrLG10ODE5Ni1nY2UuaCYjOTY7JiMzMjthcmUNCiZndDsmIzMyOyZn
dDsmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7c2FtZSYjMzI7Y2FzZS4mIzMyO1RoZXkmIzMy
O2FyZSYjMzI7YWN0dWFsJiMzMjtoYXJkd2FyZSYjMzI7bnVtYmVycyYjMzI7Zm9yJiMzMjtHQ0Um
IzMyO2hhcmR3YXJlJiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYjMzI7dXNlLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7SXQmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO2Ryb3AmIzMyO2Zyb20mIzMyO3RoZSYjMzI7
aW5jbHVkZS9kdC1iaW5kaW5ncy8qLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjtkaWQmIzMy
O25vdCYjMzI7aW5zcGVjdCYjMzI7YWxsJiMzMjtvZiYjMzI7dGhlJiMzMjtkZWZpbmVzJiMzMjt5
b3UmIzMyO2hhdmUmIzMyO3RoZXJlLiYjMzI7TWF5YmUmIzMyO3NvbWUmIzMyO2FyZQ0KJmd0OyYj
MzI7dXNlZA0KJmd0OyYjMzI7YnkmIzMyO2RyaXZlciwmIzMyO3NvJiMzMjtJJiMzMjtkaWQmIzMy
O25vdCYjMzI7cHJvdmlkZSYjMzI7eW91JiMzMjtkZWZpbml0aXZlJiMzMjthbnN3ZXImIzMyO29u
JiMzMjtlbnRpcmUNCiZndDsmIzMyO2hlYWRlci4NCiZndDsmIzMyO1RoZSYjMzI7Y29tbWVudCYj
MzI7d2FzJiMzMjthZGRyZXNzaW5nJiMzMjtvbmUmIzMyO3NwZWNpZmljJiMzMjtncm91cCYjMzI7
b2YmIzMyO2RlZmluZXMmIzMyO3doaWNoJiMzMjt3ZXJlDQomZ3Q7JiMzMjtub3QNCiZndDsmIzMy
O3VzZWQmIzMyO2FzJiMzMjthJiMzMjtiaW5kaW5nLg0KDQpBbGwmIzMyO29mJiMzMjt0aGUmIzMy
O2djZSYjMzI7YmluZGluZyYjMzI7aGVhZGVycyYjMzI7aW4mIzMyOyYjOTY7aW5jbHVkZS9kdC1i
aW5kaW5ncy9nY2UvKiYjOTY7JiMzMjtvcg0KJiM5NjtpbmNsdWRlL2R0LWJpbmRpbmdzL21haWxi
b3gvKiYjOTY7JiMzMjthcmUmIzMyO25vdCYjMzI7dXNlZCYjMzI7aW4mIzMyO2FueSYjMzI7ZHJp
dmVycyYjMzI7YW5kJiMzMjt0aGV5DQphcmUmIzMyO3RoZSYjMzI7YWN0dWFsJiMzMjtoYXJkd2Fy
ZSYjMzI7SURzJiMzMjtvciYjMzI7c2V0dGluZ3MmIzMyO2ZvciYjMzI7R0NFLCYjMzI7bm90JiMz
Mjt0aGUmIzMyO2Fic3RyYWN0DQpiaW5kaW5ncy4NCg0KTWF5YmUmIzMyO2l0JiMzMjtpcyYjMzI7
YWRkZWQmIzMyO2luJiMzMjt0aGUmIzMyO3dyb25nJiMzMjtwbGFjZSYjMzI7ZnJvbSYjMzI7dGhl
JiMzMjt2ZXJ5JiMzMjtmaXJzdCYjMzI7dGltZS4NCkkmIzMyO3RoaW5rJiMzMjt0aGV5JiMzMjtz
aG91bGQmIzMyO2JlJiMzMjttb3ZlZCYjMzI7dG8mIzMyO2R0cyYjMzI7Zm9sZGVyJiMzMjt0byYj
MzI7bWFrZSYjMzI7aXQmIzMyO2NvcnJlY3QuDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0JUVywmIzMyO3RvJiMz
MjttYWtlJiMzMjt0aGVzZSYjMzI7bnVtYmVycyYjMzI7bW9yZSYjMzI7cmVhZGFibGUmIzMyO2lu
JiMzMjtEVFMsJiMzMjtjYW4mIzMyO0kmIzMyO21vdmUNCiZndDsmIzMyOyZndDsmIzMyOyYjOTY7
aW5jbHVkZS9kdC1iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni1nY2UuaCYjOTY7JiMz
MjtpbnRvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzk2O2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTk2LWdjZS5oJiM5NjsmIzYzOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtZZXMsJiMzMjtz
dXJlLg0KDQpPSywmIzMyO3RoZW4mIzMyO0kmIzM5O2xsJiMzMjttb3ZlJiMzMjtpdC4NCg0KVGhh
bmtzJiMzMjtmb3ImIzMyO3lvdXImIzMyO3BhdGllbmNlJiMzMjt0byYjMzI7bGV0JiMzMjttZSYj
MzI7bWFrZSYjMzI7aXQmIzMyO2NsZWFyLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtKdXN0JiMzMjts
aWtlJiMzMjt0aGUmIzMyOyYjOTY7YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNjct
cGluZnVuYy5oJiM5NjsuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Jlc3QmIzMyO3JlZ2FyZHMsDQom
Z3Q7JiMzMjtLcnp5c3p0b2YNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChi
eSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2Yg
DQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3Rl
bSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55
IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_905526908.585371093--

