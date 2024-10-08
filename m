Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E61993DBA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 05:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE64110E202;
	Tue,  8 Oct 2024 03:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="m4UBaDbm";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="spwKsSWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560EC10E202
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 03:56:32 +0000 (UTC)
X-UUID: 4a85a32e852911ef88ecadb115cee93b-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Qr9T+i3lSqfCKxtRB04MJSrfQlhh+41fiTQptZte730=; 
 b=m4UBaDbm8nC5NDJ/mm9b3oL5rCpWkYUJH4g6lS3vm1TqEShXixU/JnTnxoAi2uFyhJqbEjzqQvXQCahLtNfxU6KQondRzVEvYnIhrDSBlHO7wcRvqSC2ijXEzDgDOlhlvmwB7MdOf1McB1hkSWxbOI7siKszMjtTYg77MqT/6yU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:5ca3a4dd-7fb7-4d3d-9343-e832e1a308f9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:17aae940-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4a85a32e852911ef88ecadb115cee93b-20241008
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 552529202; Tue, 08 Oct 2024 11:56:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 11:56:25 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Oct 2024 11:56:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXneSgaPmgAxnSxHheZXw5z42Idw8EB+tMBofcR5gpTbHp5B/u86N1oJdmk10B2WU5TuJPspgjdSNCBqxy6KRCEhKGqZnDQOEMDSxHWByKR9GC1pa8JblTDhMJYMX/9zc4koiehk+5s6RmyxvRiXu4t+WFahNj45bfGi1t0N/6zahMH7KozFto0SryVA268w4sL+MTYd/6JuYh7RMiPL0f0jne5OlzP8UWToG9e3z4uMfvUai4F8MiL91YUM3br+I5+O51z6QRnCa7OeUF0ll/jCpl1gSuUpq+8EvBdHpBNFwp2ryZo2Doz75yjbM5cH2tnv9MGz3NX/gHZX4ffy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+xxCjeFXv+vXKNx2ws5dXjO2a6+DpCHy5FYCczPtqo=;
 b=SZxZanGeLXTsFZut4WVQzCWyiXi1nav98XAT+Yya4rKqHqlYXHHgN+qMX6a0S8+4npoekUmtbIsRv2Ex14IW+Ph8V8YSspD+jOat9gM5VmPMXWWa3CAB8OZgcslFjN80FE+PfD6/beDt3lIBc2fVARkGqRU4r9DRi9zZaC036fLfiSvKAOrugj5qJbLhnS6jCEHSjC6Ec78Pd1M4NaN7UKtV/awpxVVP6VJi/jSqhZCph4F9tNFgeYZ1tEC/kSwL0MRw+FqjZF/QeWVx43tNImjvmj/VKZ0qyrhrIHxW3tjwuwYvN17l0/xrVhkClvItq4SW0OSzYVGqdiqaxrljqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+xxCjeFXv+vXKNx2ws5dXjO2a6+DpCHy5FYCczPtqo=;
 b=spwKsSWacCU1TJW8siMpBHcr6Puyj5s+3PPuCE3P4UIcMMzDwR/xVjezoOSG+5cHF8pa66Zr2+/unGY8u8JLiDCnwHli0eUI7XSOI0sv8TpOdgZKBvIzpataTH2APnCgP7TXIW6MrlFa7S0CfMP9D1jvf1vYEZJU65jRW67pVRg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7882.apcprd03.prod.outlook.com (2603:1096:400:483::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 8 Oct
 2024 03:56:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 03:56:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "me@adamthiede.com" <me@adamthiede.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "yassine.oudjana@gmail.com"
 <yassine.oudjana@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 2/5] drm/mediatek: ovl: Refine ignore_pixel_alpha
 comment and placement
Thread-Topic: [PATCH v9 2/5] drm/mediatek: ovl: Refine ignore_pixel_alpha
 comment and placement
