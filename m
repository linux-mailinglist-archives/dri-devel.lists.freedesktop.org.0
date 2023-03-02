Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AC6A8B83
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 23:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F6510E58B;
	Thu,  2 Mar 2023 22:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE67210E589;
 Thu,  2 Mar 2023 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677794915; x=1709330915;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9DuT/DR5VhDe1YktCOUQLabMiJvhwTojbcvWxUyC/As=;
 b=WvwyNh6D5MrzS3p/Zz7Q7lJZmjmurR7qqKnJ1uSkYnzbmCxZpEc/coW9
 HaYEPNFGrGesGqtAkqaklIND1squnJwajpNsyZtm6N80txNO1wjGubINC
 ZN0x2PxYa58wK+A7GbcFhTTo3FfcWrORUMU9dS+EBlfevVoGMF5yOSpAh
 OtEktrWcfOrQRaAX8RTiBGWh3/pFsUluz84c7pJExGLvvrWex8Dkr3mo6
 guY/LvZn5Vf/LX9c4Qp1WkMcYlOxwOFQqBzh3OKneJjZVdpxzqjPyn+KU
 FY1uIQmtspqJQJPBFphX/iBPUt3L2wkI9A1ekAAr7uY4fqo+gAahJ73kK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318689178"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="318689178"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 14:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785012548"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="785012548"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2023 14:08:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 14:08:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 14:08:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 14:08:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 14:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4ay8ed1IpFeMwaLw89K8BgmNNr+PAnG6jLP8NjiZVr3/MqqH7bkzaxzRNJoK3hpsYsKs0QmH5tOMLcBXbOJ0ZejpxhHiRWRkbi9mrZz6TL8eXFAIR5ASRhNp1FNZjNDqTJv0BPSZPPhR9scfkW0cM+WSFnTWIlQ2BqcIwUcW/vO1KaXvaelVCFBcqwWrCJnGZsx11eIX/VctJ78jk+7vR3gBuB4uASRFqRiwbFYuv9DtUnqOJTBbp5wlx23Vl4zPCqDZ8h2jMD6YRt5WckB0yevgpUXmSEpbMxAso+BpvcyG7IMP3IQC916ITm8tzFcftOFBsOoz9LAyTCczSgy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujV6Z4B1dWNXgi9K3TkanNfgmparzRQY8L1d8R0wcKM=;
 b=gJtUH4Daxiu3MhmMRft03WUihUXiXxdQOWYM69Zytp+OJvX9owI5sTlgeHDbm5m5Esvupb61v7LEijrIEDP2oj2YMfxc92HJ4DFBUpbncXQnZCH0ly1pGJFLJScT2H+iIBkPlm1XCVjR33zbppXZ7nEWD4NILzTRXPz5d6P2bmztwfy1LGYX95xkW/XGq69okFj047zp1nB7PSbITMeQu4KxV4nMlerBh68P7wE5JLj/MVM7BXdwxnY0qR3S09Ccmi6B94TN7aUAGdm94lsHP5MbxvLwtLWSU40DEWwkmcGccB6b12su9qTUiTEEOCL5c3YEOUOFi0zlAUTx6xNsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 22:08:31 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::6d95:fbed:58d4:7920]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::6d95:fbed:58d4:7920%3]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 22:08:31 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Set wedged if enable guc communication failed
Thread-Topic: [PATCH] drm/i915: Set wedged if enable guc communication failed
Thread-Index: AQHZSKgyUz/3gKi6CUerfiDH0odh8K7irHKAgAVolzA=
Date: Thu, 2 Mar 2023 22:08:31 +0000
Message-ID: <SN6PR11MB262213EC20B9FB33F137B20B8FB29@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20230224231724.769343-1-zhanjun.dong@intel.com>
 <87y1oj1h2o.fsf@intel.com>
