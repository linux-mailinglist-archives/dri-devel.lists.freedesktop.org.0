Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A96B3613
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 06:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7610E951;
	Fri, 10 Mar 2023 05:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752D10E94F;
 Fri, 10 Mar 2023 05:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678426240; x=1709962240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yf1SkS/3UaifD0YQ6Y5NoRDdvbz11rUTVQMCEeG1n3g=;
 b=RiNgpUU2hnDymLNlha41iEeYbL7cNtjWX+Erk9OjViX2gzBrE6gkCSEy
 D2sdYk8notuMl3KRYMTFIqWJRMvTzhw/vwcuXDSz1MBNJOlQT3Femx+Il
 CZts6No0vOBS3uoQxefG4eEhiIK4Vw/xyh7GvfO/wM/4X+jZ7a5UiS2N8
 uy3rxcOqDx9Z1m9fVpPJtN0aAb5xYKSY4T0AUXQvnWWscjSulzXdEo/HB
 zfBYS/rbqfbGG6zbL4mJMRhZMoweZ65nlj9jHnwL7GLkQYUQoa84ycZc5
 QJBVzxL5gWdZFpH307MV9RFDabeqAViXVKgbum3g2iMEZHkfgpSgeVoic Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422919265"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="422919265"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 21:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627681589"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="627681589"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 21:30:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 21:30:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 21:30:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 21:30:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 21:30:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkuvLPvOScpj0+Qkl+Lwm31HMJ2GhsFZvNXLt3VKsshzBligetvkA+kAT0KkgYspBkVCusF/ZuS+/wCHOfDpAVt/feyQ5HmeBpT56fqBjb/lfuXsN7rx5KwD8dfabtTk0LC/JouMj46c5eURwq3gcMnrdXcjgfjtOIeV0gFJfqlRTIqSwSRThvKIFt59a0AGNNa1sKKGryicxAPdf2fdwRQuk6DxISlmegiTWZk9/umdei+bBqj3KxT6ZK1dAQ0Tj6q6M+v2GpOsqCKVK478e6FbPGVYHIziVGgF8d0LCJefs8mb6YecsBQgoV/YwwyOvP88v4Vlhf+I0iMeJAj2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOWVFF2aWwbId169NHEDUgzx/jPIsneDTMykZThwYiY=;
 b=gj7PXYLTRQsTT3KII3L5VoOhRChrgDKO8oWMEun+CDywBDChCMVWPxerBTwmtX2h22VHNoRdeKqEbfSEGCbIpKwb/4ule9RJVMS3L4H4YtDMdhbfHDn9nDLbn0anCFPwAKbCMnsydlbHHtGhbQHg6kYZYqkZssABcmUQmUVATh1VSwiSpx37GmaRFBNpyGIiS8rUsc63CV+qPUc5eyz7J4MJobETqLZeOryw4CSfH7xfMt+JRhzC3dKimjZVZQ6jgEAlUxBFJMLUh8WDadwgNxmrR/MYnGBHvf7yb7oaJkfg2shtWSWIHV+Hv+iH8ou4PgEIaR92G7FDaX9sZtbw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 05:30:19 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:30:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, "quic_khsieh@quicinc.com"
 <quic_khsieh@quicinc.com>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v6 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Thread-Topic: [Intel-gfx] [PATCH v6 01/10] drm/hdcp: Add
 drm_hdcp_atomic_check()
