Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7CC27B338
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 19:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7B6E150;
	Mon, 28 Sep 2020 17:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFDC6E13C;
 Mon, 28 Sep 2020 17:31:04 +0000 (UTC)
IronPort-SDR: R431iC9zV307n7OsBGZP2inBtZ+kU2YenxMGE9cXPD5dxgbt74cdOHuNny//7In21zPBF4CPCU
 0A4eQs68pJPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149806510"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
 d="scan'208,217";a="149806510"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:31:01 -0700
IronPort-SDR: gRuDnqIlVPBAwA29h1Mj5UlU0h8AcLbXzHq46DcywakA3D0J/WkZ7P/2hwTjkGqHaon/S6IkDp
 qoypHWYdhNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
 d="scan'208,217";a="456920752"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 28 Sep 2020 10:31:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 10:31:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 28 Sep 2020 10:31:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 28 Sep 2020 10:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9M+R9gzSe4+uuwA0YJS1LFYrNfz5lfZfOJ1OVh1Ker63ZILeG/wv0DNGwx7v88usxjMtZORYpWQym606Er/6GLGdkqVK8cfhgD6azOLtybuLwICGlsta0BkzaAINBcaarRboExbRcMMu1nc8gCn5d6TNgqDYJ/2k+GulmkYLctisLNvS1G9fuZAiVdUIqh45hXoBQ5nypH64s5XcBJYq5Nh6C9T87tW1iT8s4DydqO3cJG3mEEtUXzVDPTXPtitt97/j8tWWURLgP+6hyVyUxIBkaDl4QsS4rdgj4Lwk+YHBMInMd6xiYM6XTLQZSnV0nQdGRGvKk3dFF2kF1C4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kum+j4ud8NYfw1c6d88oZea8uA56yiYJgVd6uebJmpo=;
 b=VGLfQLqxbiqi74d3at9EDUyAWgN4NHK06Y/y20AbHnt1iu3iLFCRZFOuhGq8sbKanvBBn+KhwWUTkf9PkicsPNSMscGkVEp9dIvrbuVMzpB2ZvthO1feL2vj0G1yyJn3IVwy0Wi99YMBoVlp957mbbJeNkhKbpMQBtEIRPgVqM68nb1jAYXZRLmU49Iy0c/FGPJmn0eYV0NEidvoALDhxw8Xa8IPLmyTOX+jzx/YaxRirKjTJo2gjZEIOee6OsiytMoF0L4+3QeczL6yEwpw/ntkuYLSefrvgJv4tLiQxKjqfBajbrtKYBgGZ9zFSv7iK7Xagbg/CeMUIwDzaUblKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kum+j4ud8NYfw1c6d88oZea8uA56yiYJgVd6uebJmpo=;
 b=D3/6Om+53s9oQV2Hyc/b3FI8JM3TdkFI3W7w4iU52/BM3Mp4EdpAOSLsq6djrL0ZMMK4DpHuCd979vahkNdcEUp4sNzDCk7iyjyW7k5Nx1szo6zApy2IZDzejRviFGQNiSPYZoCmNYNS9UJkPO0oUDzB75Er8zFeWiw99NywsLQ=
