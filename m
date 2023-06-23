Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3B73C1E2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A58D10E0F2;
	Fri, 23 Jun 2023 21:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936EF10E0F2;
 Fri, 23 Jun 2023 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687554420; x=1719090420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GmT/HBPGAWLoIEgpivFbBYKs5o6+nx2qDlFUTOS9oy0=;
 b=Qb/DIRQFnQzIwkOZ1+0EQQdl9CwwjHEFzMjZC1AxJu2Eeek8MCZELBIi
 xjsQkfz25woWwJmLQOiMhb4g3ne0rTyghBK/WYN/eV4KE7yqwPby4+mvR
 avaK0ec3bNBEiYZQvIKJRcWHVyfVDn7givHJmWOoM+M1NkD08jHEmpnHf
 n5SAHS5F5MRocPxdXIClAZ0LUUIfhQXNcqMpFqOZ2lbBoYQ/cbevr56KL
 KerrssnoPmg20q/eEaXuT4i/Ry9MQ+Q8DijdWfYqf5cyqy4JUcQ6vsmEH
 232UF+I8eNaIJds/v6vOm5goCqLYPFL8TpChmV7VsfNIMYtf3Ft7l9XWJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="358351716"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="358351716"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 14:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="715436320"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="715436320"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2023 14:05:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 14:05:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 23 Jun 2023 14:05:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 23 Jun 2023 14:05:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 14:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OieWKlBtZ0B46NAwhj2+SlImhKCWMtnKPv32omnOg03m457m177fvOqXP+ZsMGg+fBOxb9MOwYS42DbJ+rADowikC80q11G7jw93BEZqtT6vpHF37/CsnHgCEyJacJnJ2sVaVchJ0E+wG+iwFdKEj9rLHtnxLre7Kte1sr1om2jitn1u9mHf76HukaX3El/iogty1kgQTziZUDJin2WdMI+L1/XtIYsP/4/nhtnAebn6lD+zn/VcVDkn6n4PeAvy8RAyLyFAQErYrEeBRkBi/kzBApMLVt+kyYrh0SjVOsUTqgSum/MKmCfQ3eq/iOuE8Lsflt97rZ1k4fB3bj7kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shQr/bnFLYoTkl778pTTco7G+EEkTnChwu51+Y0uDxI=;
 b=HuEDXRVz/ZF4qbOrFKmlk7aRNRgY19WExL18bFUbpiKzHKIEsFjj/A7V4sde29F46CxymRRaL+Z7MkM77HUT6KAKmDT8b+Ne3RhG5CI8mOj747GTEIE4d8kZTqXG/8OwRuvCB3+j+EEX8fWPqT2ofWjP1TMhF30JqJKeHeBg22qYOmB2hTaGnyQO836LdrsNsvhvsKny85sGx4k4FJ9b9zfKlEDPplopMeeWoV2V51IjkMgkrgHAC40andPvjxdN/YVwcUIPodeyIyA/bUhQJi6brwJWI1gEjHjzptENvR0/IztJI+CEGPfxp2WD8mPOXSsX1DMohVtoQ7p7aUCwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 21:05:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Fri, 23 Jun 2023
 21:05:22 +0000
Date: Fri, 23 Jun 2023 14:05:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kenneth Graunke <kenneth@whitecape.org>
Subject: Re: [PATCH 2/3] drm/i915/gt: Fix context workarounds with non-masked
 regs
Message-ID: <aet7uj3ldnjk5rdgc2fwsn42uqgx5kbxau3efvdgmnhq473s2m@d6uyzwskmfaf>
X-Patchwork-Hint: comment
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
 <3337022.2OMYdDKdcH@mizzik>
 <ehp36knxqfilobajjyk54oamk3n43s3cja5webx3q4jzm6xrlm@idrattdnr3fa>
 <2063427.kFxYfkjxrY@mizzik>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2063427.kFxYfkjxrY@mizzik>
