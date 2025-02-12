Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73FAA32EA4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979510E959;
	Wed, 12 Feb 2025 18:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1qdVruw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD04610E957;
 Wed, 12 Feb 2025 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739384732; x=1770920732;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kvPxtjnGZ2SzJIxdBk3miUM4Ko/y3HIjrtWRChPL6us=;
 b=c1qdVruwhrygKXmsAWh8BW8epD+xwPozvPNhm51x12g3PUCiyab3GfkA
 jNJjHRKU7rKibDL/dfA3VH6XJMHT+MXUXW6jAkdfXG2qL7AmgL/0BvOGu
 2IXKofPPbfx8Iq0G7rykrdcvBozX6xvU6ldP1viHULdDW0O+vM6UgDN/5
 4puW86RRicHy165v/G5B/B42O3HeQVrkxZ2SGJqT6y5DewmWmZdEy7rKK
 MnW+JI1UyP97ID8hbG74l/tMqKYkkab6CnNaD9wOhuw3YW6/QVHt1GT74
 UOq7GyUGisdkamXuWNBbHp+1VfqN3tqAcucQ7tMKYHnIxRReYzUQVfogU A==;
X-CSE-ConnectionGUID: uv+y049tR9yUf6i3uI3adg==
X-CSE-MsgGUID: m4Gdj9FlTzWOnRGqTr5Mhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50708027"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50708027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:25:31 -0800
X-CSE-ConnectionGUID: nx66mG+/TsC1d9HtVok3Ow==
X-CSE-MsgGUID: e33NQKCmRGqINeTQ5XR+zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="117988604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 10:25:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 10:25:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 10:25:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 10:25:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyU4+HgEPVw5ZBMYUjl//0pjsjkJzkKmj6XaD653cegpyV36l8ZzNyLNsm/IXnsR0lhr8E2mhiBw5L0fygAcgif4aHzyrp0RWaGwdVv83lST/3zi2MKx3VD0YU1kacV9BsbiQrww1B8s83LXUNSbe0QNS86PnU5cPUV4XQcY++e5YVvHoD52UjmdgkunvCTU3aR/iuD+t6JCZ8Jhg7lxstDxg+s6hx3nXmIZNXvhjYGzpCQ7m5w0MWGpWFw8hCc1rwHFpib9EfyrlRbMS22TDQFzQdTlziTP4r+yhJ9/kbvk0adCHooUes7r5UkHdHVjJ7su26ChP7+XMMT35SU+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8I2PYTja3Cg4U/mPiukPD0ypz+QgREbGSpKhtJ+fR8=;
 b=bly5PTFBa+s5amZtyK4s54Dlyd+oAm6FQ4ETevvJeNutxkOC3dDROSozkWOmVrKVNs3jY+xt8PY9E8jbhwPC1/GWf2I6GrwQWprMoaeVcIaxvALgi9lZoUR9gTtcZCKAazpe8sPvnWGQVU4oyWLo8d2maEyZ5okLRh/ew8fQB453EeMMc4J3bRVcGYWuhpVipgCJS8Flf4nlbkNfoDA6PGQ0WfJH/1Xkj3cqYKHE7Y0xCXe0+ciWKyy+fd+Odzp55N2W+nTM7EShb1p5DNPcagfr1McggxcNkTXxK3Fzi2uxUk1AfRjzBljQOgtLerRrkBwmsigsNALywMveunoyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 18:25:12 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 18:25:11 +0000
Date: Wed, 12 Feb 2025 13:25:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <lucas.demarchi@intel.com>,
 <jani.nikula@linux.intel.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <andriy.shevchenko@linux.intel.com>, <lina@asahilina.net>,
 <michal.wajdeczko@intel.com>, <andrealmeid@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <xaver.hugl@kde.org>, <pekka.paalanen@haloniitty.fi>
Subject: Re: [PATCH v12 0/5] Introduce DRM device wedged event
Message-ID: <Z6zngStoVbBSO7yz@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
 <Z6xGRhC7qrtk7y9t@black.fi.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6xGRhC7qrtk7y9t@black.fi.intel.com>
