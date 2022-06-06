Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B447B53F067
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 22:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB7210F840;
	Mon,  6 Jun 2022 20:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54210F840;
 Mon,  6 Jun 2022 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654548340; x=1686084340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Iu4m+m3rV7jkfCPHVuni+jg/1F8dKqP0UYpLtwVbQyM=;
 b=Q0TyoAY4JdoKmssSP2yjlSBMLioy8OSFyjyzRpy1eh6Us6wcr7pa9fyQ
 dlEYf/IR7kERtMmYgmFbx0ssytergHnj6W5jw5bJU6BpOJqZ+7zjj/h12
 tqA3Md/IF2kFutGb+ELBJuqwNjfgQGYylk1MJO3+FSE89nyq4rE2NqZGD
 LXTmTAgJ6voALXDyqVKC8G42m/KT6dBS2ptrPC6e35c3FZuz7f2sGTFoX
 RHQsLGpRl4+FvfexLDTWaR+64m+xeCaGLOyTqiQPKUEz6Dc6ksbKkSI0Z
 D4zyHWVgv+29pa3KxkgtkNglrWP0U0IVlusv3sKsMrEugjp3iIe54pa8j w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275466328"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275466328"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="682420420"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2022 13:45:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 13:45:39 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 13:45:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 6 Jun 2022 13:45:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 6 Jun 2022 13:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqutjcLgtcyg6uT0uI0ex824V8YLBtwJG7j+qCWhUtGdfjo2z7P3MAQTxNcD6uviDgn42yw3bP1qzx7EGHaSBcLuX6YTKq23oWYtlgCMd1MA0YW16UiGMxXUx3X2kVYEy3M14+6twtl5iKlu6A0wCcPhhOudU0Kzgz/7ErUuGf3UUbngbSGn55GBQz/DBym1dNIdzdANZh61XEjRGGO6NyPCIFlVIcvEiSdiB7i9b35gmH9DLcBgVNNhrAzxSmCLhKl3bo/wyquipzEmzoTiAbnl255Z2Sy8rPHkJGO41aQ5hum+ailxj5E+a8hKa4QxMYtJOknr5W5a5gBvF0+FBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqtbyjJdfavsCUkkcUjyq6/Al1d4Slf5D1si82VdpzY=;
 b=Q7QmQJ80zeCuaDYdXbzJgAaALRsqgdCOKFoUsnsJFaP2pQZjePsJYf1kPXuq53CyMk2lf+XcH1TjaG84OAldAuWBTiw8VtSqeV98GQHXq5PASYo/CMuHf8TLzprF6ntx0vo94QAWXwlFoS+XooSf+pZRZwwybRnvAQs2lHVKABKuUvQuw6wS5CqYZzJwHni9K2HEJfOFtAm8QiTfZN/0MlXGEmgStI4JyCFlbdpASQvL8IvGZX8GjLqvRP3LCWKGOqf95AEKRTeovJ8D3V/wcNhTNg3Q9gqF5bhTfXq4rlm2Vt2PDVkKEFaOKqaiZAScAUwKNUSi1v7clKYB7SFe0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Mon, 6 Jun
 2022 20:45:35 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::c069:1a0:f1d4:8033]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::c069:1a0:f1d4:8033%5]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 20:45:35 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: RE: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
Thread-Topic: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
Thread-Index: AQHYahyHcBOgLgTuZ0CGbr/thXg7iK07dnEAgAE5mYCABkggYA==
Date: Mon, 6 Jun 2022 20:45:34 +0000
Message-ID: <BN6PR11MB1633828C4585FBE68A9160E592A29@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <BN6PR11MB1633EE43D5B3711AC766974192DE9@BN6PR11MB1633.namprd11.prod.outlook.com>
 <20220602204836.GS4461@nvishwa1-DESK>
