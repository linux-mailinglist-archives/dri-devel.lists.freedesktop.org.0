Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E558D4CBBCE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658BA10E2CA;
	Thu,  3 Mar 2022 10:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBE910E28B;
 Thu,  3 Mar 2022 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646304934; x=1677840934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bZGpuCnZ9LoQydn7TW3xuX9rqjBNiM585+7uRB/Inyw=;
 b=TRlJb6X2Hi7JcHLKuz08PqfDvl85xzcr2UanFDErLHk8KJXFNmUzv+T9
 tfYY7534bJP5TeS+QqyVFJwtIv+FebRqAg8ubReckRcEcrYSdD+58Gp95
 2FMemFoBmE3WyDNNFRl7lXuloffXLabs1+Jqt55m4ul2X0nTSRIg1S0Xc
 zKZp6wDG9dhIdupCDGLKQIqvJ8E9XJLYNQLBzXINUQ5xV+hb6e4lczIzi
 spbMUiIziwcXHTBen/p9WGXNIPfAhXy/RnwDonltzALMgrIhFQfQbKusT
 4xrWFYzGoS9d5OoKnaaSzDfba8GT4x0LbAh2Q+3MW16BLjE2Jayx4z9cw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234255790"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="234255790"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="709882716"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 03 Mar 2022 02:55:27 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 02:55:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 02:55:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 02:55:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSNLnBq4+H9NGjdnikfZqykIT5POHPvHLBdB8seuGsDNvzwFS9/KfeiSkqYzZ2I4FS4ruHItfyH9LiYt8v2+yyAMWtEq2vbGu/thAXePFKOx+dF09SOoSa5bgQ67PpYgdnwDMu2ppOwpgny7vwDFFfHw5dE/iNdIJzHd5yP6LZ+THJZe9xWkbUARCTGfdhmITQ5+LpMMuKKVetDewisiV6zZkUuPx1acTD22htToTKmugGoNUPus5K6S4zpSZ0fn3PXusPzKf5roJlfYZq/LYVxakf7E0Ggqf0+6KTfpn9dj5tLBtn/TRMfgw4DZODX8LSJpLEqjY/ohlvVhQ7bphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnStynsxKRELlW0O7nVjZ6uiQxHS6an200YQG4BTMYM=;
 b=AyubJk6NTkds6sgNuAW1Lr32hBfiWCByGGbiLICmCjWs1z9fHmfhe4r4LLCLsCQGYC8yJ0x0kl8S3vZ+CLDbeleXkGuTHekRYt9W93IQ+9aiSHcF5xsHvahEVcj7s1Fm4Meh+Mj/SME/Byd6WrMdGa4taoNcuvaR/4D82YFbpiHsg9JzS/KXv18+kV24VuPBIwGIUZneZ9mpHZ7tTrqKgwF7Z4ImKRsioU1Fp+oxK4+n6LlQtTkllSWRxsti4BBQs02mOfOlzVOF44txj2hvhv6zpzakFR0jk5S1okHTXc8J84+3Wy7NdtcObZYBbtcuxzWIA8T//ivJBxR1H1lzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 10:55:21 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:55:20 +0000
