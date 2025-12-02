Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D6C9C187
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449C410E67C;
	Tue,  2 Dec 2025 16:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3TiFB6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06B10E187;
 Tue,  2 Dec 2025 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691587; x=1796227587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YEiV+yKjPhaMACy+X+yjUrq1vEkeYdBRBiLQkcEo0r0=;
 b=I3TiFB6cwCVOhusZjvwbDAQqvrs/9XCmJOSZ0FcizMSPSn3JAhs6l4cM
 cC/SA6AOS5Bq4jXh6r+Gz2i+w9zGkFLfm4O7I5yGhloGDgUePVWTpQh1F
 k95TthP76vYsoGzR0KYaun6r+Pl5FJk5UUipbMkKGP6gr+CxUc4T1souR
 uENJtZyuw0IveXHvOQndyNQXVPqj4Vj4SEfShtk2VIPvHoDJA+6RsNEtm
 YvYs3EOFum7ZPLPWfL8yWS9PyyAC2eeUqZC3x5Jo+/JaoKPLfsp1k6XP2
 95ioMMCUi0L1waLK4rjkyiS/AieirphPxk5cRHqwv5FI8ibZbN2D05eG4 A==;
X-CSE-ConnectionGUID: ADCNg6bTRwCN33uHjac+lg==
X-CSE-MsgGUID: ofKdrKsYTwa37zOhTLwQSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66621279"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66621279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:06:26 -0800
X-CSE-ConnectionGUID: 4kQYvsQZTImzOHA10gTR4Q==
X-CSE-MsgGUID: vK56Sr4dRfCflhwj2qbVJA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:06:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:06:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:06:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:06:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjf/FLadJgHwMWQN15MirvvKDsB2MZQQ4SDnTgXw1c6IfLV+4hU3j5BkDeeSs9nRkuNVQKKlMavFNVOwHZseZ51i+Xnx00IoTrU65dettnV+LEsjNJbXVc7fKVPIwd33KU8grMu/bFOgq6pPvcTRjM2r7Y17Ys/0OAKsi3qRcuT0iWifFQv8+VGDxvjo3Dy+HeFHWH01GA2kKKLwuOLbTNjStckVD511wxh6v1PDG5g6atPLYvZd4EBPtFpffB/sZ+8X42uQHrSHqbtvE84yUbHIHGPyFRd3JyNx4hiomak2Jpw8vpXm8+BJuZZLHR/uDye2nXCiejFcYF9zHMj1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0y49GGyYlDcvxUuZwXpUrz3APfQ5KpKctCSzcmJEG8=;
 b=sO0sICcwtStU2Ya0aOQYwVrhan63DWt4dj4RH5zQtPJZu3iOKdBb04OVdMskKYOv1v1jicn3/z7xlLK1G1W9JpmdwxD7J4XcCk4b+U/RYWE7DalgjmwwUziXxfQUt3w4PRjWsSVop9SleJj7AZcqXVDZwNt/vZ7L5hKBTUU5n3IOEVmAhm4L87jnhHBVkJW1HxfoDbPGAzWsDxVKW0dRH5Z8F5qfxSQ0XynD+DMZQs7r4yi5wxJvRG54pr0SZgsYZkleI8wSFage5qrGzXtEsK/fDGpbq6cKc1DrpdqaFhVlN6O/TwzdQVtx4fY49FDX4VRh2YUTMmCV0DcM786QSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6785.namprd11.prod.outlook.com (2603:10b6:303:20c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:06:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 16:06:20 +0000
Date: Tue, 2 Dec 2025 08:06:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v28 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aS8OeWtmbaP/gsL+@lstrano-desk.jf.intel.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
 <20251201235539.236686-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201235539.236686-10-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c15ddd-922d-49c2-42c7-08de31bcbb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eqy8FCAEy3OYqdd6CklFIrRLHNVqTdgvV5BTH2YJACAR2VZBD3CVhNFOjvlO?=
 =?us-ascii?Q?P1CoycZg8sf/vDE0jz7e4K6aZTVFQBMaIiGof0t3A/xOQv5pU4Swzv1BjXYB?=
 =?us-ascii?Q?9qJRObLPk1Nt06jLj5S9fa5B/Jt1PryB3YLFG/n/oZMb42f6r/Zmbsv0hjK7?=
 =?us-ascii?Q?64cRROPpCZkVvKm2id0sQb1URpPCvs1W2e2Udt76Pe+8zTO+S5aB69hUhr3/?=
 =?us-ascii?Q?G2n/WNfymrGMKFjKz7Wqu0zCuLRmpJQ2FXHTlOtlasL6UBduwYePoNlTVlWU?=
 =?us-ascii?Q?EP1DpvNDJ0w0fZZz0/Our/+n6slkZ+1wA+JYbmwvZTU9C1fedpEfRKc/Va6V?=
 =?us-ascii?Q?eeLgo6ilDX7Lc/UeVdX70TaIR/BGfTPAAC+Ex3OF1fEDGFZBFZ3tFbfapKSX?=
 =?us-ascii?Q?kxINIWeBjWcyKRA1MULtyCVg183MKRSPjGBJQOyJVVeZH262JVcQ0TE1N541?=
 =?us-ascii?Q?Gsjo3HfL0Ps0ykmSiz7Y8elHZ7g3RONX4K4GcfRHsvbkkO2EltxA/LxDu2oA?=
 =?us-ascii?Q?44oJo40AT8kvQdb9CHJyV53KpFClQ5Gx/c3Raf7mnbyQbLF10lt1VLYqsibR?=
 =?us-ascii?Q?bZY9nErUvmOuvLJ/f0Ewm+oq6BEeZKTvbztLCxspoNw4vFfHrQOYvR79VqKW?=
 =?us-ascii?Q?x1Hs66MBLGUypOAQDtJqHzBQVUHT56aqjpuyh1X+sSZIAN4Cojdbw6gMSUn6?=
 =?us-ascii?Q?RFHmMv/AxUW8xp5Dg+InqVghCFBCbxzC3YDFkjlwxCqIdYsrIdhOldKANSD5?=
 =?us-ascii?Q?HF+j80DahzfhaQNoUwYK3RJNFNhMu3Wzps4k2ZMpZQvnzl0TBKIDTqPuspRT?=
 =?us-ascii?Q?2ZTL77qL9DZPxhQksUdGU1MG5c0DCoCgTu56dWlEultyuFVMvGaDa/LT2KRZ?=
 =?us-ascii?Q?hBys9PNdTt6Hco3TS6iatO9ePJfdsh+9rwt9X55xQO4ouzHDQnSg6vltUTER?=
 =?us-ascii?Q?8bvG8y3+z2hxADLNvFMe1KsCgOSn6SY3Ov+eWs+lKSlmmZ4jsEwC6HYetZyH?=
 =?us-ascii?Q?eXSQVtlif3D0fSUxvbH5sKNySQwlQwtyjvRzLF3nfksINTQ+jAvqTclQvgnS?=
 =?us-ascii?Q?tyh25kggEYIGI5Oz+ew7dclnU/yxGk3t0Eo56pUzvuiQeTltOAw7lKEbWvCT?=
 =?us-ascii?Q?Z4szmUD53dbhZOMgNkDIwmcqz6wQhOftZj9XHk3XFLdTfSO0fx3sc9rsKh5K?=
 =?us-ascii?Q?vm0VZLZFJDrq07BD9ur5SezyQv3QeJ44EfjNBTH8G3ucEM71nMVhSyNV3U6f?=
 =?us-ascii?Q?fM5RuWUpCXXv3g7Nxr87ipZ5V2GXPbSa1FOiDQ0IF8oxloZvDMv1gDff5W6y?=
 =?us-ascii?Q?Pe58x7WJrgU7uaZ6jI1LkLztJFUrVlAT5g2y9sWtgwtLWtbqUEpSsThCW39g?=
 =?us-ascii?Q?wQZj4g+Twrt5yfn/KccVxpOL6dbrriZmXqLpMqsXDa0X0ZziZqBNmEvPLNem?=
 =?us-ascii?Q?XITHYL5DvOXAVvZxYAGTb0mAnirS/31e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sfSGMMwvW1162VrLL0pvnZsvL+ov/LmuL2Z3t9Y6aysTx3m7r0q+PSKLncAc?=
 =?us-ascii?Q?Jt6/EOXYCsPOTDUcI4IDgBR29ms3rUHZjQpOOCMrWJcaGASJEVjI6hortN0D?=
 =?us-ascii?Q?Uj2Tieoc0FV1qSA2CVY2JR4AGo3Xa/wx8M4bTqbXZVc5LPN1B0v1r9y0a3lx?=
 =?us-ascii?Q?JHZ9T7TIMXO5hi1AsOBg52esHRi7ZhL+rYBpwsjSrrHyHfezUrT42IYg6XFL?=
 =?us-ascii?Q?jC2EZGNaV99Cvm2QIJ8av1MchEg6spYywo2t9dHPVcEF7tfJLbgc+DIovs28?=
 =?us-ascii?Q?byYTpiZY7U7R9ySt6nDpmfVagfYelxd+Z/XJc5zU7UcnqmW+eCAt6SSgkj3B?=
 =?us-ascii?Q?lmaBwN7NwOYphVDTQttPNHMQIY2vHnFpz2SERJuR3lfeirGPOTm/zNys9jZc?=
 =?us-ascii?Q?tUIhjXCNf4WHJc3QSrJfhs5kAvfBwlEShfWuzXvxztK4a9KmIL/DuQ4ULKlt?=
 =?us-ascii?Q?A1xbMOxKjj4kw2T1Gp1Vx6EDwpxmysNU2DuEyV7yr6cnXNJOXRtFYaAIlHBV?=
 =?us-ascii?Q?6XLoIP5C3CuiGdS8kKnsfwEb/YVxV+gwncLRBwOAklEIFxm1I3o7svdUivlJ?=
 =?us-ascii?Q?R3ULNLcHC1R2FZo+6WMs1NraY2TMbR4LfZRMLTyx0lamfGG4hVFFPYe30upr?=
 =?us-ascii?Q?AarLwweySPhp0W4sct4iVSlpy6uIJRyykYJSxD2Pje6Z9/KW5QvbKfqsXwZC?=
 =?us-ascii?Q?lcrvmS8pdPneEGQK1yKIGVH3dU9KoWR0tDfwcKwr1dpn+WFkCiO27qOhl9SQ?=
 =?us-ascii?Q?K8aDi4LeY/adazuGtQCuqmL16fUpI7/CYwZKAdYq9EhjaB/YL3T25eVuzPP9?=
 =?us-ascii?Q?bJkjHylOaB/pvZUFKa6pO9UZwEd7XdY1UrQVNd0NNlPDSRE5n1BOa9Eyy/or?=
 =?us-ascii?Q?qactpH0zn+jH8F4k7aq58RAWv3pKvMqn8ZEF13MZWUGMHWqeG9pnhrTqpfab?=
 =?us-ascii?Q?n7HoLmTkC8gs3YQKqVOqVZdWQwU8nJv0fC3zn8KbSoakdArGSbhuu1EMg1w4?=
 =?us-ascii?Q?c7EJADydfB9/91g+NkJWWf/h0a3pKAiPdvPeS5/WmL8e1YoCKuiQdI1wDXJj?=
 =?us-ascii?Q?Di7VvgpAL/RD0DC+NBPonVVZRQWenSZ2H9QQkW9JYwcw34/GL/3kE8hH0eJB?=
 =?us-ascii?Q?vEa0WRZMwN+4yKlIZ87/N6fPtBtLmrhWpnHf8YK75f2WKZOkYrCdls+CZbGy?=
 =?us-ascii?Q?2h1RlRbfRV9MSdl5kOyuKcJ+R8Ur7cw9NjBwvAJsq0MMPNn1RDLmrMv79+in?=
 =?us-ascii?Q?UW5dWb0PUhahLdAuXVJI2hrTRwwCLy9Ta09qRKfP/P6Di9zuF63VkILc5t5/?=
 =?us-ascii?Q?2nBGj6vtGrcQUdYp9Q9zruKHbz2u+HDZhgGkEClws1d4LKc3jFk+l9fqfq/D?=
 =?us-ascii?Q?QGHWkol9NkaonULnGbz5/RKAN/Jzq5duvK1SmKJR/VUlBEQNAPxbFGr3Bas+?=
 =?us-ascii?Q?+f8kTVZdxPrkm4X9GoTDK0BeCcNp6KTpsXCzq4tFccBCSFBsvos1KrYWGduG?=
 =?us-ascii?Q?+zgEVeiZJl4b+ESXbUgiAcWUTyx3ezUxl4Ej+dqNAmgKu70V/pS49Vlz+OPg?=
 =?us-ascii?Q?0AIxAM4Y5RPnRJO4/O55FWhRfwznhNqWH0UXLPINPFvxKP4TFa2FyWyuZnGk?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c15ddd-922d-49c2-42c7-08de31bcbb69
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:06:20.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZIH+y04ze6ZVULqo5DK+s1clsRuxzmGF7yD4i4DtvELi1AYr5LXXJngavsb/rVvb/PSuR0tDhQC25JZfg94KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6785
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

On Mon, Dec 01, 2025 at 11:55:44PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> v12:
> - Use size_t instead of int (Raag)
> 
> v13:
> - Remove engine class and instance (Ivan)
> 
> v14:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
> 
> v15:
> - Remove unnecessary size assertion (jcavitt)
> 
> v16:
> - Nit fixes (Matt Brost)
> 
> v17:
> - Rebase and refactor (jcavitt)
> 
> v18:
> - Do not copy_to_user in critical section (Matt Brost)
> - Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
>   Brost)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 119 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   3 +
>  3 files changed, 124 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..69baf01f008a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dc6c36191274..ccc0aa3afe58 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3850,6 +3850,125 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err;
>  }
>  
> +/*
> + * Map access type, fault type, and fault level from current bspec
> + * specification to user spec abstraction.  The current mapping is
> + * 1-to-1, but if there is ever a hardware change, we will need
> + * this abstraction layer to maintain API stability through the
> + * hardware change.
> + */
> +static u8 xe_to_user_access_type(u8 access_type)
> +{
> +	return access_type;
> +}
> +
> +static u8 xe_to_user_fault_type(u8 fault_type)
> +{
> +	return fault_type;
> +}
> +
> +static u8 xe_to_user_fault_level(u8 fault_level)
> +{
> +	return fault_level;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault *fault_list, fault_entry;
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	fault_list = kcalloc(count, sizeof(struct xe_vm_fault), GFP_KERNEL);
> +	if (!fault_list)
> +		return -ENOMEM;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i == count)
> +			break;
> +
> +		memset(&fault_entry, 0, entry_size);