X-ClientProxiedBy: MW4PR04CA0195.namprd04.prod.outlook.com
 (2603:10b6:303:86::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bad4b2-4ad7-407f-e333-08db742d8ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJ6YZcNsfZnuN+ByffkyvfBz8DwyNrW6dRRfprke5f2+iJkOtp0LYwbr6LOdUNN2p18LRmQMGX1vJgV8AJvbexVpSvktev1Q5iuM4FzBw1kxz1fR7SZcUXcT1byh3VBj2w1fYP/R/c8XEP/KX4WizewvxKVIpjKqPJO8SgfU5DUlrE3Fostq2t6lUaRhvptCDqbvHGezV1uoPu+ckqd7ZCLBEV5I2tY1Y622HEjVNhe76sf56tVoPp74aB/p6KefaDDtFhKn4hd2yoUCuL3jY/3ZbxeWer/Uij/qcqZ1pSjOUYp4YSeJOyKid4N8iXkVQzpgZQsTpjpcXZmKawGQD0LItmla33PJTnJBkYnNy7rESYCXUQuGGgnxpOXgpCja14HN5FA7iBtdcn+knROJafhlLO2FaOA2EnVtum9E38ENs4kVY4kjf7yucCKVL4TuRwDClCVsPXE3AadJYbw8NnP0Oi5mRxN5EmBbqH2Vxb6mngSf9faMbbo9JcmmNocKKxYDPabD05d373dl7hm2zcsNKJY1gR2OmZV1Nnb96QMBJD+counAr5k2/ZHh4NN2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(2906002)(33716001)(6486002)(38100700002)(82960400001)(83380400001)(6512007)(26005)(9686003)(186003)(86362001)(41300700001)(6506007)(316002)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n6GGl1/kALmlaCFKX1tuWnbY9ddDcAUdLijfDhzQfNHscpnGav7baXGdVPMg?=
 =?us-ascii?Q?awqNiv4VRe/Vbid9+e+SYozVZttkJBrOtu/vnm9NLACGCVYSY49X7e2c2WcX?=
 =?us-ascii?Q?v/bSkWwf1Aws6EqSTH88hO14/LgLoeFL3K0oYFXHIkCQyBR/+b4HRKlZ9FIC?=
 =?us-ascii?Q?Kuk4pRdyoQK6Ioa2KfOshRxhpvQuf2W3IKVTNI5JSQGTR4d4SlMkT3rFKOz3?=
 =?us-ascii?Q?vnDgr4DUuqahtor3zosVEg+1LH84qkXvpy0HlL/8lcsQtB3GqdTl0LhsYBdZ?=
 =?us-ascii?Q?yCmna9hBcsUQ0LD+6xwig699g3u31Braf8svlSpuN7RJ3OYhnNFPUgaDd4Tk?=
 =?us-ascii?Q?yxgn31UN9VBZDZKQwZxGbxi/anGoIhOOdBgTcv7kQIUWpDxn6wWc+WomCNA7?=
 =?us-ascii?Q?BqYb/BvXaJEHiIcguX8Y6UyNuRXlNktkoGAugQ+UJIViQccGU0FHrBme/bti?=
 =?us-ascii?Q?KSo7oIW09uWkx5NCpngi0GI8d8WunO2emA1i0nDaOBj8G317JD8jVIu5Z9iY?=
 =?us-ascii?Q?+nP9zrIw83ElG6sKhxpkMb+SwceoycdMLI389rxM1fvY+iUcCVnYzcl3wePi?=
 =?us-ascii?Q?7RtWOY/nXSnPgCYptA6C6jbWzARt9TlJhR3bo5JwsQdGhwKF68/4LExbIqqf?=
 =?us-ascii?Q?E1HG/yVJWePSR//Oe22Waut5mlYAf4eOGTEo9u0iYHr9FSj4GTKwCz+YmAJX?=
 =?us-ascii?Q?QYdsQNnBc7YHXNOuqSI49k1p/aBjYd/Qg2Jlgf2hTgHC9ZlkyyYIeWRFGipK?=
 =?us-ascii?Q?mAjf2ZBnZfaNwmQBTcBCu7j6XM4IArRkm2Pn1KVF6u9T7u5fMTzCdXfXPQX0?=
 =?us-ascii?Q?8ApJV5umZsBGYVMk9S0KXR/emVutAyCh0E77CHGrOGNI+2Aab6g+nClWZPeV?=
 =?us-ascii?Q?c1TGlPe+L7QMIxrvYUvnd/VvJNOAKOLyhl/LUDb7HQA1rydJjwLODtAl5LUJ?=
 =?us-ascii?Q?rJCN5pf0l2NbbDjJLw/lenRtjT4p7aS2bxAqRw/vHp9e0EndDffc3gygqnW7?=
 =?us-ascii?Q?7cnz1stuC42hIHDgFhWxkJwL0v5kV8mJShzDzKbsFWsCvut0/B+Cc4w5DyTx?=
 =?us-ascii?Q?nbpFlfak5guRatlSqOH0k31wBEACYwKOewrwaNIGkqZyIXRzIbs7MNR90gFd?=
 =?us-ascii?Q?tYvZMqZeaOjIEzWD8gzJUjyBjlmLIcRjiIBrrRFzd+8anGS60W99OvZ2i+Wp?=
 =?us-ascii?Q?x/dZwmYGQdjIQTfkQXNIWAqNa0VLRw5fpjVTIvfLFzFQ+lHXJGaLwWFCGpV/?=
 =?us-ascii?Q?jetmqLIcOxR1LiNh6CMiQnlEXAEnvJ1Ysce5zKABP9u8EmzDFoxMN4rVKNeI?=
 =?us-ascii?Q?f44tfO/OaeLwnBtFYopOGFM4IO4viKzszKTpiNodRmGfHFj38X8COyZ6TO6i?=
 =?us-ascii?Q?QmKzL42rP39VXriboYDosUQQr49fbpXZw+8vaoNWDAh6dzsVAyPq4cllxuU1?=
 =?us-ascii?Q?wNn3IzP9e68LVrircgsN6PTDQJUoXDU8udXUsheMUPYVliYCKFft5NzYSEel?=
 =?us-ascii?Q?xVeLEHppiRnXax3fksVbIi/2sIxKlQTU4nVyKPXE/B8vU3uhirUv5wsC3E+/?=
 =?us-ascii?Q?XA90duzESP+KSebEis5GyjAQymFKtqddTnk0WQB/qKepqmrnZlpc7gzDs3H8?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bad4b2-4ad7-407f-e333-08db742d8ebf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 21:05:22.1996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QME1Qg1rJdTPMACOYcdiwaendTTo+qgSV/0qU/5PASNjbmJZpo++u5WvfUIRim/PfwL0vrWghbZ+FjVynPF+o/snFfkYtLO9J4mNzuOiLH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 12:48:13PM -0700, Kenneth Graunke wrote:
>On Friday, June 23, 2023 8:49:05 AM PDT Lucas De Marchi wrote:
>> On Thu, Jun 22, 2023 at 04:37:21PM -0700, Kenneth Graunke wrote:
>> >On Thursday, June 22, 2023 11:27:30 AM PDT Lucas De Marchi wrote:
>> >> Most of the context workarounds tweak masked registers, but not all. For
>> >> masked registers, when writing the value it's sufficient to just write
>> >> the wa->set_bits since that will take care of both the clr and set bits
>> >> as well as not overwriting other bits.
>> >>
>> >> However there are some workarounds, the registers are non-masked. Up
>> >> until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
>> >> set_bits to program the register via the GPU in the WA bb. This has the
>> >> side effect of overwriting the content of the register outside of bits
>> >> that should be set and also doesn't handle the bits that should be
>> >> cleared.
>> >>
>> >> Kenneth reported that on DG2, mesa was seeing a weird behavior due to
>> >> the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
>> >> the GPU idle, that register could be read via intel_reg as 0x00e001ff,
>> >> but during a 3D workload it would change to 0x0000007f. So the
>> >> programming of that tuning was affecting more than the bits in
>> >> L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
>> >> context workarounds due to the use of MI_LOAD_REGISTER_IMM.
>> >>
>> >> So, for registers that are not masked, read its value via mmio, modify
>> >> and then set it in the buffer to be written by the GPU. This should take
>> >> care in a simple way of programming just the bits required by the
>> >> tuning/workaround. If in future there are registers that involved that
>> >> can't be read by the CPU, a more complex approach may be required like
>> >> a) issuing additional instructions to read and modify; or b) scan the
>> >> golden context and patch it in place before saving it; or something
>> >> else. But for now this should suffice.
>> >>
>> >> Scanning the context workarounds for all platforms, these are the
>> >> impacted ones with the respective registers
>> >>
>> >> 	mtl: DRAW_WATERMARK
>> >> 	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
>> >> 	gen12: GEN12_FF_MODE2
>> >
>> >Speaking of GEN12_FF_MODE2...there's a big scary comment above that
>> >workaround write which says that register "will return the wrong value
>> >when read."  I think with this patch, we'll start doing a RMW cycle for
>> >the register, which could mix in some of this "wrong value".  The
>> >comment mentions that the intention is to write the whole register,
>> >as the default value is 0 for all fields.
>>
>> Good point. That also means we don't need to backport this patch to
>> stable kernel to any gen12, since overwritting the other bits is
>> actually the intended behavior.
>>
>> >
>> >Maybe what we want to do is change gen12_ctx_gt_tuning_init to do
>> >
>> >    wa_write(wal, GEN12_FF_MODE2, FF_MODE2_TDS_TIMER_128);
>> >
>> >so it has a clear mask of ~0 instead of FF_MODE2_TDS_TIMER_MASK, and
>>
>> In order to ignore read back when verifying, we would still need to use
>> wa_add(), but changing the mask. We don't have a wa_write() that ends up
>> with { .clr = ~0, .read_mask = 0 }.
>>
>> 	wa_add(wal,
>> 	       GEN12_FF_MODE2,
>> 	       ~0, FF_MODE2_TDS_TIMER_128,
>> 	       0, false);
>
>Good point!  Though, I just noticed another bug here:
>
>gen12_ctx_workarounds_init sets FF_MODE2_GS_TIMER_224 to avoid hangs
>in the HS/DS unit, after gen12_ctx_gt_tuning_init set TDS_TIMER_128
>for performance.  One of those is going to clobber the other; we're
>likely losing the TDS tuning today.  Combining those workarounds into

