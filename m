Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1976B364F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 07:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764D210E955;
	Fri, 10 Mar 2023 06:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DEA10E955;
 Fri, 10 Mar 2023 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678428058; x=1709964058;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h5usuXBvd8qhvOka8z+C13cjKu3L9xDfZOQSxjZ3/Po=;
 b=lGhw1KKJAIi/kPvk/tjQrkmGLcTIKRviDLubD5RgHeRtsqQySa4bYqq/
 84mH+b7Xf2AhRKFvgFb+mjdZp2eO77iW0W8O94voyk5WlKheTQTXR0xkc
 S4ehXxmZjU+gifJBn9pHjjy+5o9sNtWqs4X3+Wk9K8zWLHU6cqC9JzZAg
 +N0uw01HyqkrxKxEyDFh2d0iDapxS+Vc0il1p/d+XRi0wAaGw1Zp+FfpJ
 Obleq5iYxQfBOeKstegj34qYoxzXHWJjhJYvpYvJQZBuqc8mLz4yxoSjZ
 waKMlM7o6O4ZPIpj5a0SZWFtK9lZTBvrQZGNAolGw+FA0xUcLAfdihlU5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364309363"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="364309363"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 22:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="1007003522"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="1007003522"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2023 22:00:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 22:00:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 22:00:56 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 22:00:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9jPiovxlqZMcZ1aTDQwrYpbteqwlGVuWn5pcqkgB7w2BTGHt34l+vPqRAjj6oYxD+LRAflOdh8oTggO5zzylP18q6oDTRemeBxAA9bdp6v5M0ruE20fZyrkhNyerHzxI/B1ZZk/XpH6N2T5iO+xCehMhGlNjZ6KKYMS/euer3ILEEcKnYMOD2IjHbo5IWV7DnYTsM33chREno2TburkGJuL96sq/2Vw+YetfmmjdQGNCs53fZK2hWD3FhZKsKrsTBfNTwHdAhV1fl8cX5aqB9DrpcHoK4+SMFIa7uKUORdH8V+o24CLthRxSSMHpw1/HDehgODy7BBx05ABXpXWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+VQs86g4mdp1cyIDmjgFcFAIAaKeKWJoGRdYX94UXk=;
 b=lOp6NF1zKP3q3Ls4a4coA2nmJW3MuH2NrdeMNvmwrOCelL8zFCecvI0PrcDpxHxf/T210wtkADDz2A3tMWInXRbzWhkfwo1vINWi44mCtder4JPJWJJxMt0ZMcKsFc2pI1nYUSua9VYvRsLgpZ0SIcFSYH5Vue9kWMI6Nkz1+XOgzemgWqFMGmMHyVam+V9ovpZ9xU79fE92WNr31gHnrG+ORRCHb9UUd7gz0JA4LlOA2DhukPOxZhK0ntOgFhfo0D4oVuB2ouDneLZfZSrF3smdYfBOe46u/kPqQVI/z6Cc7rsds3VtdEZ7mjF3cps7xEfKbitUqxSoX2Y7C5JjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by IA1PR11MB7678.namprd11.prod.outlook.com (2603:10b6:208:3f4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:00:45 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:00:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, "quic_khsieh@quicinc.com"
 <quic_khsieh@quicinc.com>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v6 02/10] drm/hdcp: Avoid changing crtc state
 in hdcp atomic check
Thread-Topic: [Intel-gfx] [PATCH v6 02/10] drm/hdcp: Avoid changing crtc state
 in hdcp atomic check
