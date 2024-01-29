Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0048409DD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059D41129A3;
	Mon, 29 Jan 2024 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9C111299E;
 Mon, 29 Jan 2024 15:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Psny0RXjZAW76/ZR09U+vcfSjL5LuaZyLUElKi0kDscNugOpg5YLgb3RVvPUqbOiVxv4imXX7y58mu94nO8XHzP1OuLi21qx07PLT0AcNEv1MLLAuOYtrgiuLUmEEqHk1dVeFK45DYrDvDfYHCpUioqwuxpyrnrdInFt5qh9aSL+AiMmXzggO3zGX2RP2lyDqlikA3GbqRuNyoUiUEjQqL6mjfBavYvsMJT5IrLbHJVTr6a9QAKaqaJQlirll8lJj8LCf94/gRxx+eNy2zeJ87DN/XUrROnTTVF6WBpWnhah+YdQ//7lnzOnT3nuLLpRNa1ALCmK2EnuAKnFe6L+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnorqQGDhu9gzkLbx7C3ZbEoLgKkp1oPgitcQqPdElk=;
 b=AFMpX5SYRGhmmPB1bOi6YkHpHuvMOZ8puf1cQvAE8B5c83unhEOaLWsTmco1I9MO6LC/yAEBt5RwgmE9a8sMHi2k48Yw7CJBp8PjbAiW1UopgbXwjQKz83VWcBGnyCTBlp97lnkgH4TtE4hkZcJguEFaqo5gkwuxa4HOGDaq4b1Jn9/V9htwHEfK5lsCay9+fOfpWjohUs8vxaBMmCtTjyXMgB/s0nqTmIC9JKyDs7NVJDQvznQuEPZPAUdmIkPPCEE5W6xYObeatSxDJsSBQC0CQowlGL/h1rBKmMWNQ//AltuZWC8mfE/Yf7s1+UTp1IqGfbW87KNZKXjrGWaksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnorqQGDhu9gzkLbx7C3ZbEoLgKkp1oPgitcQqPdElk=;
 b=dgtsyPWgQe1L9k8fmir9m4e73vz3r78Scs5vMMnprCjWHqCtRubCVueDYR47EfDPXzHyatoJMylk99Z9HdnMmwDPCYgQwFP1u23Imgi7sKt9DgzmoHYzerbuhqdwwkjWwAhkHaikcY1je32D3ePeOLv3xQVwPUGMLYC+4Nva564=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 15:26:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 15:26:29 +0000
Message-ID: <f6b4154f-62e8-42ab-a91c-b1b1c46342a6@amd.com>
Date: Mon, 29 Jan 2024 16:26:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] drm/amd/display: Introduce KUnit to Display Mode
 Library
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>,
 David Gow <davidgow@google.com>, hersenxs.wu@amd.com, magalilemes00@gmail.com
