Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F054A28EEAD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 10:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4CB89BFF;
	Thu, 15 Oct 2020 08:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5479789BFF;
 Thu, 15 Oct 2020 08:41:41 +0000 (UTC)
IronPort-SDR: mAsKvaqyJBPPymmdMIvC5TcvfqIfkxhU0GZYIDjLkLRYzasBhPHziMPXLyN87YnoJg98gqtDZ6
 a1ZEEtaRibHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="250986038"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="250986038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 01:41:40 -0700
IronPort-SDR: xyvpgtN2+AvJjhV10oBKJVgxBlnq0xvXytRhvlM+PZAuVGzvn8VchfbyVcujxNQFI34he1QJ7N
 FYYDSbX6wOpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="318952460"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 15 Oct 2020 01:41:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 15 Oct 2020 01:41:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 15 Oct 2020 01:41:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.52) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 15 Oct 2020 01:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUKRDUdF1uNvemSDTACPhiIamNct0AsXxxK3GW3mgxC19sWg4nrBEDmow0Y+eTft8RvU7EnZEGz8TVqBEfOQI584NwTom7fZPTaO/PZdMvmO7Kq0h65zKpE0DL30yDwnhea/TWVtHz5oubZ1S2QSf2Gqvs27H1wxbNdC3kDUVS163h0LcqDXwEcs4yhFhGl7jAjchyoKTIxmCXQ0+RK5wStg4VAZCnPdIELBr2rfVDvOB+eMFhMRl2Cgw0EOFzqnVIRkdYF9ryZlp1oa/owi0lx0/RH/ANurvVd9NiT9eMzPl1LWrLu+E3CObGe9yo0KmagWKg8A6GXy+LTjPeVSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpWEc+u3WpbJiP6T1vc+3TEf1UhRlqjBf7xistUh6p8=;
 b=EVtuF8MogRm+UeapcxUEPdzCkjPuOeHnLTWbsz0fjXxFv06mAA7TOhfqYSRcNNwrIUf+zY6pmhrALyeoyW9ZidcSF6t3jdB87MEfEKfK3RZYBc/S9FOaFIhMxfjCH00yw5AUhNogc59OoR/L2pUdSO/9iKmnzpKX0CSlv/56Y+4luhhgB/mQhWOg0feCOs/6k/XWZ/Z+l4/n2SAY/y4IvnlGdunmj8dEL+PUYKXstR8XgJLZDWVkFE7zWtAxuNxZxIbCM0EpkvKlVMJqBqaerT/WswNCl8aOEmyLqIgpBsBNTD8XLt5NcD4inUlFI5HZ23mgC4aBVS58bXZm1dJVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpWEc+u3WpbJiP6T1vc+3TEf1UhRlqjBf7xistUh6p8=;
 b=VqY+tWDeaYrKAxgFMEUngGYVrvAKGXZ9a3vBf10B4zyzMaQC1XzOjJyq+O8+4D3jJNo7QuGNF119ixklSpyHPSpPD+Di3W7wDCKQtZN53DChotbjIjxegtkUOqcntIv4eV56gBNil0+eHVpu3uST+vk2YQwYhFzP6BnmnBtWJNE=
