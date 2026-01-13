Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9249D16DE8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 07:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EAE10E2F7;
	Tue, 13 Jan 2026 06:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EWIYKTq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013016.outbound.protection.outlook.com
 [40.107.162.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FD910E2F7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:41:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yz9My81UQYhL0KFXrBxFwEVJ9gAQOrd5WMshFJ71lJYs1vGYz9NIblXQYP9VsEz+bjO5piu96jsr4FDr0gBdwFLHLj53XHrixcqxHQp4EBEkAZXrUDBnIs9SVnGolKX8RLd67Ne7sFIe+I12E7qYtY8INdmwAHrGxrXbF55yNTQIAl3U/5+jEdVAs6k7XsGcrGhT/njOEdzXNoRiUW6PY6sa87hjhPkw63A3QYWBHhkL6PEuaTiIM+OzVOPKPtAe8yM354e6PLNzN1U31osFjXr7b7VsgJpemYpaQYG+rN0KchF5IuqvtpjFZv4ajefhNENCYdFmEsa6kXb6cQd55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYm3OEpoA4QlX/zohI0OsSpDkBAt5s4SiM2cS+J8FXU=;
 b=Mu77ixMK+GzaJdi66PzSRTfFsMjf63NQ6S4mFskIfjEk+f/HbdflJKpjgU3X1sNVU0PI90j9+tGTrBMFsa+xIpBr7RuidJ7WvLOKYM+UcskHRUTMuKPIlmGJmT8bz4TIvJdM2RxzTkLvPzsse2+n1I5Te3DcCGZYf5G/cJYSjJZza4lHsKPEl5jxqaT2u3lAToqlLijFmpCQQaHRLvekw6u+bICYGVsR+SkoYXkcAH/6LIrFLIXQawm/quj5CMgdlT/Ch2EtPCJya8F423SShq8ocMWwduQ/JjtEOwqsikD6CBu2NUDq3gB43gvHBZaj4RLA51fz1kozFwlA6lpKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYm3OEpoA4QlX/zohI0OsSpDkBAt5s4SiM2cS+J8FXU=;
 b=EWIYKTq7Ukt0VWWTteuRbjiDs3lJUpgez8V1IoNzpv42dTtp5bC0/GoyOLTkvYRcYmYOEVKSO7CeNkPsKBCfCZx1A8iVUWr3Ih6I4QX/ihGLXNfEnf1pGeeSH0gspbmNakWCbmhmJ4/pRprMSDhOqrFq+8VJsvPrxY0kNURl3m7v3VP1DyQ2on4D2weHauyUZWQyUK/9srmafrNM85TiTfmQgS0uw3+ApRTOQGPlhK8tWgbX0GI8/918rumQiWPZc73WPyDP9veOleL1AWuHsY+PC3QCx+YsG5D6V6x7pfiMTbDlVnUbH5VyQXskzRp1cdU1BpwSDnEhip2r7mUTVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by VI0PR04MB10164.eurprd04.prod.outlook.com (2603:10a6:800:243::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 06:41:18 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 06:41:18 +0000
Message-ID: <773b6e43-4f86-4b11-8e6b-a9f2561a75de@nxp.com>
Date: Tue, 13 Jan 2026 14:41:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
 <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Joseph Guo <qijian.guo@nxp.com>
In-Reply-To: <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|VI0PR04MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eba859c-4607-4563-80f0-08de526ec15c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eExKeDJrYWVSdGc2bVlIR0JISWhLRDlaaGthQWI5WHprRCtsWXFwei91YkJ2?=
 =?utf-8?B?Z0VCR29YWHBMd2YxQ1FTOUZJNmpobHlneTN0eHBkckNLNGtrZ1RtcTQ2NHBq?=
 =?utf-8?B?eG5XbUpUMFlJaytMd2syVFBrR3VMUndTNUZvVVhRVFlMZm9CempHUVljNWFH?=
 =?utf-8?B?WUwyMzR6Mk11YzFTRDBsQXlvK3ZTQUR2UGp2TnZBMEJXbEcrcnl5cDZ6enZm?=
 =?utf-8?B?OWE3bTU4RGtBRzkvK1NoSVdMc1NkSG9lT0QrK1ZOb3kvbm5jQWNQNUdWb1pQ?=
 =?utf-8?B?WldpcmZwUUhPbUVvS2NqZTgrUjJKY2o0cXBJSis2R05lUy9EVGZiWXNyQkVh?=
 =?utf-8?B?SnpTdjYzTnFFR3NibW9KZkhJUVhwUzN3RGp5Y2RpeUJneW0xMHJpUG5tL21P?=
 =?utf-8?B?WGNhdFV4YkZOTlplK2VKajAyaHE1WmtCRFU5NzdWSDFKVWZHL0xNdG0xZzJB?=
 =?utf-8?B?SDRvRHZYR1E2YTdmNlF6Q25meGg2TlE0VFVRY2p3dHJ5emtVbzZiQ3FlUFYz?=
 =?utf-8?B?aWlNZnFkU0lhSHQ3ZmJyU3JucGQ2ODExNDE4TDFSMll5OXAxTXg1T2tUQW8w?=
 =?utf-8?B?aUt2WjNzdlNvUU9GWVd1blZsVVA0UUs5a2RjRWphRlJ2bUd6ZnpucXVhemRC?=
 =?utf-8?B?QWxsWDE3cWVlTEJWMWJveVY5M2EvVWhpSUc1MTBOSVNDNjl4ZWZNcEZXY3BD?=
 =?utf-8?B?UHRqSStyS21iTmRVWDR2aUlqWWNlU0Z4Q3BsbVhCbUVDaW9zSDNqMktnQmdu?=
 =?utf-8?B?ZjFkbjVIZmxrdDJkNzN0WGhPaE9mV3NndHBwNmI1bC84K1BMNm8za1VJNTRo?=
 =?utf-8?B?TUx5THlzVkhwOGJzVFFtWmpoa3VLR3FJenZJUitUb3QwM2lTR0NBaFVrc0RJ?=
 =?utf-8?B?cVNUVkdRdHVoZXlxZDJYN2FVb1JMY0o5dlZkWFFEb05FQ3A4ZGJkQ1ViRE52?=
 =?utf-8?B?a2diTDJuWk5mU2RwNlFNTFIzTHQvYnJWSVdYVXExYTBGdVJweFh6QmJBRHRz?=
 =?utf-8?B?dWtXRzNpc1F0Mys3dG9vaHdaUUlwVjhYdkN6a1g5MTQzMWIra0JLaFJueE92?=
 =?utf-8?B?K2VSdHo0L3ZsSmpkWlJSVlFOekhscitTRUhJNGIyRXY2Nm1RK1BhOGdlTFBN?=
 =?utf-8?B?MGNLZjhoVnBKU0xhcDQvajBsSjF3ZW93dXFaYk00UEVHSUNpaEkzeXBHd3Nq?=
 =?utf-8?B?azV3VGI1aG1lOVB3ZVBJRDNCcEtDL21uOExLYWRJSDF1MDJFa1dHdEVzSjhR?=
 =?utf-8?B?N04vR0dhbUZTdnRsVGVpZUFrNWdjN2pkemFieitJa01NLzFaRytxbmtuOHVW?=
 =?utf-8?B?SnhwVW9zaHpQMVdQMEdtNnpzd0Q1WjFJMk9vWmJodTB2Yy80UHA1NndpYS84?=
 =?utf-8?B?clpsR2xvcUV5U0orRjdCWEhyb2plMjZ6THpSaU9RN2syTHhYeWJDSWgrZWc2?=
 =?utf-8?B?MDRPWXpyakw2dW8wbUJROE5UUGg3dmg2RnVKNXdHc1g5UGlyWGFCVklXUEhu?=
 =?utf-8?B?M21sMSttK2pmdXc4VkM3OFhaWEZvaGRlSHVRMmZXMDU5SHhUSExnTEI5N29l?=
 =?utf-8?B?dXpubUVNYnpzMzd2ck9FN296M0FJblhNK3c2ek05cEh4Sm9KSlRwaUZEK1oz?=
 =?utf-8?B?WWg3b091QVpheklXbmRQTEtEZmNjb25PQm9VVnpjWnJDSDJiZ1dQREh0T3Zi?=
 =?utf-8?B?dkE4OTIwMzU2RUg1eVhmOWFJQzlyRkJBbzNiS3owSlRRZjIrOTBTRThEMmFm?=
 =?utf-8?B?ZlJJSW83MTVvQktoMGFjOVhWd3ZJWWp3R3FwYzdXYkFzd2VFM3VPK0hMNHdU?=
 =?utf-8?B?RHg3b1p6VmxXenFwTFV0VDZuSGFhem5vNTd3SFI4K3NlZVZ2Q20rSHFRbDIr?=
 =?utf-8?B?c1BtMXBqbXdnOUpFM3JGdE1GNHZHZWtNSExWT1pQejRiZTJjN2dUUEtVbEhG?=
 =?utf-8?Q?ZiSkZad27h4a3vcqEu7ZSrYTwMUeqd7C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRWPR04MB12117.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEp3MlQ4VXE2MTdFTTI0Um9wYzJMaTdhalZPUTRVN2xSMTJWd3hNbThiSEVw?=
 =?utf-8?B?ckpCbDJFY3lpK0lnZlVnRnF1MXVvelpOdVVXTkZqRG5PcEVGUzdHaDZvU0RD?=
 =?utf-8?B?dG1kQkk3WEFzbVRBN2daNmFBWVpuSHBVT2ZyeFNaTy9hY0EwUmNKSXJSVHI4?=
 =?utf-8?B?azhyK0NnYVFBRzBvdUFsS282aVVMNVJUVHdLRno3alhaUFAxM1pBOGxhYmVl?=
 =?utf-8?B?SXZHdXdiNm5TMVJrcHJKc2RpTkZxQUZjNmQwSFBCcnBtUjBvS2JSbndqbFh5?=
 =?utf-8?B?N3VuTExzT0V3SkdZSlc4ZE8xSFVwMGJJK3Faank2Q3J3bzZQRFVaL2o4WTNU?=
 =?utf-8?B?cmZvVG9TTC9rSEpTQ29lSHZMck9Zd1JrcHFaRTMreUY3aGs4UnpJZ1FFMGxs?=
 =?utf-8?B?QkM2bVdJc1FQWDdFOU8za3BKYi9ia01pNWxJYmZjRGxHV3A5RUJmSS9KQnR3?=
 =?utf-8?B?QWgvMXFtQ0xpRU5oSGt4bXJheEpXUjEvd0sybCtTVER0SFc2WlBlWFJYenhy?=
 =?utf-8?B?d0tYaXorWUJZL2lINlc4bU0rbmhuTUhWNXNiN1JUNk1HdDY4S2RnSm93dlU1?=
 =?utf-8?B?amJCMlU1Qk9JM2kxYjJ4RlF2cEEvbVpPQU5WU2t0WGlXbk9qMkNZcncvTWJF?=
 =?utf-8?B?T3F2S3ViTkRGMFFQYkU2VlYwY1d3UFVSeW9oQWFNL1ZqbGcrL0gyMHRtSlpM?=
 =?utf-8?B?eURxdVQxcDljY09VZlFMRUJWS2pyUldhSkdFUDc3UCtMSEJCWTAzUWplL2hE?=
 =?utf-8?B?Y1B1Y0ZwOWN5ajJUOGNoRUJwZDJqbnBQSHpGUjJDaFBBYmoyU2l5dksyS0R3?=
 =?utf-8?B?dWlmTGwzU0J6blVWU3pETStjL096b1U2T05zVEs5UkxkeG0raWNoajFXTUdn?=
 =?utf-8?B?alhBaE50ZW8rRDdQVjFYUlFvOWppN01RK0hoZzAxQi8rQ0JLekx2ZXllWk5p?=
 =?utf-8?B?TG0vT0hSRG84ZlMrTm9qZWN1RURBNUR3ai9XK1lncU1DUUl5WHdLMWNzQm90?=
 =?utf-8?B?YVBWZEpmejlFME85OGJqM1IxSTBLQWFwV3VSamNxUUdGcFdDdVM0dmJFTlRy?=
 =?utf-8?B?L29BTElFbEZzVU1WTm5SN1c3QmZuRm00UTNFcndxSHVXaVF5N2wxblRzMk1O?=
 =?utf-8?B?cVFVWC94UnV2OFRHZ1ZaNE5GNkFkbWIwRUdKdFFpQmxZSEZXNzFtbkpnVFpp?=
 =?utf-8?B?ZllXMVFrcXZLWTlEendCSE9zTjNSUXByQlpHSDhpcXB0bll5MTRFeVFoMXZW?=
 =?utf-8?B?dmR4WERuU0FFc3owK205aC8zallGVk04OGZ0Vm1tMjBhdVFKQkl6U2RSMm00?=
 =?utf-8?B?MVlQcmdzRGQ4Q1ZBWXZTaXhqQk9PWEtJMWhpVG5oTHFST2hRZ2xINEdmMHJ2?=
 =?utf-8?B?RGVkZTU1ZHJvZStpNlcrZjZZR2dmUi9iSHVMaTFFZzMzTGdrNHc1R0ZqTmc0?=
 =?utf-8?B?a2syM2dCQ2MrcmtZRHB6L3p4bktOT1pJQkNEWnRVNzEzaXlNN1g5QjFvbEtY?=
 =?utf-8?B?aDNzaEpWWVJGL1k5RlhFUVN5TFVWQmJJd3VjZE9tZklER1hJWFRSQ1NJOUgx?=
 =?utf-8?B?blRvaVZZZ1VvUDZlWGhuNWYwcWUzZ2s0V1E5WXIxb0Q1SlJkZXFvT1BhdEdH?=
 =?utf-8?B?MzhRc2FqY1g5TEQ1VGdKLzZ0ZmNsQnZyeWczU2pVZmVLUmFJclRScXdlK1Jw?=
 =?utf-8?B?dk92ZGo3ODFSWUY5YTVDYWI4UldGWmMrSWJNcUgzcUJtR3h2cytCWDlEbWd6?=
 =?utf-8?B?L2oweWIwaWFNQmVEcFZaSGdKbGhzWXVvZDFVRS9lNlRNdDdIR01TaldMRVgv?=
 =?utf-8?B?emZaUUk5RHViLzFRUlZnSWlDalFCVVp4U2dUUVBaUnpHeDhMNStHdnViNG1P?=
 =?utf-8?B?bVJJTmVVa0UzMHI4VHN2bnRTQkJFYXdwRlZGSmF6WVRKTjFaKzFsd1E2OTFz?=
 =?utf-8?B?WFBDeldBcW1JL3VqTWhLa2xQS3JKeUt0QVFvOWIwcnJkb0NEMnJFQVcwcWNp?=
 =?utf-8?B?V2lSd3dhQmo3WWFTWlVwZ3FRZzhyeXJ3VmV3bnpJOVZuSW9GUGhpMW44SjV4?=
 =?utf-8?B?ejZPamdteTV2MnV2SFBCL2pGM0pOdFdSemtoVVljazBVSkc3K1ArdXJJdmVm?=
 =?utf-8?B?d3pFRFZoSTFJNVRSakJDdkxidWtrUFoycnJnWG05dmZOMUdtZHpla3RLTkV2?=
 =?utf-8?B?clJZT2hBZXNrbnJObjdYQkpLUW8xSGtFd1FyM0NZSTI4NHV4ekZlSEdJMllX?=
 =?utf-8?B?bk9QdWNJTzBmdUpGL09CdjFRSU1rb1dha2dlZlBtU2tMY2FMRmJmSHpiVWtP?=
 =?utf-8?B?R2RUZ3RXUDNtdTNGS0V2VU1ZdGk5VnBzWGZqUFREdjF3WU9WQ2UwQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eba859c-4607-4563-80f0-08de526ec15c
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 06:41:17.9290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rTIjJBO4hIHrJ8Tp51NH2UyX4kUOGzmysmdA8Uod0qeBE+eqxGpH/ocpOWb9I1GI1EmTbeKksDkez0auMezGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10164
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

On 1/13/2026 7:47 AM, Marek Vasut wrote:
> [You don't often get email from marek.vasut+renesas@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> Parse the data lane count out of DT. Limit the supported data lanes
> to 1..4 which is the maximum available DSI pairs on the connector of
> any known panels which may use this bridge. Internally, this bridge
> is an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
> 
> To avoid any breakage on old DTs where the parsing of data lanes from
> DT may fail, fall back to the original hard-coded value of 2 lanes and
> warn user.
> 
> The lane configuration is preconfigured in the bridge for each of the
> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> others seem to use 2-lane configuration. This is a hardware property,
> so the actual count should come from DT.
> 
>
Hi Marek,

I don't have 4 lanes waveshare panel on my hands. Have you tested with the 4-lane panel already?

Regards,
Joseph
