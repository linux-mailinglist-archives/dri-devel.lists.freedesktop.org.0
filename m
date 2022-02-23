Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11C4C0C77
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 07:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE3710EB04;
	Wed, 23 Feb 2022 06:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F6210EB04;
 Wed, 23 Feb 2022 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645597054; x=1677133054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EnPpK67SrFe7qOGriVHVW3VodAB27ol2M0seJK4LxiM=;
 b=SdpZEIBKsO9dhG3VGyd+kZygglvKaEbWunzWpwpGtghvHJjZ1X6MPyzw
 5zw32FGcucmXrqco5XjrJtLEEi0zhtJy+akQhSMTeRWpJ/+r7esp+D//e
 HlHay6WdnRLPxcKrxMtvObt9Wtj/UIGHdawmZ2dR82u853D3WcW8cFIF8
 TkuubFeRkKeaisAJS2XNxCvPyLlUzxhG4/LnpiyFBkWJz1l6KLYS6g1qE
 3TRTkxJ6fN5KrEsv8ziBeUQ6RnCJJNbieu4/K5wvlC3m5kWjQMEqbUKPM
 CuTKDJL36dpDEFSYD2m3WHvQjilh2+U9PJ/6bYKvovnbDKoX9Iowbarf/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239282673"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="239282673"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 22:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="532550001"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 22:17:33 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 22:17:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 22:17:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 22:17:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 22:17:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBM4E9WCVwNQ+xBT0K8Du1uZvCDtfi/cz6RDEbewiNRJsETI7bSdfh1NQu15/yJ6lThN6HBT0GAoUgYmcw47pckAIUhSM+4B+/vZqIAv8rAt3Hj4k3f9EnD4zULs4/oud9uU9P0PaAiXe1+wRwM7Rj/ektO5i4N3MqgdkwTrvmvhCnxgUx6Cs92U51ddPksfHgKNk3M6a7a5OGp2S9tLAc16Uaj6oAn8/28GNqDHKZivvk4hFuFkS6c3hAjuCW21kijxOaeKSvwq4q2y6NtAS+O3r1+00CAqr1zAEAe0HTCm1+5V1rfO3194mumKpuliE8Wh3vu7tVW4wOSYbAPKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnPpK67SrFe7qOGriVHVW3VodAB27ol2M0seJK4LxiM=;
 b=GHcZ/Fgrz/Xwt0MenIJpSLrQCTN+4jekYN4f8V+YmwgpbVbQPX13bOCTcnf6LqZTlFRqwwEYLnAu3jm4+PQ27xjD2vTd4eyfmAyoakOvJ3wh9fHspiPjrN335HojuU9dYQ0wanHdbqpbvbmwB0nf0jzslV56WiNlOPNBk3EzUKL32NhfQmjs7GQlnPLvj1bA7i039i2vQsLMgYm8uohFY2PEjPVbtJSO4/VgYXd0mHjw6fvdFae0ex+frBPWrhkw1oSV74K+GBNoPpU+WZeAizvXkZ3NFyDRGltRkA63Od+PzebJJF6hYM8cHAUttIkNTLJWor0SpzHmWS719ew4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 06:17:30 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133%6]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 06:17:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Thread-Topic: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Thread-Index: AQHYGBFjkzht//tf006vXTl+IOhLcKyANJuAgAAJCYCAAAcSAIAAJjQAgCBeB4A=
Date: Wed, 23 Feb 2022 06:17:29 +0000
Message-ID: <MWHPR11MB17412030E65D4E4821549E24E33C9@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com> <87y22ts948.fsf@intel.com>
 <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
 <87sft1s1m5.fsf@intel.com>
