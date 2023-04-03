Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F46D5004
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 20:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE57010E53F;
	Mon,  3 Apr 2023 18:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AE310E550;
 Mon,  3 Apr 2023 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680545355; x=1712081355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cL63UK3+eBDPdyRp2PnJtAskBPXOjruYc/WEoxi0b3I=;
 b=eP54wnHDKvM/j/4FcvVLOZ2GApG++WmG2grQaHV2y1HWoBrDIfJafFZY
 mdfaxTh3dvOYkDK4IfSp5odGl0QmV6bhd2CrSbcvteS0aV08t8+JnWw2U
 EtBtoSUMOHO99d/m68Z5hPRQrK2wtOnhcXPcLXmoQZPVs7X30eZg/kGXm
 rmnM42Qlq2HIRft9BZ7IJLz2Z+3Cvi8pdwmobVIoZVp/YPlgyWOyBtT7P
 1jHnX3/jpKsgxpkokAXjOxwnrBUlrMPfUcj1P02FxWZGSq3jeks0ISsO7
 Xve4IcAU9gA2yj1W86sK5kzpZWkyLZ9ie/TOx5EO0e2r/kr1Ot7lQPOj2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339472181"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="339472181"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 11:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716385680"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="716385680"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 03 Apr 2023 11:09:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 11:09:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 11:09:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 11:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzPgBJQi5MVy6SEXhfRjTYGqGpNYRrYLavsYJmM2Jf17dUBKznLeStFdxkFMd+SDTq0HzzXimRECYM9zyrynqiiFBC3w2ZaoXjDjuxbKqPDXPZqwsZqJgwNlZp3tMkKfGdU5eMS+KnBt6bdJdbjJHr6M7rwz5fd8JCmTZL7m7LF4aG+ShyXQuRuaA2vDWbJAL0iCaEgSKZSY3CTbtG72Walt5o4ogZ4dHb+epcQ5TV+C117tcaJ6AeHKLQmJlrmW5/nTgtSIE7qV9ow50ewVolbb63gLAFI/ZIDCCaWiMCh0lQlJ8kt4wmUUe3FqPicosAfrvFpLT+xhuPkGYI768A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs6yjMS9j7fICzJ5pI+eqJJibeVK9fhrD/csis/Kytk=;
 b=WwZvUTT5ZCoPeUl3dYRKTcu8tKKdxaBdJ5tiRbrdV1qxyptUvF8+eieCLKSkjfZhN+sHW8lBG8sAMy1AVVPSaUGO9v/hEx7ygUUYQk69eTyq1+mLZBXEzmrCNE6xcZp43PeQI1ww8fRKdAkpifsG8o+XrzjaDK4+z2vFNz1PEH5eSWx/hAo/dqwh2tct7wWKGyoIk5WE5Pu2o3/z5Iaz0Dbnhu0mz8camDFq1/6vzoy8M9Daph0LoJiTv2wiIWIR6cvXKmF22XRw/ZtCqFxa0u0QV1yQ4vjaeZQ8Jr210002wFwME6GmcrpQxw95nXLjYwLuRkpfJEbIAuyD6PxtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 18:09:11 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::50a8:a719:92da:370a]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::50a8:a719:92da:370a%5]) with mapi id 15.20.6222.033; Mon, 3 Apr 2023
 18:09:10 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
Thread-Topic: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
Thread-Index: AQHZXhBB7uOyLXjkJE6j/B6WLXpQ2q8Q2trggAHdZ4CABzkIEA==
Date: Mon, 3 Apr 2023 18:09:10 +0000
Message-ID: <SJ2PR11MB7715344964E17CACB72E6AE6F8929@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-4-lucas.demarchi@intel.com>
 <SJ2PR11MB771527702FC1B562638E67D1F8889@SJ2PR11MB7715.namprd11.prod.outlook.com>
 <20230330034621.zdlunvob4mc7nzxt@ldmartin-desk2>