In-Reply-To: <20220602204836.GS4461@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc446971-1219-499f-8ba8-08da47fd8175
x-ms-traffictypediagnostic: BYAPR11MB2904:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB29045A5A4BFC26CD0D5B067592A29@BYAPR11MB2904.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qUOQmr4mDj6TAMSuzeFHMpoF9S0tPkzirHztt3BYWNsptZzQP9ijhihulhEtckK5Lb2tt2cBT6P2mzy3My0LoAU0PiUgLLh2xVaVskrdeUrWY7n3+XdsfdqYrMaHqg6iaDOhMnO9KnqtPO0Gd+8yPPPwVLw/YKNuNGk12gm8PVgymwUDvc5qSegqytmSgMPIquJlKDkWzdBYqsMmhd/0qV4hOkZXxK3v297HmjCgOp5fXlPuJx3ZTYzkRuJfJHlkQeZM01D4/TbU5JCcxuSvTYc1PI+v3ukwi3VpOHTpj61PaBBbyiWKfhT2bmz03y98/h5xPpk373ntHhofpSffUAAkgK+dSLTsFJukK35PTPwkhZqnLFfT+HXIyQ6Ul/80lxezl2gUSs50ujAo1Ujx2rIfmTQQMPvCRkSjfcLI9GGBunZW2EZjMJozi7Txp+1W7c6aLyalvL/WgsrRumFVCgqmSO2D2Dk5ePXfSLgO34PBkSEPuh0BL0gFMBckLuma9Y7nIyThTrgfh+wtfwFGxwDM5o1eZCQr0+H/6skucuKoXQrMswz8Vux/hsrRiEd8tL4Qoo2HceRHvhC9Fqiu07JWq6pqWFwr1kz8gNTO6qatwOBlkbSMkSGPjfx5JR2bLr7fxV+Ifg3ptzvCedXpNr7nu3d6uXBBQUsBntLprPjBHLhUSZ4qHgVAZtwRrQIKoqhoMzV9uApgO0KiNL70GEAiRdaFaoPLePcfeghMd06v3YUwYQt6gHnl1bX8Lf812UoKtZyiPeZ2lAmkY4HzseyEciNN68B6+XvAFT1IGeI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(83380400001)(53546011)(52536014)(4326008)(2906002)(7696005)(6506007)(6862004)(8676002)(186003)(508600001)(86362001)(30864003)(38100700002)(33656002)(66946007)(66556008)(71200400001)(6636002)(76116006)(82960400001)(54906003)(38070700005)(26005)(9686003)(122000001)(55016003)(316002)(5660300002)(66446008)(66476007)(64756008)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zAIfoIPRvetVANvuKfaKE8JM8V2yh4nW4hASE6Cepin96As/Sr2XeL00YoTJ?=
 =?us-ascii?Q?ZZ8fURC/j3uqa7nXnzscePyAF5fTcjs7r8FcQvtKRUGUxapdMZlN2vOCN0PK?=
 =?us-ascii?Q?5HTUWwIYrlb3q9K2B7h5WDum6Q/+NmUUzqfE6Uk0l2MuJHwM1rcun29L4JFl?=
 =?us-ascii?Q?rXMGtmu75DYRaOMf+Xrs/chjRCWEAKY7UawcQTuv22Sb6PPeZuigeEB5QwbP?=
 =?us-ascii?Q?pWH6SG+C2U+2OiWk/fdYJx+BBXlfUqC5UuEGYSDYOe6jIerUThMp12ZTU7Kc?=
 =?us-ascii?Q?/a5sa1+C7mgx+RcoxtlrTnOzZQpWGyywOJ5EeE0wM+Mk8t24cadq8ZfAYaYe?=
 =?us-ascii?Q?dU3AwNB6yLUCeCq4RdXPtYz0RD/qeKGQwPyEdoXw4Zjqts80A91yNZb6wBE3?=
 =?us-ascii?Q?D3pGmmEP2rFycpDEURD4GyCHXgZYW9TJtXKSBzvxU2peEPBFm+YVmTmsXIk1?=
 =?us-ascii?Q?93wV+oa4QItj5QB6H80imQu35hd+z31pQWyHb1RqoYoWfs2hHYu+V8/5eY+x?=
 =?us-ascii?Q?iQ4SxuLrr4kz/P+sonEIMu7BPThDMca2ln5tRCR1FPAnbwJTuntlTY4fqGBd?=
 =?us-ascii?Q?e/XUuKqLdEaHe2I6IiyVa2YIt9qkyETX+ZrBwDNAeuuxO5aNyeszodLuXzUf?=
 =?us-ascii?Q?d+0E2qotMA4r+MIJ7gmC0xKLxE6gKhP42kUOG+6kDR73nElhArDDYo195uYI?=
 =?us-ascii?Q?qNs7OtbNvXZY4YG5y070TP+D+T8FK2I5J6x90gMITyqLvg1VFlDqiDV38que?=
 =?us-ascii?Q?x9GtyXLBu73H+jKBqDNTrN9Q4LEqPsVIFtgac3NxJQnG3tQVWb/zmPFBEmwG?=
 =?us-ascii?Q?cDwWFmod9KZsaufbuU7POkccjVB5jVp1RRzSuSWa2k+YNgHBUSR+gkv0Dr9O?=
 =?us-ascii?Q?llxqbVK0wgwIEBGeE0eigYpJJYzYHgz+YBnGmQ9hYW3maA5CvfqClyBUviEN?=
 =?us-ascii?Q?Gq9Mtb7hVtCIgGBuwOaS6kSlfi507BDMZyUBA976wFxxkN4BrW74h+EcMsJm?=
 =?us-ascii?Q?W6GEVk4TIBMqyd62sLQ3ZTGxEVhHgTt4Om7deZo57y2IJNL7psDfghc6hqnW?=
 =?us-ascii?Q?UKZQtu2r9omlvRmk0eyHs424Xa4JJacqsrLZY4INuiVGmLwCJ2zVGzVLZnwz?=
 =?us-ascii?Q?Z+NpzjJZwuNyOzyFEqGyHLOmsOzqyXjNQvWmuzn8KIQ3AbuRuCT1MyxOQTKg?=
 =?us-ascii?Q?16Q170l8He4BYVOsSPR8RFve0eRjg5WYY/GrVnZcRhhaHehABuB+Zdnyo5nh?=
 =?us-ascii?Q?phaKOjHQadE0RBGo7CaGeTtcmsjNSiRseFb5WYcgs3nA9lTWaOY3sWtLgoEt?=
 =?us-ascii?Q?neVpUIiuQWucV1HVGzJEs3fi2GnDtCAT5u9zHdnMUW7C42MGfp1IU6U7sj8K?=
 =?us-ascii?Q?LYTg0RHZqOhrEzqYwrztX+TIXPM4l3pCrMvOjTLYPuSUh3vD5gUJQTKAB5TD?=
 =?us-ascii?Q?0Ca3qQ9685+jyRXFVztA/iS/467jdDlBlyENl52BjWTk2sw+GU5lex4Ra/vS?=
 =?us-ascii?Q?/VJ/q8JS1jXWpvqCvEHzydyRpI4GJgOt7risTJ+9ZYYXybe+Xj0Lbke//tun?=
 =?us-ascii?Q?8BuhVsx24075bVAF3wlxZpmJGn8Jzjbzpc8YeZfZa2IgV7+iKYXAJHCo5Zsi?=
 =?us-ascii?Q?OGZTj/+45eqWNc6H7a5Yv53bxmz/jZEzQpVpjv4UQ/POMNZNmPbDcDr9l8dN?=
 =?us-ascii?Q?nFxe37wSC0/tLA6XppSnTlIuib0QFltIyp3LJa48kU0hjWrKB0OOioLC8UO9?=
 =?us-ascii?Q?HC04LNyzxA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc446971-1219-499f-8ba8-08da47fd8175
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 20:45:35.0296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4d/hIIzNiDlWYRBtyl4HOLpZnvsj96CGc57xUuiNc0T6NtmCnHd0EAwzkOH53RQTSCG+lHnZ7vILeGUwXxqrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Regards,
Oak

> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: June 2, 2022 4:49 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Vet=
ter,
> Daniel <daniel.vetter@intel.com>; Brost, Matthew <matthew.brost@intel.com=
>;
> Hellstrom, Thomas <thomas.hellstrom@intel.com>; jason@jlekstrand.net;
> Wilson, Chris P <chris.p.wilson@intel.com>; christian.koenig@amd.com
> Subject: Re: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
>=20
> On Wed, Jun 01, 2022 at 07:13:16PM -0700, Zeng, Oak wrote:
> >
> >
> >Regards,
> >Oak
> >
> >> -----Original Message-----
> >> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >> Niranjana Vishwanathapura
> >> Sent: May 17, 2022 2:32 PM
> >> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; =
Vetter,
> >> Daniel <daniel.vetter@intel.com>
> >> Cc: Brost, Matthew <matthew.brost@intel.com>; Hellstrom, Thomas
> >> <thomas.hellstrom@intel.com>; jason@jlekstrand.net; Wilson, Chris P
> >> <chris.p.wilson@intel.com>; christian.koenig@amd.com
> >> Subject: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
> >>
> >> VM_BIND design document with description of intended use cases.
> >>
> >> v2: Add more documentation and format as per review comments
> >>     from Daniel.
> >>
> >> Signed-off-by: Niranjana Vishwanathapura
> >> <niranjana.vishwanathapura@intel.com>
> >> ---
> >>  Documentation/driver-api/dma-buf.rst   |   2 +
> >>  Documentation/gpu/rfc/i915_vm_bind.rst | 304
> >> +++++++++++++++++++++++++
> >>  Documentation/gpu/rfc/index.rst        |   4 +
> >>  3 files changed, 310 insertions(+)
> >>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
> >>
> >> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driv=
er-
> >> api/dma-buf.rst
> >> index 36a76cbe9095..64cb924ec5bb 100644
> >> --- a/Documentation/driver-api/dma-buf.rst
> >> +++ b/Documentation/driver-api/dma-buf.rst
> >> @@ -200,6 +200,8 @@ DMA Fence uABI/Sync File
> >>  .. kernel-doc:: include/linux/sync_file.h
> >>     :internal:
> >>
> >> +.. _indefinite_dma_fences:
> >> +
> >>  Indefinite DMA Fences
> >>  ~~~~~~~~~~~~~~~~~~~~~
> >>
> >> diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst
> >> b/Documentation/gpu/rfc/i915_vm_bind.rst
> >> new file mode 100644
> >> index 000000000000..f1be560d313c
> >> --- /dev/null
> >> +++ b/Documentation/gpu/rfc/i915_vm_bind.rst
> >> @@ -0,0 +1,304 @@
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +I915 VM_BIND feature design and use cases
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +VM_BIND feature
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
> >> buffer
> >> +objects (BOs) or sections of a BOs at specified GPU virtual addresses=
 on a
