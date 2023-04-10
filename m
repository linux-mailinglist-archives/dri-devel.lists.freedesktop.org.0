Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47B6DC9D6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 19:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3AD10E149;
	Mon, 10 Apr 2023 17:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653BD10E0BB;
 Mon, 10 Apr 2023 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681146862; x=1712682862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XZPmTmj+5HH01Ka2N9ABjD6Q6IEpRj4/PU4fvfdE6H0=;
 b=N3oOOys6dWtwb7nuo2e7zyyQ5dkfMU7Th+LTkGXgvdfAzCYRxz9INpdb
 Qnk4w0YVqSoQHOzldEAIylx2lvjNmZBX6HkgEjUUFAmW7+72eSeT57a5/
 sdv038oGlCTeaDVt3N/Lg+B56hNAaMwHoYA67LKYAZnsF6x8e1IvtrjOp
 39LIu82+9qxPeWG7ISC5BxPHq04CzIRe7DoI582PYN9swxVGIGUtRXRZn
 MqwA4I9lV2Gl9V1PO/G9Nhbn9nhLbpJeo7VooOZdpQdSw0CvNWrJGDt6Y
 6V1BW7oTsmsb61TOMhN5KBJTg1id5mWTw1AlNcHWqxWf+OjGUcoT98GGc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408542583"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408542583"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 10:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752832020"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752832020"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 10:14:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:14:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:14:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 10:14:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 10:14:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0KYhmyZYsU4nThyxQEus8beUS1lT0pGgSJAGiK50FjD89RQvWvuD98pxv0doZFBS9P1EKdPFA5vTYh8bKkCT5p9oRzUb4x682JSl5nL1+SrSifRUk+vXN4y6tNDvMaKsGJo1HGOMi49uXYtYYlNjlfSkDSxB7Ie1/PAGp2SGITbV6Fwb3T1FpdJq6NwEqln9sykrxoD8QiPh8QGP+bGnoWXFCeXU3IKJbn52qw6CQoAkEZQvs2SyKCoBVxO08dRGF8inMou12D9zSaGLHN3MIcaypkOwY9pQl5gpRBw5Cx++P6bUZvneym6OSOvTCf0sfgYoWTq6wB0imBiH7b6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pZaX0UscoBdjPAgNByvUkTso9allJfFSi44h6Pcmh0=;
 b=jV3+o4lHDsprc5wj/OXa6cmoC5lKV5+BV/ARXyYXaaNtFK4fPQ7XijzlyqeVSHPGXGiCVxcJ+W+KYPIPxYp7PGSPbHPgU5MP49SwuEymPaFC7X6HwQTZVymICgo8eR81eYdmxH7VbhdQKrrg9GzDmSeGDRfemjyiSgn8nZ/bRIEr3gYbNqW8Us5Y4VbxCPYgMR+6IL9CJRMvnz/MvF9W8Sbfuel8xzgrlT13SN3rAqmwaeaCNIrjXB78Gpooe8pWZ0dtmAjWiaRvUe1rCqd5/fd7JLzmwRdu+wooa/au8eOFiUqLrAM8/5tXR3Zjm8DR5ZujkoYs9N0MUiqOFXarcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS0PR11MB8181.namprd11.prod.outlook.com (2603:10b6:8:159::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Mon, 10 Apr 2023 17:14:16 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6254.035; Mon, 10 Apr 2023
 17:14:16 +0000
Message-ID: <fc68c7f6-4306-b208-7b4a-d04b83969311@intel.com>
Date: Mon, 10 Apr 2023 10:14:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-6-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230406174419.471256-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DS0PR11MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: f93e03d0-d231-4007-7712-08db39e7034f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z5Z6lEoV7dtlf5zvsFXkWWH+g6icPy0N1GTPeSn6d24tfiWaa0N92e+hLTEL2IVQSm0wiToJ8AwK9EZr6zRcG3+A/gu+2+oz3SwhWX3R/reijwnkPC/7X9qqY8SJ0qfUmkAtn20jjxX44uftLlpKc/WRkDJQ3k/mzQfeMA/BgNwzVxWBnP+VSLgD+mgiGRyDmfUJ67hHq6N2HM7ZDFoDBoDKqabkRUeQ9Xt2QLPQK93FIsVV4UX7hQezLE/OILLAP6cNT82UJaY6hdIBamLZvhiWBqg7Z9my4yQj7OXVOt+kuqax2l+beYWgJ/90JwBz3Z2GTi9Zb6rsCQDVE3/LVWMzEZop7lno25ykJ42k3yrS1JKSzGcFKr/vI5ukMIgkPRSQw9DPhdAOKzuJADxu/4k822wYffQ38vg3WKzEFh18+NrSA6k6ZWS9g9nEJBB8Dkfvtubd75wirt6iz+u+d5GzY9a/w0TFWnazTxuVAIiYG8vFshKjKIXnmxDjXmGUQVWQ/vxgsyMwZ7of72H/ZY/hC/Rc7tHKqZAmx6Ifh8nu6mK3DMK1kPXwiM1PbX089X2MX6qLwKRssu9gar8/9A6MXvlQR6FQUlYL2Wd3uPXiY/WR70r4Z2YoskoF13XzZNgUychzMn8SN+5+gzDfkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(31686004)(6666004)(478600001)(86362001)(31696002)(83380400001)(36756003)(38100700002)(82960400001)(2616005)(6486002)(30864003)(2906002)(54906003)(316002)(53546011)(186003)(6512007)(6506007)(26005)(5660300002)(8676002)(41300700001)(8936002)(4326008)(107886003)(66476007)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjZJeEdkZGRSTXZ1dGhnVEV3VjVOMXZqTEk0T3VySjVvZlZDY3dOWVdsU0VX?=
 =?utf-8?B?VmxSSUF3WU95dWE2QzR0OU80bFJuZkFWbnNqMHNROGQvQ0w0QWtNWGV0d0ZT?=
 =?utf-8?B?bkNXNjNMeVhWTGVsa2xlWDNYQVZ2TU1KU0xtT0xXTk5ET2twNCtlTEhqb3cr?=
 =?utf-8?B?TnRJL2NmeGpONGpNQUF4ZlVzQWtCTDl6V2JYaWQ2Y3UwbGdWK3FvS01hZHdz?=
 =?utf-8?B?OFh6dXJMTm1QWnNhejYrM0E5VmFOUHZqSENCK3RyOUNUVThtdUJGMlp6bEFS?=
 =?utf-8?B?aDBEUU5PdHp0NFY3ak5IZG9YQzY3ZzN4NzZPK2FHRGFqNHRUVVMzRzFlVXN0?=
 =?utf-8?B?OUxQTk16M3BXdkg3aWxTOUlZeWprcHFFVGtQUkVsMmFEQWYyZ1EwZk1CcW12?=
 =?utf-8?B?M2tYMnZwaDlyTm5LdTBaUXJGQUdsMFh3WDRYaVV5Z1pINmZZK015UWJ5VTRY?=
 =?utf-8?B?c1hrb2RUa0VYUTdVQlUvdEpYZXdRSDJaUlZnQjcxTkZ5YVFxbVZYa3RMUmJC?=
 =?utf-8?B?cUtMa1dQa0Nndm5hRkh2RndFY1ZSOFN1Nk5KeEFyWGR5eE15VW9haC82S0Z6?=
 =?utf-8?B?Y01tTnpveWN4RlB5aVYxNHFFT2xZbEVJNFpwRjhMcjNhSjI3bU9wWDU2b2Za?=
 =?utf-8?B?U3B3UzRGRzZMaDdvRUlIenZEZGI2Z2JMbjlwNFpuMDU1d1pIaDNmZlFiT0Er?=
 =?utf-8?B?VW1rYnc4YzlpNHMxTi9CVUw0bVJOY1dDUzBoTUlLaWlwRmt0QXFnRmxTQWdE?=
 =?utf-8?B?bTIyVXo1QVN3NWhKbjRWQVdIT2ZSZEZSWExNYVFqUm9TaWlBV0l0VEtzQlVG?=
 =?utf-8?B?UFkrN3JpaGkwaGdnVFpRemdSTmFteUhpNjBkai9SM0s5QUpveVB6U0s2OWtI?=
 =?utf-8?B?UkJ1enExd3VGejFmZmYwdFREdTRpYll6VS95UlY5THJzbTh6NThIZTBQdUF3?=
 =?utf-8?B?cW0weHBpWkxoTEJKRmgrTElucmlPdkFYWWtKRkREVlFSL3dGSml5eDdrZi9j?=
 =?utf-8?B?cHllbTFvT2lYYW1MdWluY1IzbGk0dFl5R3hycmhlaHJUaEhkOHlSenlFa2w5?=
 =?utf-8?B?cWZST2d1RC9ndDZiVEUvbU9MelV0eHdlWjNuY0oyMTFJVlZpNDJlOG9MK3Vx?=
 =?utf-8?B?OENERnZ4blduZ0xsSHV1RXVyclRLSlZlWllkb1V5YnQzSWw5SFVyYmcvVkJN?=
 =?utf-8?B?Tm41QUwrZ2J6dXgyQlc2bjcrY0w3RUNZWmdPV1hHYUJoVFhpbHRZZ050T1Jv?=
 =?utf-8?B?VkRJcTZ2ZEFTYlFqbFhLZFVMd0VGMU0wQktDUVFRaWFhWFlPakZQS3NLUUNr?=
 =?utf-8?B?Y1IyZkh6czVwaEZvNFF3elVjTzdXZ2lOZ2NiMWRaLzBjUk1LcmZHSVh2d2lz?=
 =?utf-8?B?OEJzZER3MmZHOWFVUFdGUnl5cThxNjNwQzg3RUlLTWRTaGdRMXQvbDgvQlBa?=
 =?utf-8?B?bWxNR0Rjay9pYXhQU2NvWmIyelh6YUMwOVdMdXNIUWRlelBpT2diMmM2SnBQ?=
 =?utf-8?B?b05Ld3lhQk41M1E3WGQ0WU95UFFucmh1YXhCWkhiWDR0T0tTakpDM29SVU1T?=
 =?utf-8?B?SVIxbXpFaWEyaUkwMzJjV1dSS09WclhybE45ZkdJbUNPMFRSMFlpVVFtdlkw?=
 =?utf-8?B?WUxvV2xWblNkQ29kbll1RVROUFRYVi9sQWVKeFkwS2RqSnJwZFM0WHliRjFT?=
 =?utf-8?B?NDQySlFOdFhTQWRKcXBlTkVybDdUcTRQZWZvQmRzdHUxdStBc21CMnVUNk5q?=
 =?utf-8?B?RUdnTjhYZzBaMi9abDNCVUovVXh4SnVyYmRMenpuZzlMNkpraGhsS2dqNnRk?=
 =?utf-8?B?T0dneFRUdTZUUGwwOVdxWXpZanplTUdEcks4cGZWV3pQRURZUG84SXBVL2Ns?=
 =?utf-8?B?ZVhjRTk5dWp6Q0Y0UkhxVFZwclluUlRGU28weGJpRDF6Q2NGTFVzQmVqSFlm?=
 =?utf-8?B?NW92bGNoYVpUOUNVNndNR2NVL0FIaDlyY3o2Uk96Y24xckIvbElOTS9RWFhp?=
 =?utf-8?B?aGRzS1FVbUc1NlQzSlZTbk5lN2h4WGdhQjErUEh2aVFXajBaUVJtdFJrZU5S?=
 =?utf-8?B?eFhwejBZL09MWG1mdVR5RjlIRGJQSnlSd1FmR251bVVNK2xNZkR2QnVETVRX?=
 =?utf-8?B?b0M1cDVzR0RTSnA1aUVWeU5XTS81aGM2NkdYV1RiYStaV2hPdFNOS09YWEs1?=
 =?utf-8?Q?rab5W9D3K3Et/soWybctzFY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f93e03d0-d231-4007-7712-08db39e7034f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 17:14:16.1262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEeZIknxaNHL0HPmt6hn7npjIlyBAoJJDnf+R8VFgPmxPokErulECXCCIQkgimxiGQptQhaTdTiLDgKAQcx2jnIXOyyuE1Ys9JpuS+8hsXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8181
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
Cc: Juston Li <justonli@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/6/2023 10:44 AM, Alan Previn wrote:
> Add MTL's function for ARB session creation using PXP firmware
> version 4.3 ABI structure format.
>
> Also add MTL's function for ARB session invalidation but this
> reuses PXP firmware version 4.2 ABI structure format.
>
> For both cases, in the back-end gsccs functions for sending messages
> to the firmware inspect the GSC-CS-Mem-Header's pending-bit which
> means the GSC firmware is busy and we should retry.
>
> Given the last hw requirement, lets also update functions in
> front-end layer that wait for session creation or teardown
> completion to use new worst case timeout periods.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  10 ++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |   1 +
>   drivers/gpu/drm/i915/pxp/intel_pxp.c          |  28 +++-
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  21 +++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 130 ++++++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |   8 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  11 +-
>   7 files changed, 202 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 1d9fdfb11268..85f720af2f75 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -13,6 +13,7 @@
>   #define GSC_FW_STATUS_REG			_MMIO(0x116C40)
>   #define GSC_FW_CURRENT_STATE			REG_GENMASK(3, 0)
>   #define   GSC_FW_CURRENT_STATE_RESET		0
> +#define   GSC_FW_PROXY_STATE_NORMAL		5
>   #define GSC_FW_INIT_COMPLETE_BIT		REG_BIT(9)
>   
>   static bool gsc_is_in_reset(struct intel_uncore *uncore)
> @@ -31,6 +32,15 @@ bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>   	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
>   }
>   
> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
> +{
> +	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
> +	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +
> +	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
> +	       GSC_FW_PROXY_STATE_NORMAL;
> +}
> +
>   static int emit_gsc_fw_load(struct i915_request *rq, struct intel_gsc_uc *gsc)
>   {
>   	u32 offset = i915_ggtt_offset(gsc->local);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> index f4c1106bb2a9..fff8928218df 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> @@ -13,5 +13,6 @@ struct intel_uncore;
>   
>   int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 8949d4be7882..550457bbb034 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -291,6 +291,8 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
>   
>   static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   {
> +	int timeout;
> +
>   	if (!pxp->arb_is_valid)
>   		return 0;
>   	/*
> @@ -300,7 +302,12 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   	intel_pxp_mark_termination_in_progress(pxp);
>   	intel_pxp_terminate(pxp, false);
>   
> -	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		timeout = GSCFW_MAX_ROUND_TRIP_LATENCY_MS;
> +	else
> +		timeout = 250;
> +
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
>   		return -ETIMEDOUT;
>   
>   	return 0;
> @@ -308,6 +315,8 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   
>   static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
>   {
> +	int timeout;
> +
>   	if (pxp->arb_is_valid)
>   		return 0;
>   	/*
> @@ -316,7 +325,12 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
>   	 */
>   	pxp_queue_termination(pxp);
>   
> -	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		timeout = GSCFW_MAX_ROUND_TRIP_LATENCY_MS;
> +	else
> +		timeout = 250;
> +
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
>   		return -ETIMEDOUT;
>   
>   	return 0;
> @@ -354,8 +368,14 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   	if (!intel_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
> -	if (wait_for(pxp_component_bound(pxp), 250))
> -		return -ENXIO;
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
> +		/* Use a larger 1 second timeout considering all the dependencies. */
> +		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 1000))
> +			return -ENXIO;

This needs a comment to explain that we expect userspace to retry later 
if we return -ENXIO and therefore the timeout is smaller that what would 
be required to guarantee that the init can complete. It also needs an 
ack from the userspace drivers for this behavior.


> +	} else {
> +		if (wait_for(pxp_component_bound(pxp), 250))
> +			return -ENXIO;
> +	}
>   
>   	mutex_lock(&pxp->arb_mutex);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> index c65ada99e54f..09777719cd84 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> @@ -11,6 +11,7 @@
>   
>   /* PXP-Cmd-Op definitions */
>   #define PXP43_CMDID_START_HUC_AUTH 0x0000003A
> +#define PXP43_CMDID_INIT_SESSION 0x00000036
>   
>   /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
>   #define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
> @@ -26,4 +27,24 @@ struct pxp43_start_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_in {
> +	struct pxp_cmd_header header;
> +		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
> +		#define PXP43_INIT_SESSION_VALID BIT(0)
> +		#define PXP43_INIT_SESSION_APPTYPE BIT(1)
> +		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
> +	u32 protection_mode;
> +		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
> +	u32 sub_session_id;
> +	u32 init_flags;
> +	u32 rsvd[12];
> +} __packed;
> +
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[8];
> +} __packed;
> +
>   #endif /* __INTEL_PXP_FW_INTERFACE_43_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 16e3b73d0653..4bc276daca16 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -6,13 +6,46 @@
>   #include "gem/i915_gem_internal.h"
>   
>   #include "gt/intel_context.h"
> +#include "gt/uc/intel_gsc_fw.h"
>   #include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
>   
>   #include "i915_drv.h"
> +#include "intel_pxp_cmd_interface_42.h"
>   #include "intel_pxp_cmd_interface_43.h"
>   #include "intel_pxp_gsccs.h"
>   #include "intel_pxp_types.h"
>   
> +static bool
> +is_fw_err_platform_config(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return true;
> +	default:
> +		break;
> +	}
> +	return false;
> +}
> +
> +static const char *
> +fw_err_to_string(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +		return "ERR_API_VERSION";
> +	case PXP_STATUS_NOT_READY:
> +		return "ERR_NOT_READY";
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return "ERR_PLATFORM_CONFIG";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +

There is a lot of replication for this error handling, I'm wondering if 
it's worth adding a common function to handle this. Something like:

intel_pxp_header_error(u32 header, const char *op, u32 id)
{
	if (is_fw_err_platform_config(header.status)) {
		drm_info_once(&i915->drm,
			      "PXP %s-%d failed due to BIOS/SOC:0x%08x:%s\n",
			      op, id, header.status,
			      fw_err_to_string(header.status));
	} else {
		drm_dbg(&i915->drm, "PXP %s-%d failed 0x%08x:%st:\n",
			op, id, header.status,
			fw_err_to_string(header.status));
		drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
			header.command_id, header.api_version);
	}
}


