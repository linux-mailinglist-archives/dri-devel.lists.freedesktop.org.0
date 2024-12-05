Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A406C9E4F07
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 08:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5671910EDD0;
	Thu,  5 Dec 2024 07:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F537ATEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A6F10EDE0;
 Thu,  5 Dec 2024 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733385497; x=1764921497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tdd3qJXym2Zuo8fOWWfoLxS+wOO0nnw2E1ajYXhM0Ck=;
 b=F537ATEkKMcTzD5lfqmqtXJrfsZXlv0C1fSc5w+RZ1IGCD3NJjYlJjsS
 I4eHnlLJ5SMhcciZTe7kQWjHw04nZUCku86BdPX3klpSMb/CGDcy+YioW
 OxO7x3tARVN66lTh8XxbOfYm/AxD2DnqWLM5mTnPQo9UdOhJbIKajaw58
 AZAx/khHlPGlZjRfKpLOO/tiYgximr5wHmvK6XR+pK2+z5BcbinVK+tDA
 H2J5RdHr9cpxyb8Naga5JanHqttT2T4L6V28vTOjMs3gZRQswqfFwVsp+
 xOvZAoo2a4mUMWOFRbdfs1JprY9kbnVmKJn79NOsl9xNRKwla67uBXqPP g==;
X-CSE-ConnectionGUID: vhVxh7NzQrmpczV9es695w==
X-CSE-MsgGUID: Nq1soZnRQZu6R/qOgqOahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44289396"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="44289396"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 23:58:16 -0800
X-CSE-ConnectionGUID: Og66Q/n6Qsi2fYQNxpCMFg==
X-CSE-MsgGUID: DFcV2JH1TkifxRL/YIW40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="93858493"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 23:58:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:58:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 23:58:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 23:58:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYlaTPf4pymrgUaI8t1G2fzOYerSVr6Re1PIPsuFjuY0Wp4QjQjoFa0frAnWSgUzDN+ayTTpOixR7Gi2n7/s/hMuAr1P/WFPPn1Znss/4bOgKdxcRQ/2J44LIN2c3QvhnY0Xao7cMMY+Vn7YtR8uVtauxF1lcsifAsw7g9OnnFsq5YfErG+A/G/axhin3zaAYfC/VkoDR0BfrlxEQ3I/8N9MONZ3H7Hy6y3NhJ+a9kvWlQCxA0Cn2I1ZXYE8nw/rMHQ0oOz7Uj/i0hoEKLXlfL3HT9aCeB81Gb4O3PNe+wEScE6me8os+e7bHoZsZAPDMyqVpmcL4baX3SATq08JWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJb26gBi0y4iVkGMf0EpmCZ7BgG/ggowQDQ6fvkqACY=;
 b=MqQ4w0YfwFpZSu0XVeoJKvx9w+xpGuzSN9LZ92KghgtsIFXnmqzWGP2WFahjRGFTKtGVelqIsopflEo1yf40bxZa84JrjbJ43nd7zuDfY2YdlIMzXy2n2W73R3CqmeYT1uYAd46+nZT79C7V4wIWntN1XVyK7ui5gzR1FBZS0pnEvI49GiVDIsWANx6OWaiGqHppLdPokKUoJRhwaLDNXJwcg8q/npqgQTh4ThuT0HfYH0IpCT/HubGxox+tb5j3E5U4HU8Y2uFcC0LnQ3iq8z5SahNSdTlRQ/zPDeKouoF23YgO542liNFpIAi8pG96WG0Jj8JuU/6FN0TEiv/4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Thu, 5 Dec
 2024 07:58:08 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 5 Dec 2024
 07:58:08 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv2 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCHv2 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbRi5j+Y4IG5jE+0yUaPGdRX/PhrLV+CQAgAFQi/A=
Date: Thu, 5 Dec 2024 07:58:08 +0000
Message-ID: <IA0PR11MB7307F22883ACF3AD873C3697BA302@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241204091456.1785858-1-arun.r.murthy@intel.com>
 <s3gkb36ga2pxmxocrhcjp5pcgbewx4x3joiyrpld3th4r4fvyi@rkpgbu4ekst3>
