Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27231A44A6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B256ECB5;
	Fri, 10 Apr 2020 09:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC826EC46
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 02:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrO78YUiUxPPj/yTUZavP/pPGOAad7Pq7nza60q+e3PimmFrpEk+FjOpMG7tet/8JiWnPdNEIg0xmY/ED4FlqIHGpgCiimIvFqnWIB3bsJV759a8tIb9sTDnZ8Zn4iWjg5GhdX+WaHQG32IffbWhWb/rnSnF+Zv77boHpwuFUmTzahltrCDLJPo4E7wdzlz6GH5weadVRaqT5P9ckyuOCERCJKWEgXmxasAEZEx48cqOjtCA0eNmMOfMvUa6pm7iQX6asGK0nfQqVcDT8YLbmtnP5Ir0M3OHOYSIx9JYi33YlHs0qNpvjjZgLR51GvTDvEgQNA3Lw4Qg6CDpykOvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmkFfT2WZ8znsr7wYt8LI2u3R2KX1ao2uUOc7VXDS28=;
 b=YbV5ZXxXK86e8CqUK2n0M0GTqYOYN6rXJXgqDI+Jgt+TymFSsoriEwG3T6OSjvSh39CEE1NKgwQ/ohOp4bmW7eCNyXya1QHye7jiXU5b0mRYafGExcw/agp+lxb/ks+egOujyG8EhrXYeEVt96t8ri/271Zhw2Q1kwwVk2tjRJmhDkxv7ZdLDFjUNenzU0ngpeLdgnlqKJ+MT5V8gn+Q0HxFD6EhlUO4zo9dA3qPeOGekgbPK2EyamwTOJLmd6UEjGaNKrNUxres7L3Ez57DcLUb+I1YqgSeFDROMpI1zKAVNLTszr/nGB89l4Yvny+1vbZ/oZ36Vc2nf50Qwubo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmkFfT2WZ8znsr7wYt8LI2u3R2KX1ao2uUOc7VXDS28=;
 b=ff8HYC1E6jVkzLv3I+EbsGgG8oxosGtbKyOWzU9SfnQxoY1TzeHm3IfUZVm7+SE4wna3vvq3JUilRpWN76X+KLFk9Om1JSjeY5dTadjCHJht4klBixTITfutcrhxaqeWqJn5aTwehrogNkhx5hIyzQgSYf2rjZL3qdGeG2kquu4=
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com (20.177.51.151) by
 VI1PR05MB4895.eurprd05.prod.outlook.com (20.177.51.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.20; Fri, 10 Apr 2020 02:40:42 +0000
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::9d19:a564:b84e:7c19]) by VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::9d19:a564:b84e:7c19%7]) with mapi id 15.20.2878.021; Fri, 10 Apr 2020
 02:40:42 +0000
