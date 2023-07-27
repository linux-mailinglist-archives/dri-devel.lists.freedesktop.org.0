Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD1764934
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93E10E0EF;
	Thu, 27 Jul 2023 07:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CAD10E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgIlD//yHQZcBNLA34RVsTbbf2CSiLVTGmiqeqko4BZIXjw+mZsrnP4g7jrucCZ9eS35rD1IDE7/YrvOSf/uKH/Alt+34V5o6rws04YFdIE10f6BLt2bhP9dBAxr6zzolIlsoA/7XlYgbnRj7xTLEjwLuUvWdwEkxwrVIhkd2LNTwIw4kCw2zxNmJw1Y0dXl1gKbH1jlpktAG8deO33YMxZOabIP7GQe756hw3r59a/1UoErNfCHYiREcEHJ/EpyRFWq1xVI+2DWRoUZVlz0X4ctAz96ERbzJcqaUErHhAFglsbfXCuteRUemApE8nq01hcu/A+5KiY6rkUqD984eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsuXSTq8w9nhLNvGsyo0ANgU+L52Pez8eHR2nW3tAPQ=;
 b=NOkn5uY6/R9+gq+mBnOB/pv7gl1oNYr71x9iVTW1cSBBpuU160IaTbb275lEcgz73WFg5mG3rT4kuG4Eq7xvWRzNxtVGv4nDqMuCubB9bBvhXeZ/W2UL+WCZQtK+OE4slY9jdD4ewD5EQXL8tztXoQTjorIRsocdgpkjjB8fMEkdgB7ou5/JMImJYswT1dSF7pfHbU8vF8X8HqmEyDaSLYIn9qg+BI/C2KFk46BpIPKPAFeS4Ztt8kcUOEknS7tSpXQSlL/q1zDxh44alnOjYUSOdiVAoBuE5KFoSwd2QbjDWCkZ8MlRIFNZzWhkeAa0naSVXBAXc/2THq5+RAskDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsuXSTq8w9nhLNvGsyo0ANgU+L52Pez8eHR2nW3tAPQ=;
 b=nr7kmUQG1HVtPnGuUBIsJ75njrri7jJJri8GjqJBj6mX6EtW/gU6Nqo/Z6L953baUt3RqrzoHvRWeE49mvbr/APuE7l9k8fecl8F0cSjr8JXPfBWdJWFWSRB5y1bjgJL5SCLGhV9rbvCzCDVIMw3aGr9TYZo65x/qVbvI182Dt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8428.namprd12.prod.outlook.com (2603:10b6:510:243::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 07:46:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:46:07 +0000
Message-ID: <52498955-a14b-5646-95a3-611bda0049d7@amd.com>
Date: Thu, 27 Jul 2023 09:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dma-buf: Fix the typo in DMA-BUF statistics doc
Content-Language: en-US
To: Luc Ma <onion0709@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 javierm@redhat.com
References: <64b6749a.170a0220.3acab.2af9@mx.google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <64b6749a.170a0220.3acab.2af9@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: ad16d763-6edc-4a3b-2de4-08db8e75897a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuL7iBJnJFTcVsK1fEVZO077ALPlv4WU+SdLG35DRgz7GDx5CPLpK7ifMZyj9wZ9dEvVceAHSIVxU1lNSHSmh+pD9RSKMOkWBVDEo9a113d9BONqeV7ydKUrZW3+dn3TuYg2Onml47vB2kexVO0hR7gmARwdGf1u7bc2sp8UOfPnPtRVM/7attWCfbK4N5f34HqlTP+ChYrZUX5h9fpGOotCiJyJ0AzPljVslVxbkTkYCEoKZbIGamUu9z37dOuLyz5ieDG4l+TgU3o2RnHSYndmNF0xR2hC9xslPkx6Gwf/vk8/Kdu9CzZG6JC0VQJ5evhFy0dYR7v7aw4sIV7mZPbNguO9OOtaMpBHDknnatc477vzbUW/PC8Zaje1OPxc3uw/QpqbUBTTJPW7sDQcj9MPvTJNTZjyHdndPWvxH2Z8YkD62adQDISfiX17EKXnLvSZPXVKyVxDo/JyTGdsBdRI4H/jKCVnCGLeTq19L5d7GTNmhhnm1LZR4YGixu2bdWsJzFzKDzTFsTM4DrvJxh8z1iWmsNiJVap5S+InIEXy+zc0I7UgA/HL4gQmgVW+O7Kj+7DFxnQ5CExjBvGBmAOQA2yn3dsDMj06rKiwMVW0ZlDTbRuvJm5VB8ZUpijWflYQ+P8Zgi3u5XcRSmZjXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(31686004)(8936002)(8676002)(5660300002)(41300700001)(316002)(2906002)(66556008)(66476007)(66946007)(6666004)(110136005)(6506007)(186003)(478600001)(86362001)(31696002)(36756003)(2616005)(6512007)(6486002)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJDeEVFY1ZpS1BEaktnOEZuR29XMGhwUE5DNEVLVkYyRmxPNVU0UGU4MXpo?=
 =?utf-8?B?cFNPQXB3WDZwbGNTZkxJdHh4ZmIyVm5QWGl5Z1Z6OVVkQXpCL213Tm42ckw4?=
 =?utf-8?B?aDFCRUQ3cUEzdUtza2JOTnhlN0VmWXZUUHBNeTVYWjVScm5DL3NkU3ZCVU5Z?=
 =?utf-8?B?S0kvblRCd0RkTllFUmxrRi9RZmorb3J6QXFaeUw2eHBzNlNCdWw0QWtSNjlV?=
 =?utf-8?B?VDZxTjR1NEVua2kya3VwRkN5THJDcjN3QTFGSW81QWFRL2hPU2tzTHJJdzU5?=
 =?utf-8?B?MnFqT3VFSG9FanZMQk9ySVVDYmNRTWM5Y09hYmMvNk5vRkFQTmNtSzZLSHVu?=
 =?utf-8?B?ZGluNC83Tkorc2RhMm5YWkZtMjViRElETDUyb2dudzR2UTJuQW1FWjJxcmdk?=
 =?utf-8?B?TzZ2SGFBeG5nVmZnelZRS2FLOTRRR08zczEzZ1Mydk96V1kvc3M2U2NtbUho?=
 =?utf-8?B?TmM4T1lVdEJkRDJNais5ZENreC9MN2puR01odUtPUGp0MmhaMVF4dExheHU0?=
 =?utf-8?B?WUNtWlBGVlN2cXlpMnB6cGpTbU03TjFOeHN0Q0VKSW1yUG9xVUg1Q0lYbDNQ?=
 =?utf-8?B?ODkvQkZ3TzhtRk5qYnlsVzhmekVMZDZsUDVVNXBiZVVWZ1RzNW1YQlQ3MGQ5?=
 =?utf-8?B?NGdqRXh5K1g0VW1mSkFQc0ljTFV1QVRVYzZFL2lDTFlBdzhxTTNoZXRDTEFX?=
 =?utf-8?B?d1crYTJyTEVMM0d3V1J3NldPMWFTYm5VM2xabzZCd3hGaUdKeU4vRENZUDNR?=
 =?utf-8?B?WEZJY3dBdlJ1eXVpeUJzVndsb2Q1QS9uZDRXTGdmSjAxQlJwb2tsR3Nld2Vs?=
 =?utf-8?B?Vno2bzRHWjBkUGpzTklCcFFsb0IrclZSYjRnUTVoTHEveHlhYVBCbnZPQjFj?=
 =?utf-8?B?TkpUb0JxdGRhU1lWUGhIYytocklBM3hHdTBkMHZFL29OV1l5eVdKYjRPNE16?=
 =?utf-8?B?ZmZSZTRWZEZHMVQ0S2hIVVF3RXQ5cWI4RGl1VG96MmIzMWhlaEQxRTJaL214?=
 =?utf-8?B?V2I3aDZheUlCbnNvaDc1dEpBVXA4Q3NOTWxQeitkR0xWeW9qZ212SWpDOXkv?=
 =?utf-8?B?UzU2R0tNbEF4Mlpobkhlek9YMkp6dVQxS3YzNlI3aVVPZFlBWDYyWUx6WlBO?=
 =?utf-8?B?bnU5amJuemhwZ3VWb0J1YisyeVZMSE5TQWtHSjVkSENRZFR3TkROWDVyT3Nm?=
 =?utf-8?B?VWRXMElLeCtzTUhkTklRdXZ1NzBKM1podytWTTRPV3NWZDVVRzU5Z0ZIVlJv?=
 =?utf-8?B?eXBwWVhQUG50a1Fwd0hrUHRQQVluc0NaaEtyL0ppQ29IbUQ0aWFicFlwVlVq?=
 =?utf-8?B?U3kwdG5rY0JNMDJIdk96NTlwbzZ6WXJCK0lYMjVWRDhTdlduYWNNZWJ2SEF5?=
 =?utf-8?B?d0dBamlxWkFwUCt2dlZCZ3hnRUNBSkxFWkdpRkg5OGhpaUEvSzltazZPZFhH?=
 =?utf-8?B?Ty83VmdrK2F1VEMxTE5velJobng4TkpxNDREK3N0SjdkdFQxYWUwVForczhv?=
 =?utf-8?B?NXdQK3JTeFdLWHdGMkplc01FUGJxMmlqTEFjY201U0ZZZEN6dFU2MHU0bjZt?=
 =?utf-8?B?UER3b0Y5UGdXQWdLYWYwYUlmdkZ4Rzl3S2lOM1BQWGdlREh3MERFVmpkV0tn?=
 =?utf-8?B?bjlEZGdMOG1meWdwc3dkRVAwTHFJdStuS01GWW9XS0xzbkZ2ZHczREM2OEFM?=
 =?utf-8?B?ZnNhRE1EU3RxaUp5K1gvZFA2UjYvRkJUOWRvYWtGT21aSTJ3N1A3ejZDak15?=
 =?utf-8?B?bEVwU3hWZVVrOEs1dmhINWk5a0NVZkJYOU1RT0g5NWxmQjlIZE5YL1kwUWUy?=
 =?utf-8?B?RzRINFozZGREd2NUY0UxaTBvWmMvbDhRWlBad0lXY0NGak92L1hHRFR4N1Zs?=
 =?utf-8?B?aXFlUVQvQTZYc1JUajBkelRMRUlsTnVXdFFVeUlvakdtZVA0R1Fxa1dua3RX?=
 =?utf-8?B?TWNObisxVVVoU3JJRmZEZUNvcS9yajJnS1ZHdTJyNnBiU1FBZ29RUVEyYzJM?=
 =?utf-8?B?ZjNHYmxRcVV2TFNjZWdjTXpHY3RFZjJqK1BJZjBCZVVlUDZURzBNMzk5TElX?=
 =?utf-8?B?ME5FanBnZENBWDhrbnNHaUtrQlRlcVdORytVOXpFL2wvRzA2Zy9FTEZUeGdD?=
 =?utf-8?B?N0IyWTVqUXJZRUoraWVKc2NQVVdROEQyZjYrMjJkb292dVdUeVBoOUxUbmNN?=
 =?utf-8?Q?Y4BBvYU5YNvgQgltf+1p0yUxPg61GdeSj8MMqGHvaFME?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad16d763-6edc-4a3b-2de4-08db8e75897a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:46:07.4369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq9owbYWAvd6beiuZRhz1EXVczpgVw3MjPpwPi6RJzrujSH8KdaWrQIvkYqpKN3V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8428
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

Am 18.07.23 um 13:16 schrieb Luc Ma:
> From: Luc Ma <luc@sietium.com>
>
> The kernel-doc for DMA-BUF statistics mentions /sys/kernel/dma-buf/buffers
> but the correct path is /sys/kernel/dmabuf/buffers instead.
>
> Signed-off-by: Luc Ma <luc@sietium.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 6cfbbf0720bd..b5b62e40ccc1 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -33,7 +33,7 @@
>    * into their address space. This necessitated the creation of the DMA-BUF sysfs
>    * statistics interface to provide per-buffer information on production systems.
>    *
> - * The interface at ``/sys/kernel/dma-buf/buffers`` exposes information about
> + * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information about
>    * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
>    *
>    * The following stats are exposed by the interface:

