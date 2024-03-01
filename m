Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396DD86DC64
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 08:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F1210EBDE;
	Fri,  1 Mar 2024 07:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="e7JSo6BG";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="U49UX0eZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B0B10EBD7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 07:51:22 +0000 (UTC)
X-UUID: 7b30b2c0d7a011eeb8927bc1f75efef4-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=2O5CnQ64n9pIi0Va7vUTxnaB4zgGvyarGGNysu9VYuw=; 
 b=e7JSo6BGTkT2YsKjunSmWSbnLXGdkmvfIVp8r5gEda2M2q97acnrEuFjIWCL7WdZ+ctnibDUayBTYn5Q9E0kyBKg2a1SEm2IaMCnLKbsxWintk/d/w/Ok2nimhAgsrFdr7dAhx51to0f0+27SxCdfknXswtmY04RFxmiG3pXLE8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:ae9bd675-66a8-495a-abec-2a0d4f29e09e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:08087e84-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7b30b2c0d7a011eeb8927bc1f75efef4-20240301
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 937733496; Fri, 01 Mar 2024 15:51:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 15:51:14 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 15:51:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZz4rtFwLJ9h/MZy0Z+NPgfOaR+ZeZYk6WKGZUCqg2jRA70s4xsVK9r7S88DvXef4WC6UvXdE2yZz+eYrRMW4fn4VAEhtN+kzC0mWDD2Cl9/wrQ8sxzBj4OhoG950QoLLLDWJ7lnIkZjLZYzn4oDpCz6TzqQSan0EfOQz3KykH0/D3VKFbmIC7J0hCJHlLXoUBI4IlPniRl4F5o7Vg1g3f7t/4aBORKHpc77YaMa+MTZ+56+0r9Wnhc2iK1QP3zbFYt/HZ5AQ+4oUy3gqbQcZiN6wMxVmUFlNxI3FWPnrOP9VrF+6+AUh5n0LvlwWWffLvHmDes3XFmDNXd/hxkmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R/UxT8j8Q64OC4MD+YH7Mv/e/vMIuKgz3LdhhXrOdM=;
 b=VY4cfuRNoq68tHQ4TjxBA84ATG5N3Hon8UCTPn08t3EorqwaaayzYmnb8tvQB/a7DDRi0taU8gcjVQSSEHpcmjGcSgetUf5R3kw2imwwFgBEtSQiLbU/qZ80TDBoH1cjqyI3Rl7zCmDC/wz89SrWnNCb+u0doM40PxIWOazory/x9eiArsvGQJ3L0d7hg02ZDCCVnzGhyx/sO9katgu4xewb8DNzUcNu0LwsmVhpJM5zlJ4NftEGe6SNiyW/WAg+0z6rgmiXcxXO1G6wVNxJJYhl775ewjC8gwL1ankjSOhdJAKVxezYp9ZrHyyG3MspiEjMMxyaTCUsXZmctRmsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R/UxT8j8Q64OC4MD+YH7Mv/e/vMIuKgz3LdhhXrOdM=;
 b=U49UX0eZwCE8trwDit7kB5ATQMu6jRsQDGkvd7GQN7/xyf/VJI+VfOI+LBBjuwAzGac64K0yoD8cXVCBUH99asmeaoI8imNOkIGCornlC4b8jLR52pnvPy5doBAumDzhMOQw/MQStACGiDGSK5+l+euMYN05SjiMA3iWxWcUaFQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI6PR03MB9236.apcprd03.prod.outlook.com (2603:1096:4:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Fri, 1 Mar
 2024 07:51:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b705:ea58:46d:e98d]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b705:ea58:46d:e98d%4]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 07:51:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Thread-Topic: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Thread-Index: AQHaX/dYZgeAgBFvZESouybYjCpgWbEimoWA
