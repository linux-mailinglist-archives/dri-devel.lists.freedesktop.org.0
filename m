Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CF959657
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 10:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC46A10E59B;
	Wed, 21 Aug 2024 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0zkrtA+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2049.outbound.protection.outlook.com [40.107.102.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532BE10E59B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 08:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdW9fXVXunx2qxnNvJPcaR+HkVrXPBZsrC1puolm4jJUOUv9z/HGLotDL8xtP78aMAV+9/HY6APiWhbjIEz34SiVGfqxI0V5Q+saZiXM9IE3edtas44tb296Uk+DRYiLUOxlQR05N7HgBwxq8dzVppa7S8ec0j/3x9edtCp/SVu5bZ6bOyVUyIM2wHzsaQfDEeuXXSa58IBhIGtm4sxZBr8de4cRC7gIebeLTSE0HxURNJ4yTxRYmes+k6FRSZrWLToPgq3t0RVatp8jeZgtc1NxJV6dH8S/UI9Y8c19XtvZv3cGk+HOALgNUpxKlDL5q8Vm+CYaUw2uSBuWC0ZsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSCEw0o99GObOA1oVADcJcy2JTY/MBs8s8yeVRWkyPE=;
 b=e3jWPgUTlJbw7kVfiwoxJbQwNromj9NQ4wnv/a2laD3Y1ns9oFts4g+ysDpBHMCuwsBZ/K0rUg9sLh6FhuPFuysePdMKojR2s2xsF0GzlvSRKMl72Lk3LJ+ebwcweoF39QitWiaSsTkfNsWJimrI7xpDDHGVamcGLrrdrMEnHcpDAjtxxLYtZEbtBmZCnoS+125QJZNIWTzOV4Afp0zC6iX3ihwFVa8Qli9Y+lhCplfa/IvrzceZF7qI9ylou5HcoH4Vq8cEzX9MeIkNAzOL6Wtnv0JenRxIpQdMUOY+fqGAULQyS25FM+MOCxCmWic0W7FrWFTW2FaYTsSlTeFHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSCEw0o99GObOA1oVADcJcy2JTY/MBs8s8yeVRWkyPE=;
 b=0zkrtA+5IpEKjp0kKpoyGLFuCo0+5fhPc+voUPIsVTNjw1y5HhHBcAOw6iX0ichSwU4+aqaxZs46wiueCVNBzMlJmfsWlpm2l8c5cjZFZvqqwDtEC9Mdu4byE+z10hEohhp0CEDd6LntfitZpnTKpYg9xvwDSxaA/hpKODuoU1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 08:14:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 08:14:38 +0000
Content-Type: multipart/alternative;
 boundary="------------i72QPkXNBhy0WxoHYzpzsjyj"
Message-ID: <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
Date: Wed, 21 Aug 2024 10:14:34 +0200
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
Content-Language: en-US
In-Reply-To: <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 6707c637-8430-4738-462e-08dcc1b94d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0NoaURxRWsvVmx4SGpXbGtZRkpia2JVV0d1VUk1RTNVVTlQMXJ0T3NuVlhq?=
 =?utf-8?B?MXJGVmFzaVd3WlZObFhDeWZPUmY2OUIvc2pSM2xNb2M0OHlXR1JzNUk3MGQ4?=
 =?utf-8?B?Njl3b0F0c2VIRzdvNmF0QTdoekhEL0xBOEZzUWhXYS8ySEVmRlBWaS9BYnZk?=
 =?utf-8?B?SWJHSnlYcThBNVJkbTVBdXFtVit0RnRwc0Z4SE1aMzJJUG1IUm9JREVqSzk1?=
 =?utf-8?B?S0dRamRvd0VzT1BIWllYMmpQZ2NYNnFINnlxWWxUbm8vV3EvczFGbktzR3pS?=
 =?utf-8?B?OVRqR0N2Tk5kZ1FzY0VCeS9SVW82K0NsTG1rZ1Y0NzNSWlFHVUpMVWxFOFU1?=
 =?utf-8?B?NDdFVXpjY2g1YTVjOXlaYXRJdFRqc2J1eU9iZjRScWdaLzl4ZjhBU2VXa05k?=
 =?utf-8?B?SFhoaUpMd2lzUzVjV3hHNVJ5Ry83VExWeFdBTEJnVmx0ZlVLaHhtN0l3L1Zs?=
 =?utf-8?B?YTBqaGQ2R3YxZ1dUTHoyV09mZmFZZDFCVzVKSEI5V0xlc0h5ZFBwekJrR1g2?=
 =?utf-8?B?V1R3NFp2K1lEVXVZZ2JXUm5CVHRqdGJnOFVhKy9tOEZzL3grY2FGQm10SVVz?=
 =?utf-8?B?ZENVaUcyZG96bC9XcUMrcVZEaEFLOWxZaWExQ080OUZNYTFIRFhJeVZKbTlp?=
 =?utf-8?B?S0kyZGFrYlpMVHYwM3lNZ1JaY1NYMnZrQTBwNDgxSmZISGhkY3pXYytDYTFF?=
 =?utf-8?B?WlJhSGdocThTSVlVU3ZYN3kwUmJwMzdqcU90NDFyUjF5OWRvNWZMdjJ0NzU4?=
 =?utf-8?B?REhUWHJ1OHRCNERSeVhpWnhtZkpWdkhCRlZkTGQvSmMyMDJuTVhtNHNmdXlC?=
 =?utf-8?B?bTBPVy85TzBYV21GbnBRR20yeWU5bkVmek5XZTNNODVwYjJkK1hQc2hzNUgz?=
 =?utf-8?B?VjgyN3c1L0d0MHVURFpCOGtpQkhYcndwc0NyeENEeVpaOGFnek40SVNoQTFG?=
 =?utf-8?B?bUtTOTIwcUE5WEYySDNvOG50L2wzbVZGcXp0bGpRY3JFN2x3RVloYWJrcUE4?=
 =?utf-8?B?QkhJV3NCazlMN2VvYTNpcHYwRUNaQnUxU1U0N2c4cllacDFHSllLVWpDNU9a?=
 =?utf-8?B?NC9UMis3T25wMFp3UlRsWnJQMFgxSVZraFhnUzJCL3dXRWhqTkxLMitjaTE3?=
 =?utf-8?B?R092VTRZb3BZOE4wNldTV3RsTWNPa0ZGVDJjZ3AyNGRsS2NXOTEzNVBGQVZU?=
 =?utf-8?B?MFJOaHNrL2JINHc0ZGptWXNmYkg4cnE4dEVXWFQ1c3dzRnBtZlQ0T0l0Vm0v?=
 =?utf-8?B?RmFUUFZSZklXdHYyVVlOOXZzNTF1T3NyRjBHd1pVc3pmRG11V2RLcVNOc2F0?=
 =?utf-8?B?WEVjaTlTT0s4blBsaXJnUFFoeS9sdVpzTk9BdDdnbXpMOHVRQjV5N2ZaMUpO?=
 =?utf-8?B?NEZZQms0TFhPdlRrV0RZVHhicTVmNm5MY0JQUU0xMzhKbHFVTUdUNWlmZHpo?=
 =?utf-8?B?aGNGZkVjTHJtaHR3a3JkTWZNRStvQmYvZU1RZlF6dlRwR29aUml2R1MwbUd1?=
 =?utf-8?B?dU9kdkY4SlhadE55Q1hsY2VkeTMzWFdLOFRZcWpaV1FiRFhvcVgrRDRvSG5J?=
 =?utf-8?B?T3RqYTFlTjJSQjZNMjYvK04rYkhiRnV6RVhVSkNFSEJKdVhqYWxueFd2SXBr?=
 =?utf-8?B?QTVFdVFLSzh3bFI0anlsWUZlMXBnUHR2UDNQK2d1cFdMOXNXeTc2N2o4Q1lp?=
 =?utf-8?B?SkJycU0yRGExUFpLZ3dXbjNCNU1TODBEcE9SSU5XN0JDeENpaktBczE3UC9K?=
 =?utf-8?B?Y2pySUJmWnVndGk2QktYeldHSHFGTlRCVXNxSDg2Qm0zekJSRGNRTnhZYXdC?=
 =?utf-8?B?UVRkYko5N09BekJTMDloQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5kQTgwRTNMMGR1Yk5veGc1QW5BYWxpMmpPYVhBaVEvZWZoMSthaVhjSDBx?=
 =?utf-8?B?cFJ5eE1ZSTBOSlFZekNOR0FFcjJGRTdlTzA5TXBEQVY2Y2xyRUlORFlmNnZw?=
 =?utf-8?B?VXIxWERTaDFDRGt2eDNoWG1tWmd2bFdDVURXZWE3bU02cE04TGRPenJQc28r?=
 =?utf-8?B?T3ducFNwVEtncm9CeVpScjl2YmtGenMxOUxxcGgzOFk5SDF1YjdJeEhoVStP?=
 =?utf-8?B?c3R5OGkyT1JuSlRJb0k4UkV4ampiMjg4Ui94Q21ac00yYjRnakpaTi9rcEZK?=
 =?utf-8?B?UnNsMXZhZUk1WGpFdG8zNnFYVFpRdk02aVI5d0lBWXlXUGtkSXRXY3o3T0xC?=
 =?utf-8?B?WWdFOGEvZ1JsM2xxL0ZGc2tkaE9oK0JvME5SZStzNURVWXY2NXMzL3hCUWgz?=
 =?utf-8?B?Y3laWGpmS2hhQ0lQSHd4Nk9SV2FJbmNucnFBU1RQWnZYOGF5R3R1TXJKQ3E0?=
 =?utf-8?B?Z2RRVEk3b2lneGYyYXVoMTFBaTc0WnpiWFFuMTd3R2s3TDBSZDFERlorRHQ3?=
 =?utf-8?B?YlNxbjZaS05aRmlpZTRCQ0dGaUdEcDNvZ2J1S01zRkRHb0podExmOVNyL0dz?=
 =?utf-8?B?ODdLUkNRWFd6eitMNmwwVFdzYUZHRytrSDhRdlh2UkJ4Q0VGQTVsUTRtSWc2?=
 =?utf-8?B?UjFIVUN1d3M3YzVwcmxmVnNtSzBzSWFXL2psVWxKUUYvbzQvd1RsQkdsVzV5?=
 =?utf-8?B?dncxMHEzeVI2ZkJaa2VSc2FXMzdOWlVCN3U4ME9peGE1N3c3YzR4Ykl0NmZ0?=
 =?utf-8?B?S2g3cDhOOGlwUElsakFBUUxmUVZPbSt3OHZoR2poMVpLS2lMcG9lRHF6ZlB0?=
 =?utf-8?B?djk4ZTZpM24rRWZCcGRpZUIzRlY4Tys3NXJXeThVZ05uVHZacmRrSzEzUkQ4?=
 =?utf-8?B?S080M2dGbDhIaW0xVU5PdnE1ZGZuK3pXWE5NdnhpWUhZeGpseEE1bElWRnI1?=
 =?utf-8?B?NFNlL3lGMzRMTkFPd2h4c0gxZktyTG1aWHFnU2pucUh0ZXVRMytMSDBWR1dJ?=
 =?utf-8?B?b2Vha1JTc21iWjFabWUxTXlZQmtSQ0pRaHdtWmFxUTN6N3NrNysxenBUcVUr?=
 =?utf-8?B?OWYxZlhMY2lCMWZOZ2xsZWU4MjZBNmFVelJrc3pDSVA0bHU0WWpiQmN4UkRo?=
 =?utf-8?B?VGx4QWdBZjV1M0x1UGhzMVRuVENDU1cyZ1lYL0NMaUxEOGs2c3RFTy9NWm9o?=
 =?utf-8?B?VUpqaDVUbWJNb3BuNSs2a2RaaGJTNGFuRUMyeVp2ZG53TVRwNHRUK3YwSEhi?=
 =?utf-8?B?elFsZ2FiTHdOcHNYNDdETjd0RE5LanlhM3Urc1BONHJ6ZzdtT1plakI2emVp?=
 =?utf-8?B?Y1hCTmdGUmpWVFl4K3R6VVlTQk93OXFtS1lXZXZsYmhwNFpWbk8ybGtTUFVU?=
 =?utf-8?B?Z1NwSUdTWUFFcjVIVzVWQlpBVkIySEJ3UDczeExuN1B2cXJDeEFjWXEyQ3Q2?=
 =?utf-8?B?ay92Q2l1VExRUXBjMS9JZFV5U2lwZC85c2VuQlkrUHJnNkthb2xkZGQ1LzBn?=
 =?utf-8?B?ckk2NHNPekQ4VU5UazgzVEpiUkFjeGt4Q3pqZVc3UUV4TzFoWmJBMHZEZEE4?=
 =?utf-8?B?RmRLanVuSjdpMFVFYk4yaFdiclNpcSt3bmZtV2NKZ1lWUHpKb01WY3cvbEJm?=
 =?utf-8?B?ZTAxWXkyZzBheUlFLytVY0FscHpwSU1tdGdRbGI0MTNaRHlIV1VBejZvOHhJ?=
 =?utf-8?B?YTJWM0NEZHdWZUEyYkNuSGtWM3ROTFdtdzFXNGJROUFMRnFnZjVsTDhBRXdp?=
 =?utf-8?B?Ym9xandPKzNTcW1pOEUyTVpxdGhvUGJzR3FZMWExN3RiRXVBVGV3RmNJRVA4?=
 =?utf-8?B?NFkyR0lKWXBsOE0xQWZDa3hESWdVYUMwdGtJTUVZR2VhWG4xeWVRMWpPTzA0?=
 =?utf-8?B?Z1R1c05ycUFrQnppY2xnamRUTjRrZjFaM2VYM1JyQU1nVG1NSGpFeFBmOWg1?=
 =?utf-8?B?VjkzTXgydHBMbjJOelk3SUZxdVNzTVlCaUkxRDBXTUVkSVRmbUpBcDNxWnZV?=
 =?utf-8?B?V1VheFc0cVJqeXo1MDF2OHpkV3E1Y0phL2JxeUR3VkFBQmp2T0NqNkY2bkF3?=
 =?utf-8?B?SG1kdmtlVFlRM1M5WkFuZVhsZmcyeCt1dUZ0YWRRZkpmTStGVFpYTlY2YTNW?=
 =?utf-8?Q?iLMh7jB4RdnUH3a1giGtQd0RJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6707c637-8430-4738-462e-08dcc1b94d0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 08:14:38.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYRSCmiFgzEYYJklR9jp7GbyAhg6RgnNksdAcMal3oBOOUFZGtuEOOYtEfKtFNjf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927
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

--------------i72QPkXNBhy0WxoHYzpzsjyj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.08.24 um 18:00 schrieb Thomas Hellström:
>> Or why exactly should shrinking fail?
> A common example would be not having runtime pm and the particular bo
> needs it to unbind, we want to try the next bo. Example: i915 GGTT
> bound bos and Lunar Lake PL_TT bos.

WHAT? So you basically block shrinking BOs because you can't unbind them 
because the device is powered down?

I would say that this is a serious NO-GO. It basically means that 
powered down devices can lock down system memory for undefined amount of 
time.

In other words an application can allocate memory, map it into GGTT and 
then suspend or even get killed and we are not able to recover the 
memory because there is no activity on the GPU any more?

That really sounds like a bug in the driver design to me.

> And again, all other drm bo shrinkers do this. We just want to do the
> same.

Do you have pointers?

>>> If we bump LRU we could end up with infinite loops.
>>> So IMO we need to be able to loop. I don't really care wether we do
>>> this as an explicit loop or whether we use the LRU walker, but I
>>> think
>>> from a maintainability point-of-view it is better to keep LRU
>>> walking
>>> in a single place.
>>>
>>> If we return an unlocked object, we'd need to refcount and drop the
>>> lru
>>> lock, but maybe that's not a bad thing.
>>>
>>> But what's the main drawback of exporting the existing helper.
>> Well that we re-creates exactly the mid-layer mess I worked so hard
>> to
>> remove from TTM.
> It doesn't IMO. I agree the first attempt did. This affects only the
> LRU iteration itself and I'm even fine to get rid of the callback using
> a for_ macro.

Well, I mean using a for_each approach is objectively better than having 
a callback and a state bag.

But the fundamental question is if drivers are allowed to reject 
shrinking. And I think the answer is no, they need to be designed in a 
way where shrinking is always possible.

What can be that we can't get the necessary locks to evict and object 
(because it's about to be used etc...), but that are the per-requisites 
TTM should be checking.

>>> In any case, I don't think TTM should enforce a different way of
>>> shrinking by the means of a severely restricted helper?
>> Well, as far as I can see that is exactly what TTM should do.
>>
>> I mean the main advantage to make a common component is to enforce
>> correct behavior.
> But if all other drivers don't agree this as correct behavior and
> instead want to keep behavior that is proven to work, that's a dead
> end.

Well no, even if all drivers agree to (for example) drop security 
precautions it's still not something acceptable.

And same thing here, if we block shrinking because drivers think they 
want their runtime PM implemented in a certain way then upstream needs 
to block this and push back.

As far as I can see it's mandatory to have shrinkers not depend on 
runtime PM, cause otherwise you run into resources handling which 
depends on the well behavior of userspace and that in turn in something 
we can't allow.

Regards,
Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>

--------------i72QPkXNBhy0WxoHYzpzsjyj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.08.24 um 18:00 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Or why exactly should shrinking fail?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">A common example would be not having runtime pm and the particular bo
needs it to unbind, we want to try the next bo. Example: i915 GGTT
bound bos and Lunar Lake PL_TT bos.</pre>
    </blockquote>
    <br>
    WHAT? So you basically block shrinking BOs because you can't unbind
    them because the device is powered down?<br>
    <br>
    I would say that this is a serious NO-GO. It basically means that
    powered down devices can lock down system memory for undefined
    amount of time.<br>
    <br>
    In other words an application can allocate memory, map it into GGTT
    and then suspend or even get killed and we are not able to recover
    the memory because there is no activity on the GPU any more?<br>
    <br>
    That really sounds like a bug in the driver design to me.<br>
    <br>
    <blockquote type="cite" cite="mid:bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">And again, all other drm bo shrinkers do this. We just want to do the
same.</pre>
    </blockquote>
    <br>
    Do you have pointers?<br>
    <br>
    <blockquote type="cite" cite="mid:bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If we bump LRU we could end up with infinite loops.
So IMO we need to be able to loop. I don't really care wether we do
this as an explicit loop or whether we use the LRU walker, but I
think
from a maintainability point-of-view it is better to keep LRU
walking
in a single place.

If we return an unlocked object, we'd need to refcount and drop the
lru
lock, but maybe that's not a bad thing.

But what's the main drawback of exporting the existing helper.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Well that we re-creates exactly the mid-layer mess I worked so hard
to 
remove from TTM.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">It doesn't IMO. I agree the first attempt did. This affects only the
LRU iteration itself and I'm even fine to get rid of the callback using
a for_ macro.</pre>
    </blockquote>
    <br>
    Well, I mean using a for_each approach is objectively better than
    having a callback and a state bag.<br>
    <br>
    But the fundamental question is if drivers are allowed to reject
    shrinking. And I think the answer is no, they need to be designed in
    a way where shrinking is always possible.<br>
    <br>
    What can be that we can't get the necessary locks to evict and
    object (because it's about to be used etc...), but that are the
    per-requisites TTM should be checking.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite"><span style="white-space: pre-wrap">
</span>
          <pre class="moz-quote-pre" wrap="">In any case, I don't think TTM should enforce a different way of
shrinking by the means of a severely restricted helper?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Well, as far as I can see that is exactly what TTM should do.

I mean the main advantage to make a common component is to enforce 
correct behavior.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">But if all other drivers don't agree this as correct behavior and
instead want to keep behavior that is proven to work, that's a dead
end.</pre>
    </blockquote>
    <br>
    Well no, even if all drivers agree to (for example) drop security
    precautions it's still not something acceptable.<br>
    <br>
    And same thing here, if we block shrinking because drivers think
    they want their runtime PM implemented in a certain way then
    upstream needs to block this and push back.<br>
    <br>
    As far as I can see it's mandatory to have shrinkers not depend on
    runtime PM, cause otherwise you run into resources handling which
    depends on the well behavior of userspace and that in turn in
    something we can't allow.<br>
    <br>
    Regards,<br>
    Christian. <br>
    <br>
    <blockquote type="cite" cite="mid:bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">/Thomas

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------i72QPkXNBhy0WxoHYzpzsjyj--
