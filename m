Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A391452E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 10:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E2210E33B;
	Mon, 24 Jun 2024 08:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kY++2dgz";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EY0GuHjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B774710E33B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:44:12 +0000 (UTC)
X-UUID: eb23beb4320511ef99dc3f8fac2c3230-20240624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Z9h9chdXCYmqMv+GLAZKgvsgR+RqUzV7vmvaClu/F5o=; 
 b=kY++2dgze7uN0pVI+pSrG9fQqWgcWoE6GhOeHwovOQsBJtvPKsaeiWbqsE/2gzuHj1gKNIFRroLcrKDGIor9S+gglps57KgpYuXrx8M4Z2D4dyk18rDyD7rbVKhweZc23bH70qx/hxjLbeYdJe7is/0HB5T57HVed5MZ++S7AFk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:ed607209-2221-41ad-a63c-914bcd09c940, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:d6a47585-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: eb23beb4320511ef99dc3f8fac2c3230-20240624
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 168238495; Mon, 24 Jun 2024 16:44:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Jun 2024 16:44:04 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 24 Jun 2024 16:44:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSrK/6OpOTLHlZVT3liVQnxOnhwNKMXq9I8D9M6xOiqhWVKF5SH5QsNfEeBIdMyZkxLV4MjS6SIldp/jaY4RVvjU5oQxkIdzzl1chgSSod969pop9jDIwo3ZDDdi3p+aG06yFKdONq/iq2AFq+SRqLe5vWV2OE61FYnx1I+e1sTXUNgT6mi09xPx+heH3N164S+yWAuoQE13CvC2C90TftDyXc0XeL/y/Nu/8p8tgXSWUBQ4dsI0r+Tq3NbImDO4KrkTn7NsILGSKptL6drnIx1jY5uhi1CCINMs7akT5oChXUg0nj23QjrLQ0wYglAlOWVNdd9hmyESIZ71D+gxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+R4TIlydi6wOHw0xgc3o9fWu7D9G2f5qNyMV2ZSYGU=;
 b=ZweX8l4SX5L8Vr+tJEj9P16DepGaj1+1kSQ/En667WjwRPQGu6jYi4R/zd25WoZwOlc1lY1znOyRlGVfI1j0zmDA4DR7BP6kW/VuXvuiVWUHbp/NAe0o8DiE4mtZGR6o7p8fplpaCBI5f6knWuoH9zGjr4WO+eQCe0hQnv6DERG0WR7NwR7B45I5Wa4IonKoNkClDVel15okch/VK5Ip6vyuD8h+thRdVau9/aDjcmZuybXyR1gQ2fnIsyJDAsb8srVCCydBuV+vj7zHekBObOCHqrWs+OLGeUZlMCT1FQIHr7OxRYYZUeGqbutBaW+5wGzu/KduRBg+S4JPNXm+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+R4TIlydi6wOHw0xgc3o9fWu7D9G2f5qNyMV2ZSYGU=;
 b=EY0GuHjYgcd9/6A44XwezkkKfSV7k5M03cAlIKf/hZ71+B7Tdw/R9j7egrhQwujfSPrvsOiB7K8tDmGcRrOjxNxIT+FR+iLI2CoC1oMLVrKywV3RSAWIgVasf5pRi8xkQ92tyd2Uub9N42DPiLBqvSiJ8KaEW9PWwTnV3mOHm5g=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6962.apcprd03.prod.outlook.com (2603:1096:101:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Mon, 24 Jun
 2024 08:44:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7677.030; Mon, 24 Jun 2024
 08:44:02 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason-jh.lin@mediatek.corp-partner.google.com"
 <jason-jh.lin@mediatek.corp-partner.google.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Topic: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Index: AQHarvtlcrCnuWURZEyY7i7vRSJzi7GrIE8AgAEfYoCAA6bygIAAGI2AgBJh9oCAD7PtgIAEskcA
Date: Mon, 24 Jun 2024 08:44:02 +0000
Message-ID: <f8a151ea4cc9772cf5600eca14c8787640a69c93.camel@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
 <20240527-determined-sage-piculet-bfec4a@houat>
 <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
 <20240530-inventive-nippy-bee-bb6fa6@houat>
 <43db5c0959b387ff049dbd285093b076ed1421fa.camel@mediatek.com>
 <705eb69997333ffaf6efec053e376243a3c80265.camel@mediatek.com>
 <20240621-colossal-acoustic-cassowary-ee8d05@houat>
In-Reply-To: <20240621-colossal-acoustic-cassowary-ee8d05@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6962:EE_
x-ms-office365-filtering-correlation-id: 369fc0d8-e7ca-4739-ec4e-08dc9429cc6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|7416011|366013|376011|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?VnJ4VWw0bVZIdUNWQ1hmaS92clpUbDBEYm1BVFduMjJIMkpKaEtVWmZWV3dQ?=
 =?utf-8?B?Y1crNDcrb2tSbjFpUWJoNUlhN2M0UmtmZkhqVDhXbjhsUnZZYTFha1ZKYng1?=
 =?utf-8?B?NUZoQ2tNcnBBaUZjN2xlQmtOQS92Ylc4OHlMNjdlTm5DVVVFQU9WMVl4MVNX?=
 =?utf-8?B?NG03elVndTd1bFRrQnM5cGd6aGVKZHVqYlVtRXRYd3BON1p2dWtjcUIra1Bi?=
 =?utf-8?B?STNiSFVHN1lyTTVzaWtKdEJoYmRuMXRxcDgxbEJiVzgwWklDOW9UYWNzdXJP?=
 =?utf-8?B?aEZacThMd1JVVkRUbU9RSVAzaVdoZ0sxQitvZUNiZzBoeHlYUTZDYjZVcVRa?=
 =?utf-8?B?U1dMYmZDSkQydU9ZR0pTMUM0K3RHM2FnYXFidDJ5bXU5ejNCT0JNRXB6eEhm?=
 =?utf-8?B?d2pWRzUrT0Y1QzIxbkhTUmVRcTBKdUhmZnNPWXNIU1RPbWllcUN1S2NoREhz?=
 =?utf-8?B?SEVvSk8wREVuVnlaenFHUnJ2WXdqY1FIMmhrY1A1RlU4TVh1N3Z1NjJjOTF3?=
 =?utf-8?B?V3o2MlVBTi9hZ3hXMFhUR0tyQU5WYlY2VjJ6emJ5d3lxMFpBZDlaUDljVmVR?=
 =?utf-8?B?ZDN0SGRrVWlETGh0cDZGd1YvbG5yTFBVUjcyVTExTm4waWlWVUQrQU91dXYr?=
 =?utf-8?B?TkxnaUY0ckdZQTgzK3pKTmpNKzZaYVBoSkpxTFMyMGVCL0hVS2pLWTBBS2or?=
 =?utf-8?B?T1g0emtBcU02L1ovc2Q4MUdsek5ydHUxUTVZZllhRUgrWGZkSWVwMzNCYnJu?=
 =?utf-8?B?VGJNdWo2MllHUGpmSndiS1U2VHpmU3ZOZm5iY2NadE9wTk5hTWZsZWhwbDZl?=
 =?utf-8?B?eHYweXdOUG1oOGpjQVlmZ0ZyRCtrWWo0eXFmUEdkMTZLZ2NJanVLZTRtcjNB?=
 =?utf-8?B?bXcwWGFmRWxGZStXMVpMVnF3RGNlTlllTWpHaVFna3VYOHE2NHN3SFhpQy9R?=
 =?utf-8?B?cEYwcEhuaCtSRWhPZ0FmelI0QkZaNEMrNjhtN1N0RGdJK1dGeUxoR2pqVEdH?=
 =?utf-8?B?bFkvQ0tkMDJOUXlXRDcwZXoxbGM1a2poODlYSjhSRG1jRHJYamZTdFo1WlZm?=
 =?utf-8?B?MkNzcjMzWTBNMzZrYzFKUWRBdy94RForOGFETmVRYjVUL3E2YytremovS0hL?=
 =?utf-8?B?NkRuSkVqUXhiT0h0TWZJWU0vNFpOUEpRWU13NG5DOVFBd3JnY3JGQU4zU25B?=
 =?utf-8?B?YU53dlZjVXg1Q0p0VDRwUU01eWtPdldoRG9zMCtaZ1Z0SXN6emhPZlppWnd3?=
 =?utf-8?B?M2dKc0F4L3E0QkhQZUQzcGRvWHNtTy9sNTRrT1dSa3lRRkFLZVlhMUcwajU3?=
 =?utf-8?B?RWJZWTlRQi84Q3BYVFFVR0hnSFpSZk5LVW42M3MycEpXMjc1dEkrTUxTZE9E?=
 =?utf-8?B?RG9vVDJYQzFyako1dXhteERUQ1VHZTM4TWhJTVpPQjQ5OFJ1ZmNRWWdzeitj?=
 =?utf-8?B?Ty95am5CQmFwaUU1RG5sVE1DVFNjZ29KZ1l0ZHF4Q2JiNHo0dURidFlKY2Ny?=
 =?utf-8?B?Wk43UkJZOHJhNmZhckFMazFVS2kxb1BBdWkyWGRleWs1WUVJVnNnMmc2Yi9I?=
 =?utf-8?B?aFJDSVpIQWhCNkZaTlczRTJKbUc2OXRRYnpDdkZHTVlUS3RLaFZTQlJ3akZw?=
 =?utf-8?B?dzlxTEJLRXA1bC9xaEpRT3hMT0FEWXFEZ2xjQUQ4ZUc0NlpXOVNqMlF2ZkNj?=
 =?utf-8?B?NnBweXBwTWFiSWdteXRibC9nUzlSZWl3YkRCaGZ3eWdqVUhiWS9KcFNPRDVi?=
 =?utf-8?Q?AwCGNbC3dZrPoLcCDezUdpICyae+ioTK0LA7FC5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(7416011)(366013)(376011)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmRhWDZLS3g5ZmhkOG85ZHl6cnV6YW1OejYxR3pOQzg1RE4valZiUW1UbXVo?=
 =?utf-8?B?VlZDMVg5dUgwM2UxemFLZm81Yk5xY2RCcjhtZy9sS1pGaC9vbGVrQVhzOUVH?=
 =?utf-8?B?MHNUWklIUHFUb2ZoN2s1elp3NVpZcE5Sdm4zK1NGeG4xcDR0OXFPbVgyYU4v?=
 =?utf-8?B?WStGb1Exa0pQYnZoQnFQem9FNDZ3dmN4Rk9FWDlpQUMrQXJkVE5lYVVMeCtv?=
 =?utf-8?B?OGxMT01DVThYLzl3Zm1Dc2xlZ3RiWmNXZVFhZlo5T0VyYXFJNHFPeFNhTUJy?=
 =?utf-8?B?dUpuZUlKMHRLeHBieWUwdUIxMHVvUTNvQjFwTDZtblJ0VWtRb1UxZDZkTFBH?=
 =?utf-8?B?NGIzQ3lBMXBRUlBTZnprK1FBd1BteTBqSXRJMVNPcWdnMHdHaDFZM0lud2lD?=
 =?utf-8?B?cjRXQzJVMElZbU4rc2hqcHFtT0RKQnphOWR5Mllrd05rSE00bENFcE9VWkVj?=
 =?utf-8?B?S0kraks0Uk5OaGlRenp1N2FzZENzQ05STGI5UFZaeG5Qa2F4YWtGNHRCZEZM?=
 =?utf-8?B?T1BmQ2dBQzhISHFyQWZxLzhqUmhLbkxwb3VXSzJQYTBOTkhzYTRyZVBDSGps?=
 =?utf-8?B?TXJNYmlSd0d5aC8rdWViMVFtMGtudVlqNm5CbmZ4VTJxTUJaVFdhdWZFc2dn?=
 =?utf-8?B?dTI5dDVHV0dmQVVaSmVvcE5VblVDSmt6VlBCdjFIMTNHNWZ6YWttMU5MdUFs?=
 =?utf-8?B?YVBJRE5LSmZVRmZTSHFhWlAxOXR4MWlYOGs5R1B6WGFQdG5FamF1QVhFTXNu?=
 =?utf-8?B?bFpBa3FUTDF0ak82bHdDbDdVVEQzQWhCL216Unk4TmcvWVVlMGx5cmw1bkFy?=
 =?utf-8?B?ZWVab0VET21RaFBtbE5SNGxnOGUzWkFvbTUra3hESThTMmdaWFVCTTkyM1Nj?=
 =?utf-8?B?cU9LMFlhSnN5VmQ1aEhuOWJOYTkrU3FneWJUM0ZQc0VrTWNidDJBZnV2RURJ?=
 =?utf-8?B?eUYwbGJ3cUNJQTB6SUZCRWx6REwyU0YwKzZnSTBjTXNmcFNUeENOZGNndWhk?=
 =?utf-8?B?aEVDUWVPYklTdWZ2RnlZR3VaOUlURGhqSXJob2FzU2N6cnVHbWxDZXdONVlr?=
 =?utf-8?B?d3BIekNpRzNNSVBSUndVQWZpeHFnSVN5c2J0TGZMTHJqVG0vdzNvRVVKNjlX?=
 =?utf-8?B?YzZnUVVIWk9BT05Kd3ZXMnQ3Yzhzai9XRzJOdWVaNGIzaDJPeDlVaEMxOG1M?=
 =?utf-8?B?bnZMNTIzTS9NTDdQTEFpUDc2K1FwbGRva0FBRDRYZ0l5T3pkejBnaVpEbnhG?=
 =?utf-8?B?Tkd5a2paZ3hYZ3Z0UnRlZnoxeENaT3ovVnNwQW5hUnlsM251d1RCb0xqemdF?=
 =?utf-8?B?akozSXVkbHMrbjNhakZka2FaL0tqdkxuSTlLLzRvaVkyNlM3eXRORXZZTm5G?=
 =?utf-8?B?bFk1b0VOU2FSdC9SWmNVaHZLMXZrSVBFVTdvQnZQeEh5YjBZazVYWTBIOTNX?=
 =?utf-8?B?eFVNMU91ajB5T3hRTUJIZks3MEVva2NaR2w0YmxMTVpwd0k4RHpRaWk4c05D?=
 =?utf-8?B?emlDYTJzanVYR0ZxOVNXQUhGSGZCNWcwa1hTemFTZ3NXZm54Q3FWRUFIUHAr?=
 =?utf-8?B?c1U1M1NXeDd5RllLem9kWFhWbmRSOHRzWVNYVytSb0NseU5rSnRjSU9VVzVa?=
 =?utf-8?B?dlJWNGZFSkN1NWtGallTbHVvQzRwV1l5MForaWhhbXdXY2owY1RBM3JrZWV2?=
 =?utf-8?B?c1dsNTc3NWRGNWVlenFYRDBrM1NHQllOWHc0MlczelZhakJiZUp4WEJQeXVP?=
 =?utf-8?B?OFpqSzRUM3d0L1Nwb3NwTGRGcXpwMm5aTGlzL2pSQnNWMlM3M2JxS3RQNy9l?=
 =?utf-8?B?WHBQaU41OGtzdEp1ZFlRc29kQ3dzSzBsZThFL3J2NEU4OC9nb2tGc1gvQVhN?=
 =?utf-8?B?eGwzemQ4a1l2emtpdU53blFuU0dmTzBZcU1pUktSRnNxeU91OTA3QjBpRTdh?=
 =?utf-8?B?UXJuL1ZkMEVKaUlNSEo3VUsvbFplRjFwVFVYMUI1ZitkbjVjUEgxeTB0R0Ev?=
 =?utf-8?B?RGlnMDQ4ekVIcUd0M1VITDNzNHpDMkFWbVdidW1KT3IrRXR5Q3pEWXRyOVg3?=
 =?utf-8?B?aGpzbWlWd29PVnJ5NTNNUit2ZlVMSXA2ZnFBU2hpTWF1NVQ2UVFHa0Y1SWM5?=
 =?utf-8?B?OXc1ajdQcVBmNTQwNFcrS0dQUFUzTEx2dkdTem9PcTN2Zk1yRUpRVm1PcC9a?=
 =?utf-8?B?Qmc9PQ==?=
Content-ID: <EF378F02D734F44B8339B5492082CE75@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369fc0d8-e7ca-4739-ec4e-08dc9429cc6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 08:44:02.3659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJkYUHuMIoNORylDQMNq/62IKyc8y/Ar9g1ZtIAeTMsQWnmNVmTd5XWebeA3nmGe2GKKh4SdxAhXBjjDhgNvoglZiHRwRK7RpkYnsgfVCcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6962
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--21.480600-8.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/3KRSR886eK0ia1MaKuob8PC/ExpXrHizzkP9PygRLwHqdf
 7AoDAkHe+77gLdLcnBRzsaHH1wAbDsFeWQ9rEC3VAjTI/+6gf4PSL+EVfOJR0/t592eq2xoTmAI
 yWr6xn5/0KnmNu2ojdTk952E2Zyxx9ZRkVakSSW17wVopF8zag7LiLKO9VZOiERHkysQaiHkwwO
 azvPnG2HodnPL4lCk7K2+WBV866GDIY6JevWs4vg2IdVM+s7+jh+w9Wz/xXDoDvHelfu2d5PMTu
 IrC6WWh2J6HcIguTNL6/8A5t5NKXYjQo/Iw2s1STSPNp9e/u1N9LQinZ4QefKU8D0b0qFy9mTDw
 p0zM3zoqtq5d3cxkNQP90fJP9eHt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.480600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D88FC37B48A47A1288BAA08E1BF49B65F20B129912CDCED8F6508FF0F4A5956A2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1163379823.1154005771"
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

--__=_Part_Boundary_003_1163379823.1154005771
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWF4aW1lLA0KDQpPbiBGcmksIDIwMjQtMDYtMjEgYXQgMTE6MDAgKzAyMDAsIG1yaXBhcmRA
a2VybmVsLm9yZyB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiBUdWUsIEp1biAxMSwgMjAyNCBhdCAw
OToxMzowM0FNIEdNVCwgSmFzb24tSkggTGluICjmnpfnnb/npaUpIHdyb3RlOg0KPiA+IEhpIE1h
eGltZSwNCj4gPiANCg0KW3NuaXBdDQoNCj4gPiBJIGhhdmUgY2hhbmdlZCB1c2VyIHNwYWNlIHRv
IHVzZSBETUFfSEVBUF9JT0NUTF9BTExPQyB0byBhbGxvY2F0ZQ0KPiA+IHNlY3VyZSBidWZmZXIs
IGJ1dCBJIHN0aWxsIGVuY291bnRlciB0aGUgcHJvYmxlbSBvZiBkZXRlcm1pbmluZw0KPiA+IHdo
ZXRoZXINCj4gPiB0aGUgYnVmZmVyIGlzIHNlY3VyZSBpbiBtZWRpYXRlay1kcm0gZHJpdmVyIHRv
IGFkZCBzb21lIHNlY3VyZQ0KPiA+IGNvbmZpZ3VyZSBmb3IgaGFyZHdhcmUuDQo+ID4gDQo+ID4g
DQo+ID4gQXMgdGhlIGNvbW1lbnQgaW4gWzFdLCBkbWEgZHJpdmVyIHdvbid0IHByb3ZpZGUgQVBJ
IGZvciB1c2UuDQo+ID4gWzFdOiANCj4gPiANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MDUxNTExMjMwOC4xMDE3MS0zLXlvbmcu
d3VAbWVkaWF0ZWsuY29tLyMyNTg1NzI1NQ0KPiA+IA0KPiA+IA0KPiA+IFNvIEkgdXNlIG5hbWUg
Y2hlY2tpbmcgYXQgW1BBVENIIHY2IDMvN10gbGlrZSB0aGlzIGN1cnJlbnRseToNCj4gPiANCj4g
PiBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0
cnVjdA0KPiA+IGRybV9kZXZpY2UNCj4gPiAqZGV2LA0KPiA+ICAgICAgICAgICAgIHN0cnVjdCBk
bWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwgc3RydWN0IHNnX3RhYmxlICpzZykNCj4gPiB7DQo+
ID4gICAgIHN0cnVjdCBtdGtfZ2VtX29iaiAqbXRrX2dlbTsNCj4gPiANCj4gPiAgICAgLyogY2hl
Y2sgaWYgdGhlIGVudHJpZXMgaW4gdGhlIHNnX3RhYmxlIGFyZSBjb250aWd1b3VzICovDQo+ID4g
ICAgIGlmIChkcm1fcHJpbWVfZ2V0X2NvbnRpZ3VvdXNfc2l6ZShzZykgPCBhdHRhY2gtPmRtYWJ1
Zi0+c2l6ZSkgew0KPiA+ICAgICAgICAgRFJNX0VSUk9SKCJzZ190YWJsZSBpcyBub3QgY29udGln
dW91cyIpOw0KPiA+ICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ID4gICAgIH0N
Cj4gPiANCj4gPiAgICAgbXRrX2dlbSA9IG10a19nZW1faW5pdChkZXYsIGF0dGFjaC0+ZG1hYnVm
LT5zaXplKTsNCj4gPiAgICAgaWYgKElTX0VSUihtdGtfZ2VtKSkNCj4gPiAgICAgICAgIHJldHVy
biBFUlJfQ0FTVChtdGtfZ2VtKTsNCj4gPiANCj4gPiArICAgbXRrX2dlbS0+c2VjdXJlID0gKCFz
dHJuY21wKGF0dGFjaC0+ZG1hYnVmLT5leHBfbmFtZSwNCj4gPiAicmVzdHJpY3RlZCIsDQo+ID4g
MTApKTsNCj4gPiAgICAgbXRrX2dlbS0+ZG1hX2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZy0+c2ds
KTsNCj4gPiArICAgbXRrX2dlbS0+c2l6ZSA9IGF0dGFjaC0+ZG1hYnVmLT5zaXplOw0KPiA+ICAg
ICBtdGtfZ2VtLT5zZyA9IHNnOw0KPiA+IA0KPiA+ICAgICByZXR1cm4gJm10a19nZW0tPmJhc2U7
DQo+ID4gfQ0KPiA+IA0KPiA+IEJ1dCBJIHdhbnQgdG8gY2hhbmdlIHRoaXMgbmFtZSBjaGVja2lu
ZyB0byB0aGUgaW5mb3JtYXRpb24gYnJvdWdodA0KPiA+IGZyb20NCj4gPiB1c2VyIHNwYWNlLg0K
PiA+IEkgdHJpZWQgdG8gdXNlIGFyZy0+ZmxhZ3MgdG8gYXBwZW5kIHRoZSBzZWN1cmUgZmxhZyBp
biB1c2VyIHNwYWNlDQo+ID4gYW5kDQo+ID4gY2FsbCBkcm1QcmltZUhhbmRsZVRvRkQoKSB0byBw
YXNzIGl0IHRvIERSTSBkcml2ZXIsIGJ1dCBpdCB3aWxsIGJlDQo+ID4gYmxvY2tlZCBieSBhdCB0
aGUgYmVnaW5uaW5nIG9mIHRoZSBkcm1fcHJpbWVfaGFuZGxlX3RvX2ZkX2lvY3RsKCkuDQo+IA0K
PiBJIGFncmVlIHdpdGggeW91LCBpdCdzIHNvbWV0aGluZyB0byBkaXNjdXNzIG1vc3RseSB3aXRo
IHRoZSBkbWEtYnVmDQo+IG1haW50YWluZXJzIGJ1dCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8ganVz
dCBzZXQgYSBmbGFnIG9uIHRoZSBkbWEtYnVmLA0KPiBhbmQgdXNlIHRoYXQgZmxhZyB3aGVuZXZl
ciBuZWNlc3NhcnkuDQo+IA0KPiBJdCBtaWdodCBiZSByZWxhdGVkIHRvIHRoZSByZWNlbnQgd29y
ayBJIGRpZCB0byBpbnRyb2R1Y2UgYWxsb2NhdGlvbg0KPiBmbGFncyB0b286DQo+IA0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyNDA1MTUtZG1hLWJ1Zi1lY2MtaGVhcC12
MS0wLTU0Y2JiZDA0OTUxMUBrZXJuZWwub3JnLw0KPiANCg0KVGhhbmtzIGZvciB5b3VyIGluZm9y
bWF0aW9uIQ0KSSdsbCBkaXNjdXNzIHdpdGggZG1hLWJ1ZiBtYWludGFpbmVyIGluIHNlcmllcyBb
MV0uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiBNYXhpbWUNCg==

--__=_Part_Boundary_003_1163379823.1154005771
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO01heGltZSwNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMjEmIzMyO2F0JiMzMjsxMTowMCYjMzI7KzAyMDAsJiMzMjttcmlwYXJkQGtlcm5l
bC5vcmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksDQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMz
MjtUdWUsJiMzMjtKdW4mIzMyOzExLCYjMzI7MjAyNCYjMzI7YXQmIzMyOzA5OjEzOjAzQU0mIzMy
O0dNVCwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7JiMzMTA3Nzsp
JiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hpJiMzMjtNYXhpbWUsDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCg0KW3NuaXBdDQoNCiZndDsmIzMyOyZndDsmIzMyO0kmIzMyO2hhdmUmIzMyO2No
YW5nZWQmIzMyO3VzZXImIzMyO3NwYWNlJiMzMjt0byYjMzI7dXNlJiMzMjtETUFfSEVBUF9JT0NU
TF9BTExPQyYjMzI7dG8mIzMyO2FsbG9jYXRlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzZWN1cmUmIzMy
O2J1ZmZlciwmIzMyO2J1dCYjMzI7SSYjMzI7c3RpbGwmIzMyO2VuY291bnRlciYjMzI7dGhlJiMz
Mjtwcm9ibGVtJiMzMjtvZiYjMzI7ZGV0ZXJtaW5pbmcNCiZndDsmIzMyOyZndDsmIzMyO3doZXRo
ZXINCiZndDsmIzMyOyZndDsmIzMyO3RoZSYjMzI7YnVmZmVyJiMzMjtpcyYjMzI7c2VjdXJlJiMz
MjtpbiYjMzI7bWVkaWF0ZWstZHJtJiMzMjtkcml2ZXImIzMyO3RvJiMzMjthZGQmIzMyO3NvbWUm
IzMyO3NlY3VyZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Y29uZmlndXJlJiMzMjtmb3ImIzMyO2hhcmR3
YXJlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyO0FzJiMzMjt0aGUmIzMyO2NvbW1lbnQmIzMyO2luJiMzMjtbMV0sJiMzMjtkbWEmIzMy
O2RyaXZlciYjMzI7d29uJiMzOTt0JiMzMjtwcm92aWRlJiMzMjtBUEkmIzMyO2ZvciYjMzI7dXNl
Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7WzFdOiYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0
MDUxNTExMjMwOC4xMDE3MS0zLXlvbmcud3VAbWVkaWF0ZWsuY29tLyMyNTg1NzI1NQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NvJiMz
MjtJJiMzMjt1c2UmIzMyO25hbWUmIzMyO2NoZWNraW5nJiMzMjthdCYjMzI7W1BBVENIJiMzMjt2
NiYjMzI7My83XSYjMzI7bGlrZSYjMzI7dGhpcyYjMzI7Y3VycmVudGx5Og0KJmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzdHJ1Y3QmIzMyO2RybV9nZW1fb2JqZWN0JiMzMjsq
bXRrX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtk
cm1fZGV2aWNlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsqZGV2LA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
c3RydWN0JiMzMjtkbWFfYnVmX2F0dGFjaG1lbnQmIzMyOyphdHRhY2gsJiMzMjtzdHJ1Y3QmIzMy
O3NnX3RhYmxlJiMzMjsqc2cpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2dlbV9vYmomIzMyOyptdGtfZ2Vt
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOy8qJiMzMjtjaGVjayYjMzI7aWYmIzMyO3RoZSYjMzI7ZW50cmllcyYjMzI7aW4mIzMyO3Ro
ZSYjMzI7c2dfdGFibGUmIzMyO2FyZSYjMzI7Y29udGlndW91cyYjMzI7Ki8NCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhkcm1fcHJpbWVfZ2V0X2NvbnRpZ3Vv
dXNfc2l6ZShzZykmIzMyOyZsdDsmIzMyO2F0dGFjaC0mZ3Q7ZG1hYnVmLSZndDtzaXplKSYjMzI7
ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO0RSTV9FUlJPUigmcXVvdDtzZ190YWJsZSYjMzI7aXMmIzMyO25vdCYjMzI7Y29udGlndW91
cyZxdW90Oyk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7cmV0dXJuJiMzMjtFUlJfUFRSKC1FSU5WQUwpOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2dlbSYjMzI7PSYjMzI7bXRrX2dlbV9pbml0
KGRldiwmIzMyO2F0dGFjaC0mZ3Q7ZG1hYnVmLSZndDtzaXplKTsNCiZndDsmIzMyOyZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhJU19FUlIobXRrX2dlbSkpDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMz
MjtFUlJfQ0FTVChtdGtfZ2VtKTsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyO210a19nZW0tJmd0O3NlY3VyZSYjMzI7PSYjMzI7KCFzdHJuY21w
KGF0dGFjaC0mZ3Q7ZG1hYnVmLSZndDtleHBfbmFtZSwNCiZndDsmIzMyOyZndDsmIzMyOyZxdW90
O3Jlc3RyaWN0ZWQmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsxMCkpOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZ2VtLSZndDtkbWFfYWRkciYjMzI7PSYjMzI7
c2dfZG1hX2FkZHJlc3Moc2ctJmd0O3NnbCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7bXRrX2dlbS0mZ3Q7c2l6ZSYjMzI7PSYjMzI7YXR0YWNoLSZndDtkbWFidWYtJmd0O3Np
emU7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19nZW0tJmd0O3Nn
JiMzMjs9JiMzMjtzZzsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOyZhbXA7bXRrX2dlbS0mZ3Q7YmFzZTsNCiZndDsm
IzMyOyZndDsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7QnV0
JiMzMjtJJiMzMjt3YW50JiMzMjt0byYjMzI7Y2hhbmdlJiMzMjt0aGlzJiMzMjtuYW1lJiMzMjtj
aGVja2luZyYjMzI7dG8mIzMyO3RoZSYjMzI7aW5mb3JtYXRpb24mIzMyO2Jyb3VnaHQNCiZndDsm
IzMyOyZndDsmIzMyO2Zyb20NCiZndDsmIzMyOyZndDsmIzMyO3VzZXImIzMyO3NwYWNlLg0KJmd0
OyYjMzI7Jmd0OyYjMzI7SSYjMzI7dHJpZWQmIzMyO3RvJiMzMjt1c2UmIzMyO2FyZy0mZ3Q7Zmxh
Z3MmIzMyO3RvJiMzMjthcHBlbmQmIzMyO3RoZSYjMzI7c2VjdXJlJiMzMjtmbGFnJiMzMjtpbiYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOyZndDsmIzMyO2FuZA0KJmd0OyYjMzI7Jmd0OyYj
MzI7Y2FsbCYjMzI7ZHJtUHJpbWVIYW5kbGVUb0ZEKCkmIzMyO3RvJiMzMjtwYXNzJiMzMjtpdCYj
MzI7dG8mIzMyO0RSTSYjMzI7ZHJpdmVyLCYjMzI7YnV0JiMzMjtpdCYjMzI7d2lsbCYjMzI7YmUN
CiZndDsmIzMyOyZndDsmIzMyO2Jsb2NrZWQmIzMyO2J5JiMzMjthdCYjMzI7dGhlJiMzMjtiZWdp
bm5pbmcmIzMyO29mJiMzMjt0aGUmIzMyO2RybV9wcmltZV9oYW5kbGVfdG9fZmRfaW9jdGwoKS4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzI7YWdyZWUmIzMyO3dpdGgmIzMyO3lvdSwmIzMyO2l0
JiMzOTtzJiMzMjtzb21ldGhpbmcmIzMyO3RvJiMzMjtkaXNjdXNzJiMzMjttb3N0bHkmIzMyO3dp
dGgmIzMyO3RoZSYjMzI7ZG1hLWJ1Zg0KJmd0OyYjMzI7bWFpbnRhaW5lcnMmIzMyO2J1dCYjMzI7
aXQmIzMyO3dvdWxkJiMzMjtiZSYjMzI7YmV0dGVyJiMzMjt0byYjMzI7anVzdCYjMzI7c2V0JiMz
MjthJiMzMjtmbGFnJiMzMjtvbiYjMzI7dGhlJiMzMjtkbWEtYnVmLA0KJmd0OyYjMzI7YW5kJiMz
Mjt1c2UmIzMyO3RoYXQmIzMyO2ZsYWcmIzMyO3doZW5ldmVyJiMzMjtuZWNlc3NhcnkuDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO0l0JiMzMjttaWdodCYjMzI7YmUmIzMyO3JlbGF0ZWQmIzMyO3RvJiMz
Mjt0aGUmIzMyO3JlY2VudCYjMzI7d29yayYjMzI7SSYjMzI7ZGlkJiMzMjt0byYjMzI7aW50cm9k
dWNlJiMzMjthbGxvY2F0aW9uDQomZ3Q7JiMzMjtmbGFncyYjMzI7dG9vOg0KJmd0OyYjMzI7DQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDI0MDUxNS1kbWEtYnVmLWVjYy1o
ZWFwLXYxLTAtNTRjYmJkMDQ5NTExQGtlcm5lbC5vcmcvDQomZ3Q7JiMzMjsNCg0KVGhhbmtzJiMz
Mjtmb3ImIzMyO3lvdXImIzMyO2luZm9ybWF0aW9uIQ0KSSYjMzk7bGwmIzMyO2Rpc2N1c3MmIzMy
O3dpdGgmIzMyO2RtYS1idWYmIzMyO21haW50YWluZXImIzMyO2luJiMzMjtzZXJpZXMmIzMyO1sx
XS4NCg0KUmVnYXJkcywNCkphc29uLUpIJiMzMjtMaW4NCg0KJmd0OyYjMzI7TWF4aW1lDQoNCjwv
cHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1163379823.1154005771--

