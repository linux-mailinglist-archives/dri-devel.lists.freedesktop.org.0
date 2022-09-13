Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00BA5B67A9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 08:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D675310E59B;
	Tue, 13 Sep 2022 06:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEFB10E59B;
 Tue, 13 Sep 2022 06:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVmUrV8kLbdNxFbfRs7ZW+x/YuQq1WHu2ZCi1XBuCM85de7WKT8Ece9L2B0EVQAmHZqZnY01jJEYpEbLJDU/54+aA+e49V7MlNL2sEpugW5m0Let2bJkKmD5zM/JdqsPkARggdRNyrOIseAm2MC1LyUZOKYuX9k9fhEC4dvZS7TPyEJ4LQ8tzVQfs9jGDpeJ1K8oDYQFHOw8tNgPt4AI1A8n2gp2j9OGVqRwGZHHIc+W7dFwr+H5lgnjh9KWljotOeX4uavaRs6a/ajb52sSlTawGbxrqxPRYMn4eL1OL+PcW9EPM1A4Fjjy+Xiup+VmUHLLeDrpHtr8zHB0vnNVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDU5xecbkF7WvS8Rj9dXOMDWJqqrnIDiuuMXaqeAknE=;
 b=c7hNa+4eW669n+dUDxEXjo0we2OqFS2hxJoQRl8HSHLIRIYxWJoDnvOi38K33sCT6QnPd6HxXafqToiwUh/HKb30xET1la7tgTuoR+NSYiZSG7K9q9MnGjsRWPDYndGTn7jmRGo7cSz2Vldnd2eX0itFGJ3tsYUzhcKuWFgcB878v0E7h1+rJ7a+NfCJD+/XWHnjTH6pvPC9fLeXA1MtNj6DnyRvQHtPrEP6IUffnmBYhgyl9L1GceZPFGR/xZK1kCb2hVLKCP8YlewU3T2tLmRvLc4z5LwnqKWPzmnUd9QuPk+JDOHxqnYxuZuGM+wcU1Lbjz5WPLmoiQ53lr8ocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDU5xecbkF7WvS8Rj9dXOMDWJqqrnIDiuuMXaqeAknE=;
 b=ksdF/NtH5SXIyjhXsdOdWndgt9Q4Hdx+VqPlB+7SPyXMaIZykSpB9ECcvlxzQLtX/8ijDqROH8X82cMMehaVhBe47h48or/VD7FoxL85o6A4M/a0zlnLxRiZ5khjMHRKqr7g3U2r9bti8vTHRFtL5MrYOyBpOfH5Fx7DVRHqIfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7515.namprd12.prod.outlook.com (2603:10b6:930:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 06:14:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 06:14:41 +0000
Message-ID: <22ba001b-82d9-e7fd-3ced-978e3608bd7d@amd.com>
Date: Tue, 13 Sep 2022 08:14:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] Remove unused declarations for gpu/drm
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, evan.quan@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, lijo.lazar@amd.com,
 matthew.brost@intel.com, John.C.Harrison@Intel.com,
 daniele.ceraolospurio@intel.com
