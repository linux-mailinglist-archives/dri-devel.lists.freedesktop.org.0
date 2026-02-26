Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBMPDjDnn2kuewQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 07:24:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4221A14C4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 07:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B110E05C;
	Thu, 26 Feb 2026 06:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="g4SAAhf2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hkrLnb23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF6B10E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 06:24:41 +0000 (UTC)
X-UUID: d015acf012db11f1b7fc4fdb8733b2bc-20260226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=MqnQLcgNhJaQEreYZJUHsFcQ5ukX4sNAi+J1sxUo7wY=; 
 b=g4SAAhf2Vn9UnEbe4ShOrSUi5KWNFO585Qs50z70dEaqz3D0k6SwY6E1CGCb5Tl3nSHX218B29Tue5JE1q4D5AIFM0K4butx/B8LKiXemu+FA5w+dzpqr83vRqUY/RNFPsVBu4U97ACSuZci0lbx+gwB2SXt5JJqqNel3YmSMm4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:e150c200-927f-4e1c-aa88-f49d5f87ba51, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:2f12a15b-a957-4259-bcca-d3af718d7034,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
 ,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d015acf012db11f1b7fc4fdb8733b2bc-20260226
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1435530263; Thu, 26 Feb 2026 14:24:32 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Feb 2026 14:24:30 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Feb 2026 14:24:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWz5sMn9z4u5l3rTgqmqUNy0cnAdisirylNgeuvOCRYtqkoMVjA74uOHW5K0hypILHl1PwC9yFnHGGddGpMLHLtja9WHB9Ud9OmYK6GZLO+Yvw202TP1WkkddaCcKNcKE5rNJjFT79qFOb3Vli9TI9MR8YcOPvIx1CjotaJyYDZcveZtDQDtFQtDRSxMuRtEBrQC3nrPgV/Tpd8WCOeTrCGy1AB39QP9PztpOk7CQgXikyIOYi4m8F3oguVDIU2VmPpN06cXAJkcKAnykihs/pbT/Z9xJ9TcqjfUzULX6DZNucPJCQJPfX9gSVeRJqAnQV0imoI5I7MAgqGtPP4iAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+KZwufMJ11ICfhycSv6CIttDGX/0xr30fwSvo/mIBM=;
 b=Zft/p9zhYkNtSCGW6GjI6L9xBL1RbXueplbqhJc3ILxSw2n3vmlCZE6nn8F0t7tojz/Xh3+goPKnsyIVOiAX+hqyGQk+3lw5gS8WJdfAoWEp3MXHoJ3h6G2yd5GPpVEPqmPKhjiyrn5I4Dn06Rl9YiDPaWuY1yOoZAYmHM5cg6zx/bR22cQE4gXJVY5m3aCUkg+6qLbq9fPQ3OrAGiYWzsIWLMVuswsdrw3TEwzqumKaDzHsaji9XUjWR4aXExUcKlIMnYLtqg8ZRvHNZKETNEwp0iZZ9TdIr+5r0GdPqCouFvcJsyQ7Nlk2VP2MbBggMvxyYZptEssFomTi1IhHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+KZwufMJ11ICfhycSv6CIttDGX/0xr30fwSvo/mIBM=;
 b=hkrLnb238/Ddwa7XuCZxRcnlYzJwsUc48nR2sxGRNXJPTUu4ySR9Yv+6Y/LuVD056aodeXgFjIYwg93BjxBhJk8/8zB27KyLek0NusyVaAEOL6HJI+tTeFq/2Ps+E0c2oYSq998q338dnni3mMhnZPB1nSGXMa3So8Udi7U/q+s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7710.apcprd03.prod.outlook.com (2603:1096:400:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 06:24:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 06:24:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>, "Nicolas
 Prado" <nfraprado@collabora.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>
CC: "wiagn233@outlook.com" <wiagn233@outlook.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>, Daniel Stone
 <daniels@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "kernel@collabora.com"
 <kernel@collabora.com>, Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "xaver.hugl@gmail.com"
 <xaver.hugl@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Thread-Topic: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Thread-Index: AQHcdETgu5VPqU2x3kSZZ+zVV6eomrU5AF8AgARNwICAAffWgIA2YfiAgABIbQCAHvg4AA==
Date: Thu, 26 Feb 2026 06:24:27 +0000
Message-ID: <3efaa7ec40c68f0d463da00c3a57474a40d4fdae.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
 <20260206110901.660cf712@eldfell>
 <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
In-Reply-To: <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7710:EE_
x-ms-office365-filtering-correlation-id: d924a7af-ff49-4606-b045-08de74ffb138
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|42112799006|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: 08kXm8clyyQPxs/uKkuomoscfUIuFyvrnUzosTPdWIbXL8XqAgYrjNfes8z957MyzC3bWJr+OpbyMs/KoqOX0nxAv8W6AlHqZzeKghH5w3+0WYBJtHB0c023PhAQT9DB1NtcA1xnrpYMBFD6OycD+jBPTarG2B3SoD7tbfIJDekfWPuzpbzi4AjgCVQ4MyIOhcrRSSbGTod6t6TacjDKCgxsKYuvXZ2xqGV0TsyzQqQShGgCkWtF+Psd0CmdfYZraILEf7Sgu7Qa4CEYsHcGSc7wuIosYJy1WSjv/Vzoi1+XRLyDVeiTv/i136cu0b2Vg+vAwt7Q54vLboDV+0DPHZT0MMoFc7qJ/375bvGp7rEMrkCsMc6tft2L8wj7R3vllmaFFi96zcYGXwPfloaPdj1JkOCWv8H6klp4qOakJVlBTRx4uXLOcDaijOjo9GJPWk3Z3mjQwePOQELq1Cs+u9mjOFhICTmWEkS33HYKR/B+CHtgpO1S8OGfDxeFIv9D0ysDQOn6cHZBZHpyTI2nq8flv9UThlzxguRdHvJDpSVAAEKiywK1o519DIOOuEO2ZQaXgYyupNezF+IYQBTULCgBGs5z4CP0Sx/BnjynMuFr9pXW/N+3KWfmtIOGu2Uhub5THaSnVqidl6XSRsNqdVfaClvrMa4pTWwWaClIs1yTLSOJiMhVt3ssoJdIL77dN060kcWoYgMYT3m8DH/OiB4lPMXCVgRAcQawb9LFY/G7vwwRIlnOdKU3ttJTOGVI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(42112799006)(376014)(1800799024)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cS9PQjVmaWIyeE50U28ya05CZ0l5bkd1THJROEQ5TmdHS0RkVnZVQ04rRjVt?=
 =?utf-8?B?S2JZRkp1SHFTbzF3VHdqbW00N01SMGJia1RTT0tjdzNJYXc0czZxdUU3UU02?=
 =?utf-8?B?MzhIbXBxOHJqZGV5enljc3hIRFRqcnhlZlBsQU13eGZMUXhTKytINlhoTmR2?=
 =?utf-8?B?VmVDZk5YbFhyVnVpTUJQcy9XcUMvWmh5Vlp4OHlySTI0WDgwR3R5bzlUQTNC?=
 =?utf-8?B?MEwxRUdIQUFUdm54a0d3WDdMMXgvM2l0T0p0MHd4SWpkYVJTQVpJN01sRHFy?=
 =?utf-8?B?bnhUWWxpZ0FycmVJbHQ2QUlPcUdabWJMdHQ0Um00YVFlV29Sb1ljQ3VMTDhR?=
 =?utf-8?B?ZE9DR3pTaXVvQXY2UmhacVhUVTQxTkpMV2FBcGZ3M2QyNWN0UzI4ZHJHWDVC?=
 =?utf-8?B?SDc1SlpPb2J0dHVQR1hEY0d2NURSQVdTT0VqVDJGVWFjOEVGUm1EenhFemRR?=
 =?utf-8?B?cnF5RFgwM21mWExCaGt5eTl5NVVDc0VxV3E5dnhnV0E4WGt3Y1ROaEY3cUVt?=
 =?utf-8?B?dWlLdGtrMkFjZHV5cVRBN3p2azY0K1VheExKUnhWQTJnQmJ4dDFSWHhiSXEy?=
 =?utf-8?B?Vmo2SnQrdnZQb1RJb2ZxcWlxMm9SbUdoQUxUMHlIeGd1enN0M3ptanBud1lm?=
 =?utf-8?B?VXRQR3hhTUNEell0LzhtSDFwM29NUURrcEVkSzhsN1NBejBZYnVhcUJjSXNP?=
 =?utf-8?B?TE9ncnQ2aW91Q09NcC9kdkRHUmlmR09CQ1lETTJGWXY2TlNNV1dodmV0WENW?=
 =?utf-8?B?bmp2MkYvVFJpN1llVWdPNzFYcHVFWGRMQklKSmRsak42cFFJYnVkT0xUOS9R?=
 =?utf-8?B?citvK2NoaGtSa2lZV1czb1hISlVhOC9uejBTQWpjWlNPY0VyY1Q2c3VheGpq?=
 =?utf-8?B?L1EwNE9Da21hallBZFM4cFc5ZlNvaFdGRUdQeEVOUVA1ajJBa3VjQ1BjQkx0?=
 =?utf-8?B?a0w4MFJTVzVqYWJncGo4b2pkZ2JNcjBiM3l1UEJjaUZzdUhIQitoNGt3MlJ4?=
 =?utf-8?B?SWd2cFFhSUVBSStGb3BJbnFzenJrUndVK3M4YXlWaFhyQmdGbkZGdVlBWGlZ?=
 =?utf-8?B?NmY4dFVXaENQU2tDK1RwZ2F3dE50REFGa3QwemRZZXRWeDN3dU9xdjNuekc2?=
 =?utf-8?B?b2JJK0poakJKZ0J1SFdyZGU1UGkrV0J6cms2VXRLNjRvR09haHRwVjlWcHNx?=
 =?utf-8?B?Zm1MNS9lSkhFVUFXRnB2ODhyWEw5aDRUa2dXdGgzeXBTNXBROXdybzk5K2lH?=
 =?utf-8?B?bm82YjBNYVErdC8rRk9XcHJKVjViak13eGRnVC9yWml0WllVMmxvODJnc0hw?=
 =?utf-8?B?Q1F4bkd5UmZKQTBrbUwzWEhRdERnZnlXZ1czWjlzdkVmcE9wZDBhSnZvcVMw?=
 =?utf-8?B?dmNkTGYwcHZpUVlINm45d1ZQNjVKb2VrM2JRZC9WYUt0Y2E2TFA5Y3ZqTzdQ?=
 =?utf-8?B?TlFEcTd6bGZISnpxak9JNmh0N0g4eWN5K1FmVUhpWGQ5anowaEdMaWVaZmhE?=
 =?utf-8?B?OXlaREZDODVnNTFwelRjRlZZOTJpK2k4VGo1NHhnQXpocnpmMWhvSTF3cHgz?=
 =?utf-8?B?WDRRbmY0bldzNWlGNGM0SGpsS0VGeExkRVZLRE1HTFNteitxNkJLdkEwK1RT?=
 =?utf-8?B?aWpDdGM0M1prb0JwemlybG1OSEt4aWJkVWRhcDY1Wlg3UWxxcE5wbE9JNUZR?=
 =?utf-8?B?U2thV0ExS0pkSnpodnNaRjMxMTRmRUNPTFk0eUlpLzY2Vko2dHhLOHUvbHJv?=
 =?utf-8?B?dCtLUGxVcnA0ejFoVFlrY1UwcGJxQXNHcFJPZC8wUEh5Rjk2YVVGNGtEbThX?=
 =?utf-8?B?V0ZEWmIxVlk1YklodDdqWWVTS0NIKzZvVUcxVTFwMjIwT1Z2K1YxRnN2Nkhu?=
 =?utf-8?B?TmgvdkVIQkIrOXQrVnpmRk8xNFFoY2lQbXc2N3hSR3NaQ0hBWnlCZkNWdHVp?=
 =?utf-8?B?K2ZtOGsyQ212QjF0cmdWVkVUemw0aGVPSHE3amNCelU1M1FCNVlEWEZVUlJF?=
 =?utf-8?B?M1F1Wm5yVFVWaFlyNmZkK1hVTFZES0kvRW1vaEt4SUFTbFppSTRsOWJCNkww?=
 =?utf-8?B?YjZkWHRUMWEyZUR1SVIxclNEZ2hUWG80NTBDRGJzaStKbHkvQ09qQU9mRlZD?=
 =?utf-8?B?UWM5dnRud2JVd2NUOTNBMzhOVi9QUW5iZEhOMW1LcmJDcGY4U2pTTWtjTEZE?=
 =?utf-8?B?R3liSzNzMnNFa2k2cTAxZXJqYW9meVM5L2lZdml4c3lUY1BWb1d3Q0xoakRG?=
 =?utf-8?B?NG0xL0w4VGpYRTFKcUZGc204SjBNTmRzYVVZYXhYd0NESGxJTkFoa2J3ejlQ?=
 =?utf-8?B?V0lBUGFsNldZc0Z3bGkzVytodnhHZDRLdlZDYzUyYWQ3Rjc0dkJRZz09?=
Content-ID: <653063F72E0E4842B4C5BC6F9D7685EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q70Rho8lPTo+Rtm9Ib4RiPGf84Q+mi5gJO7gzjsatEve8d23ZO5OuLOdpjood/bUeBkDN9EGfcX8L9ehVVYbZWD9uKDxmiWrxHbvj15ofNs5BFQ9h0gmHS8fecfQQqOKtCLQYJNMmeePAOdcYWnxIi+Qup3Jzef5zLB6Hy3+VqG7pigeRRqqSL6Uzzmcn5gxGQK2HGx5dN/HHmx6SzctD3gnotwWfCWehww5eTlF7diGcUE3bscpbj/N0lpnIkfx56HZr17iFr47f3VjY+AMkVIPkIvBifPgGnpmLuqyfNJiHVhfd9DRSc9Gm5fX92P/9iH1bhwQxezVP0TCnrhqGg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d924a7af-ff49-4606-b045-08de74ffb138
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 06:24:27.0762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXMoq+ljusY7gzK1/TrN7eo/pCp+BrsEeiJQCHW+qEnpGc29crOD7irlkxfhc83CaadBf+5Pg1DDs1n4QqW8zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7710
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1505398780.1035507228"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:pekka.paalanen@collabora.com,m:nfraprado@collabora.com,m:harry.wentland@amd.com,m:wiagn233@outlook.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:mripard@kernel.org,m:daniels@collabora.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:linux-kernel@vger.kernel.org,m:chunkuang.hu@kernel.org,m:kernel@collabora.com,m:ariel.dalessandro@collabora.com,m:p.zabel@pengutronix.de,m:xaver.hugl@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:airlied@gmail.com,m:matthias.bgg@gmail.com,m:xaverhugl@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[outlook.com,suse.de,ffwll.ch,kernel.org,collabora.com,lists.infradead.org,linux.intel.com,lists.freedesktop.org,vger.kernel.org,pengutronix.de,gmail.com];
	NEURAL_HAM(-0.00)[-0.936];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B4221A14C4
X-Rspamd-Action: no action

--__=_Part_Boundary_006_1505398780.1035507228
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI2LTAyLTA2IGF0IDA4OjI4IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gT24gRnJpLCAyMDI2LTAyLTA2IGF0IDExOjA5ICswMjAwLCBQZWtrYSBQYWFs
YW5lbiB3cm90ZToNCj4gPiBPbiBGcmksIDIgSmFuIDIwMjYgMTM6NDA6MjEgLTA1MDANCj4gPiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4g
PiBPbiAyMDI2LTAxLTAxIDA3OjM3LCBTaGVuZ3l1IFF1IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+
ID4gDQo+ID4gPiA+IOWcqCAyMDI1LzEyLzMwIDAyOjUzLCBTaGVuZ3l1IFF1IOWGmemBkzrCoCAN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiDlnKggMjAyNS8xMi8yNCAzOjQ0LCBO
w4MgY29sYXMgRi4gUi4gQS4gUHJhZG8g5YaZ6YGTOsKgIA0KPiA+IA0KPiA+ID4gPiA+ID4gR2l2
ZW4gdGhlIGxhY2sgb2Ygc3VwcG9ydCBmb3Igd3JpdGViYWNrIGNvbm5lY3RvcnMgb24gdGhlDQo+
ID4gPiA+ID4gPiBNZWRpYVRlayBLTVMgZHJpdmVyLCBjb21iaW5lZCB3aXRoIGxpbWl0ZWQgaGFy
ZHdhcmUNCj4gPiA+ID4gPiA+IGRvY3VtZW50YXRpb24sIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8g
dmVyaWZ5IHRoZSBjb3JyZWN0bmVzcw0KPiA+ID4gPiA+ID4gb2YNCj4gPiA+ID4gPiA+IGVhY2gg
Y3VydmUsIG9ubHkgdGhhdCB0aGV5IHdlcmUgdmlzdWFsbHkgc2FuZSAoZ2FtbWEgY3VydmVzDQo+
ID4gPiA+ID4gPiBtYWRlDQo+ID4gPiA+ID4gPiB0aGUgaW1hZ2Ugb24gdGhlIGRpc3BsYXkgYnJp
Z2h0ZXIsIHdoaWxlIGludmVyc2UgZ2FtbWEgbWFkZQ0KPiA+ID4gPiA+ID4gaXQNCj4gPiA+ID4g
PiA+IGRhcmtlcikuwqAgDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSG1tbSBJIGRvbid0IHRoaW5r
IHRoaXMgaXMgYWNjZXB0YWJsZS4gc1JHQi9zY1JHQiBoYXMgdHdvDQo+ID4gPiA+ID4gdHJhbnNm
ZXINCj4gPiA+ID4gPiBmdW5jdGlvbnMgbWVudGlvbmVkIGluIG9yaWdpbmFsIHNwZWNpZmljYXRp
b25bMV0uIFRvIGtlZXAgY29sb3INCj4gPiA+ID4gPiBhY2N1cmFjeSwgd2UgbmVlZCBzb21lb25l
IGZyb20gbWVkaWF0ZWsgY29uZmlybSB3aGV0aGVyIHRoaXMgaXMNCj4gPiA+ID4gPiBwaWVjZS0g
d2lzZSBvciBwdXJlIHBvd2VyIDIuMiB0cmFuc2ZlciBmdW5jdGlvbiwgdGhpcyBpcw0KPiA+ID4g
PiA+IGFscmVhZHkNCj4gPiA+ID4gPiBkb25lIGluIG9yaWdpbmFsIGFtZGdwdSBjb2xvciBwaXBl
bGluZSBzZXJpZXMsIHNSR0IgbWVhbnMNCj4gPiA+ID4gPiBwaWVjZS13aXNlIHdoaWxlIGFsc28g
ZGVkaWNhdGVkIHBvd2VyIDIuMiBmdW5jdGlvbiBleGlzdHMuwqAgDQo+ID4gPiANCj4gPiA+IE5v
dCBzdXJlIHdoYXQgeW91IG1lYW4gd2l0aCB0aGlzIG5vdCBiZWluZyBhY2NlcHRhYmxlLiBUaGlz
IGlzDQo+ID4gPiBhYm91dA0KPiA+ID4gZW5hYmxpbmcgSFcgc3VwcG9ydCBmb3IgdGhpcyBmdW5j
dGlvbmFsaXR5LiBOb3QgZXZlcnkgSFcgaGFzDQo+ID4gPiB3cml0ZWJhY2sgZm9yIHRlc3Rpbmcu
IEF0IHNvbWUgcG9pbnQgeW91J2xsIGhhdmUgdG8gdHJ1c3QgdGhlDQo+ID4gPiBkcml2ZXINCj4g
PiA+IGRldnMgaWYgeW91J3JlIGdvaW5nIHRvIHVzZSBmdW5jdGlvbmFsaXR5IG9mIHRoZSBkcml2
ZXIuIFdlJ3JlIG5vdA0KPiA+ID4gYWx3YXlzIGdvaW5nIHRvIGdldCBldmVyeXRoaW5nIHBlcmZl
Y3QsIGJ1dCBpZiB0aGF0J3MgcmVhbGx5IHN1Y2ggYQ0KPiA+ID4gd29ycnkgeW91IGNhbiBhbHdh
eXMgdXNlIHNoYWRlcnMgdG8gZG8gcHJlY2lzZWx5IHdoYXQgeW91IHdhbnQuDQo+ID4gPiANCj4g
PiANCj4gPiBIaSBIYXJyeSwNCj4gPiANCj4gPiB5ZXMsIGJ1dCBJIHVuZGVyc3Rvb2QgdGhhdCBp
biB0aGlzIGNhc2UsIHRoZSBoYXJkd2FyZSBkb2N1bWVudGF0aW9uDQo+ID4gYXZhaWxhYmxlIGlz
IHNvIHZhZ3VlIHRoYXQgaXQncyBpbXBvc3NpYmxlIHRvIHNheSB3aGF0IGl0IHdpbGwNCj4gPiBh
Y3R1YWxseQ0KPiA+IGRvLiBUaGVyZSBhcmUgbm8gZm9ybXVsYXMgZ2l2ZW4gb3IgcmVmZXJlbmNl
ZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiwNCj4gPiBhcmUNCj4gPiB0aGVyZSwgTsOtY29sYXM/DQo+
IA0KPiBObyBmb3JtdWxhcyBhdCBhbGwsIHRoZSBvbmx5IGRvY3VtZW50YXRpb24gSSBoYWQgYXZh
aWxhYmxlIGZvciB0aGUNCj4gY3VydmVzIHdhcyB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiwgd2hp
Y2ggc2ltcGx5IGxpc3RzIHRoZSBwb3NzaWJsZQ0KPiB2YWx1ZXM6IFNDUkdCLCBCVDcwOSwgQlQy
MDIwLCBITEcuDQoNCkhpLCBOaWNvbGFzOg0KDQpJbiBbMV0sIGl0IHNob3dzIE9WTCBjb3VsZCBv
dXRwdXQgZGF0YSB0byBXRE1BIHdoaWNoIGNvdWxkIHdyaXRlIGRhdGEgaW50byBEUkFNLg0KSXRz
IGNvbnRyb2wgaXMgc2ltaWxhciB0byBSRE1BLiBSRE1BIHJlYWQgZGF0YSBmcm9tIERSQU0gYW5k
IFdETUEgd3JpdGUgZGF0YSBpbnRvIERSQU0uDQpEbyB5b3UgaGF2ZSBpbnRlcmVzdCB0byBpbXBs
ZW1lbnQgV0RNQT8NClRoaXMgaXMganVzdCBhIHN1Z2dlc3Rpb24uDQpJIGNvdWxkIGFjY2VwdCB3
ZSBiZWxpZXZlIHdoYXQgZG9jdW1lbnQgc2F5IGZpcnN0IGFuZCB3YWl0IGZvciBzb21lb25lIHRv
IHZlcmlmeSBpdC4NCg0KWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc29jL21lZGlhdGVrL210
ODE5NS1tbXN5cy5oP2g9djcuMC1yYzEjbjgNCg0KUmVnYXJkcywNCkNLDQoNCj4gDQoNCg==

--__=_Part_Boundary_006_1505398780.1035507228
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjYtMDItMDYmIzMyO2F0
JiMzMjswODoyOCYjMzI7LTA1MDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtGcmksJiMzMjsyMDI2LTAy
LTA2JiMzMjthdCYjMzI7MTE6MDkmIzMyOyswMjAwLCYjMzI7UGVra2EmIzMyO1BhYWxhbmVuJiMz
Mjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtGcmksJiMzMjsyJiMzMjtKYW4mIzMy
OzIwMjYmIzMyOzEzOjQwOjIxJiMzMjstMDUwMA0KJmd0OyYjMzI7Jmd0OyYjMzI7SGFycnkmIzMy
O1dlbnRsYW5kJiMzMjsmbHQ7aGFycnkud2VudGxhbmRAYW1kLmNvbSZndDsmIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7MjAy
Ni0wMS0wMSYjMzI7MDc6MzcsJiMzMjtTaGVuZ3l1JiMzMjtRdSYjMzI7d3JvdGU6DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMyMjMxMjsm
IzMyOzIwMjUvMTIvMzAmIzMyOzAyOjUzLCYjMzI7U2hlbmd5dSYjMzI7UXUmIzMyOyYjMjA4ODk7
JiMzNjk0Nzs6JiMxNjA7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzIyMzEyOyYj
MzI7MjAyNS8xMi8yNCYjMzI7Mzo0NCwmIzMyO04mIzE5NTsmIzMyO2NvbGFzJiMzMjtGLiYjMzI7
Ui4mIzMyO0EuJiMzMjtQcmFkbyYjMzI7JiMyMDg4OTsmIzM2OTQ3OzomIzE2MDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjtHaXZlbiYjMzI7dGhlJiMzMjtsYWNrJiMzMjtvZiYjMzI7c3VwcG9ydCYj
MzI7Zm9yJiMzMjt3cml0ZWJhY2smIzMyO2Nvbm5lY3RvcnMmIzMyO29uJiMzMjt0aGUNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO01lZGlhVGVr
JiMzMjtLTVMmIzMyO2RyaXZlciwmIzMyO2NvbWJpbmVkJiMzMjt3aXRoJiMzMjtsaW1pdGVkJiMz
MjtoYXJkd2FyZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7ZG9jdW1lbnRhdGlvbiwmIzMyO0kmIzMyO2hhdmVuJiMzOTt0JiMzMjtiZWVuJiMz
MjthYmxlJiMzMjt0byYjMzI7dmVyaWZ5JiMzMjt0aGUmIzMyO2NvcnJlY3RuZXNzDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtvZg0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7ZWFjaCYjMzI7
Y3VydmUsJiMzMjtvbmx5JiMzMjt0aGF0JiMzMjt0aGV5JiMzMjt3ZXJlJiMzMjt2aXN1YWxseSYj
MzI7c2FuZSYjMzI7KGdhbW1hJiMzMjtjdXJ2ZXMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO21hZGUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3RoZSYjMzI7aW1hZ2UmIzMyO29uJiMzMjt0
aGUmIzMyO2Rpc3BsYXkmIzMyO2JyaWdodGVyLCYjMzI7d2hpbGUmIzMyO2ludmVyc2UmIzMyO2dh
bW1hJiMzMjttYWRlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtpdA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7ZGFya2VyKS4mIzE2MDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtIbW1tJiMzMjtJJiMzMjtkb24mIzM5O3QmIzMyO3RoaW5rJiMzMjt0aGlzJiMz
MjtpcyYjMzI7YWNjZXB0YWJsZS4mIzMyO3NSR0Ivc2NSR0ImIzMyO2hhcyYjMzI7dHdvDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt0cmFuc2Zlcg0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7ZnVuY3Rpb25zJiMzMjttZW50
aW9uZWQmIzMyO2luJiMzMjtvcmlnaW5hbCYjMzI7c3BlY2lmaWNhdGlvblsxXS4mIzMyO1RvJiMz
MjtrZWVwJiMzMjtjb2xvcg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7YWNjdXJhY3ksJiMzMjt3ZSYjMzI7bmVlZCYjMzI7c29tZW9uZSYjMzI7ZnJvbSYjMzI7
bWVkaWF0ZWsmIzMyO2NvbmZpcm0mIzMyO3doZXRoZXImIzMyO3RoaXMmIzMyO2lzDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtwaWVjZS0mIzMyO3dpc2UmIzMy
O29yJiMzMjtwdXJlJiMzMjtwb3dlciYjMzI7Mi4yJiMzMjt0cmFuc2ZlciYjMzI7ZnVuY3Rpb24s
JiMzMjt0aGlzJiMzMjtpcw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7YWxyZWFkeQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7ZG9uZSYjMzI7aW4mIzMyO29yaWdpbmFsJiMzMjthbWRncHUmIzMyO2NvbG9yJiMzMjtwaXBl
bGluZSYjMzI7c2VyaWVzLCYjMzI7c1JHQiYjMzI7bWVhbnMNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3BpZWNlLXdpc2UmIzMyO3doaWxlJiMzMjthbHNvJiMz
MjtkZWRpY2F0ZWQmIzMyO3Bvd2VyJiMzMjsyLjImIzMyO2Z1bmN0aW9uJiMzMjtleGlzdHMuJiMx
NjA7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7Tm90JiMzMjtzdXJlJiMzMjt3aGF0JiMzMjt5b3UmIzMyO21lYW4mIzMyO3dpdGgm
IzMyO3RoaXMmIzMyO25vdCYjMzI7YmVpbmcmIzMyO2FjY2VwdGFibGUuJiMzMjtUaGlzJiMzMjtp
cw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7YWJvdXQNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyO2VuYWJsaW5nJiMzMjtIVyYjMzI7c3VwcG9ydCYjMzI7Zm9yJiMzMjt0aGlzJiMzMjtm
dW5jdGlvbmFsaXR5LiYjMzI7Tm90JiMzMjtldmVyeSYjMzI7SFcmIzMyO2hhcw0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7d3JpdGViYWNrJiMzMjtmb3ImIzMyO3Rlc3RpbmcuJiMzMjtBdCYj
MzI7c29tZSYjMzI7cG9pbnQmIzMyO3lvdSYjMzk7bGwmIzMyO2hhdmUmIzMyO3RvJiMzMjt0cnVz
dCYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtkcml2ZXINCiZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyO2RldnMmIzMyO2lmJiMzMjt5b3UmIzM5O3JlJiMzMjtnb2luZyYjMzI7
dG8mIzMyO3VzZSYjMzI7ZnVuY3Rpb25hbGl0eSYjMzI7b2YmIzMyO3RoZSYjMzI7ZHJpdmVyLiYj
MzI7V2UmIzM5O3JlJiMzMjtub3QNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2Fsd2F5cyYj
MzI7Z29pbmcmIzMyO3RvJiMzMjtnZXQmIzMyO2V2ZXJ5dGhpbmcmIzMyO3BlcmZlY3QsJiMzMjti
dXQmIzMyO2lmJiMzMjt0aGF0JiMzOTtzJiMzMjtyZWFsbHkmIzMyO3N1Y2gmIzMyO2ENCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO3dvcnJ5JiMzMjt5b3UmIzMyO2NhbiYjMzI7YWx3YXlzJiMz
Mjt1c2UmIzMyO3NoYWRlcnMmIzMyO3RvJiMzMjtkbyYjMzI7cHJlY2lzZWx5JiMzMjt3aGF0JiMz
Mjt5b3UmIzMyO3dhbnQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SGkmIzMyO0hhcnJ5LA0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjt5ZXMsJiMzMjtidXQmIzMyO0kmIzMyO3VuZGVyc3Rvb2Qm
IzMyO3RoYXQmIzMyO2luJiMzMjt0aGlzJiMzMjtjYXNlLCYjMzI7dGhlJiMzMjtoYXJkd2FyZSYj
MzI7ZG9jdW1lbnRhdGlvbg0KJmd0OyYjMzI7Jmd0OyYjMzI7YXZhaWxhYmxlJiMzMjtpcyYjMzI7
c28mIzMyO3ZhZ3VlJiMzMjt0aGF0JiMzMjtpdCYjMzk7cyYjMzI7aW1wb3NzaWJsZSYjMzI7dG8m
IzMyO3NheSYjMzI7d2hhdCYjMzI7aXQmIzMyO3dpbGwNCiZndDsmIzMyOyZndDsmIzMyO2FjdHVh
bGx5DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkby4mIzMyO1RoZXJlJiMzMjthcmUmIzMyO25vJiMzMjtm
b3JtdWxhcyYjMzI7Z2l2ZW4mIzMyO29yJiMzMjtyZWZlcmVuY2VkJiMzMjtpbiYjMzI7dGhlJiMz
Mjtkb2N1bWVudGF0aW9uLA0KJmd0OyYjMzI7Jmd0OyYjMzI7YXJlDQomZ3Q7JiMzMjsmZ3Q7JiMz
Mjt0aGVyZSwmIzMyO04mIzIzNztjb2xhcyYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO05vJiMz
Mjtmb3JtdWxhcyYjMzI7YXQmIzMyO2FsbCwmIzMyO3RoZSYjMzI7b25seSYjMzI7ZG9jdW1lbnRh
dGlvbiYjMzI7SSYjMzI7aGFkJiMzMjthdmFpbGFibGUmIzMyO2ZvciYjMzI7dGhlDQomZ3Q7JiMz
MjtjdXJ2ZXMmIzMyO3dhcyYjMzI7dGhlJiMzMjtyZWdpc3RlciYjMzI7ZGVmaW5pdGlvbiwmIzMy
O3doaWNoJiMzMjtzaW1wbHkmIzMyO2xpc3RzJiMzMjt0aGUmIzMyO3Bvc3NpYmxlDQomZ3Q7JiMz
Mjt2YWx1ZXM6JiMzMjtTQ1JHQiwmIzMyO0JUNzA5LCYjMzI7QlQyMDIwLCYjMzI7SExHLg0KDQpI
aSwmIzMyO05pY29sYXM6DQoNCkluJiMzMjtbMV0sJiMzMjtpdCYjMzI7c2hvd3MmIzMyO09WTCYj
MzI7Y291bGQmIzMyO291dHB1dCYjMzI7ZGF0YSYjMzI7dG8mIzMyO1dETUEmIzMyO3doaWNoJiMz
Mjtjb3VsZCYjMzI7d3JpdGUmIzMyO2RhdGEmIzMyO2ludG8mIzMyO0RSQU0uDQpJdHMmIzMyO2Nv
bnRyb2wmIzMyO2lzJiMzMjtzaW1pbGFyJiMzMjt0byYjMzI7UkRNQS4mIzMyO1JETUEmIzMyO3Jl
YWQmIzMyO2RhdGEmIzMyO2Zyb20mIzMyO0RSQU0mIzMyO2FuZCYjMzI7V0RNQSYjMzI7d3JpdGUm
IzMyO2RhdGEmIzMyO2ludG8mIzMyO0RSQU0uDQpEbyYjMzI7eW91JiMzMjtoYXZlJiMzMjtpbnRl
cmVzdCYjMzI7dG8mIzMyO2ltcGxlbWVudCYjMzI7V0RNQSYjNjM7DQpUaGlzJiMzMjtpcyYjMzI7
anVzdCYjMzI7YSYjMzI7c3VnZ2VzdGlvbi4NCkkmIzMyO2NvdWxkJiMzMjthY2NlcHQmIzMyO3dl
JiMzMjtiZWxpZXZlJiMzMjt3aGF0JiMzMjtkb2N1bWVudCYjMzI7c2F5JiMzMjtmaXJzdCYjMzI7
YW5kJiMzMjt3YWl0JiMzMjtmb3ImIzMyO3NvbWVvbmUmIzMyO3RvJiMzMjt2ZXJpZnkmIzMyO2l0
Lg0KDQpbMV0mIzMyO2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1t
bXN5cy5oJiM2MztoPXY3LjAtcmMxI244DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCg0K
DQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUt
bWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xv
c2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsg
eW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1505398780.1035507228--

