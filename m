Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC951A5234
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CB76E32D;
	Sat, 11 Apr 2020 12:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10084.outbound.protection.outlook.com [40.107.1.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944B16E291
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 19:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh+zoKCxqI8Mf8cPX007AbeUwa3mZQpnVxm0WezUWcRwdCYr0vFxwBq5Smxe2W1a4pF1HGP+EPuVI+LAaidZC9I8QWjbYgGpzgWs6ZNWZE4vUEULLNILOLanMB8V52Bni8AD7GQXk+rg8RVVEqZRyy6g/FeTHZc+27f6udac5Ol/2Rdnfs+I0rgLaemAKoXwRdCghsmUPdSJK9/nnKleQWvdyXwL8t7VbIcUNBGO72xQsTEMhDfboaRSdMmwFpz3lSkto9vjJfXh6IsbJPcLNFhr2qFpTUvCe9iuOg0OH6S3NMYw5DYKp5CkkWm9H+XpiIEzoVwKAv57vSUXs28clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qREnRW9ITHwIv0VmfQhKf0SU7+cAcX76d6f6wyC33Q0=;
 b=cqzbf9l1/ogm5fyfbeqmjVmHHGMM/BH0qdkYgkUCT5QIcD5khi1Hl8ToVMd44If6sT863+xDSr5x2WvojYCO+D+xb0oJ93kC5B1pLspJgiA/67HA7U+uBAOJyKu5aLc+eidR39UdXIp0f9EMr4ywAjO0tCCYay8uOD4qSPuma9THNFl7MeuxwlrAdoOar0GVKi0H+n90YyC2rMeje+4ZbaWMALyqj1sAMMJp5NkoIdlJjuyPu4lbqW/9dVjM8AcpsmGOFcKop+f+KHvLxUpHiHOyyOOiRlkUydlh2B7ZZpHY5QtWAnou3l2SJvfz5XD70LAG9bYFsDt1joSNAxr/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qREnRW9ITHwIv0VmfQhKf0SU7+cAcX76d6f6wyC33Q0=;
 b=Da7wUhQLBzrVWdsbTF45GZB05me//iP7OIZsJ49df5+a2chZY3FJljWQLikCiW4ewhOjCFsktJpRL1HXe9uDX0PEWHiuNaxeh+S8G2muzPzangCJHvM4YcN5xO9esvpnYp+DaDnix8XJtVeDv2M6UojWSZb6TeXw7P02L/YiHkw=
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com (2603:10a6:803:5e::23)
 by VI1PR05MB6464.eurprd05.prod.outlook.com (2603:10a6:803:f4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Fri, 10 Apr
 2020 19:04:27 +0000
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::9d19:a564:b84e:7c19]) by VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::9d19:a564:b84e:7c19%7]) with mapi id 15.20.2878.021; Fri, 10 Apr 2020
 19:04:27 +0000
From: Saeed Mahameed <saeedm@mellanox.com>
To: "jgg@ziepe.ca" <jgg@ziepe.ca>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Thread-Topic: [RFC 0/6] Regressions for "imply" behavior change
Thread-Index: AQHWDeQiJzc7TgrcN0yUMWAEU5j98qhvr4mAgAADKgCAAB92AIAAp0gAgAEtnwCAAPPSAIAAHv4A
Date: Fri, 10 Apr 2020 19:04:27 +0000
Message-ID: <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
 <20200410171320.GN11886@ziepe.ca>
