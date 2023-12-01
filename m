Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F048080027B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 05:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B5410E7D7;
	Fri,  1 Dec 2023 04:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FBF10E7B5;
 Fri,  1 Dec 2023 04:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701404549; x=1732940549;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cHkzQeaOnlmkZzH5U7WcuRUYjSIYaibQWV3HsvMmsJ8=;
 b=aoGOHC4pvvOIs9YOYHHNknpxDc+Ni/vWmkDtVlHuBmkwfZbYJ8ZgeOCi
 KrTM20I4bJoGZpB8gsfw3BT3gFqpqt2I1MmpG/bjxrfjPAjrMzdVZQNiJ
 5sngu5Krlt5m1tNeNPCaLOG8/4FIWT/wA661fCQcy2Nx2tV9jXNddN6dm
 YBE0x+O2ejxI4Vy8dxJMcMuXlWzQwodGYZv+CTnuN/toZAyAaqpcKngP/
 mOPy35lzZ8H+/KEuJ6vRVVXdqHkgCGJlFQOM7nZtbDlNltVs+r2NNOtHu
 f+Qg7gFXclQ6mqD5ZUr94JtHTCNi7Uzjl9H/eWOvnMUSqLdObky6Tt6WY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12145961"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="12145961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 20:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860435316"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="860435316"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 20:22:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 20:22:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPSJPzRbqAjP0aL1diGyU9Ul1UoC5SsSPzpRBjnZwHiTc54EUb0R6N5NFiUdNCpJJh9c1J4ECVsgng8xz3HvaCc2hzkhuUO2+wszItn04wWskEULAclmQBUmnyixsjRl0RVF5RTuEA/IHICWKzZ67htn7Qroh+WvmHnSuiUlRu+mJaLHzKK3IqO43x/uxsLuXTB06VtpgdAD8x3mb6iI+0Jc9HAfflJxA0Vd4FHEVmsZ9bj1fquxq04LR9Q/dwVr2jVwx9CDoeVbZjOCW73cHc3Ov482LcNORkTXR5cVR/pnRq2lGfJ0yABfUkUU4bEtq4gEBTC7PHLSM1QV2V5zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=focBauCbMLUNND3EDLB/WcEoGWtNtf1cSg1NFk6sbhE=;
 b=dYSiYoRyaeavjC8/jvrsSZRludLsIox4ilkyoX0d+OAq1aoYEmU1eYjjGgvnZ3u94UUwqN71v/FQh7yU9NFH5dqUFu1dAdEw4wEd1O8M5zYvsh9ySHFEDO7uITQOOi9oZXsVIkcMXkCiOAE6ArteldFjOsZ9ndClt0PdSh7oGVVocCHbklwTcXNd+nIzBwineLwBrPCXNcAprulw0RovsJS9Br37jvH3R9tMKmIGvizc+A0RCEdIkzTP6InDkFAyf4EsnnbVKJEfKB0HarhSrjumJO2P45swx6lit/CO6zyeWFeDje4yx+I7iQqqXZuRQgNDCaq4+W3lrMhSuQ+2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 04:22:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 04:22:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>, <christian.koenig@amd.com>,
 <lina@asahilina.net>, <dakr@redhat.com>, <boris.brezillon@collabora.com>,
 <bagasdotme@gmail.com>, <alexdeucher@gmail.com>
