Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D654F6BC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 13:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1213311ACDE;
	Fri, 17 Jun 2022 11:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AEE11ACDE;
 Fri, 17 Jun 2022 11:32:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTQhTBEmhuH/GI2BEOLKQnz7Bhg/rfnBW5jZ1Ewyp0xG6Fk780+E9okriCHSqwlUjIeZ0QYiqy8cyVi2FYQDRGa1KPUQ9iPcZfKA01cKZZ4Xm/0HaZ8/aW+j4cgqF4uBL/iToFuYvmkj5l5d2RD5RMIBZ+JcornTx9SMZhEV4xvxLY6c+DmWQ/SmPtPh8qvVVOSRBejpWafYdGHLfRsjN0nhQvcsPCzXb3GJw7F4rnvYnPj4JKdVIfjWNasRjoGe+qE6pIfcAjkLIejVdFvmQFB26BLCpYXNgvhS+ma5SZMmy9n1+B0DG3lzpNVc638F+AbylMQrOfdIe8058CMqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySo6dXdiN0TvBYoTILhySMYYQxy2TSxuHvPRhnGv4Hw=;
 b=BttMhx+XJydAdeJSu0BN+vH+WR9uNMDGNY86JGM7sTaC4DSJHenUlOZzPKkR/ZDmXXqyz6+7pqti6b+dYEBST9C2T9VLcEwbvCsUBKwTZgLUv+tVHvKh0UbD2VRgHgtf63qihV5qVOJ0iDvigRlus9GWekKj9joiGtfpXgyduMS/TXV4P1vY1e3MCmOFCig3iAh7eUQ/yc8zNqFamsx4ssMDoGujxd6+U/ya1+63JrM1Kw9xmG3STzmqUFfcEMU0GHmvCVqqvlsIjmhL5MRA71iD+195GCZlEAYjCALF07lfVwL1Kj0NSZBx8OzkFGBnMb5XlSIEaC//c5so/e2Eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySo6dXdiN0TvBYoTILhySMYYQxy2TSxuHvPRhnGv4Hw=;
 b=dkKmZhdyjWpMgTzuY4He5AfwAxZcsNFPnaLaC1pZL5T/kl7PAqbaHM3UCKdQ8uoxuuwID+ldDd+9CxCud8RzjaDC7LtqQVTEvH6KsSF7clHXEDdDifmBZH2r6lJTlKXGO/QOJMO5+S6o8bEF68qqi9Re29t+Fj41LdYDZA4+x5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB4726.namprd12.prod.outlook.com (2603:10b6:a03:98::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 11:32:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 11:31:59 +0000
Message-ID: <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
Date: Fri, 17 Jun 2022 13:31:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: radeon driver warning
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 175dd47c-e917-4be6-c94c-08da5054fe17
X-MS-TrafficTypeDiagnostic: BYAPR12MB4726:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB47262DE19183C67E61A9851683AF9@BYAPR12MB4726.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDjkXcRXN/bIWMT5tbnYCmubOIcTm6H8OB6+voQkyuEaYP9tA7sxyInMJgDIY5c4duxF07QIbqE1MtxNWXm1WiqYj0GxxUMoVCcjbeK7K1ajK83ooKPZdCHsVItg/tSbxJzQ6NrqOKeowaF8rBUHgyZxCqOzj2xyuUTZkz/WReXGQRATutS7jak8JROsoDQ2N/9zexyzeZ6xYf3DvQQVH04RT9H5lqJIfMVH+YlW2YX2KFDnYD7/Odw0w1zowrHC4weKWTm+BV2pGn8q5ODKnc7rCayBt44WJ3O6eoRIHOvumDqTiosMz8EDpJlRVOtuSI5n1a5kBeN93XvIhv7PII78WRsKfJWUydTc2B4xIr3kL0xiNseBWvrLJD8x55SRN4o6g4czspl1RNQoluJBscY5uWvCcmRIz7/hWZ3ovoiMFRFX/Z58DmXi+66/vbXgQY6wuYtqh2jLMMBJ9fdlBkPmEIHt/FpvgupWCunJzreAq4QOqNqmXullG760EizN0nSWBf3m88W0etLx+AbFxI16nNDGf2MaM/Kv94qKdLZBhu7ML9WKYHDGwU7HQzXXE5fPjTj2+NSF3OnifneingGZShbSyR0VGz4XaYPQUF3CtTsDTswPGSQknySucrJrL9QosqA9xEM/KJsoj+vYw5DYvhxXzLf8Cr27IySC1ylOCnrvX9TvyCwWtzWG3bNijV3E2WKNM4pk9M9MRATyoE8oY1ixTqngabvY5sqydyFZLBR9xXO8bdcVzpDLRb4ggY76thjtguVRz8CzOdNCsr/6PPAin+DT7gyMxEzZtGMsPnf3Hmizl9utAzkApeOf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6666004)(8676002)(66556008)(31696002)(66946007)(3480700007)(66476007)(36756003)(2906002)(7116003)(5660300002)(6486002)(498600001)(8936002)(45080400002)(6506007)(31686004)(38100700002)(316002)(2616005)(186003)(6512007)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0JLODI2bm9BaWd3SDhydURYc1VQNGhPWVZFb0ZLcTk2NTdaUkZYQTdYanZD?=
 =?utf-8?B?MkV3b0FtdWxCTnpVdWRnYTNVclZPSDl1ZjZ4Q1JmQ24rN1ltYS9keHZJK1lr?=
 =?utf-8?B?bEdVVUxMRVNBWmYwQ3lCWGptaTd5R0w5WmVRQW5LS1dXV0JkT1J0eVBOS0Za?=
 =?utf-8?B?WCtGc0tuK0Z5Z0ZhVitWeUl4VkhCcDQ1VXJYWDFWbXFRa0pwV0pRWlpnSEln?=
 =?utf-8?B?bVh4WU1qWnRsVFJpNmE2clhtZmpUbjhocU1QQlFlZVIwalhCcmcvRWZMR3F1?=
 =?utf-8?B?ZUpJdmh0QkVVdld4Vlg0VGdVMmxlb0UwNlZJUVR5WUtYbTlKTFhtWWVtUTJV?=
 =?utf-8?B?SnVsVUVFSmduYWZsaDdSM1NtSVQ1Vk5pcm9lVVZwOFFOUXhnMWx3RlFFRmZa?=
 =?utf-8?B?dVdlNDRFTlh4WDluUjFRby9sZ2NwZm9MZWRVbFpHaEVVd1FDWW8zWUlzaVpo?=
 =?utf-8?B?WjFoUFJWZzhQakFNa1VMckZhNDdvdWEwczYzU1VhdlgzOWJlYVFHNVgzVVgy?=
 =?utf-8?B?WjhxekVyMUIxTFlma1VJTUZhUE5xZC85b0hPb2F3bzZVZ3Zma2RsZEczQ3Nr?=
 =?utf-8?B?OW90cm1NczJzTjRRSnV0dmRpbllGRkx0WFVBZm9FMHJEZFpqTWhycjhUY2Zh?=
 =?utf-8?B?T0lhZnVkd0oxZUF2UStIOU5GRmpDMkkwdGE1Sy8rWUVMNG9MRk1wU2c2QU56?=
 =?utf-8?B?WjZJT3pRRkNmU2RSR01ySmpsdlVYOUVjTFlwMGdiSzFJU2lwekJuZysvVHFI?=
 =?utf-8?B?cGQ5OWVINkdmZlhOa0p0ZFN0RndVRXpEMUpDQW92M1RnMjQwK2d1YU9BREti?=
 =?utf-8?B?eFVLcm1uMFUyTy9lK1RVZ1V5SjBvSmdaSm5vdFRaREVWZzgzS3hERDh4WldL?=
 =?utf-8?B?ZEpPU3RMR2lMK0lrSTQ0blFhTFQ3OGJlK1N5R2F0ZlNzendIQkRXWXFUcWxu?=
 =?utf-8?B?VUJBTUw4cHhOUGx5bnNqZmhmMEZsKzBZMFFkT1RhWXdkeklLcmtwaFNaTXc2?=
 =?utf-8?B?eWR6TVVoVGNOMGk5bUZBcmlCY0hjOUxac3I1eitWbnNNb25sL0hucnBxSzdT?=
 =?utf-8?B?OUdxTXZNVEE2LzFaRFl1THArZm1RbFpGSmRnS2xyRC9ia3FQa1VCMlo2Skxl?=
 =?utf-8?B?SDZ2SVdkTWRUcUh3UkFvV3lHT3NaUGVocFE2YmJsYWMrbGpZcTVCNnRZVEY2?=
 =?utf-8?B?ZTRNUjVKTFIxZEhUZzNwaExJU3dPZnVuL3QrbzBzOC84RkJoZ2lsUERoTnJF?=
 =?utf-8?B?VW5SbXl5bkVVa3pINkxNMGRpS1d0OWZjSXFtbjFUVzR1NEpiaUNxT0FQMTMy?=
 =?utf-8?B?TXpBbzlTVnlwaHVjYVpSUDBOWEtvYWpoL212K2dZbVorZjZxNkJWSkRXV0cw?=
 =?utf-8?B?cEJOQ29wdUE3WXM0eE5LUGRFZGZURHd2b1I1QVJtd1dPZXA4ZkV1WkdFZmxL?=
 =?utf-8?B?SlkwaW93WFBubVhkYVdmdXBXS2tvZmVkazhGMWJjaWNKVE5CYjVpWmV3K3d2?=
 =?utf-8?B?RTFRaGhrcm9odkQwS3NCZ1ozb0o2NjN6UFJFSHB0ck40RTQ5dXhBTnZvSzNQ?=
 =?utf-8?B?VUxHWEt2clJaQXJTWUtuN21PWHhwdnlJeVVjVXFwaDlqVVpkdDlid2ZocVQy?=
 =?utf-8?B?LzhBYXQyL0pId3l1djh2QnBad2dnazMrNGt2TUI5bytlbUl5UUE1UlhkUTM5?=
 =?utf-8?B?SnU3Z0FkTDFMd0NycDJHU0JMV21KRFBpUURPV2g5UlIyZWpmWndzcFM4OWpa?=
 =?utf-8?B?dno3Q0tkZldPYlhldHB1dHlFVGVZUVZ5cDU1UGJmQVNxS3hiNHVMTVhVT3Fj?=
 =?utf-8?B?M0pLbXBIenhUMjJqVm03VzFKLzk1QWtuVFlyZnFFYk40WlFkelJXNHZMUjQ3?=
 =?utf-8?B?Rk43SllrVk9VOEE5K0VUV0E0VDF1WDU4MUh6MlVsdk9CWFlYRGVFUyt0Yk1a?=
 =?utf-8?B?VXZIc1l4QWVROGhqODc3Y1VSZUxtR2c4b3YrSy96bHZaTDZ3WWRCRFVOU3BE?=
 =?utf-8?B?dDgwS0tRTmpWcXZoMldtY3YxZmpKMEdrdDZBZVFBaEpZenA2ajk4NC9hMUhJ?=
 =?utf-8?B?STVWSUMvTGJGdUtNT2h0clg1UVlZckdBbXFPRmhMQk5POS8vMkVsTGFBUFo5?=
 =?utf-8?B?ZWJqL0ZBaWxqWWw1bVFwZExCNGNBaFpwdHhFbkx3SVhPeE8zbThqcVZYOUNn?=
 =?utf-8?B?S0RkeWZaejFSUE05Z0xqRFhzY1V2VWxoUVpnanZUZzN5MFJieVhaNFFXZEhs?=
 =?utf-8?B?Q1NtbjRDNDBURFNQczJ6bEw3SkJMTjZXRXJzT3dqNHNvcjZqcmhRSDkvQU5K?=
 =?utf-8?B?UFYrRUs3dVQrVHdJd3pGZHR2U1lMMlQwbHdsMVlXa2svZnc0bzdTajhiNnhJ?=
 =?utf-8?Q?+Ldc0mRJWkZXplLHIlZatmD3ltbqn/DV9lESL5Kewr5T6?=
