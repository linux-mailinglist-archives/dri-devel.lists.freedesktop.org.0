Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7C7AF279
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 20:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E354A10E408;
	Tue, 26 Sep 2023 18:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C2F10E048;
 Tue, 26 Sep 2023 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695752014; x=1727288014;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AF61km4pvwe2xagKoHr3YakSAT2/wKtXKBTqpByI9WI=;
 b=FlVzl1vbQXuhRt28L/qdpokDamqOKo2qW8+MZzFdVU1lBkGUVrQ/2p8P
 R1oPlQgKzLYPZcve6QS6j+CwyPskaAQD/JhjO6Uz2RPQxWvYqJBUO1Xye
 WyqI5sczP8uES2Wfs+4jVUHfW/MnJ0ysJi+LmnzVB+q8pR5BpWjL2JI+f
 kaL7tEcytX8TIb87jZsiVLabM1Awai2GKTOl/JgLvyqDtS0WvbrEO7fJz
 ubTg393bxOJ9EkdmYLJIjILqDc4Y4U1/0fM84JzR8B3ufM33+oCZICrro
 berBLDY6vIUtAYW0MHVEn+xPbFNrHRa9Mh+tS/aKm/2NBGNdZXLkRMrnO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378912781"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378912781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 11:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922519845"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="922519845"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 11:13:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:13:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 11:13:32 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 11:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1HSNbFPAODZ3A+ADlhtEbhWU4ZQ6rI0MTzJLAOaB/kpV5NEBFBDUSCFbHorYTXGDufSLOzaaWF7+nHdhJJIKJlFtMjp2ySwW3Kwzv2b6rAqz3cobp62PGnxTcNhpfA8I7ZGakZECSjDIOCQX9AGqC3Ld/5B2eChnvV1J2wBlPVMn99S6G67GowzuCS7vFrMI1y7c0iRQkc+nVIKQQc2hIlrMk08mQrMNlEkc40MzsXwUSg/qgm8F62jcyTKxqf0K0PjyKjK9l2/AYKz66kVSaoiG6EUG+QEmMi1KvHpy3vRQMdxaHvXhHPDFMqvG9UbaD+IumFd0OxTwcQucWpETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVKuGTd0CJhcCu12dtVVNF784Kv2ClQTyfNuw/5GBmQ=;
 b=PuUnNhOvGBENC/3pUr2HG4CpBN/NNLln+nsFhUF3SSVidDR525t2StttXgYLkKvOaHcw6Q86/aiIGM2qhNn2F2NMIyU1VwZlwmeX+4kyzEEEMJkWoqzYimxzPbY8CQ7CjkVCfwMJLeK2+T4DaqxMegdRzGv5Aqv5EoU5yeXf9w2G2wKD25dHOXFNml3IQ6591NeHwIhbNx0TL/pugVE5tHq5zWdHdaJbuD8y9VxKeg6Bid8DZfO63QKC/n5zv/uXqaxAMi43+7heco/SkpX+j+6V7eATYRFR9I/PXCVzYsLslJmdMdh4r3MzgvR5Gqqsm5HMDN2Km28m1mU9EGHsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SN7PR11MB6751.namprd11.prod.outlook.com (2603:10b6:806:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Tue, 26 Sep
 2023 18:13:30 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 18:13:30 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 5/6] drm/edid: add helpers to get/set struct cea_sad
 from/to 3-byte sad
Thread-Topic: [PATCH 5/6] drm/edid: add helpers to get/set struct cea_sad
 from/to 3-byte sad
Thread-Index: AQHZ4W2/fMyHUQVE7USdvfphajP9XbAthkuA
Date: Tue, 26 Sep 2023 18:13:30 +0000
Message-ID: <IA1PR11MB6348F33054C83992AA6A423CB2C3A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
 <eba53a0904126fb904a5190750002695350f44eb.1694078430.git.jani.nikula@intel.com>
