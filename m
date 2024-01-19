Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47013832C18
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 16:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D710E02E;
	Fri, 19 Jan 2024 15:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D506310E02E;
 Fri, 19 Jan 2024 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705676845; x=1737212845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=II/LejzikZdDu1CkKKT4I8/NA012BwIkHSsSEQyvuK0=;
 b=QJq1xB/6x0RAovKsDEvYUiom7XujENs6ptBGxzyE/QVQBRkYARnnQHqy
 54C+WEKWL7TkqwcDnTrC6lcmOmVuxabMBySs8i1QTcNbUyNRSEIUVLLsX
 KykB9szNZdh4DwL04wu5eGbDSs/gBNy5zwrbnJM8fnI5H02np1RdA4iXM
 sOG9MOmaRpprDH1g2j7te4awizsM9TtuCa5u1nYt+e8ieCdKIDzLr/HJX
 Oo2rcBBM1XweyLd0XDkPSGN6RwYSSGhtP/fp8Hm8F3tI+fmtIoFaaACVG
 6/k4WEf3jc/gdoF+rwwXplmCoREBtK9ndNo92jw0/XHHWBxxkIzpUUtVW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="400419427"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="400419427"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 07:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="612575"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 07:07:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 07:07:07 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 07:07:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 07:07:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 07:07:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IllXghrHxWwAC1PROZNO6he0FWBO5cYUJvUuNTGC+exdkzHYVyM0hAqZnVLBIoDdXmdaLlrj9UPC/puU0gYJFjCtgRF+QRnpa5B+zFmJRVlL8FQcKHoRebvRBlcA0ZONIQSCfletLBIs3DSq834tBJfjfNK7UkdgCDu3Cs2aP5dBXzbB7Y9YJLTUjRXsMlly7glb3p5Zh29LQVi7t2hJmLK0LuNSbtxmDL2hAVG+DjfG1UidLN8QYHZcVk+oQ+QkOakrMGkpk7bBzuikN+ygp+i5GTB0Z666HamfKc89BME0DhvvmelHXuVRRqs1taH+obT/YYDdwD4N3ccDroH/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0hX2+O/sqDDT8exOC3+cMknRtU31NmOZtjsDZ0FSzU=;
 b=TmoWgjaw681Nf/Gq+URVaobtp7pZI2eNVU2T7teuukxwc5gArb42a8M5RPuAYeZUQhh/pEsq0mCg1n9hUipI9GA4mkmJwazmSVqarSZam5C2IDgT1oVjkUj9qqux2r8BBAVmZHM0RroCovUk7m+qNoEnzk23rEKOAdmM7q2O776sK+FWDhn1WRoIj8AukSeicieMWsTlATXDc+v7teiaVOGqcUe3I8tqGdEW08l6QdGHxnGVo3I+NGq2Mjp/Bl4NufEEUHHDDRXW6QTWnREJzvpgl8el9UfKc+D1ERTbJ1pwSZzjDpMRDvcsEw/NjcvKCznYIaCS/GfhxPrkseO49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 15:07:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:07:04 +0000
Date: Fri, 19 Jan 2024 09:07:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: Re: Re: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width
 GENMASK and BIT macros