X-MS-Exchange-AntiSpam-MessageData-1: GEezFLuxwkVShA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175dd47c-e917-4be6-c94c-08da5054fe17
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 11:31:59.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eCJv8Ge//Q3SvehdxgV6wKhfsgdzcIwPeOonI/KT7PeZnw3xe4D56ij/HEz7UNZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4726
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

Hi John,

well, this warning is intentional.

The key point is that your random config results in a very suboptimal 
situation where the graphics driver only barely work.

And radeon is pointing that out with this warning. That is totally 
expected behavior.

Regards,
Christian.

Am 17.06.22 um 12:57 schrieb John Garry:
> Hi guys,
>
> This warning in the radeon driver breaks my randconfig build on 
> v5.19-rc2:
>
> drivers/gpu/drm/radeon/radeon_object.c:186:2: error: #warning Please 
> enable CONFIG_MTRR and CONFIG_X86_PAT for better performance thanks to 
> write-combining 
> [;;https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonl&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C430e22f895ec4822fe5e08da50503030%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637910602602101203%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vT%2BWgL83xuAOqv44oVU3J4ypTDzC9f%2FNslYXtbIl56Y%3D&amp;reserved=0
> inedocs/gcc/Warning-Options.html#index-Wcpp-Werror=cpp;;]
>
> Is anything being done to fix it? I don't see anything in -next or on 
> dridevel list recently which it could be.
>
> thanks,
> John

