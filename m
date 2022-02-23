Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0664C0D10
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 08:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6210E956;
	Wed, 23 Feb 2022 07:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391D410E956;
 Wed, 23 Feb 2022 07:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZt3oJX2pf+bK+2qmpwbq0WcVL5aRyz4lXCSU6Jjsyo13A87hDzjJkaAydBRSi70kbMsB40uIyhlydnq4XRhXxOlkCU6qns5Fdt+79lSCZ8QyJETPB5JZiFtAdhkSZLNYM3HSlt3fnoWaSEH5nvuo62RvLJecC+yDKfD3bAkUsd20o/ne9g4Oi6F/5tDLqQ2GkRq9CxPIlpSZVwOkds+oq0llIoKh8U0Lcu4talOXVQORen6lotfm2cLCalUbWla5k1KUs59sC7HM/FFpdFaig/DwAaEUzUzI/9TdjKxBe/Z+yWFZVKPHK3QkKNinDJpD4eSqqmW9ynwMuvmErReNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSb2ivYTTqb3qitCYI3fVvD5Pg3M3MGgeXSssAzwo3M=;
 b=N2m8AzM4X8LWeLy55gC7rvWyYetI/HsHDvUHval8V8eUcBcSOcgH2rOibxKYpXoQEQaaBYqCcOY1ITZqEoqo/PaOVd0pQii138exrjf6iV6DbyXC+1Sf31+XILTRXW/NFFZVa81DJb7vfHJOnMXmqBKwiRkgLZ1Dfjv1yd/gQtr+NNGL4YZVcqcwR0xDQ/Ve45ayNmVJQfxMwESaBulNNztA+2396OXLIDM6yOIX42R2wP7ohSRy3ARR+zFHNyQ9x8zVoChxnLeZXATq/Npt5DFFDii9XtA3e9szY86rCKi9kU8i01aRyySL/HG/VqmFVzt2M/GG/QHn+m2Bp+taqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSb2ivYTTqb3qitCYI3fVvD5Pg3M3MGgeXSssAzwo3M=;
 b=dfkx0nLiLZ5PzpIOAAciYl1teHj2QM12CPFV1WzKhGL7iFBkDbY777dIl6Qm572ehkWTdumtiTmQiB+iaXMTWvQ5utvCJPrNMEdhq/IlWTUDwncDtCjViZURtF9k6lmmYFw6dlvnuBCHW1jdQmqe0MCptGE0UKoLnbRPunTw7c4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB4785.namprd12.prod.outlook.com (2603:10b6:408:a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 07:11:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 07:11:40 +0000
Message-ID: <d7314af9-449c-f6ac-95d9-168d27990814@amd.com>
Date: Wed, 23 Feb 2022 08:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrey.Grodzovsky@amd.com, Monk.Liu@amd.com, Emily.Deng@amd.com,
 Horace.Chen@amd.com
References: <20220221095705.5290-1-Jiawei.Gu@amd.com>
 <202202212330.nxcvFWEe-lkp@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <202202212330.nxcvFWEe-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:203:91::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eacc2db1-050c-4809-5d4f-08d9f69bbd0f
X-MS-TrafficTypeDiagnostic: BN8PR12MB4785:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB47852384263AEA1B5927F7AB833C9@BN8PR12MB4785.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XyV4HtxYnqP5ALxpAGetGWDE3famH+LZiLrz5kv29h19lYgo9XA+cAC/TICFqmkV6oX9oIa6wjKVo9k9+4/QlnZEbrcTYKDtHa1xUivTzwRthc0REPAKqhed8ncBfO6Xcy0qlwD5WNbf/yImr41LFoSYj8PkOquJdlLXNz0PaiHjQFqzosLxgHI8G6hxQbKaSBZveFeBDSvVG6/kmwRP5ezqlTJZhNpyWdbfe9aGLc4X8j0DjXVejd4clVfVxKvXZZvozxfoKobfmqtfV5vN/+tl30No9tOmXK62HUbNhDultwzbYLATc80/v1GAGSfLKwCWOh0EdhVdWe4yClnLprx3duq3MTTRZuc/I6bf3gYSf+2gON9rZ3kLrXUlL7R6y3UAr2I/q/nHkDDZ3Luy9VErQhXU7nP9u4b05+StC9Yp1OWP/w0LSlzQetQ4mtvFgCg1ARU/N6GjsDHVPFVsQCdY3n0zCtFIJ9sFr2Pl95EufiSMUnRXgOi5QeJn0Xs42PRIQ1IxRZy1KNMg8Lcejrrz4vqObGKAwn25md77jQ3YQIPwt8hhKT+B6AwL8N+Sn3IVKvWjsXtGDhHi3sp6SdHMl48EK0zdo2bEjXJ4XgKPncnB4NwlK4Rsb/EwKYubfI70f4OFfo9IpbhbbntqXTvbA+uhYQRAUtgbQ6zY2blcCxtnDQ/0qUx9uNG0SEvmawvu3dN7acLcwkVmimB/3V5+l93VnHRnZJzqwT7GjI3V7QedbLBhoL4zYIwsUVUYHG4dRE/8Q9mugfFryE1cSOOuC5MldaBQ3Dk2UaeBh9PLGS8kSTXmyWi9E7d8itbGxwLzGpb1oicCTkJyxOBLvYxYSy+dbE6qPH66yKjCAKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(5660300002)(86362001)(31696002)(6666004)(110136005)(6636002)(4326008)(8676002)(66476007)(6486002)(316002)(66556008)(66946007)(966005)(8936002)(508600001)(45080400002)(31686004)(26005)(186003)(2906002)(83380400001)(6506007)(30864003)(6512007)(36756003)(4001150100001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmkvY29pSFBmYkEwTlJyelFXMDAyUFBBeDJtbWNyY2h0OVVaL2JiUk9ldmRk?=
 =?utf-8?B?UmZrTUt2bk5RdzdqMU9jOW1aRlBEclpCelZEWFIwc1JkNFZCRHQwWmxBUkFN?=
 =?utf-8?B?bkFlQnhpME9pSjBxOCtDSFg2WkUxOG1iMVgwQ2tHbkphUzNYOFd3cXJOVzdK?=
 =?utf-8?B?TVVmblQxNGpOSmd5c01VZHM5NFBSWVp5VVM3aWtrWGhZRkRPdURheTZOUnVJ?=
 =?utf-8?B?SDlYVlhsbGw1MHdIbDk2M0FwTk5NdkdnVjR5ZTRCZ0RFMENOODZQZWo0UCti?=
 =?utf-8?B?bjI1SVN0ZmYxdFJ1RmIwc0krL2hub1pIOThCWVppUWtzRXlNN1BpWWlEd2Fz?=
 =?utf-8?B?aitJSUdySElwUm5WRDhQMkxObkdhek9DYUgyTlFhdnlkR056dDdhaFVsODZo?=
 =?utf-8?B?NUpMR3hlT1NibWtXSUd5WjJMSExwTzMxaXhHeFNNd2Z3d2lnRDNXSFZaUzlJ?=
 =?utf-8?B?QkdHeTdJZkVac0lGMFdXVlo0UGpKVm0rWnhhMFplVllDQkJpaEV4b09vQkh4?=
 =?utf-8?B?WlBxZSt1QVZoMjAzb1RkQldTTjVSTDBLR3hIZFhncThZTXNyejlROHh1Wjdh?=
 =?utf-8?B?ZEdsa1VVNVRVN21jdmZuRThaVHNtR3hCSDRxQ0VVaVc2ejRZcmxxS2NyaUZu?=
 =?utf-8?B?RTlFdU1Xa1RKeWJ3MUNjeS9Ud1F4RjJTVkV2UTE1UFlQT00raG9PTllMWFFn?=
 =?utf-8?B?TlpGc0pZSmtjeHkveUV2MUxSY1ltUWZ1YngrelU0N3FVYWN6MEtIY2FkQlZW?=
 =?utf-8?B?STBwSk8rV2M4M2xyRGdMcWFoZHp2aE9kRWp2WFVoTGMzWEhDL2NnYzF5MVRa?=
 =?utf-8?B?UVpYclZIQnJFZjBEUGZMVEFYTWZydXZXRWYyYmtBdUhzeXErNHAvQjZwanJJ?=
 =?utf-8?B?SUtqeTVub1BwWk93SVlhVlJRLzdqTVdsRG9oTlpUMTZmVGs4ZXY5SzFkeHdl?=
 =?utf-8?B?R3BtQ3FKVk56OE5YN01CUXBTZ0JVcFhoazVoNVVVOEtXSU95b1Y0d0VXc3Bs?=
 =?utf-8?B?bStFOS9XbDNlRWpLYVp1dnhmc0h4Q1VoZEE4TnNpUEF1TjZjNjFyeEN6SGg3?=
 =?utf-8?B?Z0Z0L1VIMUVsVCt2VThZblpGVy9tWEdZdmdlZm9hWnUzejhwaGxFZ3k5cUl5?=
 =?utf-8?B?WG1yMDZDQncrUHVpQTNJL01zdGQxNXdYdWtJSVR0dXJEQ2h3dnJjQ28yOXhK?=
 =?utf-8?B?OGZ1RmFkb3F3bE83ckl4T3kydWE2NXY5ekhMS2VZWUdzSXJIVWtWZ0xQWDFs?=
 =?utf-8?B?UWZodEVvNVdXaCtYdUxRU0tLZldhYjVHcmpjWEY3NXN2VElYMVA1a3F0UUND?=
 =?utf-8?B?QW8wS1VjcEVrSERYSUJhZlcvMHNwZGxYWEtHMmZ1eTF3Wkl5ekdkZlM0REZN?=
 =?utf-8?B?SkRXeWc3bFk0ZWlJcnc3RlZjY2hGRXpmdFBrTjh2OVZRWVNWbjVMRUF2Sm9V?=
 =?utf-8?B?a2Q4R1BxOHpYRlgvNStPUG5OUXhyVUxUMy9HUDVIdE1aVG5PQUc0SUIxSU9L?=
 =?utf-8?B?SUorM0EwamovYWFRNko0WSs5OVpVN0IzT3BWbE5JK01ZWVJYYlhkVW5za3l5?=
 =?utf-8?B?L1d1dW55aXZKQUs4azk5MUtUT1NPYkxtbmdvM0tnUm50ZXZxUjQxRTlyZ0Z0?=
 =?utf-8?B?OGt4QVVjaS9CZlNtSDUxazZCTGxVVGFqMEZibkVmRFhOQW9iNTFlOUppN1ZN?=
 =?utf-8?B?U1N3b0I2emRsYXdRMjloL0RTQVQ4elZEQkdpaWZhcDZ5a2t0OHNmZWFDNnBG?=
 =?utf-8?B?UmdTWWFUc3BKUGlmZzdHODZFcnY4K2VORzVJUUd5OXVoa1dTVElXOUJwQ0JE?=
 =?utf-8?B?Y0o3ei81WThiRDZHUy9kMGhSeTBXbURBYXBuM1ZvdnZ4WVV0a3BPKzZVSGoz?=
 =?utf-8?B?UW9zRm9HU29RM1R3cnFvcDdxWkZWcjFNYmx2TUVUTStDZlJrSjNnVjl3WVpX?=
 =?utf-8?B?bTR2cVVndSsvUHMvbjBnOHRCQW94OEp6ZmVRaFo5bDR6U0svM2hvU2hqOEFi?=
 =?utf-8?B?Y0o2UmloK21ROStZdTZncHBVQ09kY3k4eG1TdExtL0JvaFNvTFArb1RSVHly?=
 =?utf-8?B?T2EyT1MraXZDMzFJUytSeTBOdk9YVE9ZS0ZxS0hLMjBoRW5oOEVZOHQ4R3pt?=
 =?utf-8?Q?ovkM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eacc2db1-050c-4809-5d4f-08d9f69bbd0f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:11:40.5650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQwOG60NXjlX4x9DYWvbsnuhgr36+K+tqqdX3oBLC97tXvYfCHkh5SeAnTNdiI4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4785
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiawei,


can you take a look at this? The kernel build robots screaming that this 
breaks the V3D build. Probably just a typo or missing include.

I would rather like to push this sooner than later.

Thanks,
Christian.

Am 21.02.22 um 16:51 schrieb kernel test robot:
> Hi Jiawei,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on drm/drm-next]
> [also build test ERROR on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc5 next-20220217]
> [cannot apply to drm-tip/drm-tip]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=8Kj1h9%2BCR%2B8nDeUXW%2B%2FQOFbiavK5oHons0mRPyHhq%2F0%3D&amp;reserved=0]
>
> url:    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FJiawei-Gu%2Fdrm-sched-Add-device-pointer-to-drm_gpu_scheduler%2F20220221-175818&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=KMrQ%2FsAoUV768eWdTF1FdmXo44kDPjWKnwoi4rvVnqs%3D&amp;reserved=0
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: ia64-allmodconfig (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20220221%2F202202212330.nxcvFWEe-lkp%40intel.com%2Fconfig&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tLVbOkxAyxSD%2BVUHUmS6BT5RfOzO4q3sotVZ2YHGV9o%3D&amp;reserved=0)
> compiler: ia64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>          wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=8QLSr7JTjK87bBGwgOLxU6AU4bCeHoWX2zyx7SGYL7M%3D&amp;reserved=0 -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F9fdafca855faca0a3b8f213f024985c4112fa0bb&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=W9HKTScDzhoA1DClCigH2QQUgcIzLStBS%2Bx9ieYPbK4%3D&amp;reserved=0
>          git remote add linux-review https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=FNJyugHVXenGmYqwgoK9kzKKjC3WGMia%2BNUduLNb0Pc%3D&amp;reserved=0
>          git fetch --no-tags linux-review Jiawei-Gu/drm-sched-Add-device-pointer-to-drm_gpu_scheduler/20220221-175818
>          git checkout 9fdafca855faca0a3b8f213f024985c4112fa0bb
>          # save the config file to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/msm/ drivers/gpu/drm/v3d/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     drivers/gpu/drm/msm/msm_ringbuffer.c: In function 'msm_ringbuffer_new':
>>> drivers/gpu/drm/msm/msm_ringbuffer.c:90:15: error: too few arguments to function 'drm_sched_init'
>        90 |         ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>           |               ^~~~~~~~~~~~~~
>     In file included from drivers/gpu/drm/msm/msm_ringbuffer.h:10,
>                      from drivers/gpu/drm/msm/msm_ringbuffer.c:7:
>     include/drm/gpu_scheduler.h:463:5: note: declared here
>       463 | int drm_sched_init(struct drm_gpu_scheduler *sched,
>           |     ^~~~~~~~~~~~~~
> --
>     In file included from drivers/gpu/drm/v3d/v3d_sched.c:23:
>     drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>>> drivers/gpu/drm/v3d/v3d_drv.h:158:26: error: implicit declaration of function 'to_platform_device' [-Werror=implicit-function-declaration]
>       158 | #define v3d_to_pdev(v3d) to_platform_device((v3d)->drm.dev)
>           |                          ^~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/v3d/v3d_sched.c:394:49: note: in expansion of macro 'v3d_to_pdev'
>       394 |                              NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
>           |                                                 ^~~~~~~~~~~
>>> drivers/gpu/drm/v3d/v3d_sched.c:394:65: error: invalid type argument of '->' (have 'int')
>       394 |                              NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
>           |                                                                 ^~
>     drivers/gpu/drm/v3d/v3d_sched.c:404:68: error: invalid type argument of '->' (have 'int')
>       404 |                              NULL, "v3d_render", &(v3d_to_pdev(v3d)->dev));
>           |                                                                    ^~
>     drivers/gpu/drm/v3d/v3d_sched.c:416:65: error: invalid type argument of '->' (have 'int')
>       416 |                              NULL, "v3d_tfu", &(v3d_to_pdev(v3d)->dev));
>           |                                                                 ^~
>     drivers/gpu/drm/v3d/v3d_sched.c:429:73: error: invalid type argument of '->' (have 'int')
>       429 |                                      NULL, "v3d_csd", &(v3d_to_pdev(v3d)->dev));
>           |                                                                         ^~
>     drivers/gpu/drm/v3d/v3d_sched.c:441:81: error: invalid type argument of '->' (have 'int')
>       441 |                                      NULL, "v3d_cache_clean", &(v3d_to_pdev(v3d)->dev));
>           |                                                                                 ^~
>     cc1: some warnings being treated as errors
>
>
> vim +/drm_sched_init +90 drivers/gpu/drm/msm/msm_ringbuffer.c
>
> 1d8a5ca436ee4a Rob Clark     2021-07-27   47
> f97decac5f4c2d Jordan Crouse 2017-10-20   48  struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> f97decac5f4c2d Jordan Crouse 2017-10-20   49  		void *memptrs, uint64_t memptrs_iova)
> 7198e6b03155f6 Rob Clark     2013-07-19   50  {
> 7198e6b03155f6 Rob Clark     2013-07-19   51  	struct msm_ringbuffer *ring;
> 1d8a5ca436ee4a Rob Clark     2021-07-27   52  	long sched_timeout;
> f97decac5f4c2d Jordan Crouse 2017-10-20   53  	char name[32];
> 7198e6b03155f6 Rob Clark     2013-07-19   54  	int ret;
> 7198e6b03155f6 Rob Clark     2013-07-19   55
> f97decac5f4c2d Jordan Crouse 2017-10-20   56  	/* We assume everwhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
> f97decac5f4c2d Jordan Crouse 2017-10-20   57  	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
> 7198e6b03155f6 Rob Clark     2013-07-19   58
> 7198e6b03155f6 Rob Clark     2013-07-19   59  	ring = kzalloc(sizeof(*ring), GFP_KERNEL);
> 7198e6b03155f6 Rob Clark     2013-07-19   60  	if (!ring) {
> 7198e6b03155f6 Rob Clark     2013-07-19   61  		ret = -ENOMEM;
> 7198e6b03155f6 Rob Clark     2013-07-19   62  		goto fail;
> 7198e6b03155f6 Rob Clark     2013-07-19   63  	}
> 7198e6b03155f6 Rob Clark     2013-07-19   64
> 7198e6b03155f6 Rob Clark     2013-07-19   65  	ring->gpu = gpu;
> f97decac5f4c2d Jordan Crouse 2017-10-20   66  	ring->id = id;
> 84c6127580c1ce Jordan Crouse 2018-11-07   67
> f97decac5f4c2d Jordan Crouse 2017-10-20   68  	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
> 604234f33658cd Jordan Crouse 2020-09-03   69  		check_apriv(gpu, MSM_BO_WC | MSM_BO_GPU_READONLY),
> 604234f33658cd Jordan Crouse 2020-09-03   70  		gpu->aspace, &ring->bo, &ring->iova);
> 8223286d62e296 Jordan Crouse 2017-07-27   71
> 69a834c28fb514 Rob Clark     2016-05-24   72  	if (IS_ERR(ring->start)) {
> 69a834c28fb514 Rob Clark     2016-05-24   73  		ret = PTR_ERR(ring->start);
> 375f9a63a66bae Rob Clark     2021-07-27   74  		ring->start = NULL;
> 69a834c28fb514 Rob Clark     2016-05-24   75  		goto fail;
> 69a834c28fb514 Rob Clark     2016-05-24   76  	}
> 0815d7749a6852 Jordan Crouse 2018-11-07   77
> 0815d7749a6852 Jordan Crouse 2018-11-07   78  	msm_gem_object_set_name(ring->bo, "ring%d", id);
> 0815d7749a6852 Jordan Crouse 2018-11-07   79
> f97decac5f4c2d Jordan Crouse 2017-10-20   80  	ring->end   = ring->start + (MSM_GPU_RINGBUFFER_SZ >> 2);
> 4c7085a5d581a5 Jordan Crouse 2017-10-20   81  	ring->next  = ring->start;
> 7198e6b03155f6 Rob Clark     2013-07-19   82  	ring->cur   = ring->start;
> 7198e6b03155f6 Rob Clark     2013-07-19   83
> f97decac5f4c2d Jordan Crouse 2017-10-20   84  	ring->memptrs = memptrs;
> f97decac5f4c2d Jordan Crouse 2017-10-20   85  	ring->memptrs_iova = memptrs_iova;
> f97decac5f4c2d Jordan Crouse 2017-10-20   86
> 1d8a5ca436ee4a Rob Clark     2021-07-27   87  	 /* currently managing hangcheck ourselves: */
> 1d8a5ca436ee4a Rob Clark     2021-07-27   88  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> 1d8a5ca436ee4a Rob Clark     2021-07-27   89
> 1d8a5ca436ee4a Rob Clark     2021-07-27  @90  	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> 1d8a5ca436ee4a Rob Clark     2021-07-27   91  			num_hw_submissions, 0, sched_timeout,
> f1b7996551a40a Dave Airlie   2021-07-30   92  			NULL, NULL, to_msm_bo(ring->bo)->name);
> 1d8a5ca436ee4a Rob Clark     2021-07-27   93  	if (ret) {
> 1d8a5ca436ee4a Rob Clark     2021-07-27   94  		goto fail;
> 1d8a5ca436ee4a Rob Clark     2021-07-27   95  	}
> 1d8a5ca436ee4a Rob Clark     2021-07-27   96
> f97decac5f4c2d Jordan Crouse 2017-10-20   97  	INIT_LIST_HEAD(&ring->submits);
> 77d205290aa944 Rob Clark     2020-10-23   98  	spin_lock_init(&ring->submit_lock);
> 77c406038e830a Rob Clark     2020-10-23   99  	spin_lock_init(&ring->preempt_lock);
> f97decac5f4c2d Jordan Crouse 2017-10-20  100
> f97decac5f4c2d Jordan Crouse 2017-10-20  101  	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
> f97decac5f4c2d Jordan Crouse 2017-10-20  102
> da3d378dec8634 Rob Clark     2021-07-26  103  	ring->fctx = msm_fence_context_alloc(gpu->dev, &ring->memptrs->fence, name);
> 7198e6b03155f6 Rob Clark     2013-07-19  104
> 7198e6b03155f6 Rob Clark     2013-07-19  105  	return ring;
> 7198e6b03155f6 Rob Clark     2013-07-19  106
> 7198e6b03155f6 Rob Clark     2013-07-19  107  fail:
> 7198e6b03155f6 Rob Clark     2013-07-19  108  	msm_ringbuffer_destroy(ring);
> 7198e6b03155f6 Rob Clark     2013-07-19  109  	return ERR_PTR(ret);
> 7198e6b03155f6 Rob Clark     2013-07-19  110  }
> 7198e6b03155f6 Rob Clark     2013-07-19  111
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=JTbXE%2Fv85yMSdX1zm4Em1aUZ32N29bf3FrllBkr%2BsMQ%3D&amp;reserved=0