Date: Fri, 1 Mar 2024 07:51:11 +0000
Message-ID: <dc7569baf040a0cf2ba9d176ea69e250dddfabdd.camel@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-7-shawn.sung@mediatek.com>
In-Reply-To: <20240215101119.12629-7-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI6PR03MB9236:EE_
x-ms-office365-filtering-correlation-id: 9a9cf524-5500-4bc9-9ac1-08dc39c45d24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4CbF0Df4cx5OSJmPF5Zz3HU76S+0jxnGPNfoR123nMLW4Oml6a+vUQOpM7wOpA6J0FtaSZ1/jkfCLvlzVH0mO9Lgb8jaFSgcAWeVeusXzli7F/B7MXo9CIJCX9MBm0sXP5yFd476mKlmkea0y5MiX0SSDsGQO/tBln2ttk7WelSusOoHpGnHgi8trnhr3XnD/4Spcuoreoi78nG4vJ9GMsNBOuZoccPcXdlA10EIPtR98TDWCwfZGbLwGaulg8DIIlo9B/mxqYd0PPGfzxNzv8xI3MmuoZLgDQ1r7RsZbKh4WLNn3vP7sSGNQHweTFgCrrp/nzC0o45kdrAjGqW+5hnBPDQnzUUsM1x4qAJbMr69XLeNkrhNkaHUioPCjmBVFtMQNCw+6i/0kKAc131X2csG+elnX4eVXUHZrfFKm6uzVGr9JI8Z97xSa6wIEUkn85ZuJwf/XcTmjJn9IE2KkowlfwuOslXYwTryTox8vGrSdxrF+vquSzQLjt5UUrAY3ZZh2kV/+5P92buzszw+Eececk0mQBEPDK7owbXmmr4LgW7gxSYNBDB/Kke1UnhqPEiYslRnha1dkQyCp5vJ9zdid6qYnts6GweOITaVUJmMMIfSDf5QLi06le9X1mN0EdCcM2+F/Z2972qsoggy1rj+ae3JRdiDPGvsbtrsTOb3qSz9hYNAHZvdzR8eOoYOc/XyQsxguK00jxJxqsuFow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDVGb3B6bElOWDJrdUJDTXZaKzJhM24wcW1iNkNKQkNmdXh5bXhob0V5MlJR?=
 =?utf-8?B?NXV0c3doZjJxR1EySVdBRXJtU0FPSDlOL2UvZTZQUzk4ME1qck9jejFrbzJl?=
 =?utf-8?B?cW1TSXdQeG5VU0tNQkUxZy95aUpGY0YwMkJwc2ZWQThtYXlnbFJMZGFaMnNT?=
 =?utf-8?B?RzMvZDF2SGZ0RzFoTU1pbmRLZ3Vwc2REMnlpdmRjSEtLejlOYm9BVklJTlFx?=
 =?utf-8?B?bUxlV2lhby9DenVTdFJlVTZvZHkwUWllTjFTeXRiYng1L05IbUZWMDVteDRn?=
 =?utf-8?B?R1d2eUY5cUE4SzZTU0ZMa2JmdFNkMUZINGxaQzhhcFBQK1U4bGdYcDRPcGgx?=
 =?utf-8?B?T0t1OGgreVRpRUVuM084QXNsSEt2UFlaalNFUlRBRXpENy9ENE5NNlQxbHRS?=
 =?utf-8?B?cS9BdWlON3cxZGQrelVHb1BOT1hBTUN4UlZHSmlubTNMSDl3QlVqUmJtVTha?=
 =?utf-8?B?ZXJtL0ZFdjROK0QwZGRIV1VJMXVLVHpBZUFkazNTSUc0TWQ4WHdkM3cyOE5F?=
 =?utf-8?B?Sy9wcUNUUHZaVVpLaG5oV0poUEVOTHRRZDV5MGRBdWxubndMbVFqeEZCUDlX?=
 =?utf-8?B?aXRCTVAvV3I3akp6amxhbUVIR0ZSUjNBZFhWRENDM2xQMUJIVGtBY3V4eTNs?=
 =?utf-8?B?Vlc0QzVLQmNUM0gyWTVMdlJWczk5L3VUN3AzR0NES3V1bHVJTi83dVhZdnRh?=
 =?utf-8?B?LzVUZWdNSG5xbVVDakdRZFowNWlPdm4yUE8vamFDRHI1ZjBEaU54K294Wkhj?=
 =?utf-8?B?bHpaQXI1Tkk0Z2F0TjRvcXRWQXIwTldDQ2pJZHBRa1BnWmNBcEFBL1NCWGdy?=
 =?utf-8?B?MkxwajkvUUp0akZVUjYyYzIvTDVPbVpIZUVibmFNQjQ1UmQ0RE9wWFJpVity?=
 =?utf-8?B?bzNXd2dmcjZnR1pCNHFndllycnpoNTUzcHhUajNCTzlZQnlJMnZVUmdseGxr?=
 =?utf-8?B?SU9zdWFvb2NzQWkyV2RTRGRTQlNoYUtEU2p1NDhkTkxEcXZ4N1hINEswVS9Y?=
 =?utf-8?B?MWRQRHBVeXhNTzZzUU1RcURCR1lZNXQrOFViQzlLL1lVRE1UZGtwWDBRRlpJ?=
 =?utf-8?B?Ky9jblYxWlBNRUJjaTlwejBVRDI1RktLQVAwQWNmODU5cmwxcXpVUmlscEFX?=
 =?utf-8?B?N1dyZE1GdkwrcDRNMFlzcnJUcm1pSnJqTzFlSkx6dlpiVFV2alhoSW5lVmdv?=
 =?utf-8?B?UXBxbjVjME5ickNYOWxrZ1VzWFNtWUs0L0hTVWY2MUNHc2NqYVM5WHVOR0Zo?=
 =?utf-8?B?S2M2NE81S25DSWxkQWRWRzdNMzNFMk9GRjl5TjJzc0lWTzU3S2tlOElzMEYw?=
 =?utf-8?B?RWduaGNEWkh6OExxMVNSUWVtUG14azVhN0J0b2I4TlFHMXE4aDFSRVZSdk9v?=
 =?utf-8?B?RE9WMHY3bmF6ZElvWmdtWDlpbUs0L01YSzFhdloyWnp4Yzkxb2tIZ2NNVWlw?=
 =?utf-8?B?SWhsSURPSDFqaWd2b0hkSE5lcWdpRE5yU2p2cWdmN200SWsySmN2VlpiTFBM?=
 =?utf-8?B?WTdMRnZlVXk5elZweENsVStkWjUvaSthUGN6Sk5ueEIzVWFTakR3Kys0d096?=
 =?utf-8?B?YmR5THdjTlFZZTRXaC9vZXB4MFdTYk5OUmc0bVJSMWRaQ3pqWDJ5VDZRTUZa?=
 =?utf-8?B?VUFjL0hQQ1EyQ0Vzc3NWYlgwNGRqbVVhb29neWFLZ0c2cmY3Q2NHUjA0L0c0?=
 =?utf-8?B?MDlaM1VvdGJUb3lCYUpKQ2M5V29WYXNoZ2FkUHJpQkYwS3BtdzBUTXlBQjBl?=
 =?utf-8?B?KzZ6Q2JwdnhNQWpocTk0T2tqUmtuMjdLY0svMlB3N1RYVG8vMWp4UXVGbkpm?=
 =?utf-8?B?dnJyZ0creDJpY0d1ZUkrb1JTT0hsYXJERlM4MngwcG5vL2VHWGJMVkViMmRw?=
 =?utf-8?B?VkFlUDZWTTZQUXM5N3U5MWRhWFM4T0kwb2phdU5OZFd1TFRycXNGVWl6aEV1?=
 =?utf-8?B?bFo1dVMzcXBUN0ZueStucUJlZnRTd05tKy9KVFIxbHVSYkx6WUgwd0NhNytN?=
 =?utf-8?B?YWdQMThkL1RVcDBncThMM2pNdTNlMENwYTJ2dmhLWVBCc3BHc3hTMWsyVVZj?=
 =?utf-8?B?c2tWYml4ZURqcjlSb1MzWW0yR1haeENlRmlhajR3Zk80bURBRWloTmpIQ2JR?=
 =?utf-8?Q?wrbK6qwyMpV+O9+rMeAxH8maH?=
