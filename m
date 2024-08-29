Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741F965025
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 21:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACA710E730;
	Thu, 29 Aug 2024 19:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UEX5IMGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E651210E730
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:53:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhpINYXSCxPnHK0T6Vkpb7knET24C2foGI0okTQK8EYo67F29NnkEd0YwsxsCidwtDmZv4s35O1C/9maWBHG6YuiFK5hT9gsetoWgiKZT3EwEPckDbc+gmMDRnV8cDxfwFlDCbBekomuyDhchtffWfB8R/hJTrOMbRAvqDSm1MGchrYjq/G2Py96vKMb8shulGhqrNQajbYvcrFfOelr7kRAO1rtD0Rtx8KxURWiPsBVWjUwZyTbRif1UDH3gTra3hV+e/KceGXpPkjdQCZMVAV+55U4kCXr3/0mgL+ZY4sasEbqsHU5MiIt+zEfOczxI3dxHrivDDUql/FJk4pYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcH5net78olbv6esT1aGBs/lNpx7PeU+9E0D2nmxCbc=;
 b=BO/PM4+6VNg929xIwMkYHqopUzBcBIBErgw3rKvGtZNCtVH8UMVoJD7Sg4/fgUAVSdSVmj+MrNJVs2GUnYS5JQxL9d9oHP0TiQ10ZhCS04exhjVh6qAMtNIqEsKPbvtLf58Nx5KA7r4i65am4UuDVHJwjYjuO+cKMc+jvmkd9UjzDF+tN0JaC5XdEdWC84QM+8A2KkAZsYTRYAYTlJxk7xLENjLGL+43Ql2IeVM6QZav3ge5gkVeg5aIRhit0fmNfXQqJaNgD+rcAZpXvZc9fVCA396YMe4dP0KlL66EoCmmwyrKKs2reHpq3RjQ9ohTUnE/EYpfupDfCT8tJCOfjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcH5net78olbv6esT1aGBs/lNpx7PeU+9E0D2nmxCbc=;
 b=UEX5IMGa3RtxK9WVMj9Ew4sorFIhjk9Ij/ravg4mt4lsE3piSE42Oj1iuimzahh5tcrDj+bnr8lm7dUlZRYhwErOq/8tCNnRbS6KYOYH+7Cd7SZcaDeBjCj1w3nvHCigmuxWKzMKgWoi5l3FQ8TX2pzpUwEW9psefyHOqMwJ4x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 19:53:06 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 19:53:06 +0000
