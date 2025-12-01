Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E671C98D3E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD53310E464;
	Mon,  1 Dec 2025 19:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P72lCxxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDFE10E460;
 Mon,  1 Dec 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764616699; x=1796152699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QQollfai8D6Iu2MCBYkQMqiA30f5SuxCZ3sXLuMlGvs=;
 b=P72lCxxwZL4/dJ/SgOBPV5dTja4bdpsaAJdxHP+qgxq03fPqbWS62y/d
 XMeSCBdTGqKboQOOM8IV572lKk+79qLDw0XJOvbAPGq1Pob/uqYD1Wu4A
 wd3MhydSjMznB2edmwBzv9di9bPct1oaZbkophjnojpv8oPdb6bKCtUV/
 pI3PxyFCYZ/Tr8vslyTdBkIwsM/Sk6pfrUkDmZTDVxBiyFPc7xEI/00Ni
 TaBgoN8QUIWJ1GXFFxNnOYYHg+v2/do1RmaZ/q5Q66PspEsX2dQZhGmQ4
 hq1czW0fY70G7FjK/Km9H/eE2SkpS8YVGODFLqAtpNkQ+1A9SURZmhdGq g==;
X-CSE-ConnectionGUID: Wi+6z57bR/6FAU2QpkXtyA==
X-CSE-MsgGUID: S0TDlbGeRBOZ7dhYOCstKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92045664"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="92045664"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:18:19 -0800
X-CSE-ConnectionGUID: JmNhrq7ATjWG62OMoMy8GA==
X-CSE-MsgGUID: mWpUA1lESi63NttJx0YENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194586106"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:18:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:18:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 11:18:18 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:18:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXkK5C2tWhl8fhY64TGliEAoP4feJTx0JY1U8z8OEKr6WoM8ajiiYsa0/JFuC8PZYzwuIqFqLLDvG5t2Tye1kkYisI7zbLc13+B+mo8NWfR7O+H11W9O4H77vPnOTfbMwxiujcWPiK1+HX7ADAIdhtVhR25FBj/FEPYSZPpNktx8t5PnO1JOjjY6HcZyfMflPpiHjexw7LP/zo9QNGnbu9CxNQOIr7/4rOG/0tYpbCTwazLNvv55WI3C+7vPNxHMA5ZcLmBhgOMbF59i1ZU1rpvfnrb6n08TBCs0CgZC0D1wewaYeNzkdcfMgEfIMbcFUpOr9PVWZriuoE3bW4d5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtC3phycgBLxmlsxPyj5XY6YkYZQd5DTz1kD5WvSERM=;
 b=Tw1lFYteYRY9yTp1zIB/jB2cpHZRjArXbUiQk56iqIUTgxYZPrakDZR8NhDE3KF1pWUom8avxPzyZCHsjmZ/wHCRVi82B+8qd91o1e3jq9CKtpdfX+ceT2EqSA0BMkyA7/Khav5zFICADTAVtHk8RAhfxOe4BqlkxcY4LLLIJtXPuatuwN51t5sgqqOpTNx7sLV01DnlWkDsuXTNDu0n1kg8SHxi3GSvpfocKT0DK3w9xdP2Yj1awy5jvwIdm0mui2lxvmIOGfLGrVUzpCjBAUk561uIvqpmQA+JhKX3DQQBfDnz01XMTdUEBogQhi/+a7ymeomr/3OY5Zuuet3ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:18:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:18:15 +0000
