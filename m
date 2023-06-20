Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC048737373
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA0010E314;
	Tue, 20 Jun 2023 18:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A925510E313;
 Tue, 20 Jun 2023 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687284188; x=1718820188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q26PdLKjmruhrx2IjIayzJ8ibcZXzoU/Lsieqj2qfF0=;
 b=Sms77VMmvfKY+XYiIzWGyF/Pn9Gc0WFbaP1jQdkMkSsyPW6dAo/PWD6N
 5cbrC+GcDHdHbLy5lv0eP8Nq8rA4Pt6tq3Vl1Zms6/c2kQGRdz+2R/0wn
 uLNr0eicc1xpBBmwmnL91KmU7zyS98H7sShqIgWiP3ENuneG2yPmgh4QA
 9rP7JHrIT5OKPOg/Z3W74gh4FTAQmL9mu2YSvZKuHd4ezPxWBbk1n7BP/
 OUHks54Nr0qRLoQJsWzlGaVYKsM+h/oyfqnAMFwg1BbTCuNf/EiDNzVNO
 jpmKIrkyqzbTYONx1zIzDgKbi1J+PbUEO1LY5pLkTafKz9eo9vwV8venL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="425898561"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="425898561"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 11:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858677105"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="858677105"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 11:02:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 11:02:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 11:02:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 11:02:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 11:02:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRqRjfpyNwJiVbtnCXlUYhe5ICtxxSvZHh5QDP7wfYxKyS5FF/q8Vqyt+EHBWGo2V98/soDXaFUYeiAWzs2M4+0szS5biq0YzhRO5NfO6YGYTQT91akXy814Cf95vVqIjTmlKx/AdLXfB+cRTuUclT5jPoCO7rU9bTQy64Kt4UFCanwCqfQLHPaeqKgIx0/TQ57csopSMxlu1tICYxE3aL8hx2J9N2TqF+iUkHDl6FC+t4baLf2HwsZ30P3/gJQKlf2IWM6XVl2fF7uBntl48BOIk5N6usSJWaSwR57J2sNO30vo9pwD/6pedO1oQ76yOBr+2m90N+ZwZ87suuCOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQCyHS2wyurrmL1O3hojqRzpZ59mU42n7rlUmErzEMQ=;
 b=PHIonu86TmIYTQQXfOyitByamJmytNorGXaqIhlW0k57YJwYajIhe4WgPrXIIXy8UA2Q5fmAPCyPrz/7Jy2kpjZYO+aD6xTDNb/cWJzWdaydCpGGNc1gjZKESjFI/8yUOio78Dhde98FQ6MqP6gnsdYR8xcGa7HpkssJ+XrvszxsWtZtePRFI7rFt3vLT01aDhWV/TTnEB4vwOgU35AuJHnFerVHFwNOzt+9SD7NmefP+m55LHmehLlbAG18yoW4e+xUxZ8R/m+ts7ksRHnFhc+F+1nnjNUUv/RBS6Gf2/T1kHOYQdJHapJVROwSPo3Dn9/fNmrdXYvH7MQ6k6gkdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 18:02:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 18:02:28 +0000
Date: Tue, 20 Jun 2023 11:02:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and
 BIT macros
