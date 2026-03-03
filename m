Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHN3JH6FpmnaQwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 07:53:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C441E9D25
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 07:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8627D10E640;
	Tue,  3 Mar 2026 06:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="j1+dGPs1";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bMR+GkdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FDE10E640
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 06:53:44 +0000 (UTC)
X-UUID: b65c3d6016cd11f1bcd7499a721e883d-20260303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=WxO+Z9bzJuBfYKOXFgT5Fy8I4d01n/2OuyXsM5bHB+I=; 
 b=j1+dGPs1JVRhq3WYcl7RnwUdtGwFdHW1osa5aw+7KlBHBxSHUgzVl4SNA7DN54fp+vXNtE2c1f76mM4nsaqI7TPfHfbMFe+qaCSrrbMUxwPqmg4APwK+O7f015BqpSvYIs6UcAmmxk6JFQqUWOb00a3ewMSZH3BGWWX7Ui2qEr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:2cf4d585-6d8a-4b53-a5c4-28add556d5cf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:4c2b757b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b65c3d6016cd11f1bcd7499a721e883d-20260303
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 233350127; Tue, 03 Mar 2026 14:53:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 14:53:39 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 14:53:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5yOTcIQontc5dAcsSJZf2ZROgEg0Y17IrXJq1mzJOfrpkWrI8cNSmmMTY3Uu9XNCMDuTJhLro4hBAjssz3Buyx72uHrp3raJ3x+83UZJMADnE+sWQRnTAHHvlEMjreoZI4ouVtyS0zP8966DCnp8UyaDzWNO17sEwANdVGlpKRE2hLvWl6msJWsnEAp2NWV3sv5OZA1EMphH4nv2PWOezwoTyC0K7VQc0OsaDEars74wZHFVxFmureNBsbe6zRni1wMWIQccfOiwvynWPI/1q279774I20wS9zvMhpW3QHOqVYrgQgXxLMbuo2Gxx5wTbVSxdeHmety/GTY0kGy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxO+Z9bzJuBfYKOXFgT5Fy8I4d01n/2OuyXsM5bHB+I=;
 b=bQ5AeANGqZSfr9DSteSeaOvl7U7zI2TeWxrXJBfv/KRnk8PPjpr9FUhROUuvRHmZB8QB0VVz9Xe2ki28zSRQDCOaR88OYByHyuN83nO7vOfLt4Bhs2r+VGhxq/cuIADFDNlmhsaKGkGm2jz0kRi2WZfFm5cLUjY+0y0atwrl3eBx1riQ80tvDLDwRnfPZ6q/iDri4ZgVMUzcq8mwjoR4DEzZj5P0IDMO9Sm4Feeks0T1jXP1jnUlBI9icI8yj63P4SK4zVk/C5siK6OkmYJFcCdXKPv6qoshdpikbRCpcGik7u/87sYCCRIiMAyT1xKHso5UPLHzIdNxqGRWGZf/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxO+Z9bzJuBfYKOXFgT5Fy8I4d01n/2OuyXsM5bHB+I=;
 b=bMR+GkdLdvdtCNZuvqIRdHIZ2gRmvnt+mOWJQEIuLf/6ty21gh7f48yK7+5D6c2RTGOPmBJJSCuYTh4t1rRNrlFBJMHJ8wgtsjKK2P8cCxPVmIvcT7TsLtba/dQ4FIzOcjrTfHqw6rD4x9VG31jA7KiF0J/w3PG3dRlKtiHNaME=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KU2PPF88985076F.apcprd03.prod.outlook.com (2603:1096:d18::41a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 06:53:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 06:53:36 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Ariel D'Alessandro
 <ariel.dalessandro@collabora.com>, "kernel@collabora.com"
 <kernel@collabora.com>
Subject: Re: [PATCH 08/11] drm/mediatek: ovl: Implement support for Gamma
Thread-Topic: [PATCH 08/11] drm/mediatek: ovl: Implement support for Gamma
Thread-Index: AQHcdEUDcpQXIgpfH0yFWO842RU/yLWczF+A
Date: Tue, 3 Mar 2026 06:53:36 +0000
Message-ID: <6f0e1de2043f03bd3e00a31210af50e06aef7205.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-8-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-8-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KU2PPF88985076F:EE_
x-ms-office365-filtering-correlation-id: ac8ed99c-b4e9-4d75-903f-08de78f197f0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|7416014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: Ycm+ghqx349c5eB8Y21GJZkeFDjYgJq+hBgZeJJJegt8cCHOxcfRP9CDjLAjkS218Hynpo/E1Vo3KkYGT65TPkdyD9zg5YSDqjhANIaxhLM5jKrjTwVXBn9JofojLCk/Hrixp1woBFBnaDOgFY7iE/H+DhGz6OoaDENLnUBcjObQKwMh8V4wa2HahT4nK4yu31ibKV+zLe3UzkSzSxUktM8gX4iasdObhRfSvsJp+1z2VCavfkxjTqprsVpw9JZp6zvMuGlIJoOs5nzD2acEn7eyvlQsgFQOW178gnKzIZwCoaNvAN1U+dFPS6H85nlBP345TC6nIIqDk2pfqaKivl7abpznWLQNnDHuhIBZMqSiYF/1afMgSAElJBv/t5rLCtMf0uHBALYkaYyRvV28UpTHX3bhcuaoK6+chITv3AW263sg4kfW5+gzTW1nuWQhSv9ApWBXY0IoyRF42GYFC9hDMG8KeOxY+DeFP3ixInE+btUPTiNI3/wff6Zte9VXpzavo/uLWDo2uWBS/a32HjHwPKX9cF1lXKJmrxgQ/jqvEF5JvPSoTdS9jhv9yYI9U9gZc8LYVAPE9deCb27ATWMucq4gZaBeEWls0Af/u6RW7NV0/CiwlpmJWnytb6UxvjwVIaPokDcMyYHFhhxtqTUL+NIxZJzZ+cNUjz4t4NeP9MItk5/8mwqyfoEdz7Qz1azw0eVUvrPM1PkfAZWYkNdW3Ln5K1E6UBZaZqp10KdlrURLTltxtzmghzAPZnl1INu9gB+lvBdW+DAWchKvfapLfV+GTMHhf8TmZ0fQSWlVlke0LOZT6hZLUSelWyAM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHJIdjVndDhVSkNpdlZlWDREOGY4MEJCSjJvSDRXWDVLNkQzZ3Zralp2bERx?=
 =?utf-8?B?UkdZbTJPYmV3clUzeklMNXVBZkFlU01Fb0lVZzFpajQwZVlOL2VJUFl4YVpD?=
 =?utf-8?B?QU5nOERHL3NFdEwrUk5RVnA4OVVQb0hudkFPZ2NkVzNXTDVjQjZ4bkZsZDdD?=
 =?utf-8?B?OFJ3VysvVlB3MTBXbjBWaHd5UWFSMmQvdjR1d2NGbDhkTTdZcjJ4dSthMEtu?=
 =?utf-8?B?c3IveUZhZmM1a1RZZVV3K0QzYlpsdHNIVFN1bHZMTnF4MFVMMXhkRmhqbkxy?=
 =?utf-8?B?UTZZTGx0c2duT0V5cmhObXYrbXhla01tWTZYVDdjVzFXK2VqNDB4NU01THpD?=
 =?utf-8?B?Uk9oQzhLcHFMQS9USDR5OC9xZjlvc1NOTkNsSzZYVG9PYVBneXk2Z3gyUjU3?=
 =?utf-8?B?Z2tnYkc5V1k1empSNHdqemhzOUpwMHQ0UGZ6b2dSbjFVVUwxWUtCWmw3czl3?=
 =?utf-8?B?dGtEeGlRWndzdFYwNkFMZWJwdTdQekdKMlBTd1lLSVc3RlZFbVhVdGJMVzJG?=
 =?utf-8?B?RGtVUFZxdjl0RC9sRzJJdXRMVXJKeDkyenU1d2JubSs5V3pIVVBhdEMvTHpM?=
 =?utf-8?B?bkZPM1IyaUlmWXRVemNid3hDVkpmMGZuSUNFRVNZN01tNnI1aE5RbVFrQnlj?=
 =?utf-8?B?WTJBeU1pRzFMYjhRSndDSmZKcjY2djFYY1J5VzVTMmttTDZwRDVzUEQ4b0RN?=
 =?utf-8?B?WWRGcjBnOStLclB4L3gvSzNpR2JvaUR0UFZKTGwvUzlhUVpQZWdoVGxzeGcz?=
 =?utf-8?B?NUhmSGMyQVJzWkJ3SHJyYjNFSmZreTEwMGxQUjMrVFh5d2xXSXIyNGdaQzBv?=
 =?utf-8?B?TW1VUzJ3RE5BUkN0U3o4YWdoUWNYeURWRHFjM3BnUUFkUWZGY2hWZmh5ejNP?=
 =?utf-8?B?M2FWNGRPUkYvZnRVNGhaZDVYbmU5R0g4azNwVno4dExBaGhZcWlVMnVERDgw?=
 =?utf-8?B?SzZOc0pQVElzdDh6eWxjbWpJV2x6SUhnTWRhRFp1dTYyR0hZVEtPMnBZV3RE?=
 =?utf-8?B?STJLbkNpM2FvVmhUaWJVTHc4K0FQWG9kZ2NVamxzT25CR3RqNXZTNWl0SlZi?=
 =?utf-8?B?SWRJeVpjbDI1bnFEMDlTUWdsZkkvL3ljbWNBbjNjMDBkRXpaN1Ryc0txWnZZ?=
 =?utf-8?B?MzhpUXpnR3RNOExXRkxsNGtGQmQ2ckxCcXpoMkxJQXA3S0VLd0NHL3YvU2U2?=
 =?utf-8?B?bFJtRlRmamFyeTJLRitMV1NKMlJaS2EvbXo0bXlFd1d1Z2Z2K0NnajBtTXZi?=
 =?utf-8?B?OHo0SjN1bXZobUg4UHo0SUhxRVpDTjZzdU5RNEV5U29IU3NPcWErWUV4clR0?=
 =?utf-8?B?MjdpOFdMdGFROFJrazdwWkZMUjVFcVNCT29NQ085U3hYaG03dHpwc2w3QjdU?=
 =?utf-8?B?Skg2MWV3YXErZ2NLZUZJUDZrdWxkNG0xV1VOTXNLWDhOcGdQcTRKZ09hT3lj?=
 =?utf-8?B?eFMwRUlqUUh3Qmx1V0ZkaWlId3owKzhTNWJ0SGlRc1MrOWtGUnhZRnEvc05h?=
 =?utf-8?B?bWxUMTZrWTY0d3FyY2t2VUdkWTQ3bWw1YnluUWRjVGZqZ1RnV3k4SkpPZ1ho?=
 =?utf-8?B?TnNuWnVnaDZrU0hCNG4zMEt4M0loTWdFL3pqMFB2a2g0NHlkcDRnVGM0VzVw?=
 =?utf-8?B?c0FEOG5kRzVZWkRUU2p5dnRsRmc5Y21WdEFTeURTNEdYbFlyeUJERkxRVnBY?=
 =?utf-8?B?N3hieExqdzNhQlluNDVRMlJFMEZoSXB6VEc3bXgveWdaUU95cnhMTm5laTNn?=
 =?utf-8?B?dDBrdE9tVVV4V25GRG94S0RmNlFnekJtamlYQU02OUFyV0FhRC9RN2FqekFn?=
 =?utf-8?B?SDJZOHBiUmF5ajhwTzJHckZvaDRlT01lc28xMXFRM0Q5a3diRHo2eG85T1px?=
 =?utf-8?B?N3lVUUp2czN1enVYRkxLdnVnVWVoeGpORmhObzNUbG1hOGVHZXdWSnRFeWxi?=
 =?utf-8?B?ZUpOM2o0UXhSSW5OWkpBaytTaThHMFBoSUxYcGEwYUI5N3VyK3NUZzNDY2Nx?=
 =?utf-8?B?NFp5UkQvR3lHRnNsVG9nQUtUMy9ydTdCZlNVY1VScWhsK1NEdFpDYXVMYjZw?=
 =?utf-8?B?U2tKOVowMGJoU2FCVGpKTm5rd2U2WWZPczF5dm9TUXozNElmUzlSM3FHRFEx?=
 =?utf-8?B?bkRRMWNBZUZ1VlhHa3ZHb0IwSW4wYVpsTWthbzBvcWpSWlYxOUFiZ0JDMlZi?=
 =?utf-8?B?dm0xTExuVVZuRWJlby9WOXZUb25VNDBwdWtveW9hL2xmZVNDWk84OStRQ2ZZ?=
 =?utf-8?B?dCtFekxyT241QWtOUSt3ZDdJWUtxNlNiVW5tcm9TTDZxNkp1OXhNQVVKVW5w?=
 =?utf-8?B?UjVZWkdjc2lIVmNXejRYRjVpWElGZ0h3Q2RHZ3NMOXZSaHBDQ0I5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8DD7942590E694AAFA4AF3B43F62340@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VPgnwhAD8MP3T0SKSNSTyme8RAR9sL7zNUxWM/Hb/N32oRbD9plsYlvXNwiXU7hiGuEuzXi81l+CUTchx7AcHj/gWDfcGp4LzS21uJztPBQ/ZHIU8VvNa7W/xK1XMBTu/3J0v+Bt1B1QWXhR7DYvpu4n4K/+Ojgr4TXLf2SZvhZ3RuQwUuz4SpF5DxxyBkp4ltoVLeQw1fSOuJaztssO0WwTG5GUBy4USCPAc6OeDHyrmp93CFT7QJaBDsaTY4Y8kddbl+WYi7oAZdqSPxkTKjBzXuA0EYEsQzimDloeB2cRHlAQM0ACU/6FOO14adKkyLBgGPUPA9FOwxBPozK7bA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8ed99c-b4e9-4d75-903f-08de78f197f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 06:53:36.4731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTyk9Vv4z+8ilE6R4+QZ43yqFynEFdC+jzs+nJux0Nxd3FU1CLdeYVYxTFeIf/2RtBOBt4P5F2AndnH0edYNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF88985076F
X-MTK: N
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
X-Rspamd-Queue-Id: 71C441E9D25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:nfraprado@collabora.com,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:daniels@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,ffwll.ch,collabora.com,gmail.com,pengutronix.de,linux.intel.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mediatek.com:dkim,mediatek.com:mid,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgT1ZMIGhhcmR3YXJlIGFsbG93cyBzZWxlY3Rpbmcg
YmV0d2VlbiBkaWZmZXJlbnQgZml4ZWQgdHJhbnNmZXINCj4gZnVuY3Rpb25zIGZvciBlYWNoIGxh
eWVyIHRocm91Z2ggdGhlIEdhbW1hIHNldHRpbmcuIEF2YWlsYWJsZQ0KPiBmdW5jdGlvbnMgYXJl
IHNjUkdCLCBCVC43MDksIEJULjIwMjAgYW5kIEhMRy4gSW1wbGVtZW50IHN1cHBvcnQgZm9yIGl0
DQo+IGFuZCBleHBvc2UgaXQgYXMgYSBjb2xvcm9wIHRocm91Z2ggdGhlIERSTSBwbGFuZSBjb2xv
ciBwaXBlbGluZSB1QVBJLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4g
UHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4
IDRlYWEzMTU0MWNjYy4uYTcwMDkyYzc5MmE5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQo+IEBAIC01MiwxMCArNTIsMTYgQEANCj4gICNkZWZpbmUgT1ZM
X0NPTl9DTFJGTVRfMTBfQklUICAgICAgICAgICAgICAgICAgICAgICAgICAoMSkNCj4gICNkZWZp
bmUgRElTUF9SRUdfT1ZMX1dDR19DRkcxICAgICAgICAgICAgICAgICAgMHgyZDgNCj4gICNkZWZp
bmUgSUdBTU1BX0VOKGxheWVyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCAr
IDQgKiAobGF5ZXIpKQ0KPiArI2RlZmluZSBHQU1NQV9FTihsYXllcikgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQklUKDIgKyA0ICogKGxheWVyKSkNCj4gICNkZWZpbmUg
RElTUF9SRUdfT1ZMX1dDR19DRkcyICAgICAgICAgICAgICAgICAgMHgyZGMNCj4gICNkZWZpbmUg
SUdBTU1BX01BU0sobGF5ZXIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRU5NQVNLKChs
YXllcikgKiA0ICsgMSwgKGxheWVyKSAqIDQpDQo+ICAjZGVmaW5lIElHQU1NQV9TQ1JHQiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMA0KPiAgI2RlZmluZSBJR0FNTUFfQlQ3MDkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDENCj4gKyNkZWZpbmUgR0FNTUFfTUFT
SyhsYXllcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRU5NQVNLKChsYXllcikgKiA0
ICsgMywgKGxheWVyKSAqIDQgKyAyKQ0KPiArI2RlZmluZSBHQU1NQV9TQ1JHQiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDANCj4gKyNkZWZpbmUgR0FNTUFfQlQ3MDkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxDQo+ICsjZGVmaW5lIEdBTU1BX0JUMjAyMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMg0KPiArI2RlZmluZSBHQU1NQV9ITEcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMNCj4gICNkZWZpbmUgRElTUF9S
RUdfT1ZMX0FERFJfTVQ4MTczICAgICAgICAgICAgICAgMHgwZjQwDQo+ICAjZGVmaW5lIERJU1Bf
UkVHX09WTF9BRERSKG92bCwgbikgICAgICAgICAgICAgICgob3ZsKS0+ZGF0YS0+YWRkciArIDB4
MjAgKiAobikpDQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9IRFJfQUREUihvdmwsIG4pICAgICAg
ICAgICgob3ZsKS0+ZGF0YS0+YWRkciArIDB4MjAgKiAobikgKyAweDA0KQ0KPiBAQCAtNTA4LDEx
ICs1MTQsNDEgQEAgc3RhdGljIGludCBtdGtfb3ZsX2NvbG9yb3BfY3VydmVfdG9fcmVnX3ZhbChl
bnVtIGRybV9jb2xvcm9wX2N1cnZlXzFkX3R5cGUgY3VydmUNCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBJR0FNTUFfU0NSR0I7DQo+ICAgICAgICAgY2FzZSBEUk1fQ09MT1JPUF8xRF9DVVJWRV9C
VDIwMjBfT0VURjoNCj4gICAgICAgICAgICAgICAgIHJldHVybiBJR0FNTUFfQlQ3MDk7DQo+ICsg
ICAgICAgY2FzZSBEUk1fQ09MT1JPUF8xRF9DVVJWRV9TUkdCX0VPVEY6DQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gR0FNTUFfU0NSR0I7DQo+ICsgICAgICAgY2FzZSBEUk1fQ09MT1JPUF8xRF9D
VVJWRV9CVDIwMjBfSU5WX09FVEY6DQoNCk1heWJlIERSTV9DT0xPUk9QXzFEX0NVUlZFX0JUMjAy
MF9PRVRGPw0KDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gR0FNTUFfQlQyMDIwOw0KPiArICAg
ICAgIGNhc2UgRFJNX0NPTE9ST1BfMURfQ1VSVkVfSExHX0VPVEY6DQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gR0FNTUFfSExHOw0KDQppZ2FtbWEgYW5kIGdhbW1hIHVzZSB0aGUgc2FtZSBmdW5j
dGlvbiBtdGtfb3ZsX2NvbG9yb3BfY3VydmVfdG9fcmVnX3ZhbCgpIHRvIGNoZWNrLg0KSWYgY3Vy
dmUgaXMgRFJNX0NPTE9ST1BfMURfQ1VSVkVfSExHX0VPVEYgZm9yIGlnYW1tYSwgZXJyb3IgaGFw
cGVuIGJ1dCBub3QgZGV0ZWN0ZWQuDQoNCj4gICAgICAgICBkZWZhdWx0Og0KPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgICAgfQ0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2
b2lkIG10a19vdmxfYXBwbHlfZ2FtbWEoc3RydWN0IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25l
ZCBpbnQgaWR4LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1f
Y29sb3JvcCAqY29sb3JvcCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQ0KPiArew0KPiArICAgICAgIGludCBjdXJ2ZV9yZWdfdmFs
Ow0KPiArDQo+ICsgICAgICAgY3VydmVfcmVnX3ZhbCA9IG10a19vdmxfY29sb3JvcF9jdXJ2ZV90
b19yZWdfdmFsKGNvbG9yb3AtPnN0YXRlLT5jdXJ2ZV8xZF90eXBlKTsNCj4gKyAgICAgICBpZiAo
Y3VydmVfcmVnX3ZhbCA8IDApIHsNCj4gKyAgICAgICAgICAgICAgIGRybV9XQVJOKG92bC0+Y3J0
Yy0+ZGV2LCAxLCAiSW52YWxpZCBjdXJ2ZSAxZCB0eXBlICV1XG4iLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgY29sb3JvcC0+c3RhdGUtPmN1cnZlXzFkX3R5cGUpOw0KPiArICAgICAgICAg
ICAgICAgcmV0dXJuOw0KPiArICAgICAgIH0NCj4gKw0KPiArICAgICAgIG10a19kZHBfd3JpdGVf
bWFzayhjbWRxX3BrdCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZmllbGRfcHJlcChH
QU1NQV9NQVNLKGlkeCksIGN1cnZlX3JlZ192YWwpLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAmb3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLCBESVNQX1JFR19PVkxfV0NHX0NGRzIsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIEdBTU1BX01BU0soaWR4KSk7DQo+ICsNCg0KV2hl
biBnYW1tYSBpcyBkaXNhYmxlLCBJIHdvdWxkIGxpa2UgdG8gZGlzYWJsZSBmaXJzdCB0aGVuIGNs
ZWFyIGN1cnZlIHZhbHVlLg0KDQo+ICsgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBjb2xvcm9wLT5zdGF0ZS0+YnlwYXNzID8g
MCA6IEdBTU1BX0VOKGlkeCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICZvdmwtPmNt
ZHFfcmVnLCBvdmwtPnJlZ3MsIERJU1BfUkVHX09WTF9XQ0dfQ0ZHMSwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0FNTUFfRU4oaWR4KSk7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lk
IG10a19vdmxfYXBwbHlfaWdhbW1hKHN0cnVjdCBtdGtfZGlzcF9vdmwgKm92bCwgdW5zaWduZWQg
aW50IGlkeCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9j
b2xvcm9wICpjb2xvcm9wLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQ0KPiBAQCAtNTQ5LDcgKzU4NSwxMSBAQCBzdGF0aWMgdm9p
ZCBtdGtfb3ZsX2FwcGx5X2NvbG9yb3Aoc3RydWN0IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25l
ZCBpbnQgaWR4LA0KPiAgew0KPiAgICAgICAgIHN3aXRjaCAoY29sb3JvcC0+dHlwZSkgew0KPiAg
ICAgICAgIGNhc2UgRFJNX0NPTE9ST1BfMURfQ1VSVkU6DQo+IC0gICAgICAgICAgICAgICBtdGtf
b3ZsX2FwcGx5X2lnYW1tYShvdmwsIGlkeCwgY29sb3JvcCwgY21kcV9wa3QpOw0KPiArICAgICAg
ICAgICAgICAgLyogZ2FtbWEgaXMgdGhlIGxhc3QgY29sb3JvcCBpbiBwaXBlbGluZSAqLw0KPiAr
ICAgICAgICAgICAgICAgaWYgKCFjb2xvcm9wLT5uZXh0KQ0KPiArICAgICAgICAgICAgICAgICAg
ICAgICBtdGtfb3ZsX2FwcGx5X2dhbW1hKG92bCwgaWR4LCBjb2xvcm9wLCBjbWRxX3BrdCk7DQo+
ICsgICAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG10a19vdmxf
YXBwbHlfaWdhbW1hKG92bCwgaWR4LCBjb2xvcm9wLCBjbWRxX3BrdCk7DQo+ICAgICAgICAgICAg
ICAgICBicmVhazsNCj4gICAgICAgICBkZWZhdWx0Og0KPiAgICAgICAgICAgICAgICAgZHJtX1dB
Uk4ob3ZsLT5jcnRjLT5kZXYsIDEsICJJbnZhbGlkIGNvbG9yb3AgdHlwZSAldVxuIiwgY29sb3Jv
cC0+dHlwZSk7DQo+IEBAIC01NjIsNyArNjAyLDcgQEAgc3RhdGljIHZvaWQgbXRrX292bF9kaXNh
YmxlX2NvbG9yb3BzKHN0cnVjdCBtdGtfZGlzcF9vdmwgKm92bCwgdW5zaWduZWQgaW50IGlkeCwN
Cj4gIHsNCj4gICAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIDAsICZvdmwtPmNt
ZHFfcmVnLCBvdmwtPnJlZ3MsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJU1BfUkVH
X09WTF9XQ0dfQ0ZHMSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgSUdBTU1BX0VOKGlk
eCkpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBJR0FNTUFfRU4oaWR4KSB8IEdBTU1B
X0VOKGlkeCkpOw0KPiANCj4gICAgICAgICAvKiBpZ2FtbWEgY3VydmUgbmVlZHMgdG8gYmUgc2V0
IHRvIGRlZmF1bHQgd2hlbiBpZ2FtbWEgaXMgZGlzYWJsZWQgKi8NCj4gICAgICAgICBtdGtfZGRw
X3dyaXRlX21hc2soY21kcV9wa3QsIElHQU1NQV9TQ1JHQiwgJm92bC0+Y21kcV9yZWcsIG92bC0+
cmVncywNCj4gQEAgLTY5Nyw2ICs3MzcsMTEgQEAgc3RhdGljIGNvbnN0IHU2NCBpZ2FtbWFfc3Vw
cG9ydGVkX3RmcyA9DQo+ICAgICAgICAgQklUKERSTV9DT0xPUk9QXzFEX0NVUlZFX1NSR0JfSU5W
X0VPVEYpIHwNCj4gICAgICAgICBCSVQoRFJNX0NPTE9ST1BfMURfQ1VSVkVfQlQyMDIwX09FVEYp
Ow0KPiANCj4gK3N0YXRpYyBjb25zdCB1NjQgZ2FtbWFfc3VwcG9ydGVkX3RmcyA9DQo+ICsgICAg
ICAgQklUKERSTV9DT0xPUk9QXzFEX0NVUlZFX1NSR0JfRU9URikgfA0KPiArICAgICAgIEJJVChE
Uk1fQ09MT1JPUF8xRF9DVVJWRV9CVDIwMjBfSU5WX09FVEYpIHwNCj4gKyAgICAgICBCSVQoRFJN
X0NPTE9ST1BfMURfQ1VSVkVfSExHX0VPVEYpOw0KPiArDQo+ICAjZGVmaW5lIE1BWF9DT0xPUl9Q
SVBFTElORV9PUFMgMw0KPiANCj4gIHN0YXRpYyBpbnQNCj4gQEAgLTcyNCw2ICs3NjksMjQgQEAg
bXRrX292bF9pbml0aWFsaXplX3BsYW5lX2NvbG9yX3BpcGVsaW5lKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLA0KPiAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9j
b2xvcm9wX2luaXQ7DQo+IA0KPiArICAgICAgIGkrKzsNCj4gKw0KPiArICAgICAgIC8qIDNyZCBv
cDogT1ZMJ3MgR2FtbWEgKi8NCg0KSSB3b3VsZCBsaWtlIHlvdSBhcHBseSBwYXRjaCBvcmRlciBh
Y2NvcmRpbmcgdG8gb3Agb3JkZXIuDQpTbyBhcHBseSAzeDMgbWF0cml4IHBhdGNoIGJlZm9yZSB0
aGlzIHBhdGNoLg0KDQo+ICsgICAgICAgb3BzW2ldID0ga3phbGxvYyhzaXplb2YoKm9wc1tpXSks
IEdGUF9LRVJORUwpOw0KDQp2YXJpYWJsZSBpIGlzIG5vdCBuZWNlc3NhcnkuDQpVc2UgY29uc3Rh
bnQgdmFsdWUgaXMgZW5vdWdoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgICAgIGlmICghb3Bz
W2ldKSB7DQo+ICsgICAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOw0KPiArICAgICAgICAgICAg
ICAgZ290byBlcnJfYWxsb2M7DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAgICAgcmV0ID0gZHJt
X3BsYW5lX2NvbG9yb3BfY3VydmVfMWRfaW5pdChkZXYsIG9wc1tpXSwgcGxhbmUsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbXRrX292bF9jb2xvcm9w
X2Z1bmNzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2FtbWFfc3VwcG9ydGVkX3RmcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsNCj4gKyAgICAgICBp
ZiAocmV0KQ0KPiArICAgICAgICAgICAgICAgZ290byBlcnJfY29sb3JvcF9pbml0Ow0KPiArDQo+
ICsgICAgICAgZHJtX2NvbG9yb3Bfc2V0X25leHRfcHJvcGVydHkob3BzW2kgLSAxXSwgb3BzW2ld
KTsNCj4gKw0KPiAgICAgICAgIHBpcGVsaW5lLT50eXBlID0gb3BzWzBdLT5iYXNlLmlkOw0KPiAg
ICAgICAgIHBpcGVsaW5lLT5uYW1lID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICJDb2xvciBQaXBl
bGluZSAlZCIsIG9wc1swXS0+YmFzZS5pZCk7DQo+IA0KPiANCj4gLS0NCj4gMi41MS4wDQo+IA0K
DQo=
