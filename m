Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE75741BB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 05:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889C3A0965;
	Thu, 14 Jul 2022 03:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343BBA0964;
 Thu, 14 Jul 2022 03:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657768183; x=1689304183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SKbWxveA68d0hj1Tc1pe+FcHmKMdthNe+sPwzB7cTe8=;
 b=LnTMMBNjt5DAmWBvxydiMvITgVOrjRgNRKbB/vxlqTcg3mmdHJQw3kjb
 JSnpj2ySbECc2Upj04tX3Jd4mK+ooPe5CbKcofuRYDCZYMT0ged3eA5EM
 GyBVBgwXhtWFc2TLKXxqzbu057roqGKWGUev7mu3OTJfyPmMJ62b7M2UA
 /MkfYwwd7D5DOg/oSeMip6parvSrhQCxJg0bYDSEerLfDl0FUW/2hMWQC
 HxzTDM/gEvXAmDw2OVyrW7iXe+2jEkf4OHP4trJtLOqGIY2imoZ9weoxK
 nfxUn6ESjlgldwaYQkd0S7qwCKisxxvlDfbF4/9gRy19ED/SdclX2ewAA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286540321"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="286540321"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 20:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="628547084"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 13 Jul 2022 20:09:42 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 20:09:42 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 20:09:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 20:09:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 20:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy7yKa/6s4470+1sEMccpvVEm/9RVGGPgzmro25MkCL+YW/KnL8JVNvSlrU/npfY3NqAlZmVucfeKKyISi0Pk8b/qdbU1BzTW1GTJDICyDqWONKibU760be9hcir89Ym1JsNImbX1uxjIGcOekYzimCbeuh4+U0hngEG8ANqwINay9C3t6IgnM0j+Z6+JiijNa+kn6lfkngf/GOrH5lUxqRYNgYIqLNKnbdhkPRCLYqplwQ2qbW2YzB7hHP3c1jSXM21t5rkZN1EiJufxOXK9VT3+5Q8+um9247vsMoD0Ze/yhNNQMSb/YOydd+k4QGDxqRDw7jntXEs4uVdQCUq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTbwhqunzOhJqGK7UwslTrzYKlq0GtY1L6DHhGGVEsY=;
 b=Fp2kc2VK3q+OYQxaDc/+FrehkiaCDF6QwN4KN6bcOahUKBMeVM2083O2a/R7XeZ34xxUqJ2a0xdyfO4bFinFpQfGSTiLLWmRigW35KSUIShBRbg7xjwy9ZWxyqAbvYwmUOOffP9cL7ApEFFjUiN2joCF4bH8kT+c8nIsAP0eyYi/Zqn9Rs/2X7JhA85btQqUSle6CchI4qTtC88qvkkjuRQl07eiUkwnFD2yUsnKv9IMmSgFLc0Rt4GQZPgA3vteBLrNXkL7CNUK2oVo91Vn3Y8scNRe+beYzM+fRpVb9RguidOySYUBfUgoorP1X8vlHd8cd/HcY5hS3Td9vOgu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 BN9PR11MB5403.namprd11.prod.outlook.com (2603:10b6:408:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 03:09:39 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 03:09:39 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v3 2/3] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Thread-Topic: [PATCH v3 2/3] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Thread-Index: AQHYlswjQXhK9Mn810CMwvfWa47dE619MHfg
Date: Thu, 14 Jul 2022 03:09:39 +0000
Message-ID: <DM6PR11MB31778FA4D120A1FCA691A956BA889@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220713152019.343432-1-andrzej.hajda@intel.com>
 <20220713152019.343432-3-andrzej.hajda@intel.com>