X-ClientProxiedBy: MW4PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:303:16d::11) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff1aadc-f300-4f7a-0338-08dd4b92965a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HBgd3UKbHM61Q1u0hpqGtFREZwCsOJCf5Kx5oYU++3gEzeaW220yQaAkWm?=
 =?iso-8859-1?Q?bFfRxoKh7Fydo0pgyLQvLNxtXs9xBkGbALL9sZHim9xbKTmUpxmqzLXO87?=
 =?iso-8859-1?Q?M/U7EBbE9nIJAHjDo2krymfJg4bMb05FGZWVPBkRyx5AfwwSrdpni7wvml?=
 =?iso-8859-1?Q?gD1vaDSM3lVeaTIjgIMS2hep6Muxf2k5+vqTxqZnTnPRZ7hqjog1ZIc8qb?=
 =?iso-8859-1?Q?7FXj8GM9BjjzSVkcDpPD91/xV8PM+u9DB5cDBctgviPbYVeQJEPY/RcGgr?=
 =?iso-8859-1?Q?1t1Ery94eJagdIEW7WT4OIk7Ltj3pDcz6Rk/hPhm2r/psr1+B5WDlBySJi?=
 =?iso-8859-1?Q?6xII1pTvU4UWTdcafjTo8ZuqumQNMWjsSnPpuSXfvjb2MgwrGaOXbDMyM/?=
 =?iso-8859-1?Q?l0hZlu3h4jDYL1l9on/A4HVjq0psB8wAXRcbZ6417KrLjBszp9T3GRKfoS?=
 =?iso-8859-1?Q?LvSUAUkNy3HcAzyjYceCYeyuugYwFuD3+eGPi5FBLdbk2s9SADpNDPxMDY?=
 =?iso-8859-1?Q?mf3yuyoWa7ke3STUkt5diN58INmXoRA3oL1tHN7yaEn2l8z8Fmvt38NgBV?=
 =?iso-8859-1?Q?nhuZBtg3evoJls5f9jFmUfghmPsyk73fSmLQhTZN9vDU9YeDtDXajSCOcF?=
 =?iso-8859-1?Q?jF42rNEk8Wmkxh4PTje/PWswrhnaEHdCFt/kEPFDIFT4qBDd4xdstDDzg7?=
 =?iso-8859-1?Q?T95CDSpb1CCGnhRpkytGcghpaRF+/+ifXFM2anhGY8IBbTLM6JYUT6ALUQ?=
 =?iso-8859-1?Q?lNZGUJtzLvHwBMOCNjPy+ENqYCWldB5rhiJbmcUq/jsNbJfgqRYN3omCq+?=
 =?iso-8859-1?Q?mK27lGe/dzzIp9w+8GuPvUSeqJWHMivPRoTJyoh+Pwp/2O43maQBmsEN/q?=
 =?iso-8859-1?Q?TD0IqvT34r/S61/gXcYBMNd/vwsVQNeJwux8bhTFUxYjLmPru+FSwa3ME5?=
 =?iso-8859-1?Q?SKy1EzMloboqRlxJmmT6gShYAHsfg4CQ0WBvFhp9YqqVnmnTHkLill1Svg?=
 =?iso-8859-1?Q?lDdhBVvXXVQkKvft6WHr4H6wvesctaTmfKSUfD+2/MrmDPMM/FcjDMTnG/?=
 =?iso-8859-1?Q?onwp/5LEoZqvT+DQy+W41LiieS5AlsOW7qfnZZzmbckmzB0hDU26bXZSHD?=
 =?iso-8859-1?Q?3eYfUoAh6DZBxw9syekLXggA+L0hMEPFsZIvecAc/5dtgIr7xPQGdU3uGz?=
 =?iso-8859-1?Q?MjXEwD5lA5F4abIjg2/ZbSTSAR1oXX2PuZRw7/r6+h62NsnC+LYixzc2Dm?=
 =?iso-8859-1?Q?4AIUZCkktcCVUOH/84eJU0zEffBSaE2lkTfFUzbDw2X6jZ+vH3bE0pU4/H?=
 =?iso-8859-1?Q?qks3Uo4Feq85CVutzS/1CXhdWCQVYBjKkm/W3uoZagdL6heEUPUwQdWc3u?=
 =?iso-8859-1?Q?AGj5T1eCI1SjmHyHX0B7c9IIBz9I80hQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?egtVZNkvrIkGvTwO/UbJVlEjBZt4mc/M0VPK5GkwPhiubaOtbRwgNEDii7?=
 =?iso-8859-1?Q?30WL9jkiw3tNYfU0GJpFcFFvQ3MgJPG3rLKtyfnM4UStrmARfuHSaypLxs?=
 =?iso-8859-1?Q?zs+Z12TwRpEfZeuuDtr8AcArYw3S3p+qyobLCjYBkOWZCaAEp1sqsqVJr4?=
 =?iso-8859-1?Q?bcxT3ABVOoXWlJHNm7GjE0A95wzafpnJqSxgtxMb2c0hlCwFnjcpDKaDj8?=
 =?iso-8859-1?Q?Gl9my/eIqB5nZjyGWTG+Y7gOE6a2bH0aiDugZuy40vGUWT3vQnYhwv/ZIV?=
 =?iso-8859-1?Q?KrML9lhouO+Uw/n7e4eIjvJzWdTFMHNj6knxzRVtfQB9C467ccduaucii1?=
 =?iso-8859-1?Q?zPmtFblaHU71cRnaEGWctrRLwKMXjMyCLDSrmc0QOt+v/HQAPhXo0N/mV1?=
 =?iso-8859-1?Q?jPR+Hmoz+4Ix0psIijihfic9XgLBwUK15Hpr9KiMcTTOsDmbGtkNK33Y7r?=
 =?iso-8859-1?Q?MXo+VXIFNytzGEhTZSekBcFVZ7eYntLsiPPJGiNhfpex0ulQmgpMrIkpyS?=
 =?iso-8859-1?Q?wSyJ4h7X/ktyoIaxID4JBtsQ+EaeUDcfPhs/z4LcsWlECSKdUUmRKnjGXN?=
 =?iso-8859-1?Q?ipCnKSsmvGjpuNSBfN5zsbqF8ey0dLWuL3ul5JmblbsCXwLFpcYi+gj0qB?=
 =?iso-8859-1?Q?lBzjK40K/5kTEtJLjo6xG/FyI5z9MLdb/8aSlzsdjX5+qxPWwu/yGhXW8v?=
 =?iso-8859-1?Q?S8Zu48/+UIsUOJnSpRMOO8tIPu3H2Vv6AASLQganAIIGVzKHox8qVOI8Rx?=
 =?iso-8859-1?Q?rnBm5VRCpPHMM/KjCIIEmuu8tA7SvOkensPzJ4jEJuy926vyLCDAJvDagX?=
 =?iso-8859-1?Q?VEawBGXs0+FwOc4gf97LysgP6cxHafdyPf8eEh1GhrDLor+z9cscC7W37M?=
 =?iso-8859-1?Q?A6PryJ2X8F2ix06dgkFLDbV1Puq489mJo5LF0GkexUBPPm4SJiVzPA7W/z?=
 =?iso-8859-1?Q?z8N6U0SHYHDXOgXeEFcHbj6xicrTqJnCGNE8vfW4ngwlCjO6oSGFj1v4jq?=
 =?iso-8859-1?Q?8/jzT94UNCTyD7eE3rCJfVhwHwnZzKiyoEAcd8GBQ20fCH1Fs2eaTyuGU4?=
 =?iso-8859-1?Q?+GnnCfZnyT6Tad8ZjSOTRwBIFn/IewYrfVny6V8g9g+6mMvTFtRPoCdMLS?=
 =?iso-8859-1?Q?f/SNgNKR0kWvD70u0wH0T21aISOzumCMyzc13b3dqVDdbPzkFM6ntxre4S?=
 =?iso-8859-1?Q?hiI4z1ANTGdJ+FqqxVPv4L/IfGCkAp6spTi2vAZFYY9fk+uCE4tUKS6PS6?=
 =?iso-8859-1?Q?SFq2HruIQJnJjGzI0x9Lc6jeHejpZ0DyyRrlzmo/z3dBI/SzVJRrZFswTJ?=
 =?iso-8859-1?Q?i25P7lBryzMfbHxzwc8jHUc9BjMyqGuhsQvM7RFnIhHpaa9PdlOoLv3c0Z?=
 =?iso-8859-1?Q?kdc87ddOS9oxd0wLIStgTJsvMcCajMUnS3+NHbEtTBkhzm7Yp/jmH2Z7hh?=
 =?iso-8859-1?Q?5JKXFq3qhzJz2nfWp0UJoX29blKGp8P25EOQI0Nn3RB76ZRedWbVwZpahw?=
 =?iso-8859-1?Q?ZfzSbB/uQ1/PnXyQvvSde9h0hQ5iilaXCjNU/TCC7KIZD9WdA2/jQ6wPbt?=
 =?iso-8859-1?Q?176e5Puc+NzoD9pfTuLR/qPbL7dq7WzEWvYkgyzxH0auyBi5o/QJ3tnHtD?=
 =?iso-8859-1?Q?VzqV0ri10f9OyQr90M5sZvpOQIKdoS4fB+vZUd2YnO5VkgxDVYRL3KLg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff1aadc-f300-4f7a-0338-08dd4b92965a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 18:25:11.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoU2+1afX/reG+tRogWoFwABZ2Ovz22Y9rgEtD1uF9iCcXrlltCB0pgtBjkPwlk93faNhamN7mkHeKZxy8BlKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
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

