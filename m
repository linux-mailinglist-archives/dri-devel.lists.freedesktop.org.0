Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CE6B0601
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E95010E5B9;
	Wed,  8 Mar 2023 11:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6066510E5B9;
 Wed,  8 Mar 2023 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678275113; x=1709811113;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r6AIoimJ0uvMzcu4JOu073BttYJn6xTGCLPakCmwk5w=;
 b=e08jrPGGMlkzhl2sOPTomE0xqXdTY56r8x+balKFl8eIkvCcjYjzXQHe
 +Zhay3nWy90oOLwUB3lsNpTOt8KRsUwx4KsTyjwTToWqNibiDIpr754Yr
 WYyaNKphZUz//DsFUcP5zz9j3EYI/sJx7N1I3zmXBIxsdXqXQaVi4wBPh
 8K+3dyZ6DRuVRU80lCHryrHwhBkqbYgsqXfxaObMK2I7hDJ65pPkXFQbY
 AfEcapyWD4mJKOPnByxdXyhWUfQdQ2rAiY6JZJtF1UBgD2zUXmLfLfeyZ
 RCo69+WeNRvN60obQADfJUjhXTv632tmEuRyE+DVv0dbquok5RSvggafI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337647937"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="337647937"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:31:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676944457"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="676944457"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 03:31:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 03:31:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 03:31:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 03:31:52 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 03:31:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQc4Ud9sG35s9KSN/56SHUqS66l5wcQqwyTgoBwXiwFJCQBp+L5nKQBFq1qzYBTp+KBPE6lDZ295bzwP6KmP2nYMbNixASzBZBfm/C9hzX1mOVwascXTDBqd98GPE146mormVZAOFKqXLGdzMyI+8tR8S1rJGbTYjOGFgjLRBCMoj6L/5PYlbiFl8Hu8j/nRN68ra13+f9mUqes7+nzqlzwIfUe2MyqK+8AD01SjzHNo9eS8HFU6eV71ruaJeN1VWVbbAO3eAsglhZ58vSd2fwmQYyxdE1KWrdhtK9UQC451vHcb2P2J1jCII7fGj7xLN4UIxnjh/wAw6Otsx6Ws8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43YMBIplwkSffpkAqp6g0HgoZmzA9jKQycqenNE25nA=;
 b=J0/615T0IzoesXx0eCA83B/Sh1RiA4ERCuS1Zke3tSbiF3J2JYrk0HvpRLprM7H3F1Juep9d1ypjpBlWQB1OpXXNAL17fNt9HjcZDstP1snov+BD9kUe/jyXWSKvC8rK8yKn+bg6+2/5qBfhw7ijyECYss7hgH3NOf2VoetJPoE6LPpLvADfK13JsTyYjiimRHjdjJMrOUe4Qo0SqofD6Xg9zUeCKXr4hOT6nkK0wZFbmkmEqBe4V2XXMIeTxDfotfuh6wInOOIjfXEotQZy94jD1jg+38JDzHDynUvdxe6e4OlEpLh3OsY65c4n46G2I9P9Hgf+5ZtBQVVyTjBcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM4PR11MB5994.namprd11.prod.outlook.com (2603:10b6:8:5d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 11:31:49 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 11:31:43 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 3/7] drm/i915: Adding the new registers for DSC
Thread-Topic: [Intel-gfx] [PATCH 3/7] drm/i915: Adding the new registers for
 DSC
Thread-Index: AQHZRn8rnz9sjE84nkC7IJf1Pbvkqa7wzFkggAAIcgCAAABh4A==
Date: Wed, 8 Mar 2023 11:31:43 +0000
Message-ID: <DM4PR11MB6360E17364C82637A47AFA28F4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-4-suraj.kandpal@intel.com>
 <DM4PR11MB63608B360592329EF088351DF4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
 <87wn3rbi0t.fsf@intel.com>