Message-ID: <itxb3tdwvyxzwlzvvbwv75jssjwfpve2k4b4bcfzyp5x5rb6wu@tzlzdn6dem46>
References: <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
 <ZF4j0NPoBGMBT8CO@smile.fi.intel.com> <87mt29kc34.fsf@intel.com>
 <ZIs0CC2J7nu0LHEK@smile.fi.intel.com> <875y7igph5.fsf@intel.com>
 <ZJG91zMQW3Rnvdbe@smile.fi.intel.com>
 <amgwl5mthhqgvgkqnor6tjfcr3x3pgwvpqin5efwwjfpdhvvpa@vhzhiq5mzsdg>
 <ZJHkthMktY83pwvy@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZJHkthMktY83pwvy@smile.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:303:dd::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: f57df83b-56ce-4115-e33b-08db71b882ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGBcruQKVaB7vU52hyOMStCA4BnYoM1jIAIIxX7bPyJV5gRbGCNqE5sJPhzC2h0mWX5rL0Xd/IYzXtNCosvxBiHMt4LIqTZVDu7l+XZaiJPAbA6JT+7nHmi1T/Ywsinddgas+YKQbVqgT6U3tGKVLl403qkDZkvbzXNPn/LsYJBE96w2Z0g94CjtLSDJ+l3SyqE2EK/iMQWbNxPxzymGSoF5i0YYaPFNltF8U9zTzIBeH8N2t1ueENqze2oxWUrKpL5PAej6yw6RoIUsXzYXGe4O2ylITrf91kbWNpObY+VO5SwZG9xZRIM6JunqJYG1CBgbry7XK1qOlA3olboQm68qfpuPEUMI4AnYczIs1U2TRiSE0nhXpaRouI4MRjbRCcOySqYNmoY+QkkDcNDt0QwVvp1qED2HtR0pgd1Rf8aJZ+at5v87mFDgePeXolcjFjxWp+ZtoF/Pgmmz/lRjsmLn5mUlPFzT536IekosSvlJVva8tLyPw24ZAfXe089naweIxS6Y3ZhfugG2tHMksJcLK1cPhtuYJtFM+vJmvGcJaKzJVQv/og4UNNb1672+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199021)(38100700002)(82960400001)(86362001)(478600001)(6512007)(9686003)(186003)(6506007)(26005)(2906002)(8936002)(8676002)(316002)(7416002)(5660300002)(4326008)(41300700001)(54906003)(66556008)(66476007)(66946007)(6916009)(33716001)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QedjxB2CVfjvmK47jaxKL84l2aLofUUQGVW94fZDxTTciXuZ6UzCWDKVvhVy?=
 =?us-ascii?Q?wA5g/ti2Vmkr3HtOjo3h3hrrH1RdwdVPYUjyqa6vcAAAxqWjkC/guedFx5bq?=
 =?us-ascii?Q?6Cb3vdst3KU4R5b/eoAER1mksSIkHB17KFaT3S3ZUPDJKW7L+bVh9JWpczhi?=
 =?us-ascii?Q?5SP9aIg7Cgr9Ux8W8/3hQ/0xXHLeywqSFODkhsA4tEHJAkp8A2B3gTtuq858?=
 =?us-ascii?Q?/u7KDeDXm6uWgCiIs/c/aQXdL7MQy/Mwn2s9XmKhB9e2MFALnIbVbUSoI5OE?=
 =?us-ascii?Q?ZCii7AzGirADQd8Wz9MHudlFSigqn9TCLXgTRSMXJQuZquACxF7PobXhO07x?=
 =?us-ascii?Q?l6epUoLRADQbx9a7JLWW3TOU3N0P2ilL/a6hO1qYwCuJMv06KXYC/0Uma0Uk?=
 =?us-ascii?Q?SKBZ/qbHUqG8f/cER6P5qrKogKAXnWxuCcqrgogzQ5ikUv9uJsvJFLrnjH4Q?=
 =?us-ascii?Q?ttiW/wlY6rnbIGBvjgZamTL10LG7W+mUx5DVWd6ZbVGS4OM53I7KOLochvxy?=
 =?us-ascii?Q?8rvjNdAjlDUYcfrPxYLzRV7T9fpEPRbvmT2+veOIMFauKjUGn5HqneIF8bxs?=
 =?us-ascii?Q?NNxxPc1IL9EU5jZvpOGe9kxcs8Rqb6NGl/TSruySMnnYWEsAf/taq6S3Mnnd?=
 =?us-ascii?Q?aFXCa3FqlAA9YrB4tmgsSN7Ii8aDGHxK3Hluy88Uvxrv3d+IQu4RtbNL1ADY?=
 =?us-ascii?Q?V/vGr0crOOqL19VFnTAZBcOYQWTXqSomfwOKiBB8UONkp1SiF4dywMzYh23T?=
 =?us-ascii?Q?FQpxL12HYa0MtLgSqWBz8nFlXDhBsRf7uPZQ6adbRqZ1m0emeQqRtODGzWHg?=
 =?us-ascii?Q?e+cw26l4wAd/nGKpQ9UHyWgkuWGjm+EbYF07R7Se5IT/PHS5ThfOIJuELV17?=
 =?us-ascii?Q?ed0BrI3Pnj8YJ3DJWbHQLfxpq3EU3dBDRHiRIHrXXjO0AUsjtRrc4twpUyTo?=
 =?us-ascii?Q?/W5eb+tLUYUOYcNuZdl36OeLpecesMiwX9kvoFKxM4EdnTm5IR1H/0frJiGI?=
 =?us-ascii?Q?sEIITYpTQ4ZUg89Rty4DkHtsrFhxYoik/cidXC/7POv8HsaiahvJ865GSVHq?=
 =?us-ascii?Q?QJpKC/6SBt00QwepL92gxpYH/yopgjkcbXo7BM+nqplYm0JIE3QREiJCGN7h?=
 =?us-ascii?Q?sjQUSiGhUggmaAe8dAGoUnJJmLD1YgbIAscSiki+3pvpiX6PN21igpnngQL4?=
 =?us-ascii?Q?EpgkFPW0mPdculgBdd24AfdxUWH33T8V2cO3+Jratl/OmfkdAMCMRseSWT8X?=
 =?us-ascii?Q?VXipKQjl99f0FhKB33KRYlMz92P6C+AjMptYz/E+OKd83pBiXUdlJKz00ubs?=
 =?us-ascii?Q?Nl30G4wMzo7m0686HHj9YxkwlHwYV5SsgmBd5x2eZyEOwTNVoIR33sGhuR/y?=
 =?us-ascii?Q?vf6MmSFqRvTclVzzD7vMVsMOngkcQNUGaXKLzGl81QMpV214URS2xKqIcX0O?=
 =?us-ascii?Q?RZewRQUSl8PKvocB9QAsY4ke3pFdmgjgrS66JZUjIrss/n5T/DaKcHHNy09P?=
 =?us-ascii?Q?9/95r3UXDc4zUrPhJ8i6an+N6w96ioMpjHOxY8iTKg/U/MLohqXGPbOvmf5e?=
 =?us-ascii?Q?u1GumkmevTyRTZ3zpoj+phYaBkgS3yDrQcaE6v88gtER/um01OpB8U7/wZa+?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f57df83b-56ce-4115-e33b-08db71b882ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 18:02:28.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdzEgRi3xKlfUfRe8iOpOjmHFu2fKA0jE2/UPPAHd6liODoOFYP2uuhITpyPp3oUAkEei2rKGjqw7Wcwqfo4MLxgKv6UE++kHVCb3T1o8Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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
