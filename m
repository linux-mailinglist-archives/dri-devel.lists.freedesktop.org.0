Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263693C714
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4830010E2C6;
	Thu, 25 Jul 2024 16:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vhcvd92w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3AF10E22E;
 Thu, 25 Jul 2024 16:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twNA7rkXv7ztSYkoabgEi8PHnA3hvOw2/FDCbtoFV8l7YcDR6rgOZASuP4pIN4X+gCopRGhYdl4jwl2pT5A6KVHsMmQ8uxod13uB6bSEGrrnrUYVPXLBZaG87bVQ17QoairTNmj7gxhKLYmsPgLeA4Q6SIjm069KTdHUPHTlxsUK5TFCdDpWxlJPI9n+mvfpa4vLUWrG0YfKSNRmeJWMPSbbu8IzCFvc3GGVwHEwkgN+hUFlbLc6fgW4aAlBIUlzlPgPQ86+2HunHzuZVCPMQUg8TJKks/9OmsN/dKstwBXpkohErWesZ1q6zuB0MWMe8thifXO0vbn5ZeEkES3mPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqUjuZKDE4sIcFTq/EJy5erbYe3DebmWQkrlckyNSDQ=;
 b=kAqMiQ445AgywoQan12azCrF3bClPduhW8vyuyVrKUCrmCTr8Lpqe2a5FABkL8PEbVi6FnJAkAevEDFrXL8JWmxWMQfCSQHXWpVvHZboMeAW+yi0L2x5qKh75ArFnuXyCAV5q2Pzyp/0eqDmS1ems6q6ZEiZsm/x8mE07D8KeoM6Nq6CUcyCoFYzawBBV2RfuCB+Rp/Pq+zdZPMJjiSsrgGr53uhxMUfhL5dFglo9RK8bnvtzT4ef88ZBjKUGmXvPdxoibEa7NTAN0eyoFmYkrBGcTDeqkMY4ZEO/L7a/0lID74rGilq98eX4HsE1/Fmrjk2+N2PZT1GpleBypk+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqUjuZKDE4sIcFTq/EJy5erbYe3DebmWQkrlckyNSDQ=;
 b=vhcvd92wk5Xlb/cp3iJR1amasGx1K/f+cEvZ4ALkr1gn7b96q9oHHuWjzA99UM9C+ODUxnbhdKBtS4W66pjatIQEHCgcWUeCEljGNu2uF+mFmmVbucmfKUoMpcBkcBpk6NAmeAURe88e0f9gCv+eZXKwqIFbWsSroYy1wXaS1sQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 25 Jul
 2024 16:23:40 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 16:23:40 +0000
