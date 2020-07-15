Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB5922145B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 20:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25DD6EBEA;
	Wed, 15 Jul 2020 18:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD666EBE9;
 Wed, 15 Jul 2020 18:38:54 +0000 (UTC)
IronPort-SDR: qN66n9EcEdlxD5hGK8r4NdmhWsweZr3qicBYASPwTFNSsjoR5MlJcfLAlNjtATc0cvXVlM1Bkn
 /2bhyAbGUlgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="210777869"
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="210777869"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 11:38:53 -0700
IronPort-SDR: MpJvBJlNuD6ZxFdBOBcZmmSxRXqjoysLJk5qg3UxKyTdUGnLnCXMd/y41Lib8G8YMQCnlqqnHK
 AKMfAgnx4ZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="316795072"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2020 11:38:52 -0700
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Jul 2020 11:38:52 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx124.amr.corp.intel.com (10.18.125.39) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Jul 2020 11:38:52 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.56) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Jul 2020 11:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FW51Zs4DJyG49apeNU0ynodARGPjFpJ9HWHLGLWvDG39licabiDNZjXvSbGQ9qO37yXHDXa4YQu8FVZ0Gw4tgEmkg7eXmL+smTFFZK1321eINSLOTKYv6fcSzdLsE/kjQn8kjwUv0/kJ0oqCTFMBw6CZxJw2wQ9fJFzfEfByKbM7hp+tR+AYMyiCieOVTKrHqOcLUkahDcpzm4bHejlJEvzSqI0D8od2TSqMvbRLNTTf1EaaGSu3Ae5lCj4sdIp0Y0NHWuJPGdyYM2QOwsTSdCPay7TmYrbTCz2LMCLplNdMGi7D8GP9KXNfgPnapuR7RkC6TwV1JjGF7ZmqhqKwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IzYiRwZUZ11d4Xs8Eo+IkXr0gekXzPtfJSYAV1Rk2M=;
 b=nfG145dfzDUoxfjot8SESmBQK4KoFb9EfNp1ZrWPbcQj/wDbj5vwYjPTbaKnnsFZbLLZNuRBpi7L8v1Jj/q2irYJVswQHaq8nqy7LLk7OeSh0HajdodR60Kuuj4uD+bNwJQk4WNpKBh5brOl3PNz336ywMpOkI0V3FTIi9Hgux535HmyXWKxbPMoea+R/88EpIS0W18Vifg6yFZutUVT/Y3MSdhd3rfj90HORFerae5zcU+IK4/4Ra7VeAPYiQVKydkVv16lCg6nssjdxpoaxDcvQlcdh6dstU1f5fg1389aSD/14EPsDRgSWAIMZAiGXkFiKBkBwuHhOLs1lB8+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IzYiRwZUZ11d4Xs8Eo+IkXr0gekXzPtfJSYAV1Rk2M=;
 b=ORB+3mpOdLh9+Ws4rIVEpUOtH/sM9Sw9DAbuvEui6s/sagNzHaiQZ3zL+dV8j3tjg/gdGBTBvYOFK1ZN5is9EM3QPnB3pc1G5o7XyOdGKoLgMg7YJrIan6k04tHK5lZykic+z0Nsy4Eo2qIS3HKP/fGA+xzw4kEFjw89veYq3F0=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2805.namprd11.prod.outlook.com (2603:10b6:a02:c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 18:38:49 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6%7]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 18:38:49 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [Intel-gfx] [PATCH v2 00/59] Add support for KeemBay DRM driver
Thread-Topic: [Intel-gfx] [PATCH v2 00/59] Add support for KeemBay DRM driver
Thread-Index: AQHWWiGF5SgYwq01h0eUn21zTVNlr6kIvpWAgAAhz4CAABkdsA==
Date: Wed, 15 Jul 2020 18:38:49 +0000
Message-ID: <BY5PR11MB41824FA76BF4E49D47EB394A8C7E0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
 <20200715150549.GL3278063@phenom.ffwll.local>
 <20200715170649.GB1785807@ravnborg.org>