> >> +specified address space (VM). These mappings (also referred to as per=
sistent
> >> +mappings) will be persistent across multiple GPU submissions (execbuf=
f calls)
> >> +issued by the UMD, without user having to provide a list of all requi=
red
> >> +mappings during each submission (as required by older execbuff mode).
> >> +
> >> +VM_BIND/UNBIND ioctls will support 'in' and 'out' fences to allow use=
rpace
> >> +to specify how the binding/unbinding should sync with other operation=
s
> >> +like the GPU job submission. These fences will be timeline 'drm_synco=
bj's
> >> +for non-Compute contexts (See struct
> >> drm_i915_vm_bind_ext_timeline_fences).
> >> +For Compute contexts, they will be user/memory fences (See struct
> >> +drm_i915_vm_bind_ext_user_fence).
> >> +
> >> +VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
> >> +User has to opt-in for VM_BIND mode of binding for an address space (=
VM)
> >> +during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND
> >> extension.
> >> +
> >> +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the
> mapping in
> >> an
> >> +async worker. The binding and unbinding will work like a special GPU =
engine.
> >> +The binding and unbinding operations are serialized and will wait on =
specified
> >> +input fences before the operation and will signal the output fences u=
pon the
> >> +completion of the operation. Due to serialization, completion of an o=
peration
> >> +will also indicate that all previous operations are also complete.
> >
> >Hi,
> >
> >Is user required to wait for the out fence be signaled before submit a g=
pu job
> using the vm_bind address?
> >Or is user required to order the gpu job to make gpu job run after vm_bi=
nd out
> fence signaled?
> >
>=20
> Thanks Oak,
> Either should be fine and up to user how to use vm_bind/unbind out-fence.
>=20
> >I think there could be different behavior on a non-faultable platform an=
d a
> faultable platform, such as on a non-faultable
> >Platform, gpu job is required to be order after vm_bind out fence signal=
ing; and
> on a faultable platform, there is no such
> >Restriction since vm bind can be finished in the fault handler?
> >
>=20
> With GPU page faults handler, out fence won't be needed as residency is
> purely managed by page fault handler populating page tables (there is a
> mention of it in GPU Page Faults section below).
>=20
> >Should we document such thing?
> >
>=20
> We don't talk much about GPU page faults case in this document as that ma=
y
> warrent a separate rfc when we add page faults support. We did mention it
> in couple places to ensure our locking design here is extensible to gpu
> page faults case.

