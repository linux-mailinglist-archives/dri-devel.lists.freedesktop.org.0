Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB30579AA1D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E4810E336;
	Mon, 11 Sep 2023 16:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1967410E336;
 Mon, 11 Sep 2023 16:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9sz7E8L+yntiRSty0SnLdnGC4114rChVBo+BteX/9Oni7nmluDciZCq5eOMrB5yw49osuuGWx17AuaiaFV2qGwveR5yVLtjbmYwHxzy7xacgYyOKLvM9/ehtJB7axQu9BZ5osF2/YtXDVZiGWCEdXFb1A7zTkilQmN4QVfQTDHJ71Gr2cBRIFDStMkmt3Ay1dvM6U9KLwKgdoCCGmRNkiLjFBuxpPff4CdjUMRk+9uS2EZeWhdPplgdCwgbvqLvD6v1Bugso0RUgJcDhuOK31mwP92xtQdO9BTSVNdYQ1TCXgjG58zAp7uFRo50uUgwEO+ew0LEbny5VvzZBEfJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFztlHopyWHnlWAR2kpQzEtB4cbev9XuCMAymk3+EtA=;
 b=W8q+mI281OGt7piB2IrTqVJZ+ET2Qb+bN+wgfEQru76XYfQ8yNxKtJ/Z9VQb0Z7z9lldel0dSrh0yZE7gJHiHnyq4/bfA23vtqVZ01CAGHZn5Ylo0lo8NCG1iAi4e9KKlBCA7rdt1bDvGHJexOtV/KQOPENmaPUJ0ziIokgfIXabVLZVYzu0mDx2msqS4p1U6ln7n8phBVVbXVIXRXQjUaBfvYEefhdrXJZMIHzLeWuiXF/uBvMMin+ifNPvRlhlz4+V5gqyH3N0SqfNqDN7rznHw5+EYke6nFOMIiYaUBJTyo2qCk1BzanpUD3RIM7LLQTPzuTQPCcp/9XiTV/LBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFztlHopyWHnlWAR2kpQzEtB4cbev9XuCMAymk3+EtA=;
 b=3X12AUgVZVKaAGuoqJ+oysvQMr91uoWlpB2otf3J6ZXsmgVqsITUl4fmY+4OOTI/U1B91E1pLSikOEU43cK01gGJ8MXvjFObuWmJFvQlMuOBH5AEdXlOmSGTF9PHEQDfgPHoKHnK5yGDfICFJ8eJDtSsggfR+xl1KoGzTxUianQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CYYPR12MB8729.namprd12.prod.outlook.com (2603:10b6:930:c2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Mon, 11 Sep 2023 16:25:51 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 16:25:51 +0000
Message-ID: <c6823590-4955-439e-b8ce-94be184d6db5@amd.com>
Date: Mon, 11 Sep 2023 12:25:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Merge all debug module parameters
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 christian.koenig@amd.com, alexander.deucher@amd.com
References: <20230831152903.521404-1-andrealmeid@igalia.com>
 <63b44028-8f80-4de6-9f17-25c9f713caba@igalia.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <63b44028-8f80-4de6-9f17-25c9f713caba@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::21) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CYYPR12MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b8d4b3-ad8c-494f-20cd-08dbb2e3c35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5fPAGERMu/zZX4+uodxNfYet6hlXEh4CSHHRxtuVa2jYdyw/1dWtY5ga+eXC8uqykCQEAsQee95Xj5wknn9ICXSjMnfojRPyHsMNfgzdJOIBkXPH+Bk9DACBVWsNFkUqI2N2sIUy+rZSLxzW/danWcNE8aKl9laccFlv/s1Om6Y+ObXyO0QK2N0sB0a0W1mxl6JUTPTh+pnJr4q0QtI6VuDthh7NvdXu6poCLBMB1Siuw9hySVn6+wfxffZ3Oc4u2kg451F5TI00V7YAYDaLomG6G/TajWfZg0WuDeqGekGGntT9ekZdPkgTdsSVhaga3KW6GqCkmLMPXtJ3g9Ui2QX9HHrqwUwSlIA4VMNJJGACtA+VCduejsNkGMpuCGxpQ3XfkHM1ayY9zPzJzeq2EAqkkWlXumIizKn6EAWFK/umJTx6C44CMeH2WXCVGbtoow7MG3OxFOcGeUSuwshdOenya7ZvQ+WPhNG5IaGYIcHjnQt33yP2EnaDH3zPFTdZccXH63z49V2nMZ1zke6BSsuNWDnV2IlCV62tD0zO90pBPfZgSnYCdaXi3YudOptdVy/go2LDHJ7S7s1LUQ/eF/YfHynqZKZAOH1G5o061QdtP3jl3KloMp7NTwelchLJwMECqrLoQMrwtev8KEzf2riHYu0z1gA9OghrOVArls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(1800799009)(451199024)(186009)(31686004)(6666004)(6486002)(6506007)(53546011)(36756003)(38100700002)(31696002)(86362001)(4326008)(2616005)(41300700001)(6512007)(966005)(83380400001)(478600001)(66946007)(316002)(8676002)(26005)(5660300002)(8936002)(6636002)(2906002)(66556008)(44832011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnJXaDJzQlBMNWR2WUh4bXVEdjJncmxjNERrVzBUb0xVWlVtMU13MncrUm05?=
 =?utf-8?B?V3JyZVpIQllJU3dPRjFWcXBBdXJOZHI2bkZZTGM2bS9sbXVFd1VRYnR1MkRy?=
 =?utf-8?B?UnZjQXQyYzFsZUp4L0VCTk5EeGt6Q1N1dmI1SU9DTk02VUMvWEZ4WE10cXRz?=
 =?utf-8?B?eXZUMW5YTVlDWGozZFVyaE15cWZweldOOFZBU0JmNWw1Q3pGRmlVa21saElN?=
 =?utf-8?B?MzVqOU9wUVZLV05PRXFQQmtVeUhJRUJJUXcrRHgvME9ld3piK09RZ1FzdGZQ?=
 =?utf-8?B?UU93VjgrK3NoejUwem52ZFozR284QzJONENRWWhwTTJGRTJJTERaeEJkRDFJ?=
 =?utf-8?B?MXFnZXlueEFBck1sS1crOXplZGdvUzZud05KbGVkZWlnN3U1Q1J3WHNVeUlv?=
 =?utf-8?B?Si82US8yNFZOODJkd1RRWkVRenRZMGVXWld6OXd5R2xZRDlhbDk2V1c4M2U5?=
 =?utf-8?B?YmdPUTdlRHVnZEpVWFJNcmZveXlFRW1Id2VPSjBEMER4amhDWG16M1h2TmRG?=
 =?utf-8?B?U3VYeTBtSUdDWkZrZmhLb05wSUdyMUM3M0NqZU80N3RYM0REYmxvOGRPazJS?=
 =?utf-8?B?a0Z6TXJSM0pyT0VCUG5SOVZTR3lMZ1J1ek5aOTNOUE4rKytPVW0wNWJlL29v?=
 =?utf-8?B?K0NncGVETGFBK3oydnlWVnJXL3Yyd3ZwU1hYL1NFOWplNmU4TzhQNFF5WHY5?=
 =?utf-8?B?bWxkM0RjeFgyTEppd0JtTXFFakFiTnhVYVBpZ25CMkxXbTJnWmQ4OXFWMFNZ?=
 =?utf-8?B?M0laQkJzUzk0VGdpVktQZXRXV1ZMSTFYd3ZrVDNlQ1hwYUx1SGdDM0ozbHBC?=
 =?utf-8?B?d0Fnd1p4KzJPSU9GYTdLbXZHT3l6WU8wUDJhRTR3NW9JK2U5bmtPa1pTckJ6?=
 =?utf-8?B?NEY3cW9iNFA5VGQrL0ZWbVZrOVJDYi90UFRaanBWTVhaYXJ5NFg2cHlyK25G?=
 =?utf-8?B?N3ZqSmh4RytnelU2OExIOWo5MDMralJEMkZlWlpjcHc4bEI2YmliQ0kySlBL?=
 =?utf-8?B?b28rZ1F3TDZxSUF1NFFYS3IxazE1YVkwNldWQm1wRkxhY2Vqc3dUUFI1SEpv?=
 =?utf-8?B?ZnU2SCtNOGFYMEJ3N1BzYjdWeUhkK1B2cVBCRGM4cVZCb3BPUlhJMEh6YVBV?=
 =?utf-8?B?TWhibWZBYys4STF3M1V1eXJMdUF3SWpidXgwS1B1QVBSWWx5a2pBR1QyY2Rz?=
 =?utf-8?B?YzNERkxvUXhyYnFlci9iL0pEQWgzVkZMYlArQ2I3T3Vkc0wwRDBhMXk3dlQ2?=
 =?utf-8?B?aExRS3VJV2dSa1VMMjA4ZmdvMThoWE9MdzdZQ3REbGpKUGNmZzBVcWl5cEpU?=
 =?utf-8?B?VEcyZmZKWjM0SUNGU1pWdGNLM2N0TDJPNlNWR2FOendIZ2hRY3grcHZFK0FC?=
 =?utf-8?B?V2MzaHpuUjNUbzZrcjJvRTZnbkVySFJRZVl5dUZZU2tCMlBnb0xybjlqZFRF?=
 =?utf-8?B?OHo4QU1VVzZCakVRNjUrYkFyWlNvVGFXRy8wZFo4bWVNTkJ2T0E1RlZsTnNB?=
 =?utf-8?B?eWlYM1h3MmkwVnYrb003MGtwQzBBZVNIYng1aTlrUTRUc0VlMmpjT2F3MmNo?=
 =?utf-8?B?S3czRDdSKzdLdnFxVGFHSE5RdUFZbTZjeDNmKzl4MjU4ekVweXJ6MlpOOFRm?=
 =?utf-8?B?NTZ5S2pKamJtMWtrSnYyUmI2OHZyMkFLRVpzSTAxMmVXYzBCMXV0UnZwbFJT?=
 =?utf-8?B?RmJWS1QyRDhvRjdrNmFxaUNVcThPdzM5S1F4a1QrVlZYb0hQaXJhM0hBWnQ0?=
 =?utf-8?B?c09ucm9RUERzMC9zQVpYWkhHS29oUXhIWlA2Zm1GMURqWmN4d2p3ZDl6UDhz?=
 =?utf-8?B?Z2VGUSt5Z1hIbmFKWTVUb1Iya0JwYUIzR1dHM2dTNGJScTdXbjI3NUV6bmRY?=
 =?utf-8?B?L3JOS2RQS3pxMGJiMVVPTGJsd0YrRXRVT3cwMXdocm1WWWxhWExqYnZVUUNy?=
 =?utf-8?B?TG9ycHZxb1RmbVgyQlJaQytmYzZDRzVuUDJqVFpYQ01OL3lOWkk4MEtIQmJr?=
 =?utf-8?B?c1ZTQ1F6NDZiMXVBaDlGSk10cytyS1ZwVy9jVmU3aWNPT1Zia0JRSEpnVUJ6?=
 =?utf-8?B?ZnNUWTErVWpvaDNDM25Tc3FZb2RXWHFXRVZmQXFxNmhVeDZxZTZRbE5mOWIy?=
 =?utf-8?Q?dbXRjRTx8ab8G1kUkQ1pQ0Rb+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b8d4b3-ad8c-494f-20cd-08dbb2e3c35a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 16:25:51.2943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qd/RXTpgSp7pSTEVIw1QugHsCO1Z1vbWbdx9Sk/NbArYinC187XFXBHcgpEsbpgHnRxoUv/kDEG/4xMYjQ9Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8729
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/11/23 09:54, André Almeida wrote:
> Christian, Alex, I think this series is ready to be picked as well.

Can you rebase this onto amd-staging-drm-next
(https://gitlab.freedesktop.org/agd5f/linux)? Since it currently doesn't
apply there.

> 
> Em 31/08/2023 12:29, André Almeida escreveu:
>> As suggested by Christian at [0], this patchset merges all debug modules
>> parameters and creates a new one for disabling soft recovery:
>>
>>> Maybe we can overload the amdgpu_gpu_recovery module option with this.
>>> Or even better merge all the developer module parameter into a
>>> amdgpu_debug option. This way it should be pretty obvious that this
>>> isn't meant to be used by someone who doesn't know how to use it.
>>
>> [0] 
>> https://lore.kernel.org/dri-devel/55f69184-1aa2-55d6-4a10-1560d75c7324@amd.com/
>>
>> Changelog:
>> - move enum from include/amd_shared.h to amdgpu/amdgpu_drv.c
>> v2: 
>> https://lore.kernel.org/lkml/20230830220808.421935-1-andrealmeid@igalia.com/
>>
>> - drop old module params
>> - use BIT() macros
>> - replace global var with adev-> vars
>> v1: 
>> https://lore.kernel.org/lkml/20230824162505.173399-1-andrealmeid@igalia.com/
>>
>> André Almeida (2):
>>    drm/amdgpu: Merge debug module parameters
>>    drm/amdgpu: Create an option to disable soft recovery
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  5 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 63 ++++++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  6 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c    |  2 +-
>>   8 files changed, 58 insertions(+), 26 deletions(-)
>>
-- 
Hamza

