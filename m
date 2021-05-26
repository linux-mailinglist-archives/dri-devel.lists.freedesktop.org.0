Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C00392369
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 01:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443206E12E;
	Wed, 26 May 2021 23:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135086E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 23:53:00 +0000 (UTC)
IronPort-SDR: SHzAiAfKeI5xRV3Zixqa4LDFQ82+agSkFEdhVS2pfe2O5hs4j5XA02+NLdPEj82w9vd1Zyi8jh
 nDWA8C0kXZtQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182944408"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="182944408"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:52:50 -0700
IronPort-SDR: kiFtZ+Lz+gSxRiprxflquMVboZ9w7V85IlR8ReaQ6dmGb1Nz66lrgdMzBgPxZbVhKIndLucpur
 /rSc3O95ES1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="480322372"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 May 2021 16:52:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 26 May 2021 16:52:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 26 May 2021 16:52:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 26 May 2021 16:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsSjib84RbGvYGjAIkLfbecUl7wC2pBrn7mIGQ2WCSriVXpSwLPXvauZVYfdbXzj4pNQcq4PzEvkk4mkJGq9soR6HLJD677afFbPciAYR0yC08rbT7vSbA9GkUbXtOrRzdzRBJM/fttW5f7j/l6o7piQaswrEd2A9o1YZDnJfd3ZtwzD5nObSXUy/IyOmqo9TuOayjO3CyZDxDgCmBqyfnG9QeOgUK2aSvLbQWfDlkVPrWMNMB2xaGubzuMj57/zK6+LeHXGZsbVzeuLashZS12G1mK/a2s6tdT683wIxDkxtwD1rs4JowK5DWhjAzjjhbtbq7nPuwA8JpVC/XDdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32v3S1CJxmH5O+WALYFhaBBYsMF/PghJug3bHMziKAw=;
 b=d9ZVat3AoEP0fNEnSwPcbsYt6dZ/LWvvVHKfRWytubjL1y5h1wOFXxOBGk8n/Fjb1xlDAGNvUAijj6pgSzVkYkkl/+vdT59LTCgWWnCNaToFEQPBzuykg0+XOd3yiHXkFuAHfmFx60llS/SmIOZUMGD44TNc7KHpeN2vXKWtKmxm13dxOg3iL2QsnpXJcQCYBXIuULX+HY9/r1Rt7R7tgosx7EfNHBfOOZAybqqTEfC11pjPtOGno5M3tc7PtsoDzheNCMnMxY6rB4BCzoc06OcvKK22JstdUcZH+KVxhsisUYceEGvRHvOt5KXIhF4a/s1TKhThy+JAsEZIup36FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32v3S1CJxmH5O+WALYFhaBBYsMF/PghJug3bHMziKAw=;
 b=uh2GIfLRoDIvih/tEcw8p2+gG3rbz9UJfTsVtlLY2VowAiAX12u07ItVSNNmzDdhH3w2Orek4LQMY5nowMJOCOlQn8cFbwCTMRhvGNc95icz963orMQnDmYd3x0Dnv5MCd4S7/PdXjW55Y9UWFjJA9kdHoJSwkyWYYw+7euUAxk=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 26 May
 2021 23:52:47 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::f071:7bd8:d502:a6eb]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::f071:7bd8:d502:a6eb%3]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 23:52:47 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [PATCH] drm/kmb: Fix an error handling path
Thread-Topic: [PATCH] drm/kmb: Fix an error handling path
Thread-Index: AQHXTPAusZt7CdpHvU2ZAVNhU3ow06r2dQiA
Date: Wed, 26 May 2021 23:52:47 +0000
Message-ID: <BY5PR11MB41823586394287D8D1D85B9D8C249@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <ce19f0d78174b0674dc963d134fbdec222250e84.1621457119.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ce19f0d78174b0674dc963d134fbdec222250e84.1621457119.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: wanadoo.fr; dkim=none (message not signed)
 header.d=none;wanadoo.fr; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.41.68.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fa06a48-6247-46ea-f2e7-08d920a15d58