Thread-Index: AQHbGIbpZMmE34QgKkWg1d1skz/42rJ8OwSA
Date: Tue, 8 Oct 2024 03:56:22 +0000
Message-ID: <0540f783d0c011b8f8ba3fa1f173616ff2e26d91.camel@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
 <20241007070101.23263-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20241007070101.23263-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7882:EE_
x-ms-office365-filtering-correlation-id: 6452421b-20b2-47bb-b0b8-08dce74d2c41
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NE5YY1pMelNxQW9ybEtJMFdKQW5wY2UwR1JlS1BvMy91NGxyaEMvdVFUemxz?=
 =?utf-8?B?UU9ybkZXRVFHTTZxcXpaSDFVWjcrL3lEU3Z1LzJhbklXMmJZL0tyZ2h0aVNu?=
 =?utf-8?B?R0lpSVhvUFh6ejRCNVJRYWcxRWN3WDFTUGZ4eXBRQmVCbyt2ZGdqaFlzb0Ja?=
 =?utf-8?B?ckdCeVBkQlJycnRxTVY0VzdramlHWHJtaUdhYktrNFhCWllqSEUvTFNyL1dX?=
 =?utf-8?B?ckZJNy92eWhDdTVSZTRuejlDeHZkaHNIcCtYdVF6Vm5mcFlvV0N1aTJTR1hI?=
 =?utf-8?B?V3lHM3lveVROWWoxSkNqamtXb3FKeEU1TXZNM2gzQ3hqejgzZE9ZZzhNQ2h2?=
 =?utf-8?B?NkdPeGhWb2VGUTNPbUVBRUt2bVVVV0FzY2FwUDQ3UXVBalVhNUlNR0trbGVV?=
 =?utf-8?B?Q3hoUDdtbzhHQ3dxZ0FmUFNSZVVjTDMzZzBnMTBCcFVlcWtab00wQ20vUnJx?=
 =?utf-8?B?Rk9JS1JMZGdqdW9qcnVQc2t0OGZxaTJyMGxpWHpxVkJudlRvN2dvbDZaWGNZ?=
 =?utf-8?B?cHdJTDA2YTBHYmc2V0dqeTNYNllmVWRETlFJTC85cTBSeXNxTUIvZUV0cGlm?=
 =?utf-8?B?K2JiMFI2YklhUWFZTy9STzJTdVd1cnJ6WWJzZzlpYTl4b2N4SlBuT0FhMTVB?=
 =?utf-8?B?cnkzQk5FcGdubDR0SlIyT3B3UHFTOW52Z1d4eVk4ck14Mnpnc2c1Vy9HbnR5?=
 =?utf-8?B?dmRFNTYrK3V2SXdxV2s2alZWTTRvU1h3WnZCc3dQRThMR1cxYlB3MGlnTy9k?=
 =?utf-8?B?eXFSYXcxY3lEYXVJWmNKY3Y0U2F6dlBXcFpGNnRRZGhiZnJLRXJldy96TVJY?=
 =?utf-8?B?NmVyVHBGanI2UVRpdVRGajBGU1QwSlRyYllucWg5WVlBSnl3TFlZR3JxWDhP?=
 =?utf-8?B?THdJNllQbldTQjZ1cFBldXFuUGY3bDlwNDIyV3hicHJCeHhzRTIrZlJGMDlu?=
 =?utf-8?B?cG1WSWN1UERNSHlSNndGVldjQ0E2dlBmNndYN0JDTWt4REx6aGVRbDJUdGNn?=
 =?utf-8?B?emozcWhlMmwyTG9DRTYyTVh1enQrV01wNnAvV1BKTG9UUWl3Vy9VUStnNjhu?=
 =?utf-8?B?SFJsZm4yY2VSaDhtc2FTYjlNOEhsZWRUZ1U1VS9wM0V3NlpOUkFqNHdLQVJO?=
 =?utf-8?B?bEY3dmZFT2JoMm80ZVdWVFNCNXRvYmlqZk9uRFVCS3dlYndLc1JCR3FKcHdw?=
 =?utf-8?B?b2lFMWhoUy9rVjJnbmdjMDR6YVFsLzFhR2gzdGUrRUlGTTN3cVlBY05IZ1B0?=
 =?utf-8?B?NnNuOHZ1M29kT2RRbGlyYklMd2d2UUdKRjlhNEFGQVJvNWo0STZYNnF5Zmc0?=
 =?utf-8?B?UzBHUjM4endHclM1amtlOEIvRmZzNnFoVUtKZWhCQ3plUXBFRVlJdTBhRVJ4?=
 =?utf-8?B?Uk40b0ZoWFBVeXJNN2FGVURpckNrTHdQTG5XWmlzZ2NGZDM3TDhqZ3VFMHQr?=
 =?utf-8?B?T3U3VmVkVmJsdStyaE5pYmtTdXE5WHRlZkQ4NHFRMDFqNGkrdWRZTy9ZODhH?=
 =?utf-8?B?cDVUUFVIZzJ1NkJmRVZvbEFWSVJ1dENOVkk3ZTJnRmZ3S2dvOFl4WWZtWHY3?=
 =?utf-8?B?Rm9jZUFRcVh5TVJZQ0NBN2hVMi9DSXJpSEdPU1JsNFg0WmxQZ1YvZUhwaTdQ?=
 =?utf-8?B?NFlXai9QemNaaFJ1azNmc05Fc0Z1QVQ2bUNoSWN4WG1ILzZZMm1jWEp4eHVx?=
 =?utf-8?B?djNNM3k3OEg4RVdUZXNMRmVDQnpSdFI4OUZlNmFmMDUvcHVkMHNWRHB5Tmsv?=
 =?utf-8?B?L0xHZFB2RmpKZmwwMC9PanZURUhsZVI1Q09sOGdJUFlaeUhNWEIzNTA2RC9Y?=
 =?utf-8?B?Y2g4YVJ4SzQrUDVNajhiQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWhjUHduYzNqK1d2b2JPMTliMDZ0OHBURXhXNHBPa052QjRuQjJRWDVqdkxh?=
 =?utf-8?B?b0pheVJPWldPc1JldCtUMnY1aHBsSXY2NzNobm5iekIvaTg4b1A4QnpDSGNo?=
 =?utf-8?B?UCs0Qk42QlFZaUttTlkzMTh5aDQ5Zk1EMUJrUXVUM1NaaHh4YXVqQkRSZi9s?=
 =?utf-8?B?M05LTG5vUkQyMEh0MkxnWWVtWXoyTE5ha1llMkt6bWZKblBLVGRyY1ZsWW8r?=
 =?utf-8?B?d2tJb09uUEV2bHBUSzlyYlA2bVlDU282a0lCaFh2QWpEbzJuU3FyczZmMXpy?=
 =?utf-8?B?NVpkWnptRWoxZERHU2NvY3V4TmZYWEQwZEgydnFScW4xMmVKV2g3djFSSVIx?=
 =?utf-8?B?cHRES3REcTg2VUVKdjh1VXFpdEZjdkV3d3VrdENHTWV0L2QxVjQ4OTl6SzhG?=
 =?utf-8?B?bU1mbjV6ZXpURDNvL1Z2L3E2UVRUeHUyYUVPWFAzWW9TbnhuMmVQWVNHL0g3?=
 =?utf-8?B?dkU0cGpaR1U4bWxCcjVUWFJLTzdGUzRmVEtYYm9RZndna0MyV25sMmhKb1Jh?=
 =?utf-8?B?VTF4UDRsb1UzZEdGSHkvWmFxN2FGN3RmUEtwTVltbjNzcDNvSnRtYXg0M1RG?=
 =?utf-8?B?eFRGVktVeEtjUWxyb0lRSlFLMHJGeHZBTjFYdm5sYmFiRjE2dzVibkpPMkV2?=
 =?utf-8?B?MDUvb3BJTk0vaFErYTkxT3NCSENQazhEOTRMbSsrZ0FaYVhqTnVuSGYvVWVC?=
 =?utf-8?B?OGViOXpncjJ4SVR5MTBJT2tjRVhiR1RkVzVqZW9ER25TMVk2NzJFVnRVVE9u?=
 =?utf-8?B?THNuOUFIdGZ4ODR5Tk1Nb3FqNDE0WERZUmNzMk0yazlDWmYxMzRjU0ZyZVYr?=
 =?utf-8?B?bXEvc0lxUmkyc085Z3cxTUpxWDRlUGtsRTdGeDZNWWE1RFhqeEdCdjNKdDhE?=
 =?utf-8?B?dkhCWXMvcWJTYWN1cWxSQjd2ZnY1bWh3bkc0Zm1ETmRBNjM1K21BN25idGhz?=
 =?utf-8?B?T1ljMldyQnR5ZWZ5Tk82MVIzMXBFcFNxSXMwZlpIQ2x2UnZJQzdIbmxmQ2pK?=
 =?utf-8?B?anROSlJSRXBDYWxZWlhVSVlPZVpzSkw1dXhrNGZGd3lldy9rM0FkRlBpM3R4?=
 =?utf-8?B?SUYzUnlqMjYyL2hDUGJ0T0N1Qk4wSE9UM1drKzRvNlBkK3l6clBOS3BpYlhh?=
 =?utf-8?B?SUx1UkFaNzh3cmU4VkxsWFN3ZkVIY2c0dUxyWlh2b1ZTcXRyMG5id2lQc0tR?=
 =?utf-8?B?ZjZBcjY5dHY5RzIrd011cVR3cjNwM3pDeUJ6R3pjY2dlbkpBcitFc2tIQ2ds?=
 =?utf-8?B?cDlTR3F5aVk5RHQxR1JrNmxxRGh1Z3RiTjNZUUM2MWJXUkFiRVBjQy9VekVs?=
 =?utf-8?B?cFFyZWVMS1JiNE9Vb2lEdStid20wRXhPaGZvcE44c0NXSFJISy9rME5uMVNR?=
 =?utf-8?B?anZZdjV0Yk53L3ZwWTNzWldEMHB2bUN5ZHBZRHduNGF0emU4eEVDTkNaUDdL?=
 =?utf-8?B?YmNUNVhzNENpMGlyMjZ0emJmREY4SmczUytmNzYyWW9jRUdtM0swSzVxL29K?=
 =?utf-8?B?dmJtYzR0V3FyQ3FMbkJ3WnEybHYvK1dzZnQ1V0RVMDhHMzk2UEM4L2lvM1dZ?=
 =?utf-8?B?UlpackNuSXNnS2ZwdFREczV3S1BpZFB0Rmo3RUIrZnN3eFY2MXhnQzc2UVhM?=
 =?utf-8?B?ekwyd01oSGZKWFBxYmovT1FzRit4eEUxcTlQelRaK1RMa1NMdTBaMG5tRGZX?=
 =?utf-8?B?cStUM2FjU2VvaWd6ZG9OTy9vT2FtZWE4eWc3dnJlcTVJdXFZQmM3TG1KSFJw?=
 =?utf-8?B?ZFFGcUZjbE9Xd3FiQWlKem12bWF2U1VWK2tsOFF5V2lUeFQ2NGNmOVN1VEtE?=
 =?utf-8?B?UkhiWmVhUVl6L21TUVZpU1ovRjdNWWhPV3BDcCs4dGhuV2lEbVd3V3NrY0cy?=
 =?utf-8?B?VWtDL0NuQnNUQVlZcVZuY25TSEhvTnErMlNYSmQ5WG9yU1hmZTZHQUkvWUZo?=
 =?utf-8?B?M1VnQmdrQ3BNMDBiZ1hteWVTNFhDY1p2MGxvZklHTFd0RTRIVVdsd1lGd3h1?=
 =?utf-8?B?a0M2bkZuVWlDellRcngxbWpTem1rcFhVSUtLSU5qNW8zQUdMQ0lEbGswS1Zl?=
 =?utf-8?B?d293RzNNN292RnhGa3BKaElVb2lnd0drUlhyc0pnZXR6WmlpUG00cVMxMFI2?=
 =?utf-8?Q?3YoRpgvFkVqu+yc0rnZj3i+cC?=
