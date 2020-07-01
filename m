Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A521156F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 23:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B553F6E0E5;
	Wed,  1 Jul 2020 21:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5444E6E057;
 Wed,  1 Jul 2020 21:53:45 +0000 (UTC)
IronPort-SDR: 3yA6v+m+YTt1u7Vy50X3KwT37izs14qpAyhPH1cSYcIR+jhKOQR/FZcbcofXla2xrUE0NafmSt
 zSZFN6a/4kKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="211780796"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="211780796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 14:53:43 -0700
IronPort-SDR: zQ5wlp63uZ5VvHvAjU0Ni29Roo41qul0pBLJOAMxkiciQpF4Z3Bxg/+1ZIl8zYQEEUTJarOpQO
 Db2M/wXQiKIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="277918016"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by orsmga003.jf.intel.com with ESMTP; 01 Jul 2020 14:53:42 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 14:53:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 1 Jul 2020 14:53:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZVPQF4zjwtvRtpT+vGoooGrytYkZ3O94agVyNbEsrQs88tRtikMcc7VuVc3sZhyMdqYUVk678vbt5O4ZfwFCNzb/1HUdnD7vlMBtSecS9lU8lTKumDuN7SYZEwd+JxjbFWK7KcUD3xyyFIj8SfCmuwLJ9QH+MMKoA2lhzV46ktS2GTeV+bIIkAxrlBWRZMuGAyQ++ACsqgXjXjhiHbRK6TgtP+jDTCGWp6F45lFf/w1ZD06S7vrZyQ3O9buxSSsbCxg3i43Kt4c6PmiDEHE1hyZkbEuU8jcXZYx1dGcWP8ZkkHICHgjniDUdzCW7PGqliouNYPi0NNr9VR2hXq1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZBc9QIqUzXIZ8JeA+aRene530IJiOIeTgqd9d0TZJY=;
 b=dKcvD7gkelhszjiI62sJxUxiySUrqscuQ0u69bQT2ZH4pGh23+3BZEdivTslNXA3AGqYsOKiaPEHl0fcX/v7prgHORJvbr7nszdwvEz1+rHmUIXFmYqfeBJffdkTCVGfP6Q0xbgn7ShqKovInCYHqBdej8n9EqhYeQXxjhCouYjWB5J4GPpDLD8p5qJgBirvDYedsYkUfEeoXoe9SKWVkMBwKoq1b08q5GM7Wp8oS9mFslh/faiAI+IvHVVpujrsbCYpRSv2XLcKHaNy0efTcHQ/RxyL/q5EdfNihYpYUOy7/bKkd3wpsIlH5FgYZDtcgkeKE6zzsC/eO5mfShdi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZBc9QIqUzXIZ8JeA+aRene530IJiOIeTgqd9d0TZJY=;
 b=tEq+XzIWydVMv95JkovEBbnj4uPxQX0JEqCfd1t4J3nMbDcumySwbtgIuRDASUWV4J0IlR/509gdkAmVek20NSVANTauuqcUrGZHwlT5o4b0Gl3usoUM+3o807Zvvnd4n3BZ9G+srzCJHAb+65sU0hzmAC/J9m1PJv8NH3yFCjw=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 21:53:41 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6%7]) with mapi id 15.20.3131.030; Wed, 1 Jul 2020
 21:53:40 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 00/59] Add support for Keem Bay DRM driver
Thread-Topic: [PATCH 00/59] Add support for Keem Bay DRM driver
Thread-Index: AQHWTyV2fTWH1PmlAUGwnJou7HBetqjyTHgAgAD3isA=
Date: Wed, 1 Jul 2020 21:53:40 +0000
Message-ID: <BY5PR11MB41827EDF1C35E2AEA25906B78C6C0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
 <20200701070102.GA1494555@ravnborg.org>
