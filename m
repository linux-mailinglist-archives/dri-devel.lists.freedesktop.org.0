Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04271B50F1F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D252010E28A;
	Wed, 10 Sep 2025 07:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ofm8xwrz";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ig/QYBVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF9910E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:19:11 +0000 (UTC)
X-UUID: 6fa0e0f08e1611f0b33aeb1e7f16c2b6-20250910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GlelnyQdOEnpYwuAqKe0mWP1VP8kEmQ2kW3Ygf8yUc8=; 
 b=Ofm8xwrzobfCBC0SzcKNTZUiAC6e9DV4YA7UaTgNJKqBKZ+HipPZjv13yXJIbh6Xc61n4X5947HPDRjkwyXHE7S4FU1EFrdiKb1bHzi1mIXUHz0a9DmU5wP7fRY6fprek1OndFkovlUPhgeFrEX0rRF+g2PKE14ieuciQKFrFmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4, REQID:34624ea7-18e1-4c78-af77-139c509d3bab, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:1ca6b93, CLOUDID:d92c24f8-ebfe-43c9-88c9-80cb93f22ca4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6fa0e0f08e1611f0b33aeb1e7f16c2b6-20250910
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 483948556; Wed, 10 Sep 2025 15:19:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 10 Sep 2025 15:19:04 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 10 Sep 2025 15:19:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM6wptq329WLr2g1tebT2JsGMbq3QgwZn5/bIr02lqilGlsv0YZGlJmKYdS3b2njfkNIqQ94t3tavdpMA4tgLHLj8HkSr+SwKSSlOqtscatX9j80OvCwbHzY+DXxYoHyg0nczRP6foP3XeMHHgMmzfFve9UM3rxBSWlcx6f/9E0+XhDWgdV5D9YPAVpHurbalPTp6fxvJxh4vEvOapyuZwR+TPnDM+jhNFKJV7zEJHyiCOMMEGo/P3U3UAFwYwMkJqMvZ1BNxZkrC/S665FPozxnsOfzdoPGx+RjwsTTKwyKJhlNWnY8W3coVq3Kpwys5i0kPytKcR+iIPX2jVYUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RAOse8FdArGgaTsh4mCqyQP96FXhZNEyRLJQZKU2tQ=;
 b=sPOb1AFveoUAjzcCC0jMTyC4ljO743xQIpa2C1/RYjmTE1PVl0oaoZJYkA+czbDG1BJXHlcjdro6fh8lGyiVKJ7wCx5F7Tuy6mKa5fBxzH6RgruEH+/lCs7M6uPl8OXQI6qNkixCQ1j3YWwRAdX1IwAen/2kcYYYYf6wGlatHcyHcrtGUxA0fuNjjHjf6ZLHs8IdObFt86J407bQtt8RDzDiKJuk07XHdmEarpy2IKvv1DNpOhs9El0ugQlYQyOdTOPO7iYIWZo84lUSpWqFbf0a4UKm3olrd3mZDekymyT9iDulBxrHC8Touo7un5ZBXjyvBu3GOCtFscLysTXYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RAOse8FdArGgaTsh4mCqyQP96FXhZNEyRLJQZKU2tQ=;
 b=Ig/QYBVVPwrGQDF4KXtcCQ464SDUxnJKyvGtjm2XORBGXJEDJJBRPVsRTwkz8YTF/WZJYGi95mmeGzy65TV9g6im6hU4Ihd3OasKTnD2nak/lMKMrWI0AZZztQDNsingHA0sQ4wEIe2ciP7JwIBsjM7GTaHz1gy+D3vqXFZJEQ4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8127.apcprd03.prod.outlook.com (2603:1096:101:165::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:19:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:19:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
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
Subject: Re: [PATCH v4 12/19] drm/mediatek: Export OVL formats definitions and
 format conversion API
Thread-Topic: [PATCH v4 12/19] drm/mediatek: Export OVL formats definitions
 and format conversion API
Thread-Index: AQHcF/ND71iyFDXLXEeHherCl87wzrSMFnQA
Date: Wed, 10 Sep 2025 07:19:00 +0000
Message-ID: <2621389158b89dfa3894f0f4f2ff80019077f729.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-13-paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-13-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8127:EE_
x-ms-office365-filtering-correlation-id: e26d3a3a-90ef-4783-90f0-08ddf03a50d6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M29XK3YyWlQ1Nmd2UUlkenpMYWlEdmtLdTg5SzhwQ1ZBcHNhQ3hxQnlCeXV2?=
 =?utf-8?B?RjFkMGVTczlBYlZ5Rnk1UzE2Y21oWFZhNTdlZmpoak9kaHN1MEo0R0dvbjhU?=
 =?utf-8?B?dEJvaTVRSXNjcjJLNlJCMVdTZGdsQ1R6bDJ4VjlHa2RWc2daSXZXRWI2eHdp?=
 =?utf-8?B?U2xDcU1GaFAzbHc3OEYyUi9RSittUGYwa3ZnWS82SE93M0ZFZlNoK1hsZkVX?=
 =?utf-8?B?V0hVRlZCMHRkSmFHSi9EelFwNTBYODNvQThrdVZSNHlEcGZ5cnJ2cC9IVHNW?=
 =?utf-8?B?UlUzM3VxZHNMRE5xZUZFbEx4b3pMc2E1OC9LQnhPTXFxb2IwbkZFQkRmQ2F1?=
 =?utf-8?B?TCtCcitoNE5HRmt5cG1PVndRUkllWHlyd1RqSHBCSEM1N0pianpLZ2EwNWQz?=
 =?utf-8?B?eDNqS2dUcGo5enpQTGVoK01NdFZ5MDFyN2hoTCtNaTlKZy9LWmRKOFdIa0xO?=
 =?utf-8?B?MGpxMjNEM3hxZ0NLZlRVZDlUclFFVnI3N3hOZnlsa29rY1RGdjEyN3QraEhj?=
 =?utf-8?B?d0lEZEl2VnJEWHBnNThEMG43TCtCVW9uQlFHaUlsbXVBRURwZkRTRE5qcHR6?=
 =?utf-8?B?a0V1TWZxS0pnbTUwSkttcWpENlVXWkpraVlOSytoWHNQZWdlMnczdmFTTXpV?=
 =?utf-8?B?UTZZSWd6dGdBOXdvTGRjNDRsdDFnN3JvYnVMVG1Ia1ljc0R2cHJ2QnNRY09L?=
 =?utf-8?B?MXdjaTY3VzE2NTE5bGUyT3o1dFJFRSt5ei94cGZZU2JzZzk1ZXltaWthMUlX?=
 =?utf-8?B?azJmL2lMR0lrWnRudlRMaDkwTFNyUDE4Q2ZraVZlMmFXbjdZVVdzVHVUa1hN?=
 =?utf-8?B?R1VZRHM0NHdxUE53YXhlV2dPNEczdTRMYk40VlgwdHlwSDJqS05xMk51YStY?=
 =?utf-8?B?U3RpUGxBb2lpTmhRNFpqRElRZmpXeXIxNnd2TG4rUzQ4aFhRak9QS29FZ1NR?=
 =?utf-8?B?QlA4d21ZZHZoeE5FVXJKenV3WlZ4NENvT1BhMnRkR3A4NkhRVnp1S2wyQ3h2?=
 =?utf-8?B?SFVmTVYveFlIaG5tR0dqelhnMlJEL2JHd1hkakhpcmc5aVljT3dyMW5oc1ZI?=
 =?utf-8?B?R25qWW96VU5ES21QeGQzaEt6Tk5tcUFxb2U5enRTWnN2ZVg1bk1ncTFuTGxw?=
 =?utf-8?B?ZS9UclBOc3pSSkRuc3pwT010TEM0a2pUM3ZMNmJkT21DNG5GTE5vNHFYODNU?=
 =?utf-8?B?aGJFS014WEorMXJMNFhheGowenAyZUFaL3dhNkM3d2sreEVFaGp3YVRtS3NH?=
 =?utf-8?B?eWw3TE9vTEpxTmpKcVI0QkRvbjFzeWl0VWtGYWtpSXdYbi9GTmpVR09mdDRB?=
 =?utf-8?B?NWt1VkxFVnZOMSs2Mm5lKzlrK2pSL3AwNW95UHhhWWp3LzBCT3dUZVFTM2p4?=
 =?utf-8?B?eXpqUXA2SGtDd3ExTlRDTlBMdWJiZE93OUpobGJFZDRXbGJyUVZlUnFzMTQ2?=
 =?utf-8?B?bkNid0NqWllOdDgzbGh4WUkxdi9hYzlMTkd5ZkgyWnkxaVlZTVQxLzJoSHJP?=
 =?utf-8?B?REJZKzJNdXl3T0hseGpNRlhjNkNnUjhzaWJzWWVVem1UQzR6MFpiWW9GVUF6?=
 =?utf-8?B?akJsMWxONWVPNXo1d0hFY3pOcWdob3pCeDIvS2xQQkZDV1dDcXI5MmcwOHpX?=
 =?utf-8?B?RXNxMlNWdVNrS3l3S2c3by9MaUl2bWxxS1BmNTYreVZtYmNKa1YwK2hNKzEx?=
 =?utf-8?B?K0ZPZzRWU01Hc0JITTJnUGpWSVY1cHZkTk02L1RKNDFvZzM0U0hWUWMxbnlW?=
 =?utf-8?B?c1czekpoWDZIVHBxdjlHYnoyRWw3cHQyYWRnVkRNZkpYYUZlTC9lSjV4L3Y2?=
 =?utf-8?B?dnJmQ2JQbnpQeWVHQnA4ZVNxTWYvVnBma2pHVDNEZ1kzcWRoOVlLUnk4RmdG?=
 =?utf-8?B?SC9jK0R6SFdpS1k5TFh1eU5PSlZaT051cXhPUGp4a09veWxWN3RBQ2tTZm9v?=
 =?utf-8?B?SUhmNEM2VU1Tb2YzS3ZvWllNZDd3dWtLb2s1Zkh3eCtoT1NSZUwzQjIzS3Bt?=
 =?utf-8?B?aFBvMWxJU1l3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7416014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlUxcGMzemx2L3FLZXVkVHFUaGRLL2pISHVjMjJINE85aXFRREN0TlVKMFoz?=
 =?utf-8?B?RmZYTVUrQURPYit1SDdzR0EvVGxCRTRvekYzQVNoODVRSWdxNmdWbjhad2c2?=
 =?utf-8?B?aDJXTjRvN3pIbHpweGpGSEE0ZTdSaWdwRXRiREswVFU5RE9zOXJ1NVg0TU1B?=
 =?utf-8?B?SzJodzZxdEJzaDRSTVNTYmNYVmdEVnl4RXJmYXEwcExDaUxvUmhCVXhCRHZG?=
 =?utf-8?B?SVBMa3hQVlI1a1R0NmpUSjFGTG12M0tldERJMUx4Q0xKcDUwRU9lUWMwT1da?=
 =?utf-8?B?dkpkekQ2amRYUjJ5dzF3Q0FMZlN0citKOXhqWjE3RmE3aEZ5M05kNFp5NTRo?=
 =?utf-8?B?Qk11ODZuSUZjNFRqZC9aQ1pvL3YyYlMrSXlJeVpIbXM0RUNzeDZHdW1ZRUJQ?=
 =?utf-8?B?b1EveTh5RXZ1bkhoOWk3NmY2VGxYN0ZQNGhWQU9ic0Y2dmEyVmhZMHo5SGk0?=
 =?utf-8?B?aGRhSDlYQ2E3RGNHZWpnWHJidkpHOSs1ZVhxR2ozTTR5UWgvTVFmVmdCNzY2?=
 =?utf-8?B?NUNGOUk3VlN4Rnh2VlJwcmRWa055elMzVTlMR1hpMERSd1Vtam5Qb3ArTXVt?=
 =?utf-8?B?ZE9IRThUUXBqc1p2Y0xienhRUE10cWEwQ3BVeHBsWWJaZXhiblFFN3hNVFRt?=
 =?utf-8?B?U1ZDd0M1L1hJTVRVN1UxMEF3MFp2V21aWC9XWkE4aUVoSlc5QTNTQUFxVUZY?=
 =?utf-8?B?a2NVS1M4eW1iZ2Q1R2h3V2FKWXNSbjJSNWRqclV1MDNucjJ2dUxBM2pUY21F?=
 =?utf-8?B?L3Q1aGJYNHBrM2RYd2pUYk1hNkJZcGJuK3FlNGVLamhrTWlLd0owVkRUVG5H?=
 =?utf-8?B?L0o5bzJubk5LaXBPR0hNb2xNVElDTFA2Yjd0VllDdFJNMXgzZm84RlhPV3Ju?=
 =?utf-8?B?SW9DR1RVTjA5ZWpkcmN2TnZBa2hNRXhOZVBFVjZ3YnlFeHJmRUkzaVVRcFJX?=
 =?utf-8?B?aDVsRXVZdkcrR3hwYS9LTm9jaHptWlJ6aVBnT0hZcm5qNXNaVHVkaFVFKzZo?=
 =?utf-8?B?bUlBcUc4WE0zdmtnbnVVZml0bDU0VkJIM3dzTzNEenlkU2NCbTZpcTJkSWtp?=
 =?utf-8?B?NyttUjg0SHhsOFZ4U1ljMEZzcDFNalZianBwUFd2RHhMQnQ4Uk1xM0pxeWpH?=
 =?utf-8?B?MVZ1M3l1UEltRU94WFpKSFFxaHhrZlE2TXZvZ01VQkJ1akdHdTdEdUJyUkRK?=
 =?utf-8?B?QW5xTy9QcWUvZUV2VHpoNGdCSDd4czlVTHdnNXpRdUFuaTNvYWhiUDcza2xV?=
 =?utf-8?B?SWcwTmJjaDZNMTRvT005YXFRMWdRR0ZOZHV0NGh4dE5ESy81U1Zqb1EyTWlU?=
 =?utf-8?B?ZittSDQ4STJKZVY0bTJKYW9zck8vc0ZoOUJwd01zZVNUbzFMTk1xaU9Sbk16?=
 =?utf-8?B?Q2s5VUR3ZTkrbzUwMG5WUlpWRVdLZ0xnU0RxQXByT2pZa3pzanVLUnEzeU93?=
 =?utf-8?B?dmxnMFo4Nm1Hbld5OHhza2wyV1M3TGpqeTlzVm5nV3U4Z0J1UW12QUdVdDFq?=
 =?utf-8?B?WnJLU3BFMTZWRzdBbUZDMjAvS2VEWEVZTzQ1TnFWTXd0Z3R2TWZLRUVFWWly?=
 =?utf-8?B?czNTcmtYZmN0aklvVlk1WG1WL3d4VzY1VTVBNyszMk92NWJNUXA5Yk9BYjdr?=
 =?utf-8?B?VVNiVFlpZWYrWm1mdjRONi9BN0hvWTRPT1lwUG8zQWJ1RE9jbTlNQ1BiOXdm?=
 =?utf-8?B?OUViWjNWaXNweDg1NHFlZll5T0RHQkkyc2JNMWxJWVc3VmFoNEk5ZmpMYy9t?=
 =?utf-8?B?TElieE9paytRQS9LbHROUmtteDBlanpSbGlDanRkNnc1THIwWFN6Wk1NN2Vl?=
 =?utf-8?B?SmZVdDltcUltcUtxRHhrSTRtaktOUmVweXpnVlNXbUFORlQzYUlRMWFsZW81?=
 =?utf-8?B?RElvWS93cXgwcis4V1I1YzJIQk40ZE1QazVib1ZwU2prQ1phNUJYQVhQTmNK?=
 =?utf-8?B?Ny9BRkc3cmVpUklXdGRLKy8zaUU2cU12MnM3R2hVd1FtNklqeEo5bktBY0d0?=
 =?utf-8?B?N2VOdUFNOVVkcXNvZTRWZzZtS3RVSlpmU2NEY0piS0pQTWR5UzZjU3VvT1Bi?=
 =?utf-8?B?alVkNmwxYlpNN05jZEp4aTZTYnZXOEY3Q1pvVGF3aUQvVG9CSlRqNlZQZWRG?=
 =?utf-8?B?TGRGYkJ1amVDMGx4V1J2a0tKdFJTbnhscjlpdmZqUFhsZ1A1MVlsVFR5eE12?=
 =?utf-8?B?NlE9PQ==?=
Content-ID: <8167E5119BA4CF4F9498CF9D94F0AF4F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26d3a3a-90ef-4783-90f0-08ddf03a50d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 07:19:01.0908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUbL2LomcQgQ4rfVpKc6/m1SJIDowgQIlEBGGkBAB2uSc0bQBySfkXFPUiFxx7wgJVrQ+3Y61MvpkFwCpD0mhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8127
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1372953639.1607440260"
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

--__=_Part_Boundary_004_1372953639.1607440260
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6DQo+IEZy
b206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEluIHVwY29taW5n
IFNvQ3MsIHRoZSBPVkwgY29tcG9uZW50IHdpbGwgYmUgZGl2aWRlZCBpbnRvIG11bHRpcGxlDQo+
IHNtYWxsZXIgaGFyZHdhcmUgdW5pdHMgdG8gZW5oYW5jZSBmbGV4aWJpbGl0eS4gVG8gZmFjaWxp
dGF0ZSB0aGlzDQo+IHRyYW5zaXRpb24sIHRoZSBPVkwgZm9ybWF0IGRlZmluaXRpb25zIGFuZCBm
b3JtYXQgY29udmVyc2lvbiBBUEkNCj4gc2hvdWxkIGJlIGV4cG9ydGVkIGZvciByZXVzZSBhY3Jv
c3MgdGhlc2UgdW5pdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeSBMaW4gPG5hbmN5Lmxp
bkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5j
aGVuQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICANCj4gK2Jvb2wgbXRrX292
bF9pc18xMGJpdF9yZ2IodW5zaWduZWQgaW50IGZtdCkNCg0KWW91IGFkZCBtdGtfb3ZsX2lzXzEw
Yml0X3JnYigpIGhlcmUsIHNvIHlvdSBzaG91bGQgcmVtb3ZlIGlzXzEwYml0X3JnYigpLg0KDQo+
ICt7DQo+ICsJc3dpdGNoIChmbXQpIHsNCj4gKwljYXNlIERSTV9GT1JNQVRfWFJHQjIxMDEwMTA6
DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FSR0IyMTAxMDEwOg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9S
R0JYMTAxMDEwMjoNCj4gKwljYXNlIERSTV9GT1JNQVRfUkdCQTEwMTAxMDI6DQo+ICsJY2FzZSBE
Uk1fRk9STUFUX1hCR1IyMTAxMDEwOg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9BQkdSMjEwMTAxMDoN
Cj4gKwljYXNlIERSTV9GT1JNQVRfQkdSWDEwMTAxMDI6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0JH
UkExMDEwMTAyOg0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKwl9DQo+ICsJcmV0dXJuIGZhbHNlOw0K
PiArfQ0KPiArDQoNCltzbmlwXQ0KDQo+ICBzdGF0aWMgdm9pZCBtdGtfb3ZsX2FmYmNfbGF5ZXJf
Y29uZmlnKHN0cnVjdCBtdGtfZGlzcF9vdmwgKm92bCwNCj4gQEAgLTUxMSw3ICs1NTAsMTUgQEAg
dm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGlu
dCBpZHgsDQo+ICAJCXJldHVybjsNCj4gIAl9DQo+ICANCj4gLQljb24gPSBtdGtfb3ZsX2ZtdF9j
b252ZXJ0KG92bCwgc3RhdGUpOw0KPiArCWlmIChvdmwtPmRhdGEtPmJsZW5kX21vZGVzICYgQklU
KERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJKSkNCj4gKwkJY29uID0gbXRrX292bF9mbXRfY29udmVy
dChmbXQsIGJsZW5kX21vZGUsDQo+ICsJCQkJCSAgb3ZsLT5kYXRhLT5mbXRfcmdiNTY1X2lzXzAs
IHRydWUsIDEyLA0KDQpXaHkgY29sb3JfY29udmVydCBpcyB0cnVlIGZvciBhbGwgZm10Pw0KSW4g
b3JpZ2luYWwgY29kZSwgb25seSBZVVYgZm9ybWF0IHdvdWxkIGRvIGNvbG9yIGNvbnZlcnQuDQoN
Cj4gKwkJCQkJICBPVkxfQ09OX0NMUkZNVF9NQU4sIE9WTF9DT05fQllURV9TV0FQLCBPVkxfQ09O
X1JHQl9TV0FQKTsNCj4gKwllbHNlDQo+ICsJCWNvbiA9IG10a19vdmxfZm10X2NvbnZlcnQoZm10
LCBEUk1fTU9ERV9CTEVORF9DT1ZFUkFHRSwNCj4gKwkJCQkJICBvdmwtPmRhdGEtPmZtdF9yZ2I1
NjVfaXNfMCwgdHJ1ZSwgMTIsDQoNClN5bWJvbGl6ZSAxMi4gTWF5YmUNCg0KI2RlZmluZSBPVkxf
Q09OX0NMUkZNVF9TSElGVCAxMg0KDQo+ICsJCQkJCSAgT1ZMX0NPTl9DTFJGTVRfTUFOLCBPVkxf
Q09OX0JZVEVfU1dBUCwgT1ZMX0NPTl9SR0JfU1dBUCk7DQo+ICsNCj4gIAlpZiAoc3RhdGUtPmJh
c2UuZmIpIHsNCj4gIAkJY29uIHw9IHN0YXRlLT5iYXNlLmFscGhhICYgT1ZMX0NPTl9BTFBIQTsN
Cj4gIA0KPiBAQCAtNjY4LDcgKzcxNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bf
b3ZsX2RhdGEgbXQyNzAxX292bF9kcml2ZXJfZGF0YSA9IHsNCj4gIAkubGF5ZXJfbnIgPSA0LA0K
PiAgCS5mbXRfcmdiNTY1X2lzXzAgPSBmYWxzZSwNCj4gIAkuZm9ybWF0cyA9IG10ODE3M19vdmxf
Zm9ybWF0cywNCj4gLQkubnVtX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKG10ODE3M19vdmxfZm9ybWF0
cyksDQo+ICsJLm51bV9mb3JtYXRzID0gbXQ4MTczX292bF9mb3JtYXRzX2xlbiwNCj4gIH07DQo+
ICANCg0KW3NuaXBdDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuaA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjRmNDQ2ZDJlMDcx
Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuaA0KPiBAQCAtMCwwICsxLDIxIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5ICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChjKSAyMDI1IE1l
ZGlhVGVrIEluYy4NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fTVRLX0RJU1BfT1ZMX0hfXw0K
PiArI2RlZmluZSBfX01US19ESVNQX09WTF9IX18NCj4gKw0KPiArI2luY2x1ZGUgPGRybS9kcm1f
Zm91cmNjLmg+DQo+ICsNCj4gK2V4dGVybiBjb25zdCB1MzIgbXQ4MTczX292bF9mb3JtYXRzW107
DQoNCk5vIG90aGVyIGZpbGUgbmVlZCBtdDgxNzNfb3ZsX2Zvcm1hdHNbXSwgc28gZG8gbm90IGV4
cG9ydCBpdC4NCg0KPiArZXh0ZXJuIGNvbnN0IHNpemVfdCBtdDgxNzNfb3ZsX2Zvcm1hdHNfbGVu
Ow0KPiArZXh0ZXJuIGNvbnN0IHUzMiBtdDgxOTVfb3ZsX2Zvcm1hdHNbXTsNCj4gK2V4dGVybiBj
b25zdCBzaXplX3QgbXQ4MTk1X292bF9mb3JtYXRzX2xlbjsNCj4gKw0KPiArYm9vbCBtdGtfb3Zs
X2lzXzEwYml0X3JnYih1bnNpZ25lZCBpbnQgZm10KTsNCj4gK3Vuc2lnbmVkIGludCBtdGtfb3Zs
X2ZtdF9jb252ZXJ0KHVuc2lnbmVkIGludCBmbXQsIHVuc2lnbmVkIGludCBibGVuZF9tb2RlLA0K
PiArCQkJCSBib29sIGZtdF9yZ2I1NjVfaXNfMCwgYm9vbCBjb2xvcl9jb252ZXJ0LA0KPiArCQkJ
CSB1OCBjbHJmbXRfc2hpZnQsIHUzMiBjbHJmbXRfbWFuLCB1MzIgYnl0ZV9zd2FwLCB1MzIgcmdi
X3N3YXApOw0KPiArDQo+ICsjZW5kaWYNCg0K

--__=_Part_Boundary_004_1372953639.1607440260
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDgtMjgmIzMyO2F0
JiMzMjsxNjowNyYjMzI7KzA4MDAsJiMzMjtQYXVsJiMzMjtDaGVuJiMzMjt3cm90ZToNCiZndDsm
IzMyO0Zyb206JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGluQG1lZGlhdGVrLmNv
bSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SW4mIzMyO3VwY29taW5nJiMzMjtTb0NzLCYjMzI7
dGhlJiMzMjtPVkwmIzMyO2NvbXBvbmVudCYjMzI7d2lsbCYjMzI7YmUmIzMyO2RpdmlkZWQmIzMy
O2ludG8mIzMyO211bHRpcGxlDQomZ3Q7JiMzMjtzbWFsbGVyJiMzMjtoYXJkd2FyZSYjMzI7dW5p
dHMmIzMyO3RvJiMzMjtlbmhhbmNlJiMzMjtmbGV4aWJpbGl0eS4mIzMyO1RvJiMzMjtmYWNpbGl0
YXRlJiMzMjt0aGlzDQomZ3Q7JiMzMjt0cmFuc2l0aW9uLCYjMzI7dGhlJiMzMjtPVkwmIzMyO2Zv
cm1hdCYjMzI7ZGVmaW5pdGlvbnMmIzMyO2FuZCYjMzI7Zm9ybWF0JiMzMjtjb252ZXJzaW9uJiMz
MjtBUEkNCiZndDsmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO2V4cG9ydGVkJiMzMjtmb3ImIzMyO3Jl
dXNlJiMzMjthY3Jvc3MmIzMyO3RoZXNlJiMzMjt1bml0cy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7
U2lnbmVkLW9mZi1ieTomIzMyO05hbmN5JiMzMjtMaW4mIzMyOyZsdDtuYW5jeS5saW5AbWVkaWF0
ZWsuY29tJmd0Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1BhdWwtcGwmIzMyO0NoZW4m
IzMyOyZsdDtwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K2Jvb2wmIzMyO210a19vdmxfaXNfMTBi
aXRfcmdiKHVuc2lnbmVkJiMzMjtpbnQmIzMyO2ZtdCkNCg0KWW91JiMzMjthZGQmIzMyO210a19v
dmxfaXNfMTBiaXRfcmdiKCkmIzMyO2hlcmUsJiMzMjtzbyYjMzI7eW91JiMzMjtzaG91bGQmIzMy
O3JlbW92ZSYjMzI7aXNfMTBiaXRfcmdiKCkuDQoNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrc3dp
dGNoJiMzMjsoZm10KSYjMzI7ew0KJmd0OyYjMzI7K2Nhc2UmIzMyO0RSTV9GT1JNQVRfWFJHQjIx
MDEwMTA6DQomZ3Q7JiMzMjsrY2FzZSYjMzI7RFJNX0ZPUk1BVF9BUkdCMjEwMTAxMDoNCiZndDsm
IzMyOytjYXNlJiMzMjtEUk1fRk9STUFUX1JHQlgxMDEwMTAyOg0KJmd0OyYjMzI7K2Nhc2UmIzMy
O0RSTV9GT1JNQVRfUkdCQTEwMTAxMDI6DQomZ3Q7JiMzMjsrY2FzZSYjMzI7RFJNX0ZPUk1BVF9Y
QkdSMjEwMTAxMDoNCiZndDsmIzMyOytjYXNlJiMzMjtEUk1fRk9STUFUX0FCR1IyMTAxMDEwOg0K
Jmd0OyYjMzI7K2Nhc2UmIzMyO0RSTV9GT1JNQVRfQkdSWDEwMTAxMDI6DQomZ3Q7JiMzMjsrY2Fz
ZSYjMzI7RFJNX0ZPUk1BVF9CR1JBMTAxMDEwMjoNCiZndDsmIzMyOytyZXR1cm4mIzMyO3RydWU7
DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7K3JldHVybiYjMzI7ZmFsc2U7DQomZ3Q7JiMzMjsrfQ0K
Jmd0OyYjMzI7Kw0KDQpbc25pcF0NCg0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMy
O210a19vdmxfYWZiY19sYXllcl9jb25maWcoc3RydWN0JiMzMjttdGtfZGlzcF9vdmwmIzMyOypv
dmwsDQomZ3Q7JiMzMjtAQCYjMzI7LTUxMSw3JiMzMjsrNTUwLDE1JiMzMjtAQCYjMzI7dm9pZCYj
MzI7bXRrX292bF9sYXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt1
bnNpZ25lZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO3JldHVybjsNCiZndDsmIzMy
OyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1jb24mIzMyOz0mIzMyO210a19vdmxf
Zm10X2NvbnZlcnQob3ZsLCYjMzI7c3RhdGUpOw0KJmd0OyYjMzI7K2lmJiMzMjsob3ZsLSZndDtk
YXRhLSZndDtibGVuZF9tb2RlcyYjMzI7JmFtcDsmIzMyO0JJVChEUk1fTU9ERV9CTEVORF9QUkVN
VUxUSSkpDQomZ3Q7JiMzMjsrY29uJiMzMjs9JiMzMjttdGtfb3ZsX2ZtdF9jb252ZXJ0KGZtdCwm
IzMyO2JsZW5kX21vZGUsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO292bC0mZ3Q7ZGF0YS0mZ3Q7Zm10
X3JnYjU2NV9pc18wLCYjMzI7dHJ1ZSwmIzMyOzEyLA0KDQpXaHkmIzMyO2NvbG9yX2NvbnZlcnQm
IzMyO2lzJiMzMjt0cnVlJiMzMjtmb3ImIzMyO2FsbCYjMzI7Zm10JiM2MzsNCkluJiMzMjtvcmln
aW5hbCYjMzI7Y29kZSwmIzMyO29ubHkmIzMyO1lVViYjMzI7Zm9ybWF0JiMzMjt3b3VsZCYjMzI7
ZG8mIzMyO2NvbG9yJiMzMjtjb252ZXJ0Lg0KDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO09WTF9DT05f
Q0xSRk1UX01BTiwmIzMyO09WTF9DT05fQllURV9TV0FQLCYjMzI7T1ZMX0NPTl9SR0JfU1dBUCk7
DQomZ3Q7JiMzMjsrZWxzZQ0KJmd0OyYjMzI7K2NvbiYjMzI7PSYjMzI7bXRrX292bF9mbXRfY29u
dmVydChmbXQsJiMzMjtEUk1fTU9ERV9CTEVORF9DT1ZFUkFHRSwNCiZndDsmIzMyOysmIzMyOyYj
MzI7b3ZsLSZndDtkYXRhLSZndDtmbXRfcmdiNTY1X2lzXzAsJiMzMjt0cnVlLCYjMzI7MTIsDQoN
ClN5bWJvbGl6ZSYjMzI7MTIuJiMzMjtNYXliZQ0KDQojZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZN
VF9TSElGVCYjMzI7MTINCg0KJmd0OyYjMzI7KyYjMzI7JiMzMjtPVkxfQ09OX0NMUkZNVF9NQU4s
JiMzMjtPVkxfQ09OX0JZVEVfU1dBUCwmIzMyO09WTF9DT05fUkdCX1NXQVApOw0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHN0YXRlLSZndDtiYXNlLmZiKSYjMzI7ew0KJmd0OyYj
MzI7JiMzMjtjb24mIzMyO3w9JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5hbHBoYSYjMzI7JmFtcDsmIzMy
O09WTF9DT05fQUxQSEE7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7QEAmIzMyOy02NjgsNyYj
MzI7KzcxNSw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtf
ZGlzcF9vdmxfZGF0YSYjMzI7bXQyNzAxX292bF9kcml2ZXJfZGF0YSYjMzI7PSYjMzI7ew0KJmd0
OyYjMzI7JiMzMjsubGF5ZXJfbnImIzMyOz0mIzMyOzQsDQomZ3Q7JiMzMjsmIzMyOy5mbXRfcmdi
NTY1X2lzXzAmIzMyOz0mIzMyO2ZhbHNlLA0KJmd0OyYjMzI7JiMzMjsuZm9ybWF0cyYjMzI7PSYj
MzI7bXQ4MTczX292bF9mb3JtYXRzLA0KJmd0OyYjMzI7LS5udW1fZm9ybWF0cyYjMzI7PSYjMzI7
QVJSQVlfU0laRShtdDgxNzNfb3ZsX2Zvcm1hdHMpLA0KJmd0OyYjMzI7Ky5udW1fZm9ybWF0cyYj
MzI7PSYjMzI7bXQ4MTczX292bF9mb3JtYXRzX2xlbiwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsm
IzMyOyYjMzI7DQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmgmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5oDQomZ3Q7JiMzMjtuZXcmIzMyO2ZpbGUmIzMyO21vZGUm
IzMyOzEwMDY0NA0KJmd0OyYjMzI7aW5kZXgmIzMyOzAwMDAwMDAwMDAwMC4uNGY0NDZkMmUwNzEy
DQomZ3Q7JiMzMjstLS0mIzMyOy9kZXYvbnVsbA0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuaA0KJmd0OyYjMzI7QEAmIzMyOy0wLDAmIzMy
OysxLDIxJiMzMjtAQA0KJmd0OyYjMzI7Ky8qJiMzMjtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjom
IzMyO0dQTC0yLjAtb25seSYjMzI7Ki8NCiZndDsmIzMyOysvKg0KJmd0OyYjMzI7KyYjMzI7KiYj
MzI7Q29weXJpZ2h0JiMzMjsoYykmIzMyOzIwMjUmIzMyO01lZGlhVGVrJiMzMjtJbmMuDQomZ3Q7
JiMzMjsrJiMzMjsqLw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyNpZm5kZWYmIzMyO19fTVRLX0RJ
U1BfT1ZMX0hfXw0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO19fTVRLX0RJU1BfT1ZMX0hfXw0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7KyNpbmNsdWRlJiMzMjsmbHQ7ZHJtL2RybV9mb3VyY2MuaCZndDsN
CiZndDsmIzMyOysNCiZndDsmIzMyOytleHRlcm4mIzMyO2NvbnN0JiMzMjt1MzImIzMyO210ODE3
M19vdmxfZm9ybWF0c1tdOw0KDQpObyYjMzI7b3RoZXImIzMyO2ZpbGUmIzMyO25lZWQmIzMyO210
ODE3M19vdmxfZm9ybWF0c1tdLCYjMzI7c28mIzMyO2RvJiMzMjtub3QmIzMyO2V4cG9ydCYjMzI7
aXQuDQoNCiZndDsmIzMyOytleHRlcm4mIzMyO2NvbnN0JiMzMjtzaXplX3QmIzMyO210ODE3M19v
dmxfZm9ybWF0c19sZW47DQomZ3Q7JiMzMjsrZXh0ZXJuJiMzMjtjb25zdCYjMzI7dTMyJiMzMjtt
dDgxOTVfb3ZsX2Zvcm1hdHNbXTsNCiZndDsmIzMyOytleHRlcm4mIzMyO2NvbnN0JiMzMjtzaXpl
X3QmIzMyO210ODE5NV9vdmxfZm9ybWF0c19sZW47DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrYm9v
bCYjMzI7bXRrX292bF9pc18xMGJpdF9yZ2IodW5zaWduZWQmIzMyO2ludCYjMzI7Zm10KTsNCiZn
dDsmIzMyOyt1bnNpZ25lZCYjMzI7aW50JiMzMjttdGtfb3ZsX2ZtdF9jb252ZXJ0KHVuc2lnbmVk
JiMzMjtpbnQmIzMyO2ZtdCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2JsZW5kX21vZGUsDQom
Z3Q7JiMzMjsrJiMzMjtib29sJiMzMjtmbXRfcmdiNTY1X2lzXzAsJiMzMjtib29sJiMzMjtjb2xv
cl9jb252ZXJ0LA0KJmd0OyYjMzI7KyYjMzI7dTgmIzMyO2NscmZtdF9zaGlmdCwmIzMyO3UzMiYj
MzI7Y2xyZm10X21hbiwmIzMyO3UzMiYjMzI7Ynl0ZV9zd2FwLCYjMzI7dTMyJiMzMjtyZ2Jfc3dh
cCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrI2VuZGlmDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5
PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFU
RUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5m
b3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkg
DQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVn
ZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxl
IGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWdu
YXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9u
LCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGlu
dGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_004_1372953639.1607440260--

