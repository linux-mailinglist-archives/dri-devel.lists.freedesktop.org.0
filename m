Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB503760339
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 01:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89510E077;
	Mon, 24 Jul 2023 23:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A5110E077;
 Mon, 24 Jul 2023 23:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690241923; x=1721777923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CKTPV8UmnUNfN5fn0y/yoUxII6RzP/gLe3FQNLHDSXo=;
 b=Eu3UKMFrd4PLqWlZyR6PoEjZdKK3PI2qHJ8dwdvN7OFU+84QR8UcWyxK
 dr1lqdCbnF6tEZL5htPofIKYXY+qYEuMoWg+2RC9mhrFo+anoorIsvgmC
 8VTfrfx598ctCgopiRiskTZPO8J76mgqqXgRLkiacUvOcbC/63cDa45DO
 BjavpUbVBeAOmayhp5TjrNH6/V65Zb2nGSggS8CxGAzg5MC8aeDYV1F4H
 RnmVHJvndsnX/DmuaJcxDEoktnLyKV+W24EutdA/UFDst4uN85w6okJhV
 qR19/OlfvvgH0JUpsEvWWaT7OMKkbLlZ2Eh7aiZIzA+vJ6wNyr+Ww1G5Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398488621"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="398488621"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 16:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="816023321"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="816023321"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 16:38:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 16:38:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 16:38:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 16:38:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeUHZtC0yrFjc0jGZe95tzLlrUHi0GOJc7ztR+GAlfQ87xi6k6GJ7V6o9pk24NyD8nW2IyEudoqk1yBx2V1I8jFq82/ribQvcMzVaRYy+am/3bEPH1dP8aDkE0aKDaCRS0U2P4ULyWWCwDwIbCgzNiDpLgLdVdZkMNLmIeszSEtB+h+/2W15nq6/gdoBF30iEV9C/PKlDFlzIm9sU9iCjmkm9wPGPhCFucCQZ0QDcszHYVW58xcompit4McN6VT4EThQYt5ZDb793ZWT6VMMHPmEWhwtCGIlagLk31xVrv0b/M4GehvlT8QgXbC9vAe0BrDW3c73L4UCZl+wM5gdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc9lZYZt5AK0SkkD+osKzw1cR1g/EitxwNJZpMvClkA=;
 b=fZ0XSiGotXDIwV/BrphkNgJgbKcaQNVrfHWvfm5QSlojE9xnKGQbr+qYa/TT86IdgefSybOuEsjSyttPs0iqdOO5BpHu0qdOlaYUqk0BHkAIf9NCfH/5MW3Pc1vI3YiRSIbsF0rk1MqZF44qw4DHho8qk6cFPOYdG2K1Ds6s+IqKoMiQQIedSzweIHeBk2GXWwmOdAPLhy5A/NCyVkOHHqtxg00aR4laY/n9CoRGyU7UZ5yIEneP2Ef2+bs60H8DgCBarDU9lRwiYJH4JPK5pV5eED/H5RWQMCMlor58Z0XXmFvY9ZT+3+wZ4oZgYZC7fsKUDfdCLorv+7F/vlcEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 23:38:39 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::8934:bc24:bf8a:2316]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::8934:bc24:bf8a:2316%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 23:38:39 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT paths of
 i915_vma_pin_iomap
