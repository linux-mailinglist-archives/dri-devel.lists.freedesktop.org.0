Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123679D480B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 08:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44D10E08A;
	Thu, 21 Nov 2024 07:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JNqbTHV3";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Uwq+oHTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60F10E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 07:11:03 +0000 (UTC)
X-UUID: c300441ea7d711ef99858b75a2457dd9-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Au+PtBq1BXhl/x/p/sLISXq3I4RzgRVJuNLcaG4CHbA=; 
 b=JNqbTHV3OPVBWqoUnJENsKORAJNozcXFkr5+5m7OVnESQ3Xzpfm7Qcl4DFYDrTFRZTDbylYXQntEqfi0SJMr8PA95jyuB58H5VD4Ja2fZUkEXeMAlxBtJd63LH+9plXvpPWS43J4Di+nOu+ffkAFNK8ylMQel4PjaITnmTIM52I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:03c35b17-4e84-42ae-80c3-29c17096001f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:ee7229b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c300441ea7d711ef99858b75a2457dd9-20241121
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2067178432; Thu, 21 Nov 2024 15:11:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 15:10:59 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 15:10:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T27S4Vfl5w3UV0e2ZfSW84Q1Dv3nUk203wO46nmNvxoApQOCvzZyE/waKShS/T2HOpmrFpoLF/lkbn1kH76VlTYUo0OxQYVaXwhizcMCW6EhpybpwfTB0BLirIsSk1VtjlwdW99z63jPQRYwE0aBUB0WokwPrzLNVyyVmpqgyg2fSM1nznp0pl6ePfSsT9Xo5v4+0Kb1U35Q/jVz7sRQBEa+CyUyOb21/Qbc8Wvc+ZLICG/76JZ33G7p5C9L5u7KRyl1u+nce8eXIKx9WAq1uLT5Lh4fBAvY/27fS1lClSptnr6D1IldXHxrnJJbyS74/76aG6FifXi81gJ0GOaQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA5sbNnAljm3CHNg0NYXLestTqpEB2kDKmgVM0zqiJ4=;
 b=JG97I1+7wep880nDxXO4/NkITRu2cio3OcyygsyIHVqxKN0tIrFl1Y0+EsIM5JLdAtIEiLQJrnrzjoTQkNgnDRvChlDgO6/cIkLoxCuGKXpP+Qjr84/VpkbbXE0JmVVD0bnI0V3teLQcYSxwoD5G5XPxrjquxne71nixVW/uCy7EPcWnKlJL+qYs7eJA/agKTmECjCnebcpqMQ9w8EflGIdwGpU76reHNJ/xYSnN62ZXhU3VMdi9To0VG7tPLuOYXkhhhr7sqnuk6BJlfnm0rMXpMAjfI8nsXdmzOLowww6LB8JI++ZTFzyspwtXQv3qEtGvKt+6uFkDNLCJKMdsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA5sbNnAljm3CHNg0NYXLestTqpEB2kDKmgVM0zqiJ4=;
 b=Uwq+oHTU6qEkOWbA3vrWZQ1WcPKUkXVgM6xA8IBcEPV8SuSX+O8+FFcnayAgY1x96bz7XTciU+FzD6xY6aA0I3XhCzaaYHEzMqH6xTOnbYrQ6qpExstsRAc/P5qqRS5K5sbFI+IlnOutnjgVCzJwWjPPJ8xtsjKPkJ2SySN8INg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8709.apcprd03.prod.outlook.com (2603:1096:101:231::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Thu, 21 Nov
 2024 07:10:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 07:10:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Topic: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Index: AQHbO83f8Xgq0HinZk+EoubT15Sx27LBSDwAgAAJKgA=
Date: Thu, 21 Nov 2024 07:10:55 +0000
Message-ID: <89d7718e29dd7ec80a2b457bca9a6f9cae888bac.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
 <20241121042602.32730-5-jason-jh.lin@mediatek.com>
 <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
In-Reply-To: <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8709:EE_
x-ms-office365-filtering-correlation-id: 9494b4df-5074-4c03-317c-08dd09fba484
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZVdHNWRiVXBSVmpNNmtjWExmRFZ6bHdBMmlrc2FmU2tmdjFIcmJ6WE1uSklh?=
 =?utf-8?B?RHFQdUVjTVVZeXN6OE8rVVRUOS9RSEhzcWw2ekFxRVpCMGNGUW4zVWxUc0pt?=
 =?utf-8?B?c0MyaC9hN2I5akRhYkM0cDFjWFJ5bXByY2krcVp3aUE2VUppNFNHdEYxcXRt?=
 =?utf-8?B?SHBkazRpZGRmV2UyV2VxRDg1c2RoOUwxRzZ4bXkyMGV4QytWMWhKdThWc3Fs?=
 =?utf-8?B?aHVQTXBkWWNLMjVPdTZ3VEJMS20wT3c0WU8yTENyNUExUzFQRmlDZEdWRHN6?=
 =?utf-8?B?SmF4YWdpUVNWdXhRK2M2MkVUSDZoTG11Nnc0dTAzWVVhTnJXNHpndEpmWFIr?=
 =?utf-8?B?bzFubzFNc0hjOCt2Q2dhZFFtbkllbU1IZGFsUnZPTHAxbzluL3IxaWFjbGEx?=
 =?utf-8?B?WDlhZ2drSDJNblVYdlBjUjMvbFMvZWpJWXQ5L0tVdVA0YVBRNXdTUnRZVndY?=
 =?utf-8?B?MWlFRElhaGluYTNnYThyN09Ddy9mZ0NYTkZ6R0tJZVdIMFJlSW5iTDFCdTlU?=
 =?utf-8?B?cXQ2SWM0b3c3d3FXbFdmK05wNkdrUjRyWTlQUGlaZFEwY3R0Y3o1d0xNbi9Y?=
 =?utf-8?B?ZkZMRW9DYm54SnBzZkJ1dGN3bTdDclZiRUc2NzhtNlZ4VGZBZGFLMU5vendt?=
 =?utf-8?B?d0JTelkwYzZlb2t3UllvK0FKR1hiT3lYa1k5WWVlM3loUE93WUJ0TlFFbGJn?=
 =?utf-8?B?WFZBT2ZNckl1b0pWbXZ2M0Y4SnVMUXN6Q0NpblVqZjhwTGloaHpoOFArSmJ6?=
 =?utf-8?B?ZDBJd3ZqMmJ2QUFrRE56QlN0cnJTdmFyT2hrU2RiRUlDNnlZb2F3akE5a1o1?=
 =?utf-8?B?QnZvekJTeE95cVVQanhBdnBiUHBVdzVRNTd2L2N6L2J4b0t0OEJ6c01uOWx4?=
 =?utf-8?B?Z21DamtyVnQwZlp3bUQ3dzFLWWt3VzB0dStKZG9rVnF5RE1jUkNMa3cweGFU?=
 =?utf-8?B?bjlHV3JCS2c4dG14US9DWjIwdWhYb0tSNmlER0tmVEpEVlR5bWMrSjdpVXVP?=
 =?utf-8?B?aU50bHN1bTAzbGVsY20vVHFUMytQanB6V0tOYTVpYkN5N3VBL3hnYnk2TEFt?=
 =?utf-8?B?cm1aOXBBTE5yVmdwdTNKTDB0SnA0VWd4T1R0OUxzbDYxOEE4TjB0bTVMWjVu?=
 =?utf-8?B?alNKTEhpVE8yRTgzNEhMejBNRmU5bXduWlc4WWRQUUhkMCtnYUkya2kwS1Qw?=
 =?utf-8?B?aTNiMEdhdVE5SnZ6cUVFQ0llT00rQXlxNEhqNzZ6RE53WTFMbXVyRFRxUE1B?=
 =?utf-8?B?Y3lacDFPbmRBNXArZkRtVjFBbXJBVCtKZzk0bzBXN0I4eE0zU0x0RENWMFhj?=
 =?utf-8?B?QU9tdC8xN0lTM0FEbENVenIxNC9vdVBwMnphczY4WWh0aXJxU3lPait5RFJr?=
 =?utf-8?B?a3lUSVJHdHRZeEpSZjNrTHUyTmEvSjJ1OXoyQWRObGl4OWlJRU9zNG92Nlpq?=
 =?utf-8?B?d25QQmlleDBDMzAydm53WjVVZU43NmJQcnBPOFEvNGVTWEd0ZDM1TEp2b09v?=
 =?utf-8?B?a2g3VEMzK3lvZWxMZGZBanJ1L2pweVVWaVlHQzZkam9YcmNiTGxGeC84QUFZ?=
 =?utf-8?B?TStaTzYyeWJ3a0phR3RKU2Z1T1puamx6QzRNU0tkcFV0RVRFenFORGdxenF1?=
 =?utf-8?B?ZG5VVEdlRUJFZWh6R0xQS1dKOFRVd3NTWjd0ZHhMODBEcjk4bDc2MTJ2SGRI?=
 =?utf-8?B?M1VTYzdHVGJDUmNOL3hZTndiSnVEdlo2eXJMTCtvK3R2QmNZRjRxTytSYzdD?=
 =?utf-8?B?THVZT3B0RlZaSEtzN25vcnMvZWxYWG11cVU2QngrVE1vcWtsSXk5aC83cmlX?=
 =?utf-8?Q?0j6Nj7dYhJvfz4pv3b7ETXhs8v+VbRMKunAPQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WktYcW1WcXB2SDBUZUFEOFJNVTYzZFArWURsajMycDQvVW9zU0VVQkVQL0da?=
 =?utf-8?B?bmtRem1rTU82YkQ4UGlkWmhzZDNSQlphR1l0Sy91ZUo1cGYvQmJjOWxSTmNJ?=
 =?utf-8?B?VDIwSE1MT3VNdERjZjl2SEo5dUpvcXZZT2hFeVNGc0hlQjhCZjFDMGVuaFZI?=
 =?utf-8?B?NjM4MHhvTktQRVFkNGVsMmIrbG12OTRiZE9PLzdMNkczU3RMbE5Xc2hnNjQx?=
 =?utf-8?B?a1pRV1pKMFlVa3hLUVFUelNyM2c2RWJJTmJBOFZ2YW9qWHA1UHZwQVVZc01a?=
 =?utf-8?B?NVhyR1lqTkRhZVNwQnQ5SG9YYkNRSkNoaUVpZ21QaEZSVGNuZFBvS2xHS05V?=
 =?utf-8?B?QzBrWWFBQkJMdXRobkpPeFJNUmUyUkc4VnBvNmw2K0R3bHd3aHNtcSttb3d5?=
 =?utf-8?B?TXVoUU5MdFk4SjFjUkdEcjEvNThINE5QMDRMeXI1S0ZnWHJ3RWphSWFIWE1n?=
 =?utf-8?B?RHQ3a2VZTnZNcDVkTXlES3VZb0RLYXIvY1A3enJnSzIyalVGMzg4WnluYWpO?=
 =?utf-8?B?Sk1ncWhSb3dQUUpMNHVaTEZqVDNHRVJDeUZHcnFaVVlVUzNERkJuWUR6NnBN?=
 =?utf-8?B?clcrc0RCZ1RuUG9PM05VVlJiNnBlMUN5NU5DeHFKUHMvdXNuZEFoVjVQVHR1?=
 =?utf-8?B?Szg5aEdsZGNEUktEcmhZYTMzNDJOdEF3R3J3dC9wRy8xc2N4eFBQREE5RUlz?=
 =?utf-8?B?TDY4K05XMDlCZ21CQlZHWFZYQmowRjlvaUhPbnZmdVFNemJTaVIxTW5jck1s?=
 =?utf-8?B?UmNKMzAvVjIwLzZpKytLZW1HazMwakdjaXZBajJ3YTkzZ1B6Y3VFUzJrcDZR?=
 =?utf-8?B?SW1EbUlyWW9SY0NjRStXNzl4VU1LZVo0c0JWM3FzRUZOUWpQSXlvdUF2S001?=
 =?utf-8?B?MUZJNWlOTVM2a2YrbE9nK1RhZldESkpvNStwaHgzSUQ5REhtMDJLWUJoeHZm?=
 =?utf-8?B?RW03OFF4RTR2Q09LdEJyUm9ORDVhVjBHTU54ZkxCRHF5ZFl5dHBVZUR6ZXJj?=
 =?utf-8?B?NVRaSjYzTmVzZnNSYXovOWRUK2s3VjFmdzZSQTNtTHlnMTBnTVNsblJydnph?=
 =?utf-8?B?Z1o3MFpYdnYyZ0duUncrL0QvQnI2aXRyTXZZWkpKMEd3djdzSTUvalB0NzRm?=
 =?utf-8?B?cmRiSHRjbWlhS2Q5bUVPOVB3emhVR0NVWWJuRHRjcndvWEcvMzU5WnFwL3Z2?=
 =?utf-8?B?U0NwVkQ3QW1Jck9HNUJwamU4TUhHUWxxNHF5d3MxS1V5bnlGTzF4dU1jT3Q4?=
 =?utf-8?B?MGtPNnUrNjg3ZFJjS1RTWXZ1L08ra1AyTjNLeXVESk4zVUZJdngxSktWb0Rt?=
 =?utf-8?B?UjJlU25IL2Rta1F6MXJWMmIxV1pZNXhUTVE2MGo5KzNpYnZzUCtBWDhjTlJl?=
 =?utf-8?B?UVJpR3Q3QTUzTU45b3M2VGlzVjdHWXBKcmdrMkh6NTZtNEUzOEo5cUJkL0lS?=
 =?utf-8?B?cFdicjZSaHhFM0lza2lWTFNJOFBMYnltK3JsYjNIREV0QkV4czJUMkRCR3k0?=
 =?utf-8?B?OVJpNW1KRjdNS0dORzVSaVdmNUJiOWFvYkxzWlBEWFpzRFRsbmdQRmtEVWFT?=
 =?utf-8?B?djl6bnhkd1NPUTZSckhEN1hmcXpaaTIxRGZUeDhkVFBRUnh4K3J6Wks3bW45?=
 =?utf-8?B?SEw4NzRjWkFldlRQSFhaVm5DakMyaVBhcjZ0ZEgrbTZZdmg3dk9TckZEWk95?=
 =?utf-8?B?YXZWSi9rZ296U00zWElkNTFPSHFWY1FmcE1TSlE4MlE2cDFwMkZHY3FEWXBM?=
 =?utf-8?B?K2VCVFVucUMxaGVpTUJYNGZmLzdNa0NoLzBkSEVxVXFjcHlualJOZ3hCQ24r?=
 =?utf-8?B?Q0NvZ0R5dStTcUtmN0UyaW50emM5L2JuUENTUFlENzh0anVIL3BYV0l6dXlI?=
 =?utf-8?B?bmY2QTdaeWNvQlJmcUNPTXVBUVdhZTBEMEpvV2QrRHUwczFlSHYwQVd3amdI?=
 =?utf-8?B?VGR0NGxhMnZmSnU4RkhHa0hBR3BYczc5ekU2Z3VobkJTNFVSMFcxNFRLVGNv?=
 =?utf-8?B?Tk9PQUd2WFluQ3BBVkRrU3hDeWpqSjl2QlVqeStmMWlicGZHY3NHdjU0WDdO?=
 =?utf-8?B?THY3UzBIcGt5VkVpdjl1ZVdMbDlKa0pOQUVxU0NXOWEyTDlvSko2QkJqZjd0?=
 =?utf-8?Q?RmAxoyPLqWzyJ2+Qxg8vH0Lml?=
Content-ID: <4B8D8333E20C5F4F9E323AB6A08F5750@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9494b4df-5074-4c03-317c-08dd09fba484
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 07:10:55.7739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jeuZbNer85H3N98Xdcu8mO1sAHwupYelfGxpAg69Wxqj/Dr9jhRejM7eDh/Fa8fW3LMwdUdpnPUSgJELZIGSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8709
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_600537864.1514878028"
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

--__=_Part_Boundary_002_600537864.1514878028
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMTQ6MzggKzA4MDAsIENLIEh1IHdy
b3RlOg0KPiBIaSwgSmFzb246DQo+IA0KPiBPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMTI6MjUgKzA4
MDAsIEphc29uLUpILkxpbiB3cm90ZToNCj4gPiBXaGVuIEdDRSBleGVjdXRlcyBpbnN0cnVjdGlv
bnMsIHRoZSBjb3JyZXNwb25kaW5nIGhhcmR3YXJlIHJlZ2lzdGVyDQo+ID4gY2FuIGJlIGZvdW5k
IHRocm91Z2ggdGhlIHN1YnN5cyBJRC4NCj4gPiBGb3IgdW5zdXBwb3J0ZWQgc3Vic3lzIElEIGhh
cmR3YXJlLCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBuZWVkIHRvIGJlIHVzZWQNCj4gPiB0byBnZW5l
cmF0ZSBHQ0UgaW5zdHJ1Y3Rpb25zLg0KPiA+IA0KPiA+IEFkZCB0aGUgcGFfYmFzZSBpbnRlcmZh
Y2UgdG8gdGhlIGluc3RydWN0aW9uIHByb2dyYW1taW5nIGZsb3cgZm9yIHRoZXNlDQo+ID4gdW5z
dXBwb3J0ZWQgc3Vic3lzIElEIGhhcmR3YXJlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEph
c29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtz
bmlwXQ0KPiANCj4gPiAtaW50IGNtZHFfcGt0X3dyaXRlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1
OCBzdWJzeXMsIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSkNCj4gPiAraW50IGNtZHFfcGt0X3dyaXRl
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMsIHUzMiBwYV9iYXNlLCB1MTYgb2Zmc2V0
LCB1MzIgdmFsdWUpDQo+ID4gIHsNCj4gPiArCXN0cnVjdCBjbWRxX2NsaWVudCAqY2wgPSAoc3Ry
dWN0IGNtZHFfY2xpZW50ICopcGt0LT5jbDsNCj4gPiAgCXN0cnVjdCBjbWRxX2luc3RydWN0aW9u
IGluc3QgPSB7DQo+ID4gIAkJLm9wID0gQ01EUV9DT0RFX1dSSVRFLA0KPiA+ICAJCS52YWx1ZSA9
IHZhbHVlLA0KPiA+ICAJCS5vZmZzZXQgPSBvZmZzZXQsDQo+ID4gIAkJLnN1YnN5cyA9IHN1YnN5
cw0KPiA+ICAJfTsNCj4gPiAtCXJldHVybiBjbWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsIGlu
c3QpOw0KPiA+ICsJaW50IGVycjsNCj4gPiArDQo+ID4gKwlpZiAoIWNsKSB7DQo+ID4gKwkJcHJf
ZXJyKCIlcyAlZDogcGt0LT5jbCBpcyBOVUxMIVxuIiwgX19mdW5jX18sIF9fTElORV9fKTsNCj4g
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoY21kcV9zdWJz
eXNfaXNfdmFsaWQoY2wtPmNoYW4sIHN1YnN5cykpIHsNCj4gDQo+IEkgd291bGQgbGlrZSB0byBo
YXZlIGEgbmV3IEFQSSBmb3Igbm8gc3Vic3lzLiBNYXliZSBjbWRxX3BrdF93cml0ZV9wYSgpLg0K
PiBJZiBzb21lIGNsaWVudCBkcml2ZXIgYWx3YXlzIGhhdmUgc3Vic3lzLCBpdCBjb3VsZCB1c2Ug
Y21kcV9wa3Rfd3JpdGUoKS4NCj4gSWYgc29tZSBjbGllbnQgZHJpdmVyIGhhdmUgbm8gc3Vic3lz
LCBpdCBjb3VsZCB1c2UgY21kcV9wa3Rfd3JpdGVfcGEoKS4NCj4gVGhpcyB3b3VsZCBwcmV2ZW50
IGZyZXF1ZW50bHkgY29uZGl0aW9uYWwganVtcCBpbiB0aGlzIGZ1bmN0aW9uLg0KPiBJZiBzb21l
IGNsaWVudCBkcml2ZXIgaGF2ZSBzdWJzeXMgaW4gc29tZSBTb0MgYW5kIGhhdmUgbm8gc3Vic3lz
IGluIG90aGVyIFNvQywNCj4gbGV0IHRoZSBjb25kaXRpb25hbCBqdW1wIGhhcHBlbiBpbiB0aGF0
IGNsaWVudCBkcml2ZXIuDQo+IChUaGUgY2xpZW50IGRyaXZlciBjb3VsZCB1c2UgJ2xpa2VseScg
b3IgJ3VubGlrZWx5JyB0byB1cHRpbWl6ZSkNCj4gSW4gdGhlIHZpZXcgcG9pbnQgdG8gbGV0IGNs
aWVudCBkcml2ZXIgaGF2ZSBmaW5lLWdyYWluZWQgY29udHJvbCwNCj4gbWF5YmUgY2xpZW50IGNv
dWxkIHVzZSBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rfd3JpdGVfc192YWx1ZSgpIHRv
IGFjaGlldmUgdGhpcyBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gaW52ZW50IG5ldyBBUEkuDQoN
CkZvciBhIGNsaWVudCBkcml2ZXIsIHRoZSBoaWdoIGFkZHJlc3MgaXMgdXN1YWxseSBhIGNvbnN0
YW50IHZhbHVlLg0KU28gdGhlIGNsaWVudCBjb3VsZCBoYXZlIGNvbW1hbmQgbGlrZToNCg0KY21k
cV9wa3RfYXNzaWduKHBrdCwgMCwgQ01EUV9BRERSX0hJR0gocGFfYmFzZSkpOw0KDQpjbWRxX3Br
dF93cml0ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQxKSwgdmFsdWUxKTsN
CmNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNldDIpLCB2
YWx1ZTIpOw0KY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAsIENNRFFfQUREUl9MT1cob2Zm
c2V0MyksIHZhbHVlMyk7DQpjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERS
X0xPVyhvZmZzZXQ0KSwgdmFsdWU0KTsNCmNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBD
TURRX0FERFJfTE9XKG9mZnNldDUpLCB2YWx1ZTUpOw0KY21kcV9wa3Rfd3JpdGVfc192YWx1ZShw
a3QsIDAsIENNRFFfQUREUl9MT1cob2Zmc2V0NiksIHZhbHVlNik7DQoNClRoaXMgd291bGQgcmVk
dWNlIHRoZSBjb21tYW5kIHNpemUuDQpHQ0Ugd291bGQgZXhlY3V0ZSBtb3JlIHF1aWNrbHkuDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCj4gPiArCQllcnIgPSBj
bWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsIGluc3QpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiAr
CQllcnIgPSBjbWRxX3BrdF9hc3NpZ24ocGt0LCAwLCBDTURRX0FERFJfSElHSChwYV9iYXNlKSk7
DQo+ID4gKwkJaWYgKGVyciA8IDApDQo+ID4gKwkJCXJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICsJ
CWVyciA9IGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNl
dCksIHZhbHVlKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gZXJyOw0KPiA+ICB9DQo+
ID4gIEVYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGUpOw0KPiA+ICANCj4gDQo+IA0K

--__=_Part_Boundary_002_600537864.1514878028
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMTEtMjEmIzMyO2F0JiMzMjsxNDozOCYjMzI7KzA4MDAsJiMzMjtDSyYjMzI7SHUmIzMy
O3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtKYXNvbjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24m
IzMyO1RodSwmIzMyOzIwMjQtMTEtMjEmIzMyO2F0JiMzMjsxMjoyNSYjMzI7KzA4MDAsJiMzMjtK
YXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7V2hlbiYjMzI7R0NFJiMz
MjtleGVjdXRlcyYjMzI7aW5zdHJ1Y3Rpb25zLCYjMzI7dGhlJiMzMjtjb3JyZXNwb25kaW5nJiMz
MjtoYXJkd2FyZSYjMzI7cmVnaXN0ZXINCiZndDsmIzMyOyZndDsmIzMyO2NhbiYjMzI7YmUmIzMy
O2ZvdW5kJiMzMjt0aHJvdWdoJiMzMjt0aGUmIzMyO3N1YnN5cyYjMzI7SUQuDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtGb3ImIzMyO3Vuc3VwcG9ydGVkJiMzMjtzdWJzeXMmIzMyO0lEJiMzMjtoYXJkd2Fy
ZSwmIzMyO3RoZSYjMzI7cGh5c2ljYWwmIzMyO2FkZHJlc3MmIzMyO25lZWQmIzMyO3RvJiMzMjti
ZSYjMzI7dXNlZA0KJmd0OyYjMzI7Jmd0OyYjMzI7dG8mIzMyO2dlbmVyYXRlJiMzMjtHQ0UmIzMy
O2luc3RydWN0aW9ucy4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7QWRk
JiMzMjt0aGUmIzMyO3BhX2Jhc2UmIzMyO2ludGVyZmFjZSYjMzI7dG8mIzMyO3RoZSYjMzI7aW5z
dHJ1Y3Rpb24mIzMyO3Byb2dyYW1taW5nJiMzMjtmbG93JiMzMjtmb3ImIzMyO3RoZXNlDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjt1bnN1cHBvcnRlZCYjMzI7c3Vic3lzJiMzMjtJRCYjMzI7aGFyZHdhcmUu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMz
MjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1tzbmlwXQ0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstaW50JiMzMjtjbWRxX3BrdF93cml0ZShzdHJ1Y3QmIzMyO2Nt
ZHFfcGt0JiMzMjsqcGt0LCYjMzI7dTgmIzMyO3N1YnN5cywmIzMyO3UxNiYjMzI7b2Zmc2V0LCYj
MzI7dTMyJiMzMjt2YWx1ZSkNCiZndDsmIzMyOyZndDsmIzMyOytpbnQmIzMyO2NtZHFfcGt0X3dy
aXRlKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3QsJiMzMjt1OCYjMzI7c3Vic3lzLCYjMzI7
dTMyJiMzMjtwYV9iYXNlLCYjMzI7dTE2JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVlKQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrc3RydWN0JiMzMjtj
bWRxX2NsaWVudCYjMzI7KmNsJiMzMjs9JiMzMjsoc3RydWN0JiMzMjtjbWRxX2NsaWVudCYjMzI7
Kilwa3QtJmd0O2NsOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2NtZHFfaW5z
dHJ1Y3Rpb24mIzMyO2luc3QmIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7Lm9w
JiMzMjs9JiMzMjtDTURRX0NPREVfV1JJVEUsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOy52YWx1
ZSYjMzI7PSYjMzI7dmFsdWUsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOy5vZmZzZXQmIzMyOz0m
IzMyO29mZnNldCwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7LnN1YnN5cyYjMzI7PSYjMzI7c3Vi
c3lzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstcmV0dXJu
JiMzMjtjbWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsJiMzMjtpbnN0KTsNCiZndDsmIzMyOyZn
dDsmIzMyOytpbnQmIzMyO2VycjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOytpZiYjMzI7KCFjbCkmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOytwcl9lcnIoJnF1b3Q7
JXMmIzMyOyVkOiYjMzI7cGt0LSZndDtjbCYjMzI7aXMmIzMyO05VTEwhJiM5MjtuJnF1b3Q7LCYj
MzI7X19mdW5jX18sJiMzMjtfX0xJTkVfXyk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0dXJuJiMz
MjstRUlOVkFMOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K30NCiZndDsmIzMyOyZndDsmIzMyOysNCiZn
dDsmIzMyOyZndDsmIzMyOytpZiYjMzI7KGNtZHFfc3Vic3lzX2lzX3ZhbGlkKGNsLSZndDtjaGFu
LCYjMzI7c3Vic3lzKSkmIzMyO3sNCiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzI7d291bGQmIzMy
O2xpa2UmIzMyO3RvJiMzMjtoYXZlJiMzMjthJiMzMjtuZXcmIzMyO0FQSSYjMzI7Zm9yJiMzMjtu
byYjMzI7c3Vic3lzLiYjMzI7TWF5YmUmIzMyO2NtZHFfcGt0X3dyaXRlX3BhKCkuDQomZ3Q7JiMz
MjtJZiYjMzI7c29tZSYjMzI7Y2xpZW50JiMzMjtkcml2ZXImIzMyO2Fsd2F5cyYjMzI7aGF2ZSYj
MzI7c3Vic3lzLCYjMzI7aXQmIzMyO2NvdWxkJiMzMjt1c2UmIzMyO2NtZHFfcGt0X3dyaXRlKCku
DQomZ3Q7JiMzMjtJZiYjMzI7c29tZSYjMzI7Y2xpZW50JiMzMjtkcml2ZXImIzMyO2hhdmUmIzMy
O25vJiMzMjtzdWJzeXMsJiMzMjtpdCYjMzI7Y291bGQmIzMyO3VzZSYjMzI7Y21kcV9wa3Rfd3Jp
dGVfcGEoKS4NCiZndDsmIzMyO1RoaXMmIzMyO3dvdWxkJiMzMjtwcmV2ZW50JiMzMjtmcmVxdWVu
dGx5JiMzMjtjb25kaXRpb25hbCYjMzI7anVtcCYjMzI7aW4mIzMyO3RoaXMmIzMyO2Z1bmN0aW9u
Lg0KJmd0OyYjMzI7SWYmIzMyO3NvbWUmIzMyO2NsaWVudCYjMzI7ZHJpdmVyJiMzMjtoYXZlJiMz
MjtzdWJzeXMmIzMyO2luJiMzMjtzb21lJiMzMjtTb0MmIzMyO2FuZCYjMzI7aGF2ZSYjMzI7bm8m
IzMyO3N1YnN5cyYjMzI7aW4mIzMyO290aGVyJiMzMjtTb0MsDQomZ3Q7JiMzMjtsZXQmIzMyO3Ro
ZSYjMzI7Y29uZGl0aW9uYWwmIzMyO2p1bXAmIzMyO2hhcHBlbiYjMzI7aW4mIzMyO3RoYXQmIzMy
O2NsaWVudCYjMzI7ZHJpdmVyLg0KJmd0OyYjMzI7KFRoZSYjMzI7Y2xpZW50JiMzMjtkcml2ZXIm
IzMyO2NvdWxkJiMzMjt1c2UmIzMyOyYjMzk7bGlrZWx5JiMzOTsmIzMyO29yJiMzMjsmIzM5O3Vu
bGlrZWx5JiMzOTsmIzMyO3RvJiMzMjt1cHRpbWl6ZSkNCiZndDsmIzMyO0luJiMzMjt0aGUmIzMy
O3ZpZXcmIzMyO3BvaW50JiMzMjt0byYjMzI7bGV0JiMzMjtjbGllbnQmIzMyO2RyaXZlciYjMzI7
aGF2ZSYjMzI7ZmluZS1ncmFpbmVkJiMzMjtjb250cm9sLA0KJmd0OyYjMzI7bWF5YmUmIzMyO2Ns
aWVudCYjMzI7Y291bGQmIzMyO3VzZSYjMzI7Y21kcV9wa3RfYXNzaWduKCkmIzMyO2FuZCYjMzI7
Y21kcV9wa3Rfd3JpdGVfc192YWx1ZSgpJiMzMjt0byYjMzI7YWNoaWV2ZSYjMzI7dGhpcyYjMzI7
c28mIzMyO2l0JiMzOTtzJiMzMjtub3QmIzMyO25lY2Vzc2FyeSYjMzI7dG8mIzMyO2ludmVudCYj
MzI7bmV3JiMzMjtBUEkuDQoNCkZvciYjMzI7YSYjMzI7Y2xpZW50JiMzMjtkcml2ZXIsJiMzMjt0
aGUmIzMyO2hpZ2gmIzMyO2FkZHJlc3MmIzMyO2lzJiMzMjt1c3VhbGx5JiMzMjthJiMzMjtjb25z
dGFudCYjMzI7dmFsdWUuDQpTbyYjMzI7dGhlJiMzMjtjbGllbnQmIzMyO2NvdWxkJiMzMjtoYXZl
JiMzMjtjb21tYW5kJiMzMjtsaWtlOg0KDQpjbWRxX3BrdF9hc3NpZ24ocGt0LCYjMzI7MCwmIzMy
O0NNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCg0KY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3Qs
JiMzMjswLCYjMzI7Q01EUV9BRERSX0xPVyhvZmZzZXQxKSwmIzMyO3ZhbHVlMSk7DQpjbWRxX3Br
dF93cml0ZV9zX3ZhbHVlKHBrdCwmIzMyOzAsJiMzMjtDTURRX0FERFJfTE9XKG9mZnNldDIpLCYj
MzI7dmFsdWUyKTsNCmNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCYjMzI7MCwmIzMyO0NNRFFf
QUREUl9MT1cob2Zmc2V0MyksJiMzMjt2YWx1ZTMpOw0KY21kcV9wa3Rfd3JpdGVfc192YWx1ZShw
a3QsJiMzMjswLCYjMzI7Q01EUV9BRERSX0xPVyhvZmZzZXQ0KSwmIzMyO3ZhbHVlNCk7DQpjbWRx
X3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwmIzMyOzAsJiMzMjtDTURRX0FERFJfTE9XKG9mZnNldDUp
LCYjMzI7dmFsdWU1KTsNCmNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCYjMzI7MCwmIzMyO0NN
RFFfQUREUl9MT1cob2Zmc2V0NiksJiMzMjt2YWx1ZTYpOw0KDQpUaGlzJiMzMjt3b3VsZCYjMzI7
cmVkdWNlJiMzMjt0aGUmIzMyO2NvbW1hbmQmIzMyO3NpemUuDQpHQ0UmIzMyO3dvdWxkJiMzMjtl
eGVjdXRlJiMzMjttb3JlJiMzMjtxdWlja2x5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Q0sNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7K2VyciYjMzI7PSYjMzI7Y21kcV9wa3RfYXBwZW5kX2NvbW1hbmQocGt0LCYjMzI7aW5z
dCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfSYjMzI7ZWxzZSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYj
MzI7K2VyciYjMzI7PSYjMzI7Y21kcV9wa3RfYXNzaWduKHBrdCwmIzMyOzAsJiMzMjtDTURRX0FE
RFJfSElHSChwYV9iYXNlKSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraWYmIzMyOyhlcnImIzMyOyZs
dDsmIzMyOzApDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0dXJuJiMzMjtlcnI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtjbWRxX3BrdF93cml0
ZV9zX3ZhbHVlKHBrdCwmIzMyOzAsJiMzMjtDTURRX0FERFJfTE9XKG9mZnNldCksJiMzMjt2YWx1
ZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7
Jmd0OyYjMzI7K3JldHVybiYjMzI7ZXJyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt9DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyO0VYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGUpOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_002_600537864.1514878028--