In-Reply-To: <s3gkb36ga2pxmxocrhcjp5pcgbewx4x3joiyrpld3th4r4fvyi@rkpgbu4ekst3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CH3PR11MB8517:EE_
x-ms-office365-filtering-correlation-id: 7433f239-bc9f-4c15-b9b7-08dd15028e78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XZC3NZWYXlPNT/d7lTkrFdLXse1tsCniaQfK0dtwBDBNhNeV6kEoHfgnnk33?=
 =?us-ascii?Q?RGIeYDTU8xfTsejTX5A2iP5RBhyTKBljPjmKOF1pfB9L+MpvYNTCgDCDyarX?=
 =?us-ascii?Q?BUn78cEvduYzpGJgkAhLPsbA1ff5My5rs0muJgLXATS2+N5XRBxbEpj29Ljz?=
 =?us-ascii?Q?pEPUv1caIyq/92hZ1JlZ7XcT1mIsowUs/02sYAluSRNeipzWGfnYsHiGl18E?=
 =?us-ascii?Q?VGd+MSQjmCYtdYbma2RiBLy9/CMA2bCMnHD6OutdhKg0bSKLg/1oXWKtYVyK?=
 =?us-ascii?Q?O6Pz2c/naRdiXyL6B/dpECvwz+lkMqIUa+vJY69d2FpV5NWD8DqxM9tY4z7y?=
 =?us-ascii?Q?diEdre39J1aLhAPu0okhvutduTs32izVDfUSavpvvvoNYyCfvsrqlocBPUm+?=
 =?us-ascii?Q?pc6lTawWNXdVQC4B/aUgxOxd39tHJHgONwJ5GARWB41k5o6bSXhRPSLNYjt2?=
 =?us-ascii?Q?QR0CPK6ilJAs5q6pem1IxlFrKllSXCsmVEx9TpUtLvArG+DXd/Z19veQB6Bn?=
 =?us-ascii?Q?Yrhj7Cu6po159tAXNIRxC9ugcV9dN32fVGSs6/P5wwUG9D+cbrvat6M4a3q7?=
 =?us-ascii?Q?z9tBotLFOpIMpZNxEPeL/7VjnUIvPRzLE7ILkVLvGTQXruORKOq5qZ35OiVN?=
 =?us-ascii?Q?Qpc3sG86WAkGFja1cFZrLJPN1T741f6jykRL6XLv644xUTCFLu7VPJMNGwtv?=
 =?us-ascii?Q?oNO+XhwQ6GplfwWJJdonkDugb1xBBHwRben3BHDaURC5ZWmkVXZrC5awOW0j?=
 =?us-ascii?Q?ploM+VDMQcF0T3ukd5zNx6cPFo8gmy20pxYib506XCGCUJWPCQKjOmzlnGEy?=
 =?us-ascii?Q?fusx+ehmmWAXQ+G7e4QLplrVI1EKDPYv+hsGTdpcrFYk9yUXA/CuxWxL3HO3?=
 =?us-ascii?Q?wzqAdu6a8ptrD9Q7qeLscCJtJZ4WfCotKvgxSF9UWXwgK8GIAxo9t0LHFN03?=
 =?us-ascii?Q?mfz0pf/GuLO9U4VgqZRGQnFVlkZonEZ7IE3S44SdYCef8RqEE9Gx/J6YEpy5?=
 =?us-ascii?Q?vj2qbb0mQsZvSuFKkGVwg1CZJedrYjudiEUgE7vMSSc6JNvTNrg6aPMSujQl?=
 =?us-ascii?Q?l+tezyMGMDxAdxS1yaEgSGrcHpD8MUYmKR8FmPKrZDCd6+WlM+qtM74vW9Cv?=
 =?us-ascii?Q?Dy66avikSFGSYWZQ4SRb6NLqisRUIOw1gl0Z1xBjdY72M6wVhOrc2VYOkClk?=
 =?us-ascii?Q?HC8JOOAsucxhQFRBm1R7qq+tXdPjfBrzCH3ZWTCLDAqHv21M4jM6hc4aCpbb?=
 =?us-ascii?Q?gwOagISM3k0OdN1De9vqkWmthy9s0Lm/v5ADkpw8miolFVy/QIWSvNCDc0z9?=
 =?us-ascii?Q?MPH+YSnU+f9uJQUsnAu/P1/6TVQWMjqsUZlI4AuywoMYvY5Y3AxL4zmFgaJM?=
 =?us-ascii?Q?mAxHNKF7QJcWYn9LvTjnmkx1iWJk0nEF2v0pRqyWrcwkg1osOA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ky5TUUWComASwQMImpRi4xNF4cCM6LmxpZgcbqLPvsYAbG0S8yhasdV9rhWj?=
 =?us-ascii?Q?Ui2mSmbSvGNTieBdTndrz49Bbg+GOgT74hL94tnl1iTZ8J22yLVmRb9/LZN6?=
 =?us-ascii?Q?u65sqLtc2Fw7uRp6HBnBdYHIP5E20xBY5y39kqw2h2qe65cOWHR5Xgw5NiUl?=
 =?us-ascii?Q?firjkWJRTvjGQ7PA7+tbT6ojCEEXWJhJ74vmXN7M81EA/A7+y5JKC0iLT4Le?=
 =?us-ascii?Q?H9QF12486fkYTQgIQypI4K1sf+1ZfFwP5sDv2bCSzuBzWm8YPiU6sidppbBO?=
 =?us-ascii?Q?nLIoDdIiwwRO3YOGKgF5Okph2xjH1fQpfzKzBTmJZJn8tzIhbVtL1/2eAoPB?=
 =?us-ascii?Q?DHu9ZJrzcYZ/Vz2Nx6xydvEsF9hWWSYHGFu5mYQxdaft8KBw1WkkZyXl+Jic?=
 =?us-ascii?Q?gblIwxqZf3Dv77wDhGupB35mCNoxX1x9bFBjyvZwzMKlBrNM5g4am9u/gScs?=
 =?us-ascii?Q?+Mq+S5yKwA4VohU5gVmFslrhyGgYdadZl81nvYyipRalWeO5v0pPMgQrnt6N?=
 =?us-ascii?Q?Ptly59lIbV0IWM0DWD9S8CU5s+Bs0I8+k8B+Cx4C9Ai6oWs8kWDKBlbsNvMI?=
 =?us-ascii?Q?3yPMq45ARb3hDMSpUzYb7kn74dlnh9TUKDwWZ7bntRIcvbm8/0jhdvvMKo2E?=
 =?us-ascii?Q?8EPpnY0bs/3mK7gjavyJf4JdIU6BRQdyfPhR1nN0xBkS28vnwphnvTCTWu1r?=
 =?us-ascii?Q?8Ps9MSqvgasqCVusEBzD2P5ZjEb41VFQVh66xilfFOwW9LWuU+GJK9BcsHPV?=
 =?us-ascii?Q?qDzlKB+MYMQ0dDx2qMWb0MurOgFgbuQgWVOKBaRIA1FlNkT8ZLOj7YjxEe3s?=
 =?us-ascii?Q?gUu4a2zjGQmByz6w4uQ6HGxBMqz19p+G9HhaTaAKzOFPyZds9NvDxcnzdw2T?=
 =?us-ascii?Q?j8eDtT1vENjwmb/zAh1x7Ro38Cv7/oigVPHNUlrYpS8TfOoyqY4OwKlMuq0p?=
 =?us-ascii?Q?oibzQ1ahs/ODUAa1AkN5p74xlv3v5byINC5EFBt9TvqnlGvl9qlFBbvveMeH?=
 =?us-ascii?Q?o5hH9EmXnAkLXerVFj9yYxOyBIfBdJ6l8yfRuja47Y2r5MUPy38NQfV2pKK5?=
 =?us-ascii?Q?Twv/0RCE9zC5iEA3aUy6umv2Nmc5tgFcPtoB+hbRCbfWOaOmmzfSalYuJIEI?=
 =?us-ascii?Q?9dXBZh6rgE6Ic14PVARKQTw6C0ncW9w92LkyMlpkoB8/sMtYN5e3ynb8uWLX?=
 =?us-ascii?Q?HwH2Z6FGktIOxvdKAqPQI+Qe+ZXlWRlBwDGbsOL5sErgMCJbGjURw+ITbuOX?=
 =?us-ascii?Q?jP6fxWuNUShdJ0lo+kYdo0DkJxjDCmhk9gGFD32x+e108ahmpS7A7OhlNmcn?=
 =?us-ascii?Q?YHleowHDBxxu7t0zfMP1b6TI8V8RJyH5k25a93NjRHfnR1b90/PmBANY3elL?=
 =?us-ascii?Q?7zNpE28+nhncRyfo8G2T+Kd7dSZ3K5+p8I2mC1jDL5Hf5a/yCZCHqgOAOJdY?=
 =?us-ascii?Q?Nkwt7Q7/Ub9a3Q0c6w7MDLeEGUU5JHk4PIkFnFY8UEJFicyPPXSb8SmPUaQu?=
 =?us-ascii?Q?rrWL/GosnLAgi0qMosr1MjqaJFMvcALr0BVMwZ3Yq2Wq+2hKr1OGBhLkKQke?=
 =?us-ascii?Q?XuUO5ASOXz+OQIDzA+hZljIXQM1CwSW9JuogsReW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7433f239-bc9f-4c15-b9b7-08dd15028e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 07:58:08.0786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAKB2CALL1LF4F6rtwwSxsE2x9vdISpY+nQvDYWPNXcSqESPl3sk2GzJuRdVSEbKl7uEK9CgKqvDwBKF0LUulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
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
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Wednesday, December 4, 2024 5:17 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Subject: Re: [PATCHv2 01/10] drm/crtc: Add histogram properties
>=20
> On Wed, Dec 04, 2024 at 02:44:56PM +0530, Arun R Murthy wrote:
> > Add variables for histogram drm_property, its corrsponding crtc_state
> > variables and define the structure pointed by the blob property.
> > struct drm_histogram defined in include/uapi/drm/drm_mode.h The blob
> > data pointer will be the address of the struct drm_histogram.
> > The struct drm_histogram will be used for both reading the histogram
> > and writing the image enhanced data.
> > struct drm_histogram {
> > 	u64 data_ptr;
> > 	u32 nr_elements;
> > }
> > The element data_ptr holds the address of the histogram statistics
> > data and 'nr_elements' represents the number of elements pointed by
> > the pointer held in data_ptr.
> > The same element data_ptr in teh struct drm_histogram when writing the
> > image enahnced data from user to KMD holds the address to pixel factor.
> >
> > v2: Added blob description in commit message (Dmitry)
>=20
> No, it is not a proper description. What is the actual data format inside=
 the
> blob? If I were to implement drm_histogram support for e.g.
> VKMS, what kind of data should the driver generate? What is the format of=
 the
> response data from the userspace app? The ABI description should allow an
> independent but completely compatible implementation to be written from
> scratch.
>=20
The histogram is generated by the hardware.
Histogram represents integer which is the pixel count and when it comes to=
=20
the IET(Image Enhancement) to be written back to hardware its again an
integer, pixel factor.
Is this the information that you expected to be added or something else?

> BTW: something is really wrong with the way you are sending the patchset.=
 For
> this iteration I see only two patches with no threading.
> Please stop playing with individual versions of the patches, generate and=
 send
> the patchset via a single invocation of git send-email (or git format-pat=
ches / git
> send-email). The version is a version of the patchset, not some other num=
ber.
> You can use the b4 tool which can handle everything for you.
Sorry, will send the entire patchset in future.

Thanks and Regards,
Arun R Murthy
-------------------
