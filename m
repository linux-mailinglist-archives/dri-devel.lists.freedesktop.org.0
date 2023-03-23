Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956196C6081
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 08:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50FE10E44F;
	Thu, 23 Mar 2023 07:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BFF10E44F;
 Thu, 23 Mar 2023 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679555903; x=1711091903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yxD43jG93moM17S3uB/eRnrwjgTonMseECqR2We2I0Q=;
 b=NnWeuOnoy4lv1D4MytkPFWofu3cmY1Hu5+z++Do7PnEmumHyERuWO/Gs
 OWeyK5S9FREtAXQyTbXXWQvmcEYARGDStix43olR37L6DMKmlZ52JJnFF
 Tem3YREVWt/v1p4fE2UYV1XS940h13qfizNn7rZU9epDn4NmvFCKFWv7E
 QITZMPxgH2i1EBytASA+NE1MleAazXqbV2CSVbRsl1ozhGzsroRYKmOQ9
 1Izz/RR7XRptwieeCCS7BGLVB7bBHUsgA3YS4l+ZQJlI1ExMHrgrl+CuJ
 f3ooTOTqKuH/7HAMabJXmTRISaIC7y1vgkIJ3DB6PmKdJc16x9g7sY9a8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327794663"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="327794663"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 00:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659478015"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="659478015"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 23 Mar 2023 00:17:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 00:17:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 00:17:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 00:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iypZC8B56frVj9/AcMT4KDLrmbdE6Ttq9dy9uMU8mqSsfiXJlpZHAemIm7+oghAiFtWs+82WWxnSiG19uqoTr3iKBHOxGCOByFlbFuNLrach79JRhU+1V08fvYAdgG8SAG7GqpCTx6c3eANVk+FSiAlFiEara+ijojQqG0PJ6R/WbEQLKIXaPajmrMybcXnedgkFNtEnFcX+pXSqEmdZbqqGEpP6p7oPCbCrvEe/pAYetZopGUHmMDxP15FM3KMm/fy2qTN2kM68vxtbhs6Wk0zhRyjdeEnIVh8VbT+UOYjNVwOwvmzj+iFiQckhANHOihIpI1hQen1zaNL134mUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkgJs5N4kNhQYO9eyByAY57qmqlcroYIRZ1wd3j1LnI=;
 b=OhBDCXwq/Mm5j7RI+M5L69SpOtOlPvPyK7ttRykRnYzFGnUXVfDXKjHgfpAtC/Gv6QMWKGycgAWeOtlLbvnzKqRqczeEYWP3Esh7HXduEPnFA/mndKcn3rywlr7MKdaLjp3ljVaDkjvsoBaTN2KQqlDN8n67lh2DsR3zQ1+G4iTGw8kuJAEH1kfoaJzQCABlajJim+r3bi9KB5pk8cxq/pSJxNZTHOGi3TfTq8EvV20bdo4VOKyH4LU8oHKhcTwktyrcE57FCnVJJ+PTp4ry8tFAsJ5rIkKiGY4VDUjFTyOssUELNAryZKyHKkfIce5gGdBJE3fb/d3w1hrhMccxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 07:17:34 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::469:cdec:dfa7:2c73%7]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 07:17:34 +0000
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
Thread-Index: AQHZK3NzHw1adqIUP0ahY6fdLOLhFK7z909ggBRfsoA=
Date: Thu, 23 Mar 2023 07:17:34 +0000
Message-ID: <MWHPR11MB1741D833E10227E8BA1CEE03E3879@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-7-markyacoub@google.com>
 <MWHPR11MB1741FB33E933A3285B7DC88DE3BA9@MWHPR11MB1741.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1741FB33E933A3285B7DC88DE3BA9@MWHPR11MB1741.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1741:EE_|CH0PR11MB5313:EE_