Date: Mon, 1 Dec 2025 11:18:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Message-ID: <aS3p9Cwhwu8tWFNb@lstrano-desk.jf.intel.com>
References: <20251201174443.139151-6-jonathan.cavitt@intel.com>
 <20251201174443.139151-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201174443.139151-9-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c6dbc7-5e3a-43bb-f8c0-08de310e6099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sAxBbPDyTtwu8MmNzTGGtzD/BdyN7OKBgj14e5OFQHUZevmZSDNkpDeh0Vvx?=
 =?us-ascii?Q?JfHmDUVZO4p2S6aHNjUq5glmjUamPE0SgFcBWqlbN16N0G6d5Mh3z5lviadN?=
 =?us-ascii?Q?n6HUOnyLBP9BtKq5VgQ2jWHqUrgCnw8RkZePJsFg/pHTYFG8Yu+ArQVDH8qM?=
 =?us-ascii?Q?XXVQimpqt5yiOj+05NgqWOiWpzQ/ThF/YgkvbKyOb1R/YCCqF7O/yTYUeAIv?=
 =?us-ascii?Q?TzpNBfcKvUU3wjFZRtUuaTsPzRRflJvBk4N8PIuTK8567lOEoTcAtFjkpOpN?=
 =?us-ascii?Q?bnsyBx5kyjh6Ps+Qhb90ZCV+Vr0cyPFwwv0HFmlwtunPj1MOewipOxTFGnja?=
 =?us-ascii?Q?+2obHEQPwKWBKxfWEGHb7rSDeq33DvLYu4H1a2ANrcUhC4ivr4YsSNJ4Ncvq?=
 =?us-ascii?Q?D3WyPI5FTLXAacKfXftC7RLLujy3R05YLJyagF3jkpyH4JDUDxQz2u4AwM9/?=
 =?us-ascii?Q?m7566O/KxwTQgQmPQC9Zu9B7OEgHlNg3wt6tebhFYT25GFPZbdm6wJjP2pVd?=
 =?us-ascii?Q?/tJbKemdBUGBkDWs/0QxYLxFRhGLWM6n2MRJJEdHwTtV47yFqBhdp/OMCKhm?=
 =?us-ascii?Q?7/ON9HZnmDewQ61d0fcJMMkln2ve53ZsuDML2QQGTvQttEP/j+p9fin0ulAl?=
 =?us-ascii?Q?kqaiUu5bYN/no0wT8pVK3ejfA3AeL8CKFkDVQCKX3WQfpCSgLAd2xiY7naEC?=
 =?us-ascii?Q?gi6+WYpfJjC0SAYq9/9Fx7YQ+mwAVVIrBbC8sodwRj8n61o2dIlWserQCItR?=
 =?us-ascii?Q?+Ltq0UxDyeqJL0/BIRE9r2gmu+j6qGyI+COLdcZ5dPI85Rj6968HwsKJjgFH?=
 =?us-ascii?Q?rxpXyIJGGMoecaQUszUav5FYaxy1dCegUIwykt69oG3n22w7Rb0KZIl17tHD?=
 =?us-ascii?Q?JhCbm1bmVdTdPIBNHZZZIjcjn18+JrMvK293rfYqoFszM2rVnoNY5MOYFIez?=
 =?us-ascii?Q?RX/iS3VwgjpbNMa7F3prEY+RvluEgHw6/AdKab/njQAe8f52sJ6jYlgwAdX8?=
 =?us-ascii?Q?EHceh0fpX1H5/b0Q6K0MYb1WylB0T9X+UUt30PmzpNl+3fVwVPIuOcRKv2H7?=
 =?us-ascii?Q?cRzEuPun5PUrJrCaJzyxeT4YR3NmPoNbBpKpM2Lx2sALk/vC36G3mICA2knw?=
 =?us-ascii?Q?sPq/A08ZFzvKY5d43bT61qrlDY0tUO2w/bO0+UE76xAbu0WR/fa1hEM8eaqq?=
 =?us-ascii?Q?eXuKZyXg8bw0EecKdnZ+G/UFGMB+XUdg6eA+UHAjJP56oBHLVR9G+lU0kYw4?=
 =?us-ascii?Q?qAYgMcjIs/Ibx6uTcJFaPnTHCdZQkLEJgPw7wM7QSY7WOCpeXzm/PRe2FSqA?=
 =?us-ascii?Q?rL0EcAnxW3+PCtzOpjWJv7r//byfaqSERI9oq1+9NK0ojeA0yWrBU3P/pz7Y?=
 =?us-ascii?Q?ruJF0tI8M1SgyjQXh9a2irkScyygK5lRov8hBhlT9W4BtMzo9WnHRchqxJT8?=
 =?us-ascii?Q?r/aVY7HN/7ntVdcbwhR1I9A0pv426WDT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0f2M2OcxSGooOm/7JpdE9tv/uQI3vW7fi6f+0GG+vTTLR169HUlc54+80kdC?=
 =?us-ascii?Q?FTnncSUC9UXOAm5CqLCPQ2eOUF+1YphumRmZsbIYFjmhy4Z+RL+0uyABx9DY?=
 =?us-ascii?Q?H0Nqo6S9HHrCDv7UoxhnXGGjMWn/aWfQW79Mag6HxWsggEBKL+Wx38pXHnSH?=
 =?us-ascii?Q?99kjB+wqeFrJW2WJ5UG9pKKDkNgoTkgBxfSq1Ri5e+W+y/b7vjUBQYniMxhe?=
 =?us-ascii?Q?Zsg/ca8/Wxr6p1hRVB9PBOhSL47Qq9m38GiaVe+KjLCyqqB6jIs6hMRNZmZG?=
 =?us-ascii?Q?N1Bdzzp65YbMhZizPj7wibfJ3w4WGEj7Vp3qt41SJfxVx1db+/lyix4uDKlY?=
 =?us-ascii?Q?wzd5IW9yhFOWh/K2rJcbu3FX58jA4RXaHLg0ntL1CZRWuVHkwGR4pd4cyCZt?=
 =?us-ascii?Q?4Bhn7dOa4BqmoY73dcJpFLnjwYJFykkO5F8tz9cc7+HY4siz0/O2LY7urnP9?=
 =?us-ascii?Q?ZmXZ5pFmnudJL1LEnL0j/GlF8/9OTI4AmTunUwordqf440Dj+H3+w3EVRnfe?=
 =?us-ascii?Q?RMRMuU6tL1cRCschE7tNMfWJl6kj0ztY6XrMKtRKKIgzqzJ/xPcONV0VHMVf?=
 =?us-ascii?Q?k0idG749RK7K0M7F3YeD1JJiH914Bvbu1JpiaelvWHksbdYq6vbWkyBxEFOq?=
 =?us-ascii?Q?PIeKRyBoTcf4jQaJPbXQnDc1Zy0ZzlWCY0ktSvaUKH/XBYGkTLw+divS4lhB?=
 =?us-ascii?Q?MOF8flzNQEeoBWtqX+H0RbYJ691Flr9taABk60Ci9jk9oRTIg5JIZDu0dszC?=
 =?us-ascii?Q?a2VqhZXJbjN3Cg4oxq5CWYYjkQAnQEr5bn8zZS0Sn8W/kfNMkLYpi1IIS9SF?=
 =?us-ascii?Q?nzOHpkrqAJWSYm9fPyfRP8tDOwXTptFsU31WFWz7zfHbvs/9PS8JKygVDvVS?=
 =?us-ascii?Q?SQKxUukIDMFn6ZBzjWkx7EsLxezPEEj7Y1he+RGrzQpZIHFTP/GLkUPFgL30?=
 =?us-ascii?Q?oZdAl1Qrsq/YqpSP/gufuBu1aAGVWRz+/sw58zlpxP3LZ8lPiMZWom/eZh14?=
 =?us-ascii?Q?d5M9/iOH8AlT2aluh90B5imInjYu72HX7cCBOE18qaefR9CIaSlPKwpfPUwo?=
 =?us-ascii?Q?oZMBSyo2botajYwGSkhe+0W7FNzbreRCbMIumKUqthj4LntHw/WW++jCed73?=
 =?us-ascii?Q?8EKQWnzWqo4XatpjL0HbLyX2FA9kWG06fYE/j0alN/Q+w3SCafZtk0poH+yQ?=
 =?us-ascii?Q?8voXq3KSsDhut814EVrBcTFzSS3yuHVRWfUMAPK+hbV9q2vdePRwmzXDlygh?=
 =?us-ascii?Q?J9+GzCQOeSkeLNqZTfnNkjjYOg/d34LSbeN5aIkohpqWeYhj8BhjI16cuPFL?=
 =?us-ascii?Q?2L/EUPvnlxAaqpds9Uwso0UBbEy4RcvfFVZyolWoMsDjtCdKu77lJ+tNyQPx?=
 =?us-ascii?Q?YKmA6lxTe1ix76bgeM33U3jl3H6e+tcaUSvi8xc0QDomS8k38+p8iWaGOgLu?=
 =?us-ascii?Q?qIkHn49nBLk7OF1IP0xWirVZw3Y+XuUTHApzQZfxKcHFl7RWYcnm3CMrQ+q+?=
 =?us-ascii?Q?uW0G8PBEJZ7ttTTm/oy0CQ3YI5WyZ7JXZ66PT6rPPv/MAn7hGozZYP9nQcsi?=
 =?us-ascii?Q?2SmhYqKClkL1m9NirD648YK4BNF9MZhud7gR+nctv5h+EWGzxIOf5vylZ3TA?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c6dbc7-5e3a-43bb-f8c0-08de310e6099
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:18:15.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrXGczD3wF7TLRd94m17OxqNTbQGv7DGFaWwZxcyN/rejOJf0AWQhp52FJJxharsk0T3C0cdPBoZPe6WxMDULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
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

