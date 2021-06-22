Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88A3B0BD1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 19:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6536E86E;
	Tue, 22 Jun 2021 17:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A336E86E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 17:46:51 +0000 (UTC)
IronPort-SDR: bRhsLYtsNzVVFsGbN77VSI/598+q+8r9zG2NrKUP+H8oie9VFQ4A+wUNJZyls2pVp63/KQXuue
 r9m1o7uYGQeg==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="187490950"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="187490950"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 10:46:49 -0700
IronPort-SDR: hMBDPb0aHr3TIDAUXsXo52Q2CD/Ei79Sb6R+SeUSPLgzT86VUnq7rbDFbWULR6lcQ4c2pYl9r5
 RkNfJkT8mhdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="555862380"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 22 Jun 2021 10:46:49 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 22 Jun 2021 10:46:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 22 Jun 2021 10:46:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 22 Jun 2021 10:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhuHCy69hPBgMEFWocr+wdLqGTG/G4MAkk8Aa2UCpfx3QU7rNN+oVgpjsLLXceZG3V6v8zUoFLSkN1pl2KStBquSBqoeebUoAGeE7OnzTA9Sm60HEepkfKBsYGPnIWUdURUqpVr4ddirU84GedJAi76XRKolo6BsyR9v52nP8QNWZ55zOJ0MkPDVXDkIKmvxkmg3MY4XJPY/sO3xwjzDA/96TJdM4N86wo05AiZt+hYmFGjHxBt3TnVjrGeZAa2NlrnambEOTGJCGVYmcFplSg4naY9RCJToamqhaGFUu6l+haojdIDDWz/swnkkGBg7N9NdWGBfROpJbsd462uy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skiYG3bk+Q6CLvbGs+RpfXwrOU2iIToYExLI++1N75U=;
 b=ijtqjmbKrpheiO2YJMvOVGrMjVcOoTHJzl+mbHL5I9TJ8eJgcXf9CiRKhSYluoN8SygNDNWG8ffn+v/auZ8yD9lJhbCw1cskdFT+IzfZ0JsAUMNjt/FU8YVuJPMh+iT+7d6mME/Badz7DnzlxUzVC8TWFmpaBYhWjmMYw7ucdZwpssvP9nMnOf6vkr9bpBCnYCZ3FlxkZmf/LddOw7lku06bIoY1zhCyc8CGwxVqmrYkUrVLE49gEqiqI7xVRY9j57HE841s47jSnQfAYkArQd7AdnQ00D0ulbL3cKsMtLA5kMX/nLaaOCWy5MM4Is2JVTUr79gTb+wicqZzKi8gWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skiYG3bk+Q6CLvbGs+RpfXwrOU2iIToYExLI++1N75U=;
 b=h1X3yvP5cJiHfv4xSSk+fYM2jqSixu9JSfevSXg1xmhDLkj3lrM5RiUWPBlveqiZxqY5E1i95v9rNj/deF7L7dGabSE5CVyQGlmhuywWpa0Z3MhqyNq3xvsdzd/DHapkU8QVU2QdnE33ZFisWNTeJPApH/yJeIdl+a84RC+ApYw=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 17:46:47 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::c9de:2018:5e7c:87c9]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::c9de:2018:5e7c:87c9%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 17:46:47 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
Thread-Topic: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
Thread-Index: AQHXR/583sIOTx+AkkmX8c9ZBbLQKKrhpgLQgD7mzaA=
Date: Tue, 22 Jun 2021 17:46:47 +0000
Message-ID: <BY5PR11MB4182996F3571B836708255E48C099@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210513134639.6541-1-thunder.leizhen@huawei.com>
 <BY5PR11MB4182F6C7F095EF9DF0E97FBC8C519@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4182F6C7F095EF9DF0E97FBC8C519@BY5PR11MB4182.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.41.68.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e327ef7e-33d4-4e42-7036-08d935a5b553
