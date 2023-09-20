Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E57A7943
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 12:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B6A10E47C;
	Wed, 20 Sep 2023 10:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C295B10E478;
 Wed, 20 Sep 2023 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695205895; x=1726741895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uNqz+Yla7EfyKlyW0wxQKn5PLomgRhI1RvTHNrrqz4o=;
 b=RbLOoHOxN3scP7GmHrrF2bIXsza0jzyVphPzNfC2MYBqS6/qJ1fYS77g
 XcLVWNBVb4UzAjc8/v+XExMqy+uvYoUSwK5VRkVz45GeycUl7IBHrqqRQ
 fPKyU6QcSM8BGNvPMFGcklbFZz+5tc3EeRHHghUE7IRLvWgyNHbySBHMw
 /f/6hV7cm+BibpJLo7gdfZZEbgGAAVHJvJGM/nP/RxasEVSfPZhZSHbTj
 XT+aX5MoKJfcAMsZzGC5ayNVcEQbGM3rBpfxPppgk/q/bWHhWgarP1uFc
 9Nm+X8IGbSEaoshWJt3pydstGno5dWUtHq9fhRv9VfAiLRv9M/MTsPGzy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365233838"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="365233838"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 03:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="740150229"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="740150229"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 03:31:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 03:31:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 03:31:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 03:31:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 03:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPHY9oOayjYgtXGa/XEKXcfIH6Zz1EP1/yR2iKThNRo2a+QbiqRXxmm9vo7ua4e1D7Q72ZfiFyQ8Q+WE18Mo3DYgfshCW2UZPs2Ewgaq1heiWkDBG/1vuQ+JFNrwZRsaggJm4YauV37NG/SrT5Ws0X6XqduyKh1kj8Vw5MW+O0iXRigZJiW6+vt5Ly4RpYp04KgMSAUlilcqkgNHD1GDc/GtHeA0k9w+ms4v4y2I5XGma0YJngYPqp9ssXvivARDS3byD32P8i0eMhPgIMgALjX/7/ExIzR9l68FWQf/PvbiPmr8h5idn4C/zO2nHGzOv73aC8Qwj0q0wwNbd2kIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpUWIJEjyT0vHjEULxECeRpT5NzyLnv4bk1a/DMkE7c=;
 b=V8R+ouNVqLZUBtfux0UifklB+kgjA/5p8Og7+mgk98sSaaVpi6bIsd+1X4KmAks3JdF9/zFTMp3n4XK2xHblO5c0wdVU08KbG+mK9seE6mJRxuLK9k304ezgLjfM0e/5aCh671Y9BHlu4SOTJAt8J2FhVmKdNeK0WLKwN/wmLMMWGn13fnkW9QUYtDswtJmwos2ofClyGNR42WAqFK9Nx03SFxxTNbf9Sp2BpCJjJm791l/uSOkJPehB74DWhoXJeenUTtoykVNx9dVdXSoizuHZnfdA/nYpxTnyApjsPmx8Szw4+H/GJOiCJ7P9IC3ubvFVgXAZolwBK4AG5b2e/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Wed, 20 Sep 2023 10:31:15 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::da59:e1cb:a9b5:5e4f]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::da59:e1cb:a9b5:5e4f%3]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 10:31:15 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Zap some empty lines