Ok, that makes sense to me. Thanks for explaining.

Regards,
Oak

>=20
> Niranjana
>=20
> >Regards,
> >Oak
> >
> >
> >> +
> >> +VM_BIND features include:
> >> +
> >> +* Multiple Virtual Address (VA) mappings can map to the same physical
> pages
> >> +  of an object (aliasing).
> >> +* VA mapping can map to a partial section of the BO (partial binding)=
.
> >> +* Support capture of persistent mappings in the dump upon GPU error.
> >> +* TLB is flushed upon unbind completion. Batching of TLB flushes in s=
ome
> >> +  use cases will be helpful.
> >> +* Asynchronous vm_bind and vm_unbind support with 'in' and 'out' fenc=
es.
> >> +* Support for userptr gem objects (no special uapi is required for th=
is).
> >> +
> >> +Execbuff ioctl in VM_BIND mode
> >> +-------------------------------
> >> +The execbuff ioctl handling in VM_BIND mode differs significantly fro=
m the
> >> +older method. A VM in VM_BIND mode will not support older execbuff
> mode of
> >> +binding. In VM_BIND mode, execbuff ioctl will not accept any execlist=
.
> Hence,
> >> +no support for implicit sync. It is expected that the below work will=
 be able
> >> +to support requirements of object dependency setting in all use cases=
:
> >> +
> >> +"dma-buf: Add an API for exporting sync files"
> >> +(https://lwn.net/Articles/859290/)
> >> +
> >> +This also means, we need an execbuff extension to pass in the batch
> >> +buffer addresses (See struct
> >> drm_i915_gem_execbuffer_ext_batch_addresses).
> >> +
> >> +If at all execlist support in execbuff ioctl is deemed necessary for
> >> +implicit sync in certain use cases, then support can be added later.
> >> +
> >> +In VM_BIND mode, VA allocation is completely managed by the user inst=
ead
> of
> >> +the i915 driver. Hence all VA assignment, eviction are not applicable=
 in
> >> +VM_BIND mode. Also, for determining object activeness, VM_BIND mode
> will
> >> not
> >> +be using the i915_vma active reference tracking. It will instead use =
dma-resv
> >> +object for that (See `VM_BIND dma_resv usage`_).
> >> +
> >> +So, a lot of existing code in the execbuff path like relocations, VA =
evictions,
> >> +vma lookup table, implicit sync, vma active reference tracking etc., =
are not
> >> +applicable in VM_BIND mode. Hence, the execbuff path needs to be clea=
ned
> up
> >> +by clearly separating out the functionalities where the VM_BIND mode
> differs
> >> +from older method and they should be moved to separate files.
> >> +
> >> +VM_PRIVATE objects
> >> +-------------------
> >> +By default, BOs can be mapped on multiple VMs and can also be dma-buf
> >> +exported. Hence these BOs are referred to as Shared BOs.
> >> +During each execbuff submission, the request fence must be added to t=
he
> >> +dma-resv fence list of all shared BOs mapped on the VM.
> >> +
> >> +VM_BIND feature introduces an optimization where user can create BO
> which
> >> +is private to a specified VM via I915_GEM_CREATE_EXT_VM_PRIVATE flag
> >> during
> >> +BO creation. Unlike Shared BOs, these VM private BOs can only be mapp=
ed
> on
> >> +the VM they are private to and can't be dma-buf exported.
> >> +All private BOs of a VM share the dma-resv object. Hence during each
> execbuff
> >> +submission, they need only one dma-resv fence list updated. Thus, the=
 fast
> >> +path (where required mappings are already bound) submission latency i=
s
> O(1)
> >> +w.r.t the number of VM private BOs.
> >> +
> >> +VM_BIND locking hirarchy
> >> +-------------------------
> >> +The locking design here supports the older (execlist based) execbuff =
mode,
> the
> >> +newer VM_BIND mode, the VM_BIND mode with GPU page faults and
> possible
> >> future
> >> +system allocator support (See `Shared Virtual Memory (SVM) support`_)=
.
> >> +The older execbuff mode and the newer VM_BIND mode without page
> faults
> >> manages
> >> +residency of backing storage using dma_fence. The VM_BIND mode with
> page
> >> faults
> >> +and the system allocator support do not use any dma_fence at all.
> >> +
> >> +VM_BIND locking order is as below.
> >> +
> >> +1) Lock-A: A vm_bind mutex will protect vm_bind lists. This lock is t=
aken in
> >> +   vm_bind/vm_unbind ioctl calls, in the execbuff path and while rele=
asing
> the
> >> +   mapping.
> >> +
> >> +   In future, when GPU page faults are supported, we can potentially =
use a
> >> +   rwsem instead, so that multiple page fault handlers can take the r=
ead side
> >> +   lock to lookup the mapping and hence can run in parallel.
> >> +   The older execbuff mode of binding do not need this lock.
> >> +
> >> +2) Lock-B: The object's dma-resv lock will protect i915_vma state and=
 needs