x-ms-office365-filtering-correlation-id: c31af43d-99ca-4953-6e9c-08db2b6eac7d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dYRrpZnYkT5VyxvUQZvzsDBlaVGPYLbNapZ6mF2dMXTzyKJMc6aAvlNXvGj3ko6cElJhP4aRWwX6SIUOf23PRofu5zWTyBci6G6y1bftGgTbozX7VIpr4eFccio5el8Zc64VFCu/fCjajLd+pghatB2nWkaYnZSkgj6Y8u3z0RTCrEZfOjbt+qr7AZRkksAT/l5HLZGUWH6KSeHGkMamsP9KZJKUNhPrJMa+bL+WBWSLbwcvwiy+Zj1v0MubNh2Fj5GzX2oQCf45DyJelkQGrK1ra4aubtJg5rEnFAQ7KzRy2F9phZBzfB6nvElvgwVumVkajUbw2NmWyMa6ZP2+4ZwnnTvp2mLpUXof7NhvJuoLJHnbpOmyfPc4RA72e2c8l5S2GwIHV8MxB2fMNwWRq1tAMiQk9Wd5HwEaPpxo08JHiWo7d89QV6yV8hFZJFvw4jDKPsVq5G5AItH/uhALC+Rj7ILmvyhMHaNvBJm473UTnM7Xy3NHJFiVHIzba8H+mTQcqloXhDmrEpW1zeidp0lXjjwiDYB8XgfJWZyH+7NlZUrtT6yN07jjB9vM7kNzzYRNbxUtCEaVfzon5AUjjZ4ma9ToMzlrYAAAH6e6Z/4kuRf2wDlKRLAbSzJ739EabMDBNf5mIpffvT9wtznLaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(7416002)(82960400001)(7406005)(86362001)(52536014)(8936002)(5660300002)(41300700001)(66556008)(38070700005)(55016003)(2906002)(38100700002)(122000001)(478600001)(53546011)(54906003)(110136005)(6506007)(33656002)(966005)(83380400001)(26005)(7696005)(71200400001)(66946007)(66476007)(8676002)(4326008)(66446008)(64756008)(9686003)(186003)(76116006)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YoIEJt2gAbDtZJoHl3Nz/Y5Vp9gNtXKav65YG5K5vBBomV+vitj7W03SXmCJ?=
 =?us-ascii?Q?Du6Mn6KcfpHRVsltgXnotmN+VgB7u9NDM4OzxlWOqpYJ2fbdSG8z7NM08zWp?=
 =?us-ascii?Q?78f2ot/dRdK2MFiv4l+BMs+QtSb5l2RZPHNOTrFNrJRgZibv4gmQGVeh/H6t?=
 =?us-ascii?Q?kqXCuiNHqjrnWAAfcI/nhv7lrJhm9YFsgwkc6+VDHhCoeUecbQNfvqWUxYtR?=
 =?us-ascii?Q?p+H/Dzy7ngEOcNeVLCAQrTRt4i1j+JZrqAuurj73fbXUGMRf2F7/ZN0kLlZB?=
 =?us-ascii?Q?n/Z4fOUqxl8ehfJ0NpT7nGrO2PCBVS4gcs6IJxA2Os/mNk/jov81P+qLV6mY?=
 =?us-ascii?Q?Efy8bPlFshei5il/xYnlU5dPQIr7y7JVz22K1KWzKm8ycFfdxtPnjiqb0jXl?=
 =?us-ascii?Q?/yOp1kb9T0f7SSN9S7zkUcuSKafOZLssVOF9fL+cXbkrqh3B9anJWQ+B6irF?=
 =?us-ascii?Q?q6rjcxzBf7dsXedvXeneJMg14H0qABiPYOTDqsc7wbMoUxiVkSNjecBIWNQa?=
 =?us-ascii?Q?rgT/qgTWMqDCzn1AXHM10ZVaui3CHoVOrFoK4CWYXKbh83pqHnAKCM6XWStc?=
 =?us-ascii?Q?bhqEcc3pwzMkOJItCcd0faUUyrDWbcjGh28yDOuCAXgVlTneVUgm1xmeT+JD?=
 =?us-ascii?Q?9u2D0uc84AryTVzOmHGQGM76ZLL4gEAtAJNQ4EcWmsxDx300OoEWGjeqZmAo?=
 =?us-ascii?Q?9cLq1DWt/GgJlEWf6mAMpsUFoOsMf00kboQ4NUEzx10j97mSe3Qs2WS16QVa?=
 =?us-ascii?Q?QT29RTGXbA52DvJqZewsU6zW+xOBFcuwbjrjnFWdDhQgQ8/2wDechGnRVNi3?=
 =?us-ascii?Q?Ffyv5Ud+d7/AZeMu0xEbnH7uXzuLhnlPyOLq/nUy9sV1BsbRO7t15N8efD6R?=
 =?us-ascii?Q?NQEpVq2auw9futbrEtQX+eMaP3D+q9wZN6IIW8nFYr+TPALu+BbOZTlIQat7?=
 =?us-ascii?Q?yaZo4iHB1mFbeURXCE/QeFQt/LKCjIeIwmhTqnHPaAeCRfAUiYASerN3z4Ro?=
 =?us-ascii?Q?o1hscycl7OI44d0/xfmYChoFAmvkV3AzF8LER8KkPjI6zs6DI9pL/py672Vg?=
 =?us-ascii?Q?i4fueTUvswVQXxWOXU8hhQP/u48/o9QZorgXfDvvvkWsSptfQd3QymXutN/K?=
 =?us-ascii?Q?wS5ki44uhT72rt09gDJDaEPOClnfW6vugF4zToAZGEMlwC6i1NY/WK5EwskQ?=
 =?us-ascii?Q?tYkbeM4jx/hnUYp8S4RO0AdT7uDc2oQVgMsrGfUwmrEfCiBiPMgj6jUyV6eN?=
 =?us-ascii?Q?qEFPxOgLutWpq8i8CfSTvZ76pvZ9bl2Xwwsv11//RmihBGUdktNzLOsWnbAr?=
 =?us-ascii?Q?0p4iu1qB0UDA9ZIXIQHBqKnfl21sAc+ZjvZRJ5gQZUZVtgVfR/+XwwuKF3FI?=
 =?us-ascii?Q?2CcODsjYJuvYKrhJMJ+2p0+ON739/RhMVObqauHQnj353HilEZr5rTrPLbHZ?=
 =?us-ascii?Q?en3m55VrN7mzrmdK8I63RVU+ScAQNEXVIt1bwibTx+5wOUsbdryFRqxB0nUk?=
 =?us-ascii?Q?wE5wj/eH4NVI55KvSd/dCrKcNuVVgmA19vC3DHOWetFf5wGa9L2yxXfG6zze?=
 =?us-ascii?Q?GJclZDfFs678daHRY0n0Bi9+BMeDjVwXKsK7ePm7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31af43d-99ca-4953-6e9c-08db2b6eac7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 07:17:34.2886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydEcBlwrhkxFuQyUbGaESDwuEPA7x3FG82xZCT/7yTbJ4B7A/B3NheKrmVZuz2YdyuFDmZdX9lFMHo9Y6Pw77g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
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
 "hbh25y@gmail.com" <hbh25y@gmail.com>, "Vasut, Marek" <marex@denx.de>,
 "'Navare, Manasi D'" <manasi.d.navare@intel.com>,
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