In-Reply-To: <87y1oj1h2o.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2622:EE_|IA1PR11MB7245:EE_
x-ms-office365-filtering-correlation-id: 05a92bf3-c77b-4f59-9e7d-08db1b6aa89d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u+t5jitfc7R7nR2zFr3RaRTKWX9kaLlxUrvXWLQeT7RicPvRb9UOOOtPITU3ikmRWzXSyK829SST6OZuyr5JLTzF9biyMn4GLIZBvN5tyUJP5TVsfrg51bdUvGbAMZwjrJcb4K/wdC52wJvrbiaQ+r9q0OGow5G18tfICs8hoi4xypjl2rTLUY+GRHHDePhBWQJa8P6GoomvV1x8TAg18yHeIRLqz+WrApFRxVdNhW4aqjJLshUj8jtJUJIudOVIo50vjo+XajUhLiltVf4d8K5v/O528BrIes/lQqfBF119QYW5yM85nKJbJ7IVKdLTYUKPzZ1mMqX5PoU+n1Zk8KKpIiTFErNMy0juQrbnSS6hm3k25a+pEjDBjb5GX8UF5F430+p3UCTcQqSqRZmc4kwf/MuHXjt0B2aTy6xQ4ScMA1XH653aecAeF1p2xE1/M/SvoHB/JvuU1n6Ig4r9e+PqMsdYmDD7jnWq81FwWUJXYx/Akz4/qBy25mmi5gbKERXjwUAfFYyU5ub216NoEbgnvBPy04rYio23irCQUp5QWOSoPKpar1ATHf0zuDVmIis4Zr3yRfd/KnpmObgeAEvaK9johy5FDjfS96/V4PK6xDyEYsVwxgnjtK8pi5h/LBssre1D4gp3/CUzfApahPlh+naTTOUNBlu04F5IaSi86sXvgbaItet56TTxpJI2PsHSxL4WOqBPpmLArlPUGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199018)(33656002)(9686003)(53546011)(6506007)(26005)(186003)(64756008)(316002)(110136005)(41300700001)(66556008)(66476007)(76116006)(2906002)(8676002)(7696005)(52536014)(66446008)(71200400001)(5660300002)(478600001)(82960400001)(122000001)(8936002)(38100700002)(86362001)(55016003)(38070700005)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CHCHq10M6pwE9+JlMnvsZmQYYikyHZ1C7VdIF8CpnpU8WBO027Sbff/xB3OJ?=
 =?us-ascii?Q?0/HEfvC7cBzsUeXH1mMwRY2iuENQPBvLMWnwvMhXxxDXnJY0GmOYq8t2ntM+?=
 =?us-ascii?Q?K+HVKUzA19CS+2UVFPx+4CMfWGAuBCBCau+CIelJugejOg9QImflW1AUru+B?=
 =?us-ascii?Q?3y1RCZTFsNGPzBGzal4KkbmgQe/HGy/OEZh4FeFckBKD4QTbrvDo72peP8Ij?=
 =?us-ascii?Q?d5hhXSZLM78nMIfTVAGYu26xoXFYbluoSU+ePtREbuE/RmTz7Zs8PKMvljnn?=
 =?us-ascii?Q?G/fmRKkVrw3Y2idohAc6rwBLJoRn6Hg7uI41pMqLozsSJxOivsOCO+TBfgRs?=
 =?us-ascii?Q?VjOe3+iqQx+3WQIHgxI6A6b17DWIQYUnQgDBuZ24n06YLXweIVHx0hwVywiC?=
 =?us-ascii?Q?XjNWVbbgYJCMFddWiiUXhSXqRGmqycxGRSRI+tJisZkK2SEOEPE1rbHZOZFq?=
 =?us-ascii?Q?Z2AUyeoOShfIl/VG6f1ZYLO/1EbQjBbOrCIPsSbQLWLm4UEPXrAKOmQ22a54?=
 =?us-ascii?Q?VkJA8P1o+kbYgavXZeTRMGyDOI0mXnjEpn6Qf3wORDkLX0DdZ6gVabphRHrB?=
 =?us-ascii?Q?JudoOu99NAqjyuvNsMf+1Eip5FTEsjMp2ySm/+PmJAaELv+LaTpci/SPG6k+?=
 =?us-ascii?Q?3MsLxUZJEwJfowHpdcWGJnM8OEgQLSYL9/DThLv7lEg7z64DFe9yJmmNwWcs?=
 =?us-ascii?Q?9uUR9aqMsycKTEVPv+14Jn1FGZbkt6hiTrmnP7RLxMgsG0ytSj8CsoFutKjU?=
 =?us-ascii?Q?xFfGRAdTBayP/s2AjecAMdhg2j9eKC/EoTvr+8o1l+scYzcgzK1LvfblLEN1?=
 =?us-ascii?Q?HCa2/Tq3Ywli/Q2z3OoIhbai24hAi4UxaGwTx8Y2jIEQAn4mPK4oaFtssy7I?=
 =?us-ascii?Q?wQ+wJ4DHw1oUuGwrxjFFvrUv/HRCwXoAascD+7w20BcPuWQv1sRA4XWJU3Oz?=
 =?us-ascii?Q?5l0by/pMOn9PuydYr2rRZ3yvenLoccq9ZsNc5/G94J6ZbJsFI1MTsRmsnCt8?=
 =?us-ascii?Q?UkKKxW4dy6g6EbwMIBA73lLB+oZMLOzw5/66S/43IEBKVvrTtfLcjnQYlsyF?=
 =?us-ascii?Q?L+QSuNJuAWIl+9N/EbC2j2Zn0kvIayNlhrlQ8Bm6XcrldfFpPeEpkG6pP7HV?=
 =?us-ascii?Q?kwxWkaf+P9GX0nJ2IEklGy0J/7X7yvDz0JxZDolScAIrf4kDC4racVfa4Xdx?=
 =?us-ascii?Q?kEpVMzjwhI0+bZq6IQ2Nuet8LVEUjKKFgBVlHxxUkHOiV3QWSEE5t1gyAPac?=
 =?us-ascii?Q?RAhrj3ogMMc/lVdaOTJXbD/Ya0ExjFJOMJOYQjvoaTC8fY+MwvDAmO3rV8s/?=
 =?us-ascii?Q?yDrunuTQvgeTEgkTzZaSIZ4YHJy+kIuC/aW7MXjTFPtPZJ82jtxOrPyGuWhz?=
 =?us-ascii?Q?MUHNvvY8oMLMZS4Qbucaw2HdF6CFVC0JhuErR7RngylpvK6YJ5C0ZtbbOm4X?=
 =?us-ascii?Q?dVJryFaxTHswD50GE+7FqjRvQYOFkIv4fL6RgtgGUK3++fZPQ9Z8xAgypd1B?=
 =?us-ascii?Q?3GmStICKnGeE6TYTOpCTmH7xVx5aGScq2W9a4/WNM5cuf1i52sDKgDBjV8R8?=
 =?us-ascii?Q?B0KL594+Nq7v4nQdE/tzW4uWQqCkXUswX4P5j4Ec?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a92bf3-c77b-4f59-9e7d-08db1b6aa89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 22:08:31.1973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptL7Q6Bhkg1gqfoy42np8wNVK49ANGG06oMCt+cSuK6lSS3qyY/QYFx8NB5JX84zlQpvVBs6CNJ0X+UpECJIeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Jani.
