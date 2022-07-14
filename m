Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA34574205
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 05:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2E8927CA;
	Thu, 14 Jul 2022 03:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0051E92727;
 Thu, 14 Jul 2022 03:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657770331; x=1689306331;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uQnmvsoH67+tNuF0T2CI+vfVjlAPAj2xVP4pUnZXuYw=;
 b=LU575Ka+TPjRlUkKzSa/DYoRRsZWUlg++1tPP4JLK/HKrkpaHwH6ham2
 ftu8RKbAVSLui43bkNO+u5Ig9UqJ4X4R//Ema2fa1lCkgc3Ehzw/5zyop
 7s8VZJ1rhsRVV61ap4CFKjZ0bREAlXGV7k0wBFwViGnUohJP6ZquC95vZ
 eQuVNsNRH4DBGk97XPxc/vYI8ZeQHLIussj4IpeMlbva/SoicGha3fUL2
 lpTQBx8tn5RF3QjKeRl3UAuGOR8Oq/MNlqjJ+FTWrOnRgVhN69IYi8WHu
 +Pe/QFfd9ZRLVu2gyYFMXsIWlHesy7Y4CSR6Zg62npaP2C5EjbK43cSpr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="371718156"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="371718156"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 20:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593227508"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 13 Jul 2022 20:45:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 20:45:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 20:45:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 20:45:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 20:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRZcl/dZYPIt0gbAEaWiGNa1Qj0Gc9vQrPWUfhO41iYZDa7XOW+H40wjER9dBRBNLLcnjzjEeUMGggF0KJmkt/freKsnX2k3WoLa2E0FS4FrH+8aOHh6KdMzIW/3+IzkeZwfY/dI3B450TjT6ZgGGUWlvcQFsNinZr2lclPGL0gpNyFtSgFxO20ASTXLnlEpiHkWdYZLSUQA6dIZitxctVH31U6sLJxH6NYbZhM+ouXHIsmjd5zhDYMv6FlUwZ1qtMQBRu28WUK40raqVLDw6klDcJzKvAGtzYtVtLfS+hSaCp6xxdYDYt3Y6yjJJKmcKsKiTPgKPkzYdKnPHsaDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQnmvsoH67+tNuF0T2CI+vfVjlAPAj2xVP4pUnZXuYw=;
 b=mRVJFNm7KVow3IcJTpbvN9qhvQki+7BfQ5iDQlfHPSfOHsfJB7k8vUqSHe7eYsXh5Rng59EhM37qZ7MdVBnsoHclYKfGTMC+kIMwc/47OxVWBn8Z0imW/mAPGTOKlg0BssNMXizfch2N72zu6v1gXvjs/LR0kRXCohMj4XhZFGZoC7lHX8yCU7eG5MBJZV3GK6Mj4VujXvSfzJ6HMMYW/TmK5WlykxVU0U4/va45daeoyBdOe6rKYOfqGwji/rgo1rlm4bXYu0lXtvoo7iQW1S3je5M6tcuIeSwaX3auzcVYSgF+8UHesmzTQX4ThRKJhcw0zRez7KLOoc1oZn3E2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.21; Thu, 14 Jul 2022 03:45:27 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 03:45:27 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v3 3/3] drm/i915/display: add hotplug.suspended flag
Thread-Topic: [PATCH v3 3/3] drm/i915/display: add hotplug.suspended flag
Thread-Index: AQHYlswmTSHmf2SeIECc2C4+rQs/uq19OnSw
Date: Thu, 14 Jul 2022 03:45:27 +0000
Message-ID: <DM6PR11MB3177514A000C978F35ABE19CBA889@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220713152019.343432-1-andrzej.hajda@intel.com>
 <20220713152019.343432-4-andrzej.hajda@intel.com>