Content-ID: <7BC290877A1E5F42AD92CDABE1DEBCF7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6452421b-20b2-47bb-b0b8-08dce74d2c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 03:56:22.0463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P5bDzgTxjQIiNo22Mh/GXmRxLgQxprLuzE8Ccy/kMwTVBZoznkdgzI+5zNuS2Gpd0c19ERwmmBIYJFF9w6t97g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7882
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_63172691.984641870"
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

--__=_Part_Boundary_004_63172691.984641870
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBNb24sIDIwMjQtMTAtMDcgYXQgMTU6MDAgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gUmVmaW5lIHRoZSBjb21tZW50IGZvciBpZ25vcmVfcGl4ZWxfYWxwaGEg
ZmxhZyBhbmQgbW92ZSBpdCB0bw0KPiBpZiAoc3RhdGUtPmZiKSBzdGF0ZW1lbnQgdG8gbWFrZSBp
dCBsZXNzIGNvbmRpdGlvbmFsLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMNCj4gaW5kZXggODQ1M2E3MmY5ZTU5Li5kZGM4MjZjNDI2NTMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gQEAgLTQ4MSwxNiAr
NDgxLDE2IEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1
bnNpZ25lZCBpbnQgaWR4LA0KPiAgCQkgKi8NCj4gIAkJaWYgKGJsZW5kX21vZGUgfHwgc3RhdGUt
PmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKQ0KPiAgCQkJY29uIHw9IE9WTF9DT05fQUVOOw0K
PiAtCX0NCj4gIA0KPiAtCS8qIENPTlNUX0JMRCBtdXN0IGJlIGVuYWJsZWQgZm9yIFhSR0IgZm9y
bWF0cyBhbHRob3VnaCB0aGUgYWxwaGEgY2hhbm5lbA0KPiAtCSAqIGNhbiBiZSBpZ25vcmVkLCBv
ciBPVkwgd2lsbCBzdGlsbCByZWFkIHRoZSB2YWx1ZSBmcm9tIG1lbW9yeS4NCj4gLQkgKiBGb3Ig
UkdCODg4IHJlbGF0ZWQgZm9ybWF0cywgd2hldGhlciBDT05TVF9CTEQgaXMgZW5hYmxlZCBvciBu
b3Qgd29uJ3QNCj4gLQkgKiBhZmZlY3QgdGhlIHJlc3VsdC4gVGhlcmVmb3JlIHdlIHVzZSAhaGFz
X2FscGhhIGFzIHRoZSBjb25kaXRpb24uDQo+IC0JICovDQo+IC0JaWYgKChzdGF0ZS0+YmFzZS5m
YiAmJiAhc3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKSB8fA0KPiAtCSAgICBibGVu
ZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpDQo+IC0JCWlnbm9yZV9waXhlbF9h
bHBoYSA9IE9WTF9DT05TVF9CTEVORDsNCj4gKwkJLyoNCj4gKwkJICogQWx0aG91Z2ggdGhlIGFs
cGhhIGNoYW5uZWwgY2FuIGJlIGlnbm9yZWQsIENPTlNUX0JMRCBtdXN0IGJlIGVuYWJsZWQNCj4g
KwkJICogZm9yIFhSR0IgZm9ybWF0LCBvdGhlcndpc2UgT1ZMIHdpbGwgc3RpbGwgcmVhZCB0aGUg
dmFsdWUgZnJvbSBtZW1vcnkuDQo+ICsJCSAqIEZvciBSR0I4ODggcmVsYXRlZCBmb3JtYXRzLCB3
aGV0aGVyIENPTlNUX0JMRCBpcyBlbmFibGVkIG9yIG5vdCB3b24ndA0KPiArCQkgKiBhZmZlY3Qg
dGhlIHJlc3VsdC4gVGhlcmVmb3JlIHdlIHVzZSAhaGFzX2FscGhhIGFzIHRoZSBjb25kaXRpb24u
DQo+ICsJCSAqLw0KPiArCQlpZiAoYmxlbmRfbW9kZSA9PSBEUk1fTU9ERV9CTEVORF9QSVhFTF9O
T05FIHx8ICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpDQo+ICsJCQlpZ25vcmVf
cGl4ZWxfYWxwaGEgPSBPVkxfQ09OU1RfQkxFTkQ7DQo+ICsJfQ0KPiAgDQo+ICAJaWYgKHBlbmRp
bmctPnJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9ZKSB7DQo+ICAJCWNvbiB8PSBPVkxfQ09O
X1ZJUlRfRkxJUDsNCg==

