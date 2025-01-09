Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17DA080EB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 20:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BF410E490;
	Thu,  9 Jan 2025 19:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVOKqJN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E39210E490
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452704; x=1767988704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VbujXZzTzn2WmvznS41i0v4tZpjsro7FR5v5BLO2gpY=;
 b=DVOKqJN4Gi9cmxJZmsgB1GjEkLK4JMiMYez/TVyQaIVECBpYVesKvEkk
 n7FXJ8qpmEne4LUb4bdIdupmidaFgRjlSa5uGxWwsFdjb7TAzG6POgRFP
 MB2voZQbOhCrAFesD7yc0OhYayQnl8H2PaQ9Q88GsnKlq2WK7LVjeSQww
 l1wKeeH7hButCe2SNqW6w09n6p+8zbWQsUU6mVCp7mhS3Z5dsB7FEzvlC
 xk/AfaM8BD4sb5HGidhbFiMMVscvWGPeVp9I35CGuPij2yjJHVYH3fpf6
 XC5X22FH4esYHpzzYzn4Nyjqy402ZIH4bV18OAuew2RsLwr6jAVnTjLKb Q==;
X-CSE-ConnectionGUID: mUbNc8tYSJm/Z/+a606ZWw==
X-CSE-MsgGUID: fGpFzWg2QRSy9+w4bTDLyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47720663"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47720663"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 11:58:24 -0800
X-CSE-ConnectionGUID: l+Ls6pcdS5aSj5uN8QPfMg==
X-CSE-MsgGUID: lP49huBHTRaEp5XkGZVoSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="103570406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 11:58:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 11:58:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 11:58:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 11:58:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQDPOp/6ronHH/NnxQjS+5FexnhNjhKhCENqz5aR3wPQFkzSSUS5WeNO6ROHH7wbN3WYXZCg3TZx41hE5nY/9hlfJGXjiXB3Fw36nWGUy5kzHmRvdrX7KibEeeZwwBir2w/Zf+1jxxAwpytbeOD8DftGK4uMaT1jEA9fPN7afQszVV62rQqVeuVNo+sjAJHi/GH9WMIpr6lA6uewXP83snzFpyyk5/0D8cKSohKzaHE0biDUA4wXYkUp07IA7bKW4ebCdKdTwqUEH25trP1o5+eevru0cbwVYRoruvzpKSCpBGwL019DvzYbZqXRXYiNuhOwThfqFlcwybHQJ6yIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtSFD9AphimsQr1KSbHXt4+u+kso6CYdqJCpA5kVwcE=;
 b=Q+tRPFzuwvUny5fFX5bJd4f4Q2gCUYGEPtFnLItpevt8cpIM0PosZeE5sqhYcUw2mVKrGDui2Tq4B0gE/gCwapRnpQVcmkY6yQIka2Yk/K8kmf+/Lw183BKNLfHLc/ZkyeIvCDff+MmXEJeRKIixnGc3LocaRI64xxXfcEvEpcW8cKfGnhGxMoCqCwdKBK+xc/ihguHGBqZfzVo0NjKY7aTaWIAb2uqK6IOSiMtg94VVDxE+Q6m4uEVumj2BGgAkTvVUWGOGlHbHl63kEMpoUg3XEKX91N2JKssVrOQzJxCnhqN9jPfanX75ndTVjEqj8Fx3mjSu8Grkzl4EHyEN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:58:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 19:58:15 +0000
Date: Thu, 9 Jan 2025 11:59:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Danilo Krummrich <dakr@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>, 
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp Stanner
 <pstanner@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
Message-ID: <Z4AqiSBnJshH0PRU@lstrano-desk.jf.intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <Z3433G3-_aIMqJbt@pollux>
 <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
 <Z36udQs86Mn1-T5p@pollux>
 <e611e9ee-3809-4370-8402-e7c324812bb1@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e611e9ee-3809-4370-8402-e7c324812bb1@igalia.com>