Message-ID: <6a447a16-2d81-42a7-bcdf-6a9805c92d20@amd.com>
Date: Thu, 29 Aug 2024 15:51:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: register more drm device nodes
To: James Zhu <James.Zhu@amd.com>, dri-devel@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch, epilmore@gigaio.com
References: <20240530153439.4331-1-James.Zhu@amd.com>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20240530153439.4331-1-James.Zhu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0029.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::28) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: e52c5820-9969-4e94-ff6c-08dcc864333c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUdOcnBMY2hrQmQ2b3lZMlZ0K0lKcXRYcU9JZ1ZLeStRQ1FWYlpvRXhWSXFT?=
 =?utf-8?B?WlJXQXFNQ0xQaFk1cU1LSW9zMkQ2TGdNM2g1VFBuRlhncEg5MGx3QmFjWVox?=
 =?utf-8?B?a25uVlJnbENPc1d0Q0tna2RQZCtLbWlZOHlTYjRVWk1UcHpOQlhzQjNlV0cx?=
 =?utf-8?B?cndONVZsYTM5aTFnL2xxdjVyM1dhbG1YZU5qdnJhZTRldjlCZW5sOCtZVmZ1?=
 =?utf-8?B?VTk2czQ0N2xNdmM5VDVncGNTR24wSnA4bVltVEc1TjducVd3Z2pkdmh0dUJV?=
 =?utf-8?B?bVgxMEQySlE1NlRkSnBvV1hab1lOWkorVFgxU3FvTWY0bCtsVnpGMWpSUFdP?=
 =?utf-8?B?ZHI3bGNFcUlPbTlLUnlBaVdEVFBEVk93YnhlNEN6dGNGRkZFbC80cmRGMUxo?=
 =?utf-8?B?SXpTejZKb0l4bmlxbTZtZ3E4TkNBaDd4M1lSUnk0bFBHOXZMeGFxS3k3VlVw?=
 =?utf-8?B?TW9vU2twZ0p0ZTNXeG1GV1JWSXdaNXo0dnZ2eXJQZVpYakVHUHVyQ2ViTkVh?=
 =?utf-8?B?ZkNLVXcwK3h4ajR6bDBINm9mandaazBNTFI4MmJMNVYzOXI2OE1qUTZpVWlh?=
 =?utf-8?B?aHBhaDZiMzUwVjd4YVk3eG9UaXJqMUhIa0xEVEZ1OVVjZlYxNUpFQWxGelVv?=
 =?utf-8?B?VXlsMUhIcDBUd09WYTdvdW93eitMTEtab0hraUhxVWFTUmgxaFVMVmlLeURu?=
 =?utf-8?B?VXV6emlGWWFsSm1BMTF2dENkV3R2SWl3YnRkaHozRng3YjM3SUNDZFNlOTZh?=
 =?utf-8?B?eU5RSlNxdENyVmF1Q0YvSkRvOHJIdHk2R1JVU2RkbDlUWjBSRk9vajE5c1Mw?=
 =?utf-8?B?dDNEdktlZEF1U0VDZTNSUjlMTTY5WDgvM3NsRVRWQ1dEWnordjlwRDE1WFNT?=
 =?utf-8?B?dmoxK1oxZ25BM3pMQ1VRa2ZuL0ZxdU5Ha2JGcUpUVEJRQU9USHk4TmNnY1Zj?=
 =?utf-8?B?VHVPU3I0Nys4d1ljYWFza1BpNUZjeTQyNzBYckpPcEg0THlCb0svSHExYmJV?=
 =?utf-8?B?UUxxT0U4SUVRTjdUdzlBekowVThac2pXdUhxUThCRVhqZUQyTU5ZVks5V2ZN?=
 =?utf-8?B?SmxxQ2ZVTDdyOENMc3dyVWtTSkhsQjRoN1krYUZ2eFdTNmxFU05FQjU0QUtD?=
 =?utf-8?B?Z1Z3Ti9maEFIeE1kaittNElxV1hEVXJUb0laeTkwbmR2V1ZZNlJKbDdYcW9i?=
 =?utf-8?B?WFR5ZjhzN2g2QXZVLzFZbDk2dThHVk9CWWdHckQ3MHMrYmorVjZPWURIOVRQ?=
 =?utf-8?B?NFM5emNhRVhDeGFaOEZDQUIzcXR3am9WdzMzUlZPTlhhU2IxaXVUTTdzQjJM?=
 =?utf-8?B?QU82OFN1eUc3ZStMWlZJRG1XV0NCL0VtS0I5WlpCRWd5d1g2QjlpdkI5OWVz?=
 =?utf-8?B?TThuYVFxQ2FGWXh0MmlDdmJJRW45VGJNMmwwajNPdWZRWG9TMXErMGZ4elpa?=
 =?utf-8?B?R1pQNVdPTkZVUEFZMVpET09kKzhHQ3VoSUU3NExvUTV1Vy9Cemg4UExvNFVI?=
 =?utf-8?B?QVovTTZNZ3hNc2xEbWJTaFJzaFFwa3ZwRkNZMjg0WklyQ2ZtbzBJVS82ektO?=
 =?utf-8?B?clZ4eUNFVEM1dlZCU1UyV2pIbGlNem1ZVnFVc3Zud0pLd2JVamZjS0NSTU1k?=
 =?utf-8?B?UnhBc3pvNm1mZDU0WVFiS0dnY3NhOUFoaE95eTNGMWI4TEZtMU9sRWZ2VjVw?=
 =?utf-8?B?QUVmUlZ3K09KL2IzZXgvNlpzTkpsTWNHSGJQemZjUy96YzBpMDNQZFJPV3VK?=
 =?utf-8?B?Wlc4aEw5K2wyTDcwMWRSS0E1ZjlyaGxUVU1JSGZEUytyeFF5NlRTS3F1djV5?=
 =?utf-8?B?QnV3S2VTSVdKZUJhZ2JIZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUJoRjc1NUFvSWhPNndDUFk2V0VWNmEzY0FVa1FlUk15SHdlRDkzVUc0YSsx?=
 =?utf-8?B?dC9zRFlEVmxNZDIwSURzdzhvVjZoWWNCeGJ1Vzh6Y2EraDJwNExhYVIxYU9G?=
 =?utf-8?B?QzhYUGpVaVdzM1E3S1VnR0IzNTZwbXd4Ulk3aWRtNjRtYzFhSWlaQ2xNc1BC?=
 =?utf-8?B?Nm5DYjFzWE1DUGQwT1luR3cyVmJRWm9VY3g5VjRwcE5WaUR0d0RlU0huWk9t?=
 =?utf-8?B?ZTRkOVJrNjAvMDVNYmRjV3VGZEVmOVZ3c05jWlZIOGc1Y3M1TWxJVndnMGN1?=
 =?utf-8?B?WjlPS1l0N3ZXd3VhM29uYjlZRTFtWktSdHBKVlZyMkRTdkVrWnd3dVlyaUlH?=
 =?utf-8?B?cjV2UkJTQks4YVNUaWtLbHJzajl4Z0lZOFJsa2FoYWI0N1EyZ3h2c2VlcTF5?=
 =?utf-8?B?UkRhTTNZRzhmMlV4SnQzMXFFZVdLR3BmRDJYRmsrUWFrcklkMERBTDFBempm?=
 =?utf-8?B?bFQxc3hPRGV3TUxrWE1yN3QyZDh5Q3JselVMNUVrOVYrbnFwRmFMbmtiK05I?=
 =?utf-8?B?L1pqalozMUpNNVljQjZtODdMbFltTUlLd050RDVRVTFlNUFoSjg2OEdiYUxX?=
 =?utf-8?B?aC9LZ1JySUJYLzNZMHloNFdmaUhUMlgyV0RhMXp5enVISW1MeHZxYjZEbnRw?=
 =?utf-8?B?cE9kR3pDeUtHWnFHZ3E5aXIvM3p5bEprVnVZTFJYc1daTGJ1QzdKeVBzUENi?=
 =?utf-8?B?bFpSbUIyYVBiK1BMVXBXcGtFREtqTDBFeGRTS2RsZitIZnJsWlpVUG4rcm1n?=
 =?utf-8?B?QnhCM3drR2o4cGNNTS9saERUWXpHWWpEUkM2NGE3RnVMYzdGRy9saWNkcUNV?=
 =?utf-8?B?WVRYU2dFOU5xcVV3WXIyY3NaYUhSUnd4ZXMzTUI3N0g3dUcrRGg5N3RlOWJZ?=
 =?utf-8?B?OHFmTHpzM25XQTJBUHpUd05sUml1VG8zUmNUdWlMN3plcjF1QnI4andGalh3?=
 =?utf-8?B?Qi93cE9sbm1DSmFlM29kWVNidVZBVmNuUXIreU9ER3dzaitHdjROWGpHT3Ns?=
 =?utf-8?B?T3JaQVhZWmN1Qkora3l3ampVeEt0VzVBQjM0M2dBVnBpNkNUTUxYSU9NcHRC?=
 =?utf-8?B?bUhBZmpkeDFDRi9ZSnZETFk0M2dUUmtpM2pxUE5XT3JwcG5vUjhBUzdYY2h1?=
 =?utf-8?B?Y0FXa1czNkRkakFEaGtJSk04dVA5QU1KQjhMZzdQOGdaN3dnOWVrdHVUc0dl?=
 =?utf-8?B?L215WkUwNzVPSC9OMEppRHc0OGZmckpYMkloVG8vWGxBS25Bb1F2NnVQalN6?=
 =?utf-8?B?UmZFRS9JR25Ec1lIamduZm5uc0dHeHNPZ2xyekNhYmE2Z0cvNWpETFVjT1I1?=
 =?utf-8?B?Y0J0VnR2QXZPUFdQN0ZuMWIrOTZsT295UGNRWTE2dk93YXhoa2ZINXhhK0dX?=
 =?utf-8?B?WHdHZEI4WHcyQ21XQUtpU2JYM1k2TVdWRzlqL0d0Y21kdTBoZWUvRTNVVEZ5?=
 =?utf-8?B?RGtqMGJuWm9iSnpEYnhMd2NnLzJpUjQ2emJhckd0MkhFTHlvWDFHU1djZ3U2?=
 =?utf-8?B?VWl6VTBJM1ZpSW9sRU1sUVNzWDRXanBIU21SL0VsQ29Gc3o1amZuRSs0d2xs?=
 =?utf-8?B?TnIxUGhWRDNlOVd1NnBVL2duVjI2Rm83RXRTYlFuV2U4OU5MVVZsNnY0L2k3?=
 =?utf-8?B?aWV5T3RxNGZmOTZnTnJ1akQwZFA0QXJyWXFYcmVuNDVUcWsvVy93V29OZUpz?=
 =?utf-8?B?a0pjOTlzT3NNRTIrckcybnFqclM4MW5JQUsvMUhSVFdKNEl5Ujhkc1hZU0pM?=
 =?utf-8?B?TkMyeWk0bXQ2dXhYZXNjSVpPNC9Ib3NLY3dFeUlKaERVMnZjTkUzZEU5WDl2?=
 =?utf-8?B?MUZrMWFKR3dWN0pIZVdlU1FaWXVwK1BpVUNKWkNhbjBycVYwQXdzeGxxSm11?=
 =?utf-8?B?RTZybXl1U2dWQ2hEYXJLdVRNYjBIdlgyZU9SSkZwNUZSYUlVZGNyK3VPcStq?=
 =?utf-8?B?Y0c2UVF3T2NETGdsSXFwY2dSTXptalpLODhxdkZINExRa2FJODRjdmU5Mkp6?=
 =?utf-8?B?SGF2c0tYdTZ1K1MzZEovc1IxZUZkczhMR2Q3NVBMWEdkYWliNm9tZUhCQjBj?=
 =?utf-8?B?ekxPWHkxdEZMelBweHJJRnczNFpkbjVZUVpCTlNCYmhxdUZ3VGFuZXhpTi9q?=
 =?utf-8?Q?wXPORH/2H2JZpgG1hnnQwD4jT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52c5820-9969-4e94-ff6c-08dcc864333c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 19:53:06.3325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12xkYONhRZooJwxbpTXiljwhrWBlJpCYsUYuY59yqes3Eduy0dUXiHnOTUxDHunV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761
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

Ping ...

On 2024-05-30 11:34, James Zhu wrote:
> Since the default number 256 can't handle large modern systems
> with large numbers of GPUs, specify a more reasonable default.
>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> ---
>   drivers/gpu/drm/drm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..719ea57a70ab 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1086,7 +1086,7 @@ static int __init drm_core_init(void)
>   
>   	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>   
> -	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
> +	ret = __register_chrdev(DRM_MAJOR, 0, 1024, "drm", &drm_stub_fops);
>   	if (ret < 0)
>   		goto error;
>   
