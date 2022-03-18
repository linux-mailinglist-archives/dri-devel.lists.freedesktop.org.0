Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC04DDC3F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF01910E9FA;
	Fri, 18 Mar 2022 14:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94DC10E9FA;
 Fri, 18 Mar 2022 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647615287; x=1679151287;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7w74Eqib520gm3AjbBOAlt+Otxz5oN7s8xxIgu+6OJI=;
 b=ZY9nkQFcQLW6yWb3e0ejVeRoTAz+g5jbgcphDPZL6vq7G65QmefBOaZi
 O6dZKmjE91IYJSC9JRy74pXn/f0SzvDpx7cT9MUdpv/yhipUvK0mSehJU
 BMiBAnhJRuAR9KvgbAQQbniOOF4ZD0BfB6gEl8YKYWTcaIPKFH/MTk9Oh
 FPT4Wu/kQK0dedqx4DfrajRTS5LTNecd6U8x6Zg9E3qKBXRHPQyn/Jitd
 qqHmYaMHT8xSFE1TyWlLOsSP5o5p9HYLz86Xg6/YCYIFrjwpRIrTuvb84
 HDJI49fLS+7htWj4kRq3wAOsw8/M6zm+r6COCfoXlzN8e8y9Urvj79l3I g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257336640"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="257336640"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="647489356"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 18 Mar 2022 07:54:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 07:54:46 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 07:54:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 07:54:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 07:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaM1FmlX69MxqXke1CRQOV+ucr8CH9DxCQRThYHOihXuGE8h7eZRuvDG+J7Y4qChn3PUdPRR/E/OooMeGOoK0BZChbt0bTu7mKLEYQdoRz1aYdYbCVpgPi8EjOefNWBnuCK2FVJ/u9GKKSSK5sNto58Tt7gncIA8VRMlqmI/MZJKhEigvIm4+xaLYqtrfqt7oOLke0wePxokGZbbaq97VczrzhedRfRDtNDQnNf3QdOZ89b/vW9Snpd8SkPvOcYvp+nNOOb2EclxSrjK9LD229PDe7g2S1GO46vDAHpUtFNSppeCMItCzSRXPwxwtJh+2yns6zBELZyp/v0iJDd2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RchRJbSm4ukzTq53xv9OOOgZuz4xZ7hZqwNVU3HavZw=;
 b=VJrZzZPeQfJk1EuI8lJqlXSiTbBt6U3kKzaU74yk3DvpwCLLV8IiyStkzNxksuF/TmcASs76KVBL7B95Nyjn83TqLR2PPAj+S2MQ1PQdBWBujmTDWXZRLgMJTaGXNaF9rdl/i4UbrT/W2B1tzhErXzo/NmJGftfWIha+aCdidoxrEFSVEQy9n3GGPJtjBZKSqAaJLOtAUtKKxf29NuH5x6ihz/COr8/VEcV25R19iX4YVIATd110bD4GMB7sDnAdir84JERav11KxZ3lE/GbWmvEmJfWljFfoYukcwZdDAHA7HOSc1NUZQ/5XEkq2GnU+rX5XkSrowfQApEntuS68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BN7PR11MB2578.namprd11.prod.outlook.com (2603:10b6:406:b2::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Fri, 18 Mar 2022 14:54:43 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 14:54:43 +0000
Message-ID: <f5091ef8-e3c8-887e-8a55-2d5271effbef@intel.com>
Date: Fri, 18 Mar 2022 15:54:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v6 6/7] drm/i915/gt: Create per-tile RPS sysfs
 interfaces
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
 <20220318021046.40348-7-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220318021046.40348-7-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0096.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::37) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e054e2-d702-40cd-920a-08da08ef3c4b
