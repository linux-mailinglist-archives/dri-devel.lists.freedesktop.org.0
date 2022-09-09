Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71105B2E66
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9810E8B4;
	Fri,  9 Sep 2022 06:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CF010E8B4;
 Fri,  9 Sep 2022 06:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662703293; x=1694239293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q4qMm6XSo+EooMIxy57lu2l6c7oKZqZ98hpsS1BYrUo=;
 b=Axad64iIBxXwNdD9GirgCDK5TDEN9NMn25txVFc2QxBpN0iOIXxBrb27
 ks5HTYH31eAsjfvYNahe5VmiGvghfv7wt2QgBlOeJLQVvhDdnm79pqtgp
 o3NoTuyZzmDwQOnKyTyeN+wuIMtdR5fI8fZ/4iWk6FXocJZKdXz5bcF8r
 KmT3Sd/aWrlO+NESB3Jgzzpp7oKwFVYn438qh9F0KpR4JG7qAyqcMlTP6
 WtltRwOSWgH7DGT77UVXVySwHdZCvyhYbgksbzZ/dn1BsVZ81f21H+tW0
 4bcZaLFiIODh2yWQNUEenC3D9V+Xx9Cf17m0SURFVpIpxYmqNytEbNzYk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361362525"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="361362525"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 23:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="592489962"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 23:01:32 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:01:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:01:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 23:01:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 23:01:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gP2Ee5Xy8y0F5jjdWwiG0ws8lqpNrGWo1lTtIvcdKd8obQ5GXB+VglJMKkVF6Zrk6tpFpASRG7t9inSpUsYo64+GTS5b6RBojkrmV203hHI1rXwp/uwRaanxjp1xke7r3hVfEzhOeMguxfyd3PaPXPARvhZiGedX2QmEppn1O+G5piuw3EF1BD1JcYia5Hc01+gloOxS5pX2rSA3KQCj7LXvm/7TuDEWStNBotFyQWH9nrne7zLOE6UIIkLJJc9CvJMdyXiw2xZJgwr/3VcQAtXnRZVfxb1VIbs8GNGySHcgiLAckwvPFec93Y2BN0lpXaErRb7bTRXLdyMASZgoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXMm7O5tpxv3tiXOn6pC4UJvsfQrjtHtElwmPYCf4HU=;
 b=dhbgtolsZBHLpWOEdjDIpx3BPVjwSutPTiJiWMgurDA8uJuwLANj79t4PoSReez0CT1XL021RlmhbbMxhoUL/tTFIBrDDh+v2qR7lVLWmioDefGNeSr3U7r6VbCyJr/RrUSu19c/gnjsnDaAyy1VdYx7MsXEX4D193QaOoQGqnZEecUTVWJ8KiBVElYA6rFCJbNAHiUCpTnsLW75g28if7RYCMEqQNKAxXU/u/uIdv4zyLD8RSxjHqmsEI5KdRH+n9LC56AkZ2NlSdxC37gGLkkjmLhkiwZltMRnfSINs8hgvG6HhwINFcaEzi5vSyuBwzxTKD4ZpZ5lxTOiNZyZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 06:01:29 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5588.023; Fri, 9 Sep 2022
 06:01:29 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 00/15] drm/i915: HuC loading for DG2
