Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FF605B47
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8E210E651;
	Thu, 20 Oct 2022 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3454F10E650;
 Thu, 20 Oct 2022 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666258473; x=1697794473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UsqpGLPpFTtyeffPUeB8EuWhUZSEwisUl6sCfKUCee8=;
 b=C/8Q82vkFW7mP6WwrcJw9JCjp6MoOkI0lbXJONmDHyM4vhW1JJ341QBD
 twsUGfGMd3/1I/IQ/eFj3Emht7mVGdGeS/HHDV10OmUWVcVX81h947Fm9
 Ttpzbitj84LksYAHKCy4WqGR3u7vAXzZv3/t3G4JU62PBK4z5wRaC8mVJ
 +x08r6VyBQ4Jdv92+FvTYXStmLgm19OsQHXIpvsD11DZDfLCJvEpM69BB
 bYAThl4n4d0llrYwmZlOYzg0HCKg+Zwk32vZHCJCmCAfQFhY3Sl93fJOx
 calw01fSBiHPEWZR9YHU+NfhHxF+SnQ/17haGQGEsIkJ870J8tnX91Zdc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="308344296"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="308344296"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 02:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="804769282"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="804769282"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 20 Oct 2022 02:34:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 02:34:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 02:34:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 02:34:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 02:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FziF6OSDIZQyRZpYDdymifcGFyGrvfiJRBctPJTREIXdjUpmJmCGo5aO2vNN2KKgkAlRuDZnifJqC/SjQKmOw2nVrs0ndgeMt5CIQLbhxJ6lgLv9bZr8cnoA7t74mXpNr1dsPmwGzuLAHU7tOHWOpAwBPywt5pOURh0tXanOEm9/qWk8rG9C2XFg5d1CVQIUKcbLig8H9XYFUlleb7Eof/xKMqM3Uu+P8IUAx+kxlGKJL4LPAWfe1TcAhmK2/TWRhQQ+ynWH9OmQKN1DqEyZBufrwXPR+xHkYvBDpusvxEDGbqkKViKAD2IInmp0YUFm/xKYziVBdvbjQ5o+lf9l3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUf8UPGRGoU0PteTU/u/PsteS43XvI7h5Tl39phpvHU=;
 b=HzPDe8m33czwh/2dBotO8oSFRtc/QsuxeCvD8xyWBEYbcLIZTXKpnMWiT5DazjK4b3knMkUWnri95yGIS5H4hxM8AtWPQtR0OKizTxvcuLwrtax1bFXmOsVytDN+7KpYg5ePlMHy3RdDV/kktYF34r44SV3BpLGSl7kjHyzO1ZxPiuIfvdaokYFTwsgqFnILpRCqjr6QNlHv/dnjmXiY3JX1CEAPbjMsIopkZ6TbMF/7ReqIHEUilP7MZ/A9j3RJaWRl10FSQnoqdFStxHzxpejQMInFzTS/W5gUOo4gJtuNEvUsoqqlYTg4iZDZWGgmp9frHvizw2nwMGbpAFOxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3170.namprd11.prod.outlook.com (2603:10b6:208:64::10)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 09:34:26 +0000
