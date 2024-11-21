Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FE9D4E5F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 15:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6744C10E966;
	Thu, 21 Nov 2024 14:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Axbu8i9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B610E966;
 Thu, 21 Nov 2024 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732198398; x=1763734398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+FEJ16ivOO3bdscJwv/f3cll/7+OKa9yKaMt2eMgHIw=;
 b=Axbu8i9YaQAXT2UjmVfeWw4jyZVxXym33sz8gjFDIpms++uYEN19DH3D
 E8X5OfsCuF9cjlCegP05Ux+0z53m9NhYpAf7RxRMPqAFGZk+qjyYLiOSd
 RNbRoLT+lB3OLz8KAWsmaotpZIoGzxr32sC8qReYwUXciUk4hGkMMB403
 rZcZd83aQPRddy7mLIADQ1fD3YFmDHV4Ex3VZsdc65UnFDxmoyDoAnIpb
 +44tEABrDCU7yPVYcMsuRB0ReDEh+g6w1D7ZdIE1LVxcdJ9jJ5ndB58X1
 VggSKDl1B6/+YMGxejegPlxmxu6CIWW6K7N5hrSxtt+dpdMKlWD5PwwR6 Q==;
X-CSE-ConnectionGUID: 8Ckk43dlRxCPfEmT53YT8w==
X-CSE-MsgGUID: cQ7mP01MSCWOdsMZ1O2FNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32162085"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32162085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:13:17 -0800
X-CSE-ConnectionGUID: f/G8SbhKQwuR1mvKH2ywvw==
X-CSE-MsgGUID: NYx+MA1gQZmKT44xJ9R6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="91078570"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 06:13:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 06:13:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 06:13:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 06:13:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS5SoYCKfTdseeDZWKJMkO0u/5FuyR/ftmT7M9zA9T39L3x9xNc/IvggRl3gmchu57FXc/xylDRLI4Q/wYom2ZK1uIIocinZXyY221Bt1KIdBjPGi1j5uYcePrkwt9+YGPbnc9lVcMlZMl1U0nm5ZM1Ha1A351gL4uDDYE/al/tOMbzcvIhG2kBCN1EBIn690BAT0DFwqIVZI224Iep/dLbPtSE182QZDjxO0ZLJQl5M4prQPWxWEaYmJKV+uE5QGyh0t2/Qx56nWR/2QjR0sKHl2pzrIBik8EJgNOpFwYvklHULJ5B4dWr7Yk0pesidou5Eqh4gRTyHRSyOsKUnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLo8hNT502C/P4nGVG8J03R6vLhJAHvVKreoAQV/EFE=;
 b=keo1p6TuwlWEkX330Ob+c2z1KR64fFEtVAQNZqLM1C8mxjDO6Ct31TENC9KifCiLcpeZM9ToboGBdLb+a1RI6vY0FscJ5Cew16VHl0aVn08sOrYUWVLIT4Sf4jwMRA9FMNVCtXJVmaFeRLhHc4Juo+kioJcrAiON48PlwPph2LvhH7KKvNKNZwRCY+QN4xUvVgvZnpQOwS7D91DOtdF3Tyus1MkHGLJVEVEyTkrOPfDtignSF/Rv7FsWYOwEqd7jiq+Ju8+7kdwC0GsrFXUtcRP53TmUh8vKw1FcBsYu7xx+J3d5tMGtnK6pmIgyuh3YY2Ih4Z6XNPr/4rZX1zLGBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 14:13:13 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 14:13:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv2 6/8] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Topic: [PATCHv2 6/8] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Index: AQHbPBH9/yBdmZmrZ0OSGUqkZNR7oLLBxp3A
