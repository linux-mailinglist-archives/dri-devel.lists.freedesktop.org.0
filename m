Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82228A2F862
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265B810E604;
	Mon, 10 Feb 2025 19:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBsTcx73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AC010E382;
 Mon, 10 Feb 2025 19:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739214966; x=1770750966;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ig6lBG89EQzWPSIqPn9P17LrfphOK6vGzIRw/D91nVE=;
 b=BBsTcx73v6qCScVTE9oqzIOZIczOMGt2Zx1Q0JvMMvF4q6dL1q6aZpgb
 kIw0farOHkR5zH++JYhJiITPLU1qzBVamVuWWyNpqDFY6pxYFpwzfxlcy
 zjeIc3uN7+n0px+8cbing92oSpwucQW2eIqBaFmVWjyCy29JD7SdS8a0b
 fY38EgW4Lc9yXL1LHBZe7cDQCe1jkJ2hC7FnSzmbVfeb/NbnrbxpuQlPL
 PSKs1dwX5qjrNlDEae3CW0NIjJrke+kCaP+X6wmpagCLV0xBH7So05Txd
 CesQoMVslY7u3I7HHCk+nioLB8fXnoQ5RL5JEbGlV8IutvUYkVWLfx7rn A==;
X-CSE-ConnectionGUID: P5fNY00lTvKkVPVqCGRy5g==
X-CSE-MsgGUID: Emtr2P2sTWqXW3MVgRoEdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39927402"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39927402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:16:06 -0800
X-CSE-ConnectionGUID: ihwKLbehThqr8lPPDOfUew==
X-CSE-MsgGUID: g0VfJgaGTKqmUxoiD6rLIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117300688"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:16:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:16:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:16:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtYe1xkgziJ6BE+QYSk/nIusWlcARHNGpfwbgbFeeshov53GD5KNMA1s3WCdgKWuS9KJeiwmASuZ2k3dhAbNjsZ25iMiiBPCrbWU7BUJw4blXCRgoe9Cl9WxiDiJKm5oFGjEN4mdoKGcyOo0ATb6jr6M0bIwPhcsWYJv5g2iC6t8BXK7j/w27pnUDvr+agL+X5fLNVhB3oyQWypn+jJ7q87F82Ci4YFJARepRlPqlXsbrYLW54K/kmdTDshDhS4JVRD+aMrVp8sXB7qSgqezDApIW8DMbl9z78FUW0Z9Ez8KM01Ukzd8DDXBF2jnSBmO5gzritYZ4i3CgtbKjhmaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTzI2wpPRqMl7fwU3vL3g1cTE3hivhd88kttw89LDEQ=;
 b=R2/yEqrA/3YVQ3FAmEcLPHDQ+MMlost8PSzeoHnLCHlvoeJtozUoalKsQyYeP5dsqlDLDwoerTX33wHGDUecLkV/rck9kIXK7DN8mrHFBeiUT0hpY6MSRE4zTN97zeVqkufHnCtdFKkhcMQVVDrH/lPR+FA9faSmtOwKBjc/A8Wb0GZHfT1aAhEXd14ieP2/Yc1lSxIKmgNoxv6YFO323uA9J02i0toeIxycqkrVISY7pkkXQ3t5tisYscHHjAzYrdA2GfPDWZjz/FpsO0DIOjO2quHA/R3FusucWo91Kr5HTg3vxQrYhdBKt9zPOapEdjRAKfmgPKQfoyo9U4dWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:15:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:15:56 +0000
