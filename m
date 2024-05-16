Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4888C785B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B229110ED41;
	Thu, 16 May 2024 14:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="pcducc2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5407F10ED3E;
 Thu, 16 May 2024 14:18:17 +0000 (UTC)
Received: from rly17b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly17b.srv.mailcontrol.com (MailControl) with ESMTP id 44GEI3VL281286;
 Thu, 16 May 2024 15:18:03 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17b.srv.mailcontrol.com (MailControl) id 44GEHWho270148;
 Thu, 16 May 2024 15:17:32 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by rly17b-eth0.srv.mailcontrol.com (envelope-sender fkassabri@habana.ai)
 (MIMEDefang) with ESMTP id 44GEHVCS269909
 (TLS bits=256 verify=OK); Thu, 16 May 2024 15:17:32 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eegwmVPKMD8leehcx2t4EF6U0h0FFjgkTsUL/J/ISuEjft9SGOxXsfldlgWN0fZL8i0Wvy0QCEVsS2N6544SypXfaXumo3L0LtIikrRInTiiSdehNCTqVHcCKhUCu7LCYy6yCTQybtNsF9EGFSoi0jhJiPyMgfv5DSMzgeTDt8QYPPBXPxlbc4sycKZvWTnFvLP2UUefFKfiuz5bc5FLpgYXPy4UXr7ryM/BQgEaejJoRhNptUzlKscKN5EBxKFUoP13zmHmmHKKL0IznQ8vMCbp3gFRajPTPVS13uNHKYRq/mMjcSFHYlq16E3a+X+pZLXceVmTrg6kibRw6KDkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTu43unA41Dr588vCRnG2/wjf78et8dwaDgADBLc/No=;
 b=OzGC4+E8sxhqkWUIuNKUxTRqGQK4UppHXEiTV1qgQZ/sYhcDlYq/BNs+IvAb1z3Yy/+/nGJgUrD+umNC8Gt9dMa4IREBo3OgBpyY28AZ//J3U6FR6HjAr1l60f5zHGrPrPoLozJqez2eS73nKcNIgA2YugAlFsF6fg6hnH5nABB3/4+/3qo2RNoogGJm5t9TB5H47yGY03xnBGrWP2L6tTO/yWDufKghztjJwN4AGWsQdqt2rWfZPnGET4v4cQBSvWfOQUOVhUplslBWsGuT9n/MZ1nOcglAVHKfbfvLIVb/2TBV+Ep38C9OlM9YvAgX/A/A5WP4Z3VZ4noWIvtPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTu43unA41Dr588vCRnG2/wjf78et8dwaDgADBLc/No=;
 b=pcducc2EO69fhWknPQ1pkQTQr0Df1KYPa08qJ34RTVd/3pMkjrxunKMjtWwCRCqvYdfcLUmiDXadbxEnAldlcgaE7ObZewBH6cRDg5DQH0d/feY4AGPbCDd4RjnCEmETphdHgWa7LlsJbWzQqD/fG1Rze6WTqNIblC5ASPyfwTgBdZvVLRS+G3Uo9FRWW2phHk7DM1AQoWTMzoMG+zgRQNULxQ35AqHRjD+zamsBG9waOyHmJn/SfbgNd1tPKTGbYfKaKMV96rXD95mWKw6nQwzb5I+jqaptosi29vvU2c0OsoxB0NcQZeHmzwuoGbsfrso1ce4Zrtk1R0rI/ufLlQ==
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com (2603:10a6:208:fe::20)
 by GV2PR02MB8531.eurprd02.prod.outlook.com (2603:10a6:150:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 16 May
 2024 14:17:28 +0000
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::157b:473:91f9:cacc]) by AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::157b:473:91f9:cacc%6]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 14:17:28 +0000
From: Farah Kassabri <fkassabri@habana.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Ohad
 Sharabi <osharabi@habana.ai>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: print top commit sha after loading the driver
