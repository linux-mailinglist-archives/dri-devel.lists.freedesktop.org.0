Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5635B337C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B54610EC33;
	Fri,  9 Sep 2022 09:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAD810EC15;
 Fri,  9 Sep 2022 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662715294; x=1694251294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WumMRdVvfw98O83qbuQQH/hmGVP307MOZt2N4MPLpxw=;
 b=aKFEshuKCNENTt8949y3D/Fo4SfguwQU5MkdS+kltE7vtEvzCDgICUzV
 mcEeGWBtiyEDomBIraKRtq0FXUUfV/k+2uPpOkPPJsGlLKv2G5Rc5ZW1r
 gjVpjL10neaD5JgC0MAto2M2akCsj0lmq2yh8dSdNTVjop0bFB1YJqCth
 EFMkVj9ieCAFLyIXN11OPCGkyOgdybJLzzepimiVQ9pZE/BL/KsRByAtc
 xf2h/x/WA/s5HPE7wWk2lUls5ALNeuXSv1jqoZRyVjgssYfidVRE9pdXL
 W1iDZ1Ge/V8TXA1okN+L4EL1wZ0/mMyUC3Viokyy3Q6a/wgEKyeUkrXC+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277824241"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="277824241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 02:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="566306900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 09 Sep 2022 02:21:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:21:33 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:21:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 02:21:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 02:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/mBM2SCZZ3NpIGqQ0Lj3WvrS6+CpKaWEoGGVd/NBaibbXLwDKBqoeEUMxPnv5wUdAN8Um+TcuYws3tZiSKd3TTzRa8eKWACbVZ/D/wk4AT2VqSPCOM3k1aEZTFyvv+SI9LboVk0ejZVXNpnA15XIsnPEfC0YyoUZ+A5HwXJlIP4oBJ4jY4G+8CUvHX52AJZQgHwHM4gTdN9mMJrcMODUM9/baHcYsKKsmtIorU5e8Q/jWybEMuQ7EyxlbMWCshdXnhHvzHWkFmoNT6gwEF/SI46/gtQzcSqSMOizsjkr4u9oMvb0BfRmCXSmUSu/A1GVCK7VbLe5uqQjLsxr7rGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GboIOW4t1/yWbsP6ztgTnWhdDRkSVF8QdFPt6UGbkI8=;
 b=RbgiFdFv5k9sRUIOEQMmmYC8DleCn8p0xlY/dQBDa7SUMVYtGEFfChBMXCx0z2kie4e9ndFNpNHr7Bmxtd9qQK0UX5nx1jzOBsiiIFt+/w8q1XjPeH+3YLcNCtx5behn0bbAGo6+0vkzLS/sT41SBCrLae50W6riOyeCVtTp/n3LLQ9CpOclrEvtAuvSW3DjW08WU/Qhi804rHvbZ2FvDQbsvHp59kDudSc1a1Lj/zWeDW054ypnFQjWKLMN8qLuTD83XBbQHuNdfxwZNCtG4S98WWia4/4HCBi5xBucxMe1UP9Msn+2dQbXEgF8qpAO3wfwUUXE+SM3bNmnGfMYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4086.namprd11.prod.outlook.com (2603:10b6:a03:187::26)
 by CH0PR11MB5426.namprd11.prod.outlook.com (2603:10b6:610:d1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 09:21:31 +0000
Received: from BY5PR11MB4086.namprd11.prod.outlook.com
 ([fe80::d07b:4ae3:b424:3171]) by BY5PR11MB4086.namprd11.prod.outlook.com
 ([fe80::d07b:4ae3:b424:3171%3]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 09:21:31 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Thread-Topic: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Thread-Index: AQHYw+F96fCkMiIHjkeCNF6nKqanGK3Wn5mAgAAGijCAAAWNAIAAAgHg
Date: Fri, 9 Sep 2022 09:21:30 +0000
Message-ID: <BY5PR11MB40869BEBCB65489E21A3F650E5439@BY5PR11MB4086.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-7-daniele.ceraolospurio@intel.com>
 <YxraNUiyfH6NJiq5@kroah.com>
 <MN2PR11MB409318EA31363B2E749700FFE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrkWotjObH6zAca@kroah.com>
In-Reply-To: <YxrkWotjObH6zAca@kroah.com>
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
x-ms-traffictypediagnostic: BY5PR11MB4086:EE_|CH0PR11MB5426:EE_
x-ms-office365-filtering-correlation-id: 05a91fd0-5606-43c0-087a-08da9244ae8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bD+zcRNmS58UX2f5GBLJsiHfq7KysVBf6ihzNDXKYyIMm0/fnPPzHwjt2K9xqxJ7bDi9etC/kVJPlr5ZY3M3UijJWAqkdI7UIjg/eRApDvxC+UI4W04Vz+ZQNiKUedSbPGQ5AQ4PrU8lCzmLOGCIhpu8aROgCOVo+A3amb07sc/kjK269m1BvCMjYBWhqiZPINf1IbzAwOJogF4naJUsnml002yvJC39XU3mMEfQpQvhDRmETyNugjhhjRjuRPmvGostbjVzP4OzOjC7zm76vxlzUWCzBymZHDXXymYc66nJgsHOWrmsM7y6f3FXXLENGovXi+jiVdIWMH3jAHxIFFBuzopzKGhlHel0X2sXlggb9BmlsEiAOKxLpmSVidIat1QK3Rbair5EKB6EQ+RwjCo+O/ZO1Y0VTiinsySeMTQDLgNkFF9OsQsfD4GbOImTt0LLj4KvK5Vcyi/IsvkLMcooj7Cp8LEw/JuELL8prz3H5f5dRMmRxQjZamyLE4GFgWxoxobbHPysqg1PyY0aNxZ/jnU26T5yZB3txl++azQy0Q4jtCDjC0EqLuzTJZ6rfwfm8WVAit51CXbIrZxFz2lV4QTY4ByltlIu5g1rLW2Sihu/mG7JzpWYeWvMpQuZMnjietXowkXCc9NHrttI+elyq7+GJnM1fMzZrZm8YDM5IDVjRuCfLLtxDZN4vRul1hUtr16NWn7KkjcgoH8/xiWxONdC6AH/7rpRcmzZdDWseOWcrw6KJ/SEF6RlTlKCjEObZgQiKo3E0/Mp//sgWUgIKAgZzUrB3GJ2syaU6KM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4086.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(136003)(346002)(366004)(38100700002)(66556008)(8676002)(64756008)(66946007)(76116006)(66446008)(4326008)(66476007)(122000001)(86362001)(38070700005)(82960400001)(33656002)(83380400001)(478600001)(26005)(9686003)(107886003)(53546011)(7696005)(41300700001)(71200400001)(966005)(55016003)(316002)(54906003)(6916009)(6506007)(186003)(8936002)(2906002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jzN4Qt4/kmfnFgCj71U4xrtpbthzHHqO9xX4zLw1+KLFjlGqib4jThYVsLpS?=
 =?us-ascii?Q?8blFm9s+okT3psVd0kpKMGqS/LKAsbIHYfQ9JRtEjNVT8OkGJy9zphTS9Hq5?=
 =?us-ascii?Q?vNLe8goOCckpBD6CJ/w8ZQHRUgLYy0uq0aMz1G1HbNuYG6JqFGnahxPhMSVE?=
 =?us-ascii?Q?uhRjCtzjlTxMPp1+dERSMR3NUssADozlGy8TzAIP0ErPn73OvAl4KiO+SlBS?=
 =?us-ascii?Q?kXhONCSlBftY4brTB7+i8BjkVPfdZWJINQOVg34y8BjP1BqZ+PnC8hpqOxrd?=
 =?us-ascii?Q?OaNtxOCFUxe/IrrXDIrawDf+et2fvAZGK8jet3vjofUqpTkVkJlUL/e26RWV?=
 =?us-ascii?Q?FmYraoSYLMH5IB6lWutO/IKpEWcEZQMpPi4n7vijne++YXTV0Y0oAawMlyhE?=
 =?us-ascii?Q?r7vaOyJy/CjseEIHQjBve2UwmRxR4kp/yjnDeMBBD8gAO7vDSCiPTp/a+J4M?=
 =?us-ascii?Q?uyPAR5W0zCX/tkTP93s2JuMwO8LThoFhoyYuqc6hxJ7J+qNJRPno75VrgXRi?=
 =?us-ascii?Q?YcWg49ghTl8NKxJpGEdDMHwdcRADC4bYK3ninGswUQ/GzOWVbsRyE+LUDn9q?=
 =?us-ascii?Q?GLdm7QInFk2nqrNxaUYhwFZ7tGH209FyCPk5gKwadvq2TwBDF8FbzQqNcdHW?=
 =?us-ascii?Q?zaTK5fmW9IJIfRonuXN9ocUWj5OkFQfAIcxZmt6WaQiU1lVUQDUZlkQ0Xdnk?=
 =?us-ascii?Q?hIiat0oxdxcIERL1gMxjUTIBfUAj81P9dibu5gNyHdbn3zrCcd1RCZ+67yWg?=
 =?us-ascii?Q?GWR0HWr8KRI+XO6OKnAn8Df5/KAPkege6Yr/4s9MZ4YH/uzHCH1Rv1aPgNTx?=
 =?us-ascii?Q?YiV1H0PCWOddMydwTW+7uzLCpw6vpT+ROqrSmQHTmIEZtYEILeEkV4tHeUUg?=
 =?us-ascii?Q?vYD47PN29PJnqz5EcTXpK3S+Fgbo2MlZR2ufBLvP3Vlm8zhguFssmvS8BqjT?=
 =?us-ascii?Q?+3vGprNvDaMGcKX+NZaXftf/ke3TU588IAykHsD6MnJtuhY4LFRiPzbR4UaI?=
 =?us-ascii?Q?dNYrYm70K3naNKJdFngPPtxvN9AcS41E8huNYICxhZXHAB79OwAteaVsLGVC?=
 =?us-ascii?Q?YY50Q2OZjOH6a/9Pvtm6Nbk7bZwy4gORnLFRLJTnMueSKnmQG2GlDfwyDwTi?=
 =?us-ascii?Q?IjigN63kIVReA8GOd1KxJD6TmheI6PA1zkbfD9zcLYjpRmqHapaflN2hWmOu?=
 =?us-ascii?Q?JUWpxqvHP4mwP7JXhPn4YY/ddVOZo9kQLlDZnbhPBQtzotAnOSh7RyJ/6Zvz?=
 =?us-ascii?Q?nIvO2J8DufWe5vknhTNnJD39NNxK6v4wggjJ9ujLQHjgkzDga9MPZ0BVQsOn?=
 =?us-ascii?Q?NQS+WKO0hALdPfl90CHLYGH5x7mQOENnFYzctZNz0rS8hCdjJ6chNnApg69c?=
 =?us-ascii?Q?1uUU/ql/QW2aX36Kbk+fjXUccZOxXmn1ETjfZ+kKiH8usDuoVmwSN5TWcer/?=
 =?us-ascii?Q?iLtwWEehYmiR9yA2roMAsiVtz6LU+S3DfuWrKIJhTAltIXioc+GVvO+ZYmBH?=
 =?us-ascii?Q?hkQcbIghcJ3BKpR7BboQ1Z8SdAyizbotceYSXSfavoCC91PGSMqE+PakjNq9?=
 =?us-ascii?Q?Mu9IxOj3a+A2yJBaBYlGEdIm1H4QKVW9NVmJ2A6N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4086.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a91fd0-5606-43c0-087a-08da9244ae8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 09:21:30.9696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uc/4cmcMlquu64sVzTiSUAdhUvuisn4xeTtvDb1leer15NEGxpmEIuqf1d0GS+J071qWMDqp8BERuLYmVN9kJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5426
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart, 
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >
> > > -----Original Message-----
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Friday, September 09, 2022 09:16
> > > To: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> > > Cc: intel-gfx@lists.freedesktop.org;
> > > dri-devel@lists.freedesktop.org; Winkler, Tomas
> > > <tomas.winkler@intel.com>; Lubart, Vitaly <vitaly.lubart@intel.com>;
> > > Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Subject: Re: [PATCH v4 06/15] mei: pxp: support matching with a gfx
> > > discrete card
> > >
> > > On Thu, Sep 08, 2022 at 05:16:03PM -0700, Daniele Ceraolo Spurio wrot=
e:
> > > > From: Tomas Winkler <tomas.winkler@intel.com>
> > > >
> > > > With on-boards graphics card, both i915 and MEI are in the same
> > > > device hierarchy with the same parent, while for discrete gfx card
> > > > the MEI is its child device.
> > > > Adjust the match function for that scenario by matching MEI parent
> > > > device with i915.
> > > >
> > > > V2:
> > > >  1. More detailed commit message
> > > >  2. Check for dev is not null before it is accessed.
> > > >
> > > > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > > > Signed-off-by: Daniele Ceraolo Spurio
> > > > <daniele.ceraolospurio@intel.com>
> > > > Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > ---
> > > >  drivers/misc/mei/pxp/mei_pxp.c | 13 ++++++++++---
> > > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/misc/mei/pxp/mei_pxp.c
> > > > b/drivers/misc/mei/pxp/mei_pxp.c index 17c5d201603f..afc047627800
> > > > 100644
> > > > --- a/drivers/misc/mei/pxp/mei_pxp.c
> > > > +++ b/drivers/misc/mei/pxp/mei_pxp.c
> > > > @@ -159,17 +159,24 @@ static int mei_pxp_component_match(struct
> > > device
> > > > *dev, int subcomponent,  {
> > > >  	struct device *base =3D data;
> > > >
> > > > +	if (!dev)
> > > > +		return 0;
> > >
> > > How can that happen?
> > >
> > > > +
> > > >  	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
> > >
> > > That's crazy to assume, but whatever :(
> > Explained here:
> > https://lore.kernel.org/all/20220418175932.1809770-2-
> wonchung@google.c
> > om/
>=20
> Still crazy :(
>=20
> >
> > >
> > > >  	    subcomponent !=3D I915_COMPONENT_PXP)
> > > >  		return 0;
> > > >
> > > >  	base =3D base->parent;
> > > > -	if (!base)
> > > > +	if (!base) /* mei device */
> > >
> > > Why does this mean that?
> > >
> > > Where is that documented?
> > >
> > > >  		return 0;
> > > >
> > > > -	base =3D base->parent;
> > > > -	dev =3D dev->parent;
> > > > +	base =3D base->parent; /* pci device */
> > >
> > > Again, why is this the case?
> > >
> > > > +	/* for dgfx */
> > > > +	if (base && dev =3D=3D base)
> > > > +		return 1;
> > > >
> > > > +	/* for pch */
> > > > +	dev =3D dev->parent;
> > >
> > > You are digging through a random device tree and assuming that you
> "know"
> > > what the topology is going to be, that feels very very fragile and
> > > ripe for problems going forward.
> >
> > I don't think it is random.
>=20
> Today it is one specific way, but how do you know this always will be thi=
s
> way?
>=20
> > > How do you ensure that this really is they way the tree is for ALL
> systems?
> >
> > Yes we take the topology assumption in PCI hierarchy.
> > There is a case where both GFX and MEI are in PCH and you cannot stick
> additional PCI extender or anything else there.
> > And case where MEI is child on a standalone graphics card this is set
> > in software so topology is not going to change unless we rewrite
> everything.  Be happy to hear your insights.
>=20
> This is ripe to break in the future if someone makes a differently struct=
ured
> device as there is nothing forcing the current layout to always be this w=
ay by
> hardware designers.
>=20
> The goal of the driver model is to NOT have these types of hard-coded
> topology assumptions because, supprise, assumptions like this have always
> come back to bite people in the end.
>=20
> This is your driver, so that's fine, but really this feels very very wron=
g and you
> will have a hard time guaranteeing that this will always be this way for =
the
> next 20+ years of hardware designs.  So why not do it properly from the
> beginning and pass in the correct pointers to different places?
>=20
> There is a very good reason that the driver model/core does not make it e=
asy
> to determine what type of device a 'struct device *' is, because you shou=
ldn't
> have to rely on that type of thing ever.  You are taking it one step furt=
her and
> just assuming that you know what the type is here, with no real way to
> ensure that this is the case.
>=20
> In short, this feels like a very bad design as it is very fragile.

I believe I understand your concern but I would need to invent another=20
addressing scheme to associate hw components that are already=20
addressable by let say PCI hierarchy.  We've changed two subsystems for thi=
s work
components and aux bus already.  So let's have some fun in the future.

Thanks
Tomas

