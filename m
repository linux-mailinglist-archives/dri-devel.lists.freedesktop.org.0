Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1934B850E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 11:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582310E704;
	Wed, 16 Feb 2022 10:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF77810E691;
 Wed, 16 Feb 2022 10:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EO2iUbFPIRbg6Rneh0fHlrrwUNOYm1Tjn1V05SYP+TLkVky8/Cc6Pd8C6MGhpe3xjD0nSAjr5JNONmwrcLOSeZiKMTuGMFvpJ+F8Z43bjBk+LQPv0MZYJq3mRJwi7Hc8DFH57/P8t7Tnd8DdbcEiUWdh1l6T2YYZuXjjJMZmbQ17f1HuAYB4Po3jZgoRZp1x2ukCaEWIMBZYOGyG7+/X80laEGp6XmjlRZeofgfX9R9+6UvnEUIdBNQGwFIGJJaCCE8Tz5iei83PYib/PKmAT1RwTP8O2kc92SNt2s0e+LyHT+QSh91UF8uhla//xpANMwZa9qXAJvfrRnLZvzsDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q/ZJUWEB1OWFYgNclzlrrHigiilrJQA5uIr7dQf7pU=;
 b=Xv94EY1IQk5oMCaxiSqNH83QIZMeB1V6QfnqG2zIPXhMUxMLuZpJ8xHCbOgvcUIzdST39xRvGNaS5G/copx5X2Ii4kkGl4SMKJhXISBvVxN4fom4OIGjxmOfm4N7wPmsxNff2awtYw3d0+boLbkTbLQyWHfWnIszxknodeUbBxj1feVRiFSqVTiuwjFwFiavkReTCW0cAthcH2me+tGHuGhLxfQa85yi+3sJgOLU+qsWlZq+RTT4wj4qlx3XzYwtdOvlPXUqfV4lc1kt3BXDQE3IeVR+cZHEBA/6uzJ1YKGLYQ5idGtl3e+NBgYwoEuxhSPb94gXTfFumDQCZeQtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q/ZJUWEB1OWFYgNclzlrrHigiilrJQA5uIr7dQf7pU=;
 b=tABQZzx3Vq0IOzb/ktBkLfen1CYYNTIZnJuMu0ArqABYaQN5GwVAPwFGA1IniI8oBQ+XlVN1M0zuc8vp37xCtgO0cpTL5UFliUnWKZg60kUbD9JvjKzL35LHZQ6B8evhCPnjtrO70PdGMo4tSr94z7HCHXHsT9a6ERIkHFsDZ7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR1201MB0131.namprd12.prod.outlook.com (2603:10b6:405:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 10:00:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 10:00:46 +0000
Message-ID: <dc12ec7e-c506-941b-40d5-23be378ddef5@amd.com>
Date: Wed, 16 Feb 2022 11:00:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm/amdkfd: Replace zero-length array with
 flexible-array member
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220216003841.1419615-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220216003841.1419615-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0077.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c604d54-1138-4571-6ada-08d9f133338a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0131:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0131E692AAF7CECCC356B46C83359@BN6PR1201MB0131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJNbYbtWmotAHhu6pp3IchBK0FGKW443Spa4zOH52uPrmS3/Bu4tWb+upXO42D3qYcI8xh4qAfmjE7aZ6Ha6wk61bhXqpcmKMb89bAX921esX9Wp1TCZS/n69MsxXWrGVHafm31paZtdmUBKQ2jBE+5Rb8fLMErzCjjBzzsgBRqOGA2z/cq40iOjFSmeRSNHdM1IgUDdWrAZWrxr0wxV2C6Dqi9x34xe0OScr3x6Htmi4gnsnxXFv66Ms9WTuQs0GaDFA+HXLsy8NYOYeYHdrDM/aGupuGxNIXeJjC5Yg8Tql4tMZUj87Y8RhEJoy+Oe9D7LxFNSJLHCN1UTAI5amVxLA7aebifHmYbfcLzhjJXQtaxN68sVcpj24mGFu6x0LQiQg0Rp5apwBSJs//Ri8rWS3V4TMDxQMGW5u3T54xoGEuaNYThfnTsBZjBiPwN5ohkd2fkoEI3tAusNrOBTKBooAwT2S7I7lyVdAnScQu1eYrtbjZ3n+YCXZtJmGcFP2zrEC5tKeQcBG95ndVox5iSJZM2jc/RaeJlSGajuAkEGpSO9AmEETNnuxcuc25eqxJtF6AuV1kn1xwiCQSNiAE9Xn2AwquQ32EEnjhUS6uLj8C6rR1lkk9XagWvva6iOSe3vGWZVWAjClouplMwDDve0hj8aCPRGntumebm7WgDfjF4iUszf4OwfKaYEsKQfjwlNjL0tsWUkV/x3EW1tJUj6hMCvFNGghkLyMqjZN1brgRCq7TrtHuBPfl8c8BjQBD99+IwlhaxTIt2Ni7PaVi2cab9nMG+JMi2mXIOp8h2GAolUJWNkrxpqDrXC+whbA1h34FZHfys6B+nC/wZX8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2906002)(966005)(6486002)(38100700002)(83380400001)(316002)(31696002)(66946007)(66556008)(5660300002)(8936002)(66476007)(186003)(6512007)(8676002)(86362001)(31686004)(4326008)(6666004)(6506007)(2616005)(26005)(4744005)(36756003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVV0VmFmcXRuL1VYSHZzUEFPdzZpWXlBZmlYMWpMNm42Z2xQRlAwWG5FZXVQ?=
 =?utf-8?B?by9GQXhVTDMxT1lNeE9ZYS9Lbkd6UUN2cDZLeHRYYzY0ekJ3RDVLbWxZQ1Bn?=
 =?utf-8?B?aElVMlJ0cU5Ua1FQdlNmOGhFaXd6L1hGOG9UbklUNzR3M2ZackRGNjBJSW5R?=
 =?utf-8?B?SDFSNjhQZ2UweEZ6L01tNzRYdGV1cUUvUWgwbGJIWWJuTndJRHdYeXhhMkk3?=
 =?utf-8?B?a2NxOE5YTkRFZjF2RHgrSlI0cUhXL0xBRlNJWEFOT2U1Vi9pVDkvcnYyWk0x?=
 =?utf-8?B?K0NjWFpHR3h4NElCdXlLOVpXT1lCbHBXVllyRkdXUW10K3VSQ2t3WnYzNXp1?=
 =?utf-8?B?ZVpqK0ZocUQxUU5VSnYyTU5xbjUxUG5DY2Z1VTFiTnpWc1g1VTRPM1BvTWtY?=
 =?utf-8?B?MkJwT01ubjYyaTJNN0lGUkhUL2xsRkQyUGUvZjV2K1g3RDNqTEZuOFExbTJn?=
 =?utf-8?B?V1V1eHRDR3hiek9GL09pcmYwZG1UdHRNaFp0R0M0bXpkQXVGWE1KaGptSis1?=
 =?utf-8?B?Ny9RTjZSNjV4cHgxYWwxL05nMW5tVms1OHMvZENEQW95RktDbzBNZVlXV0Fz?=
 =?utf-8?B?eDI1UXM4bm5LQVRhOWZuanlhYVR6ZWtaVEx3ekUyM1VVZWJheFRtaC9NT2tn?=
 =?utf-8?B?OCtaSXBHTzFvYVJHdVhRNnNQOTluYWd6SmdDSzFwcjEwU0JUUUpnYUdrUmZx?=
 =?utf-8?B?eEUzYi8xZ2VxRThxK25xMVNnNVZJTHBwNytVN2xkRUdrQndjelhjRnNlZlcr?=
 =?utf-8?B?bXExbkNYQkxPMS9VOEhoVDJxZzdNK1JuZW9xT0t1Y2w1WVRqSm1CS0YyS0RM?=
 =?utf-8?B?WEk5cDNvbU1KS1d3NklLQk5wNzFuZmtYdzY2Q3hmeFlvaHBlZVAvTnVuQ09Z?=
 =?utf-8?B?aWpXVHhVbnQ5d3FyS1RjRkhuM0NPaTN5MkpFWVpURFZscVFnMGpyV1R3amNv?=
 =?utf-8?B?cFo0T2J0aGl5TjdIWlo2ZEFnNlRwR0RrQUN2TExTajBQMjZLVnhhN3VZZTZE?=
 =?utf-8?B?Z09lREx1TzROZ1B6WUpWczhaQWF0WWxrNGl2Si9SUXc0ZVh5N3pUQVhGbVVs?=
 =?utf-8?B?a0dKRC9qQnRDMXZKbVpTVkNqdTcyTjlOSWtRMHB1enVnQUErQjRWV294MGhF?=
 =?utf-8?B?Z1dsZXhiZzJEdTdiMjNtczh1OVdGcmpYWlI0N1l5bHB6cElKblI3TnZZM2hq?=
 =?utf-8?B?UFNHWEFFYzkyUjJTbFRlNDF5VFFIZm1wSE5DM3l3ZVpJckhNUjJPOGFOdnZQ?=
 =?utf-8?B?a3VmemxzTURVTXBSZFVkK05IM3RIODBTU2VSdldtaTZnZVpGTTN5bXh5SjdO?=
 =?utf-8?B?MVNFNy9yNFRJRE9NR0h1UGNvRUUvOTBBc0NoSzhpc3A4SXVSeHdXQU1sSDV6?=
 =?utf-8?B?QkxadnJnY1NjYURGVVc5TFRsTWo5OVU5bkIvaDBZSllBTElKUkJGRW9PK0Uy?=
 =?utf-8?B?UU4yNVp0TkFhcjk3L0tLTmt4UDdpKzBqZm9CSytBa1M5aExpYVh5dlhMZTB6?=
 =?utf-8?B?S0pQS0dVMmlXSGpZVWJLRUxIblM4akVaS29ZMXp3SCtaTUIzL2VtWm0rbWV0?=
 =?utf-8?B?QURvNWx5R3h6YmhvWERVekxVSVR5Q2hZRDd4WDU3cDhLdGNDQkV5NFprbWYr?=
 =?utf-8?B?dW1jcExEOGJmWnRLNjIxL3E1QmR6ekhzb3MvYW95dkovcHE5MDhFNVJTNkpp?=
 =?utf-8?B?M3lTVzRKQlFFajhsT3pGTElLbXhxL2pzdHRObHhhdFpXZmtJVUUzQisvMXA3?=
 =?utf-8?B?cFpNeUFoUktJRXVMYTZHdkxsb1FRMFU0MlZrVW9nZDNBU0grSTMyM0VtMUk4?=
 =?utf-8?B?QUdzZG14SDV6SEI0cVJPeEFjbEhNajBWcDZsSjZGU0pRU1FMTThFQTVhWEZ5?=
 =?utf-8?B?Yk1hZU04TTh2bTRZQm9DRHM4eDFQSStKRW5yR09nVDB4RUdMQnRBcFVkR2p3?=
 =?utf-8?B?N0NNcWNPZ2FnWXdtaitTTytRdkpVRGhVOVZuZUFmbWlzN25NWGxaSUlxMzRW?=
 =?utf-8?B?YUxiUXRLcU9RNzNzVit5VlJPdFpJMmRZWW02RlhOWWV0RnVnWmlXMlhIUG1v?=
 =?utf-8?B?YnFZUzhTWThiTTNrSU9YQlBhaE5OTVpWNnFGblV3WjdxTDRSY2ZoU3I1OEtp?=
 =?utf-8?Q?JZQo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c604d54-1138-4571-6ada-08d9f133338a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:00:46.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvzM7uE5gQMMpzy9o2XyAbi639y7cIiG5VLfmAbGhr+HQXN6t55ZTxf3JYrfcUWx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0131
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
Cc: Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.02.22 um 01:38 schrieb Felix Kuehling:
> Reference:
> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
>
> CC: Changcheng Deng <deng.changcheng@zte.com.cn>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/uapi/linux/kfd_ioctl.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index 6e4268f5e482..baec5a41de3e 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -673,7 +673,7 @@ struct kfd_ioctl_svm_args {
>   	__u32 op;
>   	__u32 nattr;
>   	/* Variable length array of attributes */
> -	struct kfd_ioctl_svm_attribute attrs[0];
> +	struct kfd_ioctl_svm_attribute attrs[];
>   };
>   
>   /**

