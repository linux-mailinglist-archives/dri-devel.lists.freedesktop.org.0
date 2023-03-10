Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432E6B3882
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FAC10E974;
	Fri, 10 Mar 2023 08:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8472810E974;
 Fri, 10 Mar 2023 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678436743; x=1709972743;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b1QTfJFfGvkLuYtdMlxQn1Rai8NiQkmsNNy/athcmZk=;
 b=Y6sDdRLuNsC7bvqA10DHUaZWG9b1plp3ON3BbxqILsNBYpPBvumQMbW/
 S1trPzmF/wEH2oVjYm8Ujsjaiz2dwfovuDx7BUK/FDnk8KYtFpgCSpCLB
 3ktVGOcjlsKmsTZY2RP0eFEzOHCjQya5TcbW4MPioahmMI9UFWOpdchRM
 NUu6/+u0AeBwTtE1e/KcCFwnBmEc+q0mnrWWYoEXBaehD2V+A7MEvewrW
 tBFxaQeHWjYAIi61MdM7ADtp93+UJyd+DI7iYFw2zi7Xtk8zYYU8XWvJh
 Shs1QwQ1XGJuAB28Qw3e8So4QOipn9wG+23SuPKx0vucdoDhtdJa5sgxe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334155927"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="334155927"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 00:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677724747"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="677724747"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 00:25:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 00:25:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 00:25:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 00:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCYwVHsui3zG1ZGBgcqRJuvUK9fI9aixd2oOWPh8D7896fV6ibA+POWwy/bLHtYBnHn9ikQ/Kpy5K5wHvA4q5KsTHtmfG+qQKvDGRQ9QZFX7W6VwQmmychRxgNj1h7XljLYDFwVxxVA7MyOQDet4o20nLRw4+Ksq3bI3ydBRQjDxjlU/lgYcWWYzB8LWYkelxibzjbR7KCbA3XezaotMvWS6ZNrh8EGpqnVO5J7zlJ5h40vQqYkJhftz3MDPkz23IFCNaQE19nshN5i8MV3MtOkNHhqrQofgSwQViyPvuRvLF9q7cnDNHfqXMapgf8RfqA+tUejg9qVs66AGxOaMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbQ7XsiQ1CSJj4OFS/Zl7tYPQAx1twYAcvJqg4DjirE=;
 b=hCRFibVnRSsWHeToDwbTGO6+mrkzY7bIVaVA6WCNr9ZIraMFSskQOZpNzYNldXV7tsSFfrX6HrempsrwkifcRKmCAaw2xb68wqtAE2PGy24isr6wl71HsoDpHIxzSqV8foq1yqbSJ8KmrgUzSvhlCcHBwmfSoZd6pMkWFkCOuRoQLLaUxGiFGxV7dhHmUoxCE91hA95rHdEe5mEc70ievJO97AjOH1m1/bvqVqsUvlxeilfk8N/Snu2iaJ562yweJpX8EbVDlFkc5bp5DWqjOyC53QTgUEr0Zc0ycAGcIKmnYA7+m1m3idLcwgx4dQvNNnv5AJK1ej0O42Iku6Zaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 08:25:17 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:25:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, "quic_khsieh@quicinc.com"
 <quic_khsieh@quicinc.com>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Topic: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Index: AQHZK3NzHw1adqIUP0ahY6fdLOLhFK7z909g
