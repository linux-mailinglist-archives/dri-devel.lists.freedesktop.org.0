Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7017CFF5A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23C10E52D;
	Thu, 19 Oct 2023 16:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6B310E52A;
 Thu, 19 Oct 2023 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697732473; x=1729268473;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=TQFX1Q4vBTyYCHYb3/9GlJ8YR5Y8Ufi+lk08eoXC7CU=;
 b=ETYsuXbGuC0rc+SAlYQhpVIWcBxe37/rZnR+kpPSSMcUe1YIAtQIA0AP
 c0htZD7UeHeLjDrqTCEqBkQE8x1S2yh/a2Rstpa040YuSlITiSlnK/LIO
 ESsrTQrz0INgfS7sZN8/XjQ6WhPv9tfhC6o++T8F0wpM7dJ4T5vcWy0nc
 eiHyhfP1j4CAOSiaRbltiVXkU8VlffTHuJ/e17JhpL/9T+sN+1TnEMAnQ
 Uvz7/S3W/xfXJKl4BXvL0tuH4WwlWhi0poRHjHJrpFPsYqvSDlakAqff3
 k77VyA8GOQQRKYooHWjYNkGxE4qWWKVG9x2n6d/X8B/vSG4y4vWk/gAgl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452774615"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="452774615"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 09:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="822899575"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="822899575"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 09:21:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:21:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:21:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 09:21:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 09:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGtz9C5yKVNL/j6UTtqui/A6NDyJr1liOTweV5s+9I6St+eTHTxConoVSstj+smPSX6chtXvUbDG6FqRzs7bbUc/CXU9iqDc/f9STf2rNZ7En0XXYtJwCziSQT5n3VvI18dW13ljgMjGNc/yw2oIZ9Dnf/6hR4+MdUhuBCbSNdETtJ4JU+ZwlRxG8BRmjgvCzb4FRlYMFRh25C6MOuUKhf34Py4fMPPPZmVHDjELohv/x8jM54mbo++8UV7DszsHSnsfCWaB7Awl2QH9RILqYfs9BdB/LU9a3x4oKrhczgAOPMvhdNkU+NY6Img5qtmGTgOaiecjxiMf1i3h93JTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOVuA+mPku9Rn2keOeLZlsSEMX0Z8sVdYsEq5+fXgmQ=;
 b=oZTDo/b6cl29g54oIolrDJuqiBWD/+vkYulSE8FffBFgeqZWNpJeAs362VdL5ToUmqdWn5OU2We3QvBFM2X54KTU4nVMMTuAS7XYISkYuI4c7tZeB4jS6jCPrYFMfRUih6E1/LuiBlDfA+MQ0P5HaLCH+4R6zbpC8LxnaMYGEdWDgYSppdG762AWSHzWTHEmRF91w3VBN1ZVW/FKuXxSrm8zNvr2TAorw4JpwEzjGuzfEjyEnf4W3N1WORwmZGjy4limz+HuLIx0IJsqrttPsnHdYU6YJ8KGAwET/qqHxvO9Zk5yredgXXx4Y/5ro7Z3QM5FgwQq/Ge7MbgnsvIylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 16:21:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 16:21:08 +0000
