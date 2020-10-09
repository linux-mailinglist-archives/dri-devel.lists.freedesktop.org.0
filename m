Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA255289091
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 20:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1556ED77;
	Fri,  9 Oct 2020 18:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8566ED53;
 Fri,  9 Oct 2020 18:08:37 +0000 (UTC)
IronPort-SDR: d7SCUYYsX9c592HHxAyM3xy02scg15GrWkqXukRs25c9MliTjgFbR1A7NmH/ockukibZ5l7tOi
 lI0neB9LQ7Ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165582344"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165582344"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 11:08:36 -0700
IronPort-SDR: fL4+9EY8tvGGIMASA5exM+I73Pb+hhz/OMDqtNEGb26an0j4bS3gMo+ZtzKQALgHwvlS/CqlG+
 burxblrSR2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="312631607"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 09 Oct 2020 11:08:35 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 11:08:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 11:08:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 9 Oct 2020 11:08:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 9 Oct 2020 11:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZV0eMcP7JZx5ILE67t0WDgzb05vZ3l9hUc4cRyXNTxOCQ5WhBgtP8jowHQ+EEfxkkxjyZD68TqXkNuaroprGBLrh685VfvDxQVS1/0CE6SZt4oF3D8H0Puk6wzUKzpvPWWvyoeWx4qO8e7RCT67ZKqiVPxShkOHc55KnusE2SQpf7fmkcvLXLwdI43RC9Z0uMuDCQlLsp0cCP1njqLCGf+81f/dZ7FKEN7xHsW6EO/xuTfsWzP5omM7o5x/7jG2IMg35ZQ8DfaurZ1NePbcY8okAX4ILocV5XXzKl9XcoHXpcxNTFBx9ZnIIeYdYbC2Yn4P3gNlB9rixJ09pYQuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC7sBsYn36pgHtL1D3kfCEE1oH/eeHFJRPiLwpvkwU0=;
 b=QAMWXoPUrKctWCwKZatvaR0rbX5SFOYaC/JlYpZbfYtK9l4wHcuIGpfVwrtIStO3LUDgMlnRpc0fTMhGd4xzMbHmkPoEglhjArCeAuvsuP3xVq4jJGvyFcIFQoAoOPHPeIC/ohyGHbuMJENHDIH5F/CyTWAbC90JaPPDEutF8IZjFwxKN82Mys3wcpslbUC6XP3X197WpVna5Nil9871OyPuJ4Fs+IEW3oScvenPJpsf445vUyRCG+SEyZxdxQiL4TNp5YO5B1Dml8sd2QXZKfTD1bmDXDCGYjnKlG3mVIEdeAGFtPIWQWDiXoOgefsOke1l2pr7LTRNfIuTMF25Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC7sBsYn36pgHtL1D3kfCEE1oH/eeHFJRPiLwpvkwU0=;
 b=h01HRgy/KHiy3xxtvg2qQh7bxzzoAT6l89/JedwLt4VROk9wEHz+TdwikAD9cUnqAaq6zgkVTyRFCGugPbDQU0l/h3N0WngZJ+mYxZDrN7xaaPrWyKjZNrBnqZ7PsD2W30d7gy0KSUkA2Ek9WeGZmALGIh9CJ7Qqis/H+zkqdeA=
