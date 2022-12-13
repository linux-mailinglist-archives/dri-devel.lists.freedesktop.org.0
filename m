Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02B64B388
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957E10E307;
	Tue, 13 Dec 2022 10:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D1910E306;
 Tue, 13 Dec 2022 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670928465; x=1702464465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ppz86myWl4dw6PRdICVKBV9EV6dhxfN1XvHIrLD2gU8=;
 b=UplBiiZYfEt9U+mW9QXweNnIqRKrAPvEsnP2pUgXTXVzXG5+JXL/+hs3
 8XoWfaCvzwpKNu/C5vuScfMPttS4mu6TOeccGBHdk8D0P8BeZvKm3Uq5v
 uUAguT/5x3ea8PlgK5s0wVGzzwC/rEfWWr2m8SX126T09HL2K0BG4VPcp
 xt+0YDreib6LzQKwwlfaooxI+wogLaDv4onFUXFsOw8djDZ3jw09yYYPt
 1ec1yji7OKuOFyVS8hLn8uERrcwjomDAV/1Ana5zTMgdJWKUaBGZrw8O+
 E6gqmmJQ0iDlMQrJTFwsTJoy56noJoZxrcZy2Hbbo7wS/7N2zRvLZjI1O w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380305368"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="380305368"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 02:47:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="650692466"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="650692466"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 13 Dec 2022 02:47:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 02:47:44 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 02:47:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 02:47:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 02:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct5Ih3exVP+pNqJqnhgxbHNZExyNmDoDhthe1jXuXFCUD0eLmOPyC7mph3PrqDTQoqXQF6Pw6hPEdhSLLa3SnpbsTpfkkHiMQEbjA5bxRj1lnX3ybgm5GtIddwrIJu885n59WNwuUOsUDEW72+1Z9uXft9JLK2DGbqd+rle7XCi4h04RhyAOIp4//QkS4kJPaOUt6QWTgtZAnN+SYaVB82pHzJGexx/fAxSQxn4yT20vMUR6RiRpUU7W8Hkob4VEJ0lj0JaUS/V2/eF0g7XHrOAZywWKFsCuOYldyuqCnRPNagc02UeuqYdGvfJtMp5TCgeZKsp/ty3dCnhXVMQJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1qF0pr0o08nmR+6Vpyt681xzeQZjipergrza8AVtMQ=;
 b=J6re38FJ+bpqjO26uFkNbIZjpcKEwnW8CaWawhLf50nKmjSZ0NMVwGUG2Wnh7aOgRuXNbAVI7v+HrZMXiPuKju+EtypuYWFq7wcHgQ30f3Nn+Kame6Q5fKIS6Sb2g93TjJahS6T2D84cP2zrUc1PDjkKamOO63yJEOk3MNZE1wCQV5ocRg4klhzwuzrHQ5+dS49rQ8+I/Kfo2IrZWMK+UmrSIcOQZ6SmqdvRpodnoqyNDfVP2v5LULiS3d2RABrPYH8HXu6EPI1gC34pTz7bZtbE1Y2irzP+BonAibsgngMj22gWFT56EYtWqAKuFWw143FsVfUTZh//qbBgpDXq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 10:47:36 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::4e35:9914:650b:269a]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::4e35:9914:650b:269a%8]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 10:47:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/gt: Modify mismatched function name
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/gt: Modify mismatched function name
Thread-Index: AQHZDtjEgdZrOK7N4kO7ODo7FzRGVq5ron/w
Date: Tue, 13 Dec 2022 10:47:36 +0000
Message-ID: <SJ1PR11MB62042313A2F529D22CC799F081E39@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20221213095145.1899-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221213095145.1899-1-jiapeng.chong@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7565:EE_
x-ms-office365-filtering-correlation-id: 61cdcd37-49a2-4b12-6c9b-08dadcf772d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sD8vNFb4VWyv48g3xBZOI45C5wWXBTQ6c0U/lJs2JtZTHWzIdz07xdJMYapQJa1fl7Wui1x3JYgN2cEe81iKfM4RNTjUsEe3vQMogQ09PItPaEembSZYMaAJ6q4YYzvXgMdIl571Sf1lhgjQxyYangW0EvVjsQ96h0IwnmZ/a95+wBZtdxusAJGCEsh5BK3cR4R5FLbNEHIsyuTuRBccf8uiOjPWNsHkO7IhyB5CtV0zBk8F47GWUBbaYsFSNrfUzR/+dWpQph2XOijWTR2iOc96CAMPaTnthYmvPoZ+TUY0HWxRj/qAdQO75ChnEEZIoO4nYfWuDeHaKwDuso9mr9Cp/pR9QsCN9+2aXDuJyeJdN0gZDziJtcHa18cVRr3I8vrbLZl09zMy1oxkvVXnvhVlFUZo7/9hlT9WfSaT5SY1+E8MloTdl7GHVrsvv0XznhmJ6keXRE52vOoVDmIkeQm3J88ydX44tF1GYkdTAbeMwa/CrCXVe1YCaF7/RUd/ge5u+j+6G+QebK6fFPTxmXm2x7A9aWrkS+Da16y4Rybge5JAo4r7X4Q8D1aDoKrJ47VxaTkXe+c5Shh7T6j/gmAZrvm4wDPKHRbu4uUfta/ueJ3VVMHFsUk16pMV+lWdpZkA4O70dESvopOCv6l/LWwY5c1QgCYAWa3s0G9MB8+1UnU/3KaEBqrrLCbFpERInsWv5/LgmS+nqtro6JgWnScff36c2i17Kutygwfhff0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(38100700002)(6506007)(7696005)(82960400001)(478600001)(55016003)(966005)(41300700001)(186003)(76116006)(66946007)(4326008)(86362001)(66446008)(26005)(64756008)(9686003)(8676002)(66556008)(53546011)(71200400001)(38070700005)(83380400001)(66476007)(52536014)(5660300002)(8936002)(316002)(122000001)(33656002)(110136005)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eqzDy62TcTtSgKBlCRvjUlEnrwJECQQitodVM3pLoiD8m3S2oE770pLdScXK?=
 =?us-ascii?Q?+127kiVm1zNjmKAeuEKqxOVInfKPWXTc6HjTW78b3AvGguZo6v1/bCBP98aU?=
 =?us-ascii?Q?JuZYrykU9s+s0xrS+U32ZvVmrr1UdwqysKjJOyT/uPLIZBclP+aevAIPa+sc?=
 =?us-ascii?Q?cIEjR2LWs1uuyc7poONyUHHgl20+xVzadFUoYOhhHnNEFjqXfY8C8UfT97CW?=
 =?us-ascii?Q?zSIK+OrY0QOO7a+D1QfdoM4NsK7RZr5gbH+GQC/mrNTKKX2ECB75NcpKmP30?=
 =?us-ascii?Q?DOLha+1uqFXsGnk9lBC7c6f67JDFIuqcopTvi3WrT6TgfZJ5/imMXGySZaR4?=
 =?us-ascii?Q?IcSGUKpQ5MkAdBskK61p1gIt1ZjgHrwjMkG/EotfGVTuBs1q9kjaj8hBYYiw?=
 =?us-ascii?Q?ZDp615Y7dTaiaJg4eiIb0LlrM/ry0hfxuysI0BhnjaQMmOf98toHI8XR97C/?=
 =?us-ascii?Q?USVrHgIVxTKtvRUWLQgcEtcOpcHF6dyyqIF4dvI5ED6jHF2QWyL9y26ccosY?=
 =?us-ascii?Q?7m5IjWMbZ0VFwCkB8JKJtkcHFiQCzWXqvqiG2vSIDcThmoFzmjOsvp3rhlzy?=
 =?us-ascii?Q?kz8gjsPPuSDFGG3vJPHRr0v1h69hC+Xi7O+I3PpTu8ZdmMLtCmrsSNDrJYQe?=
 =?us-ascii?Q?5wp2fcYYlmqWl955OmRDh67rAMyN17feCasN4jTA1hy9S6msY9thIMC4XSUd?=
 =?us-ascii?Q?CjNz6v7yUmTSwS+XoN/x+ksTwfaCEm54ZFQ8gkMJ6Asoi2WfoG7rcFvxJldc?=
 =?us-ascii?Q?Kn5b8FWG/ADQPJgFaVE1MEUyXlmsJ743lASp7JS7DeM/A8e9U3G4g6PwXb3I?=
 =?us-ascii?Q?jLPfeSva8qgu0BO0j6mWeTkgUOtmVOnLoP54nPvY60dz/wmifNGZFfbCcoI7?=
 =?us-ascii?Q?C22gPu2I+H8olAJhzmSn0kBW4Jh5Uba21gwfSuUsCnrLG3UxMk3ItwjDRof8?=
 =?us-ascii?Q?m5Mkl1pod5L6wUMxsd6noziumH2WRvnqwjDmwE+cIeYYVMptyY6S965fbmCo?=
 =?us-ascii?Q?RZnFh242sdHaYhKw+XT32cKi5Ek0zGM66gAKG1fpn0KGIeGcUKmPeKvFBgLo?=
 =?us-ascii?Q?0OKYacO3LfVVhOh0tz/lAtrdDjKyiKLMd6J5ctatWGWklbgQxQNntNvpaC+u?=
 =?us-ascii?Q?j5vEmLlbIdzrogAO2GclrbLhDzhVl64qLb7TEY/inqyTSloE2+rGZAqBecT5?=
 =?us-ascii?Q?Uq4e8J7b+rJlHw+Jmq53h46T7QMlItaRCrNJtbyFxn+CLoeG5mJTywHropo/?=
 =?us-ascii?Q?Nitrdq30VIV+m0YJa7sa2psYM7/PancRoaUeagePTuoBN49xW2Gmrd8r62xN?=
 =?us-ascii?Q?/fOFsJQHRxqHTes4CfBIKnRK89tJmFWr7OSrGEwRXH7ODLa/Qu8UWK+RCr0G?=
 =?us-ascii?Q?zQR8l1y/RcDUWH9WV3tLzHGPthl8Z4NYcr9zgdR1UYSP61V6CiAARgMfXhyR?=
 =?us-ascii?Q?PH1KnpOgrRhq1I2esqtQO36q/E2ysjX0D7C4EsGerVR6fQMA7ESzg9wMnuSd?=
 =?us-ascii?Q?tVd1S9TULJSjFSNVvogyuvUp405eaFhlgfXb7HuJpxaORmpqNFZasDyqC8R8?=
 =?us-ascii?Q?eje/88POVu3THZ0Ga6swUFg0REvV6Wai3j9WqZEmLSZi0PD3RcECvF+fEsQ7?=
 =?us-ascii?Q?BQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cdcd37-49a2-4b12-6c9b-08dadcf772d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 10:47:36.7631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 530sLaeKtUh0uS1/49a5S3d43I9+ByedP58vT3l4Oby5UExl8LQ4sT4ogs86HtMHwHhqcvJToC58vohLVOoeGtrDbvQevMcMev36fdW1/f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
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
 Abaci Robot <abaci@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Indeed looks like miss. Thanks for the patch.

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Jiapeng Chong
> Sent: Tuesday, December 13, 2022 3:22 PM
> To: jani.nikula@linux.intel.com
> Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>; intel-
> gfx@lists.freedesktop.org; Abaci Robot <abaci@linux.alibaba.com>; linux-
> kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; daniel@ffwll.ch;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@gmail.com
> Subject: [Intel-gfx] [PATCH] drm/i915/gt: Modify mismatched function name
>=20
> No functional modification involved.
>=20
> drivers/gpu/drm/i915/gt/intel_engine_cs.c:1306: warning: expecting
> prototype for intel_engines_init_common(). Prototype was for
> engine_init_common() instead.
>=20
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D3442
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index c33e0d72d670..dfcd3a91fbe7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1292,7 +1292,7 @@ create_kernel_context(struct intel_engine_cs
> *engine)  }
>=20
>  /**
> - * intel_engines_init_common - initialize cengine state which might requ=
ire
> hw access
> + * engine_init_common - initialize cengine state which might require hw
> + access
>   * @engine: Engine to initialize.
>   *
>   * Initializes @engine@ structure members shared between legacy and
> execlists
> --
> 2.20.1.7.g153144c

