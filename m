Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3654ACEE4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F61A10E2EB;
	Tue,  8 Feb 2022 02:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C34A10E466;
 Tue,  8 Feb 2022 02:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Caf40c2TEq6rWPqTcoqyRRRdPpfT5ilIDTWo0iJSuqUMkQFi3slEWBLAaftc1wKTz/CbIaem0M0Y40SSRHx/CwVd8c8fkaVaV2vCBrCLuglBSZySFQMTL0+w6ToPi/f17DPuwYeByQFY47a7Y+eqaf3biMXvStXEmOHob9aMVJJT/9t06+Cs3TSCrhsTaH4XQ1IB+gmAW8/rCgAgyIeh+OV0GrHYTmbd0nB7HfHqdPHHaombb1pfPmug5MhOv2/vLKFyDYWyLklniRDln2gNqqYQjCWRDgczUyp+yULYMwFqOATlAwYNmjNBbVINx2nJLkLrQxoiA8nSYOa9Bsz0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vw/xlI3hHQ2z1SLSFNTJv359PFp0hIQaU6nsrm3bYU=;
 b=l3FBUl5iZOW1nKoiCYpPt/W9PMih6bfUx2GXWF223JNkajP1FyzwME5YQXV7EEVvR4gJhOWnwQmhsHdOl2RftvWUK2GecszFKrRPdmk6LZddohgm6VTpIQ/BboEiyCOTed1q0e/3vA4k2NW0CQOaweDkECmNW16EY4DYeymEcYbSs5f9mVenpdT/j9RORbLarQrcrq3e0eHm72SSjz8bMNxSi7qj/5ssG3AQjB4JDse+tLPuM8VvLnRYsmEYDnVU8Yu+JPdPuKX+FcotI5bnycBHQx9HTwElubZfTe0PFxqdGNme1+KG5cMrqRjbM457pW+FdDivz4filmkRunfirw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vw/xlI3hHQ2z1SLSFNTJv359PFp0hIQaU6nsrm3bYU=;
 b=F2LlJsFcenChwUZIONXilqTNBpP9fPLN50gV1RPstgPwP3XxaJo1T/QelFYUBSTPOQifjb5x5pXXPuxWrdqFn4ONZB/twuHiFeoBdw7cFaWB1cyu145YSXdYV504RZvuYY5PCdd0wCX1qASGmMPlhmc/F91j2glXtr74FgyZEVM5oHqqClB7MBWjGKGx2G3zDx9CW7DuMPkkgBov3piP1jYU/AKY/eLTUCSW9TsBmq4HkZK3aMuOcBoR3AXO0b9Xvrfa9m9Mzhj4a4PG20JYQ18FT/X90/aWzpw8Qjlikrqq4Gku/CEdo3AXt8FpX5U9+3lOMPBILlaMENZCAGqYYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 by BYAPR12MB3013.namprd12.prod.outlook.com (2603:10b6:a03:a9::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 8 Feb
 2022 02:25:20 +0000
Received: from MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6872:c444:d3b5:7b2e]) by MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6872:c444:d3b5:7b2e%8]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 02:25:20 +0000
Message-ID: <8478b7c5-5079-5c5c-04cd-54a313e3f7c4@nvidia.com>
Date: Mon, 7 Feb 2022 18:25:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/8] mm: remove the extra ZONE_DEVICE struct page refcount
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-8-hch@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
In-Reply-To: <20220207063249.1833066-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To MN2PR12MB4344.namprd12.prod.outlook.com
 (2603:10b6:208:26e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198dda00-3a04-48c5-60a6-08d9eaaa403f
X-MS-TrafficTypeDiagnostic: BYAPR12MB3013:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB30139874670649EB6903B62AC22D9@BYAPR12MB3013.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MS50xzBMSVmD7+KmP1L1FrPXYz8iiV944FixAFn9OuNEAjeE2Vq9McQwQKbT+FqIqHCTNAGP602+IJj/pjsagIi9x/1O/iws0Qld8lyp7hS+2lag95iQg9UV7vFQQICEyhSFNQMrvjAKFf8glqZx2Pos+1MYJJRuiZjc1lwrIj2rA1vSMCM6DIXsGumbBcYQhA1DFMOQb96r2AxI9dPiBwTrGio9jMsqen6SL0yvktG8IZffgZeUH6BpQjCDDhFGPpA27j0hAqazD6XS5yCM7+OiS/dbUpuoMOhO+5jxrEqyVqoujBKfYtJMqbVB2lpM/pTiw2CxawG04LuTmTLzkHOEH42L2M7KFVpR2msy/lNDVmZ8EyBykVtc2AS1HqSlBDij2ubuRj6wdNaChrLy4wGTll2JpK3nqQz6QiTbipaNDi4zmW2XMX/sczt3aJsxXjy5N5kBFyZJ6odpowbsC0bj45ho9a5kUlqlZ6bpjPm4sUCO8zc7Tu3+EO6s7UE4p19kY3xic9lJ2R7zsRLYF2DtR1gf3tSsTVaJZ+8x5mI8bsb5fnENO4+VlxyofGG+NR1Tm6aiE24MMoEcBGYyPzCOo7i6wK5PctXnz4HgvtwqTjtKko5y/G12udAUI7FJwdTamgOUZU+/XZPTlHUp/4qK+TQMarhwvliEJUNCen1dZclJxmZ1gc8ZN4RxUO8kCjbDHvVSsNTZmfnG8PRz+1PxKdP+ExL7wtFbK+J4hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(8676002)(4326008)(66476007)(8936002)(66556008)(66946007)(110136005)(54906003)(6666004)(316002)(186003)(2616005)(31696002)(6512007)(53546011)(6506007)(86362001)(7416002)(4744005)(36756003)(38100700002)(2906002)(5660300002)(508600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzE2QXZYZzBlRDh3OHF1VThsdDZmZVJqdUEvai9LYytwQ0Fub09KK0pTUENN?=
 =?utf-8?B?c1ZoVWJFbkU1SEJXdm1PQjQ3SDhZb3VRKzVHNnZCYzdBK2tGY05acmJWMjUv?=
 =?utf-8?B?RDdZekgwUDNUTzlhcEw1SkZDSTQ0bzhqMzJQYXFvNlN6ZUdua2h1aGFzQWJH?=
 =?utf-8?B?amg2RUVDYk40Q2V4Z3g1ZDhVZzYyMFg4MTRsY0I2Mzg4VEEzRDR2T2luMFQx?=
 =?utf-8?B?dkxpNGYrOEw3N2FFcjkzTTI2OGhNSXhmWkk4cUM0VW8xeWVFWWhBUXVQNUl1?=
 =?utf-8?B?bDhpMTFmMEgwWTNEWU5lZExLN3hLaGlGWm42elJlM2NQTGEwN3NXQ3MyN2E1?=
 =?utf-8?B?aE5UMExRMWMzWXRGQ0xzQy9zTE5qNFpqdUNCOXNsMUNxbFY3Rm5vUzZxT1Jx?=
 =?utf-8?B?aU1LdWJ5bHlhc3d4TFlIWmV1OTJobHJiMGRyS2xDUmU5WHpmWmptZzJZNzA2?=
 =?utf-8?B?bjM3d2wwUUdLL3F1RFJYV2ZwS2JMYVlVdmVtdVNzQ0xYaXRzeXpuakVLV0Zt?=
 =?utf-8?B?c1EvMEk5dFQ3N0F1OFFFRDgxZGh0djhEM2FMNjZjbi9Wd0srUzhDeEx1Mk1V?=
 =?utf-8?B?ZG1SbjBNSnRhRi9tQUZRdVdJcEZWVURDQ1gwcDZhb0JoL1FwbkhncUU1NjdM?=
 =?utf-8?B?emFHcGthdXFmMU92SHQrbklaeWxIc1h2czkyQjlaRlQ4eFVHS0NtMGcrUkxD?=
 =?utf-8?B?Q2RvZjVSYWhvL2ZIbFBFNXRUMFJpZTVrcWN5VnpjV2dWL3E0S3ZpVDNENkZx?=
 =?utf-8?B?NXBPMzJnWVRscm5ua2RPS1dJMlA0Rm53TzlXM001RHVjbzIrSWwxZFRsdFAr?=
 =?utf-8?B?QXd1K2VNb3FJQmVla1RIMkVUc0pEajU0cFEzc3FRdlB2Zy9jZzBQeWhXM09n?=
 =?utf-8?B?NjA5RUFWNmYvQXE3V0xwMFUwek5FOUZUUVlXcVE4VE9EZHZMR3oya1cxS1h3?=
 =?utf-8?B?ZEZYeStya0ZrUUU4eHpickptcjA1WWlyQ0pUVEIyQk9kNFZ1YjNGZkh2SHZJ?=
 =?utf-8?B?YTUxdk5GUXZUZjdwMlJlNEpPUUFLalFNelY0S2RLNHVqSVFCeW1xV1NVRFNL?=
 =?utf-8?B?dTlmKzByVUl6dE9yck9MZWZjY1ZVU2JrSXU0bXdJQzVsWFo2MFlOODRJVnFZ?=
 =?utf-8?B?ZEwyeXpLSTdEM0xVZjdkeEoybnpUdmNuWDNRYjlGOHhLaGtVcTZhZUpxS0xE?=
 =?utf-8?B?YnFralVpU3N3VFJqOXpXSW9uL20wMnQxbURLYXFLU1Q4Kzhad3dpM3JhZmVk?=
 =?utf-8?B?YldEL04xM01RdnhtS0pkbFdSVVBQZmJUTldidHJLcm9zdnY3Si9hbDNSTXJ6?=
 =?utf-8?B?VkJQcWFtT01pVkswY25VU09HL2tPb3FKK3NBTE02aG5PMDF3eitqcTh1eGZk?=
 =?utf-8?B?SWZ3WllPbCtPQVZ1ZHN5OHh6Z3EyazZvdDdmYisraDlYV0RsNkVVVGVEZHlO?=
 =?utf-8?B?aDhNTnErVTZqM21uZVl4dWkveUJlQ0ZQTjlIRmVmVUJRRGM5RVNEMmlsNWk2?=
 =?utf-8?B?Tlo1RnFvckVLUWZ3QzFFSEJLNC8zMm9kakkvYjdzSjlPSkM5YVhuczMwbndY?=
 =?utf-8?B?cldOMXZPSkhMQUtaZ29lY2JLcWowLy9qZzVSMEowOVBZN280T0xoS3dlRVgy?=
 =?utf-8?B?dzFQcnVLd1p4T2IrcmFwV2lQeHp5TXJZbzdRblNJMSs2d3d5L1JybnBDTGdB?=
 =?utf-8?B?bUpSbFJhT0t1dUhGUksyTC9ucGhrS0JlbTA0QkRQUUJHYXU4SlBGV0s4MVRm?=
 =?utf-8?B?T1pyVnNabVhjcCtzQ0lqV2w0SWRBRnFoUUZrcWFyOHZxTk5Mb1hlYTFWTzhn?=
 =?utf-8?B?VGZ1QUlMbWdiU04rcXhoV0ZlTFo0VW1xR05ja2tndUdVTEhGdjhndUFVYmJu?=
 =?utf-8?B?aHFaczVyaFQ2MXBCaVBRalY3VWlMdzlUZ1RYcWlPQi85MThDMzhDOEtKdHFp?=
 =?utf-8?B?WkxjZWU0K0NKU0tOb2pkdEJzVUJWT3ViTFBCOXhCaU5OTnlZOEVLREhKck42?=
 =?utf-8?B?Q00wS1hGOG15ajlpSDE5KzRLaysrNWpQZkVuWXBFZzhySG12cU9QVUJaREVs?=
 =?utf-8?B?cEVVSVpIYWlNZm1QR0VZbFo2ZEZuVjdMcEliUEhiOVlObERib2R4UzFMMHpr?=
 =?utf-8?B?UkZiYUl3NTlqdDBTUnFCZjZYZThyTSt6alNNQXI4STkrSWp5MWNuZ01NbUtv?=
 =?utf-8?Q?STvYVY4FosstOjEbr1Qmm+9fBaP9eZI9HnPJHLIOoRSm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198dda00-3a04-48c5-60a6-08d9eaaa403f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 02:25:20.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZAGx2zlFKkQbGSz8PvJVvTS3TTOZ5N9wnrxf5npG6JfuPuUDQFs7zbsIQzcugNdpYn3yK35rNY33ROsTOXDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3013
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
Cc: nvdimm@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/22 22:32, Christoph Hellwig wrote:
> ZONE_DEVICE struct pages have an extra reference count that complicates
> the code for put_page() and several places in the kernel that need to
> check the reference count to see that a page is not being used (gup,
> compaction, migration, etc.). Clean up the code so the reference count
> doesn't need to be treated specially for ZONE_DEVICE pages.
>
> Note that this excludes the special idle page wakeup for fsdax pages,
> which still happens at refcount 1.  This is a separate issue and will
> be sorted out later.  Given that only fsdax pages require the
> notifiacation when the refcount hits 1 now, the PAGEMAP_OPS Kconfig
> symbol can go away and be replaced with a FS_DAX check for this hook
> in the put_page fastpath.
>
> Based on an earlier patch from Ralph Campbell <rcampbell@nvidia.com>.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for working on this, definite step forward.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

