Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C9F742127
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 09:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300610E3B9;
	Thu, 29 Jun 2023 07:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC2810E3B9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 07:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQIfNT+/Up/zP5JYxtuNuZcZWHDY5k3uSoo5VBBTd3mAtlhIUxwDCfgzCVdy6NSkWT1nRYhD+0cUAQO4OyB589rVVjd8+6iziwwTMwA5CaWu4tjeOjL/YoBHU7FrWFMvO5p9/tQK81ChXUvRkRV70S2cjb8dqKiBDlFeWWazJlJgbAilBSkgupfdlLHcbBXopMdlsT0F6+gU2LRgNcqjHQ0i2ME2P//oIY3rqx4PfUhVXI3bRfUH7TPh4ATobPUPRZ8LGsPOiXPiAgIkCftVDb4wcegUjkYCuFXlcXbqYGsWg8e+1Ekd7r0NPa99eWMoaTXOpSZLyqh+kJHm7XKNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFTp6jN0HuPi/28fW9xSpcNS6PRL8FkBn3vxv0Rv4hg=;
 b=JqhJ3PB8Or7JIJ3Yqd74EUZgu9oCMkPgxaqfanrccoKR7LFd/LMHpz7kiB30Td3vUM6EAcRhel7pGH7mDqr4WjSRkUlobHWAPYF+N7/kqjAVF/hS0LiQdlKLpPGhpndDpgcGjtyIv5mqfgxGc99efQXXahCVpx1P2TB6PgIKkab4iFIXerMig2kBlWIIv11rGCYcroVHV1sMeCAMkfeCgD6m8Y2wrOs25Kvu6MoLY1pYtgU6LOtT624Rs8DS96iTNZ9KCuM+arlNJmghWNhoaqQXdWojhzmpGNfgxt0HE6cM58QVx+3azaL5L6/5Ev55EyUrAEoMd2Tla9DMXA+eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFTp6jN0HuPi/28fW9xSpcNS6PRL8FkBn3vxv0Rv4hg=;
 b=xs8MMaksgm+h8URMbVnop30JFU72ZnhV2J5av5pWXeSTeyHu369gs4Pf3AvY4Tza83cqRdT+LylpDfflHUJSbFNbdtCe8S/OBzhi45TQX3rUREilkRutB9hl1fJBXlqNXGd0y8uRFet4u9F6Ex4PnPjNmOv6O4kh3LTlhUs/IkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 07:39:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 07:39:32 +0000
