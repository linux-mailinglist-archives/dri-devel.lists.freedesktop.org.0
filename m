Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB25EDB6B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 13:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04CB10E440;
	Wed, 28 Sep 2022 11:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2C10E435;
 Wed, 28 Sep 2022 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664363503; x=1695899503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jZNodkqrcZlpaddGCJ1XppF5jk93evTzwevSsfk87R8=;
 b=X+5SCF7s2uKFM7CfI9NAEcoPXvKRsVlPJb9LMdzCzWm1XBpOmNfPWzQc
 7JQE/3I0laRfLNtL+uASfdw4pOgVw+I/paS2R9K8jHskz0PN8hAKkcomU
 41Lbsx01JYH+aZ/YfekJF4LlAwe3/qVW0NILQ9gBy478x4jUh7Bi1OiUZ
 F8e6TUXaeeTYf4AT+NrgXz0BcoEc/BE8jgZVh6tVmyzbLuvOqbhTgRPPz
 31bqu63djv72Vb2+0Q56J7/XNViXphw8aV77aB4R3K7j4ePjzcl20FLE7
 hLXpIvxD+idzTSUFwBmimcFj6Ddk+N9jq5N2VGwJZLSj2vA8I1+vReWPt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="301549696"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="301549696"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 04:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="652641186"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="652641186"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 28 Sep 2022 04:11:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 04:11:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 04:11:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 04:11:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 04:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko/j18+RXuxt1b9qwvfOPCFIeoGaf4dLDUyzSPFyLq9/unTHOU1IYuf/h88H68wUfzAPkjrB6F5151UapD3ko0wKv/ECwfAdwlrJ3IbBS9HpoNpmXbBqgJiRRAVfVBwGjZdJ6N5ibZb6wZ38ycjKELKZLJAZCFr0GmqPOI6xbeEagKkV8rQBcxiTMIozLNY1eOxEKDp4mpz27Z023Ls7ytNwRIIY6th1VeULZgGwn4Ca8aw5WZmjzr2oP6u4nab3faKZnSPIKg+p6FwB9rRv7Vo2o2h6a/6cWkY59HEhWahhg7J868azdakg0K1ALJPP18oA7Vn+KIxkStr1xFZbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/glePFzrWv7ygldiom6ROt1TDKrHtefSYWFQEKz3Iw=;
 b=IBgqL8C+KLssyoCRApJJSf6yvIBLHDTWOttZ9dTEVc64DwcR+QDS/AfOP5mumlGDrgwolM6g7TPQPzbLMfP7qiOBlJPvC3+PI1U7Wf7D73oxa5YyhSYNp5B95e2E5+n8KKsOzg17QldiLRL3GSEvFiNJCKNrFwSGiLCnedMsoFm1f7zaLA2PcLNcSfK04LruuZNn5B8bA2LE/IiEKcFFEpDZcavFrW6xNzBGs35DoWu9NaZuQOePpKfnuvgEa45KiJaCCBd0mVIO8vGS9iHjkRq9J58T7rrcjKOBFad1FpoZnhdH/M3Zz3g92mbAU1bEkEolV11Tl4L8QUJJSr9qPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 11:11:39 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3755:4837:1896:43f3]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3755:4837:1896:43f3%2]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 11:11:39 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v4] drm/i915/mtl: enable local stolen memory
