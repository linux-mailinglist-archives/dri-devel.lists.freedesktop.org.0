Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF555B2F48
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0185510E422;
	Fri,  9 Sep 2022 06:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C2710E422;
 Fri,  9 Sep 2022 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662706304; x=1694242304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MToPIzhdrrFVXPkY6QkRVJliQf8nLYnZZq4tmd+Cptk=;
 b=W3UOxAjUOb4J0soN8EGJRum7FCVM6PUU0N3MZuLfWtcd5uoESe6qS1D0
 WGVNZmJ5sLI4yWsUmesmXClzJ1shWOa7q3yZO1Oxvy2B/JXyjVNOBZiko
 ladW7LIndtDlOAB3aZ5L04VF0NDH+Cq/buMyyX3SOf/L4S23nqtmTj90+
 kgrbEA0v0HW74WrDJiNehKbJ3qu1aH4n1sry1WMICmDLlXvClVFlJdV/t
 4ZdR1CvnM49Ka52pUSSDytHJQvH15ADJrfvNB5WXccC8bfo1ZMcbB7Pgt
 jCtRXbpg/cuEr5t9w4C9vegSw+y2AKj1zoS5bYsJhWpv3Ks0m7hU3qq0h w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="284430724"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="284430724"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 23:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="677043974"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2022 23:51:42 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:51:42 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:51:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 23:51:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 23:51:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDJjceqXmVbKvVSeNpSSzZUIyWMzsV+xie6N1wMt0GhTMOz6W3B+8gEzeMVmrr6Q8d5PK43BoGeVS93u0NbuqS0DucwtidURqoMKVqsnPByeDgkVdIVsoR9FRfykduJplbTanvj77Cu3Al3oICm6qy8rPh4JTNhTS2PArD2rhQtVgOObHbNw+2U0KGCEiBRFM1c98HmO+IwPR1644hW3lFlDpXvdTH2oC2Bp/VcYuQ7tFN23Jed3+iyouSa+y95bYY+hOl6em8yaRKY3vOp1X0lkWU1n7vn2i8TVLuOnfIdLUCrV6lRtBuC6eDKs3LFtqV5WJKgKYzDzJRDp2kxxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cd45+aUhwxGrcn+xOvxn1eZ6+obqJlUP62jzeW4f3/M=;
 b=g9tV5lNvU5nt6y6gQNm3Gl4I9Vp+dSnGYbW6MRqTc3rUU9XAfza7necro5OQVcBPQkNl6+rZy0Ode07uWkQjoJwkX75SLT6Q4k4qi6YvLYj9Ep3PjbhNZi8i74KqG1hBJ3j9vwi9HoQVOzFK2r3IIgmhLvTnNaMBqgWsbAoIDmMgMg1CbX3NFgGXd+2tNB9WVbru6BZCz9GNCNeHiJMmPHXRGUfTqeKw9noM5bZ1BPwQ2Ep54uwmiTmXuRUJRZujwXxigDBfjoxREKb9paiUJSyDJtsK3KW/dSFwQNPQaXWtRgFJoIpFVUaAmkREjC84Dm2HcXjgskwXoh5Vl5pQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 06:51:21 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5588.023; Fri, 9 Sep 2022
 06:51:21 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Thread-Topic: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Thread-Index: AQHYw+F96fCkMiIHjkeCNF6nKqanGK3Wn5mAgAAGijA=
Date: Fri, 9 Sep 2022 06:51:21 +0000
Message-ID: <MN2PR11MB409318EA31363B2E749700FFE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-7-daniele.ceraolospurio@intel.com>
 <YxraNUiyfH6NJiq5@kroah.com>