Received: from BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::b969:75a9:887a:e907]) by BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::b969:75a9:887a:e907%5]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:34:26 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/xelpg: Fix write to MTL_MCR_SELECTOR
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/xelpg: Fix write to MTL_MCR_SELECTOR
Thread-Index: AQHY5AnRQsGeu9r4DU6/TtfOA8qxhq4XBeng
Date: Thu, 20 Oct 2022 09:34:26 +0000
Message-ID: <BL0PR11MB317053930F53A5B23DB02AC8BA2A9@BL0PR11MB3170.namprd11.prod.outlook.com>
References: <20221019222437.3035182-1-matthew.d.roper@intel.com>
In-Reply-To: <20221019222437.3035182-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3170:EE_|SA1PR11MB6615:EE_
x-ms-office365-filtering-correlation-id: 1fff69a2-9b94-4a08-3d6d-08dab27e4790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VoEs2NMRQqAzZ2t3F8Ff2NID3IIyoCQ9spMRvAhOdKEndLj0q1CoStzZfaO4pfpE6IrjWqoOOAvdEA71erSFXskFcM+YJGIs4SnF6hoq2gMFLcBGoFKb410gG231BwRc5PR/vH/kumzalrcZc6LWa4xPLM48nffgHCq6khOXxzUt75amVPYYksz06jJpHv3LyUgXZpGRM72cjHEILOXucM65B3EBcvkcSnJ5v8s+RuJDmN9AqEJDu8vVIoWmZKtl+M0WZWdGpsX/Qd8wQFcgLw7P6IJ2cBReGUfWVLcngKQ8rl3vU4NZsH/ycNsJtrT4jwasauXO0V6JaN4/trLEgj2MKtRbd5lrJfjG6S9b0zm1s4uTFgTIL249ziuSlc3HDmJhoy3nrbea+wdUdJRqx/xZpaUNEhCwr976v1rgSel/4s7rabSvj/+IugxzxhdgBPG3us/a6QNRZLRIEllW8jVA0p7di5dvAStaeRnL9zEVFiyPlg5OpfweQYg7lWOxya/jyXElIpqaEacHfFSbg4cuO4yLWM6xImopASP8yNbjFw2kcK59iUoP5PsOzxP7kw3i9BM2GZHVJR/M9zv7/1XCLfNkwR7CTRLDwSylU/HIf5PerU0Yo36tPfoASw3U5DRrEsq4+n/dW2Vkl44jJ+F6T2fbRDu0bKjVauZ6VmDUxSz5bLzQT2AFiue8HW6FkuTuDRWDUVb7KY87HGDnW3tKFClM5ek9rD1Jar5OdXQcLDARbwdDfXHjQvMYl7R1ohauiXt3vfHvGNyzILqsDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3170.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199015)(33656002)(55236004)(38070700005)(6506007)(478600001)(8676002)(66556008)(66476007)(64756008)(4326008)(66946007)(450100002)(76116006)(66446008)(71200400001)(110136005)(53546011)(7696005)(186003)(122000001)(82960400001)(55016003)(38100700002)(9686003)(83380400001)(86362001)(26005)(41300700001)(316002)(2906002)(52536014)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iVKeeh39F80kvmWk8CzOXXA+MsSbrVBquwNIJ5hc00B5sPWaQlpjr6OIZLWm?=
 =?us-ascii?Q?OMd9n01cBnd9zoozRausGZB6PD8p2VkPx6jQEg9SColsMIjkToGKW+5P70sS?=
 =?us-ascii?Q?xsALE8rZQjlpFGPeXZ5xJdZPmQY56hbkSXByTElrG8vM/7Y98C/7io/MdonC?=
 =?us-ascii?Q?QBVa768nOvWhMmyjN8ThYyNP7e+eGvM6WFbYLbuuf9Jdh/W8lygjnAlI2ZTs?=
 =?us-ascii?Q?LN1D+0V3qaC9JJdM7Kz/TN0Zsd6cY9I7A2aj8MUS5aNYACLK3l6Xvw6sKy+r?=
 =?us-ascii?Q?KTg64etxRcCn//fb9xlsRHjXHxBbxqmUu4HJgtrNT7bKY2N2utZURcbbj0jg?=
 =?us-ascii?Q?gLJw60MtfL20XOk86NAVbVRYh6TwTmX/P9HvAzA9ZDk/Qpnb8NLWX7iv+8O0?=
 =?us-ascii?Q?4YNGo4gxLQY2UQdfiq3Y3O6QvXPVqEycSdUTExfzRZ4EPYk15ElbKO/6x53y?=
 =?us-ascii?Q?+FfFIVQsTiklEoJPAb7kxp8js8+GAgb2RbRmQJ/239FNIH8VaxXGjxhwk9lk?=
 =?us-ascii?Q?zmgysE/mM4qC/5ghMZE2YefwJ8h4KJPR32amkWnSRe6NJM3tvXK/dl1pbzSv?=
 =?us-ascii?Q?FVd9v4Z1INWt3tQcwU+5/pSQZhdGj7XN9fNre58Do+XTbrIBDJGkc+DzthYE?=
 =?us-ascii?Q?JRhF7NygjKC9UIZ2mcK7C5G+pqz+6CBqnckKOeLolhOqKNckC/rq0U+uig6n?=
 =?us-ascii?Q?rNv2QFK+wklOY7s1/9L9hhx5Vwqmc9RagPe11zycwFXvV+FjGVqGvOL2wkmr?=
 =?us-ascii?Q?PfeK6QKrWKuGpWlX92GnFh63DXs7jgW6StsGbyNm+q0/IR11MGeUYAqeNbMK?=
 =?us-ascii?Q?Y7TAELt01qN2kj1mC/gyJpN4XTO/JEpdysnx5VuQUo2TmkHIZrOoiOOOR8CN?=
 =?us-ascii?Q?IJ0BATVWRwx4iX2UAUnUEfCAjUwJgkjINTcnKvYCAzqFmUbGptjSRf6uCQA4?=
 =?us-ascii?Q?9dOBPBesPpiF4ZV5UI1INGYpS53V0TwthcFegoG+H6bvol2xF6kcS7g6hPEZ?=
 =?us-ascii?Q?GxrfQJuJ8rLi43UcL9U3dcfWtShHzIfCBa+wjWfvj335dvG/NVJWYA7VCIZq?=
 =?us-ascii?Q?LYOpPeh5k02WViZekim3v7KEWP4XHhSjLqCbWCOQ1aIMUsCIVMgGqFLHzuvX?=
 =?us-ascii?Q?A4PT5zhVbTjSIth/7CkVO44vBllHd7VuZqErHYa0ddu0e8M2R8doG3rJCPZB?=
 =?us-ascii?Q?7OKf/6X/i7v6ejsw+YC/ya1mMfVMNr/yMIyh0z30eJxdDYDYdYHMBDbUmVJC?=
 =?us-ascii?Q?yg7mTPLNctIWexz2mkuFZOJKRaSLBBMLWkJfarhpIRmKcjRpvNUNeCHBIGyv?=
 =?us-ascii?Q?HBf/4Zvn1+GqXeqT+CyAI9oObxqyjPVVucnKdOmJy6m31yHnBsa6yI+HqF9f?=
 =?us-ascii?Q?XQaydWnaqrAN2h2Z+lB7HEIzxQQ9UDJ8JG745Ho15GpfIEDGkMtbtxerCjsG?=
 =?us-ascii?Q?22bBgfYejF5G2Nyo8msdrOE/7ZKdM4Q6CuxEfHLkgtjDqfGx5UrzQlpS54tG?=
 =?us-ascii?Q?2hDtdd1iRj/6+h3MNPYAksd34+syGULQOy4HkfBpSvIAUjTJyuN7pqxWVBjB?=
 =?us-ascii?Q?SOgnPmMxJiHkT24MlAsZNtu/i6NqTi3dfas5nllN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3170.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fff69a2-9b94-4a08-3d6d-08dab27e4790
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 09:34:26.2448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPZ1r5s2+X0LhYBqrMyLDxUvWX1WauA05AvWIsCuhAMrmLKZG4VBv82QS+wBJmH0S2DPLSEHeujLLNQ5gJLNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma=
tt
> Roper
> Sent: Thursday, October 20, 2022 3:55 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH] drm/i915/xelpg: Fix write to MTL_MCR_SELECTO=
R
>=20
> A misplaced closing parenthesis caused the groupid/instanceid values to b=
e
> considered part of the ternary operator's condition instead of being OR'd
> into the resulting value.
>=20
> Fixes: f32898c94a10 ("drm/i915/xelpg: Add multicast steering")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 0d2811724b00..46cf2f3d1e8e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -249,7 +249,7 @@ static u32 rw_with_mcr_steering_fw(struct
> intel_uncore *uncore,
>  		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
>  				      REG_FIELD_PREP(MTL_MCR_GROUPID,
> group) |
>  				      REG_FIELD_PREP(MTL_MCR_INSTANCEID,
> instance) |
> -				      (rw_flag =3D=3D FW_REG_READ) ?
> GEN11_MCR_MULTICAST : 0);
> +				      (rw_flag =3D=3D FW_REG_READ ?
> GEN11_MCR_MULTICAST : 0));
>  	} else if (GRAPHICS_VER(uncore->i915) >=3D 11) {
>  		mcr_mask =3D GEN11_MCR_SLICE_MASK |
> GEN11_MCR_SUBSLICE_MASK;
>  		mcr_ss =3D GEN11_MCR_SLICE(group) |
> GEN11_MCR_SUBSLICE(instance);
> --
> 2.37.3