> -----Original Message-----
> From: Kandpal, Suraj
> Sent: Friday, March 10, 2023 1:55 PM
> To: Mark Yacoub <markyacoub@chromium.org>; quic_khsieh@quicinc.com;
> linux-arm-msm@vger.kernel.org; dri-devel@lists.freedesktop.org;
> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; intel-gfx@lists.freedesktop.org
> Cc: quic_sbillaka@quicinc.com; konrad.dybcio@somainline.org; Souza, Jose
> <jose.souza@intel.com>; bjorn.andersson@linaro.org;
> krzysztof.kozlowski+dt@linaro.org; hbh25y@gmail.com; Vasut, Marek
> <marex@denx.de>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> sean@poorly.run; abhinavk@codeaurora.org; javierm@redhat.com; Murthy,
> Arun R <arun.r.murthy@intel.com>; Lisovskiy, Stanislav
> <Stanislav.Lisovskiy@intel.com>; agross@kernel.org;
> quic_jesszhan@quicinc.com; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Nikula, Jani <jani.nikula@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; quic_abhinavk@quicinc.com;
> swboyd@chromium.org; robh+dt@kernel.org;
> christophe.jaillet@wanadoo.fr; maxime@cerno.tech; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; johan+linaro@kernel.org;
> tvrtko.ursulin@linux.intel.com; andersson@kernel.org;
> dianders@chromium.org; Sharma, Swati2 <swati2.sharma@intel.com>;
> Navare, Manasi D <manasi.d.navare@intel.com>; tzimmermann@suse.de;
> Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>;
> dmitry.baryshkov@linaro.org; seanpaul@chromium.org
> Subject: RE: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return
> codes
>=20
> > Subject: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return
> > codes
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > The shim functions return error codes, but they are discarded in
> > intel_hdcp.c. This patch plumbs the return codes through so they are
> > properly handled.
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-7-
> > sean@poorly.run #v1
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-7-
> > sean@poorly.run #v2
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-7-
> > sean@poorly.run #v3
> > Link:
> >
> https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-
> > 7-sean@poorly.run #v4
> > Link:
> >
> https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-
> > 7-sean@poorly.run #v5
> >
> > Changes in v2:
> > -None
> > Changes in v3:
> > -None
> > Changes in v4:
> > -None
> > Changes in v5:
> > -None
> > Changes in v6:
> > -Rebased
> >
> > ---
> >  .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
> >  drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
> >  3 files changed, 37 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index 7c7253a2541c..13a4153bb76e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -492,6 +492,7 @@ static void intel_panel_info(struct seq_file *m,
> > static void intel_hdcp_info(struct seq_file *m,
> >  			    struct intel_connector *intel_connector)  {
> > +	int ret;
> >  	bool hdcp_cap, hdcp2_cap;
> >
> >  	if (!intel_connector->hdcp.shim) {
> > @@ -499,8 +500,12 @@ static void intel_hdcp_info(struct seq_file *m,
> >  		goto out;
> >  	}
> >
> > -	hdcp_cap =3D intel_hdcp_capable(intel_connector);
> > -	hdcp2_cap =3D intel_hdcp2_capable(intel_connector);
> > +	ret =3D intel_hdcp_capable(intel_connector, &hdcp_cap);
> > +	if (ret)
> > +		hdcp_cap =3D false;
> > +	ret =3D intel_hdcp2_capable(intel_connector, &hdcp2_cap);
> > +	if (ret)
> > +		hdcp2_cap =3D false;
> >
>=20
> This does not seem to be adding value here as this error which you referr=
ed
> to as being ignored is used both in case of hdmi and dp is being to deter=
mine
> if hdcp_cap or hdcp2 cap is true or false which you basically reiterate h=
ere too
> check the intel_dp_hdcp2_capable and intel_hdmi_hdcp2_capable .
> this change in itself can be removed.
>=20
> Regards,
> Suraj Kandpal
>=20
> >  	if (hdcp_cap)
> >  		seq_puts(m, "HDCP1.4 ");
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 0a20bc41be55..61a862ae1f28 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -177,50 +177,49 @@ int intel_hdcp_read_valid_bksv(struct
> > intel_digital_port *dig_port,  }
> >
> >  /* Is HDCP1.4 capable on Platform and Sink */ -bool
> > intel_hdcp_capable(struct intel_connector *connector)
> > +int intel_hdcp_capable(struct intel_connector *connector, bool
> > +*capable)
> >  {
> >  	struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >  	const struct intel_hdcp_shim *shim =3D connector->hdcp.shim;
> > -	bool capable =3D false;
> >  	u8 bksv[5];
> >
> > +	*capable =3D false;
> > +
> >  	if (!shim)
> > -		return capable;
> > +		return 0;
> >
> > -	if (shim->hdcp_capable) {
> > -		shim->hdcp_capable(dig_port, &capable);
> > -	} else {
> > -		if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> > -			capable =3D true;
> > -	}
> > +	if (shim->hdcp_capable)
> > +		return shim->hdcp_capable(dig_port, capable);
> > +
> > +	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> > +		*capable =3D true;
> >
> > -	return capable;
> > +	return 0;
> >  }
> >
> >  /* Is HDCP2.2 capable on Platform and Sink */ -bool
> > intel_hdcp2_capable(struct intel_connector *connector)
> > +int intel_hdcp2_capable(struct intel_connector *connector, bool
> > +*capable)
> >  {
> >  	struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >  	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
> >  	struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -	bool capable =3D false;
> > +
> > +	*capable =3D false;
> >
> >  	/* I915 support for HDCP2.2 */
> >  	if (!hdcp->hdcp2_supported)
> > -		return false;
> > +		return 0;
> >
> >  	/* MEI interface is solid */
> >  	mutex_lock(&dev_priv->display.hdcp.comp_mutex);
> >  	if (!dev_priv->display.hdcp.comp_added ||  !dev_priv-
> > >display.hdcp.master) {
> >  		mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
> > -		return false;
> > +		return 0;
> >  	}
> >  	mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
> >
> >  	/* Sink's capability for HDCP2.2 */
> > -	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
> > -
> > -	return capable;
> > +	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
> >  }
> >
> >  static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv, @@ -
> > 2355,6 +2354,7 @@ int intel_hdcp_enable(struct intel_connector
> > *connector,
> >  	struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >  	struct intel_hdcp *hdcp =3D &connector->hdcp;
> >  	unsigned long check_link_interval =3D
> DRM_HDCP_CHECK_PERIOD_MS;
> > +	bool capable;
> >  	int ret =3D -EINVAL;
> >
> >  	if (!hdcp->shim)
> > @@ -2373,21 +2373,27 @@ int intel_hdcp_enable(struct intel_connector
> > *connector,
> >  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the
> > setup
> >  	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
> >  	 */
> > -	if (intel_hdcp2_capable(connector)) {
> > +	ret =3D intel_hdcp2_capable(connector, &capable);
> > +	if (capable) {
> >  		ret =3D _intel_hdcp2_enable(connector);
> > -		if (!ret)
> > +		if (!ret) {
> >  			check_link_interval =3D
> > DRM_HDCP2_CHECK_PERIOD_MS;
> > +			goto out;
> > +		}

HI,
Just noticed another changed here if any error is returned with intel_hdc2_=
capable
You directly jump to out which will stop us from enabling hdcp 1.4 we shoul=
d check
for hdcp 1.4 capability even if hdcp 2.2 capability is returned with an err=
or one other
reason I don't think the handling of error codes are adding value here.

Regards,
Suraj Kandpal
> >  	}
> >
> >  	/*
> >  	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
> >  	 * be attempted.
> >  	 */
> > -	if (ret && intel_hdcp_capable(connector) &&
> > -	    hdcp->content_type !=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
> > +	ret =3D intel_hdcp_capable(connector, &capable);
> > +	if (ret)
> > +		goto out;
> > +
> > +	if (capable && hdcp->content_type !=3D
> > DRM_MODE_HDCP_CONTENT_TYPE1)
> >  		ret =3D _intel_hdcp_enable(connector);
> > -	}
> >
> > +out:
> >  	if (!ret) {
> >  		schedule_delayed_work(&hdcp->check_work,
> > check_link_interval);
> >  		intel_hdcp_update_value(connector,
> > @@ -2395,7 +2401,6 @@ int intel_hdcp_enable(struct intel_connector
> > *connector,
> >  					true);
> >  	}
> >
> > -out:
> >  	mutex_unlock(&dig_port->hdcp_mutex);
> >  	mutex_unlock(&hdcp->mutex);
> >  	return ret;
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> > b/drivers/gpu/drm/i915/display/intel_hdcp.h
> > index 7c5fd84a7b65..f06f6e5a2b1a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> > @@ -33,8 +33,8 @@ void intel_hdcp_update_pipe(struct
> > intel_atomic_state *state,
> >  			    const struct intel_crtc_state *crtc_state,
> >  			    const struct drm_connector_state *conn_state);
> bool
> > is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port);
> > -bool intel_hdcp_capable(struct intel_connector *connector); -bool
> > intel_hdcp2_capable(struct intel_connector *connector);
> > +int intel_hdcp_capable(struct intel_connector *connector, bool
> > +*capable); int intel_hdcp2_capable(struct intel_connector *connector,
> > +bool *capable);
> >  void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
> > void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
> > void intel_hdcp_cleanup(struct intel_connector *connector);
> > --
> > 2.39.0.246.g2a6d74b583-goog

