Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FEA11B79
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4352610E51A;
	Wed, 15 Jan 2025 08:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="EWDsiLJs";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="slFkaD6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B862010E51A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:06:07 +0000 (UTC)
X-UUID: 8ea984dad31711ef99858b75a2457dd9-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=N0KVe97IoH4KAs69HL4V8tShf5XXKIWSlIpu2WooeJU=; 
 b=EWDsiLJssQ/6zEMNvR3CHTCJjwSlh9Q9fpE5Vaiw4AfLGJdeRMJY7HPu/Not06ZNCfxSkxmOau3pQSA57+yIxhaxdiLsrbzatIPZ/vrs1c9mA1Ind48TO8czrzqXlTGIsXgFjD1VUfBqun9+qNtqDs/jqNBbo5dFwIPXNaMUZRA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:2e00415a-015a-4b73-abe5-20a64e0df0f5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:6ceb1085-0f10-4f52-bb41-91703793d3e4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8ea984dad31711ef99858b75a2457dd9-20250115
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 298000867; Wed, 15 Jan 2025 16:06:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 Jan 2025 16:05:59 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 15 Jan 2025 16:05:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZYJ19u+1WHsxl07nIw3zTYWBJeiL4vuJAeLaf336Jfpt9GYDo0JKkZkh2tGeokCZuphB/tOiobAvTuqeydK5qhTFDfluleapVjS5UNZvIROecow655sg0cALSlbhxmY4+uC9XIJnYXDQhQnQz0aIs4VjBb6aCYE0YFoOmig8kwAOFQIIZVmmoHjlQMngRhxizqUyHB7G4IV2tVBXWfnD4qlTYX8wn0ioURbe80SjaWy/4FYrHp817bj6SE6dzh2wRY13pz4QkNwpf7CcssQNgLqX0IzKfwILluCJc5gLHbjcStgQuSLR4WkcCY3v+ozdt0/ts3ypUy+Dx269gC+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c780UkolFWOhkiH6tgEYqHx/Xm5XvDiKsq9MMlqz4AI=;
 b=BiYY+VXwgMVsOJX4D/k5To9OgLCyx/k9riJYAA61jDXEfojJCud6YaeIV26u2wmednGdSrG9PeZLtYekKiFe9FLwUdmeUScenHQXyY6MfRdynXDAmcZuMMAfqPVGgoQHJOmqbPuCgVuqnoM1Ny8gEgzmpatm1Grn+dkcM0UdG5yjW4xPrkqcClGxXInyjdOs3QRy5rZUXqwnG494vBM5r+YeJOtas0KXaJc/wRIhGfVy0lMY7WVhulIa68SnekC0RR9LenxeHkqF+cg5UBJRQvrVQJ8RLi7vDq2PhNaXg7rUQNjJHbjg0QQaI7LPiaeopKjeQAwq5N+GFjMSkFf/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c780UkolFWOhkiH6tgEYqHx/Xm5XvDiKsq9MMlqz4AI=;
 b=slFkaD6tLYIQ+63XsZx31Yvr9M7IjycZEXt0446nW3jvlHLrEbqyDdsl3Eqtz9hal6U9yy4AcorUFvQxGgfd/2cqCCy90ZZZS56lFzdSn7PWyclp2tTDfawaCFnfulNhww7hT8MgYbWX+nr+DlRa9O/z5NSroJBdPYuHTD/RdIM=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 TYZPR03MB7520.apcprd03.prod.outlook.com (2603:1096:400:41a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 08:05:56 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 08:05:56 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 00/12] Add Mediatek Soc DRM support for mt8196
