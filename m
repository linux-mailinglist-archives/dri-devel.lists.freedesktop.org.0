Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A677B8C4328
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C61E10E7E3;
	Mon, 13 May 2024 14:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Acr2ZfVH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jxPssZZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8CA10E7E3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 14:21:51 +0000 (UTC)
X-UUID: 21260f0a113411efb92737409a0e9459-20240513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=nWhLO5f+yHiLMxfMwE12A2ZrmHNLZ5b37zQ34IzbBpI=; 
 b=Acr2ZfVHCgAvm9nmVgR6JkllKxGSh4oUSTBxmErCquUJMCb2LGI0FlOhxhQrTnlU1x0+VETroufxC0LJWOOe/l1aVkZ+EVEasCNbSjnlAwac4HJAUF+K559r6KmNq94JS6pVwmxTSyNOtJtGp7ZoDeJfPFtTue/nDGsvL6eRLQM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:5cef9a66-8165-495a-a893-1d394de9e4ff, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:9e6108fc-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 21260f0a113411efb92737409a0e9459-20240513
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 985412639; Mon, 13 May 2024 22:21:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 May 2024 22:21:44 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 May 2024 22:21:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1QEKG8Pk2wWvzKiCVVgZjf23RCotPqOAAmM6SGSF5/ngj/kKAvEfh/lUjlt19xxDXSTrIMDAGp73VQXG1VZkQb2/S7r7NZ5s/F60Jml7R404hOBtKAQtNBlDdBynMtN9K7QnguZCeUPvAVOqK8xZJ+bxPHkNQ8ibAw0j9LGFp+9vt9KfPCADU7QZp7Z0A3emlv+GRDhT3xwdRy0nbqC4sh9xb7u4dYIgLIJPApPoAHPMbfn4wKH5FgBkVzpetNnd10slXbSH+0z/QS4vhk4xkvLVaPy0CMDHqgtgNQ2Bhip2XRK2ZkrJQhbs/x3cUJ79fnzmEiV1R3vX2y4ufC4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMzCoqiHJ7t+J4FtIX92q/VFWzmmUO3FsLH0fUhmC5s=;
 b=AeGbrhLBNU07maLp3Kn7vXv8+9qhEypXAXLuCHctMDALgvAcwmeltIp9HEtPugWK+xvKYxT7JFTEE7dhwax6vBjROq2tas0S7xwVemiMQWD49tBUC/yhJBfTL84SmlvX66Sp8dVjNIhJ3VyJbmaeydedcYLHhnrNXjQkldZURwYqJ7qSqtFc3BiExUO41DILTmKGrkIOFjDumfiqcUJ8wVj9Y0okNkVk9Cw48jFsWJ5brU4GPUJGMtxTUchdu1xXVSRAu5atWSKZJtHh28chKettnFLcS7jOY+3QnkymGMUzSz/k3Etjh/PJ8YyMUd1OBEtSrH063hxhVA54RHfkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMzCoqiHJ7t+J4FtIX92q/VFWzmmUO3FsLH0fUhmC5s=;
 b=jxPssZZmoUJRdcqdlS52nxvchYA+LZlIXrN/Ak9fBJ5gZzDIK/nHRYQ+kMlNdv61N4L+IhSB9xe2xHuixYy9YTXr8tGqo8QtegFplo9HJhup9WqB+gnd1ziP3aXJHeMy4rQW/RsaxOPys2XURdWplip9nxyGiI3nLLyB+8gbElc=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by JH0PR03MB7751.apcprd03.prod.outlook.com (2603:1096:990:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.24; Mon, 13 May
 2024 14:21:42 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3%5]) with mapi id 15.20.7587.021; Mon, 13 May 2024
 14:21:41 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzk@kernel.org"
 <krzk@kernel.org>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
 <Chunfeng.Yun@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?=
 <Mac.Shen@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] Add write DP phyd register from parse dts
Thread-Topic: [PATCH v2 1/2] Add write DP phyd register from parse dts
Thread-Index: AQHaosoq7X5Ma7JxMUq62e1u26odj7GUussAgACBXgA=
Date: Mon, 13 May 2024 14:21:41 +0000
Message-ID: <5745c652790b9a917a39d941065f3d9c53725b1c.camel@mediatek.com>
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
 <20240510110523.12524-2-liankun.yang@mediatek.com>
 <93690c52-7da7-4fee-9b58-6087b3fb1d71@kernel.org>
