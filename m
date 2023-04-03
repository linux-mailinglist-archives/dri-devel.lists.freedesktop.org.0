Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF346D3D79
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 08:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DA010E13F;
	Mon,  3 Apr 2023 06:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834A510E135;
 Mon,  3 Apr 2023 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680504105; x=1712040105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qyb8Kiy8Xl+6742h3rQXjs10zXay7FMQTZ6pym+qSkc=;
 b=eXvR8ybKFB9IjUX673kqjxmPYawfC5F/7bG8UfXYo4qbNZbCgK5wpHZ7
 tLapjM5lPDjNWY/Yt6Rr1HMZoYu1Byk6w5gJaj4yvq5u2ZTk/Vx5KJLlD
 mF5a4GRLk5kldJF4mvsive0OvI6JryEo+59jXGfX369FA6kohJFv4Z8xl
 6znLqyHlRHLAzdCRTeM/3nZ0IQvd6loKOwuaYPenPvy0RCXLDRNrb7HgE
 QIIF0ERytjxxFT9LhjYTrYs8dLWQvQsSRkYxcxwANFgi7sMHdBsLy3Fdd
 RlEoJrBC5QIvwhYU3zo5a2+mfExVGBY6849Xajxp+rjujDjWcpBHxW6y/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321483901"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="321483901"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718426991"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="718426991"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 02 Apr 2023 23:41:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:41:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 23:41:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 23:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNnI9nZIDKJyQlnn/UxAyLhpbHjP+m+jf8hD22VIHGMRzKiD76E8qF6qvjm1bUA7zNeelO9lrjg8A+dX/MKjovpjWSr3HlM8L+S8/IeNPSA+JPQXXhIJ+Tev5H/+VOWy/fhU9L8xgCzzHSN+IN2aUZ4KuyICJoORBUN3/8bCdW4UA+/Om3J100wfgAHjwG6TtRvfl8PdexDV2wVTV/H4F3XJYyh2lfYsQX2sJ9R/wU7buU5c3HxaALW30dCicqvs0rVvIPYtWdAKho1o4aC2FFxW6Q0o44JOsear0rlFUXdrUx9Yqf/dNmIYy3PFeEtrJN4TlWN80nDFTInxu932TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o98Fm23nGrD3NmLYHzzH+c5u+qlysp6fP6UmI8HW4T8=;
 b=jH60/sbdWPQe5rrFvX57pEcPWqt0OZttyg9t4bB8aZYx3++JY0cPeOn0Wohruo9OGMQiUcAryNvk74an5SiDJ81RByI2qcnUJM4MUB7fmYeZIFnEExCN9OtzEXnsQC44FI2GZsvZ8KbJJ4zNPVK3nr2pgiF4zrJUd05jhm5A76UAIMd0xb+k6HdqJMf350T34jkD1BBZ4tk4Frg2nIoadxdgbNXQX23MIwDjlE+hwTddC5JRQ/iVMwcZaD47bKgIc/phO7jktyH7vB/WfG+rlkKfievau4zHzV9svtrvatzpcUww6Z8VIJZ0NUuibPh7jfGlIH4bGXC4wd6yTfsYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH0PR11MB5707.namprd11.prod.outlook.com (2603:10b6:610:110::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 06:41:40 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 06:41:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Topic: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Index: AQHZZB32rT2PKcOuxkSyG2n0H7FHKa8ZJd3Q
Date: Mon, 3 Apr 2023 06:41:40 +0000
Message-ID: <SN7PR11MB67503C1B1FB74267EE7042A6E3929@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-7-markyacoub@google.com>
In-Reply-To: <20230331221213.1691997-7-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH0PR11MB5707:EE_
x-ms-office365-filtering-correlation-id: e220921d-710e-40a5-d654-08db340e7b23
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTOkY4dOGecDPLiEry0m6ir3UMi7pPmv6w8d6AvBfSnkMjNPnQmTQZcmuERE7Kz6tkjTHqZaO7rf9iOWXDWf1uBQYKohBfQ4f+yAzATJWh6fcnH8Xd5WrlGnHZbAsYJlQi3p76nas+eLoxM1TTbiHrNhYELADpv5qagVmhVVZq+Dsby0QwfZue5ul0TPHmy9EXzVfWztswQArOgfNUsks1cYN5kbXLJGzORnRWSLTg05KVKOgG3/7BTRVrPE5qCCabJF0glMTiJusty3KeurrMxaD4fnTGwrOzIBS8WI2iYpm6ntlkx2qiEnYcvXLfl//ImHl1HOhIcaWaZbG/YLrkW/u+yBnHEXtpD5be5LSB4IjHoJ4yWgF4tfD2Oy34d2ogCRN0Y8aiSRbT5ZsiIz/P8IOkyAYNa6SW3Zhc5w6FSXGtW3lBnNAuGh+efee7+/CPYEOiis82MDNadkyw/CBiq3Bnje7H/lgKd4mHWP4AtdBuOVCi2uyAFTGNE6u5dv5cOiZAaYvCEdgYnwM9vGuMsa9o/AQURSSVHeqJLQcUMGs8hkVyubqQatCnYLLPKXAtrxAtq92lx7rz1z4+caD4t1JuSLnz8UQmpAEzs4qJylAXpBOqiTmUv1HygVw6rN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(9686003)(53546011)(6506007)(26005)(7696005)(83380400001)(186003)(71200400001)(4326008)(7416002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(8936002)(8676002)(5660300002)(52536014)(41300700001)(478600001)(2906002)(110136005)(54906003)(316002)(55016003)(33656002)(38070700005)(86362001)(122000001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?peVA3uU/QoQrE7I0SxGWfdiVq3CMmtL+iXsW9XGGjNaCzgJGEck3QSQY0wRk?=
 =?us-ascii?Q?J5j29nZvUsYr7bIhhtp0Jr9OThX4ROkLLyVnGR23/HGE6OrRcqykMuAauFQb?=
 =?us-ascii?Q?F40BPGb1uWmrFw2lrCoEZyDkui6aJWOUsMCqnZEMQzLT/wqrLPZTh/Ket5HB?=
 =?us-ascii?Q?bU7EksO8K2eVyf6Pf8KS0DPY2IRrtdL2lUyx2McwVNy4l3kdidDdYyk5vZsv?=
 =?us-ascii?Q?CUNbUVNmZi50y1o9kS9L1AUG2UI0YAQaffw4HnXvYKixuo4qhuqbN6AawP6C?=
 =?us-ascii?Q?ZG0CKzfWgbvfkTSZAFbfslrFQ8J0NGDzqnLwTFVssgSKglH5GDJeLKVb8752?=
 =?us-ascii?Q?l3x9GXMUbX2SW92+Cf3X9YbnFrSCWmzFcIZgkqs+mX5Vtfo8IldrVn98R4cj?=
 =?us-ascii?Q?skQTtb0sDKnh9ktCfCCs/TIcxabQNtbRjYmByVuSfu0e3XQdhBi5mzPoEgb2?=
 =?us-ascii?Q?Bd5owrrn1xu0FaGYgMDjVm673g3hznrKZT5GIuITvY0qWv38B/R5tK3BkTda?=
 =?us-ascii?Q?2Woww7AzeMhBf5fdTx7KlK8ff1ZnciSxbHf0XmXJXkywO9fOlDJYVOY5isKl?=
 =?us-ascii?Q?oWOrBEoRCZ0BYLfcC2dYN9dfhj6uPWlFGB5JNf9qLDqC1e/la68UkwCY8abb?=
 =?us-ascii?Q?2p4/inBYQxeKZM6BJ1f03097YsxlhdQvhMXSluLsyKOqHWa2FE1i5xjn/t/w?=
 =?us-ascii?Q?9Q+2mIMiQZSLgci9PcmPwBjgEhqAXNuS3j4kIH1dYkQwN1Z/0krSHyDkB3H1?=
 =?us-ascii?Q?Cz0qamMEM/ZvKr4ndOXJ3SYo3udtudCU2SZyGTBmCn2KiieuuBrYMArcgLYP?=
 =?us-ascii?Q?sFUDdqvFZvDHbeQFtQ/va0Prbn454SIVJIvbVM7TQvoEbYu5c2oD5K2Oc7oS?=
 =?us-ascii?Q?P2PYHmRBgOY+1lQXoAgDx7V/NUC0QLOCeRVs9J/Fhpn1UwXfu7oBHEceOIPk?=
 =?us-ascii?Q?QxqQD+SoocTLQqjZQDngLL8B4Ua05zKhxzRNv3lNy1smE9RARXPX6shpNBJ+?=
 =?us-ascii?Q?a6xBUi7PleYlG9rtrQUUQEjOdW0aiT5DibVzjl6SNbl957MVF8XKvfwo4oil?=
 =?us-ascii?Q?GEMveYtfTOAbhP09WL2g0Ar9jXkkCEjvt7w34uBI/GiK5vUlYlqW8418jzww?=
 =?us-ascii?Q?n1ndbQLjPlRc5Eo1Xru/Z2rQgdTWTQcRNBRb5yNe9MI3pokV08WzjtZs1BR5?=
 =?us-ascii?Q?lThqK5pes/3EXCt6Pq9hX17cCHLOE+JLAGx/mi7+QY3eNNVRvamgFyo9gPSX?=
 =?us-ascii?Q?NP8nIJcMXraDbEtSLWceD5AIDSySWPt2+2JNipOzF7HkELaBQKRcMqTnyJMt?=
 =?us-ascii?Q?qR5awNqCXJqPqQLNzOp1XI8/jmZBUYZeisAJ7p0QZdYVfzT0veReyGWQDIXv?=
 =?us-ascii?Q?h2J/6+SFusM9H6exHcL7SRWlyGgcU6BUpVtVunYVQw1L6XgN7oVDYyZDIGSv?=
 =?us-ascii?Q?NfSRv0nAWPDuwtTRGv1XzuyJ0Xd9p8Yq6BTQ2HzmmODptr6RONXg1kPcQOGx?=
 =?us-ascii?Q?zroFj9oQvf4tt8EeUCJLD2zjdFK5ouPgu4jRwnMmT4cbCA7PV3cyjJuY7M3Q?=
 =?us-ascii?Q?McSdwrO+L+vhrKqUXNwCOJiKB8DkH9f/COvu2i73?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e220921d-710e-40a5-d654-08db340e7b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 06:41:40.2647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cE8AnJKI+BxntKOA7Rgx0m5e91GtJeKj2G5m/DMxjDTlCsDj4+NZydwDI/Qit6OmmbF11KI283hzoLq0Z9Be4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5707
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Mark Yacoub <markyacoub@chromium.org>
> Sent: Saturday, April 1, 2023 3:42 AM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; David Airlie
> <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: seanpaul@chromium.org; Kandpal, Suraj <suraj.kandpal@intel.com>;
> dianders@chromium.org; dri-devel@lists.freedesktop.org;
> freedreno@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Nikula,=
 Jani
> <jani.nikula@intel.com>; Mark Yacoub <markyacoub@chromium.org>; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
>=20
> From: Sean Paul <seanpaul@chromium.org>
>=20
> The shim functions return error codes, but they are discarded in
> intel_hdcp.c. This patch plumbs the return codes through so they are
> properly handled.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>=20
> ---
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in v6:
> -Rebased
> Changes in v7:
> -None
> Changes in v8:
> -None
>=20
>  .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
>  3 files changed, 37 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 7bcd90384a46d..a14b86a07e545 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -494,6 +494,7 @@ static void intel_panel_info(struct seq_file *m,  sta=
tic
> void intel_hdcp_info(struct seq_file *m,
>  			    struct intel_connector *intel_connector)  {
> +	int ret;
>  	bool hdcp_cap, hdcp2_cap;
>=20
>  	if (!intel_connector->hdcp.shim) {
> @@ -501,8 +502,12 @@ static void intel_hdcp_info(struct seq_file *m,
>  		goto out;
>  	}
>=20
> -	hdcp_cap =3D intel_hdcp_capable(intel_connector);
> -	hdcp2_cap =3D intel_hdcp2_capable(intel_connector);
> +	ret =3D intel_hdcp_capable(intel_connector, &hdcp_cap);
> +	if (ret)
> +		hdcp_cap =3D false;
> +	ret =3D intel_hdcp2_capable(intel_connector, &hdcp2_cap);
> +	if (ret)
> +		hdcp2_cap =3D false;
>=20
>  	if (hdcp_cap)
>  		seq_puts(m, "HDCP1.4 ");
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 0a20bc41be55d..61a862ae1f286 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -177,50 +177,49 @@ int intel_hdcp_read_valid_bksv(struct
> intel_digital_port *dig_port,  }
>=20
>  /* Is HDCP1.4 capable on Platform and Sink */ -bool
> intel_hdcp_capable(struct intel_connector *connector)
> +int intel_hdcp_capable(struct intel_connector *connector, bool
> +*capable)
>  {
>  	struct intel_digital_port *dig_port =3D
> intel_attached_dig_port(connector);
>  	const struct intel_hdcp_shim *shim =3D connector->hdcp.shim;
> -	bool capable =3D false;
>  	u8 bksv[5];
>=20
> +	*capable =3D false;
> +
>  	if (!shim)
> -		return capable;
> +		return 0;
>=20
> -	if (shim->hdcp_capable) {
> -		shim->hdcp_capable(dig_port, &capable);
> -	} else {
> -		if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> -			capable =3D true;
> -	}
> +	if (shim->hdcp_capable)
> +		return shim->hdcp_capable(dig_port, capable);
> +
> +	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> +		*capable =3D true;
>=20
> -	return capable;
> +	return 0;
>  }
>=20
>  /* Is HDCP2.2 capable on Platform and Sink */ -bool
> intel_hdcp2_capable(struct intel_connector *connector)
> +int intel_hdcp2_capable(struct intel_connector *connector, bool
> +*capable)
>  {
>  	struct intel_digital_port *dig_port =3D
> intel_attached_dig_port(connector);
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
>  	struct intel_hdcp *hdcp =3D &connector->hdcp;
> -	bool capable =3D false;
> +
> +	*capable =3D false;
>=20
>  	/* I915 support for HDCP2.2 */
>  	if (!hdcp->hdcp2_supported)
> -		return false;
> +		return 0;
>=20
>  	/* MEI interface is solid */
>  	mutex_lock(&dev_priv->display.hdcp.comp_mutex);
>  	if (!dev_priv->display.hdcp.comp_added ||  !dev_priv-
> >display.hdcp.master) {
>  		mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
> -		return false;
> +		return 0;
>  	}
>  	mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
>=20
>  	/* Sink's capability for HDCP2.2 */
> -	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
> -
> -	return capable;
> +	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
>  }
>=20
>  static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv, @@ -
> 2355,6 +2354,7 @@ int intel_hdcp_enable(struct intel_connector
> *connector,
>  	struct intel_digital_port *dig_port =3D
> intel_attached_dig_port(connector);
>  	struct intel_hdcp *hdcp =3D &connector->hdcp;
>  	unsigned long check_link_interval =3D DRM_HDCP_CHECK_PERIOD_MS;
> +	bool capable;
>  	int ret =3D -EINVAL;
>=20
>  	if (!hdcp->shim)
> @@ -2373,21 +2373,27 @@ int intel_hdcp_enable(struct intel_connector
> *connector,
>  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the
> setup
>  	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
>  	 */
> -	if (intel_hdcp2_capable(connector)) {
> +	ret =3D intel_hdcp2_capable(connector, &capable);
> +	if (capable) {
>  		ret =3D _intel_hdcp2_enable(connector);
> -		if (!ret)
> +		if (!ret) {
>  			check_link_interval =3D
> DRM_HDCP2_CHECK_PERIOD_MS;
> +			goto out;
> +		}
>  	}
>=20
>  	/*
>  	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
>  	 * be attempted.
>  	 */
> -	if (ret && intel_hdcp_capable(connector) &&
> -	    hdcp->content_type !=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
> +	ret =3D intel_hdcp_capable(connector, &capable);
> +	if (ret)
> +		goto out;
> +
> +	if (capable && hdcp->content_type !=3D
> DRM_MODE_HDCP_CONTENT_TYPE1)
>  		ret =3D _intel_hdcp_enable(connector);
> -	}
>=20
> +out:
>  	if (!ret) {
>  		schedule_delayed_work(&hdcp->check_work,
> check_link_interval);
>  		intel_hdcp_update_value(connector,
> @@ -2395,7 +2401,6 @@ int intel_hdcp_enable(struct intel_connector
> *connector,
>  					true);
>  	}

Hi Mark,
These changes here in intel_hdcp_enable are not necessary as this function =
is getting removed entirely in the
next patch.

With that fixed

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> -out:
>  	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 7c5fd84a7b65a..f06f6e5a2b1ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -33,8 +33,8 @@ void intel_hdcp_update_pipe(struct intel_atomic_state
> *state,
>  			    const struct intel_crtc_state *crtc_state,
>  			    const struct drm_connector_state *conn_state);
> bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port
> port); -bool intel_hdcp_capable(struct intel_connector *connector); -bool
> intel_hdcp2_capable(struct intel_connector *connector);
> +int intel_hdcp_capable(struct intel_connector *connector, bool
> +*capable); int intel_hdcp2_capable(struct intel_connector *connector,
> +bool *capable);
>  void intel_hdcp_component_init(struct drm_i915_private *dev_priv);  void
> intel_hdcp_component_fini(struct drm_i915_private *dev_priv);  void
> intel_hdcp_cleanup(struct intel_connector *connector);
> --
> 2.40.0.348.gf938b09366-goog

