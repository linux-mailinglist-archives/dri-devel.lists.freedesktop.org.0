Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A8154A77
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 18:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F5F6FADA;
	Thu,  6 Feb 2020 17:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69936FADA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 17:46:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 09:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; d="scan'208";a="232116172"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga003.jf.intel.com with ESMTP; 06 Feb 2020 09:46:41 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 6 Feb 2020 09:46:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Feb 2020 09:46:41 -0800
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 6 Feb 2020 09:46:41 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.58) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 6 Feb 2020 09:46:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1ixo+Iww3ZT8+WYf0ZN+iEJ32RDjzd2mDzHor1EV5DbO9Wk20YtYP/7DMzic1w/94r9isJCMATmN1D8EqNJNuUxRKt11lK6DX9+MxH16ybrIzsw6jvnt7R86ehOqnfCNxdu186Lf162UwvhMNl+V4iFIhZl4O+gqHurqnaSij7z4uDr/bOd6mcbG1m36m5N70xt1zdw7Fj0Og/+5vik1pMXbFEsAXYohb4fpbYlsG85eGI6P+FrA4yFPzaovchAEQDdR+QBkjU0p7zSjdrWWHFuDMIGALViDdiYTko2oyeEXx2LxjGJU+B46TA6ZAOkZLm0a9eca/js3ijxQNQnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6pJ65cu8EUFoj8Zpst4g29kw3rsnER/mZuaAemq+dA=;
 b=Qetx0uNsD8A9+7LxbDlLFbJZIhJcXeUM24/8vi8myma9ny+PMeH0S2tjCSLSgT+6/UEX78RVX2mMCgpUGYJ/c5dIBI8yHKbXM3kkBQbAdmY0kovWQUsjLu3TI/dhejcg4Q5WlDVS8SbMMdOOjnOaNHZoItjWxzKDO19o8AuUOvsPRqWmpJikUhqMKP1+Lphk+yX05VCKRFr7mC1aUQREipeP/MGrw7PxIH+2KpIWo1x0XFisttlOlHTB2Y7JZRLpt6E8VkyDLsMSBk+U16+33pFYL3NhSRWkArlWeJse5TIyqcCfcAhplFjZ3hYjMFmyv3kt0elsX9ldAMw7DOfglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6pJ65cu8EUFoj8Zpst4g29kw3rsnER/mZuaAemq+dA=;
 b=i7qkmMX5/z9ITSbal4gZjhSk3FAnh8LIJkW/mWDqM3nb4WYic8Rv8ipQWQ+83mApIcU3KSMs5GHPZGvDrztV00tJQOdfiCz7e8fGfT3/kl08hx6vl0WF8psS1Sho2zYLs/SQWymP7QDI9zKMod95t8rQ8J5ru2lA22rZsP/yzps=
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (20.177.206.225) by
 BL0PR11MB3411.namprd11.prod.outlook.com (20.177.206.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Thu, 6 Feb 2020 17:46:36 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::492c:276f:613a:54bf]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::492c:276f:613a:54bf%6]) with mapi id 15.20.2707.023; Thu, 6 Feb 2020
 17:46:36 +0000
From: "Li, Juston" <juston.li@intel.com>
To: "Engestrom, Eric" <eric.engestrom@intel.com>
Subject: Re: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
Thread-Topic: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
Thread-Index: AQHV2H9fZhZKUlA9Y0G5IcqqVMKC16gNNXWAgAAMawCAAATHAIABMxqA
Date: Thu, 6 Feb 2020 17:46:36 +0000
Message-ID: <d3799f09639f763f548ba7fdbdea604c2c29e7f7.camel@intel.com>
References: <20200131214109.6323-1-juston.li@intel.com>
 <20200131214109.6323-2-juston.li@intel.com>
 <20200205222553.xi6uv43a4hfgleqi@intel.com>
 <e7726590ddb5c8007f3d146a7182927d8b0d0050.camel@intel.com>
 <20200205232726.eoiiije62mdzv6tu@intel.com>
