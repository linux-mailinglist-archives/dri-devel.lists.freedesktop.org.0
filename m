Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100522273B3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 02:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717246E0D5;
	Tue, 21 Jul 2020 00:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C96E0D5;
 Tue, 21 Jul 2020 00:21:00 +0000 (UTC)
IronPort-SDR: s69OaF6l1FLehn2GD2yrB1uKQEFUwtDM/uAxyyA08vijaREhqPrMXxFuzDNMOutwIqLvVaGG0O
 7O/XGESiay9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="234883548"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="234883548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 17:20:59 -0700
IronPort-SDR: XWMWh/Q7G3gAdjeueWd7Qv0vhl4WW1L6YBrhC22qsK62tsNSQ6HXTePmUXEIIb6ncFZBtZfiu/
 fuwAvKqlJG9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="431797826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 17:20:59 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Jul 2020 17:20:59 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Jul 2020 17:20:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 20 Jul 2020 17:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1jQthFiys4wayot5GliO9WBle8CHeyde1atoTKpAgOXfqq+tiYv4tdp7vjxvbi9Etc9nYRnscEQBbGn6tdsozQIUr0Qjb2Errb/31XVBeAdR1vdeO5X3mOwbOnFlIynMYzVcueM0s0X4DZTbmzI3zCeKdWWIw4e5KzeWNFaXYpPVydR0BxP6d0N2lCkJqtYV5wkoKRj88jXpnIFlNZuQyUAn2YE8aDGqDUj/BJ6UfYJt4nE0CO9YTEdKkxj87Ekn9ZYStr+weBAI27hg/Mqhq12+ZjGITkANWFLmi1JoOMYca9Torz7uGXpAYrkTj8yVfMRtHpd0gCGm59jatwrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k3tEfPocZi8bDLmotYNdcEN7vX4WzNMz/IwF/m110k=;
 b=R6ktkijmAzECJwUlLw3hrvjL/YrlpxG/Kkx7Y8ND3uR3j7hu2CCADq2voZpzXdcPpFGf40dhOOk1UyrxBBKvzd6JxsEAFZ9W3a5hw3BCrLyiT8wzpaj4zZFqTXhvrRUSpbMn7R+M2GRLZFDa8Ts3wzbe8RuKTeU8V/Mj5ZD5PVhigCF4rjn4Ejz43H6jT7746MVQDoZOxWU7M96Q2zd+4Zvctcyqu1VhesshFtMQ9oSD90G4aXOdTJh1SQJg6FyIzZmIM9DHPpyVsI/cJuJmxgv88S5a4tCMG5BsK44maYyaUWFSPVE5jn57NbfZDkFkogMQ9cNN+/tacSE9YWbdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k3tEfPocZi8bDLmotYNdcEN7vX4WzNMz/IwF/m110k=;
 b=BW9PgaO7c8RRUBDb2kD90bv3aNZQUYTHx/rfzOA4w8M8dZ7J3XWfhwDp7vlsBc71l/S7VrUvJg8HQ8zNuWWeWlb4f8aVkVYKtWmj/LHKblPycOX50rB4ITN2PdM/Z/nWI9TfO/C9b5dCNvHD0tgovekN5p3tbKbgvZxlL+EQH+M=
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 00:20:57 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::b840:82ba:a83a:d8c3]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::b840:82ba:a83a:d8c3%7]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 00:20:57 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/dp: TPS4 PHY test pattern compliance support
Thread-Topic: [PATCH 2/2] drm/i915/dp: TPS4 PHY test pattern compliance support
Thread-Index: AQHWXu9QdBNG8/+8UUyBr2J6XgHg06kRKS+AgAACjAA=
Date: Tue, 21 Jul 2020 00:20:57 +0000
Message-ID: <6b2cedf4b501199697d592c0cd1083326dd647f5.camel@intel.com>
References: <20200720234126.11853-1-khaled.almahallawy@intel.com>
 <20200720234126.11853-2-khaled.almahallawy@intel.com>
 <20200721001149.GB14395@intel.com>