References: <20220913024847.552254-1-cuigaosheng1@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220913024847.552254-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 9edb68c7-5797-4403-6dbd-08da954f3e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Edlyivz8zBaSNO39rCRuejLhRRWC1FpHx1RkSm2IhWOMXZbLZ1ZpoRsUhla3aYhHHbcw+uNDk71+UoMjXSIQ5/dcKNq/chjNjNRvsJWFLL4vuhp4W6YdR+UwW2Wel0o+qUy7F0S2EhQe4Bx1hEGxzZSlPdcR3Rsk7Y2gnrskkNc5/CBHg6Jsv8G7iJKDKK6MchjJlEj+lnhNlrB7KdQY0JMYmEC6dgtHWNTS145agQUR79kRnY+HslLRkqAHONxmt7R7TJzBVj2P/DmOwxwJXUSz/jg2q6AbZckfRDmieNVM7iIbW0dhixfTHM4xmr1GZJVHQxMv7J0+/M122YfgM1mudnsjuqG+pyBaeT8KMps9w6JbtPgpt0bgVqRju5B7YPQtP32IDpyKKy77dFdjHKmoj9CnrVZvj4Nqx0Uq9knzgTyL8wRyS1Se2ptWcfw5eCAd9dCYXzgpoN3hG8T5u2thP1cMU7Q22HfqutOWmbg7I3P6xceplaUCZ80iS8ylhHVYu90I2cvkqxKsDwAwGDgLnNJIvpHDxh3z4g+U9h7NbR9VqVYlYMifP5ZjKhuW5p/xZv2fyPFs5JJFwadQ/JcMEUzjFsSpgqD5bXiMb2i8Ypw454fmSDUdV0ZOLNwG7jSCev3GuoT+Fha71+lv77IdjRi73N/lkRoyz27QpCH4ow/xm6PSHjQmKoAZIPwQE/MOtGivewmI4/mzVVptOSeZgsT6UxJlEirrzAgUs75T4+C1aJOyEwAzpXzgO4bqpc97andZp/TEv+lU+otHEtoHFRAeCqWcv0dGhix+E7Pf/ft6g5iauXj3+2jSvO6Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(66946007)(31696002)(6486002)(4326008)(31686004)(8676002)(186003)(66476007)(7416002)(478600001)(5660300002)(921005)(66556008)(38100700002)(86362001)(8936002)(26005)(6666004)(41300700001)(6512007)(6506007)(316002)(2906002)(2616005)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVpQm9lODJZYkVOMnhqQXNRczB2eVdNOURkWTMyVVpsaGw5d1RSMjFlVFdF?=
 =?utf-8?B?NFhoZjd4ZHVveCtwbUg3NGZTSVNFZDJ0WVJxRGFxWkZuQzhUelg0K09vWTI1?=
 =?utf-8?B?SGd6WWpwZ2swdWRCRFBlM1NJMUxZbXdVZTVsTGhmNXd4WTd1THhDWnBoRnBv?=
 =?utf-8?B?bmFmZmw5N3J3anNsa215c01sWUlGV3Q0bVdCeUFOdHNDQVF6ZlI2YXNTRFI1?=
 =?utf-8?B?ejJrdzgrMnAwN0Y4UkttSExLcVZNMlkwYytBK2hnSGRwK0pzVVhOajJwZmlY?=
 =?utf-8?B?N3I4c2JWNjd2QzJIVTI0bGsvVFBqeXJNRjBjeDN3c3A1Z1dhMFl1NjdvSzRG?=
 =?utf-8?B?cm9zMmEwR1hFRm1vNFVkOC9pU21ZT254SEFZd1RhTmR2V0tLWnVyOVV1YTd4?=
 =?utf-8?B?eGw3SHZYMGRic3A4cFFLQUZneUg4bnQxVmZPZ0p0WnBMekdvQ3kwV2Z2a25O?=
 =?utf-8?B?R2VEVDg1NFF1Q0tpbFA4YjFCWjdIUzJGRzVuME54a0t1NWJ5bVFxdUpuTFd2?=
 =?utf-8?B?S0R0WkkyQlRlOS9PVzg0RVNDT1UwVEFGZWpuK1BDeDRNUDI2SW5TK0tQd3Uy?=
 =?utf-8?B?eUE1eCtoTVFxV3FOWjdmQVp2b3hYS2pURDVvVjdUYWF5My9GeWFvenUwRWdq?=
 =?utf-8?B?b2w5eVBUZU9YSCtiZm1TZ0JjN1Zjem9xSGIyVlJiM2l1NmxKQ3IwYjY5V3Jy?=
 =?utf-8?B?dzQ2Q0RNVG9qUEZvWEpqQlNsRWY4VWdocENlY2lDakkvRTRJSEtqdnlrQlU3?=
 =?utf-8?B?L2pmZlp2aW1iWUh3aDAwTlVoSVM0b1ZKMWt3VUUyeHdMTnNJcHRoK2cxYy9Y?=
 =?utf-8?B?Qmo1QWtGME5lQkhLRzhMQUNGSlgvYmI5S01RVmEzRTg0UjdpemhGWnZQdzZS?=
 =?utf-8?B?MjdYQzA3UTloaUZVZmo5aGZpUXpwMXJ1dVhDcitxTFVXKzlmTUNOcHpMNk9n?=
 =?utf-8?B?RTdrOTBwOWIzSkI0d2NJUzVVczgzb3VPTEtvUjlRSzRDMW1EMUZkallJZGxI?=
 =?utf-8?B?QlJQZzRndVhpblkvV056RGdlT0oxb0drWGZhekFVM2VycnJLdFlTWTVHeC95?=
 =?utf-8?B?RGI4NXh2WUp3TEx5Z3Z0ZVo0R1VEb2VqYngxeUtNMjUzUytZdTRzQ0hmSGxz?=
 =?utf-8?B?NzlQZ21mWHk2bHFmWWJWOEJNTUJ6NWx2bGRyVkQ3U293VTFsL25GS3loZHF5?=
 =?utf-8?B?UFpwRXllb2RoakFIcGwrUVYzL1k0WklVT1p3VGtlNXpqWSsycnd2SkhyNTFs?=
 =?utf-8?B?RDArYk5KWlozQ0o5MGpaNDlFdVIvZFlvWXVoOU9XUmRRUEtnanRtaTFXeGlG?=
 =?utf-8?B?dVhuejBBdTJ2NW5zM0szaUxzaWhoTFVrbmc1SnhvZ3VEOGI2VFpNYWtFZWhX?=
 =?utf-8?B?dWFqaktJUnIvV2k3ZHZuVTdzaEovZ21HZUZqTnQ2bm1mMDZ4by9UbVgvZkc5?=
 =?utf-8?B?d1NMWmtMcUJYM2hCeHE3b2FYOXl0Z0tWVjRXVVNVVmlJc09JSUZpa3RUVisv?=
 =?utf-8?B?Y09YUGdDZ3ZORFoxdEc3NGZhV1h5am8vVmo5VkVnL3ozeUExVzVxa2RPMlhQ?=
 =?utf-8?B?d2hUYWs0N2sxa1hUWVVteDVpTkgxRFpiSkRUR0VUM1ROcUtwSmpPUW9yclY2?=
 =?utf-8?B?THJPcTVaU202c0V0MDdUTHBIVFFicHZGUVR0MHJnZVh5aTk5dXJQNkJOd0tI?=
 =?utf-8?B?d1NyTncvRUxFZkpPOG5kalNGRTJFRjQ1Uk5Rem04emlVcjV3WXN4Rm5kWXRx?=
 =?utf-8?B?Z2QrRzNlU0pPK0x1dWFBZE9nbFVrRGhnMHYxWHIzQXhLWkx3TDRQQ1MrNWhL?=
 =?utf-8?B?UVdkR0x2Z0ZLZjR3UldESEVuWnA1Sk94bDVaWmZYSkJPb0c4eGNjZ3ErQm92?=
 =?utf-8?B?NmEra21pMU9QVytXVmdCSlloU1JMY0wvWnF6T01OVDVROHo3Q2IvbHAwclEr?=
 =?utf-8?B?bUJPeEVzQ1pwc09WSEt5NEhUUit0TDhROTN2NHBKcW4yc2kzNVU1T0UwVjhL?=
 =?utf-8?B?UXN3ZFBiL1ZIMUt3M2xiRWF0SEdBOUdJS3ZsTERRWFFrWEdxNHRwUjZ3Q050?=
 =?utf-8?B?Wkp0c2ZBQ1JWd2FHNlVFODNrUENkQjhhc0Z5QVVtSUVMaGs2bDdZOHIweHBy?=
 =?utf-8?Q?UeOnFazKPRHC7gAigWKPCN7hZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edb68c7-5797-4403-6dbd-08da954f3e4c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 06:14:40.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RxqdRNCi6M0ItWJhdVLQEGAGKzMPTSSObfn4B7aYouQTKJFCPp0hNnFRmTvXdKl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice cleanup. Acked-by: Christian König <christian.koenig@amd.com> for 
the whole series.

Thanks,
Christian.

Am 13.09.22 um 04:48 schrieb Gaosheng Cui:
> This series contains a few cleanup patches, to remove unused
> declarations which have been removed. Thanks!
>
> Gaosheng Cui (6):
>    drm/vmwgfx: remove unused vmw_bo_is_vmw_bo() declaration
>    drm/radeon/r600_cs: remove r600_cs_legacy_get_tiling_conf()
>      declaration
>    drm/radeon: remove unused declarations for radeon
>    drm/gma500: remove unused declarations in psb_intel_drv.h
>    drm/amd/pm: remove unused declarations in hardwaremanager.h
>    drm/i915: remove unused i915_gem_lmem_obj_ops declaration
>
>   drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h | 2 --
>   drivers/gpu/drm/gma500/psb_intel_drv.h                 | 5 -----
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.h               | 2 --
>   drivers/gpu/drm/radeon/r600_cs.c                       | 2 --
>   drivers/gpu/drm/radeon/radeon.h                        | 3 ---
>   drivers/gpu/drm/radeon/radeon_mode.h                   | 1 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                    | 1 -
>   7 files changed, 16 deletions(-)
>

