Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAB2669CB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 22:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2E76E041;
	Fri, 11 Sep 2020 20:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE26E041
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 20:54:51 +0000 (UTC)
IronPort-SDR: dlzPsAWAF61ObGIVmvIQ3qcKmnq7o+tCWJeMLt/EqJ/RVrQGKqnl027OliXYSKONuIUUe5TCos
 QyCRQ1rxgIog==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="156247169"
X-IronPort-AV: E=Sophos;i="5.76,417,1592895600"; d="scan'208";a="156247169"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 13:54:50 -0700
IronPort-SDR: O1wmxZVNRbQ1NfiTilcZ5Ec63psy1OhezvyixYiQrj7LlKzcyP665O+++PGAhPRAxYtFqJvxBb
 DhzlG4/srZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,417,1592895600"; d="scan'208";a="481461520"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 11 Sep 2020 13:54:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 11 Sep 2020 13:54:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 11 Sep 2020 13:54:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 11 Sep 2020 13:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqqU9t3wPx+TO0vKElL31x91GTlJyd29MCK8wqykCPH5lPoc6qWmrU07gcfpWW5ZY5PeQ7hlUlKW9NusHuhf54GDFSMfLm+LOCe8ojIgYxWqt19WfJifSWvjPwkNisRs+hi/jLN3T/hvpfuQE7980TxxS7V63HdJSNOWkV0+dveF4d8h0fcL8z2jA4FnVyU0+Wx3Eg/5ojXcfi42MVpzLLg7VU4GKGReAUrHc7Z7LpTCV1KjPCMSaevY0J5si60B4I3F/fMjQU6oaNWnIg4BYgil/USXNgpQGuOjZZESXCQdL/MboDGfZXVQBebvRU9OOXH06sIMw3++UjaFq4wArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMcQwvJtYgPF3/SWiX8mqwn0uqC7n79nJWM/eQcAhjY=;
 b=ANfEru+x6vLNiu919QPZYkFb1LLgJTHtu6JE/6M8daOsrXPXo/uzRyw+j5DY0f3dIjPLkRuz7z6hZEfx1ZUQiNc+rCwT2k7g7fTHClaEXmxXoankaxm4vGoKwLaMBwbv3KVBSIqvjJ7WAtjPIx3aULVeI+Fk1NXVohb70qo/GN1R6ETx8FB3taFqaqrzC2PxnnrCp/TXK5XO9UehI7UW1bd6SZmiVxOuZsoVFS/cGuIRX/w6sW3t8PUAk/+0yz/yC5RmxNmr+RuGgCA3XHnaKKUcjTiGXNFwL6L0jNu4ngtqZq0A4bJwswe49tfLOaZBxrfbWfGGPu8Zzjc0Tyv/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMcQwvJtYgPF3/SWiX8mqwn0uqC7n79nJWM/eQcAhjY=;
 b=H9tcRJOik7q/sV7u2tLlGkc5gp1Whf9OPsLTjwgH6XUuMWC5LDEvvbC64B+EdEgZO7GqaT4ZmpTxugq9JtmsaKm9dumCQIqEKrouc6G01Iz0o/arnFKjYlkdaypx5hBBAkXiYws19gplOrLT0W/Ty1kNJ8MHsWrzR4dNwMTEjlQ=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 20:54:41 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6%6]) with mapi id 15.20.3348.019; Fri, 11 Sep 2020
 20:54:41 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Paauwe, 
 Bob J" <bob.j.paauwe@intel.com>, "Dea, Edmund J" <edmund.j.dea@intel.com>
Subject: RE: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Thread-Topic: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Thread-Index: AQHWf9HFmAm5AcKirkeVCqcGep3UralhqwoAgAJPn8A=
Date: Fri, 11 Sep 2020 20:54:41 +0000
Message-ID: <BY5PR11MB418272DBF475568D4CE2B0D38C240@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
 <a1e50102-f400-c45c-9111-5b8afdba614c@baylibre.com>