Date: Mon, 10 Feb 2025 11:16:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 11/33] drm/xe: Nuke VM's mapping upon close
Message-ID: <Z6pQp/Dd+wGbV312@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-12-matthew.brost@intel.com>
 <65ff860787898466ff56215962d118494358088d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65ff860787898466ff56215962d118494358088d.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 538e4cd5-b677-459b-27ec-08dd4a075805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bri/pvWCS9ijDEBHK5VvCbygCaH1iRAm2cBjHAp67oWztw79PEXnBrqDRj?=
 =?iso-8859-1?Q?8FZvWGt2SusSK3w0514d7JHuPOu2A1HQ/wRoyYqp1Op25XKrSKeNwiaAwL?=
 =?iso-8859-1?Q?UQ5jrm0oteMZRJbrYKq+Ww5XDVxEv37RiTtQUs42pKd2N3YVNhP8YXlWqb?=
 =?iso-8859-1?Q?kj5uuJDkA+q51SZ6HdG3CUsjmVJTl5HQa6Z1aFPY6qjvx6y5N3iyq3YXP9?=
 =?iso-8859-1?Q?3lC/ZsiBQ9KqRiIwlUs2qvaUJATiu0NRR4NIFPHjrDJqgVztNYAm9Yl0pe?=
 =?iso-8859-1?Q?qgqUi/VgNMiVZpMz2+3Wkatz4w9TdmhPc4RurGvB5jsH25vAL89UCY7Dsh?=
 =?iso-8859-1?Q?QkvmGlw4zo32YHbAbbb3Tq4hSivqkt6xU9+2AwZ7QCxcreIdmD1Cn6WUR6?=
 =?iso-8859-1?Q?Xo0/q6cgPcV4eHA/i/Xa1e67R7I6tr1RuiKHrW8nKUivm3XPquqHIlIHJL?=
 =?iso-8859-1?Q?FXw6d+r3xRfVIAguvZKWbAxYBBwk2AD8qePfws2DsnauIClv3U/c/KJEsY?=
 =?iso-8859-1?Q?pxjIIwQaAWGSkdm36/8ikKUwAI8d1AWVK+uZVfjh6hvnsSuJ1USs51Wf7f?=
 =?iso-8859-1?Q?D6xuBKCXxIZIes7ZjGZHIAfA5wKd7AekdasvnNlgCLu98qE2N4imPeLOVQ?=
 =?iso-8859-1?Q?hsNNdzHRlRNCk3EjwLGfZVgIleYV8ySPuLy4ZPCbC8Y4jexf3Y/7mc614B?=
 =?iso-8859-1?Q?5b4+F7N6dv4G8OFO8Q1dchSe7DFWMyJJKbD1+/475LbjW2GcHsoTSTavoc?=
 =?iso-8859-1?Q?zJdezCMogB05UZ4EnDbrdk7kpOqA6p6l8X2TxvfA6kM5ig5WsDHFEZVYur?=
 =?iso-8859-1?Q?GSTCfYARLsiXATdNc49cMzGU8tFD3RktGFIcG0BL27Z2PO33G4IiTcqeLI?=
 =?iso-8859-1?Q?3aiVkF1J4e5Qt8Wg7NkaEJZFsEZQxG94gRIPfJb3fwyI6NF5q6y7qURGXa?=
 =?iso-8859-1?Q?yqK3a51MYNLnbHQGDkj6nfxymnmK7phEewEadbOMV2TvG2sjciCv9e0KPe?=
 =?iso-8859-1?Q?DNsbHBTVLDFbgEa8kvyXzzTDlL7mDrnT1Ojt8XBwg5Ns7nfecdpsedLLAc?=
 =?iso-8859-1?Q?RgOkM6jEFnxBaBMeqmrSxSEQJTvMNYHJZFDPKsEak6l2uGxzrU7pRGJGxF?=
 =?iso-8859-1?Q?5YuLqjkKge5ARKWFMtO2xBieEsD1OEETyi3huMcvVxb9vCELvRgQMWzAvO?=
 =?iso-8859-1?Q?CcrmYsznhljd0DUCXhgCfqpn1iJ7VTDHxsSU+Ma5DcQx0tlGSzh8eiEiOp?=
 =?iso-8859-1?Q?2cuRZUXT+L6n2NHK4X65W6c0MlrLJnn4CnRlOrp0L8uQRtpIBZ1uxslOoy?=
 =?iso-8859-1?Q?6o6d7TeX3Gc45UoYQZChtZ3LQnPMiJ02xucsMFWtzF9E6/fjs78GMvrMIv?=
 =?iso-8859-1?Q?0ltk20tBYxWTKy2cLFaHAu2PAyzlRf50Exuh2eEYgVUp8hLtHsAyLPiehk?=
 =?iso-8859-1?Q?pfhk44MPOwypWMjy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tq7g8ie1/zRMDEpzLmxrQjDihDsMLjsc97eEZblj661zZP2Cc9vmMusMIZ?=
 =?iso-8859-1?Q?omkeCy9tG+NsIJZp6KHMhz0tnqB+Eb7PyuaizdSUrtm7x/Pw5uI3ZD6MDf?=
 =?iso-8859-1?Q?d7xe/BCPqjNznDk/AN3PralIBMYRKVqVSB648HhHDPVkWeSKgIJI/lBIed?=
 =?iso-8859-1?Q?I506pvSEhUenMucfxxzy8nAHcRfwj9HmVdoz27siTHO8b8gFVgDoKVjBev?=
 =?iso-8859-1?Q?OnmStS6Kd70zdsUiaGs/8ikk0a9Nn2kMnQu8WMdVkQ4P+iXi5zG6dqUjU4?=
 =?iso-8859-1?Q?t5hxL4UnpjIKcz5R26oKlPL0jBiH4kKv7KwpgB52vRlPWBJgtBYT1pspf7?=
 =?iso-8859-1?Q?STYwpXjr87oys2ngOFxO9FmKDYwmjPgGfnNACs7Y+FmjnkHMp/CHnYQ4HH?=
 =?iso-8859-1?Q?0oekSGTvLk4XHqfDMekqJ7d2o/HJ/wyzrbBTmFAAoKUJUseu1CpgQfxzF4?=
 =?iso-8859-1?Q?M5e2zevchrpEur7krTXYwTk5XuDnrFxMccqyLEuLg1Kwvxo81KagYDZLV4?=
 =?iso-8859-1?Q?wyz7lxznhASHkghKvnUGiO1hqjyPoOEsmmKCmP5BKBqCt2vieuzrCpMALF?=
 =?iso-8859-1?Q?G1F/kRZTnQ4+mXQqCdDkCrBTyTFFGtTT/yl5CL5ScCumQzrtItSQBYAgEf?=
 =?iso-8859-1?Q?YqHytjJXFANtv8eH3iwbTXyPingfqE5fhLGSmHaQ79QIFKTANW62s/+m4O?=
 =?iso-8859-1?Q?cEHdwTG8Hq+U9k6wPQ0U+aMgaiTNTSQbgE0cj0h3J/9e6t+9ME/x+TDXAq?=
 =?iso-8859-1?Q?pd3x5OkQbeYFlyCozy6GgKqFVskUpJdDbjPqBjek4vQeRlUfoqV5m1FGUe?=
 =?iso-8859-1?Q?yEdLEAi1qCMa5WiHQgFcYaLIsY/AW1b7keA/6Su0mMzS68Ze6zRMpZ7H91?=
 =?iso-8859-1?Q?/kCEkUHSeuck1/Yu1aTS+CeLLWTRtv6lb6ZsKSbEJoRUAeWXjTyX1fPYp9?=
 =?iso-8859-1?Q?By1o5Wcfn31bBvhCy6VLfSm/21qezgeKQj1Oh2Ktp/pi9pq9AkYyNKG1Eg?=
 =?iso-8859-1?Q?NB256EQ7lhpTgEoOoou4VdLpzNnIDgDOjowN4Ub1gLKRe4V+DtyN+jwCeO?=
 =?iso-8859-1?Q?TiRQd9y5g+ttW7NPNxWZYv6hdbVipuDuG7x//t5gy2ofdQr2d43FkmdrD8?=
 =?iso-8859-1?Q?9BXb+KZ4loghnW9EQLO2LzJ2Hp5HVTUNVVl8C8p2ohopjYfRSC7UG5oiJl?=
 =?iso-8859-1?Q?GS7QoIT9ltkch/V8Y8p4NRflLsDe2N1XxC8zd32f3/bz9+xzKjTCEeMjHV?=
 =?iso-8859-1?Q?TuxxoL+TEgDx/sRZ9fVcdksqkoGOQQiSLZ6kuD4H1Vm0CVmM12TQfYglGn?=
 =?iso-8859-1?Q?9LKsDklHd0YgD7uHTZKgaQU7xks7kjZLimJVPDtyrh8i5hvQEYsjszxr0Q?=
 =?iso-8859-1?Q?LSRRAEScClNzHOdy4PXrdzDfRv7u9FJxauEZpcd94M4xxKBZr6DwkfDRMh?=
 =?iso-8859-1?Q?6XRutunKV3y1cjJsUGD4OQSsrCx20AtFYyqpCsWDXZpwPWG4OKgPAfSCQr?=
 =?iso-8859-1?Q?vEzks7JoSXWbgvdjVQRxKbbUF6HLIH1X2LJIxNPQHUrIv6H6hWuUMbP1yv?=
 =?iso-8859-1?Q?EJoQJj/cCm5Sbz/ozT08W8D7SxuSM8zsSfQtNcMCj/W/FxQSxQyuGfzLWR?=
 =?iso-8859-1?Q?V7eyv1Sg2pbpw0YLubF0KWXe6pNKP9erVRBrO0JQ+SdC9kbDhHoFXczg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 538e4cd5-b677-459b-27ec-08dd4a075805
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:15:56.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+Jp+6FlxA19f/2OJwFTJKIwCvvtVzIiz69dMU+z8ezAH8ZKb+OU0ZDyUAkueYi4ekTcqZfmekVx8wqKaezepg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