Content-ID: <B0162D233976694E83EB794F1F3392D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9cf524-5500-4bc9-9ac1-08dc39c45d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 07:51:11.8585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1ws57hJmEvTsr36qaGbR5IxtusovyF6XRi+raGiYBYMQdALydyQYoy8Ordzmw/d67FOmAwYjO79QZ+W4F4ZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB9236
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.690800-8.000000
X-TMASE-MatchedRID: scwq2vQP8OE/XHdICuW5rya1MaKuob8PofZV/2Xa0cKOUV82NDH4AlU1
 mKBqgGzKxLXSu8yTUJprDRXfw8gpTTajbKvQDWp/Y1bQMCMvmn64vBuE2X0HleQIoW+okd7JASS
 25Kb4JAKMZBHIGOaSwOKOmN63egZIbn83JMqUbr2HZXNSWjgdU5KLNrbpy/A0FLXUWU5hGiFHdE
 c8dOyw1fWjlKSodAPqPdHjjly2GDoM8jMXjBF+sNIFVVzYGjNKWQy9YC5qGvz6APa9i04WGCq2r
 l3dzGQ1ssOcArzi9zmr7rxEWL5Lz96zW3K1Ch3efXvBVamN/zgaB75N/QjOchb+U31CofkCL06m
 Urak0UaSPRYAfWdVjFFKsN+E2SHGVRHgklYfjug9XGVRM/cag7sCWxFv9DtZChiU+c//xP8WW1i
 V/cL+I0MMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.690800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2775F6B6D88A3E1E849EBA7B9AE12FA4D9AC59D19B2B9BB3E8862533EFA3DC422000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_265338661.1026509750"
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

