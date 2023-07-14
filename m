Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5326753168
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 07:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B1C10E158;
	Fri, 14 Jul 2023 05:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A4610E12E;
 Fri, 14 Jul 2023 05:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689313420; x=1720849420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uO6U+nOeWq/NzUloluEPk3hoSKEpe+BRQ3tELzmLM/A=;
 b=a1KM4Cw0rlZ+7N18kN+8M8Hr5oGSyg2DyHOTmFAOoxWgzN6iOj74IOwf
 PJGOU39+yc5yzX/3z37LU3Q+Sg3P62ff4bELvVvsvN2Eij9wOVMjcvw/g
 zYTjh8MRSdJpjgcMEpwEppDPbmif2iR5QpMjoi0lzxz+/tmP29WoOUivn
 B5Ze0y98KuK2EmH0jQL5aSV4ZyDHQiFql4iiKgL3etOAmh+V3eI3wgCmX
 +6NEM13hWULvZnbaDp3sKh1xlSZ08JrseNzqKabsJiW29bjdIwxcnxy+s
 Paw0VQhiUFpXF4gC7TuX3ooaaoQdJiENRepn+eEMuli0yXEBs45lN//6z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429161753"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="429161753"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 22:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812301302"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="812301302"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2023 22:43:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 22:43:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 22:43:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 22:43:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAo6e3De2wz+gvSZI+HaRymP4weQKlx3zFYKF0L3+dtrKZ3V7pBp8tXzZeU2tBEpvvYw8P6XcQy0Lf9sj3VP8Bv97jvGZl6CcvRg78olGF37IBKJzv32TRSaoXYxD0Dmb3ssJPzBPPlexJT0ysNSkbinKJg4qZ1G6Iip0GxyPeh9PYJnlANFzWp7A7nqwTFROB2XvI054DoYJ1h9x/q/ed+fDSHmtDokKy4WYcEwzEcEIkSpynlZT31ydFtCsoxLk9hsAs3L9YZKBtjTnWs1fphHrBX0JwAs6941B5uLPxlGlGO9B3C5LcmDfWFgEFDN4vPtalOUIdc9YTWYRfAZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ioyNn/f4GUcgF0Rq9QrzMzqTL1HOYLwlSVcUnmIsIM=;
 b=NcbN6VHJsQGJnJmZskmHoTur6VHzMbfCT8iYfB6525YO8p34EJpKEYFaQgW5E1EPKEdZCblZxvD2A98+h9STn1GjLdKuUqnsf461eX/nOO2lwJ1A9gtfYTBhV7Knkfq8pHNS/otoiL3wv5x6bF4fsMYHloQ9X6VP5D1hJc7/SPh0UgunDpBKCchVOCbmXAs1E0Zrmc9cwYTFV6hmtLow7jafzKpeb4SFLtSnm7mOCksaASNQz4X0d+g0MD+P34gGr5jX/8KVsLVuqpbweibR4XFxRQCW7wi7LHIYa5jf1DLC7fxdbFB2tzlHMh5tLRq7G7qFOFtzj2E62eeh9f0IQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Fri, 14 Jul
 2023 05:43:29 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 05:43:29 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Thread-Topic: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Thread-Index: AQHZtZ6PZtvICDXm90mKUClmafRLYK+4v26A
Date: Fri, 14 Jul 2023 05:43:29 +0000
Message-ID: <BYAPR11MB25673D3525AF7C5A5FFB44129A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
 <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CO6PR11MB5633:EE_
