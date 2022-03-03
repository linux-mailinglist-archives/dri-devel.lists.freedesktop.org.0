Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D634CB77E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 08:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC3010ED02;
	Thu,  3 Mar 2022 07:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77110E9BF;
 Thu,  3 Mar 2022 07:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmglqWHIYVuIJ1p7EKpHpH7kEJPq2909Kw351HftFhvqpyRtXFilOCtR4le1/mY/6tsoUGiW++UyWi0ZD41TLriDReIGaXnbJFsErWUjmJgc8OfPj6awIs/7SVfysL0sewwV+e4coLpqbcSSGcw223pjuw8PttpHFdPvTetFm9qmuqJw6FLmHSQ8tzmf1NPdNSSkx2g4LXBzwLRNx3aDoIW2GzwF9JIWE5LZk38mpW1VMaLjVPyR1gg4krDEW08ptHA/MPbmIImJMa9HEllF17iJUJqZgNSSGIwnzJ0FiLa3sEWTWoPrvReyaR7O7IGxxDqe78vCNI0zAwRtInp0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq4/0FDsyF/kkcvhEs+gEUYvZuSHqlX/dAmnWNac0lw=;
 b=TjkWlVQqMQpLNKK9UC2kYW8Ql9rUtJckT1SmPQ4i0scOUwbRfaQEnuxHZ9mkenXRzc5k4z/1bHfeK2U7UTLzg5HiYLcNCQI04oWEdOT/6P/UIunn14xgC1L3BQDsRU9b3G3F6ZbBTzpOBS3tuF40lnI8twBwaEwwWxdSGbGmm2hZCSf7dr/fgi9HhfFMGmPpBSmaV/a9WKIx6/eyLrA25DAaQx2AZcrFURD+EpGqS/cwPWLkP2FYT8aDzLwj3MKgrzP1NAKca0h/hLMR1cwbSDppVXjZ87rpzEqgXbdsmOIl3Dm6gt/dvZIB0q4/JQYNw0yIFawAneevM7pD6vQ8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq4/0FDsyF/kkcvhEs+gEUYvZuSHqlX/dAmnWNac0lw=;
 b=AJz27pEVFJF86pQYzqq+aXIOCcOB/nuFRu+n+cLmjSC+DjFsd9cpKon/SwfqADyrapXfm9Vd/TZyILqsS/mqL3ZCycXT0nwqI6XD9gVsxC/KbAypht9POLjTEDvWlkgUTSM9sb9pE2KWsC/zvHcKen8kbQDNbiWF8z4utChkLnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2343.namprd12.prod.outlook.com (2603:10b6:4:b3::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 07:09:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 07:09:32 +0000
Message-ID: <48646a29-9cd1-f1c7-9230-453aadbfb07f@amd.com>
Date: Thu, 3 Mar 2022 08:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/amdgpu: clean up some inconsistent indenting
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@linux.ie
References: <20220303015215.92536-1-yang.lee@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220303015215.92536-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0214.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2316bb9-d550-409d-2338-08d9fce4c415
X-MS-TrafficTypeDiagnostic: DM5PR12MB2343:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB23431C30A3C6115B6CD1987683049@DM5PR12MB2343.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oj1QJkY0afyrMDm14VZmJNYqbtMkEc/GxurEfM1/LDtBzxJdlRwjIO/JDFTubqNTEm+hRaf2TnlLK4T3PT+2RK7F/+k5wNsnPiAKm8aeJ23ZfdGDzFQwffLGMIp9Ju3/GrVDvaWZMY3Z71HFcVI8+slNFTD2vter0K5ngA/AhSnkak2MzBB1NRWYxhNEX9cx0e0RKVbocNJ+l1rRZB5PLMAXHRgic9loLM33XXPcFUnYKd90i/el7Bk7xDQd+jOqh4/TbiU23izRkROF3IGxn7R47+zaGhFI9daLbnaafceqoq/Ero5hb2ElgIbN6bQI1i1893ml3z+ExPdeRMgcO8XpmEfdJI71vxJXrUan1xSk515+0aQT1+5S7wnwdO5UUekotYWws0heqR4M/AuijggDl9Wq2Zmmvlbs6BnAv9rInJLW3X+TPKSfM7fE/c1Kk4jB9Bu9+spukUi6F+Zaw55Bahk1a+925wJEx7YN1lHeTq/HgLPgg3dBT88Q4Mq9UgIu4x4LFDxsRy1ucD9hW+OE9jAdKSV+58k+8jM5reQMPeP6KogSOgPtLbQPYSk1Gr6MSDGmFkmoAmHPSOcx0ciB6O5DB6a0VyXk3xRI0Z1/t9MjYYhAqaKN+0wmvfAThtvCionJYNiO8GQ5JLPLWxp+fTxMlnBczE09dASqDVyw6uJS931IbNnGGTIs/lw5GsApNa2R6E+awzVOr5/vBZOqlKHHMnjSngSOpuxnt9BxMIzlsb8PprzJ2qOwVuRl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(4326008)(5660300002)(66556008)(66476007)(66946007)(8676002)(2616005)(36756003)(31696002)(31686004)(66574015)(83380400001)(508600001)(8936002)(186003)(26005)(6512007)(38100700002)(6666004)(2906002)(6506007)(86362001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnNZcFdsTDZYV3pmdTVHbllWL250dEdaMVR2b0h2WkFvbDdzMUxuVFpaYTdt?=
 =?utf-8?B?RjlnTUFWQXI2MjJzVThIRzV0b2ZsSy9FR09xeUNSZGVaME9vSUYwQzNzdFVo?=
 =?utf-8?B?RnhIdS9pSDRZQWFzR1BIYjJoVitrekRvYTZScEliQXc5d29qUStJaWplQkFO?=
 =?utf-8?B?S2Ercll1cHp5bU1ab0g1aU9LVjJ2RWZOenNpOXhIcENleFdSdlJSa0VOc0R1?=
 =?utf-8?B?SkN0emM5T3I2eS9vWGY1aUEvM1RLNlA2a1RaUGNWVzlnYWFXVzc1MnU3bUZQ?=
 =?utf-8?B?c0Z4blBhQVhhUUorcUdhVDVFWmlIMmQwSThTbzBWTEFuOXlYUW9nOGZFWUxQ?=
 =?utf-8?B?ZGJtSmxPbk1mazRkVEc1Ti9EbmpheGdYVnZsdnZMbnJpTXRJamdCcEVnT3hs?=
 =?utf-8?B?eUlqS2lja2M4VW43ck12SUhuRXcxNjhkWFVQdzRRSjlrQW5nMWwvS0xJaTMz?=
 =?utf-8?B?SGZrZC95cjl3T2w0NmZsUnZUUVhqMnkvcVNxNjM4L0QwUkU3bjJxSHNad1Vt?=
 =?utf-8?B?OWt1b2gzeFpKMHM4WGdBSVBNcjdoUmNqNmZybXByL29rUklidDQvQW0xQ01V?=
 =?utf-8?B?V3hKMHZCeTFkcndRRkpyME16N2FTckN4VG9zMTd0S21ieDlOSkJ3REp2RDB2?=
 =?utf-8?B?cVY4T2paeE1hd1ZIN1FDS2dNQXR2NVBhbVRnMFQwdDdnakloemtwQ2pHTW92?=
 =?utf-8?B?bVdlaUZxSVVONmRTVzJIeEhISFRLdTdsSWJQa0xCTGptV1lKOUloSEhsb21h?=
 =?utf-8?B?MHQyWUpYRUFsdkVtMzFhdmtjb2xKYUJjYzVLWXg0czFXa2dvbUY5bFVYUTVt?=
 =?utf-8?B?ZlRRUTJWbDlDMWxMVDd2cVQvVkgwM1pqa0lPdUFqdmhzdjZLak9idWlwQW5D?=
 =?utf-8?B?QXlGS2s3Ri8zaXRPVGhwQXBZaXo3dlBVMkg3ZmpUS0xMSzF3RDcxblNOOFFE?=
 =?utf-8?B?MkpnQ2R5NUtnNkxjT1YxcHh4b0Q2NWVIa2g2SUJhNm9ZSkU0TUdsMDBTVnc0?=
 =?utf-8?B?VGdFMkFtSVJSVVU2VndxWnF4KzZWa1FiaDhKRnpjcWRNSHVRRitwbHZuaEg3?=
 =?utf-8?B?dHB1Nm51WUR1MmNDYTVHQ2puL0Ivc1dsR0V2ZlFvaExBR0piQlNRZDNUbmEx?=
 =?utf-8?B?WTM2anM5SjB6ZDhLQUIwcGRUOXB4TWgvZTRFcW53eFFuaFZWZlJUV284anZC?=
 =?utf-8?B?QkNqWnR2V0RmRzZuK28zZkwwekY2V0wrYkl4dmxFN1ZxVThEVzhlVU1LMnE4?=
 =?utf-8?B?MjRHQVBmVXdiL3JZcDVINm1GY1A0UTdlVnRwVWNBS2ZIQUN4VTZqNmtlYkhs?=
 =?utf-8?B?SnN5ZlAwbUJyRVRaSGdjSmZVVHBscVVtRUd0dUJRQk01bFRJWkVYU3RpNmJ0?=
 =?utf-8?B?NzV3c1QvNlc2ZmJqYmx0bTVmTDJ3SkNqM3NqVHphaXBQVnM4QWp5dDJoRmFG?=
 =?utf-8?B?aWRGN1NpcXJwWEZUaWlSV0NSQWxHWTJPczFrVEhoZlViVWwraWdUeWJYTDR5?=
 =?utf-8?B?MXUxSVd1czZwNjY2TUVLY2FSNFl0RjhSbFc4NGNKYzdzdUU5dkZXNFlETUxm?=
 =?utf-8?B?QW9xdkVSd0NtVkMwRTJON3ZGOVVmNTJyR2tkQkYySnlGRW9qS25hN0ZzeGty?=
 =?utf-8?B?aWpVSDFXSS9FRU9FbFlxM0l1Q1JHVTNMV2MreUhiZTFUQ21jRFUwek0xMGdL?=
 =?utf-8?B?RStyMGgwWm9ZK281NTYrNUYwaHdGcXo0djQyVE1kTzhKWFFsRThyMCtpSTIr?=
 =?utf-8?B?RGFZeXRNQ1ZVMGpCMWg3NFkyT3ZIN1NweFhGSDdheGN3K0hYamhjRERHSkta?=
 =?utf-8?B?T1RmNzFlYlNDM2o5SmdUbHAwdk5aZ1QrUmx4emgvdThLZE5rOExVclBmMUhS?=
 =?utf-8?B?bnBnMlNmQmhIM1JKMDBKcTJqUVRJTThEWUxZajN6K3Q4cE1NdWU1R3hwMGlm?=
 =?utf-8?B?Zy9NQUgrZmozY2ZaS3hmdkFsaVQzYm9OQllIQUlId1NrUzJwSndCSm9WQzV0?=
 =?utf-8?B?dkwzOGVmZzZDYSsxRlVKR05CMTJ3RFc4SGg0MHFNOWFYYm5keHFscUszODYz?=
 =?utf-8?B?MUVNbUw0RWJiWVlVTW16YllPOHkzWnhobGJONmZlVExkT2dZYU1DQU5KV0dY?=
 =?utf-8?Q?cwNs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2316bb9-d550-409d-2338-08d9fce4c415
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 07:09:32.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWPKRs0U7p+uwhFLT0vI/BI7GAvdeZM32TmyI1euVio7HmgRzTvwkbDCuhDY3gId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2343
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.03.22 um 02:52 schrieb Yang Li:
> Eliminate the follow smatch warning:
> drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:413 amdgpu_get_xgmi_hive()
> warn: inconsistent indenting
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 91817a31f3e1..4ff6e06babca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -410,14 +410,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   	 */
>   	if (adev->reset_domain->type != XGMI_HIVE) {
>   		hive->reset_domain = amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
> -			if (!hive->reset_domain) {
> -				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
> -				ret = -ENOMEM;
> -				kobject_put(&hive->kobj);
> -				kfree(hive);
> -				hive = NULL;
> -				goto pro_end;
> -			}
> +		if (!hive->reset_domain) {
> +			dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
> +			ret = -ENOMEM;
> +			kobject_put(&hive->kobj);
> +			kfree(hive);
> +			hive = NULL;
> +			goto pro_end;
> +		}
>   	} else {
>   		amdgpu_reset_get_reset_domain(adev->reset_domain);
>   		hive->reset_domain = adev->reset_domain;