On Wed, Feb 12, 2025 at 08:57:10AM +0200, Raag Jadav wrote:
> On Tue, Feb 04, 2025 at 12:35:23PM +0530, Raag Jadav wrote:
> > This series introduces device wedged event in DRM subsystem and uses it
> > in xe, i915 and amdgpu drivers. Detailed description in commit message.
> > 
> > This was earlier attempted as xe specific uevent in v1 and v2 on [1].
> > Similar work by André Almeida on [2].
> > Wedged event support for amdgpu by André Almeida on [3].
> > Consumer implementation by Xaver Hugl on [4].
> > 
> >  [1] https://patchwork.freedesktop.org/series/136909/
> >  [2] https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
> >  [3] https://lore.kernel.org/dri-devel/20241216162104.58241-1-andrealmeid@igalia.com/
> >  [4] https://invent.kde.org/plasma/kwin/-/merge_requests/7027
> 
> Bump. Anything I can do to move this forward?

Well, it would be great if we could get that merge request to remove
the draft and move forward with this approach. But, based on our last
discussion on #dri-devel, I don't see that as a blocker in any way.

And we also have all the reviews and acks needed to move forward with
this on drm-misc.

So, if no other objection I'm planing to push this to drm-misc-next
tomorrow.

> 
> Raag