References: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5f255f-36c7-4248-2e34-08dc20deaa64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yMN8QIc0jV1xV3Gxua7TtbNprMgp3rQ5QiqaQO+9LUG4PhEE5s9Iu4Vb99+beumFgJ1qwL5afqTPGu1VB6ob2ZYQrJV0BLeyOkxRSG6gw24TnDttZLUkUp1XwWvEPKBfnkPE5PyYwSTS2KieYIN+qaTM4qAdaRBQKDePQyzVKQUgwp1ZNAvhlsiEIo1W75WGfQxy/9A+/fE2gGC7itXkgAJosBtbnMdy0nE0hvho4NYiq4IFniBqO7HlOSEXiyLxmajGOesACAymNx7Qd4vBGkV1+bUyeSDGyOyCpUnWV4Q0yrm209YSSNOQisO3IGYbt3M1z6o2kmWBZeR57ooUEYEQIP+RmWQ84YiTfr5g8QMauEg8kBiI/NTMI7FzY9CabQM0dIJADYFRo4woNXgus2kibK/chEwos+Z08vX1GSzjX811Es2KWcDNFvDwhmC41eMhB2yFMo8dGHVKdF9gxGI9DJx/OZ+xqP8gfd7Y55/iTlB880rzQGHs+nGE5GIKbTBOpgaMo1yXWEmKhGRIAFtKGjgJ2edLqsvteAxBE2fNkHrQ1edvb50Am1OUBrbpMfEVtXDAe7m75+sKB3DlpP3oJy6LoR9UZDDv7G8pY7f8SyDyJWlPNdZPAi5d5E6DndCoTWw8PzK6Ar7JFS5kkNCCz7jIix7UZ35ItcL8zc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(8936002)(8676002)(316002)(66946007)(66556008)(66476007)(7416002)(4326008)(110136005)(26005)(83380400001)(31686004)(478600001)(6666004)(31696002)(38100700002)(86362001)(2906002)(5660300002)(6486002)(966005)(54906003)(2616005)(6512007)(6506007)(36756003)(921011)(66574015)(41300700001)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpVUkwyN1luWW5KYVhYdFFjOU1hZWs0M0NhQXJpWFJ2c2hHTmhTOUs5Z3pQ?=
 =?utf-8?B?RVpqb2FYTkpicHZSdXJ0MnNybHVDak9GZEdGck5BZVYxdGM2eVV1TUJ4ZFpU?=
 =?utf-8?B?dmRHQ1FUd1FoUVV3dUhSTUlqYTZHN2FScXNJNnBLR1pDV0FVUzhxeXQzVHpY?=
 =?utf-8?B?YU9xR1JYbEEyOVljR0c2c28xOGRjOE1FTEJ1aENXN1hVb3BXRldQekFJdFR1?=
 =?utf-8?B?a01mUUFQaWl0eXR0OERVRjhnSmZuSXhZVk1IdHJaMHdjQ2tsUkgxdDQ4b2Np?=
 =?utf-8?B?ZmZuYWRvNzFvRUt1R2dnK0pZTmx5YlZwOUEwUCtZR3R6VlJjVzN1YWVIVUtI?=
 =?utf-8?B?WGgySGw4TXRVbXN1TjAwYzJrWjRPbGl3VVdGam5lSmEvTVlWWElLNHY4QzFR?=
 =?utf-8?B?QjBjR1RpRnpXN2VEekJYeEl1SSs5ZFVDVFVjc3IrTXVZdjNQZGhoaEVQdmhv?=
 =?utf-8?B?SlpxSXEzcnhCZ1p5WjAwaU9DNkJLbjhsRndPd1NUc1NYOWxocXU1K0VWaWV0?=
 =?utf-8?B?NEVudU5GaGw1Q1VPbUZxZHhYTTlWR2l6K2I5YVlhT0lWYlVQYlNmanVvUHR4?=
 =?utf-8?B?LzR5US9KSnhZUnd2dUVaYlJvVUpLaFZOazFBTzdWWEk0b3RzNncrVjZ1VGFW?=
 =?utf-8?B?TC9MWENwUWx0aGxlTkRjMXl0M2hCelhhOGhRWmVKYm1HMUhlOS83NGZqMTVx?=
 =?utf-8?B?RWhLNW9aOG44b2huSGtNd3JORWNhQmlIb1c2VzBrMy9hK3o4cUpwQjUxUFRU?=
 =?utf-8?B?bStnNlMyc3hGTytob1c0b2FwSCs4Q3hzOVhBV0FNWFpCY0p0d1BBZGV0RXNZ?=
 =?utf-8?B?c0lyQ0dKMzVsNkthcWdYWERJMDY4UUJSa2FlOWpJVStFaDBQTHJNdlA1b1Nl?=
 =?utf-8?B?TzdxVlY3eHg0YTY0OUlGQWhHampCMnROZ3Yrbnh2bTc4WXRZaWdRQXlsbDBG?=
 =?utf-8?B?azBmQVI0VlhkdWhqVXVxVjZ5ak5XbU5rWHhWUTBBRlE2MnZ4eFJySHRUMUJO?=
 =?utf-8?B?M21BektmS3lCWmpJMUR0WFlFalZtelVnWWZmSGFMMHdLeDZPb0N5Rm5YbitF?=
 =?utf-8?B?TEZoWUFFTDd0OTcraHo0MHV3TlhlUVVRSTliU1dZZHBZdnVSaXRTYlQvMWd5?=
 =?utf-8?B?MmdTQyszQmNXaUprWEVuL2t2QmoxbHp4KzBKYjhiajU0Q2xEWmJNYVA3K0FE?=
 =?utf-8?B?T1Q0dFF6Vkt6cGVTdlJsZElXQU04RzJ6bDJ6TGVXdDU1Ty9mU1hISDlnZTBl?=
 =?utf-8?B?ZUltSWIxMFdYZWkvbnpHRGRHeGlmb3pyRUFIYXJid3EyaUZjYjl4d1VjWmlV?=
 =?utf-8?B?RWpOMGthNUMyWjZQZ0xZVUxlYkxiN1hpc05RTE5qSHk5YmhuQUpkQVp6eVN3?=
 =?utf-8?B?VU9tKzhPUG5KUjVhNHo1ZnM1SWZYRWhuR0xucUhWZFRlUjN1RVB1aGo4bGhs?=
 =?utf-8?B?UHNUN051bXpQTHluSjNBekJ4QjVEY3ZLcS9hMWwrd1NFaDBvMDJiUjBNa3cr?=
 =?utf-8?B?WFNSV0xySCtHam1lNCt4NjBJSXVYcmlGOWZjSWlLVDBSV1ZLSkpCaGtXdXlu?=
 =?utf-8?B?cGpZbjU0alFsMDdkejBxZU9YaTkyejd4cVVyL0FWamR3cUp3YjJmYkk4TFBL?=
 =?utf-8?B?RGlkUm5TckVZRE1vRHhOQWU0RS9nb1lnYWYxYVgvd2ZTRW9lbFhJRHQrb3Fv?=
 =?utf-8?B?UU83LzAxY3hCSzVESmltYTkxQW54WkdsOGcvWkh1RXkreWd6cXEyWXpMQm81?=
 =?utf-8?B?OG9Db2MvdlArZVozajNQSDRWM1h1SEljT0hHbGJzTFZDUHNOY1BrNzg4V1lS?=
 =?utf-8?B?eFlPU1lKR1RUZTVPS3NZc053WjVpR0c4dWJVR3RadDM3MkIvL09oOVZGdmdT?=
 =?utf-8?B?ZDFFQVBXclNYQVA2dDVZbnN1UHJlZjBueGQ4aGx5ZkNEUXNtNVEwTlZIYWhh?=
 =?utf-8?B?VmtSRzg3NGlxR0wxZEFEYk9oTlVTdU1QVzhaT1FVamlxS0N4cnprNGpjR0g5?=
 =?utf-8?B?ZjQ0ckh0RVByVEEyWWlRUnpFSW1kc29yc0sxeWgxckhuZ2YwVzRoYVBYOW1h?=
 =?utf-8?B?aGRxL0pDSFVxb1cydElBTm5NNC9DTG91eU1XTFVEcW1Oc1NWVlBDYkt5Vk9V?=
 =?utf-8?Q?ZRoM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5f255f-36c7-4248-2e34-08dc20deaa64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 15:26:29.7061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmW/5FhK2pjrHp0JT9EeW/GwBNQIIhBCuwYikmmdikNq4jMG74JuA3DSAaJfDVJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652
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
Cc: tales.aparecida@gmail.com, Trevor Woerner <twoerner@gmail.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That we include so many C files with relative paths seems to be odd.