--__=_Part_Boundary_003_265338661.1026509750
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBUaHUsIDIwMjQtMDItMTUgYXQgMTg6MTEgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IFdlIGZvdW5kIHRoYXQgSUdUIChJbnRlbCBHUFUgVG9v
bCkgd2lsbCB0cnkgdG8gY29tbWl0IGxheWVycyB3aXRoDQo+IHplcm8gd2lkdGggb3IgaGVpZ2h0
IGFuZCBsZWFkIHRvIHVuZGVmaW5lZCBiZWhhdmlvcnMgaW4gaGFyZHdhcmUuDQo+IERpc2FibGUg
dGhlIGxheWVycyBpbiBzdWNoIGEgc2l0dWF0aW9uLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNr
Lmh1QG1lZGlhdGVrLmNvbT4NCg0KSSBoYXZlIHJldmlld2VkIG92bCBkcml2ZXIsIG92bCBkb2Vz
IG5vdCBoYXZlIHRoaXMgbGltaXRhdGlvbiwgc28gaXQncw0KYmV0dGVyIHRvIHBvaW50IG91dCB3
aGljaCBoYXJkd2FyZSBoYXMgdGhpcyBsaW1pdGF0aW9uLiBUaGF0J3MgT0sgaWYNCnlvdSBoYXZl
IG5vIGluZm9ybWF0aW9uLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gRml4ZXM6IDc3N2I3YmM4
NmEwYTMgKCJkcm0vbWVkaWF0ZWs6IEFkZCBvdmxfYWRhcHRvciBzdXBwb3J0IGZvcg0KPiBNVDgx
OTUiKQ0KPiBGaXhlczogZmE5N2ZlNzFmNmY5MyAoImRybS9tZWRpYXRlazogQWRkIEVUSERSIHN1
cHBvcnQgZm9yIE1UODE5NSIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5n
IDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZXRoZHIuYyAgICAgICAgICAgIHwgNyArKysrKystDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQo+IGluZGV4IGQ0
YTEzYTE0MDIxNDguLjY4YTIwMzEyYWM2ZjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQo+IEBAIC0xNTcsNyArMTU3LDcgQEAg
dm9pZCBtdGtfb3ZsX2FkYXB0b3JfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UNCj4gKmRldiwg
dW5zaWduZWQgaW50IGlkeCwNCj4gIAltZXJnZSA9IG92bF9hZGFwdG9yLT5vdmxfYWRhcHRvcl9j
b21wW09WTF9BREFQVE9SX01FUkdFMCArDQo+IGlkeF07DQo+ICAJZXRoZHIgPSBvdmxfYWRhcHRv
ci0+b3ZsX2FkYXB0b3JfY29tcFtPVkxfQURBUFRPUl9FVEhEUjBdOw0KPiAgDQo+IC0JaWYgKCFw
ZW5kaW5nLT5lbmFibGUpIHsNCj4gKwlpZiAoIXBlbmRpbmctPmVuYWJsZSB8fCAhcGVuZGluZy0+
d2lkdGggfHwgIXBlbmRpbmctPmhlaWdodCkgew0KPiAgCQltdGtfbWVyZ2Vfc3RvcF9jbWRxKG1l
cmdlLCBjbWRxX3BrdCk7DQo+ICAJCW10a19tZHBfcmRtYV9zdG9wKHJkbWFfbCwgY21kcV9wa3Qp
Ow0KPiAgCQltdGtfbWRwX3JkbWFfc3RvcChyZG1hX3IsIGNtZHFfcGt0KTsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBpbmRleCA3M2RjNGRhM2JhM2JkLi42OTg3MmI3
NzkyMmViIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRy
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IEBAIC0x
NjAsNyArMTYwLDEyIEBAIHZvaWQgbXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+IHVuc2lnbmVkIGludCBpZHgsDQo+ICAJaWYgKGlkeCA+PSA0KQ0KPiAgCQlyZXR1
cm47DQo+ICANCj4gLQlpZiAoIXBlbmRpbmctPmVuYWJsZSkgew0KPiArCWlmICghcGVuZGluZy0+
ZW5hYmxlIHx8ICFwZW5kaW5nLT53aWR0aCB8fCAhcGVuZGluZy0+aGVpZ2h0KSB7DQo+ICsJCS8q
DQo+ICsJCSAqIGluc3RlYWQgb2YgZGlzYWJsaW5nIGxheWVyIHdpdGggTUlYX1NSQ19DT04gZGly
ZWN0bHkNCj4gKwkJICogc2V0IHRoZSBzaXplIHRvIDAgdG8gYXZvaWQgc2NyZWVuIHNoaWZ0IGR1
ZSB0byBtaXhlcg0KPiArCQkgKiBtb2RlIHN3aXRjaCAoaGFyZHdhcmUgYmVoYXZpb3IpDQo+ICsJ
CSAqLw0KPiAgCQltdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCAwLCAmbWl4ZXItPmNtZHFfYmFzZSwg
bWl4ZXItDQo+ID5yZWdzLCBNSVhfTF9TUkNfU0laRShpZHgpKTsNCj4gIAkJcmV0dXJuOw0KPiAg
CX0NCg==

