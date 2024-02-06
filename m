Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A487784BEE3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60FB112E1D;
	Tue,  6 Feb 2024 20:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXPufmnK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0CE112E1D;
 Tue,  6 Feb 2024 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707252395; x=1738788395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aSCkHcyguEM4omrhms6IdrqJGAvgoXndhbTt/jmDqnI=;
 b=RXPufmnKQimeuSnqjURcwlEavqDEC6/KJ9GFhcwaKcVEr3Is9OcAWoOD
 +jPCU2/s2yHK7EqGRhytzH+7At9r+dNWsTgDMGvDe81WhZdZ8C15ZwexA
 IhgSv6Ug0uo7zACxwT1y8mirQ+Mm5TGqLZxlJN3KuqkknJ2jMrmAXRIWq
 7HgeQY8lYhOg752bYujitUltSdJYyplsxYMPKuLJ3iFG8ASF1GG7skJg7
 CI3rKSroaaFHgHGWMcJHeSTI55W5Td7KnqxxJO8+uhzynos+8/iFE6gv8
 tfc/kYvfhLrMP41kauA77QIDYuEZJcx7CkZWdn23NFBRUuiIvJ82OZZ0e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11576724"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11576724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:46:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="24376916"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:46:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:46:34 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:46:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:46:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:46:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU3p+MQRNoty4ShBCsOhM3/2VltCxaQ+DQ1Yyp/Gs3rIAtLdo6rl6bI52zZEHtxyJldysr10Fb+kMbRMHpc2k3IPEzLB/4acwWueoVU9WBlCyIHV/GE41opDT5TvIlbLO0ldHa+/8SgJ0kwE3wD3p2X8aztzbNb7Ls2HAvFVVhL/LG6X1gVbVRNp9KRYK/D5lccnT+A+CWWZyx0L0qE5f7mxKGUm/Eldqz+QYYuZZ0hNNxvx1eqMYNSi1AqIaphITb88/PD/1d0kfBeaMpRUU0s6yngIYeFc6ld7cjkKU6obDrw80Q3G9pQMO2Xfv508e82qvHKTHs2NeSIetMlh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bqYqA4IJd9ZTBnO4v3lOhB7Z9gJCzPGUqCJb9iqfVs=;
 b=Xw76Wq4ZsvoI3AbWG0UzY+vsHPupVxTJqsJa50rRMrpm8AF58PKtt6Ncprk2lN8WHUhsGW5eH/gOYvuWzIZ/Y0rDwvCqtLdYN7QqU3nDucyFKWDCEX+5aUn9oDxNiFlvOSj4FE3e+eqnHeNyttp3IQx7tQGoLwSagXSdNlT5TYk9WVsC5MTyCtkJcbUUspi2gOCj3yfSM4WFDbMBUEm7Bb+dELkutoCUtBTI/fMvJkac84FiF/8NlXMxpdeMzSljtVOluU2Rv9t/M71xzGzTjcIsOWhg6MFmP9RcH7Bz48P5Pg/NlGkP7ofTeHhnzwMtDP20SL6seZmUosjO43XiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.36; Tue, 6 Feb 2024 20:46:27 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:46:27 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 17/19] drm/i915/dp: Call intel_dp_sync_state() always for
 DDI DP encoders
Thread-Topic: [PATCH 17/19] drm/i915/dp: Call intel_dp_sync_state() always for
 DDI DP encoders