Thread-Topic: [PATCH 1/2] drm: print top commit sha after loading the driver
Thread-Index: AQHali8wPr+ku1Hq30GGLsTxWyBiYLF/HRQAgABLVICADdlygIAACQ4AgAzASIA=
Date: Thu, 16 May 2024 14:17:28 +0000
Message-ID: <36a051ab-a8fa-4461-8826-d685179bc6a8@habana.ai>
References: <20240424100706.269523-1-fkassabri@habana.ai>
 <87bk5s4ekb.fsf@intel.com>
 <45wxpwjv6fqzbnsivojrr2dbspnftinois7um3rrtku5j47le4@lobf5qyr2f2n>
 <6a605dbe-53c9-416b-9bdc-728c3e155256@habana.ai> <87seysk05r.fsf@intel.com>
In-Reply-To: <87seysk05r.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB5235:EE_|GV2PR02MB8531:EE_
x-ms-office365-filtering-correlation-id: c7a01615-e868-47c9-1b3d-08dc75b2eacb
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?c1gyU0k3cHREdmd6K2JmdndBQnhvWUF0YThJYVN0RG14TGdSWEdvaWFTcEZW?=
 =?utf-8?B?c0ZRNXlBRkVVbHR1S2tCWnpOREt6Mk9kTnR1dXBudDBaOUN6SGdHUkVyajRL?=
 =?utf-8?B?NUtReE56MHlCOHcxVlBaSlBndmE3SFphRm5KQlpZSTh3MXV1N0lxaVc5N1Jx?=
 =?utf-8?B?N3cvUlN0eEJNamFwYUIzemo3R3Z3L0FrQnoyNDNmMHllOFh4YUVVMURjamt2?=
 =?utf-8?B?UllIUzN3N0llMXFjcEtwWDEyczBCS0dwMlRzK2k0aVNVT1J6UTl0OWxyaFh0?=
 =?utf-8?B?SHJsRGs0NUNaeEhDR3N0emNJd3FqcysrbFZKa1VHQTYxZzlSb2JqemV1MXRB?=
 =?utf-8?B?L2VRbDEyTXErSThDRER2QVhhMHA0QWowVlB5UEVseHF6WG12VDAzUTB4clNY?=
 =?utf-8?B?YjJTVlY5aFdqN1czYlM0eWxqN25yV2Nqcnd2d1dtQzc5NWlzU1R4eHZEVU85?=
 =?utf-8?B?c2REOFVTVnF0Zytyb0Rpa244aGhacWRneUE0RktwdGRsQndPZC9ub3pmK21a?=
 =?utf-8?B?eDRGbnJLaDB5c3UvMUV0QWQ2UXRiTDg2TUI3RUxqQnhCdTVvUGhaTVZYL2hi?=
 =?utf-8?B?UmVDL0FmSklTZkVJSkxpaFRmUEpWd2ZZVVlpUEYzZEtaSENWN0l1bVZCUklP?=
 =?utf-8?B?NGUreXhRVTVXekNBSWx5Z3MrbHZXdnE4SHZUY1pkM093enlyblVTTWhMYUJF?=
 =?utf-8?B?MXhYUWI0cDRPajFXd0tkZHpmQ0lOeVNlZGlkWURIU053WVVBYktiblhJUXQ3?=
 =?utf-8?B?TE1nZG42NE15TDIxOWdSWFZqU1BObkVTZDAzSmFOcU5IYlREaCttcmt6eWlJ?=
 =?utf-8?B?NUFzcXdOWW4zRUtKMUtkdEdDbEhZT3Nla1AzcCtycHUxOStoSmo5VDNuTVYz?=
 =?utf-8?B?cUR1d01yT2RuWm1tQnM4WURPTWQ3SklOcDlEdEE4U2RYKzNsNmFQK1l6YjNS?=
 =?utf-8?B?N05XVi9kREc4Q1NCTHhwNERYVDZTeG44dW5jbEg5M204TlFOb256OTZYVlNG?=
 =?utf-8?B?YU02OVAwSU81YUFkeWJWZng1SmMzUk94bU5YSlJ2TmJSMlAvMytvazlLdC9L?=
 =?utf-8?B?RzJHSGhEL1RMbVl6Y0c3TThwemJxcm8rdlVLYnVPYllTTUxhVXp5NlROQmUv?=
 =?utf-8?B?Ukg1SmNrSytueDE3VFk3SHZVUGlyYzFuSnZreVlzZHpUdXFqZXBLRGtLTjNl?=
 =?utf-8?B?YlVBR3pLeXhvS0o0VTc2Z1pWWXRkczVGZ1JWaXFCczFWcllHTTVsQW1UUGtB?=
 =?utf-8?B?d3ZhR1hTQnF4RUZlRU1tcm1JMmFVTk9kbTBtczlMRGlScmFsL0VUYWNjU0Qw?=
 =?utf-8?B?Mm5WU1BnK0hkVGJ0eE5KRkZkNFNmSTZONGpBYlR2RXpiVlZIbk5EMCtlN0JY?=
 =?utf-8?B?MFF0MnJBSzViMUlhWXJjY2VZZ0tENTI1SUNvV0NsUk9CdHI3VGVTc2FoRDFn?=
 =?utf-8?B?NCtuaUQ2RCt2RHN6ZmtNRW15ZzhqUUFvOUFXeHhidTVCVitrblpHMW92SE96?=
 =?utf-8?B?RnZhM2EyQ2M0MVBaVnlJZHdqZWpRc3VscXV1UGNZMHczanIvWmFkM0xNV1p0?=
 =?utf-8?B?K2FpSUJlWXcwMDVqbEVmeEVZVDNidXEvQ0NkQUN4MFVsS1l4dFYwajV1NjIw?=
 =?utf-8?B?YTNEcmRkU3RMNGlLdFBSWHlzOE11VGFVb1ExNGI0bXBaVG1UajRibGxNU0gy?=
 =?utf-8?B?a29pWHg5SmRlN0h2emVxTHJoU0lKSnhHcHYrSUVrKzlSUlorMnpYZGdvdWhU?=
 =?utf-8?B?dlFpZDdoNVo3dmNYQndVT3ZGdDMvUGRvbFh3bWpmdml5T3J5V3EweTlKeUYy?=
 =?utf-8?B?cTVkYnY3aU5GM3pQd2tqdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB5235.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJGa2NTa3g2dk4vVnpxbjFmUVorY2hXWVprc1ZicTI5bHd3a0x3UGlRR0I1?=
 =?utf-8?B?em9RVFAvWXFreWV4eEVkUkhYa2hCdXRkS2RlNkZCa0RNTDNsYjJRNVM4SVdv?=
 =?utf-8?B?MTZDTXc1ZkpySHo2Y2JKdmw5dTJEbjdhakJZUkZnekc4R2dGQVlKVER3T1ha?=
 =?utf-8?B?eE5YQm1ZNXVQSkpZRXFRMXNUK3ZudTE3dytJNE1PQTJLVkZDbytwVjI4Snkx?=
 =?utf-8?B?ZFE0NlB6aWR3ekVvVGIwZXVaRGhqb2JHRkxtc3F2ck4xbStWcEhVNFpyVGt5?=
 =?utf-8?B?TWVSM1piZEQ2MVM3WGpLY0Y5cDNPSEJEbi84OUU1VVkyTjl5NVVOTVNWclY1?=
 =?utf-8?B?QzVGb3c4TittSTg2d1RkYVBXNUtYTXl5QXY1TWplaTg5V3pwdjVLcE9YdklL?=
 =?utf-8?B?WUJyUTdrRHd2K0RpZVd3R29HZDNPRjRLdG1yWmFLMkN0amhaSlJlUUl3bnRq?=
 =?utf-8?B?QnVrNXZpbE0zTlFCRk12M0hmMUgxZ2daQ056aWU3S2YwTXIzcjNSUHNzdFNu?=
 =?utf-8?B?QitzNUYzL2NHMFdxTXU2TWcrMktNb3daQ2h4UFdqRU1EaERXUzVmU0VUaXZI?=
 =?utf-8?B?ZzhiQkJ0WHZBVldqY1NTY29hL0ZzQldYbmk3bFJWdW1nOGZ0ZTBqdlZmclZ6?=
 =?utf-8?B?WHIxR2xYbEh3WUR4NDlhcHFBcUo5WFo4ek1oRUFGRXpTc1J1Z2N5YzFsVmk4?=
 =?utf-8?B?VENSYTFSKzJDNUVlUzkzSVNLV01qcWkrelJPR1dxOFBXWEo3Ty9NdEx4bE5Y?=
 =?utf-8?B?d3A5M2ovT1UwNFh2TFNRb1ZxcWxWY0I2ME9PaG13NWY4UStyWUY4cUNoSlhx?=
 =?utf-8?B?Yld0c2cvNHVYSmFyWEtaVzdEK0RIL2lmWjlPZHNQQkdVVEJCSkdKeXEzNlJl?=
 =?utf-8?B?QWUra2VMTWRIcVlBUG1zR0RBWlJ6TFpYTmpZSTAwUzRnMnNIWFluZW83WG1k?=
 =?utf-8?B?N0lSRFJVdWpjM0c4NGM2YmZpell6RG1ldlJqU0ZJQVg0cHNJbWZPTTlrbm82?=
 =?utf-8?B?RHFrcXp5RWhhVWVZamRGVnBKZWFIejJQd0VzbVZnMHg5RDh1WG5GVGVxNUJj?=
 =?utf-8?B?Q2JsTzdqUVRqcE1FUWd1N0dTQ0c5UnE1aGR6Wm5xbVNFcU1kamh3ZWUxaWds?=
 =?utf-8?B?UWhndmFxOFRGaTJOaStxeHBqOGtPZEFFanM1Z2pwalhCY0FBZWMzS25WSEE3?=
 =?utf-8?B?OXlBUTE4bVJuQ09xZ2lBS3dta0QwaWw4YTVyVFBjVGdPOVVMQTV6YUl6Y1Zt?=
 =?utf-8?B?TVZUNWxQa1ptMzM3djhPb0FIdVZMc1k4dnpzM0lHSE1tSnB5bk1aNWsxZUhO?=
 =?utf-8?B?UmU1elBpK0dHM1pxem1lMm80QW5GMis0Y3I1endUdE1mT1I5OGVZaVdjM0ZJ?=
 =?utf-8?B?R3ExQVIxcjlxbjZBU1lRZFkvMVl3M011NWZFT3V6M0NZbXVVZGxwM2thQUZz?=
 =?utf-8?B?dFN6VFV5cDZramRIOVpQenUxbE53dFBnQ1ZONUQyZ1M0RjQ1QzdDYm9kY2RB?=
 =?utf-8?B?RVZoZDhyVmdaWFZJRElsN0YzaWQrUVN2RCthNjJYa0xKSnl2eTJodStwemhi?=
 =?utf-8?B?SGdmb3lxenBuMjhnVUd4ODhCT1NCOHVOUmQzZnY3b2xYZnU3QnRaMFBwWEVY?=
 =?utf-8?B?TmUrTUJ4bUtWN0gzc3YvRWNSWllyb0Q0cTlBeVhDby9YQ1pGOVVmSXp4MzRG?=
 =?utf-8?B?VTBlc0g3OWh2MDUwT3dwdUNzRzdRbVgwcG9MdlFoOSt1WElvMEFJQ1dnQ3B2?=
 =?utf-8?B?WXFYM1g1dEZZNGZNVDNFdnI2MmhxSEp6THdJc280NlNWempwL0ZqbTdwb1Iz?=
 =?utf-8?B?RHhWVkRXaE9zbWZ4SnhTVDZERFBTOUwwYm9DODRVQzZ4VkN0RzNXZE1TL3px?=
 =?utf-8?B?M2xsMi9COWlrSDIyNEJkQXpTdEFkWmszVmxRRzJvM1diOERXbkVCcUV1WmZ5?=
 =?utf-8?B?QVJ0UCtIR3l1OVYwRjdsd1BydTVQa0NNSlVtNHpoaU01TEFsRjhzeVNBcFZz?=
 =?utf-8?B?bVJXSW04U05WL0g5V2p1M2QvKzhxblkrMHo3Q2pwQmUzeWY2d3BGYUpMdm10?=
 =?utf-8?B?S0tBS3Jwd0ZlaXo2SHNYdVgyc1ErMHJpdlg4OWRXZjdONTZSWGZIcDBBSVVk?=
 =?utf-8?Q?Bk6TEOmDGaaoxDqOqdwqzTCEf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B479C50286DF964395EAB951C4C36571@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kjDUQw7xcE3LcfROKQJmttPYy6opp6qSVzyc7EtUe0lZeZ9MGcmKB+MZoT8GI3gMTM7cQi7EpireTZxojXaXayGyRrb/9mx4CPDqEyVw/ccuz4cTKSSSckqdaA/CgDce21WP1qkCtOwAhVA42OEUtiFgV0hCLi5oMyw5e+C/r2w8OAkvkCPODcwkWkamtpwaysw0uwz1uOeFz5fLpOoEBH+LArsUtQVqbyCtxfn+/RsoRnzLLp6WmLlJ0uzsuWwuPMMN4Q5ck3QuIvE8jYHxCizsova0mzCrr1e4zaxjC6oWER+SV/bi4LoejFdtiFRiU10Hu/HcuKXwlOZbbY4dfOoj425vc61qDOSjDiZYk73v9iwY+L8Y9NJbx6UN2leM2j/4ptgp4nup0jINN45AbH13i1kTFgeFJbKKen849CbhpZraRb8H5Qh2iGFfa0JbMrfPz2V0AXmj0p+JVBetKR7gol7qs60SbqZh5b6/COF+TVhliIO56ozDQuYFZrWzK4napMGQMe2UfXEB0KMfBxFYczY35coIWW+0ajgvjJCkWdrlt328E7Pqe8LcK5ycvF9+vIlt9sybRaBIW01LNgMxFiB8MOijwvpTAnurjaVnSbUINw2f5ze4yx+Ft70d
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB5235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a01615-e868-47c9-1b3d-08dc75b2eacb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 14:17:28.3167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwmUKu8HlJx7Ap5pxk4eyBeLxaG47akbv+5P9AOAif01sSzTQMsu8kqUBMTuo/GYcKONIZMaKgl+IWQR8Zkupg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8531
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxNTg2OTA4NDpGUEtleTEucHJpdjpLDfK+EPgPky2RDmfmIy1b2JkPZDNVZbCc5/iXBzY/BQlDr4YaXPgu+cEeDJQgS0Mn58+K1tqGzPeuU2vsR87tGZbURem0o/Jke681AqdzSQz+i5J8Cn7mOTvIpTv245BngxfaRidbEf6YmaJwiIGg46m0GNvRELQ128SKDZdyENkafJe2cmV1bvpUWY450k0hvulNfEyGdd+4YTkh1veSaS0+L0BH7JAdt7uF553fmpoBqjFRRlByowQUju4NubID2Tg6ap0zQc8dZPXObzA2oktTECLnlTHh3qyQiEf2WFzFh6IKIognZaM5Bu+ayM938PzO7BEsqaUTv2IM1eJ2
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.66.1.127
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