Subject: [PATCH 0/5] Update xe.rst RFC doc
Date: Thu, 30 Nov 2023 23:21:50 -0500
Message-ID: <20231201042158.80009-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be5de9e-375d-43b2-e733-08dbf22514f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XcIWrmgbd0M1i+RICzYY3eBemTIUpPmkkiCI11jw+UaAuUBb4ltXVyBWgOvAHf+bGuaujs7YoCDfZA9L76//tNzLmdapzfAbwhZiPK3qpYSiNxlPczoLOFzgcrux83Lbw7XcfwjyzCWezew0soQ2e35+WMLYYunXMOLBGHwcwNfVtnlxnGgKJmN4C3SIpW4K+OpFbEBRmBgEAaYNaRHEEq/2hiMvd7reJz/gw69/JJk+YY524pBfvxVKU8xNznu1v5nWGc6onQMcIB5LfF7I4GCPKNP1ASqLj8k+tLmunQ5gAqdqkZB4YOwcS3jtvxE8PdgLUOprgs/CpSvEaviX0ycQp7JF5OyOZJOLsTuNjGI0nN27LzP7ISBFsW/+MLHZftyOjtDz3hH+2+mmIzbIzMuM9ub5Cr0sa+v9cGzCyBzSPa1uE5hfztf3W05khWgT94/DSJvJ4YDeBDh33VHUc3MfBPuOEidFYv/HYAsL4Ib3LoCKzzb7sSUfdGb0fg88zZpwQ4foz1pdo4piMhB3nUuFfFyNw4c8UhFkie5pFUBS+QTGdj1qm/VMgbvaIZxmwz1p3JPDXUmilgHHVgB2rhBZ/xyc2P0duZK2uL4Bp9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6512007)(6506007)(1076003)(107886003)(44832011)(6666004)(2616005)(83380400001)(478600001)(4326008)(41300700001)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(15650500001)(316002)(66556008)(66476007)(66946007)(36756003)(38100700002)(82960400001)(86362001)(921008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H14gL5d87zM8+pp47hp/LgSYCrc46lk3oD0soeCFqbkG8EgGqNUQul3Fswan?=
 =?us-ascii?Q?JCe0D7CXvCJ41E0pwRezVFVBDsjAE8PaAGA5Sg+JQFUE7c1xSI/jyyMGw29M?=
 =?us-ascii?Q?dyEKyhwU/xwOgL1ks2goIjSZf2g2SBkBISsoO/VnFWI2tTB1QawkYWWSXPun?=
 =?us-ascii?Q?6fXeg5kQ/sR1hDbj1S0jZmSh9rDR6cpMWxuHJWKqR4YG481YrpJpQXZcSCHj?=
 =?us-ascii?Q?utyeoCyOKyAgNGU15xJXDeKksp0knDZUoWS5Yw6lfOh1TBgpfpoAEmS6Tez2?=
 =?us-ascii?Q?eWvBhE253QA6+FYiXBXgxyiSO5um7+kCoyn0LWW2TWrH8uPF0Da/bFlEjc5Z?=
 =?us-ascii?Q?RKG8WYLF23BI8v3oA7ql5SQXEMFxRK3EhgVdcCnYB80WsvJgJ/X48FECh/iF?=
 =?us-ascii?Q?fP4s5UztLdqTS+3zdQIg536XVOSsBnwVjvBRFIcRUmlsJ7kNjAVMV5GBeQxX?=
 =?us-ascii?Q?nAnqetDQR3wwWo9pQBoCkmKRcO5Eyub/i9Ku3qSJYciOYNR8roc/mbOxwOiF?=
 =?us-ascii?Q?hfCnDEl0yA9MqF6yT7F/yAMkY04gIVxsXYw441npoyt3TqIzgEtIklA1ts9b?=
 =?us-ascii?Q?IX6bgjr4xHCLuMnstLY65bROOAoezWrZgiGfUTLkpKcNZCF8eME2XLXJ9x+W?=
 =?us-ascii?Q?sfKjGtbIuSUjkht0etlc47xJVm2TqPPwHG6TZLiWq+nZN+xfSDE9FXRMAzN3?=
 =?us-ascii?Q?ztyyhMJ19SunKLou1CqGgiK9eLqgZQSUZBOfRQrxLwonR4GcH2aBAcf2rMdu?=
 =?us-ascii?Q?1mJ2mC7/AySA2kUEgSGM0ir/V0sthUSxgeIqobZumfrFU/iKNv1bUOf6oqNE?=
 =?us-ascii?Q?EyOOKdPv8S5wfGb5fi8NkM5zBB06rkNLPOhVYrASnDhcgYa6SXnAZyNA0kLZ?=
 =?us-ascii?Q?7EHtOJhhnDMDygPgWG9MAKfDjj5LbOmvKFNcZ1zggTxpgGkjO2Uh0OugO6/Q?=
 =?us-ascii?Q?G15o4K7YM/D2j9WfRFiKngydh/LFmXZugKKgEtEJo6qBQzJTtppCtVVc4sHh?=
 =?us-ascii?Q?Gz9m434FRXCpU+hF7TFqApfoPh+CqRfHFVUyU0NKbdLmI8zRUp9dWO/Uq6hy?=
 =?us-ascii?Q?5b892oB/4+2UuMrvLp/78IIAmydci7rgWg1iusjwPCq71kOkLkGNHbr7K9s3?=
 =?us-ascii?Q?wfo5m+5rUvX+U6ugjoHjX6pDHY2FeIU9cvoU6xpWYRpcZCANR8u6snx91QZ2?=
 =?us-ascii?Q?eS91qoXVv/WSJEg32OiLHGSnVVKdOzPQfeLS2lhlISB0UP96YszVnDvJTE5p?=
 =?us-ascii?Q?mFHsQWTI0HFURoqIeEpkPnwAoCwX6LpZYQvcgn9AOOGSmXGP+H6t6k+oZabt?=
 =?us-ascii?Q?MelYzk5iJqqFGLAHv630OHDJcnqkab3Ju4pm5OpYi5GJWovAj/2zME5pqC6B?=
 =?us-ascii?Q?ybpM4aQOzta2dLIRM+nJ9Pa0bQBzIYbTT61TarjsEXeWIF939h6ZBUObpWF+?=
 =?us-ascii?Q?Xq256kLg0zByb7Y96EY2lV+JptL0ttxssamCB0Jpp7VNs+1huZwhy3Xpcl3K?=
 =?us-ascii?Q?koyp7KRTh02/i0cBvuTA4NA6u1TZjJrr+Ko3m7Xwjt6ZJjgxlpVoKGVodwc3?=
 =?us-ascii?Q?jowtY6Q7G+hIua0ifuwywp3JJzlXnowWXP2aLQqF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be5de9e-375d-43b2-e733-08dbf22514f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 04:22:08.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrYrGZXNWCwDuHjtzBK4a7euDjrt6vU1Hk/vLJaio9lcOqMbNU9MORX351Uw1h6ohU8gUxLtO5ovhQvWc4lyQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's move more items from the 'WIP' section to the 'Completed' one.