In-Reply-To: <20200721001149.GB14395@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3673a557-e358-4e73-4a53-08d82d0bf0ab
x-ms-traffictypediagnostic: MWHPR11MB1534:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB15349C324A85CE3841D51D9D89780@MWHPR11MB1534.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zObPqLi7iy/W+aMxbmaPTqJymEMhwz50lphOasyVn7KdwLCkDrLJFwrcubfswvFcJDK8E4U1lCG9mmknKgRpp6mFY2gMr6vBdeFYSiNgdevt9gsyzA2FGCVakTfktATVJEB8bp6548QDrAEeOYzxofsvz5ijoYFpmUAL0AqgaNlUrln3zETyO4YN1om1IEB4SUPc5Ge57qykFo1bs4I7AsksVPsNYnNrsnviYZgYtOKlWaYMspGBOsQJs6GfM+g+Ufl2l1z+ASH8S7xJl0k0avPNS9ZZRxqIWpNC0KOd8h5BQUt1JXBM68HgAmoKLLTn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(5660300002)(450100002)(107886003)(478600001)(4326008)(8936002)(71200400001)(6512007)(8676002)(6862004)(37006003)(26005)(2906002)(54906003)(36756003)(316002)(6486002)(6636002)(2616005)(64756008)(66946007)(186003)(86362001)(66556008)(83380400001)(76116006)(66446008)(66476007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Q6v+wvWdgoV6lLAtDif9MkOKpp84Fwabm9g/g7DzkP1Bf4CA4BnKFgFf+HyM+vjBl6EBt6EIQY6XzNoO9EzMfruOkPXSdGy5+5d0HboTYZ13/pfw8zvSzq5ise7Wk+pcf7QkRm9HGUir5faOVen6Z5neBHxAzrR2tfrZqINf8ZfuG6h+vOuBI9doQllj4bcN27LzVFOmSEEPr56ZI3rafEN6T9jDANG+By1zKVTrIFNbkIcG5WefidkwXPZKvI/CUOxGzp0TN88kQl8wEUpQrA1Bnl1x63J/FYIj/rczwspFy/nQiXxnopOB+GlCIIPkr1MqdAxRnQg7Y5SxdZqpqk6ttJLsG2KPF5F0cfz34Qf/PGs5fP3XUFNoUJFWn2EgpLRjtRDu8ZOKlXPLa/MvXBNWbjltZ18xDoMzUdOmEpZQzyzcoLDK2bQdYt/hJ93crh+0qhmGQ5RKO+DaaEpxGIjeA4jCjAJBu01Ltu6nNjh1eWe/afP2O2ScmoMHjdoz
Content-ID: <ED15F3BF4CFE964C896B41E64A375B45@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3673a557-e358-4e73-4a53-08d82d0bf0ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 00:20:57.6745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPyDVAIFdtAgxZ51i/h1k35tarSyI56DMlP6c2LAMoy8fryTFJEirtp7LiC0Cn4QGqEq24+ZRSWlImKe6f/EqrSHhKhV56WjXUW3SbFr4xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Manna,
 Animesh" <animesh.manna@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-07-20 at 17:11 -0700, Manasi Navare wrote:
> On Mon, Jul 20, 2020 at 04:41:26PM -0700, Khaled Almahallawy wrote:
> > Adding support for TPS4 (CP2520 Pattern 3) PHY pattern source
> > tests.
> > 
> > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 14 ++++++++++++--
> >  drivers/gpu/drm/i915/i915_reg.h         |  4 ++++
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index d6295eb20b63..effadc096740 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5371,7 +5371,7 @@ static void
> > intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> >  			&intel_dp->compliance.test_data.phytest;
> >  	struct intel_crtc *crtc = to_intel_crtc(dig_port-
> > >base.base.crtc);
> >  	enum pipe pipe = crtc->pipe;
> > -	u32 pattern_val;
> > +	u32 pattern_val, dp_tp_ctl;
> >  
> >  	switch (data->phy_pattern) {
> >  	case DP_PHY_TEST_PATTERN_NONE:
> > @@ -5411,7 +5411,7 @@ static void
> > intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> >  			       DDI_DP_COMP_CTL_ENABLE |
> >  			       DDI_DP_COMP_CTL_CUSTOM80);
> >  		break;
> > -	case DP_PHY_TEST_PATTERN_CP2520:
> > +	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
> >  		/*
> >  		 * FIXME: Ideally pattern should come from DPCD 0x24A.
> > As
> >  		 * current firmware of DPR-100 could not set it, so
> > hardcoding
> > @@ -5423,6 +5423,16 @@ static void
> > intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> >  			       DDI_DP_COMP_CTL_ENABLE |
> > DDI_DP_COMP_CTL_HBR2 |
> >  			       pattern_val);
> >  		break;
> > +		case DP_PHY_TEST_PATTERN_CP2520_PAT3:
> > +			DRM_DEBUG_KMS("Set TPS4 Phy Test Pattern\n");
> > +			intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
> > 0x0);
> > +			dp_tp_ctl = intel_de_read(dev_priv,
> > TGL_DP_TP_CTL(pipe));
> > +			dp_tp_ctl &= ~DP_TP_CTL_TRAIN_PAT4_SEL_MASK;
> > +			dp_tp_ctl |= DP_TP_CTL_TRAIN_PAT4_SEL_TS4a;
> > +			dp_tp_ctl &= ~DP_TP_CTL_LINK_TRAIN_MASK;
> > +			dp_tp_ctl |= DP_TP_CTL_LINK_TRAIN_PAT4;
> > +			intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe),
> > dp_tp_ctl);
> > +			break;
> >  	default:
> >  		WARN(1, "Invalid Phy Test Pattern\n");
> >  	}
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h
> > index a0d31f3bf634..a4607bd1ac26 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -9982,6 +9982,10 @@ enum skl_power_gate {
> >  #define  DP_TP_CTL_MODE_SST			(0 << 27)
> >  #define  DP_TP_CTL_MODE_MST			(1 << 27)
> >  #define  DP_TP_CTL_FORCE_ACT			(1 << 25)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_MASK		(3 << 19)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_TS4a		(0 << 19)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4b		(1 << 19)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4c		(2 << 19)
> 
> The bspec calls them Training Pattern 4a/b/c, why is it _TS4a. TP4b,
> TP4c?
> We shd make it uniform, all TP4a/b/c perhaps?

Apology,will fix to TP4a/b/c then

> 
> Manasi
> 
> >  #define  DP_TP_CTL_ENHANCED_FRAME_ENABLE	(1 << 18)
> >  #define  DP_TP_CTL_FDI_AUTOTRAIN		(1 << 15)
> >  #define  DP_TP_CTL_LINK_TRAIN_MASK		(7 << 8)
> > -- 
> > 2.17.1
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
