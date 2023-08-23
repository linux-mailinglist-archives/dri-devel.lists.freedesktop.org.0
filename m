Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656BF785E9B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 19:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AF910E083;
	Wed, 23 Aug 2023 17:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F13B10E083;
 Wed, 23 Aug 2023 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692811914; x=1724347914;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=04nc97Wkx1NIHwfk6ejBCs6u3AmjKRP2U42LQB+t5kc=;
 b=NCmAJMAuJDafLnatQQKFPJhvRpLjp1iAwwdycwb2zueunhMEoI4aK7ne
 XHI3YoKkOlsfBx4/lI8kyw1WC5BvDPxP2v5tNOS5EpgawApnqSsA9y+eA
 1ikya5UUvf/gZeJzl0J0q+pOaSrBehVpAK8FYYl/Znu4lP2rYL6qLNkcB
 P74FdpM/plnIwhDKTNmdamLtMNu+bDYsG/bc/2SkDjWPSJBGX8ZNBh4N8
 rENCeClDfQpaXlRVnfuFpPwIU/bEI+iq7XSa89nNXnAOmlcI4nwXe2AK2
 8C1Tzp1VJdLGGAcX4QwOCkT90Q7rZaRpQVhc3XVwdEcRutkwhXmj5ibVk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="371640964"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="371640964"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="806790572"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="806790572"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2023 10:31:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 10:31:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 10:31:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 10:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvcZMiiWTPWD31zI0Y6j6kKkiJzz86wh61+VksA5I5zaY61yNHS+O56LlRDCy8Wy8V9GfHtk2m1fYNutxRJrQFb3awZhdzqYqd+dgIX1eJuLMFdzToPHvxCi3Dnjf0VQyGDrCl695e29LfbzQVeLeouVWWM7u67UoTjLBB2flU4gP4Geoyo36aUlGWiZqQzCcaJk3OFZbRqbn/R1baY0Uq3pjipbp4bw4wjaTTeLQ1Lyk93w814TtlKu1x4EwoL1Rgs9E6s6NEcNTYiXmQDPk8a8J2WQWhBVLi3ch8rqwXqvxsvKq2ZWQ7EPKSkfn57Gmjd/o8WQLId2+EoItZpZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvxlNqqLk0TjMvemPzQakPjxiBQoDHQ2lrAyiXLSFy8=;
 b=N4pUlM4Qr9g4/mEnojVTdu7qpaHGRGYt9W8XkukC/IRdwb8t6BfJJ58jWunkupBGeL16HuNAdNahtgLx//Ikysz9bekbkJmn9P6brVKsVQKgWm5TyhKbIKltlsJjQScjUUSYUeiE5rbUlfILCKXRFWifPB9/FK3ULoGwCBs+pEsDO1r32cAYHHCCScM0ru9Cih/8NTJVquKq+UzIA0YhW5eT39AJnYQn4cLN1b7CHJnzrBu+Yzv5ijUHWG6O83QLE/dLRHeoWZUtSVDknVcLUmZI+sctOODxAzwJP19nAE/iSeh4H46K/ARbLlX4YyJvW41eOTT7pvvMS7diyAcbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5357.namprd11.prod.outlook.com (2603:10b6:5:394::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 17:31:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 17:31:36 +0000