On Mon, Dec 01, 2025 at 05:44:47PM +0000, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
> 
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
> 
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> 
> v3:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> 
> v4:
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Add and fix kernel docs (Michal W)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> 
> v5:
> - Store fault and access type instead of address type (Jianxun)
> 
> v6:
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> 
> v7:
> - Fix kernel docs and comments (Michal W)
> 
> v8:
> - Fix double-locking issue (Jianxun)
> 
> v9:
> - Do not report faults from reserved engines (Jianxun)
> 
> v10:
> - Remove engine class and instance (Ivan)
> 
> v11:
> - Perform kzalloc outside of lock (Auld)
> 
> v12:
> - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> 
> v13:
> - Rebase and refactor (jcavitt)
> 
> v14:
> - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mzorek <michal.mzorek@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 26 +++++++++
>  drivers/gpu/drm/xe/xe_vm.c        | 88 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h        |  9 ++++
>  drivers/gpu/drm/xe/xe_vm_types.h  | 29 ++++++++++
>  4 files changed, 152 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 0b625a52a598..5997023a5889 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		  pf->consumer.engine_instance);
>  }
>  
> +static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagefault *pf)

Every function in xe_pagefault.c starts with 'xe_pagefault_'

So maybe: s/save_pagefault_to_vm/xe_pagefault_save_to_vm