Thread-Index: AQHaTeccqUSmwxgS5kGdAozabngX4bD93zug
Date: Tue, 6 Feb 2024 20:46:27 +0000
Message-ID: <DM4PR11MB6360194E37BF466F3FE436F6F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-18-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-18-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS0PR11MB7649:EE_
x-ms-office365-filtering-correlation-id: 7aa490c8-50eb-4874-df4d-08dc2754b090
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OtjSuukHBofi6OqCFH6doUPRTsy7EUClJOqpDKzCnTi6J/hfUfQDbiwYAEBzPLStINT0SYtT7Xb/xGK4N9DTCqUzvYPx08XOmOU5G1N64oTVryqpn72YGXVX1QbTJGw9qXfVnEJutRXOxaEJ3GOOpjljq3PTjE8aOzLXJ/YICl+Xs9mE3u2+cXX98koAEoZwOGBiTAXSkPOvdV9dv70uWqe3g6+m2A44kh5yKBSKSdPArey7ljDzo+O/VJjaZIl0ZwcolAMTcImxEUkAkIdWl7ppKD5PUvNqj31TTEXHgsTSmFC1Zd3ZNKK6bv+aER59P40EN8TX/ODw+l+7N7yPI1J8PS4ympQ2zvt4GxEOgb47+3YJkpEge0sbMWPOl9HNAvD8k7NTdbEPZPfrzUTo0nIwrq558+bS1LJXHpCxh1XW1yjIxZkgc7xypHSWZSxcBLSG7qHVYZVuiUFc5/BKMqUNxKJJ+qmUoBWhPZtJFZ3cwM8apwzDacn7MQpSLi6K9TVUSOgHwtIBO7I83qRtTm08+FW6k42gzDY0euRSB22m1qoBaMnutc6UATkK/5is1FjP+sNK+X0IEltORAA/FG8NeH5zIBAgRsgrLmEXdvSSh7nQvEIhNP+w2GT/3OLi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(26005)(86362001)(64756008)(5660300002)(2906002)(478600001)(110136005)(66476007)(38070700009)(76116006)(66446008)(66946007)(66556008)(450100002)(52536014)(8676002)(8936002)(316002)(4326008)(9686003)(7696005)(33656002)(53546011)(6506007)(55016003)(122000001)(71200400001)(38100700002)(83380400001)(82960400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LGSskB8oJ2COBM+LAYWKuXMJxPcDrZAmXd390PrrGDBw98XKzRYPMH0/iq7t?=
 =?us-ascii?Q?BZDyDfe+KfWgSlCkRJVzvNvrLly7VyGpDdHvikzCBgIk8KjG64flc0AsYmOe?=
 =?us-ascii?Q?yZBt9bErqq7wTBnuF6FdvRy8BGo2RbGs6A1jdiGghBpNpDGjFEcpYQFm6tm3?=
 =?us-ascii?Q?hA5dj/pCnEA4Ge47Mg6Kv6iYFr/AyAnFYdgPzuAoPNI0zN6QkbH0HwHjRq+d?=
 =?us-ascii?Q?RpXgfrRAYygnRG+jxshVuWRvbJEx9V7u28UDVVOCEZ3ieD+8jJlXir7IdGZk?=
 =?us-ascii?Q?Oluy/IjIBw/+pF6jl/zYELNdGsLswB6nRa0Rzzh27yVDGMuH0dsvyEdDhbK1?=
 =?us-ascii?Q?SF2imXg4r92sFKtKvYow03D733oHNILbuqB+XxS2Fwl51IHxGgbF01ZkZEYx?=
 =?us-ascii?Q?5NaDU/SPnFvoxPl/6TY1DDzKpZp3BwUBUF87u6VzA/H3CKLUN67UFB+fWlKo?=
 =?us-ascii?Q?hPTg5413DIAdMYeKPXN/werYmsyd2ab4ceixkuctR9qPFe+xJyuhBz1hbX/A?=
 =?us-ascii?Q?l1FkxrI4r0nGqMYu1iA3gpxbdYnoNPByvfKXUBQYmHTmYITMlvBm53SPXbBQ?=
 =?us-ascii?Q?MXlCsQkzt+kaAftu6QUZu7EjjFhLA+elTrl8PmeXJWN5uqr6r3RhALoKBunq?=
 =?us-ascii?Q?NQeSRhNnQ5OMHn1qmOSiYkf/EMBj4oBLxB6B/qmd3gWIbBB4OV3kGhR8jy/5?=
 =?us-ascii?Q?kqk9HWMGhtTb4w7kGAb84qaxLalzdwWQKvzYGzVZXaqN2XgD12UKPesuztm2?=
 =?us-ascii?Q?CsZ79ChANJjUEc8HDQAokr+W8esPs/2PvvUFh/04ReIO2+2PrT750BVgCTtg?=
 =?us-ascii?Q?CMKQ6AriR0u5JKaUjZKkn2ji1uK1Ep54jVp6vkPLJUZYIVcoqv+60JrsVycT?=
 =?us-ascii?Q?yMSAya8U9OPBwxClnbeqNXSO7poWQ+xJSsEDjkfKULC8cYJJJHYR8+E3HRda?=
 =?us-ascii?Q?tfGx4OxmH6UkWEfrTzF8l9r3+uKbQioPoXgCRFKyFKESNer9EueDktNKu9Kq?=
 =?us-ascii?Q?h9LWWDr3JI2xUoqLujk7pzRKjYgN9M1br86f6KFLDlJqlmYdrQIhjNq0lVLU?=
 =?us-ascii?Q?8Fx6IBuxRF8uQYmb7pP2NshtXik0uxcLtLkO3PpLLhtBS+MOA8Mj5SR0IBwO?=
 =?us-ascii?Q?mMw0h98e3GOJDtteLrmtGGZLa4F+DhlNPMwLiGXd7Tu+A29Sp3mjC3P89fB2?=
 =?us-ascii?Q?W6JhJ6mxwrE+oHis3acrgMXd+BMQU5LRWWjCW4BC+OYtn6F+SrPhE4ltkI+Z?=
 =?us-ascii?Q?r49UsuYW95ojaI8S0ITh9jSfNBV6IOqV5B2xU6I4+uM8NcIoTlq0NF1NAOV8?=
 =?us-ascii?Q?PKm97DgaWaQm3WdkFPxvYPetJGPWLyMBWl49BctgDCob1Z4t4Iqo53vzTa0L?=
 =?us-ascii?Q?HlG8oXFzIMF+Ew8tLNTd2jblhJxrDlnKUtEzQVnZyCCyVAzjmj26wdYtTCm2?=
 =?us-ascii?Q?LszUTIFar2sMS7jGwThXaGcMjGWifKpWJc9Za1jFUyroAzvcnLNeRCmewv68?=
 =?us-ascii?Q?M6IK+FQK5FM89vcJ8T6G6W/RnDhCujZXKjn/syAba6yWMl+Ime8ICcaYPIUa?=
 =?us-ascii?Q?xYVobKG9KfvoaBXrKJMZaLJ6/fYS/truCUZhPZiX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa490c8-50eb-4874-df4d-08dc2754b090
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:46:27.2180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +F0YAJtZtbw0FEAXcD5K7943dlcnmAeCITdNmtUAScmFXBcGV1wsUngWBMl0IqJu9O6ugGn/puojeo5qcfgM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Tuesday, January 23, 2024 3:59 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH 17/19] drm/i915/dp: Call intel_dp_sync_state() always for=
 DDI
> DP encoders
>=20
> A follow-up change will need to resume DP tunnels during system resume, s=
o call
> intel_dp_sync_state() always for DDI encoders, so this function can resum=
e the
> tunnels for all DP connectors.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index aa6e7da08fbce..1e26e62b82d48 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4131,7 +4131,7 @@ static void intel_ddi_sync_state(struct intel_encod=
er
> *encoder,
>  		intel_tc_port_sanitize_mode(enc_to_dig_port(encoder),
>  					    crtc_state);
>=20
> -	if (crtc_state && intel_crtc_has_dp_encoder(crtc_state))
> +	if (intel_encoder_is_dp(encoder))
>  		intel_dp_sync_state(encoder, crtc_state);  }
>=20
> --
> 2.39.2