Cc: intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas
 Gleixner <tglx@linutronix.de>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 08:41:10PM +0300, Andy Shevchenko wrote:
>On Tue, Jun 20, 2023 at 10:25:21AM -0700, Lucas De Marchi wrote:
>> On Tue, Jun 20, 2023 at 05:55:19PM +0300, Andy Shevchenko wrote:
>> > On Tue, Jun 20, 2023 at 05:47:34PM +0300, Jani Nikula wrote:
>> > > On Thu, 15 Jun 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > > > On Fri, May 12, 2023 at 02:45:19PM +0300, Jani Nikula wrote:
>> > > >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > > >> > On Fri, May 12, 2023 at 02:25:18PM +0300, Jani Nikula wrote:
>> > > >> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > > >> >> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> > > >> >> >> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> > > >> >> >> masks for fixed-width types and also the corresponding BIT_U32(),
>> > > >> >> >> BIT_U16() and BIT_U8().
>
>> > > >> >> > Why?
>> > > >> >>
>> > > >> >> The main reason is that GENMASK() and BIT() size varies for 32/64 bit
>> > > >> >> builds.
>> > > >> >
>> > > >> > When needed GENMASK_ULL() can be used (with respective castings perhaps)
>> > > >> > and BIT_ULL(), no?
>> > > >>
>> > > >> How does that help with making them the same 32-bit size on both 32 and
>> > > >> 64 bit builds?
>> > > >
>> > > > 	u32 x = GENMASK();
>> > > > 	u64 y = GENMASK_ULL();
>> > > >
>> > > > No? Then use in your code either x or y. Note that I assume that the parameters
>> > > > to GENMASK*() are built-time constants. Is it the case for you?
>> > >
>> > > What's wrong with wanting to define macros with specific size, depending
>> > > on e.g. hardware registers instead of build size?
>> >
>> > Nothing, but I think the problem is smaller than it's presented.
>>
>> not sure about big/small problem you are talking about. It's a problem
>> for when the *device* register is a 32b fixed width, which is
>> independent from the CPU you are running on. We also have registers that
>> are u16 and u64. Having fixed-width GENMASK and BIT helps avoiding
>> mistakes like below. Just to use one example, the diff below builds
>> fine on my 64b machine, yet it's obviously wrong:
>>
>> 	$ git diff 	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> 	index 0b414eae1683..692a0ad9a768 100644
>> 	--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> 	+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> 	@@ -261,8 +261,8 @@ static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
>> 			 * No need to save old steering reg value.
>> 			 */
>> 			intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
>> 	-                                     REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
>> 	-                                     REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
>> 	+                                     FIELD_PREP(MTL_MCR_GROUPID, group) |
>> 	+                                     FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
>> 					      (rw_flag == FW_REG_READ ? GEN11_MCR_MULTICAST : 0));
>> 		} else if (GRAPHICS_VER(uncore->i915) >= 11) {
>> 			mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
>> 	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> 	index 718cb2c80f79..c42bc2900c6a 100644
>> 	--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> 	+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> 	@@ -80,8 +80,8 @@
>> 	 #define   GEN11_MCR_SLICE_MASK                 GEN11_MCR_SLICE(0xf)
>> 	 #define   GEN11_MCR_SUBSLICE(subslice)         (((subslice) & 0x7) << 24)
>> 	 #define   GEN11_MCR_SUBSLICE_MASK              GEN11_MCR_SUBSLICE(0x7)
>> 	-#define   MTL_MCR_GROUPID                      REG_GENMASK(11, 8)
>> 	-#define   MTL_MCR_INSTANCEID                   REG_GENMASK(3, 0)
>> 	+#define   MTL_MCR_GROUPID                      GENMASK(32, 8)
>> 	+#define   MTL_MCR_INSTANCEID                   GENMASK(3, 0)
>> 	 	 #define IPEIR_I965                             _MMIO(0x2064)
>> 	 #define IPEHR_I965                             _MMIO(0x2068)
>>
>> If the driver didn't support 32b CPUs, this would even go unnoticed.
>
>So, what does prevent you from using GENMASK_ULL()?

nothing is preventing me to write the wrong code, which is what we are
trying to solve. GENMASK_ULL() would generate the wrong code as that
particular register is 32b, not 64b, on the GPU.

>
>Another point, you may teach GENMASK() to issue a warning if hi and/or lo
>bigger than BITS_PER_LONG.

Which varies depending on the CPU you are building for, so it misses the
point.  GENMASK_U32/GENMASK_U16/GENMASK_U8 and BIT counterparts would
emit a warning if hi is bigger than _exactly_ 32, 16 or 8, regardless
of the CPU you built the code for.

Lucas De Marchi

>
>I still don't see the usefulness of that churn.
>
>> Lucas De Marchi
>>
>> > And there are already header for bitfields with a lot of helpers
>> > for (similar) cases if not yours.
>> >
>> > > What would you use for printk format if you wanted to to print
>> > > GENMASK()?
>> >
>> > %lu, no?
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