Thread-Topic: [PATCH 00/12] Add Mediatek Soc DRM support for mt8196
Thread-Index: AQHbY1ypUwEVPTSsHEaOI087oB7sl7MUrN2AgALVBIA=
Date: Wed, 15 Jan 2025 08:05:56 +0000
Message-ID: <af0030847bb47370f977d18a18287cdc16192cde.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <09c87f13-477d-4721-b27d-f2f2e48f4f71@collabora.com>
In-Reply-To: <09c87f13-477d-4721-b27d-f2f2e48f4f71@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|TYZPR03MB7520:EE_
x-ms-office365-filtering-correlation-id: 82899ddd-8cb0-4903-afd3-08dd353b707d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MFNPSkhUSEFsTWdpVzlmK2VCM0IralNSbHZHYTRweWpIVU00SVJIMk00eTNs?=
 =?utf-8?B?TkxVdmF2ZmJmUUZ1Mjc3cVd2cXhXZmZTZUV3dmJwZUE3d2IwQkdEZ1BhclV5?=
 =?utf-8?B?bUpyNTRMTnZTemEwbUxVeE9PMmRuMCtncHJ0N2JneGc0Nk9RTVdSWWUxbDYx?=
 =?utf-8?B?bkl1c2k1RitiUU02dmNZeFQ4M3dncnQrMlVNV2Z2Zm1UOU8zQUZkMkNwYU5j?=
 =?utf-8?B?NGJFeVhPUTdDbjJiVGw4OE5YdEh2RnJ5Nm5ySHFsYkllNnh1N0VydlBQM2Fy?=
 =?utf-8?B?bXgrRHVzK1NYOUZBY1c5ZFc0NjBEUnRUL2YxR3lzMXBLTllwaVdSS0NBbHpD?=
 =?utf-8?B?ZEU5dk4vdVZrdk5CbXB3UWI1YVd5WGQ5MCtIblNEM1MxSlBSb3RrN1JQQ1ZF?=
 =?utf-8?B?ckdjMEhXK0pxMnZMK0F3SWYvRU1TdEIrbGExMElpVTc2eWUyRjFKNEI3cHBx?=
 =?utf-8?B?Y0w1cXRtMEF6WjRoZFoxRFRtVm5rMHZVWEFIaVhHZWl1UHl0SVBKc3VUYVR1?=
 =?utf-8?B?VlhIcmUxWnJUUU0wZXdHVTMrc2o2dVFGS2h0bFVsdXM0clpDNENHZ21qY3lp?=
 =?utf-8?B?YkRuQzFoRCtGd09PeThVT1VObkRIVFY1V3FKUWNkRmVET1l4Z0NyNGJnMis4?=
 =?utf-8?B?QTFtbGhobVkwUklJM2V5M1FRbFNIYk1uYWpSMUJ3NmFId1RWL0RJUDAycVc0?=
 =?utf-8?B?N3VkWmlyVTVxbVBJRXJTRWhPNGwyVVVkaFJzS0JpanVHWHRMSFYwaVgzY1Fp?=
 =?utf-8?B?eGpvK3NpdDk2UU82djhEdG5IQXZlenZpTklPazRFWG9lcCtQNlNxQlcwcFBj?=
 =?utf-8?B?NTlSVWFFVWJWTEZ0V0pKdGUwZXNNZWUvb2QweXNGYmc2N3NGQjlaUzZCZTk3?=
 =?utf-8?B?cmVUMlUrdWJkbHRLTVUwc0JHRVRuRWNmZmttUFpmS2wwa2hxemx1dFZyWW52?=
 =?utf-8?B?ZW9VVThLNE1mSHZtRUh4QVViUFVqaXlIc0JDamthZEV5U0JSQlQ0M3VUaU11?=
 =?utf-8?B?NlUwMzcwc2w3VjBGdUlDOUpWa1RHM1l0M212WkxuRUdXUElnb1JDM1dTSXVH?=
 =?utf-8?B?RnVlU1VYdFlVZ0lqWDRFRDJ3K0c0enZPUzljYThONUdlRG83V2VWR09UVjJj?=
 =?utf-8?B?TjRmVFA3TC9jUW43aHNCRVZheVYvWGxUK2JmSGo2ZExEeVZTcnBRaytYYkhQ?=
 =?utf-8?B?Yk9xdEM0U1V6R09VSW81azJ3Tk1zQ0J6bmpRV1pESEhiV0tncTg4cWVWdDM2?=
 =?utf-8?B?Z2xYYWMyWjBaYkpFZEtnYXkzNDRNSTZiVC9ORFRMZGxLLzBjTWcyMXVBaGYx?=
 =?utf-8?B?akdBTWlHem0rbndEZ0xGM2xqNHZuZnNhU2lUSDY3R2oxQVZheis2TUJDbWw2?=
 =?utf-8?B?N2paWUxsQSt4NDdNcEJ6L1RHYmNGekpqdEFzNW1BUUUyM3I5bGRIM1dodHpr?=
 =?utf-8?B?R0J5aTVYUklQS0E5WjVpZ2FKcCtPZWh1dFFzVHl1Q3h0WWZWN3NOTlVYRXVw?=
 =?utf-8?B?ZEpzd0Qxamh6ajVwZXc2bGFmWUwzTTgzaEt3YVE0RHltNlM2N21CemVrQ0lP?=
 =?utf-8?B?elNhdUNKR2N4Zy9UYjdmWE4vZjVJRnJHcVorWnNyMjB1TjlWR21obE5MVjdT?=
 =?utf-8?B?aFQrY0YrS1d5THRJRmZLOWwwd2pCWjVhSENFeEExWnJCSlhVUEVJZmpvMEtn?=
 =?utf-8?B?VzZRRVhMbE9uQSt0RC9ad05ZakRKRmNnWDlBMnZMazVQTXpYUkVhOFNxd2x0?=
 =?utf-8?B?d2gxZGRZZGpzQ2duQUs2RFhmL3psbzloSG9CM2xQMG5sMmt6dXZNMCtoblBr?=
 =?utf-8?B?VTRSYjBjN3RMamgyMkpPWmdBSnZ0U05QT3MrVTlETWo1RWpVZTRWNG1FWWtC?=
 =?utf-8?B?S3lFd2xBVCtESnZOUmMvbnF2YXc3NHplbW5BK1RQeVQ0aENST3RZbFFFV1F4?=
 =?utf-8?Q?EA5/aICYgTaGFen/Ot7oBoAZonLLS3ii?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFFOanBrejVoRC9ieS9zSHhabDRxcWoxOHRUZ1l1NzlIYm5ENFJSajJpRUNz?=
 =?utf-8?B?emtPTjNMbWtwRVFraExta3lwMW43RjZqQU5rOFJGNytJS2U2cGdUZ3psV0x2?=
 =?utf-8?B?bUU3Z2J4UVdiRlJDdW5QTTFBNkczZ25jVEJDQUIyTkZ2TnlYR3dCTjhLVGFz?=
 =?utf-8?B?elB1Rk16L01rQVllU3l5TmwybGFNRkJNd1hGR2lrL1JNNUxtTDFXTVUwNHV6?=
 =?utf-8?B?amVTdHB6WGt5K0R3aE1JWHZVRE43QUpzaXBaSjlUaUdoa2F5VDNicHcrYnk5?=
 =?utf-8?B?ZDZ0RldMb29NOTRpaTE4Yi9kUVZocVJraTAyVnk3bWVuaGZ0STVKYnFtZ1VL?=
 =?utf-8?B?UWlQdnUzUXZhZERuWlZBRXpwVzdvQzdLTlRBdnBOZGE4WEI0QjN6Vm1TZVpK?=
 =?utf-8?B?TEloaHhWNlYwQXFJd1NZd0lqWnB4TUNHaGNpQzdFRmRUZ3o2cHR2aTVNQjl4?=
 =?utf-8?B?UldwSExpblVKblVjMUV4UVRHeEs3MjBsRUtKeXI2TUNodEIrWWJvbzV6aDZ2?=
 =?utf-8?B?a2lqTk5JZW9OSHd2MnRGdG1WL05uSDZKdkppQVQ3cHdtUFl6bFBNdzlKYTVT?=
 =?utf-8?B?REJud2NYNFNudTBwaTA5K3prQXFOK0JPZ2tJT2dhRlBzNFFySlZKNnlGOUxp?=
 =?utf-8?B?VkxrbnQxamJyYi9XL1ZvNG0vOW5uenpUWldRWmFsa3lIeVVUbGxHc1BRM05w?=
 =?utf-8?B?Z2F6OFF0QVQ4TGRxQkVuUXhNZldHR1J0dXNqSk1HeVdibWtaZmxGTXJ1NjND?=
 =?utf-8?B?Nk9DN3dteGFNVE01NmJNK2JWbjA4bG54b2dpY2V6eUVCdkNFcVNPVjNIc0hh?=
 =?utf-8?B?blVwOUIrTWVIUTJXcGE2TEdzS2crTnZPNUtNdmsvNGpFK1ZKVm9CNFpUL1Zw?=
 =?utf-8?B?cU5PV2twZEUwWE5pMDcrWGpMUGpMaHdMaGVOQnZZR2pmaWduTktWS24vVndY?=
 =?utf-8?B?ek1rWXJiS0FJWFo1MUtUSjdpMnpwV3Y4ek92ZzZRK1VIbVkwZ2YwY29rbFM4?=
 =?utf-8?B?UFBZbk9La0MxcnFVYkhxV2J5UmtxRkhjYnYvVldQanZOelZ6bW1jcVdlNXhI?=
 =?utf-8?B?UnVsWUpzcEJxY1NYVkdZZk05SDYzVXNLUHA1aU9YdmFRL3VJbCtGdmp4WDZa?=
 =?utf-8?B?YUI2QnVpajN4ZStyWEw0SGYxY0laalhvUGhCMnJXeVRtNFBjOWNrZUlwamJy?=
 =?utf-8?B?SWpIaUdXdkNpQkNmc0s5TXBrcS9LVUhCMDFDT0dRcXp3bDFHUzI5MUdRTzM4?=
 =?utf-8?B?djI2ell0c1ovcEkyRjNYUGlrZjZRL0VORVl3NzkxNWlXWlNVcjBIYXJncjhm?=
 =?utf-8?B?WlU3L2JqUzNiS05ZWXRxVVJnQ3NOMTNlN1FabUFFMHpPS3pxbWlaa1Y5RDI1?=
 =?utf-8?B?T1pYZUVoUGRIZ3V5aTR1ekR2bU5WYVBmTDVyYTdHRkpnQk9VRnBBald6Zlow?=
 =?utf-8?B?dHVwdDVqMVMvQjJQR0M5SCt0MlVLTk0yeTR1dTNGcFUrUVB3dklGbmZFOGpy?=
 =?utf-8?B?U2s5a0dkeHA0NDBHd3FHakJYNTBOeVhvOWY2QjE2R2ZsSnYzbERPVmpRMERN?=
 =?utf-8?B?MXVKSnhkU3UzRFc4cU5OWi82L0NrQ1B3aXo4bTh2UENGL2ZXVFovSWFzc1Mv?=
 =?utf-8?B?ZjM0UVpMZ2oxZTBUVE15Undmc1RhMkQ1bERiNTVTRUtvcDVNZUMwZWJtdGY3?=
 =?utf-8?B?RTNzamRhUmZ6QlpMeTFsTy94dVFOTDMwVVg2anRNeTgvUC9vYlB0dERJQlJj?=
 =?utf-8?B?VFRWeElrZm5hbVQ5dTJSamlkbk5vOWdoU3V4OWN2eTk3NjEzVE5xa01nOXUr?=
 =?utf-8?B?MTVPbXI0NU5VNDlYRnM5RDdhcnREbXJqL3Z3MUlObnFWcFVWZFM3ZDhrZWFE?=
 =?utf-8?B?VDVWbjkzVHFQejVBZ2d1K0NnWDlQbkdXZTNieFNrTDNNR2dIbzBEdjR0WVVW?=
 =?utf-8?B?dEdCZ1Z3ZFliVEtCME5PMHYwNWN4Tysrd0k1dXpEQnZIeVA2aVE2S0MzbXlZ?=
 =?utf-8?B?Q25IT2k2YXlMWExQTmx2dUM5dHR3dTlRcUZaejlJMHBqOGU2STZJZG1ZN0FF?=
 =?utf-8?B?T0FJZ1cwdkkzTWlES2Q0NGFzeEVrWXMxc2R3dWxQR1lHSkxUSis5SG1sazgz?=
 =?utf-8?B?SkNGbXQwTU9oeFVQTmhodHdsWnNGTUVmS3dUL0lGR0lIM3UvYlRVcEZ2NEp4?=
 =?utf-8?B?aFE9PQ==?=
