Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A6623B78
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 06:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002210E664;
	Thu, 10 Nov 2022 05:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3103D10E09E;
 Thu, 10 Nov 2022 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668059367; x=1699595367;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7eV9D9FLGbz+JxLUwEhMhKDXdudsLU3n+fTCL/PZRY8=;
 b=AJWH6m42mMmJ0lBABHFfVHEJjIL+Y28g0mDibk2JISpFc32MrIEAAk7m
 Bwqu1F662tHvojf5GhtgzAZoWDI358bVOZPDHa3waw3kz3Tf2A8cQu1ES
 M6AW1zGK5bANMQYArlvSiTaPORftwy3Gh4vW3WE9gFDcCWgfmbNrzIgcd
 +HhVe6UbfSv4wQUGIJk3KQS06peOX79VqeICHX8rfpXI8F0Wu+7L8GBAc
 eqdAZyJF4iDsP2XoxV9a4EKGaRQ0O3NzFLfxKmJ2c+oSWLKiZ9tvDudYF
 GRK9ZUsOq3sOHSoauX/i7K5hSKtEdkMboK2W1n5cNzUq4g6W/+d+Aeifq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="311219116"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="311219116"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 21:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="639482463"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="639482463"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2022 21:49:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 21:49:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 21:49:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 21:49:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 21:49:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cryBbtZxAjWvwjm7+yqFLO1G2O77MooKItNAZC/rLdR9JYcM6ILjOqyFyjG/2XHmf/W25hdaGBX0n8RQRZbio65HArMQko90sBxiRdkB74NEjKfo6yxV3Qig3W0TxcqrP8mKh9sEJEqUWa9En0YterDzmvpX3rUQYFrXo4PTbWNXPuuntI+6dnvDqvjVeClTtMcB4ZaO8GEmgnQcWpcdMmhmxlApAYtD5XRMjLwKNyiiJ8wvyy+PF2Uhb8cuMMlC4v7OXXNp4x6/t/s84reR0QjvLk0JwiOXvrL3EhV+DE6nbV36OSvTRlTe9Cw3VEmxiMpMjGnoomAsudqz+zQURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDkKobjIJOme60xuGcCuxDbXI1lVjLTcyiL5AbfKsFE=;
 b=caAhvPar0+8L7eKGopY1/7vPKc8HItoAo5pHQAU6IEE0PhjPRd14evufd5u00di6NHbaRkAgaqzTd/loYBOzCYy8l5JgAyESCu4/kImEvEndgghAhXv1Unm1KZ+jzECsxFqYoyM/ZZNQ31ovdJqmiPYHuLqEYAdlq4pvECInDalcI1AOuQ8ExMVaI3mlzilOx+TKVPN6SCpReTXJVzRkgoXivhxeZ3qzoGRGiacWz9Rlkdi09d40epeHpDJCEpkYkdU0Xc9PAJkiDb/4WdBPNATMrEVXPc+X/TwKo/6GPR4kpmHI6YhdDpwGWzPMbOF7fj5gjgEkz7TQ7zKTTYPl9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 05:49:21 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68%3]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 05:49:21 +0000