Message-ID: <d4d9cccb-498d-673a-6727-7785e91f6e73@amd.com>
Date: Thu, 29 Jun 2023 09:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2 0/3] Introduce KUnit tests for TTM subsystem
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1687779215.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cover.1687779215.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff455b6-9df1-4320-9eb9-08db7873fa4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvDdTY+5Mn31zpaUt2lcRIfpvtoo1wBq9ZhiuaQTsiKPU2XpsOK05GLBP85iDiwvC8TNE3ZeICO3/QfHRXzabssJAhaq90kOvuCEJR2W7kQlHrp59kCHNLtcdQyUs1fd/G9cOjwXYrTdbyXdtTL53OhVrvdPqzpHoeWU6WJfjlSGKFuwhyKf48wPWunmTLU4fJJAO3v9iB8GsyEbkHvNSY8xQ8PhHvXdmFV1xx3Tp73gpMrpDPlBrWaC5W5UIqLi9m0lmwNRPQ3+CfpOyhCKIbD5JzTe+nYgeIaE/hjDGo0Yy63scR7Z1r1EHSeUckTmzgIoUPyLXD4iVKuQ/a2N1DMcLMGA4MmYCmRg0nKwjLOm+cqz3Vqu/uvAU5CmLuuSulWake1KGLFaWxq48PCYq4Kl3TooJU9LMmdxBZDrL2dALd7XzFQDlffLuM7j0Qzj3gi3lgpL+i7jzMpG5bwjU4F73G1+KgOeO1zqqQp4+i5CV/PErVNgrHv7Sga3i0GvWGxMEz1ea2y/EDJqW6fbRtlKG1S+JG6gsiq5QmELDfNjUwSyNnqaCeTgsEDiZ7vq/FzGsDsHsmmyvz+BjoxDyZgh60bTAiZu5TpSlwmVUoQ6cxZCIBI5y11JgQ3jkjtyn+T1Pm981AsH75ro2niCx0pKbKbWpsi8x8L5af9U0jUAxTTSRB0kIpHWOj0fpbX8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(31686004)(186003)(2906002)(66476007)(5660300002)(26005)(6666004)(31696002)(36756003)(8676002)(316002)(54906003)(86362001)(6486002)(478600001)(966005)(4326008)(2616005)(38100700002)(66946007)(41300700001)(66556008)(8936002)(83380400001)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVArSS9ReEY2VXgrWWNoWHhBMFBPRWZaNWtZWDRzMkJoTEZqSVFpWlJoa2tY?=
 =?utf-8?B?eVhSVWd6S3ZPSHdZaHFlUmpvajBadmtTVDZBWGFhUjlmVnRVWlRTSEk1Z2xI?=
 =?utf-8?B?S1FiSkhaV1dkTzhTc1d0UTV3RGxXM01LTUJXbHNIdTJCVkFKZ2JUa2w4NG5q?=
 =?utf-8?B?VlM2Y01jUEN6bnF5Nzd2dWJKaWdPcWxwZUNtN2h4N3ZTRy84WENLZVVvR3Bk?=
 =?utf-8?B?ZlRtVjlCaWs3SXpTK3NiQ0tKK2w0dFJPZnBRN1A0aWo2VG83ODRMVHE4TzNP?=
 =?utf-8?B?VEZVMWdWdmxTaWRDMURQa0M1a0E1ZVRwb3FKbURJWjFxOEZycUNLODJRWk9v?=
 =?utf-8?B?V0JnTFl5TnNlL0RtRHAvZElDM1dVNzErbkJoQnNac1VRdzZtclN5N1NvZWNz?=
 =?utf-8?B?QnFHY0NodDM1aFpxQlh6YmpKZmdJMS9aS0FtMEgzOWxFdVhUUmlLUWduMUkx?=
 =?utf-8?B?ckR5LzFwRkRNR2I4dWJHNVQybUplT1h2T2N6d3dGVTBlaTNSQWRMVGNab1hk?=
 =?utf-8?B?VE1DVzU4bDNNR3BGMDRON2k5OWRDUm83R2dCTm5JTnVPcDVFN2pMNlJnTEwy?=
 =?utf-8?B?cWtZU2tlN2FId0g5c203K1VRanZjZEdlTzBETlRHRG16TjVsRG51M1E2RW5m?=
 =?utf-8?B?SVZacHNLT0hEVUFrd2wzY2t0c3RtZzJlTDdGSy9FMy9iUnlyVUJ4NldNRG03?=
 =?utf-8?B?bFBmZ1hJVzhHZ3c3aXQzRmpkRFhpbS9Nc3ltTVBXWForVFU0NWsrNTZrZDNQ?=
 =?utf-8?B?MXh4SjVneGZYOXJCMHAxSFpraUxpdUwrdDV3d0pIUExxOG1yWEcwbEp0K1Q2?=
 =?utf-8?B?aFQxaTRnYWtlLzU2dDk0RmdFbWoxOWcxSmlUeDRuRWZjK3VybURqQmxZSnY5?=
 =?utf-8?B?eCt0clJzMldnY3VlMjJGWmRIOHNTaXp2SHBqMzRvUGI3V1pHUkN4aExEY0xw?=
 =?utf-8?B?QUt6RkV2VXBFSGJMT1FMRnVEaGJrcGZXSTdCcnUxd2E1VTBYZUxSVWVVdHB5?=
 =?utf-8?B?RFVPQVkybElZZlFqVWRYNUE3Rk1XZjErTXBXMzZLN2dkOW1OWjhuRG5HN3lE?=
 =?utf-8?B?UGdtZ3B2ZlhrelBIMWE0K2dzc0hOdHlqSng0M0Nuamh2NG9MaUluZ2laSFhR?=
 =?utf-8?B?QUdad1VNVnRONFcrNXVHcmxSaXJLb2N4S3hmeW5MMDA3VnBtS3pmZmwrU3pJ?=
 =?utf-8?B?elRBZlZGNWJmVDlXOExDWnBIVVpwQ1h5eWRsb1hZbkdscHFBUVBiZVBDUTVU?=
 =?utf-8?B?cHJReTlXSHpRZUxva003d1lSNDFYOGtNM0MyNk1rZEd1YWxzc3ovVUVUYkhR?=
 =?utf-8?B?NmxJcjdrK3lMbk5XY256emRqOFBTSFh5UVJNSXlWZDJ1aHBtb1BsZTN3SG9S?=
 =?utf-8?B?eEpCTlF5MEdKZ2ZzN2t6Ky9jTGlPSmhqSnNtTWIwdnoyS0FIbisxM2ErMVJU?=
 =?utf-8?B?N1BiTG5hMFdvdVBtSFA5K2h3eGY2ZlY2YnBnZDBUNWU4Z0s3eEE3NTFndWlJ?=
 =?utf-8?B?ejlqYmFlcmRFM3FWam9qT3VDV1g2emR3V2Y4SVowbTRQZUYrUC95ZWpkdFVZ?=
 =?utf-8?B?THgxdzRQWFUzUEUwVTlmMStPa2tUK3ZBZ1NlbFk3L29jMWptbm1VQ3RSY0lE?=
 =?utf-8?B?QzloNmtoSmIvOWtReFR1VE92V3VSd0F3c0txY25lNkZEMWhRd1hJLzdZNS9l?=
 =?utf-8?B?YnZIcWNjOHM1bUJGWSthcEhuV3V0QXluRHAyL0Jla1RQdjRwK2QxNnB2QzVF?=
 =?utf-8?B?dUpUb2pYaUpiN0RlNWpqdzVlMmt2RmFIM3FUekRKVVRibUNjd05nYW42czRw?=
 =?utf-8?B?UzFmUFJEdG5JclM3TXdCK1NKbTVUM3NzelJ0a2NBU1BzN09JblgrY1lwRFAv?=
 =?utf-8?B?YXJJSk9BaWczYWtiQ0FJWjQwSVZuOE0vZ3ZOSEJ2ZnBKR3BweWU2OGhJMGFv?=
 =?utf-8?B?RU5hQ1BxVzYzZzhhVnA0aDRKbkpBUm1GRTl6MzhtMGR1MW5vUGlqWXRNTmhu?=
 =?utf-8?B?RjdLekN3Zm1GQy9ZbUNwdjdUcFJxcERWWjBXblpRL3dnU041ZDUxd1lHUUZZ?=
 =?utf-8?B?cUhRZFlEYjVvaDdPNStEZ3RVc2tFOUI5eGt4OEt6TVNqTXpUdXViM05ma2pu?=
 =?utf-8?Q?7M7U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff455b6-9df1-4320-9eb9-08db7873fa4d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:39:32.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lfU+JO6WODdMmHjYlMyVIKJNwRaDvK7QuJc8NmofJxf4AM7HG96V4OOptTSbtMn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the delayed response, AMD had some mail server issues and I 
