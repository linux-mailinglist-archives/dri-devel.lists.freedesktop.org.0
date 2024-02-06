Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6B84BEBD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE8A10E69E;
	Tue,  6 Feb 2024 20:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHbUM3a4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADA210EC2E;
 Tue,  6 Feb 2024 20:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251651; x=1738787651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9ZexLRRMNwVgI380pvISSKY9AlM6kqs/LaDYneDLiRY=;
 b=OHbUM3a47pTLBtZbDfcd71pwL9xnSOyJq8ISXlytqdjlLCS6+hdQaY0M
 aNvKrFHRNT3FAhw/l+ALElzAuZlKRvcxN3mhPUYIkKV58menfqVlwEBpU
 NuBOaGXz7T1shDG8VCMg0gobQr2d7rkufcDdmTae0tparB8zCFmjOzFGj
 81CgYJZWeXeoYxNMPSLLTMCKw1993xiqmaWsPNBWBXEf3hxBMzMtHdFm8
 bf3b3DP6DTx8yNjiNdKgTht9sp8PPYLbtVOBDGQ/PAWuDWfB6vHCV2N5C
 Eyam5jnPiOU03qR0p8gBNf+6YIdkI0LGN27/D2/6dvnY21Y/rgoWSR/zm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11423244"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11423244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1123911"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:34:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:34:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:34:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:34:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:34:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRHbCOvIbJw8Gl5NpmX9+8z5eUUN5VSpDcKX3OgnD4Gb+YqCw8GERERiQsQLUD3WA3XdCCrIGm65mLt1n6LpoBFwg9ShJyxY8Jllvasx95V+3tnSuZtuPAy1Fq2clHuFVnHQHMCpByk2ete5xauo5GVDIsIAMs4gkMyEmHfO3R1fvCreV5bEC7yNLyUOQooCUHmSfbV0eXoCt+fBwwXASDlotyf8ZfPgu/KaPrur1OD4aHJ/b+VQOnFJxk+6SiJnTYMcEFt7BZzrUI5XoMTEje0M2mlNARjBMzGLwi42XoZWXgOJikgwU1buR1stWJkl/tm0/dyeSEsGSFthuyrmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsgenP8pn1oMvyFGm8Q01HwqP2bhl5VYEGQMCiAMpfY=;
 b=CSH09qGeFBWChDerHJc0zu87a4e8JupnzWPfR9F5c3l60q2RLZSiabH0LRWUGJORgHSbHpHwk3aJGiSPm88YjOD7DxJGaO7SzgUt2tLsBOdYsiGNuJ1YiDCXB3Rqy9Y1/bZnQwimQmrNx8HZC1Efr2wa7MA5UYOlvZ+48tcGoiqDaxVvm/CGtShepYrLXjo12a5mPTW1HYstWi92RKmvSLxRugmsLnl+ZOWd4IXaRs5/Lcl2BoYkJuN9KfZI2rvIEGl8XGIsIAZp2gEYXzNryY1WzT9k1RjjC0zMdeXXCOoE8UIgPodVXeNQiB88cpV9avzGFBDoyM0UwnPdny3BGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.36; Tue, 6 Feb 2024 20:34:06 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:34:06 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 06/19] drm/i915/dp: Export
 intel_dp_max_common_rate/lane_count()
Thread-Topic: [PATCH 06/19] drm/i915/dp: Export
 intel_dp_max_common_rate/lane_count()