In-Reply-To: <YxraNUiyfH6NJiq5@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e031d6eb-269a-4024-143d-08da922fb469
x-ms-traffictypediagnostic: SJ0PR11MB5168:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mh8eOP9AAAtwxJAuSwvkBlVTv8wrBh5aXcnFG0WgLD0rzH8y8ZBlz3n5pqZ1iHcvQxqlH1AJNNA+cZqzGljcOLfXJD8MkDfwFk5IJzV/lU3qdndippq5OJ5pItzrM6Y0R1LtNRwsWWxpzsaeG5ra49vk9QB6d3JapyJZCZ5wAgoaEehicxIt5WxE1rtMnaD7l/wAyO25DDqMOBNKud2nAP+iJ8Tw58WGUR9rM4DBS4F3tG/7eEciMt1oHAQLPlB5C97rh+79wI6tHMbwuLq/Ge4HvBXZAPzz/c7ZIJ7mumFgP8Sc+FBq3BBnGXN4kBQRLm83ENnv7icw/Ch9/XYTVmEL8MoJhGrUmsAVx9E5X7zLNS15FYosdHpdjgTreAp/Qq+GCvy3oni2kJMasj3e7Mg4ay+XKKx4JTFnKRfPs4GpQwSWr0OIscO9XQ9Uke7KmMY/YR22DlzHJi1FWHZNPPxiYSjRt/UFEIF9NcpxxiUfRmBeHcwbsZhSAqmwLX1XTpD2M44y3HNyk9fQmoKB8elGcnkeUFpwbztzfN1M9ODHAr5mNmfCYIxOUT45pOZ9NmdfaK61E1ul/vGF0p2W6kIubVWTDTc2DP0OKAZYiiK9BZHQMzYIPUR4jfM9p37WS+U7AivloQNLrURRXRr63GsedmmrZxsWJgzNSkm3bvNwIgukx0TA+yrtibfM32Vs6exz+DEzoCDwDZO8jTRRufKX+nojs9Oexz0x+qfr6feGjcffmuX9Yl9ZRPyiwrESamAj3Ug/yBKSdba1ZxbIv+6ieS0S9bLH9OPsP+j1/LE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(136003)(39860400002)(366004)(346002)(41300700001)(8936002)(33656002)(52536014)(26005)(9686003)(2906002)(107886003)(5660300002)(6506007)(55016003)(38100700002)(82960400001)(53546011)(86362001)(71200400001)(186003)(83380400001)(7696005)(38070700005)(66446008)(122000001)(64756008)(8676002)(110136005)(66556008)(6636002)(66946007)(76116006)(4326008)(966005)(54906003)(66476007)(316002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lxNhYAkPDBo0zLAjoAfa/Q4POUNGLAGfdFEZNkrwVxCJkm7RSXw71I+mcSUA?=
 =?us-ascii?Q?QsI5nmaQyCHyXmFbLVHRoegpFHwOwRbON7QVMpq1PtlFzRIM+JJ1ZUGeju5G?=
 =?us-ascii?Q?aGFRtOpZysAWnYjAVrI/mY9rxU/nBakpkdFXpTjhetjaF5dbOF6T2jq6/5JW?=
 =?us-ascii?Q?vefYx9BuBPByMwqT1TtHvwdwX4i/6ELaE0KPYON9G7kikOt6MM1a+3/FA1Uo?=
 =?us-ascii?Q?bL4blcl+b5s5mLa/e0V16YZufB2lzH1Y54lCqrBnHvZ62AHmMw8TkxwpvP5n?=
 =?us-ascii?Q?qenNLo3sz0fRjCtZEe+p1Bocfh5DbU08S6EOSBudWcJhPxnd3WiXF8TYW7fV?=
 =?us-ascii?Q?wKrrALqG+SCRMf7Yjrcl4v8nBUoNMQLn2Wc87GWMl5CZCrDDBiO6pfumyQZc?=
 =?us-ascii?Q?NCSyLiMg/fr7Ixy9+k4A1YGJ5OmbP+dIevpLVqvSTuheqm29n533vKGo8uR+?=
 =?us-ascii?Q?7pJR2QERiluxG2dUoXVdD97lW80l6Qht+yhcYPMS53TBBrCxkmn/nS4/S8kT?=
 =?us-ascii?Q?YeneZw7FtqRDjmJxPHNbWyYPk8+GjrI2yY1pdE5BQpQuEv4aWqy7DJgR95t8?=
 =?us-ascii?Q?wX9PwtU4EHeLl9VkyUG4ZBySuDDWiF5iM6Zc9X/eXRiiiwNAn000OVL/NwIy?=
 =?us-ascii?Q?Lx0dFIaj2yjnKjbnp6mBLTssALI8keAJHQsYH4VXi3ySEWF5PlzlftTdsZmb?=
 =?us-ascii?Q?BoqLi+xqQBb+tYahCxSqI5ZB7bPb7Azx6jmPa6T0IvNTGsH8vZepUlIPk09H?=
 =?us-ascii?Q?mOVIm3jl6gMXAaa13IhoHPjYWER1a66kpMKt4HwCGQfEsTlxyHwxBqi2Qbxc?=
 =?us-ascii?Q?c2SI7wI+i1sUoL0xtuA664ruQ2ff1mtlQ0GRcvawWCf2WELFH/jRpcaeK5E+?=
 =?us-ascii?Q?HMt9wJYEdiSwgK5CESOgahIOTVRiS7DNB5p8bK+JGGYNrK22b566xAbQCIej?=
 =?us-ascii?Q?ZxBGI+K9nKIJOmg8n+1jMSfVkynPEsP39WTdeDqnV5Zl5tJVl+pR5kZr9VzJ?=
 =?us-ascii?Q?QEg83IhSmL49PGyoEJAzs3e9HjgPYOMyYrQV7P6ijnlXIbv+5xQGD+SxtXdB?=
 =?us-ascii?Q?RjYI+RV1EtGypZ7Lg5VkoxQ+RvU2HVeMWh+MYKZNOqkow7N/bCkQEI+USOtz?=
 =?us-ascii?Q?CwA+i7ueWzFplTY/lfT6W51TNKp1ExPs8eOkVnaoicQ/rHCcWXdTpDlqrkEi?=
 =?us-ascii?Q?HovmJxDoOMrEAWbZY3SiLY7qupV4tq2CFEYoynOSCZd23RxyBRQOX3faM19D?=
 =?us-ascii?Q?T/XfO1/gwxZZ+YkxK+PrGAKzx0KNWvEb+OMnEKElzDslzrvyc1WyfxOBcHH1?=
 =?us-ascii?Q?6+xs9bnW0NSLmit4qgp/DOXof8IglalQjMH+Iq8wR3L5dx+tijz/8F51HVZr?=
 =?us-ascii?Q?B5LL4Q6+q8OkbY5UYbkY4j/EvnDRYl4bkCY9lcXb8/TOF+XhpnFqtZna8AkH?=
 =?us-ascii?Q?EzDHJU4ziA5Y2HsS6s1F1ee0ndJmCok6ujWBfijL2ANjjMRM3XJis69IoKN1?=
 =?us-ascii?Q?lnRrPmpMwztHJgst5k57UDfrXUfph4y+zLCWGW0Updd16xlTiEEa1c5X1U/d?=
 =?us-ascii?Q?RlZzCIo8w9rzMzcNgFUKnZwLU9Fw+XmIZUQh9Pg2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e031d6eb-269a-4024-143d-08da922fb469
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 06:51:21.3625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6w4XX0JxW+sqzQPy5ovTTrtftTn27j15V2fHp/W9cxutDwXVpAhCHL5OJDtuvA1i1IyMXYQV5lV/C4E6A7eS5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart, 
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, September 09, 2022 09:16
> To: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> Winkler, Tomas <tomas.winkler@intel.com>; Lubart, Vitaly
> <vitaly.lubart@intel.com>; Teres Alexis, Alan Previn
> <alan.previn.teres.alexis@intel.com>
> Subject: Re: [PATCH v4 06/15] mei: pxp: support matching with a gfx discr=
ete
> card
>=20
> On Thu, Sep 08, 2022 at 05:16:03PM -0700, Daniele Ceraolo Spurio wrote:
> > From: Tomas Winkler <tomas.winkler@intel.com>
> >
> > With on-boards graphics card, both i915 and MEI are in the same device
> > hierarchy with the same parent, while for discrete gfx card the MEI is
> > its child device.
> > Adjust the match function for that scenario by matching MEI parent
> > device with i915.
> >
> > V2:
> >  1. More detailed commit message
> >  2. Check for dev is not null before it is accessed.
> >
> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio
> > <daniele.ceraolospurio@intel.com>
> > Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  drivers/misc/mei/pxp/mei_pxp.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/misc/mei/pxp/mei_pxp.c
> > b/drivers/misc/mei/pxp/mei_pxp.c index 17c5d201603f..afc047627800
> > 100644
> > --- a/drivers/misc/mei/pxp/mei_pxp.c
> > +++ b/drivers/misc/mei/pxp/mei_pxp.c
> > @@ -159,17 +159,24 @@ static int mei_pxp_component_match(struct
> device
> > *dev, int subcomponent,  {
> >  	struct device *base =3D data;
> >
> > +	if (!dev)
> > +		return 0;
>=20
> How can that happen?
>=20
> > +
> >  	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
>=20
> That's crazy to assume, but whatever :(
Explained here:
https://lore.kernel.org/all/20220418175932.1809770-2-wonchung@google.com/

>=20
> >  	    subcomponent !=3D I915_COMPONENT_PXP)
> >  		return 0;
> >
> >  	base =3D base->parent;
> > -	if (!base)
> > +	if (!base) /* mei device */
>=20
> Why does this mean that?
>=20
> Where is that documented?
>=20
> >  		return 0;
> >
> > -	base =3D base->parent;
> > -	dev =3D dev->parent;
> > +	base =3D base->parent; /* pci device */
>=20
> Again, why is this the case?
>=20
> > +	/* for dgfx */
> > +	if (base && dev =3D=3D base)
> > +		return 1;
> >
> > +	/* for pch */
> > +	dev =3D dev->parent;
>=20
> You are digging through a random device tree and assuming that you "know"
> what the topology is going to be, that feels very very fragile and ripe f=
or
> problems going forward.

I don't think it is random.

> How do you ensure that this really is they way the tree is for ALL system=
s?

Yes we take the topology assumption in PCI hierarchy.
There is a case where both GFX and MEI are in PCH and you cannot stick addi=
tional PCI extender or anything else there.=20
And case where MEI is child on a standalone graphics card this is set in so=
ftware so topology is not going to change unless we rewrite
everything.  Be happy to hear your insights.=20
Thanks
Tomas


