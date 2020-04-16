Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C91AD693
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFFD6E365;
	Fri, 17 Apr 2020 06:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EBB6EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 18:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPFyp+yVVAguy9GDoJX/L2cwVnN1WAIQBy/jqD6BDvVHR767Qz7n+PjtvP17x9/sEN3D9IYecUEMrIYKUmIFrnU+GG+gOs7o52pm0eFvBuBl5TKBNdVoGGLuQ0IPH7DjgFAT1VAOp9qyWVrEID8TB/IFyvyFzoJO8anTdzFaZ1JFwjh9YFy+BOoy9I63rSP7eW28qpyVZ9ozVaOGEE3mQNdyLEO5x/2UkpRqxt9szNMlykroXhk72vz14NA0sl7F5hfC1lmqQh0v7yYnPQTYtxXVqBufjqeh7SihpTyZSTxrxiSvdDsFyHZDLooU2MbBU6Mwi6LU/q2SkukYiDvD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sFMZJBiXu+e96NgheuIwEIAY8ZqaXo66bCNx5DTmuM=;
 b=Mud838GwG6p/buXkO2LbvZGzVHTB5PG/mPwbmgop3x7SRS9Q932qSuT3nn2AAGbz9Hy5G6IvGtcQVOaBAEzbpp/weyKsT2cCvOfkp1kCNPuQjf1ln2C3nkw4mGHb+O5PvpMp109Lx6PyGpuxsDFr3+iEwLEe5uqhctr8nra1pnj6SsqQkaAP5GB54BgzrHWo/KJlO/p3UZl0kjVloQmsSbKZUsSeEYeaRBQr0NU7Es/USZquiVaB9IQpeSClb12Y114Yu0IJND2mPWBKygFapdFiHMjWrcODYmJizN7l1NncZ7TDnVASw5KRWCVlfGNV+krDg7Xg42b6s2NEQpEUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sFMZJBiXu+e96NgheuIwEIAY8ZqaXo66bCNx5DTmuM=;
 b=fCkEQWTfEGlNlYtlasEZj3iQ+pvvMNWBRLClAk0mxU8q34ulWXJCj/wqtMzjoaRHpPd6fUR2usCqVEPf1IL1P21bbwcOowZf0LstCJJDRE/Z42yNnsq3BYmXUQk1fa59C3DSezRnxVYT/6dd0mjg6YJwTzEzD7e5/Wq6w41CPc4=
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com (2603:10a6:803:5e::23)
 by VI1PR05MB3232.eurprd05.prod.outlook.com (2603:10a6:802:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Thu, 16 Apr
 2020 18:38:50 +0000
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::9d19:a564:b84e:7c19]) by VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::9d19:a564:b84e:7c19%7]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 18:38:50 +0000
From: Saeed Mahameed <saeedm@mellanox.com>
To: "jgg@ziepe.ca" <jgg@ziepe.ca>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Thread-Topic: [RFC 0/6] Regressions for "imply" behavior change
Thread-Index: AQHWDeQiJzc7TgrcN0yUMWAEU5j98qhvr4mAgAADKgCAAB92AIAAp0gAgAEtnwCAAPPSAIAAHv4AgAXrpwCAABBmgIAAD4MAgAAAr4CAACg8gIAAECAAgAIjCgCAAEHDAIAAMWoAgAAnewCAACVegIAAPzUA
Date: Thu, 16 Apr 2020 18:38:50 +0000
Message-ID: <a70970a2007295977708e7548e9d03a4e330a5ba.camel@mellanox.com>
References: <20200414132900.GD5100@ziepe.ca>
 <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
 <20200414152312.GF5100@ziepe.ca>
 <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
 <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
 <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
 <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
 <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
 <874ktj4tvn.fsf@intel.com>
 <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
 <20200416145235.GR5100@ziepe.ca>