In-Reply-To: <20200205232726.eoiiije62mdzv6tu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=juston.li@intel.com; 
x-originating-ip: [134.134.139.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50c26623-9164-4329-d6fa-08d7ab2c8316
x-ms-traffictypediagnostic: BL0PR11MB3411:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB3411B1DCB21915C1A8675F07FD1D0@BL0PR11MB3411.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0305463112
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(346002)(376002)(39860400002)(189003)(199004)(4326008)(5660300002)(66446008)(186003)(6486002)(64756008)(2906002)(6862004)(81166006)(81156014)(478600001)(2616005)(26005)(66556008)(91956017)(76116006)(66946007)(66476007)(6506007)(37006003)(54906003)(8676002)(6636002)(6512007)(86362001)(36756003)(8936002)(71200400001)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR11MB3411;
 H:BL0PR11MB3410.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fbezMTxri7/v8gozUdaQmRLGpBMCIaIfKL5VbkvG+gPszn8IwiNC/jPGBrQcuArfDBjdWdWWiyOdpLWalGeeIqNF74orzsUHghFs5MYjg0lb0GyHcam+zLgwHJJbQJehmi3w6vVD6yRYVgqw0iqLNBnDp4h5S4As0wq+VWmN+Ej3GiDgEi4jT0Fh78bFyCY8UwubsXQibPBn4yx7A6zk96+6Ni5OLjLWyHtxkIxwVjWpG5izr4Tr4Po996JYdxIkkyDyeVMa5Xl4Ac5JIRADOV42NlqvxgYdu3EkiI0Jc1PIfM4F2kWp3MgfOIBL+rO0b3rVGkJ4S+536T6Ozokay8Q9o95TWXa3Mbx9QM38DzW8Y+ztKL+KW3l5Dd5WCm2ASEJx98iJAQafjrg3cDLn82DivTIK7pVq2kBEscPf9FXe/OiR4bWZBw7I/OIQLjyF
x-ms-exchange-antispam-messagedata: 73N62pxNyPctmFqow59MKHXJRkv4XkvLjpmdkXTQF2WL1bp8wndI78Rfimmfr/tSEyeULqtKlX9oBdOn/iDs6oL2hsJUV3OjpQ5w4nQ5Bkc0nx2cPgJ5WLsWCGx9uBSXel7fVCXLO46KhnCVFiRpig==
Content-ID: <60FE19616C59F44E9C62D203B3D76DAC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c26623-9164-4329-d6fa-08d7ab2c8316
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2020 17:46:36.1407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjMv3TUURSlMi290soq5xRh1Ak/YCB7H3O6XIex5Ld/7zM6mTlaglLmNOXQG2DSajI+8hpurf15y/UovhMJAqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3411
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

On Wed, 2020-02-05 at 23:27 +0000, Eric Engestrom wrote:
> On Wednesday, 2020-02-05 23:10:21 +0000, Li, Juston wrote:
> > On Wed, 2020-02-05 at 22:25 +0000, Eric Engestrom wrote:
> > > On Friday, 2020-01-31 13:41:09 -0800, Juston Li wrote:
> > > > From: Daniel Stone <daniels@collabora.com>
> > > > 
> > > > Add a wrapper around the getfb2 ioctl, which returns extended
> > > > framebuffer information mirroring addfb2, including multiple
> > > > planes
> > > > and
> > > > modifiers.
> > > > 
> > > > Changes since v3:
> > > >  - remove unnecessary null check in drmModeFreeFB2 (Daniel
> > > > Stone)
> > > > 
> > > > Changes since v2:
> > > >  - getfb2 ioctl has been merged upstream
> > > >  - sync include/drm/drm.h in a seperate patch
> > > > 
> > > > Changes since v1:
> > > >  - functions should be drm_public
> > > >  - modifier should be 64 bits
> > > >  - update ioctl number
> > > > 
> > > > Signed-off-by: Juston Li <juston.li@intel.com>
> > > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > > > ---
> > > >  xf86drmMode.c | 36 ++++++++++++++++++++++++++++++++++++
> > > >  xf86drmMode.h | 15 +++++++++++++++
> > > >  2 files changed, 51 insertions(+)
> > > > 
> > > > diff --git a/xf86drmMode.c b/xf86drmMode.c
> > > > index 0cf7992c6e9a..94dc8ce38a5e 100644
> > > > --- a/xf86drmMode.c
> > > > +++ b/xf86drmMode.c
> > > > @@ -1594,3 +1594,39 @@ drmModeRevokeLease(int fd, uint32_t
> > > > lessee_id)
> > > >  return 0;
> > > >  return -errno;
> > > >  }
> > > > +
> > > > +drm_public drmModeFB2Ptr
> > > > +drmModeGetFB2(int fd, uint32_t fb_id)
> > > > +{
> > > > +struct drm_mode_fb_cmd2 get;
> > > > +drmModeFB2Ptr ret;
> > > > +int err;
> > > > +
> > > > +memclear(get);
> > > > +get.fb_id = fb_id;
> > > 
> > > As mentioned on IRC, could you write it like this instead?
> > > 
> > > struct drm_mode_fb_cmd2 get = {
> > > .fb_id = fb_id,
> > > };
> > > 
> > > With that, consider this patch
> > > Reviewed-by: Eric Engestrom <eric@engestrom.ch>
> > 
> > Opps I sent v5 before seeing this but my code style differs and is
> > probably incorrect :) I'll send v6 with the style corrected.
> > 
> > Thanks for reviewing!
> 
> Ah, sorry about that, our emails crossed paths.
> 
> As for the other patch (I mean 1/2), did you follow the instructions
> in
> include/drm/README, specifically the section titled "When and how to
> update these files" ?
> Your commit message makes it look like you just applied that one
> change
> instead of syncing with `make headers_install`.
> 
> Cheers,
>   Eric

Yes, drm.h was copied from 'make headers_install' from drm-misc-next.
It had been updated fairly recently so GETFB2 is the only delta.

Sorry, I didn't see the README so the commit message isn't exactly as
requested.


Also, only drm.h was synced, is that preferred or would it be better to
sync the entire header directory?

Thanks
Juston
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