Thread-Topic: [Intel-gfx] [PATCH v4] drm/i915/mtl: enable local stolen memory
Thread-Index: AQHY0ymoGBXT0XGWFkW+MnfROqZ9XK30rgxg
Date: Wed, 28 Sep 2022 11:11:38 +0000
Message-ID: <CY5PR11MB621171E5F66A9E199FDD853B95549@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220928110620.126571-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20220928110620.126571-1-aravind.iddamsetty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CH3PR11MB7371:EE_
x-ms-office365-filtering-correlation-id: b166dd19-014c-4f9c-05df-08daa1423705
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4zw4stKQ9hRpzW37OSt02MeJKSp8nDIHrQPLlSLFUehfW8vagjpnPFmPEoEdUflPkSpE0IVLHuZMgXcaWX0cS6ijYJrng9v75i1aCrNRP64I0OmQ0y/w/rGXiT9iS94pN2MADLLzu8D/YynpJ4kEhqUDpi/u0f3AAfo2Wc0us7ZgFNoPK5Th+ayQsqxssiRDdGQE1f1779VdB1TNsBk5LmyvdNqj0TwBJhsXL81lin7LgPV3554R5riFrVVtt9atStXh2eLi0C0TrAlzKboGwIo/YgAgklVfDeSpSvkMnBHl1FW628anlLOhA5gAeX/veBVe276x6VA7cW8wnK0E+vqafosmYv9ofYiSE0LmszAKv6BcRcXPtCwWk4DeUQEk8BkyWbSsxzWCub513bKx2moRqS0cn9FIJeGkn7VqFjYk+3RhHtAZapxui13h8Q5VNzMOZIMrA/GC+vHQNO9KCjeqDlF6Gm0rA3ZDrU+E03qf5D0i4Zdj9t3pVBXXeA5jhkpkDPXaTNQOvtF9vJTJTZ36wfwy6zR4grBIr3Z3Rci50lBMdhQWxY4FCoh1ik6dQsAUK80/4Aw8dBLlOjT/dFDrTXxnR3zlfI8k6EPTjpbbjXJJfE89/v7owY5hfX876lAUd9O1dZMwjQRh+7gUSsdy2oO8fmvMLdhgxbONx2/4UU5maPY9zQpEdMEjJQMSGAuvBMGI/izFfbisJd+Bw8Fn8mEjBB3GT4RpUXCAk7Abozd9gddBxurcn+KFVv/Sc/yhDxWukaJl9PpEJQyasw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(478600001)(316002)(83380400001)(33656002)(5660300002)(7696005)(6506007)(41300700001)(8936002)(54906003)(110136005)(53546011)(52536014)(2906002)(55236004)(86362001)(186003)(450100002)(8676002)(4326008)(66556008)(76116006)(66946007)(66476007)(66446008)(64756008)(26005)(55016003)(9686003)(38070700005)(38100700002)(82960400001)(122000001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ol5f/6/HeurouwE+jBkVl4qe5BDvEnbf45y0a8kfTvnMIsfsi/rP874Ic0gR?=
 =?us-ascii?Q?P+rtT9aV03wcxqhThgF/lqOba2bDIjCpGokU2G+SnT3t1Eb4tutTMt+xTzWI?=
 =?us-ascii?Q?qQKUSXWd62Q1EFcTGhUAdq+YW/1F35jdupgwFJ6l/3imsytrJEmilJmxF8XN?=
 =?us-ascii?Q?T2Pa6LHsvXrZ4gxuQNsUpVB09oAOqXRAhgPRO/e0yvVKQN/y5HjaImnc5rqe?=
 =?us-ascii?Q?wPDldcCD6JK3VjuuVQBjgKYfmuJEb3IkNCSslysFtkCa+5+z/H/KS4aTukuQ?=
 =?us-ascii?Q?mn67Ox6jQk2XjmOST77nuO+TQMSkvXCfBj6wfXspGNPYFdEjM7KiV6otMPR+?=
 =?us-ascii?Q?bYUpszK5A8IwLwmtGWSIws5qvNQSHqHsJUq11AYwcOCkmdl390gMiPY2XCBO?=
 =?us-ascii?Q?giVzomVGfM/TLhdaDEFm1dbaWlQ0vclI1epWisyi4jrqpS1OEIrtDNbdKcHc?=
 =?us-ascii?Q?yQKtUhLHa7eg5b7sXyEBtd0BLHyUsdQSB/BBI/PnaRVJ0JBmJ53QhEw8QtE2?=
 =?us-ascii?Q?XFVRzA+eXD3TFCbqOMA8dmR1rTZGCDuwmYrGRrW2YUCLhThAFl+G6Ghpro99?=
 =?us-ascii?Q?jXfgEeroexBPVIomx8ROnkrbkgvEahqpYY/84mmBqomOkVHWh6TXOCc0ZPT5?=
 =?us-ascii?Q?wk2657QlmHb22wpM163NlbzrQlnJkaAice9RZNU7Bl4uuFe0tjLBBSOmhAos?=
 =?us-ascii?Q?s2eoGz4ede+s2TypzbxxHseUkrrDN5Uj1ybfQAh2hzHTPoHIg6OGwE8eNMTG?=
 =?us-ascii?Q?Dlk+8uJmgj5txOEsDLoFFnuRWa6LSH+qNl/js51pk+cWvtxlFQSsEOxxXX37?=
 =?us-ascii?Q?mjfoKM7hpqjkgw3n5ZI/vGShMLomWDHhRYtAHw/8OJEdN79Ijs/CfxmzaulL?=
 =?us-ascii?Q?481ieVdYQrbj3VxPDf0eZwKtzZIQIUiIUwf28dq8ebatR0mEIfqmhjhSeeIK?=
 =?us-ascii?Q?Xu1YpYP+nyi67ue9l49Ndbe6aUJhS8Pm7UkWMnct4+Fn77U2yZysUYVqRVUp?=
 =?us-ascii?Q?UB1QMbwOyaO5TBnQcIf+u9/QjQI5hRn8MyTUtZoKbzTP4D4hUMHL4xp/Z5Wl?=
 =?us-ascii?Q?O8fHcb7EdC1+m89sMYVED4YzWkMSTqzAx9oGYhdQLt2qNOi3FoDxhxq6qO0S?=
 =?us-ascii?Q?PMFq9NtWeZOqSd12val4eBk72qT5Gv13KQFPmqHSMylBKh1MK2hn+fbOFclL?=
 =?us-ascii?Q?eqpED1+lQN7BqUiqzjbmiJTtGE7x88+CTImGs1skeDV6tKoOLhZnOCQazWlG?=
 =?us-ascii?Q?uMl38MEBlLuHIKb5qP0Pub1BRrV5/Bqvcp7//1jv/LjERWCXfk0aO+QpAdLX?=
 =?us-ascii?Q?jsnxC2mdeOVluRbPdHj4NjzdONboWBV5mX2TdMxE8pimigeVH2iTwLSsbA5J?=
 =?us-ascii?Q?CC+uYUlaoEF9MVLB+5PgKcOvvfG4mNeDRuNPh/hA92WJpPxWzuIoopBgQw6+?=
 =?us-ascii?Q?chaEPaBDl+DvJKPd4hRqo05b/TNiVBtZiKNE8QIvXygeEm6hCUIEchYDpAJP?=
 =?us-ascii?Q?+Qqvql1dwSxxB+mWJ6nGlzkTJIh/2lMsdUclNZcqXnsmCWdw+n1lxfu8kBJa?=
 =?us-ascii?Q?UGZMun7F92vK4e/nZFJJxUzKu4zjYO3kfiTNdNDg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b166dd19-014c-4f9c-05df-08daa1423705
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 11:11:38.8711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Otk3bbzN5JYkPAtfRM2e86xJspwuaEyabjKMNGpYmwmZskxXQykwCoqmGH9ad5jHwTj7HcJQ/03lSBZwW/XVXh+TGzk5YeJMIyqdtopHltk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ar=
avind
> Iddamsetty
> Sent: Wednesday, September 28, 2022 4:36 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
> devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v4] drm/i915/mtl: enable local stolen memory
>=20
> As an integrated GPU, MTL does not have local memory and
> HAS_LMEM() returns false.  However the platform's stolen memory is presen=
ted
> via BAR2 (i.e., the BAR we traditionally consider to be the LMEM BAR) and
AFAIU BAR2 has represented stolen memory on prior generations as well.
Like on ADL.
        Region 0: Memory at 618e000000 (64-bit, non-prefetchable) [size=3D1=
6M]
        Region 2: Memory at 4000000000 (64-bit, prefetchable) [size=3D256M]
        Region 4: I/O ports at 4000 [size=3D64]
