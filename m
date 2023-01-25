Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E567A88B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 02:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6A810E0C1;
	Wed, 25 Jan 2023 01:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74C410E0C1;
 Wed, 25 Jan 2023 01:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674611914; x=1706147914;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GxouM6pzjNvA5UCSxKYb9aIia0t9cNjaJmx6Bj+zmRA=;
 b=Dh/2jdWx/0lkzjSxV8hHCSCGM78RGBffIoJCgD5lKtP5wNwbTAzWBiAm
 q8mcUn3Q6CLWSv0SmTaMlJS4Wz2zAQDvG6KLosvZlUOhZx0qpewh9O7gc
 Rdlqzzy4iNa9x5D1dTxvkQkAYloH/MFjO1NbIhTvDTJZXCyVH3fRpms0A
 GFnMQRKl+LoL8c82hwhiw4yniHwYtvUqgABQxYPXh4KnApSthKwmP+yHA
 Pk65AtYfFGFb5L/l8IaGwui/X8gXp4RXWswf0PMtmVJu3QNEzii1z5i7o
 t/nDOig1aRoJkozPBC9AfQs3UKrNnTXTFnaNSTEXfj8zKKNU6v7Ogy9uO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="314360667"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="314360667"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 17:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="639779446"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="639779446"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 24 Jan 2023 17:58:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 17:58:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 17:58:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 17:58:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 17:58:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXHvrWg30yhjVwthMaA46THNFstjJ3O1nqpiAPkYkzjPTseDlMuFDWo383rJYQNaQZtbq/Sw4vSPcLJ1LFiTchsQFDfO+21GOK4KmINp6+mHcPqJyz0D3NuBg9GJck935qk0vLrb6pVX14glh1o0PDvi1MSN6O5bUMEzd4ZApbPawIVaTDGjneggGxbgpIl8P3Igqt1ukYTb10NP2V1oF0oOjEoIJt7IXSYLonYSS8NYHRR8M/IqXbu1mJAAxXSEtGIPcpeTtBxxMfmb3wfLQjeGXhk4fVbdlkduYmU6ssg0K3FGrMHDe73OVQfT2JkZNWb2IYGiPQPpiVLkBZAFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q13xJCRAlwgcv+rqkYCuQohKr1IqSoh5ZeOfiLNeDWo=;
 b=n2JGBGdwZYVBRFzG+Z/l7eao4WwXmmpc1mKmthopQRTmwnPUCrQN8BjuhIbnqn0QRn8F9tIHPQ+mKbefLAGnYjErA7NzpdDUwDThg1pxzAG5ubF0+XCBp4odEcD2OHUzBjIBqfNy0RhWtXgztkgHIl1RbJUU73N25WvcgYeb2lkZfNAv1LePIrW/FfEMSmnJM4YLYLcpAkxDkNWfAlk61sFZ8ViXy0IiZ06N+yrEhBkDhrDb3ghVU1fPsLgdIrXZhmVPCZdTfOWk2PA7giYyVimLRYugGGa8UvoVJnipR+RT2mYEeNR+tn8bYr/IToHsRxDdEaESdlNUsQfrFYqkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 01:58:25 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::f1cb:21b7:f511:ea11]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::f1cb:21b7:f511:ea11%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 01:58:25 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nikula, 
 Jani" <jani.nikula@intel.com>