we are not losing it today. As long as the wa list is the same, we do detect collisions when
adding workarounds and they are coallesced before applying. However,
indeed if we change this to make clear be ~0, then they will collide and
we will see a warning.

Applying them together in a single operation would indeed solve it
with a side-effect of moving this back to the workarounds. Either that
or

a) we handle the read_back == 0 && clear == U32_MAX specially when
    adding WAs. If that is true, then the check for collisions can
    be adjusted to allow that.

b) we give up on this approach and proceed with one of

	1) scan the ctx wa list. If it has any non-masked register,
	   we submit a job to read it from the GPU side. MCR will
	   make this harder as the steering from the GPU side is
	   different than the CPU

	2) emit additional commands to read and modify the register from
	   the GPU side

	3) find the register in the golden context and patch it in place




>one place seems like an easy way to fix that.

I'm leaning towards this option in the hope we don't have have
another GEN12_FF_MODE2 in future.

Matt, we've been pushing towards separating the tuning from the WAs, but
here we'd go the other way. Anything against doing this for now?

thanks
Lucas De Marchi

>
>> >then in this patch update your condition below from
>> >
>> >+		if (wa->masked_reg || wa->set == U32_MAX) {
>> >
>> >to
>> >
>> >+		if (wa->masked_reg || wa->set == U32_MAX || wa->clear == U32_MAX) {
>>
>> yeah... and maybe also warn if wa->read is 0, which means it's one
>> of the registers we can't/shouldn't read from the CPU.
>>
>> >
>> >because if we're clearing all bits then we don't care about doing a
>> >read-modify-write either.
>>
>> thanks
>> Lucas De Marchi
>>
>> >
>> >--Ken
>>
>>
>>
>