x-ms-traffictypediagnostic: SJ0PR11MB4976:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4976BFD2A8C391B0698039588C249@SJ0PR11MB4976.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4xPMiV5VXBUsVd+yPKGTzU1Uu36lKSe8pS04+QtN5rt6vGdCBdRHwNtpzhZr9mt5y8kCllman+oMD8M5C75QLn7tR4RKNa8Uaohv5mQzAwtQKU6fDbRaMaKQM3H/19Dmlxo7rt2hhTm1Q/1JfthVqUfFtb+/KlZBpNJzr4fJeYZXeOy7n4QGNFJVnWhEge/8Yzzfq4V2pX8hBH6t/U9/FHeJO80GjcfxC2uz/tLiirrFUTsfcRYmBEGczdRYYmEPan+hym7/gzdkUlKW1x5c2Ye07xTuxPyp94wMMI6Rz1f52oPFepQN7aPg+rHs3+DPcXxlV9qT083VWDzXrb8LacZUg7xIBxxsQecDiLygANqbZNoqK40w+pBJa73803BfA7SvD7lR+kIX4gN6lseAwXpCnprf6ly8LHDgkkhAtSEWgjNjspdPDJdPGSNRQ55h/HkEm85WCA6wqQTbrgNNe3RRxR2kXJ1clGzal9s041R/vsknA/yKHiJzGdoxEgodTo3oPQ/md0hvw6ukiZoUHEQ/ozAdj9pf+V3cZwQXS1eHIiWwAdT/ey60ZGWYFFycL278HX/KOdHifBfFptFNDrcMiRRDRSdOsQL2AHyq21Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(346002)(396003)(39860400002)(5660300002)(2906002)(71200400001)(64756008)(4326008)(66446008)(66556008)(52536014)(86362001)(9686003)(8676002)(186003)(8936002)(33656002)(122000001)(53546011)(7696005)(6506007)(83380400001)(110136005)(55016002)(26005)(54906003)(66476007)(76116006)(316002)(38100700002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nGnUAIXjhAN3EkgcS+VDiVvbdkBtoK4p03NwqCSqSExtS6LcKKUUJPk6nLE/?=
 =?us-ascii?Q?kQ3GcrAF8SL2IOmL+XNHG2bD2RlZJYN+uvUtFAYfQsLxmM/VGmTguE4xFXKt?=
 =?us-ascii?Q?auHfrQaIloE9oohOXvs21VtAnHYXt2Y7R+r46eJcHoEsqtmTNbZdGIlgq2IZ?=
 =?us-ascii?Q?zHJUkh+r0eH0WDQsO2tgQwkh4PNKt8DNkFB1tT91l9T/6iNjDyslniukonN5?=
 =?us-ascii?Q?n0ftQhKZygy4qm7pVpzhmkNQzMI1c3uSFOd1WnoX/7oo/BLXgqKVEyPsjYFl?=
 =?us-ascii?Q?tKM8GH2UTUiwNhc4kgckkZ6Ndb+PgQnGwb36dU9vomBDcVOU3mCEChZxhoFZ?=
 =?us-ascii?Q?mA4IgUGiPnPVKl4BJpGBXr0yE86xu7naxc9BtpCHU8c2W0qosYAqOFtwHQsO?=
 =?us-ascii?Q?Cfu8Pr55mD/61R6PWE/AW9LiwOEYcg/IXeSIWGoFgeUXCK88IA4crtqPVKZj?=
 =?us-ascii?Q?/rx7cP9M526sODnUUwJj//0COhZdI203PfrN4EZjgFhuMP9NGBNXtpVD28pa?=
 =?us-ascii?Q?fs0KtOLYMJyH8WJNiAOCr34PLO1GzhsVI9vQM/8KmbcedjETXuxp7MzRLG44?=
 =?us-ascii?Q?QchMKkU/CXMtr3RLQHbYdIzhDbj3/e825kx/O16EM06JCZN1XA8WDE9O9rqa?=
 =?us-ascii?Q?pkBvypuogSxxSlqNPD/dOsh4TlozbCQunXTNp74OgeQGSJsd1g07t81x2wfh?=
 =?us-ascii?Q?2D4oOeyW4yanj7cpIMDGAyl777EgHE7KFFjstCl7mxqk6Ybz7HihQE2xchDR?=
 =?us-ascii?Q?e7KkDcaVzQXUI9qGPSIWnlTnKZa3yt+hgo1JMXfQTCQ33AZS1fmi8aQ8dRT9?=
 =?us-ascii?Q?8w4GVtccdlW7Kkq2UGGqsAtl9TXrY9y6LQhFhmxrd53E04HNZj/Ohx0cyEQa?=
 =?us-ascii?Q?EbLEKFteHBbRktqUav6ulbjuIN+hqbxTIUfs4YJ4l7GALO1Ej125GmHJJyoU?=
 =?us-ascii?Q?kV61+N92ihlRtq9Vm2mrv72ruhY0pKiK09o5UStN5vWsbxZfGHcToQO4G9CZ?=
 =?us-ascii?Q?Jqbmw3JGdx50Isr9MqhZfJZmx7F+JfGHZSJN7EpdNejOVSFTryDtXTwyjsZV?=
 =?us-ascii?Q?yklCRmnFH7PFCpvjvT3pjWpp10y+AXQvoyuuTDXvu/aCBJW1s/YoxIdWYTQq?=
 =?us-ascii?Q?xBaIlad8bJK6E3CH8ipMmKkgKpDNvDBALAJQ53kR0k29RPyu8oLaGzInB2PH?=
 =?us-ascii?Q?W+ti+jz2+qa+hcGdAhMYxakDeAJHqI1RyQStbIX2PhOiwvitfKkHTQTJXOvT?=
 =?us-ascii?Q?RVxIYwN+yaq0q6npwZMDtZMvBxfY+z2LIy+w2XTw9eGxS7c5clrGEdP3Uoby?=
 =?us-ascii?Q?fZ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa06a48-6247-46ea-f2e7-08d920a15d58
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 23:52:47.6250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JbRzvLzYJvOus4Nuj/dSXpDN8aZr1ef+VKkyii4kbO8Jx80y2CBYS6MypHzptX0uRep9MaiyJGPDVN6OCFUzuPWc0X+G5fDS4+zoA8gQaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,
Thanks for the patch, good catch! Patch looks good, few minor comments.

Anitha

> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: Wednesday, May 19, 2021 1:47 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; airlied@linux.ie; daniel@ffwll.ch;
> sam@ravnborg.org
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel=
-
> janitors@vger.kernel.org; Christophe JAILLET <christophe.jaillet@wanadoo.=
fr>
> Subject: [PATCH] drm/kmb: Fix an error handling path
>=20
> If 'platform_get_irq()' fails, it is spurious to call
> 'of_reserved_mem_device_release()' in the error handling path, because
> 'of_reserved_mem_device_init() has not been called yet.
>=20
> Moreover, a previous 'kmb_initialize_clocks()' is unbalanced by a
> corresponding 'kmb_display_clk_disable()' call, has already done in the
> remove function.
>=20
> It is likely that 'kmb_display_clk_disable()' is expected in the error
> handling path, instead of 'kmb_display_clk_disable()'.
You mean instead of of_reserved_mem_device_release()
>=20
>=20
> Also, it is spurious to return directly if 'of_reserved_mem_device_init()=
'
> fails.
> Goto the error handling path instead to free some resources.
>=20
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index f64e06e1067d..b41b8789fe57 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -138,13 +138,13 @@ static int kmb_hw_init(struct drm_device *drm,
> unsigned long flags)
>  	irq_lcd =3D platform_get_irq(pdev, 0);
>  	if (irq_lcd < 0) {
>  		drm_err(&kmb->drm, "irq_lcd not found");
> -		goto setup_fail;
> +		goto disable_clk_err;
Keep setup_fail label or something like err_free_clocks
>  	}
>=20
>  	/* Get the optional framebuffer memory resource */
>  	ret =3D of_reserved_mem_device_init(drm->dev);
>  	if (ret && ret !=3D -ENODEV)
> -		return ret;
> +		goto disable_clk_err;
>=20
>  	spin_lock_init(&kmb->irq_lock);
>=20
> @@ -152,8 +152,8 @@ static int kmb_hw_init(struct drm_device *drm,
> unsigned long flags)
>=20
>  	return 0;
>=20
> - setup_fail:
> -	of_reserved_mem_device_release(drm->dev);
> + disable_clk_err:
> +	kmb_display_clk_disable(kmb);
>=20
>  	return ret;
>  }
> --
> 2.30.2