Not a blocker.

>   static int
>   gsccs_send_message(struct intel_pxp *pxp,
>   		   void *msg_in, size_t msg_in_size,
> @@ -152,6 +185,103 @@ gsccs_send_message_retry_complete(struct intel_pxp *pxp,
>   	return ret;
>   }
>   
> +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
> +{
> +	/*
> +	 * GSC-fw loading, HuC-fw loading, HuC-fw authentication and
> +	 * GSC-proxy init flow (requiring an mei component driver)
> +	 * must all occur first before we can start requesting for PXP
> +	 * sessions. Checking for completion on HuC authentication and
> +	 * gsc-proxy init flow (the last set of dependencies that
> +	 * are out of order) will suffice.
> +	 */
> +	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
> +	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
> +		return true;
> +
> +	return false;
> +}
> +
> +int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
> +				   int arb_session_id)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	struct pxp43_create_arb_in msg_in = {0};
> +	struct pxp43_create_arb_out msg_out = {0};
> +	int ret;
> +
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
> +	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, arb_session_id) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +	msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
> +
> +	ret = gsccs_send_message_retry_complete(pxp,
> +						&msg_in, sizeof(msg_in),
> +						&msg_out, sizeof(msg_out), NULL);
> +	if (ret) {
> +		drm_err(&i915->drm, "Failed to init session %d, ret=[%d]\n", arb_session_id, ret);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status)) {
> +			drm_info_once(&i915->drm,
> +				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
> +				      arb_session_id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		} else {
> +			drm_dbg(&i915->drm, "PXP init-session-%d failed 0x%08x:%st:\n",
> +				arb_session_id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status));
> +			drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
> +				msg_in.header.command_id, msg_in.header.api_version);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	struct pxp42_inv_stream_key_in msg_in = {0};
> +	struct pxp42_inv_stream_key_out msg_out = {0};
> +	int ret = 0;
> +
> +	/*
> +	 * Stream key invalidation reuses the same version 4.2 input/output
> +	 * command format but firmware requires 4.3 API interaction
> +	 */
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP42_CMDID_INVALIDATE_STREAM_KEY;
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
> +
> +	ret = gsccs_send_message_retry_complete(pxp,
> +						&msg_in, sizeof(msg_in),
> +						&msg_out, sizeof(msg_out), NULL);
> +	if (ret) {
> +		drm_err(&i915->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
> +			session_id, ret);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status)) {
> +			drm_info_once(&i915->drm,
> +				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
> +				      session_id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		} else {
> +			drm_dbg(&i915->drm, "PXP inv-stream-key-%u failed 0x%08x:%s:\n",
> +				session_id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status));
> +			drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
> +				msg_in.header.command_id, msg_in.header.api_version);
> +		}
> +	}
> +}
> +
>   static void
>   gsccs_cleanup_fw_host_session_handle(struct intel_pxp *pxp)
>   {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index bd1c028bc80f..820c2def21ee 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -10,14 +10,18 @@
>   
>   struct intel_pxp;
>   
> -#define GSC_REPLY_LATENCY_MS 200
> +#define GSC_REPLY_LATENCY_MS 210

why move from 200 to 210? not a problem, I just want to understand why 
this is required.

Daniele

>   #define GSC_PENDING_RETRY_MAXCOUNT 40
>   #define GSC_PENDING_RETRY_PAUSE_MS 50
> +#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS)
>   
>   #ifdef CONFIG_DRM_I915_PXP
>   void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
>   int intel_pxp_gsccs_init(struct intel_pxp *pxp);
>   
> +int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
> +void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
> +
>   #else
>   static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
>   {
> @@ -30,4 +34,6 @@ static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
>   
>   #endif
>   
> +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> +
>   #endif /*__INTEL_PXP_GSCCS_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 7899079e17b0..e4d8242302c5 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -7,6 +7,7 @@
>   
>   #include "intel_pxp.h"
>   #include "intel_pxp_cmd.h"
> +#include "intel_pxp_gsccs.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> @@ -62,7 +63,10 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>   		return -EEXIST;
>   	}
>   
> -	ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		ret = intel_pxp_gsccs_create_session(pxp, ARB_SESSION);
> +	else
> +		ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
>   	if (ret) {
>   		drm_err(&gt->i915->drm, "tee cmd for arb session creation failed\n");
>   		return ret;
> @@ -106,7 +110,10 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>   
>   	intel_uncore_write(gt->uncore, KCR_GLOBAL_TERMINATE(pxp->kcr_base), 1);
>   
> -	intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
> +	if (HAS_ENGINE(gt, GSC0))
> +		intel_pxp_gsccs_end_arb_fw_session(pxp, ARB_SESSION);
> +	else
> +		intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
>   
>   	return ret;
>   }