In-Reply-To: <93690c52-7da7-4fee-9b58-6087b3fb1d71@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|JH0PR03MB7751:EE_
x-ms-office365-filtering-correlation-id: c457e97d-4918-4e16-6716-08dc735802ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|366007|376005|1800799015|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?ZkRBVG8veU56N2NQOE5BejJkYkhlM3F3QWxpcFA1WDdPQzM4MUE4VkVlVnpx?=
 =?utf-8?B?RlpTTUtUSHJ6VVVucCtYaGw3cTFFNzFVSGZrSHE0TWN6SHF5TjE5aGhCNVpu?=
 =?utf-8?B?NUk3cmdTWFhma2l0RXE4bWc1ZzU4b2dDdTlmYUl1SHNMcUZZd3VGYUxVNnZR?=
 =?utf-8?B?dEpoaWl1MCtiL2oxUU9lcHl2UGkzV3hVOGRuVWJOZlpoNTFEYWJnY0I1ajNQ?=
 =?utf-8?B?RVVWT2VsT3l2cVA3UGthNDU5OW5OZTFsNVhhSDZyZzdaVHN2OFNHU2RraFYw?=
 =?utf-8?B?TXE0bzdpdExwMHRiS3dwUjM2ZmNodnYxNjJHcDZxK2lxS0FCcHBLSGR3bWhU?=
 =?utf-8?B?cWtYdUpQV2xvUWFGTnM2WGIyMmZrNVVGa1ZVSjV1OStEcVc4enZ0cnRacTVl?=
 =?utf-8?B?UCs2RWhBaTh4aWw1bFcvc3Z0eHlCSTZ2RUFaMHRWMGYvcHhIYmg2SURqS3Ez?=
 =?utf-8?B?TkVGQys3UUplV0dxVGVucEppL2UxZk55clNTUmVJdURlK281TTRkTTdpZDcx?=
 =?utf-8?B?RUswdEdpZXVEUkh1L3p5dmxkdDBPZGt1MEQ1by91bnlkbDZYNFBaVFBGdUFq?=
 =?utf-8?B?czkyWGlpekx5TFcrRUVIYUtaaTkway9meG9vdGc1YkpUN25pb3craVFURjdH?=
 =?utf-8?B?akh0NmkxYXE2TUloclhsekpHZ0RBWkVnY2pNajJsMVRZZVEzYm5WdVlSWG9l?=
 =?utf-8?B?UkZpalJyS3NHUjF0OTZsSmYwdmJPdDZXWFYzQUNEZTBrbjVuZHhQVkJHcjVY?=
 =?utf-8?B?bmZHeVVOODVhQURyakRjZWhpNHRHUE5vbTZib2xCQk0xRW5XNkJLWUg2TVFh?=
 =?utf-8?B?TWpoaCtIZUMxV2cyQ05VTGVwSWxvMFdERGovaFBCU0gycVNXU1h0bzVZKzQ4?=
 =?utf-8?B?ZDY2bnFIRWpZL3Z6ZnA2R3hsMHNqa0IrZXFaYVJYWUprai9uT1JUTEIxMzZh?=
 =?utf-8?B?djY0d3FqVWgrSXN2VlQwZy9VS3dqUFU2WDE5Y1FLNDRlYXc2UnhNdVdIbnpw?=
 =?utf-8?B?UEd5dWVVeWN0c2ZGZTdtbHVlU214QXJjS3FWc2JJRkh6a0psWElSU2M0MTFU?=
 =?utf-8?B?Z3kyWlArQlZhdDU2K0F5R0VURjYrSm5rVjlISVRzL2lEaWVUdG5pK05QWnJ5?=
 =?utf-8?B?anJKaStzT2hEOE9NMGdudWVvOVc4ZGN4SjJrQVA3azlsemFydjBlM3ltdWdr?=
 =?utf-8?B?MWVRakloVEtyOHVJRzFPMGNiaTA1OWlnbWQ2bzZlM2svMUZYQW10Smh4Qy9W?=
 =?utf-8?B?V0ZoQjRsN0kyMk5QSFFvUWkvTVBZTjgzUElBWWpxMEJ4ZHJiQmhxaGNLb0NF?=
 =?utf-8?B?Zmx3Y3lMQk5nbys0RWFGbzMrRFB2VFFlajl6OHljdVlrTFVydTVjazdWUURn?=
 =?utf-8?B?aSt2U0I3VkZvTU9hU0hvbjVSVFVRZTdoQ280RUdWY0NwQS82RVgwamVYZ3hq?=
 =?utf-8?B?V2tHK3BtSVJWNGgvUWplU1hjTTJFWTZWSTZPSE1JM0JDeEZzeFIrUE5EWmNa?=
 =?utf-8?B?NXF6R3ZETkNLOHk5TFVrdWF3NnJJSGxBUnRUa2hnYkRRcEJrak05RFRBaTFT?=
 =?utf-8?B?T0xoMGtwMHYvUUlzbDN5OHpCSDBuUk1nczg0MXpselpLMWMzU1czbEZXMDN3?=
 =?utf-8?B?a3lhdkxzWVB6MHdndzdpUkxDRDh2bGJTZ09PT2RXMkRqY2wrSVJjQ05xMmVJ?=
 =?utf-8?B?SHdYVHBDdFZubkpqMng0NGFHTXExS0lKcGFWSnpBWEtkQnZFNldIc3JQc09t?=
 =?utf-8?Q?BL3MCYdabyu185xSCI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB5760.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(376005)(1800799015)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGlENTFOS2ZsZGlrMWl4Z0ZReFRpdklqSlRsUmRON1FONXZJYzdzczRwd2RJ?=
 =?utf-8?B?QlZqK2xSUG44bnh4aU9QN0tJL1N0bitXY2pnbDlYMkxrNWF0WDl6aWNXQ2ZN?=
 =?utf-8?B?NisrK2pacFAzNXo2NitwRnNIcDN6WlBSdlAxMTYrcVZZa3RZMm1pTythaGdO?=
 =?utf-8?B?d2p1SHQ0Ymt1RDZoWU5Hc2FQRWpQY2hIOWNvZGNya0x2RGJRMERURnlRU0Vo?=
 =?utf-8?B?TTBjbWVONzZOT0ZaQndRVVBPK1BKZzBYVXpJVGJ4OHhTaG5SMVQ4b0pnSFVJ?=
 =?utf-8?B?b1M3bzRXeFFGM2o1VC95ZVdUNmppVkkwclBHMmJSUnRxalE1VkNEZWxUOUNt?=
 =?utf-8?B?bFFHcWJSWnovdjdTYUkrd0tWQ2syWFpSS2JVdzlwMTZvZmpFRitjd0hySWs3?=
 =?utf-8?B?bkZYZWZiZ2Z3eVZwWFVMWjdLd3hXTXE5ZDhrRkpIbktPbnpiOUlqTnZCdFh6?=
 =?utf-8?B?cEhyNlp0c1dpVE03VDFRVUsvVG1zMUtML1hqa0ZiTU5CenlGbm5xQm9oQzc1?=
 =?utf-8?B?bkpqN1JhREwwOCtmN2ZTdWQ1NWpKMk5DeXBxcDJEMWV2MlRZYnA3eFBpdXhn?=
 =?utf-8?B?aUx6aTczeDR3SW0zZ0g0Tk9CUzRWOHVCL0tmNmJoR2hWemRmTngxZlo5NXhn?=
 =?utf-8?B?Z3ZYaG55cDk0NDNxY3NNSng5VGhZeUNYeE1RVFlNT0pCTFJxcVY1eHFUWDVo?=
 =?utf-8?B?ck1jMmx1cW4rSDVpWG55a3Z4Y09wZnNTYVBtNVhuOStpOHNROGZiblR1aXB6?=
 =?utf-8?B?OW4rQ000UEtTcG9MVGlLV2d5aUtaU1VtaklFWnZkNndIT2szcFZpVVRYbXhy?=
 =?utf-8?B?TVBTVENGa2gwTWdSbVowZGdZOFF3L1BYd0x2R3JlWDN1eFloMUc0VTNUbDcv?=
 =?utf-8?B?N1VqM2tQYVFpeFVneDhIUGxqdGppRnY1MlNJSkkrZVNweWhGVGJuenhDem4x?=
 =?utf-8?B?ckY3aFJwUXVqUDFMSkFXNmtvdUhHQyt1aThUQTJhYTVEdFcrYXFkc0Y0Nm1l?=
 =?utf-8?B?M1loTnBKYzgrM0Ztbml6eWJRbk8rY05MUGRselZtZ1BCMTROWG1HbzJLRjFH?=
 =?utf-8?B?YXpGZnYyb3J6OEFKWjdXTy9sRTEwQVhHRWdiMEFyQnFiM1FGV3hVbFJqN3lD?=
 =?utf-8?B?RGg3TXQrR2ZsdzFXWmJVcTlDS0JBanc3SEtOQVRYNDRnWW0vam5ycnZwa0hN?=
 =?utf-8?B?Uy8yY0FycW5vUEZYZVdUMXpLd3BWcFA4ckg0eFNRcTVLSGplZVJ0Sk9abFFN?=
 =?utf-8?B?NGR1OUpSZE9qdE1nNHMrTGlrTFNwWjdYMktDY01sMDRlc0JFU2hpVFhvK0xW?=
 =?utf-8?B?dW5DOGxhZWRMWWJjQzl1QUltUGJwcHIvclN2OWlDTFhaTFVWS2I0S21PRzg4?=
 =?utf-8?B?ZCtSc0ZSNGh6clBTU3ByTVlkb05pZjhCTy83OW9SZFdFR2xnT0FkYVJLdWpZ?=
 =?utf-8?B?d1UzYmxJMVE5RlpZUnh0cUpLaE8xVUZQSWdkeitpZmZ0ZXZuYmMvQkMwZ0hI?=
 =?utf-8?B?MTZpQmR3d1AxKzJkOEt1R080Z1l4UjhLU2RqdzhabVJGOFM1V2owb1QwSWV1?=
 =?utf-8?B?aDZzUk5UL2RqWlkvVmUyclZaTUwrVzZoME8xN3J5dXpPd011UGkyVm1TcnBG?=
 =?utf-8?B?cVdiQlJWUXduMFlmZVlxRWtBUzhqNXVJWVF4UDJHYlNCbUpxSmJRU0hKWXpQ?=
 =?utf-8?B?TngvcWZaTHpQQnNpend6bGtmWFpYLytOZ2JZWHcyc0VrZDlxWGJkRW12bm9D?=
 =?utf-8?B?bmFnWmhzOEREVm5xOUVGY0dNaXVZMVlRMHo4NXp6aS9sZGZJVmdVS0owYmR2?=
 =?utf-8?B?WUhjQ3U1ODA1ckJSVDl0cjBhd1pRRHphT3RVd3BxaCtWc1NyeVdzTm1lbDlC?=
 =?utf-8?B?SWlyMG9HTkttWU55cFY3UnhJQ1BQZUtFNnhNdWFldUxpQThKbjRESGFWSEZT?=
 =?utf-8?B?OFIzOC9Yc1ptQVlhUXpqQTA1VW80YTdDa2NGaFFObXBXL29zK01pbURGRVFa?=
 =?utf-8?B?R2tFYmlaTktXTGJxWUliS2tVYVd0RFR4elJhT1BJS2pYc0JhVXRqeTdobkRj?=
 =?utf-8?B?Zjd4SUpsR0IwWWhpTkdhRmxHZEU5cXFRaVl4WUVHQTVJemJVMjBlSVNkUlNW?=
 =?utf-8?B?TkVmSnowaEV1VkN3TmUrakNidWxBUWdIWFFXR0k5dDZNWXRjZTk5Tlp1TG9Q?=
 =?utf-8?B?cFE9PQ==?=