In-Reply-To: <a1e50102-f400-c45c-9111-5b8afdba614c@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9eeff28-eb0d-4891-98ee-08d85694e7a4
x-ms-traffictypediagnostic: BYAPR11MB2680:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB268037E0B48F531C95E124428C240@BYAPR11MB2680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IKoywcYCNZGFg5S3GHgoIEseT06admqrW43/KLkY90450RE2tGiSE6lfZ0oneMTnDtJtvppBN7glTBSMgR4R/l5M/KPevIRk5r4yiSsQFY+lBVEZj60062VhPWLzEQvFXLAnP690mZ3Eb3HEpVQ1mGcxaQrn78OeH8B09hPF5Wum+BQmEcXTB6IcmcdyoQnB5PQGl//tdEFNo77DTeZIKUFrrXA0oFN3co3gk306SqOOJw/Ym4kzGYtgqIk9MqAT3e04EJ1eiaoOIe/w82FWr9yxDuKVq+mypTVDEWgxbzHnN6KCkGiMoTIkVL+GxsOVLNbxjvxYh2wkzjUTotV4CEXBXDAnoVD9jzBkkPQCJqBt2xJUoi+mW5zdFGHGtR+4uC2o08T80ss4w5tJzZJpNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(71200400001)(66446008)(4326008)(7696005)(316002)(966005)(2906002)(53546011)(110136005)(6506007)(83380400001)(33656002)(64756008)(52536014)(6636002)(9686003)(5660300002)(66946007)(76116006)(107886003)(55016002)(66556008)(66476007)(8936002)(26005)(86362001)(8676002)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vSNSiGoBSnsQoOio4sv6UnxeJA7ENspERMtR85RfF5bBSAn2am5j5Ap++LdsczjorkFB4pVqeNEL3wSW4CdP0O/b7l5x/t5NkA1FLpbgziQb4MLPbhC/eevp9qGBnFRWTA1GIGtq3vRSRZNLFfCsK1TnOSBn9elFLWvO8lPaVx9p6FDmJ6ZW6QuCbXfBaRy0qAqjLigHDPQl+IiLEYWR4b6R19ER3vq56sqf/LWXKJvJ7uvCYmQFKbrNSJkBbG0hStg5LTIyuiuAwsnUtnjUwki9EuvPL7Ytxz7ubfYmtljbcILMeeqbnZBQQu87kzSlw8/bAsTQrNet6onso1I+3DVdyRSzhlYOL9Ogs7K56nVdCWXD2o494VWeFUtEAPC3p9ensKVQ9aajkjlPXD7jqfBvv8uu8qzuQBft3I1ZxuXU9X8hvtNwITybysRkGR+RLPfKs65uThMRSp+JW3VVBBdzhtKovzfhVliYKovqXn0p4GsS69oKN4WYGV+2Qs/yyTk4gJ5WbXv6SiJ9oN0fWdDjPLhXY/HvmFeKih4yaGA3KhLRk0D5sYrU52AUF2hMspEVvs9EdrnQlZMEoXkM6vieprwEMbWNJrVbM+r9G0Xxdx4Xy0Y63Rn9Udt8lYLrRXsO4XbHy9tHnWm5VIZY7g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9eeff28-eb0d-4891-98ee-08d85694e7a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 20:54:41.2858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjyqTFEa64S8SWjb2FKju5bXxnK02b+UP/yv6o0Vo+1ilgcICRM/zLG5nDKt+lT6WiuUjTe4cjGq/zdv+KzNRyvy8F3+OjqSGrqCNvL8oV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,
Thanks for your review. Is a device tree binding document like this one enough? Entries for kmb-drm are similar to this.
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/gpu/brcm%2Cbcm-v3d.txt

How do I submit it once I have it ready?

Thanks,
Anitha

> -----Original Message-----
> From: Neil Armstrong <narmstrong@baylibre.com>
> Sent: Thursday, September 10, 2020 2:33 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; dri-
> devel@lists.freedesktop.org; Paauwe, Bob J <bob.j.paauwe@intel.com>;
> Dea, Edmund J <edmund.j.dea@intel.com>
> Cc: Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
> 
> On 31/08/2020 22:02, Anitha Chrisanthus wrote:
> > This is a basic KMS atomic modesetting display driver for KeemBay family
> of
> > SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> > driver at the connector level.
> >
> > Single CRTC with LCD controller->mipi DSI-> ADV bridge
> >
> > Only 1080p resolution and single plane is supported at this time.
> >
> > v2: moved extern to .h, removed license text
> >     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.(Sam)
> >
> > v3: Squashed all 59 commits to one
> >
> > v4: review changes from Sam Ravnborg
> > 	renamed dev_p to kmb
> > 	moved clocks under kmb_clock, consolidated clk initializations
> > 	use drmm functions
> > 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> >
> > v5: corrected spellings
> > v6: corrected checkpatch warnings
> > v7: review changes Sam Ravnborg and Thomas Zimmerman
> > 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> > 	renamed mode_set, kmb_load, inlined unload (Thomas)
> > 	moved remaining logging to drm_*(Thomas)
> > 	re-orged driver initialization (Thomas)
> > 	moved plane_status to drm_private (Sam)
> > 	removed unnecessary logs and defines and ifdef codes (Sam)
> > 	call helper_check in plane_atomic_check (Sam)
> > 	renamed set to get for bpp and format functions(Sam)
> > 	use drm helper functions for reset, duplicate/destroy state instead
> > 	of kmb functions (Sam)
> > 	removed kmb_priv from kmb_plane and removed kmb_plane_state
> (Sam)
> >
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_crtc.c  | 224 +++++++++++++
> >  drivers/gpu/drm/kmb/kmb_drv.c   | 676
> ++++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_drv.h   | 170 ++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.c | 480
> ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.h | 110 +++++++
> >  5 files changed, 1660 insertions(+)
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> >
> 
> [...]
> 
> > +
> > +static const struct of_device_id kmb_of_match[] = {
> > +	{.compatible = "intel,kmb_display"},
> > +	{},
> > +};
> 
> As I already commented on v1, a proper YAML bindings files
> is mandatory here, to check if the bindings are correct and if
> the drivers uses them correctly (port/endpoints, etc..)
> 
> Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
