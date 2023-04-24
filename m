Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFF6ED4A3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 20:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1C10E5D2;
	Mon, 24 Apr 2023 18:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AC610E1DC;
 Mon, 24 Apr 2023 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682361870; x=1713897870;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=TEekEtr3SKZI3SnDlfo0JzuYR91vfgNb9M6Q0FOiEac=;
 b=Um99Tmi1JOOsbMJJWf28y00/K6CtOw7h04fvljagv0bOx9nYNTmRad6/
 13d4dzrFbXfluXawn5NXl6zLm6KTwOReY3Z+0HnV00wOlY2zo+ulzBiyp
 vZHCtVeQzS/43uPaEj865xRZp7kGyPMhzDFusSl6nOMLa8vgWT27awxqt
 DSKYI8fXSMQ59aHSeZdzSa6YCz8RVgT+pHSIojTssT6ii6Z8Vv+6/fGlV
 mR17rezgO0GLXxB9sRD2DlHAwIXFkGG8OxVHcPssYHcMpjJucsnNO+mpS
 aovXwWI4TMvcnd2JKP+33smMvxoSZJz2Snrm3FnLxcmd6Hjm5DvF6Dfo9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="348450329"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
 d="scan'208,217";a="348450329"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 11:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695871286"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
 d="scan'208,217";a="695871286"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2023 11:41:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 11:41:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 11:41:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 11:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Bit4w90Wu3L0UupK/139ndL8rKZsWBurvVoZe2sYWwaE0lJybi2A2qRKzx+6xQdE1XxxNS9mDJGZ4hhD5U4msXiEEWwFSaaCee5Gy2DYMcvPJLBQkf4f8/EbRDTE3EkniwkUa7Jcw3YWKEcxCsGfE6hXCagwcXzZiZ4IdWIBZrjXWqZW5V2DyCxF8jEw5YGo/EkDFWaqrTg/PZt3Tj5t6q15TRMAwh8/gkxckCZ3bmWSre503wFqtg3WDOZwf9iGEWhAmuMuUFapVzFiD7LwR8UOEvJdH666qT3dzdgKxKNkcPrkXCwp74x370/0+fvUGpvM2hE0WsfXUWn1V3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ9RVOOLjW2MFXBNhNETh+f8bGeq1TPCWIn0IarCMOQ=;
 b=I59Vd98x1iTILzBy2r0iOljYyr08vqKQFggln3EdFbSB3otE135U8z1ajwcqLkNBFu+IkYvoNKIhHNo4FaClPFI2+XF3H3WjTmgMlwxKcvTMJelHARwGys63ectws1qvUsMaUl6cfygozergbaFoE6t3ex/urumB9Ifymi0BooV/EptAdBJVgfr2B0BtxBWXjgltKiqOO/+Owf7UxdHZ7WghtA7O4Q+8I2JEGuLGsHcnjCQjZDeyJ9gFkrvrGm+2yMpw2wVqPPQqXoQ/cYv7ROPghoOU8SafuNiR4DZY93V66FVw/hBPybsXeC6M/G/qx0+Dl8/opCdXe/PGcx23dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by BN9PR11MB5560.namprd11.prod.outlook.com (2603:10b6:408:105::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 18:41:14 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 18:41:14 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Thread-Topic: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Thread-Index: AQHZcxKnCuG3NwvExEaiiwkKEl7V0K80qqoAgAFaUACAAAZFAIACep+QgAI2HoCAABZJYQ==
Date: Mon, 24 Apr 2023 18:41:14 +0000
Message-ID: <BYAPR11MB25678D775EF934B410E6B5E09A679@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-4-fei.yang@intel.com>
 <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567042124B3E0D09E1696489A609@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230421174252.GO4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567E74CCD65192A9F699B169A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230424172029.GA6250@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230424172029.GA6250@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|BN9PR11MB5560:EE_
x-ms-office365-filtering-correlation-id: 55cd76de-4514-4808-e629-08db44f37b69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aee4/x/9BQzAOD2FjmLtgb//LDPcP9fKrqexPJDbNCa2h3T3OVwlnlG7O1qcTORx7JQhEZ93xmDGcoq1oy8OAVaiSP01hmWdqgvt4LQPVlk5y/J0yvEAn4fdGJ+UtwPkqTX0LflMvnPQ6cdkH1qhq0Atb0R+5+OkI33BcoDdrfD0/0o+1oYf9Nb+RBwXjiXIDa6QL9b6XIWpqi4BeQPSTHkZ/m2E6YbZsamFhH0xOyVa1sUX+ZMSE5IywsC1A+K2ZjAnjhyEOQYsxQKUUoyy44vLTl9xlDVGNSN5YC+NuHvi6PbSu7DSaIIL8g8GNRZ34PwugsyEq0f/9B8ep4hZqAP7n6NHmPudN9TWLSdOSmNfXsFw+fuFNEXJyiWwbEKXcgsb7IppuqBadY4H7MjGSfqtGJO6bMQCkOdFCDI2hZMO9g6DQB42HDSBXu9cHxPeTunsvHiGPhx6NLGDZ+ZUIc2QdCojjcKwX0CalfiqU+LZVdzdzoDVgHGmPwveKkaWRvIfmBkxZRqzVbayeU1ojUs0jXWfFbo2jQThgYPgoxkaSdwxwD8LVdTyyDqVWl6G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(966005)(9686003)(6506007)(26005)(38070700005)(55016003)(83380400001)(186003)(82960400001)(122000001)(38100700002)(66946007)(478600001)(76116006)(86362001)(66556008)(19627405001)(66476007)(66446008)(8676002)(6862004)(8936002)(6636002)(54906003)(450100002)(91956017)(64756008)(52536014)(5660300002)(71200400001)(7696005)(2906002)(41300700001)(4326008)(33656002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qpklQXM3du366RM62Hk5ehopzpqHEuRIGCknFnneFqni3lm/9ormZC/czZ?=
 =?iso-8859-1?Q?vkWsHJ2JsRkqKk8o2ssbslTHmSH1k5enNYB7TOBRDO1ZfESaTBkjmU1Iw0?=
 =?iso-8859-1?Q?KA2gP0FbqZvXVH7Q/whuA/Qt08A6hMQAguUsxluiMNQICtGB/fMzqiL+cG?=
 =?iso-8859-1?Q?uW0i+tuii4FTS96cxgSGdMDNTb75mp3QV0tsCVzplEdnSoLHxzKySe8nga?=
 =?iso-8859-1?Q?6d3IpbFoIlthMJ0cibuTorQIzmXwu+98RTnn16/nDyxi8xZydO4V/+r7Om?=
 =?iso-8859-1?Q?l33tcsl0WCrqQpUnl7990tS3/cJ1bsOxtDmmOiW5gibDnLChDga4IuHmBR?=
 =?iso-8859-1?Q?teS7rDLfaEBQiKJzxSKP5XcBMwv0KtzVnZ85bdSjoQ7a2bTgJI+GbZY8Xg?=
 =?iso-8859-1?Q?pRtplqazI1TenrvEnBJ0XvaVwC0mb9RJGGKzAOjnzIqHLiH3imOhtQ+Tsr?=
 =?iso-8859-1?Q?7S5bEcorA2t/nMcWo7vRHXp0sOznubTWBlba+eVo5eNC/HJHsQOzgAyZHC?=
 =?iso-8859-1?Q?FnGYogf+oGhvcCSpwgXbteIu0p070tvY5OtWrTgwXh+ZNY38bNmQ9ZlNz2?=
 =?iso-8859-1?Q?Ag02Nz8D9DKRpVy8JnvFJFfmMlsC5Uug0TqNVI7UvVOLz/ww7j+2yB6lec?=
 =?iso-8859-1?Q?PPIXkDQeJ6GWsJUKrJWulG5KYdFaxEeCCiwl+xbR/yXKYrcP2uy9pA6h2S?=
 =?iso-8859-1?Q?3s8uVg/40ahel4xcNRc43fCfTglsi24CM0ldaadcc92jeNfRibaZdT63Y3?=
 =?iso-8859-1?Q?7uKGLITgLtX5/AIykkBrCVRD46sgOLg0OkX3fyU+WClQYUZvj94Fd1YI6w?=
 =?iso-8859-1?Q?MEbHHcQkMKoYeZIAPQNDAItLthPVi8pEovsQClY5GlWk2ZVH/2hbzZ1EZC?=
 =?iso-8859-1?Q?s3Bqt7M11+BkZnwVG9dlu+SanQgFj/C/FfmhzlhZajh9GOL1/yVCe1Yw/m?=
 =?iso-8859-1?Q?a4ChxRGOML0zAcvAq2AMuq3lKY5LqdllN3rtWbm4GxSLznDVGhYkW96g4k?=
 =?iso-8859-1?Q?QsIYTv9ccZy4ikBC5q/PsxZCca+V96CsvkCpMfZ0G5v1N3AjbQRioNf1lO?=
 =?iso-8859-1?Q?0xxwkC6mmFRz/upO9ig7cgjjYyOQpt8RsUR9QnacJt/g0EQUjazBlugmjo?=
 =?iso-8859-1?Q?USAhFeoVQPWscbfqzKFV/EkNkY+xc02cCTEmDfKsYoG8Q18PMx6o1zQHuO?=
 =?iso-8859-1?Q?/fBxpot+dCjEcYB60ZxVtAKTF9FS+xI6tjoSgeJL2ay4GEVkK56/1dYaNs?=
 =?iso-8859-1?Q?54sEnQwgzIXSDL3hTUUcVFA7UFSgcFMro6NfXJdOAzNG7eOPD9gkwtFALA?=
 =?iso-8859-1?Q?+hfV8AXnB4cRdur0JVsG+UgC4XtTMqi52TMPSt1Mjb32YHVdcoB05eBFnF?=
 =?iso-8859-1?Q?Pdl6eOI7JgAAR55pLtpi8H001WWfw/NLTQI97eSQPYs3wQ3a2NM+eJ7JDg?=
 =?iso-8859-1?Q?gLBK4cwI+tJQU9zxfLrDa9ctsHGRclhUKd8dzIMVn4UCXbJwpZPDlCzXDA?=
 =?iso-8859-1?Q?kPgcrwv1KSIoJ5kU4yHm8xqC0JWfrdf8V+P0rAjIFzGy5w5Srn1OUaCTGq?=
 =?iso-8859-1?Q?EpAOKGjSzaiwzqNMjMMAJiIxeRmnQXQiUWW7QaeT2hQlr80r4+s8WYn7dU?=
 =?iso-8859-1?Q?eoem/dsns8j+o=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25678D775EF934B410E6B5E09A679BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cd76de-4514-4808-e629-08db44f37b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 18:41:14.0962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NY9DCRlkMvxv4mlMcpGgXm76qzjljrfqEQAGjBLgXLVWyrZCPA31zea8LqgdBqkOS+p1OZ5T499SGHsvOtLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5560
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25678D775EF934B410E6B5E09A679BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On Sun, Apr 23, 2023 at 12:37:27AM -0700, Yang, Fei wrote:
>>> On Fri, Apr 21, 2023 at 10:27:22AM -0700, Yang, Fei wrote:
>>>>> On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
>>>>>> From: Fei Yang <fei.yang@intel.com>
>>>>>>
>>>>>> PTE encode functions are platform dependent. This patch implements
>>>>>> PTE functions for MTL, and ensures the correct PTE encode function
>>>>>> is used by calling pte_encode function pointer instead of the
>>>>>> hardcoded gen8 version of PTE encode.
>>>>>>
>>>>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>>>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>>
>>>>> Bspec: 45015, 45040
>>>>>
>>>>>> ---
>>>>>>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>>>>>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++-=
---
>>>>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
>>>>>>  3 files changed, 72 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c
>>>>b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>>>> index b8027392144d..c5eacfdba1a5 100644
>>>>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>>>>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>>>> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>>>>>        vm->vma_ops.bind_vma    =3D dpt_bind_vma;
>>>>>>        vm->vma_ops.unbind_vma  =3D dpt_unbind_vma;
>>>>>>
>>>>>> -     vm->pte_encode =3D gen8_ggtt_pte_encode;
>>>>>> +     vm->pte_encode =3D vm->gt->ggtt->vm.pte_encode;
>>>>>>
>>>>>>        dpt->obj =3D dpt_obj;
>>>>>>        dpt->obj->is_dpt =3D true;
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>>>>  b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>>>> index 4daaa6f55668..11b91e0453c8 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>>>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>>>>>        return pte;
>>>>>>  }
>>>>>>
>>>>>> +static u64 mtl_pte_encode(dma_addr_t addr,
>>>>>> +                       enum i915_cache_level level,
>>>>>> +                       u32 flags)
>>>>>> +{
>>>>>> +     gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>>>>>> +
>>>>>> +     if (unlikely(flags & PTE_READ_ONLY))
>>>>>> +             pte &=3D ~GEN8_PAGE_RW;
>>>>>> +
>>>>>> +     if (flags & PTE_LM)
>>>>>> +             pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>>>>>
>>>>> GEN12_PPGTT_PTE_NC got defined in the previous patch as BIT(5).  But
>>>>> according to bspec 45040, bit 5 is ignored in the PTE encoding.  What=
 is
>>>>> this trying to do?
>>>>
>>>> This takes effect only for PTE_LM, doesn't affect MTL.
>>>> PTE_NC is needed for PVC (use of access counter).
>>>> I believe this function was writen based on the one for PVC. And this
>>>> function did get extended to cover all gen12 in a later patch.
>>>
>>> Even though MTL doesn't have local memory, PTE_LM is supposed to be
>>> used on MTL for access to BAR2 stolen memory.
>>
>> You were right, but I still think this code is fine because this bit is
>> ignored for MTL anyway and it is needed for other platforms with LMEM.
>> Otherwise this code would have some sort of platform checking which is
>> hard to do because we don't have platform info here.
>> Or we would have to define another PTE encode function for platforms
>> needing PTE_NC just for this one difference, then manage the function
>> pointer correctly.
>
> MTL is the only platform that uses this function right now:
>
>   +       if (GRAPHICS_VER_FULL(gt->i915) >=3D IP_VER(12, 70))
>   +               ppgtt->vm.pte_encode =3D mtl_pte_encode;
>   +       else
>   +               ppgtt->vm.pte_encode =3D gen8_pte_encode;
>
> If this is intended for PVC, then you have it in the wrong function to
> begin with (and it also shouldn't be in a patch labelled "mtl").  If
> you're trying to future-proof for some post-MTL discrete platform, then
> such code should be saved until we enable that platform so that it can
> be properly reviewed.

dropped GEN12_PPGTT_PTE_NC bit in v2 of https://patchwork.freedesktop.org/s=
eries/116900/

> Matt
>
>>
>> -Fei
>>
>>> Matt
>>>
>>>> -Fei
>>>>> Matt
>>>>>
>>>>>> +
>>>>>> +     switch (level) {
>>>>>> +     case I915_CACHE_NONE:
>>>>>> +             pte |=3D GEN12_PPGTT_PTE_PAT1;
>>>>>> +             break;

--_000_BYAPR11MB25678D775EF934B410E6B5E09A679BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2">
&gt; On Sun, Apr 23, 2023 at 12:37:27AM -0700, Yang, Fei wrote:
<div class=3D"ContentPasted0">&gt;&gt;&gt; On Fri, Apr 21, 2023 at 10:27:22=
AM -0700, Yang, Fei wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; On Wed, Apr 19, 2023 at =
04:00:53PM -0700, fei.yang@intel.com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; From: Fei Yang &lt;f=
ei.yang@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; PTE encode functions=
 are platform dependent. This patch implements</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; PTE functions for MT=
L, and ensures the correct PTE encode function</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; is used by calling p=
te_encode function pointer instead of the</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; hardcoded gen8 versi=
on of PTE encode.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Fei Y=
ang &lt;fei.yang@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; Reviewed-by: Andrzej=
 Hajda &lt;andrzej.hajda@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; Reviewed-by: Andi Sh=
yti &lt;andi.shyti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; Acked-by: Nirmoy Das=
 &lt;nirmoy.das@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; Bspec: 45015, 45040</div=
>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;drivers/gpu/dr=
m/i915/display/intel_dpt.c | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;drivers/gpu/dr=
m/i915/gt/gen8_ppgtt.c &nbsp; &nbsp; | 45 ++++++++++++++++++++----</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;drivers/gpu/dr=
m/i915/gt/intel_ggtt.c &nbsp; &nbsp; | 36 +++++++++++++++++--</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;3 files change=
d, 72 insertions(+), 11 deletions(-)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers=
/gpu/drm/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;b/drivers/gpu/drm/i915/displa=
y/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; index b8027392144d..=
c5eacfdba1a5 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/dr=
m/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/dr=
m/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; @@ -300,7 +300,7 @@ =
intel_dpt_create(struct intel_framebuffer *fb)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp;vm-&gt;vma_ops.bind_vma &nbsp; &nbsp;=3D dpt_bind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp;vm-&gt;vma_ops.unbind_vma &nbsp;=3D dpt_unbind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; vm-&=
gt;pte_encode =3D gen8_ggtt_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; vm-&=
gt;pte_encode =3D vm-&gt;gt-&gt;ggtt-&gt;vm.pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp;dpt-&gt;obj =3D dpt_obj;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp;dpt-&gt;obj-&gt;is_dpt =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers=
/gpu/drm/i915/gt/gen8_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;b/drivers/gpu/=
drm/i915/gt/gen8_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; index 4daaa6f55668..=
11b91e0453c8 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/dr=
m/i915/gt/gen8_ppgtt.c</div>
&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; @@ -55,6 +55,34 @@ s=
tatic u64 gen8_pte_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp;return pte;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; +static u64 mtl_pte_=
encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_=
level level,</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; +{</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; gen8=
_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; if (=
unlikely(flags &amp; PTE_READ_ONLY))</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; pte &amp;=3D ~GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; if (=
flags &amp; PTE_LM)</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;</=
div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt; GEN12_PPGTT_PTE_NC got d=
efined in the previous patch as BIT(5). &nbsp;But</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt; according to bspec 45040=
, bit 5 is ignored in the PTE encoding. &nbsp;What is</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;&gt; this trying to do?</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; This takes effect only for P=
TE_LM, doesn't affect MTL.</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; PTE_NC is needed for PVC (us=
e of access counter).</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; I believe this function was =
writen based on the one for PVC. And this</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; function did get extended to=
 cover all gen12 in a later patch.</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Even though MTL doesn't have loc=
al memory, PTE_LM is supposed to be</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; used on MTL for access to BAR2 s=
tolen memory.</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; You were right, but I still think th=
is code is fine because this bit is</div>
<div class=3D"ContentPasted1">&gt;&gt; ignored for MTL anyway and it is nee=
ded for other platforms with LMEM.</div>
<div class=3D"ContentPasted1">&gt;&gt; Otherwise this code would have some =
sort of platform checking which is</div>
<div class=3D"ContentPasted1">&gt;&gt; hard to do because we don't have pla=
tform info here.</div>
<div class=3D"ContentPasted1">&gt;&gt; Or we would have to define another P=
TE encode function for platforms</div>
<div class=3D"ContentPasted1">&gt;&gt; needing PTE_NC just for this one dif=
ference, then manage the function</div>
<div class=3D"ContentPasted1">&gt;&gt; pointer correctly.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; MTL is the only platform that uses this =
function right now:</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; &nbsp; + &nbsp; &nbsp; &nbsp; if (GRAPHI=
CS_VER_FULL(gt-&gt;i915) &gt;=3D IP_VER(12, 70))</div>
<div class=3D"ContentPasted1">&gt; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; ppgtt-&gt;vm.pte_encode =3D mtl_pte_encode;</div>
&gt; &nbsp; + &nbsp; &nbsp; &nbsp; else
<div class=3D"ContentPasted2">&gt; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; ppgtt-&gt;vm.pte_encode =3D gen8_pte_encode;</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; If this is intended for PVC, then you ha=
ve it in the wrong function to</div>
<div class=3D"ContentPasted2">&gt; begin with (and it also shouldn't be in =
a patch labelled &quot;mtl&quot;). &nbsp;If</div>
<div class=3D"ContentPasted2">&gt; you're trying to future-proof for some p=
ost-MTL discrete platform, then</div>
<div class=3D"ContentPasted2">&gt; such code should be saved until we enabl=
e that platform so that it can</div>
<div class=3D"ContentPasted2">&gt; be properly reviewed.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">dropped GEN12_PPGTT_PTE_NC bit in v2 of https=
://patchwork.freedesktop.org/series/116900/</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; Matt</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; -Fei</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; Matt</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt; -Fei</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt; Matt</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; swit=
ch (level) {</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; case=
 I915_CACHE_NONE:</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; break;</div>
</div>
</body>
</html>

--_000_BYAPR11MB25678D775EF934B410E6B5E09A679BYAPR11MB2567namp_--