> +{
> +	struct xe_vm *vm;
> +
> +	/*
> +	 * Pagefault may be asociated to VM that is not in fault mode.
> +	 * Perform asid_to_vm behavior, except if VM is not in fault
> +	 * mode, return VM anyways.
> +	 */
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	if (IS_ERR(vm))
> +		return;
> +
> +	xe_vm_add_fault_entry_pf(vm, pf);
> +
> +	xe_vm_put(vm);
> +}
> +
>  static void xe_pagefault_queue_work(struct work_struct *w)
>  {
>  	struct xe_pagefault_queue *pf_queue =
> @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
>  			xe_pagefault_print(&pf);
> +			save_pagefault_to_vm(gt_to_xe(pf.gt), &pf);
>  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
>  				  ERR_PTR(err));
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8ab726289583..e69e10233b00 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,6 +27,7 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -578,6 +579,88 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	trace_xe_vm_rebind_worker_exit(vm);
>  }
>  
> +static struct xe_hw_engine *
> +hw_engine_lookup_class_instance(struct xe_vm *vm,
> +				enum xe_engine_class class,
> +				u16 instance)

Can we use xe_hw_engine_lookup or xe_gt_hw_engine rather than adding a
new helper?

> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id)
> +		for_each_hw_engine(hwe, gt, id)
> +			if (hwe->class == class && hwe->instance == instance)
> +				return hwe;
> +	return NULL;
> +}
> +
> +/**
> + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> + * @vm: The VM.
> + * @pf: The pagefault.
> + *
> + * This function takes the data from the pagefault @pf and saves it to @vm->faults.list.
> + *
> + * The function exits silently if the list is full, and reports a warning if the pagefault
> + * could not be saved to the list.
> + */
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
> +{
> +	struct xe_vm_fault_entry *e = NULL;
> +	struct xe_hw_engine *hwe;
> +
> +	/* Do not report faults on reserved engines */
> +	hwe = hw_engine_lookup_class_instance(vm, pf->consumer.engine_class,
> +					      pf->consumer.engine_instance);
> +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> +		return;
> +
> +	e = kzalloc(sizeof(*e), GFP_KERNEL);
> +	if (!e) {
> +		drm_warn(&vm->xe->drm,
> +			 "Could not allocate memory for fault!\n");
> +		return;
> +	}
> +
> +	spin_lock(&vm->faults.lock);
> +

Michal would say use guard(spinlock)(&vm->faults.lock) here. Probably
a little cleaner as the goto can be avoided.

> +	/*
> +	 * Limit the number of faults in the fault list to prevent
> +	 * memory overuse.
> +	 */
> +	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM) {
> +		kfree(e);
> +		goto out;
> +	}
> +
> +	e->address = pf->consumer.page_addr;
> +	e->address_precision = 1;
> +	e->access_type = pf->consumer.access_type;
> +	e->fault_type = pf->consumer.fault_type;
> +	e->fault_level = pf->consumer.fault_level;
> +
> +	list_add_tail(&e->list, &vm->faults.list);
> +	vm->faults.len++;
> +out:
> +	spin_unlock(&vm->faults.lock);
> +}
> +
> +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> +{
> +	struct xe_vm_fault_entry *e, *tmp;
> +
> +	spin_lock(&vm->faults.lock);

Probably a guard here too.

Nits aside, overall LGTM.

Matt

> +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> +		list_del(&e->list);
> +		kfree(e);
> +	}
> +	vm->faults.len = 0;
> +	spin_unlock(&vm->faults.lock);
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  {
>  	int i;
> @@ -1503,6 +1586,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  	INIT_LIST_HEAD(&vm->userptr.invalidated);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
> +	INIT_LIST_HEAD(&vm->faults.list);
> +	spin_lock_init(&vm->faults.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> @@ -1808,6 +1894,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>  
> +	xe_vm_clear_fault_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 361f10b3c453..e9f2de4189e0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,12 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>  
> +/**
> + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can store before future
> + * faults are discarded to prevent memory overuse
> + */
> +#define MAX_FAULTS_SAVED_PER_VM	50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -22,6 +28,7 @@ struct dma_fence;
>  
>  struct xe_exec_queue;
>  struct xe_file;
> +struct xe_pagefault;
>  struct xe_sync_entry;
>  struct xe_svm_range;
>  struct drm_exec;
> @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>  
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf);
> +
>  /**
>   * xe_vm_set_validating() - Register this task as currently making bos resident
>   * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3bf912bfbdcc..fff914fb0aa6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -20,6 +20,7 @@
>  #include "xe_userptr.h"
>  
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_svm_range;
>  struct xe_sync_entry;
>  struct xe_user_fence;
> @@ -165,6 +166,24 @@ struct xe_userptr_vma {
>  
>  struct xe_device;
>  
> +/**
> + * struct xe_vm_fault_entry - Elements of vm->faults.list
> + * @list: link into @xe_vm.faults.list
> + * @address: address of the fault
> + * @address_precision: precision of faulted address
> + * @access_type: type of address access that resulted in fault
> + * @fault_type: type of fault reported
> + * @fault_level: fault level of the fault
> + */
> +struct xe_vm_fault_entry {
> +	struct list_head list;
> +	u64 address;
> +	u32 address_precision;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -302,6 +321,16 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>  
> +	/** @faults: List of all faults associated with this VM */
> +	struct {
> +		/** @faults.lock: lock protecting @faults.list */
> +		spinlock_t lock;
> +		/** @faults.list: list of xe_vm_fault_entry entries */
> +		struct list_head list;
> +		/** @faults.len: length of @faults.list */
> +		unsigned int len;
> +	} faults;
> +
>  	/**
>  	 * @validation: Validation data only valid with the vm resv held.
>  	 * Note: This is really task state of the task holding the vm resv,
> -- 
> 2.43.0
> 