X-MS-TrafficTypeDiagnostic: BN7PR11MB2578:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR11MB25784C42B44A3D9E1EE7C06EEB139@BN7PR11MB2578.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2j5S5zmkJo00pBsTfVRFN3ruxb1qRu7mMY8mlqBSVX63fHgql21pu251CkQ8X6sT89EkIvLbMN28OrVwdq/xO5y3lBjqOmJsX3ZTk241ZkdtvJClvG64KD4eWzh12rhf4O4rzrYHi7cR9dOhFR934KLUtNloRw5F/w58cABqMShLjpl9bWzrQUND8P0vhPRl/O1s3TWzrYnoUVpNGj+DHDja6lJDi5UuzBfitc3R3ifZNbpgUqSvEpK40O2FFb4/t15bXefX10p1KJYo5FTXAKHMvVCYVvEb0o9ayHQsnSSGDXlUNc6u3rJ244O75WsE7f06Uz6BBauSGULFqNMipQYdj8qtAYPylbLuFLLE8yDQTlxoJTJ0gZ/eQgIMTTqV0nWeNGsilhL/2PucmO8n/V//p/t33RuVM7PmAvyQlBHz/iEROzLFrDp7vPuxNlLOUtaijkxuFX6Q0IWm0H5yDAcc3zkUf3mbmojvD03XLiVDIjseLUJLtY7bQ3rBbYvxk6LqUVmd48lBKe22Pma4ykZQbkcSnBocihIsOn25eMiU/GESiuiFxj9x574KdbVEuUUWkbWRL6lx6qdpMAsOpA+0djqYMuR3TcRj/wVJD8rBGTKl/rbGSpnnDKeNBJDXACVKZuywyU3zHeH5HyM0py6k5PpqaLO7ODSqHDyk4qrWEgoTIvz5uJ5QZy2G6nbeswMGjhq3oRzOUS6+beSqq07PZ5tKBPseiG0vduzaSk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(82960400001)(6666004)(86362001)(36916002)(31686004)(6506007)(36756003)(2906002)(4326008)(6512007)(53546011)(66476007)(110136005)(54906003)(66946007)(8676002)(66556008)(83380400001)(8936002)(6486002)(508600001)(44832011)(186003)(26005)(38100700002)(31696002)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJnK0U5b2VNME54ZDhqREJEVTNhemRWYkJuNjNmRHNEWTBQRlVMbTJOczJM?=
 =?utf-8?B?aDJhUXJxZzQyWnZjZW9rWGNQMVo2U0d3MVdLdWV5bUppSEw4SjgrYnNtWGFB?=
 =?utf-8?B?ZGZ6a3ZkaytQcnQ5eWRCWHFhb3dvc2NGYzA5QVM4eVBCeExDSEFXM25JSTN3?=
 =?utf-8?B?VVV6eFE0dTNXU2htV3dZWEdpSnZIaFhGWVRHQnNmTm0vSzFFTmNCeWNmUytC?=
 =?utf-8?B?NzM5eEZ0bVI4emtCZS9nK1R6OWkxcDhUdzcxNU9DQVhBaVRFeHI5aEpXWWVm?=
 =?utf-8?B?aFFTUXVpVk5UT3ZGM04rdUxROGJjNmU1WHoycDBWNUc3eG9NRStjRWRQdlF1?=
 =?utf-8?B?eHNsaHRJdmNMSk55UDlGK0JYOVM5UnBGdjJIWk5mWVUrRXoyYXJQV3I4QW9B?=
 =?utf-8?B?Sm82V04rY3hXSW5QTkF3NE4vQTVQaGVGU0kzenNXbXNsTFdmZGJSWlkyUmpy?=
 =?utf-8?B?SlA4NTBpcnRNZkhMVUZnUEZsMVJ4YkUyM09BNWhZVmc0MkdMMlE2MDJIQVZ0?=
 =?utf-8?B?Z0dnMzUwbHczYzBrRHVjV0JGNEpjSkJ2NXJuSnJvL2dZR1padVdMNzMrc3U3?=
 =?utf-8?B?NDQ1R05oTlkwckV3cTFXZHpyZVkvWkFsdHY3MnBLNkNjb2lWaVE3VTAwd0xk?=
 =?utf-8?B?bVFnNEFYdVB2TlV6YXZkbjNzWXpMak92akFMbVVKVkV3TTdKTEJYT1ZKR2d6?=
 =?utf-8?B?cjRBb05JNDdFVXlpUWluWjRwM0FDaFRsbkNWMklQWDBCLy9mVndNd0xBWXU0?=
 =?utf-8?B?SzNaK25Kb05uMUdueVhsMDk5emxqUm1ISzJNdCs4aEFOeitqb1BiRkpMaElO?=
 =?utf-8?B?WExpOFloczZxQ1JhcUlIK2xvZzZLNGF4VEcrL2tvQnpOZWlLZHNjZWN4MXpz?=
 =?utf-8?B?bDFjbWpuRUpDcS9aazBjaStwSVNBQ2Jnb2JZMks5S2hkdFNRVWt2cUo5WG9J?=
 =?utf-8?B?dUx6REpIQWsxYjFSNkhmN0ZqeXpxMTFSNUZqU2tTdDZSSUcvemZUZUNSaC9k?=
 =?utf-8?B?WVR3NDE1OGVUbkFaaUI5RG1hcGxpL0hqd3Jha3NwS2dUWFIyenhndmFOS1Bl?=
 =?utf-8?B?SHJGb2huajhPVEpsQnRIOXVxZ1M5SkxmZ0ZIQkg2Rkw3TXV6bnVpM05meGRz?=
 =?utf-8?B?TVV6U2k1RTNBMk03aVBmWXRVQTdkKzEyOWltWTA1dThBZk52cHdJK08xdXNR?=
 =?utf-8?B?WEtSa21qbHI3bjd0UFZ4aVpKMlR3ZWFwMGFRdW41RWd2ZEFETFA2L3ZhUTZH?=
 =?utf-8?B?aDdxbXZhanFtb2FDM1dISnBUWHQ3aE13UHEvV0E3aTFIUTdjNlZCMWJHZ0VM?=
 =?utf-8?B?Nm5NeExHb0xNMkxsRVNWRERuYlh0cUx3K0UrZmdTNmw2QzlkNWtvNHRMcTJl?=
 =?utf-8?B?dnJOTEJ3cFdGSW5JSlo0eWxyWXQwV0xXUTdVTnhXUC9KS1ZlNU9FcFBJL1Zo?=
 =?utf-8?B?QjRpVmtrai9rRFhNZFdvSHBRUFpkaUtXbTRRcDVwdGtqUWozZlEwQnNyZXpk?=
 =?utf-8?B?a05yZGpoKzQ1a1kyMDhkdlRNZnBMdE9tcEo3MHlKcmcwZ3NCU2MwUlJ0eGx3?=
 =?utf-8?B?cG4wanBHTTErVzZzZmlYbzh4SStzK0QySzBrc0tUTTh3UGQ0Z2gyN2hBSUNX?=
 =?utf-8?B?cDB6MFMzT2gzNVNMbnVaV3RXWWNWWm02cUR3T29TakJXMFFzQVpsODJwWE5G?=
 =?utf-8?B?NEoyc3YwMnpoa3VqMzNjME91NEZOazhYVk9UYjFqVDkrdWJRcjQwQTVOZXZz?=
 =?utf-8?B?b2xRdHBCUWRNSUtVb284Tnhkb3Nod0orUUxJZDh1RmtsQnZqQUxHaTJpK0wy?=
 =?utf-8?B?bS91bHJIYVlBY1U3aFREeDB0bVN1dXlJbjZwc2pYQlJ6MlZKNTRPY1EvZGM0?=
 =?utf-8?B?WFprZmxsVWJ5ZzhQNzdxbVdBcmdoUGhBTlFNMlhkeHk0MmJ5QXdxVThWbDFL?=
 =?utf-8?B?SXBSZTVKUFZpL1d6MkhCSnVISnk3UmxIUmJ2VC9WVUVsZmxWUU5JNDE3dVBS?=
 =?utf-8?B?MzZBYk1rWlJnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e054e2-d702-40cd-920a-08da08ef3c4b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 14:54:43.2825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/iQVkJC3pJ3QI5c9wmLdFdJRM+2uYlxC6IjgYAGHqyvcVLnq84v64QLkLFVZrOurrWojdanMmA8+T95FP1dhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2578
