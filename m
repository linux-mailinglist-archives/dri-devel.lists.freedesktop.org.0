Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77B5B0FE1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 00:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF85610E8F0;
	Wed,  7 Sep 2022 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8344810E648;
 Wed,  7 Sep 2022 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662590288; x=1694126288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rrpcjdb23jNQKYZoGhbzr4bt6tzx8OWm4Y4bLhA9KYo=;
 b=H9TFVA2n4HndAWP5jn8Zc9cKM+bCAa1eS6AwmpoZN5EDMLmZ5STP4p6O
 Rl2mzPSJoxoRC+ceG7KWGaD5QzMEpUW0rX01Fb1TTfjqQd4aeLCTbRCNY
 LInhYwgLDylCc665uVf6D7HQPkK728/MFdhpJqjOj2yl07V/tIbD45I2w
 lIc7cx/jVjdcsAnuLW4nJs69yt/5F2Sf+fI/iP+rUHWYwjdxeGKqc8R4R
 kkgq22kF67UdH9Zf/NZyNCynN966SDCN1jVQpfv1JWshtQofOT9amoc/q
 6uzWr+hEMQSBU+6gqIPAsiMDS43gOFAya0CHAChp5cDhTHzKIKfK6/WLV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276751017"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="276751017"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 15:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="703781355"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2022 15:38:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:38:07 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:38:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 15:38:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 15:38:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m88IHFRi3mShgNvNH9f/4juLq/W4idfR3lNWX9lBbl9BXZbC3Bc63qsMJKPXoAqqyHFdcNBGVkinKU5oZEDlkTtVxSY6zcRJCGQll57BNkvHrxC8vJhjfTJjM1wo9tPzPgdqh9SCb7Xq242zXbL/KP1MVrWjOvbGg1gGaWjFLlsqxxf0Y85+xojaEsWUHCKWphE6Kg9+QjZ8ICQruD9lHEovQshAsP5yRMt76VvCxH/f0/ZEdW7EygFAg26kCgQkFZXZLmJmgkiPSrEDR32kT2TFPC33MebxtIDICsN7HI8DZpix5+Muh2p2xs64W8H1hfIBsm8sy+fQuj6xf0Cxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pup+dGnu+RyIuoQv3smZWZu3HfcVzl0GCL3i1r60Ydw=;
 b=RdFnVXYxtNvMK1Mk4zxGV/DZWd/tweC+U7qYiOdPPxJGEqUkgkol3QnQEqt6ZKWWFBleXFkY1xtT7twWKPAxKZMBnJFZX0sw2U1jfazVMWiNa3VFzMSJA+JbQc3BJiiRFQ0pwRVYYZ0dltLamNGl9dkYUqT3s8mxkMZiWM2VvU0xt2EPUCdeg1Cejg2wvfcBrvd3q5S4uc8qDtvXusWUK5BmXGc9zbugZl7tNX5hCKIf9aNTHj9dsj/q1U1eng8gOKpdcjpEzF9NW7u6fLOIKQELTk+7egmvRE1U/HoNOJ0isOHAB685Jt0H1dknhPF2CratuC8U2tNOEku/72ZBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 BN7PR11MB2867.namprd11.prod.outlook.com (2603:10b6:406:b9::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.14; Wed, 7 Sep 2022 22:38:03 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%7]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 22:38:03 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [Intel-gfx] [PATCH v4 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Thread-Topic: [Intel-gfx] [PATCH v4 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Thread-Index: AQHYvpHzrnicizflQUmhSg5QJYwQz63UeX2AgAAXf4CAAAI6gIAAAntQ
Date: Wed, 7 Sep 2022 22:38:02 +0000
Message-ID: <DM4PR11MB59711B8EB394E2838081B55887419@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-3-radhakrishna.sripada@intel.com>
 <20220907204925.52jz35ufbxvvm3yv@ldmartin-desk2.lan>
 <YxkXi5b2heLYZaRS@mdroper-desk1.amr.corp.intel.com>
 <20220907222129.yjwbuymda37jy6mp@ldmartin-desk2.lan>
In-Reply-To: <20220907222129.yjwbuymda37jy6mp@ldmartin-desk2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4829f9f-e567-480f-7659-08da91219fed
x-ms-traffictypediagnostic: BN7PR11MB2867:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: odMN7sc0WgESmGKGAX9tAz9KqFOiVnDTy31ktBUYduUjmhRhWXgHs9/dW03Y1rNjsmuL1+YYeIbLl6Tg7xdiB22UgQGzdiH1v1QyIBcQcT4EuQBHN7aWqZAKl2NhcVvbCMdiZSh2ejrxPmoXvAzm6IQw1K0QT9OZVaGpNJz8zG24ovmF64TcPjuvmk/4dozGhyE9Hk2LfxXPve3uO9xkvu6EUY6iAG3aoUP+r7eRhch3TqK8d658+2hsgmrDimumW3scZ6/oGA0KXFEIVnN43DcZZ6GoSVcrqp+Prangj6LqsRB/Q3+rWtZIHVqTsNWS+vexiOz5OVHhYGVIErfcHIwnSAlaIRCWGwipEKs/Xaw3lLI01x0TMZlxzX6XCg2X+I6JfLHHsBlgUEWgjQM/3cAbPd+0RNOEt8V2LFqs5IAY6N49FPFKC7kpAfYkCQ0b7W3U5PxOgPR5pd+b0O3Bi0M4r9eIDPbmkymsNpnqr6WFSMool+9J+96QCjcu0LPQRP8hM3wo24gvMY3DEZRqsp0Wk6ZLEil8bxp7QD0f0AqT4j/NbwBnLTVhdyq4mPjTIFI0sc+CF7luifH2ocEPxUceOxitIi4PIOymQSMCO0V12CH0AqJYJm0JDbnqgtAvU2G0XbdZkv7fyzCLECgxdfLNbyLMEqU40N7tERAh/nH+IGiAS6mFCWQlttuOkWjJzPrRlfBMhoKBwfbbUu2oW5z5HxSpSpf+bfgyhJX7FSxe8ben9xCpwtDe8XYIup20GGjEtsTjFCjeRg5QKssxzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(136003)(39860400002)(376002)(5660300002)(316002)(83380400001)(110136005)(33656002)(6636002)(8936002)(54906003)(52536014)(2906002)(8676002)(4326008)(450100002)(64756008)(76116006)(66446008)(66476007)(66556008)(66946007)(478600001)(55016003)(26005)(41300700001)(53546011)(107886003)(71200400001)(186003)(38100700002)(82960400001)(122000001)(6506007)(7696005)(86362001)(9686003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f22vW7MmomS7mZsSs5k9rzOrHLJ1Bhe58qfKk3dbNY0xWCE7ln7ITc+Zpz+1?=
 =?us-ascii?Q?jWyVI2iRzOvxLyD0fs0gV7weha9X17uv0Tf58ucSgublmAGnBDSdm6K+mUEm?=
 =?us-ascii?Q?SDX37erl9OeTIfxbjtuUWu1of8s23X7BySYqnT1PFOePJszJbmNuBnwJ1kI2?=
 =?us-ascii?Q?EszKu7hFU5eykNIbYh31++TPfTO9/YUeu9ei5L0hFXczzPFN27jBR47cUs5V?=
 =?us-ascii?Q?KJ0A5RoxqAdIdF4xHN8liwT+a1UH4FKsuvCseXdR9LiuKHVMlLjHVqw3Rsmz?=
 =?us-ascii?Q?TfXOzenRh37MQOEwIt4+I+MmoHRAZejRcFyDyor/9rVIgCPQVhJMTbpszEX7?=
 =?us-ascii?Q?V3OsHdIDZvreplurdYOkX4Epnst761g4A64+MuVPdKsNzLDpLU7NLImx7e3c?=
 =?us-ascii?Q?dQpyYw1d4r7JVQGlPtS6YyHo5ccQ8atJbzu6dtP6lsrqlMxK4OQUpmvlL5wj?=
 =?us-ascii?Q?cxlDJJg4l7yN3ZK2JiilxEzl8a3LOdNDXVN9nhB5gWpp0YXXTHdE/P6DNAWQ?=
 =?us-ascii?Q?2Dhx3aWFKyna4YglQDCX/Vjz5K+0+LAjC71C2tpPx05mjeOgi9u4166Vt/Ut?=
 =?us-ascii?Q?BQDXfFilWv/A8MdYNDIBrCQI683aK07sas43vCZVbLS8v5QU5UwVuTtIVSQY?=
 =?us-ascii?Q?NCcgwoKR0VzkI0JqBIO1WQ2o+LR/dfQWSzuB9lrHRIHL/i2gH8ArYTKU9f+n?=
 =?us-ascii?Q?omK/8e19b4xRtlNF+JurwfygDCAUdqzCcu5p42UteG5YyGFexEPZ2mGdyZr1?=
 =?us-ascii?Q?FLeW0AR8yrDRVIjyG4tx/4Fs1tnhIfY1sPdUsP+wr0ksV63V0ano6a88AE5f?=
 =?us-ascii?Q?XBrX84JINBI+/0Ov5b5hqsZr+W8NUNRVcL9vOCHIoqohesXfYGlenV9lbfyw?=
 =?us-ascii?Q?tlepQDC0gkZUS583Kvh0qQPIuFGwWOEoThwclilOG1QkeleGvCGBqd1fTINb?=
 =?us-ascii?Q?KHl4Y7ciLSPVy+8HmiIMjaBR7OEeW5Upo0R7JhCkxRIhEv3/KCmTTD/D5qlU?=
 =?us-ascii?Q?YExgzHLXEzsR9fVR2yfjLfOmtLdP7htHou7uaaYb15nVV2oIS1uJKOLehCVz?=
 =?us-ascii?Q?bihl+FyHovt7DpKjR8cLvJ+iO6zbXC+6u+2qVoeffGwyYO4uBu72Vt0WXGZv?=
 =?us-ascii?Q?7eK8aMDCoP8UlCu+0+RtrYw/PISRqR2NK+L0KqmODaQUGgt8ciEKIHQOlqyy?=
 =?us-ascii?Q?godBF3n3iMlaMgXhIhJz0iBbL13svPKCEBXsdpJtKvWD3Z7tW86eMwRANmci?=
 =?us-ascii?Q?30jJCb36XuWnkDJHZZqoZuuTblWCxRn0xBREhkXRy2uSlgwl7rMgau2WG3/a?=
 =?us-ascii?Q?TnYWRpSf416OkgVVCwOhqgDcFW7XU/v0YSZiqW2TSvArgFnMkjlT+yTNO4gT?=
 =?us-ascii?Q?rtb9SeczgWjm6SKgSzCATyHDjvBVtVT0SQ4TZnDsTnJPvhWnVSIC4pw88+Q4?=
 =?us-ascii?Q?Naxoevb//radSDxGwi/SNt0C71U9KDVGiRVityWkOEACLT/5l5P2Leukl87N?=
 =?us-ascii?Q?gHc/hYDOBbXzPFceMIEWl9e4XWXufTiAvGd209uaqYAG1pKvuacX10EPdusI?=
 =?us-ascii?Q?Kxj1MStMYX2CZZCftVHyGFicmQ0gcXz8OAnbggN6XaGKnw+ju1POZj2UhDJL?=
 =?us-ascii?Q?5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4829f9f-e567-480f-7659-08da91219fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 22:38:02.8965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kk+ZVh9sZnMqy7yiA10p9d1SD2TYtGs8gVvm3wpiyKt80wFoM/WS8FZwTDZ4BQoJPvjp9l6r+On7oooliShgxlWup8TCGieLPMdrpwU+TVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2867
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas/Matt,

> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, September 7, 2022 3:21 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-gfx] [PATCH v4 02/11] drm/i915: Read graphics/media/d=
isplay
> arch version from hw
>=20
> On Wed, Sep 07, 2022 at 03:13:31PM -0700, Matt Roper wrote:
> >On Wed, Sep 07, 2022 at 01:49:25PM -0700, Lucas De Marchi wrote:
> >> On Thu, Sep 01, 2022 at 11:03:33PM -0700, Radhakrishna Sripada wrote:
> >> > From: Matt Roper <matthew.d.roper@intel.com>
> >> >
> >> > Going forward, the hardware teams no longer consider new platforms t=
o
> >> > have a "generation" in the way we've defined it for past platforms.
> >> > Instead, each IP block (graphics, media, display) will have their ow=
n
> >> > architecture major.minor versions and stepping ID's which should be =
read
> >> > directly from a register in the MMIO space.  New hardware programmin=
g
> >> > styles, features, and workarounds should be conditional solely on th=
e
> >> > architecture version, and should no longer be derived from the PCI
> >> > device ID, revision ID, or platform-specific feature flags.
> >> >
> >> > Bspec: 63361, 64111
> >> >
> >> > v2:
> >> >  - Move the IP version readout to intel_device_info.c
> >> >  - Convert the macro into a function
> >> >
> >> > v3:
> >> >  - Move subplatform init to runtime early init
> >> >  - Cache runtime ver, release info to compare with hardware values.
> >> >
> >> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> >> > ---
> >> > drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
> >> > drivers/gpu/drm/i915/i915_driver.c       |  3 +-
> >> > drivers/gpu/drm/i915/i915_drv.h          |  2 +
> >> > drivers/gpu/drm/i915/i915_pci.c          |  1 +
> >> > drivers/gpu/drm/i915/i915_reg.h          |  7 +++
> >> > drivers/gpu/drm/i915/intel_device_info.c | 74
> +++++++++++++++++++++++-
> >> > drivers/gpu/drm/i915/intel_device_info.h | 12 +++-
> >> > 7 files changed, 98 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> >> > index d414785003cc..579da62158c4 100644
> >> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> >> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> >> > @@ -39,6 +39,8 @@
> >> > #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> >> > #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
> >> >
> >> > +#define GMD_ID_GRAPHICS
> 	_MMIO(0xd8c)
> >> > +
> >> > #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> >> > #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> >> > #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> >> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> b/drivers/gpu/drm/i915/i915_driver.c
> >> > index 56a2bcddb2af..a1ab49521d19 100644
> >> > --- a/drivers/gpu/drm/i915/i915_driver.c
> >> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> >> > @@ -323,7 +323,8 @@ static int i915_driver_early_probe(struct
> drm_i915_private *dev_priv)
> >> > 	if (i915_inject_probe_failure(dev_priv))
> >> > 		return -ENODEV;
> >> >
> >> > -	intel_device_info_subplatform_init(dev_priv);
> >> > +	intel_device_info_runtime_init_early(dev_priv);
> >> > +
> >> > 	intel_step_init(dev_priv);
> >> >
> >> > 	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
> >> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> b/drivers/gpu/drm/i915/i915_drv.h
> >> > index f85a470397a5..405b59b8c05c 100644
> >> > --- a/drivers/gpu/drm/i915/i915_drv.h
> >> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> >> > @@ -936,6 +936,8 @@ IS_SUBPLATFORM(const struct drm_i915_private
> *i915,
> >> >
> >> > #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
> >> >
> >> > +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
> >> > +
> >> > #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
> >> >
> >> > #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
> >> > diff --git a/drivers/gpu/drm/i915/i915_pci.c
> b/drivers/gpu/drm/i915/i915_pci.c
> >> > index f6aaf938c53c..4672894f4bc1 100644
> >> > --- a/drivers/gpu/drm/i915/i915_pci.c
> >> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> >> > @@ -1129,6 +1129,7 @@ static const struct intel_device_info mtl_info=
 =3D {
> >> > 	PLATFORM(INTEL_METEORLAKE),
> >> > 	.display.has_modular_fia =3D 1,
> >> > 	.has_flat_ccs =3D 0,
> >> > +	.has_gmd_id =3D 1,
> >> > 	.has_snoop =3D 1,
> >> > 	.__runtime.memory_regions =3D REGION_SMEM |
> REGION_STOLEN_LMEM,
> >> > 	.__runtime.platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(CCS=
0),
> >> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h
> >> > index 5e6239864c35..e02e461a4b5d 100644
> >> > --- a/drivers/gpu/drm/i915/i915_reg.h
> >> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> >> > @@ -5798,6 +5798,11 @@
> >> > #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> >> > #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
> >> >
> >> > +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> >> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> >> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> >> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> >> > +
> >> > /*GEN11 chicken */
> >> > #define _PIPEA_CHICKEN				0x70038
> >> > #define _PIPEB_CHICKEN				0x71038
> >> > @@ -8298,4 +8303,6 @@ enum skl_power_gate {
> >> > #define  MTL_LATENCY_LEVEL_EVEN_MASK	REG_GENMASK(12, 0)
> >> > #define  MTL_LATENCY_LEVEL_ODD_MASK	REG_GENMASK(28, 16)
> >> >
> >> > +#define MTL_MEDIA_GSI_BASE		0x380000
> >> > +
> >> > #endif /* _I915_REG_H_ */
> >> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
> b/drivers/gpu/drm/i915/intel_device_info.c
> >> > index 56f19683dd55..a5bafc9be1fa 100644
> >> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> >> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> >> > @@ -29,6 +29,7 @@
> >> >
> >> > #include "display/intel_cdclk.h"
> >> > #include "display/intel_de.h"
> >> > +#include "gt/intel_gt_regs.h"
> >> > #include "intel_device_info.h"
> >> > #include "i915_drv.h"
> >> > #include "i915_utils.h"
> >> > @@ -231,7 +232,7 @@ static bool find_devid(u16 id, const u16 *p,
> unsigned int num)
> >> > 	return false;
> >> > }
> >> >
> >> > -void intel_device_info_subplatform_init(struct drm_i915_private *i9=
15)
> >> > +static void intel_device_info_subplatform_init(struct drm_i915_priv=
ate
> *i915)
> >> > {
> >> > 	const struct intel_device_info *info =3D INTEL_INFO(i915);
> >> > 	const struct intel_runtime_info *rinfo =3D RUNTIME_INFO(i915);
> >> > @@ -288,6 +289,77 @@ void intel_device_info_subplatform_init(struct
> drm_i915_private *i915)
> >> > 	RUNTIME_INFO(i915)->platform_mask[pi] |=3D mask;
> >> > }
> >> >
> >> > +static void ip_ver_read(struct drm_i915_private *i915, u32 offset, =
struct
> ip_version *ip)
> >> > +{
> >> > +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> >> > +	void __iomem *addr;
> >> > +	u32 val;
> >> > +	u8 ver =3D ip->ver;
> >> > +	u8 rel =3D ip->rel;
> >> > +
> >> > +	addr =3D pci_iomap_range(pdev, 0, offset, sizeof(u32));
> >> > +	if (drm_WARN_ON(&i915->drm, !addr))
> >> > +		return;
> >> > +
> >> > +	val =3D ioread32(addr);
> >> > +	pci_iounmap(pdev, addr);
> >> > +
> >> > +	ip->ver =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
> >> > +	ip->rel =3D REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> >> > +	ip->step =3D REG_FIELD_GET(GMD_ID_STEP, val);
> >> > +
> >> > +	/* Sanity check against expected versions from device info */
> >> > +	if (ip->ver !=3D ver || ip->rel > rel)
> >>
> >> this doesn't seem correct.. if we have
> >>
> >> 	ip->ver =3D=3D 12, 	ip->rel =3D=3D 1
> >> 	ver =3D=3D 12, rel =3D=3D 0
> >>
> >> we will print
> >>
> >> 	Hardware reports GMD IP version 12.1 but minimum expected is 12.0"
> >>
> >> should it be `|| ip->rel < rel`? Once we land the static number in
> >> device info, we can only expect new .rel versions greater than that.
> >
> >I'm not sure how much value there is in keeping this sanity check at all
> >given that we plan to remove the device info versions completely for
> >platforms with GMD_ID.  But if you want to test this in an easy-to-read
> >manner in the short term,
> >
> >        if (IP_VER(ip->ver, ip->rel) < IP_VER(ver, rel))
> >
> >would probably be best.
>=20
> I'm ok with removing the sanity check as long as we log the value read.
> We still do when printing all the info, so lgtm.=09
I agree with Matt's suggestion. Will spin a new rev with IP_VER based check=
.
Although we print the info later. It is worth doing a sanity check as we re=
ad the info.

-RK
>=20
> Lucas De Marchi
>=20
> >
> >
> >Matt
> >
> >>
> >> Lucas De Marchi
> >
> >--
> >Matt Roper
> >Graphics Software Engineer
> >VTT-OSGC Platform Enablement
> >Intel Corporation