Thread-Index: AQHaTecGUfdT4BYUukWLkrwGew+labD928QQ
Date: Tue, 6 Feb 2024 20:34:06 +0000
Message-ID: <DM4PR11MB63606958A43D67EEAE8466F0F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-7-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-7-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW3PR11MB4633:EE_
x-ms-office365-filtering-correlation-id: 0b768fac-60a2-4f98-01cb-08dc2752f6fb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WlmNWRHNfbKsJGnhHfqVc+zTtuQuVZ8pSio3uIoUuhVP3Smq1FiU5lsMpN3ddU4L+VCppGzwoMV/m5IecS6m4zLDLzLE0lepFHyDiOiCIOHZblpzy5iWCR+7/fxYUYn2hPqYHB1EY2nc973HzmgXBHlOkSKD3pxLAzZF2W3y5TiFcaGbjnkkL+29Wh/FOVai7XaRJx/ZU3JqMdK7nE+Dz0/4pn4PfytEoBJ6gAoLSwMFCbUVwOlVD76bfVgQNjvOKOpYyYAjkOIqLIIc6MJ3pp3j+KsOzrQfAeJbUzUWkNrHbc5vkOLXoDfup+//kyFHddje6NcMaPqlM6KEB+izQxtSWZKCaJPw/Ho9ECYA4OOnDQoRT2xKYKkdk0uNH8meFh9j5jGV0TVrLL0h6F02LPHQt7N0LMwFrNnARtNIDYtit/M32DOrszkpHtAgU4DteXASzYVQqRxdgYF0uU/KSFi2ydL1UZ02iCdcdPELdPwzN2NIZ4YurwXijIt+QNRWCWym+q5BEQ89DHxa6yP2qci5eO8+U/umEnBFdVpN30B06qI4dcTVHyWinss60NjyAHOh+jy38NyQURBwe9005xS2WYRZq1nSBcqiG2ZySo6VxvT96Iuc+vKeN2eOnL0i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38070700009)(66946007)(41300700001)(66476007)(66556008)(64756008)(76116006)(316002)(66446008)(110136005)(5660300002)(450100002)(52536014)(8676002)(4326008)(8936002)(2906002)(82960400001)(83380400001)(122000001)(38100700002)(55016003)(33656002)(71200400001)(7696005)(6506007)(9686003)(53546011)(478600001)(26005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eSv1VC7YMXaMyrE4ZEUzHISDj4c+evW4GLMBjm+khQhUrvJvl09UjGT/Qtsp?=
 =?us-ascii?Q?fbgu7xFToXnqGyWXsd8qx7WIqYaGYJqlQY0QczVdB7AUNkkMP1N0r3xQKWpM?=
 =?us-ascii?Q?qRlf+LZ9BoQiJqL7/L2Aji5cSf4VFPcVAdquyHV33HHNEVcCQXkE4HidOl1O?=
 =?us-ascii?Q?L2EWU4LgYBRx7kXmEJAI/drbOawnlGccUfVK2CHfQsobfQNN7yj3T94POLYd?=
 =?us-ascii?Q?J+0/uT07ghY2Bkf3AcZv2WXHhDVZVJ6MCP0JaFjaYk+M9PLmzXo7c1L6PGhd?=
 =?us-ascii?Q?JgEFiPej7Lc8rRy4RGrqsFxh6wpXxqIJR3aHDntjIdWTy8qyEmn9QC7US6UI?=
 =?us-ascii?Q?7OD70LKOue3RUnV3PhSBNtInl7KsDKEP8PX2M62PfWGpfCnG7QEZsrEUKTAX?=
 =?us-ascii?Q?r932VHNCyNt3zuL6OhuN2OsPpH9YOOQFP52KrPiVNg/4sZ6cTIrcVALzzJWT?=
 =?us-ascii?Q?TSfWcovTopXvd3EaQn/smtZ7XysXswcxugnPIYl9sGt4laeT7aG9C0YKQL80?=
 =?us-ascii?Q?daaJy8MG4Bkm/ZRUwDgTCoisAl8JbwxAU0pxwvphNrVtG2uEMeUa13nGVOCC?=
 =?us-ascii?Q?BUdUNoH2AWxVtMMbvdzDPZeqIAOlN90xLwpWeaiPDK6gJpN6eQK3LbFCGYkU?=
 =?us-ascii?Q?BlU7TuVR+HRyLa3kybYAuj/N1hPAdYtOIIvJlEbylHTmms7zp0nwyV7Hz7HV?=
 =?us-ascii?Q?Hxn6ljwraKM7w7+bHMzsDu6kNztpYyI+N/5VIco/7zutnBBcZYfAXJ9X54St?=
 =?us-ascii?Q?nezyEKJ0Qu0J8k8ZVsq4AKlReU1HE+xo7f6ZFjUwuStmCZObp4yjy3h0UFY4?=
 =?us-ascii?Q?azBNIk3sAnw3W7dXteqGjbLTn26Io8tjU37/u6JCugkwAnf7e2kuelI3s+dO?=
 =?us-ascii?Q?+kemuPfjs2io0tuXBt5mtOoItHE5A5ZkiUuRoKY9CUb4ph8TWbU5wdqlFuFh?=
 =?us-ascii?Q?aREE5zmqUv+Wq5R7w7glERnsLJavkKz/9XL2qihVgpXky2CCtAECPZqEFCYk?=
 =?us-ascii?Q?HZTLJ40Z7h2nNBVIhTDymBjm4Jf5hrAGcEGOCCAd4G+iwZbJC+74tm5xWLU2?=
 =?us-ascii?Q?tB6iq7rqRYJCnyl2YdZ1YLfdA4PjojqDJsbwDJG4Hk3YIhAIb+X98BJ6xamR?=
 =?us-ascii?Q?JfJeyl0BGegbwQRJY1xmjcZq0HFwihFPBKQD35hL3xtJ+EFpLSwnWFlmytMD?=
 =?us-ascii?Q?Fksk0gxEDaE8xzNuB6bRzgcXe2wMsKrYl1NTJPN2AYyPdI4nF0rdjO0xM/Rr?=
 =?us-ascii?Q?rGXQGvZEwleArc8dlPknAuLmYE+mkHX7IIgO/BMTzhjyUo44SmejuEYETkcM?=
 =?us-ascii?Q?4EU5p9mM0H4/7rqLllqc3ZSMOtBZhXC335HOPKZ2NMEuujLzFwxnFDa4iMcf?=
 =?us-ascii?Q?YVspx/LKEUvCSwCI7vh+e1Er3mEo+Ue42DoXf3r5skJhIT8Sl2iJPbtkx8/P?=
 =?us-ascii?Q?JBVfTZgZth60XvakIkaYGKViZ6DpRfLv7LtNU49s2QJvaTrz0+uh0nAE68o1?=
 =?us-ascii?Q?X4IGaW3T2zem0MyxDjH8HCJzhpEsEEdsjF6iTgZguYcB+cCZRgCRFn0pLcIm?=
 =?us-ascii?Q?6FWYFo6Bsccx3oalIPJRXjvJpjjfFLqLuM/4KUfK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b768fac-60a2-4f98-01cb-08dc2752f6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:34:06.3760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mABo5ts6QoanaM65Ad67hs1bV16HWsY2oVeqBszk9SEacg8zVf0rSnf8VqSwQXVDhDpsGIZgjm7G801GtFUmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4633
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
> Subject: [PATCH 06/19] drm/i915/dp: Export
> intel_dp_max_common_rate/lane_count()
>=20
> Export intel_dp_max_common_rate() and intel_dp_max_lane_count() used by a
> follow-up patch enabling the DP tunnel BW allocation mode.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
> drivers/gpu/drm/i915/display/intel_dp.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0a5c60428ffb7..f40706c5d1aad 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -309,7 +309,7 @@ static int intel_dp_common_rate(struct intel_dp
> *intel_dp, int index)  }
>=20
>  /* Theoretical max between source and sink */ -static int
> intel_dp_max_common_rate(struct intel_dp *intel_dp)
> +int intel_dp_max_common_rate(struct intel_dp *intel_dp)
>  {
>  	return intel_dp_common_rate(intel_dp, intel_dp->num_common_rates -
> 1);  } @@ -326,7 +326,7 @@ static int intel_dp_max_source_lane_count(stru=
ct
> intel_digital_port *dig_port)  }
>=20
>  /* Theoretical max between source and sink */ -static int
> intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
> +int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
>  {
>  	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
>  	int source_max =3D intel_dp_max_source_lane_count(dig_port);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 37274e3c2902f..a7906d8738c4a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -104,6 +104,8 @@ int intel_dp_max_link_rate(struct intel_dp *intel_dp)=
;  int
> intel_dp_max_lane_count(struct intel_dp *intel_dp);  int
> intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);=
  int
> intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
> +int intel_dp_max_common_rate(struct intel_dp *intel_dp); int
> +intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
>=20
>  void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
>  			   u8 *link_bw, u8 *rate_select);
> --
> 2.39.2

