Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F3153BAC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 00:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB1A6E25D;
	Wed,  5 Feb 2020 23:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2847C6E25D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 23:10:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 15:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; d="scan'208";a="344134500"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 15:10:29 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 15:10:29 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 5 Feb 2020 15:10:28 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 5 Feb 2020 15:10:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 5 Feb 2020 15:10:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9ts4IwvZT1vXA21P0czwxhZ3LuLA5UPudMtCBICdGqaDxAfCIxtVqCJe5FO1xuMDJRvsvz/Wa6NXr4mG29sRkP2lREszgP5rESdaF02WIi32lwIGLP8/Q86GHmS5F0brJdxjQMqlaM7rabU/gPuAo+WeREIvUfnazUMxXZa/m4Jl3I/8ZN8/9LPznpCTwAXhxJgSQlj1C8L1rJv5b3SvHgzTacVyCSoS38ruoA/E+JrXBmkunSDuKjjSK8mScHtrxG3fvYaRgev+sKo3BtwnIwWEKzVoK/BbT/nMBD7rlyjJIYSb+tmenk1bj/7rvb+mPYhWHGNndyUHUJjQ3IAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcsJdQAcWtQ6QfyO2zCUvppb+km66KpGuzmy1WhibtI=;
 b=STp5NsA8Aa/g9pl1h/Dszfb5rQCqOITbK2kOzvIjFiUATLVYiMh/uuw3SPJ6zos6wT/F7Z4cfqusFXdiKDj6JM8rPhqUsH3NBSOJxk5L7/1p4TSkB7lUV1beg6IKOCd/P47Xf9iceLzHtpySRpHw5jMkGi1r3ypoErSMutxhY9CLPT8NIgHMaAy4HGh/oURvxnPYJ/kQ2U1gYhjH5MXdiJGXXv24XSdbCmXYWmh5a9mQkHH25H+QPHRHyUETDOYK598F5imz7Du7C/GF4nN7tuuXZM/1u4rlo5hb/Gpe4bEoCuGSeZgFOYCeK1c7hghLxlwlfP+1pR3lA0M2Bp5lvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcsJdQAcWtQ6QfyO2zCUvppb+km66KpGuzmy1WhibtI=;
 b=HdqfCj29ZoLhfFc4pS+tPCpp6dH+w9mNJY+6F+6dGaOhs5G7EhTlyzACdC82BeKZDlBhpOVJOfxebMMV8Dpr9PeZSgZ/AvKFvCiuDJhbR06P3Nc+25sSREBOwSRNOeg0Xa3Wl2l0W6NCWxPLLS6Ed8PEqUr9Ioc9sT93QAfmbSY=
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (20.177.206.225) by
 BL0PR11MB3460.namprd11.prod.outlook.com (10.167.240.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Wed, 5 Feb 2020 23:10:21 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::492c:276f:613a:54bf]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::492c:276f:613a:54bf%6]) with mapi id 15.20.2707.020; Wed, 5 Feb 2020
 23:10:21 +0000
From: "Li, Juston" <juston.li@intel.com>
To: "Engestrom, Eric" <eric.engestrom@intel.com>
Subject: Re: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
Thread-Topic: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
Thread-Index: AQHV2H9fZhZKUlA9Y0G5IcqqVMKC16gNNXWAgAAMawA=
Date: Wed, 5 Feb 2020 23:10:21 +0000
Message-ID: <e7726590ddb5c8007f3d146a7182927d8b0d0050.camel@intel.com>
References: <20200131214109.6323-1-juston.li@intel.com>
 <20200131214109.6323-2-juston.li@intel.com>
 <20200205222553.xi6uv43a4hfgleqi@intel.com>
