Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320AB3DF4D0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 20:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E58D6E8AB;
	Tue,  3 Aug 2021 18:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537D36E8AB;
 Tue,  3 Aug 2021 18:36:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="210644370"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="210644370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 11:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="500914389"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 03 Aug 2021 11:36:12 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 3 Aug 2021 11:36:12 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 3 Aug 2021 11:36:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 3 Aug 2021 11:36:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 3 Aug 2021 11:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9wu/cWqVD8wNRB2PMjGhZTpx3To/lCsyS29JnXBTUPB60fqMOCEl6qVwUzYcsM4FvnkDjKbX9Oa25H/EqNaghp2Zloh/YoHWatJ6bAFdgHMhQ2ATYqlqMM/dzxHeicjXnp5oq4mNodsoR/nvbj3AvwDZZXYTzpBkRDRYAGjMWY7/DURshXd5K19mcKPZSOWM4qgIT87AAFFH3oSzN81cJoskw7uidGGf1h4uaCYDvEnnSMHc6j8QjYNBVxqsaFDgzSlkaoBUCWhlaE+ZjTErmlOJFz/zer1yyYo8q8uDHlH0Lssm5rOWz0mtU2TX7nN41g+AwGB0zOcVbneL2dbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SLj34L5ORnipK7P8Mu93rnAaEleScQOh//mHKC51FA=;
 b=b6uw+RMBdnvpZVFS9QK77UYNYX+NBDv8IoffENRmaj42MKXTMWcCF6yxxCRve8GvPbVUA7lsQJTNy7yscMcCbVvMECUv6uQfUvmvvUGaNv5l55kLJqmmT/+eYUMsi3R1K/5O5z49mP9EMxZShOInKQOEQWDPQsYTNiKzNZMwlX/9TGalIIM9TguLs6J2QGfgQ1dBr8HI27AS6BAfJJgxEPqqXz+z+0kADDy6UHVoxZOQoX4xDYkaMrZ/7thikvfgroR9vqVmnnFUi2GliyN4QknKSsI+MQz+aXkAjaxzCf9IDg4K8lg0xtjzA93XVBU9Wj48zxUmegeNKmtvWeSg0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SLj34L5ORnipK7P8Mu93rnAaEleScQOh//mHKC51FA=;
 b=Xh0RgAMRSMjByRjz3n8VpnrnqKozzlWF8daWNX1mTZOzLtVg50hUdU2v4bDJTcAUlgQ+1OZcOezTX2VDDC1AIdQq9v8Oxjd7eeUtkQlCr8GybJ1i+PO/N4xckjktNj3/A8T+/z7tUkjcy8Ld6/9NAuWj9ZNOB/pCYFmz3cQnm5Y=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB4273.namprd11.prod.outlook.com (2603:10b6:a03:1c9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 18:36:10 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 18:36:10 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "liviu.dudau@arm.com"
 <liviu.dudau@arm.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "stefan@agner.ch"
 <stefan@agner.ch>, "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>, "sean@poorly.run" <sean@poorly.run>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>, "tomba@kernel.org"
 <tomba@kernel.org>, "Dan.Sneddon@microchip.com" <Dan.Sneddon@microchip.com>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>
Subject: RE: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
Thread-Topic: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
Thread-Index: AQHXiEb1AFPCZWr2Z0Sou03cU4voIKth4UYAgAA3trA=
Date: Tue, 3 Aug 2021 18:36:10 +0000
Message-ID: <BY5PR11MB41822706053ADEE927E34E628CF09@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <YQlbFjbrnyeWv7QP@ravnborg.org>
In-Reply-To: <YQlbFjbrnyeWv7QP@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd8a2c5e-1539-4fac-231d-08d956ad907f
x-ms-traffictypediagnostic: BY5PR11MB4273:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4273B572E14FCD2152690FC88CF09@BY5PR11MB4273.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4BUuMIAMMJDA85LwgHtofU07yqaXMEgDCPpXIZqKwa5zjSwXc3027MTU9Vmupml6QGk5fXFFyMMyseeTahxaOnsvMLJG1t91E/oVuK4iBfT0yoDTZQiD0TTEW9ZEgEDinm3bQ22D046nfPIdiNmF5sqROL0jq0wCE9EqE4qJAY9FBVpYy+HxbgFbs0lJEhD5vAbp9T9BWBFY8vX8rU/vY59OBoR6bNZmPqKxbUMSDlLIn3Dou4LZkwZbA17Nw8mvrPOFT1a3PxD2j+aF2VZEOl8X9+LzKmzZ3Fkn+VofxHYp2s0+3mvNuLXNuNaWpUZfhWIgHznf0CrgjlnMbMAwj5pUhgqJKUgHBgQl/YXxkBGdO6t8d39/IXcZo31qDqj3C3CRIAXaSpA+XDXqd5yYAfpZtSBD10teLsxhkGr5xVVpMvcHIh5ot8JuyGrKJpvacfbakizeKZelvq1+9l9pD1QNf6gJal8D7XmTu58N2DeJ0e7DipnjnDCO4xVYGtsh0HOZeest9Mjsnbys9baMLw+/7TnB0400L9BnBu4IIzQ4TGC+pU5KssyybA1Jx5CMMBRXxIImrzOzAQNvhPMu9ly6zE9WDl4BrPPFHxv/3SmoulERSC62wlOeS3wNbauruRYIoJKkX8EKyMhWWm4FAAM1Sx4Mj6DD0B4YONrneDyP7dADLQZBJlvRIfWTe5US6jlix7vN4cQ1l3DlpGSHTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(33656002)(6506007)(8676002)(26005)(8936002)(66556008)(186003)(66946007)(38070700005)(54906003)(316002)(64756008)(7416002)(66476007)(53546011)(66446008)(4326008)(110136005)(71200400001)(76116006)(86362001)(122000001)(478600001)(55016002)(5660300002)(7696005)(52536014)(2906002)(9686003)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kLpfsfNMoXE9OlvHRKp87dvHY4Mz7WAqG0jmUZoPCAZtwjt/rLwZVnxAjELB?=
 =?us-ascii?Q?WJDG4rWzz0XGuHDvAyFQqq96xNwZXHORKfkfYbCPk9e0Xu7vc0hy7dC5CWhp?=
 =?us-ascii?Q?G30+GCquH0pT0DFNmv0aETOTLocFm4ON7IRAPAlRyF/r1f2Y9vgP8tBrSSUt?=
 =?us-ascii?Q?PZFxp7oshjzsMAq7ZN30yDe/wPF1AWcbfPy0Xv1AGesC9PyRc0xPmn1bm05z?=
 =?us-ascii?Q?8a4HNj4oFmlu9B+ORF6I0a9WjhzlFjCvVTILM/iRL9LS31hdhHhJwoqNHt79?=
 =?us-ascii?Q?GkWT2Vy58KEA3pWPQFIA5TqYEJ9zGha6wCTUWi6xoFvy4UbPKtmAsddeT9Iq?=
 =?us-ascii?Q?gBGA2RhHMbTqXLs8eYE4EHyLIgWXDQQkgR1FtcEFiPcJSYKZx2H3xSuocCiq?=
 =?us-ascii?Q?GX0ml4vxZSro5h4Fwba8X9hnsoaRxyhzfQQOhJKo78eA2hABomCeGx4JGHAP?=
 =?us-ascii?Q?6toI7N7xTd5rR8zKAIb1Ax0Cjozqft21/cDVbJxxLge2U7JrOrStKR12TbZM?=
 =?us-ascii?Q?vWhttPde/BA1CC2stRdf9ZHhaWh9djHrjgNgK13yevKRqUQcPqHx8PdjJah0?=
 =?us-ascii?Q?wfOWI13mU+2jAvFt8ANBOWD8j5VXaxnP8n4S6DuBv8d409lSukpNd3UX8U+J?=
 =?us-ascii?Q?sY7v+Wt8ereq6Y/lI3QLi35aE9+EsYcAHnziFM/De3BOIDaBOgD9pr59+N51?=
 =?us-ascii?Q?10GBWPM6uIZrFNTnEK2DjRTbV24YS4QkVg/2rSRstzmCd2z04rPEEuE/aL3w?=
 =?us-ascii?Q?4L3aYsV/2p02FdSxEZ0wo1nQQL2XBo4OrBkjc2hPt5oXMT7pJTHOV+ix1E6I?=
 =?us-ascii?Q?smIjRh6u8DBgBoVqphHSKLuNRZfj+45lQCDy717ZuG56cDlO1AbGJ8qBO3Ql?=
 =?us-ascii?Q?p/mo082ROSVtRKEgkMxlqXv4Jf3vzjI+csb9UERI/CcsvD4Sme1FfIRMmCuU?=
 =?us-ascii?Q?P4fD1VXRRZObGwUO0aGLBJGgxHilR7Zjoq/XgFdG51sDJnMmhwdQQLsyRxxs?=
 =?us-ascii?Q?zPpmVHZ6LN4kE66ZruBdBjc5JGZ4HLiXHPIw0EggLcb6LeXYBQSt/31pIgCf?=
 =?us-ascii?Q?0YKw+DcrdntZBgOxYRqjjA5H1AvmtSc/66zCyrhlmkg1vUKZc1yfm0Rr/7J1?=
 =?us-ascii?Q?CRZxuTWbfQDPrdlPOopx5DrTx4DbjPBwdKkNnDp/1WFRivePjo0p65qwWtUe?=
 =?us-ascii?Q?NVhugncVjNze1NmBrOX2C+JT+oYLV/7RxFOJAnEAe+EOyvfMS1zvfPyIT33b?=
 =?us-ascii?Q?RpOYN/7VfqsxYXWIBSBzUSs9uMAuIgQ+KxvY91w3vXIXivlv2+CaO1nzA6aM?=
 =?us-ascii?Q?DS4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8a2c5e-1539-4fac-231d-08d956ad907f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 18:36:10.1578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTrW05wXTL7rqNIA5lLodc55LHaD0K5b+gvRYmJrUShzxfjga0HwqFKxxEnMpJ+TuUwDFlB2KxTU53yi623E3JGQ4oC5OiTV2w01jjaN06w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4273
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

Hi Thomas,
Can you please hold off on applying the kmb patch, I am seeing some issues =
while testing. Modetest works, but video playback only plays once, and it f=
ails the second time with this patch.

Thanks,
Anitha


> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Tuesday, August 3, 2021 8:05 AM
> To: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: daniel@ffwll.ch; airlied@linux.ie; alexander.deucher@amd.com;
> christian.koenig@amd.com; liviu.dudau@arm.com; brian.starkey@arm.com;
> bbrezillon@kernel.org; nicolas.ferre@microchip.com;
> maarten.lankhorst@linux.intel.com; mripard@kernel.org; stefan@agner.ch;
> alison.wang@nxp.com; patrik.r.jakobsson@gmail.com; Chrisanthus, Anitha
> <anitha.chrisanthus@intel.com>; robdclark@gmail.com; Dea, Edmund J
> <edmund.j.dea@intel.com>; sean@poorly.run; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; jyri.sarha@iki.fi;
> tomba@kernel.org; Dan.Sneddon@microchip.com;
> tomi.valkeinen@ideasonboard.com; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; linux-=
arm-
> msm@vger.kernel.org; freedreno@lists.freedesktop.org
> Subject: Re: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
>=20
> Hi Thomas,
>=20
> On Tue, Aug 03, 2021 at 11:06:50AM +0200, Thomas Zimmermann wrote:
> > DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
> > the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
> > IRQ interfaces.
> >
> > DRM provides IRQ helpers for setting up, receiving and removing IRQ
> > handlers. It's an abstraction over plain Linux functions. The code
> > is mid-layerish with several callbacks to hook into the rsp drivers.
> > Old UMS driver have their interrupts enabled via ioctl, so these
> > abstractions makes some sense. Modern KMS manage all their interrupts
> > internally. Using the DRM helpers adds indirection without benefits.
> >
> > Most KMS drivers already use Linux IRQ functions instead of DRM's
> > abstraction layer. Patches 1 to 12 convert the remaining ones.
> > The patches also resolve a bug for devices without assigned interrupt
> > number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
> > not detect if the device has no interrupt assigned.
> >
> > Patch 13 removes an unused function.
> >
> > Patch 14 moves the DRM IRQ helpers behind CONFIG_DRM_LEGACY. Only
> > the old non-KMS drivers still use the functionality.
> >
> > v2:
> > 	* drop IRQ_NOTCONNECTED test from atmel-hlcdc (Sam)
> > 	* use devm_request_irq() in atmel-hlcdc (Sam)
> > 	* unify variable names in arm/hlcdc (Sam)
> >
> > Thomas Zimmermann (14):
>=20
> The following patches are all:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> >   drm/fsl-dcu: Convert to Linux IRQ interfaces
> >   drm/gma500: Convert to Linux IRQ interfaces
> >   drm/kmb: Convert to Linux IRQ interfaces
> >   drm/msm: Convert to Linux IRQ interfaces
> >   drm/mxsfb: Convert to Linux IRQ interfaces
> >   drm/tidss: Convert to Linux IRQ interfaces
> >   drm/vc4: Convert to Linux IRQ interfaces
> >   drm: Remove unused devm_drm_irq_install()
>=20
> The remaining patches I either skipped or already had a feedback from
> me or I asked a question.
>=20
> 	Sam