In-Reply-To: <20220713152019.343432-4-andrzej.hajda@intel.com>
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
x-ms-office365-filtering-correlation-id: 53c679c7-5bf6-472a-9ff7-08da654b4aac
x-ms-traffictypediagnostic: MW3PR11MB4649:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TGN1v4fWt2WuWJ/QAO0j3JQF5Y7SXkG0OYcv3hKS/2x/QpbFFEIDAlEHlovLzwY7962ftbkEWKGcrFiOP6R25hGvgmWSKimRG07xX0Wk+z+1nDn9JctDp0J52EV7uVDVO/qCy7Mo4auKz8lugJ/mQtWvuoso30lnS3RVxMsPp/8QxwBHh8ZAYC2ex6iD4DKDmMr0Ir52CwNxMzIzusIWXG2G7BhaicLG7FaVHV1mHUHLDT2KU5quah5uQSzx72wborbkFS+THLUGwT5V3/goPGZ+vQ6XdUMI3hm5LJLd3ZDDVD6HzQqQoiYduCusTAzd71AEB4F5PYKW8Haa0107V3X1J4CCCSIUvqInmDJFLPsyJaanxLocM3so0dF7aKMxKs0vuemSJaaJChd0qtWFSw7XVrgDDVq78rYlvbfIIdu4coQglL3HJ5kTJwbcd0rdU2ABaBGW+ky1G1QXRUHzf3OiSlZgvfJ8RpUXnSETPd0tuFNuyzuN51lgcZjs+uQJsHS5jYSNo++DJVa5WZITOvVg7krDri8sCfQHHYFHDeBadVJV/7Y8HXWy6rcZdRJ8ztdYTaUErF9lu3OBLQ6PW2lBP6I1evc7/SXsKj6wrJfWelD0mN8X96IIvWUbEI6i3cAN3AuANKjrai56BVJ7zfyEuwaf+oavRM+4pXItCJh2neO58UdrROPjW8nHAtNQ11FN2P767QPC2Z9YCMeVrkbY1spHTWVOUgisplpIACZASBp6lH3b5ypvxN6SQP3R1vDrOWsZ12abb74So5jw1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(136003)(366004)(346002)(38070700005)(66446008)(66574015)(7696005)(86362001)(76116006)(83380400001)(186003)(15650500001)(122000001)(54906003)(38100700002)(8676002)(66476007)(66556008)(5660300002)(110136005)(82960400001)(8936002)(4744005)(478600001)(55016003)(26005)(53546011)(52536014)(966005)(4326008)(6506007)(41300700001)(9686003)(64756008)(55236004)(2906002)(316002)(33656002)(71200400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TJ9P0q81h4bM4lTigK8KKwzAU0HpdbreQgoaSc+qgTCO41zcSSiqhvvx/e?=
 =?iso-8859-1?Q?BS3dJzNuRKnxPUP7tyZ1Dyzj4DYw3F5ZSmUqJRwmvlFqMy0ixu18yuSbM7?=
 =?iso-8859-1?Q?hRyZ398PeMkRrf4RWug5g0sJFU7B+QS370WVjzVPFmL2L45PYVj490dFH5?=
 =?iso-8859-1?Q?2sa0GWw0s8vlrLXk3vLQEQ46HQIJdCaPXg3ApcoaUXkv7L9ZW3ExXQo+Mc?=
 =?iso-8859-1?Q?onDwSgpw2QUH/ZVtxncL4BX3Zg/jG8TXSYqFgKQf1SuD+Q1xIIYgbccc5t?=
 =?iso-8859-1?Q?kRXRh9TTldw3tsYq9Q+iPTHyIcreNYuI13E5nZ7KIT/OGXP17OcWRaCsub?=
 =?iso-8859-1?Q?L/gUuVnuvddYk1O4/SJ1eP76r/Ubh0TBxBQW+CZJSGnpkA1gSfVT/ELqwD?=
 =?iso-8859-1?Q?Mh/03ZhfQre5mC4jpZ9+2Cz7pVziMYxUm8Y1x/LFbJ+f2DeWNU8ygFpwSz?=
 =?iso-8859-1?Q?WalD72WxiESoEaECBqj9ENDIikPcO+PkbVudEgCE3EEVDtO8fu7BELND/k?=
 =?iso-8859-1?Q?KYWrhpvLzMuBZ7PD82G2wnExgMle6DmQ/7feME3BthbpAlkd7LsLmSQwVe?=
 =?iso-8859-1?Q?llGxFKuUCOD/ECO+sZjCVaT1W0szXi/DxOCJ0iCwW8CNVlCeePcFlk+5bC?=
 =?iso-8859-1?Q?bgafoD+pPZkRR3DW0JFuOOBkU3W0QqkEgjFS0NdSDKbsQ8Nyj7mliKfuxH?=
 =?iso-8859-1?Q?t5ffbLz4G/jXAPqzo/XqQxRVuk2gNxuFclY7RC9ADCPtMADoogDWBn7wSZ?=
 =?iso-8859-1?Q?lAGkgEpzTZMTQbtLsvS2b5uVpPOyxvAWgGPZ1OMefHQaThX/Pa8hcgq0ta?=
 =?iso-8859-1?Q?q03o3dDSp6sC4z5hOoOaVfTa0VAdYDTgteY1yA8VUL/SAMqU0tILald3NJ?=
 =?iso-8859-1?Q?p/CNtmma+CjwqgtBXgCzOYTeE4aibwT4EMGPd8zwDpN2aqaIFhsJR87Yg2?=
 =?iso-8859-1?Q?ZcvOTJAD5PQIyYLs2cSc3dnmKH2RfbHcWeyOvsNhNZDn2Ik61IG9uLiMMD?=
 =?iso-8859-1?Q?kzWFSF9E1W+6pmvTJChyVn/+17oX46BMoLkuzYoWNlaDDBaTzMmaMoJ6EF?=
 =?iso-8859-1?Q?mFJRzYIHMeli92orR1ssp7hJpIGoQFkGeU9b8Rili+b4vE70Rg1gYtFxNc?=
 =?iso-8859-1?Q?mLE0V3Y8mQj5KLGIIq5AKy3ov4e8vYHkZec4nOhkPR9P4F4kTSh11NocB6?=
 =?iso-8859-1?Q?HH2FhCL/vG+kptYjM/QU/6HNAPsZ2BjNkxtnPa5s/TTuRTaB12+41Jpmau?=
 =?iso-8859-1?Q?cD8X0gUo8C9UTeO7Con8siuPh/zQtpnjtwW+2SPhAkF2dMld/gA4U/Poc4?=
 =?iso-8859-1?Q?5EOh07XLB6bNcMq+bYFuE6lrJ4w7b5P23YyA7Uxsvmh0y4hI7ySkQKMTr1?=
 =?iso-8859-1?Q?ai2jIM8Do4F2XXw7PiTI3TN2atEqwYFc3HqjjzMygks43hJox4xsPCU7sL?=
 =?iso-8859-1?Q?YvpH0vwDKpwG+uWyKVfcE0zcV3ktFWxll2WcNGYtSea/s/tI7ETvfxhmeo?=
 =?iso-8859-1?Q?GPFgdGM8Wu6VvvwZWlo91hEebyAcbNp2KwJ46Fa34jttlHlYq4lWuVRfGo?=
 =?iso-8859-1?Q?IE1Xbgo08QPnJdOT7hOjJ5YormFFW48AUVnEzWZkNhQ6i27DP07Hg601TF?=
 =?iso-8859-1?Q?lA719izidwUHGHycIdSNXcojYBuXSFmWlE?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c679c7-5bf6-472a-9ff7-08da654b4aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 03:45:27.5657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGuwcrP1bO5ZY4OzTBDlv5fIYOuYntJnB4F3EOaPi2ySv9G89Rq8pgR2mZ259iD5YV2/wwhra8wAbYZvX5K2dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Hajda, Andrzej <andrzej.hajda@intel.com>
> Sent: Wednesday, July 13, 2022 8:50 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: Hajda, Andrzej <andrzej.hajda@intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Daniel Vetter
> <daniel@ffwll.ch>; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Subject: [PATCH v3 3/3] drm/i915/display: add hotplug.suspended flag
>=20
> HPD events during driver removal can be generated by hardware and
> software frameworks - drm_dp_mst, the former we can avoid by disabling
> interrupts, the latter can be triggered by any drm_dp_mst transaction, an=
d
> this is too late. Introducing suspended flag allows to solve this chicken=
-egg
> problem.
>=20
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5950
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