Thread-Index: AQHZK3NsHZDnZm1P5U+XuUfL4gBxdK7z03BA
Date: Fri, 10 Mar 2023 06:00:43 +0000
Message-ID: <MWHPR11MB174144916507690D292D2AFAE3BA9@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-3-markyacoub@google.com>
In-Reply-To: <20230118193015.911074-3-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1741:EE_|IA1PR11MB7678:EE_
x-ms-office365-filtering-correlation-id: 7e4e86c8-fcbf-49b9-115a-08db212cc912
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HfqjoB7/K2+ixgF39qfydn3NwkFrFraJsckepJgRtU/j8glv7Klxus1aLL1TFrE31UX4icZazCZjFEbZJBQiABUSS0Utk3kv1NRLN2E9G0tZkCm+hJsG44uolZAGMxR6yJS3Y6AeKOGHwbQdtsbeBGWO3JrddIZkvvOlAufvU71kn2ttbT5o4TdcvVkXOL7ywTS3lIw/fXjgw64GsW/KhXP0bERCrHICgFQWEC9dTCZF3iuz5QiEvcpFlPvo9A/rLmE2DRotJsn4CHzzIm+Bf0B97rHyBuTJq1m6CUyoCsbCd3GRyNtupjl2PfnT8pgGgcWxV/HHTxWVEVcKpICXaJ8DfSOfdS2TKrjpBJ7tqvZvQ/VbnsNmHk0pjH7KiP4V9uorf8C5YUGNg4vArNPc522RyQZO244Yqb0n+A5JQbzAEQuGWYcDh7CMBiUqP0vpvZLXFis3bybu1GDDp51WWXBSfB4K+2wTuZVHzD8cy5pPLpc0WjlEfCTnZ0NFAuTC6VTx3NunpM4efnkKVGxMVAZZe8+qzD8z2m2P2UuolyCt3/2G0iT9HVF7BWfcGYqfhgzXInE9dTwBAb84T8rA1tDke3yrtGI64tJbRdmcN3de59/cSj4FK71YKBJoY82J7Xr8TMAeKQGWlZXmn6MDHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(33656002)(83380400001)(82960400001)(6506007)(9686003)(53546011)(26005)(186003)(7696005)(71200400001)(966005)(52536014)(7416002)(41300700001)(66446008)(76116006)(8936002)(66946007)(8676002)(66556008)(66476007)(86362001)(4326008)(64756008)(5660300002)(2906002)(7406005)(122000001)(38070700005)(38100700002)(316002)(55016003)(478600001)(110136005)(54906003)(66899018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xpyPCvhiSMOX+JNHDlDCzDpoQ0bjIDxDYy67wqtWsW5LjLwBRmW6NKxdaqej?=
 =?us-ascii?Q?yzXODbsLe364oaG6gtRUN3V7iE4uvBvoKW+V/VC5r/gX9AdAN+6L4Qbya+h1?=
 =?us-ascii?Q?wntHFPVowtQGmzf0qAwf3imFIi8RQ/6nVXC7VxnUgcVm7qP2Xe585WLbMNVu?=
 =?us-ascii?Q?b+1KAr1n1UJw5bbGCbcNe09/qYzg91HHi6/UDKubX0WvHwhkrl2iFsPL8707?=
 =?us-ascii?Q?XcIkrwAbdps32Sg1JO33KzHqJmjWZpHgXTGwHhC8JU4SIKAP3sqG6eVG+PTw?=
 =?us-ascii?Q?w4m0YP4qZu9sdCT4TYJdcseMFcw6zYEubEPTFJw0nCD28ds8NKTei/1Wct60?=
 =?us-ascii?Q?Rwn6gXmWEc0mtDWFl7EZVxzMGGDp4eS0ZpHWBFP7j1eTow4UBpHpwyCyfnH9?=
 =?us-ascii?Q?srC5Or3DpPPOJVBEcB53fSW2duRrixOH1rspEKhVxBUg2nePvIwoy1OxoLh6?=
 =?us-ascii?Q?qScD5LVzszwcmdPiXEV9wYtAw0ZLMYIYFe+AkD+KIyqCCVHiuaykHZyiAQEC?=
 =?us-ascii?Q?c0hvoZBhAf/1S4EymQxkTK1+NV8IGX+QSoqHHSBjHBIqwJPWyHuycp5XGZzv?=
 =?us-ascii?Q?eS167maaP2TjYMS9Uhzo9AQnT7m9W2Pq7OzBhhGpgwFIjk5H53iQ2mWhtt9c?=
 =?us-ascii?Q?RYfJgphX1McGxNhCfGjUdCalYnl9O7s1/m5z4r2OEVj4oLiWWKW3XdCx53M6?=
 =?us-ascii?Q?rlXfTbvoger5IKAyn48E4murdBFnq8PmwbOo2T8KPL/xB+awaG/qzY/BSbfm?=
 =?us-ascii?Q?8lYitiy3p/pV06pQc7i8Jwq/og3nYW7ZwB9pAjsCthtvWJEIWl839OA9h/3T?=
 =?us-ascii?Q?ISfc0OCPztpK4u+5AsPXkd73HWGRj4CnraZHwdmO3q5z7TKwTiD0W29ENClq?=
 =?us-ascii?Q?7/TCj+sui8WZJd5Uvs4qaQWI2VuMHlzvcDfP2mV1nnsSgscnqBLQq8wWiO6n?=
 =?us-ascii?Q?UeugngKcHgS5e/dqKMG+QZsQW913ikOQdqfgBKcFfjIpdvBYK6EQnsYXEPaO?=
 =?us-ascii?Q?/ezTJpz+rDNPE8KtEWXQKA+X83UVMBeznr2Qvt+tlYuyoOz8tYMnzr4seG9z?=
 =?us-ascii?Q?NEVF6X66af/NbrfC1zgkYrZbm5TAYLten99a7jUIJvIkQIKilZdx0nfnWmWk?=
 =?us-ascii?Q?Oz6whYUbMRNEiIQwTb089Xf9yDxJ970lDWLHiDSmTm7r8N6umI2agpQewics?=
 =?us-ascii?Q?tEXze7OS56/v2DViAZy7ua9n4fFr8mk3Mn4k6w/lgaKblqmr1RbdpoIgGNXW?=
 =?us-ascii?Q?H7iZnGL+wzZZgn6Wl25dwqaHgG60a1L9gbE9akEGtOHDLtas1HQbVB67vy8d?=
 =?us-ascii?Q?UZlKcEHs/ytvrscxygBTzVcoC9NiC6ML+r/VYqY5AwrWGrVgySR4r1BZOKcZ?=
 =?us-ascii?Q?vhhhlRjHAcilWNKVkHwccv/r+UT4/B3Yh/Za6qFBQXL4UF8Er0Xq4PhOyFg0?=
 =?us-ascii?Q?nYtLK/Y+ftbD82I2d/KSGCuyvZOSPW4pQbS7PJS11c9gbsxHUw8r7vtb4sqM?=
 =?us-ascii?Q?eAVqQLwRlPj4fnHFnjcX6o1kslL+AKtkxsSWJ5IMIjg0/BxQaBwNas/bVFwY?=
 =?us-ascii?Q?25oIqi0RU6tZ9QqyV46+04PggzIK8FJZPipSCa83?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e86c8-fcbf-49b9-115a-08db212cc912
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 06:00:43.8114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZvXMuNc+M3gNmmx3y6sbWARuJjjHDxO8qgw7hZjQofVM/uSPSiY/IEeMvRt+W7DfyK6YlwTwEMpS+GidFcUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma=
rk
> Yacoub
> Sent: Thursday, January 19, 2023 1:00 AM
> To: quic_khsieh@quicinc.com; linux-arm-msm@vger.kernel.org; dri-
> devel@lists.freedesktop.org; freedreno@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; intel-
> gfx@lists.freedesktop.org
> Cc: quic_sbillaka@quicinc.com; konrad.dybcio@somainline.org;
> bjorn.andersson@linaro.org; krzysztof.kozlowski+dt@linaro.org;
> airlied@gmail.com; hbh25y@gmail.com; Vasut, Marek <marex@denx.de>;
> abhinavk@codeaurora.org; javierm@redhat.com; agross@kernel.org;
> quic_jesszhan@quicinc.com; daniel@ffwll.ch; Nikula, Jani
> <jani.nikula@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
> quic_abhinavk@quicinc.com; swboyd@chromium.org; robh+dt@kernel.org;
> christophe.jaillet@wanadoo.fr; maxime@cerno.tech; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; johan+linaro@kernel.org;
> markyacoub@chromium.org; andersson@kernel.org;
> dianders@chromium.org; tzimmermann@suse.de;
> dmitry.baryshkov@linaro.org; seanpaul@chromium.org
> Subject: [Intel-gfx] [PATCH v6 02/10] drm/hdcp: Avoid changing crtc state=
 in
> hdcp atomic check
>=20
> From: Sean Paul <seanpaul@chromium.org>
>=20
> Instead of forcing a modeset in the hdcp atomic check, simply return true=
 if
> the content protection value is changing and let the driver decide whethe=
r a
> modeset is required or not.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-3-
> sean@poorly.run #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-3-
> sean@poorly.run #v2
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-3-
> sean@poorly.run #v3
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-
> 3-sean@poorly.run #v4
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-
> 3-sean@poorly.run #v5
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
> -Rebase: modifications in drm_hdcp_helper.c instead of drm_hdcp.c
>=20
> ---
>  drivers/gpu/drm/display/drm_hdcp_helper.c   | 33 +++++++++++++++------
>  drivers/gpu/drm/i915/display/intel_atomic.c |  6 ++--
>  include/drm/display/drm_hdcp_helper.h       |  2 +-
>  3 files changed, 27 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c
> b/drivers/gpu/drm/display/drm_hdcp_helper.c
> index 7d910523b05f..a3896b0904b5 100644
> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -428,11 +428,14 @@
> EXPORT_SYMBOL(drm_hdcp_update_content_protection);
>   * @connector: drm_connector on which content protection state needs an
> update
>   *
>   * This function can be used by display drivers to perform an atomic che=
ck
> on the
> - * hdcp state elements. If hdcp state has changed, this function will se=
t
> - * mode_changed on the crtc driving the connector so it can update its
> hardware
> - * to match the hdcp state.
> + * hdcp state elements. If hdcp state has changed in a manner which
> + requires the
> + * driver to enable or disable content protection, this function will
> + return
> + * true.
> + *
> + * Returns:
> + * true if the driver must enable/disable hdcp, false otherwise
>   */
> -void drm_hdcp_atomic_check(struct drm_connector *connector,
> +bool drm_hdcp_atomic_check(struct drm_connector *connector,
>  			   struct drm_atomic_state *state)
>  {
>  	struct drm_connector_state *new_conn_state, *old_conn_state;
> @@ -450,10 +453,12 @@ void drm_hdcp_atomic_check(struct
> drm_connector *connector,
>  		 * If the connector is being disabled with CP enabled, mark it
>  		 * desired so it's re-enabled when the connector is brought
> back
>  		 */
> -		if (old_hdcp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +		if (old_hdcp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED) {
>  			new_conn_state->content_protection =3D
>=20
> 	DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> +			return true;
> +		}
> +		return false;
>  	}
>=20
>  	new_crtc_state =3D
> @@ -465,9 +470,19 @@ void drm_hdcp_atomic_check(struct
> drm_connector *connector,
>  	*/
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
>  	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +	     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> {
>  		new_conn_state->content_protection =3D
>  			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return true;
> +	}
> +
> +	/*
> +	 * Coming back from disable or changing CRTC with DESIRED state
> requires
> +	 * that the driver try CP enable.
> +	 */

Hi ,
We can have a clearer comment which says something like "Coming back from
UNDESIRED state, CRTC change or re-enablement requires the driver to try CP=
 enable"

Regards,
Suraj Kandpal
> +	if (new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	    new_conn_state->crtc !=3D old_conn_state->crtc)
> +		return true;
>=20
>  	/*
>  	 * Nothing to do if content type is unchanged and one of:
> @@ -482,9 +497,9 @@ void drm_hdcp_atomic_check(struct drm_connector
> *connector,
>  	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
>  		if (old_conn_state->hdcp_content_type =3D=3D
>  		    new_conn_state->hdcp_content_type)
> -			return;
> +			return false;
>  	}
>=20
> -	new_crtc_state->mode_changed =3D true;
> +	return true;
>  }
>  EXPORT_SYMBOL(drm_hdcp_atomic_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 8a473199c4bf..a2067cbae2d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -123,8 +123,6 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
>=20
> -	drm_hdcp_atomic_check(conn, state);
> -
>  	if (!new_state->crtc)
>  		return 0;
>=20
> @@ -140,8 +138,8 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  	    new_conn_state->base.picture_aspect_ratio !=3D old_conn_state-
> >base.picture_aspect_ratio ||
>  	    new_conn_state->base.content_type !=3D old_conn_state-
> >base.content_type ||
>  	    new_conn_state->base.scaling_mode !=3D old_conn_state-
> >base.scaling_mode ||
> -	    new_conn_state->base.privacy_screen_sw_state !=3D
> old_conn_state->base.privacy_screen_sw_state ||
> -	    !drm_connector_atomic_hdr_metadata_equal(old_state,
> new_state))
> +	    !drm_connector_atomic_hdr_metadata_equal(old_state,
> new_state) ||
> +	    drm_hdcp_atomic_check(conn, state))
>  		crtc_state->mode_changed =3D true;
>=20
>  	return 0;
> diff --git a/include/drm/display/drm_hdcp_helper.h
> b/include/drm/display/drm_hdcp_helper.h
> index dd02b2e72a50..cb2cc5002f65 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -19,7 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device
> *dev, u8 *ksvs, u32 ksv_count)  int
> drm_connector_attach_content_protection_property(struct drm_connector
> *connector,
>  						     bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector
> *connector, u64 val); -void drm_hdcp_atomic_check(struct drm_connector
> *connector,
> +bool drm_hdcp_atomic_check(struct drm_connector *connector,
>  			   struct drm_atomic_state *state);
>=20
>  #endif
> --
> 2.39.0.246.g2a6d74b583-goog