> to
> >> +   be held while binding/unbinding a vma in the async worker and whil=
e
> updating
> >> +   dma-resv fence list of an object. Note that private BOs of a VM wi=
ll all
> >> +   share a dma-resv object.
> >> +
> >> +   The future system allocator support will use the HMM prescribed lo=
cking
> >> +   instead.
> >> +
> >> +3) Lock-C: Spinlock/s to protect some of the VM's lists like the list=
 of
> >> +   invalidated vmas (due to eviction and userptr invalidation) etc.
> >> +
> >> +When GPU page faults are supported, the execbuff path do not take any=
 of
> >> these
> >> +locks. There we will simply smash the new batch buffer address into t=
he ring
> >> and
> >> +then tell the scheduler run that. The lock taking only happens from t=
he page
> >> +fault handler, where we take lock-A in read mode, whichever lock-B we
> need to
> >> +find the backing storage (dma_resv lock for gem objects, and hmm/core=
 mm
> for
> >> +system allocator) and some additional locks (lock-D) for taking care =
of page
> >> +table races. Page fault mode should not need to ever manipulate the v=
m
> lists,
> >> +so won't ever need lock-C.
> >> +
> >> +VM_BIND LRU handling
> >> +---------------------
> >> +We need to ensure VM_BIND mapped objects are properly LRU tagged to
> avoid
> >> +performance degradation. We will also need support for bulk LRU movem=
ent
> of
> >> +VM_BIND objects to avoid additional latencies in execbuff path.
> >> +
> >> +The page table pages are similar to VM_BIND mapped objects (See
> >> +`Evictable page table allocations`_) and are maintained per VM and ne=
eds to
> >> +be pinned in memory when VM is made active (ie., upon an execbuff cal=
l
> with
> >> +that VM). So, bulk LRU movement of page table pages is also needed.
> >> +
> >> +The i915 shrinker LRU has stopped being an LRU. So, it should also be=
 moved
> >> +over to the ttm LRU in some fashion to make sure we once again have a
> >> reasonable
> >> +and consistent memory aging and reclaim architecture.
> >> +
> >> +VM_BIND dma_resv usage
> >> +-----------------------
> >> +Fences needs to be added to all VM_BIND mapped objects. During each
> >> execbuff
> >> +submission, they are added with DMA_RESV_USAGE_BOOKKEEP usage to
> >> prevent
> >> +over sync (See enum dma_resv_usage). One can override it with either
> >> +DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE usage during
> object
> >> dependency
> >> +setting (either through explicit or implicit mechanism).
> >> +
> >> +When vm_bind is called for a non-private object while the VM is alrea=
dy
> >> +active, the fences need to be copied from VM's shared dma-resv object
> >> +(common to all private objects of the VM) to this non-private object.
> >> +If this results in performance degradation, then some optimization wi=
ll
> >> +be needed here. This is not a problem for VM's private objects as the=
y use
> >> +shared dma-resv object which is always updated on each execbuff
> submission.
> >> +
> >> +Also, in VM_BIND mode, use dma-resv apis for determining object
> activeness
> >> +(See dma_resv_test_signaled() and dma_resv_wait_timeout()) and do not
> use
> >> the
> >> +older i915_vma active reference tracking which is deprecated. This sh=
ould be
> >> +easier to get it working with the current TTM backend. We can remove =
the
> >> +i915_vma active reference tracking fully while supporting TTM backend=
 for