In-Reply-To: <20230330034621.zdlunvob4mc7nzxt@ldmartin-desk2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CY8PR11MB7799:EE_
x-ms-office365-filtering-correlation-id: b72c5daa-879e-45d6-d482-08db346e8659
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iTtyXQPuizcULAE+vs1oB/uiQ2HLi0kX1rEspcWksjEA4X3eH1yVzURiH533cDAgFq5nbndm8BtPlg+RjNsuau4M3vbMOjkS8V/x46HFaB0QY+hGVxSXQ9YrPXoKsgrFNwOxj3i9BMFdFxeGVL0mL/rg+Ebx0QOJJU5CDhN/80RkMpiTQavCfStktzXKZLoT6xixWlyd3fsDGXCOZyMXX9HG0lqYbUry7MQiQbHVst7iw9jcVTqLCHTVkBt1w05yIzEa5zgkv9O7Yh5TTktg9YemounaJGupz2zPbAk8f5ZbfGS1fX5oR4Sk2MmgfpLdBQIaHET2orGl2dXpAbt6CtaP+b8o5QIEbOY+6OqPLG39G50wjD76VodolzCQB/UZDA++uPCrMjofDYGdfk5y1LpI88PjILMx8YuVLJw14ZrqBs0q+Rx6TMmtfFYYnvnBrvCkCkTwbTxY1MggbiCDJJ+O2qJjMLkbfDnaoZJd+rDcMQZ//wyxtBHp4+lT+uDa0CNUYeYYrDs/CAK1jgjUKWHBqaawvhpaS4T+dhKvDYXqlHmcEhsXTgHjNOeszSoQMHGy3xdjxo1ktW7e4ZGdhoQp5+X+y/eS8dwQkcBCTRM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(30864003)(5660300002)(86362001)(186003)(83380400001)(122000001)(9686003)(53546011)(26005)(6506007)(38100700002)(82960400001)(38070700005)(6862004)(8936002)(52536014)(64756008)(66556008)(8676002)(66446008)(71200400001)(33656002)(478600001)(54906003)(66946007)(6636002)(7696005)(66476007)(55016003)(4326008)(76116006)(316002)(41300700001)(15650500001)(2906002)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vokcd2bke5GMvSMWuHpJFPpIi985j7tcuNeR2lgghCF83qUuFpztoRbFCflX?=
 =?us-ascii?Q?fLfNyMzvNNQGfTb0pkuyud1joKYl1mR7jElOEdOlj0TVF2VAjwJYINNSSP6o?=
 =?us-ascii?Q?UXP+rTQuVvEqYCLRFe2rN3Grl0Qsp3mn8qjeW18mSMAP71LKCv410+VBxIW2?=
 =?us-ascii?Q?LmrrKXU2H3CJs81PMsGOGyabsJSUhgOM1gVH85TczIiYLdiqn+0vf1TD8Wrt?=
 =?us-ascii?Q?FE5m9niYH3A+/iNsziZSXlWTMWM4zuUXuow08VlSLhRQEXVMMYBqbCIA7Qqz?=
 =?us-ascii?Q?0hZzF2nf/46YWfUM3b2rfKS+Y1aZr+sbnza9xcAvrss3JX72QYrSf7l6Mt1F?=
 =?us-ascii?Q?5Oe16XqTgQa/nD05RuRtOGf6SXKX36JuYGrIPBYzJl4uM8dZh3VeeP/aB9qP?=
 =?us-ascii?Q?B8YnJ12Hedb9OXViqa/muStwvqUKAO34SYJtirwc1NKmrPGRopsX8IV5LmLD?=
 =?us-ascii?Q?z8oW1L4ZlpQL5ZsYVJ0/+EZtUmN2gfrNDYhwHIiFx2jX62nIPyOSJ+KklEhB?=
 =?us-ascii?Q?aQzq90w/fXXTsHPTMfKtQALYekMh0UVquxDrI+lTYn+6xHHIeCgDn0IiDVbN?=
 =?us-ascii?Q?ENRFR38SKSVwm3/mnJ7FuFHQ2W7DTl8cMDn7DqyEVijsiuw/+4hvxoLTzvo4?=
 =?us-ascii?Q?qS8Xtr3YGzJgYCNg+6jFM0wHFxDOTa9Sn7zwZlK2O8q+Nr2pO1/TMT5Z6qQB?=
 =?us-ascii?Q?mu6p6b6TgPCJpL2FewP7mgF5MW0JFnmBIswP4YIKazsjr9FSfn9WZ4Nu4+u+?=
 =?us-ascii?Q?MPXPKH/K1CZD5O3JiCptPSxFidoIt2A8D74vcJx0hkp+mvr96KIConqIbOA+?=
 =?us-ascii?Q?lPc4I/HOBrKcPIpc8iWK07y7IbLOQjQdjAzCA5zWsX4c5jBn3MZ0Y2RbWxZu?=
 =?us-ascii?Q?wbV9w1YoPOPrrxXK9TZDSZYjMWg4M9G90eJGiTOzMTO25upTCV6VarLCrcLI?=
 =?us-ascii?Q?8n9QpENyLYWoStNYojYdlACIeEvR1pdCRQkCCataOpF7oCTzGPPA1lVULCFS?=
 =?us-ascii?Q?WjZ2tEtCEoqlRPqtPP+G0Ks0hPz58J+1dQZa9kKqMk/EQ3WqPHCxrJbawbEH?=
 =?us-ascii?Q?N4fFthR4g6pDy1IMqNQ5GUxqBDbhij5PEaWFFV7iClMq5i0eBw7qccSULBIh?=
 =?us-ascii?Q?+T4GzT4wFnqeIWxwwdQ2Lj3g5b+VOfrR28ookHw4bKh0XDNBPx6d++QZ8+v8?=
 =?us-ascii?Q?LO+INWF8pknlVc6uVJJyGqmFFIzLQ3yuPkw731DGF9+8fZ5+hfZENeECELUk?=
 =?us-ascii?Q?DvwzGtHk/SDjQ2KZ3EtGor8ZzXhPnxKHhqrUZC831miIkIQHPZCp5CCQ/ZjO?=
 =?us-ascii?Q?QwWUty8sWJ3Ga3BIZQfDGeZrpykSEQ7HHpPAv4Ke7EX/QLANnAjCPV/NiTfn?=
 =?us-ascii?Q?XTEC/oZlGUBUDVnGElSTQt/B1lip6r7M2RFrfwzw2yUNRk/Q+/V7WHHhtf5C?=
 =?us-ascii?Q?hMkGlHghnNUCkhmh7bMoYruJtKU03D5ZExiIExSiMftrfQYtULsLI536snmA?=
 =?us-ascii?Q?/35hOaJ3ooQH5OGOWlHRWUPClsRNkqHSp3L/Q1df7C5jKuvIva6eNPsxiS1s?=
 =?us-ascii?Q?FhfuU18qKY2QdXiS07nGbMzqHh9Nz9dkj5la3hkSYT3raY/zllK9np3VD/+B?=
 =?us-ascii?Q?ZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72c5daa-879e-45d6-d482-08db346e8659
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 18:09:10.8085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GiiEUbj/DFPbysrWp0hucoez/s4gY2g4gPOZn3laqPSo/nB8Bi1Pdl5MrvUVvRSzC+3n2DuXEnHaKq8qZG8eqI9QRyNNipyvEEcjwKzYsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, March 29, 2023 8:46 PM
> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Harrison, John C
> <john.c.harrison@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; dri-devel@lists.freedesktop.org; Danie=
l
> Vetter <daniel.vetter@ffwll.ch>; Dave Airlie <airlied@redhat.com>
> Subject: Re: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
>=20
> On Tue, Mar 28, 2023 at 04:31:13PM -0700, Anusha Srivatsa wrote:
> >
> >
> >> -----Original Message-----
> >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Sent: Thursday, March 23, 2023 10:18 PM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Harrison, John C
> >> <john.c.harrison@intel.com>; Ceraolo Spurio, Daniele
> >> <daniele.ceraolospurio@intel.com>; dri-devel@lists.freedesktop.org;
> >> Daniel Vetter <daniel.vetter@ffwll.ch>; Dave Airlie
> >> <airlied@redhat.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Subject: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
> >>
> >> Update the logic to autoselect GuC/HuC for the platforms with the
> >> following
> >> improvements:
> >>
> >> - Document what is the firmware file that is expected to be
> >>   loaded and what is checked from blob headers
> >> - When the platform is under force-probe it's desired to enforce
> >>   the full-version requirement so the correct firmware is used
> >>   before widespread adoption and backward-compatibility
> >>
> >Extra line ^
> >
> >>   commitments
> >> - Directory from which we expect firmware blobs to be available in
> >>   upstream linux-firmware repository depends on the platform: for
> >>   the ones supported by i915 it uses the i915/ directory, but the ones
> >>   expected to be supported by xe, it's on the xe/ directory. This
> >>   means that for platforms in the intersection, the firmware is
> >>   loaded from a different directory, but that is not much important
> >>   in the firmware repo and it avoids firmware duplication.
> >>
> >> - Make the table with the firmware definitions clearly state the
> >>   versions being expected. Now with macros to select the version it's
> >>   possible to choose between full-version/major-version for GuC and
> >>   full-version/no-version for HuC. These are similar to the macros use=
d
> >>   in i915, but implemented in a slightly different way to avoid
> >>   duplicating the macros for each firmware/type and functionality,
> >>   besides adding the support for different directories.
> >>
> >> - There is no check added regarding force-probe since xe should
> >>   reuse the same firmware files published for i915 for past
> >>   platforms. This can be improved later with additional
> >>   kunit checking against a hardcoded list of platforms that
> >Extra line here.
> >
> >>   falls in this category.
> >> - As mentioned in the TODO, the major version fallback was not
> >>   implemented before as currently each platform only supports one
> >>   major. That can be easily added later.
> >>
> >> - GuC version for MTL and PVC were updated to 70.6.4, using the exact
> >>   full version, while the
> >>
> >> After this the GuC firmware used by PVC changes to pvc_guc_70.5.2.bin
> >> since it's using a file not published yet.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_uc_fw.c       | 315 +++++++++++++++++----------=
-
> >>  drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +-
> >>  drivers/gpu/drm/xe/xe_uc_fw_types.h |   7 +
> >>  3 files changed, 204 insertions(+), 120 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
> >> b/drivers/gpu/drm/xe/xe_uc_fw.c index 174c42873ebb..653bc3584cc5
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> >> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> >> @@ -17,6 +17,137 @@
> >>  #include "xe_mmio.h"
> >>  #include "xe_uc_fw.h"
> >>
> >> +/*
> >> + * List of required GuC and HuC binaries per-platform. They must be
> >> +ordered
> >> + * based on platform, from newer to older.
> >> + *
> >> + * Versioning follows the guidelines from
> >> + * Documentation/driver-api/firmware/firmware-usage-guidelines.rst.
> >> +There is a
> >> + * distinction for platforms being officially supported by the driver=
 or not.
> >> + * Platforms not available publicly or not yet officially supported
> >> +by the
> >> + * driver (under force-probe), use the mmp_ver(): the firmware
> >> +autoselect logic
> >> + * will select the firmware from disk with filename that matches the
> >> +full
> >> + * "mpp version", i.e. major.minor.patch. mmp_ver() should only be
> >> +used for
> >> + * this case.
> >> + *
> >> + * For platforms officially supported by the driver, the filename
> >> +always only
> >> + * ever contains the major version (GuC) or no version at all (HuC).
> >> + *
> >> + * After loading the file, the driver parses the versions embedded in=
 the blob.
> >> + * The major version needs to match a major version supported by the
> >> +driver (if
> >> + * any). The minor version is also checked and a notice emitted to
> >> +the log if
> >> + * the version found is smaller than the version wanted. This is
> >> +done only for
> >> + * informational purposes so users may have a chance to upgrade, but
> >> +the driver
> >> + * still loads and use the older firmware.
> >> + *
> >> + * Examples:
> >> + *
> >> + *	1) Platform officially supported by i915 - using Tigerlake as exam=
ple.
> >> + *	   Driver loads the following firmware blobs from disk:
> >> + *
> >> + *		- i915/tgl_guc_<major>.bin
> >> + *		- i915/tgl_huc.bin
> >> + *
> >> + *	   <major> number for GuC is checked that it matches the version i=
nside
> >> + *	   the blob. <minor> version is checked and if smaller than the ex=
pected
> >> + *	   an info message is emitted about that.
> >> + *
> >> + *	1) XE_<FUTUREINTELPLATFORM>, still under require_force_probe.
> >> Using
> >> + *	   "wipplat" as a short-name. Driver loads the following firmware =
blobs
> >> + *	   from disk:
> >> + *
> >> + *		- xe/wipplat_guc_<major>.<minor>.<patch>.bin
> >> + *		- xe/wipplat_huc_<major>.<minor>.<patch>.bin
> >> + *
> >> + *	   <major> and <minor> are checked that they match the version ins=
ide
> >> + *	   the blob. Both of them need to match exactly what the driver is
> >> + *	   expecting, otherwise it fails.
> >> + *
> >> + *	3) Platform officially supported by xe and out of force-probe. Usi=
ng
> >> + *	   "plat" as a short-name. Except for the different directory, the
> >> + *	   behavior is the same as (1). Driver loads the following firmwar=
e
> >> + *	   blobs from disk:
> >> + *
> >> + *		- xe/plat_guc_<major>.bin
> >> + *		- xe/plat_huc.bin
> >> + *
> >> + *	   <major> number for GuC is checked that it matches the version i=
nside
> >> + *	   the blob. <minor> version is checked and if smaller than the ex=
pected
> >> + *	   an info message is emitted about that.
> >> + *
> >> + * For the platforms already released with a major version, they
> >> +should never be
> >> + * removed from the table. Instead new entries with newer versions
> >> +may be added
> >> + * before them, so they take precedence.
> >> + *
> >> + * TODO: Currently there's no fallback on major version. That's
> >> +because xe
> >> + * driver only supports the one major version of each firmware in the=
 table.
> >> + * This needs to be fixed when the major version of GuC is updated.
> >> + */
> >> +
> >> +struct uc_fw_entry {
> >> +	enum xe_platform platform;
> >> +	struct {
> >> +		const char *path;
> >> +		u16 major;
> >> +		u16 minor;
> >> +		bool full_ver_required;
> >> +	};
> >> +};
> >> +
> >> +struct fw_blobs_by_type {
> >> +	const struct uc_fw_entry *entries;
> >> +	u32 count;
> >> +};
> >> +
> >> +#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)
> >> 		\
> >> +	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))
> >> 	\
> >> +	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))
> >> 	\
> >> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))
> >> 	\
> >> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))
> >> 	\
> >> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))
> >> 	\
> >> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))
> >> 	\
> >> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
> >> +
> >> +#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)
> >> 		\
> >> +	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))
> >> 	\
> >> +	fw_def(DG1,		no_ver(i915,	huc,	dg1))
> >> 	\
> >> +	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
> >> +
> >> +#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)
> >> 	\
> >> +	__stringify(dir__) "/" __stringify(shortname__) "_"
> >> +__stringify(uc__)
> >> version__ ".bin"
> >> +
> >> +#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)
> >> 	\
> >> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## .
> >> ## c))
> >> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)
> >> 	\
> >> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a)) #define
> >> +fw_filename_no_ver(dir_, uc_, shortname_)
> >> 	\
> >> +	MAKE_FW_PATH(dir_, uc_, shortname_, "")
> >> +
> >> +#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)
> >> 	\
> >> +	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),
> >> 	\
> >> +	  a, b, true }
> >> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)
> >> 	\
> >> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),
> >> 	\
> >> +	  a, b }
> >Why is b required here?
>=20
> because it is setting the minor in the corresponding struct uc_fw_entry.
>  From the tables above, basically for the rows using major_ver(), it will=
 use up to