Received: from SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 17:30:48 +0000
Received: from SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::85cc:7d43:b53d:33ff]) by SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::85cc:7d43:b53d:33ff%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 17:30:48 +0000
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
Thread-Topic: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
Thread-Index: AQHWlW/hWatVdsGmgEqBxYS63h22F6l+DhuAgAAv1YaAAAy2AIAAAwCAgAAAt98=
Date: Mon, 28 Sep 2020 17:30:48 +0000
Message-ID: <SN6PR11MB3421E921F3D5EF7783857982DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87d026owdq.fsf@intel.com>
 <SN6PR11MB3421571FA9A490C67E0E9D82DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
 <874knhq0x1.fsf@intel.com>,
 <20200928172447.GA2157395@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20200928172447.GA2157395@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [103.240.170.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ca66f55-4df1-418e-7773-08d863d43d10
x-ms-traffictypediagnostic: SA0PR11MB4751:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4751B72AA72D46C3B83BE0E7DF350@SA0PR11MB4751.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5a3gFxhZIxuHzvTLq2JHSVBN0x9GRvB9Q/5jw9lFiyqdPi7jG/VHZhXLzj/zG+ebIspsU55T7IVb09q+x6SDlkgrSX4fr2sYsPlY7/bjKF+7ttW7S3TETJi8bWfaB1KfdevS7Gv1Qh4DKcnP3RtJFkl6EGGOeklySeum7H31tqhYFy6QTBPrJzzf/OOHmStCpGzY9emO4OJi1dqsxw5ZDpOTYtVqxV6Rpno/rjEs67WBlW01VWFwxbUSu17BXyiYWkP48Gq9DigHiAlZnsNl5aNOFzIhBdqnlirq/VA6Mcr6dYse3Qkz97htNVzRLnPzVrsl5Mw/NStgxo6WZbVOkkBOKuf4qWRzxyEfU5EvUGBjJ8LxbRonFf5FSHiwCp8W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3421.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(316002)(54906003)(110136005)(8936002)(26005)(55016002)(186003)(6506007)(53546011)(9686003)(7696005)(4326008)(8676002)(478600001)(91956017)(2906002)(19627405001)(83380400001)(76116006)(86362001)(52536014)(64756008)(66446008)(5660300002)(71200400001)(33656002)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JrnlZXaxlW+DgELBQmpIMlhj50X8na30JYCHlVpvoHdzPV5nRD0ZEOAGBYc18bwml9QHLEAF3xqvhkzlrNj66lcfjj+18TUG5VOmVocKjAAuEPGqJR6cO/cvqKySW3s04qjVyfD4cPzzwJcQ1TB9+zhUI2ph4ceDi9HT72IlsE05N1jS189gVPoowiFaley8mdhAXVHlf/hsb1wsFxhjfEwxfnUgmE1ii/EzWLGoYfwwg5DW8zZJyUyi44b250XkKn38lumdZTIpzL+57+tpuxJYv3tLzj0bhcp+FC60tEzM85TrDLxaiRs0sQ1cMdlI2NvW/okYQ1VOoXEzS8togr1w3kYL6m/7POaHM6lNmVeh9ad8JHThPs3kv7NtQyIHUj8DJBi9mr8dkra96CTDMLxqGR9mvWQ2pA8N3TbVPadSgx/vY8HRoIaid3spUDiBGuHRNnoxB/vWwS0IUQdnnL/vzk9baveHRLfqVjiQK0lvOfUCHZqh0QSDksHXt61r3JQlFIJex2zxyBvEIR7A07Kc1e03ehSxv+Q2ejxp+NGVcqZP9jS8flhZSOYrKk6ShBE96RjF+z/fH1STC4UUYrjon0lVYpQSvbZ7lKlwbkqXBw09/grGOdvh/uAPmt+4594o8ZEtU4F03rEGFEb5LA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca66f55-4df1-418e-7773-08d863d43d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 17:30:48.0251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcmurQy/b/9X4GA63LsGqzZl3y1CV12FXZiEJadM3JsOMbYVuVJvxcwLIN0pcQcI2J8ZEbkCZ/LspBiCmmjE7xENwPEI7napbdihmqDx/ft7kxZw9caa6u6bsQPWmBr0lffc420xZhrdTvyPSGdGvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1528133015=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1528133015==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB3421E921F3D5EF7783857982DF350SN6PR11MB3421namp_"

--_000_SN6PR11MB3421E921F3D5EF7783857982DF350SN6PR11MB3421namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Matt Roper <matthew.d.roper@intel.com>
Sent: Monday, September 28, 2020 10:54 PM
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay=
@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@linux.ie <airl=
ied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; intel-gfx@lists.freedeskt=
op.org <intel-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <=
dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kerne=
l@vger.kernel.org>; Ausmus, James <james.ausmus@intel.com>; Souza, Jose <jo=
se.souza@intel.com>; ville.syrjala@linux.intel.com <ville.syrjala@linux.int=
el.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Pandey, Hariom <hario=
m.pandey@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI =
ids

On Mon, Sep 28, 2020 at 08:14:02PM +0300, Jani Nikula wrote:
> On Mon, 28 Sep 2020, "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.s=
urendrakumar.upadhyay@intel.com> wrote:
> > ________________________________
> > From: Jani Nikula <jani.nikula@linux.intel.com>
> > Sent: Monday, September 28, 2020 7:07 PM
> > To: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upad=
hyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@linux.ie <=
airlied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; intel-gfx@lists.freed=
esktop.org <intel-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.o=
rg <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-k=
ernel@vger.kernel.org>; Ausmus, James <james.ausmus@intel.com>; Roper, Matt=
hew D <matthew.d.roper@intel.com>; Souza, Jose <jose.souza@intel.com>; vill=
e.syrjala@linux.intel.com <ville.syrjala@linux.intel.com>; De Marchi, Lucas=
 <lucas.demarchi@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>
> > Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and =
PCI ids
>
> Please fix your email quoting when interacting on the public lists.
>
> >
> > On Mon, 28 Sep 2020, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay=
@intel.com> wrote:
> >> Split the basic platform definition, macros, and PCI IDs to
> >> differentiate between EHL and JSL platforms.
> >>
> >> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@inte=
l.com>
> >> ---
> >>  drivers/gpu/drm/i915/i915_drv.h          | 4 +++-
> >>  drivers/gpu/drm/i915/i915_pci.c          | 9 +++++++++
> >>  drivers/gpu/drm/i915/intel_device_info.c | 1 +
> >>  drivers/gpu/drm/i915/intel_device_info.h | 1 +
> >>  include/drm/i915_pciids.h                | 9 ++++++---
> >>  5 files changed, 20 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h
> >> index 72a9449b674e..4f20acebb038 100644
> >> --- a/drivers/gpu/drm/i915/i915_drv.h
> >> +++ b/drivers/gpu/drm/i915/i915_drv.h
> >> @@ -1417,7 +1417,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i9=
15,
> >>  #define IS_COMETLAKE(dev_priv)       IS_PLATFORM(dev_priv, INTEL_COME=
TLAKE)
> >>  #define IS_CANNONLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_CANN=
ONLAKE)
> >>  #define IS_ICELAKE(dev_priv) IS_PLATFORM(dev_priv, INTEL_ICELAKE)
> >> -#define IS_ELKHARTLAKE(dev_priv)     IS_PLATFORM(dev_priv, INTEL_ELKH=
ARTLAKE)
> >> +#define IS_ELKHARTLAKE(dev_priv) (IS_PLATFORM(dev_priv, INTEL_ELKHART=
LAKE) || \
> >> +                             IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
> >> +#define IS_JASPERLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_JASP=
ERLAKE)
> >
> > I think we've learned from history that we want the platform checks to
> > be independent. I.e. if you need to split ELK and JSP, you need to make
> > IS_ELKHARTLAKE() match *only* ELK, and you need to replace every curren=
t
> > IS_ELKHARTLAKE() check with IS_ELKHARTLAKE() || IS_JASPERLAKE().
> >
> > We've been here before, and we've thought before that we can get by wit=
h
> > the minimal change. It's just postponing the inevitable and generates
> > confusion.
> >
> > BR,
> > Jani.
> >
> > Tejas : Replacing IS_ELKHARTLAKE() || IS_JASPERLAKE() everywhere will
> > make lot of changes at each place. To avoid huge change and to
> > differentiate between platforms we have taken this way. Do you think
> > we still change it everywhere? Do you have example where it can harm
> > this change?
>
> If you need to differentiate between the two platforms, IS_ELKHARTLAKE()
> must mean only ELK and IS_JASPERLAKE() must mean only JSP.
>
> It's non-negotiable. We've made the mistake before, we're not doing it
> again.
>
> There are 32 references to IS_ELKHARTLAKE(). It's slightly painful, but
> the alternative is worse.