Date: Fri, 10 Mar 2023 08:25:15 +0000
Message-ID: <MWHPR11MB1741FB33E933A3285B7DC88DE3BA9@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-7-markyacoub@google.com>
In-Reply-To: <20230118193015.911074-7-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1741:EE_|DM6PR11MB4563:EE_
x-ms-office365-filtering-correlation-id: 4180c15a-d1f2-4a53-7603-08db2140f9f2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Te5IcHRykBw1SbWw1KHxh1ReK7K6oiEJexagggIkfiHxgU+3TrcmsKkw2Am3AlTrEr5kwUJzLo4SmefDG7UIjHKRpUl4nr1rdFxKE9VaCUrsYd2rlwfUzUIMBmNZ/CX/SCrEgGmop1//1aSBx9JbFz652yIit7PzZ0uNeR9d6ZUnQpEvgVP8LsZJrwU13d7tc3eWXG9DUMSqrxGfQfGu7S5uztNAinPQyZi2ePx1X2U+KfJ1BbCPvdzwCBGsPSJo/LGIDDCittFfwn8hQTQD1AGBCv+UmPDJ5Od5WB5KO7ULZrrN7AX1sVTTK2cOU4NMHI+2kye+eRBOS/CUi12aPvkU0u/L1lbf7y8HkjliLqBWq5wpXfWuQ1bB5JK9GtDt91FnUtNdzFfXDwn02NS1elNZjymiWD55FQlB+gBcTiJW6169F4m17pKurGTa0RnQUro9ZXNWHFvn2bBZkCwiNLAS18klalA7VUupZvFb6AD5Of01hyTH3fGkZOYZXpuKxjZk7d9opemJwmXQWGIN0avr8zYFxYrgQlOsLgHvEJNtVcJ41GKcH25jm2CfJaJlwTtmef7cJfs84m24fgPGkSTp/DeAHf5dWxjtnhLBmQ3eTLGkUGJQG9Fon+1csxfgw8a5Y04dKLB1sdpfbiRJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(33656002)(83380400001)(82960400001)(6506007)(9686003)(26005)(186003)(7696005)(71200400001)(966005)(41300700001)(52536014)(8936002)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(4326008)(86362001)(7406005)(7416002)(5660300002)(2906002)(38070700005)(122000001)(38100700002)(316002)(55016003)(478600001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MTk8YP8D09cvnCTm7sykrYqTWLaBHxgkOmooE0Czv5oPFvTm04oTZSmcVKnB?=
 =?us-ascii?Q?UCuBHvzctjzBVL5HAeO6DVedsCN4KL42XVYyyCOMmQPGV2o4IZwJSiT4WPCE?=
 =?us-ascii?Q?2mDcYjHsAYFzU58R0iufk2zGA/N4AXBRnS6eONFyr4mxA1p4835K4ivryNB5?=
 =?us-ascii?Q?kFs7CAHNzfiySHsKFnDKYaJECCwXp6PVD/iigCwJVFMsMq6RojY2qb8R0G/2?=
 =?us-ascii?Q?CwRPyX8qUPbL2j9odrKbTfljSs1EhVBGLP+K8RXCRqKoRiLVsodyy2q/ifWQ?=
 =?us-ascii?Q?LOziiRnDmXWE2tQmgHoGUoWwMzj47eQ5bGcVsLIz1tfp1Jtlm9fo5FvHys34?=
 =?us-ascii?Q?bGvqIST8GjsZ1Y9VgKZ77OqI9glTrP5IcQyvkleKBi/ybHU8KHlJLhQsnxRT?=
 =?us-ascii?Q?FrnkLOrZ30zEIbOCDxcKGwbOgfRGUaMpGj/Nn7OU/zV+s99NhnRBWsZoiIen?=
 =?us-ascii?Q?G1jdXLLL/lMdfDK+RlK9LJJmwBlIgYTV/WXpGvf4qs89zqYydSDJbZBe/4MB?=
 =?us-ascii?Q?mRqlHU0OQmXWs+uf0ZGMTYqd2eG9lEKtK0xwQMQYT5cYOnD5QcE2pBVLFcpr?=
 =?us-ascii?Q?22htkX8w1pRC2Z85KN8/csVgNfFkv0QLOgYjTXEhTMlaWGH+fZUEM6zAk82x?=
 =?us-ascii?Q?slOJBptKprZSN/WAS84antrnVR6ym8Sz0oa7+MZTlChDRBhBqYEC52251H32?=
 =?us-ascii?Q?7wfKBBUcvMVm/IVBDQPdMEYN/k4GnusFIivWa/2yv73keOhZ9/smhwBWG8ts?=
 =?us-ascii?Q?GTvKewZCvmiplqRJW+Z2XU+s5WBP7LEZApVN1uSwSCxoKLM17wx4swEyPW0S?=
 =?us-ascii?Q?uUlLUcNp/zzbRZEA3/u3Va3TiLAKUqzl7k8wgGACgPXm0JwmpVzeHU6DkO2C?=
 =?us-ascii?Q?NP+bxvh8Hk/3auhwO9k1KHZlgxk9g5W8Gbb5u03QymWsth5TFfcXpAoyFZQG?=
 =?us-ascii?Q?5XoBC06k4TNte5o6y8B278Ek5y9btglfJ1D9tpme+Xf15235jwkk7IKo92I8?=
 =?us-ascii?Q?apgvzt93F9gj4RwVl/XeTtRzsoWlVWyYsge2Wm+XKC+6fmyCdS64RhofHUi9?=
 =?us-ascii?Q?0t996cwC3Scbu3cLQg5399sUILXx87qlzWe+93gG+KCqUXcT69JKK+G6qaNv?=
 =?us-ascii?Q?AuzyYOBvvChFT55BZH8OT5WLivh3Ij2eV2oIa2dp3oxl5zpNFCB42t4JqnQ3?=
 =?us-ascii?Q?X8GbOyhvcYmPZBy3/Oev80mzVR4dH9bRUcoPbefeXECyAUub54qvX+qFC7ww?=
 =?us-ascii?Q?gfJJfTC2YokwUoDUJqAK2WTHuwzgQ3K9tXVtTuBS4azYy0McDAEmWA3hXG+8?=
 =?us-ascii?Q?x03/dCnDPyXV+u0Og+GyAWg1BUfaWqRSacpuakp9iMUvn6gHvNjfHrKHqifv?=
 =?us-ascii?Q?V+glREQLtiHqs/ZP9mFzsTfTgh7psq5qEOqZYVG2qyaWODUX/ZfOps0tw/sZ?=
 =?us-ascii?Q?X/nmcGm6kzq10+XgEt5kwFUWZCRWmW1Gzy8IEpbPVJaMqDbObzvkF5Fp9Z1a?=
 =?us-ascii?Q?8oejw2g4UiOE+1oR/znR9ySCEK3rjzlb16Y/AVh8qMp+TlCcZMehtZfafFGg?=
 =?us-ascii?Q?3UewnOV8ilOOuaeB7LGDEB2Vfb3Ne58oFYdI0Cr3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4180c15a-d1f2-4a53-7603-08db2140f9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 08:25:15.7941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CaYIYNmzDNEvoBrggIM5hruO9uC7zGkXFWs82C9v+u0E3B7p7VUiUmskBc9BbJlnayaS/XeC2+tdmtrBsSqsgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>, "Souza,
 Jose" <jose.souza@intel.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hbh25y@gmail.com" <hbh25y@gmail.com>, "Vasut, Marek" <marex@denx.de>, "Navare,
 Manasi D" <manasi.d.navare@intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>, "Lisovskiy,
 Stanislav" <stanislav.lisovskiy@intel.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "abhinavk@codeaurora.org" <abhinavk@codeaurora.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "maxime@cerno.tech" <maxime@cerno.tech>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "sean@poorly.run" <sean@poorly.run>,
 "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
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
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-7-
> sean@poorly.run #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-7-
> sean@poorly.run #v2
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-7-
> sean@poorly.run #v3
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-
> 7-sean@poorly.run #v4
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-
> 7-sean@poorly.run #v5
>=20
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
>=20
> ---
>  .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
>  3 files changed, 37 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 7c7253a2541c..13a4153bb76e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -492,6 +492,7 @@ static void intel_panel_info(struct seq_file *m,  sta=
tic
> void intel_hdcp_info(struct seq_file *m,
>  			    struct intel_connector *intel_connector)  {
> +	int ret;
>  	bool hdcp_cap, hdcp2_cap;
>=20
>  	if (!intel_connector->hdcp.shim) {
> @@ -499,8 +500,12 @@ static void intel_hdcp_info(struct seq_file *m,
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

This does not seem to be adding value here as this error which you referred=
 to as being ignored
is used both in case of hdmi and dp is being to determine if hdcp_cap or hd=
cp2 cap is true or false
which you basically reiterate here too
check the intel_dp_hdcp2_capable and intel_hdmi_hdcp2_capable .
this change in itself can be removed.

Regards,
Suraj Kandpal

>  	if (hdcp_cap)
>  		seq_puts(m, "HDCP1.4 ");
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 0a20bc41be55..61a862ae1f28 100644
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
>=20
> -out:
>  	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 7c5fd84a7b65..f06f6e5a2b1a 100644
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
> 2.39.0.246.g2a6d74b583-goog