Date: Wed, 9 Nov 2022 21:49:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v6 00/20] drm/i915/vm_bind: Add VM_BIND functionality
Message-ID: <Y2yQ2T7+sILYn3rM@nvishwa1-DESK>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <7a1c8c8ba83e3e7ba286e636de0074516a099d68.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a1c8c8ba83e3e7ba286e636de0074516a099d68.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e74477-8500-4b31-1f54-08dac2df508b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZvR8SVcIDPThTGF2PW4YfyV0Kkmktu270VPJh4mAq+hRedheJ1vPPGICW2z9LSegJlmbzitluGGcbC5qtcIpn3TnJqcDrw0cxE6JbBFYW4hlxTCiwmP4yAncI2Mdk/J31dM6xwlddNR2qUbjsIGUuNBZdpbJ+lcrAVGA3UMOb/rDwxQSZkDCqemGFFKMAV4raOW/eweV3JtpdTpWmnq2AJYF+FTSWrLVKUEG/T1qKrP9KQeW2Qt/a5UL4m2gXGmyzE7vy0EC68CycmtwCkcIIGceT8RJOWqYwqnLkPX60clQZJ5PYPvrSsnKSD2uYSoVWM8f7Um/Pgvowe5AIxjHP72uM8Bu50suCNFrNvKPoyjvoSEjlwI2Eu4Sygg5MtTXqGqfYJHhkMNah0P6dtcqP+2b8FiBKCmqT/i9FTUrRyqH1oMNKiiifS/oqKWBBbz9Q/zwuchSNymjMG1t1PrHWN6jEvwzVxk80DQROKFdik5nymFkiuzfi3QGa0sw5t2pat4A3EE4GWsgh8Zx21AzaR1Ee+q/V2fjCp3FbHbuQHwx/TbujCvm9mo+eGOycNx8sH9UBaNsz8KxIlXAyvKAoSYVWJVFNtvPk23gTxxj2WvdPqef01jJOcWeObxO5vr6a/UtLDUpP1M8WZj6EE9DE26R2d0RrIGyqvMvZEfaUc3O1X7caTlOBNdlkrH+PWv1e/bW6vsdQdJiWYg9cm8gog0TY5ZL3mELY4ZsEBcLS5ZLRiiOwOJocVlQhMImkBr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(6666004)(26005)(6506007)(38100700002)(6512007)(9686003)(186003)(4326008)(44832011)(83380400001)(2906002)(478600001)(316002)(33716001)(8936002)(6486002)(6862004)(5660300002)(41300700001)(66556008)(54906003)(66476007)(8676002)(6636002)(66946007)(66899015)(82960400001)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LYDhMfJeF0wXVgICOY7H88H8oh3LGPCvSLR/A0XQLT36wEFXWM7yoWJeet?=
 =?iso-8859-1?Q?G55fu86SCDl/Nl5Q7czSjCAqkuUDTXHxV1rq06GDbmhRPHkeXuTbeZfLSJ?=
 =?iso-8859-1?Q?wfcCAvf9vF6dY2ToKb8zDqYeGernlj6HW/Gz/WoUiIGQd3IHPRqOaPvJZD?=
 =?iso-8859-1?Q?DM6HxXHRYigF4Y5ITWkXSPiracVO/F5gZAGgCAA+GnE1Tu95RPfAgvDHST?=
 =?iso-8859-1?Q?LLedPPriAkPPIyRraw1H4S5yeav6er+R6+IRWBxqrluE76iQTImoSM1Z69?=
 =?iso-8859-1?Q?S/rEHl01S2veT9KbZDxSO1lOIJUGyCamwo+9OZjtRa7n61skvfs5Nq+G/U?=
 =?iso-8859-1?Q?M4VKqXUt0bF0e5qvdPbhdLTETSEB/foZqPcmMz3ODQT4EotX9gxsZpfEeO?=
 =?iso-8859-1?Q?hkLDNXacLB1yZujVVKCGc6WxXl69vzqLSF+n9WfQyZ/Kq4mjZqy4BKWB1M?=
 =?iso-8859-1?Q?dDYE4v5/iqzA/n9cSH6AM6O+4QvLOEo8IKl5eKghdV/Ziq5A8dX5ZmBqbD?=
 =?iso-8859-1?Q?cB/XCDk1LP4VQl3OW91Yh1oSXJPCwx9JSIYQXnXqU5Z4IoktgaJ8GZUrJz?=
 =?iso-8859-1?Q?4ueonXWO0QBbH4kocuYHdP+VtPG9MBaxKsn3yvgOAHhqigApc1iiyTZ08U?=
 =?iso-8859-1?Q?s9Bb9cxQL7YKsI6Qs22SgU/I0SrGsXQ3Au6xc/Uz0IFdxGWAX747PzV8je?=
 =?iso-8859-1?Q?DuWXZMlFdMgT4WJjspH5y09PKQWQS8801Gx+CONhP93nsrcg7S3ycpbPFR?=
 =?iso-8859-1?Q?9b7fGiTRObInWfxOQhMlptRliDPUyiHOrH598xxha4TnIG3zMTs0XU6pyR?=
 =?iso-8859-1?Q?K85YVYcXIbGpecZ3K4xcwSen93DRVsbangYR024W0mQyzQUuLyYWhGdxGX?=
 =?iso-8859-1?Q?prOdMSEZX0OuS/kFAew5cAzlv1xtmQFQvyRdckZ4RHWfvr94QYvOKROGCi?=
 =?iso-8859-1?Q?VIkhFGh2c/ZvlkXDogDWMVTNVi/EADFBUoIJB7tdteJdNm2ki6aOznnVUk?=
 =?iso-8859-1?Q?tQuzv/CJU2nb8D4mlcbtHJ8LBIf8zpWvx1YpLMy5a1nie9m1a+R+oQCx7f?=
 =?iso-8859-1?Q?YvtrHgJkLmOLmCll/xpvoYStQf5Z1QUWphtxUp+lPYlIKFgdM9F0Jt6tKF?=
 =?iso-8859-1?Q?JTL3mG/OLA1I/8HEQVBTahCkWnYfwZpbD/KxINHBQaIKY2grilkVwSjMIN?=
 =?iso-8859-1?Q?A4m/awpsDOJRX/Ky+2u8mzviQh486bhlsvik/rBa7mCoXvv7/zoiHorM0s?=
 =?iso-8859-1?Q?+Oa4pi3DVcWNVNgbpN0uIsBkK86eJ91C410PoGa4PDTjYL/hSmu18qGDfv?=
 =?iso-8859-1?Q?wlAvqB1zGLIS9jyqHnzUvKEgyR1cCpmLaX1W+wnk5FTjjmbtRfE5hZD7pY?=
 =?iso-8859-1?Q?PnT7yefOI/94Nc5XgN7+q6qUuJtGI6iFjSMCrrXip08OXQ8dhyFFSsRYzW?=
 =?iso-8859-1?Q?yDQS1s1owV7hDwZouFYXDuWkPbk0m0/5jbp4dwLqQ1MG8hmb2bjI/d/6kV?=
 =?iso-8859-1?Q?diSEIZtRBZdtFqZcBOjyFMvd091mtG4mSXmRui2qV8LyXn5r5/R2oRkFJN?=
 =?iso-8859-1?Q?nfWtssX2zBqslyO0DSPyqbps5wDfdY6MNEJ1e6eiKsl891Tx9OGZSLr98G?=
 =?iso-8859-1?Q?KzBvC+TQBmjoo8TnJLqCtgrV/4F7sl8IN+2iswpHRguUPwVmzE08aqjIQy?=
 =?iso-8859-1?Q?8Vg0wZ2nx689occb0r8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e74477-8500-4b31-1f54-08dac2df508b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 05:49:21.2230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svRy3Pw2e29Aucch2j9WUkn/BidpnRQLpcbRPGGXw/waWOjaifCSqNfnjJK4J3xBGDjX9vzvvG28q83oEcsQmQciZaL+fnKoWoPwMB9ScNiAjvEbSjff4VaDi/EUuwMa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 04:16:25PM -0800, Zanoni, Paulo R wrote:
