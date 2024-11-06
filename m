Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009E9BDDB9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 04:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0956C10E65E;
	Wed,  6 Nov 2024 03:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="owLR7+o6";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Krm4WEvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4811D10E189
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 03:41:28 +0000 (UTC)
X-UUID: fe941bba9bf011efb88477ffae1fc7a5-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=efuEeqtzTa6+ft1ErosxpRLF0i1t5EpQit2v/Evyi9M=; 
 b=owLR7+o6JqzLrCdN6zPqK1EDBe44RF5ztiZ6L5HOyQ5CXKXd0/Lm432T83qevwkzpxN2j+3gzpf+N2euEKbwLUqqF+arfD9mwg36lkoLx61znsw/hF1S3H6Qu7hrt1CFUaO41Go3OOUPg5jef5/Y52xmVVZBXIV6qgp/NAlxYGw=;
X-CID-CACHE: Type:Local,Time:202411061135+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:e36ea246-703c-491f-9547-cf80d22583e6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:2d80b01b-4f51-4e1d-bb6a-1fd98b6b19d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fe941bba9bf011efb88477ffae1fc7a5-20241106
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 740851103; Wed, 06 Nov 2024 11:41:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 19:41:22 -0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 11:41:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd+odNK/cGNvrnU+PZ8GKWJ00UUwuGqwZp7mr0uFWR1eP1BlGoMdNLIrxCX9Q90Wh5N1fIalNyB2CckOE3GTxbcGYIRRVRo61HYFbFhFeIKrnoux2biXY13+UiqsmkvvT2+JY+JxiMU9p7IQEN74KWjTjd52dI8ZGxNRX8Y82xxRHJXqvBxZVgdrTs1Do+w19DiRzHaKaD8RLLXXizmPZ9iv5Z3Sd8Gl0wEbxMcuUoRK8Yex/PfaVMjwDy/tzXZTEy6iysCNWKNWa7WdoqmcHFzTvaJ5lQXLfHVnUoPiasaCxbxXVmwT/5/vw6uqLOAm1YgJ+4UL5SeckKpc6e1YJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+XZeJQBs2xrFKbXlnar/DsFPzinXSUraVXt9U6/Ir4=;
 b=ltw5xVe8XtnFIEIU28zLyCT08IdnZlfw0WzSsPYUzczztfbyZavZOfbJnlyvsfuxxLOI2YgEb2moANKPSKXz6XT7hkOWt/WZhppZ6yYfnr0ScbOhEvqqiR0GiQsZHOGyYeD+1f0Yr8W497MNaYZ4SAhDL480ewJiquVxYUQXwrNGYi/CC55cQzx16Xspg0k/jHcu3l7cmyIyn3iyIDOcyiYYdLSR+Wr1CzOFxB3m7zEWjEYKucyulWiDaW6lcsuFMKRP1fDQtaj3X+jtEjYbTLnGm8o1zUgJ3W9/OY/dFZacypT6/Wbsla/Oic3Mku8ibwuiwMypVFwPJYxFyPInsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+XZeJQBs2xrFKbXlnar/DsFPzinXSUraVXt9U6/Ir4=;
 b=Krm4WEvZkEdWY28otaM6CMr+vPNLbYh0Wfd+9yVbQ+Tz3jo8XEwb5anqj7iS5Btvqga2BvjoSZTpRAuWA0hgkqsrJ1Vda0LcqG6D12RV+om3lt3TpyuL9ZV9Qvp8C6WdQqV9qbZCAFdRmX5kRVmlRlYJ8rGnqgQBUyNFj1Xlk1o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7903.apcprd03.prod.outlook.com (2603:1096:820:f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 03:41:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 03:41:19 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKpxv4A
Date: Wed, 6 Nov 2024 03:41:19 +0000
Message-ID: <e53234811109852c31de2ccb6d94aa565e20dd7a.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7903:EE_
x-ms-office365-filtering-correlation-id: 5898ceb4-62ab-4820-8a44-08dcfe14e03f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SW5ZbDFEeUxtWHU5Qmg0MVVCQ3JyV2ViQmZiN2FCSERWOFVxRGxoZWo3UmFV?=
 =?utf-8?B?QkFQMXEydGRjblMvZmVtUjhpZWU1d0xzWkhtYXgvUXlNdzhEMTVBM0FjVVUz?=
 =?utf-8?B?WmhNT0ZJWWxON3A0MDV4blB1T1Q0MHZJeE5mZGp0allSMmpsSVN5NWNUUWtL?=
 =?utf-8?B?MEJkd0gyM093SmdubVJlWDEvLzN0dUcvbzRYVTV1R0RNTXFIMjRkbWl5WGdE?=
 =?utf-8?B?WWJrSHFNZWZtd3BPNE41L0FiSWNTUGRwVmxUbThJOUM3dUN1L3BERVpVRG9p?=
 =?utf-8?B?UHZhUjdoNjBBV3ZNVXdWd1ZHWVpNZm1GVHdGNTgwUVEvZkl3VzgzcDdqTkE1?=
 =?utf-8?B?Ymx6TWFmUU5jTlNzeGZHcGw4dW1tU3IzdTM1SzJOV0FmcUhXejhOV1poZmpz?=
 =?utf-8?B?c0E1U2RLWWNNY3VNVzNpV1ROUU1USU9INXdQV0ZpYVJUbDRJMzNNUkJOcEg2?=
 =?utf-8?B?MVE1c1E2N1lMZTdQU1phU3QvRG1kVzg2eUxtbHoxbkQvdEh5VVE5ZWsxU3Jh?=
 =?utf-8?B?RUJBK2dxdkpYeXpBa1QwNStYVEp1TjdCOFk1MUFjRFp3OVFtMmxGTSt2Tlc0?=
 =?utf-8?B?NUpKcCtEQjZNSUM1V1I4am81bk5TdEhTcFRWMVorRmN6eUZXWWxWRzk3YVdw?=
 =?utf-8?B?YnFUcmNWWGd0UlNnQjlmKzNWbGY0eVRhRmg4aGtmc3p2TmtPWXowOFJCMVZK?=
 =?utf-8?B?U0pRMTZobHVCcTk0d0x4VjYzdFk3ZEJQUWFyb3g3M0FaaGVCdVVWVnAyTFhz?=
 =?utf-8?B?eFoyd0dJaW5ReVU2cHBCTFdmSjlIaVM2cXJKdW1tQkNhVExkdlJJaGtBeHF3?=
 =?utf-8?B?MTB3QWs2bXRBendmU0pDMWxYbWpYMXNCZitidjlrV0dleFB3cUorWTkxWTBz?=
 =?utf-8?B?K1FIR3NSR1EzbURHaHFBOXNnT09RZ1hxVzVVSnlubFpFVGdPblpGWVdwS3dX?=
 =?utf-8?B?UVYxRjI5Y0paTHZhQ29uUjJQSERvUm9iV3JrcmJhMSt4cHZTSDNGQ3AvRXhO?=
 =?utf-8?B?TVJjakFDVWcvVDFoaXNNcE44UDdIcDF2ZmdGTEFIcGpGQnZScjdJSWZEOVFC?=
 =?utf-8?B?eUM3c2xKWmMvR1I1ZnhJWVpLZExBWXBqaXlLVGlYd3Y4dnNSWXJiZ25iTS9T?=
 =?utf-8?B?c2F3ZUJzUXgrYXRVTTNrNXVtYlAvZFBnWVBPb3JkZVg4UjNGSWVIZjE4Ry9H?=
 =?utf-8?B?TjJIL2dSSHEzTXRiK3lJZlZYWUgzQ3dVV2V1c3pBRXZSK1Yrd1gwNGtNaXJL?=
 =?utf-8?B?T04yKysxQ016ajg5R0g3ZnpVbk5FZmNlcTVkOVM2TkF0b2FRUWJEQU9qN1hD?=
 =?utf-8?B?QTBYY0dRa0l4QnNra3YxRVA0TWhoYzY1emtnb3hOT0hPb0ZIU1YvRXFIVEhE?=
 =?utf-8?B?aU1LWlBZV0VzcENxWlg5b25GL3FQWm1ST2RycG1BN2FtOTk3MzZZYjJoNHFY?=
 =?utf-8?B?TEdOMkJnRGJHS1Raa0JIeHdQT1dWVEV6NTRJc29QRHR3UjBhcHZlS3RXNVNx?=
 =?utf-8?B?NHFzMnNUY0h1c0RpZFFuelJXTHlBOG16S3FmMDdLUzdQTUhWMzZPaUJ1d0t6?=
 =?utf-8?B?cDNod3Q3SXZsWXovclQ3ZGRINlZsN2djcHhXaFJMTGxKc2hadDhlNHZLUmRx?=
 =?utf-8?B?SEJJRi9HUkZBTnFKcm1mVHNaWlBDSHJBY1Qya0haYkxMSWw5NmlXZWFzbnIz?=
 =?utf-8?B?TVg4d1VaL3lWK0l2eFRPUnpET2d1VTFSSmExYUYzNGpnUGNYMEVSZHBLZkxI?=
 =?utf-8?B?R3FUanpidWQzR3lJZFNGTUtNaGtUMGk3K3NGMjNXZzFaWWFCM0oybkY1eW1T?=
 =?utf-8?Q?jjwGWKeyYbUqHiE3Kuvd51TY2gly+e9DTye7E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG5nRDN6N0RYWWNLNk1mU1hSQk1NVk0yMGtKNG94cGxLOHc2dG5tdEgrM3JF?=
 =?utf-8?B?ODBmSytTdlhmeDRWZlZCOU5ya29na1BqOUhaT2FGeVBHRzBvYms4WU02OEZi?=
 =?utf-8?B?T0MwMURKSzdOdG9kYzdnWVFqVEZPbXRNSm4vVUFOeEo5b3owWE82eXowS2FZ?=
 =?utf-8?B?WjIxbXVPS0NMeG5sbHQ0SkdDcSsvMFhVa015ank4ODlyZWx6enJGNENSNUtk?=
 =?utf-8?B?V1dLMkJsT2U3cDZKMG85UmRJV081LzRFbUd4OE9yK0d0aU1KbzNVeW5JOEhH?=
 =?utf-8?B?Mml0RmhyZlJXY3JQaTFqTm9KcTlka1F4blRuVEZlNjM4TTh0Uk4xYWdQQUd1?=
 =?utf-8?B?LzE4aWkrOXZJeVBFS3ZmUCs5bFRELzJZZUZoSFNPWVlFMTRtQ3RXdjg3VkRw?=
 =?utf-8?B?L21DbnJZN1UxOVJwckpKNXp4U0J1SWZ4SWJNUVRNaDQ1a2poeFNqcWxycEo4?=
 =?utf-8?B?ckE5V3FybTZiL2JGb2RjUjUyVE5ER1lvbHZmZXU5WlhOWVlBRmt4MzZpc3lI?=
 =?utf-8?B?a05YanNDUURsQVdMaHB4KzlQdjB2bnVrWXd5dU1keUZMbEFKTk1WVngrMDdy?=
 =?utf-8?B?QmFGdXlIc0tXR3l5VjF2YUVvbDB0TDd5S1kyZUFZZFhYbFlndmlnYVVDNkc5?=
 =?utf-8?B?WDJyaEZxNVVFTkw1Mk51dnpvc3pOTlB3WUtSdUY5TlA0Nm9OYTJ4aDJ1cllC?=
 =?utf-8?B?NU9NNjFWMzRmcXlqeFJUcjlZaEZ3UU5xZE9CZElTZUhGQ3Fwanc0MTFqNGR5?=
 =?utf-8?B?TUllejJaYUsrMTJ4WXBiUWY2dnNmaWV6Sjc3VzdFMGtsdndYRlZ4bGoxVUFy?=
 =?utf-8?B?bHRQa1RNbXU3Qm1rY3p4c2E5UzFHbE1QR0k5a0Y4bmlCMEtpMENvM3hQRnR1?=
 =?utf-8?B?ZXV4UzlKVHhaaFpKZVZHUndMdjRYUXZlQkNtVlpSaDBWR1pJb2xIeWFaT1Ar?=
 =?utf-8?B?REJqQkdNaU12NlRKUTdlVktzK3kxOHk2VHlZWjlEN01UVHcrRWZVYmErR3FC?=
 =?utf-8?B?QWhPNWhkMVR6Z0wvVHpFalB4T1U2b3NjRXFIU3JpSUFhR0hlc3hvTjNFUm9Z?=
 =?utf-8?B?S1hPRm5mdGMvSTRlM25qdExrRjhKZ1RCNko1SXVId0Y2ZDZCRHNmN0dOR2Fi?=
 =?utf-8?B?Y2tnazhpTk9DMXh3ZkVzZlFScHJMWk5YZklVRldKYnJZNXdLOXZiNE5vdW1P?=
 =?utf-8?B?ZjkzekJ0enJ0Y05LWnlhcllpSnZjMEM2SXhqYVFLZ3hPMlhDUzJLVWVyeTFl?=
 =?utf-8?B?ZVE1RlR1RVl0V3JCYUxhVndiSWtzTU4zT0RIbDdDMTJpeFZ6ZWwwVi9KekRH?=
 =?utf-8?B?czJrOExZcVVtVDJUUHNrTHFWZEVlOEdEeFdteGd0U1diNG8wamNHMGx6QTMw?=
 =?utf-8?B?NkJESDI1SjE0OER0bEZVeEdDZlA3THZJWmFiUDN5KzVUYlZhUjJJbUJMNFV6?=
 =?utf-8?B?c1VMUmJwVzZrQlYrZExnNmRhU01hT2Ztbm9EVlZGdjV6WU5EM29LKy9XdWF4?=
 =?utf-8?B?d0pXd2t1cVRYNjltK2JBS2FXTDhvTVNYTTJSS1FIR0FURWJia3lvZDBuVENy?=
 =?utf-8?B?UWR2c1BoOHhMRHIxdUJ1ektteXhNbzNBM0V2TCtyZWRjVUw3UCtaVGU4SGto?=
 =?utf-8?B?MmdpSkdGcFlhNDVuUEZBQm9zMVFRUHdYbjV3QlRhUGNUVE8vZlhpTVIrbFRz?=
 =?utf-8?B?Ty9JdHRlQWtKa2x4U09nd2dWdXk1bERMNFI3MStvek9CMnNPVysxVnMySzdt?=
 =?utf-8?B?NVdXL0o5dHZGMXRVdXlHdlZTWHY5WUY1b1UrWGFiOFpwWHBORnA0N1p2NGJp?=
 =?utf-8?B?MEF3cUxualQ5ejROZDBMREJSVy9uNEVPeG5uYkUrRkIyQXZ5RG5yY2JLY3Q5?=
 =?utf-8?B?UDRUdFhZK2ZON3hUM1M3c2xEVFFvc3hXRHBEN05Wa2s1SzFtNXZiU3RSQUo0?=
 =?utf-8?B?cms4aDEvOEVOU3MxaE4yMmxyNGRMbnBDUmdKZlJ3Zm93YldZb2NKMG0yZlBv?=
 =?utf-8?B?U1NWY1hFSitMcU80N3JEV01YSldBNkxGdEZkYTYyeXErYXYvZEJTNGFJdTBL?=
 =?utf-8?B?Mm5LZmd5SnVYcXlMaTI3U3IwTktDUVV6MHdOOHRkcXhqN2d2S2RCalhkZUti?=
 =?utf-8?Q?hbA+FTrjktTXgz14RpnAHOHO+?=
Content-ID: <274B31122BC81944BB6B0755968A35E3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5898ceb4-62ab-4820-8a44-08dcfe14e03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 03:41:19.4350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0iP0JtIXsXHlmVOru7ZYlu9TwujOuRlY+lobV0MHBTCcThnFdwqBMBaC5bMymHa0c2gXeEmLgMZDUbdL3XTqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7903
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1262221317.1202391746"
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

--__=_Part_Boundary_005_1262221317.1202391746
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK3N0
cnVjdCBtdGtjYW1faXBpX2h3X21hcHBpbmcgew0KPiArCXU4CXBpcGVfaWQ7IC8qIHJlZi4gdG8g
bXRrY2FtX3BpcGVfc3ViZGV2ICovDQo+ICsJdTE2CWRldl9tYXNrOyAvKiByZWYuIHRvIG10a2Nh
bV9waXBlX2RldiAqLw0KPiArCXU4CWV4cF9vcmRlcjsNCg0KZXhwX29yZGVyIGlzIHVzZWxlc3Ms
IHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt9IF9fcGFja2VkOw0KPiArDQoNCg==

--__=_Part_Boundary_005_1262221317.1202391746
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrY2FtX2lwaV9o
d19tYXBwaW5nJiMzMjt7DQomZ3Q7JiMzMjsrdThwaXBlX2lkOyYjMzI7LyomIzMyO3JlZi4mIzMy
O3RvJiMzMjttdGtjYW1fcGlwZV9zdWJkZXYmIzMyOyovDQomZ3Q7JiMzMjsrdTE2ZGV2X21hc2s7
JiMzMjsvKiYjMzI7cmVmLiYjMzI7dG8mIzMyO210a2NhbV9waXBlX2RldiYjMzI7Ki8NCiZndDsm
IzMyOyt1OGV4cF9vcmRlcjsNCg0KZXhwX29yZGVyJiMzMjtpcyYjMzI7dXNlbGVzcywmIzMyO3Nv
JiMzMjtkcm9wJiMzMjtpdC4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOyt9JiMzMjtfX3Bh
Y2tlZDsNCiZndDsmIzMyOysNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
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

--__=_Part_Boundary_005_1262221317.1202391746--