Updated patch sent, let me know if you have any comments.

Regards,
Zhanjun

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: February 27, 2023 6:30 AM
> To: Dong, Zhanjun <zhanjun.dong@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
> Subject: Re: [PATCH] drm/i915: Set wedged if enable guc communication
> failed
>=20
> On Fri, 24 Feb 2023, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
> > Add err code check for enable_communication on resume path, set
> wedged if failed.
>=20
> I can see that this is *what* the code does, but the commit message shoul=
d
> answer the question *why*.
>=20
> >
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 5 ++++-
> > drivers/gpu/drm/i915/gt/uc/intel_uc.c | 9 +++++++--
> >  2 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index cef3d6f5c34e..f3bb7cbbd293 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -401,8 +401,11 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
> >  	intel_ggtt_restore_fences(gt->ggtt);
> >
> >  	ret =3D intel_uc_runtime_resume(&gt->uc);
> > -	if (ret)
> > +	if (ret) {
> > +		/* Set wedge if uc resume failed */
>=20
> This comment is just a reiteration of the C code in English, but doesn't
> provide any useful additional information.
>=20
> BR,
> Jani.
>=20
> > +		intel_gt_set_wedged(gt);
> >  		return ret;
> > +	}
> >
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > index 6648691bd645..d4f428acf20a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > @@ -698,8 +698,13 @@ static int __uc_resume(struct intel_uc *uc, bool
> enable_communication)
> >  	/* Make sure we enable communication if and only if it's disabled */
> >  	GEM_BUG_ON(enable_communication =3D=3D
> intel_guc_ct_enabled(&guc->ct));
> >
> > -	if (enable_communication)
> > -		guc_enable_communication(guc);
> > +	if (enable_communication) {
> > +		err =3D guc_enable_communication(guc);
> > +		if (err) {
> > +			guc_dbg(guc, "Failed to resume, %pe", ERR_PTR(err));
> > +			return err;
> > +		}
> > +	}
> >
> >  	/* If we are only resuming GuC communication but not reloading
> >  	 * GuC, we need to ensure the ARAT timer interrupt is enabled
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