Content-ID: <E8A475F6CC4193488855C62386C260B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c457e97d-4918-4e16-6716-08dc735802ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 14:21:41.8856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Cur/YHWSTSS5EdHNoVEPnsWNyLVLrJ4hmjs9o10dI+VYMuPy5E5YhOmhyGznjR6qQ43Vptrlx3ru38EvtDPeE0Y1evbbKEktsrr08+/wDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7751
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.101900-8.000000
X-TMASE-MatchedRID: c/HXCguHooHUL3YCMmnG4vGG8F2k2BBV+WzVGPiSY8gNcckEPxfz2DEU
 xl1gE1bkfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+Cx+Mk6ACsw4JoKwF4K/wIz9TQF
 fM0Uvf4x2rjLHwV4/qCAroJaBm/+JNEWCshKSxvIyByMiwk6+3qFpKA8DI06JEd+K6O5Nt5113e
 8TptaRwWADXdyaV7dZvMX41ujcXaixMp1BoR4RCLMsPmSZxbpkCt59Uh3p/NUKogmGusPLbxFG4
 EGBR4d4hOZ64jWnvZLrhNvj0xGPQZH0YXYnbGoz0gVVXNgaM0pyZ8zcONpAscRB0bsfrpPI6T/L
 TDsmJmg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.101900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9530E33FE9A16D0E7A2CD19F370E593A4FB94B9C62C1820E30419950835465322000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_883567008.896544060"
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