Date: Thu, 21 Nov 2024 14:13:13 +0000
Message-ID: <SN7PR11MB67503F556014FB710C4AC7FAE3222@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-7-arun.r.murthy@intel.com>
In-Reply-To: <20241121122603.736267-7-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB8163:EE_
x-ms-office365-filtering-correlation-id: c2af95cd-8a0b-438d-27c0-08dd0a36a302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2ZPPtgmomHcATmH6K8xT2Wieo87QObNSaumZCtb6b5df8+HqFYckEOXXkhbA?=
 =?us-ascii?Q?Cfw7Y3euJS0UI9avkvW8wTFIxridyU1r4uDGcUX2oGAaFe7VZ1XCoHXYGk48?=
 =?us-ascii?Q?IjuyWNDbh2JsdAVmlRdPe35Q4OKlI8DhhrGBV2uk6hiv8LzJHmb/dYNv8HG7?=
 =?us-ascii?Q?XawzEl3fi/OllsT275/IgK8Gp9WUwSqUfyW2YtTlACT5Y06Jt9B03jQOoinl?=
 =?us-ascii?Q?Ee/J+Xgk3jnm9nT4/VkQY2s/tjyK0auH+1FYDtbeUqgI6SvDfD451qjMc++v?=
 =?us-ascii?Q?+/3q8NZvKLG71wn6hAS24aC05cawCiC07GA2wrUyt0bxUUAKi2URCsY1SPRy?=
 =?us-ascii?Q?rqQOxhOdyXKJ9fUciino1nD4+YVFqCwVHtjPewltA3r+iKxrvCyBU0HV1chV?=
 =?us-ascii?Q?KYPADFrB+oDn2BBgz9raW9BUCabbWYKccd7/FISztx3M4g9XMYZw5Nj3f0RX?=
 =?us-ascii?Q?m3T8cUgvX11OtHt+m3H15tRWSSSSaHUgL0LaEM8nZS4amaHTws2fYcEvIwAf?=
 =?us-ascii?Q?fEem4oU22Kx819oeJJfGtNr257QkNuStbUCUpvJ4ZBRaa0j3+f1MLmzKC5Da?=
 =?us-ascii?Q?RChAiwDem/VxLPgDEVWmtGMAkr+6Kubg/BDWPQhWTdtcglPXI6kx9h+VKyRN?=
 =?us-ascii?Q?tVgWGuV1hZ8GqaqI1N7MB47foQRKALOojZsi+oOtMKedC0iJEpyvw4pul3Ah?=
 =?us-ascii?Q?ZBapQxdVkwdP0hKNwboSbxEjyIfd97OpuPhTkSkvGyak7YFqOOQ/RJU2RUBR?=
 =?us-ascii?Q?eGqtuJWG6Bdla4qKJK/vpd8lxENBgd4TcYwEZwEFNngRPC1Ep340JLIZC2If?=
 =?us-ascii?Q?PauKUvEK1PEQGmEi2GqDTM/skcPXbD7vz/69YsuzNgAUh6iEsHP5/0+zb1PB?=
 =?us-ascii?Q?mWWwopPf7AV8QjLPUU+zRqIEZqgsLwCmwlVeS9wpq4BFXmkuywwbIGM1lgeK?=
 =?us-ascii?Q?Z63YOvb2ppICuK41/Mn26orgdlpCoEr+pJS8j+zcf3W+ql6G03QRkmIY6MIf?=
 =?us-ascii?Q?njWRXsr8+5HhWFZ6vcQouzT9r5DoihO9gbxztSZDuaHM4987tmoNgvYc1GP8?=
 =?us-ascii?Q?kHjLp34cD+mNR5/tVEmPyOo7W4F7nSvRJ9qs1I3DQvKzuNHMYUgehkecxPo9?=
 =?us-ascii?Q?rWwAxH9kohK620VOVNcB7HHcux27evNHyLlMS1M78p6OLsL85UtROmXUv+1o?=
 =?us-ascii?Q?5Tr1Mzv7KV+V59CRSYZlMF10srN706CiAemzUl6p8vH972VQ53PuRvnY7E+e?=
 =?us-ascii?Q?lACXc3DE/N+KQvph0BW+CIkpPck66FWxNdcTlWcgLJwAcFQUe4N09n2BHaO2?=
 =?us-ascii?Q?AYBn6pz5EwHmmurnIUxXROWm0TYqbuqiIpJDpS3RAVJOl7l7p4iB9UE0eXsm?=
 =?us-ascii?Q?8w6FDXU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LdM89HgYsmH+paCkhSXvOQjokH5j2+MnAPtTgyiO43rjU9//e7kjf/2W5p/3?=
 =?us-ascii?Q?cCpnTXiAuOz78nDAheUQ3db3Tl9yw30RlWxxQUu51AVYINzN0k9cv6TC+4vZ?=
 =?us-ascii?Q?X6Womfy2tc8QcvT2FCg3vd7jufUJys6UexFqB1qN5qcjGxIOAz5TONmVw0Jo?=
 =?us-ascii?Q?TWprux+cTw4N5lzsNKO9sHP0N9PgLaXr02JLjVkY9uNCnwHE788uQ2D0f//z?=
 =?us-ascii?Q?FMnQO+/oHRbftThzuIELV569y35XFYF8a+JDANP7+0v9nvaOVoQ+cCXlNmH2?=
 =?us-ascii?Q?y8lDMboLkujrMPfqlUjs5pherpUSjs6vSxLhYdk/LQushdeLDqWGG+9LLfW/?=
 =?us-ascii?Q?ATVkhWszH1qV/RE3GMbHJGlpLCQrApVUUBGkT6GsFFFN32DEqX0BbL4Zkgf7?=
 =?us-ascii?Q?ijRt18cQaZMdFpVO2FB4cKLVv9PdGjolGTiBGsDc0+ZHmzO6weOROwHzl3Zh?=
 =?us-ascii?Q?HRf88G1JnxArMMdE2uCqqDEcHZanXVNaieexDVCTysE9oJIKP8wUB9h93o4U?=
 =?us-ascii?Q?iPH1Ch47a9mzMo44UNgyQhpn56hRPwZHzaZeMWH3d3y2zxC2wuT/0s657D2l?=
 =?us-ascii?Q?ofzTTyD8+q1zkS7iK+4fWn+zzlt1BgemBKhud3xNfHXNiOOCHONHHiFCyHWq?=
 =?us-ascii?Q?BisaywVtBwho4BO/90HUneqf8L2zG1R2DsxhR89EkWllSDkXmg3Ii3ZnzDCl?=
 =?us-ascii?Q?Exr3mSUCdiox/fCgnGaMQTwCKSqKhutePs97hsqY25T/NZpVpSFx/Dj8HwNs?=
 =?us-ascii?Q?+LxCJU8HXwKFpM9voU+CNjyD/9a8gYtHd4/ausKOsmqjWLuKsGpNVRNMEVfn?=
 =?us-ascii?Q?Az/yq/lhAW/ydVypo216iz9S1hGCRt0CPo5nXD+l8wDJjjH9D0L1itAtYKQj?=
 =?us-ascii?Q?zifUygZ3N7NxrOWEe4DxGrlnqw0v2D30/X9hirEnAQ3pja08ICq5Kz0i/IU1?=
 =?us-ascii?Q?M+GUs6L++JXpHFNdN42Av7OngDMQ/VzawynvqjF4dRDBs9Pc9B3BWuXI5sOT?=
 =?us-ascii?Q?IQQPVj3avhu+0/IypX/DVvWvAXkSRwyHwtTt7zjqb0MdPy1sIwbgI4b4pKA3?=
 =?us-ascii?Q?rj2F54o48fqjQbqzfojop6kLIovXCX2bQd/ha4Zqk5BoGDvxVmZDzrt4NKu5?=
 =?us-ascii?Q?rBZ+tirL+CSaduqi/1AMQ2aTXbAzkSUFUdcD3Uq0KY9+by8kNnzAKBvGNXxS?=
 =?us-ascii?Q?ch3A2Vky/lnWaFndOdDQMT3MO7tmjNQpvXfl8q5F/ljqoFxw8VOldhdF/ZQZ?=
 =?us-ascii?Q?Ddu+YU2gByu/1IP6fhkhPMWX1G/0OI7ILJBc8LTJndfRM3zvtcGfCXSeU/FK?=
 =?us-ascii?Q?VhQb3Xzd+gytEhflmvrvQRa9pBZNGx4fMG6CPcJxRtQXVn0bzfelnJKi+pQv?=
 =?us-ascii?Q?orzRaBWulGVYO0+h07fPww3cO4XuQxEQToFvIRui6/+WO3li/v+PXXUc95p9?=
 =?us-ascii?Q?2fLfeE0WDoTiON7YC3Dw5h+Vyv8IIVpcKv4k/byGilSG02Sws7l8dCKLIfbg?=
 =?us-ascii?Q?zYRBwyWZr3ImmFHGEH702DnPklzfCVB3Gz/subPEwbx1WK9VNFvv7En6kBdr?=
 =?us-ascii?Q?6PfszNBGBQAMTuKw9s9dv4PAbvwkzmxkPaQk4ojm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2af95cd-8a0b-438d-27c0-08dd0a36a302
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 14:13:13.5555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0o8cInXZKjsJxv+d9XDBmYUlQXrk6DU1HwRa8n9L1Aqxa7ci0GY6V1veYwFBg/lZmU+xOpu2abicVTDd/YvnBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
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
> Sent: Thursday, November 21, 2024 5:56 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv2 6/8] drm/i915/histogram: histogram delay counter doesnt
> reset
>=20
> The delay counter for histogram does not reset and as a result the histog=
ram
> bin never gets updated. Workaround would be to use save and restore
> histogram register.
>=20
> v2: Follow the seq in interrupt handler
> 	Restore DPST bit 0
> 	read/write dpst ctl rg
> 	Restore DPST bit 1 and Guardband Delay Interrupt counter =3D 0
> 	(Suraj)
>=20
> Wa: 14014889975
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_histogram.c     | 14 ++++++++++++++
>  .../gpu/drm/i915/display/intel_histogram_regs.h    |  2 ++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 9148665747ff..a64e778fface 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -59,6 +59,11 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	snprintf(pipe_id, sizeof(pipe_id),
>  		 "PIPE=3D%u", intel_crtc->base.base.id);
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 14))