In-Reply-To: <20200205222553.xi6uv43a4hfgleqi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=juston.li@intel.com; 
x-originating-ip: [134.134.139.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bbb9485-eaf5-44ea-a04f-08d7aa909313
x-ms-traffictypediagnostic: BL0PR11MB3460:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB34605865A2DC16A6B6DD6030FD020@BL0PR11MB3460.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0304E36CA3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(8676002)(6506007)(86362001)(186003)(8936002)(6486002)(6636002)(81156014)(81166006)(36756003)(26005)(2616005)(5660300002)(71200400001)(66446008)(54906003)(37006003)(316002)(66946007)(66556008)(66476007)(6862004)(76116006)(64756008)(91956017)(478600001)(6512007)(4326008)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR11MB3460;
 H:BL0PR11MB3410.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QoZduYl39uIsAICgk2++yhRgNdGVQit1f+pZK1HjgcVxDy4+eCl7TLXDVkeg3TRHU/FtK64LvwQfWpw6vg8QuqhWYsxqf0Zn208qvMpviQ70uN4p4QOvyxHmZM0SARaWURqzW3aoyJ7ER7j+0oWDiBr2KLkVU4uvH0Ku8Ve1GEkrydJL4PNEv/Ln5+mv2WvYESsvf9dkvTR8ayptLt2ujfTZKi1qoCKgoLBJ+gHgvFImYkTO98O5muBY3uzWslhiwm5+sHRz2P9BMPSNarsg20r0uzYuX+MCj1CVsyPIqM7X8jtNCfxE0DlNVjhIMAfnfhh6VyoqKeHocZVpdCIZiLrKa/UrsqLY5I9uhZRNGcjfzRba4LrCZ/plgYQ5OTvMQMQJSPkUPFMSwptR+74hMfsqtenv8oF/uis+7g5RtCrmzuLMltyz9dMddbhZMIKY
x-ms-exchange-antispam-messagedata: VxHejkzXyy2nFCXa6Vek9EPHTtkOnqFU1HyiNPRDFFpM4CrgaIoDYrVPbbSEJvX9Wzj+XUb8EUaR8HYMoNd8ii0QyrKjM7BTlqcFOynHhSWg+m3uTuGkChhksdQqmwPtc7XlXUKfWZG/mf4JVCPFxg==
Content-ID: <E9F956B35568EF4E8D40E725867F202C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbb9485-eaf5-44ea-a04f-08d7aa909313
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2020 23:10:21.3295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPShlqyuHMnszdKuNX/2mBKwMtWtHu5IYC2QT++kV07Q0L+6suPKPwtzZ5usBu66g/tXKNOFWKe8sulqLQUMGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3460
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
Cc: "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-02-05 at 22:25 +0000, Eric Engestrom wrote:
> On Friday, 2020-01-31 13:41:09 -0800, Juston Li wrote:
> > From: Daniel Stone <daniels@collabora.com>
> > 
> > Add a wrapper around the getfb2 ioctl, which returns extended
> > framebuffer information mirroring addfb2, including multiple planes
> > and
> > modifiers.
> > 
> > Changes since v3:
> >  - remove unnecessary null check in drmModeFreeFB2 (Daniel Stone)
> > 
> > Changes since v2:
> >  - getfb2 ioctl has been merged upstream
> >  - sync include/drm/drm.h in a seperate patch
> > 
> > Changes since v1:
> >  - functions should be drm_public
> >  - modifier should be 64 bits
> >  - update ioctl number
> > 
> > Signed-off-by: Juston Li <juston.li@intel.com>
> > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > ---
> >  xf86drmMode.c | 36 ++++++++++++++++++++++++++++++++++++
> >  xf86drmMode.h | 15 +++++++++++++++
> >  2 files changed, 51 insertions(+)
> > 
> > diff --git a/xf86drmMode.c b/xf86drmMode.c
> > index 0cf7992c6e9a..94dc8ce38a5e 100644
> > --- a/xf86drmMode.c
> > +++ b/xf86drmMode.c
> > @@ -1594,3 +1594,39 @@ drmModeRevokeLease(int fd, uint32_t
> > lessee_id)
> >  		return 0;
> >  	return -errno;
> >  }
> > +
> > +drm_public drmModeFB2Ptr
> > +drmModeGetFB2(int fd, uint32_t fb_id)
> > +{
> > +	struct drm_mode_fb_cmd2 get;
> > +	drmModeFB2Ptr ret;
> > +	int err;
> > +
> > +	memclear(get);
> > +	get.fb_id = fb_id;
> 
> As mentioned on IRC, could you write it like this instead?
> 
> 	struct drm_mode_fb_cmd2 get = {
> 		.fb_id = fb_id,
> 	};
> 
> With that, consider this patch
> Reviewed-by: Eric Engestrom <eric@engestrom.ch>

Opps I sent v5 before seeing this but my code style differs and is
probably incorrect :) I'll send v6 with the style corrected.

Thanks for reviewing!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