In-Reply-To: <eba53a0904126fb904a5190750002695350f44eb.1694078430.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SN7PR11MB6751:EE_
x-ms-office365-filtering-correlation-id: 3f417a70-104b-41cf-e366-08dbbebc49cf
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l7Rr82mLRi91dizxbQ+fYlNuejOKKLS+R07kKrtDQ2+XYuGWaihy0J/JFyG7/XOUZ5Pv8lU+Ea/6/DGNIsgddWVy/TbRVzbqaBt8min6YZJjRVz8BbElK26CrUme6R6VkTwOSIaNcj9aEpRkDjpOCGpVYX8v1IAQjC0WSbzIeHpECKkLFwVgyp8nkpxcoIgqkjmaUzQlW7YMxaJBx3GzQgYCJnyP2kZQBRz4IducGdDO2rTZ3u8rilEdnIURKAAYLyuefDB5ERKHFQK0tyz5JIZNd61xycmBZP58qYNG0gRW/ak8Bi5wIc6SfiLd/vUenYRUuXEqNts28hFHK4oJTpanDRnr0mc2Qaz5Y/zMusPulVPlYWXvSDivz7KxsiMDO9LkxDkucP3x0kWmLQeWObn/gMVeQJZrb1FVdLHLJ9/o962hO9XM0vNrLDF2CX83t3e6B9UgkXbj0OXsGWRk5B6/uEBk194t0QA9XzR+wOA8mSkT6I3SybTR2w5jNPpzw0K9A1h559xiuxSazPmGUtr7vtw7+Xl1MsadXGlb4cxTFYa6sLpX5zM/6eenX6cXBhIxv35OS876ZY1m3OTyL8UZsnGHK2pF9dX4G5EgNLAL4jLbIGAelh9wIAXMjSJH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(26005)(5660300002)(52536014)(82960400001)(8676002)(450100002)(8936002)(83380400001)(122000001)(33656002)(2906002)(53546011)(6506007)(86362001)(55236004)(478600001)(4326008)(7696005)(41300700001)(71200400001)(64756008)(9686003)(316002)(66476007)(55016003)(76116006)(110136005)(66946007)(38100700002)(66446008)(38070700005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bUp1fG+DWlYHdlcmU6Y0QoQDIIZPz/+LPU9BHeRFTUUbHtCJXy2dpL4hAmkn?=
 =?us-ascii?Q?JzQbX0PvEkdX1MyBWd2TAau0ht49zopd7s84ACqKI1RSRbIlYgHOZQQretA/?=
 =?us-ascii?Q?Anm/z15IqC1buX/So88WKXD4FIB7V9A6ZGGhKGuca800lzQKdrsA7ZCADmW0?=
 =?us-ascii?Q?GQD5pnH8rzepXw/vIZ+0JS9/avQfJdziecqW1D3sRpSVjvuIMKyIrfbVJBFA?=
 =?us-ascii?Q?UH1XGcqpGFEVWbObASu1IzEc4t6lPk/GCrKO+Mj7mqQuZv9lfRtJj94s8nGj?=
 =?us-ascii?Q?enqoqEqmJzBS7TAwRvK8SSp0u6yW92CumqoNCIogIzs7zvxIqB4dDn6ky233?=
 =?us-ascii?Q?sgDnwZQjLSD20BDFfQb9c+uqaRE52pY7OeUns7pFXtPtfESQ0S6sLBUzFc6H?=
 =?us-ascii?Q?Ea8Y3bDZRvq8tZw5VWeflxiwF2v5YCVEWHUy5BPMZipeqcQNrKfjX3CFnCZG?=
 =?us-ascii?Q?LpJ2cPtM6PrH6pVRq1H5f9M6ukL/2ZBgIHZZGnClUg3F7MQ/BR6LhVSGgBqH?=
 =?us-ascii?Q?dmpxMqjKSLd9kQL91SwlXbY/v6pxmalT2M1q54KxWppYeTX6PfWfQ85HRuDj?=
 =?us-ascii?Q?Yro5FlQw9Q8WtGuutashQ1XXHhTaU4w/L1osOODHYzGxf0haZTGN+QoSTOth?=
 =?us-ascii?Q?C6mRhz/JSIHgsfUQNShsP5cP9Gu2JXkNr2fnv9veoH/yn3FLb0OM8k7y6o+A?=
 =?us-ascii?Q?mW/whlOCwdRHZg5SdbFOlKNTrLSVJlyY0fUbI6R5aIzETpqGMvcTNCzk2uUY?=
 =?us-ascii?Q?HeDac19CZH0z47QEf4WmalxPSErtjoAdsBsFFQFNLbO8S8/WpwQVeTMAM7La?=
 =?us-ascii?Q?keHra9iV+FeUFl9zrNA3VO2SVZ1a16eOpAlYJNE8D8xHeRdKXYRkBJ5hkevc?=
 =?us-ascii?Q?doPSmnOxUWKtHMRAMOoLcuCPoQVveZBSgjFAg5HaIiJ6Jzeh3+sFZI7LAm5a?=
 =?us-ascii?Q?swTRusvpVUJv8gkU0Cn+o/qamhX2Y04JIQVSDNlnx/QvKdJM9EQXTxYEHfzv?=
 =?us-ascii?Q?XnQwic20q19H5v4oAjwxQRl/1uKYP4Wm9zsBylbaUtRDM6lJJYyn69WPg2/p?=
 =?us-ascii?Q?Hmh/752uSAKrnFM+jJZfNnLZPZiWHK2IMrbJFffJqQtPN0/FE5wAGVcqPSuk?=
 =?us-ascii?Q?UyyZoF2dqK7O2nnkC6qa/21w7pZyN+qtbxqqFXMGE4KrFu6CGkzFuRk6SNaD?=
 =?us-ascii?Q?5ayiUpviLSBTQ4c3Sc2539nw1KhNPwkDr3q35OY4nr2A+RcQiiSsu633z72x?=
 =?us-ascii?Q?iy4dxTBN9FoZbOYkYKfQb3PGfYLZQNSCNxZhIKaAd6zpAydfu31wMw6VZnhb?=
 =?us-ascii?Q?OX7fFyhVx6EKkvhWIGykKMnF3ZfpPuJx+k5qV8EK/hy3+ngJdl/7E0EVWOlB?=
 =?us-ascii?Q?TFcYQpl6n2pa+0XxpJoOo+RD7FeZYbec+UM7n9STSvvBQQ5d77qj43dkS/QL?=
 =?us-ascii?Q?JPQ4HfCCIgmXGm0oKcz0PgiVjyPCKRNvXIhUjlOa/UkNyUOOiM/crROxBNm4?=
 =?us-ascii?Q?plNKhZiaOo5odJWMQdihRoPLGQ3zpw5N6CvzBmqC/pvVWD8hTm03gvPbHXbO?=
 =?us-ascii?Q?TkXSoTSgfrfqE2Io6VzqZWC4fFBtpzURbLd7jBiZjbnmmWm+xIORsFCFVaJ7?=
 =?us-ascii?Q?hgMMyKLIoa8h2vXLOC0oQ90=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f417a70-104b-41cf-e366-08dbbebc49cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 18:13:30.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5Q1MN76QUu8UgoKQqThDOxyM6aCLixQcwz6VeR6ih5FCL+ft5gU/9YWw/qsJL5EbW6I9H9aem6n/BcHipYxasnxi4MV5D5jecGd89AMpIjlEl/eBD+JyBDyHDSkn9/n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6751
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: 07 September 2023 14:58
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>=
;
> Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [PATCH 5/6] drm/edid: add helpers to get/set struct cea_sad
> from/to 3-byte sad
>=20
> Add helpers to pack/unpack SADs. Both ways and non-static, as follow-up
> work needs them.
>=20
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c     | 33 ++++++++++++++++++++++++---------
>  drivers/gpu/drm/drm_internal.h |  6 ++++++
>  2 files changed, 30 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fcdc2c314cde..1260e2688bd7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5499,6 +5499,27 @@ static void clear_eld(struct drm_connector
> *connector)
>  	connector->audio_latency[1] =3D 0;
>  }
>=20
> +/*
> + * Get 3-byte SAD buf from struct cea_sad.
> + */

