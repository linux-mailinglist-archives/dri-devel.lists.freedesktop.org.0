Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435FDA678A5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 17:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D898F10E1EF;
	Tue, 18 Mar 2025 16:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="72wbFj0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2127.outbound.protection.outlook.com [40.107.104.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D7910E1EF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 16:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB095N+x+PERI1yXIViS0eERqcZDNcCU2ra2F1kIbT9R2czWUX6jzQmsH/CS0aqK6VYYbxWea+WJvDwSuTrg5KiyFfI0vRCoSFHKT9RDCMMFmt6P8d1zSpPDbWKlHozGwFmM4OQ9Ss0896B2Ja8KzXpiR9yK8WQPiwdvG6QSiV8EZ7a31kfl809pFGGYO/MxehI1cNV/o0RxTYHSuJg4LEm8Tyxpj/kOS5LvSmsZyL9q/XNhHI2ZRaP91gg6yUiIk/Co5ld0EKCwBeXKfN4XgLkcIa4j9U9r7FOCpKFLcaMGVeh1TejMvyjLFJOEJFModiP/juqQXuqkPWF5AupKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYPDmgWAqvRcsBgKr0InMPTgUN8JT0vJ7UY6gdwCI14=;
 b=Cbyod/M0e6y6bpmGApoRVbAD0KgRu4vtQwyATaH7n7Z0iKsBOjGXUkYkV0oy7Et02B9BOgYlU7gCo6B6cQyeRoPi+Cpgl1vnI8ZpLhqkywhtRmb731ONZc0ZYaBEdGlz4wz7rVfrrBYYxzZJ+wmvv9EbszZ7KQoQhxQVON3EP6WDhqMWhxILiT4cjG8MNPTPSfY7PmECmZQzDNLX3ANwBd4tW2iKs1ZKMrVIvBoCY4O54TwfOgLChZYQiiV3lLJ5TS1KLzcq8uhnFcxXuBeRYxFXgn4/GXIpdUDBdKJr1aEBE8LYYFwXNVZxoTkxvqAXnwQyuAFrcHytQvtsYAXGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYPDmgWAqvRcsBgKr0InMPTgUN8JT0vJ7UY6gdwCI14=;
 b=72wbFj0R64H6+Ks9sq/8g1bSTihgEEWhtoFiwx9gdRwmK4zk6sBSx5cHLQhA7taKuF0SkafgcSSDWwj1ty6EB+MSzIw+b7pIMD8sYCdFvjmVKLZ+xHdLkhLUQjMTkDQsC/4DLSIv64AhZ4HV+eViQqUFYieBXslCUF9VRRXLmlFR7A1DwB2jn5CLsfZBaYH/a4qsSOGx/65xhOG4Qe/uw7Xs+ybdRw4Twm0nnKVQajQBW9bILEuyafX5KxRVSh4BVhjv8mcd/kXPoFqeEYyyp7CzMpR+GSdFQ/DPQVKyCsn7hWOngHUyui6H0hXr60bjyxxypDsjjeSg9jqPNE8VUA==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PA1PR04MB11083.eurprd04.prod.outlook.com (2603:10a6:102:484::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 16:03:40 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8511.025; Tue, 18 Mar 2025
 16:03:40 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Topic: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Index: AQHbiFlwk9848Rc4C0Wk0mPqKw6MoLNzOVEAgACo0sSAA12TAIAAANE/gAHmCICAAAD2Cw==
Date: Tue, 18 Mar 2025 16:03:40 +0000
Message-ID: <PA4PR04MB76301A4A8097CC399109AA98C5DE2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
 <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250317-massive-calm-bat-43ff61@krzk-bin>
 <PA4PR04MB7630DA5DF63C18530B86AB59C5DF2@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <CAL_JsqKiWyMMqZwdvbZp8pebqDYrA7MwoD3AGAST6iixXzU0LQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKiWyMMqZwdvbZp8pebqDYrA7MwoD3AGAST6iixXzU0LQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|PA1PR04MB11083:EE_
x-ms-office365-filtering-correlation-id: ce0d440c-f3fd-4828-780e-08dd66367345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SHBRc2VCTFJHVWE4cHFhcmtPUkZTZkZyc3dhSURrQWIxeDhsK1BvTVZEd2Vk?=
 =?utf-8?B?MUsrcUtSS3NYeDhPQVI5dXl0bnJ6UDY1S1B3b2JvMmFvUGJUaUNpbWYxSE4w?=
 =?utf-8?B?dVRQZXFSSThmWlkxRElqLzA4MGwvTnVKblBaSXpHLzdNbTgyNldnRDRkQ1dK?=
 =?utf-8?B?VjBuTWp1NTg3bzVHKzBTTU5NNjIycWZiN3ZCZEEyREJNeVZZSkZmeVhkUGI3?=
 =?utf-8?B?LzA4MGI5cDRySjl3eFRxUG5qcmNqcG81Y2hIelBGN21iSFR3YlpXb3lrTW9D?=
 =?utf-8?B?TGc3bUZMYm5VYXpudVhqWXFSTVd4eU5yNTg4R0JJbEhYUmJ3V1hoVkkyY0JI?=
 =?utf-8?B?S25MK3NGMkJXTmR6YzNMZWM4bDdiNXJEejdianlwS3FCV0tWVERQcytQeEJo?=
 =?utf-8?B?V0JQNDlKaUNZNTd6SzU1QkhFTTNIMlpTNnlzSXBPMFBranZOL045TWU2U3M2?=
 =?utf-8?B?VE5jWE8vTU1IV29TM3ZQK1Q0K2dvbUt1cFBYcG9COVBNbThCNFQ1V1N0WHhG?=
 =?utf-8?B?ZVRqR0MyOWRZNmdobzZ4czJodHJYVzZpQWYxN1lPNDdWWEdkbHdaSktROVVN?=
 =?utf-8?B?L0F0aE9TeGQvK0UzYkVlUDR4bm5nUmlsVExnYkdwT3dzUU91RVc3RExKQWxX?=
 =?utf-8?B?RHo1RnJZOVNnKzUrQjVXcFF1UHBNbzJwN3BNeFoxNWpNWnY0RWJOLzdWRTZl?=
 =?utf-8?B?TEZqTENRV1A0V0M3Nm1mZVhxZjEyTGZRaUtvRDhaVGd1SXNvc3dXOHgzcExk?=
 =?utf-8?B?akJnZjgvck1XUDFaRWJDOWE4amFTUzRTRTFaTG10SDlnQUVCSng3OUpQQ3p1?=
 =?utf-8?B?dmxQTU5xSHBBUVk2bkZaTDBPaXlzdi9ZRUkzTHJSb1BEaDNIK1cwaHJ5V3hz?=
 =?utf-8?B?MyttTzZiUTdIdkNWeDY0K3kwbnh2MXp2ZDN5aXR0WjhvZGROUnpKSHlQVi9u?=
 =?utf-8?B?aTdTRENvNnhRb202bEF5aEQydnZoNm14NUkxeHhqcmFxcTc1NTZWSkw5YTFG?=
 =?utf-8?B?QU90SHhJLzVra3V4WlBlV1lZeTk2K0RGR3Vhc3FKN2F3ZUdERkkvSUhTb3F1?=
 =?utf-8?B?L1ZsVVh1NmJuYVU5OEVvenJtSUdyTmtNd3N1TmNUOWlmWWRReGFyZDZSWWNh?=
 =?utf-8?B?b2NvaFVyQUZKaHRzRksrdnM5TThLTGlsMVdpaWFnZjJkQktZM2Q1UlJrM0dN?=
 =?utf-8?B?K2lQM0VDTCtLTGdDRXVKejQ3SFF3ZkpBWEJBYnVpQ3lraEZnb0EyUlorQi9j?=
 =?utf-8?B?bWxNTEdUSnMvdXJSWTlXRTVxOEpVLys4QUwwU0c0TmdidTg3SHhrdnIzZ1M2?=
 =?utf-8?B?OGI0YldSanlyR2ZUU3lUMGxRcVg2Wlo2OCs4WlB1ZWxVSUI4TG81eUpmK2h5?=
 =?utf-8?B?dCtxUUZtT3NGaHJEaWxBNGpOenBoY2hxT1Q5SU1lNzZuMXZmbUcwaWN3Tjk0?=
 =?utf-8?B?VEFxUjg2SVVRb01nUGtyVElLalh4MVhYbmRCKzduT3RGUWdlOUZoeWppdmJL?=
 =?utf-8?B?QkhXbFZqL2JFMVpWUm90TEVnSXN6VVVmbDloWXR5UUM0cUxkTURoVm9pa2V1?=
 =?utf-8?B?dzN4RllJSE0zZ0d1dnUzV2NGdWlxV2c1ZmJ4eGUvUnZSSFQ5ek1POWlxRFhl?=
 =?utf-8?B?aWpBUjRldHp3UTJXNUp3T2VXSS8vTjJYOThyL1d1U0xnNGVkK0lzbUoybnIv?=
 =?utf-8?B?cDRWUWpaMFVDc2l4UlBjTEdrTWhTb1BVRERPUlhKL0laaVVpNHNOOWZrdkIr?=
 =?utf-8?B?b1kzci9VcDV1U2RrYWhrUW04TTFwSXVXUDNrRCs0WUQyZ0VEcjc2ajk1NjVP?=
 =?utf-8?B?SWxseFgxTUFId3o1MHNmUjNZdUE5dER0RTA5YnppejVJR0hVMHpQcUxsYXlz?=
 =?utf-8?B?VjNTeDhSNkt6aXdod2liNHNCSFJ3QVF5YXBSdnZRY0NhYlFucXFWMCt6UU1V?=
 =?utf-8?Q?SKch1AeSxfi5Qjgb5juXn+uASZo0LV05?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUdWNzNnL1AwVVdSaEFtbDl0a3lVL3gzOFRYZW5QOHBGRXc1YUZXUTMzN0dV?=
 =?utf-8?B?aFZQMlo1N1ZhZVdhaTRPa1M1U3pvVUJJdTAzSmxycklQMERPSURqSzhQOFlv?=
 =?utf-8?B?YVVsREtKTjNxMlhadUYyQ1hDUEZuM0lrbDNMM3M2TUpDT3FmME10WHlPSDRZ?=
 =?utf-8?B?dDgxcG5XOHZqV3NlNDJ0dzR5SHRrMlpONExMZlV6T2pwdjFYRU5PSWVhTTFt?=
 =?utf-8?B?SzhvTFA3WmlEdWcyVXFmYmlpemI4dXNQWmpUWDRTZ2dGK1NrTDZzSmJKaWFY?=
 =?utf-8?B?Tkw4bnluNUo0UE84OE9KRThiQ0F5NmFjS3JCbEVTeWtXcUlWeS9Ia2NOZk5N?=
 =?utf-8?B?a1BnN1d1b3dsbHhBN3NoakVuUHNTdytVSk9PcEJtT1pkYmdHSlVaMkxCcCtN?=
 =?utf-8?B?UjNtTStvVm44Y1Z3eGRSVGFFcjZROU0ydWFrTjVkQnhjY1dNR2Q3OHFLT2ly?=
 =?utf-8?B?Z09JTTEwc1VHTnpGN2ZkN0N3ekYxUVl3cjc2RG0ybkhXZUlXcm13bElDNXV1?=
 =?utf-8?B?NStNamloOEkzWnAwMnNYaFpyRWR3WmhIZFRib0JJVjcybXcrMEx0dDhYZnAy?=
 =?utf-8?B?ZWVrUWJINkQzZlVTRmsrVUtNV2wzODJhOHBrREJic25ZcDVVaklTd1JLSEI3?=
 =?utf-8?B?K29mTTEwVndNQy9EdGxiVHRRazg5Yzl6VlZNZWk1MFMrUnM4Y3dZRnJnR2ky?=
 =?utf-8?B?WHB5dlBUZm1rNkZFTkNRTHRCN2RHUzNvS2lENjdlcTAvZWVmbDhHQTlnbmRk?=
 =?utf-8?B?Y3BncGtaOHdzaXIvbjhaSytPam53L0JlaWMvUEF6bWdJN0xaMUZndVJOZzlU?=
 =?utf-8?B?TU9VSUU3aEFrVUtWRTBaOTZWS0lqRlNSNnV3amNaVVR3KzVWWDh0R1RzQUNF?=
 =?utf-8?B?eVlGb2ExaG9oWXB6cUFjMFdaKy8yQ1l3NVpUaVV2aTJuK0pqOG5LSGtlT05o?=
 =?utf-8?B?RlBXWFdRVHJIRTF2N3REb3BRUUtyS01LeDdrSDduVkNQcWFDOEVmeEIyTmN1?=
 =?utf-8?B?NjlHY1RiL1RmSkVKaTZDNTNBU3pleWMzcVFzYUw4WFhLVlJIbXVTeFRLMUIz?=
 =?utf-8?B?dmVKbUhwWFhWOWxuS2YwZlNxQVJNYWsyUDMybGhmMnVSemlwR0U1S0RUTnN2?=
 =?utf-8?B?SmVTZkFYbGRhNnVOTFRlZklhNyt4T2VFRWpKZkszMFB5SW0rcmhJMjJ1VTRG?=
 =?utf-8?B?a1FybDdhVWJOQXprY3dFR1dxNXdoclUzUHRmNHBXcGdsVjRaK2NITWFORnlp?=
 =?utf-8?B?aGtBOEhrdmZaaGdLT25Wc0FTTjhNRllweXduWlFLaDhUcnczc0ZwL0pxMnZt?=
 =?utf-8?B?ZkhKSCs2MFFjYXRoRXBVTVB5b3FJWUZPOUFvRjhNTHhKQzNObkk1cnFmNk9q?=
 =?utf-8?B?UXVqbzhhV0xpZmZpRnpweFpUS3p5WVIwbHhRZmUvSU9NeWZYUWRvdmFiNU9D?=
 =?utf-8?B?UU0ydkw2Ly9ScUxYWWJjVzRGVnZIQ3lXZzVoRVBwUkxqeHVQVStMNmJLTDN4?=
 =?utf-8?B?RWpNRUhScHR5eVF0akRxYTQ5dVI4R2lrK2ZxV1FBUTFLNVROTDJjbjQwU1B5?=
 =?utf-8?B?VHVvOHdwckRYL2MzdC9HMjFOZlRiRkZWMEppVnNEbnIwWkt5NGE1TXJjMVpp?=
 =?utf-8?B?b0h4Z3AwSWZEbjc3dk9HMFZJVjk4c0hTcFVHVDJTb1M4RDdBeGowYXJyVDh2?=
 =?utf-8?B?STkwcmE3cWYvWitOOVZaTGxOazNsaU02R01FanJaKzh3Y2ZxWWEySkp6bFNN?=
 =?utf-8?B?akxDanhWWHJXZElwV2RlOXJDL050UzB6QWFCSDFyejYyUk5SMkQzelRPaWo4?=
 =?utf-8?B?bjMvNlIwT0FnZU9pZzVFZXMzZDJlWHFjZC9KQWhwci9zaGV0MFhVaERnbXpX?=
 =?utf-8?B?cC9ZekVaK1NMM3ZtSU1RcFZxZTlKeDVpMkFyTTBBck9tRVNvdjlqaENES1lV?=
 =?utf-8?B?Sitnb3ZWRGs2Z3U2NGdlQ3c2TCsxTkp5WTBJUFduK0sxSzdXeTZzUW5kMTRU?=
 =?utf-8?B?SW1QNWRBdUpYeU8yMjRicndlN1JVMk1OV3pDZWJnd2E3N0I4QVhmQjdXN0Q1?=
 =?utf-8?B?WXhxWHdsdzNUcVd3SHRvN2ZOcjZvUnc0Z3k3TndFNnNTZnlVTVROcitYaW1P?=
 =?utf-8?B?a2lNSXpGdXVTZVEzU1N3V0dCU3JqVGxFdVJaby9hRXpESmJ4bTlsVS9PRTAx?=
 =?utf-8?B?L1RHVUlqaTRQSHF1NnRwZG1MNElOY1JwY2s1N1BSRnNIQ1c3d0FqK0RWdmh3?=
 =?utf-8?B?VDgxT3RpdXBpNWVPL2M1NEdYT2ZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0d440c-f3fd-4828-780e-08dd66367345
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 16:03:40.4660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJbxw45EUsZ9lez3SyDePxtYXUNP0KYwQGcErJsVmgXx3yvA+xn9zlNhhq2U7FRvliyujmrgtWwn/04KuTEDcYQRhQ24wdC8QTqdP8wpiUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11083
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

RnJvbTrCoFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClNlbnQ6wqBUdWVzZGF5LCBNYXJj
aCAxOCwgMjAyNSA0OjM3IFBNCsKgCj5PbiBNb24sIE1hciAxNywgMjAyNSBhdCA1OjQy4oCvQU0g
TWF1ZCBTcGllcmluZ3MgfCBHT2NvbnRyb2xsCj48bWF1ZHNwaWVyaW5nc0Bnb2NvbnRyb2xsLmNv
bT4gd3JvdGU6Cj4+Cj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4KPj4gU2VudDogTW9uZGF5LCBNYXJjaCAxNywgMjAyNSAxMTozNCBBTQo+Pgo+PiA+T24gU2F0
LCBNYXIgMTUsIDIwMjUgYXQgMDc6MzI6MjhBTSArMDAwMCwgTWF1ZCBTcGllcmluZ3MgfCBHT2Nv
bnRyb2xsIHdyb3RlOgo+PiA+PiA+PiArcmVxdWlyZWQ6Cj4+ID4+ID4+ICvCoCAtIGNvbXBhdGli
bGUKPj4gPj4gPj4gK8KgIC0gcmVnCj4+ID4+ID4+ICvCoCAtIHJlc2V0LWdwaW9zCj4+ID4+ID4+
ICvCoCAtIGludGVycnVwdHMKPj4gPj4gPj4gK8KgIC0gc3luYy1ncGlvcwo+PiA+PiA+PiArwqAg
LSBpMmMtYnVzCj4+ID4+ID4+ICvCoCAtIHNsb3QtbnVtYmVyCj4+ID4+ID4+ICsKPj4gPj4gPj4g
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiA+PiA+PiArCj4+ID4+ID4+ICtleGFtcGxl
czoKPj4gPj4gPj4gK8KgIC0gfAo+PiA+PiA+PiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9ncGlvL2dwaW8uaD4KPj4gPj4gPj4gK8KgwqDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4+ID4+ID4+ICsKPj4gPj4gPj4gK8KgwqDCoCBzcGkg
ewo+PiA+PiA+PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ID4+ID4+
ICvCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4gPj4gPj4gKwo+PiA+PiA+PiAr
wqDCoMKgwqDCoMKgwqAgY29ubmVjdG9yQDAgewo+PiA+PiA+Cj4+ID4+ID5JIGZpbmQgdGhpcyBi
ZWluZyBhIFNQSSBkZXZpY2UgYSBiaXQgc3RyYW5nZS4gSXMgdGhlcmUgYSBkZWZpbmVkIFNQSQo+
PiA+PiA+ZGV2aWNlIHRoYXQgZXZlcnkgc2xvdCBpcyBnb2luZyB0byBoYXZlPyBPciB0aGUgY29u
bmVjdG9yIGhhcyBTUEkKPj4gPj4gPmludGVyZmFjZSBhbmQgKmFueXRoaW5nKiBjb3VsZCBiZSBh
dHRhY2hlZCBvbiBpdD8KPj4gPj4KPj4gPj4gU28gYSBtb2R1bGUgc2xvdCBpcyBsaWtlIGEgcGNp
ZSBzbG90LCBpdCBjYW4gYmUgb2NjdXBpZWQgb3Igbm90LCBhbmQgd2hlbgo+PiA+Cj4+ID5CdXQg
d2hpY2ggYnVzZXMuLi4KPj4KPj4gSSBkb24ndCB0aGluayBJIGFtIGZ1bGx5IHVuZGVyc3RhbmRp
bmcgd2hhdCB5b3UgYXJlIGFza2luZyBvZiBtZS4gVGhlCj4+IG1vZHVsZSB3aWxsIGFsd2F5cyBi
ZSBhbiBzcGkgZGV2aWNlLCB0aGF0IGlzIHRoZSBtYWluIGNvbW11bmljYXRpb24gYnVzLgo+Cj5P
a2F5LCB0aGF0IGNsZWFycyB1cCB3aGV0aGVyIGl0IHNob3VsZCBiZSBhIFNQSSBkZXZpY2Ugb3Ig
bm90LCBhbmQgSQo+dGhpbmsgaXQgc2hvdWxkIGFzIFNQSSBpcyBhbHdheXMgdXNlZC4gVGhlIDJu
ZCBxdWVzdGlvbiBpcyB3aGF0IGRvZXMKPiJnb2NvbnRyb2xsLG1vZHVsaW5lLW1vZHVsZS1zbG90
IiBtZWFuIGV4YWN0bHkuIE5vcm1hbGx5LCB0aGUKPmNvbXBhdGlibGUgaW1wbGllcyBob3cgeW91
IGludGVyYWN0IHdpdGggdGhlIGRldmljZSAob3Igd2hhdCBpcyB0aGUKPnByb2dyYW1taW5nIG1v
ZGVsKS4gRm9yIFNQSSwgdGhhdCdzIHdoYXQgZG8gdGhlIFNQSSB0cmFuc2FjdGlvbnMgbG9vawo+
bGlrZSB0byBiZWdpbiB3aXRoLiBEb2VzIHRoZSBzbG90IHNwZWMgZGVmaW5lIHRoYXQgc3VjaCB0
aGF0IGV2ZXJ5Cj5tb2R1bGUgaXMgdGhlIHNhbWU/IFRoZW4gd2hlbiBpdCBjb21lcyB0byBkaWZm
ZXJlbnQgbW9kdWxlIHR5cGVzLCBhcmUKPnRob3NlIGRpc2NvdmVyYWJsZSAoZS5nLiBQQ0kgaGFz
IHZlbmRvciBhbmQgZGV2aWNlIElEKSBvciB3aWxsIHlvdQo+bmVlZCAiY29tcGF0aWJsZSIgdG8g
bWFrZSB0aGF0IGRpc3RpbmN0aW9uPwoKVGhlIHNsb3Qgc3BlYyBkZWZpbmVzIHRoZSBwaHlzaWNh
bCBpbnRlcmZhY2UsIHdoYXQgcGlucyBldGMgYW5kIHRoZQppbnRlcmFjdGlvbiB3aXRoIHRoZSBi
b290bG9hZGVyLiBGcm9tIHRoZSBtb2R1bGUgYm9vdGxvYWRlciBpdCBjYW4KcmV0cmlldmUgdGhl
IG1vZHVsZSBoYXJkd2FyZSBpZGVudGlmaWVyLiBUaGlzIGlzIGEgZ3JvdXAgb2YgNCBieXRlczoK
MS4gVGhlIHN0YW5kYXJkIHZlcnNpb24gKGN1cnJlbnRseSBhbmQgZm9yIHRoZSBmb3Jlc2VhYmxl
IGZ1dHVyZSAyMCkKMi4gQ2F0ZWdvcnkgY3VycmVudGx5IHRoZXNlIGV4aXN0OgogICAgMTA6IElu
cHV0CiAgICAyMDogT3V0cHV0CiAgICAzMDogQ29tbXVuaWNhdGlvbgogICAgNDA6IE11bHRpIGZ1
bmN0aW9uCjMuIEEgc3BlY2lmaWMgbW9kdWxlIGlkZW50aWZpZXIgaW4gdGhpcyBjYXRlZ29yeQo0
LiBUaGUgbW9kdWxlIGh3IHZlcnNpb24KClNvIGEgY29tbW9uIG1vZHVsZSBpcyAyMC0xMC0xLTYs
IHdoaWNoIGlzIHRoZSA2IENoYW5uZWwgSW5wdXQgbW9kdWxlCnZlcnNpb24gNi4gSXQgd2FzIHRo
ZSBmaXJzdCBpbnB1dCBtb2R1bGUgdHlwZSBzbyBpdCBpcyBudW1iZXIgMS4KCkFmdGVyIHRoaXMg
Zm9sbG93IDMgYnl0ZXMgZm9yIHRoZSBmaXJtd2FyZSByZXZpc2lvbiB3aGljaCBpcyBhIHN0YW5k
YXJkCnNlbWFudGljIHNjaGVtZSBvZiBtYWpvci5mZWF0dXJlLmZpeC4KClRoZSBhY3R1YWwgY29t
bXVuaWNhdGlvbiB3aXRoIHRoZSBmaXJtd2FyZSBpcyBub3Qgc3RhbmRhcmRpemVkLiBFYWNoCm1v
ZHVsZSBoYXMgaXRzIG93biBuZWVkcyB3aGVuIGl0IGNvbWVzIHRvIHRoYXQuIFRoaXMgd2lsbCBi
ZSBoYW5kbGVkIGluIGEKdXNlcnNwYWNlIHByb2dyYW0uIE91ciBjb21tdW5pY2F0aW9uIGxpYnJh
cnkgaXMgb3BlbiBzb3VyY2UgYW5kIGNhbiBiZQphZGFwdGVkIHRvIGFueSBzaGFwZSBhIHVzZXIg
d2lzaGVzLgoKU28gdGhlcmUgaXMgbm8gc2VwZXJhdGUgY29tcGF0aWJsZSBuZWVkZWQgZm9yIGVh
Y2ggbW9kdWxlLCB0aGlzIHdvdWxkIG1ha2UKc3dhcHBpbmcgbW9kdWxlcyBkcmFtYXRpY2FsbHkg
bW9yZSBpbnZvbHZlZCBhbmQgaHVydCBvdXIgZWFzZSBvZiB1c2UuCgpJIGFtIG5vdCBxdWl0ZSBz
dXJlIHlldCBpZiB0aGUgZmlybXdhcmUgdXBkYXRlIHBhcnQgd2lsbCBiZSBtb3ZlZCBpbnRvIHRo
ZQprZXJuZWwgZHJpdmVyIGFzIHRoYXQgaXMgYSBzdGFibGUgcGFydCB0aGF0IGNhbiBlYXNpbHkg
YmUgdGhlcmUuCgpTbyB0aGUgInNsb3QiIHdpbGwgbW9zdGx5IGp1c3QgaW50ZXJhY3Qgd2l0aCB0
aGUgbW9kdWxlIGJvb3Rsb2FkZXIgYW5kIHNldAp0aGUgbW9kdWxlIHVwIGZvciB1c2Vyc3BhY2Ug
dXNlLgoKa2luZCByZWdhcmRzLApNYXVk