Message-ID: <ydmngwamztwexmjbbm2l62agpeebvkuszissoq4mjbq7ccgwdv@srd4tqz7zjve>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
 <4ezps56sdj7fmr27ivkaqjakv4ex46f5cvmy6oqr3z6gkhiorl@us4qd53jzq34>
 <Zamcu7tts8mqX0b4@yury-ThinkPad>
 <clamvpymzwiehjqd6jhuigymyg5ikxewxyeee2eae4tgzmaz7u@6rposizee3t6>
 <ZanYFqS7YrVYQsjB@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZanYFqS7YrVYQsjB@yury-ThinkPad>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc94e14-6ba8-42f4-f136-08dc19004bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elKYslcmxzWT8VZzpikeWsCrHOHbWD3SkHlvoHsMXjtQ1EwMGN4X5ttVqZ8KyGkebAcnup2ojqkfu6jhsRno8nkcey9gxiscbnQtVGfp1KNe8SVRCsTC6iErmIUYWf3zqyJlytnGBsjqR4kjXREU/rd51jLSekYr831aV6ojtehug71W0GjHL+H8lThDLV/N6DzxPTMEfw1ISd2ssM/p61QXIvkdBNa0F4eS38JlfY4uS3BHNgwGb5v/S2AdTJzRc0fStwf0DpT332oHhrFeGr20Up2M6Yo38DZE51HVsgm8u4YAHZ2EOqCM1dXFSsmbMRzpv4++aBkGSX8ldEY8msR89cUzAEWLR4P0v6/UrXRGW+GDxiC2DRhBAREs+T5EkZwQ86+H6/kv7rhZZVh6blc0oujsEKVzWDK8QbwkNuYQcd1VQFN3AR0G9vwBPk7LHo8QIqy/PH9R199ooWGeuToAweRqKzBYUUdOaGuA6pURZBtFWpkwlDbmkacNyA4HRJOO+VCClncQnK4neS71e4xgt/00P511x/+gE9oLS/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(26005)(6666004)(9686003)(6512007)(6506007)(83380400001)(5660300002)(2906002)(7416002)(41300700001)(33716001)(8936002)(966005)(6486002)(66946007)(8676002)(66476007)(66556008)(4326008)(6916009)(54906003)(316002)(478600001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XNS4vflk373UO3JFKKEnjpfmIykp3JlVp50u8M9pTXPkNckRTwGBOoKRKcBM?=
 =?us-ascii?Q?e52wAaJROQrhElOoPGZTaj7nd64GyJ0omhYZ7ZE/qsN9BondhKjxhSqU4mQK?=
 =?us-ascii?Q?Q6dmyL5ra4SmZSAu8INRDa7SaGzkdAG6HF16+SiQJ+VvFOLi6d5zVSAzB3gx?=
 =?us-ascii?Q?ZQNZBaMemuN1hOFYK/ZAnfdn512twKVoWNYDGr3oSbwDdijRp2TxRtGKgl3k?=
 =?us-ascii?Q?p8vyubm7k2qLdQ4oDFk1lQfcy0CYX4UQ0xSvwl6dLQZY/cCLWnc98Y31bmwP?=
 =?us-ascii?Q?X7WKJ5FYE+6HfZlJEM7mzNNK9bo/+ZrgDJAx0BAXSWKTMy5BorMsdfnTz3Du?=
 =?us-ascii?Q?gkjgBskdj4/b2gpWde7OKhBb9m2U72fp3Huq5ROP4CcqXv4UOSChQmlE86fb?=
 =?us-ascii?Q?Z0hqwhAPln858ZUm1WGfdPa4mS33KWdWc7Y27c5nZnQM6noY0s6UMz1vADH2?=
 =?us-ascii?Q?ElbF/D7KO33aigMhpcIiPcHMgcsBBF+H7FFCLwepdubVeqFHUkTUec/KV33+?=
 =?us-ascii?Q?awJ3//M7U0dmV4xXybvktfiDwepQol26g+qfHZUfTydWEhIRWHapG2C5TMw3?=
 =?us-ascii?Q?TcpLNkqDyJj3xbcmy4b6X42Tvjb8BrLAuoTjUSPoEqBwSVMYsQxWa/cSQxuf?=
 =?us-ascii?Q?WZ+bJHrYsMfKjftHAuzewsu+qIjClAsKd/UydXwa91EzCmugibfHnnGxp2a3?=
 =?us-ascii?Q?Almsp/LqQsA9oWYnSQ4YSpsOMdjwwTNx2gJLtWSd1z3NRFt9xGAfVAu7KC6W?=
 =?us-ascii?Q?/FtxDuhBZ+6Q16cDmVc10TNhViMyZrv/JKtNWHy5jVJJRplIR500BudYdb0y?=
 =?us-ascii?Q?yXua1m+1oQD8hHjUwMWtO3q//HkS8D4NdzuwExKy4tTM6ADb2gI/OyMFWyio?=
 =?us-ascii?Q?RBmV8kzz2UPxlBvMkQkSfjcGnmLrdIZswqRPq+eqcyxtKiMPbUu+BoiCeF8k?=
 =?us-ascii?Q?ZRBgQnzzCcIRH94bC9+jXbzF2EJU6THa5nEaSdLL64om5g/B1FQrKycGKa/4?=
 =?us-ascii?Q?YXMqEa+VPKz2vK5MvEOtUluzHlT3XxBgaGPtO+Z3uct/LOwwrpuywcIGEhel?=
 =?us-ascii?Q?ous6PjmPHHH9F4PZKH1Q8rNkP4mlw+/84AgSA8rmcRQVo/MSHpyp8gwR59qs?=
 =?us-ascii?Q?Nlbjykd0CWLDti1z2JFleMIB/jx0RNAHnjqkLZjwrmNtQO0osM0LUtGzrutG?=
 =?us-ascii?Q?a732kd0LHQFhR1WSR4nQwnmEKsDa5eqRr1ZMNlrl4lt1g7o6nxl0G2CICEoc?=
 =?us-ascii?Q?nvL0hTNH1eP24wpL+Gla6JBnINWwVHRzXG6VdlqatBfIp0roUPCZ304fo4C5?=
 =?us-ascii?Q?LE1ohRxtWMibC5LeSy9v+DmQyhVq9Bqo2sT/mTBho2C+6ucTkx9DlPtM3mlY?=
 =?us-ascii?Q?nvXHSOKrKGNcrPPAwXp716OShatclFP1DdhWW+QTwqhE77A62gLvQnmtbtOy?=
 =?us-ascii?Q?JWcNtLAnFXgyFl1CKt9ge+xEOp5zp2wykPNcAMZjE2FT51aTimnIywdm2nx7?=
 =?us-ascii?Q?DKDpbURPUbbQdTYSenOL8GCiypTBcIxotYGYIcpluRB+kANIyDCzXTUcCewn?=
 =?us-ascii?Q?Fr6+ceq8hpu9WErXxSpdirM9SnE4QC+tCIN17UiSP1eBu+VfhWA8iLqoQFrK?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc94e14-6ba8-42f4-f136-08dc19004bb2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:07:04.2823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDjxKjAedItjbGR/e+HWfX0h9ljRwlesngNisE7otJOSMCJBcEU90TkFRNFaTqyU4IfFF52YyllYhpBthJLFi2XglxbA7RtC+BwYiE5Davk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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
Cc: Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alex
 Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 06:01:58PM -0800, Yury Norov wrote:
>On Thu, Jan 18, 2024 at 05:25:00PM -0600, Lucas De Marchi wrote:
>> SA2PR11MB4874
>> X-OriginatorOrg: intel.com
>> Status: RO
>> Content-Length: 6257
>> Lines: 150
>>
>> On Thu, Jan 18, 2024 at 01:48:43PM -0800, Yury Norov wrote:
>> > On Thu, Jan 18, 2024 at 02:42:12PM -0600, Lucas De Marchi wrote:
>> > > Hi,
>> > >
>> > > Reviving this thread as now with xe driver merged we have 2 users for
>> > > a fixed-width BIT/GENMASK.
>> >
>> > Can you point where and why?
>>
>> See users of REG_GENMASK and REG_BIT in drivers/gpu/drm/i915 and
>> drivers/gpu/drm/xe. I  think the register definition in the xe shows it
>> in a good way:
>>
>> 	drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>
>> The GPU registers are mostly 32-bit wide. We don't want to accidently do
>> something like below (s/30/33/ added for illustration purposes):
>>
>> #define LSC_CHICKEN_BIT_0                       XE_REG_MCR(0xe7c8)
>> #define   DISABLE_D8_D16_COASLESCE              REG_BIT(33)
>>
>> Same thing for GENMASK family of macros and for registers that are 16 or
>> 8 bits. See e.g. drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
>>
>>
>> >
>> > > On Wed, Jun 21, 2023 at 07:20:59PM -0700, Yury Norov wrote:
>> > > > Hi Lucas, all!
>> > > >
>> > > > (Thanks, Andy, for pointing to this thread.)
>> > > >
>> > > > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> > > > > Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> > > > > masks for fixed-width types and also the corresponding BIT_U32(),
>> > > > > BIT_U16() and BIT_U8().
>> > > >
>> > > > Can you split BIT() and GENMASK() material to separate patches?
>> > > >
>> > > > > All of those depend on a new "U" suffix added to the integer constant.
>> > > > > Due to naming clashes it's better to call the macro U32. Since C doesn't
>> > > > > have a proper suffix for short and char types, the U16 and U18 variants
>> > > > > just use U32 with one additional check in the BIT_* macros to make
>> > > > > sure the compiler gives an error when the those types overflow.
>> > > >
>> > > > I feel like I don't understand the sentence...
>> > > >
>> > > > > The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>> > > > > as otherwise they would allow an invalid bit to be passed. Hence
>> > > > > implement them in include/linux/bits.h rather than together with
>> > > > > the other BIT* variants.
>> > > >
>> > > > I don't think it's a good way to go because BIT() belongs to a more basic
>> > > > level than GENMASK(). Not mentioning possible header dependency issues.
>> > > > If you need to test against tighter numeric region, I'd suggest to
>> > > > do the same trick as  GENMASK_INPUT_CHECK() does, but in uapi/linux/const.h
>> > > > directly. Something like:
>> > > >        #define _U8(x)		(CONST_GT(U8_MAX, x) + _AC(x, U))
>> > >
>> > > but then make uapi/linux/const.h include linux/build_bug.h?
>> > > I was thinking about leaving BIT() define where it is, and add the
>> > > fixed-width versions in this header. I was thinking uapi/linux/const.h
>> > > was more about allowing the U/ULL suffixes for things shared with asm.
>> >
>> > You can't include kernel headers in uapi code. But you can try doing
>> > vice-versa: implement or move the pieces you need to share to the
>> > uapi/linux/const.h, and use them in the kernel code.
>>
>> but in this CONST_GE() should trigger a BUG/static_assert
>> on U8_MAX < x. AFAICS that check can't be on the uapi/ side,
>> so there's nothing much left to change in uapi/linux/const.h.
>>
>> I'd expect drivers to be the primary user of these fixed-width BIT
>> variants, hence the proposal to do  in include/linux/bits.h.
>> Ssomething like this WIP/untested diff (on top of your previous patch):
>>
>>
>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>> index cb94128171b2..409cd10f7597 100644
>> --- a/include/linux/bits.h
>> +++ b/include/linux/bits.h
>> @@ -24,12 +24,16 @@
>>  #define GENMASK_INPUT_CHECK(h, l) \
>>  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>>  		__is_constexpr((l) > (h)), (l) > (h), 0)))
>> +#define BIT_INPUT_CHECK(type, b) \
>> +	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>> +		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
>>  #else
>>  /*
>>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>>   * disable the input check if that is the case.
>>   */
>>  #define GENMASK_INPUT_CHECK(h, l) 0
>> +#define BIT_INPUT_CHECK(type, b) 0
>>  #endif
>>  #define __GENMASK(t, h, l) \
>> @@ -44,4 +48,9 @@
>>  #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>>  #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>> +#define BIT_U8(b)		(u8)(BIT_INPUT_CHECK(u8, b) + BIT(b))
>> +#define BIT_U16(b)		(u16)(BIT_INPUT_CHECK(u16, b) + BIT(b))
>> +#define BIT_U32(b)		(u32)(BIT_INPUT_CHECK(u32, b) + BIT(b))
>> +#define BIT_U64(b)		(u64)(BIT_INPUT_CHECK(u64, b) + BIT(b))
>
>Can you add some vertical spacing here, like between GENMASK and BIT
>blocks?