Apart from that looks good to me.

Christian.

Am 26.01.24 um 16:48 schrieb Rodrigo Siqueira:
> In 2022, we got a great patchset from a GSoC project introducing unit
> tests to the amdgpu display. Since version 3, this effort was put on
> hold, and now I'm attempting to revive it. I'll add part of the original
> cover letter at the bottom of this cover letter, but you can read all
> the original messages at:
>
> https://lore.kernel.org/amd-gfx/20220912155919.39877-1-mairacanal@riseup.net/
>
> Anyway, this new version changes are:
> - Rebase and adjust conflicts.
> - Rewrite part of the dc_dmub_srv_test to represent a real scenario that
>    simulates some parameter configuration for using 4k144 and 4k240
>    displays.
>
> Thanks
> Siqueira
>
> Original cover letter
>
> Hello,
>
> This series is version 3 of the introduction of unit testing to the
> AMDPGU driver [1].
>
> Our main goal is to bring unit testing to the AMD display driver; in
> particular, we'll focus on the Display Mode Library (DML) for DCN2.0,
> DMUB, and some of the DCE functions. This implementation intends to
> help developers to recognize bugs before they are merged into the
> mainline and also makes it possible for future code refactors of the
> AMD display driver.
>
> For the implementation of the tests, we decided to go with the Kernel
> Unit Testing Framework (KUnit). KUnit makes it possible to run test
> suites on kernel boot or load the tests as a module. It reports all test
> case results through a TAP (Test Anything Protocol) in the kernel log.
> Moreover, KUnit unifies the test structure and provides tools to
> simplify the testing for developers and CI systems.
>
> In regards to CI pipelines, we believe kunit_tool [2] provides
> ease of use, but we are also working on integrating KUnit into IGT [3].
>
> Since the second version, we've chosen a mix of approaches to integrate
> KUnit tests into amdgpu:
>      1. Tests that use static functions are included through guards [4].
>      2. Tests without static functions are included through a Makefile.
>
> We understand that testing static functions is not ideal, but taking into
> consideration that this driver relies heavily on static functions with
> complex behavior which would benefit from unit testing, otherwise, black-box
> tested through public functions with dozens of arguments and sometimes high
> cyclomatic complexity.
>
> The first seven patches represent what we intend to do for the rest of the
> DML modules: systematic testing of the DML functions, especially mathematically
> complicated functions. Also, it shows how simple it is to add new tests to the DML.
>
> Among the tests, we highlight the dcn20_fpu_test, which, had it existed
> then, could catch the defects introduced to dcn20_fpu.c by 8861c27a6c [5]
> later fixed by 9ad5d02c2a [6].
>
> In this series, there's also an example of how unit tests can help avoid
> regressions and keep track of changes in behavior.
>
> [..]
>
> Isabella Basso (1):
>    drm/amd/display: Introduce KUnit tests to display_rq_dlg_calc_20
>
> Magali Lemes (1):
>    drm/amd/display: Introduce KUnit tests for dcn20_fpu
>
> Maíra Canal (5):
>    drm/amd/display: Introduce KUnit tests to the bw_fixed library
>    drm/amd/display: Introduce KUnit tests to the display_mode_vba library
>    drm/amd/display: Introduce KUnit to dcn20/display_mode_vba_20 library
>    drm/amd/display: Introduce KUnit tests to dc_dmub_srv library
>    Documentation/gpu: Add Display Core Unit Test documentation
>
> Tales Aparecida (1):
>    drm/amd/display: Introduce KUnit tests for fixed31_32 library
>
>   .../gpu/amdgpu/display/display-test.rst       |  88 ++
>   Documentation/gpu/amdgpu/display/index.rst    |   1 +
>   drivers/gpu/drm/amd/display/Kconfig           |  52 +
>   drivers/gpu/drm/amd/display/Makefile          |   2 +-
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
>   .../dc/dml/dcn20/display_mode_vba_20.c        |   4 +
>   .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
>   drivers/gpu/drm/amd/display/tests/Makefile    |  18 +
>   .../display/tests/dc/basics/fixpt31_32_test.c | 232 +++++
>   .../amd/display/tests/dc/dc_dmub_srv_test.c   | 159 ++++
>   .../tests/dc/dml/calcs/bw_fixed_test.c        | 323 +++++++
>   .../tests/dc/dml/dcn20/dcn20_fpu_test.c       | 561 +++++++++++
>   .../dc/dml/dcn20/display_mode_vba_20_test.c   | 888 ++++++++++++++++++
>   .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 +++
>   .../tests/dc/dml/display_mode_vba_test.c      | 741 +++++++++++++++
>   15 files changed, 3200 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/gpu/amdgpu/display/display-test.rst
>   create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
>   create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c
>