Received: from BY5PR11MB4434.namprd11.prod.outlook.com (2603:10b6:a03:1c2::19)
 by BYAPR11MB3045.namprd11.prod.outlook.com (2603:10b6:a03:88::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 9 Oct
 2020 18:08:32 +0000
Received: from BY5PR11MB4434.namprd11.prod.outlook.com
 ([fe80::d420:36b7:bc68:5c3c]) by BY5PR11MB4434.namprd11.prod.outlook.com
 ([fe80::d420:36b7:bc68:5c3c%3]) with mapi id 15.20.3433.046; Fri, 9 Oct 2020
 18:08:32 +0000
From: "Pandey, Hariom" <hariom.pandey@intel.com>
To: "K, SrinivasX" <srinivasx.k@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/Dp6z1PH5QIPE+D2JT4cvgJtamK2W6AgAAAfICAAAIHAIAAAfcAgAQXZwCAAFXLAIAASytg
Date: Fri, 9 Oct 2020 18:08:32 +0000
Message-ID: <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
In-Reply-To: <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [182.70.152.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8cdfb5f-8dbd-4dc6-c749-08d86c7e5567
x-ms-traffictypediagnostic: BYAPR11MB3045:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3045B2734AA8670AB67A8A79F6080@BYAPR11MB3045.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCMe9syB/wv4OWwZNtOPoUhW9iS8YxubXD8mR0jiXPg3YbRUzLmIpSRp3gpwpk/+YxTlhuPH0oR4V2AjGHUzjuKkRt1OTabMFJlBo6rx5s6VcHYY2qWgiE7cRUqIaqJ4fBkKfqXvpvgAQKR48hgG1KdwWGLxUKNQ6jGhAEEgvHoBb5opCgDBnqKNwJPjNvmEiJxWrxa5lJsrNWJeUhaIyXqlQzf/jcbl6TBk3LOMfn14LgysmnebtsOGa+VC6qpd80xxCSsIoUIhd0yPcXF1uZo5EA5Ehp0mjJNtFpTo9GBS8AmSPyeQmyZeQJesThcrFuT0kjMMHl3PysTho6xv3HrWQjAPAVIsjk/LkL3Jp4TuOfKyHtQytYzhVwVKlRNZ3rWHZLMthoSOwtvh9yBIXA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(66476007)(66946007)(55016002)(66446008)(966005)(107886003)(4326008)(8676002)(76116006)(8936002)(86362001)(9686003)(52536014)(33656002)(53546011)(6862004)(7696005)(5660300002)(64756008)(2906002)(66556008)(186003)(6506007)(83080400001)(54906003)(26005)(6636002)(71200400001)(83380400001)(316002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mQTL8M6SX47rCW9w8+XZsKE3aiw8TaANJ24U5CPRshwocXN6fPhk2ETbCDEBIaLnwJYslIxjSuvNidGpf4K79VFrHIguXNM2ErWwrzyx+T/OglbCfU2XpJr5CNDQmGVNVQhGZv1MPoQQLMEGun9OXDRoL7Ep1EbzkZramRYLuQvsFGWQ30JhVeCt4Yh0++Ys4V+KX5a6hoKsXkstG4uKOgx2gB1uTEF5oBv7fG5r13QXHJ18NXSGfxy6UEuYhgAuPin+vg5maXsPna6cMUtLYyvvrtIJXvXfJVy0oo6LHCjlgcHcEooJuUGOOiWr7Y4CxxFw3QaI6BFza/WSjwliBxQGJ6vovhqSjtMJ3z87EkzOIdw87a+0s/d8PcqH3m/RtaVqumiBq3xyoasl+a5iaasrI5COYChiemHCaGsx2d6gsiqZqPjhdvh0qKP5Kampt58pEj9171zLZtOc2Bp2GHV6o5iFsoxbqRR2QvxShhb6vH3cg6sWcHj12BByUzLTCMhPHEB7BQvc0IS8RaScWRABKoCQFMdd+eWB7h2sG/lM4g4fKh4AYfd9/eFyOPJfHBH5JH4DozoK6ga/1FAEzvd7GYPXiSMufMPnOWmPhMOlv9Ke4VUaBjEdx0+tqdmncFXAyQNGE0VPDuOzCzOu0g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cdfb5f-8dbd-4dc6-c749-08d86c7e5567
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 18:08:32.5629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfT5GBYymCNCrFAKUi6oRlQjBTmknTq0WbMRwUWULMFeMYDnzyIrH6RsBARR6QRit2oxmypsgEHYfzvLzg7UPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3045
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
Cc: "Ausmus, James" <james.ausmus@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Srinivas,

Take Sunil's help who has recently validated RC6 on EHL DRM tip and found to be passing. If the WA were sporadically failing and if you confirm that RC6 is passing, this patch can be proceeded with. 

Thanks
Hariom Pandey

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
Sent: Friday, October 9, 2020 7:09 PM
To: K, SrinivasX <srinivasx.k@intel.com>
Cc: Souza, Jose <jose.souza@intel.com>; chris@chris-wilson.co.uk; Ausmus, James <james.ausmus@intel.com>; Nikula, Jani <jani.nikula@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe protection



> On Oct 9, 2020, at 1:31 AM, K, SrinivasX <srinivasx.k@intel.com> wrote:
> 
> Hi Rodrigo,
> 
> How do we get W/A and rc6 changes in, do you have any details?

I told based on what I was seeing on https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html?
focusing on the issues that are exclusively for ehl and not happening on other platforms.

It looks like workarounds are fine there now. so I'm not sure if it was sporadic thing that day.

for the rc6 there are a few testcases failing around it:
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_675/fi-ehl-1/igt@i915_pm_rc6_residency@rc6-fence.html
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_675/fi-ehl-1/igt@i915_pm_rc6_residency@rc6-idle.html
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_675/fi-ehl-1/igt@i915_selftest@live@gt_pm.html#dmesg-warnings415

> 
> Thanks,
> Srinivas
> 
> -----Original Message-----
> From: Souza, Jose <jose.souza@intel.com>
> Sent: 06 October 2020 23:33
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; chris@chris-wilson.co.uk
> Cc: Ausmus, James <james.ausmus@intel.com>; Nikula, Jani 
> <jani.nikula@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>; 
> Roper, Matthew D <matthew.d.roper@intel.com>; 
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; K, 
> SrinivasX <srinivasx.k@intel.com>; Surendrakumar Upadhyay, TejaskumarX 
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove 
> require_force_probe protection
> 
> On Tue, 2020-10-06 at 10:55 -0700, Vivi, Rodrigo wrote:
>> 
>>> On Oct 6, 2020, at 10:48 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>>> 
>>> Quoting Souza, Jose (2020-10-06 18:46:45)
>>>> +Rodrigo and Jani
>>>> 
>>>> On Tue, 2020-10-06 at 14:56 +0000, Kamati Srinivas wrote:
>>>>> Removing force probe protection from EHL platform. Did not observe 
>>>>> warnings, errors, flickering or any visual defects while doing 
>>>>> ordinary tasks like browsing and editing documents in a two 
>>>>> monitor setup.
>>>> 
>>>> One of the requirements was also to have CI BAT all green and 
>>>> shards as green is possible but EHL don't show up in CI results, we actually have one single EHL machine in CI but I guess it is not able to run all tests that shards do:
>>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9097/filelist.html
>>> 
>>> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html
>> 
>> we are really close to that point. We just need to fix some w/a and
>> rc6 issues before applying this change.
>> 
>>> -Chris
>> 
> 
> Huum okay we have drm-tip results for EHL but if someone sends a patch that breaks EHL it will not be caught in pre-merge testing.
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