> igfx.
> >> +
> >> +Evictable page table allocations
> >> +---------------------------------
> >> +Make pagetable allocations evictable and manage them similar to VM_BI=
ND
> >> +mapped objects. Page table pages are similar to persistent mappings o=
f a
> >> +VM (difference here are that the page table pages will not have an i9=
15_vma
> >> +structure and after swapping pages back in, parent page link needs to=
 be
> >> +updated).
> >> +
> >> +Mesa use case
> >> +--------------
> >> +VM_BIND can potentially reduce the CPU overhead in Mesa (both Vulkan
> and
> >> Iris),
> >> +hence improving performance of CPU-bound applications. It also allows=
 us to
> >> +implement Vulkan's Sparse Resources. With increasing GPU hardware
> >> performance,
> >> +reducing CPU overhead becomes more impactful.
> >> +
> >> +
> >> +VM_BIND Compute support
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> +
> >> +User/Memory Fence
> >> +------------------
> >> +The idea is to take a user specified virtual address and install an i=
nterrupt
> >> +handler to wake up the current task when the memory location passes t=
he
> user
> >> +supplied filter. User/Memory fence is a <address, value> pair. To sig=
nal the
> >> +user fence, specified value will be written at the specified virtual =
address
> >> +and wakeup the waiting process. User can wait on a user fence with th=
e
> >> +gem_wait_user_fence ioctl.
> >> +
> >> +It also allows the user to emit their own MI_FLUSH/PIPE_CONTROL notif=
y
> >> +interrupt within their batches after updating the value to have sub-b=
atch
> >> +precision on the wakeup. Each batch can signal a user fence to indica=
te
> >> +the completion of next level batch. The completion of very first leve=
l batch
> >> +needs to be signaled by the command streamer. The user must provide t=
he
> >> +user/memory fence for this via the
> >> DRM_I915_GEM_EXECBUFFER_EXT_USER_FENCE
> >> +extension of execbuff ioctl, so that KMD can setup the command stream=
er
> to
> >> +signal it.
> >> +
> >> +User/Memory fence can also be supplied to the kernel driver to signal=
/wake
> up
> >> +the user process after completion of an asynchronous operation.
> >> +
> >> +When VM_BIND ioctl was provided with a user/memory fence via the
> >> +I915_VM_BIND_EXT_USER_FENCE extension, it will be signaled upon the
> >> completion
> >> +of binding of that mapping. All async binds/unbinds are serialized, h=
ence
> >> +signaling of user/memory fence also indicate the completion of all pr=
evious
> >> +binds/unbinds.
> >> +
> >> +This feature will be derived from the below original work:
> >> +https://patchwork.freedesktop.org/patch/349417/
> >> +
> >> +Long running Compute contexts
> >> +------------------------------
> >> +Usage of dma-fence expects that they complete in reasonable amount of
> time.
> >> +Compute on the other hand can be long running. Hence it is appropriat=
e for
> >> +compute to use user/memory fence and dma-fence usage will be limited =
to
> >> +in-kernel consumption only. This requires an execbuff uapi extension =
to pass
> >> +in user fence (See struct drm_i915_vm_bind_ext_user_fence). Compute
> must
> >> opt-in
> >> +for this mechanism with I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING
> flag
> >> during
> >> +context creation. The dma-fence based user interfaces like gem_wait i=
octl
> and
> >> +execbuff out fence are not allowed on long running contexts. Implicit=
 sync is