x-ms-traffictypediagnostic: SJ0PR11MB4829:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4829E9F822C3E6E09CB673548C099@SJ0PR11MB4829.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kxj92hPdG7sIjRcJB2Eo1wZGm4HyfqqsZFbi5jak0Z8saHCKgICM4YyTaLdICVXjXCXKE+mGe5GT6SWDVbgqTqancpgkz1t71T4KLcqMTCUyzvJHLQuI6WUbkfZ7wf5f17UGHLzx06vTLqZL9R1+Htqj6G6/sDNQkPUEKEy0bmmmU72hVPDHN8ScOmOoqTdD9rJ8qLqtPlqbmQQxZFQQiM3wnZ8iF5vngSCNWEk4vIflHYGFaxGRkSVNTgOdfTfwuWoEs2QokKBkBGJgFjFXZChv+Rob74o0bxTk5SrEjTcClvA3EpQNaeHLx1Epi+VzSaEkZkAzT+5nxGBAWVKJFUm6sCgxmyWM1MArrq8JfJYzcJg8dAAlVFLQ1UOB5WNz9SI/bDAuzeN0ACAByNSPvqVSCciZ+FkY+AVCWWOx9TGAIzrF+a9q9As8hZGaSm82aNVFc8c29VsOPVIem2pEToD9qcm0EnCFA8D4M5zreU9aeT0SLqQtaMGgAaNN95vutwkRlFA91+hlLKOhODHmdV7P3NLmUb7LovuwC5/ZHPJhHXt9/rHC5i1pWR7gQmhOpxYvg6RGsld1fDMviGQNIXYsbsYsGv7fL93Pz0olAR5oGkjZRIwJ56PbUIsU3siw36mKQhO0h8IdSRl+Gkf+JQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(136003)(346002)(39860400002)(8676002)(8936002)(7696005)(2906002)(66446008)(52536014)(64756008)(66556008)(66476007)(38100700002)(478600001)(9686003)(122000001)(76116006)(66946007)(5660300002)(71200400001)(6506007)(86362001)(186003)(83380400001)(33656002)(316002)(53546011)(55016002)(26005)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hS9NcpQ7lXh504A23YLJpB9FoYy+OexCuMLLb9XD1P8l6bT96W4YXk57041K?=
 =?us-ascii?Q?Jo3vVyuQCNKtkIoPk+6/oJi2BBa811c4ajnlqgQJ16q+Omd01jeJdrGs71e5?=
 =?us-ascii?Q?eEJZjF/asqUV3X3JJHuzuIB3/ldVk+L+k3eJ9VFb2jSCQDUOGwIOwx5u51dw?=
 =?us-ascii?Q?Ia3y4wFzxIzKWI0XvTyx3bhtlCNn1o7rTEjgzv4IYcU8khVlndcKpJvh3Ez4?=
 =?us-ascii?Q?Mc57/kXBJHEeB55tDYE5+7eAM0r/woNgpHOlDB+JDBhHbb1lA+7Zlc9PhawE?=
 =?us-ascii?Q?NZWWhE4SbL6Ix7ItYlSyz4zUOeMTg+sYh5KbIFL6E8uqNGIkp3I0tvco47Lf?=
 =?us-ascii?Q?NToTfHWQDAj7LsmO0/k8krfuGvxfKXTjMR6VMJ3aQe1vywO2cwEsZdYwSu0G?=
 =?us-ascii?Q?IsK7VP1rpIJLdQ+CFLt8olx9HF/cUrUhwwi20PnNiBS0p7FNoEeeuQweR4zO?=
 =?us-ascii?Q?qJSKLR1dk6u1mc7457pjKnifh+ijmeEmTRHKYs+Yln4HIiILnJcGYkUAfjUJ?=
 =?us-ascii?Q?QELvGgzPsswRbahwxW0jlQBtLiL9cnZDxValZt4IUeM6nlCmW12MKYGKosgY?=
 =?us-ascii?Q?ilwbbnbZerCTkZWY1LtImaYBROVfri2Wif9xJngkcaM3i4AYnc0pXClEDH0L?=
 =?us-ascii?Q?ovx3pAE29qx+uF4H7rHqvn4Ez1jhNzKaHlZDLd4c/pNgVzxq0wz+vm7MU8Th?=
 =?us-ascii?Q?CgdFpLCQdVER5WH42Z+bTvQJLPVuTReYf076g07qivlcBupAsjneT/WDhCIt?=
 =?us-ascii?Q?uulRWaScFUyT76QluK0YqD2KQIllXjsszTny46HIjWPmhhAOO74N/ZE2Lfmn?=
 =?us-ascii?Q?aqLW57LR9XKvOyW0LZRCuDo76KC78OaOHWfw84dt7Ow4HNFBUFE5MgUlUBE7?=
 =?us-ascii?Q?RPJIs3+chE6qxFg2LrMUMwWWy7vQPA/BEw8iwWti5riktAwCZocsvD4c/afW?=
 =?us-ascii?Q?2rucSDxCf3N4vIPRiZLaSEM7qAh4kB5/F+ID4GiW+jF8YCdETdTtoD6R6BZE?=
 =?us-ascii?Q?1Mu9IW0zxTGFZhUAik+AvuyRHsGCnPXvOtCqKRHwmzklY9tLnLp2aqmOwxXe?=
 =?us-ascii?Q?vOQ92pvtmivx5BWEk4TJiEpMp+th/jl0r7CtIimHbIucm+mSep6uLhd1VNC4?=
 =?us-ascii?Q?2ru7Mi9anJlgKEVmkaanR9pnGxJHlBItMy3ill4e5buzVcn0U+jJ4sdZkREx?=
 =?us-ascii?Q?2yXOBMpeGevvopFkg2lBxTtNo2yXsUxqIf8fP3lKnaxbLMCEMtiMkye04NpQ?=
 =?us-ascii?Q?1NzNk/5i3VKez4TKVpAwztIq9Tu1AGOQHJvZc9q382aav/JK2MCPhEk9XX1P?=
 =?us-ascii?Q?LKI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e327ef7e-33d4-4e42-7036-08d935a5b553
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 17:46:47.3848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUZWCjJ8jieVcLfudiUHCc/KkmplGyugVFncCiUc5stxWSUAAF96WP4dS+2gEcB4z1dX14urUHAmOkWjLvIvZX+HZy+BDNG9IBEe1c+4oXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