Date: Thu, 19 Oct 2023 12:21:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZTFXbo6M5bWp/hTU@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c75658-b6b6-4728-5125-08dbd0bf66e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyR5vceR1ToPiDLmmFgqGyRub976TV0TG7wL7w9pu1FR0Rb62PoWNTRPB2lXonIc4dUnmj3neFoyriuKDsO9TM59HnOC6ANv6E9wDRmBJt1UUZHfrxH2r1Vum4fIk7luqneeEfJuRNeH1dgLJNNkNwFl+TEjWOKj/yNkcyWYWavUFxs68hOy7Jx4BEkPgEXZIYxQkgDlXPb/HOV0sAOFvBcRhWo1MuVGT3yI05UlfCfP67sjfWkOc8uw4tefytKAQtvYIhGran2QW8Bc/f/LHSxzcsukKuszSmsQgHH8iuNaWl5H+11PmkKEez9MB0QEWfxKMR2TKxGjCvHPhvKS0CkGEc91Bzx/KU5myGrHJTNEGrxVJu9XBx58sY1m8s4F0V+p9vagwrCKpAvMrsC06fFmQssS4+cgiuU1LgVbxWWGWVxsQQdRO8sZ543lzONHVhl7l62zVEiwkR+aFyAZXAVrAPUmzXZplcwAoq+ODvUF3ILKhEzyh8tNYxTiJy8hFZlVaRD4HpWll5yb8g1td9vACHhf3hMe6Ux6aoSmFJsJkwUgmZXxIN9/bytgzZu4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2616005)(26005)(6512007)(6506007)(6666004)(83380400001)(41300700001)(44832011)(7416002)(4326008)(8676002)(5660300002)(2906002)(6486002)(8936002)(4001150100001)(478600001)(316002)(66946007)(54906003)(66476007)(66556008)(110136005)(82960400001)(86362001)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DLLAP7f6xWOC7LdP1FUcuDdfF5ZSvNlu+LC/qimpKBLxwDeP1Jjd5qkaP6?=
 =?iso-8859-1?Q?QMyXQYl8fYsjJAZvblWC5g8NAiqctc9N/1vrINwtrG8pRaf2YreT+ptXZy?=
 =?iso-8859-1?Q?yRY+HdtJpaYfCntOa5zLjsWOOCRubcyDQDZ59cKNVCkB3h+PzABVwV/yKR?=
 =?iso-8859-1?Q?22TkZP6+WpPGYMh1WMFX1wuA8E0mk/GUHzs6ZSEqXBbRbkzJQiopTfeHwM?=
 =?iso-8859-1?Q?cAfgNBPlHDFsP8lDD2+F3l3PVYGW7/hfMsgNQ2IP/xyp9zH/DDJPg/fLlz?=
 =?iso-8859-1?Q?JAoF82we0aS4MaW3ONEE3p5X+YEAMjed8CQxd62gVCQi7dX1nxZwOuKJFM?=
 =?iso-8859-1?Q?1UR0DZ5tOOI4O5nRIL7V1sp7vP8cFE6bxscbdmoh2VQuj208h5IZAVXPu6?=
 =?iso-8859-1?Q?TfccXwNhqad7+kz/v84wTmSWiR8cZfQSM4V22iorMoUROIJXj4ySVQgvWF?=
 =?iso-8859-1?Q?CJoPqc5hTCuTHYzoEv9l3KNSwVqeBc6BfDeVc/BJQuPGt5FD/dDbCWNiiS?=
 =?iso-8859-1?Q?PnS/Y/xMntAZMX4REPgqWeqwDi48A9DxBOjethwjffTWRsyX46CjEZn1Tl?=
 =?iso-8859-1?Q?cT8fcKoso+DdJhstzrHMWQRfcwRGN7F6l8XDlqKo7kAbXmrPh4qHJRa8/D?=
 =?iso-8859-1?Q?IID33rB+6pRGp+xT3T29COhL/CUvELTecvStzV5KFcypBL24ukP0BE6rxO?=
 =?iso-8859-1?Q?LRhEeUZ6lMKAnr4Beb2TbLM/+9nb0KVNsTaJxfSKbRezc9LHJhVX9SpjPS?=
 =?iso-8859-1?Q?UvKpmK8bLsSIt2q8UMgG5NKxlP3o0cv2x6uvA7OHd3TDxYe3gEeHKtACpJ?=
 =?iso-8859-1?Q?UN/tvBnpmVZDCXJH6HjNgGpck1SlNMnjWdY+OKAqo3pXYXVLj0oWbk8CjK?=
 =?iso-8859-1?Q?h12kpvhva2qKm+iu0w1xUbSASCxJwLGZEYN1S5v1gm9bmt7BYODskGJtBj?=
 =?iso-8859-1?Q?YrqOPisRQDWTPF0acr1sSjgyJEpk/jIwT1TwA2j5FxHRDYKlP8VCo/2f+F?=
 =?iso-8859-1?Q?lvzFlEtn31xij7sE5UykGFrLZ7u1p2DuJ21J+V1va64ifx6i5Qq1pl1o1D?=
 =?iso-8859-1?Q?u4yBdtCO2WsOEEren8qMXy2b7nk0xH/BW48lCDZyIXvYJDpUsDUMGKXqGx?=
 =?iso-8859-1?Q?Mqk0PtvbFVi6Fdd63ClZjZHqR2jPDVwmOEu4mEXxbmEHa17apoYNyqNNSa?=
 =?iso-8859-1?Q?MkJxx4uvwkEQdlAE5X6ly35HKQcRnxDxJxUOpVBtXT9JUwFXFFaUP+ItAU?=
 =?iso-8859-1?Q?lfBkxA9JnKZ0FT107ClTdRNRTPVgyk/cM0HIXKUHzecoF8LBqY56KZ6xbG?=
 =?iso-8859-1?Q?6n7fzo1YmYnUfxueuNEDpNOUTgeDs4T/Ph/9G10gdI3+hMnBvh3e5tqfwt?=
 =?iso-8859-1?Q?JKeV8wE0UbYAtAKqMbO4Pf3JoDxogvaWTofZ8OGek3EpBaFK9+Wd3AvCvk?=
 =?iso-8859-1?Q?Ffz8iGWM0CHWh57iDlLFkGspNOcnwC28Vnbm0zfHEzwogkTWhga49Prww+?=
 =?iso-8859-1?Q?x9UuGWrOBvhMfendlWj2oyQj3WnQ7Jmr8ksIEv7eowAHU4TYWzA9FVFG60?=
 =?iso-8859-1?Q?fXaYdI7EYTv/FWwMbzzh7pOi9FmTl+0jK2dSirUYZGOawM4y6Nv7c3hp0D?=
 =?iso-8859-1?Q?mS94vhadA+VXa9r0qfszS51xb1oh4LGDkB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c75658-b6b6-4728-5125-08dbd0bf66e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:21:08.8962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awyqIj0Q9ehu53dG8PCW8Pa2Ap6xmiJbirGb1lY7RvPaNAFu6gKrRXZZMSUyKi60JJjY2CrIS8iaKGmAJ8VEVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2023-10-19:

- Fix display issue that was blocking S0ix (Khaled)
- Retry gtt fault when out of fence registers (Ville)

Thanks,
Rodrigo.

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-10-19

for you to fetch changes up to e339c6d628fe66c9b64bf31040a55770952aec57:

  drm/i915: Retry gtt fault when out of fence registers (2023-10-17 22:08:54 -0400)

----------------------------------------------------------------
- Fix display issue that was blocking S0ix (Khaled)
- Retry gtt fault when out of fence registers (Ville)

----------------------------------------------------------------
Khaled Almahallawy (1):
      drm/i915/cx0: Only clear/set the Pipe Reset bit of the PHY Lanes Owned

Ville Syrjälä (1):
      drm/i915: Retry gtt fault when out of fence registers

 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c     | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)