X-ClientProxiedBy: MW4PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:303:b9::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1cb5d9-2447-49f5-d095-08dd30e7f461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/zmEakmbDHv+cYQU55uIcjDhf0aBxtPIXb6jlZifmaaJNjBx805rep4+movF?=
 =?us-ascii?Q?J/er88dTC4dxiz0peu6AfrpaHZFX6K7b0G+q6Zim1sTu9srVrSIqCMYOy4R/?=
 =?us-ascii?Q?x9LFc8hdU8ICZ9BNPB4SB3G1GTj7DfJNOiR+OoD+Y1T7KR9NujwIj2stKV8u?=
 =?us-ascii?Q?G3AKx62bPgl29Kh4RnTikMAByXNYnwCuPv0E5sDxCVgDp5vL2jzM2e84H87M?=
 =?us-ascii?Q?A+oUJHw6B+MeOnrae3cD2EhPNBAA7zlXIjlOzl9J+eHhlxs/2IAHzc/C3ZWj?=
 =?us-ascii?Q?IZtr+c9ntnmHPNwYss7LfE4eFfO6EvjmcLlxokADS1CxHlnUcSqzrlTwyeKr?=
 =?us-ascii?Q?Jdm3cSrUOcoJ86VsqTK77TBbRpfhTErK7DbC508Nup3uslUrFcYsnQrJnPxk?=
 =?us-ascii?Q?M6zqqa41zD9OmNX31QXra+Gl8QUhAKnWVXaFirvtu3uxYHVqN7k5QVLUG973?=
 =?us-ascii?Q?aq/ve8G5U4Jfu9S5NCnA0O8WJCG6mUvVqXStTM6EW3p8Ggv1sIDgXoHHom/W?=
 =?us-ascii?Q?MIKJQEkwWWPZWoGCl2OghSW3UBPTV5HqP2Il7SCLvNoMCYEoff8GTCdVy8oF?=
 =?us-ascii?Q?jd7OOtjgaMkp2s0f8Qmicc3nH4jzNRNWhIte1/peyuj8Qwzmq1F8KJANEwdH?=
 =?us-ascii?Q?tHtOsz6OsBm1P95nrS0USzDQ3P//2IGQGDjxFepAlY6HASy2T1nUiYPBwSrU?=
 =?us-ascii?Q?H2Zho1t4zuUhh0LSClRixRFaLvEZKScqQpo3O/AQEuCntfcHb13mVCG3BclN?=
 =?us-ascii?Q?5nCznWE19Fu3uM6kC5LNDag/9qTo8TR8X/mjzh/UWie/sQMgJnfDk705TRsD?=
 =?us-ascii?Q?ElmdEtAdWdzoiyH3K0MkR2bBEK/niV76ni1G7Fmi+mPoro/Uira9YDXRNdEe?=
 =?us-ascii?Q?HpMq/lQ9RmghVLwDojweS0cvxKPFvNxBx2SEK9XW0e36briIyXE3jvOUkef4?=
 =?us-ascii?Q?8N4TFGaVWfOLW/jGvEXN1dDfYCch4JGIrWid/SGkRgCXkuphsA7LO90LNnUT?=
 =?us-ascii?Q?GwtcbIjEszNL1G+nvWcM9h3Q9kNo1JqzFymTUfiYMtSmhMyN5F2gAePVagAT?=
 =?us-ascii?Q?cHcO6Vb6t24721780T3rdVnsY8u2SmK3fDPHujxRlG4kYJ5X8vqYUyFz6Vef?=
 =?us-ascii?Q?+95+YP46s3fZU16sWUqBxNwVDWtR4DfBIadHrXk97c6zqYovfxtXrzif4Z2S?=
 =?us-ascii?Q?HcoVaHUHu0Z6S/x86KNTvRGLhKxUDRvWhOddN0nujuR7pnkFlIUduZG1vfc9?=
 =?us-ascii?Q?0eAXbRaoaEvxOwgK/+Jjw/wpaOpFOTQNuwF482WY4W1G5xz/wiaSjkW/RceY?=
 =?us-ascii?Q?jGXXMXKZKOGmN/Lfc1t6mWV6cECrLKmQ1ZXvNAIR1pqwcuI8GnOsXmetsSNZ?=
 =?us-ascii?Q?9dmrmGh+qU46n5WITGF/dZH6VAFW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFB3P4ZNZ9iVnh5iUhTu8pG1E+b7hpvnAxzgnLrk7JVqWsQ4pXD+L15AQm1q?=
 =?us-ascii?Q?QhsdYxZdbYGwUyq9RmPFr2fx5safx9ZbTniiWfQr5BQkfERKMhSPX4fs7zd/?=
 =?us-ascii?Q?g0laLik/GMGdXMU7NkqUQZ+CBkdW4yMrQEo5DPxKKhYmBWGtlojDwtzfAJbN?=
 =?us-ascii?Q?C8oSIkfsZZ8HWLmbSM35KkPrJG+atfnlq/P9HzjPpq4//cGuKTVN9NsbPp7Y?=
 =?us-ascii?Q?0LNi3z7Dx7CoFeT6rBjsyYt2bwFSpc0yqMRsbakyzCv9pBO37EJffoCx3PJz?=
 =?us-ascii?Q?tP0v01baoGo8Ma7V4UPXa2qCdRCb5nn19CmEqn8k8YAcEPhmcEMSQprg/WTL?=
 =?us-ascii?Q?yoLVd4P4MRr7/1LDm6iLUjBoX+o3RGXFLiMi/iVT0hhHpenXiyr7aHodf2C/?=
 =?us-ascii?Q?JBNtIf0YI40EGjeCxe4ystkfvNfdf1fYq928TKaZPD9X/npjKAxzGCOrtSyT?=
 =?us-ascii?Q?Lt1p/eAiS2dd3ZpI7mYcNoAA24HE1GAgrsh52Zp7oPm6AeDPdExq73q3qLqd?=
 =?us-ascii?Q?6aOu5NRpn3Da55d6IthbVXD+khVJ6l/NIXgyJS5SOun/XdYxbBpM2SMqeQ1U?=
 =?us-ascii?Q?LdLPRv8SzDhjhzsuIQrYh0APZzZEc/GYjkt3dd6xUKq51WNUyX4/4aGhphjZ?=
 =?us-ascii?Q?jbZZTMKEv8ENST+n37LwRF9lmitQVKYCJXHQjL7tfqTtRJRMJb93+nMGXoGu?=
 =?us-ascii?Q?CsWU6TWLtALdJWbg5WaYSYTzpNHdUAtvTppZTTd8HWs1B/JeQ8ZiE+M5OM1m?=
 =?us-ascii?Q?PAE05ag4Sh/Ov8MaD8PZ6gr/jhXlYk+Z8KEAZM4GIQjylYf6Y0OJHlZ/NSAU?=
 =?us-ascii?Q?F+IGFYCgbeEiCeZGEivr+ftrAyA/9pdWx1vHEv/vvczzQVRYbFp6A0wMJEZq?=
 =?us-ascii?Q?F97lmK2PlbKoXH+PKRVZNWoEB0mgpscdcBl16/VWetF00Mt7t8OCUnF1tO2T?=
 =?us-ascii?Q?l7YVtB7t58r2UV2HMbtrAe+RnwJocA4qanB4b433RU1P+Myy+0/gO8WFMxKd?=
 =?us-ascii?Q?6ytPaonHVr0trJLBHq2MDnrwXU0ceqlupcXDMKpExOPgS5zEvi7sg/oWklje?=
 =?us-ascii?Q?Rih3CEK93S9HyklonXWrZIN854h5TDXpk3Yrn/uZibQx1D4sS/ktybadwVNO?=
 =?us-ascii?Q?TIlBk9Kk7wc5wYjlNLFZW+jD14pOOlxsUeA2IQNuB7D3H6eZ0g4KJBhZa8N9?=
 =?us-ascii?Q?Dw5u6WKAOKyj2dfR07xE09NTQUyuzvycpPCEWhNK9lbjlP96QCCQlCK+Lu4f?=
 =?us-ascii?Q?HGfM0gRHnJsuUeTD1AjKR/C/e9hfgFIwM5pqnbEADD75yKdV3dSuWtn+S2f+?=
 =?us-ascii?Q?paCfNECKGi+F6YBA+2MWgJiLVkRWLFb40CXOaqNmqYe1nl2400CKRFbHkoRR?=
 =?us-ascii?Q?gr1j30VhU8z69MCvB9bXGdSxv9Vgmj3v3CiCsZ3li571BUz9opg5I+OX3dB/?=
 =?us-ascii?Q?CFzIkUSI3b15Gt3D68E2516dJsS+ivbczGt6AACZdhXWerxDsj4W+2cHrwvF?=
 =?us-ascii?Q?aXLi0qnbjKpYEqQAO0+16XTSsItS/IXK3As5yNy3FWZZsP8M8PhVyiapIFf2?=
 =?us-ascii?Q?dAfgQENGDb+rDUlS0r3biBd5cDwbJ/Sl/D3Qy58NQxohKEjRM3d/267F3Xer?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1cb5d9-2447-49f5-d095-08dd30e7f461
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:58:15.3311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFOmRQ72MflXI8suMxTExh4JS7VKOuhAM9dlCRrBXBhSL3XnKvI/DaurWGKQK8S3vNWR5qFGHD743Tois/KEgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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