>On Mon, 2022-11-07 at 00:51 -0800, Niranjana Vishwanathapura wrote:
>> DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
>> buffer objects (BOs) or sections of a BOs at specified GPU virtual
>> addresses on a specified address space (VM). Multiple mappings can map
>> to the same physical pages of an object (aliasing). These mappings (also
>> referred to as persistent mappings) will be persistent across multiple
>> GPU submissions (execbuf calls) issued by the UMD, without user having
>> to provide a list of all required mappings during each submission (as
>> required by older execbuf mode).
>>
>> This patch series support VM_BIND version 1, as described by the param
>> I915_PARAM_VM_BIND_VERSION.
>>
>> Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only works in
>> vm_bind mode. The vm_bind mode only works with this new execbuf3 ioctl.
>> The new execbuf3 ioctl will not have any execlist support and all the
>> legacy support like relocations etc., are removed.
>>
>> NOTEs:
>> * It is based on below VM_BIND design+uapi rfc.
>>   Documentation/gpu/rfc/i915_vm_bind.rst
>
>Hi
>
>One difference for execbuf3 that I noticed that is not mentioned in the
>RFC document is that we now don't have a way to signal
>EXEC_OBJECT_WRITE. When looking at the Kernel code, some there are some
>pieces that check for this flag:
>
>- there's code that deals with frontbuffer rendering
>- there's code that deals with fences
>- there's code that prevents self-modifying batches
>- another that seems related to waiting for objects
>
>Are there any new rules regarding frontbuffer rendering when we use
>execbuf3? Any other behavior changes related to the other places that
>we should expect when using execbuf3?
>

