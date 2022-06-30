Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588B561DE4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3B410F2FC;
	Thu, 30 Jun 2022 14:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D1910F75E;
 Thu, 30 Jun 2022 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656599367; x=1688135367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IVU+64XqLW3rIzpd6J9HDPLRNszAmDaaB/7fVVN/vEo=;
 b=dexQG4zEvWrzkRhfXIfim7H9QcdXboKY2xlE0G1EQK/J/oZ/jx5nr6cN
 wbxrknCgI2cDZ7MFhPoFIHd2xP+ToINr0ZELZxOWnVYcEAVyci4V8eRE7
 LsBzibhdaLTetUEkIfedUNcBluE0gCLfuzpflkaApqnLvJQakyn+FHyq0
 /CmG0y+QRG2eeL3PbzKv3PPQ3ylPQw6ufvhzW3A5jN8OXJKFnNhKLA5g2
 FritR7Or1coWf5yVpff3lmQwKw8POd/J3xEfU4/iYM6FLVSbWeU21+rfI
 X6+e+e/eT0xVmLCF0ore/kbt8Alxv9v53aPc5ViRrTEzehEkHpUATRP2n g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="279908171"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="279908171"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="647912506"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2022 07:29:26 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 07:29:25 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 07:29:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 07:29:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 07:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjSHo/ft3oT3vIl/kZbTK7hSFHk/18lP7FOE9kE0oYCLvvV+LvTpcIToT9+oEVuZNEtzmZ8ffooaHUCYahRK3QHEptM6+0jFXcBTK2plJ9NLZl4HCFev5/F08lRQsuMTMRfY33CRGyB5B/U7na5wlOzVrFheA5dldmKuqB6SwXoRMGoRWhUIbSTXBsbeRQbQzsiaar2mSQc4V/nyLz6pTuIANOUd1FI4XWvH4jtU7OkbbKYBp1MdlxEVamzMCYKAUzdfC0b/ax3eUzbxfqpD7D60BGnfEt6IhDw76sNjNjJtv7AHEl8aHGay91lmYLeF8WEhsV0+9VkwmR4rFs39UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faRMY/e87iLM3YnI9PisrUahm4yXDQjC+U0urtWkHZI=;
 b=P2m+xAZdqYOiz3/UsITzOWagfL8GDKgrmkm+yRSuop62K5iKHrkDnr+ixIIdq93FgqSexhs9HsdTktqjwnzcPm41t5VIhgePKRxXkewwV0GNxyqoXTFkgwlqkqS5qZgJeq6rVkGJXwt2lHbqns9KMuO1DhWl/zLnbe7QCOFKTJkqVwSNS6+LBqwAsUA3mSXTwkawNRlZ9+FRcHC0n2E/7nTlBg6LSqe4GMpElToEuU+PWfvqk+9R0qY7CHBzROO/AQkmKvgBqVT8hgUxz/PSPZ+I73zb3HyW/XFqw3Kuu7g9sSgXXGa7HbJ8NDA3IzRp2Uplb6noDhRerBizwegVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 CY4PR11MB0072.namprd11.prod.outlook.com (2603:10b6:910:76::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Thu, 30 Jun 2022 14:29:23 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152%5]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:29:23 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 2/2] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Thread-Topic: [PATCH v2 2/2] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Thread-Index: AQHYjIoy/rynie6ziEiuZSCWkfd0Ga1oAPSQ
Date: Thu, 30 Jun 2022 14:29:22 +0000
Message-ID: <DM6PR11MB31770E59ADC42ABBDFEF1990BABA9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220630140308.3485100-1-andrzej.hajda@intel.com>
 <20220630140308.3485100-3-andrzej.hajda@intel.com>