On Wed, Jan 08, 2025 at 06:55:16PM +0000, Tvrtko Ursulin wrote:
> 
> On 08/01/2025 16:57, Danilo Krummrich wrote:
> > On Wed, Jan 08, 2025 at 03:13:39PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 08/01/2025 08:31, Danilo Krummrich wrote:
> > > > On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
> > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > 
> > > > "Deadline scheduler and other ideas"
> > > > 
> > > > There's a few patches that could be sent outside the scope of this series, e.g.
> > > > the first one.
> > > > 
> > > > I think it would make sense to do so.
> > > 
> > > For now I'll keep them at the head of this RFC and as they get acked or
> > > r-b-ed I can easily send them standalone or re-ordered. Until then having
> > > the series separate would make the RFC not standalone.
> > > 
> > > > > <tldr>
> > > > > Replacing FIFO with a flavour of deadline driven scheduling and removing round-
> > > > > robin. Connecting the scheduler with dma-fence deadlines. First draft and
> > > > > testing by different drivers and feedback would be nice. I was only able to test
> > > > > it with amdgpu. Other drivers may not even compile.
> > > > 
> > > > What are the results from your tests with amdgpu? Do you have some measurements?
> > > 
> > > We already covered this in the thread with Philipp to a degree. Tl;dr; the
> > > main idea is whether we simplify the code and at least not regress.
> > > 
> > > I don't expect improvements on the amdgpu side with the workloads like games
> > > and benchmarks. I did not measure anything significant apart that priorities
> > > seem to work with the run queues removed.
> > 
> > I appreaciate the effort, and generally I like the idea, but I also must admit
> > that this isn't the most convincing motiviation for such an integral change
> > (especially the "at least not regress" part).
> 
> It is challenging yes. But for completeness the full context of what you
> quoted (if you also read my replies to Philipp) was *if* we can shrink the
> code base, add some fairness to FIFO, *and* not regress then those three
> added together would IMHO not be bad. We shouldn't be scared to touch it
> because only touching it you can truly understand the gotchas which any
> amount of kerneldoc will not help with.
> > I'd still like to encourage you to send the small cleanups separately, get them
> > in soon and leave the deadline scheduler as a separate RFC.
> > 
> > Meanwhile, Philipp is working on getting documentation straight and digging into
> > all the FIXMEs of the scheduler getting to a cleaner baseline. And with your
> > cleanups you're already helping with that.
> > 
> > For now, I'd prefer to leave the deadline scheduler stuff for when things are a
> > bit more settled and / or drivers declare the need.
> 
> I just sent v2:
> 
> About motivation for the documenting efforts:
> 
>  13 files changed, 424 insertions(+), 576 deletions(-)
> 
> Fewer lines to document. ;)
> 
> On a serious note, I ordered the series (mostly*) so you can read it in
> order and for patches/ideas you like please say and I can extract and send
> separately if you want. I am reluctant to extract things beforehand, before
> knowing which ones people will like and so far there is only one with acks.
> 
> *)
> Mostly because perhaps "drm/sched: Queue all free credits in one worker
> invocation" could be interesting to move before the most.
> 