May be a bit of more explanation required here for BAR2 , how is it deiffer=
ent?
Br,
Anshuman Gupta.
> should be managed by the driver the same way that local memory is on dgpu
> platforms (which includes setting the "lmem" bit on page table entries). =
 We use
> the term "local stolen memory" to refer to this model.
>=20
> BSPEC: 53098, 63830
>=20
> v2:
> 1. dropped is_dsm_invalid, updated valid_stolen_size check from Lucas (Ja=
ni,
> Lucas) 2. drop lmembar_is_igpu_stolen 3. revert to referring GFXMEM_BAR a=
s
> GEN12_LMEM_BAR (Lucas)
>=20
> v3:(Jani)
> 1. rename get_mtl_gms_size to mtl_get_gms_size 2. define register for MMI=
O
> address
>=20
> v4:(Matt)
> 1. Use REG_FIELD_GET to read GMS value
> 2. replace the calculations with SZ_256M/SZ_8M
>=20
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>=20
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Original-author: CQ Tang
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 83 ++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h            |  3 +
>  drivers/gpu/drm/i915/i915_reg.h            |  4 ++
>  4 files changed, 76 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index c5a4035c99cd..2f8530a0ff62 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -77,9 +77,9 @@ void i915_gem_stolen_remove_node(struct
> drm_i915_private *i915,
>  	mutex_unlock(&i915->mm.stolen_lock);
>  }
>=20
> -static bool valid_stolen_size(struct resource *dsm)
> +static bool valid_stolen_size(struct drm_i915_private *i915, struct
> +resource *dsm)
>  {
> -	return dsm->start !=3D 0 && dsm->end > dsm->start;
> +	return (dsm->start !=3D 0 || HAS_BAR2_SMEM_STOLEN(i915)) && dsm-
> >end >
> +dsm->start;
>  }
>=20
>  static int adjust_stolen(struct drm_i915_private *i915, @@ -88,7 +88,7 @=
@
> static int adjust_stolen(struct drm_i915_private *i915,
>  	struct i915_ggtt *ggtt =3D to_gt(i915)->ggtt;
>  	struct intel_uncore *uncore =3D ggtt->vm.gt->uncore;
>=20
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>=20
>  	/*
> @@ -135,7 +135,7 @@ static int adjust_stolen(struct drm_i915_private *i91=
5,
>  		}
>  	}
>=20
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>=20
>  	return 0;
> @@ -149,8 +149,11 @@ static int request_smem_stolen(struct
> drm_i915_private *i915,
>  	/*
>  	 * With stolen lmem, we don't need to request system memory for the
>  	 * address range since it's local to the gpu.
> +	 *
> +	 * Starting MTL, in IGFX devices the stolen memory is exposed via
> +	 * BAR2 and shall be considered similar to stolen lmem.
>  	 */
> -	if (HAS_LMEM(i915))
> +	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>  		return 0;
>=20
>  	/*
> @@ -385,8 +388,6 @@ static void icl_get_stolen_reserved(struct
> drm_i915_private *i915,
>=20
>  	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED =3D 0x%016llx\n",
> reg_val);
>=20
> -	*base =3D reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
> -
>  	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>  	case GEN8_STOLEN_RESERVED_1M:
>  		*size =3D 1024 * 1024;
> @@ -404,6 +405,12 @@ static void icl_get_stolen_reserved(struct
> drm_i915_private *i915,
>  		*size =3D 8 * 1024 * 1024;
>  		MISSING_CASE(reg_val &
> GEN8_STOLEN_RESERVED_SIZE_MASK);
>  	}
> +
> +	if (HAS_BAR2_SMEM_STOLEN(i915))
> +		/* the base is initialized to stolen top so subtract size to get
> base */
> +		*base -=3D *size;
> +	else
> +		*base =3D reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>  }
>=20
>  /*
> @@ -833,6 +840,29 @@ static const struct intel_memory_region_ops
> i915_region_stolen_lmem_ops =3D {
>  	.init_object =3D _i915_gem_object_stolen_init,  };
>=20
> +static int mtl_get_gms_size(struct intel_uncore *uncore) {
> +	u16 ggc, gms;
> +
> +	ggc =3D intel_uncore_read16(uncore, GGC);
> +
> +	/* check GGMS, should be fixed 0x3 (8MB) */
> +	if ((ggc & GGMS_MASK) !=3D GGMS_MASK)
> +		return -EIO;
> +
> +	/* return valid GMS value, -EIO if invalid */
> +	gms =3D REG_FIELD_GET(GMS_MASK, ggc);
> +	switch (gms) {
> +	case 0x0 ... 0x04:
> +		return gms * 32;
> +	case 0xf0 ... 0xfe:
> +		return (gms - 0xf0 + 1) * 4;
> +	default:
> +		MISSING_CASE(gms);
> +		return -EIO;
> +	}
> +}
> +
>  struct intel_memory_region *
>  i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  			   u16 instance)
> @@ -843,6 +873,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private
> *i915, u16 type,
>  	struct intel_memory_region *mem;
>  	resource_size_t io_start, io_size;
>  	resource_size_t min_page_size;
> +	int ret;
>=20
>  	if (WARN_ON_ONCE(instance))
>  		return ERR_PTR(-ENODEV);
> @@ -850,12 +881,8 @@ i915_gem_stolen_lmem_setup(struct
> drm_i915_private *i915, u16 type,
>  	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>  		return ERR_PTR(-ENXIO);
>=20
> -	/* Use DSM base address instead for stolen memory */
> -	dsm_base =3D intel_uncore_read64(uncore, GEN12_DSMBASE) &
> GEN12_BDSM_MASK;
> -	if (IS_DG1(uncore->i915)) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915) || IS_DG1(i915)) {
>  		lmem_size =3D pci_resource_len(pdev, GEN12_LMEM_BAR);
> -		if (WARN_ON(lmem_size < dsm_base))
> -			return ERR_PTR(-ENODEV);
>  	} else {
>  		resource_size_t lmem_range;
>=20
> @@ -864,13 +891,39 @@ i915_gem_stolen_lmem_setup(struct
> drm_i915_private *i915, u16 type,
>  		lmem_size *=3D SZ_1G;
>  	}
>=20
> -	dsm_size =3D lmem_size - dsm_base;
> -	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		/*
> +		 * MTL dsm size is in GGC register, not the bar size.
> +		 * also MTL uses offset to DSMBASE in ptes, so i915
> +		 * uses dsm_base =3D 0 to setup stolen region.
> +		 */
> +		ret =3D mtl_get_gms_size(uncore);
> +		if (ret < 0) {
> +			drm_err(&i915->drm, "invalid MTL GGC register
> setting\n");
> +			return ERR_PTR(ret);
> +		}
> +
> +		dsm_base =3D 0;
> +		dsm_size =3D (resource_size_t)(ret * SZ_1M);
> +
> +		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) !=3D
> SZ_256M);
> +		GEM_BUG_ON((dsm_size + SZ_8M) > lmem_size);
> +	} else {
> +		/* Use DSM base address instead for stolen memory */
> +		dsm_base =3D intel_uncore_read64(uncore, GEN12_DSMBASE);
> +		if (WARN_ON(lmem_size < dsm_base))
> +			return ERR_PTR(-ENODEV);
> +		dsm_size =3D lmem_size - dsm_base;
> +	}
> +
> +	io_size =3D dsm_size;
> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < dsm_size) {
>  		io_start =3D 0;
>  		io_size =3D 0;
> +	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		io_start =3D pci_resource_start(pdev, GEN12_LMEM_BAR) +
> SZ_8M;
>  	} else {
>  		io_start =3D pci_resource_start(pdev, GEN12_LMEM_BAR) +
> dsm_base;
> -		io_size =3D dsm_size;
>  	}
>=20
>  	min_page_size =3D HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 30cf5c3369d9..b31fe0fb013f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	unsigned int size;
>  	u16 snb_gmch_ctl;
>=20
> -	if (!HAS_LMEM(i915)) {
> +	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>  		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>  			return -ENXIO;
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 84a2f6b16f57..90ed8e6db2fe 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -974,6 +974,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>=20
>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)-
> >has_one_eu_per_fuse_bit)
>=20
> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
> +				    GRAPHICS_VER_FULL(i915) >=3D IP_VER(12,
> 70))
> +
>  /* intel_device_info.c */
>  static inline struct intel_device_info *  mkwrite_device_info(struct
> drm_i915_private *dev_priv) diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h index 5003a5ffbc6a..2126e441199d 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7967,6 +7967,10 @@ enum skl_power_gate {
>=20
> _ICL_PIPE_DSS_CTL2_PB, \
>=20
> _ICL_PIPE_DSS_CTL2_PC)
>=20
> +#define GGC				_MMIO(0x108040)
> +#define   GMS_MASK			REG_GENMASK(15, 8)
> +#define   GGMS_MASK			REG_GENMASK(7, 6)
> +
>  #define GEN12_GSMBASE			_MMIO(0x108100)
>  #define GEN12_DSMBASE			_MMIO(0x1080C0)
>  #define   GEN12_BDSM_MASK		REG_GENMASK64(63, 20)
> --
> 2.25.1

