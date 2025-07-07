Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B6AFB0C7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611C10E42C;
	Mon,  7 Jul 2025 10:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wn+mFS2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDC610E34C;
 Mon,  7 Jul 2025 10:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPXx6v8KgKRbtJ6QQtIb2ysVvGEuvRUwfvoex+C7wOxz10xeqEWUmD4/r6Ye0wtrPVyMLvI0fS+PQkCevHpues5fHEhG7Q4IqLv2cJ+CQ067jt8N5D9OAmviF5m5IF9uVQtFI42Ci4OrX5aP2RIr3LbbTFd/Zxfd7rETYuRmvAXuOMSUh/qDTWfsBRyTPzGhCbWA6ixW1euK6AnYVyk0O4yALHlbXOrxWNzpvUciH5p6RMgePdrIeJU2/cnOtifK2dtkBA8gj/tjFRp0r/9DD19LYOx8TL5x56I6xNW+M36YmSUF6cIiaNPNVbZOWLCrN/jpGvkgcT4oKv6iktxi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2Y+Tv0q3sN0JicbN0MtThERmOYRFxwKxs8kooDcUCI=;
 b=HvU89CDoRrNhFscVVSHEZOtLYGd3NpSXTY7Xvo5FiRnJilOGNxSdmSFo3jOyWmhi/XSmy74p97TwQg/gmeuSFW6lZamERwSJqnB5QQOejPvV++8dW9zoIEr631y2Hhn5K2SvVz8DhuV7Ghr9MliFxNXT2W79SUIByykBM3RGlMcBy9kFu4VTR3pw8MmS3hfKKs4f8qa4UkGJIdneQhrxsJ3+dMLi49P1l9kp4LvAKcan1gJcU5AsgB2FGWui5BUM3/tv3XgzlCz0yhQGTNeDbHEM/90fmppsuYBMiAIcedg4Ncx9qK+/Ge2Qvu8xhTo0SFcrSPRcQkuT0dL2ZiYblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2Y+Tv0q3sN0JicbN0MtThERmOYRFxwKxs8kooDcUCI=;
 b=wn+mFS2yUYE42y2Gr6HPCasnkJyvHYhqb9c6vjt9tlmNkD4lq7SQM5rvQRL9iWuIHwJsRwJ20ZEVCXgSrnnlH61/SiXuarIWTp87CcgqcpFoUMaN6Gx90u2bNeNJLkW8OGzkcTl1U/ZO/VOdy1p4WrIt0PKcsLXlvzfhgk/ga3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 7 Jul
 2025 10:09:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:09:09 +0000
Message-ID: <e17c54dd-fe38-4f27-89ec-71aeba27706d@amd.com>
Date: Mon, 7 Jul 2025 12:09:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: drivers/gpu/drm/drm_gem.c:286 at
 drm_gem_object_handle_put_unlocked+0xb1/0xf0 [drm]