x-ms-office365-filtering-correlation-id: b1798687-5a41-45bc-33b3-08db842d4096
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0/ZPHs6DYAHrzVkmXtir9Odh8Q3Ijigx00qUYEo/YgSlYXZ5fC4Entl4Cpf2+WSkwZc/o+y3G/IdHpXFrdv0A1jH2YNlzLYOh/ZhuPNvVbG/xkFdFfAgPlkyO3RYsBLmFGlcEW4t70+QuktZ/a5xkkeXmRKk6h54C3Bo4PJSGDtCeBXRjBseULvyb336REcF83VhrhkdZMUGncbPudrgLRTGQ1eg43973pfdMsyC2OgTvX+TTrBNTRNHpTdp4RUSLIH98z0eQfTI0ZLoWxDsedER6dIP6tKgcTcG7LwGF3WcX1pMS51PhMnae5YX28oMSa5QuPsJUxrBHmQr1G3dk04ayr3Iiz+rNJ44nXcbkgVpmNWyU9rSAzxaY7HKwAkxrO1bMeiURQWy5eZF4lgS2ckI/eezRurAiAiGr1nxGTP19E83MsXPrHJ0csF3pTjva7ZgXDoQeqckuUQX46NnFhTmWErFV2er7fLan/1YOuWrzzpLd8TlLjUQZ2MmAipvjT5FKW+M1IULHNjs9faSH5ZXU+sCexFiIAsGKY6airgYnEJi6q4y1V4b1821R4OwV8GZMSR4VmdohOfIG6NPpGFr+C2/KVOAbRTVA/3uWchHuDKysJOoi+rUPaMbztEs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199021)(54906003)(6506007)(478600001)(122000001)(41300700001)(26005)(186003)(110136005)(7696005)(71200400001)(86362001)(66446008)(66556008)(76116006)(33656002)(4326008)(64756008)(66946007)(316002)(66476007)(9686003)(38070700005)(55016003)(82960400001)(5660300002)(38100700002)(83380400001)(8936002)(8676002)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JtTzyi34/OSPp7BMO6/Rw8NOW0jLDmx/ss31lNMvQMdQRv07Pbjc5Bio54Os?=
 =?us-ascii?Q?gT/eQyZOA1RJpb9dGp0zsR1tUA9qoNgIDn+wuYJRrIWfs1Zg6/LsDgy+9Eou?=
 =?us-ascii?Q?ZUMJvQq53bg3pSQpYZJlJ16dGuvsJhYUXENI35l6+gGK2Gs+JKXOEZP8RGEY?=
 =?us-ascii?Q?fE6SKGpkQVGuT36MaaY6coiHVUFMGLX3yWanD8lcmE+SCfnlxrNU1p+ASJij?=
 =?us-ascii?Q?S8/Hi4dh/qKr9Xj3AeB4mRRyEugc0b11FJuVYIJS/6q1+P2HCpyPlJpqowrS?=
 =?us-ascii?Q?ama7HbocQiMg8nkaKkAk53mTqDV16M3xNtgqDvsVK7dqQ31IhCOBx8gUmixz?=
 =?us-ascii?Q?NUqxjWHPqV9XuVeQiitxULnP0RIfBVwihhdc/Ddch6dmScyKFa6trgFxXly/?=
 =?us-ascii?Q?LUYV6QgdakNmGrgTgbAcJybLlxHsQW/f+cqWAfi9S9yRFEmcmsX/0TP50Zmw?=
 =?us-ascii?Q?EG8vkehnCKrskYiYR/FMbbsTLX8v9JuAP5/KjY34yknj9ROnEi/IQGEGhoNS?=
 =?us-ascii?Q?DdU5V8uazh/9MdkA6kHBY4KRRB6yrmP0HvVKmWaN9H9Xj3bsYvHDp5D7Cnub?=
 =?us-ascii?Q?HLsezKjS9ccqD3xop/TKHH/9ZrJUWSS13p0p0Ki+/77QU6fswK/It2h7Hujh?=
 =?us-ascii?Q?aHwe3Fje0FXZj+9N1lmq96PT39VJWxr1Z1NNQvBDr/ZSXBVz6mbyHl6ZCdhX?=
 =?us-ascii?Q?vWk8jXDFI/4RBsKd5qZJIai/aFB2AFHhKBBNtfDpA/5RNqBDIxLqIdtyfjbr?=
 =?us-ascii?Q?wCtLbGmKUV9ZEdAHcn6rgoFd4jUGn31v8WHbW5VAZa156J7Rl7iSO6U6opJg?=
 =?us-ascii?Q?f2TpxebXRCrlQCgX5dbPpe/zZLES9EdWEvFhgd50LxkpNvOfsDNew5Q164t7?=
 =?us-ascii?Q?2yzPAA8YjsYmuPpwbJg6nqlPz24aTIZ83PliYeOJQVrwKvzJ/2j9jOpqGmZv?=
 =?us-ascii?Q?E1CmMmgLHNJSYUmn42ocEufoAGFH2sLZp0iSmaoPB2XPPnMiNpX+xZo4rsAM?=
 =?us-ascii?Q?iuOvBYbmTCvLClnDVaA/QUZiJP/mNdUH9tgrqzkS0jWhJrWlzk6geqzh4G4B?=
 =?us-ascii?Q?j9iA/ciiCEJZJryWBmnq+Iz/xp0EToJHbcDQ5Ssxp/UQSxhL17ao9p00UE+7?=
 =?us-ascii?Q?0Ralsx9INnxwY6EHVyqWQXRpqOsFddS714v9dZJKSZ8C67nP8RA/FMS4U3Bd?=
 =?us-ascii?Q?/uUuWdzQOtZQtq2w32dxh0lki4RX+QZACn2P2+tcqJ86nlwHzko3dCbpqtay?=
 =?us-ascii?Q?qqnBAHZFa9ZyaMBxtLk/kEzf/iR2uo6dVjC9Kl/U13rDsGCNt3/BZvnrqNde?=
 =?us-ascii?Q?atcnA8QDEeVV3fTsr8yi6QS1VnbhEy6lIyakUEyjLpUHKZanrF4m+QAMTpg9?=
 =?us-ascii?Q?Lfi3D4WdrWGyU0n3br6feFDeem1pa7cN7JtOg2V0tMChIEBCFQeCp10Ym3Uo?=
 =?us-ascii?Q?U9Q6tXSdb3n0SmNQLbUaN238ysGUS4fX5TDmHJ68ONqapH7qBkPIBKtiZrG4?=
 =?us-ascii?Q?vd2DDPaox0HRhknBB2plEtnLFhUBEJls4rXacBtp8AAUjkhd9fYhGcxbTXAZ?=
 =?us-ascii?Q?8XnrdWkt9hEE1pbN1eQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1798687-5a41-45bc-33b3-08db842d4096
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 05:43:29.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pe2VsL1Lbk6Z94wUk6uBg+hXsYkgO78VAr8ho5lY9SV6dOnTHsrzybtWRSufe8W/OnR6Z3HlfMKwFeb0IF2DKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5633
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> According to the comment in i915_gem_object_can_bypass_llc the
> purpose of the function is to return false if the platform/object
> has a caching mode where GPU can bypass the LLC.
>
> So far the only platforms which allegedly can do this are Jasperlake
> and Elkhartlake, and that via MOCS (not PAT).
>
> Instead of blindly assuming that objects where userspace has set the
> PAT index can (bypass the LLC), question is is there a such PAT index
> on a platform. Probably starting with Meteorlake since that one is the
> only one where set PAT extension can be currently used. Or if there is
> a MOCS entry which can achieve the same thing on Meteorlake.
>
> If there is such PAT, now that i915 can be made to understand them
> better, we can make the check more fine grained. Or if there is a MOCS
> entry then we probably should apply the blanket IS_METEORLAKE condition.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index 33a1e97d18b3..1e34171c4162 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -229,12 +229,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_=
gem_object *obj)
>       if (!(obj->flags & I915_BO_ALLOC_USER))
>               return false;
>
> -     /*
> -      * Always flush cache for UMD objects at creation time.
> -      */
> -     if (obj->pat_set_by_user)

I'm afraid this is going to break MESA. Can we run MESA tests with this pat=
ch?

>       /*
>        * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make i=
t
>        * possible for userspace to bypass the GTT caching bits set by the
> --
> 2.39.2