In-Reply-To: <20200715170649.GB1785807@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10773ec5-7631-4ce8-5f25-08d828ee50cd
x-ms-traffictypediagnostic: BYAPR11MB2805:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB28054911301E177BA0831DCA8C7E0@BYAPR11MB2805.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVwKzAhGpRaVyGjkZgdb/ua6Am9xreY6PldvXwTbisgd7O4evEJjc7c2oYKgl/zjaO6a6iI0KKea/MzgyeLAzpZGjVERZy/LDbZj3JMI/qgSt49IZNzc6543HAS8iF3Jvze9mpRrNuZoDsLr7iIZz5+I1CU+2B/pCYicA7t4aSA3JtrUqdVQM6Anat5GL22CTLtCQQDiiPI8aK5O1o5BBNPfJrAuGwXXTw90HocZfYmR0oi8jILlaPbh8w26ra4GgRulvtG8vzVXKf+h0HG1xQz2BlNv5lfMZhf6Ikb1gMeipv2GJ6FFeB+aMR/KAkjHh5BPiNMEW84PNmJZX645JzIOv9GBDQLB+ISuXILxBlRFgg3nokHw8xqbeCGdQ9f8lBjDJjvhEJfJm+krfaXPFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(9686003)(26005)(316002)(55016002)(33656002)(966005)(66476007)(4326008)(76116006)(54906003)(8936002)(66946007)(478600001)(2906002)(6506007)(8676002)(66446008)(53546011)(66556008)(52536014)(71200400001)(5660300002)(186003)(7696005)(83380400001)(64756008)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9LYrMYh56K0HD1+luoNCMP2jWzzIcjlFQpPvhb0tzXHaIqQMKBju6vZPYI4WCJzaDOVXQC1eGD6Oxp2ooW9LSjkVaMk+JopfHtjCmR4nQfnxsG77hkKs4sdNr1jczC7CyhIpvkGQZpbxfEfoJqWWPPZOT9vKLtsXAse18Rpemrp/iQkQJA0pz7ZWW3l8mMAX62E9HWZA5HP08LZfllAtkm9EeEShIwIkmbxdWDDkyIMY57gPWi1L09y78Eh798zHY7gR9ZPpdY74Y8yvGg++C/7rK/4Kk+TYQg8GC/nkhJ58A1hSOk/YsAb6yKzANR/hysiNI3q6f5oNqpB7xXFcKO5C8IaiGuq+RLfPPNXljv9sP/PgsFRiG/v4p7U1G688Ulc3LOPA7UgLnl6d1e67DZEGO7cy/8xNDtxNI3ZkyA7DTrtPA8FYJqGjK+bofdnb808u72oZ05kLVerwtZtbfIVJKww69rr46py2NxjSPkVLduh3Zd28EN75qMq76PSm
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10773ec5-7631-4ce8-5f25-08d828ee50cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 18:38:49.4210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pyZNVhv/TiHqfsSUVLt+vmy6NnVote+O47t0r4KCbpT1+6XqmxD9QuR4MG5E4KALqLmHWky9tNS2/mhZj4ICAlHgmmfN73yLf7GPW7fVtUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2805
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Dea, 
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam and Daniel,
Thank you very much for reviewing the code. I will squish all the commits and send version 3, so it will be easier for you to review.

Anitha

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 15, 2020 10:07 AM
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; intel-gfx@lists.freedesktop.org; Dea, Edmund J
> <edmund.j.dea@intel.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH v2 00/59] Add support for KeemBay DRM driver
> 
> On Wed, Jul 15, 2020 at 05:05:49PM +0200, Daniel Vetter wrote:
> > Hi Anitha
> >
> > On Tue, Jul 14, 2020 at 01:56:46PM -0700, Anitha Chrisanthus wrote:
> > > This is a new DRM driver for Intel's KeemBay SOC.
> > > The SoC couples an ARM Cortex A53 CPU with an Intel
> > > Movidius VPU.
> > >
> > > This driver is tested with the KMB EVM board which is the refernce baord
> > > for Keem Bay SOC. The SOC's display pipeline is as follows
> > >
> > > +--------------+    +---------+    +-----------------------+
> > > |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> > > +--------------+    +---------+    +-----------------------+
> > >
> > > LCD controller and Mipi DSI transmitter are part of the SOC and
> > > mipi to HDMI converter is ADV7535 for KMB EVM board.
> > >
> > > The DRM driver is a basic KMS atomic modesetting display driver and
> > > has no 2D or 3D graphics.It calls into the ADV bridge driver at
> > > the connector level.
> > >
> > > Only 1080p resolution and single plane is supported at this time.
> > > The usecase is for debugging video and camera outputs.
> > >
> > > Device tree patches are under review here
> > > https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-
> daniele.alessandrelli@linux.intel.com/T/
> >
> > Cool, new driver, thanks a lot for submitting.
> >
> > > Changes since v1:
> > > - Removed redundant license text, updated license
> > > - Rearranged include blocks
> > > - renamed global vars and removed extern in c
> > > - Used upclassing for dev_private
> > > - Used drm_dev_init in drm device create (will be updated to use
> > >   devm_drm_dev_alloc() in a separate patch later as kmb driver is currently
> > >   developed on 5.4 kernel)
> >
> > drm moves fairly quickly, please develop the upstream submission on top of
> > linux-next or similar. We constantly add new helpers to simplify drivers,
> > and we expect new driver submissions to be up to date with all that.
> Seconded!
> 
> >
> > Another thing: From your description it sounds like it's a very simple
> > driver, just a single plane/crtc, nothing fancy, plus adv bridge output.
> > Is the driver already using simple display pipeline helpers? I think that
> > would be an ideal fit and probably greatly simplifies the code.
> >
> > > - minor cleanups
> >
> > The patch series looks like it contains the entire development history, or
> > at least large chunks of it. That's useful for you, but for upstreaming
> > the main focues (especially for smaller drivers) is whether your driver
> > uses all the available helpers and integrations correctly. And for that
> > it's much easier if the history is cleaned up, and all intermediate steps
> > removed.
> And also agree on this point.
> The submission could be split up in a few patches where the split is
> file based. So only with the latest patch, containing Makefile +
> Kconfig,the driver i buildable.
> This would ease review as one looses focus when trying to review 1000+
> lines in one mail.
> 
> You will loose some of the internal history - but if important keep
> relevant parts in sensible comments.
> 
> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