In-Reply-To: <20200701070102.GA1494555@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 621e72fb-817d-4108-1011-08d81e093794
x-ms-traffictypediagnostic: BYAPR11MB2631:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB26314D29797D692E2BF58C7F8C6C0@BYAPR11MB2631.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJ2Wyyx0Acqrt4YWuwjtxOVgQXAYKJSf7Au1g9JO5DAQVVbjhhJh1j/4rAFqc3YoSBG3vVrrR3/DDwNVWEXZFHroRoFeNN/hItAqgGTDjXz+ZYbPIQ6IICYpfGpKK00bGA2ph4f3sT9/6V+YvCmGPh+mM81XP8CCSITgw2YVZ41wBbLdokKuLCRTm/s1+79BV/lJPH13Dev7Qc5jEqS2e4UfmeIV3drSSEojtEa/f2xvGMa1C1n3UiTiFX1SoALljTR6Rb/JkjX3ik5zmt/Df3EScV5WIISUlrBYlJMyVVrM1T09tc/bP5tFrF/XqBbB+Fr7MvjHGg8ARMKhACz3Vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(6506007)(66476007)(76116006)(66946007)(8936002)(66556008)(64756008)(2906002)(478600001)(52536014)(86362001)(8676002)(54906003)(107886003)(5660300002)(7696005)(33656002)(66446008)(9686003)(55016002)(83380400001)(4326008)(53546011)(316002)(186003)(71200400001)(6916009)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jz7ji57YZbrRsql00nYioxYMIno2e4FP7HY22+RveOpivP6i9OHyoQI5cRYmHSNgDrE2tkPK1vClKYoERnqQaROn+ktTuSDUDxkZUTaucUTYhuY+g/81OfOycugfl8n2QvKpVd+YFYQu67+cRGDupziEN8blw/Vi/vlV5qsDeLh31SDP2sVuwDiImN/MBJquv6Q/F+VSsDhZCuah1nNZh3UvPNaQ8Bo1wPVsxL/ir7isIcfAwkHhPndPk/MUWAuqk7u/GoWGq7rO36CK5fc3rKBpjbuIu8XOIzHyXbTczNBkLFEdkzrohmLUD3QscS1VOilMt0pTtffVXQW5Ds8Ef9XqLD1PcGnghojnH1fWH2nBBxpupdnkTU1l8S3+qo/GdAp/qOveF3/Og06ej6wBvLrzFSUi8ZLCFg2ZedcqiNFLiwo89uQy9Vrozmx3583Ctz8Tln2GAuLm48OYtTUvRI2Sqs6l5lEqthyiF9PF0EQVgfRePfh3eX/tLxTuFvX3
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621e72fb-817d-4108-1011-08d81e093794
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 21:53:40.7605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mu+JRGMHohnCOx5Ja+fM/7AioLaDvTmDYBLpIEcExC9CwzTJsxDuM9S86YKj2MOyhGQeYm8Tb646D0E+/lnwfHynckVWFGokmr7JRt1Hv/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks much Sam for reviewing the code so quickly. I'll address your reviews in v2.

Anitha

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 1, 2020 12:01 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J <bob.j.paauwe@intel.com>;
> Dea, Edmund J <edmund.j.dea@intel.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; intel-gfx@lists.freedesktop.org; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH 00/59] Add support for Keem Bay DRM driver
> 
> Hi Anitha.
> 
> On Tue, Jun 30, 2020 at 02:27:12PM -0700, Anitha Chrisanthus wrote:
> > This is a new DRM driver for Intel's KeemBay SOC.
> > The SoC couples an ARM Cortex A53 CPU with an Intel
> > Movidius VPU.
> ...
> Nice and informative intro - thanks.
> 
> The patchset looks more like a dump of current state and less like a
> logical set of changes - as the few I looked at changed code introduced
> in earlier patches.
> So I ended up applying all patches to a local branch.
> Very good to post an WIP version so you can capture some early
> feedback.
> It is never fun to think something is finished and then address a lot of
> feedback.
> 
> 
> Some general remarks after reading/browsing some of the code:
> - Embeds drm_device - good
> - Uses SPDX, good. But includes also a license text. Can we
>   get rid of the redundandt license text?
> - Some of the inline functions in kmb_drv.h is too large
>   (kmb_write_bits_mipi())
> - There is stray code commented out using "//" here and there - shall be
>   dropped.
> - Please arrange include files in blocks:
> #include <linux/...>
> 
> #include <video/...>
> 
> #include <drm/...>
> 
> #include "kmb_*"
> 
> Within each block sort alphabetially.
> 
> - Use a kmb_ prefix or similar for global variables - like under_flow
> - no extern in .c files - plane_status
> - Consider using an array for the clk's
> - In general use drm_info(), drm_err() for logging.
>   Yes, you will need to pass kmb_drm_private around to do so
> - Do not use drm_device->dev_private, it is deprecated. Use upclassing
> - kmb_driver can be slimmed a lot. See what recent drivers uses. There is
>   some nice defines so it is obvious what is not standard.
>   DRIVER_HAVE_IRQ is not relevant btw.
> - Start using drmm_* support. The way kmb_drm_private is allocated
>   is sub-optimal
> 
> The above was my fist drive-by comments - but do not be discouraged.
> For the most part they should be easy to address.
> Looking forward for other feedback and for v2.
> 
> Let me know if the above triggers any questions.
> 
> > +--------------+    +---------+    +-----------------------+
> > |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> > +--------------+    +---------+    +-----------------------+
> 
> Question to dri-devel people:
> Would the Mipi DSI be better represented outside the display driver?
> If yes, how?
> 
> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
