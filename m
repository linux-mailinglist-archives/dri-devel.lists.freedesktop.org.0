Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DD6B2BCF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 18:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B98C10E10D;
	Thu,  9 Mar 2023 17:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D62310E10D;
 Thu,  9 Mar 2023 17:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWl3fzpfAhNpVbXkoXCV+30vuACxzPz1ffjPavihNXOx5Xe4Rgs+nXoL/4ut7rYtuki0aX2Q7Wl6zIrE2RzDhRVPCesRhUMdKF+0vKSxJa+I04xkiYj8CL6h/z3mTiHvTwZVxeiTehZCJgMvn5Qz/RSVKUKlUpjPAUntXMKmyq/VFYMXM7dhCajcTxTBm33ylV1gGg3hrIZwK9B9lcH2seWiIU0cZ0P3HxuAUpPEZbOxOk/1nbUeIl+myFEIcQ/wSu1erQwxHsYev8q3JX6XMCuwjISWbz6gECfEy5V1zzfud58FyLuf5FpHy8E6+zUkXtS1qSwbIpE9CYILALMIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR967QsA49EyI9T5F+StSHiYh+LHjSfHEQ/Z+G+vFW8=;
 b=Mk5SMYd8TV9oKH76YQQJsseAbFNwCHoutsXnhf1bHDj6qm+/iaUyOSTLi2RPdx5wrXMYK0iAd7DiECzyAq+fLbx9kbkeVmihz/1eq94GQPnFBOWGXXXclSTZmWMABC2g4PxBf0P0YBhdclPWTiWLbz7dG8gAzGspN/nlXbBjEKOhFs3WmqJTH2xDBLWGgxBtkiXFT/U6By7dHQ1HknhLLS6tgxYQ5jgqeVu/LkLdMroMWlmGBI63yTAuojhkKy5mDYEguGEbSmz0RCDbHk/N++wN83P2n8VhmNGr5u83+g1/fmsJgwXgifN7dfx+CFJ34G0koRtv6b8nFKqLXsPtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR967QsA49EyI9T5F+StSHiYh+LHjSfHEQ/Z+G+vFW8=;
 b=FC9vloXuRuyDy23vXSP0RqfwIbgMgtT4gqElJ9GeHKrVYpeDmxECurWBcK0biFOead53kW/Mmzu4GBcaeWTqH8Myt2Ro8ySKbOcvaR85p//y3F6WpqoyjqQo5Pxmr84uy/NXQZ6CbAhGauhNM6dEckrXDmWP5/WBCdt0QlNr8qY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 17:15:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 17:15:54 +0000
Message-ID: <9bdb3857-c7c1-0964-270e-41717cce0536@amd.com>
Date: Thu, 9 Mar 2023 12:15:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.3
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel.vetter@ffwll.ch,
 "Chen, Xiaogang" <Xiaogang.Chen@amd.com>