Paulo,
Most of the EXEC_OBJECT_WRITE check in execbuf path is related to
implicit dependency tracker which execbuf3 does not support. The
frontbuffer related updated is the only exception and I don't
remember the rationale to not require this on execbuf3.

Matt, Tvrtko, Daniel, can you please comment here?

Thanks,
Niranjana

>Thanks,
>Paulo
>
>>
>> * The IGT RFC series is posted as,
>>   [PATCH i-g-t v5 0/12] vm_bind: Add VM_BIND validation support
>>
>> v2: Address various review comments
>> v3: Address review comments and other fixes
>> v4: Remove vm_unbind out fence uapi which is not supported yet,
>>     replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
>> v5: Render kernel-doc, use PIN_NOEVICT, limit vm_bind support to
>>     non-recoverable faults
>> v6: Rebased, minor fixes, add reserved fields to drm_i915_gem_vm_bind,
>>     add new patch for async vm_unbind support
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>> Niranjana Vishwanathapura (20):
>>   drm/i915/vm_bind: Expose vm lookup function
>>   drm/i915/vm_bind: Add __i915_sw_fence_await_reservation()
>>   drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
>>   drm/i915/vm_bind: Add support to create persistent vma
>>   drm/i915/vm_bind: Implement bind and unbind of object
>>   drm/i915/vm_bind: Support for VM private BOs
>>   drm/i915/vm_bind: Add support to handle object evictions
>>   drm/i915/vm_bind: Support persistent vma activeness tracking
>>   drm/i915/vm_bind: Add out fence support
>>   drm/i915/vm_bind: Abstract out common execbuf functions
>>   drm/i915/vm_bind: Use common execbuf functions in execbuf path
>>   drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3 ioctl
>>   drm/i915/vm_bind: Update i915_vma_verify_bind_complete()
>>   drm/i915/vm_bind: Expose i915_request_await_bind()
>>   drm/i915/vm_bind: Handle persistent vmas in execbuf3
>>   drm/i915/vm_bind: userptr dma-resv changes
>>   drm/i915/vm_bind: Limit vm_bind mode to non-recoverable contexts
>>   drm/i915/vm_bind: Add uapi for user to enable vm_bind_mode
>>   drm/i915/vm_bind: Render VM_BIND documentation
>>   drm/i915/vm_bind: Async vm_unbind support
>>
>>  Documentation/gpu/i915.rst                    |  78 +-
>>  drivers/gpu/drm/i915/Makefile                 |   3 +
>>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_context.h   |  17 +
>>  drivers/gpu/drm/i915/gem/i915_gem_create.c    |  72 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 516 +----------
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 871 ++++++++++++++++++
>>  .../drm/i915/gem/i915_gem_execbuffer_common.c | 666 +++++++++++++
>>  .../drm/i915/gem/i915_gem_execbuffer_common.h |  74 ++
>>  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
>>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
>>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  19 +
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  30 +
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 449 +++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  17 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  21 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   4 +
>>  drivers/gpu/drm/i915/i915_drv.h               |   2 +
>>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
>>  drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
>>  drivers/gpu/drm/i915/i915_getparam.c          |   3 +
>>  drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +-
>>  drivers/gpu/drm/i915/i915_sw_fence.h          |  23 +-
>>  drivers/gpu/drm/i915/i915_vma.c               | 186 +++-
>>  drivers/gpu/drm/i915/i915_vma.h               |  68 +-
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  39 +
>>  include/uapi/drm/i915_drm.h                   | 264 +++++-
>>  30 files changed, 3008 insertions(+), 546 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>
>
