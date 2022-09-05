Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702645AD37B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E4810E1BC;
	Mon,  5 Sep 2022 13:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7190810E35C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662383497; x=1693919497;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/MW5cC/oaREKtyEb/5pigTIwse9ryqfv+whVCYm8G0Y=;
 b=cS5S8VgCuXLDq0MGmhEOenU6wTvk/WbbxnabV/jv2kh46bH0xYL4CVu6
 nXhaxZCR9u6Sy0Kk7f2t/I6zUAG0NLpY8CvPBUszCGBGMsvYug5PakZEE
 PmaMU8zLxHDEwqLYWdKTdBygzinavSzVnJMK+Chq+nxkeWK5noFXs7cGJ
 zMmM8jSZU3693hfPN215Tw+unZMcxh92+RkdiuXbjcrfoXmO6owIwRFu+
 i42QMgwN4lkcN9Op3QkqskPUdVRG+NyhAAssfwmXH0rebdeObycsbUvK9
 fGHmsEz5fHBoFMzsT9xk8ZoWO8g/HAlW+nPh/SSKaBG2OvA2+XRbkZw8q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="297174942"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="297174942"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 06:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="942106425"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2022 06:11:36 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 06:11:35 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 06:11:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 5 Sep 2022 06:11:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 5 Sep 2022 06:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7wSWi2SDZaZCEzg6PKRFLTFhDnij21Kf4V5EQDukriYw9gQHb5I/Nhc5hmaUxHcXBZJybXufmr9lb3a1aD/g+bUoYolnhF+uO3s16UBk3IWOiHqQ7cLC3345GVgfGmvHXD1XyZ4fneYeOpYMMMdqbgY8RJ3BmH8w824x1PIoVVmeycoyNthF7vdtbb/BVcaSe4Szf6LhxJCcwy+YuGr9MFQQeyKAD1XSBN3BWbVBTYYyYwkkKYm2nUaTdUYAIomkrxFdHmScMch7B3WIVKRlz5U2Vp7UdF159Nj/SkSkQjm8kzeRiBrzvMIE5C5FMZFNKjwrQDb1MzRjjWyqgOzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC3/qo19wQp1A3s7V8XFMLETYsnq7wu0mq0KsyDr0aE=;
 b=QVBdiJvu8p3kQr2g0uTFHqMAJPx/x8mZ8/1kZOvooih6vERBGWuufmCFDxkuTv0ChBjrPyyWAv4fpdsbkrazilsvgGTC4Bl6ZHQXMXwzWPiy+MBPpNMhcFUPkw80WSySPEdpXLCNJ2Ma1cF5iqKEyqsPY7X/A/PDSp8UEQDSe6EZwehnCnViYMYAinhNRIwwQH/8JxlUZkYMLY+izd48xU50PdCdpaDmgZn4MrA/Yu5M3PD9rZICeWsscWwS5kEU+EpCshQegxmYPHTPuhv8tL1dkUqziDEfGXSxW3ur8c6L1sp/+WRcPYsUMUDxz+uVyKcf0yHbB0UE4P46FJ1C6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 13:11:33 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 13:11:33 +0000