References: <20230309043816.7840-1-alexander.deucher@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230309043816.7840-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0170.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: feb6efc2-ade6-4cd1-d6c9-08db20c1f0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWNu2adzCXMLg5iWT9/KT0cWF9eY73IlcnyZOdq5DXpNGH94W1qNlazK/Hv9MG/udUteokRxNtfhA/KLtOh5GC3MZabbmVVrDkSZjiR1p4dZ5meDefa3lkvkmDs9MUS7NZAZzNu0WcW4Afk0wGCvLQbgjCP0GAN4HRFJSfzqA/Fn56Wr39pYKK4Sit4u5IsStj2nBbY3QrfJ+kaHDfTjCIPF6mYVafXjl2l6udrU2cZ/2ZtiJr4DDuodLG5sCitO8UuBKZ1zSIhrvBoZ7S7EeYTnUAovWK6k6ucWy5blnvHiTedKEJ4F+kHRsmCC86nmD5L8cOUisw1scpG1/fr1ObX+5s4QYW+Pc0ok3eaCMYxtLjFlJorZeqffi2XyZxK6I9qn9u/0yJMgX8A1uNOxH/TVUArYkYfoF4E/6N3bSl3jTTlaJ7cRKbKzf/0uzEsipzSdO2JcK36U4Z7pHHb66dSXOEph3h2zlJktG47rvQ9W24/OYjdQWo/u23scAK7Sw4Ph+yilhwHxzJh+W32tU1g+JdOo74JDfd7EtyL3sP7yweXbdGSCekM6JSq7VGsWYTxsQb4SRKAmhkvsFA0rnvNO1mFRrY7udLjwqjqAzli/J9uy4k4rtdwpXxf4Dj5nJRGzyAk268RYkoftXrK6A2rUu7k6ZMuVWpQMSnX0HGay8CuEYqhCMdeLBEiHHkl6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199018)(38100700002)(31686004)(6486002)(966005)(2906002)(2616005)(8676002)(8936002)(66476007)(66946007)(66556008)(26005)(478600001)(44832011)(86362001)(83380400001)(36756003)(5660300002)(186003)(31696002)(41300700001)(6506007)(110136005)(6512007)(6636002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09JQktoZG5acFRpSndIa0ZHOEttRzFUczgvbUM4cGRGUXVmbC9JWllwckFr?=
 =?utf-8?B?QUpId1RKYjlibEVJSDdVODZBTkxtR3VHVllZbkZzSDZKd2gyNlZtVXQ4OGs0?=
 =?utf-8?B?aS9sRUF2RDFrVTFJa1VvZzUzL3VMQWNsajlRL05hZHR1cXBXcmlrejMxWnJz?=
 =?utf-8?B?WU1EK0RlVzZJdnBOSDZ3eFlrdWh4d1BTeU1Uc3puWTJ3WlJROVV0MDk3YXIz?=
 =?utf-8?B?d3p5a3JJbmVqZVZIdEhZQWNyTkowRDdTZGJJcnNUWnR6VmU2czNMNDErVXpL?=
 =?utf-8?B?V1VwZ3hxRmRxZlA3L29yQldhUVl4U2t5czVERFlnbklvbjUrSTN0N2ZTOU45?=
 =?utf-8?B?aU5iMFUwRWM0S2JLd0JBMm94SlZIbXhFemVEWUNwRHo3NzN3TmlkaFRwUXFD?=
 =?utf-8?B?allmV1RDRnBHK2lSeGlsdmZKSlUvZnMvVEp4WFNqUzN5TUhRYllEVW9DaVdj?=
 =?utf-8?B?bDJWb3l3MmZOWTZZaDZETDIvMHNheHl6cFRxUlgyRHczODduMVdPeitRVVZv?=
 =?utf-8?B?dm9raFFHamxwUWV2MzJEVWdPdmZ0UnlUYjI2aTd2TUFETzc4bDFxNTRFeUZh?=
 =?utf-8?B?RFlZa29mRUpSWjNHWHlpTkNiQ1ZOdEY5NWhNZUpsbm9USDZyQ2xhUkorUzZj?=
 =?utf-8?B?aFVSU0ROT3FvdjE2MG1aUkNJV1hEbGxHSFhhdS92OVVTWGh6dlhaUlRIYnds?=
 =?utf-8?B?UmtBWmJ0RzF4MGFZWjFIbng3VmlOYkJabEcxQUgwWWlXcjFIaWowOGpkOFFw?=
 =?utf-8?B?cENhTFo3VS9FYzUyVTlIUDZaeDd4MWRHbzFYN2FEeHNCR1AvZWlKQS9IUzY1?=
 =?utf-8?B?eVZhRDI5YVpiS0dMWlVjdG1NcnVHeWxDMktOVVRJM01zRWhmNWdvM0RXNjVJ?=
 =?utf-8?B?dk5mNER6cnA2Wndxa1JYMkduM0RLVkJkZElsaTVzMkhMRHQyU0dlTjA5bk11?=
 =?utf-8?B?OFQ5cTNYZkZYaWpYbXA2T1FZZldzYUxhZWw3ZWJ3QThYWDZSWFhibkM4Z1ZI?=
 =?utf-8?B?aHMveG5OSCtGZUh6OFB1UGY5OUNvajZNV0VpL25sVlROV3lkV2V5U3ZLV2hD?=
 =?utf-8?B?Vmc5ekF3U2tkWWx0dUFlNGdXOTByWUR2WnIwMjVpcXJnc0FoUXRwd0ZVblA1?=
 =?utf-8?B?MWFONDdNWDlzcGVOaVRFbkF1Y0l4K3U4anNjUjlmYnFOVk84K3NmNk5Cb1dn?=
 =?utf-8?B?d2x2STVLdXRJS3o5QVFmdS9jTWxhU1FZQ0hReWpqY0R0QXBsNWZQYTJGWkZz?=
 =?utf-8?B?SVZEZVFCQ3RwcExZN1lwRlhoRWtLanFqNFl6SU9xeXFKZUV5dHBxSVhhYUNs?=
 =?utf-8?B?czNUZzNRbzBMYUtnY3ZneGhoRG53NWJkeDFMUVk1Y01DTHlKeThSLzlhV09R?=
 =?utf-8?B?aWhDalFhUHRaR2R3VXJSK3RmSnZCOFgrM3NVdWRpR3VEWlhuOUlYeGExKy9m?=
 =?utf-8?B?ajNtN3BjNVBTQWlUdy9hNHRSVnFFdDVHWXRWbVJhbFJacW1ieml2VFRCWlBx?=
 =?utf-8?B?WUpTYnRaOCtXRTlidlhnL0JiQ2lPZ28vMkNmaFdMK1h0U0RSRENNZWJoWWhB?=
 =?utf-8?B?SE4zbTlnblloU0xKVjJDUFNZa3JRcDRVVzVYNnl5VU1GM2FTZjF0YSsyZGdR?=
 =?utf-8?B?cFkrc09kenZxSGN2NUV5WWhxc3ZDN2tINjF6ZXNldks4VzdmZ0dkM3B6eW5O?=
 =?utf-8?B?bHBOTVI4Slg1dy9HNk5JRmJ0UWhKQ2czbURwZklpYVRHcHBjMG9ZaWlPVHE2?=
 =?utf-8?B?VHZhVFVrRklWbURYak8xaTRnTnZUeDJiWXRtOTU3c2xhbDNXKy9ScmVtZTEy?=
 =?utf-8?B?dFlrQ3ZkOTVRYURQSXR2MXlrSW1RRUgyalFiYXVsNEdwbnp0N1BnYXlCeUZT?=
 =?utf-8?B?ak5YZnVTOUNjWmsvZS9kNkRpUjBzRkgrV2FYT05VVFFTdVNUTE5zWi9pVXFF?=
 =?utf-8?B?UDR4MnAxRDRtR2FXRkpFNTJwZEVUYzhsT0E4RXRUQnYrVkNlNFNlYktGL0t4?=
 =?utf-8?B?dCtETE9PV0t2Q2xPUHNVOXhYOHFBRGt3UzdhU3BFODZnUGNkL0tnaEQvNzR4?=
 =?utf-8?B?TVh3UDFUMklpNzZOQnNWT00rWjV0WUM4eTlhZ2hhYVZVOWN5RnFQc29nOWdU?=
 =?utf-8?Q?hAIzHBCm2PVIMu7O3JVnjDway?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb6efc2-ade6-4cd1-d6c9-08db20c1f0c5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:15:54.5206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHP4Lwu0s8BAqfXPj0D8sSQ9fIdQHg9JONuce5pCMte24zHLBVEzAY6y40QK8p9CeFePjtXP89Dmwp/L9xQj5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045
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


Am 2023-03-08 um 23:38 schrieb Alex Deucher:
> Hi Dave, Daniel,
>
> Fixes for 6.3.
>
> The following changes since commit 66305069eb6d17d9190cbcd196f3f7487df47ae8:
>
>    Merge tag 'drm-misc-fixes-2023-02-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-03-07 05:42:34 +1000)
>
> are available in the Git repository at:
>
>    https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-08
>
> for you to fetch changes up to 41f95a0e40903fcf70463fcc060b7faf761b23f6:
>
>    drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4 (2023-03-08 14:39:09 -0500)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.3-2023-03-08:
>
> amdgpu:
> - Misc display fixes
> - UMC 8.10 fixes
> - Driver unload fixes
> - NBIO 7.3.0 fix
> - Error checking fixes for soc15, nv, soc21 read register interface
> - Fix video cap query for VCN 4.0.4
>
> amdkfd:
> - Fix BO offset for multi-VMA page migration
> - Fix return check in doorbell handling
>
> ----------------------------------------------------------------
> Alex Deucher (3):
>        drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
>        drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
>        drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv
>
> Candice Li (2):
>        drm/amdgpu: Support umc node harvest config on umc v8_10
>        drm/amd/pm: Enable ecc_info table support for smu v13_0_10
>
> Harry Wentland (2):
>        drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
>        drm/connector: print max_requested_bpc in state debugfs
>
> Mario Limonciello (1):
>        drm/amd: Fix initialization mistake for NBIO 7.3.0
>
> Shashank Sharma (1):
>        drm/amdgpu: fix return value check in kfd
>
> Swapnil Patel (1):
>        drm/amd/display: Update clock table to include highest clock setting
>
> Veerabadhran Gopalakrishnan (1):
>        drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4
>
> Xiaogang Chen (1):
>        drm/amdkfd: Fix BO offset for multi-VMA page migration

This patch introduced a regression. Xiaogang is working on a followup 
fix. I would recommend not to merge it yet.

Xiaogang, please add a Fixes tag to your follow-up patch to make the 
connection clear.

Thanks,
   Felix


>
> lyndonli (2):
>        drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
>        drm/amdgpu: Fix the warning info when removing amdgpu device
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 10 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 17 +----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  7 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  1 -
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             | 14 ++--
>   drivers/gpu/drm/amd/amdgpu/nv.c                    |  7 +-
>   drivers/gpu/drm/amd/amdgpu/soc15.c                 |  5 +-
>   drivers/gpu/drm/amd/amdgpu/soc21.c                 |  8 ++-
>   drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |  4 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 17 +++--
>   .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 19 +++++-
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 75 ++++++++++++++++++++++
>   drivers/gpu/drm/display/drm_hdmi_helper.c          |  6 +-
>   drivers/gpu/drm/drm_atomic.c                       |  1 +
>   16 files changed, 146 insertions(+), 49 deletions(-)