From: Saeed Mahameed <saeedm@mellanox.com>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "jgg@ziepe.ca" <jgg@ziepe.ca>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Thread-Topic: [RFC 0/6] Regressions for "imply" behavior change
Thread-Index: AQHWDeQiJzc7TgrcN0yUMWAEU5j98qhvr4mAgAADKgCAAB92AIAAp0gAgAEtnwA=
Date: Fri, 10 Apr 2020 02:40:42 +0000
Message-ID: <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
In-Reply-To: <87k12pgifv.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saeedm@mellanox.com; 
x-originating-ip: [73.15.39.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91839159-9afa-460e-e72c-08d7dcf89048
x-ms-traffictypediagnostic: VI1PR05MB4895:
x-microsoft-antispam-prvs: <VI1PR05MB4895A819FA3866D162856197BEDE0@VI1PR05MB4895.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB5102.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(36756003)(2906002)(4326008)(5660300002)(110136005)(54906003)(6486002)(316002)(71200400001)(7416002)(8676002)(76116006)(91956017)(6512007)(66446008)(64756008)(66476007)(66946007)(66556008)(53546011)(6506007)(26005)(8936002)(81156014)(478600001)(86362001)(186003)(2616005);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mzXqDzag92Dab6fFB+4ppj7llYpqiJW5+OS4NUmVnOo2WSdI3SW76UoDGSEyJCam14zCXHsCk24uFNfI1Ez8wLZzfrTiR9fVm5lgwE78nZfp8LEZtqWpeYgMDrPPqA2pF7t78a3VsouA3rnfSqETWcF+4V+YU6Av7gjgu/aXDIZ1w0k8YtAQYciqTvH4Veim5tJqfi7kcyilivo2Nm++7txadQh+bsFMrPgJbdWXX4SdHQB5tJziryaLqZURN0QGU7yEKHk7iISNgs68pGOiL4cKfWPUJxhEz4+ZATUfsx9u0fTl7Y4NWv1f3DDgCwq0Qt0fGJmVGaeLQFIU+qRvlEgXjbOvP0+hw+tOJY1BFeG/cNjG0WyBzU2ZksceuV8EvN1F2eZQp1GQpKcdpK1zUWkiBJrc6yXLUdN/4Aa/8LxFf+2Y0n+XIeCVk6XMxCKy
x-ms-exchange-antispam-messagedata: 7dZErSLe/iTSwlIL0+9qPV1dMM0GdUxO1XFENN97hWiB6S67fpRlaJee2G4HaML1UuEmAwqoKApLZQ9XY5VcoB98ue0a8YDsqtBVEfrbszWKUKvg9sIhjlO1wVWMB25l8NUOoew6jy5EogLdXmaqgg==
x-ms-exchange-transport-forked: True
Content-ID: <E5E26D8D6312FF48A2B2B1029454549C@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91839159-9afa-460e-e72c-08d7dcf89048
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 02:40:42.6221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9DD6JIpUCc8BmEC8ZAlWnZtmkpiuvGNp+Nthu0scwe+Oq4DzAcwJOcwk0nKEJsyRm+7+EXQcsomp+W5ddOWjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4895
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "leon@kernel.org" <leon@kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-04-09 at 11:41 +0300, Jani Nikula wrote:
> On Wed, 08 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Apr 08, 2020 at 10:49:48PM +0200, Arnd Bergmann wrote:
> > > On Wed, Apr 8, 2020 at 10:38 PM Nicolas Pitre <nico@fluxnic.net>
> > > wrote:
> > > > On Wed, 8 Apr 2020, Arnd Bergmann wrote:
> > > > > I have created workarounds for the Kconfig files, which now
> > > > > stop using
> > > > > imply and do something else in each case. I don't know
> > > > > whether there was
> > > > > a bug in the kconfig changes that has led to allowing
> > > > > configurations that
> > > > > were not meant to be legal even with the new semantics, or if
> > > > > the Kconfig
> > > > > files have simply become incorrect now and the tool works as
> > > > > expected.
> > > > 
> > > > In most cases it is the code that has to be fixed. It typically
> > > > does:
> > > > 
> > > >         if (IS_ENABLED(CONFIG_FOO))
> > > >                 foo_init();
> > > > 
> > > > Where it should rather do:
> > > > 
> > > >         if (IS_REACHABLE(CONFIG_FOO))
> > > >                 foo_init();
> > > > 
> > > > A couple of such patches have been produced and queued in their
> > > > respective trees already.
> > > 
> > > I try to use IS_REACHABLE() only as a last resort, as it tends to
> > > confuse users when a subsystem is built as a module and already
> > > loaded but something relying on that subsystem does not use it.
> > > 
> > > In the six patches I made, I had to use IS_REACHABLE() once,
> > > for the others I tended to use a Kconfig dependency like
> > > 
> > > 'depends on FOO || FOO=n'
> > 

This assumes that the module using FOO has its own flag representing
FOO which is not always the case.

for example in mlx5 we use VXLAN config flag directly to compile VXLAN
related files:

mlx5/core/Makefile:

obj-$(CONFIG_MLX5_CORE) += mlx5_core.o

mlx5_core-y := mlx5_core.o
mlx5_core-$(VXLAN) += mlx5_vxlan.o

and in mlx5_main.o we do:
 
if (IS_ENABLED(VXLAN))
       mlx5_vxlan_init()

after the change in imply semantics:
our options are:

1) use IS_REACHABLE(VXLAN) instead of IS_ENABLED(VXLAN)

2) have MLX5_VXLAN in mlx5 Kconfig and use IS_ENABLED(MLX5_VXLAN) 
config MLX5_VXLAN
	depends on VXLAN || !VXLAN
	bool

So i understand that every one agree to use solution #2 ?

> > It is unfortunate kconfig doesn't have a language feature for this
> > idiom, as the above is confounding without a lot of kconfig
> > knowledge
> > 
> > > I did come up with the IS_REACHABLE() macro originally, but that
> > > doesn't mean I think it's a good idea to use it liberally ;-)
> > 
> > It would be nice to have some uniform policy here
> > 
> > I also don't like the IS_REACHABLE solution, it makes this more
> > complicated, not less..
> 
> Just chiming "me too" here.
> 
> IS_REACHABLE() is not a solution, it's a hack to hide a dependency
> link
> problem under the carpet, in a way that is difficult for the user to
> debug and figure out.
> 
> The user thinks they've enabled a feature, but it doesn't get used
> anyway, because a builtin depends on something that is a module and
> therefore not reachable. Can someone please give me an example where
> that kind of behaviour is desirable?
> 
> AFAICT IS_REACHABLE() is becoming more and more common in the kernel,
> but arguably it's just making more undesirable configurations
> possible. Configurations that should simply be blocked by using
> suitable
> dependencies on the Kconfig level.
> 
> For example, you have two graphics drivers, one builtin and another
> module. Then you have backlight as a module. Using IS_REACHABLE(),
> backlight would work in one driver, but not the other. I'm sure there
> is
> the oddball person who finds this desirable, but the overwhelming
> majority would just make the deps such that either you make all of
> them
> modules, or also require backlight to be builtin.
> 

the previous imply semantics handled this by forcing backlight to be
built-in, which worked nicely.

> 
> BR,
> Jani.
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