Content-ID: <122D33DA6D66EB49AB4469FFC3695BF1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82899ddd-8cb0-4903-afd3-08dd353b707d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:05:56.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhFWMeksgTmJT9uNdASl4rJXkUGBIDQhgRnBIbuA6UI4SxpHgZsl/I5gMUkmsu/m7TlcvsP93pLqZxDp8AeY0zOK6oNULO5/+yzhl0tHhFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7520
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1911028361.846246807"
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

--__=_Part_Boundary_006_1911028361.846246807
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTAxLTEzIGF0IDEzOjUwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTAvMDEvMjUgMTM6MzMsIHBhdWwt
cGwuY2hlbiBoYSBzY3JpdHRvOg0KPiA+IEZyb206ICJQYXVsLXBsLkNoZW4iIDxwYXVsLXBsLmNo
ZW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IEFkZCBzdXBwb3J0IG11bHRpcGxlIG1tc3lzIGlu
c3RhbmNlcyBpbiB0aGUgb25lIG1lZGlhdGVrLWRybQ0KPiA+IGluc3RhbmNlLg0KPiA+IA0KPiAN
Cj4gSGVsbG8gUGF1bCwNCj4gDQo+IEVYRE1BLCBCTEVOREVSIGFuZCBPVVRQUk9DIHNlZW0gdG8g
aGF2ZSBtYW55IHRoaW5ncyBpbiBjb21tb24gd2l0aA0KPiB0aGUgY3VycmVudA0KPiBtdGtfZGlz
cF9vdmwuYyBkcml2ZXIuDQo+IA0KPiBQbGVhc2UgY29tbW9uaXplIGNvZGUgZnJvbSBtdGtfZGlz
cF9vdmwgdG8gcmV1c2UgaW4gdGhlc2UgdGhyZWUNCj4gY29tcG9uZW50cyB0aGF0DQo+IHlvdSdy
ZSBhZGRpbmcsIGFzIHRoZXJlIGlzIGEgbG90IG9mIGNvZGUgZHVwbGljYXRpb24uDQo+IA0KSGkg
QW5nZWxvLCANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCBmZWVkYmFjay4NCg0KSW4gdGhp
cyBwYXRjaCwgd2UgaGF2ZSBzZXBhcmF0ZWQgdGhlIG5ldyBFWERNQSwgQkxFTkRFUiwgYW5kIE9V
VFBST0MNCmZyb20gdGhlIG9yaWdpbmFsIE9WTCBoYXJkd2FyZSBJUC4NCg0KV2hpbGUgRVhETUEs
IEJMRU5ERVIsIE9VVFBST0MsIGFuZCBPVkwgc2hhcmUgc2ltaWxhciBmdW5jdGlvbmFsaXRpZXMs
DQp0aGV5IGFyZSBmdW5kYW1lbnRhbGx5IGluZGVwZW5kZW50IGhhcmR3YXJlIGNvbXBvbmVudHMg
d2l0aCBkaXN0aW5jdA0KcmVnaXN0ZXIgYmFzZXMgYW5kIG9mZnNldHMuDQpNZXJnaW5nIHRoZW0g
aW50byBhIHNpbmdsZSBkcml2ZXIgd291bGQgaW50cm9kdWNlIHVubmVjZXNzYXJ5DQpjb21wbGV4
aXR5IGR1ZSB0byB0aGVzZSBkaWZmZXJlbmNlcywNCm1ha2luZyBtYWludGVuYW5jZSBhbmQgZnV0
dXJlIGRldmVsb3BtZW50IG1vcmUgY2hhbGxlbmdpbmcuICBGb3INCmVhbXBsZToNCg0KDQoxLiBS
ZWdpc3RlciBEaWZmZXJlbmNlczoNClRha2luZyBFWERNQSBhbmQgT1ZMIGFzIGFuIGV4YW1wbGU6
DQpPVkw6Ly8gT1ZMIFJlc2V0IFJlZ2lzdGVyICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JTVCAweDAw
MTQNCkVYRE1BOi8vIEVYRE1BIFJlc2V0IFJlZ2lzdGVyICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JT
VCAweDAwMjQNCkFsdGhvdWdoIHRoZSBtYWNybyBuYW1lcyBhcmUgc2ltaWxhciwgdGhlIHJlZ2lz
dGVyIGFkZHJlc3NlcyBkaWZmZXIuDQpUaGlzIG1lYW5zIHRoYXQgYW55IG9wZXJhdGlvbiBpbnZv
bHZpbmcgdGhlc2UgcmVnaXN0ZXJzIG11c3QgYWNjb3VudA0KZm9yIGRpZmZlcmVudCBiYXNlIGFk
ZHJlc3NlcyBhbmQgb2Zmc2V0cy4NCg0KDQoyLiBGdW5jdGlvbiBJbXBsZW1lbnRhdGlvbiBWYXJp
YXRpb25zOg0KVGhlc2UgcmVnaXN0ZXIgZGlmZmVyZW5jZXMgaW1wYWN0IGZ1bmN0aW9uIGltcGxl
bWVudGF0aW9uczoNCk9WTCBGdW5jdGlvbjoNCiAgICBtdGtfb3ZsX2NvbmZpZygpOw0KRVhETUEg
RnVuY3Rpb246DQogICAgbXRrX2Rpc3BfZXhkbWFfc3RvcCgpOw0KDQpJbnRlZ3JhdGluZyB0aGVz
ZSBmdW5jdGlvbnMgd291bGQgbmVjZXNzaXRhdGUgY29uZGl0aW9uYWwgbG9naWMgdG8NCmhhbmRs
ZSB0aGUgZGlmZmVyZW50IHJlZ2lzdGVycyBhbmQgYmVoYXZpb3JzLA0KbGVhZGluZyB0byBsZXNz
IHJlYWRhYmxlIGFuZCBtYWludGFpbmFibGUgY29kZS4NCg0KDQpCZXN0LCBQYXVsIA0KDQoNCj4g
VGhhbmtzLA0KPiBBbmdlbG8NCg0KDQovL3NuaXANCg0K