Date: Wed, 23 Aug 2023 13:31:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v7] drm/doc: Document DRM device reset expectations
Message-ID: <ZOZCcnwu3IOHGoJ/@intel.com>
References: <20230818200642.276735-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818200642.276735-1-andrealmeid@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5828a5-f061-48e9-4f5a-08dba3feccd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KfKslJyGa7luT674oM2KB9Q7CLsvkVt0SOFR0BMTrQRFX4wV+YfywOFa/9x25btpSaQt5IUtnqF05IAFSaMIB8ZnzuRlr65T6HnYjE5OLylHqIoAcn/+lpjjTCGNluYgedI4hIxQojGawCVHRnWDWuGTqseF0WLmlL0PimcdNqiaYyu3NG2nie5whbwUsUOkV/F6ppLWiG6RBHW9ha4xkLMI5urEkN8ItDJ7upXt3JnNx6lvXbOrJlcbhmrRuYfIQE2CxXqRvNsYbI91i508xskH8DSkMPmicAuJSX/2PoCCqD92NuUBf+Ou++bo9KV4L+XpW/VuFUCcRDBiVh1WKLUscHBJn7ILWL9s4szdiBTu4hpvl0Pm4aXjgzqTbWHCGcih7fLkqlfXQkTg6t/K/vKdsgsmesQb6SZT0sXEoyVdd7XEkpoZNhHLZCjxSfDvcwsNrqYA0osPqalM8tAcUxO7AA9gBdi1E/I9FClfY1NNhFj2yod/0aBaJkDS6QnMmQkjQuc/NlPKHPXbG2C8dZSfizRl3oLCGVWqJnfhKhf8ZFUCw8bE7c/PY3RBkKb4GoAsH8Jo7d/pQvde8Ekahw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199024)(1800799009)(186009)(66946007)(66556008)(66476007)(54906003)(5660300002)(44832011)(2616005)(41300700001)(316002)(6916009)(2906002)(966005)(478600001)(86362001)(8936002)(4326008)(8676002)(7416002)(38100700002)(6666004)(6512007)(6506007)(6486002)(82960400001)(66899024)(36756003)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dbFy7gYQY3NtU+E5yru0n+gOt99EcTgHxL5dNfiCXt48DNR9eV14JxkcjH?=
 =?iso-8859-1?Q?Yg+YysYwOm3Ai7x0jEip41icgdol6VF156tB+2vOQ0Y/KMdZxDC0KZhyg4?=
 =?iso-8859-1?Q?LGWGKT/QwFVEqtKawPXdL0rAL9RA3Fj47Q2izY3Icjs05UfUnsGQX/hYV9?=
 =?iso-8859-1?Q?0szGaGHLB0K9dj9lUs881MWwYnzBbkB5qHQ4dNoTTEp62jBS07wpNGPwOP?=
 =?iso-8859-1?Q?JGx/N/of0Uf0T3tq6cZYmxm5BeO+x0Lwqd8TTUrlp9MjFShLDwgYN/yT8s?=
 =?iso-8859-1?Q?7gJEZBbwWG/21BhlNkxjhsOIsfPQzLxFOixYUnFoa/XjbIVpjRvX27go5V?=
 =?iso-8859-1?Q?OMWfcRSp5qzmsWxCixIBBiGCkE/QiNK93WIhIQvl4V3+NvJakREXbNueCE?=
 =?iso-8859-1?Q?QYox6oxsOo8ZJ1LP+pzpZMUMnSSXJ8egwILdd6KzDoWsOv+1Tl1CauQHZf?=
 =?iso-8859-1?Q?VJ7na5Zff6stFdNVBJm5aqOsIg3Uqbvz1Ksm0pg8C7spdRIx/Wmrq5ISG5?=
 =?iso-8859-1?Q?4sJv3DPl3xJDTMQI2xlTsi5DNDoV9CMGGpSaBBqw0gRYbQgoEFkV9giUxC?=
 =?iso-8859-1?Q?bRERwMeajU6eSUxezj0jmWmRc8HZID2/X6X8PGva2098l+eVcp/8PXRApl?=
 =?iso-8859-1?Q?jvgGib84hKlgmbq5etznYHdCCk1MYl5zkWOw6d/nGt13kuy96QEtCPvN2n?=
 =?iso-8859-1?Q?pUsXHSjblY0KTPse72Amc1j0CFYapaMh+fcc1FVeuhyiH1OLeXsb4a55mS?=
 =?iso-8859-1?Q?5UDdK0dqQ/Ft2MDaJQJt/GWrfoiGImaI7cUX/X6GdTPu6aIzjhlDvYBy9J?=
 =?iso-8859-1?Q?vrBHsXUZpYMOB1iS/QNLLkQ/3g41W//VhOowk1aIx0xiTkePx6nF/ulolE?=
 =?iso-8859-1?Q?WzHmbXF9laqd2xfKDv2Q9r2hYGyjqaRIRKsw9ubSCX/WYTRr/ZtfbFMs37?=
 =?iso-8859-1?Q?QxTkAfSnjl69KAvTuLfyXY5htj9/iDINpQuWF3nH4eNQnW3pckdHNRjIVn?=
 =?iso-8859-1?Q?zEkvpez4lUnu76KHan9f82wmr1S7qTzgQOx05xnHQ3XOzoZeKqr0yEwmmQ?=
 =?iso-8859-1?Q?SL8D3Qpk6NgGg70FA1xH3UyJHI1os+yC72JqGAgqGpHDnEa0//cJB+K8H3?=
 =?iso-8859-1?Q?XfmluSEEa/wOPRPO1wCk1joUFm/PjVRIYxcawXxDS33t2BTty9kaLZ1Xtm?=
 =?iso-8859-1?Q?WYOkKKuLaIwcljyHUR0Dav6Jv4pPsOW7ZCkAbSduv8GiN+mN+/bPOjdY5g?=
 =?iso-8859-1?Q?9ADL3Oz39Kb2W+urN+iop2QiPH4lpzl/C8AryUnRNGfFlDdHCGAufP6FIj?=
 =?iso-8859-1?Q?GHZqydssAOnYsKBjPodrHgMrHOaJvgEogbIiZJWiWxYWUv0wh2k96cLOlw?=
 =?iso-8859-1?Q?wGjsnDd2eL3hxXvT6IcLjjPjinub5htLv0uCPtmqxohF7lUAbIUYm7A08j?=
 =?iso-8859-1?Q?dCK/rAfLQvBLqtfjiZr0dHPrJSFYo4IFJQJ7CKHRGSi9mCMShN3FTGdJod?=
 =?iso-8859-1?Q?eZSY84v9aL594K1Bo1G6U5EjsOYjXCf53CHgIl0Nmfyl8KuTTmJt1ujr3Z?=
 =?iso-8859-1?Q?HS5ZWmOr86bkvNpbOa27sHrbNzi8V3gqJbpsGjnncjt3DcDd5VxtlnADSy?=
 =?iso-8859-1?Q?7hId9CP9F/7CfXf4qNGVHiCSTHFjielR7QlZW8pL1ga9DuE+8ICA5rkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5828a5-f061-48e9-4f5a-08dba3feccd7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 17:31:36.3630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqJFkV5GZYqE5zrdXdY7lXIUS876p+5pY26MyKg9t2YX6Aotzx1UujAkJzyOrXOyOX0Ge9/pABFZg7TqpZp0hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5357
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
Cc: pierre-eric.pelloux-prayer@amd.com, Samuel
 Pitoiset <samuel.pitoiset@gmail.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:06:42PM -0300, André Almeida wrote:
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> ---
> 
> v7 changes:
>  - s/application/graphical API contex/ in the robustness part (Michel)
>  - Grammar fixes (Randy)
> 
> v6: https://lore.kernel.org/lkml/20230815185710.159779-1-andrealmeid@igalia.com/
> 
> v6 changes:
>  - Due to substantial changes in the content, dropped Pekka's Acked-by
>  - Grammar fixes (Randy)
>  - Add paragraph about disabling device resets
>  - Add note about integrating reset tracking in drm/sched
>  - Add note that KMD should return failure for contexts affected by
>    resets and UMD should check for this
>  - Add note about lack of consensus around what to do about non-robust
>    apps
> 
> v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
> ---
>  Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..3694bdb977f5 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
>  
> +Device reset
> +============
> +
> +The GPU stack is really complex and is prone to errors, from hardware bugs,
> +faulty applications and everything in between the many layers. Some errors
> +require resetting the device in order to make the device usable again. This
> +section describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Device resets can not be disabled without tainting the kernel, which can lead to
> +hanging the entire kernel through shrinkers/mmu_notifiers. Userspace role in
> +device resets is to propagate the message to the application and apply any
> +special policy for blocking guilty applications, if any. Corollary is that
> +debugging a hung GPU context require hardware support to be able to preempt such
> +a GPU context while it's stopped.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to perform
> +it as needed. Usually a hang is detected when a job gets stuck executing. KMD
> +should keep track of resets, because userspace can query any time about the
> +reset status for a specific context. This is needed to propagate to the rest of
> +the stack that a reset has happened. Currently, this is implemented by each
> +driver separately, with no common DRM interface. Ideally this should be properly
> +integrated at DRM scheduler to provide a common ground for all drivers. After a
> +reset, KMD should reject new command submissions for affected contexts.