Thanks for the patch. Patch pushed to drm-misc-fixes.

Anitha

> -----Original Message-----
> From: Chrisanthus, Anitha
> Sent: Thursday, May 13, 2021 10:12 AM
> To: Zhen Lei <thunder.leizhen@huawei.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-devel <dri-
> devel@lists.freedesktop.org>
> Subject: RE: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
>=20
> Thanks for the patch.
>=20
> Reviewed-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>=20
> > -----Original Message-----
> > From: Zhen Lei <thunder.leizhen@huawei.com>
> > Sent: Thursday, May 13, 2021 6:47 AM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> > <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vette=
r
> > <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-devel <dri-
> > devel@lists.freedesktop.org>
> > Cc: Zhen Lei <thunder.leizhen@huawei.com>
> > Subject: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
> >
> > When call platform_get_irq() to obtain the IRQ of the lcd fails, the
> > returned error code should be propagated. However, we currently do not
> > explicitly assign this error code to 'ret'. As a result, 0 was incorrec=
tly
> > returned.
> >
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > b/drivers/gpu/drm/kmb/kmb_drv.c
> > index f64e06e1067dd8d..96ea1a2c11dd6a3 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -137,6 +137,7 @@ static int kmb_hw_init(struct drm_device *drm,
> > unsigned long flags)
> >  	/* Allocate LCD interrupt resources */
> >  	irq_lcd =3D platform_get_irq(pdev, 0);
> >  	if (irq_lcd < 0) {
> > +		ret =3D irq_lcd;
> >  		drm_err(&kmb->drm, "irq_lcd not found");
> >  		goto setup_fail;
> >  	}
> > --
> > 2.26.0.106.g9fadedd
> >