simply missed this through the web access interface.

Going to take a look at this now,
Christian.

Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
> This series introduces KUnit[1] tests for TTM (Translation Table Manager)
> subsystem, a memory manager used by graphics drivers to create and manage
> memory buffers across different memory domains, such as system memory
> or VRAM.
>
> Unit tests implemented here cover two data structures:
>    - ttm_device -- referred as a buffer object device, which stores
>      resource managers and page pools
>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>      orders and caching attributes, with pages that can be reused on
>      the next buffer allocation
>
> Use kunit_tool script to manually run the tests:
>
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
>
> The kunit tool might not work with older python versions. To fix that,
> apply [2] patch.
>
> To build a kernel with TTM KUnit tests, enable CONFIG_DRM_TTM_KUNIT_TEST
> symbol.
>
> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
> kernel), which means that we have limited coverage in some places. For
> example, we can't fully test the initialization of global page pools,
> such as global_write_combined. It is to be decided if we want to stick
> to UML or use CONFIG_X86 (at least to some extent).
>
> These patches are just a beginning of the work to improve the test
> coverage of TTM. Feel free to suggest changes, test cases or priorities.
>
> Many thanks,
> Karolina
>
> v2:
>    - Add missing symbol exports in ttm_kunit_helpers.c
>    - Update helpers include to fix compilation issues (didn't catch it as
>      KUnit tests weren't enabled in the kernel I tested, an oversight
>      on my part)
>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), including the
>      one for NUMA node id
>    - Rebase the changes on the top of drm-tip
>
> --------------------------------
> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
> [2] - https://lore.kernel.org/lkml/20230610175618.82271-1-sj@kernel.org/T/
>
> Karolina Stolarek (3):
>    drm/ttm: Introduce KUnit tests
>    drm/ttm/tests: Add tests for ttm_device
>    drm/ttm/tests: Add tests for ttm_pool
>
>   drivers/gpu/drm/Kconfig                       |  15 +
>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 213 +++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  88 ++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  34 ++
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 406 ++++++++++++++++++
>   8 files changed, 767 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>