Subject: RE: [PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Thread-Topic: [PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Thread-Index: AQHZK/yMw3zP4SN5WEuAVSgYBohj6a6uaPCg
Date: Wed, 25 Jan 2023 01:58:25 +0000
Message-ID: <DM6PR11MB3177D4A4BD3E10F25488B1EBBACE9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
 <20230119114707.1425501-1-arun.r.murthy@intel.com>
 <20230119114707.1425501-2-arun.r.murthy@intel.com>
In-Reply-To: <20230119114707.1425501-2-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: dfa6fc6d-c702-41cc-3c3c-08dafe77a564
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CPf0dnTn1XI5dP/VjvLnCCb9eH31K7xL4SATTiS6RpHayfQgyHCQn5euoSq8GDMkKYywufWbK+3xd26bngf7yJmCM7qQRqvuBIjL/3sIuZhzO9g+nkACiJPWz1B0ZXaVyXobLFUl9bMg4C89zYSyC1YfLs03L7mYh50LIC0DAlkjDUDvjrPGmNZZYiyZDT6eQ4HeBJZsV7xOWFyWBBsHzpXOekGYr3mEzL/MjLRopnNEYYOMKksqbQn9mtpgELet6IIp+DMHO2liFPVGpBR1ZOt03U9b0eGy9Nc5262fcD1mox8CDg/JgRI5Izg5tjCXHBpDNLGbXW/l8fNTBGNqB9fc7N0mHNWiqF50PGdw+bnGqjcor3tXbdnyUUMYgjN3kWjH8RQt92ht9lMwkhHBt4thCdRznYlDTyRGT4WOJTexKgTR26/4XsTz7aAXGWlIqCqArw1klhJcOgvh0jgxSR4+gas9Ow5cXXoIsBE5voXIeS0Qia2UuO1kzPZyn7e2JWx9Qcq3NM0WoRLSMllp3odYW7TgmGzrh+FR8y9DB7n9j+JDmhmQicczMjEE1KMuvJmYN1h8CCvh+taqFTMcBLcS/NGal19bk3M83FRCuSo8TbyxS/p5CnnIshjG9HB3VM4HQDFDrZC9AGuu9gPZi8ppm8OueCJWby5t8Cydybe6wcCvOuavV6WglNUlM8HCyqXGo9VDzbpbjn5KiLA93w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199018)(66446008)(450100002)(64756008)(66556008)(316002)(66946007)(478600001)(9686003)(52536014)(7696005)(71200400001)(8676002)(6636002)(122000001)(33656002)(82960400001)(38100700002)(110136005)(86362001)(55016003)(38070700005)(55236004)(76116006)(53546011)(186003)(6506007)(26005)(66476007)(83380400001)(2906002)(41300700001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lKYCCJe+BSNjoIOxAH53Z3P5NYsFr98ud+UDqqxGVyE/xNIYAUCD+3WjpnOE?=
 =?us-ascii?Q?KQT9e3w2p/76bVus0e5orBeP1YVkvmQ4pEqy5m7WcYUFJejXvh6ZKuawjO5b?=
 =?us-ascii?Q?AWOtMlexr8yfqsyHZIhkNbQCeNWdlWYP7vxv0xSrJaZecn/Pn2k6/toKgjXg?=
 =?us-ascii?Q?82suQ0BeKbzEOcoV+bDCa5/e59tb+Qb6GzpcEVR7/v/jnh8FpoZD0MbnyszT?=
 =?us-ascii?Q?k9HF/tin8ArOjRVlTixgCCvqNnMY7VKhOG/BITg7GVCwixo/1/c+KVQDfW0e?=
 =?us-ascii?Q?EzpU3nOhIJGCIJkjK9TNVgSy7226PR0s7oi0CwtoTQVa+UdfOPPVKgP0gBD3?=
 =?us-ascii?Q?502eEFcPlXvnbHNKKjxEYT8azT+ukI1T6nxVn0ENHubuon0FYdV7572IlyJT?=
 =?us-ascii?Q?9Rqkt4H3t5oTt7QIZw6eb4IRq9NWdzL7rV6C4PLTAqw2AjtlI56qjkcPvsxK?=
 =?us-ascii?Q?0dVsgaxVbr/FPzD3C/tzPlq9WDaksb7BBTEYonkvS1gUNlmCcSl6srHY6z5S?=
 =?us-ascii?Q?/8QM+eh0iXVMrup17u00TrqQExSQ3XoSRBL2U7kad6Da3kFQ4x/757cksntK?=
 =?us-ascii?Q?Gtis7sc/3zlWOwOeMLroycOODtucoISP65Vu3v7C79uFfvk2/b1NJFRq2RX+?=
 =?us-ascii?Q?XZlgTPt9l4ohqjSMiWRvhtYxusZQy1KLahTVXtAln0wQAUkJ0JTKOz8og0KW?=
 =?us-ascii?Q?B4Dq3eQj3aotWco7y/k5/Qp3yCPYerMpnSW1yGstuyMczH8TeIj1CGhFQLzI?=
 =?us-ascii?Q?d/r32tMSZV6VOqHnQl+GgPjpPPgaPYGD+jN8axLiXgS71Uujf+kyuw6K5aRN?=
 =?us-ascii?Q?mEMgubZy70sDFVkKIo9VB06cUfJJhwdZb2town29ujw4/3E96sTt6nx0R5TB?=
 =?us-ascii?Q?blEBFTE/PWZId7WbBNE80MDNqJbqILYBvtSuTPs682ifhlh8GuR9mNkh4nbK?=
 =?us-ascii?Q?00KQ8q2rncH5sZnOyckm8YQAyWsBYx5L/B5yIJcgrsvHBWZn6xrrCYaT66zX?=
 =?us-ascii?Q?CWmkNOVov09VdDdKrvZtP5CHq+KcvTgd+DpZ9gH18qcegdQnm2dh+fsNNgYU?=
 =?us-ascii?Q?WKKDL0buRWMyBnt+CDjfd8zQB0fJJObKLraSn/Xz4rMJJqPjargqcu0X0tsb?=
 =?us-ascii?Q?b330ecPE9XAJ5GGy4Hr8zCPrVXOQ+JMK2GaP2Mx/QWy+sYXl0NgFH1uSpwpr?=
 =?us-ascii?Q?539a4AVC/8WL3EM0PiacuLw8lvzM6Nzcv8B54VrkBOgUMIlBtYQN8hKlxZ08?=
 =?us-ascii?Q?1WVreGun2L+SWTqPb2FdZf0tIAOpXzSH2TZunOVkIVckaZmhFiKF/EHqyzSW?=
 =?us-ascii?Q?V+ICoy/2p4xksU39e46HZ07yNvBPLE+DeGD9OJ5PQ0nIZ6qTl+QaLn2H6dAI?=
 =?us-ascii?Q?DtVx9z+2pFzBylo9s2ogmzbTGv703ppL14TEA0yH+q6JZSsyvclWH9olxvqA?=
 =?us-ascii?Q?QUraBhaSFd8TLonKECyc6CO63hA1b51Zc+hj+/qDq3M5IWvZKKN60ugjNYGe?=
 =?us-ascii?Q?fHNCNwZKMjRxXjxa5VIKJH7VoXJQwU9agUSn5gcPzMcwJPrNBM/s1In043cR?=
 =?us-ascii?Q?GG61d9mHKh2h/svEB0e3pyHSPv2Xk0evor2XYAhZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa6fc6d-c702-41cc-3c3c-08dafe77a564
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 01:58:25.5407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HT/e2+MTJKa03j2HDrom3inOyTOxxWYBpjpfPRm+tPg0GjBrmk8T6s6njdv2A+7sTrCpZgaxfFy1nxn3KCaCzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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

Any comments?

Thanks and Regards,
Arun R Murthy
--------------------

> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Thursday, January 19, 2023 5:17 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Nik=
ula,
> Jani <jani.nikula@intel.com>
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
>=20
> Enable SDP error detection configuration, this will set CRC16 in 128b/132=
b
> link layer.
> For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is adde=
d
> to enable/disable SDP CRC applicable for DP2.0 only, but the default valu=
e of
> this bit will enable CRC16 in 128b/132b hence skipping this write.
> Corrective actions on SDP corruption is yet to be defined.
>=20
> v2: Moved the CRC enable to link training init(Jani N)
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 3d3efcf02011..7064e465423b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1453,4 +1453,16 @@ void intel_dp_start_link_train(struct intel_dp
> *intel_dp,
>=20
>  	if (!passed)
>  		intel_dp_schedule_fallback_link_training(intel_dp,
> crtc_state);
> +
> +	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
> +	if (intel_dp_is_uhbr(crtc_state) && passed)
> +		drm_dp_dpcd_writeb(&intel_dp->aux,
> +
> DP_SDP_ERROR_DETECTION_CONFIGURATION,
> +				   DP_SDP_CRC16_128B132B_EN);
> +		/*
> +		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
> +		 * disable SDP CRC. This is applicable for Display version 13.
> +		 * Default value of bit 31 is '0' hence discarding the write
> +		 */
> +		/* TODO: Corrective actions on SDP corruption yet to be
> defined */
>  }
> --
> 2.25.1

