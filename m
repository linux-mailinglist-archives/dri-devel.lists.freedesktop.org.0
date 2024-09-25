Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FF98527A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 07:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FE910E780;
	Wed, 25 Sep 2024 05:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBDTFEaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9010E2D2;
 Wed, 25 Sep 2024 05:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727242474; x=1758778474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xkmBBnwAQMC3kwft8kBDoW+VzDWXa7hX616MG+fOeHo=;
 b=XBDTFEaXj+VSVeWfWy+lVwRLNkr9WsdJqP+13CBSI6w89flO3V9/nEJI
 /CxoWyPd474aYmkE7zjytKU/DvxnH4CcZIS/pktLIqjwKJF4/GeiFCp2D
 4dwkhJtU2qQSyYbQq//obew27tpR66dZiv/1YmKAHTHZV5qYf3TVyOaKZ
 2u9Qux5PjjzXpwwiHsYJFJt727xFEyzl0Bc/7KrazLglfYU3miu3okvo6
 W6QgJcS33Elw4/m1ZbOiMn1J0mXj2ZCTc8sDJImCmK6laD6AWcnguaNtc
 sFDo+a7vM+J9MnXadw+Q8+19D/BXnorRnHgetZMxZhmkkeO20I25OgLpK Q==;
X-CSE-ConnectionGUID: zA8Sqv4VRWWJ5D8EaY6Qbw==
X-CSE-MsgGUID: 99BdAP1nSC6TxlYrdXemjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="48800936"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="48800936"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 22:33:11 -0700
X-CSE-ConnectionGUID: rrLaa0YFRUGLAArmysZovw==
X-CSE-MsgGUID: IP6mXs/mRhy2RlX6dw+4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="102475917"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 22:33:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 22:33:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 22:33:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 22:33:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHHzOGSg5yk6ms0tg8mL7HOGFOaYOVrvCsoemedN/js9YS4z42EUkTNrigVRXqcRWALXKMe5Q2fwpFjJ3KtqqiizQWLSyCVfueb1VcXr5QEDu9xjzXwkTYFt7MvbCwdeCDJ5d/qm6YS3b5KiFf9maw3ZjD1w3BV9kOUZsGrdpOZWRC5KOki2eOIEI8Asy3maOBIaaBFTlDgE+RFwXixbG+v7debj5ovSAGOwWjrfGkMymLjyjlY0yq67/Aftqr5kOkYRSajg/JTiKW5sYqJ81AWohwnl6mrqBZvuS1Z+sPruEJAi3DmiO4GLzEzw2N16B7A/t2n1pbAAAifB60nTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt1X4NcBxXg31eRgHH10tsWJIS3cpdjxFXWMYZUvBjM=;
 b=s9CI05PnnK6ZeB0lOYlXZFx48+HSZwnpfbAw7EtYoXnJ8W3+oHvhn57NJUMsRXtlts0K/MBOnZ6HRWMzlpC+LXFnKTado5GJGo92d7PotJK9WNUrMVIufPCm0e+FvuY6i8t/oYixfiimtRgkLlYAqsh8UD7DsYwp05ssKCpBP4E53JStNl47NSriUzlISEIov2ifAfAOSox/D2n66rd3HrP5s7NHneIXyfH25WjnC0egBAXlpUEpssd1mnnoF6x3HSuuXdV3j5uH+Eq997BNY5AJhsUAOepfc9bh3bjA2v21NpzfQ+SZe9Sz0rQ3wwpqqM6Qc/dbEPXVDwOyITV5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 05:33:07 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 05:33:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv3 2/6] drm/xe: Add histogram support to Xe builds
