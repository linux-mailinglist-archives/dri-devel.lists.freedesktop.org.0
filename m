Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFB867803
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED8D10F215;
	Mon, 26 Feb 2024 14:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/khGjHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD61A10F215;
 Mon, 26 Feb 2024 14:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708956977; x=1740492977;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2yq2RYMYxXUMlJdS7At8EPEeJ7DrxfcPPAwWnY0ZLXo=;
 b=K/khGjHaklLlXLewn7iaaxS6MrOWYfASE3NCyYpvc3RtPf4h+pivfkzM
 NcioH1QMlVj9SgqFGzOwJ5KbkNzlUQXYMyLox8QN3hC72lTHvHbLXmdi/
 OIAcdT+NaZlRNUKcDybsOtMwvrrk8LcnrQqXgGua1JUVLfWBVhm95IvPa
 H+U0wW5Jf7QZjixVWsnQfLXTU2b/RZBZP5HtdN5alDXq8qzO8jEqK25tg
 L3OSuiEwaqTRIWEO2UsN4NggFbTw79wPJQagXrEmh9cEgwdV1WEooDt0Z
 E7PQdv9BByYXluoneFZjGPk5FXAzu6dqXx6rZRQgqYGxWxfoZdjSmtLxs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14677599"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14677599"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 06:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7029672"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 06:16:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 06:16:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 06:16:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 06:16:14 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 06:16:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzyXs4/PNEzTqLBOKm4ie3ALlzyrxbxTd6Pyq2C8tINCiBNrOEyUFbh/Y0hKVKRl9DaQmm1HxQVryBuoh2EZo/HySO2SaL0cF7NsnfaORU94dGSyyE/Eo0lJGSbH/6rc5AI93U7ClCj2H628ynHv86/BGFX++sOCiKefx/Xyvg910sDlsMq/Cw9tjCC2lvcphRXTWLNG+fQGBHOgKtp5wrPy3HnQI5qDAPxIPKLeOw/IFNo/XbZKtGqJwVNsg/QuxNupO28pd6qYUOYiyHgNihT3zhS3xubj4+bJGpHDbOS6B8Ej4Lz1gkhrIoqrMl1psNCo4qOTts/A8lmKLKT5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yq2RYMYxXUMlJdS7At8EPEeJ7DrxfcPPAwWnY0ZLXo=;
 b=c/ARTliFvaNQPdHMCfOnc4m5Qk1BSRjKULTqSpzFsvCGWDmctMaTLTOv33Tniqbeq3CGAeM9Me2D1TGns2mXsk3QwaaoC35DwwlKZS3eJS1QFvNt0h+QsqIRQwlwpDTALWJPQyMC35/okTzPX/CSVT2e2byCH/rbl3Zcmz9u9NcX22I01PW6QS9lBSKThnorThqAnCsNkV5OiD6vKpnBUwXKYIgFldpVfK2u1nMPQiOFuskiHEWym8Q3GknTUSa9Kwq4uIX7WhzII138ZRFxRNuHPmbxwzBIRxtoOb/BONNUl9FPEO+u6DuQtoswPU80y53ClvRLOb6hQ6zvth4kbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Mon, 26 Feb
 2024 14:16:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 14:16:12 +0000