Message-ID: <50361e36-d07a-a471-1c5a-03cab9745129@intel.com>
Date: Thu, 3 Mar 2022 11:55:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 6/7] drm/i915/gt: Create per-tile RPS sysfs interfaces
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-7-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220217144158.21555-7-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d9c5b5b-89f5-4b59-b1d6-08d9fd044f55
X-MS-TrafficTypeDiagnostic: DM4PR11MB5247:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB5247481B11EBF9BD754075A7EB049@DM4PR11MB5247.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPeFSPQhJT8Ub+NQuCTI1yJUqR/V4719Z3cG8EVQt2hMjXUGeU0KvQcp4zgMWkH/GYAnk0uYTGPpDChOQ7r1nfD654WWgtHGYpckJ3c9iRnw2vs38R+lVvw9aesgxtyzuhCbX0pCpXo+1jS8eueTF7VJjjU9tODvHPSERuvOpcxKLPgGu22CE52LyJuiQ00IVgZ1tOFtJ0Piq8rRl7XtTcfI64C76NbA1Y7JhF5a7RAx3fjFcZ45g7zuRr53JdRBl5SyG6fObdW+OnV4ox12VWaOzSUMSU7NUYKkQLpl8CYvAZJGl9w8MC+Amo2gIxfpzpt8wN3t46lY7eFPDVuGQMS8zhKbRVnjohu3pcv8lkSVlFbacA1bL0HmU0rtEeB2jD5Rrrtw9C8c1b0lF0SmEVtS7+Gyt5LJ4mGlqJf92AcMHwKWdF/QPkRRbLoQ68Td5bO+eHF2EWqpMk+5nBM/YKMLPEggInJhHglHdKHc/6NTcpYdyNYqSYhB+WlMpuNN4hT1oh/IOdDSP+QQUGcrKn/VNKBaigVkdR71cLOBopiCUtikW+wMMAFenM6EXAS7y6KqtHpTwLy8MaMm0VULkBbCz3qExtOqQ1uU5P7XlQrM1EA+ZVM/aGR9P6s1Jwqc/I6sCK679caa1syn2OAZ8P71oixiy/i9dADem5SasHsIX5F0YXx6i/iFE/lfdbylwKgpMIr8CNTF8RrSV3Amf75sXo9TVpWSjoOPOHiiEy73w4xaAY6Lth7LJQHveDaq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(8936002)(83380400001)(2616005)(30864003)(44832011)(54906003)(86362001)(508600001)(31686004)(36756003)(31696002)(26005)(186003)(5660300002)(110136005)(316002)(6666004)(66476007)(66556008)(66946007)(8676002)(4326008)(38100700002)(6506007)(36916002)(53546011)(82960400001)(6512007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZPWGZMeXBQTWFZc2RuWURjbCtmTTZoczRnU2QxUmk3N0VuUExRTVhQVURR?=
 =?utf-8?B?bitXOVRKYXIwUTdhNjMxRDlDczhzMmZieGNvNmdEajdPc3ByODU4T1JEdEZp?=
 =?utf-8?B?NlNLOEhBOUxEN3pwbEs5S0NYZXRvWDBBTjVCZTF6Z1B3Q0p5WnZyU1gxUXAz?=
 =?utf-8?B?SHZKVFhDWnpvbmgwUTZmU3JLYWpDeWNQa2dPZkRCYXhRaG0wSzdaQTVxdHZ5?=
 =?utf-8?B?bEYra1pHUTNBcXQ2cHJQRVA0V2dFeWlUaHVpWDlYbFl1VnhGTmJvZzc4TE0r?=
 =?utf-8?B?MVJ5UWhaRDBLVnl6bDVDUjA0L2JMcjhzTTYxZ0pHdHNTRmVXdmxXaXQrVTNF?=
 =?utf-8?B?MmxINjJTcEVZMVlmYU1NUlcvTFppN0tEUHpJdSt0ZFd4RGVHRkJ5YTE4S0M3?=
 =?utf-8?B?Q2xMYis5T05la1FJcWloRjFGUEF3Rm5wV3NGUUVScndDZDJMbXpkVk9uZEVN?=
 =?utf-8?B?d0NDUkhHM0JFQUlKMWNtK0xCdDJNNXhQZXVEa0VqLzkrdlRxOUNhcmZWMVdM?=
 =?utf-8?B?ejZrVUpGYlN4STZJaWxvRFQ0NHFUL3RMZUp6SnB4ZlN6ZTVwNC9YUmlSSWo5?=
 =?utf-8?B?dDRFZzRoTVUreUF3OUdiYlNTbndlamsraDlnL2pYcjFpeXF4WjlzOFQxcFhL?=
 =?utf-8?B?L1E0NGxpNEt0bmdDdzNESFJHU0NMYWpaVVAzMnFkZXAzem5YOHNJTi9kbWJB?=
 =?utf-8?B?SzZWUTkraHBRT3ZwVmgxNmdIVGpEcmRMNkZBSElRWmpUZXBOTFZ5NnlJaWw1?=
 =?utf-8?B?QnVUOWdCbDVwZE14d1phNS9PUjg4VXQ3TU1ETUNrRkRYZE85TUhaR01lOXhF?=
 =?utf-8?B?eVhRK3BiNUVCRkZjeWpxU3ZHQll2UDk2aDFQdkVwcmxOUk5WRi9KTDJiUlRs?=
 =?utf-8?B?U1ZPZTFIZWl3Y211NVRYcGg5VHZqc0VUcW51NVNucjZXOFBvdTgyUTlwU2Fs?=
 =?utf-8?B?d1YyMDRqbHpUcjNGM2VCNVBaUEE5MkN2d3N5RjVNU2dIYmZWSm1BaDR3VFNs?=
 =?utf-8?B?Y3k1QTV1Z2drQ1J3RXd4U1F5c2ZyVXQwa2hNRFRhTHdHSlpQN2JTdGduT2xW?=
 =?utf-8?B?VWJVK1NsbUlDN2FXRVdYS3VYZHJnVjV0K2tIVGZHZHdCUDdVS3BFMUJ3MDha?=
 =?utf-8?B?QWNaK1Rvd09JSFNPSDdHWWoreVByV2hSdnJyOGZ6L3hmaEZwQWc4K0ZQWUtV?=
 =?utf-8?B?Qm05TXlYMDhpVEY3Qm0ranlIWVBOdjJCbHNFYU1XbWYwemVBSFpDZWdwcEFv?=
 =?utf-8?B?ZmlISkw2a2Q5aEQ5SFZkWURzRzEzck9IWTdqN0VpZ2Z5akRTWGJBTHF5T2NB?=
 =?utf-8?B?YUdDQjBlcVdiWmw3MHFCKzBjQzFLdjhialNRbkFJSnR4aWU3UWVQVFNEeC91?=
 =?utf-8?B?SlJZYjFzdTh4Y2FoeENYL2h3anBXUW5KaVNYekltQk1QcWIxc0dFWmxRUDY4?=
 =?utf-8?B?cUczUlF0MzNsTUd0UWlqQm5HRjZORWFJWFh2RTREdUg4eXlBd2xDNVRRbDU0?=
 =?utf-8?B?b2cxa0lNMzc2WTE1WkowRyt4bGVpdGJ4ZGI5TkJ6cm5EWit0UlVkdjBaTkFz?=
 =?utf-8?B?dVVwNXg3K3BMN1BJSTkzSkdLczZ5QUM1S25kbEZQcW85ZVRTamx6NTdJSm5u?=
 =?utf-8?B?c3dTMkhxeFZXenRDYnZtcGlPbEw4eFUxVjZmdmY2UWZXQldCY2NCUEE5b0tS?=
 =?utf-8?B?ejhacWVJNWRVWWVta3V3MlRuQUhkVlliMHllckIxVkcyazhVLzhEam9nOWp2?=
 =?utf-8?B?dmYzTG84TnAyWFpHc09HODlHUk1MZk9IWlRuZmJCWk0rOUdSRjBsWFM3azNP?=
 =?utf-8?B?VUdMdFZyeGFubkNlUWhPZlhtWUJFc1dWNzNkdlNreXBOa05pb2lQZjd4TU5P?=
 =?utf-8?B?Mk0yYjc0ZkVkeERVaUM2ZXQwb1JpR3E2SmQ1YXdvWlhpSS9KOWtKcmFsZjhq?=
 =?utf-8?B?ajhNOTFqVUtWd01LeDBMSDg1MlkvSWNtZ3crbFc0OHZxU0dabDlsZU5NTjEx?=
 =?utf-8?B?SFZ4UUpQUDZEcWhEc3dPU1NmalA3enp1anpvRTQrSlNXclFmaFc2eDFRcjBY?=
 =?utf-8?B?VGRWWHBTWnFtUFFXNkZzaDlKanZEWFFvbUExblR1eFpaVGt3My9QakxiMDNW?=
 =?utf-8?B?R1dqSDVyeklyZFhRd3dnM25LR0xiN2VOajlaUTh3Tkw0bEphUThsd3BRZ3pi?=
 =?utf-8?Q?KIXkQMruwU6MIynLI8+SUcM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9c5b5b-89f5-4b59-b1d6-08d9fd044f55
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:55:20.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v9Lihn4f61zpcvxQ/Wv697Pji6s3wHSXieuMvzgkeVTRDHnXQY5xW6srK1xBZ9yHxYxVtIfD2z7WVl+BXEVRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5247
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
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
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 276 ++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_sysfs.c           | 177 -------------
>   2 files changed, 276 insertions(+), 177 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 27d93a36894a..8e86b8f675f1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -14,8 +14,33 @@
>   #include "intel_gt_sysfs.h"
>   #include "intel_gt_sysfs_pm.h"
>   #include "intel_rc6.h"
> +#include "intel_rps.h"
>   
>   #ifdef CONFIG_PM
> +static int
> +sysfs_gt_attribute_w_func(struct device *dev, struct device_attribute *attr,
> +			  int (func)(struct intel_gt *gt, u32 val), u32 val)
> +{
> +	struct intel_gt *gt;
> +	int ret;
> +
> +	if (!is_object_gt(&dev->kobj)) {
> +		int i;
> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> +
> +		for_each_gt(gt, i915, i) {
> +			ret = func(gt, val);
> +			if (ret)
> +				break;
> +		}
> +	} else {
> +		gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +		ret = func(gt, val);
> +	}
> +
> +	return ret;
> +}
> +
>   static s64
>   sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
>   			  s64 (func)(struct intel_gt *gt))
> @@ -214,7 +239,258 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
>   }
>   #endif /* CONFIG_PM */
>   
> +static s64 __act_freq_mhz_show(struct intel_gt *gt)
> +{
> +	return intel_rps_read_actual_frequency(&gt->rps);
> +}
> +
> +static ssize_t act_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	s64 actual_freq = sysfs_gt_attribute_r_func(dev, attr,
> +						    __act_freq_mhz_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) actual_freq);