Message-ID: <b0017268-5651-4031-901e-45e64319d537@amd.com>
Date: Thu, 25 Jul 2024 10:23:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] drm/amd/display: clean unused variables for hdmi
 freesync parser
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-2-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240706034004.801329-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0165.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::19) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a04b4ff-b3de-4221-45d0-08dcacc624ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUtzL0FaZmc0QVNaVVVHQkRURUNIYzJpTEdqcWUvUU0vVnNuTytGK01tVGYx?=
 =?utf-8?B?YXlFVll0SU5uSzB2MkJaS1FoTWhPM0J4My9EbTBENXVTWnNwd2F6UjZqVVpT?=
 =?utf-8?B?K290L1ByOCtJRWtnSTB2eHgyUzE0R2hLVjhRcEt5YXYzc1NsenpVaUNMdmtQ?=
 =?utf-8?B?VzJJdHpQbkJXQnJjbS9lMWF4ay93OWR4eWRPQTVLYmdDb1JSM3pLOXBadWFY?=
 =?utf-8?B?enl0Vjl6VW15blB4ZGZpdVNwRGZjUXppQ1A5OC9ZY0EyYWdBR2tlemxuaVha?=
 =?utf-8?B?V3k1UzZodmxYQ2RyL3plM3pTTU5DdlhSdWo0UVF1R0VDQUVkTVA4M213aXJu?=
 =?utf-8?B?OFg2QUFocmx5Vzh3Q2RQNzBvbUVkZXdPRDI4QzY1Y2xjR0E0M3F0YmVBMDdZ?=
 =?utf-8?B?bmpmWldoell4VUcyWWxNUEozbzZrbUF5VUJ1T0RrcVBDVmw2cnAzQitPY3pQ?=
 =?utf-8?B?V05NeFViWGR5VmI3UUJWRW8yYlE1ZGxLeVMzcjZNMTNTWncyMDc4cE92dlpl?=
 =?utf-8?B?OWQvQi9wdmlDWklON1EvOTJ2bEpTWEJHeVVmYk9ETnJMOG0zaDhJZzZKMm1V?=
 =?utf-8?B?b2R6RFFqcW1STktYQzUvRjd1MmNCY2ZBUHlGd0NJNkE5eXdtVmV0STJseDY2?=
 =?utf-8?B?MjZVaEJSdkthQkdXVGhBOHc5S0t5a2FINUpoOXlMWnZ2V3p6NVlDQ0NzUHlB?=
 =?utf-8?B?dU8yaFUxSlpWdXBZTTVjU3M4SXFVNlpBbDczdllzd2FWTnpCTzVlL1J0UGd0?=
 =?utf-8?B?SmlJTCtMQ2tLWTBjUWVaeG1UbHl5N0hrNXljdVA0R0RlVmZldkx5NnMxWWJu?=
 =?utf-8?B?QVZDZmNpNE9jK0RBdDhRV3luVlNhdy92dGFpbVBITEJPd1ZRNGN3RnZ6Mkgz?=
 =?utf-8?B?TTBkZFhrTmR4dXo4dHdsZVQ4TFNNd0VlaTJjK1pzNTA5dWkxVkRKUEVqQUt0?=
 =?utf-8?B?Skt6ZWs1Q2dXTGpiNFp3ZWxBcFRiNUI0bXRwSW43UGhLYmNYNmVydVRnMXFX?=
 =?utf-8?B?TDlhYXJtMFBBQTU1YWVpMmUvQ3B0MFFZK2c2SWI5UjZUcVJ1SWVxTnQ4cURx?=
 =?utf-8?B?a2NLK01OMWpFeDVSVXZCc0l6UElYYWFlRGtpVVo5WGVzUXY1NXVVWllERmJZ?=
 =?utf-8?B?RDlJZzJSYlFGamxYdUVKaFZSeHl3N3lOOUd3NXB0dzJMallMKzQwUS9NdTIr?=
 =?utf-8?B?a0ZPUkVRaDZiV2hvS3NqK3Mzamt3OFdIQi9ORHRxcUw4VWhsMEtkRlgzaC82?=
 =?utf-8?B?MmFlSnBzeDRnSlpqNXA2RDJOVkFrTWJiQjIzTHNUWVNaMVFNMDhXQ0FuNW5J?=
 =?utf-8?B?VmU2b2FQM3N6QXJPNDlpcUNDaEV2TjdKQ25uaVhrK0t1dnIxV1hodmhmTytR?=
 =?utf-8?B?TTdpQ25lWE5BN1plVVRTcnBuZXo5ME4zTitkYnE4Z3JiOU9qSVJEbThIRHBq?=
 =?utf-8?B?VHh5KzJyQ2M0Z2VmVng5NDBwdDFlMjFkM0QwSGY1QVh3VU44MzE1RzdIUEZp?=
 =?utf-8?B?amJ1emNIVXZmUXc1KzUrRCtreVNnRHZWbDJoY0JybkIvNTAxQzNwcUM4elBw?=
 =?utf-8?B?SDcyeEl5TDZJRGQ1YmNaL0ltZENwR1YwZVFHWG0zalBVNkJJZlRIODFlVlZS?=
 =?utf-8?B?dUltS0psOHk5bFM1NnNPVi91QmQyM0s2c0NjZ2J2UFJCOFZXNTZsd0VYenR2?=
 =?utf-8?B?bmg1UXRPRlZQR2ZMRWZ5cWE5OHN0QWMwYWFRenNuMlg0Tzl5ME50MFlRWmFL?=
 =?utf-8?B?YkZsRWlFaWdzKzF5S2MrRHk3ZnNKamdaZVpIOFV3Y2FjVU1DdUhia1N1NVVs?=
 =?utf-8?B?ejIyYXA2VWcvZ3B3ZWVDUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEV1eTFHTXpYeHByeHJvTnhOMUpBUHJkWHFwTFJqNjZmNjRhcEZYdFRpMHgx?=
 =?utf-8?B?QXM2YUVTaWxweWs0RGtQcStLT0pWcW9xMk4xTnpoZEpVSWEvc014clJyRlRm?=
 =?utf-8?B?Y0NQZkNCd2J6SjJqRWtRUjVrdFVHUTJ6dlB5aE5NTmJEZWF1L3puUU5aS0l2?=
 =?utf-8?B?MDdKeHd0elFFSG9PU2JvVzEwQnp2NzFlQWxDUndnYmpTaDVyUGw0TUgwSnlQ?=
 =?utf-8?B?NTF5NmlmM2E0Nk9QNnJjeHhSbE1SMFZ1OXpiRkR4OUQwbUFVWlloUjNzR2s1?=
 =?utf-8?B?UmtUV1FDUFBLVUoxdEFOQnkxNGYxd2FCYThOcmVYZ1FYMnozS0dvclhBTC91?=
 =?utf-8?B?OGNSejlFZ3d6ZnhBV2swa2xVMWdUeGZJVTA0MnpNUG12M3lkTHZqMU1JQXpO?=
 =?utf-8?B?VjBRNVdpYnNmQ2RHN0RsTTdZaGhrLy8xa0pHaU1xQmt0WEJDckJmVGxLRzdm?=
 =?utf-8?B?aE5ZdEQyU2dNL3JJdm41RUZhSTVoK3JKY3Awdjg1MnVyL0ZGYXB1czhOZjN4?=
 =?utf-8?B?b0NURUxYV2N2WHdVV0pRakhIdExrK0tTTFk3c2N1SGtVakt0YzYxblZrcHUy?=
 =?utf-8?B?Z3dmT1lRTUNXR3FZQmxhanFKRVpXUE01NDhvMWhSc09jallGNDQrR2RmY04w?=
 =?utf-8?B?RzNPd21OcjlkTnJRUlJTRUtZR3dicmJmVzFBQ0NoZEgwRFI3UHpra1VYbmRR?=
 =?utf-8?B?WDlJZk0vMHVoc3BIK215SXl5VW01b3JJUDVIVWFyVWs5YThvanB3QnBWMnR4?=
 =?utf-8?B?SGJPc1BCL0VnWFRQWGo3WE9xR0NVeUxwRmdnQmp0cWU2SkJyaDV3TEY2M09X?=
 =?utf-8?B?bEhUQkFjV2xaNU1JRXhsRHdBM0hwWHZjRmxIbnc3NTNTankzSHAwRG5NZzA2?=
 =?utf-8?B?cGphTnBrbndrRFM3VTFKUmxRTUQ1NXgxS2FHa09nb3k2U0pjRGh3R290ZDBn?=
 =?utf-8?B?Yk1UdTkzQThFSngwMTZWWWdhMG50cXF2UER6ZkJhYTZqNytDbEczOWdNVSsw?=
 =?utf-8?B?V0FsSkU5SDRZZ1Ntc0N3a0VTVTMyTHNwTFNXRkI1RmVFZkNXRFB0S1BKd1ln?=
 =?utf-8?B?VzJLL3Q4K1owQ0VaWTBVQjh2bXRQZDVMNUZ1NzFwVGZ0eFpJNzhoRENzQnZV?=
 =?utf-8?B?YVFCQ3BPMnpZZ2svYTJlTHRZWldGSHJ4TVVUVHN4SlJqemhqdTRQNm5TT0Jx?=
 =?utf-8?B?VHdEakVtKzJIT3RLUjQwb1pUS2pGMHlXZldWVXBKU2EycW0veitodFhFY3Jm?=
 =?utf-8?B?cXJObHplME40NEU5VUU5UDcyd0FKSTRPbi9Xb01wNFVaR05CN2V2VHVjMHk3?=
 =?utf-8?B?TUhXbDIrLzgwYUdvYmV3TDNjM3BTeFNnMDBaTjVUMlBQUTdGZ0Q0VHpxZXZ6?=
 =?utf-8?B?cjl3clNtck92Y2l0Rnc0Q3VBcWg2M3EyR092MVNzb3Q4U1U2c1I2K3hFSk9s?=
 =?utf-8?B?ZmJIRys4ZktLbnozTnpaWjYvWWpOdjN1RW1oZHpieHQreWJuellOSnlzVTky?=
 =?utf-8?B?bSt4dHh0ejloM0RrUzQzVHZkc1J0Uy9wM2ZwSFY4bHhUdmFyblY0US9LSHdy?=
 =?utf-8?B?enRWQ0s1R2RNNU1KYmp5VnZlU2FZbVRycmNDZGZib2dGSFVIRlArZjRYNVZK?=
 =?utf-8?B?clFzSllrRTFTUHdTc2Y5YnNZOGJIYmF6TTNUZlJrZkVYOWVFbi9STWxWREM1?=
 =?utf-8?B?SSttcVJZK0pqM3phUEFsWGFtbE1ldVA4Y0tYV0V4WVhoc0xHNjhvYlJmOU5E?=
 =?utf-8?B?RzNZQzZTYnZsNjdDQ3lzK2I1ZGxXT1hYbTFvMFhlZ1o5N2IxTTdNam1JSFVa?=
 =?utf-8?B?UWE0eWpwU0oxOTAwZGY2bFFxOWt0cXNnTDFkcEM5T0gzT2NGUEVRaWMrNU9y?=
 =?utf-8?B?V1pvbzhGaGhFdXp2M2FSY3R1ZTVnMlkzVzFPbTVLS0l1VXJpYkdsMklGdjM1?=
 =?utf-8?B?dHlJTkhyb0hHSUw0blFHOEVYQmJRUnBTTXRmTXVqM3psSXo5VHNKTVduWVc3?=
 =?utf-8?B?MGNES1NOaDRmQTdDbEZkUXIrNnFWU2ZTbU9vT1ZTU0ttYjVVdWdYZy9iSVgy?=
 =?utf-8?B?bW51Y09SbHJ4L2VUM0NFOWZiY203WndRWEZnYVlRSU81TExQMFFyQ29xZ01u?=
 =?utf-8?Q?Kc18r4f9QuasPu/LMlt6wT1VS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a04b4ff-b3de-4221-45d0-08dcacc624ca
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:23:40.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkPVDyRvAekM4anThrSzu435ARCItqezDaC3KfDAnRti0gUlupEoRg9KEf9a57mXrwDputJSYaD1dleoVZGnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038
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

Hi Melissa,

There are no commit messages in this patch.

Also, do you think this can be merged with Patch 5 "drm/amd/display: 
remove redundant freesync parser for  DP"?

On 2024-07-05 21:35, Melissa Wen wrote:
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 98cf523a629e..1dfa7ec9af35 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -12108,9 +12108,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>   		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>   		if (i >= 0 && vsdb_info.freesync_supported) {
> -			timing  = &edid->detailed_timings[i];
> -			data    = &timing->data.other_data;
> -
>   			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
>   			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
>   			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