To: Borislav Petkov <bp@alien8.de>, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>, Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250707093032.GAaGuTuJ0ZYHPgA2q3@fat_crate.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250707093032.GAaGuTuJ0ZYHPgA2q3@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0438.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: da2ec6cf-74cc-426d-3a0a-08ddbd3e5024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNoak5jcFVuQ09DVGpNZEh3TEwxUVhneE5tUzFhMTlaZVBGdkEraG9vQmda?=
 =?utf-8?B?dzNyemFmY21yV2Q1VG1UNWUzVjBneVVMaWl4NXVoSjhDdTl1blVlWGNXbGww?=
 =?utf-8?B?c05Ra0RtL01uVXlkL011Yi83R0lmZlRVUjNuUzdhTm1FUjVUVjk2MTY4SEtp?=
 =?utf-8?B?ckxhSlFwMUZPaFV3U2FpMElEMjdscE8wSU5BUm43YkVISFdzNHE2SUZGOGYz?=
 =?utf-8?B?MEN1Zy80YXVaSzBEN25kWGhNZEE3ZzJCRHpHdnJTZmVNZXRtdkJVTk1PYzAz?=
 =?utf-8?B?eDloblZnSTQ4bnBsMEtuVHh5cTduU0hzaVNmeTlUcDlrQUpJUW4wRlF1VFNv?=
 =?utf-8?B?VFcvdzJnVmhVMXMyZ0g2anpkYVdTTkhFb0VtWUFUU3JQdFU0Ylp1dUZPcWRJ?=
 =?utf-8?B?eXBwTnFlelJRbkVWcmpGMTJJWG9Pb0EvVzN0Z0g0N2VuOVZTZjcxcVFzK050?=
 =?utf-8?B?Y2xDRVNlZktmWDZCUVQySG9ZRUZkYzBVMkx0NG5GWnlKM3BQQjM5dU1PUmR2?=
 =?utf-8?B?bjEydDJ4Q0RqaTRtMTlWM2RQb0VPM0xXRmxnNTRkaUxUdVFqc2xTYUVSd2U0?=
 =?utf-8?B?OGFTbWNjMUZFSE5mSjZaZEZnS2NHZCtCWURCWkg5YWFwN1ovSEJuOEtRTGFU?=
 =?utf-8?B?c0xlRHBicTVTdjEzdHBFZVJ5Um1lSktNU014UnMvNGw0NjFBWkpKd3duVERh?=
 =?utf-8?B?cUIwUVp0YWlXR2w1dkdpWUpObGQ2QkhVUnVadXgxb2lKaU1SR2NIZkJCZTNN?=
 =?utf-8?B?bWdwQkxraTlZSlFjeUF6WTArZkJ0U0RCeEltNzcrOEExQnFkRGx6c2szTXVx?=
 =?utf-8?B?VHVJM080Ulgrc0RhVzZlN2tqWGlrT25aL1l6RFZuajF6ZlQ2Y2VWUU1mS1dC?=
 =?utf-8?B?VVZWbUduUnZZanhwWHlTWlYvTGpHMDQ4eFVrVDRHditWWHFvN0lnMzIzbGx2?=
 =?utf-8?B?SW5kTDBycXQ1eVNxUEVMY25ZY0J4NlA0NHJndllTRExOeWpQTVJWRUJKeGxp?=
 =?utf-8?B?WHpIWmkwNGtqY1FOakI0Ym1XNjIyeGYrRGlMajlrSHREM1E2cHVxK0ZoODQ4?=
 =?utf-8?B?KzUvbVlzZ240K0laZjFNNEpIYk9wSzRaVjhPS016clZDWjI4d2lDWmNGZ2Fw?=
 =?utf-8?B?aHo4b1lxZTgzbGgzSWkzTWJ6NkRGaHEvZ0JNN2xzOWZtMytSN3VkbHhRd1BT?=
 =?utf-8?B?MmMxdkJ5M2lFUEtUN1R2WFpQWUE0MTI2UFRKM0pFcUdFKzZhQ0xRR0J2YnYx?=
 =?utf-8?B?T2l4WVBUSDFwN0RIRGVaamU0NXhhSndldDIzd0hxaU9OYmtNSU80enNXVXlz?=
 =?utf-8?B?NG9oTlNITmNqSElkcHB5MzVoYS9CcEVnY1R1TzZ4NWxpZjVjRG1tWG5xMUtr?=
 =?utf-8?B?TmcxNG9wT1ZTaG5iN0pBZE9oM1BRYnFJZ0YxdDBJOElockdqUGJtQnRBcmFq?=
 =?utf-8?B?NmZkL2dNeEdiL1RWTzFKK05iNHYyQm5pQTVHbURJazN1TGVoSkxkNHJEdktL?=
 =?utf-8?B?WkUyWW1OUXV6ZVlnS3NlUkRoRnhKSy85cWtaN01YTVFxQTJHT3duTFA4Qndq?=
 =?utf-8?B?ek5zU2ZwV1BGOERvNXllRmVVNWJiL05pTWM0SGQzcmkwcS9xdmNCZ2dUR0FR?=
 =?utf-8?B?V01rR3R4QXlKbWpQTUtTd0RBMzdhUkRZNXYzZE5mcVpFMG5jTjZUcDErdzgr?=
 =?utf-8?B?b0w0NE5wU3lVeHdRMllPZm42NmVsdGx0N3Rwa0IyN2poeXV1UzRVWHBDY2R1?=
 =?utf-8?B?QjgxVitNVHRZc3VrWFVLcFFIeWQ5dXhRQUNRVzBZUjVZVXlaZXFOU0o5aC9V?=
 =?utf-8?B?S0ptL0Z3MS9EcEpHVWJDSVdzcVVyaWxMU3RrTzVvSGRYOVlhZmdTZHRoWUFt?=
 =?utf-8?B?QWRKY0pwWnlDRkZtRDMvTzJVRWtJcE1KU1NKeEhuMjlMS1hZOEVhNjJ6RDlP?=
 =?utf-8?Q?g3DTyRNBQdc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1LaGZ0ZnRHUWVSUS90dVJZS3VaRG54RHhRU1lOVkU0KzBXRHlxMWZOeXhn?=
 =?utf-8?B?SXFPTjEzQnQ3WXBUMTNCNzBtUVZJYURlaUJaUkdSRE9TdlprME40clpobjI2?=
 =?utf-8?B?ZlZpL2tpdXExUit6aEFqNkQ5WHEzekR6Z0pCZjc5OFRLWW5SMkprb1pGbnM0?=
 =?utf-8?B?NDhLVDVBMzhnV3dQOXlNRWpaQWxyZy9zUjFnb1BjVVMzZVAxSmhYTGdxa1JU?=
 =?utf-8?B?Sy9aWmRIMnBTQ0Q2YThRRERRNXpRUUZqY2ZWb09TL3dkN280dDhVcTZ6R2xX?=
 =?utf-8?B?cE43SGt6blB1K3dYVGMxeUJwOXpKOWEwUHVWLzlYbkZHakhJamtUbjNtTmZt?=
 =?utf-8?B?YnpLY2xZN1Q4MkpLaE05aDUrbkVXd1Bxd2VKUFFvSVYrRUV4OStnZEk2ZWRS?=
 =?utf-8?B?RGdaRGdVQlZKUHgyUkZOZ2tXR3I5NzhEMytDaDlHTUFLcGZxZUFPZTFmZFNz?=
 =?utf-8?B?SXNYZ1pLU2xSdmRaU05HbnBOdUJUSUxvald0dk02ZGE2c3JMYVZSZ1hJS3Rp?=
 =?utf-8?B?NEhaOVhQNVJvMmQrVCtKVmt3anZxdlVOVDhidFNyK3k2WDlZd1Frdm1SK1g1?=
 =?utf-8?B?K2trUGRJbitCUGZ4UjZvb3BNVHQvRzBPOWNnSGptUnZTaDdrdUFhOHZzT0dK?=
 =?utf-8?B?WlhSSnowM1ZuNUNRSndSc2grZUtZZGxZWjF6bzEzdzVYV0IvWHNtQjFUZ2s5?=
 =?utf-8?B?ZDN5bkhRUWpSNktaQk9zbEhmVUIvYTY3ajMrN21hNnV6MXcyRHJ0S3AxaTVx?=
 =?utf-8?B?bnhUY3hrUnR3OVNQR2grcURieHU4dDdVR1lKdEx0cHVFckpQaXpkMVpvU2tL?=
 =?utf-8?B?RHBHQVFZRWs1YmQwMnVRZHg5R0VJd25GVUVWaVVVSFNEQ3NBWlVBMnpwYVU0?=
 =?utf-8?B?Qnl6RnA3Y3hUNm00Q0JBRjgzTzAzbUZja0gvUnE2dHhLaUtOWUxvK2dia2Nw?=
 =?utf-8?B?YmdNQU1kNlpVMzJCeUFVcTNHbFJpK1FPYjdHZ0lxSExDdFJMSGtISVd3aUJo?=
 =?utf-8?B?dmNsejNSS3V3dlBUVXhIdVFVNzZFMFF3N2RkTUMwOXRwTjN5dlZGbVJlcUFZ?=
 =?utf-8?B?czE4WHkwOXpONDN4UitJRENNYWhsR3prYjZXdTJwZFJyQUV1MVhCNjFFWTdh?=
 =?utf-8?B?WENubnVCeEgzQmhYbmZ1Zjg3YnU2aXNjamNId1J2dGQwRW54cnhWcThJWldQ?=
 =?utf-8?B?TGRtQXBYK2JvZGw4eU9uK0lnVEd5TU5OSUp5RzZMdFJaTUJoeHc4MjNqY0hZ?=
 =?utf-8?B?dG5KUmJoTUppeGFFbE9xenprRlhoSlRYWlhybEtCYjRVRUk1VEhNakliUDRz?=
 =?utf-8?B?dndXdHBIZWZleHVMbW5qZ1FEeStxRmU3ZlV0cjA1cWEzbE85ZE92L2VJcmJq?=
 =?utf-8?B?VEdxOGlNT1JUNytIZnczTnc2OU9sTkFjeUNLY3A4VzhaTVhYcCs1SUt6ZzZS?=
 =?utf-8?B?L3h1bnNGckovcUxrUFE0MndsZmxvdFQ4eWZSUkFSY1AyUUMrLzMvRmdxbHdE?=
 =?utf-8?B?RDhYOHZBektkMTVOYnZPQjhoOTlxTitqa0JmQmRhUWpqcS9kYVYxeUs3RUVO?=
 =?utf-8?B?RkRPQ3hmTUI1ejhSMGxEWVVrMnE0MTN0eStYWGlHM3djVC94cnlLMXBtUkJH?=
 =?utf-8?B?a0M0b3NNcHBNUWtBelZhWTF2K2JrRTdtOXIxS1RlbE9NUzhPOVNtcUt0K0dU?=
 =?utf-8?B?VkNpcXFwTTI2UU1YUGdJdEJhbWZFaTh2clBLNTN3L1cvQXBoRndJaC9XOEgx?=
 =?utf-8?B?SFRDZVNlWUZ1WlZOSXNZeVZFTm01QXluSnFOMGFjd3g5OVBqRTk0aEYvZytZ?=
 =?utf-8?B?M0lzaWQ2eXM0dUR5RllXTmprK0VteG1EQVpSUWNtZzRFNEtDb2FWUFVJU0pu?=
 =?utf-8?B?M2hwaVBOWG9ISitCZ0VMV1JiNWtuYUZEbHE2cXZld3BaTUY0U2lzV25XM2Y4?=
 =?utf-8?B?eVlMMmlybzU1NHZoU20rRkVFaTFvL2Jlb2NwM2JOc2VGQndKSHo2R1kwUmxP?=
 =?utf-8?B?ekl6ZkVkWTQzaFdxWmtsV3Rpa1o0Yko5ZE42TmNTc3Ird2krT2dQWTgwNGpv?=
 =?utf-8?B?NE02bEluY2dOTmkzbWsrZmsrR3YwZ2h3bER0eXA0OUxnek9IQzcxVGxuVEFy?=
 =?utf-8?Q?o2arupZZWOPDBQnWxOizFn099?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2ec6cf-74cc-426d-3a0a-08ddbd3e5024
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:09:08.9213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqI5JLXXStHn9LG1qaqcxPITHnpSLW1a9D8Yk3IdkOc9anTGzVeRWc5VkK0VboRX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
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