On Fri, Feb 07, 2025 at 11:15:38AM +0100, Thomas Hellström wrote:
> On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > Clear root PT entry and invalidate entire VM's address space when
> > closing the VM. Will prevent the GPU from accessing any of the VM's
> > memory after closing.
> > 
> > v2:
> >  - s/vma/vm in kernel doc (CI)
> >  - Don't nuke migration VM as this occur at driver unload (CI)
> > v3:
> >  - Rebase and pull into SVM series (Thomas)
> >  - Wait for pending binds (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24
> > +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
> >  drivers/gpu/drm/xe/xe_pt.c                  | 14 ++++++++++++
> >  drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
> >  drivers/gpu/drm/xe/xe_vm.c                  | 22 +++++++++++++++++++
> >  5 files changed, 65 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 0a93831c0a02..1ef21ed01d1b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -410,6 +410,30 @@ int xe_gt_tlb_invalidation_range(struct xe_gt
> > *gt,
> >  	return send_tlb_invalidation(&gt->uc.guc, fence, action,
> > len);
> >  }
> >  
> > +/**
> > + * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT
> > for a VM
> > + * @gt: graphics tile
> > + * @vm: VM to invalidate
> > + *
> > + * Invalidate entire VM's address space
> > + */
> > +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
> > +{
> > +	struct xe_gt_tlb_invalidation_fence fence;
> > +	u64 range = 1ull << vm->xe->info.va_bits;
> > +	int ret;
> > +
> > +	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > +
> > +	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm-
> > >usm.asid);
> > +	if (ret < 0) {
> > +		xe_gt_tlb_invalidation_fence_fini(&fence);
> > +		return;
> > +	}
> > +
> > +	xe_gt_tlb_invalidation_fence_wait(&fence);
> > +}
> > +
> >  /**
> >   * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT
> > for a VMA
> >   * @gt: GT structure
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index 672acfcdf0d7..abe9b03d543e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -12,6 +12,7 @@
> >  
> >  struct xe_gt;
> >  struct xe_guc;
> > +struct xe_vm;
> >  struct xe_vma;
> >  
> >  int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> > @@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> >  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  			       struct xe_gt_tlb_invalidation_fence
> > *fence,
> >  			       struct xe_vma *vma);
> > +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> >  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >  				 struct xe_gt_tlb_invalidation_fence
> > *fence,
> >  				 u64 start, u64 end, u32 asid);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 99b97bf37c05..c5060011ad43 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -214,6 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> > struct llist_head *deferred)
> >  	xe_pt_free(pt);
> >  }
> >  
> > +/**
> > + * xe_pt_clear() - Clear a page-table.
> > + * @xe: xe device.
> > + * @pt: The page-table.
> > + *
> > + * Clears page-table by setting to zero.
> > + */
> > +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> > +{
> > +	struct iosys_map *map = &pt->bo->vmap;
> > +
> > +	xe_map_memset(xe, map, 0, 0, SZ_4K);
> > +}
> > +
> >  /**
> >   * DOC: Pagetable building
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index 9ab386431cad..8e43912ae8e9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -13,6 +13,7 @@ struct dma_fence;
> >  struct xe_bo;
> >  struct xe_device;
> >  struct xe_exec_queue;
> > +struct xe_svm_range;
> >  struct xe_sync_entry;
> >  struct xe_tile;
> >  struct xe_vm;
> > @@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile,
> > struct xe_vm *vm,
> >  
> >  void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head
> > *deferred);
> >  
> > +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
> > +
> >  int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops
> > *vops);
> >  struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> >  				       struct xe_vma_ops *vops);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index bc34e6738c8c..82026c5a154d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1537,8 +1537,30 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> >  
> >  static void xe_vm_close(struct xe_vm *vm)
> >  {
> > +	bool migration = (vm->flags & XE_VM_FLAG_MIGRATION);
> 
> Do we need a separate bool here? Only used in one place AFAICT.
> 

Nope. Let me drop the bool.

Matt

> Otherwise,
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> > +
> >  	down_write(&vm->lock);
> > +
> >  	vm->size = 0;
> > +
> > +	if (!migration) {
> > +		struct xe_tile *tile;
> > +		struct xe_gt *gt;
> > +		u8 id;
> > +
> > +		/* Wait for pending binds */
> > +		dma_resv_wait_timeout(xe_vm_resv(vm),
> > +				      DMA_RESV_USAGE_BOOKKEEP,
> > +				      false, MAX_SCHEDULE_TIMEOUT);
> > +
> > +		for_each_tile(tile, vm->xe, id)
> > +			if (vm->pt_root[id])
> > +				xe_pt_clear(vm->xe, vm-
> > >pt_root[id]);
> > +
> > +		for_each_gt(gt, vm->xe, id)
> > +			xe_gt_tlb_invalidation_vm(gt, vm);
> > +	}
> > +
> >  	up_write(&vm->lock);
> >  }
> >  
> 