I looked into this. When I originally changed the scheduler from a
kthread to a worker, I designed it the way your patch implements it:
looping in the worker until credits run out or no jobs are available.

If I recall correctly, the feedback from Christian (or Luben?) was to
rely on the work queue's requeuing mechanism to submit more than one
job. From a latency perspective, there might be a small benefit, but
it's more likely that if you queue two jobs back-to-back, even when
relying on the work queue's rescheduling, the first job will still be
running on the hardware, nullifying any potential latency improvement.

From a fairness perspective, multiplexing across multiple work queues
one job at a time makes a bit more sense, in my opinion.

Matt

> > > Where something could show is if someone is aware of a workload where normal
> > > prio starves low. Since one part of the idea is that with the "deadline"
> > > scheme those should work a little bit more balanced.
> > > 
> > > Also again, feedback (including testing feedback from other drivers) would
> > > be great, and ideas of which workloads to test.
> > 
> > Unfortunately, there's not much I can tell from the Nouveau side of things,
> > since we're using the firmware scheduler scheme (one entity per scheduler) and
> > hence the scheduling strategy isn't that relevant.
> 
> Yeah. Hopefully someone with more appropriate hardware gets intrigued to try
> it out, or to suggest interesting workloads.
> 
> Until then I happy to keep it alive in the background and as said you can
> pick and choose the parts you like.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > > 
> > > Btw I will send a respin in a day or so which will clean up some things and
> > > adds some more tiny bits.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > 
