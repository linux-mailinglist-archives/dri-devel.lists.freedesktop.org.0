Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01650E86C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 20:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFDD10E2BA;
	Mon, 25 Apr 2022 18:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1679F10E2BA;
 Mon, 25 Apr 2022 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650912012; x=1682448012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUYpQWjDnV2Yd6lkdN1x9lQm+8WQaY2KnftZR6f7SWI=;
 b=YgHs5Ngsr7FKy2nK1eLRr9G3T4TE+AUy94Vva16KHSPiO4XVw7iSNG3q
 VkqXYMiqyJbxU3SjVLxMNtbL2FJiiRKr57wVb5Msf+g/NRhtzH8plhyKK
 fyN07ugfaNCKApwenP6Z0JoIrRA5+sW6CJan7vqqV0xPwAr3nmG75fu/O
 yyshEhFIcXyoqtWv39shFL/Wbz/59B3XIEnjAcHlxeRtFsO2TQt2tfjpa
 M6nqfYIFB/wlILi5cx303ALRX4eGKBFuzNvQ6aV3xQKuHMzjsVfFrPZB0
 QEAiFpQCueJQpFAUCdJgxSopd4stPyIt0gaB/Dok1lrDkuSceTG3EGi+j A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351779170"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="351779170"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 11:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="704687929"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2022 11:40:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 11:40:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 25 Apr 2022 11:40:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 25 Apr 2022 11:40:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1iw2kgqbSBDuMXHBd9p0GxBZ+4VP5OlF4uaBPofdeTsO1JVcaS88wRiqTLboXp9ieUjUTduiuG7pzeSGQzFjQhxroTvestUx3mVFns2KrTEE553R6yR5XCiJitN0/Z4qG9ALWTL+yppdj0TDl94ATBrHQW4FUQSKkVxko/lryajk+eNL12tvsIPlyivcqD+5yLwEfw5wWi2vTiHMxDvxPqnDrSuM70iFicvrCe6RaCcJo6b71Bz7zV3N55K803iFF1Tg+sMZ3Rs2ALpn5rrn3L9MgMTRabqeREVoIxYHOKAmUkr4R00HIhpY2JBg5mtpOcG9Vfd8lxETybF4Fw8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsaMeXfogs98dMP7W/pqsYxSbwxKp69SI/WV98Kn14o=;
 b=O3v9251GrUm7W7lnI5XSpO9wvWkiBZ9hfsJ3S+hk1JmeplYZ/Jzm1rFMPb3WYjUrQYY/mvx82FoRTPgWJ5oL38bC7KzD+Z9Nr8fRzLi7UhEfCn7zl1j7i9zkRjPXg/0Wx+rVXh+m4H9G4z5W8X7Rk1W+rDSxWfj8V+ijS8vNoKOihsNPCh6haBiOAPfjCNcoEwM5PA4dXmiyosW4xUxb0+z4YKr66H7ZXmUAiRpmXzTR8oadDT7bWt+q2Av+2/UMhTDIie3oMqHeEW+9Uwbs8CkeY64NbyxOHI87GnD4XzNvviPibxKiBpGvP9Aa+GdvYtXmgyOHF8FP791iK2Drdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 18:40:07 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::c491:a7f3:7e73:35cf]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::c491:a7f3:7e73:35cf%2]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 18:40:07 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH 1/2] drm/i915/xehp: Add compute engine ABI
Thread-Topic: [PATCH 1/2] drm/i915/xehp: Add compute engine ABI
Thread-Index: AQHYWMrbHISkdHnUNk6uqKLOHA3uqK0A8CdA
Date: Mon, 25 Apr 2022 18:40:07 +0000
Message-ID: <BYAPR11MB2567CB015A6B1ADF5F1FEDAB9AF89@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20220422195007.4019661-1-matthew.d.roper@intel.com>
 <20220422195007.4019661-2-matthew.d.roper@intel.com>
 <643c0538-dc2a-a99b-aa53-73693ace6e38@linux.intel.com>
 <YmbbzudQMsDNbhFm@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <YmbbzudQMsDNbhFm@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c5603f3-33f7-4112-0d6c-08da26eb052f