On 07.07.25 11:30, Borislav Petkov wrote:
> Hi all,
>=20
> I see the below on -rc5 + tip, on a RN machine.

Yeah, that's an known issue. Thomas and I are working on that.

Regards,
Christian.

>=20
> ---
>=20
> [    5.592468] cdc_ncm 2-2:2.0 eth0: register 'cdc_ncm' at usb-0000:03:00=
.3-2, CDC NCM (NO ZLP), f8:e4:3b:33:37:71
> [    5.593133] usbcore: registered new interface driver cdc_ncm
> [    5.597944] usbcore: registered new interface driver cdc_wdm
> [    5.600108] usbcore: registered new interface driver cdc_mbim
> [    6.912317] ------------[ cut here ]------------
> [    6.912377] WARNING: drivers/gpu/drm/drm_gem.c:286 at drm_gem_object_h=
andle_put_unlocked+0xb1/0xf0 [drm], CPU#1: Xorg/629
> [    6.912429] Modules linked in: cdc_mbim(E) cdc_wdm(E) cdc_ncm(E) cdc_e=
ther(E) amd_atl(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) joydev(E) amdgp=
u(E) edac_mce_amd(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) snd_=
hda_scodec_component(E) snd_hda_codec_hdmi(E) rtw88_8822ce(E) hid_multitouc=
h(E) amdxcp(E) kvm_amd(E) sha3_generic(E) rtw88_8822c(E) i2c_algo_bit(E) rt=
w88_pci(E) drm_client_lib(E) snd_hda_intel(E) drm_ttm_helper(E) rtw88_core(=
E) jitterentropy_rng(E) hid_generic(E) snd_intel_dspcfg(E) tpm_crb(E) wmi_b=
mof(E) drbg(E) ttm(E) kvm(E) snd_hda_codec(E) drm_exec(E) mac80211(E) irqby=
pass(E) snd_hwdep(E) snd_hda_core(E) ghash_clmulni_intel(E) gpu_sched(E) li=
barc4(E) aesni_intel(E) snd_pcm(E) drm_suballoc_helper(E) drm_panel_backlig=
ht_quirks(E) sp5100_tco(E) rapl(E) cec(E) snd_timer(E) watchdog(E) cfg80211=
(E) drm_buddy(E) snd_rn_pci_acp3x(E) ucsi_acpi(E) snd_acp_config(E) drm_dis=
play_helper(E) pcspkr(E) i2c_piix4(E) xhci_pci(E) snd_soc_acpi(E) acpi_cpuf=
req(E) snd(E) video(E) typec_ucsi(E) roles(E) drm_kms_helper(E)
> [    6.912495]  ccp(E) soundcore(E) snd_pci_acp3x(E) xhci_hcd(E) k10temp(=
E) rfkill(E) i2c_smbus(E) typec(E) battery(E) wmi(E) tpm_tis(E) i2c_hid_acp=
i(E) tpm_tis_core(E) i2c_hid(E) hid(E) ac(E) button(E) fuse(E) drm(E) efi_p=
store(E) tpm(E) libaescfb(E) ecdh_generic(E) ecc(E) rng_core(E) autofs4(E) =
evdev(E) serio_raw(E)
> [    6.912538] CPU: 1 UID: 0 PID: 629 Comm: Xorg Tainted: G            E =
      6.16.0-rc5+ #1 PREEMPT(voluntary)=20