Thread-Topic: [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT paths of
 i915_vma_pin_iomap
Thread-Index: AQHZvi5TT0l57VUd3EWmUkkassOdfq/JkgaA
Date: Mon, 24 Jul 2023 23:38:38 +0000
Message-ID: <DM4PR11MB5971B9E535C39E2C7F7314BC8702A@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|MN0PR11MB6159:EE_
x-ms-office365-filtering-correlation-id: 2ff19260-cb08-42f6-5e20-08db8c9f1b53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ejx1Cz/KJdPMYqZhUpf/TrN8U0IBZZN8yPhIQQBW1AvCK3HxemdSGtj7k3py7AROpYQrdBUAYwUrJCWdOWAwna2CJs3FDdBTeR/7+E6lkayAd9ydE9okemZ1UCfoBT2qS7a40vseupaLPdCHRTw2YJKMf+LLdd1sCPAJjmSz8lZpuxjY7igWrkyUibI0sdLKUC7Oxynq6ao+pDVAWFjVq2qZiOO+m6KP4FcGbmEgmhJyYMLG8AKG5skk2FzqqLBRiObeTza/GlN2Up37dzASZLACBix05uJJCO93LWoK4X/ZU4zpK59sNKC/2wMpl7yj114S05wWOsmpF9xJv+tsuVvOH9Bu2lZL61Qd5BCnTi+NsBylX6IQBZsswjENLgBTtrLDUgDpGgHGXepX1BRTY2DyjC+XQPiPc+hgMa17FAKMp3JQTAlSUHRZ3V7vifrWrZUg2b0aQL+IELAngiuNOitSTkS0NUwpBYMSdz/pvMQ/eg3mHLPx090xz+AabKUS0PlEeYXuRNpHNRBfqDmaIQ0Q3OF4Wlrz3dS4rXt5GlbX+ggHgJMG8owAoyJKYLqyYAWPz/jy8jkRQaeH/2rNGtgcptZutnhH8awcsVt7vOKogdotpPjIMBwakwNzMH2t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(38100700002)(55016003)(122000001)(53546011)(83380400001)(66556008)(6506007)(8676002)(8936002)(52536014)(5660300002)(478600001)(54906003)(316002)(66476007)(66446008)(64756008)(4326008)(76116006)(110136005)(66946007)(41300700001)(186003)(26005)(71200400001)(9686003)(7696005)(2906002)(33656002)(38070700005)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4qsgV5jZz7XbHX9m7uTreHEN8dQd4rbG3AJkfTP7gmp0eJA/uk79ZjX6q/RG?=
 =?us-ascii?Q?2oVZGu4eXRBOvfbt8s8NHAa8dggzPZ3elh2ZMj01XJ0DMVVnw0GL9qCs5euW?=
 =?us-ascii?Q?h5S01OJIN+2nlIyzYtHAvcC54BpiNkum922A8Lyl8tol2kx76ejt57l49Te1?=
 =?us-ascii?Q?5p4REzLyuqFuJyf36wlqGqIs9qFDWywoadO2O6AncOKG2I0g/g384HgywvBb?=
 =?us-ascii?Q?UF+xKf4A/x4osBptt+mZy74ZfEF50/DvYExXKgc+xeiVI2nwf7p7DFF55qn8?=
 =?us-ascii?Q?V6Z3grqPPWyryud50YDoww61vSQAIqk6ZC3608QmHKhYA1WFgFTT04OJ4eVr?=
 =?us-ascii?Q?AKmaP7gHBiQib/2OSKfvQY3x9d6W1b2VtCRyWETXB/gevhMf6kwuK7YW+fXJ?=
 =?us-ascii?Q?jyROVH1v7WX3xskX3/zN5ok4mbislh2qlCARMbrdWTywzHDXpNba4gyZFAa9?=
 =?us-ascii?Q?VxmqamtpEMPOq0hZcAru5FU/Aq12qIWK/8esArBwBnspK3NMHRZaDbKWS97p?=
 =?us-ascii?Q?NiWieJu5g4ZylWPXjQ7EpkNASNxOEW0mH2SSEKFsWhmIaKy+ZlL4zyqrG8/G?=
 =?us-ascii?Q?GHcT0CvXmMPVLCUKxxehwNJqAKb1qOF7zfGPu7CaN3ZN/U4kdAZbZkMnuC9a?=
 =?us-ascii?Q?6dQFzqgrREiGQwSUlhxu2BmMbPbHpA4Y2pWl8x8+e+CdOeGxE2ogbkzO6bbk?=
 =?us-ascii?Q?WnHpYozl+IBdJlhQo+UfAjA9s6aWVnogpediEa0CXbDojsY25RazlVI4nr/x?=
 =?us-ascii?Q?rhl4lLE2wDPeScOFG46Sztfwuc05tzuX+cYfEzjA0rrdOMHOsYpcdijbKC0C?=
 =?us-ascii?Q?O7NID0OxBZODW2ucwQ3LyWa1pPlPPN9VI1Z41/JoBOdWCFN//gpXuZWe8of1?=
 =?us-ascii?Q?891kNMvGnX74d/erfZ2ekVXghTE3I/+l/lqi+gymZB7nj3Slh1kE4531qzcA?=
 =?us-ascii?Q?P72PRFbvygTO9TM3DjmVLmIbVapiSR+p0Ia54SX2PnH2Hw1F28C5/qfOsFMp?=
 =?us-ascii?Q?L7V1SPVBrG9Wt2ReLhzX0wPYDWnWzRWaKfZWGKx/XvdvZ21FEfJA9mJqyYQ3?=
 =?us-ascii?Q?UGCCjazPLF11XJXEIBSwkBhGhQd8ICFtRlHDMLosRQirV4wz7uDJGkK7pNPE?=
 =?us-ascii?Q?rLyGUwG7V1cvzlrS9HLgfLL/scjWftisAJ9wwvQgayYmz+RlibX9Xd2Hwt8P?=
 =?us-ascii?Q?PLputOWVLueYbPWR2mbjGkUeMSKZM60ohLyshBClBmNoyfkNoExyOY/nWzEA?=
 =?us-ascii?Q?0QhEOAlwJoy/7zTyhtMY3wSEvsULwj+sh9L1Iy7OB8DulYICrzQ/bcHPE73Z?=
 =?us-ascii?Q?k7kf5lprP/Co1/NyjDlsLTRZ4BqeHVaRzEvKtBzA9s8/QfSgdcMRBqJ3vJy+?=
 =?us-ascii?Q?DGfUTblgqiVHA6Da3WBKdO0kDobIgTs9Tn9iZ1HUOViKMmqlXhQBxx7USTwB?=
 =?us-ascii?Q?xx+RJfIh0ddtoJWvAUoGMpMfXEPRs/+0hqoKic2XokTPE6zKV4xXO3wddBhN?=
 =?us-ascii?Q?0yRXejeWDHhopQKC7HJ+QTlhTep9kuEiOuiu7JvU7l9EbT9zJ7vCgNspJmpL?=
 =?us-ascii?Q?hdRHB+SLCF4IyHd1u8nchmbmfGaS9DFsmnia+lZZZd8OU7MV8JJKnA9VtNHR?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff19260-cb08-42f6-5e20-08db8c9f1b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 23:38:38.8750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiQ9fCIq0o8yeOf0H4GgkHOtfyz+yCostYP7nlI6ZjEQ3oUl+D4mpNAAdT8FyTh4USy10epf7+MDhkjDCfoIgtRGGFE03dYnMn6KdfsVMw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

The changes makes sense and based on the description looks good.
I am bit skeptical about the exec buffer failure reported by ci hence,
withholding the r-b for now. If you believe the CI failure is unrelated
please feel free to add my r-b.

On a side note on platforms with non-coherent ggtt do we really
need to use the barriers twice under intel_gt_flush_ggtt_writes?

--Radhakrishna(RK) Sripada=20

> -----Original Message-----
> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Sent: Monday, July 24, 2023 5:57 AM
> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; stable@vger.kernel.org
> Subject: [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT paths of
> i915_vma_pin_iomap
>=20
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Commit 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is
> available")
> added a code path which does not map via GGTT, but was still setting the
> ggtt write bit, and so triggering the GGTT flushing.
>=20
> Fix it by not setting that bit unless the GGTT mapping path was used, and
> replace the flush with wmb() in i915_vma_flush_writes().
>=20
> This also works for the i915_gem_object_pin_map path added in
> d976521a995a ("drm/i915: extend i915_vma_pin_iomap()").
>=20
> It is hard to say if the fix has any observable effect, given that the
> write-combine buffer gets flushed from intel_gt_flush_ggtt_writes too, bu=
t
> apart from code clarity, skipping the needless GGTT flushing could be
> beneficial on platforms with non-coherent GGTT. (See the code flow in
> intel_gt_flush_ggtt_writes().)
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is
> available")
> References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: <stable@vger.kernel.org> # v5.14+
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_vma.c
> b/drivers/gpu/drm/i915/i915_vma.c
> index ffb425ba591c..f2b626cd2755 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -602,7 +602,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma
> *vma)
>  	if (err)
>  		goto err_unpin;
>=20
> -	i915_vma_set_ggtt_write(vma);
> +	if (!i915_gem_object_is_lmem(vma->obj) &&
> +	    i915_vma_is_map_and_fenceable(vma))
> +		i915_vma_set_ggtt_write(vma);
>=20
>  	/* NB Access through the GTT requires the device to be awake. */
>  	return page_mask_bits(ptr);
> @@ -617,6 +619,8 @@ void i915_vma_flush_writes(struct i915_vma *vma)
>  {
>  	if (i915_vma_unset_ggtt_write(vma))
>  		intel_gt_flush_ggtt_writes(vma->vm->gt);
> +	else
> +		wmb(); /* Just flush the write-combine buffer. */
>  }
>=20
>  void i915_vma_unpin_iomap(struct i915_vma *vma)
> --
> 2.39.2