> >> +not valid as well and is anyway not supported in VM_BIND mode.
> >> +
> >> +Where GPU page faults are not available, kernel driver upon buffer
> invalidation
> >> +will initiate a suspend (preemption) of long running context with a d=
ma-
> fence
> >> +attached to it. And upon completion of that suspend fence, finish the
> >> +invalidation, revalidate the BO and then resume the compute context. =
This is
> >> +done by having a per-context preempt fence (also called suspend fence=
)
> >> proxying
> >> +as i915_request fence. This suspend fence is enabled when someone tri=
es to
> >> wait
> >> +on it, which then triggers the context preemption.
> >> +
> >> +As this support for context suspension using a preempt fence and the
> resume
> >> work
> >> +for the compute mode contexts can get tricky to get it right, it is b=
etter to
> >> +add this support in drm scheduler so that multiple drivers can make u=
se of it.
> >> +That means, it will have a dependency on i915 drm scheduler conversio=
n with
> >> GuC
> >> +scheduler backend. This should be fine, as the plan is to support com=
pute
> mode
> >> +contexts only with GuC scheduler backend (at least initially). This i=
s much
> >> +easier to support with VM_BIND mode compared to the current heavier
> >> execbuff
> >> +path resource attachment.
> >> +
> >> +Low Latency Submission
> >> +-----------------------
> >> +Allows compute UMD to directly submit GPU jobs instead of through
> execbuff
> >> +ioctl. This is made possible by VM_BIND is not being synchronized aga=
inst
> >> +execbuff. VM_BIND allows bind/unbind of mappings required for the
> directly
> >> +submitted jobs.
> >> +
> >> +Other VM_BIND use cases
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> +
> >> +Debugger
> >> +---------
> >> +With debug event interface user space process (debugger) is able to k=
eep
> track
> >> +of and act upon resources created by another process (debugged) and
> attached
> >> +to GPU via vm_bind interface.
> >> +
> >> +GPU page faults
> >> +----------------
> >> +GPU page faults when supported (in future), will only be supported in=
 the
> >> +VM_BIND mode. While both the older execbuff mode and the newer
> VM_BIND
> >> mode of
> >> +binding will require using dma-fence to ensure residency, the GPU pag=
e
> faults
> >> +mode when supported, will not use any dma-fence as residency is purel=
y
> >> managed
> >> +by installing and removing/invalidating page table entries.
> >> +
> >> +Page level hints settings
> >> +--------------------------
> >> +VM_BIND allows any hints setting per mapping instead of per BO.
> >> +Possible hints include read-only mapping, placement and atomicity.
> >> +Sub-BO level placement hint will be even more relevant with
> >> +upcoming GPU on-demand page fault support.
> >> +
> >> +Page level Cache/CLOS settings
> >> +-------------------------------
> >> +VM_BIND allows cache/CLOS settings per mapping instead of per BO.
> >> +
> >> +Shared Virtual Memory (SVM) support
> >> +------------------------------------
> >> +VM_BIND interface can be used to map system memory directly (without
> gem
> >> BO
> >> +abstraction) using the HMM interface. SVM is only supported with GPU =
page
> >> +faults enabled.
> >> +
> >> +
> >> +Broder i915 cleanups
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +Supporting this whole new vm_bind mode of binding which comes with it=
s
> own
> >> +use cases to support and the locking requirements requires proper
> integration
> >> +with the existing i915 driver. This calls for some broader i915 drive=
r
> >> +cleanups/simplifications for maintainability of the driver going forw=
ard.
> >> +Here are few things identified and are being looked into.
> >> +
> >> +- Remove vma lookup cache (eb->gem_context->handles_vma). VM_BIND
> >> feature
> >> +  do not use it and complexity it brings in is probably more than the
> >> +  performance advantage we get in legacy execbuff case.
> >> +- Remove vma->open_count counting
> >> +- Remove i915_vma active reference tracking. VM_BIND feature will not=
 be
> >> using
> >> +  it. Instead use underlying BO's dma-resv fence list to determine if=
 a
> i915_vma
> >> +  is active or not.
> >> +
> >> +
> >> +VM_BIND UAPI
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +.. kernel-doc:: Documentation/gpu/rfc/i915_vm_bind.h
> >> diff --git a/Documentation/gpu/rfc/index.rst
> b/Documentation/gpu/rfc/index.rst
> >> index 91e93a705230..7d10c36b268d 100644
> >> --- a/Documentation/gpu/rfc/index.rst
> >> +++ b/Documentation/gpu/rfc/index.rst
> >> @@ -23,3 +23,7 @@ host such documentation:
> >>  .. toctree::
> >>
> >>      i915_scheduler.rst
> >> +
> >> +.. toctree::
> >> +
> >> +    i915_vm_bind.rst
> >> --
> >> 2.21.0.rc0.32.g243a4c7e27
> >