In-Reply-To: <87wn3rbi0t.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM4PR11MB5994:EE_
x-ms-office365-filtering-correlation-id: b48627df-3c9c-4fdb-df83-08db1fc8b1a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ftJykpU+TCrx84qM0yqbPIzkG7QI8MPfCyNNcQAnWJ9fk0GXfViFPvWLC7lL70/Q6G3YEHH/XoZZaWUpAG/BEfCKwVCUIcRXivWvc5szC0X05gtwTZuJmxrmf4L9bo8ApfLold7zQ5jDWyaQ9to0usbeBv2fFY5ENQgBpW7ALmDkvhCDINFs00HxXrCj+kKyKFH1KOijwv65iaFpuYA3Pln8PeUYnzla6tOblwHXE0dLM7ZiejBOLPFoEFDvJfXkLJvPObbjOR10MfMv0tHYygcV10j3Z8d64YZ/Tys0T6Dx5PJFj7gzQBFhyvqwEjHRPEDbBiF58OETDqo7bfX5QEcpFu1c75kb+AhV1SWjfbXWsAFLmrhrGxM/n0VP1g9EN2IYO2MYfvkzLpnfgTjWxGW4GJkKNvPZ7nUy3Ve6tZO5ZC03hFj7hkbvEE/MyECTcCsOOFvuk1oKUMmLi61gcMXHoqBf9a17rdBG/SI8KCsreNoaO1tkP17X2iERIk9HhRBJ58HlAq8h3p8GOtkPKA9/EjBte0bj5+vGtIBHLNrvr+dnNEznX6jRFKyoo3jYucbRGHdJFZSzZh7Lv9AJiB85bd9lQY2okxlw/ZzFaYMRJfCFagaetvw8AXCiHghOhq9wOmYCn0qsuvh/2LlmE1ZbVxljfg/PMtp6fJ/tFEx97lej/KmzhBOEF7T37SKPOft+5/2LRqq+Lcr/ncf3pA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199018)(7696005)(55016003)(71200400001)(6506007)(9686003)(53546011)(186003)(26005)(2906002)(316002)(110136005)(478600001)(52536014)(8936002)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(41300700001)(5660300002)(33656002)(83380400001)(38100700002)(86362001)(122000001)(38070700005)(82960400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s8GFHt2evPKHj4zT0RGnBJ5zRUb8wi7aD/N4kfLy4ul1oRKP+PyXz9sk0qDT?=
 =?us-ascii?Q?6KDse7sVV0YmWPYO4+kEhClpvs7mB5OfyZsVBlPOEaV2r7mH7y0iNojZ+7h/?=
 =?us-ascii?Q?/vt8ZKrSW9Q/3NlLhcrQpv20QuWTB0eDTcKsFXPz2ASA1NkiRxsN5D4hYHuW?=
 =?us-ascii?Q?12jj4D08fHYb6koEU3nbkf/B6E4Z91jq4SQpniZ3/f3FFuq3NVMiiZG55+vk?=
 =?us-ascii?Q?AhyNNPnlDmdufP1TOs8/giWBjrLbOsZVPQnD/58IxtpaacpzwdfGEgzyt0jz?=
 =?us-ascii?Q?3afJaCIjthRwhCAqgTi1+eQr+be16o1CD7z+ljJC8W4nRLjAebbvvK5A9suV?=
 =?us-ascii?Q?3iE164Y03oShmJSi6a/UXp2Rw4o8CMtHkZe7kYv11pfXsw6tTWm+JQ6BVAbN?=
 =?us-ascii?Q?9x2MTsSQY08Noiwdy8NSTn00GQHuTno6stg4Do405Jd/+JXoPmFZchySYpHJ?=
 =?us-ascii?Q?L3WhmwClmI2brjsM+kfjukmJQc4Iv4UbQgX7dAZKIVJujbgZ1b8HLtsMwVMB?=
 =?us-ascii?Q?lXXH1MKFQbhXmn7uW6/zf+z4mwAzJbR6YfTWkhrgg1ACAhHbHtUhXUzXXbSm?=
 =?us-ascii?Q?Sory4YroRsPWqlrsLWDGUD6DH0t1aocni/SgmpHULZkzdgxkgrsyraK2SwEN?=
 =?us-ascii?Q?QlaLI5c3LQ+CGe30EceksdvIWz0s46I1Dl94tNt8pFF4WF2d9FoXyVTUd9X/?=
 =?us-ascii?Q?E1sAD7eQMKOG4rZMSosvn7BbyCNZc+NvS/dmRVJ/CQFsryPM+zEn0Ypc/JeK?=
 =?us-ascii?Q?8qt6LJi17iQdkjtLZgbY2YyKOe4sDXJIyEn2dpPoIb2ZqILKou6nA/2w2nQS?=
 =?us-ascii?Q?xF5Fac0A2Nzl+8rKzIwcEsAL7vdPmn1hs6gGfdIsxyVBRII2usbSxUQaOtwd?=
 =?us-ascii?Q?/pTJNAQIkktizSF2QhplA7T1O+HPc4wUiMbsONShQg5YDNfmzpHuZZ0GzYxK?=
 =?us-ascii?Q?mUkFCO4F14w+5NkeV/XmJnbUz9N+qimCL+ZVzStipzvjWgySHELw5nrwr53b?=
 =?us-ascii?Q?RjfhqWg/HmguhQ3eKz2W9mK9O3w/TTJcuGLWgDt6r032dxpNYcPHSTA8lNtG?=
 =?us-ascii?Q?mGCZjBr68MBmOSvNJxUA2P80MTDG2KgPMNnT0J4ow1YeRs3fsj7xYUYlw/5J?=
 =?us-ascii?Q?FjaGUeVcDvBcIG6Rcrh5FllUbKhP3nQ+yFq6sG6DSkf9Y/D8eaf62f73PAmP?=
 =?us-ascii?Q?NR8oy58FaxfQ7JvIkQBrTRGCErvqTFJfnzyrnVS37fa3EccdHga4Nlj8tRJc?=
 =?us-ascii?Q?nu7RNUpNF7lt3AXFdjcLNyNLerKidsNpcugQDsiVjEbIZvCXDR4tI1SzDJQl?=
 =?us-ascii?Q?vWr/LSvg13AdD2/ATwFpPe6u9NL2B53CtQ/ynAuzPE7AsSLHxSF62Nl3A6Fg?=
 =?us-ascii?Q?8/OjTu8Mw70NHEnexED6hBIgsJE+oMywYul2H2nFM52SVTcggAJ0Wp/t7Mgu?=
 =?us-ascii?Q?TYGscxPWHi5BbMj5o/nruQNZB2Rff3w4Hz7/AY1rasasnx6dSnfUprG8XqMm?=
 =?us-ascii?Q?tTPrMfoL33zBEX/1thlVaXw9R4Ifm8x7shShNjlvGcC2hN3GvVtCBmGeJ1b0?=
 =?us-ascii?Q?3Ntd0k6p4FtbR7dwhdM8H+qGbQKOHzWLF10lodDk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48627df-3c9c-4fdb-df83-08db1fc8b1a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 11:31:43.7012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5lTrihWGdbhPkzgPhgqp3djd3KRO1E9lkDr6H2ocSI5uSLVhX2MbZmjLGoNwRYgWrCxtj1XE0fJV2xWcUXVbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5994
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, March 8, 2023 4:57 PM
> To: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; dri-devel@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915: Adding the new registers f=
or DSC
>=20
> On Wed, 08 Mar 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >> -----Original Message-----
> >> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> >> Sent: Wednesday, February 22, 2023 11:02 AM
> >> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> >> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> >> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> >> <suraj.kandpal@intel.com>; Kulkarni, Vandita
> >> <vandita.kulkarni@intel.com>
> >> Subject: [PATCH 3/7] drm/i915: Adding the new registers for DSC
> >
> > Nit: drm/i915/dsc would be better.
> >
> > Looks Good to me.
> > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>=20
> Except since c3f059483671 ("drm/i915/display: split out DSC and DSS
> registers") the DSC registers need to go to display/intel_vdsc_regs.h.

Oh ok, thanks Jani for spotting it.

Regards,
Uma Shankar

> BR,
> Jani.
>=20
> >
> >> Adding new DSC register which are introducted MTL onwards
> >>
> >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> Reviewed-by: Vandita Kulkarni <Vandita.kulkarni@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/i915_reg.h | 28 ++++++++++++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_reg.h
> >> b/drivers/gpu/drm/i915/i915_reg.h index 596efc940ee7..9e25e21d37e4
> >> 100644
> >> --- a/drivers/gpu/drm/i915/i915_reg.h
> >> +++ b/drivers/gpu/drm/i915/i915_reg.h
> >> @@ -7715,6 +7715,8 @@ enum skl_power_gate {
> >>  #define ICL_DSC1_PICTURE_PARAMETER_SET_0(pipe)
> 	_MMIO_PIPE((pipe) -
> >> PIPE_B, \
> >>
> >> _ICL_DSC1_PICTURE_PARAMETER_SET_0_PB, \
> >>
> >> _ICL_DSC1_PICTURE_PARAMETER_SET_0_PC)
> >> +#define  DSC_NATIVE_422_ENABLE		BIT(23)
> >> +#define  DSC_NATIVE_420_ENABLE		BIT(22)
> >>  #define  DSC_ALT_ICH_SEL		(1 << 20)
> >>  #define  DSC_VBR_ENABLE			(1 << 19)
> >>  #define  DSC_422_ENABLE			(1 << 18)
> >> @@ -7959,6 +7961,32 @@ enum skl_power_gate {
> >>  #define  DSC_SLICE_PER_LINE(slice_per_line)		((slice_per_line) << 16)
> >>  #define  DSC_SLICE_CHUNK_SIZE(slice_chunk_size)		((slice_chunk_size)
> >> << 0)
> >>
> >> +/* MTL Display Stream Compression registers */
> >> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB	0x782B4
> >> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB	0x783B4
> >> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC	0x784B4
> >> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC	0x785B4
> >> +#define MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe)
> >> 	_MMIO_PIPE((pipe) - PIPE_B, \
> >> +
> >> _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB, \
> >> +
> >> _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC)
> >> +#define MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe)
> >> 	_MMIO_PIPE((pipe) - PIPE_B, \
> >> +
> >> _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB, \
> >> +
> >> _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC)
> >> +#define DSC_SL_BPG_OFFSET(offset)		((offset) << 27)
> >> +
> >> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB	0x782B8
> >> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB	0x783B8
> >> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC	0x784B8
> >> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC	0x785B8
> >> +#define MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe)
> >> 	_MMIO_PIPE((pipe) - PIPE_B, \
> >> +
> >> _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB, \
> >> +
> >> _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC)
> >> +#define MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe)
> >> 	_MMIO_PIPE((pipe) - PIPE_B, \
> >> +
> >> _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB, \
> >> +
> >> _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC)
> >> +#define DSC_NSL_BPG_OFFSET(offset)		((offset) << 16)
> >> +#define DSC_SL_OFFSET_ADJ(offset)		((offset) << 0)
> >> +
> >>  /* Icelake Rate Control Buffer Threshold Registers */
> >>  #define DSCA_RC_BUF_THRESH_0			_MMIO(0x6B230)
> >>  #define DSCA_RC_BUF_THRESH_0_UDW		_MMIO(0x6B230 + 4)
> >> --
> >> 2.25.1
> >
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