Date: Mon, 5 Sep 2022 15:11:25 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
Message-ID: <20220905131125.bbqxihhipc37oshq@nostramo>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
 <87h71qfbi9.fsf@intel.com> <20220902123400.5ljgc7z6zw34d64m@houat>
 <87mtbidj3b.fsf@intel.com>
 <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
 <20220905121000.m2xppgjlfjlmppfr@houat>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905121000.m2xppgjlfjlmppfr@houat>
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a5a8e1f-0869-4c57-af4b-08da8f40278b
X-MS-TrafficTypeDiagnostic: MW4PR11MB7102:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tgw4Y2RubTLnGvc8C0DYXnp3W7T5X3pfVnhDtd31mErhAzkSKBMJnWSSOEElEL3k4n8rKMFFbvKWPim1wNKV2AYDhnhWp8aQdHE3qhkdVzd09ZA7TOD2DQ+5baRTKMlcAiK0j38dhQlvBRJYEfCkixfBTkQelCqQEP7qQehnacei6Jjp9pMMXdxXzuYE/LRaNa3yUr7vmWODqYlW5RTOd1mbcUXldnPS5U6qw8LRIclirZeGz0wr/88z+7AfIXPfyNovLCXtg31NcrXwhxkzKVKFJ8TwYHcJplDnqxa5f+fB2jXH4HjeTzDZ7i+u/gs+iA8UX1k579mNMOlHsvdZJCKoXByNFZzO5Ny8Q91tHvIEr+0KK6q5R6obPfNoVUzHhS7Uj7kU1siTqvGgApNml+1mb2P8Dl5ouJGyDcy/F1L9J4cF9t7au8JsUAiU/o7jQIV1TFZdtaFSuzTcGZ82SZkSGqkh6i1dij98pchFze/Fdg42LvNk3V3xsr/P+tbTtffdyLjeMSLA4xNi99bI1Mx16KI8DjXP6/PxV5g6hpn+sPxuP4mJyoseQN83JybYuim5u6b3RNhchdlCREjewFbCQmhFniPelq7ozTsvghyO6yzHWXbjxDlHh8PbULrHrCzr4X+BSQMK0SfR/MXeXwGMhxcSU0BSxBGR3qrN8GpyfYj/KN1alhu8m43wC/p/IY4n6BpMDF530DwjXYGMJWMLE0285lL5hHP6mIhsroEV92baxkAv1Qy4ZRkatvFNc5pz9EuolwMcXYJywKfx3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(376002)(366004)(346002)(396003)(136003)(8676002)(66556008)(6486002)(5660300002)(33716001)(7416002)(8936002)(54906003)(316002)(6916009)(966005)(66476007)(478600001)(2906002)(66946007)(4326008)(6506007)(6512007)(186003)(26005)(1076003)(53546011)(66574015)(41300700001)(6666004)(86362001)(83380400001)(9686003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FjbGNSdllxTWFCZkNGK3ByUmMrd1pkUzU4aXhPclZxT2txWUpRQVM3VmNi?=
 =?utf-8?B?V2ZmZ0RyS3hkMzV5dzZNYzdSMmNHNDF5NE9TZE1qSXNHd2dHYVBmMDNXZGwy?=
 =?utf-8?B?T1ZwUVpvR3RCSFB1UTVlU1hEdU9qeUU1Tm96RWlHTGY5Q2NUNVlWTUFveWtT?=
 =?utf-8?B?TW55M3FYRCt6aWM1UG12cnBWaHlrSDNxSXhIUGZ6QXhwcHg1Qm43QWVoZGh6?=
 =?utf-8?B?SGg3dnBreTIzNUphckEvdU1JN0pSM0xwNkJoV0xTa201ZndBMVRteE1VUXNX?=
 =?utf-8?B?MW02WEhSRG9rTVBraGtYVy9tVWN6eWxHSmIrUmplOCt1b0FlUVF2bDFjanVn?=
 =?utf-8?B?Nm1iUU15cHFwQVNHMWZCZ0luWklnUTB2SERLdzJDNHptcnhpU2t5VmtxTGph?=
 =?utf-8?B?TWxuUGlza3FSSE54ZVp6T2pIU1FWRCtGL0FjNkZNNk9iT2o3Yk9QYmNCU25n?=
 =?utf-8?B?b2g4TENKUXZ3L2NoUkdwQ3Fpc2M1WHdVLzNiTlZKU3NsdDRHa1RPRFU4MFkr?=
 =?utf-8?B?aHB1Wnh3MVFXMHpSN0ptUXZGMzZjbmtRQW04YkU2eS9vVFgvcVZRL2Q1bVVh?=
 =?utf-8?B?MDFJOThuZ0lneDFySkZuUXhvbWRZQkNZODVDZ2JsdEVmU0RCUGhGdWpsMEli?=
 =?utf-8?B?MUlhUHJjODgva0lTME5BemorYXdnY2ZNQVdGdU8yOVZ1dUVIRXZFS29NeEpM?=
 =?utf-8?B?RkdZZ0ljRjY5Y1dhTjlsWlJjdVo5bEdpb3h5ZVZYVlFKVTgvemFBalp1cXBV?=
 =?utf-8?B?eFBsdWxOcG05OVpHSjRGN00vRWI5S1BiSjBWZmJHcFJTa0h5S1NZRHNzdG51?=
 =?utf-8?B?dkJrUVdMNk1rUXNYNUV6RmJ2cHBnVjhXdTV3UFpuSDZiSjRaYVd4OWdYOGNw?=
 =?utf-8?B?UmJ6clIyd09ySmRqYVJtd3RZY0ZSYTg3TE9BY0Y2UlU4dFFqRjBKck9hZUhK?=
 =?utf-8?B?VGIzS3U0Wm9kbFkzampQT3RKOVVrOTNORkJGYWQzNk85QitXZmkzN0lGWTN4?=
 =?utf-8?B?VnorQ2p3QmlkNGxUT3J5ZGxoWXAvRG1nWCtqRkFPNzlwcEljQlVBRENWQVo1?=
 =?utf-8?B?Mlc1T0FMVWRQLzhPamQ0enpDelEvRFlJbXJ3OEdSaVd2SElFdWVRV0VOM0Vo?=
 =?utf-8?B?UjBFbFQ1eHJxWlpHZXJhUWxiM2ovWFBibG9kRm05RlFnWmhlUzIxdldWS1Ez?=
 =?utf-8?B?TUJiVXRxSnB4b01wTjB4d01PNDNVcDBvYU9UcGtzY1prd3VtYk9vekZ3cklq?=
 =?utf-8?B?TXFjZm02VFJhZkpSZ1pIbjNJcFNRTmI0T25aSk16TnNnTC8wR3dBL2Fvc2NE?=
 =?utf-8?B?ZVJ1TUhvbE9ad2t0MlJlSnRxSXc3L0FjbGViMU1rNnE4WldrMmdodkI5Q3Zu?=
 =?utf-8?B?VmthTnVVdW1Ta2syU3ZEWGxXU24vejJGL0gvd0tRY1pVT004SC9vZ0VvUEd4?=
 =?utf-8?B?MHlJNGVIWVBvaHNmQVhyaTYyYXlITmpSM3B3Tmh3cFp5MjZ0NWpydE1yeXNh?=
 =?utf-8?B?ZDB2SlVjMll2dHgrclFhOHdSNWJoTVFyNTZPMEgyckxEbWxmZHRhNVF5Rklx?=
 =?utf-8?B?bERYbjFGekRtS1UwaHdBODdBRVhXWC9zTUVLSXc2bCtuTDUrbXFVaUR1bnY2?=
 =?utf-8?B?Yk1Zei9ieU1tRHRmZUtSQzgzM3JadlhKSFpraXdKcjFLN3VzMXpyRjlqQUJ4?=
 =?utf-8?B?T0o4L1NrUmFWWGdBTHpjR2pTbEZhakJSMUZNdHlPNXQyVzZDWjFYanl5aytS?=
 =?utf-8?B?UzZQNVdGQlZFK2Z2dytocVhidVR4Zmt2V1Jmd1pzL1hJOFZESEtiYndidUYy?=
 =?utf-8?B?UTFBU2QzQkNGdlhQM2lkVXVjcEVId090clhXSHF6WTNLWWlweGhFVVlWVTNm?=
 =?utf-8?B?SkpiTU56QjZIN1oxSlVKM0l6Z2hodVNmUHhsZUYyb0RrYkN5UHBUR1pSWGNZ?=
 =?utf-8?B?ME9Mek5zMllza0VSckFiM01VcTYyM1dRR1J1UGk3YVZiM252bTlPaHBPNEU2?=
 =?utf-8?B?V0FRb3JNRDRlL3NnMTZXRnNnTllHcWhPSFpBeGNOdytCS1Nwb0llVmZZMHBv?=
 =?utf-8?B?UTdjRjRKM1RBVmtib0g2Z0RxUnJtRzNHUTdqazVWcWVpVXBWS3o1b1NpZmlj?=
 =?utf-8?B?QzdHMW8zSlN6QU56QUwrakZVWVNtcmdMSVhJajRJb1Vydm1OaXJ3aXZaK2dR?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5a8e1f-0869-4c57-af4b-08da8f40278b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:11:33.2365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8XSXX3JOAlgIFHyYg0DkCjhPqFQAWpTS1102AXkI+K2nbV4coDYxIgnjpbzoHJmdom4GBToMc9dafNTP4k/DdDnnvfx5OaJ1nle8PrZkfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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
Cc: David Gow <davidgow@google.com>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 tales.aparecida@gmail.com, Arthur Grillo <arthur.grillo@usp.br>,
 brendanhiggins@google.com, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, mwen@igalia.com,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 02:10:00PM +0200, Maxime Ripard wrote:
> On Fri, Sep 02, 2022 at 03:38:28PM +0200, Michał Winiarski wrote:
> > On Fri, Sep 02, 2022 at 04:03:20PM +0300, Jani Nikula wrote:
> > > On Fri, 02 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > On Fri, Sep 02, 2022 at 11:04:14AM +0300, Jani Nikula wrote:
> > > >> On Thu, 01 Sep 2022, Maíra Canal <mairacanal@riseup.net> wrote:
> > > >> > Hi Maxime,
> > > >> >
> > > >> > On 9/1/22 09:55, Maxime Ripard wrote:
> > > >> >> Hi,
> > > >> >> 
> > > >> >> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Maíra Canal wrote:
> > > >> >>> With the introduction of KUnit, IGT is no longer the only option to run
> > > >> >>> the DRM unit tests, as the tests can be run through kunit-tool or on
> > > >> >>> real hardware with CONFIG_KUNIT.
> > > >> >>>
> > > >> >>> Therefore, remove the "igt_" prefix from the tests and replace it with
> > > >> >>> the "test_drm_" prefix, making the tests' names independent from the tool
> > > >> >>> used.
> > > >> >>>
> > > >> >>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> > > >> >>>
> > > >> >>> ---
> > > >> >>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mairacanal@riseup.net/
> > > >> >>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusing (Jani Nikula).
> > > >> >> 
> > > >> >> I appreciate it's a bit of a bikeshed but I disagree with this. The
> > > >> >> majority of the kunit tests already out there start with the framework
> > > >> >> name, including *all* the examples in the kunit doc. Plus, it's fairly
> > > >> >> obvious that it's a test, kunit is only about running tests in the first
> > > >> >> place.
> > > >> >
> > > >> > Would it be better to keep it as "drm_"?
> > > >> 
> > > >> That's not "keeping". That's renaming igt to drm.
> > > >
> > > > Well, there's like half the tests that are prefixed with drm, the other
> > > > with igt, so it's both really
> > > >
> > > >> > Currently, I don't think it is appropriate to hold the "igt_" prefix, as
> > > >> > the tests are not IGT exclusive, but I don't have a strong opinion on
> > > >> > using the "drm_" or the "test_drm" prefixes.
> > > >> 
> > > >> I repeat my stance that "drm_" alone is confusing.
> > > >
> > > > What are you confusing it with?
> > > >
> > > >> For the reason alone that it pollutes the code tagging tools, mixing
> > > >> actual drm_ types and functions with unit test functions.
> > > >
> > > > I don't get it, I'm sorry. All these functions are static and not part
> > > > of any API, so I can't see how it would pollute a code tagging tool. Or
> > > > at least, not more than any driver does.
> > > >
> > > > And we're part of a larger project here, it's about consistency with the
> > > > rest of the ecosystem.
> > > 
> > > Okay, so I'm just going to explain what I mean, but say "whatever" right
> > > after and move on.
> > > 
> > > For example, drm_buddy_test.c includes drm_buddy.h so with the igt_ ->
> > > drm_ rename none of the test functions may clash with the drm_buddy_
> > > prefixed existing functions. Ditto for all tests similarly.
> > > 
> > > For example drm_buddy_alloc_range() as a name sounds like something that
> > > allocs a range, not something that tests range allocation. On the other
> > > hand, you have drm_buddy_alloc_blocks() which is actually a real
> > > drm_buddy function, not a test. What would you call a test that tests
> > > that? Here, we end up with names that are all prefixed drm_buddy and you
> > > won't know what's the actual function and what's the test unless you
> > > look it up.
> > > 
> > > I use code tagging that I can use for finding and completing
> > > e.g. functions. Currently I have the following completions, for
> > > igt_buddy_ and drm_buddy_, respectively:
> > > 
> > > Possible completions are:
> > > igt_buddy_alloc_limit 	igt_buddy_alloc_optimistic 	igt_buddy_alloc_pathological
> > > igt_buddy_alloc_pessimistic 	igt_buddy_alloc_range 	igt_buddy_alloc_smoke
> > > 
> > > Possible completions are:
> > > drm_buddy_alloc_blocks 	drm_buddy_block 	drm_buddy_block_is_allocated 	drm_buddy_block_is_free
> > > drm_buddy_block_is_split 	drm_buddy_block_offset 	drm_buddy_block_order 	drm_buddy_block_print
> > > drm_buddy_block_size 	drm_buddy_block_state 	drm_buddy_block_trim 	drm_buddy_fini
> > > drm_buddy_free_block 	drm_buddy_free_list 	drm_buddy_init 	drm_buddy_init_test
> > > drm_buddy_module_exit 	drm_buddy_module_init 	drm_buddy_print
> > > 
> > > With the patch at hand, they'll all be lumped under drm_buddy_
> > > completions, and some of them will be actual drm buddy functions and
> > > some not.
> > > 
> > > I just find it a very odd convention to name the tests in a way that's
> > > indistinguishable from the real things. Even *within* drm_buddy_test.c
> > > where you read the test code. Because currently you do have calls to
> > > igt_buddy_ prefixed functions from other igt_buddy_ prefixed functions,
> > > along with the drm_buddy_ prefixed calls. I think it's just going to be
> > > a mess.
> > > 
> > > /rant
> > > 
> > > Whatever. Moving on.
> > 
> > KUnit docs [1] state:
> > https://docs.kernel.org/dev-tools/kunit/style.html#test-cases
> > "As tests are themselves functions, their names cannot conflict with other
> > C identifiers in the kernel. This may require some creative naming."
> > And give examples of names. But this should be local to individual test suite -
> > as long as the test is readable, and the name describes what it is testing, we
> > should be fine. We don't even need to pass drm_* prefix, as this convention is
> > expected for test suites, not test cases [2].
> > 
> > Having said that - I do believe that igt_* prefix don't belong here (which is
> > why I'm progressively trying to get rid of in the patches that refactor some of
> > the tests).
> > I agree with Jani - can we take it on a case-by-case basis?
> > If the test name is too similar to the function that it is testing, we could go
> > with one of the following (taking igt_buddy_alloc_limit as example):
> > drm_buddy_test_alloc_limit
> > test_drm_buddy_alloc_limit
> > buddy_test_alloc_limit
> > test_buddy_alloc_limit
> 
> We also have drm_test_buddy_alloc_limit, or drm_buddy_test_alloc_limit
> 
> Both would be fine for me, with a small preference for the former, which
> should also address Jani's concerns?
> 
> > And either of those is fine in my opinion (I'd personally go with
> > test_buddy_alloc_limit in this case).
> > We don't really need a DRM-wide (or worse, kernel wide) convention for test case
> > names (it's only really needed for test suites).
> 
> Sure we do. kunit.py can take some filters too. Being able to only run
> DRM tests with a single filter is super convenient, and if we fail to
> provide a consistent naming we're pretty much sure people running the
> tests are going to miss some.

We have "test suite" - and we do have a naming convention for that.
Filter glob takes test_suite.test_name.

Let's use specific examples.

Starting with igt_buddy_alloc_limit, "full" test name is
"drm_buddy.igt_buddy_alloc_limit" - the way to run this single test would be:
./kunit.py run 'drm_buddy.igt_buddy_alloc_limit'

Say we want to run all drm_buddy tests, we can do it with:
./kunit.py run 'drm_buddy.*'

We can also run all DRM tests:
./kunit.py run 'drm*'

What you're arguing, is that we need to rename all test cases to have drm_test
prefix, so the full testname for igt_buddy_alloc_limit becomes
drm_buddy.drm_test_buddy_alloc_limit, because we want to be able to use this
specific glob for matching by test case names (not test suites):
./kunit.py run '*.drm*'

Why? We can already do that with 'drm*', that's what the test suites are for,
and the glob is simpler and more intuitive IMO.

-Michał

> 
> Maxime