In-Reply-To: <20220713152019.343432-3-andrzej.hajda@intel.com>
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
x-ms-office365-filtering-correlation-id: 8bddc446-7b14-4c25-a477-08da65464a7b
x-ms-traffictypediagnostic: BN9PR11MB5403:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lggXkYsZou4Hq/8WyQuJoGSVUgLjdql/XB/FWmINKErzlLXzqddnTxBZMbLKm97vvLvlGzyEtHTO5mr8LLe7Wd41qVqN2FNRnZwKHg6po+MfhH6Vod7cp9/3GR8z/p2XKnQMAl8X7YHu6YNRF+ClARtpbMqgm/ba3M7KvezBOnhh/R2mu0wxTEVzr9BgvhpJNWLUb2FAmXT49JHnksImfIBA4vWzACFR8D0vqCMXK9LplMYJN+6z2DztKpGe4HdsWi2PcwlozNd6SLXZ3krjFD30UHDESjmct7BjybZozfNWSYQRoP1gTDVIvsEg2aef2u7uUUhfPsX9rUehjRhc2YV3We3uwP9hcXHGNr71hnqbhtlDxZbVLSnSFRVP7V9V0ZS/wyIUEZFwTmjHpvN1Enu7cpzlhH8ox8Jq7FRGmnT0c4k2oTfIWa6o6BjoAhU81WM8q5oF7t8f/094yQeOph8rhcYG8gelndRKkBuR1uRL3eCIjmxIhqoLc8NHNGhWb1fJlXHuUqzBe82dB8cij7pJO8aDN5WulqG9/wKQaNM7H/vhSTCq7G/s2ojGJDdN1Iic8G8tx6PFkRTG43M1I+2u4BHIdS0MVSt6c3eoRF4/ynxTJNHIqYq1dETOG+KQtWtW91O3ia5/HOj63VgR0/QrZVh1UIKbR2XKrw8IdHaKJqscttJ2o56AO2QFQqZ5j/uBeJNX4WJfBfEgwtOd7izIFnnrwAyK0BRo5ANaSFg9eTp2+SJ6l8qeS1DjQ6Xd4QhbCWjx59WaIU3FN6OvSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(39860400002)(136003)(376002)(26005)(33656002)(966005)(52536014)(71200400001)(55016003)(82960400001)(9686003)(2906002)(41300700001)(86362001)(15650500001)(66574015)(55236004)(83380400001)(38070700005)(5660300002)(8936002)(478600001)(53546011)(186003)(7696005)(6506007)(54906003)(122000001)(316002)(110136005)(76116006)(38100700002)(66556008)(66476007)(64756008)(8676002)(4326008)(66946007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4cEfdC9oa9h8F9XzZHE9DQhyuMjQNi6cbq7V4hn8U5iYolMF25aBpXBU3X?=
 =?iso-8859-1?Q?cw5HSou9C6MTmB5KI/64oUPJskZVruhyOAw2R+oimcxUahGNSxCoqkCQOk?=
 =?iso-8859-1?Q?K/z+HLBQGfOhimKcWXSnR2ty4TilVWa3DWQX23cNESCpckJlNUm8Z7ahg2?=
 =?iso-8859-1?Q?aI+R9s73FZZpkCEMk15eKYQpKb36a0PVwWp+wNM81oLOsnLwdln54POh72?=
 =?iso-8859-1?Q?mPBrPnowpNkf//erRHGxD/zjIaVJHr4Ff62NK0AvpPT+isbX9kdKS1XZ78?=
 =?iso-8859-1?Q?Jm79mAWhYqVGvr9/rarJv34ZiQk23r9XDkUoLjZGM/D6D4M1ZPotHMgLvp?=
 =?iso-8859-1?Q?tiMCjJMI8I3SbW7NmRwCB3GQVsuulkg9tKFSFMCAmPbiT4anQPOXw6P1BX?=
 =?iso-8859-1?Q?Q64JWmfa4k86Vy8CqCjz0v4lFdRqH50koIeT5tr7F1jOCTTBfcPEacCnu1?=
 =?iso-8859-1?Q?UoIM+siE9WLPXRbZk2oUe5Xrz1lPF38orP5BB7xn6Invpj0TdLogyGXdxf?=
 =?iso-8859-1?Q?0DBiUFqhOBSAZxEr5X/OQ2Ztxh8nUla14bvayEN8qrIkrybKzA2L112QEO?=
 =?iso-8859-1?Q?aU/xhHszwcacg1LRRuAqq4Q3rxQ0AOXd5DISmnuRBVAdT0e1KK89CpXdcg?=
 =?iso-8859-1?Q?aUwEiN/5KZm0SRcAZQNq40hWxfSTxH1qE0ZfV8zxnzcdoTG/OP9c8+J+pA?=
 =?iso-8859-1?Q?nVWZY130nhzdIf0fbI0q+YPy/DRcOLhzfvVaCZzcLJbpGO/9imoOg2Tb64?=
 =?iso-8859-1?Q?hDMSlDLJNdDQbyZ5AK5Qatniob3cdwaWcTHiduLF8SLTPas9sJDixS16Tp?=
 =?iso-8859-1?Q?9otLvtYwJ9Y96fdr5IP4mCH9DkwFM39UpZKo92kYF2+QvCdp9LE3L08hmg?=
 =?iso-8859-1?Q?BnjDUV+T8FpHd8qIYx8Igl/RO9mz1TmC5EDXJhj9hMtaDIegIZ0JXFxMZL?=
 =?iso-8859-1?Q?hu87bahtQ4axPkCi40mNgcRtW1Kn/Sx1yoI6+1WIShaVcxOASdo3XikHMa?=
 =?iso-8859-1?Q?rMq1v7dWnCTu//7DOfm5GJ5odyEw9ZIta7QUGD3QW18dpUDSPsBu9xH2cy?=
 =?iso-8859-1?Q?qJ7QLUhgLob2jGpcWMIHH1c9pkw8xg1ZfnX7ZQF3noxkbprHUGNbR04vM8?=
 =?iso-8859-1?Q?mZJmdtTrAjax3iAg/kcRgJwx8/FZkR2T0Kk9KSYE4s8lrl1jCwacU52Di2?=
 =?iso-8859-1?Q?QqKCcokvX24Ik3WVv+z+PaW4oO0KMAxqeHR7NMRGQ7WImAWLprsaeNg0bA?=
 =?iso-8859-1?Q?NF8e1V6LeFIGjdAp7sNoi9zkHvoIY4POxHaWuyMnz4v5jriqSF4BuEcqW8?=
 =?iso-8859-1?Q?BkJ2EHKRclmjwtGmmpOWd9p6zhnk3qP6YCu2uVZJfBn8rHSiHE2WcFvI8K?=
 =?iso-8859-1?Q?mBD0FXA2OHFkurlKBMav+bvlGn2Hf4NQ4/lG9+uYFxtMpBRmP2+4AOlnfA?=
 =?iso-8859-1?Q?84ZhMe6ZCHKbrmfjXnFOWGglNkGNgj9nIEn3G26UeQQp2OTBovCaZoW5s4?=
 =?iso-8859-1?Q?4fCTSHtl+d9VqewwX6wzq4CeUu2DgzmJYupzHZiHo4faiEajtodGzw1880?=
 =?iso-8859-1?Q?2o0Sc8O9CeLWbDlqZ+ZC0k7HhU/K4IZT3wMc2Vhj/PlEo2GLUS4MFTnof/?=
 =?iso-8859-1?Q?i8XfizYci/7OzOTiKRzuaE0GrEKFFVcx25?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bddc446-7b14-4c25-a477-08da65464a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 03:09:39.7923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dPfmmwtAMnk5tAspsEm6zzPUO71dRdsxdRHrLPaFSjwS1EYk5BSwtpHr7lF9FszBVe8ZSgwZHvGUdWaXYAfpWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5403
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
> Subject: [PATCH v3 2/3] drm/i915/fbdev: suspend HPD before fbdev
> unregistration
>=20
> HPD event after fbdev unregistration can cause registration of deferred f=
bdev
> which will not be unregistered later, causing use-after-free.
> To avoid it HPD handling should be suspended before fbdev unregistration.
>=20
> It should fix following GPF:
> [272.634530] general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
> [272.634536] CPU: 0 PID: 6030 Comm: i915_selftest Tainted: G     U
> 5.18.0-rc5-CI_DRM_11603-g12dccf4f5eef+ #1
> [272.634541] Hardware name: Intel Corporation Raptor Lake Client
> Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
> RPLSFWI1.R00.2397.A01.2109300731 09/30/2021 [272.634545] RIP:
> 0010:fb_do_apertures_overlap.part.14+0x26/0x60
> ...
> [272.634582] Call Trace:
> [272.634583]  <TASK>
> [272.634585]  do_remove_conflicting_framebuffers+0x59/0xa0
> [272.634589]  remove_conflicting_framebuffers+0x2d/0xc0
> [272.634592]  remove_conflicting_pci_framebuffers+0xc8/0x110
> [272.634595]
> drm_aperture_remove_conflicting_pci_framebuffers+0x52/0x70
> [272.634604]  i915_driver_probe+0x63a/0xdd0 [i915]
>=20
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5329
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5510
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