Received: from BYAPR11MB3014.namprd11.prod.outlook.com (2603:10b6:a03:91::17)
 by BYAPR11MB3365.namprd11.prod.outlook.com (2603:10b6:a03:7e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Thu, 15 Oct
 2020 08:41:32 +0000
Received: from BYAPR11MB3014.namprd11.prod.outlook.com
 ([fe80::64d4:f49d:bb3a:689d]) by BYAPR11MB3014.namprd11.prod.outlook.com
 ([fe80::64d4:f49d:bb3a:689d%6]) with mapi id 15.20.3455.030; Thu, 15 Oct 2020
 08:41:32 +0000
From: "K, SrinivasX" <srinivasx.k@intel.com>
To: "Pandey, Hariom" <hariom.pandey@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/En69MkClzmQ0ObvZWAiNjahamK2W6AgAAAfICAAAIGAIAAAfcAgAQV2sCAAFdYAIAAS2kAgAjJ5xA=
Date: Thu, 15 Oct 2020 08:41:32 +0000
Message-ID: <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
 <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [49.205.250.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd4f4491-bb63-41ed-1af8-08d870e61e78
x-ms-traffictypediagnostic: BYAPR11MB3365:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3365EEEDD4981C385B9E26EDF9020@BYAPR11MB3365.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kSrOvzrJLux6zywWytulE6q7ip9VXvHM5zhJtP4wRbx21u2ITdyrzNyP4Gltt4KeRhAFVSlL4gmL5t6rvte+S6yngIh5mJbFWbMfrNRF2kUSl/hS15VyccGx4URjiIA7AAZHSeGtUnQEsE1jmnw1cUnguU1QH+PLe6xA2u6U9JftDq6YomO3wpjH/PwP9boHd9wye/b6cmb06Q4Zkw8oE9uoh0ni3ccImm1eD8975Bsjlnwpa08+9eE5WnMcw6j81BZ434TffVIhicV5a2IQejfCpwes0jyPpFO/nTw+nSvwtP8sGWTEFFJf+wbkH+jn1plNzZaRbEfLvq4nuVsqnJ6HCI4dTkop+M/Wr6BciufkaOU8dFlg0nTA+ZPP2uooqnD0YUv83s5BKUeWapwkaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(55016002)(54906003)(478600001)(83080400001)(66476007)(2906002)(4326008)(86362001)(316002)(52536014)(76116006)(66946007)(66556008)(64756008)(186003)(26005)(66446008)(107886003)(6862004)(5660300002)(53546011)(6506007)(83380400001)(966005)(33656002)(6636002)(8936002)(71200400001)(8676002)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2kD9hnpiY2SnpqlTqOvd/TLEua3EQQEMIVsWVpmyflqXDc2lmMcRuzKsD/ds3E+TLEOFKyNM7n7IjdLeLay/QzSNwdavilZxp4t6/ZrS0WaNlS3C7d5pyyjlNNYYeJmrT1GFkbKX8VrZej7Dm9IyY4AMM2Kyya5uAeBK+9+5zwXXkkkEL23z2gw3dpx/HhnmtJmNW1fcIT33Q6Vu37ZVNCUDcgxAXm4NX6I0UssAFQEGJAN3W7TXZAxY04FQ3jX1k6SNJJZ+NRXfD9V5yYi1lYcgv9MtKhZgsxEVxJau8N6Mr5lHIJEcp3Gy1Zih8hSLtVe6LvZUSX1uE1qwN4bjnLOy6PqKRJJrM4zwwxk5XTFjYlVHEtfxGH718bnBmH8Y8etnYzTEXrBq+X5KIo/mzQoW7ZAkhY1jOdENDTAA0TjDOyrfSK33bOOI0ihM4K7LmT0ciXVWcQJqGAamweY+WBDWArXTXGn4e4LovNy3bsuEh+W9W2fxogOp7/6e4GcTxRCQegcHDCxwEvm2AVXGa0POFGLxsClqbYwIrRppg+26UJ3v+oQpU7frn3XxxS79kSC7xZnx0H3sCjt57MxunuIMTjF4Kk8FPDJOE8N28S00zpFMocoxXbmK0kbaoVNLXNf/sPO4lXth6lAiSVCOTg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4f4491-bb63-41ed-1af8-08d870e61e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 08:41:32.6903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fa2/dQ69OOwfc60f67Qrn1QFEsexD7B9v0ObS02F/vgUpB+Kq3ISpar/zSBvvD+L+sfyySWXQL63YIrP+tV9vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3365
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

Hi Hariom,

With Sunil's help was able to see EHL achieving rc6 state. 
Verified from sys entries, under no load to gpu rc6_residency_ms counter is changing.
Also ran all the Rodrigo mention tests and I see them passing. But with i915_selftest dmesg warnings are still seen.

Thanks,
Srinivas

-----Original Message-----
From: Pandey, Hariom <hariom.pandey@intel.com> 
Sent: 09 October 2020 23:39
To: K, SrinivasX <srinivasx.k@intel.com>
Cc: Souza, Jose <jose.souza@intel.com>; chris@chris-wilson.co.uk; Ausmus, James <james.ausmus@intel.com>; Nikula, Jani <jani.nikula@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe protection

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