This memset only needs to happen once, right?

So maybe when declaring 'fault_entry', do this: 'fault_entry = {};'.

Otherwise LGTM.

Matt

> +
> +		fault_entry.address = entry->address;
> +		fault_entry.address_precision = entry->address_precision;
> +
> +		fault_entry.access_type = xe_to_user_access_type(entry->access_type);
> +		fault_entry.fault_type = xe_to_user_fault_type(entry->fault_type);
> +		fault_entry.fault_level = xe_to_user_fault_level(entry->fault_level);
> +
> +		memcpy(&fault_list[i], &fault_entry, entry_size);
> +
> +		i++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	ret = copy_to_user(usr_ptr, fault_list, args->size);
> +
> +	kfree(fault_list);
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (!args->size) {
> +			args->size = size;
> +			return 0;
> +		}
> +
> +		/*
> +		 * Number of faults may increase between calls to
> +		 * xe_vm_get_property_ioctl, so just report the number of
> +		 * faults the user requests if it's less than or equal to
> +		 * the number of faults in the VM fault array.
> +		 *
> +		 * We should also at least assert that the args->size value
> +		 * is a multiple of the xe_vm_fault struct size.
> +		 */
> +		if (args->size > size || args->size % sizeof(struct xe_vm_fault))
> +			return -EINVAL;
> +
> +		return fill_faults(vm, args);
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
> +			     args->reserved[2]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index e9f2de4189e0..f2675ec9e8c4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -210,6 +210,9 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
>  int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
> +
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> -- 
> 2.43.0
> 