X-OriginatorOrg: intel.com
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.03.2022 03:10, Andi Shyti wrote:
> Now tiles have their own sysfs interfaces under the gt/
> directory. Because RPS is a property that can be configured on a
> tile basis, then each tile should have its own interface
> 
> The new sysfs structure will have a similar layout for the 4 tile
> case:
> 
> /sys/.../card0
>           ├── gt
>           │   ├── gt0
>           │   │   ├── id
>           │   │   ├── rc6_enable
>           │   │   ├── rc6_residency_ms
>           │   │   ├── rps_act_freq_mhz
>           │   │   ├── rps_boost_freq_mhz
>           │   │   ├── rps_cur_freq_mhz
>           │   │   ├── rps_max_freq_mhz
>           │   │   ├── rps_min_freq_mhz
>           │   │   ├── rps_RP0_freq_mhz
>           │   │   ├── rps_RP1_freq_mhz
>           │   │   └── rps_RPn_freq_mhz
>           .   .
>           .   .
>           .   .
>           │   └── gtN
>           │       ├── id
>           │       ├── rc6_enable
>           │       ├── rc6_residency_ms
>           │       ├── rps_act_freq_mhz
>           │       ├── rps_boost_freq_mhz
>           │       ├── rps_cur_freq_mhz
>           │       ├── rps_max_freq_mhz
>           │       ├── rps_min_freq_mhz
>           │       ├── rps_RP0_freq_mhz
>           │       ├── rps_RP1_freq_mhz
>           │       └── rps_RPn_freq_mhz
>           ├── gt_act_freq_mhz   -+
>           ├── gt_boost_freq_mhz  |
>           ├── gt_cur_freq_mhz    |    Original interface
>           ├── gt_max_freq_mhz    +─-> kept as existing ABI;
>           ├── gt_min_freq_mhz    |    it points to gt0/
>           ├── gt_RP0_freq_mhz    |
>           ├── gt_RP1_freq_mhz    |
>           └── gt_RPn_freq_mhz   -+
> 
> The existing interfaces have been kept in their original location
> to preserve the existing ABI. They act on all the GTs: when
> writing they loop through all the GTs and write the information
> on each interface. When reading they provide the average value
> from all the GTs.
> 
> This patch is not really adding exposing new interfaces (new
> ABI) other than adapting the existing one to more tiles. In any
> case this new set of interfaces will be a basic tool for system
> managers and administrators when using i915.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