> [    6.912542] Tainted: [E]=3DUNSIGNED_MODULE
> [    6.912544] Hardware name: HP HP ProBook 635 Aero G7 Notebook PC/8830,=
 BIOS S84 Ver. 01.05.00 05/14/2021
> [    6.912547] RIP: 0010:drm_gem_object_handle_put_unlocked+0xb1/0xf0 [dr=
m]
> [    6.912573] Code: 55 d1 1e f3 48 89 ef e8 fd 22 1e f3 eb d8 48 8b 43 0=
8 48 8d b8 f8 0c 00 00 e8 cb 85 1a f3 c7 83 18 01 00 00 00 00 00 00 eb 98 <=
0f> 0b 5b 5d e9 26 d1 1e f3 48 8b 83 f8 01 00 00 48 8b 00 48 85 c0
> [    6.912575] RSP: 0018:ffffb5ebc32e3ba0 EFLAGS: 00010246
> [    6.912578] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffb5ebc=
32e3b1c
> [    6.912581] RDX: 0000000000000000 RSI: ffff9efb8cb005e8 RDI: ffff9efb8=
61cd448
> [    6.912583] RBP: ffff9efb8cb00010 R08: 0000000000000001 R09: ffff9efb8=
cb00610
> [    6.912584] R10: 0000000000000000 R11: ffffb5ebc32e3b58 R12: ffff9efb8=
c241700
> [    6.912586] R13: 00000000ffffffdd R14: ffffb5ebc32e3c80 R15: ffff9efb8=
cb00010
> [    6.912588] FS:  00007f320acb2b00(0000) GS:ffff9efcd29b8000(0000) knlG=
S:0000000000000000
> [    6.912591] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.912593] CR2: 00005605532d6164 CR3: 000000000bee9000 CR4: 000000000=
0350ef0
> [    6.912595] Call Trace:
> [    6.912597]  <TASK>
> [    6.912599]  drm_gem_fb_destroy+0x2c/0x50 [drm_kms_helper]
> [    6.912616]  drm_mode_cursor_universal+0x10d/0x2a0 [drm]
> [    6.912647]  drm_mode_cursor_common.part.0+0xb0/0x200 [drm]
> [    6.912676]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
> [    6.912700]  drm_ioctl_kernel+0xa9/0x100 [drm]
> [    6.912728]  drm_ioctl+0x275/0x520 [drm]
> [    6.912752]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
> [    6.912777]  ? lock_release+0xc6/0x290
> [    6.912783]  ? _raw_spin_unlock_irqrestore+0x44/0x60
> [    6.912789]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
> [    6.913114]  __x64_sys_ioctl+0x85/0xd0
> [    6.913120]  do_syscall_64+0x6a/0x2e0
> [    6.913125]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [    6.913128] RIP: 0033:0x7f320b0338db
> [    6.913131] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [    6.913134] RSP: 002b:00007ffd66400810 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [    6.913137] RAX: ffffffffffffffda RBX: 00007ffd664008a0 RCX: 00007f320=
b0338db
> [    6.913139] RDX: 00007ffd664008a0 RSI: 00000000c02464bb RDI: 000000000=
000000f
> [    6.913141] RBP: 00007ffd664008a0 R08: 00007f320a8cbb20 R09: 000000000=
0000001
> [    6.913143] R10: 000000000000004b R11: 0000000000000246 R12: 00000000c=
02464bb
> [    6.913145] R13: 000000000000000f R14: 0000000000000001 R15: 000056055=
3001d10
> [    6.913152]  </TASK>
> [    6.913153] irq event stamp: 354561
> [    6.913155] hardirqs last  enabled at (354569): [<ffffffffb2b951f2>] _=
_up_console_sem+0x52/0x60
> [    6.913159] hardirqs last disabled at (354576): [<ffffffffb2b951d7>] _=
_up_console_sem+0x37/0x60
> [    6.913161] softirqs last  enabled at (352542): [<ffffffffb2aeb586>] _=
_irq_exit_rcu+0x96/0xc0
> [    6.913165] softirqs last disabled at (352537): [<ffffffffb2aeb586>] _=
_irq_exit_rcu+0x96/0xc0
> [    6.913167] ---[ end trace 0000000000000000 ]---
> [    6.913288] ------------[ cut here ]------------
> [    6.913290] WARNING: drivers/gpu/drm/drm_gem.c:286 at drm_gem_object_h=
andle_put_unlocked+0xb1/0xf0 [drm], CPU#1: Xorg/629
> [    6.913318] Modules linked in: cdc_mbim(E) cdc_wdm(E) cdc_ncm(E) cdc_e=
ther(E) amd_atl(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) joydev(E) amdgp=
u(E) edac_mce_amd(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) snd_=
hda_scodec_component(E) snd_hda_codec_hdmi(E) rtw88_8822ce(E) hid_multitouc=
h(E) amdxcp(E) kvm_amd(E) sha3_generic(E) rtw88_8822c(E) i2c_algo_bit(E) rt=
w88_pci(E) drm_client_lib(E) snd_hda_intel(E) drm_ttm_helper(E) rtw88_core(=
E) jitterentropy_rng(E) hid_generic(E) snd_intel_dspcfg(E) tpm_crb(E) wmi_b=
mof(E) drbg(E) ttm(E) kvm(E) snd_hda_codec(E) drm_exec(E) mac80211(E) irqby=
pass(E) snd_hwdep(E) snd_hda_core(E) ghash_clmulni_intel(E) gpu_sched(E) li=
barc4(E) aesni_intel(E) snd_pcm(E) drm_suballoc_helper(E) drm_panel_backlig=
ht_quirks(E) sp5100_tco(E) rapl(E) cec(E) snd_timer(E) watchdog(E) cfg80211=
(E) drm_buddy(E) snd_rn_pci_acp3x(E) ucsi_acpi(E) snd_acp_config(E) drm_dis=
play_helper(E) pcspkr(E) i2c_piix4(E) xhci_pci(E) snd_soc_acpi(E) acpi_cpuf=
req(E) snd(E) video(E) typec_ucsi(E) roles(E) drm_kms_helper(E)
> [    6.913380]  ccp(E) soundcore(E) snd_pci_acp3x(E) xhci_hcd(E) k10temp(=
E) rfkill(E) i2c_smbus(E) typec(E) battery(E) wmi(E) tpm_tis(E) i2c_hid_acp=
i(E) tpm_tis_core(E) i2c_hid(E) hid(E) ac(E) button(E) fuse(E) drm(E) efi_p=
store(E) tpm(E) libaescfb(E) ecdh_generic(E) ecc(E) rng_core(E) autofs4(E) =
evdev(E) serio_raw(E)
> [    6.913408] CPU: 1 UID: 0 PID: 629 Comm: Xorg Tainted: G        W   E =
      6.16.0-rc5+ #1 PREEMPT(voluntary)=20