--__=_Part_Boundary_004_63172691.984641870
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO01vbiwmIzMy
OzIwMjQtMTAtMDcmIzMyO2F0JiMzMjsxNTowMCYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7UmVmaW5lJiMzMjt0aGUmIzMyO2NvbW1lbnQmIzMyO2ZvciYj
MzI7aWdub3JlX3BpeGVsX2FscGhhJiMzMjtmbGFnJiMzMjthbmQmIzMyO21vdmUmIzMyO2l0JiMz
Mjt0bw0KJmd0OyYjMzI7aWYmIzMyOyhzdGF0ZS0mZ3Q7ZmIpJiMzMjtzdGF0ZW1lbnQmIzMyO3Rv
JiMzMjttYWtlJiMzMjtpdCYjMzI7bGVzcyYjMzI7Y29uZGl0aW9uYWwuDQoNClJldmlld2VkLWJ5
OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNv
bi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7MTgmIzMyOysr
KysrKysrKy0tLS0tLS0tLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYj
MzI7OSYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzkmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ODQ1M2E3MmY5ZTU5Li5kZGM4MjZjNDI2NTMmIzMyOzEw
MDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYw0KJmd0OyYjMzI7QEAmIzMyOy00ODEsMTYmIzMyOys0ODEsMTYmIzMyO0BAJiMz
Mjt2b2lkJiMzMjttdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRl
diwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7JiMzMjsqLw0K
Jmd0OyYjMzI7JiMzMjtpZiYjMzI7KGJsZW5kX21vZGUmIzMyO3x8JiMzMjtzdGF0ZS0mZ3Q7YmFz
ZS5mYi0mZ3Q7Zm9ybWF0LSZndDtoYXNfYWxwaGEpDQomZ3Q7JiMzMjsmIzMyO2NvbiYjMzI7fD0m
IzMyO09WTF9DT05fQUVOOw0KJmd0OyYjMzI7LX0NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjst
LyomIzMyO0NPTlNUX0JMRCYjMzI7bXVzdCYjMzI7YmUmIzMyO2VuYWJsZWQmIzMyO2ZvciYjMzI7
WFJHQiYjMzI7Zm9ybWF0cyYjMzI7YWx0aG91Z2gmIzMyO3RoZSYjMzI7YWxwaGEmIzMyO2NoYW5u
ZWwNCiZndDsmIzMyOy0mIzMyOyomIzMyO2NhbiYjMzI7YmUmIzMyO2lnbm9yZWQsJiMzMjtvciYj
MzI7T1ZMJiMzMjt3aWxsJiMzMjtzdGlsbCYjMzI7cmVhZCYjMzI7dGhlJiMzMjt2YWx1ZSYjMzI7
ZnJvbSYjMzI7bWVtb3J5Lg0KJmd0OyYjMzI7LSYjMzI7KiYjMzI7Rm9yJiMzMjtSR0I4ODgmIzMy
O3JlbGF0ZWQmIzMyO2Zvcm1hdHMsJiMzMjt3aGV0aGVyJiMzMjtDT05TVF9CTEQmIzMyO2lzJiMz
MjtlbmFibGVkJiMzMjtvciYjMzI7bm90JiMzMjt3b24mIzM5O3QNCiZndDsmIzMyOy0mIzMyOyom
IzMyO2FmZmVjdCYjMzI7dGhlJiMzMjtyZXN1bHQuJiMzMjtUaGVyZWZvcmUmIzMyO3dlJiMzMjt1
c2UmIzMyOyFoYXNfYWxwaGEmIzMyO2FzJiMzMjt0aGUmIzMyO2NvbmRpdGlvbi4NCiZndDsmIzMy
Oy0mIzMyOyovDQomZ3Q7JiMzMjstaWYmIzMyOygoc3RhdGUtJmd0O2Jhc2UuZmImIzMyOyZhbXA7
JmFtcDsmIzMyOyFzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0LSZndDtoYXNfYWxwaGEpJiMz
Mjt8fA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7YmxlbmRfbW9kZSYjMzI7PT0mIzMy
O0RSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpDQomZ3Q7JiMzMjstaWdub3JlX3BpeGVsX2FscGhh
JiMzMjs9JiMzMjtPVkxfQ09OU1RfQkxFTkQ7DQomZ3Q7JiMzMjsrLyoNCiZndDsmIzMyOysmIzMy
OyomIzMyO0FsdGhvdWdoJiMzMjt0aGUmIzMyO2FscGhhJiMzMjtjaGFubmVsJiMzMjtjYW4mIzMy
O2JlJiMzMjtpZ25vcmVkLCYjMzI7Q09OU1RfQkxEJiMzMjttdXN0JiMzMjtiZSYjMzI7ZW5hYmxl
ZA0KJmd0OyYjMzI7KyYjMzI7KiYjMzI7Zm9yJiMzMjtYUkdCJiMzMjtmb3JtYXQsJiMzMjtvdGhl
cndpc2UmIzMyO09WTCYjMzI7d2lsbCYjMzI7c3RpbGwmIzMyO3JlYWQmIzMyO3RoZSYjMzI7dmFs
dWUmIzMyO2Zyb20mIzMyO21lbW9yeS4NCiZndDsmIzMyOysmIzMyOyomIzMyO0ZvciYjMzI7UkdC
ODg4JiMzMjtyZWxhdGVkJiMzMjtmb3JtYXRzLCYjMzI7d2hldGhlciYjMzI7Q09OU1RfQkxEJiMz
MjtpcyYjMzI7ZW5hYmxlZCYjMzI7b3ImIzMyO25vdCYjMzI7d29uJiMzOTt0DQomZ3Q7JiMzMjsr
JiMzMjsqJiMzMjthZmZlY3QmIzMyO3RoZSYjMzI7cmVzdWx0LiYjMzI7VGhlcmVmb3JlJiMzMjt3
ZSYjMzI7dXNlJiMzMjshaGFzX2FscGhhJiMzMjthcyYjMzI7dGhlJiMzMjtjb25kaXRpb24uDQom
Z3Q7JiMzMjsrJiMzMjsqLw0KJmd0OyYjMzI7K2lmJiMzMjsoYmxlbmRfbW9kZSYjMzI7PT0mIzMy
O0RSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUmIzMyO3x8JiMzMjshc3RhdGUtJmd0O2Jhc2UuZmIt
Jmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKQ0KJmd0OyYjMzI7K2lnbm9yZV9waXhlbF9hbHBoYSYj
MzI7PSYjMzI7T1ZMX0NPTlNUX0JMRU5EOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjsmIzMyO2lmJiMzMjsocGVuZGluZy0mZ3Q7cm90YXRpb24mIzMyOyZhbXA7JiMzMjtE
Uk1fTU9ERV9SRUZMRUNUX1kpJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO2NvbiYjMzI7fD0mIzMyO09W
TF9DT05fVklSVF9GTElQOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_63172691.984641870--