In-Reply-To: <20200410171320.GN11886@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 604cbf34-e6de-480d-3b6a-08d7dd81fdee
x-ms-traffictypediagnostic: VI1PR05MB6464:
x-microsoft-antispam-prvs: <VI1PR05MB64645727AC499AC722926512BEDE0@VI1PR05MB6464.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB5102.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(66946007)(71200400001)(478600001)(6512007)(36756003)(66476007)(2906002)(316002)(66446008)(66556008)(6486002)(81156014)(76116006)(91956017)(8936002)(2616005)(64756008)(8676002)(26005)(6506007)(4326008)(7416002)(6916009)(86362001)(186003)(5660300002)(54906003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sk7LWu09ZwoByjIkmEQvlLQxqiH4RnuIMEtq/nKvClwtDup+cg/MnOZeo3XzsmVxtjERbGPfXzf6oYuK37UG5LqOyyTn+bgLI030iA83xYLd2zDtcrLUvV86hNgTYXTgUiqcwjOOHu77v8f0NovbBVSfSnbE79N5R3L1iw3ZcqOgW4cFHt1Z7pxLZeVXtbEm1PA0mkXAQbKbMIvm+FbSIj4OXo9dKNjXD/xTWrKtVmhQUJglYayCmbt5SQ5BMsdGLCNl2ww4DJK476m9xoUaD7yPiUmEOoR720JX4m+a66OBsyOcOR44E7LBF55F7/euhU5ZVO5XI5gPa0ZodXqTl6M1gQ9QlQOAZXcl1JxQOZ0lPAvqsFPMmjkZLa/un7Hxv+pJC4C6yHMQPL5rpy+chuoRidHN9tMjyF0UOyRFAFG0JaBL1vsB1MCmjxApk2eN
x-ms-exchange-antispam-messagedata: fRQRQ8i7wmC+3vtBoyMYeekeUdQoSpgPVRQipw7kyIsHXSlOhW2jhWSnv4RBi2axI5vyBCdqO7xCaxauTeMDlsP2XrmTgkJnMhYDf3ja4fNNLQfSy8fHU/cdKo0ff2XyDDG1Ufb6NJdTZXOo3ugDJQ==
x-ms-exchange-transport-forked: True
Content-ID: <127F1870F5B4654CB5433164FF4CFAA0@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604cbf34-e6de-480d-3b6a-08d7dd81fdee
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 19:04:27.5793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSqGcjR4gDuk13O12RhpESN0GjCOS9QCAV6UySkbBvWeWDsTQ4NoiFvRJVRRO4+iiH7j27O5w0Plz65dwzXynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6464
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
 "arnd@arndb.de" <arnd@arndb.de>, "leon@kernel.org" <leon@kernel.org>,
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

On Fri, 2020-04-10 at 14:13 -0300, Jason Gunthorpe wrote:
> On Fri, Apr 10, 2020 at 02:40:42AM +0000, Saeed Mahameed wrote:
> 
> > This assumes that the module using FOO has its own flag
> > representing
> > FOO which is not always the case.
> > 
> > for example in mlx5 we use VXLAN config flag directly to compile
> > VXLAN
> > related files:
> > 
> > mlx5/core/Makefile:
> > 
> > obj-$(CONFIG_MLX5_CORE) += mlx5_core.o
> > 
> > mlx5_core-y := mlx5_core.o
> > mlx5_core-$(VXLAN) += mlx5_vxlan.o
> > 
> > and in mlx5_main.o we do:
> 
> Does this work if VXLAN = m ?

Yes, if VXLAN IS_REACHABLE to MLX5, mlx5_vxlan.o will be
compiled/linked.

> 
> > if (IS_ENABLED(VXLAN))
> >        mlx5_vxlan_init()
> > 
> > after the change in imply semantics:
> > our options are:
> > 
> > 1) use IS_REACHABLE(VXLAN) instead of IS_ENABLED(VXLAN)
> > 
> > 2) have MLX5_VXLAN in mlx5 Kconfig and use IS_ENABLED(MLX5_VXLAN) 
> > config MLX5_VXLAN
> > 	depends on VXLAN || !VXLAN
> > 	bool
> 
> Does this trick work when vxlan is a bool not a tristate?
> 
> Why not just put the VXLAN || !VXLAN directly on MLX5_CORE?
> 

so force MLX5_CORE to n if vxlan is not reachable ? why ? mlx5_core can
perfectly live without vxlan .. all we need to know is if VXLAN is
supported and reachable, if so, then we want to also support vxlan in
mlx5 (i.e compile mlx5_vxlan.o) 

and how do we compile mlx5_vxlan.o wihout a single flag 
can i do in Makefile :
mlx5_core-$(VXLAN || !VXLAN) += mlx5_vxlan.o ?? 


> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