Just a small nit-pick: 'SAD buffer'.

Otherwise the change looks good to me.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

> +void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad) {
> +	sad[0] =3D cta_sad->format << 3 | cta_sad->channels;
> +	sad[1] =3D cta_sad->freq;
> +	sad[2] =3D cta_sad->byte2;
> +}
> +
> +/*
> + * Set struct cea_sad from 3-byte SAD buf.
> + */
> +void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad) {
> +	cta_sad->format =3D (sad[0] & 0x78) >> 3;
> +	cta_sad->channels =3D sad[0] & 0x07;
> +	cta_sad->freq =3D sad[1] & 0x7f;
> +	cta_sad->byte2 =3D sad[2];
> +}
> +
>  /*
>   * drm_edid_to_eld - build ELD from EDID
>   * @connector: connector corresponding to the HDMI/DP sink @@ -5593,21
> +5614,15 @@ static int _drm_edid_to_sad(const struct drm_edid
> *drm_edid,
>  	cea_db_iter_for_each(db, &iter) {
>  		if (cea_db_tag(db) =3D=3D CTA_DB_AUDIO) {
>  			struct cea_sad *sads;
> -			int j;
> +			int i;
>=20
>  			count =3D cea_db_payload_len(db) / 3; /* SAD is 3B */
>  			sads =3D kcalloc(count, sizeof(*sads), GFP_KERNEL);
>  			*psads =3D sads;
>  			if (!sads)
>  				return -ENOMEM;
> -			for (j =3D 0; j < count; j++) {
> -				const u8 *sad =3D &db->data[j * 3];
> -
> -				sads[j].format =3D (sad[0] & 0x78) >> 3;
> -				sads[j].channels =3D sad[0] & 0x7;
> -				sads[j].freq =3D sad[1] & 0x7F;
> -				sads[j].byte2 =3D sad[2];
> -			}
> +			for (i =3D 0; i < count; i++)
> +				drm_edid_cta_sad_set(&sads[i], &db->data[i
> * 3]);
>  			break;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/drm_internal.h
> b/drivers/gpu/drm/drm_internal.h index ab9a472f4a47..5b7c661da459
> 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -22,6 +22,7 @@
>   */
>=20
>  #include <linux/kthread.h>
> +#include <linux/types.h>
>=20
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_vblank.h>
> @@ -31,6 +32,7 @@
>=20
>  #define DRM_IF_VERSION(maj, min) (maj << 16 | min)
>=20
> +struct cea_sad;
>  struct dentry;
>  struct dma_buf;
>  struct iosys_map;
> @@ -265,3 +267,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev,
> void *data,  void drm_framebuffer_print_info(struct drm_printer *p,
> unsigned int indent,
>  				const struct drm_framebuffer *fb);
>  void drm_framebuffer_debugfs_init(struct drm_device *dev);
> +
> +/* drm_edid.c */
> +void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad); void
> +drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
> --
> 2.39.2