is there any consensus around what exactly 'affected contexts' might mean?
I see i915 pin-point only the context that was at execution with head pointing
at it and doesn't blame the queued ones, while on Xe it looks like we are
blaming all the queued context. Not sure what other drivers are doing for the
'affected contexts'.

> +
> +User Mode Driver
> +----------------
> +
> +After command submission, UMD should check if the submission was accepted or
> +rejected. After a reset, KMD should reject submissions, and UMD can issue an
> +ioctl to the KMD to check the reset status, and this can be checked more often
> +if the UMD requires it. After detecting a reset, UMD will then proceed to report
> +it to the application using the appropriate API error code, as explained in the
> +section below about robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep a graphical API context working after a reset is if
> +it complies with the robustness aspects of the graphical API that it is using.
> +
> +Graphical APIs provide ways to applications to deal with device resets. However,
> +there is no guarantee that the app will use such features correctly, and a
> +userspace that doesn't support robust interfaces (like a non-robust
> +OpenGL context or API without any robustness support like libva) leave the
> +robustness handling entirely to the userspace driver. There is no strong
> +community consensus on what the userspace driver should do in that case,
> +since all reasonable approaches have some clear downsides.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
> +interface tells if a reset has happened, and if so, all the context state is
> +considered lost and the app proceeds by creating new ones. There's no consensus
> +on what to do to if robustness is not in use.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
> +This error code means, among other things, that a device reset has happened and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, it's
> +really useful for driver developers to learn more about what caused the reset in
> +the first place. DRM devices should make use of devcoredump to store relevant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>  .. _drm_driver_ioctl:
>  
>  IOCTL Support on Device Nodes
> -- 
> 2.41.0
> 