> [    6.913412] Tainted: [W]=3DWARN, [E]=3DUNSIGNED_MODULE
> [    6.913414] Hardware name: HP HP ProBook 635 Aero G7 Notebook PC/8830,=
 BIOS S84 Ver. 01.05.00 05/14/2021
> [    6.913416] RIP: 0010:drm_gem_object_handle_put_unlocked+0xb1/0xf0 [dr=
m]
> [    6.913438] Code: 55 d1 1e f3 48 89 ef e8 fd 22 1e f3 eb d8 48 8b 43 0=
8 48 8d b8 f8 0c 00 00 e8 cb 85 1a f3 c7 83 18 01 00 00 00 00 00 00 eb 98 <=
0f> 0b 5b 5d e9 26 d1 1e f3 48 8b 83 f8 01 00 00 48 8b 00 48 85 c0
> [    6.913441] RSP: 0018:ffffb5ebc32e3ba0 EFLAGS: 00010246
> [    6.913443] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffb5ebc=
32e3b1c
> [    6.913445] RDX: 0000000000000000 RSI: ffff9efb8cb005e8 RDI: ffff9efb8=
61cd448
> [    6.913447] RBP: ffff9efb8cb00010 R08: 0000000000000001 R09: ffff9efb8=
cb00610
> [    6.913449] R10: 0000000000000000 R11: ffffb5ebc32e3b58 R12: ffff9efb8=
c241700
> [    6.913451] R13: 00000000ffffffdd R14: ffffb5ebc32e3c80 R15: ffff9efb8=
cb00010
> [    6.913453] FS:  00007f320acb2b00(0000) GS:ffff9efcd29b8000(0000) knlG=
S:0000000000000000
> [    6.913455] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.913457] CR2: 00005605532d6164 CR3: 000000000bee9000 CR4: 000000000=
0350ef0
> [    6.913459] Call Trace:
> [    6.913461]  <TASK>
> [    6.913464]  drm_gem_fb_destroy+0x2c/0x50 [drm_kms_helper]
> [    6.913477]  drm_mode_cursor_universal+0x10d/0x2a0 [drm]
> [    6.913506]  drm_mode_cursor_common.part.0+0xb0/0x200 [drm]
> [    6.913534]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
> [    6.913557]  drm_ioctl_kernel+0xa9/0x100 [drm]
> [    6.913583]  drm_ioctl+0x275/0x520 [drm]
> [    6.913607]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
> [    6.913631]  ? lock_release+0xc6/0x290
> [    6.913637]  ? _raw_spin_unlock_irqrestore+0x44/0x60
> [    6.913642]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
> [    6.913818]  __x64_sys_ioctl+0x85/0xd0
> [    6.913823]  do_syscall_64+0x6a/0x2e0
> [    6.913828]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [    6.913830] RIP: 0033:0x7f320b0338db
> [    6.913832] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [    6.913835] RSP: 002b:00007ffd66400810 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [    6.913838] RAX: ffffffffffffffda RBX: 00007ffd664008a0 RCX: 00007f320=
b0338db
> [    6.913839] RDX: 00007ffd664008a0 RSI: 00000000c02464bb RDI: 000000000=
000000f
> [    6.913841] RBP: 00007ffd664008a0 R08: 00007f320a8cbb20 R09: 000000000=
0000001
> [    6.913843] R10: 000000000000004b R11: 0000000000000246 R12: 00000000c=
02464bb
> [    6.913845] R13: 000000000000000f R14: 0000000000000001 R15: 000056055=
3001d10
> [    6.913852]  </TASK>
> [    6.913853] irq event stamp: 355561
> [    6.913855] hardirqs last  enabled at (355569): [<ffffffffb2b951f2>] _=
_up_console_sem+0x52/0x60
> [    6.913858] hardirqs last disabled at (355576): [<ffffffffb2b951d7>] _=
_up_console_sem+0x37/0x60
> [    6.913861] softirqs last  enabled at (352542): [<ffffffffb2aeb586>] _=
_irq_exit_rcu+0x96/0xc0
> [    6.913864] softirqs last disabled at (352537): [<ffffffffb2aeb586>] _=
_irq_exit_rcu+0x96/0xc0
> [    6.913866] ---[ end trace 0000000000000000 ]---
> [   45.744032]     percentage:          78%
> [  225.782261]     percentage:          79%
>=20

