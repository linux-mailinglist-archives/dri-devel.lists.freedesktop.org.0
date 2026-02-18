Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D2eEGrQlWkaVAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:44:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F01571D8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FD710E5CD;
	Wed, 18 Feb 2026 14:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LrT2BxUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011047.outbound.protection.outlook.com
 [40.107.130.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0459010E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:44:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwgyCh47qBlxBrvjIvZ1o7lLfJAoU+K/PIy0yZ4fOPvDK0MdvHoeCiTj7WBSmvGSEKHc41QhFd9B0aajyRkANih593Wu9T8ZTtmg4MrDeLLwo5yl3d1EVvwdX0DPVNwNGA54pw6iyAsMGGnFvcMguFwubJi5xBQwySStBNQGnlOlX9zS+dEuiBe9dwpKlc34oNLokoZ8yieNTFFmaeKtzQCNOVD4gT2RDErF2GN4PtIE1aqh+HSFfVKYx32oK7cEqrrdcmCt+WJJdHwXm5bu1JeC/KTb0mhXBFKg8CUhp3Zypql5QQjtcSb5v/1dJxMhLbN6T5MUy9thqF2d9Uq+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7JDhkuViaNJf0LTbeKnefAOIBX3yOP9uLfCEFDNgMw=;
 b=GkeJCOF0CsjGhXJaPEymFx1VNor+X0SA9fduTTX8mZR/PbuvVDOdrrutR0wXRI+4lwECXzusd667SPN6dIfQGYlK3OY7wpVA6xKHv8no5JksDhANZ5LCOTkMxZCX7Sno3crvRDOSMa/8OwJ17XDhhpXFQghIEn6xT/lBazQYEon2Tt4APMr+XqK8ZFBfART2NyLbCCgKiho++T0sMRYv8PQL9/f/MruJghtmnZXouhfytJ4kTEYPDJw2GGbtO2ZKkCDIY873jYaqNU/EseLPLrQZygmGmyX3knIiqNBIUxx9AYWJiWPWNOb/Zx9Zv+4gdkOgLKF66yo6i19LC7usiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7JDhkuViaNJf0LTbeKnefAOIBX3yOP9uLfCEFDNgMw=;
 b=LrT2BxUW3q213QNMTww1FW/f2jncYIxsDa0WCekO2h2eG/f522TMAAFsj9DoTM91Fa4Y8l1HCAr8TS2fhj8Slke8wNn0n4TgmVhkyRety+bdjgHJc02CnGsyPGslYQ4hunBe06MBjqbDzBBkCx3eJWubp5Rp6R/X77cgASuV/sCGO4hhBbnehYZUFKmWFXBTRNZATWnMTdRQ+YfBuhQlLRn4uPOX5LR/IFndB8hi3N9r6pE72TrJt9JrGCN0YYMRJmWZpZjwMJNkhoTKd+0q5qLWWN4A7fI4d33/nf6sMEv/88cdwjeT4exwt24mkGIHmj8lmUdFN2gHQRXKhubTGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by PAWPR04MB9807.eurprd04.prod.outlook.com (2603:10a6:102:384::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 14:44:48 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 14:44:47 +0000
Message-ID: <4ad41c4c-3319-403b-93c7-c52a58658e84@oss.nxp.com>
Date: Wed, 18 Feb 2026 16:44:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] dt-bindings: serial: fsl-linflexuart: add dma
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-10-larisa.grigore@oss.nxp.com>
 <be18bbef-02f1-416b-ad2a-739261b3cd97@kernel.org>
Content-Language: en-US
From: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
In-Reply-To: <be18bbef-02f1-416b-ad2a-739261b3cd97@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0058.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::7) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|PAWPR04MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3a630d-6dd6-4b91-488b-08de6efc436e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXM5emZkK2orN3lxRitmUEs1ZUg2SVZDemJUR0hsVlRpcFZmZjNKL2ZjaGpQ?=
 =?utf-8?B?ZFhQYUhNS0o4UGlDZlowczdXK3NMcDI1dTFFbWo4MDZjcXoza2wrTnBMTEw4?=
 =?utf-8?B?djB4TDZ0UjI1VzBiaDFYeDltUzlIem12RlM3V1JUTFU1NXpoYU1NQ3QyZW43?=
 =?utf-8?B?cSsvV2FoODMvekNEUHAwQXhWbjVhU05TeDhFUHFMR3g3YjEyWkVLMzVwODRX?=
 =?utf-8?B?d0hZSFhBMnNVK0p2TGxZYUFrTlNGelFmVDJlRFJLRmxrUHFDQmk0cTZCUmRu?=
 =?utf-8?B?bml3YWVhZHlpeXRRNHFNOUN3UXNtdndjbFZvSUdPN2dDOG4vQW41UDV5WFdH?=
 =?utf-8?B?SC9ic281MHBXQ2h3UTdGOEZTRTZzT3RrdzRTY1gvWE5TREp5RU41R3FON05i?=
 =?utf-8?B?YWJwUEd4OHZhVThLS25UQnhhRkpWOTJDandPQ0NTMlVTMHpmWHhrODM4OEhP?=
 =?utf-8?B?UVlub1g2ZU9FWUdQTkx4c2dwcGdid0xzNVhNeXlPODl5OUxtV2RFOUQ4SnZL?=
 =?utf-8?B?UVo5VzQ0NDRQd242dWp0TGJNQ2tuVFo5YWRJdUpyNHViK2QwWXJLWHpiZDZq?=
 =?utf-8?B?REFXL3J4VmpjcFZkM2hhNCtOa1hOMk5FRjFLbWpkVjE0TWpCREdNREJlSThs?=
 =?utf-8?B?Rk5GdGRlaWgzUVZiZnJ0L29pUlh3cHhSRExrUzJ3OHBDclBDMnRDMFFKUDJa?=
 =?utf-8?B?d1Rod1FQeXg1YzUxclhPYlpJcWtBanhvV3VXWU1jUnN3TmttMkRWL096MDN4?=
 =?utf-8?B?eld1emFzVHBZY3JGZnk4VVRQK3diRUxWaFdtNTEzRjdOdFhTWlpQSTY2ZHFr?=
 =?utf-8?B?L3hrazlwVStmSVpOQmJWK1V5WHJuUXZjUU04TGcxcnphTmpuOWpFTXZZc05q?=
 =?utf-8?B?dVNNcGxGRGpBcDBCbEdzU0F3OUh1Ym5jd3ppNlE5Y3dkUldOVHZicUF3blpR?=
 =?utf-8?B?ZXA0azJjOUx1Qmo1TDN0S09vaHBianpOOG9oa1ZXRjZlbzEyZ2daOWl0cEp3?=
 =?utf-8?B?eUlYMFJjSHNxZ2diUi9NNWkzeUU5T3gwdDd3eE1ETU1OcWRrelVobFZGZVM4?=
 =?utf-8?B?K0NvN0p6bGhKRDdJT2RiWXpLVVRCQ1A3UEVNRXJ1cnhJdTI4bnJTcDB0b0ZT?=
 =?utf-8?B?QTg2c2tPZzc4YlV0N3NpQ2o2UGVZR2IrYWxzQk5QMGlVQ0JSZTZSeExWb1BT?=
 =?utf-8?B?TTBKVDlzbitoRHZGZ2FKVnVqc0FRVUx2SkRuckNXS1RWQ2VQUHR5OXBqdWQ1?=
 =?utf-8?B?VGw0aTExZ2VtNGVQQmVnck1NdjRBOUdlTURlMXovcHVUMnR2Z2puOCtjZVR5?=
 =?utf-8?B?K2x2OERHTkxaSHczaFhtNEt6Tm5HRnZ0MGxsWlRtSHpkMU5zRU16MS94SXFt?=
 =?utf-8?B?cW1kd3I4UHlvUHBNS2NrNGI2WWlYQngvZ1NSUkdQb2R1Z3FpUnRVZDB1T3Vi?=
 =?utf-8?B?aVB4UzZuSjBleXZmK25LbE5yc3hqTHgzYTl3WW5GYU9xL3BSWUNiZXVKN0tv?=
 =?utf-8?B?TEo1UGwyYzBMYWNjcXJFUkNwT1NtcmVYK2hmbDRScmNMd3NQb1YzTnV5dit0?=
 =?utf-8?B?ckpaMHJsd2g5ZUVEa1dLTHpQcnVYR0JMaXduc0pTZkh4c2I3RGcweGVqRFd5?=
 =?utf-8?B?NW5OaWUwUjlpd25wM05jS0Q4Z3REYWtJMlVTS3dzSEpGczBUZnM4blJabmNT?=
 =?utf-8?B?ck9EZ3puQWY4OVgybkdEWjhjVENScHpKQmU0UTJCN3NWZ2xPek5aVjdWMkxG?=
 =?utf-8?B?endxMmtzOWYrLy9tT2lEa2VxUUhlSGV1L0NTTjZJQndScEliRmppNHo0bUgx?=
 =?utf-8?B?eUJIbE9xUHJKTE5TMSt4TVdtWVdpYVFBQXVwTU8zRld1SDNlZVBGK0FOOU5h?=
 =?utf-8?B?TGxrUTJYRzJ6ekhWMFlON3VQbHh2cVI0YkcvR3R3MzBjYVNPTGF0ZW5tczR5?=
 =?utf-8?B?RFZ5VklxQ2t4bU5TajllOFJ1VE1zZFhqRlY0WWdYWDlWM2FDVm1DbzVZTkdC?=
 =?utf-8?B?YXBCMS83Q2lWdS94L2hEOHk2S00zOVN3a1MyaXhXUmZ6YzVDSWJ5U09PelFk?=
 =?utf-8?B?N05JcHN3K0YzbVpMR3JUZVc3VkpPeXVUTmt1ZG5QS1BCRHNlUXlPQzg0eDNT?=
 =?utf-8?B?SXRKbVdkSjNtRlVjNms3WDV6RTNrL0NYYXQvRlBVdVJQRlROUU9ScmFkU3d3?=
 =?utf-8?B?Zmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWRITFB5N0pBc2c0eHRnWjJYQmkyQnF3SjhVZHpqNHpQalpqWngvd05KNXdq?=
 =?utf-8?B?SHBxaEtaU1F5VEJhYTd1bjMycUhZVVZUZG9USHk5TTVnRXQrSjRnaU8yb3pP?=
 =?utf-8?B?STZ5U3ZFOXpGbmFnYXM0MnJpL3R0SWZuVXVtK21rK3lCMmtOTzkxeUxsM24v?=
 =?utf-8?B?N0oxVjkvTGxnV3FvNWJmaDROa3M3T0NqTHhLN2s5dUdUYzBzV0dwT3pLSTBK?=
 =?utf-8?B?STFwS01MaEg4N3RwQ1FuNXZKSk50Y2hFek9SVGxoSy9OcVNxM2FMSWpRS21n?=
 =?utf-8?B?bUhFUnJkWlIyTzAxUXROZXE2OWdqTzV1eGtmM0xjZ1ZaeWJ5NjhVUHRrVzhH?=
 =?utf-8?B?a2Z4QXpHUEQ0dTNLb29UalFjV3g3ajJRUERKOXlSbnVZUUlxZlE0NkxmbHhS?=
 =?utf-8?B?QkRBNDZpUkZGc1U1eDl4ZEdHdmpac3Q4MWJmTTRPcm02OFdXWnV3TGlVaWJ6?=
 =?utf-8?B?QktYNjVWSy9mN0ZBYllvemtLYmJTeUMwbkJhVjg2a3hrdHZuTTVXcFhXRkhV?=
 =?utf-8?B?MDArdytvNlF4VXE0NHR6QnpnYkFsZmZtd2JHQ2JTNkZMNnJ1WCtNZnduU0xJ?=
 =?utf-8?B?cmFWWDh0Zmk1N25wNExUK3g1YUpRR2M5c3Z1bXA5d25aeXNhdll3ZGNGTkJw?=
 =?utf-8?B?LzdXZVBkb3RuZG81TkRMS0pKMlI5L21JTjNIamVaVzF3VFBqRWNEa3dhSERx?=
 =?utf-8?B?ZW1yRFhDWWhOVmVEV3djK00vcTFESHFUZXYwdmozdjgwOTR3d1RwaW5JczZx?=
 =?utf-8?B?ZnhmOGJKMXd1RkFickdhUk1USEI5VmN5V2ZmeHcxbWxOMXlKUDVDVDNNbmJz?=
 =?utf-8?B?MEl0YmozUEQ2emd1M2ZMdHZqaDY1a3hIYXoxUmtod3ZEREdHUVZrN1Z3Slpx?=
 =?utf-8?B?YWN4cTQ2MXR0ZmtXMXViVEFoQm5lMmNBOWNnTEcwZTZpRU1lTFhDMElHUnp2?=
 =?utf-8?B?M1k1QmdhSDZqZlJiMmNOZloyNFJOYWx1VTNIVnhPS0dYT1J1ejhLVzNNUTU3?=
 =?utf-8?B?V3VvVm9oajRuSDlybGVNQnhtTm1WekRUN3hJbldiTzJabXZrMkpyVkpyWlor?=
 =?utf-8?B?Zm9zcUpOMnd6UUVITnl2aTdPYkNlSko1SWYyY1B0MkJDU2x3ODZUU1p1OHFK?=
 =?utf-8?B?YUpiUTZYSFQ2VXAvdStqZC92YVNWdkdTcWkxSkg0WUg1UVIzYy9SQkN5UzVr?=
 =?utf-8?B?Q1k3aUFjSzRBR293all2R2R2TFA4a3o3OGJHVlIyYjd4bi9YdzBuQmJOTHFD?=
 =?utf-8?B?U0duaEZUMlJ5aFU1aDZFSXU4SkR6UXdyTHZpMVJWYllhYUl3ZVJ5bHRac3hw?=
 =?utf-8?B?cm5oU09HS294cFFLYnJMVWxROGN1c25lcEpjZnJUcVBqMVk1OGVQdzBPVXVJ?=
 =?utf-8?B?dnJLSHBFS3VVYUNROFZBOEIyenpGSU8yTzkrYWdSUlNlUjJXaStVNmpPOG5i?=
 =?utf-8?B?SXRPTko4UzFmSkQ3aVFnVGpmdzgxZEJnV0ZoVVVnTXhRS1BSTmJSNEwxK2tG?=
 =?utf-8?B?bkFNQXFPNm9DcDVVUkJhbW5RS3NGcmNCamJnL0d0TVB2WUMyaWxPbWhiRmVl?=
 =?utf-8?B?bzU0RlVtYnhFc2NsNFU4WHBCZVBranNSVHhCUnZLTmNDaDFhZjVmeXAySzdq?=
 =?utf-8?B?ZC8rc2RZVVFRYzR1L3JVcXlhaHBRc3VBL2ptTCtpUUJlYkt5K3BROFpmTVlU?=
 =?utf-8?B?cVB0QnJ1Q3M2S29OQ2VZTzMyM3lYNVArT2ZUN0NTMXBrd0NMcjljS2xQSVds?=
 =?utf-8?B?bjBsd25KY3RoWnQ5ZUlXblVSaTZlR3VMdEhHbGJhZ2hJWlh5aVNMNGpDOXJ1?=
 =?utf-8?B?dVVOOGdYRjZoTkN4RDJjVzRSeVJuWjlEcis5dWN6QWUvWjdQZlp1TnZieGN2?=
 =?utf-8?B?SmJaUS9jL3BadWF0QUhrZVl0NmtqVDRFVjYvbkMzUENnOWhoNGdQcWZnQTh3?=
 =?utf-8?B?b3Q5T0taOWUvTmNadkcwWmhLblhpSUlxTTVNODlLZjRqbTdoc0prVnBuV1JM?=
 =?utf-8?B?RGtZVi9EWkR6TGFmQVA2aUt1TUxJSjlST21ncC9mdngrVTZTeXN0OTZqa2NX?=
 =?utf-8?B?c1ZEclRBQzBPRzA5ODJEMC9kUzBzV2o3Mk5mTm4zaEMzZUIrWVcySzVqalZD?=
 =?utf-8?B?RmFWaTRGbEFPM3RUNjZNWGpSajhEVjl2MFowMmFPamRuU2Raa0RxRGZ5M1hq?=
 =?utf-8?B?UUJpcTdQckdmd2ZNeVpkWUgwcDJQSGZ5enJiYnNvRGZOcTdsMU9KNGs4a1Qv?=
 =?utf-8?B?QzZ0QWtONDlQU1M2ZmlLekVTZ3hMTlFNbEN4SWZPRlpCUkhCOVBRUmdaQm9D?=
 =?utf-8?B?U2xFMG1rVGhqb3JnamxzaTB5MjNBZmlzNVN0UVBmdW9majF2cEVadz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3a630d-6dd6-4b91-488b-08de6efc436e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:44:47.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAIJ37jUgf50An52oUGLEdVnDPzhHFeeebqfYrHX1oHkbUhCe91NQoZdVY72LiHoEak0y7nZXglsWkDt4fuC8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9807
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B03F01571D8
X-Rspamd-Action: no action

On 2/16/2026 5:10 PM, Krzysztof Kozlowski wrote:
> On 16/02/2026 16:02, Larisa Grigore wrote:
>> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>
>> Add 'dmas' and 'dma-names' properties to describe optional DMA support
>> for RX and TX channels in the LINFlexD UART controller.
> 
> Same question as in other patch about existing devices.
>
I will update the bindings so that `dmas`/`dma-names` are optional for 
S32G and not present on S32V234. Would this be acceptable?

Thanks,
Larisa
>>
>> This allows the device tree to specify DMA channels used for UART data
>> transfers. If not specified, the driver will fall to interrupt-based
>> operations.
>>
>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> ---
> 
> 
> Best regards,
> Krzysztof