I think gmail mangled this, because it does show up with more vertical
space on the email I sent:
https://lore.kernel.org/all/clamvpymzwiehjqd6jhuigymyg5ikxewxyeee2eae4tgzmaz7u@6rposizee3t6/

Anyway, I will clean this up and probably add some docs about its usage.

>
>> +
>>  #endif	/* __LINUX_BITS_H */
>>
>> >
>> > In the worst case, you can just implement the macro you need in the
>> > uapi header, and make it working that way.
>> >
>> > Can you confirm that my proposal increases the kernel size? If so, is
>> > there any way to fix it? If it doesn't, I'd prefer to use the
>> > __GENMASK() approach.
>>
>> I agree on continuing with your approach. The bloat-o-meter indeed
>> showed almost no difference. `size ....i915.o`  on the other hand
>> increased, but then decreased when I replaced our current REG_GENMASK()
>> implementation to reuse the new GENMASK_U*()
>>
>> 	$ # test-genmask.00: before any change
>> 	$ # test-genmask.01: after your patch to GENMASK
>> 	$ # test-genmask.01: after converting drivers/gpu/drm/i915/i915_reg_defs.h
>> 	    to use the new macros
>> 	$ size build64/drivers/gpu/drm/i915/i915.o-test-genmask.*
>> 	   text    data     bss     dec     hex filename
>> 	4506628  215083    7168 4728879  48282f build64/drivers/gpu/drm/i915/i915.o-test-genmask.00
>> 	4511084  215083    7168 4733335  483997 build64/drivers/gpu/drm/i915/i915.o-test-genmask.01
>> 	4493292  215083    7168 4715543  47f417 build64/drivers/gpu/drm/i915/i915.o-test-genmask.02
>>
>> 	$ ./scripts/bloat-o-meter  build64/drivers/gpu/drm/i915/i915.o-test-genmask.0[01]
>> 	add/remove: 0/0 grow/shrink: 2/1 up/down: 4/-5 (-1)
>> 	Function                                     old     new   delta
>> 	intel_drrs_activate                          399     402      +3
>> 	intel_psr_invalidate                         546     547      +1
>> 	intel_psr_flush                              880     875      -5
>> 	Total: Before=2980530, After=2980529, chg -0.00%
>>
>> 	$ ./scripts/bloat-o-meter  build64/drivers/gpu/drm/i915/i915.o-test-genmask.0[12]
>> 	add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
>> 	Function                                     old     new   delta
>> 	Total
>
>OK then. With the above approach, fixed-type BIT() macros look like wrappers
>around the plain BIT(), and I think, we can live with that.
>
>Can you  send all the material as a proper series, including my
>GENMASK patch, your patch above and a patch that switches your driver
>to using the new API? I'll take it then in bitmap-for-next when the
>merge window will get closed.

sure, thanks


Lucas De Marchi

>
>Thanks,
>Yury