Thread-Topic: [PATCHv3 2/6] drm/xe: Add histogram support to Xe builds
Thread-Index: AQHbCpmxQo0ZD+MB1kKgv0gXsIVqdrJoA3SA
Date: Wed, 25 Sep 2024 05:33:07 +0000
Message-ID: <SN7PR11MB6750275ADDB4308419FE9E26E3692@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-3-arun.r.murthy@intel.com>
In-Reply-To: <20240919133140.1372663-3-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV3PR11MB8481:EE_
x-ms-office365-filtering-correlation-id: cb3cb2ec-c3b9-4f24-0e50-08dcdd238955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jmSalVICqR3scewm5Qb/mba4EfVfGdCmGh0NfJqFyVXsJhLDC1BTsVi0slCi?=
 =?us-ascii?Q?EHF8Ui3beYpDp3BR5qL5LPDtzltOZM0U0gmYYqAt/lWVKmXwUAkYLKV5s5+f?=
 =?us-ascii?Q?JQ8V5f9n5DxM+InS7U0lES+2i4/cf4fXJ1dqEMzKqZr18rqlEOZQSjLn5BDd?=
 =?us-ascii?Q?4lFYO3iqH+4E4swe7g3n4rItnSMcsK3S4tWgakBW0szS5U7zNU20+Gg6OfGA?=
 =?us-ascii?Q?Y8viMYmBmagWOFtJI5b94Zccihwfi50QaIPEWkHsze1J4WjX6glg2Xqnfvyi?=
 =?us-ascii?Q?5lwm9NcpmQSSp/nCRJDrVieJQVBMBUiJe5H4R9q3pb3URi8+znNqYsEBdvjU?=
 =?us-ascii?Q?WSrQD3kBoPb5JgYlPZID8ll0eXsP/3IjHdU2XquYDJw3p4DPpVurHYbUBBdB?=
 =?us-ascii?Q?QKCLAiJvphL8DAOUxhIdji2EoDBdU4LIMuXiTR2Xu3Ex8a1xsPiD5roQksTI?=
 =?us-ascii?Q?1uwSVThCDqQl3VOv8NTzErYtA5vX81Q/78jx6OST4fIL8/59YBacKyxwK6ai?=
 =?us-ascii?Q?FXpaRwcn9yQxyjE1JVbMgSI7T3DKSfqu4ZKyiNUHtGFR7/k3TOqoeyV4e3/I?=
 =?us-ascii?Q?eGNY3IdrAuK0U/+eznd0cEie5eOusuOo6XsjqWC1QBKuNzGY2yKQNSUnZn+4?=
 =?us-ascii?Q?tFKz2cVW2OGdsDK3z15CjKU48s2qJa3lO3abcac5iyTnmctfFQI02uI/vVCc?=
 =?us-ascii?Q?4Wmr23wDgWKHiizoqxY11gfnIq98RSKOTD4BE3Aeft2lXyc87LRfSyoSRZQz?=
 =?us-ascii?Q?yZKjFLIJeVJlG4azTwYxj/VjgnsdHkFCjSlarR+giiRxoyK6gNXSZi4KFvnR?=
 =?us-ascii?Q?CK7uq70OG7jDKbn8CafqoUk9WmMpts8IQQgv+hRZsFB1nfve/IICuykDW+y1?=
 =?us-ascii?Q?/EufmZdCBjL/T2vZkDjX1bpY1Q3jbyatnyqUE2pzF676LfdHIsmIEE1dXdMc?=
 =?us-ascii?Q?fFXkd4KZ4/9iRHT3ZcN0XqexMvaSUywR8jIVUU4DxbRyegYVK3CRpsJAiewL?=
 =?us-ascii?Q?0lL7fODX+c8dQEL0luu4bnU99LNBlQjsksGyCZecXZwDDSMZTuTc9PeeNp7l?=
 =?us-ascii?Q?+pdXdZfRHD5j9SsbFeSeB+GY3fnoa8snCjWBpveeJeMtyJ+3SUW/iJ53iYU3?=
 =?us-ascii?Q?YPC/9myLY3Ho5vFNlGDMN+1kcLFn360Ljl16JjfFC7BhUQvhtiFz2AbMo0N3?=
 =?us-ascii?Q?cltdAIkUTegH2bnxDG6v8TJXfwhgf1fhZAF0BUgEV3BTgeScSmMKdnzrMtVM?=
 =?us-ascii?Q?BPe8GQ6fvk0JIB4udtEKFqUT9BnT/XVIbiQK+a3YX8WEcIyPuvbfTRhxHuM2?=
 =?us-ascii?Q?S9JArKgEAbcygYPpUivxXdtzU7UDUDN3TBUxVFdXqcRJ/g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p1OSl1DTTANDCm0p+MSyq2Rn9KlqhQMhzI1pn3VT45booVcRMzf+Qc2ZtCAn?=
 =?us-ascii?Q?YLfujc1r3y90yGFdcSPdWJi1/jznMoJmGUZ32hypvbdaLG3BaMQSFuGXUeC/?=
 =?us-ascii?Q?cmOPwzM5lDF23bPASlL8uK4oz8hx9gIPPLH0dx32MlPQcs1xIqwsT1+RB4lo?=
 =?us-ascii?Q?d3mHsv4U/rVpd5Byz69XOlQAf+p00tfSHzcQxe4LLMxEicqPCZasd2FB39GG?=
 =?us-ascii?Q?7Db2egNqTKBjljnyZs2I7ogZQl430OMlTpRQ1/26dbOqLJEK4aDJ8BmcmhNI?=
 =?us-ascii?Q?LLE57nnMpdbw/JMeUt9rqQ0Z8DA+L8CPaBDHXoVuuwyMHpV3fN0JYHYd2OUA?=
 =?us-ascii?Q?SGyDPc4UuDgP4rlLqWyCHg+fL2Ob2wQ2vOzFZKSKGQsIbZzh9N52QIRQw1Nr?=
 =?us-ascii?Q?v2aB4buMVwSDbknDcfAx1Kix3mQyLJkaEUkhHbSHOXKVQpFxIjVtM4QHATig?=
 =?us-ascii?Q?xVLNPMRddyk9jYe+FBWPxzYerzr0QuagN4olA/mbPYe/nDI5UcnJ5nbPVEHH?=
 =?us-ascii?Q?ZMkSVZOyzKD5pfQF04itNUfjADa0byMU1/HeV/uIKZpYo52BJT4hMrAzuONq?=
 =?us-ascii?Q?BbYFbM9vaqX+iALnOteL3sd8RIi42L46xm9Z6ZrO30KsbVUmPRi0JuQjtuva?=
 =?us-ascii?Q?veK3aNVzTin6ZPV/0O2uLwThx0e22mjSTn6SA+aNMuY+WnzPoCI2buYr8tpW?=
 =?us-ascii?Q?055e5cY5yRn6afmJ7LLjWiWIdnJsHJQTrmCDoLHlecDs4aCXGpPjbzCRCJLR?=
 =?us-ascii?Q?DaUbRe2CbTJUlWbxYMV86WIoS4xLucR4HKZc0ZJyB5jRD79wG7VUTgmxasG5?=
 =?us-ascii?Q?u9KutSye0XZVlTgLZv93vPATSvdO7umuO2SbBGmXq+8lS/xS8tU0nr6QvqkZ?=
 =?us-ascii?Q?g/mbI6oHElyBJJXRzjkJvFoYm2FIN7n2p2qNRFYfM4+qbJmgzU4UvHQI0p2e?=
 =?us-ascii?Q?66yM8qiEeA9XIZz0aI6ayNyiUoXo6X9XnqPqCDQuortQ1oszEHd/+2dzTjAA?=
 =?us-ascii?Q?bNQZ2xu8xdh6gWw1HP4tEAS6Zq9EYuAMojSSXadCggAs20/BNB0pGNWESisu?=
 =?us-ascii?Q?vudJZa13HS+G3K87o0BXYIh+942eK0hUwML90xGklk/x4IVDOBIoMMgjWx1p?=
 =?us-ascii?Q?BmWFeMT65w0GQg0HqJHQw6oifqKVf4P7PLZvRVFHmDa8QFc+CbwnxrGJrmNz?=
 =?us-ascii?Q?x57BfIimGhg1Syx4CnX5HbEFDtX9BPwv4JyIMfC/yQ+Yxqe3kw+QaTxgGMXs?=
 =?us-ascii?Q?xS+Du25ttt1JPbwJ/EOzWy7PDJ9wlHFjfmcQRfZLDUMacvY+B8AzQ3wuPCsv?=
 =?us-ascii?Q?IIaBG0UDHSLCsQvs7p99PFrd3S+ZIqGMj7d0FeYVr+IwpNOV1xyXwNOYQ7Zn?=
 =?us-ascii?Q?U+Kjmz5kjr/s/kWw6XV8RihwE5VuJxKIKL+EQHzcjoe1vhNgAfr3t0TOCEh0?=
 =?us-ascii?Q?xnX9qQoBPpliPeTCd6wpH8VgCElG/8irpnH5cu+k1qMD7Chs9WBHReXgMVXb?=
 =?us-ascii?Q?nhzWJP6DgK497joEUJtpexdJwWWKF1TVWy6XlYS6zKMaOalUt7JyGrYz+SH6?=
 =?us-ascii?Q?sTaB+wcOt9Wssgt9Jz4yBJ3T1cuhinKWYjaEOG1N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3cb2ec-c3b9-4f24-0e50-08dcdd238955
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 05:33:07.7286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqblSyMUP/rfjEHunnyqDcx00swVOcFMtxqNkhXQma0cf2WoicKu7JyOXMMIUMILwzSUVmxwx7pWS3NuBOmh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ar=
un
> R Murthy
> Sent: Thursday, September 19, 2024 7:02 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv3 2/6] drm/xe: Add histogram support to Xe builds
>=20
> Histogram added as part of i915/display driver. Adding the same for xe as
> well.
>=20

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index edfd812e0f41..2a5e3ed5ea17 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -239,6 +239,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	i915-display/intel_hdcp.o \
>  	i915-display/intel_hdcp_gsc_message.o \
>  	i915-display/intel_hdmi.o \
> +	i915-display/intel_histogram.o \
>  	i915-display/intel_hotplug.o \
>  	i915-display/intel_hotplug_irq.o \
>  	i915-display/intel_hti.o \
> --
> 2.25.1