> the major version in the arguments to decide what is the
> *file*  to load. The path for the file is constructed with the macro abov=
e, so it
> can be used by both MODULE_FIRMWARE and by setting the patch in the
> uc_fw_entry.  The same major_ver() is used to fill out the rest of the
> uc_fw_entry, where we need the minor too.
>=20
> See doucumentation above. Copying the relevant part here:
>=20
> 	<major> number for GuC is checked that it matches the version inside
> 	the blob. <minor> version is checked and if smaller than the expected
> 	an info message is emitted about that.
>=20
>=20
> Lucas De Marchi

Thanks for the explanation. The auto select logic looks good.
With the extra lines removed from commit message,

 Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


> >
> >
> >Anusha
> >> +#define uc_fw_entry_no_ver(dir_, uc_, shortname_)
> >> 	\
> >> +	{ fw_filename_no_ver(dir_, uc_, shortname_),
> >> 	\
> >> +	  0, 0 }
> >> +
> >> +/* All blobs need to be declared via MODULE_FIRMWARE() */ #define
> >> +XE_UC_MODULE_FIRMWARE(platform__, fw_filename)
> >> 		\
> >> +	MODULE_FIRMWARE(fw_filename);
> >> +
> >> +#define XE_UC_FW_ENTRY(platform__, entry__)
> >> 		\
> >> +	{
> >> 	\
> >> +		.platform =3D XE_ ## platform__,
> >> 	\
> >> +		entry__,
> >> 	\
> >> +	},
> >> +
> >> +XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
> >> 			\
> >> +		     fw_filename_mmp_ver, fw_filename_major_ver)
> >> +XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
> >> 			\
> >> +		     fw_filename_mmp_ver, fw_filename_no_ver)
> >> +
> >>  static struct xe_gt *
> >>  __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)  { @@
> >> -
> >> 37,123 +168,38 @@ static struct xe_device *uc_fw_to_xe(struct
> >> xe_uc_fw
> >> *uc_fw)
> >>  	return gt_to_xe(uc_fw_to_gt(uc_fw));  }
> >>
> >> -/*
> >> - * List of required GuC and HuC binaries per-platform.
> >> - * Must be ordered based on platform, from newer to older.
> >> - */
> >> -#define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> >> -	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> >> -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
> >> -	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> >> -	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> >> -	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
> >> -	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> >> -	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
> >> -
> >> -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
> >> -	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
> >> -	fw_def(DG1,		huc_def(dg1)) \
> >> -	fw_def(TIGERLAKE,	huc_def(tgl))
> >> -
> >> -#define __MAKE_HUC_FW_PATH(prefix_, name_) \
> >> -        "i915/" \
> >> -        __stringify(prefix_) "_" name_ ".bin"
> >> -
> >> -#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
> >> -	"i915/" \
> >> -	__stringify(prefix_) "_" name_ "_" \
> >> -	__stringify(major_) ".bin"
> >> -
> >> -#define __MAKE_UC_FW_PATH_FULL_VER(prefix_, name_, major_, minor_,
> >> patch_) \
> >> -        "i915/" \
> >> -       __stringify(prefix_) "_" name_ "_" \
> >> -       __stringify(major_) "." \
> >> -       __stringify(minor_) "." \
> >> -       __stringify(patch_) ".bin"
> >> -
> >> -#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
> >> -	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
> >> -
> >> -#define MAKE_HUC_FW_PATH(prefix_) \
> >> -	__MAKE_HUC_FW_PATH(prefix_, "huc")
> >> -
> >> -#define MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, patch_)
> \
> >> -	__MAKE_UC_FW_PATH_FULL_VER(prefix_, "huc", major_, minor_,
> >> patch_)
> >> -
> >> -
> >> -/* All blobs need to be declared via MODULE_FIRMWARE() */ -#define
> >> XE_UC_MODULE_FW(platform_, uc_) \
> >> -	MODULE_FIRMWARE(uc_);
> >> -
> >> -XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH) -
> >> XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH,
> >> MAKE_HUC_FW_PATH_FULL_VER)
> >> -
> >> -/* The below structs and macros are used to iterate across the list
> >> of blobs */ - struct __packed uc_fw_blob {
> >> -	u8 major;
> >> -	u8 minor;
> >> -	const char *path;
> >> -};
> >> -
> >> -#define UC_FW_BLOB(major_, minor_, path_) \
> >> -	{ .major =3D major_, .minor =3D minor_, .path =3D path_ }
> >> -
> >> -#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
> >> -	UC_FW_BLOB(major_, minor_, \
> >> -		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
> >> -
> >> -#define HUC_FW_BLOB(prefix_) \
> >> -	UC_FW_BLOB(0, 0, MAKE_HUC_FW_PATH(prefix_))
> >> -
> >> -#define HUC_FW_VERSION_BLOB(prefix_, major_, minor_, bld_num_) \
> >> -	UC_FW_BLOB(major_, minor_, \
> >> -		   MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_,
> >> bld_num_))
> >> -
> >> -struct uc_fw_platform_requirement {
> >> -	enum xe_platform p;
> >> -	const struct uc_fw_blob blob;
> >> -};
> >> -
> >> -#define MAKE_FW_LIST(platform_, uc_) \ -{ \
> >> -	.p =3D XE_##platform_, \
> >> -	.blob =3D uc_, \
> >> -},
> >> -
> >> -struct fw_blobs_by_type {
> >> -	const struct uc_fw_platform_requirement *blobs;
> >> -	u32 count;
> >> -};
> >> -
> >>  static void
> >>  uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)  {
> >> -	static const struct uc_fw_platform_requirement blobs_guc[] =3D {
> >> -		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> >> +	static const struct uc_fw_entry entries_guc[] =3D {
> >> +		XE_GUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
> >> +				     uc_fw_entry_mmp_ver,
> >> +				     uc_fw_entry_major_ver)
> >>  	};
> >> -	static const struct uc_fw_platform_requirement blobs_huc[] =3D {
> >> -		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB,
> >> HUC_FW_VERSION_BLOB)
> >> +	static const struct uc_fw_entry entries_huc[] =3D {
> >> +		XE_HUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
> >> +				     uc_fw_entry_mmp_ver,
> >> +				     uc_fw_entry_no_ver)
> >>  	};
> >>  	static const struct fw_blobs_by_type
> blobs_all[XE_UC_FW_NUM_TYPES]
> >> =3D {
> >> -		[XE_UC_FW_TYPE_GUC] =3D { blobs_guc, ARRAY_SIZE(blobs_guc)
> >> },
> >> -		[XE_UC_FW_TYPE_HUC] =3D { blobs_huc, ARRAY_SIZE(blobs_huc)
> >> },
> >> +		[XE_UC_FW_TYPE_GUC] =3D { entries_guc,
> >> ARRAY_SIZE(entries_guc) },
> >> +		[XE_UC_FW_TYPE_HUC] =3D { entries_huc,
> >> ARRAY_SIZE(entries_huc) },
> >>  	};
> >> -	static const struct uc_fw_platform_requirement *fw_blobs;
> >> +	static const struct uc_fw_entry *entries;
> >>  	enum xe_platform p =3D xe->info.platform;
> >> -	u32 fw_count;
> >> +	u32 count;
> >>  	int i;
> >>
> >>  	XE_BUG_ON(uc_fw->type >=3D ARRAY_SIZE(blobs_all));
> >> -	fw_blobs =3D blobs_all[uc_fw->type].blobs;
> >> -	fw_count =3D blobs_all[uc_fw->type].count;
> >> -
> >> -	for (i =3D 0; i < fw_count && p <=3D fw_blobs[i].p; i++) {
> >> -		if (p =3D=3D fw_blobs[i].p) {
> >> -			const struct uc_fw_blob *blob =3D &fw_blobs[i].blob;
> >> -
> >> -			uc_fw->path =3D blob->path;
> >> -			uc_fw->major_ver_wanted =3D blob->major;
> >> -			uc_fw->minor_ver_wanted =3D blob->minor;
> >> +	entries =3D blobs_all[uc_fw->type].entries;
> >> +	count =3D blobs_all[uc_fw->type].count;
> >> +
> >> +	for (i =3D 0; i < count && p <=3D entries[i].platform; i++) {
> >> +		if (p =3D=3D entries[i].platform) {
> >> +			uc_fw->path =3D entries[i].path;
> >> +			uc_fw->major_ver_wanted =3D entries[i].major;
> >> +			uc_fw->minor_ver_wanted =3D entries[i].minor;
> >> +			uc_fw->full_ver_required =3D entries[i].full_ver_required;
> >>  			break;
> >>  		}
> >>  	}
> >> @@ -227,6 +273,47 @@ static void guc_read_css_info(struct xe_uc_fw
> >> *uc_fw, struct uc_css_header *css)
> >>  	uc_fw->private_data_size =3D css->private_data_size;  }
> >>
> >> +static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw) {
> >> +	struct xe_device *xe =3D uc_fw_to_xe(uc_fw);
> >> +
> >> +	/* Driver has no requirement on any version, any is good. */
> >> +	if (!uc_fw->major_ver_wanted)
> >> +		return 0;
> >> +
> >> +	/*
> >> +	 * If full version is required, both major and minor should match.
> >> +	 * Otherwise, at least the major version.
> >> +	 */
> >> +	if (uc_fw->major_ver_wanted !=3D uc_fw->major_ver_found ||
> >> +	    (uc_fw->full_ver_required &&
> >> +	     uc_fw->minor_ver_wanted !=3D uc_fw->minor_ver_found)) {
> >> +		drm_notice(&xe->drm, "%s firmware %s: unexpected version:
> >> %u.%u !=3D %u.%u\n",
> >> +			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> >> +			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> >> +			   uc_fw->major_ver_wanted, uc_fw-
> >> >minor_ver_wanted);
> >> +		goto fail;
> >> +	}
> >> +
> >> +	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
> >> +		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended,
> >> but only (%u.%u) was found in %s\n",
> >> +			   xe_uc_fw_type_repr(uc_fw->type),
> >> +			   uc_fw->major_ver_wanted, uc_fw-
> >> >minor_ver_wanted,
> >> +			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> >> +			   uc_fw->path);
> >> +		drm_info(&xe->drm, "Consider updating your linux-firmware
> >> pkg or downloading from %s\n",
> >> +			 XE_UC_FIRMWARE_URL);
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +fail:
> >> +	if (xe_uc_fw_is_overridden(uc_fw))
> >> +		return 0;
> >> +
> >> +	return -ENOEXEC;
> >> +}
> >> +
> >>  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)  {
> >>  	struct xe_device *xe =3D uc_fw_to_xe(uc_fw); @@ -308,19 +395,9 @@
> int
> >> xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >>  	uc_fw->minor_ver_found =3D FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> >>  					   css->sw_version);
> >>
> >> -	if (uc_fw->major_ver_wanted) {
> >> -		if (uc_fw->major_ver_found !=3D uc_fw->major_ver_wanted ||
> >> -		    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
> >> -			drm_notice(&xe->drm, "%s firmware %s: unexpected
> >> version: %u.%u !=3D %u.%u\n",
> >> -				   xe_uc_fw_type_repr(uc_fw->type), uc_fw-
> >> >path,
> >> -				   uc_fw->major_ver_found, uc_fw-
> >> >minor_ver_found,
> >> -				   uc_fw->major_ver_wanted, uc_fw-
> >> >minor_ver_wanted);
> >> -			if (!xe_uc_fw_is_overridden(uc_fw)) {
> >> -				err =3D -ENOEXEC;
> >> -				goto fail;
> >> -			}
> >> -		}
> >> -	}
> >> +	err =3D uc_fw_check_version_requirements(uc_fw);
> >> +	if (err)
> >> +		goto fail;
> >>
> >>  	if (uc_fw->type =3D=3D XE_UC_FW_TYPE_GUC)
> >>  		guc_read_css_info(uc_fw, css);
> >> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h
> >> b/drivers/gpu/drm/xe/xe_uc_fw.h index bf31c3bb0e0f..e16267e71280
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> >> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> >> @@ -175,6 +175,6 @@ static inline u32 xe_uc_fw_get_upload_size(struct
> >> xe_uc_fw *uc_fw)
> >>  	return __xe_uc_fw_get_upload_size(uc_fw);
> >>  }
> >>
> >> -#define XE_UC_FIRMWARE_URL
> >> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
> >> firmware.git/tree/i915"
> >> +#define XE_UC_FIRMWARE_URL
> >> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
> firmware.git"
> >>
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> >> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> >> index 1cfd30a655df..6c595aaa2399 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> >> @@ -78,6 +78,13 @@ struct xe_uc_fw {
> >>  	const char *path;
> >>  	/** @user_overridden: user provided path to uC firmware via
> >> modparam */
> >>  	bool user_overridden;
> >> +	/**
> >> +	 * @full_version_required: driver still under development and not re=
ady
> >> +	 * for backward-compatible firmware. To be used only for **new**
> >> +	 * platforms, i.e. still under require_force_probe protection and no=
t
> >> +	 * supported by i915.
> >> +	 */
> >> +	bool full_ver_required;
> >>  	/** @size: size of uC firmware including css header */
> >>  	size_t size;
> >>
> >> --
> >> 2.39.0
> >