In-Reply-To: <87sft1s1m5.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf40c5cd-82bb-4ccf-ba8a-08d9f6942bbb
x-ms-traffictypediagnostic: BN9PR11MB5273:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB52731D79A3047608BCC56708E33C9@BN9PR11MB5273.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qum6hvuOaYWNDluQWX66gCGIYTRHTLZY+8AJ7dDICwuP5GVSA7uu9pHMn7AGMe54X1JtAm+YubrucNmBi06cN+0dMKhx4BjrVbYCyduEVdqdygspwFeETWze6Vc/s6ek0ZXeBRcfTE8VmKtgPTAhfUaoWCUvSwXTGqfZbjzfGxt+WfI1F9vrK2sv3RGp0OEckOS1YSlpsx4JfmSOFkX/PedAll1d9MEoCbxfiBMRU4ep3Oou7DsLonodHUxifLslBm304ST/ufZnyMF8Q249grJeOTNXctUO//KBF8xmshdkPWe3Ec1l5JFCHalpqBI7y+QK9/o3J1IbYbedGuweYU6iHaMrMbpO0uGWpjy3dCPVDVKEefTdpqHDJpXLs+c5HrP3mdCHWi6mzQ4nTqN7M4I4yaaUBu2OUqGAcI0/W7puE6cfsXZGFAWmJK1kFDsXC0xhiJIKeApzFdeVw048lD++OUQGTHxAD4ESBYaw4CL7nXvicLoQn1uLB3nIT8/FSgGbFI/iLoOHot7KB+9KZXxprsFQmcVPQWnynXl/Wf7ranwWc0ySS8Dkt2V6UmvlHFEgLTy+1KKL3ZnZNola3QbcrSzfNsSvCvWQLRAZI7fY2SJt8AwchsC/R6Oj/5qIUXHZea+R1+c9BY1Rh4bC8NJ5skekqUk5QsS5RzdQq+sv7asv77wz7Axc1yuRqRoaD4XY5EcPIMUFu2C9h0X8sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4744005)(82960400001)(38100700002)(2906002)(122000001)(38070700005)(5660300002)(8936002)(52536014)(55236004)(83380400001)(7696005)(6506007)(4326008)(64756008)(508600001)(66556008)(66946007)(66476007)(8676002)(76116006)(966005)(66446008)(54906003)(26005)(71200400001)(33656002)(110136005)(186003)(9686003)(55016003)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qWheQcLA4TK0SQLrYxvhDlsUmlHxsRtdbqBaVetMvcj8BZAfEWLct7ixsw4F?=
 =?us-ascii?Q?vv7sl9a2ncG1bw+JP6HWpLMjyCj0ryR6/EtE/dVeNsXOzhLTuVmZUu3joswO?=
 =?us-ascii?Q?jgKxXf5eSKxYhWA3jKw7TMG1e0LQQMBZg5gn77gV3LScKzMRjWDzZps1MsnO?=
 =?us-ascii?Q?cn4e2TuCT+CJt2grwTZHY7wWNHbYUWwhLZw+CX9Bmv5YJ0tgoFlPPOOcrBrv?=
 =?us-ascii?Q?+w4liWWpYy222U24bXKOkaZ17/gfxRNmFKcZX7nHuq21A118Iik/cjy9MkDs?=
 =?us-ascii?Q?CkBIBlzyfEYs6vDTPUPwyOwl/7D2T84NkgEccN40FEV1kH6wHD98BDsXCL/H?=
 =?us-ascii?Q?BmSq2DLcjqLu2HSqyNtL/+XdfcXE+q/9OHhzlDv4cwQhmZ7O+k+xTGtW9AMv?=
 =?us-ascii?Q?dD/T/w6Ty8uUgExNVaTQw7b4OUcLLis/E7i8CACiYPTb0//k4MEx8MP9VsaT?=
 =?us-ascii?Q?ghirA+INROjQ4PLBfO8OKjP3mhk3Oiyi/KzSPYNuhdMbTGGXhsHZtpARXGVR?=
 =?us-ascii?Q?8Wb81OTblEkVTUorQoJDf3zoi/fjVgjLmjzEk63PnJYnWo9NQhDWawm6XCLC?=
 =?us-ascii?Q?EtNJxq3e1WWZBYQ+jheBGqRUDifA97STod58Ndhx9s2U4RuqHUCwvdfAjCRd?=
 =?us-ascii?Q?QYK8z9L0+ZJ2QcIwSEcCh/GBSpQZDRYSQsMvaWdN6s5APrvQk82l05EKZDxv?=
 =?us-ascii?Q?O0hQ9FhRuuazIJ6t5QyZlSAzi+FI5R+eQ5/WcjFS35f6Qm+jMZufDlVLjV8c?=
 =?us-ascii?Q?K+kvTyl3MFcnaJzEbWQpqeEhNSO69esxV1Juabvc5ooxcDpNHH2WfspuD38v?=
 =?us-ascii?Q?d+/PikbwbMR5ZBzc7AKN31H50V1DAha9JSxtcQm9s8fF4zqOzpJVGztLm2ij?=
 =?us-ascii?Q?mA8JhfRxMTmDTrvsroV7SrkKuD8Kkk4caSTck1d7soDyDzL/OWepQmfGPSGN?=
 =?us-ascii?Q?YAfs/Qvif2i57cU0ApBN4QLyFnd1ZbfNRlihPOQrT0JAyd3e/lZSbLU2osYm?=
 =?us-ascii?Q?vFvFhtjwOguarXnD/ZzY+vKqhCR5G43du+KtmI2svkvXF0kLtp4QHaYbVcw/?=
 =?us-ascii?Q?KIWMJ+H2B6RrXx2S5z05NFTBTT/IPgMxS9tjI6PTtoIp3FwpQ9lkjp/wjkCd?=
 =?us-ascii?Q?np9mmZhqiJFIC79foPq2bvlMb/xRfJvTYPfYpLG67EzxUsp8bDYOLqTaGJY8?=
 =?us-ascii?Q?8dQUGNglPTSX8Fn9qKhLGfvwpD8VY01ZkhIFjDOG8HTBdndi9JaM+jlXdyAN?=
 =?us-ascii?Q?NcrvZI3rJoTTJPfmZVU8617lgQ5O7HdQGCKpCT5nui0CDwkNvrvTNO3RsdC2?=
 =?us-ascii?Q?gOxF8wXDicsZ3OoqQEAyHrpnLMOwZpeXCvoCzbbGu6i1felvJw/uAtHfj114?=
 =?us-ascii?Q?uN4fWXyqivmvWh6l3rXlocxKtX2xWGmYYBntfIm9dvLQb2tW30i89Pr1ItXM?=
 =?us-ascii?Q?y5+QoyHsPhQAWMmR3jVywVwNNYRoyaKNCr5v7huoWXJ9i2gHwV++/4tA3mWG?=
 =?us-ascii?Q?dfN8y4MmMkhdxemTl7+0lwd6/jsoxxVGOYcdxXYqQKtGKJLgyjCIVeHj4sgR?=
 =?us-ascii?Q?vx543ehK4BVN8ruXsOgpAaqyEbPppCWnTqrkYZlJsP7mKqndwP4p+0GMrrkp?=
 =?us-ascii?Q?tOtYlihVIoXqoyc/GSdu7nk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf40c5cd-82bb-4ccf-ba8a-08d9f6942bbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 06:17:29.7858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vruCY/zNryzLLc+25O+Os+AoSPnat37ar2rGYw6CEapK+kCpwWomzHY2VQnSvDnmM5gzeXxSYPoEzOh9ojeeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
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
Cc: "carsten.haitzler@arm.com" <carsten.haitzler@arm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

> The connector/encoder funcs you do have to pass to
> drm_writeback_connector_init() can't use any of the shared driver
> infrastructure that assume a certain inheritance.
>=20
> See also my reply to Laurent [1].
>=20
> > It well might be that we all misunderstand your design. Do you have a
> > complete intel drm_writeback implementation based on this patchset? It
> > would be easier to judge if the approach is correct seeing your
> > target.
>=20
> That would be up to Suraj Kandpal.
I have floated the intel drm_writeback implementation.
Please refer to [1] to get a better understanding of how we are implementin=
g
writeback functionality.

[1] https://patchwork.freedesktop.org/series/100617/

Thanks,
Suraj Kandpal=20