--__=_Part_Boundary_003_265338661.1026509750
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtIc2lhby1jaGllbjoNCg0KT24mIzMyO1Ro
dSwmIzMyOzIwMjQtMDItMTUmIzMyO2F0JiMzMjsxODoxMSYjMzI7KzA4MDAsJiMzMjtIc2lhbyYj
MzI7Q2hpZW4mIzMyO1N1bmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7V2UmIzMyO2ZvdW5kJiMzMjt0
aGF0JiMzMjtJR1QmIzMyOyhJbnRlbCYjMzI7R1BVJiMzMjtUb29sKSYjMzI7d2lsbCYjMzI7dHJ5
JiMzMjt0byYjMzI7Y29tbWl0JiMzMjtsYXllcnMmIzMyO3dpdGgNCiZndDsmIzMyO3plcm8mIzMy
O3dpZHRoJiMzMjtvciYjMzI7aGVpZ2h0JiMzMjthbmQmIzMyO2xlYWQmIzMyO3RvJiMzMjt1bmRl
ZmluZWQmIzMyO2JlaGF2aW9ycyYjMzI7aW4mIzMyO2hhcmR3YXJlLg0KJmd0OyYjMzI7RGlzYWJs
ZSYjMzI7dGhlJiMzMjtsYXllcnMmIzMyO2luJiMzMjtzdWNoJiMzMjthJiMzMjtzaXR1YXRpb24u
DQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29t
Jmd0Ow0KDQpJJiMzMjtoYXZlJiMzMjtyZXZpZXdlZCYjMzI7b3ZsJiMzMjtkcml2ZXIsJiMzMjtv
dmwmIzMyO2RvZXMmIzMyO25vdCYjMzI7aGF2ZSYjMzI7dGhpcyYjMzI7bGltaXRhdGlvbiwmIzMy
O3NvJiMzMjtpdCYjMzk7cw0KYmV0dGVyJiMzMjt0byYjMzI7cG9pbnQmIzMyO291dCYjMzI7d2hp
Y2gmIzMyO2hhcmR3YXJlJiMzMjtoYXMmIzMyO3RoaXMmIzMyO2xpbWl0YXRpb24uJiMzMjtUaGF0
JiMzOTtzJiMzMjtPSyYjMzI7aWYNCnlvdSYjMzI7aGF2ZSYjMzI7bm8mIzMyO2luZm9ybWF0aW9u
Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyOzc3N2I3
YmM4NmEwYTMmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtBZGQmIzMyO292bF9hZGFwdG9y
JiMzMjtzdXBwb3J0JiMzMjtmb3INCiZndDsmIzMyO01UODE5NSZxdW90OykNCiZndDsmIzMyO0Zp
eGVzOiYjMzI7ZmE5N2ZlNzFmNmY5MyYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYj
MzI7RVRIRFImIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7TVQ4MTk1JnF1b3Q7KQ0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMz
MjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMy
OyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMmIzMy
O3wmIzMyOzImIzMyOystDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZXRoZHIuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO3wmIzMyOzcmIzMyOysrKysrKy0NCiZndDsmIzMyOyYjMzI7MiYjMzI7Zmls
ZXMmIzMyO2NoYW5nZWQsJiMzMjs3JiMzMjtpbnNlcnRpb25zKCspLCYjMzI7MiYjMzI7ZGVsZXRp
b25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtpbmRl
eCYjMzI7ZDRhMTNhMTQwMjE0OC4uNjhhMjAzMTJhYzZmMSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjst
LS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMN
CiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
X2FkYXB0b3IuYw0KJmd0OyYjMzI7QEAmIzMyOy0xNTcsNyYjMzI7KzE1Nyw3JiMzMjtAQCYjMzI7
dm9pZCYjMzI7bXRrX292bF9hZGFwdG9yX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZQ0K
Jmd0OyYjMzI7KmRldiwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYj
MzI7bWVyZ2UmIzMyOz0mIzMyO292bF9hZGFwdG9yLSZndDtvdmxfYWRhcHRvcl9jb21wW09WTF9B
REFQVE9SX01FUkdFMCYjMzI7Kw0KJmd0OyYjMzI7aWR4XTsNCiZndDsmIzMyOyYjMzI7ZXRoZHIm
IzMyOz0mIzMyO292bF9hZGFwdG9yLSZndDtvdmxfYWRhcHRvcl9jb21wW09WTF9BREFQVE9SX0VU
SERSMF07DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LWlmJiMzMjsoIXBlbmRpbmctJmd0O2Vu
YWJsZSkmIzMyO3sNCiZndDsmIzMyOytpZiYjMzI7KCFwZW5kaW5nLSZndDtlbmFibGUmIzMyO3x8
JiMzMjshcGVuZGluZy0mZ3Q7d2lkdGgmIzMyO3x8JiMzMjshcGVuZGluZy0mZ3Q7aGVpZ2h0KSYj
MzI7ew0KJmd0OyYjMzI7JiMzMjttdGtfbWVyZ2Vfc3RvcF9jbWRxKG1lcmdlLCYjMzI7Y21kcV9w
a3QpOw0KJmd0OyYjMzI7JiMzMjttdGtfbWRwX3JkbWFfc3RvcChyZG1hX2wsJiMzMjtjbWRxX3Br
dCk7DQomZ3Q7JiMzMjsmIzMyO210a19tZHBfcmRtYV9zdG9wKHJkbWFfciwmIzMyO2NtZHFfcGt0
KTsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZXRoZHIuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0
aGRyLmMNCiZndDsmIzMyO2luZGV4JiMzMjs3M2RjNGRhM2JhM2JkLi42OTg3MmI3NzkyMmViJiMz
MjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2V0aGRyLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2V0aGRyLmMNCiZndDsmIzMyO0BAJiMzMjstMTYwLDcmIzMyOysxNjAsMTImIzMyO0BAJiMzMjt2
b2lkJiMzMjttdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2
LA0KJmd0OyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjtpZiYj
MzI7KGlkeCYjMzI7Jmd0Oz0mIzMyOzQpDQomZ3Q7JiMzMjsmIzMyO3JldHVybjsNCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjstaWYmIzMyOyghcGVuZGluZy0mZ3Q7ZW5hYmxlKSYjMzI7ew0KJmd0
OyYjMzI7K2lmJiMzMjsoIXBlbmRpbmctJmd0O2VuYWJsZSYjMzI7fHwmIzMyOyFwZW5kaW5nLSZn
dDt3aWR0aCYjMzI7fHwmIzMyOyFwZW5kaW5nLSZndDtoZWlnaHQpJiMzMjt7DQomZ3Q7JiMzMjsr
LyoNCiZndDsmIzMyOysmIzMyOyomIzMyO2luc3RlYWQmIzMyO29mJiMzMjtkaXNhYmxpbmcmIzMy
O2xheWVyJiMzMjt3aXRoJiMzMjtNSVhfU1JDX0NPTiYjMzI7ZGlyZWN0bHkNCiZndDsmIzMyOysm
IzMyOyomIzMyO3NldCYjMzI7dGhlJiMzMjtzaXplJiMzMjt0byYjMzI7MCYjMzI7dG8mIzMyO2F2
b2lkJiMzMjtzY3JlZW4mIzMyO3NoaWZ0JiMzMjtkdWUmIzMyO3RvJiMzMjttaXhlcg0KJmd0OyYj
MzI7KyYjMzI7KiYjMzI7bW9kZSYjMzI7c3dpdGNoJiMzMjsoaGFyZHdhcmUmIzMyO2JlaGF2aW9y
KQ0KJmd0OyYjMzI7KyYjMzI7Ki8NCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93cml0ZShjbWRxX3Br
dCwmIzMyOzAsJiMzMjsmYW1wO21peGVyLSZndDtjbWRxX2Jhc2UsJiMzMjttaXhlci0NCiZndDsm
IzMyOyZndDtyZWdzLCYjMzI7TUlYX0xfU1JDX1NJWkUoaWR4KSk7DQomZ3Q7JiMzMjsmIzMyO3Jl
dHVybjsNCiZndDsmIzMyOyYjMzI7fQ0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10
eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRp
YWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5
IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMg
b2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5
c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8g
YW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_265338661.1026509750--

