Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5604B219E6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 02:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07BA10E27A;
	Tue, 12 Aug 2025 00:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="V8J+vub1";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="U4WZkwGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485EE10E062
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 00:46:38 +0000 (UTC)
X-UUID: c9c10514771511f08729452bf625a8b4-20250812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=An/SopgcTo+iCJ5jkYG5bXQsXo2H55kwnsVq3xs3O30=; 
 b=V8J+vub1E7mYdz34Ikwj3H5vW6G27DXDHhFIIgJDtqnbf+9uvNIM0WPbFuEFcRni8wusnqw5+xiOyhq3+r/VSAYZWfN9G2RmXNGArOr0yf4IR9oUeVc52fMqVLav7yfz1ldadzarvxmO3glDNPD7sU543/QqYjkArRvuwr/l7Yg=;
X-CID-CACHE: Type:Local,Time:202508120846+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:8dd57fe6-1274-405b-9bb1-fc445e03b5e1, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:1f694c51-d89a-4c27-9e37-f7ccfcbebd5b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9c10514771511f08729452bf625a8b4-20250812
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 342740948; Tue, 12 Aug 2025 08:46:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 12 Aug 2025 08:46:30 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 12 Aug 2025 08:46:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QejrBjyJRdEonxw2AMyi6CHIBRg+8OazlXnNeea/czXfo6qxYvI2AUsBARSAFZO3UvzzcyLVp+OjsnDXPLx32AROM7N8ZM+d19sD3P1QQFL8Ii2VVyrDVAm3hdxM+hdikGYnyUGiNv2fQ9nefz6Hy58V6UTTSSIuoEC5o7OpIL6FHOHCt/iUdoT1CQD930JhtLG4boFGgnEP7MsX0LLtS62gnALmEMiaTYf4uKE8AVw4N7m055KOgiJPqgxxIDkFPEXvwWxLnKtpexvysJ9iT6pl32bfIChycLtO/zCa+77eux6NF54Je8GeHISEiM64T81IiH6qucLmPojeJ68e8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1koJCzFz6QwhZ0w/MpqQke0Vg9BWhKZRz/Q0TJGh92g=;
 b=hGhSp6LUU9QJhEbUInKRrMvBJ438/0NSGNrZSNCz1KHlkQlXa6pnnPAYt7PSvUvIrdqgKiEcY0+CoEcPsgCSXW4DN9IuGIYsVK+ra1cNIens4AHadB+fjoLAIUIzja0Tk4O9DGGNNmrEUdCA0IFc+McVSOy5PRvt81r58G0MLxg+W9OMJllNUG8uLmp7ZYNfnePCQYPRpqFYt+R77Rn6CQ1YwxKK87R48QVdB+p7kCZ9Pqf/+jB8tpJRZuk+paJBhZIGCmwgIrj+ssg8ukTTOIq5TmuJpRk4CjYFAbhb63fEFkPpvkZFJcZ3i5wbUtyoIZDy/M5tJmRRxu3y+oYFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1koJCzFz6QwhZ0w/MpqQke0Vg9BWhKZRz/Q0TJGh92g=;
 b=U4WZkwGcjWSmFtPXElSa3xxplJcWjvenbEiethjIOpa/iePP4KFCIwe2ajOFdQKeReJeFwaUYSGQUJ4myW7f7sjHFUITWETaBqimuBKKG9iFtOKKDrA1ezNBV4qfddFgq7pUzrkvxH404KA+3vAbVntgfibKpYGzZkod2DA+qIM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7860.apcprd03.prod.outlook.com (2603:1096:400:47b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 00:46:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 00:46:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "towwy321@gmail.com" <towwy321@gmail.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "msp@baylibre.com"
 <msp@baylibre.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "granquet@baylibre.com"
 <granquet@baylibre.com>
CC: =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/mediatek: dp: Fix suspend/resume training failure
Thread-Topic: [PATCH v3] drm/mediatek: dp: Fix suspend/resume training failure
Thread-Index: AQHcCb7Z9LD2TPcSxUutqgH2NNREuLRdMRsAgAEAdoA=
Date: Tue, 12 Aug 2025 00:46:26 +0000
Message-ID: <c5abc7ac387a2bd51d000ca95bb90f37b097d0d0.camel@mediatek.com>
References: <20250810061738.10977-1-towwy321@gmail.com>
 <c10ff37d3730bb1d434958d4d7f7002730fb117e.camel@mediatek.com>
In-Reply-To: <c10ff37d3730bb1d434958d4d7f7002730fb117e.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7860:EE_
x-ms-office365-filtering-correlation-id: f0dbdfc0-959f-4835-e4c3-08ddd939ab05
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YktJa2p5MjBzUGFMU3Z3TVdDWXIyeFg5bDlrWVVYZXdTWk8wR0tBdnpzNlVR?=
 =?utf-8?B?NVVlcUt6SjBOTWNLY1A0cmlwaEpQT3ZUM2haWXpacTk2ZTJXeHJsa1Mwalhp?=
 =?utf-8?B?SEZOdkNCczhsODVCYW5sN3pndTVFbzQ4MERaR21oTGJoeWdCc3Rsb2JwM0tT?=
 =?utf-8?B?WUs5R2ZpaDJWMlZsS3hDTkpsSDNadjZXbXhqb0RDN1BZRUhpNmtvRFNEQlpj?=
 =?utf-8?B?aFE3S1ZRcUNhdEFuV2xjTUEzQllhbkZNMjVNN2pvd1hvM3ZNMHgyR1gwTkN4?=
 =?utf-8?B?dlkxQmZSYzg0S05uQk9qaVNHQ24rWWQ2dlV0QlpCNDBBUGFPRlYvM2hxWFY2?=
 =?utf-8?B?VWFienpXRVlnWVJidVdmTGhOczdLbEtXRXFHRXJ3RTlqUURKSFhyOHdkUFVY?=
 =?utf-8?B?aHFmekU4ZCtPTkZGdFBPc2I1Smt4SVVrZ1ppY05qQkh2TGhDNkJjVUFWejk1?=
 =?utf-8?B?dEgramh6OUVZb2dub3NhNVk0R1JSaEU3K1J1ckFjWTVtMVJwcmRucitpeFlz?=
 =?utf-8?B?dkd1VEE5OTVoRUNoZmNOZVJ2WjRycFhYMTBoK01uOE4vWTlkSHFIZUh6MFVO?=
 =?utf-8?B?TGJ2MUFjaExEbGNPQzRlbTc4czY2UzVFTzk1U3owWEpkSlY2OGpJdjVWWXV3?=
 =?utf-8?B?a2dkWVZWQ1ZvZThPL0NWRjBRbDA2N1JDUWU1c2ZSUU5mVXdidS92UjBnMnV6?=
 =?utf-8?B?WTBUN20yS2p3S1F1bDdhQytNU3hodHlGaVNFZWxZNUVMV3FLUmgyakMxWTRo?=
 =?utf-8?B?MHV2SlRHRHdJQkhVZmZ6cjZPL3FOSm9sM2ZHZkpwVUdqSC9JTFZHU2puUVR1?=
 =?utf-8?B?Y0pQbTBJbDRsaVI5bjZvUkQyWWtBRS9kZjdOQncxUTRVNHErb0RuUFlPcy9K?=
 =?utf-8?B?TnpSckhBc04zTHgyM1JaZDk3MGRrUHo5WTZQRWVGVGVpaWw0dDlnTm51NGh6?=
 =?utf-8?B?a1ZlWkFIR1QrMTJWSmluKzNCWU1JTk1wZ0dXMDdJaFhNNy9sUnlyZVZYMWRI?=
 =?utf-8?B?K3U4dlY1WmZvbVFlaE80L1UxN2d4bDF5UkxwQ2U4aGRDTkw3eU5jWVBrWGtO?=
 =?utf-8?B?Yk1QeHVNYWcwL1FMb3hKS2pYdzFJM3N2MGJ1TmpubmJQUFcvNE5vOFhYZVNw?=
 =?utf-8?B?MGxUdlYzYVFZRWFLZUlIYlZubUJva0JQOGN4ZlFTVjJtSnJ4b0Z3Z1RhL3kr?=
 =?utf-8?B?Y1NoQkptZFEzV3FoakQ3amxOVTBRZjRwamJPS1pSSDJUSGpPWUxoOUdjS04y?=
 =?utf-8?B?dzJ2Kyt1VjRkeUNDVGRMSnBnNFk3Z0tqWFBLT21aWCtrUTJTNm1Ha1JHVEdI?=
 =?utf-8?B?dDZ2dzU5SnIxQzNiMzZjR3dRRGtmcGhoeS9GWGFaa2o0MzhyeTMweHQ4SGx0?=
 =?utf-8?B?S3JqL0lOM1FEcmdMM2JHeHlHMndrRGpYVEE5cWhCbXlTVlF5UmtUOC80cVVh?=
 =?utf-8?B?Z0M3SUcrRjB5RVFjUWNCUSsycFlySFpHMWR1cUJGRDdXM1ZpS05Jd3NtbTZS?=
 =?utf-8?B?NWRMMHVnK0NYMjgyNVN5ZnVLbnFOV2I2dW40NnQyTE95K3IvSDZJUmRjUUV3?=
 =?utf-8?B?dDg5aDdUbHNOaVRWeGpyaVIrMVVMa3hKN1BKNmVQd2Uyd21pcW5HWElYdy9Z?=
 =?utf-8?B?dEhrdVR2bEh3MktxSUJSOXYrb3QxREY2YTdSMnR1dnpTSjNHM3NJRHFkUmNn?=
 =?utf-8?B?WkRnT05YbmZOUmtJMDFQQmVJbVJZc0xjdW1McWw2T0ptWU94WUdudjFVNUZ2?=
 =?utf-8?B?YlNmK0ZIY1RyenAwK0ZEcFBTWUFjZFkyQUVpL0xKUm5XZHpHa0tnZkVFNGM2?=
 =?utf-8?B?blBNTXN3b1QrUldmRTNKVmVyYlkrZ1Z1M3pycjl6VkVvK0k1KzNldWlNMnIv?=
 =?utf-8?B?emxoelhPbXJQODlzVVFyU0lzM2duRzI1Tk8vYStjQmtqUHltRE1CdUJBKzBP?=
 =?utf-8?B?RC9oNkxEZnFTcDFKK3IvWkZzYUNzZ3VtSlJmUmFlejhoZ1NzT2QvWW93YTNS?=
 =?utf-8?B?OUlmL1pXbmJBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(7416014)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDJEZ2hZbDlLTVJZNEdCUjE5VEZLanNDeUllVlAxQVNnZm80MVpLd0NZR1RD?=
 =?utf-8?B?UXVIQk1aamZhdk0vZUhiN0QzTWUrcWJjUzJwY2lTNVdUUWkvQS9ndTBmZ21X?=
 =?utf-8?B?ZDRudUVsekFiWGFOTVVZbW9kMTFXbEs4Z05zQitranU2Y1A3MXAwVGowU0Vm?=
 =?utf-8?B?Q0pxck9yNWhoVTB6VFZpWFVLT1oySFBwNHNyR3lQeGRVT2xiR2JXbW5IU3ls?=
 =?utf-8?B?ZWlvQzFLNE9TTWllVDd6dSszZm9hSGJqdUZYVXlDZXNMUHNpdFU1Q3pjZlR4?=
 =?utf-8?B?MFJSaXh3bVBxRnhtN2hGN0tiNU9DY0lIVXI0ZHp2SlBWMkMwQzhsTWxXbTFm?=
 =?utf-8?B?NFcyVTRTTkZuNjgzeDM2c2ZlR2N6ZWNLM0d4M1ZJVGo1OVQ4TTlURm1Cam0r?=
 =?utf-8?B?WFc2bWdkOTdCM0lldjZyOXZZZWFWd2U0VWViRk53eHBEcVA4dGFlS2hBbjRV?=
 =?utf-8?B?cERjSWI2TG16TkM3YjM1cGMzdGRadEo4cUpJZnRGRHB2M1gvR29DUXloQ0FC?=
 =?utf-8?B?WkFOazVib2hVTEpQL1FQOXBOOUtqdmhKNGJrZTZxNldxK08ySUNzYWZvSTdC?=
 =?utf-8?B?ZmZKM2JsRTBKYXIzY1FJeWZZTzdXOU9HMG9kVlJsQlE1bjZqblVHSWxDRzhh?=
 =?utf-8?B?VU9yeENJbEFZMlFmYmhKa2VxdWZiSkhYcVdCTHBNWkpianRjWGNKd2VhZGZH?=
 =?utf-8?B?N0JiZlhOS3BRcFE1THhxTnZUMFNydzZ2cGM5U3BLby9FZjFyUDUzSVNuMExC?=
 =?utf-8?B?UUYxTUlkaHJNNjNPUUJjbUtzYWw4MjBzdFM0RGVNb3dGVEhlYys5czIyTmQv?=
 =?utf-8?B?SW1qRXNTekhZSElsQnJjWG9rc3FPSXVnak9XVmlSbllXVW53KzBLRitFSkxa?=
 =?utf-8?B?V2llRlVHdVY4dkcvMitoczhyYXZqSVhJTllNeGhNVzFxK3Y5YWEvK2tmem85?=
 =?utf-8?B?VWlxbGNzWUNBVDZCRisxSUxUbHZUMFlQYkRpTHFGZGVxeUFMdnJpbnpqbWcy?=
 =?utf-8?B?R2diUm9jbnI5cWNZa3dnV2w5enZwUS82YUxEUDdXcm5iSTRRdGt4YnkwNHRi?=
 =?utf-8?B?Z1M1c2gxcmlsUExrN2M1bEhKeURXU09ldFN6ZStPZVE1TXBrcEhIV0RyTjZR?=
 =?utf-8?B?NVBsLzAwMHkzaEdvSWx6WmdiM3JpZDJGK0lFZklsVUxqcEJTNjluTmxNeXZs?=
 =?utf-8?B?Rkh4UGtyeUJ6OXBYQWtxNWgrQzVmdHdjMnQ5Ykl1WkpXZitoZWRWSXV1MXk1?=
 =?utf-8?B?c0g0MWhiVmUza0hlQkVWSDcwOVgxbXIvL2Z3dHNzemV3Z3IvbVRiemk3SXBl?=
 =?utf-8?B?c3JEK2NmSiszL3NzNUIyMlhrUExLOU5pclViMlNpOERzbStNSzE1am5Od0hL?=
 =?utf-8?B?S0djek4ra3ZYRVV3QU9sSW5jWmlZaURaS082L0JuL3lka2xtVzZ0Q21HdWUy?=
 =?utf-8?B?bE9xSkNhZlNHNFpvZVJ4eXlkdGFnL1VWR2M5QjVidE83VmFoZFhQOS90ZXhV?=
 =?utf-8?B?MUdrc3JmUysxemExeGF4b1IxRk45MU9FN1lkVzA4MTh6aW44ZWpNVmVXZHo0?=
 =?utf-8?B?alVqMUdkN1pSZjN5eTh0UFlVd0M4bmx0cFVaWmp1MDlQcjB6Y0JSc1dKbDhL?=
 =?utf-8?B?YU1GK05DK3dZU25TWjdyQW5JMG5sSkNOT0hFNExUK1NNTWFzcENtaUtrRHli?=
 =?utf-8?B?Mi9iTnpxU2wrRUVhbzRDLzQwKzYxdUVJWWRYUGVmTS8rZnI4NXV1RGJ4a2tR?=
 =?utf-8?B?QjdMSEgvV3lsN0xoOFY2UDJDT0tvSHdsRUlyRHlOT015REJSOXBZMno3OGht?=
 =?utf-8?B?cUUyUGNzakNNU3B4Wjc3c3ZRMkd2TTJHVDRMYzZxS3pSNHEwVzRJeDl4UGJh?=
 =?utf-8?B?VWQxL1JOY1A4Zk9tU1hTaldOQzV2ZDl3Yy8wSWpYWmlFTmJkS3htNFJUaURH?=
 =?utf-8?B?YXZMcW9qTmVvTlpwbGNoaWs5RUpWdnZzQ0xiNCtKZXdDOG5aQ2hCd2dONzJB?=
 =?utf-8?B?RFlUbzZ2OUtpVitQSHdzVFdXbjIvRThHRURZV3pFQ3A5ZGVDQWtHcjZyTTQx?=
 =?utf-8?B?ZG53VTN4U2lQQ0lqTlNKUWFtMmZUMzJlUmFNWXNCRG9pWmc4aWNxblZBRlVN?=
 =?utf-8?Q?cg6WuJqR1vz4uMQ3wvMayRbzR?=
Content-ID: <B6424824B154E84AA77AD669DAF7DF05@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dbdfc0-959f-4835-e4c3-08ddd939ab05
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 00:46:26.1772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T34+g2ZhkqpogB8ndDGFT+JxNmFycG3MnaFgZiZStX+3Aw07nvQbfbsR/iecFqk1Jq0uxyHqWO6bDtZXW3LCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7860
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1795423355.852569181"
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

--__=_Part_Boundary_006_1795423355.852569181
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA4LTExIGF0IDE3OjI4ICswODAwLCBDSyBIdSB3cm90ZToNCj4gT24gU3Vu
LCAyMDI1LTA4LTEwIGF0IDE0OjE3ICswODAwLCBIYXJ1IFpoZW5nIHdyb3RlOg0KPiA+IEV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4g
DQo+ID4gDQo+ID4gV2hlbiBzdXNwZW5kaW5nIGFuZCByZXN1bWluZyBEaXNwbGF5UG9ydCB2aWEg
VHlwZS1DLA0KPiA+IGxpbmsgdHJhaW5pbmcgd2lsbCBiZSBmYWlsLg0KPiA+IA0KPiA+IFRoaXMg
cGF0Y2ggYmFja3BvcnRzIHRoZSBzb2Z0d2FyZSBJUlEgaGFuZGxpbmcgZm9yIERQLA0KPiA+IGFz
IGVEUCB1c2VzIGhhcmR3YXJlIElSUSB3aGlsZSBEUCB1c2VzIHNvZnR3YXJlIElSUS4NCj4gDQo+
IFRoaXMgcGF0Y2gganVzdCBtb2RpZnkgdGhlIGZsb3cgb2YgRFAsIG5vdCBlRFAsIHNvIGRvIG5v
dCBtZW50aW9uIGVEUCBoZXJlLg0KPiBGb3IgRFAsIEkgZG9uJ3Qga25vdyB3aHkgaGFyZHdhcmUg
SVJRIHdvdWxkIGZhaWwuDQo+IEhETUkgc3VwcG9ydCBzdXNwZW5kIGFuZCByZXN1bWUgYW5kIGl0
IGRvZXMgbm90IHNvZnR3YXJlIElSUS4NCj4gUGxlYXNlIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSBi
ZWhhdmlvciB3aGVuIHJlc3VtZSBhbmQgcG9pbnQgb3V0IHdoeSBoYXJkd2FyZSB3b3VsZCBub3Qg
dHJpZ2dlciBoYXJkd2FyZSBob3QgcGx1ZyBpbnRlcnJ1cHQuDQoNCkluIGFkZGl0aW9uLCByZXN1
bWUgZmxvdyBpcyBzaW1pbGFyIHRvIGJvb3QgdXAgZmxvdy4NCg0KSW4gYm9vdCB1cCBmbG93LCB0
aGUgc3RlcCBpczoNCjEuIFBsdWcgaW4gY2FibGUNCjIuIFBvd2VyIG9uIERQIGhhcmR3YXJlLg0K
My4gRFAgSERQIGhhcmR3YXJlIGludGVycnVwdCBoYXBwZW4uDQoNClNvLCBpbiByZXN1bWUgZmxv
dzoNCjEuIFBsdWcgaW4gY2FibGUNCjIuIFBvd2VyIG9uIERQIGhhcmR3YXJlDQozLiBEUCBIRFAg
aGFyZHdhcmUgaW50ZXJydXB0IGhhcHBlbi4gKGRpc2FwcGVhcj8pDQoNClRoZSBmbG93IGlzIHRo
ZSBzYW1lLCB3aHkgcmVzdW1lIGhhcyBubyBoYXJkd2FyZSBpbnRlcnJ1cHQ/DQoNClJlZ2FyZHMs
DQpDSw0KDQo+IA0KPiA+IEFkZGl0aW9uYWxseSwgY2FibGVfcGx1Z2dlZF9pbiBpcyBmbGlwcGVk
IGluDQo+ID4gbXRrX2RwX2hwZF9ldmVudCB0byBlbnN1cmUgY29ycmVjdCBob3RwbHVnIGRldGVj
dGlvbg0KPiA+IGR1cmluZyByZXN1bWUuDQo+ID4gDQo+ID4gVGhlc2UgY2hhbmdlcyBmaXggdGhl
IERQIHRyYWluaW5nIGZhaWx1cmUgYWZ0ZXIgc3VzcGVuZC9yZXN1bWUuDQo+ID4gDQo+ID4gRml4
ZXM6IGY3MGFjMDk3YTJjZiAoImRybS9tZWRpYXRlazogQWRkIE1UODE5NSBFbWJlZGRlZCBEaXNw
bGF5UG9ydCBkcml2ZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhcnUgWmhlbmcgPHRvd3d5MzIx
QGdtYWlsLmNvbT4NCj4gPiANCj4gPiAtLS0NCg0K

--__=_Part_Boundary_006_1795423355.852569181
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDgtMTEmIzMyO2F0
JiMzMjsxNzoyOCYjMzI7KzA4MDAsJiMzMjtDSyYjMzI7SHUmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
T24mIzMyO1N1biwmIzMyOzIwMjUtMDgtMTAmIzMyO2F0JiMzMjsxNDoxNyYjMzI7KzA4MDAsJiMz
MjtIYXJ1JiMzMjtaaGVuZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtFeHRlcm5hbCYj
MzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xp
bmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMy
O2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7
Y29udGVudC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtXaGVuJiMzMjtzdXNwZW5kaW5nJiMzMjthbmQmIzMyO3Jlc3VtaW5nJiMzMjtE
aXNwbGF5UG9ydCYjMzI7dmlhJiMzMjtUeXBlLUMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtsaW5rJiMz
Mjt0cmFpbmluZyYjMzI7d2lsbCYjMzI7YmUmIzMyO2ZhaWwuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO3BhdGNoJiMzMjtiYWNrcG9ydHMmIzMyO3RoZSYj
MzI7c29mdHdhcmUmIzMyO0lSUSYjMzI7aGFuZGxpbmcmIzMyO2ZvciYjMzI7RFAsDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjthcyYjMzI7ZURQJiMzMjt1c2VzJiMzMjtoYXJkd2FyZSYjMzI7SVJRJiMzMjt3
aGlsZSYjMzI7RFAmIzMyO3VzZXMmIzMyO3NvZnR3YXJlJiMzMjtJUlEuDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1RoaXMmIzMyO3BhdGNoJiMzMjtqdXN0JiMzMjttb2RpZnkmIzMyO3RoZSYjMzI7Zmxv
dyYjMzI7b2YmIzMyO0RQLCYjMzI7bm90JiMzMjtlRFAsJiMzMjtzbyYjMzI7ZG8mIzMyO25vdCYj
MzI7bWVudGlvbiYjMzI7ZURQJiMzMjtoZXJlLg0KJmd0OyYjMzI7Rm9yJiMzMjtEUCwmIzMyO0km
IzMyO2RvbiYjMzk7dCYjMzI7a25vdyYjMzI7d2h5JiMzMjtoYXJkd2FyZSYjMzI7SVJRJiMzMjt3
b3VsZCYjMzI7ZmFpbC4NCiZndDsmIzMyO0hETUkmIzMyO3N1cHBvcnQmIzMyO3N1c3BlbmQmIzMy
O2FuZCYjMzI7cmVzdW1lJiMzMjthbmQmIzMyO2l0JiMzMjtkb2VzJiMzMjtub3QmIzMyO3NvZnR3
YXJlJiMzMjtJUlEuDQomZ3Q7JiMzMjtQbGVhc2UmIzMyO2Rlc2NyaWJlJiMzMjt0aGUmIzMyO2hh
cmR3YXJlJiMzMjtiZWhhdmlvciYjMzI7d2hlbiYjMzI7cmVzdW1lJiMzMjthbmQmIzMyO3BvaW50
JiMzMjtvdXQmIzMyO3doeSYjMzI7aGFyZHdhcmUmIzMyO3dvdWxkJiMzMjtub3QmIzMyO3RyaWdn
ZXImIzMyO2hhcmR3YXJlJiMzMjtob3QmIzMyO3BsdWcmIzMyO2ludGVycnVwdC4NCg0KSW4mIzMy
O2FkZGl0aW9uLCYjMzI7cmVzdW1lJiMzMjtmbG93JiMzMjtpcyYjMzI7c2ltaWxhciYjMzI7dG8m
IzMyO2Jvb3QmIzMyO3VwJiMzMjtmbG93Lg0KDQpJbiYjMzI7Ym9vdCYjMzI7dXAmIzMyO2Zsb3cs
JiMzMjt0aGUmIzMyO3N0ZXAmIzMyO2lzOg0KMS4mIzMyO1BsdWcmIzMyO2luJiMzMjtjYWJsZQ0K
Mi4mIzMyO1Bvd2VyJiMzMjtvbiYjMzI7RFAmIzMyO2hhcmR3YXJlLg0KMy4mIzMyO0RQJiMzMjtI
RFAmIzMyO2hhcmR3YXJlJiMzMjtpbnRlcnJ1cHQmIzMyO2hhcHBlbi4NCg0KU28sJiMzMjtpbiYj
MzI7cmVzdW1lJiMzMjtmbG93Og0KMS4mIzMyO1BsdWcmIzMyO2luJiMzMjtjYWJsZQ0KMi4mIzMy
O1Bvd2VyJiMzMjtvbiYjMzI7RFAmIzMyO2hhcmR3YXJlDQozLiYjMzI7RFAmIzMyO0hEUCYjMzI7
aGFyZHdhcmUmIzMyO2ludGVycnVwdCYjMzI7aGFwcGVuLiYjMzI7KGRpc2FwcGVhciYjNjM7KQ0K
DQpUaGUmIzMyO2Zsb3cmIzMyO2lzJiMzMjt0aGUmIzMyO3NhbWUsJiMzMjt3aHkmIzMyO3Jlc3Vt
ZSYjMzI7aGFzJiMzMjtubyYjMzI7aGFyZHdhcmUmIzMyO2ludGVycnVwdCYjNjM7DQoNClJlZ2Fy
ZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0FkZGl0aW9uYWxseSwmIzMy
O2NhYmxlX3BsdWdnZWRfaW4mIzMyO2lzJiMzMjtmbGlwcGVkJiMzMjtpbg0KJmd0OyYjMzI7Jmd0
OyYjMzI7bXRrX2RwX2hwZF9ldmVudCYjMzI7dG8mIzMyO2Vuc3VyZSYjMzI7Y29ycmVjdCYjMzI7
aG90cGx1ZyYjMzI7ZGV0ZWN0aW9uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkdXJpbmcmIzMyO3Jlc3Vt
ZS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlc2UmIzMyO2NoYW5n
ZXMmIzMyO2ZpeCYjMzI7dGhlJiMzMjtEUCYjMzI7dHJhaW5pbmcmIzMyO2ZhaWx1cmUmIzMyO2Fm
dGVyJiMzMjtzdXNwZW5kL3Jlc3VtZS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7Rml4ZXM6JiMzMjtmNzBhYzA5N2EyY2YmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMz
MjtBZGQmIzMyO01UODE5NSYjMzI7RW1iZWRkZWQmIzMyO0Rpc3BsYXlQb3J0JiMzMjtkcml2ZXIm
cXVvdDspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SGFydSYjMzI7Wmhl
bmcmIzMyOyZsdDt0b3d3eTMyMUBnbWFpbC5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyOy0tLQ0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5
cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlh
bGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1795423355.852569181--