In-Reply-To: <20220630140308.3485100-3-andrzej.hajda@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d0d9671-fafc-4966-11c0-08da5aa4ed68
x-ms-traffictypediagnostic: CY4PR11MB0072:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BF/nCkTU2epUehMvilVmoc+zP11cUNglFg+POP57KtdmkordKCIdDEAYvpKMaFGEgyZFi3ImrIY1XCJMEt7UcoaVFUglkRsWdmfRQiGjH/w6uRKHQePSFtZ7sgrGopWXVnXZVmhxaZamsXMsL9yFqWtJ/sglYAzY3dfx03nkKo/YzweJxNtpQmoh3mOskTwstSuKViu7sbePlR3bawqe9wMsgxVeWYhPV6nsEFJR7Mnp2WSBRGPYiBCJPWNqN64joZe0dWjrzla3Ffs/dh9Q1bx2a70Ve1aY7bPC4qWAYf3bu9DCGIibzF0mN22sLAW5H8M59/whrcYV4MKep6GskknXM37iZrex/x2XiLeFwTEv/2yW8YIvm5IMtaSEBR5nzxW7enUnhLA/Gm6WWIBzOe/fFc28PiFw8cKmRpnRA3KZ3BFt1mHH13OpGXMFj+jUmYcMi8zFnbn4MVPcXgDENWyH4Rg0JtnnGesI18fnIT+Oo3ec77KQT7h2BXvwwfQVmS8UyfqPF0BRUrnUHbWmglMwiVeAbAhlYEgwL85uY9c+Admvgrb44TWJuWhHsAV25Lr1ll4AFtNGC8HUEj1wdfQ1vQnoOxh/kabHiu+mHc/sDpQ78hEEvd7wFJc6kTztWu1/+fkZqPrkbXleJUJJqElnqvbD9HmYYwQhFDEoF+G1jgR1TRVae9z72WR73utmKvLMjhFflWfOTQsQuTC1G4UfbgiXdXNhYJbs0mvlNya5qfc4nW6kUvoXosPWexFZaTEUS2SaWj6OdgAOoiwfPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(396003)(366004)(136003)(376002)(66446008)(5660300002)(110136005)(8676002)(7696005)(55016003)(54906003)(316002)(2906002)(71200400001)(66556008)(15650500001)(52536014)(8936002)(38070700005)(6506007)(86362001)(82960400001)(186003)(33656002)(41300700001)(4326008)(55236004)(122000001)(66476007)(83380400001)(26005)(64756008)(38100700002)(76116006)(966005)(66946007)(478600001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Zt7FshQv4uDZeKJ2ltvbsxialfkWW3g/ycfxFGSMFivfUAnUI4Lv0+ZUwJ?=
 =?iso-8859-1?Q?Rt0p3HTOLJ+VGRq376XcvJucWVyVN94twIsX49ZBTvriKg7ROC0iwiXy1E?=
 =?iso-8859-1?Q?XiG1ngjs0j47VibgAtYW/fnKu96nqOOcMEYnLjAAnvMD93zjRsh8lmb3Er?=
 =?iso-8859-1?Q?3wuCYEjpW2yOqZ0T1CaXe/34KCNGctRHXacXvlof9DIJu7fDp2SR9NoCae?=
 =?iso-8859-1?Q?iRCGI4Rkd4Y3Ge7QSP51kT/ZfjER7kNXz0gsopYqXjZX40pzXCaNlaLKyB?=
 =?iso-8859-1?Q?gakpv7pjzgJZpbJHfILfT78K5Qxmcu+PczSPFsvmO9siARmen8pHcuqDev?=
 =?iso-8859-1?Q?T8MjdPHnCqu2nrYe6+p3l76FqH/EKnWY04HMS28NxskmOoG2MrhReh/VaS?=
 =?iso-8859-1?Q?otxdy9Me+Mn5sAaBFCoeSg3NztCh9S66UFSjRrgux/TJlD/2JznbAOJIK0?=
 =?iso-8859-1?Q?D9ZM058oU13zWnZqSR0PCGAdV4ghegnP2KTTydyq8lu9SiR5uE995UCi/y?=
 =?iso-8859-1?Q?36DohGThuk6LMXq11F3tRDE6Qslz/KuEv8C6jxZsaWHa0DWsJpcAfsd4ro?=
 =?iso-8859-1?Q?mhWjPsJVeT1vWGoB+z8DwF0VeZYkLHVxhNBaunAaTrJ14oExDpAMXAx0eQ?=
 =?iso-8859-1?Q?8WBKQvQL4vnhHS1oHj7RecvBwaMeuvf1R6FjHFesxPWOV3MMd2B4t0HVAa?=
 =?iso-8859-1?Q?NLcCd/WyRWAnNSADFAFcQUd6lCBhw3+aDI143cnoNneVlQreWgezQYibK4?=
 =?iso-8859-1?Q?4qZGk3VXbSuELLPkMWnaHBrLQo5c8Amo6pKth3VcJdz861ZB6ZDzu7pZqf?=
 =?iso-8859-1?Q?RV9nfens2ZtCprpkxTJtW/BT0A2mYVtWV8hPMiT9ej7id5aAxC306qNUm0?=
 =?iso-8859-1?Q?TWKEQCEnNXHxOwMq4a+/cpluP2NBZxU47YIBV8EpOEjkJQYB6OS62ekhzB?=
 =?iso-8859-1?Q?XfP+8LEMnNyhSdT8xXLMVEzVCV9F9ic2ClI6XfPoRCVrZEyX9WhlEE1Knv?=
 =?iso-8859-1?Q?ogcoNMZca0WGz/n4sIo9/08zSQAKIL/1770xqjeU6je6i2akuncAWK4wyO?=
 =?iso-8859-1?Q?ZQikWfcjvmpOtoPORcxYlPgwm65hLujMZiS/3rht7/V0uNw6OhrB/uq25J?=
 =?iso-8859-1?Q?XWvZd7guaIs5QqJ75xehlwVW6ixzXAq0dcRvwmkvpEGC4N9E4za1Rs9EHN?=
 =?iso-8859-1?Q?HyRlZR+D/ZmTNDufdVc1OUoD9t1YGzCb79nqzL0k3mGbSxfGF96blMWUNz?=
 =?iso-8859-1?Q?mt8qjbyFI7QJeeXIGQpgb4pRdF2laLwq68FaJzqn/CD23096kS2xSYAcoW?=
 =?iso-8859-1?Q?zxKSDmWJHdu3NnwIAITV1omZ98ToLII68NTRvFf1kIQ7vatiDB2hrMZ3hq?=
 =?iso-8859-1?Q?+u/EIZ3zV+814BcAvOb/bauR/Khur5wiXyHjkiinHefn3N5/rzY5gKrXn3?=
 =?iso-8859-1?Q?E72sFUbpTdF2v9tbwd+3wIuwxO1q6IfQqoOywfdTwcPGhDTSdh9Krze4o1?=
 =?iso-8859-1?Q?cnrEirx9KLy5Ny5k9l17XtionmP0on3IpxPrYvI9+W4eBs2zoSzpGKyAGR?=
 =?iso-8859-1?Q?t7QrAqvPZbPLNfZx4ZypNGSQSH5TEofggQ1XY4JiczKWrEOM3D7HmtLm4z?=
 =?iso-8859-1?Q?+mfo/Zi3Bup5wXjuEhEtRlh7t6fKfBS3BZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0d9671-fafc-4966-11c0-08da5aa4ed68
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 14:29:23.0034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GbW9QSfhTPR/hsdITFb4cYmY/Zo+2fTAPmrRVyC80vclBrfgEs5ZGzkTtL1QKqMFpMdnItAMwZIS+QOynDwNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0072
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> HPD event after fbdev unregistration can cause registration of deferred f=
bdev
> which will not be unregistered later, causing use-after-free.
> To avoid it HPD handling should be suspended before fbdev unregistration.
>=20
> It should fix following GPF:
> [272.634530] general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
> [272.634536] CPU: 0 PID: 6030 Comm: i915_selftest Tainted: G     U
> 5.18.0-rc5-CI_DRM_11603-g12dccf4f5eef+ #1
> [272.634541] Hardware name: Intel Corporation Raptor Lake Client
> Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
> RPLSFWI1.R00.2397.A01.2109300731 09/30/2021 [272.634545] RIP:
> 0010:fb_do_apertures_overlap.part.14+0x26/0x60
> ...
> [272.634582] Call Trace:
> [272.634583]  <TASK>
> [272.634585]  do_remove_conflicting_framebuffers+0x59/0xa0
> [272.634589]  remove_conflicting_framebuffers+0x2d/0xc0
> [272.634592]  remove_conflicting_pci_framebuffers+0xc8/0x110
> [272.634595]
> drm_aperture_remove_conflicting_pci_framebuffers+0x52/0x70
> [272.634604]  i915_driver_probe+0x63a/0xdd0 [i915]
>=20
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5329
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5510
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