Thread-Index: AQHZK3Nc8Xe/S4vQ4UKsTUqMt/Bw1q7zylhw
Date: Fri, 10 Mar 2023 05:30:19 +0000
Message-ID: <MWHPR11MB1741C74500B2A6FCE62D8B3FE3BA9@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-2-markyacoub@google.com>
In-Reply-To: <20230118193015.911074-2-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1741:EE_|IA1PR11MB6193:EE_
x-ms-office365-filtering-correlation-id: 21a561b8-6551-4247-e00f-08db21288966
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yf8MIHL6W1QEkX/a98o9TOj03fVy1htbT3hpmzVOlcgCtJPw1aC+ZctY16X/LdkOKUCbGG892jYJ6EcFoHovNO8dNEPp/CzZc5vvCJCRVhIM4+InU931AJHLGS8wsjwUUSEOKIlDMGFaw5+Iy/VBZHrt1XWW+PgNv7WXPbWABJRS86YItLnCs6MBoIoeN07l158FiC1AQRcElwdiEZ7D7VqC3tJljYrW8GEKr1wXcxHAh2XzJP7SjC1UmEgTQeuGctI+Ni3/GLIFyzyz8H7k+C9p2v5EmL9YIiO5jg5yQ7hT0W8xjuC7PkODYJVIuPh1g90u8Ms4hr+VInlwpH0nDP7gB4cKeMHOz7k4YwtGS60fZHmx3LNsbork/84cj2pQsWagFNEdh7rotnVwQITyYj4uyER2mH0ReF3qzou8B5RdYvwPUPbfeupPMxQYHiNg30o26I7rBbWSyKQeFMtOWjmAG2yPR3Zg9bor+JYGwfmJaSb3fCslm0tSkgzAvTseztrbZ12S/Aq5qIAYmRXPhZCtBJxuKVjLMJaQLuMovreffuUsMfpWAMVabAWjPckw11+lZXHi1xVZt72K+vioCVFvWn9Wer3l/uiZwf1l5/Rbaw62GoXVWuzy/Y3fkEIT3qUgOF8kdFlzQaT6Y9x9KA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199018)(8936002)(52536014)(5660300002)(7406005)(7416002)(26005)(9686003)(6506007)(82960400001)(38100700002)(122000001)(83380400001)(186003)(55016003)(86362001)(66556008)(41300700001)(4326008)(66946007)(64756008)(316002)(110136005)(66446008)(33656002)(8676002)(66476007)(966005)(54906003)(71200400001)(7696005)(478600001)(38070700005)(2906002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I7b/rSplhzmxYdlNeVvioVPKGPDpnmldzlykk2jbQ/AWXNf1yPTFRAJjkQlZ?=
 =?us-ascii?Q?eX7OuW3sd5R8qlc3iYNTbxW3qIRYM84uTvfI67lj/zfeZgb7rzZa/FOmocgz?=
 =?us-ascii?Q?XmpqsQ0pjdWlBa24Gu6T2S1UiuRWETklPY4PI8uVw0LFb4SBbSC/pBp5STo/?=
 =?us-ascii?Q?r1S5GWc8pzKFUYwn41MO9Ta4B1kQ3RcQ8pqijlN8+ixuPpXfWjxVdgbTkuRF?=
 =?us-ascii?Q?SxCh1+c0kQAiS3O4x32JS2pn6P6e9zWYsp3CiChQSETLwjA7hWYeAXOCa3Rn?=
 =?us-ascii?Q?ocoQhlUT74CppdjRSYTPKUxDM7XpMwGRyQGZCVie49wjIP0kflF1dRWKzstA?=
 =?us-ascii?Q?1uzY1u8XbYCCPVhA1Kqu4lndB6R50BZ05eztfT4zdoyNMZdNSEzEdw+fJLgS?=
 =?us-ascii?Q?jPTWa7Q561LN3lPUDn+p3E/LcKHlBMs1C+i4C4mSvusN3JlpqF985+foZ4DQ?=
 =?us-ascii?Q?U8vo4vA1NVY5Bx0F3CUspN3ZpKYcaV2LuoR3lEZzGO5lR3+svTjV4d1MTo6S?=
 =?us-ascii?Q?0ZPL1Gmf++Yg4SGJpWvfJaGZ4hGGOsIMYBLRzLwPcsjbucljxMQWoPazOgB2?=
 =?us-ascii?Q?NdH6FBDp74VqinTV0U6oWzKgNz/CHasQhv5JiwUmgSL+ehsaGypo8Em65L2h?=
 =?us-ascii?Q?QkoC7PRK5mwPxatx+8pE7PxuB7NBL5IWJWfGyPTYbx3L/byLX3yI6gc1nOdC?=
 =?us-ascii?Q?quoB1e9rC4arFfiV5HZRKKWPjewbjbyT97WwSYdL2JewKs4vDYZjOq22FqES?=
 =?us-ascii?Q?T72npJsDUJlUb8SZMJ/ZrArZ0jiFRL3yKerdUxZ6xKwPX1lfd8mLhpHFHUVV?=
 =?us-ascii?Q?PNRtdWcCZd5fzEHrFlEIKAU/y1/Sgf4skslpXsNUbRofYX++7Lj9pmmkEGi1?=
 =?us-ascii?Q?U2dFg78UKmDdfmldM4Te57AwBVgl6fQF5qdwfvUfLHMmmvkbkzM6fJzXNRob?=
 =?us-ascii?Q?ZagRKHnzKlXTAupD3jnsOoKssG7tFN7FUQ37qzinsG6w1m2heIewzIQq9EgN?=
 =?us-ascii?Q?qbgOShrHmULSmaC1grPEvjMZVDOex8Lt8nvDmEgm/9oCJl36HBzoaeYf5nXl?=
 =?us-ascii?Q?PkIS2pDBCpBg9LicQBeDn9Vw/iYyidgxb9nLK0aH4TPm9dvjCDO1QkRXqqeV?=
 =?us-ascii?Q?GMi1vEq1mL5YD1Ssf6Hcvux3mf77MeMHEsnyxBZa1Yqm5mETIAfnydJ6ck6W?=
 =?us-ascii?Q?+OgkFd3bxvAcyJknhP0o4+3yBaEbogFPUJLzBBHeEHeycC3pDzdnR0jhRQWu?=
 =?us-ascii?Q?7t3zHcQcvEXikBmU3ScEBQWzzux28Ibyb3qbyYlXnli3mATK4ft/7Gxl7Bjg?=
 =?us-ascii?Q?BzzmKEW/5MutWwsootYDsL8L7yqT3ecqLOUsqZXL/8DvZcXZHj6QMQxa+Vf8?=
 =?us-ascii?Q?wJK9lOdp154Sky/RTxiiQcg7IFT4bfUyObUVeDq0gh84nIBoDYptWiMFXZBf?=
 =?us-ascii?Q?1L+91kYsGR8Yqxk1kxsBvBikZCpprtGHImnIJh+aPKYn65JUjMAv+U4Wj0HG?=
 =?us-ascii?Q?UMK0oA4V2RjKnv4j89xdfSgcp8zWCCo8ASjllW7eJAMQpXzXKkhX7PzR62MX?=
 =?us-ascii?Q?DzMGuEdYeqxSnA1XNTuLNMOHhVx+70bmWDIkHZFG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a561b8-6551-4247-e00f-08db21288966
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 05:30:19.0529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rD+d+Owz81REI4pfQL31f4i+9QwqE/7zJuP7Vt2DU0XLqR+E7AgUgGXF3Vay47cpJ0ZPCoMTPiRImOb4Z5nV1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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
Cc: "quic_sbillaka@quicinc.com" <quic_sbillaka@quicinc.com>,
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hbh25y@gmail.com" <hbh25y@gmail.com>, "Vasut, Marek" <marex@denx.de>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Nikula, 
 Jani" <jani.nikula@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "abhinavk@codeaurora.org" <abhinavk@codeaurora.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "maxime@cerno.tech" <maxime@cerno.tech>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>=20
> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch moves the hdcp atomic check from i915 to drm_hdcp so other
> drivers can use it. No functional changes, just cleaned up some of the co=
de
> when moving it over.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-
> sean@poorly.run #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-
> sean@poorly.run #v2
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-2-
> sean@poorly.run #v3
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-
> 2-sean@poorly.run #v4
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-
> 2-sean@poorly.run #v5
>=20
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in V6:
> -Rebase: move helper from drm_hdcp.c to drm_hdcp_helper.c
>=20
> ---
>  drivers/gpu/drm/display/drm_hdcp_helper.c   | 69
> +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 --------------
>  drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
>  include/drm/display/drm_hdcp_helper.h       |  3 +
>  5 files changed, 74 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c
> b/drivers/gpu/drm/display/drm_hdcp_helper.c
> index e78999c72bd7..7d910523b05f 100644
> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_property.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_atomic.h>
>=20
>  static inline void drm_hdcp_print_ksv(const u8 *ksv)  { @@ -419,3 +420,7=
1
> @@ void drm_hdcp_update_content_protection(struct drm_connector
> *connector,
>  				 dev-
> >mode_config.content_protection_property);
>  }
>  EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> +
> +/**
> + * drm_hdcp_atomic_check - Helper for drivers to call during
> +connector->atomic_check
> + *
> + * @state: pointer to the atomic state being checked
> + * @connector: drm_connector on which content protection state needs an
> +update
> + *
> + * This function can be used by display drivers to perform an atomic
> +check on the
> + * hdcp state elements. If hdcp state has changed, this function will
> +set
> + * mode_changed on the crtc driving the connector so it can update its
> +hardware
> + * to match the hdcp state.
> + */
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *new_conn_state, *old_conn_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	u64 old_hdcp, new_hdcp;
> +
> +	old_conn_state =3D drm_atomic_get_old_connector_state(state,
> connector);
> +	old_hdcp =3D old_conn_state->content_protection;
> +
> +	new_conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> +	new_hdcp =3D new_conn_state->content_protection;
> +
> +	if (!new_conn_state->crtc) {
> +		/*
> +		 * If the connector is being disabled with CP enabled, mark it
> +		 * desired so it's re-enabled when the connector is brought
> back
> +		 */
> +		if (old_hdcp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +			new_conn_state->content_protection =3D
> +
> 	DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return;
> +	}
> +
> +	new_crtc_state =3D
> +		drm_atomic_get_new_crtc_state(state, new_conn_state-
> >crtc);
> +	/*
> +	* Fix the HDCP uapi content protection state in case of modeset.
> +	* FIXME: As per HDCP content protection property uapi doc, an
> uevent()
> +	* need to be sent if there is transition from ENABLED->DESIRED.
> +	*/

Hi Mark,
Is the above comment needed here as drm_hdcp_update_content_protection is
used to change property which sends a uevent making the above comment misle=
ading

Regards,
Suraj Kandpal
> +	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
> +	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +		new_conn_state->content_protection =3D
> +			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +
> +	/*
> +	 * Nothing to do if content type is unchanged and one of:
> +	 *  - state didn't change
> +	 *  - HDCP was activated since the last commit
> +	 *  - attempting to set to desired while already enabled
> +	 */
> +	if (old_hdcp =3D=3D new_hdcp ||
> +	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
> +	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
> +		if (old_conn_state->hdcp_content_type =3D=3D
> +		    new_conn_state->hdcp_content_type)
> +			return;
> +	}
> +
> +	new_crtc_state->mode_changed =3D true;
> +}
> +EXPORT_SYMBOL(drm_hdcp_atomic_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 18f0a5ae3bac..8a473199c4bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/display/drm_hdcp_helper.h>
>=20
>  #include "i915_drv.h"
>  #include "i915_reg.h"
> @@ -39,7 +40,6 @@
>  #include "intel_cdclk.h"
>  #include "intel_display_types.h"
>  #include "intel_global_state.h"
> -#include "intel_hdcp.h"
>  #include "intel_psr.h"
>  #include "skl_universal_plane.h"
>=20
> @@ -123,7 +123,7 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
>=20
> -	intel_hdcp_atomic_check(conn, old_state, new_state);
> +	drm_hdcp_atomic_check(conn, state);
>=20
>  	if (!new_state->crtc)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 6406fd487ee5..396d2cef000a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2524,53 +2524,6 @@ void intel_hdcp_cleanup(struct intel_connector
> *connector)
>  	mutex_unlock(&hdcp->mutex);
>  }
>=20
> -void intel_hdcp_atomic_check(struct drm_connector *connector,
> -			     struct drm_connector_state *old_state,
> -			     struct drm_connector_state *new_state)
> -{
> -	u64 old_cp =3D old_state->content_protection;
> -	u64 new_cp =3D new_state->content_protection;
> -	struct drm_crtc_state *crtc_state;
> -
> -	if (!new_state->crtc) {
> -		/*
> -		 * If the connector is being disabled with CP enabled, mark it
> -		 * desired so it's re-enabled when the connector is brought
> back
> -		 */
> -		if (old_cp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED)
> -			new_state->content_protection =3D
> -
> 	DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> -	}
> -
> -	crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state,
> -						   new_state->crtc);
> -	/*
> -	 * Fix the HDCP uapi content protection state in case of modeset.
> -	 * FIXME: As per HDCP content protection property uapi doc, an
> uevent()
> -	 * need to be sent if there is transition from ENABLED->DESIRED.
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> -	    (old_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	    new_cp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> -		new_state->content_protection =3D
> -			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -
> -	/*
> -	 * Nothing to do if the state didn't change, or HDCP was activated
> since
> -	 * the last commit. And also no change in hdcp content type.
> -	 */
> -	if (old_cp =3D=3D new_cp ||
> -	    (old_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> -	     new_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
> -		if (old_state->hdcp_content_type =3D=3D
> -				new_state->hdcp_content_type)
> -			return;
> -	}
> -
> -	crtc_state->mode_changed =3D true;
> -}
> -
>  /* Handles the CP_IRQ raised from the DP HDCP sink */  void
> intel_hdcp_handle_cp_irq(struct intel_connector *connector)  { diff --git
> a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 8f53b0c7fe5c..7c5fd84a7b65 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -22,9 +22,6 @@ struct intel_digital_port;  enum port;  enum transcoder=
;
>=20
> -void intel_hdcp_atomic_check(struct drm_connector *connector,
> -			     struct drm_connector_state *old_state,
> -			     struct drm_connector_state *new_state);
>  int intel_hdcp_init(struct intel_connector *connector,
>  		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *hdcp_shim); diff --git
> a/include/drm/display/drm_hdcp_helper.h
> b/include/drm/display/drm_hdcp_helper.h
> index 8aaf87bf2735..dd02b2e72a50 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -11,6 +11,7 @@
>=20
>  #include <drm/display/drm_hdcp.h>
>=20
> +struct drm_atomic_state;
>  struct drm_device;
>  struct drm_connector;
>=20
> @@ -18,5 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device
> *dev, u8 *ksvs, u32 ksv_count)  int
> drm_connector_attach_content_protection_property(struct drm_connector
> *connector,
>  						     bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector
> *connector, u64 val);
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state);
>=20
>  #endif
> --
> 2.39.0.246.g2a6d74b583-goog