Again, variable can be just u32.

> +}
> +
> +static s64 __cur_freq_mhz_show(struct intel_gt *gt)
> +{
> +	return intel_rps_get_requested_frequency(&gt->rps);
> +}
> +
> +static ssize_t cur_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	s64 cur_freq = sysfs_gt_attribute_r_func(dev, attr,
> +						 __cur_freq_mhz_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) cur_freq);
> +}
> +
> +static s64 __boost_freq_mhz_show(struct intel_gt *gt)
> +{
> +	return intel_rps_get_boost_frequency(&gt->rps);
> +}
> +
> +static ssize_t boost_freq_mhz_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	s64 boost_freq = sysfs_gt_attribute_r_func(dev, attr,
> +						   __boost_freq_mhz_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) boost_freq);
> +}
> +
> +static int __boost_freq_mhz_store(struct intel_gt *gt, u32 val)
> +{
> +	struct intel_rps *rps = &gt->rps;
> +	bool boost = false;
> +
> +	/* Validate against (static) hardware limits */
> +	val = intel_freq_opcode(rps, val);
> +	if (val < rps->min_freq || val > rps->max_freq)
> +		return -EINVAL;
> +
> +	mutex_lock(&rps->lock);
> +	if (val != rps->boost_freq) {
> +		rps->boost_freq = val;
> +		boost = atomic_read(&rps->num_waiters);
> +	}
> +	mutex_unlock(&rps->lock);
> +	if (boost)
> +		schedule_work(&rps->work);
> +
> +	return 0;

Why not intel_rps_set_boost_frequency?
Why copy/paste from rps_set_boost_freq?

> +}
> +
> +static ssize_t boost_freq_mhz_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buff, size_t count)
> +{
> +	ssize_t ret;
> +	u32 val;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_gt_attribute_w_func(dev, attr,
> +					 __boost_freq_mhz_store, val) ?: count;
> +}
> +
> +static s64 __vlv_rpe_freq_mhz_show(struct intel_gt *gt)
> +{
> +	struct intel_rps *rps = &gt->rps;
> +
> +	return intel_gpu_freq(rps, rps->efficient_freq);
> +}
> +
> +static ssize_t vlv_rpe_freq_mhz_show(struct device *dev,
> +				     struct device_attribute *attr, char *buff)
> +{
> +	s64 rpe_freq = sysfs_gt_attribute_r_func(dev, attr,
> +						 __vlv_rpe_freq_mhz_show);
> +
> +	return sysfs_emit(buff, "%d\n", (int) rpe_freq);
> +}
> +
> +static s64 __max_freq_mhz_show(struct intel_gt *gt)
> +{
> +	return intel_rps_get_max_frequency(&gt->rps);
> +}
> +
> +static int __set_max_freq(struct intel_gt *gt, u32 val)
> +{
> +	return intel_rps_set_max_frequency(&gt->rps, val);
> +}
> +
> +static s64 __min_freq_mhz_show(struct intel_gt *gt)
> +{
> +	return intel_rps_get_min_frequency(&gt->rps);
> +}
> +
> +static int __set_min_freq(struct intel_gt *gt, u32 val)
> +{
> +	return intel_rps_set_min_frequency(&gt->rps, val);
> +}
> +
> +static ssize_t min_max_freq_mhz_store(struct device *dev,
> +                                      struct device_attribute *attr,
> +                                      const char *buff, size_t count);
> +static ssize_t min_max_freq_mhz_show(struct device *dev,
> +				     struct device_attribute *attr, char *buff);
> +
> +#define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
> +	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
> +	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
> +
> +#define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
> +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
> +#define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
> +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
> +
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> +
> +static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
> +
> +static ssize_t rps_rp_mhz_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff);
> +
> +static INTEL_GT_RPS_SYSFS_ATTR(RP0_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> +static INTEL_GT_RPS_SYSFS_ATTR(RP1_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> +static INTEL_GT_RPS_SYSFS_ATTR(RPn_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> +
> +INTEL_GT_RPS_SYSFS_ATTR(max_freq_mhz, 0644, min_max_freq_mhz_show, min_max_freq_mhz_store);
> +INTEL_GT_RPS_SYSFS_ATTR(min_freq_mhz, 0644, min_max_freq_mhz_show, min_max_freq_mhz_store);
> +
> +#define GEN6_ATTR(s) { \
> +		&dev_attr_##s##_act_freq_mhz.attr, \
> +		&dev_attr_##s##_cur_freq_mhz.attr, \
> +		&dev_attr_##s##_boost_freq_mhz.attr, \
> +		&dev_attr_##s##_max_freq_mhz.attr, \
> +		&dev_attr_##s##_min_freq_mhz.attr, \
> +		&dev_attr_##s##_RP0_freq_mhz.attr, \
> +		&dev_attr_##s##_RP1_freq_mhz.attr, \
> +		&dev_attr_##s##_RPn_freq_mhz.attr, \
> +		NULL, \
> +	}
> +
> +#define GEN6_RPS_ATTR GEN6_ATTR(rps)
> +#define GEN6_GT_ATTR  GEN6_ATTR(gt)
> +
> +static ssize_t min_max_freq_mhz_store(struct device *dev,
> +                                      struct device_attribute *attr,
> +                                      const char *buff, size_t count)
> +{
> +	long ret;
> +	u32 val;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = (attr == &dev_attr_gt_min_freq_mhz ||
> +	       attr == &dev_attr_rps_min_freq_mhz) ?
> +	      sysfs_gt_attribute_w_func(dev, attr, __set_min_freq, val) :
> +	      sysfs_gt_attribute_w_func(dev, attr, __set_max_freq, val);
> +
> +	return ret ?: count;
> +}
> +
> +static ssize_t min_max_freq_mhz_show(struct device *dev,
> +				     struct device_attribute *attr, char *buff)
> +{
> +	s64 val;
> +
> +	val = (attr == &dev_attr_gt_min_freq_mhz ||
> +	       attr == &dev_attr_rps_min_freq_mhz) ?
> +	      sysfs_gt_attribute_r_func(dev, attr, __min_freq_mhz_show) :
> +	      sysfs_gt_attribute_r_func(dev, attr, __max_freq_mhz_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) val);
> +}
> +
> +/* For now we have a static number of RP states */
> +static ssize_t rps_rp_mhz_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	u32 val;
> +
> +	if (attr == &dev_attr_gt_RP0_freq_mhz ||
> +	    attr == &dev_attr_rps_RP0_freq_mhz) {
> +		val = intel_rps_get_rp0_frequency(rps);
> +	} else if (attr == &dev_attr_gt_RP1_freq_mhz ||
> +		   attr == &dev_attr_rps_RP1_freq_mhz) {
> +		   val = intel_rps_get_rp1_frequency(rps);
> +	} else if (attr == &dev_attr_gt_RPn_freq_mhz ||
> +		   attr == &dev_attr_rps_RPn_freq_mhz) {
> +		   val = intel_rps_get_rpn_frequency(rps);
> +	} else {
> +		GEM_WARN_ON(1);
> +		return -ENODEV;

I guess this is not necessary, otherwise similar path should be in other 
helpers.

Regards
Andrzej

> +	}
> +
> +	return sysfs_emit(buff, "%d\n", val);
> +}
> +
> +static const struct attribute * const gen6_rps_attrs[] = GEN6_RPS_ATTR;
> +static const struct attribute * const gen6_gt_attrs[]  = GEN6_GT_ATTR;
> +
> +static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
> +				const struct attribute * const *attrs)
> +{
> +	int ret;
> +
> +	if (GRAPHICS_VER(gt->i915) < 6)
> +		return 0;
> +
> +	ret = sysfs_create_files(kobj, attrs);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915))
> +		ret = sysfs_create_file(kobj, &dev_attr_vlv_rpe_freq_mhz.attr);
> +
> +	return ret;
> +}
> +
>   void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>   {
> +	int ret;
> +
>   	intel_sysfs_rc6_init(gt, kobj);
> +
> +	ret = is_object_gt(kobj) ?
> +	      intel_sysfs_rps_init(gt, kobj, gen6_rps_attrs) :
> +	      intel_sysfs_rps_init(gt, kobj, gen6_gt_attrs);
> +	if (ret)
> +		drm_warn(&gt->i915->drm,
> +			 "failed to create gt%u RPS sysfs files", gt->info.id);
>   }
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index b08a959e5ccc..0a0057940718 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -156,171 +156,6 @@ static const struct bin_attribute dpf_attrs_1 = {
>   	.private = (void *)1
>   };
>   
> -static ssize_t gt_act_freq_mhz_show(struct device *kdev,
> -				    struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rps));
> -}
> -
> -static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
> -				    struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
> -}
> -
> -static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
> -}
> -
> -static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
> -				       struct device_attribute *attr,
> -				       const char *buf, size_t count)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(dev_priv)->rps;
> -	ssize_t ret;
> -	u32 val;
> -
> -	ret = kstrtou32(buf, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_rps_set_boost_frequency(rps, val);
> -
> -	return ret ?: count;
> -}
> -
> -static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
> -				     struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(dev_priv)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient_freq));
> -}
> -
> -static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_rps *rps = &gt->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
> -}
> -
> -static ssize_t gt_max_freq_mhz_store(struct device *kdev,
> -				     struct device_attribute *attr,
> -				     const char *buf, size_t count)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_rps *rps = &gt->rps;
> -	ssize_t ret;
> -	u32 val;
> -
> -	ret = kstrtou32(buf, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_rps_set_max_frequency(rps, val);
> -
> -	return ret ?: count;
> -}
> -
> -static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_gt *gt = to_gt(i915);
> -	struct intel_rps *rps = &gt->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
> -}
> -
> -static ssize_t gt_min_freq_mhz_store(struct device *kdev,
> -				     struct device_attribute *attr,
> -				     const char *buf, size_t count)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -	ssize_t ret;
> -	u32 val;
> -
> -	ret = kstrtou32(buf, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_rps_set_min_frequency(rps, val);
> -
> -	return ret ?: count;
> -}
> -
> -static DEVICE_ATTR_RO(gt_act_freq_mhz);
> -static DEVICE_ATTR_RO(gt_cur_freq_mhz);
> -static DEVICE_ATTR_RW(gt_boost_freq_mhz);
> -static DEVICE_ATTR_RW(gt_max_freq_mhz);
> -static DEVICE_ATTR_RW(gt_min_freq_mhz);
> -
> -static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
> -
> -static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf);
> -static DEVICE_ATTR(gt_RP0_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> -static DEVICE_ATTR(gt_RP1_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> -static DEVICE_ATTR(gt_RPn_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> -
> -/* For now we have a static number of RP states */
> -static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(dev_priv)->rps;
> -	u32 val;
> -
> -	if (attr == &dev_attr_gt_RP0_freq_mhz)
> -		val = intel_rps_get_rp0_frequency(rps);
> -	else if (attr == &dev_attr_gt_RP1_freq_mhz)
> -		val = intel_rps_get_rp1_frequency(rps);
> -	else if (attr == &dev_attr_gt_RPn_freq_mhz)
> -		val = intel_rps_get_rpn_frequency(rps);
> -	else
> -		BUG();
> -
> -	return sysfs_emit(buf, "%d\n", val);
> -}
> -
> -static const struct attribute * const gen6_attrs[] = {
> -	&dev_attr_gt_act_freq_mhz.attr,
> -	&dev_attr_gt_cur_freq_mhz.attr,
> -	&dev_attr_gt_boost_freq_mhz.attr,
> -	&dev_attr_gt_max_freq_mhz.attr,
> -	&dev_attr_gt_min_freq_mhz.attr,
> -	&dev_attr_gt_RP0_freq_mhz.attr,
> -	&dev_attr_gt_RP1_freq_mhz.attr,
> -	&dev_attr_gt_RPn_freq_mhz.attr,
> -	NULL,
> -};
> -
> -static const struct attribute * const vlv_attrs[] = {
> -	&dev_attr_gt_act_freq_mhz.attr,
> -	&dev_attr_gt_cur_freq_mhz.attr,
> -	&dev_attr_gt_boost_freq_mhz.attr,
> -	&dev_attr_gt_max_freq_mhz.attr,
> -	&dev_attr_gt_min_freq_mhz.attr,
> -	&dev_attr_gt_RP0_freq_mhz.attr,
> -	&dev_attr_gt_RP1_freq_mhz.attr,
> -	&dev_attr_gt_RPn_freq_mhz.attr,
> -	&dev_attr_vlv_rpe_freq_mhz.attr,
> -	NULL,
> -};
> -
>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>   
>   static ssize_t error_state_read(struct file *filp, struct kobject *kobj,
> @@ -411,14 +246,6 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>   		}
>   	}
>   
> -	ret = 0;
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
> -		ret = sysfs_create_files(&kdev->kobj, vlv_attrs);
> -	else if (GRAPHICS_VER(dev_priv) >= 6)
> -		ret = sysfs_create_files(&kdev->kobj, gen6_attrs);
> -	if (ret)
> -		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
> -
>   	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);
>   	if (!dev_priv->sysfs_gt)
>   		drm_warn(&dev_priv->drm,
> @@ -435,10 +262,6 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
>   
>   	i915_teardown_error_capture(kdev);
>   
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
> -		sysfs_remove_files(&kdev->kobj, vlv_attrs);
> -	else
> -		sysfs_remove_files(&kdev->kobj, gen6_attrs);
>   	device_remove_bin_file(kdev,  &dpf_attrs_1);
>   	device_remove_bin_file(kdev,  &dpf_attrs);
>   }