Thread-Topic: [PATCH v4 00/15] drm/i915: HuC loading for DG2
Thread-Index: AQHYw+FvISGDGt7/k0uk3ACTkCCIUa3Wmtpg
Date: Fri, 9 Sep 2022 06:01:29 +0000
Message-ID: <MN2PR11MB409333EF91F1B47490F78B26E5439@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26677b92-57dd-449f-1d8a-08da9228bd20
x-ms-traffictypediagnostic: BL1PR11MB5319:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 60h1J6ynyMMBWeeb9LCpS1cgidCJa6kiBmUxe9sgZUTF+xDC47ad3xGkc1JEHjdGNd0upHCzqWSI7tWgXe9gfoKorYa2l2qhAJVYgurT7m2Iip1P2/YYl6lfoLEmESfPDFy0tOzfPx268rns4MmLD0ZHJkwWCJt6cyItyNXWasBmvnVf8BMKs0qfDF9iTWmSZjNcNjdMJJ/D48hQHYLOtXNch38G3kFQO40nAV+BriWgMnii2JYMsKddP4tYmGEJeuJ7KIU2pjubnTJX3zY/j3iujMg7nzgP9JVEmYG6SiDoqOneZWAFcEvFKWKQdpMj2yimduhs/9DkGobdaBzD+AYeN8NWW1Y6moXqDh7XOzF90GrZXXUWyUYPX3WuBpvEJDLwu+6KvLQ7bBRHG+BO8pnEPwGaMeb0ldGXNicvOT9+jQ/KdVYYqt8aDydKK/nQKvl6+5WynQL6YwEKgB5lyfl/QAQem++af76Re4kaw45DCFwWk0lmH9aIaYNXmnjZbMQ+4nk3ajJrivtmNTydLmiIsp3V2Xam3qu3IkRuyapumeOV8Qer2iTH8uFqwTpGpG4W1bk58o/rAqZPsrAlg0zZFLxxMArGSpRZxu9WHkgfbFFLVNKg31fP9XpwFKEFnBV0nUELU/oFGwN8uL3IAWgv2y8Bn4CEOuBKXVo3nFQ+2gVL0uyy60Ni3NA0a6DZD2vh0OoRicOdd86alDTpcVp5oSqLvqIE8mqT4Kpe/J/x1m2aN6cvV/E6ozz2qqYg3nUxI+b4ZS1jIGAcEbuV3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(39860400002)(396003)(366004)(71200400001)(316002)(110136005)(54906003)(82960400001)(86362001)(122000001)(83380400001)(186003)(478600001)(66556008)(41300700001)(7696005)(9686003)(38100700002)(26005)(33656002)(38070700005)(6506007)(2906002)(8936002)(55016003)(5660300002)(52536014)(76116006)(4326008)(66446008)(64756008)(8676002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fIymrR0MaB4aqXUeKTWJnTCNqQtswcbmnK14mSkNVHUndnmNNqzWDhLKJQFr?=
 =?us-ascii?Q?g2Gt016/6CnsewPPGQvh+omsRP/et7BFTCAA48sRK9DwQbCvnxdluKTEPwm6?=
 =?us-ascii?Q?g9hhBChSy7aYawkqGBUhQcRa2V9zZapg9UPD9VKOsaupqevfGULUrwFOe7c/?=
 =?us-ascii?Q?a9y9xTnDYLvhUNgaiZBXkq8B5lg0dG+Y8J2Vz2lpFU7m84xpjq4XjUeCxz78?=
 =?us-ascii?Q?O+IDRoFVLHwA7n1l7yuFEe4YrDB4tX2tJWo6pWf83ce1wBySQyKSFQMGjjkF?=
 =?us-ascii?Q?qMa8tJ8y7HyMtZT0orHbQOb9h1+WLq5NIJ7oqspBxbfM4/bIKifvh4DPQGKN?=
 =?us-ascii?Q?6BQhwaH5XuDFPj0pivvGijbpLkZJwMEfxcLvKu1QDQdNVByIjvf+LoM0icrH?=
 =?us-ascii?Q?bCWqDwgYIkN/qYVb6QD5zozuNgxNDizLxmxQiy5xCtiTHgTN0tgHbTgTsPBL?=
 =?us-ascii?Q?3UFOV5yJZc4o0SZcxk7Ub+BqpkhRqf1uSE0nOu81DNsvPrQ/JaK1R6OzOctB?=
 =?us-ascii?Q?hMhGxKzGZ162hQpYl2Quw40VTBKCiBhsE61LUqGMb12molhXcCj3QMWnlqno?=
 =?us-ascii?Q?H9G/cnFu4EM1J43XiDYjVnVohw8R/QKpb6zCbC+GxCWFYzK2AziDGbXUSLQj?=
 =?us-ascii?Q?bH6AFqkp0667X3CTDVtySRlrnbDTNovMZj3bwuUFhNrnZKurjkDRjqPuAKiZ?=
 =?us-ascii?Q?jiWbJMmTIOUBb7nq2Qxf+EOmZAQLmb20IZ+Kzy6w8RAK/8yWbyCYPaou77Sy?=
 =?us-ascii?Q?D2qWIXD6OCOHW9a3LLQXBLygHW1wBgBjzeJmyASNc0NVcgcB19L9Xy8NejtH?=
 =?us-ascii?Q?KyeY76Vzg5pH6uvFdYLicni3ySAblqliR/8ZRy6Dmzq8zsW8tBctqbyZY8DR?=
 =?us-ascii?Q?dLWz7vEEBtTyseV6wxApLEP5pI1+/mEsTPunqY1R5BI1PjROYhZ0Jf14WO6v?=
 =?us-ascii?Q?AwFHQl6whGHGkpIFlXBaYzfmekAoI2UXyA5dDHxZF02hV4EaR0ghMzyi65oS?=
 =?us-ascii?Q?XY4FjTUzmHTEZsH1aLB/8VJ/d0lA5T+QadiAXMqdC9dmHLxX/TfOZbgoyAM1?=
 =?us-ascii?Q?hODtK5pdxSrcVM7Lvq/jfQPRhwFz2uLnbaED8P494HSiPnwrBKpg+QDwU1B/?=
 =?us-ascii?Q?xBKeff4CTWjjV8Co+/YnhwaNoUasvr3ic4tRsH+P29M8yS7nuwJWaEDVJnLF?=
 =?us-ascii?Q?sba20SAH6SZT1iuB7HIs9woYPy9qPHnF9w5cIR4S0awTWoKyctcEAB58lE6H?=
 =?us-ascii?Q?B5jPUkV6dr7B80TTpb1EBu1IiWXdCK9eccxrkm2gzQdcEBV6XcRiACCT47N9?=
 =?us-ascii?Q?Gop7nhXG5wg6TVvMpLXVtpR1kirhgtNA9SWr6UbgxAMR2uWBJsa5SgRqTtm1?=
 =?us-ascii?Q?eW7owh0EeXGDK2bYIXvJ9S9pglHv6C6ZSvlAYFQ7IfoTvrAttXAHcvuOe2NB?=
 =?us-ascii?Q?swjIBNI5y+lLT8Vez1Oyz8P8VciVGmjPhmchNLgmSqbp9/rObVLkElEqWU47?=
 =?us-ascii?Q?msMUL2bGLHx3sEeVzBtt9JQA8Xjv7NMn6CajbUoyB3uIhzHsjlPdEIJu3vNF?=
 =?us-ascii?Q?TMufasSC6YC3w2GiqdNReXQwJ2GWyYvFl3Emvwup?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26677b92-57dd-449f-1d8a-08da9228bd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 06:01:29.5379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4LTVU109hPMqrPNnLjHXv8LV+fSYQQnhgKnwDkDEiPB011g+RmOweWrDjVv+O6VauvK/RtfBtMLiBULpcDZS6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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
Cc: "Ye, Tony" <tony.ye@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On DG2, HuC loading is performed by the GSC, via a PXP command. The load
> operation itself is relatively simple (just send a message to the GSC wit=
h the
> physical address of the HuC in LMEM), but there are timing changes that
> requires special attention. In particular, to send a PXP command we need =
to
> first export the GSC as an aux device and then wait for the mei-gsc and m=
ei-
> pxp modules to start, which means that HuC load will complete after i915
> load is complete. This means that there is a small window of time after i=
915 is
> registered and before HuC is loaded during which userspace could submit
> and/or check the HuC load status, although this is quite unlikely to happ=
en
> (HuC is usually loaded before kernel init/resume completes).
> We've consulted with the media team in regards to how to handle this and
> they've asked us to stall all userspace VCS submission until HuC is loade=
d.
> Stalls are expected to be very rare (if any), due to the fact that HuC is=
 usually
> loaded before kernel init/resume is completed.
>=20
> Timeouts are in place to ensure all submissions are unlocked in case
> something goes wrong. Since we need to monitor the status of the mei
> driver to know what's happening and when to time out, a notifier has been
> added so we get a callback when the status of the mei driver changes.
>=20
> Note that this series includes several mei patches that add support for
> sending the HuC loading command via mei-gsc. We plan to merge those
> patches through the drm tree because i915 is the sole user.
>=20
> v2: address review comments, Reporting HuC loading still in progress whil=
e
> we wait for mei-gsc init to complete, rebase on latest mei-gsc series.
>=20
> v3: fix cc list in mei patches.
>=20
> v4: update mei patches, fix includes, rebase on new FW fetch logic and
> merged mei-gsc support.
>=20
> Test-with: 20220818224216.3920822-1-daniele.ceraolospurio@intel.com
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

>=20
> Daniele Ceraolo Spurio (7):
>   drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
>   drm/i915/dg2: setup HuC loading via GSC
>   drm/i915/huc: track delayed HuC load with a fence
>   drm/i915/huc: stall media submission until HuC is loaded
>   drm/i915/huc: better define HuC status getparam possible return
>     values.
>   drm/i915/huc: define gsc-compatible HuC fw for DG2
>   HAX: drm/i915: force INTEL_MEI_GSC and INTEL_MEI_PXP on for CI
>=20
> Tomas Winkler (5):
>   mei: add support to GSC extended header
>   mei: bus: enable sending gsc commands
>   mei: adjust extended header kdocs
>   mei: pxp: support matching with a gfx discrete card
>   drm/i915/pxp: add huc authentication and loading command
>=20
> Vitaly Lubart (3):
>   mei: bus: extend bus API to support command streamer API
>   mei: pxp: add command streamer API to the PXP driver
>   drm/i915/pxp: implement function for sending tee stream command
>=20
>  drivers/gpu/drm/i915/Kconfig.debug            |   2 +
>  drivers/gpu/drm/i915/Makefile                 |  11 +-
>  drivers/gpu/drm/i915/gt/intel_gsc.c           |  22 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 254 ++++++++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  31 +++
>  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  34 +++
>  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   1 +
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  24 +-
>  drivers/gpu/drm/i915/i915_request.c           |  24 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp.c          |  32 ++-
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          |  32 ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  69 +++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      |  13 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   8 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  11 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 138 +++++++++-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |   5 +
>  .../drm/i915/pxp/intel_pxp_tee_interface.h    |  23 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
>  drivers/misc/mei/bus.c                        | 145 +++++++++-
>  drivers/misc/mei/client.c                     |  55 ++--
>  drivers/misc/mei/hbm.c                        |  13 +
>  drivers/misc/mei/hw-me.c                      |   7 +-
>  drivers/misc/mei/hw.h                         |  65 ++++-
>  drivers/misc/mei/interrupt.c                  |  47 +++-
>  drivers/misc/mei/mei_dev.h                    |   8 +
>  drivers/misc/mei/pxp/mei_pxp.c                |  41 ++-
>  include/drm/i915_pxp_tee_interface.h          |   5 +
>  include/linux/mei_cl_bus.h                    |   6 +
>  include/uapi/drm/i915_drm.h                   |  16 ++
>  32 files changed, 1035 insertions(+), 122 deletions(-)  create mode 1006=
44
> drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
>=20

Greg, can we have you review for the mei part of the series.
I've addressed your comments ' mei: add support to GSC extended header'  pa=
tch.=20

Thanks
Tomas

> --
> 2.37.2