--__=_Part_Boundary_006_883567008.896544060
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTA1LTEzIGF0IDA4OjM4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDEwLzA1LzIwMjQgMTM6MDQsIExpYW5rdW4gWWFuZyB3
cm90ZToNCj4gPiBEdXJpbmcgdGhlIHRlc3RpbmcgcGhhc2UsIHNjcmVlbiBmbGlja2VyaW5nIGlz
IG9ic2VydmVkIHdoZW4NCj4gPiB1c2luZyBkaXNwbGF5cG9ydCBmb3Igc2NyZWVuIGNhc3Rpbmcu
IFJlbGV2YW50IFNTQyByZWdpc3Rlcg0KPiBwYXJhbWV0ZXJzDQo+ID4gYXJlIHNldCBpbiBkdHMg
dG8gYWRkcmVzcyB0aGUgc2NyZWVuIGZsaWNrZXJpbmcgaXNzdWUgZWZmZWN0aXZlbHkNCj4gYW5k
DQo+ID4gaW1wcm92ZSBjb21wYXRpYmlsaXR5IHdpdGggZGlmZmVyZW50IGRldmljZXMgYnkgYWRq
dXN0aW5nIHRoZSBTU0MNCj4gZ2Vhci4NCj4gPiANCj4gPiBPYnRhaW5pbmcgdGhlIERQVFggbm9k
ZSwgcGFyc2luZyB0aGUgZHRzIHRvIG9idGFpbiBQSFkgcmVnaXN0ZXINCj4gYWRkcmVzcw0KPiA+
IGFuZCB2YWx1ZSBjYW4gYWRhcHQgdG8gc2V0dGluZ3Mgb2YgZGlmZmVyZW50IG1hbnVmYWN0dXJl
cnMNCj4gcHJvamVjdHMuDQo+ID4gDQo+ID4gQ2hhbmdlZHMgaW4gdjI6DQo+ID4gLSBPcHRpbWl6
ZWQgbWV0aG9kIG9mIHdyaXRpbmcgdG8gRFAgUEhZIHJlZ2lzdGVyDQo+ID4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLw0KPiA+IDIwMjQw
NDAzMDQwNTE3LjMyNzktMS1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tLw0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IExpYW5rdW4gWWFuZyA8bGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1kcC5jIHwgMzcNCj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9tZWRpYXRlay9w
aHktbXRrLWRwLmMNCj4gYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWRwLmMNCj4gPiBp
bmRleCBkNzAyNGExNDQzMzUuLmNlNzgxMTJkNTkzOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3BoeS9tZWRpYXRlay9waHktbXRrLWRwLmMNCj4gPiArKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRl
ay9waHktbXRrLWRwLmMNCj4gPiBAQCAtMjgsNiArMjgsMTAgQEANCj4gPiAgI2RlZmluZSBNVEtf
RFBfUEhZX0RJR19TV19SU1QoUEhZX09GRlNFVCArIDB4MzgpDQo+ID4gICNkZWZpbmUgRFBfR0xC
X1NXX1JTVF9QSFlEQklUKDApDQo+ID4gIA0KPiA+ICsjZGVmaW5lIE1US19EUF9QSFlfRElHX0dM
Ql9EQV9SRUdfMTQoUEhZX09GRlNFVCArIDB4RDgpDQo+ID4gKyNkZWZpbmUgWFRQX0dMQl9UWFBM
TF9TU0NfREVMVEFfUkJSX0RFRkFVTFRHRU5NQVNLKDE1LCAwKQ0KPiA+ICsjZGVmaW5lIFhUUF9H
TEJfVFhQTExfU1NDX0RFTFRBX0hCUl9ERUZBVUxUR0VOTUFTSygzMSwgMTYpDQo+ID4gKw0KPiA+
ICAjZGVmaW5lIE1US19EUF9MQU5FMF9EUklWSU5HX1BBUkFNXzMoUEhZX09GRlNFVCArIDB4MTM4
KQ0KPiA+ICAjZGVmaW5lIE1US19EUF9MQU5FMV9EUklWSU5HX1BBUkFNXzMoUEhZX09GRlNFVCAr
IDB4MjM4KQ0KPiA+ICAjZGVmaW5lIE1US19EUF9MQU5FMl9EUklWSU5HX1BBUkFNXzMoUEhZX09G
RlNFVCArIDB4MzM4KQ0KPiA+IEBAIC03OCwxMCArODIsMzkgQEANCj4gPiAgI2RlZmluZSBEUklW
SU5HX1BBUkFNXzhfREVGQVVMVChYVFBfTE5fVFhfTENUWENQMV9TVzJfUFJFMV9ERUZBVUxUDQo+
IHwgXA0KPiA+ICAgWFRQX0xOX1RYX0xDVFhDUDFfU1czX1BSRTBfREVGQVVMVCkNCj4gPiAgDQo+
ID4gKyNkZWZpbmUgU1NDX1NFVFRJTkciZHAtc3NjLXNldHRpbmciDQo+ID4gKyNkZWZpbmUgUkdf
WFRQX0dMQl9UWFBMTF9TU0NfREVMVEFfSEJSInNzYy1kZWx0YS1oYnIiDQo+ID4gKw0KPiA+ICBz
dHJ1Y3QgbXRrX2RwX3BoeSB7DQo+ID4gIHN0cnVjdCByZWdtYXAgKnJlZ3M7DQo+ID4gK3N0cnVj
dCBkZXZpY2UgKmRldjsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gK3N0YXRpYyBpbnQgbXRrX2RwX3Nl
dF9zc2NfY29uZmlnKHN0cnVjdCBwaHkgKnBoeSwgc3RydWN0DQo+IG10a19kcF9waHkgKmRwX3Bo
eSkNCj4gPiArew0KPiA+ICtpbnQgcmV0Ow0KPiA+ICt1MzIgcmVhZF92YWx1ZSA9IDAsIHJlZ19t
YXNrID0gMDsNCj4gPiArc3RydWN0IGRldmljZV9ub2RlICpzc2Nfbm9kZSA9IE5VTEw7DQo+ID4g
Kw0KPiA+ICtzc2Nfbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKGRwX3BoeS0+ZGV2LT5vZl9u
b2RlLA0KPiBTU0NfU0VUVElORyk7DQo+IA0KPiBObywgcmVhbGx5LiBOb2RlIG5hbWUgY2FuIGNo
YW5nZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQpUaGFuayB5b3Ug
Zm9yIHlvdXIgY29tbWVudC4NCkkgd2lsbCBjaGFuZ2UgdGhlIG5vZGUgbmFtZS4NCg0KQmVzdCBy
ZWdhcmRzLg0KTGlhbmt1biB5YW5nDQo=