Date: Mon, 26 Feb 2024 08:16:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniel Stone <daniel@fooishbar.org>
CC: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next
Message-ID: <ipfiqqxrvy3mkerqlqha4a67l7jxs3cldvl3lzankifs4wc3oj@rrotsh4iwru7>
References: <dbdkrwmcoqqlwftuc3olbauazc3pbamj26wa34puztowsnauoh@i3zms7ut4yuw>
 <CAPj87rO4K6QS8hVn-d6N8CEi+Uibmgo6mZ5bNGz2rZDUMshvxA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPj87rO4K6QS8hVn-d6N8CEi+Uibmgo6mZ5bNGz2rZDUMshvxA@mail.gmail.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9e0800-b413-40f2-8d51-08dc36d57c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2YUW8lXXBhZxjADOxAryqDUK7CrBaGy1NJWOF/8jo7EWBFr02+cDxhC4ZUgIHgIzZ8qtEMtx+Y7lHZsywR8J5DLHjQ8rxOV0nakNjg85VObNArMeKvwnygaaK3ktIKoNl95LWMoB8AME8VnJ3kL4Jte+BG64A2czwUbsVMyJAkJe4MlHqHNcXJt5NNTcSybeMi0Bzs1XIvsavsu4f/WyM1LmlALnuXLGMSRbNN4qvQ945kaS2mmVAxnFRt5o+zhJ8986lG3VDMxj8N/thKRjF/jLIDSoM8071RuipUyaiAJae2KgTTSTIAVtJ4aFOFGfIoTwB0K/oH1gAEAkHbfdcfwSvcfHsXj17CGA7SBuVmJHjf3JbxGEbIGvv96VPm8d2d14FWYTn7ldSv11JQ/hEM2QP9JHKmdT99M9dy93p7uOl6MnJaZxVfDDMFtGCzXH+oD4gAjKFD75vH/95Aat19ng+KmEhUbEiV5EDd0MWm/IXNW/iM4Hm0xrlsngbT5B8rylbnjwfxaEqZydkMUlRDshZN2s1QDiL5TDaFFhVwBNqWAyA3ATLV5qWKtCoXRLRhWQxZCBzmX1/8rVI4vk5LJoJ/eeKGD+KhMaxREpV8OgQPB+SKCg9wMnrZfsWtU+ep+6xeDwPI2nKRCpZr4Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y2QWkZm6Lwn1hrw1xL3dy+V5kG4sNKw09iuZW4nNKYVbVfZwGpKrNniWc6Cy?=
 =?us-ascii?Q?LcjDIyZdIIuPK7yuNhzQR0NU3WAeR19o2TXGLBdG3SfeV3Szepjet4E4wx1o?=
 =?us-ascii?Q?Hk1ODdlsS6abfPv88TGVfv6jEJwhKBoAL1YGirFPpGtJ0zh5BcnNjBV5J7ny?=
 =?us-ascii?Q?S6NzJVKX6w/PjEe200TBApBYQvBUX7TjZC7yvFTeItGDctKqjzGvNEtll8RK?=
 =?us-ascii?Q?iUv7bHVcnkOZMzbWlwbmV4dAM3HPJ42mSGT5bEeUxvWs0vt9DFj7ijhbUCHW?=
 =?us-ascii?Q?y0r6bdvoznGc/TCwCNDCjVlJpcvC0rpwxcAcMOHeQOnYU1C8Vm5JQmDhx1CZ?=
 =?us-ascii?Q?DR1Ss8j3YsaY6RvgcdJzVeWmvc1UiRXTUgiRt95t9Gkqj2AwERrZpy+13A2A?=
 =?us-ascii?Q?mBs8H5ZoaF4w3zwSIDs4RYHEq3zzH1srgvABihTo3KuMmC4Mqj/rJ9hUOiKC?=
 =?us-ascii?Q?oukmjEA3HJItMrpWju9j86F3ra5KUTFOGta0ju9ejCItrFlbb8UKUB8ko+ca?=
 =?us-ascii?Q?Ci+2qAujZGU3JqYdbnzOmiDzCpV4jBUtXltam9to7EfEvNv6sa0kyV9q7+js?=
 =?us-ascii?Q?fL6cvmk9wUa/8V4PZxVLMSXX7gw944ir7GP0aawIrOLczKxNeuu7nE0ndsPC?=
 =?us-ascii?Q?4YIE7x49s7JwCRM3Hw8pjijRUREYslQK2YOkmXOY3lSmRIszvDCv8fsbj+x5?=
 =?us-ascii?Q?9EY0ibwIRYf5Q0jBHEhBLP2TFTR3vrLUVBAkjvczo0Dc7sjIByvtRSqMtzuB?=
 =?us-ascii?Q?0DDCotDWhGrHElxf2fmVVlZa22p8rKbENjui3T9ewkt6DxH1MG3cNAxH9uD/?=
 =?us-ascii?Q?jsV8a6uKObj88GNozPuuDHrkTDZ2q4mUvaLhSdKJVMY8JInLfdZEMXBJ3Dzo?=
 =?us-ascii?Q?IX1xBixMCTfigregtuFYj1pK8jHBPBGQo2O9bKr/Ed5bTBQmlw1VdHbImPMd?=
 =?us-ascii?Q?wES8lqg46rsZTTxBjun3Mfgv3Sej7RSGD3fgoRGPv/YqseJv6N3d1cUMgQal?=
 =?us-ascii?Q?jvBV5BTTim8rEdQhxRPIDNqGlXE/lg8EwkMg+lk/LVWQvr4SnSeWQG6g8M1P?=
 =?us-ascii?Q?WFSvvblpICWqCALuDWsMHh559eJ3+GIF2cYadcAEjZL1qA/JfG9JFG3vbmeR?=
 =?us-ascii?Q?vClaqyx48GCgiACkFGK9BQY+tnXkqm/2eunidy2IZS0rINeU7T4/nmLU2KV9?=
 =?us-ascii?Q?p1SzjO0JjXfujdomG/QWxl4MAGDbxrHLftiueTUBvpo+2jJLOakf1Q+3agKh?=
 =?us-ascii?Q?S5aRq6j30jaXGaXQT2JLsIYDGQxZFkb9q/GEivlARP1ly3g+txaP08u+hEqW?=
 =?us-ascii?Q?PzFt27vI+3wSG1N9j1hdZf0jiv9oJKb2GmgfqZGDkPaiyVL/R45FGKLNkM53?=
 =?us-ascii?Q?+dT00772jcUxPEvRAXmnDKuu9Fkc1ly08mXmJyeAIuD4RJHk4wOfW3k5lPJH?=
 =?us-ascii?Q?SHyeegLgoc9/Ttnyj6lTwtzyKs5H3kVYgcrrLCzJaOTv8drwZnJHFVI1WMho?=
 =?us-ascii?Q?zMtWYrQmaMA8S66Uoj3bgBHoO43FOKP+53M631b9yKEZCuidNEcw3vxEQjR4?=
 =?us-ascii?Q?WUKbrtQ/rODxiJ13cCmlGux798xaKhD9PwCqTrcXrCm6UwxgCxQwLKBPseY0?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9e0800-b413-40f2-8d51-08dc36d57c25
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:16:12.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJ62oFoD+U6lL0ZeLJDKwEoPbj+rb6O/ptg+BMAyJ/K7U6DT9xfslflZw519wfFObyholZsFlOR5f7huAsLzPxh3n9ZRCktuJ/n+6/lW2pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
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

On Mon, Feb 26, 2024 at 10:46:43AM +0000, Daniel Stone wrote:
>Hi,
>
>On Mon, 26 Feb 2024 at 03:21, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> All of this should be fixed by now: dim is used for applying and pushing
>> patches, which has additional checks so that doesn't happen again. Still
>> pending confirmation from Daniel Stone if the git server hooks are ready
>> in gitlab so we properly forbid pushes without dim, like we do with the
>> git.fd.o infra.
>
>Yeah, I did that last week.

thanks!

Lucas De Marchi

>
>Cheers,
>Daniel