--__=_Part_Boundary_006_1911028361.846246807
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDEtMTMmIzMyO2F0
JiMzMjsxMzo1MCYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzEwLzAxLzI1JiMzMjsx
MzozMywmIzMyO3BhdWwtcGwuY2hlbiYjMzI7aGEmIzMyO3Njcml0dG86DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtGcm9tOiYjMzI7JnF1b3Q7UGF1bC1wbC5DaGVuJnF1b3Q7JiMzMjsmbHQ7cGF1bC1wbC5j
aGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7QWRkJiMzMjtzdXBwb3J0JiMzMjttdWx0aXBsZSYjMzI7bW1zeXMmIzMyO2luc3RhbmNlcyYj
MzI7aW4mIzMyO3RoZSYjMzI7b25lJiMzMjttZWRpYXRlay1kcm0NCiZndDsmIzMyOyZndDsmIzMy
O2luc3RhbmNlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0hlbGxv
JiMzMjtQYXVsLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtFWERNQSwmIzMyO0JMRU5ERVImIzMyO2Fu
ZCYjMzI7T1VUUFJPQyYjMzI7c2VlbSYjMzI7dG8mIzMyO2hhdmUmIzMyO21hbnkmIzMyO3RoaW5n
cyYjMzI7aW4mIzMyO2NvbW1vbiYjMzI7d2l0aA0KJmd0OyYjMzI7dGhlJiMzMjtjdXJyZW50DQom
Z3Q7JiMzMjttdGtfZGlzcF9vdmwuYyYjMzI7ZHJpdmVyLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtQ
bGVhc2UmIzMyO2NvbW1vbml6ZSYjMzI7Y29kZSYjMzI7ZnJvbSYjMzI7bXRrX2Rpc3Bfb3ZsJiMz
Mjt0byYjMzI7cmV1c2UmIzMyO2luJiMzMjt0aGVzZSYjMzI7dGhyZWUNCiZndDsmIzMyO2NvbXBv
bmVudHMmIzMyO3RoYXQNCiZndDsmIzMyO3lvdSYjMzk7cmUmIzMyO2FkZGluZywmIzMyO2FzJiMz
Mjt0aGVyZSYjMzI7aXMmIzMyO2EmIzMyO2xvdCYjMzI7b2YmIzMyO2NvZGUmIzMyO2R1cGxpY2F0
aW9uLg0KJmd0OyYjMzI7DQpIaSYjMzI7QW5nZWxvLCYjMzI7DQoNClRoYW5rcyYjMzI7Zm9yJiMz
Mjt0aGUmIzMyO3JldmlldyYjMzI7YW5kJiMzMjtmZWVkYmFjay4NCg0KSW4mIzMyO3RoaXMmIzMy
O3BhdGNoLCYjMzI7d2UmIzMyO2hhdmUmIzMyO3NlcGFyYXRlZCYjMzI7dGhlJiMzMjtuZXcmIzMy
O0VYRE1BLCYjMzI7QkxFTkRFUiwmIzMyO2FuZCYjMzI7T1VUUFJPQw0KZnJvbSYjMzI7dGhlJiMz
MjtvcmlnaW5hbCYjMzI7T1ZMJiMzMjtoYXJkd2FyZSYjMzI7SVAuDQoNCldoaWxlJiMzMjtFWERN
QSwmIzMyO0JMRU5ERVIsJiMzMjtPVVRQUk9DLCYjMzI7YW5kJiMzMjtPVkwmIzMyO3NoYXJlJiMz
MjtzaW1pbGFyJiMzMjtmdW5jdGlvbmFsaXRpZXMsDQp0aGV5JiMzMjthcmUmIzMyO2Z1bmRhbWVu
dGFsbHkmIzMyO2luZGVwZW5kZW50JiMzMjtoYXJkd2FyZSYjMzI7Y29tcG9uZW50cyYjMzI7d2l0
aCYjMzI7ZGlzdGluY3QNCnJlZ2lzdGVyJiMzMjtiYXNlcyYjMzI7YW5kJiMzMjtvZmZzZXRzLg0K
TWVyZ2luZyYjMzI7dGhlbSYjMzI7aW50byYjMzI7YSYjMzI7c2luZ2xlJiMzMjtkcml2ZXImIzMy
O3dvdWxkJiMzMjtpbnRyb2R1Y2UmIzMyO3VubmVjZXNzYXJ5DQpjb21wbGV4aXR5JiMzMjtkdWUm
IzMyO3RvJiMzMjt0aGVzZSYjMzI7ZGlmZmVyZW5jZXMsDQptYWtpbmcmIzMyO21haW50ZW5hbmNl
JiMzMjthbmQmIzMyO2Z1dHVyZSYjMzI7ZGV2ZWxvcG1lbnQmIzMyO21vcmUmIzMyO2NoYWxsZW5n
aW5nLiYjMzI7JiMzMjtGb3INCmVhbXBsZToNCg0KDQoxLiYjMzI7UmVnaXN0ZXImIzMyO0RpZmZl
cmVuY2VzOg0KVGFraW5nJiMzMjtFWERNQSYjMzI7YW5kJiMzMjtPVkwmIzMyO2FzJiMzMjthbiYj
MzI7ZXhhbXBsZToNCk9WTDovLyYjMzI7T1ZMJiMzMjtSZXNldCYjMzI7UmVnaXN0ZXImIzMyOyNk
ZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9SU1QmIzMyOzB4MDAxNA0KRVhETUE6Ly8mIzMyO0VYRE1B
JiMzMjtSZXNldCYjMzI7UmVnaXN0ZXImIzMyOyNkZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9SU1Qm
IzMyOzB4MDAyNA0KQWx0aG91Z2gmIzMyO3RoZSYjMzI7bWFjcm8mIzMyO25hbWVzJiMzMjthcmUm
IzMyO3NpbWlsYXIsJiMzMjt0aGUmIzMyO3JlZ2lzdGVyJiMzMjthZGRyZXNzZXMmIzMyO2RpZmZl
ci4NClRoaXMmIzMyO21lYW5zJiMzMjt0aGF0JiMzMjthbnkmIzMyO29wZXJhdGlvbiYjMzI7aW52
b2x2aW5nJiMzMjt0aGVzZSYjMzI7cmVnaXN0ZXJzJiMzMjttdXN0JiMzMjthY2NvdW50DQpmb3Im
IzMyO2RpZmZlcmVudCYjMzI7YmFzZSYjMzI7YWRkcmVzc2VzJiMzMjthbmQmIzMyO29mZnNldHMu
DQoNCg0KMi4mIzMyO0Z1bmN0aW9uJiMzMjtJbXBsZW1lbnRhdGlvbiYjMzI7VmFyaWF0aW9uczoN
ClRoZXNlJiMzMjtyZWdpc3RlciYjMzI7ZGlmZmVyZW5jZXMmIzMyO2ltcGFjdCYjMzI7ZnVuY3Rp
b24mIzMyO2ltcGxlbWVudGF0aW9uczoNCk9WTCYjMzI7RnVuY3Rpb246DQomIzMyOyYjMzI7JiMz
MjsmIzMyO210a19vdmxfY29uZmlnKCk7DQpFWERNQSYjMzI7RnVuY3Rpb246DQomIzMyOyYjMzI7
JiMzMjsmIzMyO210a19kaXNwX2V4ZG1hX3N0b3AoKTsNCg0KSW50ZWdyYXRpbmcmIzMyO3RoZXNl
JiMzMjtmdW5jdGlvbnMmIzMyO3dvdWxkJiMzMjtuZWNlc3NpdGF0ZSYjMzI7Y29uZGl0aW9uYWwm
IzMyO2xvZ2ljJiMzMjt0bw0KaGFuZGxlJiMzMjt0aGUmIzMyO2RpZmZlcmVudCYjMzI7cmVnaXN0
ZXJzJiMzMjthbmQmIzMyO2JlaGF2aW9ycywNCmxlYWRpbmcmIzMyO3RvJiMzMjtsZXNzJiMzMjty
ZWFkYWJsZSYjMzI7YW5kJiMzMjttYWludGFpbmFibGUmIzMyO2NvZGUuDQoNCg0KQmVzdCwmIzMy
O1BhdWwmIzMyOw0KDQoNCiZndDsmIzMyO1RoYW5rcywNCiZndDsmIzMyO0FuZ2Vsbw0KDQoNCi8v
c25pcA0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_1911028361.846246807--

