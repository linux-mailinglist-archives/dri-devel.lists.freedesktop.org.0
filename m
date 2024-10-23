Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BC59ABE46
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 08:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9189010E275;
	Wed, 23 Oct 2024 06:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Hm+tks8z";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qoT+L+fj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6795210E275
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 06:04:57 +0000 (UTC)
X-UUID: b9047b40910411efb88477ffae1fc7a5-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=cKTDEqgev1nibyg51NEre/E4Vm/KzHAmJ6Bn0M4ETqE=; 
 b=Hm+tks8zSInPYzoTDstChTvi+gYadIDqsZK74eFMLZxvhNGHYig08W0ysR36G8C81nvROKIoh9c62pxrfLKFAx77M7oMcafXDz6lhWjJHve0aoCi7R2JZzplTPzlHCIQEPGldLEbUffBkD0Ih2ZenAxYwTRdaRevg42Xsk5F73A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:782ac6c3-c030-40d9-9b1f-db1d130e9002, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:348db9cc-110e-4f79-849e-58237df93e70,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b9047b40910411efb88477ffae1fc7a5-20241023
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1046778473; Wed, 23 Oct 2024 14:04:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 14:04:51 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 14:04:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNs4xTV6n9pX6Kte21c1Lm+OWQ1HmyNej9R+20ofqMNkuAFwbYSxcmMSXt1mK4TgNg34bwvxVudtcIztpgNBjqtXak0L3x840Dq4t1Wa/onxsU2eLeKId5Vh0SI2dpEfJNDr/Ev7OzxWleqTb+FsqgzIuuIMIT7N8Mvci2AQ7ogJLGt1QL0hDoMDAtvFJ3XAaGHzzpxvTzQF6bIdkYsYfIadAtaaBUiOKWmHC3PuNQ0PMwfBOwHz3t7zB5lTeVrLL4APoOpi+9W5nsSxNKNjYzSoB2JDMi+1oNKsT6EeYL/UEh0kWeojzsUNPOqK0P/PkuGVO3+RlUistrO2hetOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVBkQ3Sn1dbzTRUbLal0DeUp3sPWDCBcn96qAVlqDuU=;
 b=i6T9BkiSa5CMi0nW9R92W10cMAFlL72Pg4LCTleDbvb+fY+g3QCCATIwiRDf97USEuuMpGPWXEAxTJtLmGk0Il2ILhp4jDg24QzSt4cdPsLgIeS59msEXqC5ItHlcG+grYSthzM6UNdxiTeZ+mShdUWt6Xjtc6gwccbj9Lxojj6zf+/nHXHWX/bZo70jgJZPJp+VrlACwE/y4vTuYGwum63oztx/YmpKMdbOZBEQhHWJC7q7QQcHzwj4orNu8uXUsj8kbAzBYiqFnlX5w9hCYJ2AbtlR5q4Dn7BioeM3eIeQK6LzVdfnfBhwrSyGf8dsFDvARjrM3Gt38oaKc3hPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVBkQ3Sn1dbzTRUbLal0DeUp3sPWDCBcn96qAVlqDuU=;
 b=qoT+L+fjDIwluYxfYI2Ot+slRI0KegzZXsVtjyDdrH7gNwlFjq1w8ikcDQ1PgtSBIL5LGVRcHV4qNtcBUHRKI8QuttSaMMNR6bFnZqMdY1xlmFuJZFiAJ/ALSt/tCF52xsu2WxfnaJNV/zovvJr2lFCqXWnDv6eLvV1l4vNweXw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6652.apcprd03.prod.outlook.com (2603:1096:101:80::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 06:04:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 06:04:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?=
 <Liankun.Yang@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: dp: Add sdp path reset
Thread-Topic: [PATCH v3 1/1] drm/mediatek: dp: Add sdp path reset
Thread-Index: AQHbDxcft35Nm1n+2EOO4ZRh9LalHrKUBL0A
Date: Wed, 23 Oct 2024 06:04:47 +0000
Message-ID: <33f25bb3b2d61d479d116b0a2370617efc22b41a.camel@mediatek.com>
References: <20240925064854.23065-1-liankun.yang@mediatek.com>
In-Reply-To: <20240925064854.23065-1-liankun.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6652:EE_
x-ms-office365-filtering-correlation-id: 1302b0ae-3592-4851-6924-08dcf328991a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?N2lwakJRQ0s2UEExWHUwR1ArUXVyZjNmU21nM0U3UlFVdFhjQVB3UkJibDdY?=
 =?utf-8?B?MjA5Z1BLK1p4VDlkdnhGb2FyVXNXOVdvU1JFZ2pVcWpqVkpMZmNwdzI2NEVX?=
 =?utf-8?B?Qlh5R1oxQ2VGRmN2N0xEVm5RZkJtRG5vZ0NranpiNTFjNjAveGN5UzVEL0ti?=
 =?utf-8?B?b2UrZHdyMDNBNDkxazFTQVlEa2tpaEdmQ2xCa1ZmMGl1M1RVUUJsUGh6blQ4?=
 =?utf-8?B?Mis0Y29qMWdjL3NrZ25SSmFFK2lGaDF2Q25adytyNEdIbGowdGtYYlU4S2lh?=
 =?utf-8?B?VmEyMUFGNjVHVzQzWUlaT3ltdmZ2eEMwek8vL2JkYzFRMk1mRGlVVGJsdkc0?=
 =?utf-8?B?N1ptdHZKMGh4NS9EcmN6bkozQ2tiVkZvNHNnQktYR05FdHIwR0RwK2lMQmpI?=
 =?utf-8?B?MFA5WGdOZFlPTmdDTFZRbHJHdUt2ZDFtMkdobGl3dGM0YW1Da29rT0RYOU1M?=
 =?utf-8?B?U2pHSStteVB0eFoyemRlUlFmZ3FFRzJpODJ5UEZ0R0tpdmR3N1Rsb0luNG90?=
 =?utf-8?B?N3VZOTZvOWduZ3dydXI5RnFOeVdZS3hGY1Vac0x5aDJLa0pZN3JRZTdieHNq?=
 =?utf-8?B?TXVFT1c5UjYvMnJGb0ZJS0UvK1BINmV1OERBZ2JaMDY3ZVF5VWhTYkxRNU1I?=
 =?utf-8?B?Nkw5NVNLRmtUQUNnYzh3Nm5RbTdBSUJNZWJlbHlvUmN6L2hGWFhMYUw0MVht?=
 =?utf-8?B?Qlp6RHpyUksxdDlWcmVOeW1RM3Q1dFhFWlJzMXFLbEZ5MUtLRjdGNjh4QUZQ?=
 =?utf-8?B?bkVyVTZLZ09sSUtQZ0NvRU9FK1FBUmhMY3E3VXVoZTFkaE5BZUdlVDZ3cHp0?=
 =?utf-8?B?anJPY05xdlNNZGx5RE56K05IREZIQmhsL0doeHNEU2lGRmxaSDQ5Q0czUG9Y?=
 =?utf-8?B?R1NBN0JTL1hNR0xXZDBLU3NYS1E3VDZxbUlBUkJKMWJRekI5WWZPc0YzQjQ3?=
 =?utf-8?B?Z2VNMkFOaTlaUFduN1FPZTA2UjBmaWlXdERwRURWTHY5cUhTUko1MEc3THlw?=
 =?utf-8?B?UUo1N3M4NFhCemhha0tHUzNrZzZhSnV4T3BDRWJLRXZGejNwZTBLQUp4S0wz?=
 =?utf-8?B?bWZvTTZIZGw5UUM0VU12UE85UVB5eFJLbkQ1ZnJpN0hlcTNXVkRwZXE0VGdr?=
 =?utf-8?B?TUM4UXRuSXd3VmlYUnBIYno0RXo5VjlCSHRWR3RubkErSXhCMUNtd2tScDNq?=
 =?utf-8?B?Z3NneXA5YVovUDVqSVJURnlEblBHRmlyNDI2NUZxSkhNM25uZTl4ayszV1hF?=
 =?utf-8?B?c094cnB0R1hhTVB5b3FiQzg1U09nNFFQd1o3MXpwOXozVWQ1VGFUaGFJUjlN?=
 =?utf-8?B?MkcxL2l4emkzRTBrUy9uRmM0RHJBNlNaa0xqbklSSmR2bGYrNHdJNkhyN0du?=
 =?utf-8?B?empvZkRMc2trNFRBUjBlSG9LVGxTVVZUY3VINEo1bGJtMFo4d0QvYXVIRmp2?=
 =?utf-8?B?Zm1CUlF2ZWRZdDZ2OGVvcS9GSnNWLzROTXJrWmIzanJYb3pUTXZ6aGN2Vjg0?=
 =?utf-8?B?elllVzJwMVRKWmV1ajJoN1FWalRPNXJKMUMvbGtSWnBnYlJ3YnVtZEZKVGpw?=
 =?utf-8?B?MmFMQ1AwaXlDZEhxbnZ3cVFxYTVQT1JOWXBwZWlXb3RjOWQ3WVE4M0pMakx4?=
 =?utf-8?B?dXdxMWtMQVB5Zk5idmhaUGNXamIxWG9tdWRvaXZFSEFUZGpodlFDWGFyRDJW?=
 =?utf-8?B?ZzY2U091WHJpc3B5WEx4UE96eThqanhEQlE1RVZkSDV1WWFhNzdtZS9mRWpF?=
 =?utf-8?B?TVdiVjFodWl0bit6TUFGNnJLMTEyMXVxcFhrdVlLUTV2aGZFTzFnU2szRXNM?=
 =?utf-8?B?RWNZeUxCSTl0WUxwbTd5eUk1bVQyWmlMOVgvOHl1YzI0QWRkeEpDdXJqcTdJ?=
 =?utf-8?B?TTIxMUZqWjFld244ZVJmUGlBQmFMRktFSVJkZmR0dG1BVHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXVIcVU1ZkQrRUsrYzlsNy9ma1QxQkdjQmZPSWxyV3hFMzlVSFVnVGgrZjRD?=
 =?utf-8?B?cGp0NXZMMjNhTWgxSkVVazkzYW5hK1lESTRZMDZzdzBsYU9WdW11WlZ5RWd4?=
 =?utf-8?B?NjJXL0FSYkI5WlpLVkErRE5wN2VVSER4N3g1cFdESmV6ajZOSFFKQWdkeXJy?=
 =?utf-8?B?bkhnTXhVVC9KZzg4aGR1K3YxN1lOcjBBNG1mYkZoaGFGRVpVZXdreHR4R1l3?=
 =?utf-8?B?WVlQbzErWVlPNkthMFhXbWZ4SUc0Q2t0eEtOdXc3Y1pUQ0dkb2hjSzM0RXhy?=
 =?utf-8?B?Mk9UQ2JMSjdSTWx5d08xNXQ2QVF2eFhYM3NpcGdVTzNPdCtXK1gvNXlUeWc4?=
 =?utf-8?B?b2lJWkc2MWZHdW9XT09FbHpTSnRMeEJGdG45bEhnWjFXcXExd0RId0VJVUVa?=
 =?utf-8?B?dEh6OTNUK2dHQkZDS3lPR1N2NGFGbTh0bU9GSWI5U1c1NUhrRkRkYVpTZVJD?=
 =?utf-8?B?UEZidE13bkh2ZlRmUHBFRkFtUnpPMUxFZWNsNk54WDZUL29EL3VnbEZnY3No?=
 =?utf-8?B?cU1aTm5sTUpENCtzclVydDB4Q1VXNHNUbENkUzgxR2JObFJGZERtRkQ1dHU3?=
 =?utf-8?B?LzNHMlpuQ1RlQ1BoT2t4cmZ2UUlLM3MvNVZMYXhVcUVFNHFHRU91cnVwK1JT?=
 =?utf-8?B?MmkxbzQxK21SRGdlV3c4ZFIxc3paTXE3MTVrY0tyL2JjQTcxcXBkU2gxa3BM?=
 =?utf-8?B?aEtZVS83UTE0MnNLcEVncGF3QWFwWldycVBUcFlnWGFoZm9TTFJGQlNuSmJT?=
 =?utf-8?B?SG85ZmZ1VitKcWVTS1dXVzZJRTlCZjArRHJWeFdoZlFpVFJZdE9CNmpnemZU?=
 =?utf-8?B?TTNURmhGWDBTZUhiUEpMWmgwckZyVlYwZ0M5YUJ3aVRTSDFWTE91V0lRbGR0?=
 =?utf-8?B?VWM0NUIyWDh6ZCtyOUd5Tmo0ZmZIdTBaSlJ0NlBZSllKaVloSWhYaTFEUDk3?=
 =?utf-8?B?U3Vtak4xTWdVYm9QN0xBNzlxRVUwMXI5ZkdBYS9SZ0p0S0Y5ZExURFhHVlA1?=
 =?utf-8?B?MTRkejVrV1loMzRwRzZUVWxPTi9TYXIwN2Q1UmpTaVZGa2NmMzhQRFBIVWVq?=
 =?utf-8?B?RTVHWTVZRk8vNERHK3Q4Y2V4RDlYMXRudWorbVZ4K0dMcnpTTVZTcERqVGhG?=
 =?utf-8?B?SHFBek93Y0xRZW5GSVlYanY4TEJaVFRvcVMzbWhtWEdBV2VXeVJhU2FnUUxk?=
 =?utf-8?B?am42RGlDR2M4cGk1ajZBTXRyZVVhT2JoNTNIVTlJbHoxbmFkZTZXcVB5TXB0?=
 =?utf-8?B?RFNMUUlCYTRhRlJEN0dlUDBLTG1oY2pFdHl5M0prNlBsRXV4L3Z2TWVscHpX?=
 =?utf-8?B?WGl4WVJJNDBSZkQzMXRWQU5pdnhia01vd1RKSWZlVTZkRVlWRTZpZGo3dEoz?=
 =?utf-8?B?MDI4alQxZXUzZ29nSmtHa0hTVnptS2Jxek9DUVVPdTFmcytBWHBSTldiS2tl?=
 =?utf-8?B?RVFwL0VlUnFFU3BQdlN4RkZmcW55d05JMFpsL1ZNYVZxckRQcVpyU3VWaDdw?=
 =?utf-8?B?ZExMNlRDaHRyYkVtYVNTQ2lMRVVYY3J6ZnlTNGJScUxoQnVVTVRDTDNVTG9E?=
 =?utf-8?B?QlZ3V2I2UnNEdDhOS1JadytPZHpPYzJqV2ZPOHJnUWYyMG1HSzZweGF2QnFl?=
 =?utf-8?B?S0ZOSnVZYXdrUTA1VWZDSEpjSGJYZHR2TW1SSVRIWU9GYlNDOWZ4cVoxc0VX?=
 =?utf-8?B?NzZVV2ZIT1dQUklRKzRzdjlVdTRDejJIYW1mTVhheUM5a0xmQm9wQW9PdXdT?=
 =?utf-8?B?QUVuY2ZOM0w3R3dlYTZhdmJWY2FmSWRHUUF5dEhWT3BPQjEwY1FnKzdLakJt?=
 =?utf-8?B?K2lTcmEzNXE5SFJmUythcE05OFF3WDhoZ3RHNVBOaE9QWmZiRnp2TmJLVEc2?=
 =?utf-8?B?bkhCY0g2RDBxYi9mS0gvY2xqMUZBdHFjS2trTWg1cnJCaVhRTWE1dDNpaDRL?=
 =?utf-8?B?TUhEd1U4UGNROGx5NWdTc0lQb0FBTlRnQWtENDZ4VXhyZDJSMUE0TE9kNFUy?=
 =?utf-8?B?eThRVGVrWnRzWFFiaTBUbEJaRW9PakRqbHVCTHJDcmlXUC91MlFhQ25teS9Z?=
 =?utf-8?B?V0hTeGxIMElia3YycXdhNCtZNWRZcThNekw4RHAwRERNYkRqOERybU9Vd0pK?=
 =?utf-8?B?bFpkMC94M2wzVTR2NFRHSjUramx6dld4NzZCRStNbklmNmtzOFJXR3RhcTNh?=
 =?utf-8?B?T1E9PQ==?=
Content-ID: <D882D12B0FAE004C92CC10BCB779A25C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1302b0ae-3592-4851-6924-08dcf328991a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 06:04:47.2612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lG1uf5l39jhxgNXrt4lsbBYRdWU3T1+E8pfYgYWJe07a9U2MoUqpTE9RcAzsP5La/MPcESj/slXgcplThXVQIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6652
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.450100-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfsOwH4pD14DsPHkpkyUphL9Kx5ICGp/WtFaW2Ktn+I8/kfp
 kQx2u0KskvtOR1UxMvwRA4hwIn2MDR9J5bZqJbIJe8FaKRfM2oOy4iyjvVWTok+idoNVPK4WvFf
 PytWHA2nT01A2vEikVgG2ORx9Eyapz5ac8fR/Kd105zsoB1UKTmEF8bGZ0cKCmnnIaNaZOLGiFC
 KhA8vX7obJ0ODQ9lXH8NsyesFB+nz/o+5l9ZSgvp4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrIqHkM
 5YY92pZjaPj0W1qn0TGVuWouVipcg4zUM13VRN4Waf/SYWsnlyFA+58ci7dLQp9VV3lbJl17531
 Sem326PoCwNgbhfzNWLGJMyagMVGp9qng51W2/vdnMaPcPTol1r/VRGx0IR2+Uo4vXq+qmzIize
 CsI6wA0LUmjyL3DZSc+aWLqiwUqk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.450100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 998F103B86E0D3ED04CFB3ADC52D4CC09ED97A6007CE02DB4E750F686CEE67902000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1922167647.457791699"
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

--__=_Part_Boundary_001_1922167647.457791699
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIExpYW5rdW46DQoNCk9uIFdlZCwgMjAyNC0wOS0yNSBhdCAxNDo0OCArMDgwMCwgTGlhbmt1
biBZYW5nIHdyb3RlOg0KPiBXaGVuIHVzaW5nIHR5cGUtYyB0byB0eXBlLWMgdG8gY29ubmVjdCB0
byB0aGUgbW9uaXRvciwNCj4gdGhlIHNvdW5kIHBsYXlzIG5vcm1hbGx5LiBJZiB5b3UgdW5wbHVn
IHRoZSB0eXBlLWMgYW5kDQo+IGNvbm5lY3QgdGhlIHR5cGUtYyB0byBoZG1pIGRvbmdsZSB0byB0
aGUgbW9uaXRvciwgdGhlcmUgd2lsbCBiZSBub2lzZS4NCj4gDQo+IEJ5IGNhcHR1cmluZyB0aGUg
YXVkaW8gZGF0YSwgaXQgaXMgZm91bmQgdGhhdA0KPiB0aGUgZGF0YSBwb3NpdGlvbiBpcyBtZXNz
eSwgYW5kIHRoZXJlIGlzIG5vIGVycm9yIGluIHRoZSBkYXRhLg0KPiANCj4gVGhyb3VnaCBleHBl
cmltZW50cywgaXQgY2FuIGJlIHJlc3RvcmVkIGJ5IHJlc2V0dGluZyB0aGUgU0RQIHBhdGgNCj4g
d2hlbiB1bnBsdWdnaW5nIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGlhbmt1biBZYW5nIDxs
aWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tPg0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4g
LS0tDQo+IENoYW5nZXMgaW4gVjM6DQo+IC0gTm8gY2hhbmdlLg0KPiBQZXIgc3VnZ2VzdGlvbiBm
cm9tIHRoZSBwcmV2aW91cyB0aHJlYWQ6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gv
MjAyNDA5MjMxMzI1MjEuMjI3ODUtMS1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tL19fOyEhQ1RS
TktBOXdNZzBBUmJ3IW1oY1lIQTRtMlM2RXBHdllVdWJNbDdlQkx5dDdTQURpUFR5UWhPYTdmMFVG
c3dhekYwLVk4LWxmdEZwR3NzZGFwMTI3NzdUaXJKTS1wUkRfOEV2eUxTcyQgDQo+IA0KPiBDaGFu
Z2VzIGluIFYyOg0KPiAtIEZpeCBidWlsZCBlcnJvci4NCj4gUGVyIHN1Z2dlc3Rpb24gZnJvbSB0
aGUgcHJldmlvdXMgdGhyZWFkOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQw
OTIzMTMzNjEwLjIzNzI4LTEtbGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3
TWcwQVJidyFtaGNZSEE0bTJTNkVwR3ZZVXViTWw3ZUJMeXQ3U0FEaVBUeVFoT2E3ZjBVRnN3YXpG
MC1ZOC1sZnRGcEdzc2RhcDEyNzc3VGlySk0tcFJEX0RscFFkbEkkIA0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyAgICAgfCAxNSArKysrKysrKysrKysrKysNCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmggfCAgMSArDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
LmMNCj4gaW5kZXggZDg3OTZhOTA0ZWNhLi40MDAzYmQ4M2Y2NGUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwLmMNCj4gQEAgLTEwNTIsNiArMTA1MiwxOCBAQCBzdGF0aWMgdm9pZCBt
dGtfZHBfZGlnaXRhbF9zd19yZXNldChzdHJ1Y3QgbXRrX2RwICptdGtfZHApDQo+ICAJCQkgICAw
LCBEUF9UWF9UUkFOU01JVFRFUl80UF9SRVNFVF9TV19EUF9UUkFOU19QMCk7DQo+ICB9DQo+ICAN
Cj4gK3N0YXRpYyB2b2lkIG10a19kcF9zZHBfcGF0aF9yZXNldChzdHJ1Y3QgbXRrX2RwICptdGtf
ZHApDQo+ICt7DQo+ICsJbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwgTVRLX0RQX0VOQzBfUDBf
MzAwNCwNCj4gKwkJCQlTRFBfUkVTRVRfU1dfRFBfRU5DMF9QMCwNCj4gKwkJCQlTRFBfUkVTRVRf
U1dfRFBfRU5DMF9QMCk7DQoNCkFsaWduIHRvIHRoZSByaWdodCBvZiAnKCcuDQoNCj4gKw0KPiAr
CS8qIFdhaXQgZm9yIHNkcCBwYXRoIHJlc2V0IHRvIGNvbXBsZXRlICovDQo+ICsJdXNsZWVwX3Jh
bmdlKDEwMDAsIDUwMDApOw0KPiArCW10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsIE1US19EUF9F
TkMwX1AwXzMwMDQsDQo+ICsJCQkJMCwgU0RQX1JFU0VUX1NXX0RQX0VOQzBfUDApOw0KDQpEaXR0
by4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQgbXRrX2RwX3Nl
dF9sYW5lcyhzdHJ1Y3QgbXRrX2RwICptdGtfZHAsIGludCBsYW5lcykNCj4gIHsNCj4gIAltdGtf
ZHBfdXBkYXRlX2JpdHMobXRrX2RwLCBNVEtfRFBfVFJBTlNfUDBfMzVGMCwNCj4gQEAgLTIzMTQs
NiArMjMyNiw5IEBAIHN0YXRpYyB2b2lkIG10a19kcF9icmlkZ2VfYXRvbWljX2Rpc2FibGUoc3Ry
dWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gIAkJCSAgIERQX1BXUl9TVEFURV9CQU5ER0FQX1RQ
TEwsDQo+ICAJCQkgICBEUF9QV1JfU1RBVEVfTUFTSyk7DQo+ICANCj4gKwkvKiBTRFAgcGF0aCBy
ZXNldCBzdyovDQo+ICsJbXRrX2RwX3NkcF9wYXRoX3Jlc2V0KG10a19kcCk7DQo+ICsNCj4gIAkv
KiBFbnN1cmUgdGhlIHNpbmsgaXMgbXV0ZWQgKi8NCj4gIAltc2xlZXAoMjApOw0KPiAgfQ0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9yZWcuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmgNCj4gaW5kZXggNzA5Yjc5NDgwNjkzLi44
YWQ3YTljYzI1OWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBfcmVnLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9yZWcuaA0K
PiBAQCAtODYsNiArODYsNyBAQA0KPiAgI2RlZmluZSBNVEtfRFBfRU5DMF9QMF8zMDA0CQkJMHgz
MDA0DQo+ICAjZGVmaW5lIFZJREVPX01fQ09ERV9TRUxfRFBfRU5DMF9QMF9NQVNLCQlCSVQoOCkN
Cj4gICNkZWZpbmUgRFBfVFhfRU5DT0RFUl80UF9SRVNFVF9TV19EUF9FTkMwX1AwCQlCSVQoOSkN
Cj4gKyNkZWZpbmUgU0RQX1JFU0VUX1NXX0RQX0VOQzBfUDAJCQkJQklUKDEzKQ0KPiAgI2RlZmlu
ZSBNVEtfRFBfRU5DMF9QMF8zMDEwCQkJMHgzMDEwDQo+ICAjZGVmaW5lIEhUT1RBTF9TV19EUF9F
TkMwX1AwX01BU0sJCQlHRU5NQVNLKDE1LCAwKQ0KPiAgI2RlZmluZSBNVEtfRFBfRU5DMF9QMF8z
MDE0CQkJMHgzMDE0DQo=

--__=_Part_Boundary_001_1922167647.457791699
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtMaWFua3VuOg0KDQpPbiYjMzI7V2VkLCYj
MzI7MjAyNC0wOS0yNSYjMzI7YXQmIzMyOzE0OjQ4JiMzMjsrMDgwMCwmIzMyO0xpYW5rdW4mIzMy
O1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7V2hlbiYjMzI7dXNpbmcmIzMyO3R5cGUtYyYjMzI7
dG8mIzMyO3R5cGUtYyYjMzI7dG8mIzMyO2Nvbm5lY3QmIzMyO3RvJiMzMjt0aGUmIzMyO21vbml0
b3IsDQomZ3Q7JiMzMjt0aGUmIzMyO3NvdW5kJiMzMjtwbGF5cyYjMzI7bm9ybWFsbHkuJiMzMjtJ
ZiYjMzI7eW91JiMzMjt1bnBsdWcmIzMyO3RoZSYjMzI7dHlwZS1jJiMzMjthbmQNCiZndDsmIzMy
O2Nvbm5lY3QmIzMyO3RoZSYjMzI7dHlwZS1jJiMzMjt0byYjMzI7aGRtaSYjMzI7ZG9uZ2xlJiMz
Mjt0byYjMzI7dGhlJiMzMjttb25pdG9yLCYjMzI7dGhlcmUmIzMyO3dpbGwmIzMyO2JlJiMzMjtu
b2lzZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7QnkmIzMyO2NhcHR1cmluZyYjMzI7dGhlJiMzMjth
dWRpbyYjMzI7ZGF0YSwmIzMyO2l0JiMzMjtpcyYjMzI7Zm91bmQmIzMyO3RoYXQNCiZndDsmIzMy
O3RoZSYjMzI7ZGF0YSYjMzI7cG9zaXRpb24mIzMyO2lzJiMzMjttZXNzeSwmIzMyO2FuZCYjMzI7
dGhlcmUmIzMyO2lzJiMzMjtubyYjMzI7ZXJyb3ImIzMyO2luJiMzMjt0aGUmIzMyO2RhdGEuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1Rocm91Z2gmIzMyO2V4cGVyaW1lbnRzLCYjMzI7aXQmIzMyO2Nh
biYjMzI7YmUmIzMyO3Jlc3RvcmVkJiMzMjtieSYjMzI7cmVzZXR0aW5nJiMzMjt0aGUmIzMyO1NE
UCYjMzI7cGF0aA0KJmd0OyYjMzI7d2hlbiYjMzI7dW5wbHVnZ2luZyYjMzI7aXQuDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtMaWFua3VuJiMzMjtZYW5nJiMzMjsmbHQ7
bGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7
QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Q2hh
bmdlcyYjMzI7aW4mIzMyO1YzOg0KJmd0OyYjMzI7LSYjMzI7Tm8mIzMyO2NoYW5nZS4NCiZndDsm
IzMyO1BlciYjMzI7c3VnZ2VzdGlvbiYjMzI7ZnJvbSYjMzI7dGhlJiMzMjtwcmV2aW91cyYjMzI7
dGhyZWFkOg0KJmd0OyYjMzI7aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MDkyMzEz
MjUyMS4yMjc4NS0xLWxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01nMEFS
YnchbWhjWUhBNG0yUzZFcEd2WVV1Yk1sN2VCTHl0N1NBRGlQVHlRaE9hN2YwVUZzd2F6RjAtWTgt
bGZ0RnBHc3NkYXAxMjc3N1RpckpNLXBSRF84RXZ5TFNzJiMzNjsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtDaGFuZ2VzJiMzMjtpbiYjMzI7VjI6DQomZ3Q7JiMzMjstJiMzMjtGaXgmIzMyO2J1
aWxkJiMzMjtlcnJvci4NCiZndDsmIzMyO1BlciYjMzI7c3VnZ2VzdGlvbiYjMzI7ZnJvbSYjMzI7
dGhlJiMzMjtwcmV2aW91cyYjMzI7dGhyZWFkOg0KJmd0OyYjMzI7aHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRp
YXRlay9wYXRjaC8yMDI0MDkyMzEzMzYxMC4yMzcyOC0xLWxpYW5rdW4ueWFuZ0BtZWRpYXRlay5j
b20vX187ISFDVFJOS0E5d01nMEFSYnchbWhjWUhBNG0yUzZFcEd2WVV1Yk1sN2VCTHl0N1NBRGlQ
VHlRaE9hN2YwVUZzd2F6RjAtWTgtbGZ0RnBHc3NkYXAxMjc3N1RpckpNLXBSRF9EbHBRZGxJJiMz
NjsmIzMyOw0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsxNSYjMzI7KysrKysr
KysrKysrKysrDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBf
cmVnLmgmIzMyO3wmIzMyOyYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsyJiMzMjtmaWxlcyYj
MzI7Y2hhbmdlZCwmIzMyOzE2JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyYj
MzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyO2luZGV4JiMz
MjtkODc5NmE5MDRlY2EuLjQwMDNiZDgzZjY0ZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMy
O2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEwNTIs
NiYjMzI7KzEwNTIsMTgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kcF9kaWdp
dGFsX3N3X3Jlc2V0KHN0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRrX2RwKQ0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjswLCYjMzI7RFBfVFhfVFJBTlNNSVRURVJfNFBfUkVTRVRfU1dfRFBf
VFJBTlNfUDApOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K3N0
YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RwX3NkcF9wYXRoX3Jlc2V0KHN0cnVjdCYjMzI7bXRrX2Rw
JiMzMjsqbXRrX2RwKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOyttdGtfZHBfdXBkYXRlX2JpdHMo
bXRrX2RwLCYjMzI7TVRLX0RQX0VOQzBfUDBfMzAwNCwNCiZndDsmIzMyOytTRFBfUkVTRVRfU1df
RFBfRU5DMF9QMCwNCiZndDsmIzMyOytTRFBfUkVTRVRfU1dfRFBfRU5DMF9QMCk7DQoNCkFsaWdu
JiMzMjt0byYjMzI7dGhlJiMzMjtyaWdodCYjMzI7b2YmIzMyOyYjMzk7KCYjMzk7Lg0KDQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO1dhaXQmIzMyO2ZvciYjMzI7c2RwJiMzMjtwYXRoJiMz
MjtyZXNldCYjMzI7dG8mIzMyO2NvbXBsZXRlJiMzMjsqLw0KJmd0OyYjMzI7K3VzbGVlcF9yYW5n
ZSgxMDAwLCYjMzI7NTAwMCk7DQomZ3Q7JiMzMjsrbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwm
IzMyO01US19EUF9FTkMwX1AwXzMwMDQsDQomZ3Q7JiMzMjsrMCwmIzMyO1NEUF9SRVNFVF9TV19E
UF9FTkMwX1AwKTsNCg0KRGl0dG8uDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kcF9zZXRfbGFu
ZXMoc3RydWN0JiMzMjttdGtfZHAmIzMyOyptdGtfZHAsJiMzMjtpbnQmIzMyO2xhbmVzKQ0KJmd0
OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO210a19kcF91cGRhdGVfYml0cyhtdGtfZHAsJiMz
MjtNVEtfRFBfVFJBTlNfUDBfMzVGMCwNCiZndDsmIzMyO0BAJiMzMjstMjMxNCw2JiMzMjsrMjMy
Niw5JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZHBfYnJpZGdlX2F0b21pY19k
aXNhYmxlKHN0cnVjdCYjMzI7ZHJtX2JyaWRnZSYjMzI7KmJyaWRnZSwNCiZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7RFBfUFdSX1NUQVRFX0JBTkRHQVBfVFBMTCwNCiZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7RFBfUFdSX1NUQVRFX01BU0spOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsm
IzMyOysvKiYjMzI7U0RQJiMzMjtwYXRoJiMzMjtyZXNldCYjMzI7c3cqLw0KJmd0OyYjMzI7K210
a19kcF9zZHBfcGF0aF9yZXNldChtdGtfZHApOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsv
KiYjMzI7RW5zdXJlJiMzMjt0aGUmIzMyO3NpbmsmIzMyO2lzJiMzMjttdXRlZCYjMzI7Ki8NCiZn
dDsmIzMyOyYjMzI7bXNsZWVwKDIwKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7ZGlmZiYj
MzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9yZWcuaCYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX3JlZy5oDQomZ3Q7JiMzMjtpbmRleCYj
MzI7NzA5Yjc5NDgwNjkzLi44YWQ3YTljYzI1OWUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMz
MjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmgNCiZndDsmIzMyOysrKyYj
MzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX3JlZy5oDQomZ3Q7JiMzMjtAQCYj
MzI7LTg2LDYmIzMyOys4Niw3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtNVEtf
RFBfRU5DMF9QMF8zMDA0MHgzMDA0DQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO1ZJREVPX01f
Q09ERV9TRUxfRFBfRU5DMF9QMF9NQVNLQklUKDgpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMy
O0RQX1RYX0VOQ09ERVJfNFBfUkVTRVRfU1dfRFBfRU5DMF9QMEJJVCg5KQ0KJmd0OyYjMzI7KyNk
ZWZpbmUmIzMyO1NEUF9SRVNFVF9TV19EUF9FTkMwX1AwQklUKDEzKQ0KJmd0OyYjMzI7JiMzMjsj
ZGVmaW5lJiMzMjtNVEtfRFBfRU5DMF9QMF8zMDEwMHgzMDEwDQomZ3Q7JiMzMjsmIzMyOyNkZWZp
bmUmIzMyO0hUT1RBTF9TV19EUF9FTkMwX1AwX01BU0tHRU5NQVNLKDE1LCYjMzI7MCkNCiZndDsm
IzMyOyYjMzI7I2RlZmluZSYjMzI7TVRLX0RQX0VOQzBfUDBfMzAxNDB4MzAxNA0KDQo8L3ByZT4N
CjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1922167647.457791699--