x-ms-traffictypediagnostic: MN2PR11MB4741:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB47412023055290B05AB2658A9AF89@MN2PR11MB4741.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UxIihc+cQ1nUoIjwbPyP9hQH3WcCLWYQYLvtPzWpNyMF3yyzyeRV66RtGoIaMsBfrb6pUcAd8TbkNovXkLS/dwUKXmJe0mivXvWGk3l8AmXbiR/rYAR4A51eN2f8OmOHzcIX6qObpMGbY7I40ldrfQL/9sx4GtTYBVDapq/9+2mJjPqGj9NFJ8x2boZv5VHbEH6ITQzInqNJTyRoObDuYACbCNLDM2ynUzqrPPSl6eR/O0twHFuKEmKTb8TWuqVcPc9ZRYpMsYBo63LzgDO1DtNQn6GT3/806oZNRvgRWWRPulq9SMp3fM6dSlJdMBQr1b4L8aLmm/gD/Qm8aNda8xa4fDrvCQZPnt2RQp1IE6d71HDCkjuDWjRcJo2k9AM64cZls8Fudx0mZls5qI6a/tEDjPVlufH0fI8oXvFIG1jhs+mX4iAB470oL9pofYJHisTxTHDEQ6E4Kt5Obj0XNSlM3nSVfJIh8Xgb+zW3jNqbpdWyP6XrtJYk3m91wrwc8JhAW4tl35Cq1Hp7KoFHBon8QJEjq3+P7E/DYtfVHSgYmLeuRwNvZC1V3lEt6Vy8AKpKi5tJhDzyoclhHHyXmmNMmqSDkgMfeZ37VacYhH0B7Yg1I2ROMi95la6CuISm2QQwbl/QTXUU3FmotbNkiLFCeay4YdtntIstbme+J7rNTFEcEsXeBfHxhf7yN/IhsZzIKCgPgirAuyBjYSYgVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(86362001)(66556008)(38070700005)(26005)(8676002)(316002)(38100700002)(71200400001)(54906003)(110136005)(55016003)(9686003)(76116006)(66946007)(82960400001)(122000001)(66446008)(66476007)(64756008)(52536014)(6506007)(4326008)(33656002)(8936002)(5660300002)(83380400001)(7696005)(186003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ey1jL2t6arDmWKkkSyqUIE3spPRekVZYFSIAq5uDQ15JuxN+VP7vv6ICGTMi?=
 =?us-ascii?Q?LApyXDU/GQWjIddPUlUPd4s+ELx0Kc319L1ZWfgDno4AEDBaO/vsRjX56iuk?=
 =?us-ascii?Q?OL0p87eZwEf2ejQuRGHDRJr20jECuQ2wuR2ZiJ9+v5OpHWq/mNwfmbhdxWX0?=
 =?us-ascii?Q?70WL/hEegOfPfypoWiAnWxzZiEcseDumIalrcd9I/T+pA8d63Rf+VikyW4Hw?=
 =?us-ascii?Q?K+biK9jdWurn4Xbc5bdhfY1kg6ygZBSCqHnIXRcZb+M3jV6SxAYwnenpqxEv?=
 =?us-ascii?Q?Cm8B4bYuTA2q+gKzxAhE4cYCCvLRLfSGTsayThpteEzXJfUNLseaNeryCbGY?=
 =?us-ascii?Q?hTBxF6HomlS4FzyVObUqDrYOHhx0DPOKeafEczd9T/X8x4Sn1HIe7Hs3Uu/S?=
 =?us-ascii?Q?lXdT83Y3SQwMtkYVFK2m0Rv5el7EbJhoJpR+869xJz8cOwOues4qvaRnc4NE?=
 =?us-ascii?Q?e352Kmuf7dpDi0v8xa4cvg0EO6fkEECRifYddHoGYEMs/xY9YkA0HsU9/3Tz?=
 =?us-ascii?Q?RwVIQom66REFsjPk+hm1rcUY2qvIWP15vmAF9kNj5GIX30DQAwJPhHGuPfsS?=
 =?us-ascii?Q?4FDX0ZcKwF/dIuWhP5HWA3nAHCiV7muibvPcjIaruD2G9ZVeRVQ5b2AtFwqK?=
 =?us-ascii?Q?UHG+Z3Vf6t3VTns5DO6E9xLOOqOGzSmcgXyfgYuPLv71cMKKFYwfGi31j36e?=
 =?us-ascii?Q?XRr41/3ap6U6gZg6YQlvwdwud9c0Fk20W5w23mBwcokZlNrnpAZHqh7TCJee?=
 =?us-ascii?Q?M6Axssa1dZtdKjAOUFY/zlOuyvaWBg9MbmWBW6b4sHlzaTfiSrK1X/mLHmO7?=
 =?us-ascii?Q?O+GQVO3scGtAT/ZferJkrYOrzhuSOseqzbWA4JbS9y413Vvp9ozWmJwglu7Z?=
 =?us-ascii?Q?P4E2mBu2tluMPp6mmKVsgSKAvy7OgNR1szDVBpITz3oAp7KV8Y8sTHFVlcxM?=
 =?us-ascii?Q?NC02Xz99PonP0VUJeJDkOkJ63jNbSNqRbg3kl070PIbjA6H8AstcDnCurxJJ?=
 =?us-ascii?Q?bzZ5s0IfUvSQ99uwAsCD4AC8Tzc2qSuau2zA4KdzxW9AJL6Z1sS2V21udx5k?=
 =?us-ascii?Q?NiEsl6JGk6f6TpgxIcqvgTpLEiKypZo5mHLL7xoYgtTTkCsKJVbqdEVf44oF?=
 =?us-ascii?Q?6TRiGBx0Dn2KwWjlOZuO1n4UxQz67e/IRCF27Yolh7KzVIOLHvA72qZT5v2U?=
 =?us-ascii?Q?XmdupWlX1KHqluMKYspAr740lkmPVIAi2wJ63r1/40JFpePk/P/b9R7UOBrd?=
 =?us-ascii?Q?Mx7PdX5oM8O+dEL3siwVpwziQNszYYgnM4nAEuU5VZKPJbJ3rnN+02Ozu4Lh?=
 =?us-ascii?Q?C9T3K7EQI+yrj1qkcVJCERJz4Q3T6buitLllNn+WaaDSsVeaBH3Adrtv5+S4?=
 =?us-ascii?Q?dpDo5XcuWBeOEgspdnN8seZ5FV/37sDgVRVnTVQfNEULLNx7Fz6ToCM2RK9K?=
 =?us-ascii?Q?91OoxFWm+tQuR4oDLduoBmVn9p4oJm0lCg7c0MbTRXjyR58w0WlnycFvPfWQ?=
 =?us-ascii?Q?Drtw/K+/cUsDVxSXM0T7l+b7eY/PP4gay1Oavgys1sX6dXkztjpFbHuTgJN7?=
 =?us-ascii?Q?JRfIWKfSy1aeco1hj/pnWBpt+3dvBtZXXAEZgg2HsBKsnQvdQ6OT1WZ1+WEW?=
 =?us-ascii?Q?g+0XJlgfx4mRPoSLzH5+YEnCKv25dgvC844sUtwwOUuEkLXdfoiSQnEgoEsI?=
 =?us-ascii?Q?KGpf0KpXB1N+eK5b/JAhBJYMOtt653O1CfDpGu0WErIUwtlwjUb8iicRCgzm?=
 =?us-ascii?Q?rtUPQSSSdA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5603f3-33f7-4112-0d6c-08da26eb052f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 18:40:07.2017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ns575rreJH4eMjPHdh5CteDdjp7WAVrY9Rw4GxiJMYacdzMRgzQpAbZZAcQISNtqGSpUJ27vx5LdxohxObRfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
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
Cc: "Morek, Szymon" <szymon.morek@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, "Kumar Valsan,
 Prathap" <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> > @@ -1175,6 +1175,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *g=
t)
>> >   		[VIDEO_DECODE_CLASS]		=3D GEN12_VD_TLB_INV_CR,
>> >   		[VIDEO_ENHANCEMENT_CLASS]	=3D GEN12_VE_TLB_INV_CR,
>> >   		[COPY_ENGINE_CLASS]		=3D GEN12_BLT_TLB_INV_CR,
>> > +		[COMPUTE_CLASS]			=3D GEN12_GFX_TLB_INV_CR,
>>=20
>> Do you know what 0xcf04 is?

Looks like that is the TLB invalidation register for each compute context.

>>=20
>> Or if GEN12_GFX_TLB_INV_CR is correct then I think get_reg_and_bit()=20
>> might need adjusting to always select bit 0 for any compute engine=20
>> instance. Not sure how hardware would behave if value other than '1'=20
>> would be written into 0xced8.
>=20
> I think Prathap and Fei have more familiarity with the MMIO TLB invalidat=
ion; adding them for their thoughts.

I believe GEN12_GFX_TLB_INV_CR is the right one to use because we are inval=
idating the TLB for each engine.
I'm not sure if we could narrow down to exact which compute context the TLB=
 needs to be invalidated though. If that's possible it might be a bit more =
efficient.

> Matt

>>=20
>> Regards,
>>=20
>> Tvrtko