Thread-Topic: [PATCH] drm/i915: Zap some empty lines
Thread-Index: AQHZ66CMO7Uslv2IqEqfE2kQ1/pk5rAjg5wQ
Date: Wed, 20 Sep 2023 10:31:15 +0000
Message-ID: <DM4PR11MB5971CC2A1BDFC36C4FB9857F87F9A@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|IA0PR11MB8335:EE_
x-ms-office365-filtering-correlation-id: d2452d4d-5cba-43f2-a6eb-08dbb9c4b7d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /XC8Gbjf+Lgz7vRztiebCt0OKH/4LaNBt7lR4qlzbl8D/qWWKI0uoEtyihl4/terY/cfCfmBwFhb5JKXFXLB5sLTmaR76MUsyUNXBkaSF02mCydzW7sGXEIdkpcx6tbGk8xgSA0gTXB7y0jmIBf70DP4zWAuvHDHOOScGMivCiTKwDBcJIbfVLm8blJw3diJ/l75GSquFWUFKytF88gxOLfpSBOwGwp+jQV3sA3yYcPRmTHrga0/Vp56ZWdyYmFyYCCSL5gKaAw6N7cNyD65fAiSKUH7BivIenpmopfOzQOkNgjPPSQ8TUwH3Mpnq8Sgqi0ObIoSa0sr+qeXMYUUtSpYgOlwztvC+MOiBBISfBkMTBn69XdW7fXkasQXZnYjKjkpIEiP/iG3F5TVAqgi6bWm4jhr158rXtTP6Q8qp4goJ2HSESWXZKJl82tlkajPhPrxRbFhMSXFXRSiry7R6+Ym1IiDXbiFvWjcxhqusnslTC3OO+YOgNOJ+X7bbI1EAnWstxecP9UYCoCPfB0VJxoLWPjCmA3YO+jaQuDOpDTwp0nr+58F7m1byl6xaW3yNfDA5Mfv6oAHIrZfepyMQruGrLnZ04pRssIzlDANx5FqMnWr9Iq7tbGVVMlMU2QV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(1800799009)(186009)(451199024)(83380400001)(6506007)(7696005)(53546011)(5660300002)(71200400001)(26005)(64756008)(52536014)(66476007)(478600001)(2906002)(9686003)(66446008)(66556008)(76116006)(54906003)(66946007)(316002)(110136005)(41300700001)(8676002)(8936002)(4326008)(38100700002)(82960400001)(86362001)(38070700005)(33656002)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GQ0jHKv5ScwDxv/qqQBS2Ivs9KJQOEEiSim9F9W4I7i+11uIEAz+tgV4iGya?=
 =?us-ascii?Q?/OR6bAaIg7T8wE9YIgmihoBG8E09gu5Qp2dN2rrubDpqBbo5THOnLD3LBIRb?=
 =?us-ascii?Q?sV9Zpue2Ge3aH787Rdzw2mXxbgKHKeJpm2IghzWictLZMPD6bpqghm8TUCGn?=
 =?us-ascii?Q?EIh8AG5vJVrs6k/QHIkP46kdSgvOisZ8doIVBZj/odqOtN4t77ZKjM0BLo9X?=
 =?us-ascii?Q?twab0YzcXNB7kFNR/6f2jnZtTspnurX3CC0xD+B1svpUe70X1OuDXbAv7OXy?=
 =?us-ascii?Q?/jaw0iCS1Mxbjp437znzOi5P3egrbfc3Kiqe+ELLpJyXI2LZ2NAQ0stlavNX?=
 =?us-ascii?Q?QJcKI8XEteRB2p8jXM59GLCKnB/rXdv1Ij1OfBLF2T0vKJe5b7ddFmRVBfod?=
 =?us-ascii?Q?4N3IscnodIkKqAI0vsIzmFM5QcxfvBRMsUVvWlNeRY61WBv5LgolgcMxDKNs?=
 =?us-ascii?Q?fhSAGFDbHxNh4OgYAJoPGNs34Xuoe+q9Bx5/YXl1+uWnChHbdZll8R7kQtH/?=
 =?us-ascii?Q?zopM+oERg2F6oIP+8uR70EKZMCJmCJmNapJT+i71GRKWeG2fjpIm13DVKBJZ?=
 =?us-ascii?Q?33n5QnmC9Yn4T0a9oPNbcl9hyMV9kb3312Lwktqhe3Kpa/+nSEaS9jp/QL+u?=
 =?us-ascii?Q?ZR/szVBCKJkXyng4n6e9yIZe1NixCeZK7zWy0iM3s00KRRs6XpHavUtE9+4d?=
 =?us-ascii?Q?HxwoAw6kxnQ2l4AkS8qHf9sMgl0019gkBAcHZ7xw7Zt/fM8PhZExTbR6NCyv?=
 =?us-ascii?Q?2qt0cHZBjuoxC7xH/LXwf9BRlGYqUvvztSF/qIwSbkR3cgFnvryDdrPCaeGE?=
 =?us-ascii?Q?ulPLamowOmXMwQf/vUG1MZjeqKr8CpehCseDFsNXc8CI4YmhOLwDJyCS0NtJ?=
 =?us-ascii?Q?XGVJTa4JVs7XaSfwl1afxxd7gDICtdSyKAhk2n4dKDYkL3EbQsLkasM6oiWP?=
 =?us-ascii?Q?IcZrqsza3IypHUP76sEOvt5xwafZ/1x8zzBVYSPK24Y0cWhr8wTKCEqKhSVj?=
 =?us-ascii?Q?EmeOmFND8ZlzdoAJMo0w1HEXL/tWHVxqz0+xUjExzD0IHB3hE6bMLo8hcgNL?=
 =?us-ascii?Q?xFTCOabNsDQAjchni2vX67GFQfZpCXB+/CKNGRQjknnZSnaKCw7oK/ztnzdk?=
 =?us-ascii?Q?/Us7A2fTo2zO93PnqwXLllGzHxaRbfrirdpECldnoHPTvlwXQZwdTolJ7w7k?=
 =?us-ascii?Q?3S2QyxUk2iHKlkUC9pqM45zvgcVCKtxvIxqwPbL3mlQSeJ0cB+FxIS+GNjQa?=
 =?us-ascii?Q?AQeuHpCPDwI8u6D59cKuUhhK7uhoWDhoXZ2DkW/0ITJSUMFGTyC982FJw0km?=
 =?us-ascii?Q?7g8vPcSH+dRgeVoTe02JTccaXeiw+RHfkH+173k9Oz33pn8vfn3wiC7ooVCo?=
 =?us-ascii?Q?KD+Dyy33v52xaGhFwQFdiuW+QfXdxZem8Ct68JNKfDA23JmxqyTA98MLtLxS?=
 =?us-ascii?Q?j9cI4RwHQro35qWsOittxSA+61Cb+ZqXvbVbP2Rqu99K2qZpqrH1Hp0VcO7D?=
 =?us-ascii?Q?hWV5P2ikMP93s6iI4szlNH+q0uaYLypTz8JSoZKfZHPwXJqXqYkn2SXlLaa3?=
 =?us-ascii?Q?3cncPEC6u21ryBFT+XAbLHqIg8ZZvVCpYPrP+/B4TbtHimn1HAuV6GlsRiV5?=
 =?us-ascii?Q?uA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2452d4d-5cba-43f2-a6eb-08dbb9c4b7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 10:31:15.2085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysg/JWtNikDIedqJpoM9u5Ml3F+Y2pxx/9PPLWE+7n50OPJ3xq/Dv0TcKQU/wHk34TVCVn8W7ki2VfxXPO7sc5Pp5Inpi6S6+wAwvF9uoSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
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
Cc: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>, "Bhadane,
 Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Tv=
rtko
> Ursulin
> Sent: Wednesday, September 20, 2023 2:27 PM
> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.c=
om>
> Subject: [PATCH] drm/i915: Zap some empty lines
>=20
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Recent refactoring left an unsightly block of empty lines. Remove them.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 87ffc477c3b1..511eba3bbdba 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -646,13 +646,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_TIGERLAKE_UY(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_TIGERLAKE, INTEL_SUBPLATFORM_UY)
>=20
> -
> -
> -
> -
> -
> -
> -
>  #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
>  	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
>=20
> --
> 2.39.2