--__=_Part_Boundary_006_883567008.896544060
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjQtMDUtMTMmIzMyO2F0
JiMzMjswODozOCYjMzI7KzAyMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMy
OzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYj
MzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUm
IzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVu
dC4NCiZndDsmIzMyOyYjMzI7T24mIzMyOzEwLzA1LzIwMjQmIzMyOzEzOjA0LCYjMzI7TGlhbmt1
biYjMzI7WWFuZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtEdXJpbmcmIzMyO3RoZSYj
MzI7dGVzdGluZyYjMzI7cGhhc2UsJiMzMjtzY3JlZW4mIzMyO2ZsaWNrZXJpbmcmIzMyO2lzJiMz
MjtvYnNlcnZlZCYjMzI7d2hlbg0KJmd0OyYjMzI7Jmd0OyYjMzI7dXNpbmcmIzMyO2Rpc3BsYXlw
b3J0JiMzMjtmb3ImIzMyO3NjcmVlbiYjMzI7Y2FzdGluZy4mIzMyO1JlbGV2YW50JiMzMjtTU0Mm
IzMyO3JlZ2lzdGVyDQomZ3Q7JiMzMjtwYXJhbWV0ZXJzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjthcmUm
IzMyO3NldCYjMzI7aW4mIzMyO2R0cyYjMzI7dG8mIzMyO2FkZHJlc3MmIzMyO3RoZSYjMzI7c2Ny
ZWVuJiMzMjtmbGlja2VyaW5nJiMzMjtpc3N1ZSYjMzI7ZWZmZWN0aXZlbHkNCiZndDsmIzMyO2Fu
ZA0KJmd0OyYjMzI7Jmd0OyYjMzI7aW1wcm92ZSYjMzI7Y29tcGF0aWJpbGl0eSYjMzI7d2l0aCYj
MzI7ZGlmZmVyZW50JiMzMjtkZXZpY2VzJiMzMjtieSYjMzI7YWRqdXN0aW5nJiMzMjt0aGUmIzMy
O1NTQw0KJmd0OyYjMzI7Z2Vhci4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7T2J0YWluaW5nJiMzMjt0aGUmIzMyO0RQVFgmIzMyO25vZGUsJiMzMjtwYXJzaW5nJiMzMjt0
aGUmIzMyO2R0cyYjMzI7dG8mIzMyO29idGFpbiYjMzI7UEhZJiMzMjtyZWdpc3Rlcg0KJmd0OyYj
MzI7YWRkcmVzcw0KJmd0OyYjMzI7Jmd0OyYjMzI7YW5kJiMzMjt2YWx1ZSYjMzI7Y2FuJiMzMjth
ZGFwdCYjMzI7dG8mIzMyO3NldHRpbmdzJiMzMjtvZiYjMzI7ZGlmZmVyZW50JiMzMjttYW51ZmFj
dHVyZXJzDQomZ3Q7JiMzMjtwcm9qZWN0cy4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7Q2hhbmdlZHMmIzMyO2luJiMzMjt2MjoNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMy
O09wdGltaXplZCYjMzI7bWV0aG9kJiMzMjtvZiYjMzI7d3JpdGluZyYjMzI7dG8mIzMyO0RQJiMz
MjtQSFkmIzMyO3JlZ2lzdGVyDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsyMDI0MDQwMzA0MDUxNy4zMjc5LTEtbGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbS8NCiZndDsm
IzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0xpYW5r
dW4mIzMyO1lhbmcmIzMyOyZsdDtsaWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYj
MzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvcGh5L21lZGlh
dGVrL3BoeS1tdGstZHAuYyYjMzI7fCYjMzI7MzcNCiZndDsmIzMyOysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hh
bmdlZCwmIzMyOzM3JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvcGh5L21lZGlhdGVrL3Bo
eS1tdGstZHAuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWRwLmMN
CiZndDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjtkNzAyNGExNDQzMzUuLmNlNzgxMTJkNTkzOCYj
MzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9waHkvbWVkaWF0
ZWsvcGh5LW10ay1kcC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9waHkv
bWVkaWF0ZWsvcGh5LW10ay1kcC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTI4LDYmIzMy
OysyOCwxMCYjMzI7QEANCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TVRLX0RQ
X1BIWV9ESUdfU1dfUlNUKFBIWV9PRkZTRVQmIzMyOysmIzMyOzB4MzgpDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RQX0dMQl9TV19SU1RfUEhZREJJVCgwKQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOysjZGVmaW5lJiMzMjtNVEtfRFBfUEhZ
X0RJR19HTEJfREFfUkVHXzE0KFBIWV9PRkZTRVQmIzMyOysmIzMyOzB4RDgpDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrI2RlZmluZSYjMzI7WFRQX0dMQl9UWFBMTF9TU0NfREVMVEFfUkJSX0RFRkFVTFRH
RU5NQVNLKDE1LCYjMzI7MCkNCiZndDsmIzMyOyZndDsmIzMyOysjZGVmaW5lJiMzMjtYVFBfR0xC
X1RYUExMX1NTQ19ERUxUQV9IQlJfREVGQVVMVEdFTk1BU0soMzEsJiMzMjsxNikNCiZndDsmIzMy
OyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TVRLX0RQX0xB
TkUwX0RSSVZJTkdfUEFSQU1fMyhQSFlfT0ZGU0VUJiMzMjsrJiMzMjsweDEzOCkNCiZndDsmIzMy
OyZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TVRLX0RQX0xBTkUxX0RSSVZJTkdfUEFSQU1fMyhQ
SFlfT0ZGU0VUJiMzMjsrJiMzMjsweDIzOCkNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2RlZmlu
ZSYjMzI7TVRLX0RQX0xBTkUyX0RSSVZJTkdfUEFSQU1fMyhQSFlfT0ZGU0VUJiMzMjsrJiMzMjsw
eDMzOCkNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNzgsMTAmIzMyOys4MiwzOSYjMzI7QEAN
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7RFJJVklOR19QQVJBTV84X0RFRkFV
TFQoWFRQX0xOX1RYX0xDVFhDUDFfU1cyX1BSRTFfREVGQVVMVA0KJmd0OyYjMzI7fCYjMzI7JiM5
MjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtYVFBfTE5fVFhfTENUWENQMV9TVzNfUFJF
MF9ERUZBVUxUKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOysj
ZGVmaW5lJiMzMjtTU0NfU0VUVElORyZxdW90O2RwLXNzYy1zZXR0aW5nJnF1b3Q7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrI2RlZmluZSYjMzI7UkdfWFRQX0dMQl9UWFBMTF9TU0NfREVMVEFfSEJSJnF1
b3Q7c3NjLWRlbHRhLWhiciZxdW90Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19kcF9waHkmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMy
OyYjMzI7c3RydWN0JiMzMjtyZWdtYXAmIzMyOypyZWdzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3N0
cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt9Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOytzdGF0aWMmIzMyO2ludCYj
MzI7bXRrX2RwX3NldF9zc2NfY29uZmlnKHN0cnVjdCYjMzI7cGh5JiMzMjsqcGh5LCYjMzI7c3Ry
dWN0DQomZ3Q7JiMzMjttdGtfZHBfcGh5JiMzMjsqZHBfcGh5KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
K3sNCiZndDsmIzMyOyZndDsmIzMyOytpbnQmIzMyO3JldDsNCiZndDsmIzMyOyZndDsmIzMyOyt1
MzImIzMyO3JlYWRfdmFsdWUmIzMyOz0mIzMyOzAsJiMzMjtyZWdfbWFzayYjMzI7PSYjMzI7MDsN
CiZndDsmIzMyOyZndDsmIzMyOytzdHJ1Y3QmIzMyO2RldmljZV9ub2RlJiMzMjsqc3NjX25vZGUm
IzMyOz0mIzMyO05VTEw7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
c3NjX25vZGUmIzMyOz0mIzMyO29mX2ZpbmRfbm9kZV9ieV9uYW1lKGRwX3BoeS0mZ3Q7ZGV2LSZn
dDtvZl9ub2RlLA0KJmd0OyYjMzI7U1NDX1NFVFRJTkcpOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtO
bywmIzMyO3JlYWxseS4mIzMyO05vZGUmIzMyO25hbWUmIzMyO2NhbiYjMzI7Y2hhbmdlLg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQom
Z3Q7JiMzMjsNCg0KVGhhbmsmIzMyO3lvdSYjMzI7Zm9yJiMzMjt5b3VyJiMzMjtjb21tZW50Lg0K
SSYjMzI7d2lsbCYjMzI7Y2hhbmdlJiMzMjt0aGUmIzMyO25vZGUmIzMyO25hbWUuDQoNCkJlc3Qm
IzMyO3JlZ2FyZHMuDQpMaWFua3VuJiMzMjt5YW5nDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0
YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBv
ciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdz
LiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQg
cmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJp
bnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRz
IA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRl
ZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_883567008.896544060--