T24gNS84LzIwMjQgMTQ6MzQsIEphbmkgTmlrdWxhIHdyb3RlOg0KPiBPbiBXZWQsIDA4IE1heSAy
MDI0LCBGYXJhaCBLYXNzYWJyaSA8Zmthc3NhYnJpQGhhYmFuYS5haT4gd3JvdGU6DQo+PiBPbiA0
LzI5LzIwMjQgMTg6MzIsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4+PiBPbiBNb24sIEFwciAy
OSwgMjAyNCBhdCAwMjowMjoyOFBNIEdNVCwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+Pj4+IE9uIFdl
ZCwgMjQgQXByIDIwMjQsIEZhcmFoIEthc3NhYnJpIDxma2Fzc2FicmlAaGFiYW5hLmFpPiB3cm90
ZToNCj4+Pj4+IEFkZCB0aGUgbGFzdCBkcml2ZXIgc2hhIHRvIHRoZSBleGlzdGluZyBsb2cgbWVz
c2FnZQ0KPj4+Pj4gd2hpY2ggcHJpbnRzIHRoZSBkcm0gZGV2aWNlIGluZm8uDQo+Pj4+DQo+Pj4+
IFRoZSBjb21taXQgbWVzc2FnZSBmYWlscyB0byBhbnN3ZXIgdGhlIG1vc3QgaW1wb3J0YW50IHF1
ZXN0aW9uOiB3aHk/DQo+Pj4+DQo+Pj4+IEVzcGVjaWFsbHksIHdoYXQgbWFrZXMgZHJtIGRldmlj
ZXMgc3VjaCBzcGVjaWFsIHNub3dmbGFrZXMgdGhhdCB0aGV5J2QNCj4+Pj4gbmVlZCB0byBiZSB0
aGUgb25seSBvbmVzIGluIHRoZSBrZXJuZWwgdG8gcHJpbnQgZ2l0IGNvbW1pdCBzaGExJ3M/DQo+
Pj4NCj4+Pg0KPj4+IHRoZSBjbG9zZXN0IHRvIHdoYXQgd2FzIGFkZGVkIGhlcmUgd291bGQgYmUg
c3JjdmVyc2lvbjoNCj4+Pg0KPj4+ICAgwqDCoMKgwqDCoMKgwqAgJCBtb2RpbmZvIGJ1aWxkNjQv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlLmtvwqAgfCBncmVwIHNyY3ZlcnNpb24NCj4+PiAgIMKgwqDC
oMKgwqDCoMKgIHNyY3ZlcnNpb246wqDCoMKgwqAgMEVBMDhBNDNBQzM5OUEwRDk0Mjc0MA0KPj4+
DQo+Pj4gd2hpY2ggbWFrZXMgbW9yZSBzZW5zZSBhbmQgZG9lc24ndCBkZXBlbmQgb24gdGhlIGdp
dCB0cmVlIGNoZWNrb3V0IGFuZA0KPj4+IG90aGVyIHBvc3NpYmxlIHByb2JsZW1zIHdpdGggZGly
dHkgY2hlY2tvdXRzLsKgIElmIHlvdSB3YW50IHRvIHByaW50IGl0DQo+Pj4gb24gbW9kdWxlIGxv
YWQgdG8gYmUgYWJsZSB0byB0ZWxsIGZyb20gYSBsb2csIHlvdSBjb3VsZCBwcm9iYWJseSBqdXN0
DQo+Pj4gYWNjZXNzIG1vZC0+c3JjdmVyc2lvbi4NCj4+Pg0KPj4+IGJ1dCBJJ20gbm90IHN1cmUg
d2hhdCB3ZSBhcmUgdHJ5aW5nIHRvIGFjY29tcGxpc2ggaGVyZSBhbmQgdGhlIGNvbW1pdA0KPj4+
IG1lc3NhZ2UgY2VydGFpbmx5IG1pc3NlZCB0aGF0LiBQbGVhc2UgQ2MgZHJpLWRldmVsIG9uIGNo
YW5nZXMgb3V0c2lkZSB4ZQ0KPj4+IGFuZCBwcm92aWRlIHRoZSBtb3RpdmF0aW9uIGluIHRoZSBj
b21taXQgbWVzc2FnZS4NCj4+DQo+PiBUaGUgbWFpbiByZWFzb24gd2h5IHdlIG5lZWQgdGhpcyBz
aGEsIGlzIGJlY2F1c2Ugb3VyIGRyaXZlciB3aWxsIHJ1biBpbg0KPj4gbXVsdGlwbGUgZW52aXJv
bm1lbnRzIGFuZCBzZXR1cHMgKHdoZXRoZXIgaXQncyBmb3IgY2xpZW50cywgb3VyIGxhYnMgb3IN
Cj4+IGRhdGEgY2VudGVyKSwgZWFjaCBzZXR1cCBjb3VsZCB3b3JrIHdpdGggZGlmZmVyZW50IGRy
aXZlciBidWlsZCBhbmQgaXQncw0KPj4gdmVyeSBjb252ZW5pZW50IHRvIHNlZSB3aGF0IGlzIHRo
ZSBsYXN0IHNoYSBpbiB0aGUgcnVubmluZyBkcml2ZXINCj4+IGluIG9yZGVyIHRvIHNlZSBpZiBz
b21lIGZpeCBpcyBpbnNpZGUgb3Igbm90IGZvciBleGFtcGxlLg0KPiANCj4gV2hpbGUgSSBzeW1w
YXRoaXplIHdpdGggdGhpcyB2aWV3LCBpdCdzIG5vdCByZWFsbHkgYW4gdXBzdHJlYW0gcHJvYmxl
bSwNCj4gaXMgaXQ/IFdoZW4geW91J3JlIHJ1bm5pbmcgdXBzdHJlYW0ga2VybmVscywgeW91IGRv
bid0IG1peCBhbmQgbWF0Y2gsDQo+IHlvdSBydW4gYSBrbm93biBrZXJuZWwgdmVyc2lvbiBhbmQg
dGhlIGRyaXZlcnMgdGhhdCBjb21lIHdpdGggaXQuDQo+IA0KPiBBbmQgYWdhaW4sIHdoeSBzaG91
bGQgeGUgYmUgYSBzcGVjaWFsIHNub3dmbGFrZSBpbiB0aGlzIHJlc3BlY3Q/IElmIGl0DQo+IHdl
cmUgZmluZSBmb3IgeGUgdG8gYWRkIHRoaXMsIHdoeSB3b3VsZG4ndCBpdCBiZSBmaW5lIGZvciBh
YnNvbHV0ZWx5IGFsbA0KPiBkcml2ZXJzPw0KDQpJIHRoaW5rIHlvdSdyZSByaWdodCwgd2UnbGwg
a2VlcCB0aGlzIGNoYW5nZSBpbnRlcm5hbGx5LCBubyBuZWVkIHRvIA0KdXBzdHJlYW0gaXQuDQoN
ClRoYW5rcywNCkZhcmFoDQoNCj4gDQo+PiBUaGUgc3JjdmVyc2lvbiBpcyBub3QgZ29vZCBlbm91
Z2ggYXMgaXQncyBkb2Vzbid0IHNlcnZlciB0aGUgcHVycG9zZSBhbmQNCj4+IGl0J3Mgbm90IGlu
Y3JlbWVudGluZyBhdCB0aGUgc2FtZSByYXRlIGFzIHRoZSBjb21taXRzIHNoYS4NCj4+IE5vdGUg
dGhhdCB0aGlzIGFwcGx5IG5vdCB0byBhbGwgZHJtIGRldmljZXMgb25seSB4ZSwgYW5kIGl0J3Mg
b3B0aW9uYWwNCj4+IGZvciBvdGhlciBkZXZpY2VzIHRvIHNldCBpdCBvciBub3QsIGFuZCBpbiBj
YXNlIGl0J3Mgbm90IHNldCB0aGlzIHBhdGNoDQo+PiB3aWxsIG5vdCBhZmZlY3QgdGhlIGV4aXN0
aW5nIGRybSBsb2cuDQo+PiB5b3UgY2FuIHNlZSB3ZSdyZSBhbHJlYWR5IGRvaW5nIHRoYXQgZm9y
IGhhYmFuYWxhYnMgZHJpdmVyLg0KPiANCj4gV2hlcmU/DQo+IA0KPiBOb3QgdGhhdCBpdCBqdXN0
aWZpZXMgYWRkaW5nIG1vcmUsIGJ1dCBJIGNhbid0IGZpbmQgaXQuDQo+IA0KPiANCj4gQlIsDQo+
IEphbmkuDQo+IA0KPiANCj4+IEknbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSwgYW5kIHRo
ZSBkcmktbGV2ZWwgYWxyZWF5IGluIENDIGluIGNhc2UNCj4+IHRoZXkgc2VlIGFueSBpc3N1ZSB3
aXRoIHRoaXMgY2hhbmdlLg0KPj4NCj4+IEJSLA0KPj4gRmFyYWgNCj4+DQo+Pj4NCj4+PiB0aGFu
a3MNCj4+PiBMdWNhcyBEZSBNYXJjaGkNCj4+Pg0KPj4+DQo+Pj4+DQo+Pj4+IEJSLA0KPj4+PiBK
YW5pLg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZhcmFoIEthc3NhYnJpIDxm
a2Fzc2FicmlAaGFiYW5hLmFpPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgwqBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2Rydi5jIHwgNiArKystLS0NCj4+Pj4+ICDCoGluY2x1ZGUvZHJtL2RybV9kcnYuaMKgwqDC
oMKgIHwgMiArKw0KPj4+Pj4gIMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+Pj4+PiBpbmRleCA1MzViNjI0
ZDRjOWQuLmUwZjdhZjFiNmVjMyAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4+Pj4+IEBA
IC05NDcsMTAgKzk0NywxMCBAQCBpbnQgZHJtX2Rldl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LA0KPj4+Pj4gdW5zaWduZWQgbG9uZyBmbGFncykNCj4+Pj4+ICDCoMKgwqDCoCB9DQo+
Pj4+PiAgwqDCoMKgwqAgZHJtX3BhbmljX3JlZ2lzdGVyKGRldik7DQo+Pj4+Pg0KPj4+Pj4gLcKg
wqDCoCBEUk1fSU5GTygiSW5pdGlhbGl6ZWQgJXMgJWQuJWQuJWQgJXMgZm9yICVzIG9uIG1pbm9y
ICVkXG4iLA0KPj4+Pj4gK8KgwqDCoCBEUk1fSU5GTygiSW5pdGlhbGl6ZWQgJXMgJWQuJWQuJWQl
cyAlcyBmb3IgJXMgb24gbWlub3IgJWRcbiIsDQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGRy
aXZlci0+bmFtZSwgZHJpdmVyLT5tYWpvciwgZHJpdmVyLT5taW5vciwNCj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgIGRyaXZlci0+cGF0Y2hsZXZlbCwgZHJpdmVyLT5kYXRlLA0KPj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqAgZGV2LT5kZXYgPyBkZXZfbmFtZShkZXYtPmRldikgOiAidmlydHVhbCBkZXZp
Y2UiLA0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgZHJpdmVyLT5wYXRjaGxldmVsLCBkcml2ZXIt
PmdpdF9zaGEgPyBkcml2ZXItPmdpdF9zaGEgOiAiIiwNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
IGRyaXZlci0+ZGF0ZSwgZGV2LT5kZXYgPyBkZXZfbmFtZShkZXYtPmRldikgOiAidmlydHVhbA0K
Pj4+Pj4gZGV2aWNlIiwNCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5wcmltYXJ5ID8g
ZGV2LT5wcmltYXJ5LT5pbmRleCA6IGRldi0+YWNjZWwtPmluZGV4KTsNCj4+Pj4+DQo+Pj4+PiAg
wqDCoMKgwqAgZ290byBvdXRfdW5sb2NrOw0KPj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4+Pj4gaW5kZXggODg3ODI2MGQ3
NTI5Li43NTc4YTFmNGNlNzQgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHJ2
LmgNCj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4+Pj4gQEAgLTQwNyw2ICs0
MDcsOCBAQCBzdHJ1Y3QgZHJtX2RyaXZlciB7DQo+Pj4+PiAgwqDCoMKgwqAgaW50IG1pbm9yOw0K
Pj4+Pj4gIMKgwqDCoMKgIC8qKiBAcGF0Y2hsZXZlbDogZHJpdmVyIHBhdGNoIGxldmVsICovDQo+
Pj4+PiAgwqDCoMKgwqAgaW50IHBhdGNobGV2ZWw7DQo+Pj4+PiArwqDCoMKgIC8qKiBAZ2l0X3No
YTogZHJpdmVyIGxhc3QgY29tbWl0IHNoYSAqLw0KPj4+Pj4gK8KgwqDCoCBjaGFyICpnaXRfc2hh
Ow0KPj4+Pj4gIMKgwqDCoMKgIC8qKiBAbmFtZTogZHJpdmVyIG5hbWUgKi8NCj4+Pj4+ICDCoMKg
wqDCoCBjaGFyICpuYW1lOw0KPj4+Pj4gIMKgwqDCoMKgIC8qKiBAZGVzYzogZHJpdmVyIGRlc2Ny
aXB0aW9uICovDQo+Pj4+DQo+Pj4+IC0tIA0KPj4+PiBKYW5pIE5pa3VsYSwgSW50ZWwNCj4+DQo+
IA0KDQo=
