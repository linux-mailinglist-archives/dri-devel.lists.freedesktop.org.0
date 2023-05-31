Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E1717FDD
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2710E4B8;
	Wed, 31 May 2023 12:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679310E4B6;
 Wed, 31 May 2023 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685535852; x=1717071852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9s1Hn2mWj7tYmjJZbl6SDfu9Zpngyu1lvN20S+hmK2c=;
 b=PGGbBTBR37wqy1fKEn2SuYXPEGNj6AHncwf45kbymvwu8h4/+PeQNCIT
 /eGac7s2xXmKmpEq8admQ1bPBCJdwDoCZO3rYQgGl9H7bTNb3hZQAIrdx
 p0xB8X2qccOBXM9YuTkb//4aE+1cTRH52PMmykWIf4KT7S0F5+HdwnkAS
 itzcks+RnPBG2F5z1gD3WV0RpLDA1rtz6T/R6PKPG0s3MCodZpCNYjcxj
 ld2iB4hKVsTG46iPy9uJSnGsyiIUonbCrHabRC2/Eb76PbklDvUITplNb
 Wi5f5QGG/wf/ZIGGDDPORoYxkzB6bPCjkrfBPj3j1Jq7X3CSOyUZedGWP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="355227483"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="355227483"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 05:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="706873877"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="706873877"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 31 May 2023 05:24:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 05:24:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 05:24:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 05:24:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 05:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFWCeKft4QEA9MQENWOwXHHO1hByGQamAeRIpvZ36Nsj/DcxlgzkDE0QkI/fSVcT5aWcZ2PuQCc0t55dt+NKvAiq3z3P6RYYpV+7a1gezYSlmzyp3DKdj6cxm/dy5ZcSTV37c8qDa2dbAN1wIkMMlLz5cOwc7T+76QABU3SJMAEKIZEpEcbakpmMOo5iSFaxOxqHdhMW8GJM00okFl+29FtEt1fNXj5L7wsc2cF8Vb/QGR5G+Ah9or+H2xwlijUEK2EoiYbCGi7vwS1AoSOAQcOnbFbueGEhoa1OwCkt6cUjTeZW90jcmtnMvwXPhXBm+jLhyr1NwpwdSJnFTKI+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s1Hn2mWj7tYmjJZbl6SDfu9Zpngyu1lvN20S+hmK2c=;
 b=bPFbxFHSJWMbGW6j0NSfGIC6ZHfMhPqUgTzdsxkhwo0L6AEgP2OUWp8HygQsRjw/rscroRaTAwwpkHHSTZwdPVvarFlNCv5C6rqr3CueIC/sayKhrUDHAJuidfynll6gD2Lpsu8XOM7WCkJi+NO88n7ATbd8mOUb/9bTJYph+JVxvMEFIb8VZasO+dhCU+IcNShONH94NqQPlqSOJpX6CLfr/sFr1VqMhPiJhTWvIZkjlj0txY7u2xPXaMor0duuo/ZgL7DWV8PfDtuD550p3omI6CbOrVv3y1yWBgj0V8XA1X10CUT97vzDSWAXyey5D45ksK2RNF7ilD5sG2Jp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 12:24:08 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::10b4:9ae0:3743:5323]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::10b4:9ae0:3743:5323%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 12:24:07 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, "Yang, Fei" <fei.yang@intel.com>