Why are we adding IS_JASPERLAKE at all?  EHL/JSL are documented as the
same graphics IP, but are paired with different PCHs in the final SoCs,
which is what causes the minor differences in programming.  My
understanding is that the voltage programming differences are ultimately
due to that difference in PCH so we should just use HAS_PCH_MCC (EHL)
and HAS_PCH_JSP (JSL) to distinguish which type of programming is needed
rather than using a platform test.


Matt

Thanks for pointing out this Matt. I can change accordingly and send V2.

Tejas
>
>
> BR,
> Jani.
>
>
> >
> >>  #define IS_TIGERLAKE(dev_priv)       IS_PLATFORM(dev_priv, INTEL_TIGE=
RLAKE)
> >>  #define IS_ROCKETLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_ROCK=
ETLAKE)
> >>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
> >> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i9=
15_pci.c
> >> index 366ddfc8df6b..8690b69fcf33 100644
> >> --- a/drivers/gpu/drm/i915/i915_pci.c
> >> +++ b/drivers/gpu/drm/i915/i915_pci.c
> >> @@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info =
=3D {
> >>        .ppgtt_size =3D 36,
> >>  };
> >>
> >> +static const struct intel_device_info jsl_info =3D {
> >> +     GEN11_FEATURES,
> >> +     PLATFORM(INTEL_JASPERLAKE),
> >> +     .require_force_probe =3D 1,
> >> +     .platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BI=
T(VECS0),
> >> +     .ppgtt_size =3D 36,
> >> +};
> >> +
> >>  #define GEN12_FEATURES \
> >>        GEN11_FEATURES, \
> >>        GEN(12), \
> >> @@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] =3D =
{
> >>        INTEL_CNL_IDS(&cnl_info),
> >>        INTEL_ICL_11_IDS(&icl_info),
> >>        INTEL_EHL_IDS(&ehl_info),
> >> +     INTEL_JSL_IDS(&jsl_info),
> >>        INTEL_TGL_12_IDS(&tgl_info),
> >>        INTEL_RKL_IDS(&rkl_info),
> >>        {0, 0, 0}
> >> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/dr=
m/i915/intel_device_info.c
> >> index adc836f15fde..e67cec8fa2aa 100644
> >> --- a/drivers/gpu/drm/i915/intel_device_info.c
> >> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> >> @@ -62,6 +62,7 @@ static const char * const platform_names[] =3D {
> >>        PLATFORM_NAME(CANNONLAKE),
> >>        PLATFORM_NAME(ICELAKE),
> >>        PLATFORM_NAME(ELKHARTLAKE),
> >> +     PLATFORM_NAME(JASPERLAKE),
> >>        PLATFORM_NAME(TIGERLAKE),
> >>        PLATFORM_NAME(ROCKETLAKE),
> >>        PLATFORM_NAME(DG1),
> >> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/dr=
m/i915/intel_device_info.h
> >> index 6a3d607218aa..d92fa041c700 100644
> >> --- a/drivers/gpu/drm/i915/intel_device_info.h
> >> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> >> @@ -79,6 +79,7 @@ enum intel_platform {
> >>        /* gen11 */
> >>        INTEL_ICELAKE,
> >>        INTEL_ELKHARTLAKE,
> >> +     INTEL_JASPERLAKE,
> >>        /* gen12 */
> >>        INTEL_TIGERLAKE,
> >>        INTEL_ROCKETLAKE,
> >> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> >> index 7eeecb07c9a1..1b5e09cfa11e 100644
> >> --- a/include/drm/i915_pciids.h
> >> +++ b/include/drm/i915_pciids.h
> >> @@ -579,15 +579,18 @@
> >>        INTEL_VGA_DEVICE(0x8A51, info), \
> >>        INTEL_VGA_DEVICE(0x8A5D, info)
> >>
> >> -/* EHL/JSL */
> >> +/* EHL */
> >>  #define INTEL_EHL_IDS(info) \
> >>        INTEL_VGA_DEVICE(0x4500, info), \
> >>        INTEL_VGA_DEVICE(0x4571, info), \
> >>        INTEL_VGA_DEVICE(0x4551, info), \
> >>        INTEL_VGA_DEVICE(0x4541, info), \
> >> -     INTEL_VGA_DEVICE(0x4E71, info), \
> >>        INTEL_VGA_DEVICE(0x4557, info), \
> >> -     INTEL_VGA_DEVICE(0x4555, info), \
> >> +     INTEL_VGA_DEVICE(0x4555, info)
> >> +
> >> +/* JSL */
> >> +#define INTEL_JSL_IDS(info) \
> >> +     INTEL_VGA_DEVICE(0x4E71, info), \
> >>        INTEL_VGA_DEVICE(0x4E61, info), \
> >>        INTEL_VGA_DEVICE(0x4E57, info), \
> >>        INTEL_VGA_DEVICE(0x4E55, info), \
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
>
> --
> Jani Nikula, Intel Open Source Graphics Center

--
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795

--_000_SN6PR11MB3421E921F3D5EF7783857982DF350SN6PR11MB3421namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Matt Roper &lt;matthe=
w.d.roper@intel.com&gt;<br>
<b>Sent:</b> Monday, September 28, 2020 10:54 PM<br>
<b>To:</b> Jani Nikula &lt;jani.nikula@linux.intel.com&gt;<br>
<b>Cc:</b> Surendrakumar Upadhyay, TejaskumarX &lt;tejaskumarx.surendrakuma=
r.upadhyay@intel.com&gt;; Vivi, Rodrigo &lt;rodrigo.vivi@intel.com&gt;; air=
lied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch=
&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.org&g=
t;;
 dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; l=
inux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Ausmus, J=
ames &lt;james.ausmus@intel.com&gt;; Souza, Jose &lt;jose.souza@intel.com&g=
t;; ville.syrjala@linux.intel.com &lt;ville.syrjala@linux.intel.com&gt;;
 De Marchi, Lucas &lt;lucas.demarchi@intel.com&gt;; Pandey, Hariom &lt;hari=
om.pandey@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info a=
nd PCI ids</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, Sep 28, 2020 at 08:14:02PM +0300, Jani Nik=
ula wrote:<br>
&gt; On Mon, 28 Sep 2020, &quot;Surendrakumar Upadhyay, TejaskumarX&quot; &=
lt;tejaskumarx.surendrakumar.upadhyay@intel.com&gt; wrote:<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Jani Nikula &lt;jani.nikula@linux.intel.com&gt;<br>
&gt; &gt; Sent: Monday, September 28, 2020 7:07 PM<br>
&gt; &gt; To: Surendrakumar Upadhyay, TejaskumarX &lt;tejaskumarx.surendrak=
umar.upadhyay@intel.com&gt;; Vivi, Rodrigo &lt;rodrigo.vivi@intel.com&gt;; =
airlied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll=
.ch&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.or=
g&gt;;
 dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; l=
inux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Ausmus, J=
ames &lt;james.ausmus@intel.com&gt;; Roper, Matthew D &lt;matthew.d.roper@i=
ntel.com&gt;; Souza, Jose &lt;jose.souza@intel.com&gt;; ville.syrjala@linux=
.intel.com
 &lt;ville.syrjala@linux.intel.com&gt;; De Marchi, Lucas &lt;lucas.demarchi=
@intel.com&gt;; Pandey, Hariom &lt;hariom.pandey@intel.com&gt;<br>
&gt; &gt; Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform inf=
o and PCI ids<br>
&gt; <br>
&gt; Please fix your email quoting when interacting on the public lists.<br=
>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; On Mon, 28 Sep 2020, Tejas Upadhyay &lt;tejaskumarx.surendrakumar=
.upadhyay@intel.com&gt; wrote:<br>
&gt; &gt;&gt; Split the basic platform definition, macros, and PCI IDs to<b=
r>
&gt; &gt;&gt; differentiate between EHL and JSL platforms.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Tejas Upadhyay &lt;tejaskumarx.surendrakumar.u=
padhyay@intel.com&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;&nbsp; drivers/gpu/drm/i915/i915_drv.h&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 +++-<br>
&gt; &gt;&gt;&nbsp; drivers/gpu/drm/i915/i915_pci.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9 +++++++++<br>
&gt; &gt;&gt;&nbsp; drivers/gpu/drm/i915/intel_device_info.c | 1 +<br>
&gt; &gt;&gt;&nbsp; drivers/gpu/drm/i915/intel_device_info.h | 1 +<br>
&gt; &gt;&gt;&nbsp; include/drm/i915_pciids.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9 ++++++---<=
br>
&gt; &gt;&gt;&nbsp; 5 files changed, 20 insertions(+), 4 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/dr=
m/i915/i915_drv.h<br>
&gt; &gt;&gt; index 72a9449b674e..4f20acebb038 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; &gt;&gt; @@ -1417,7 +1417,9 @@ IS_SUBPLATFORM(const struct drm_i915_pr=
ivate *i915,<br>
&gt; &gt;&gt;&nbsp; #define IS_COMETLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; IS_PLATFORM(dev_priv, INTEL_COMETLAKE)<br>
&gt; &gt;&gt;&nbsp; #define IS_CANNONLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; IS_PLATFORM(dev_priv, INTEL_CANNONLAKE)<br>
&gt; &gt;&gt;&nbsp; #define IS_ICELAKE(dev_priv) IS_PLATFORM(dev_priv, INTE=
L_ICELAKE)<br>
&gt; &gt;&gt; -#define IS_ELKHARTLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp; IS_=
PLATFORM(dev_priv, INTEL_ELKHARTLAKE)<br>
&gt; &gt;&gt; +#define IS_ELKHARTLAKE(dev_priv) (IS_PLATFORM(dev_priv, INTE=
L_ELKHARTLAKE) || \<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))<=
br>
&gt; &gt;&gt; +#define IS_JASPERLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; IS_PLATFORM(dev_priv, INTEL_JASPERLAKE)<br>
&gt; &gt;<br>
&gt; &gt; I think we've learned from history that we want the platform chec=
ks to<br>
&gt; &gt; be independent. I.e. if you need to split ELK and JSP, you need t=
o make<br>
&gt; &gt; IS_ELKHARTLAKE() match *only* ELK, and you need to replace every =
current<br>
&gt; &gt; IS_ELKHARTLAKE() check with IS_ELKHARTLAKE() || IS_JASPERLAKE().<=
br>
&gt; &gt;<br>
&gt; &gt; We've been here before, and we've thought before that we can get =
by with<br>
&gt; &gt; the minimal change. It's just postponing the inevitable and gener=
ates<br>
&gt; &gt; confusion.<br>
&gt; &gt;<br>
&gt; &gt; BR,<br>
&gt; &gt; Jani.<br>
&gt; &gt;<br>
&gt; &gt; Tejas : Replacing IS_ELKHARTLAKE() || IS_JASPERLAKE() everywhere =
will<br>
&gt; &gt; make lot of changes at each place. To avoid huge change and to<br=
>
&gt; &gt; differentiate between platforms we have taken this way. Do you th=
ink<br>
&gt; &gt; we still change it everywhere? Do you have example where it can h=
arm<br>
&gt; &gt; this change?<br>
&gt; <br>
&gt; If you need to differentiate between the two platforms, IS_ELKHARTLAKE=
()<br>
&gt; must mean only ELK and IS_JASPERLAKE() must mean only JSP.<br>
&gt; <br>
&gt; It's non-negotiable. We've made the mistake before, we're not doing it=
<br>
&gt; again.<br>
&gt; <br>
&gt; There are 32 references to IS_ELKHARTLAKE(). It's slightly painful, bu=
t<br>
&gt; the alternative is worse.<br>
<br>
Why are we adding IS_JASPERLAKE at all?&nbsp; EHL/JSL are documented as the=
<br>
same graphics IP, but are paired with different PCHs in the final SoCs,<br>
which is what causes the minor differences in programming.&nbsp; My<br>
understanding is that the voltage programming differences are ultimately<br=
>
due to that difference in PCH so we should just use HAS_PCH_MCC (EHL)<br>
and HAS_PCH_JSP (JSL) to distinguish which type of programming is needed<br=
>
rather than using a platform test.<br>
<br>
<br>
Matt</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Thanks for pointing out this Matt. I can change ac=
cordingly and send V2.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Tejas<br>
&gt; <br>
&gt; <br>
&gt; BR,<br>
&gt; Jani.<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;&gt;&nbsp; #define IS_TIGERLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; IS_PLATFORM(dev_priv, INTEL_TIGERLAKE)<br>
&gt; &gt;&gt;&nbsp; #define IS_ROCKETLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; IS_PLATFORM(dev_priv, INTEL_ROCKETLAKE)<br>
&gt; &gt;&gt;&nbsp; #define IS_DG1(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; IS_PLATFORM(dev_priv, INTEL_DG1)<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/dr=
m/i915/i915_pci.c<br>
&gt; &gt;&gt; index 366ddfc8df6b..8690b69fcf33 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/i915/i915_pci.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/i915/i915_pci.c<br>
&gt; &gt;&gt; @@ -846,6 +846,14 @@ static const struct intel_device_info eh=
l_info =3D {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ppgtt_size =3D 36,=
<br>
&gt; &gt;&gt;&nbsp; };<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +static const struct intel_device_info jsl_info =3D {<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; GEN11_FEATURES,<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM(INTEL_JASPERLAKE),<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .require_force_probe =3D 1,<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .platform_engine_mask =3D BIT(RCS0)=
 | BIT(BCS0) | BIT(VCS0) | BIT(VECS0),<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .ppgtt_size =3D 36,<br>
&gt; &gt;&gt; +};<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;&nbsp; #define GEN12_FEATURES \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GEN11_FEATURES, \<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GEN(12), \<br>
&gt; &gt;&gt; @@ -985,6 +993,7 @@ static const struct pci_device_id pciidli=
st[] =3D {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_CNL_IDS(&amp;=
cnl_info),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ICL_11_IDS(&a=
mp;icl_info),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_EHL_IDS(&amp;=
ehl_info),<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_JSL_IDS(&amp;jsl_info),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_TGL_12_IDS(&a=
mp;tgl_info),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_RKL_IDS(&amp;=
rkl_info),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {0, 0, 0}<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drive=
rs/gpu/drm/i915/intel_device_info.c<br>
&gt; &gt;&gt; index adc836f15fde..e67cec8fa2aa 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/i915/intel_device_info.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/i915/intel_device_info.c<br>
&gt; &gt;&gt; @@ -62,6 +62,7 @@ static const char * const platform_names[] =
=3D {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(CANNO=
NLAKE),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(ICELA=
KE),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(ELKHA=
RTLAKE),<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(JASPERLAKE),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(TIGER=
LAKE),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(ROCKE=
TLAKE),<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(DG1),=
<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drive=
rs/gpu/drm/i915/intel_device_info.h<br>
&gt; &gt;&gt; index 6a3d607218aa..d92fa041c700 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/i915/intel_device_info.h<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/i915/intel_device_info.h<br>
&gt; &gt;&gt; @@ -79,6 +79,7 @@ enum intel_platform {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gen11 */<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ICELAKE,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ELKHARTLAKE,<=
br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_JASPERLAKE,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gen12 */<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_TIGERLAKE,<br=
>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ROCKETLAKE,<b=
r>
&gt; &gt;&gt; diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pci=
ids.h<br>
&gt; &gt;&gt; index 7eeecb07c9a1..1b5e09cfa11e 100644<br>
&gt; &gt;&gt; --- a/include/drm/i915_pciids.h<br>
&gt; &gt;&gt; +++ b/include/drm/i915_pciids.h<br>
&gt; &gt;&gt; @@ -579,15 +579,18 @@<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
8A51, info), \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
8A5D, info)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -/* EHL/JSL */<br>
&gt; &gt;&gt; +/* EHL */<br>
&gt; &gt;&gt;&nbsp; #define INTEL_EHL_IDS(info) \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4500, info), \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4571, info), \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4551, info), \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4541, info), \<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E71, info), \<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4557, info), \<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4555, info), \<b=
r>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4555, info)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/* JSL */<br>
&gt; &gt;&gt; +#define INTEL_JSL_IDS(info) \<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E71, info), \<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4E61, info), \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4E57, info), \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x=
4E55, info), \<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Jani Nikula, Intel Open Source Graphics Center<br>
&gt; <br>
&gt; -- <br>
&gt; Jani Nikula, Intel Open Source Graphics Center<br>
<br>
-- <br>
Matt Roper<br>
Graphics Software Engineer<br>
VTT-OSGC Platform Enablement<br>
Intel Corporation<br>
(916) 356-2795<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SN6PR11MB3421E921F3D5EF7783857982DF350SN6PR11MB3421namp_--

--===============1528133015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1528133015==--