This will end up including mtl too
Then maybe display_ver =3D=3D 13 should work

Regards,
Suraj Kandpal

> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_RESTORE, 0);
> +
>  	/*
>  	 * TODO: PSR to be exited while reading the Histogram data
>  	 * Set DPST_CTL Bin Reg function select to TC @@ -86,6 +91,15 @@
> static void intel_histogram_handle_int_work(struct work_struct *work)
>  		return;
>  	}
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 14))
> +		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt
> Delay Counter(bit 23:16) */
> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT |
> +			     DPST_CTL_RESTORE,
> +			     DPST_CTL_GUARDBAND_INTERRUPT_DELAY(0x0) |
> +			     DPST_CTL_RESTORE);
> +
>  	/* Enable histogram interrupt */
>  	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> DPST_GUARD_HIST_INT_EN,
>  		     DPST_GUARD_HIST_INT_EN);
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> index 1252b4f339a6..213c9f483567 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> @@ -16,6 +16,8 @@
>  #define  DPST_CTL_RESTORE				REG_BIT(28)
>  #define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
>  #define  DPST_CTL_HIST_MODE				REG_BIT(24)
> +#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT
> 	REG_GENMASK(23, 16)
> +#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY(val)
> 	REG_FIELD_PREP(DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT,
> val)
>  #define  DPST_CTL_ENHANCEMENT_MODE_MASK
> 	REG_GENMASK(14, 13)
>  #define  DPST_CTL_EN_MULTIPLICATIVE
> 	REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
>  #define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
> --
> 2.25.1