In-Reply-To: <20200416145235.GR5100@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 5ff2f617-d60e-4aaf-1448-08d7e235685a
x-ms-traffictypediagnostic: VI1PR05MB3232:
x-microsoft-antispam-prvs: <VI1PR05MB3232614BC169E838DF3F30CFBED80@VI1PR05MB3232.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB5102.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(5660300002)(110136005)(53546011)(6512007)(26005)(91956017)(6486002)(66446008)(64756008)(76116006)(66556008)(66476007)(81156014)(36756003)(66946007)(186003)(4326008)(54906003)(6506007)(316002)(2616005)(8936002)(71200400001)(8676002)(478600001)(86362001)(7416002)(2906002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u7YF6XqLBrwPi3EJTVIMp9ldeGnA9a/Y/AQ6PvWnT8T8gNA+JTouTI2P6F1uWglQKuXamcdMsA7E4DFkFFZUGfcyF0jcIjBmRP04ObYl9JOAs2P6eVFf6l2yRlB8L5TFBXxZ2FRW9HI7O8hBMRHJ6eemp5GZ2FGvSIQhFiKrpCKCnu0zaavm/cYPoCEMr3csevZl+/EnkYkTJcilPE2YDx1h9R6oEBHfzd3AOIH64EZK8qY/2HQ66y1OmX+zMGvxHGfwvSjKaW3ZuvAw57iXJF9fcehwr0c+sMf5dn9lH7ldfqg+Syy465Q2zhhg7+XVmM45V8vsCoe0iEjMLXt5EhNfJGOyyDNViuatvrqiBKgZE8bO0iZTRSio5UpQQEqL61X6V+WRnAhkeNicaHaZRl3FFdYQAuPDiKHyJba76E/8/79xzNwaLfzCPO6C6RQX
x-ms-exchange-antispam-messagedata: urV8UQexO3tZvNbGir9Qw63nzZuZwtToJZU8auI3nD7RCxPdQVhsVvOnfQgHfRIvYKHz2/O2MDGZNeUgABc+EUBjY4ZVXTbN7J9npXPtPIirRxcmVF56cKc5ZU9erydipY7HJEJj1wkCbTTUgnyXLw==
x-ms-exchange-transport-forked: True
Content-ID: <CFF119492D80694E9DC1AF394A011974@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff2f617-d60e-4aaf-1448-08d7e235685a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 18:38:50.6293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zi3z/Y0lver7ALij2eNGF9mvZoESH1CY+ggO8UivIz7BBEKj11zntnY/FrlB1Ub29rwYRHt3z567tZSAy0an4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3232
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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

On Thu, 2020-04-16 at 11:52 -0300, Jason Gunthorpe wrote:
> On Thu, Apr 16, 2020 at 02:38:50PM +0200, Arnd Bergmann wrote:
> > On Thu, Apr 16, 2020 at 12:17 PM Jani Nikula
> > <jani.nikula@linux.intel.com> wrote:
> > > On Thu, 16 Apr 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Thu, Apr 16, 2020 at 5:25 AM Saeed Mahameed <
> > > > saeedm@mellanox.com> wrote:
> > > > > BTW how about adding a new Kconfig option to hide the details
> > > > > of
> > > > > ( BAR || !BAR) ? as Jason already explained and suggested,
> > > > > this will
> > > > > make it easier for the users and developers to understand the
> > > > > actual
> > > > > meaning behind this tristate weird condition.
> > > > > 
> > > > > e.g have a new keyword:
> > > > >      reach VXLAN
> > > > > which will be equivalent to:
> > > > >      depends on VXLAN && !VXLAN
> > > > 
> > > > I'd love to see that, but I'm not sure what keyword is best.
> > > > For your
> > > > suggestion of "reach", that would probably do the job, but I'm
> > > > not
> > > > sure if this ends up being more or less confusing than what we
> > > > have
> > > > today.
> > > 
> > > Ah, perfect bikeshedding topic!
> > > 
> > > Perhaps "uses"? If the dependency is enabled it gets used as a
> > > dependency.
> > 
> > That seems to be the best naming suggestion so far
> 
> Uses also  makes sense to me.
> 
> > > Of course, this is all just talk until someone(tm) posts a patch
> > > actually making the change. I've looked at the kconfig tool
> > > sources
> > > before; not going to make the same mistake again.
> > 
> > Right. OTOH whoever implements it gets to pick the color of the
> > bikeshed. ;-)
> 
> I hope someone takes it up, especially now that imply, which
> apparently used to do this, doesn't any more :)
> 

Well, I have a patch since yesterday.. i though You and Arnd didn't
like the idea, so i dropped the whole thing :), but apparently you just
didn't like the name of the new option. 

"uses" seems like a good name .. 

I will post the patch.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