When Xe was an initial experiment we had written down our goals and
promises in this RFC with the goal to work with and contribute back
to key common DRM items such as drm_scheduler, gpuvm, drm_exec, and
establish documentations and community consensus around other new items
like vm_bind async usage and its interaction with userptr and locking
primitives and rules, as well as long-running workloads with
drm_scheduler, etc. As well as other plans like devcoredump and i915
display re-usage.

We are so thankful for this great community and the great discussions,
reviews and cross contributions we got so far on this journey. Thank you
all.

Most of this checklist is already completed. We're finalizing some last
minute cleanups on the uAPI and will be sharing the first pull request
shortly.

Meanwhile, the Display team is also working to finalize the few remaining
patches to have a clean re-usage of i915 display. Please notice that this
is actually a formal item in this xe.rst RFC, but also it is a
non-blocking one.

Hopefully we will be able to align the Display for a common pull request.
But with the possibility of 2 separate pull requests, one right after the other.

We're looking forward to moving our work on Xe to the mainline and continuing
to evolve drm together towards a better future.

Matthew Brost (1):
  drm/doc/rfc: Mark long running workload as complete.

Rodrigo Vivi (4):
  drm/doc/rfc: Mark drm_scheduler as completed
  drm/doc/rfc: Move Xe 'ASYNC VM_BIND' to the 'completed' section
  drm/doc/rfc: Move userptr integration and vm_bind to the 'completed'
    section
  drm/doc/rfc: Xe is using drm_exec, so mark as completed

 Documentation/gpu/rfc/xe.rst | 127 +++++++++++++++++------------------
 1 file changed, 62 insertions(+), 65 deletions(-)

-- 
2.43.0