Subject: RE: [PATCH v12 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v12 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZk62Zv2EyKeJEakyHR741obl9ka90Stsg
Date: Wed, 31 May 2023 12:24:07 +0000
Message-ID: <PH0PR11MB55797570CFD9E4BDAF395C7587489@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20230524200255.443021-1-fei.yang@intel.com>
 <20230524200255.443021-2-fei.yang@intel.com>
 <ZHcmNnr5p2e7wXYe@ashyti-mobl2.lan>
In-Reply-To: <ZHcmNnr5p2e7wXYe@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|DS0PR11MB8207:EE_
x-ms-office365-filtering-correlation-id: bc7e1730-0b5d-4e17-9d94-08db61d1ee50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4tozaJczSHJWoKAerOy49Oc8Rs4InC9ICpucVezwkQJBjODHWlzoKf8UE8YmxRln5P60vzH8LdBlTNyBV0CEsoqMO0QsgxuJjgpDxrukHPdOMbYe1ZgRU6AKcFLQZG+rFAjE9phBS+rg0WEVuR9+Kmt4c3oBTaz8LVLpO8BQe3thbyjbJpXo0VjphajiYLdHoxASAWMu8yB2jFf+4Zxhl9h2AK8wjKuhJPjSm+5oOzZRnhJOuB/BM5amrCtJ9pKv565z6F8cSCBwfPYsbsDQmaI7axwHas8RYPXgEm84cNsXma6cK27CN50nx+38HiBqLaY3f/2VD2rlbc9SvTOqPiKJdLKEFMAd9c/gjDtYDny86YRw5qH1FWUbNIbmf23DABYrsRNzH0TGv+GY01UYcu50RBIzLRPypHXbOAp1Ytn1iMvIHtTHTI+rdpyvZnbkC9GdTFoXQixd4f3yUHTtuRCs7vp6092K6cHL5ZI7ughkbf0T4mPwDQ6DjWn+vl78MWVCPlbBlfYB8MVo8fjLSmfrHP8ItwHub2bOPPgXpQ9CT7hwCHyz4DZvCghOFIFTQoVFT2a2ZUfnA1MxfgwQzG8TZyOWmFFgfsmD7SUipllminSXbmtjPiX9x7AAD9n6mLjY4YgyUtVyqz4MWPYnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(110136005)(54906003)(38070700005)(66446008)(966005)(6506007)(26005)(122000001)(83380400001)(86362001)(316002)(82960400001)(478600001)(4326008)(2906002)(66476007)(64756008)(66946007)(6636002)(66556008)(76116006)(52536014)(33656002)(71200400001)(41300700001)(5660300002)(186003)(7696005)(55016003)(53546011)(8936002)(38100700002)(9686003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LVyyzjoiflt3tLXzXKsFrsUFykFOXgE1izNQCQCrtFTCyoWShmGev+CAlRK+?=
 =?us-ascii?Q?oqEZETJRFfWIvSgw3cfR3uczLWefXRBIlXMlIWIHx/1VTEEo7/3JYizczMjm?=
 =?us-ascii?Q?HyFr7CMcTk/PtZP8CIz1hHudsmig93wyjOTUyD0gtyYW8FOaQ9BhKGtf5B2l?=
 =?us-ascii?Q?fmCrL2hNpOkhyasRAWUlT9p8w5G4M6YbcmM3+Jk+rWFFgsxT0QuDVQ0kqA+0?=
 =?us-ascii?Q?XsQ6RvcnQsWPoedpJcwFpOPNAkHUwkmP6Rmm5Lgd01y5FAKjUTu2w041jYDS?=
 =?us-ascii?Q?gzzpNrhHy4zoTkWH8u4MCYr2VG6db5hV+zXar58TWntV4tDl8cl2B6wbjX41?=
 =?us-ascii?Q?YujdXFHHDOArucunEGFTeGJ0TBhaJrlBnn4ttcslTjzN5j9jsglhM2V90vqh?=
 =?us-ascii?Q?VL8X5PdOQvnxBOEOO2OxkLQtbdFIHyajicv8yBAea5h+uvvwr3W2T3FO0OAe?=
 =?us-ascii?Q?hoHHGbi9Gifdp6uDtRIc95atxRneCFeLzyNoRMAQnib5eGvjY3lwtlF7nu58?=
 =?us-ascii?Q?gHuos1SpGiUSPUPQ6njlSMsjgLJJez+xbZ9rr8qo1QzSB/vYVEg/UAArhxV9?=
 =?us-ascii?Q?PunARhMw07Gg/9Vxs+reSjexfy6hQ/cteA1K+naoWqV3DHXu5TaepPCmns4Q?=
 =?us-ascii?Q?sQsa4t6+K/ESF6BMgPYWqs2Xe5ihXHjnaMt1yjuP7hKpP04bUUUy1B2wSyxZ?=
 =?us-ascii?Q?lo/8WdYenTl6Co/JEDO4Jji11zuNxWgi+mQKmZBRhHLUM525ZTyD53h4M/Tj?=
 =?us-ascii?Q?qz6buO88FFuWdWwqDrBcbf6Lnow0WQGBFWFdM587fID8PAxlsBxrNm4+6uKx?=
 =?us-ascii?Q?8CFlcMKQm1en1q7ymsvZ64KQ+SIspUeRQcE4BbYZGO0aFXGTJF+hlqM4zQnd?=
 =?us-ascii?Q?/sXDNjYBBhh2d1hbhDvZTcc84TSw5Uu1sDhuj57Zp+eGdBYirmStWWW7j7ah?=
 =?us-ascii?Q?gokafDbd3nqkH4MuQKLhXz8jLtuB4zvWASGKG0Xi51cJCM7yy7BR/qA4LMfk?=
 =?us-ascii?Q?IxfyO74SqUdpuh7VT7UQhyWIIOLpohYhu9s61wK3iuZfG0dtXOrIubbOCL0L?=
 =?us-ascii?Q?sy4/YZOSj2sksQMkENNU1zNF0Rv1M2ZEwN0seviJ9vKHVmZsvH/Xy0QT/dRY?=
 =?us-ascii?Q?HjLZ06WitaPYukRim5Eni/mVmweVb8b5WA/7dmJA4+GNgF4LDWtHTTKluob4?=
 =?us-ascii?Q?WWKM4kFYsZ3cALrqfO3beBHkNxgnmgS3+0A49I+61FcniUraecfmwWyFgVQI?=
 =?us-ascii?Q?IY1lJd+NepgOUCfWXNR9QVxtO8jKN+xq4djOnLwr/jMebtdaxYvmrQ3T9OQj?=
 =?us-ascii?Q?QTQNau327kv03w/k1V5nW09jyZz7EGcPXB2L5Fej54PF+63NCOWfdM9gu18t?=
 =?us-ascii?Q?QiCteyXDUn3jNGMTdQlovIX7mJAMFsLBoaxy+3PtgOOokEQuvp3kX6WSbi83?=
 =?us-ascii?Q?vGh/1DMYgBGjN+G5YXXdEXrwjltpyh6CEnwpSXj6BDiRPG6nK4/s/BixYr4X?=
 =?us-ascii?Q?a1bW41fZv4xMUOgLOrRSFGaNtacWufjf62UxIsDKnT7w87U/IQiS0c3ZABPb?=
 =?us-ascii?Q?DHPE9HxlmpCWkkDgpYD3XhlyNOftCg/nkDPvogIz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7e1730-0b5d-4e17-9d94-08db61d1ee50
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 12:24:07.6915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zFA9TaoZS+SjnhIg+bDJ+L46g/3K9iCYv6nGfREjR6b8b9BN1d81qFhZSU5jzhe5+fxONaoztEyCMV9r4XYbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi & Fei,
We verified your change by UMD change:
1. implement the uAPI by
 https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834f4=
73c6fcb6341
2. old kernel may not support new uAPI, so UMD try the interface firstly, i=
f it failed, will fallback to older interfaces
https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff797b3=
134aadc9fd
3. removed some check for CPU cacheable and PAT conflict=20
 https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8ae8=
5430e548000

after that, UMD works with your patches serious on MTL.

Acked-by: Carl Zhang <carl.zhang@intel.com>
Tested-by: Lihao Gu <lihao.gu@intel.com>


Thanks
Carl
> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Wednesday, May 31, 2023 6:49 PM
> To: Yang, Fei <fei.yang@intel.com>; Zhang, Carl <carl.zhang@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Viv=
i,
> Rodrigo <rodrigo.vivi@intel.com>; andi.shyti@linux.intel.com; Chris Wilso=
n
> <chris.p.wilson@linux.intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Justen, Jordan L <jordan.l.justen@intel.com>
> Subject: Re: [PATCH v12 1/1] drm/i915: Allow user to set cache at BO crea=
tion
>=20
> Hi Carl,
>=20
> On Wed, May 24, 2023 at 01:02:55PM -0700, fei.yang@intel.com wrote:
> > From: Fei Yang <fei.yang@intel.com>
> >
> > To comply with the design that buffer objects shall have immutable
> > cache setting through out their life cycle, {set, get}_caching ioctl's
> > are no longer supported from MTL onward. With that change caching
> > policy can only be set at object creation time. The current code
> > applies a default (platform dependent) cache setting for all objects.
> > However this is not optimal for performance tuning. The patch extends
> > the existing gem_create uAPI to let user set PAT index for the object
> > at creation time.
> > The new extension is platform independent, so UMD's can switch to
> > using this extension for older platforms as well, while {set,
> > get}_caching are still supported on these legacy paltforms for compatib=
ility
> reason.
> >
> > BSpec: 45101
> >
> > Test igt@gem_create@create_ext_set_pat posted at
> > https://patchwork.freedesktop.org/series/118314/
> >
> > Tested with
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> >
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>=20
> was it your intention to ack this patch?
>=20
> Thanks,
> Andi


