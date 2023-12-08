Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15C80ADD1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D2510EB39;
	Fri,  8 Dec 2023 20:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B36310EB24;
 Fri,  8 Dec 2023 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067283; x=1733603283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xPE88XMR18cBAWwksVzY4av2NPZOQ8vhfqBb4/paogQ=;
 b=gtXBG0/Opnjcn4jCrjD5euoUyenqpgxCZ1ZKJkmYzo6FdEeLT7jYhXII
 l97o+MZ5l+n+x5t29dvoy/4jY3ZA6ejAEtiw5n1Jv+TyXGW1ksRj535l8
 XB8Q3rmPTISTnIDjsSq6v79V2WeY2YD+fh/49YpNtHsY+XZOlQoKuwNaW
 cdL8vCcanC7Hh0xNK2/BYzMFvMQmZibrnGLYkM2SpOj57N6H9fkUBWTyZ
 WRctToG56DhtTMsTOUi0zfZ6W5kEFeFsCNXTLGiKA7VmjRjisCM5ThMzk
 S2B/XmhpHAw1dowNPjyr+mRXPgAHw2gJWGjn9CPfdP3YQ7P1YaarKxfEL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="398324720"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="398324720"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="895657496"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="895657496"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:28:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:28:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFbAQvd4Y/mx+tLPQsbrBlLyunmvzfQZS+bxjHC+oMjn2M8AJQX4AXymflD4tSv4rqRnjdXFc5I1TzME+C8bzjg6j6lEBTeOJ5gDCAbdzrPtwsNp9onA8l9lOMzXfhCuR+vk6PwccJqUO9ARdQiMfilG9YI+sbn3Txmjlo0hD48vJq1ceYbMDDTqT6grQbPidF0KyAOBsnTN9fgzkmgk41hZq1jUCJ9zsFVgR9ycAJKxdhMHD93WFli/WlFu5cJ7yGEJ+xKEQMA8s/juHK7bhSI9Yu1H/D5gDEgMV5TZRGI5JUJhqSllvd0apasA7xV55CmsvZmUO7ZDIq6rnZjQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSiPIcHQzio4p+2WeTEfmN0qPCRIK2kt4LTYj2qxBKw=;
 b=IgUhm+KH8cEsnq44b3F4cU785d2bsPAGkxAM1VR7a7f0iNOVjbHA1xc1dbuKNKC2Oi8Kqm2iEHG4vvPr/AoTvERzT/7y+UVpgPTdUCP2n2WJI9mtGhNFOxOT7mm6fyrtiSj/7CbGfCVaEUzdu6qw2sZKydIMIqFbss3zZEQ5UkVDq1XdyWGpS3WlxGp7JXjlOcdzo9c3xEvApWsabL7B+jo+iLJ8vTNHrsCyb8khHdMOw9itxnObJBCMo7I5nv0STuyhYPcyKFqFtja52wwAJKrEfTkg4JyRZmdi9th6XwV5KXqkibyXOGM2h7p6M6tsntXicMlbD+GUh5U+M4ap0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:28:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:28:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 11/13] drm/sched: Reverse run-queue priority enumeration
Date: Fri, 8 Dec 2023 15:27:21 -0500
Message-ID: <20231208202723.918082-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 30728e30-bf1c-45f9-f916-08dbf82c2ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18VLjUZGsXi7gVwLENe1IzL1VQ2EDd6ENKG+OOIiMRR7doesUSz+VE//O0pDjYbFqgBzOE1KB9eQifabdvjmGcSwCeG8rAWFEAyZd8VNt6DoAaaQvxEL6hlz/9XbA3iNrdJ0xcMdOMLSWmw49SfpLrTYF9FnyVyN0kADQq8frUAAasp0Gvo2nwL2FZAvTywSz+Cnf9imQb4jQ7AwMgy/IpcuXzKZRWKR5oDRk9gBuYWS+CpwXfDoLrb0VkDf0izgoZiTBpQs4l7Ubzd8NHOvnktG2BOpvgQXm9RP19Z8VMTQbcMUap5F3t3Z9tJJuB8lode2Nd17ZSLoNLXji9feDk3KeHILfxc3tVzKm+SWnnkOgNLhr7ZP1KP3aLFMvog94mFpCSCg1PQlRRnXoza39mwp/w8sgKe4JyYX2FQASOZ5Hf/E0IDgzi+5jXd7t54/XCNIxWZOrER2QJPRMyqnF2kQ8Qgz70Ty6AjZrbHHI1qlCflqtYB/dDv/z1bDwVkTMbcOLwdvKg350eVKJbfebNukgiYR2aljwuJcFxWKvDmVZQpYvGpFJ21L1npGTZER40OXsGzgpVq8ckmL6xEb/XisOHv5ckWefC7cNWg+ee0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(66574015)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(2906002)(7416002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFFVnVOUzByUmRBNXJUaElXei9Ccm40QmpvN09sSnI5M0JWbC9FbitUd2lt?=
 =?utf-8?B?SEU4S1NLUG9BZkozYStDWW9WTWt4QmUxRFRJRWF3SXNjOGdaT1dOZzdzZ2lV?=
 =?utf-8?B?Y1AzZlRBM1NialNrTFlTM0lSeVhqRG1KOUw4eDZOSVN2d0FveGlrYUtqUita?=
 =?utf-8?B?b2p5VEh2WHZ5YlhITGtCSlhlalFtcUFaTkxlclJNb2J0Y0xMckhjbmswNnNI?=
 =?utf-8?B?d0hJaDl6dE9oYTZPcHFJb0lma0ZzWlJ0NW1QU2FJN3F6ZlF1NUl5YWlDRm1n?=
 =?utf-8?B?Q3BkeFhFSlVxTDkvRmJXampUR3pyTVlLTThndlBRdFJ6WlhyZHN3QWt2VFl1?=
 =?utf-8?B?Qkpic0thUWRsaHk1MXJrYlR5cmxiUWkrSVprRDZzc2VqNWFxK0syN2krUUJQ?=
 =?utf-8?B?cVhzeVJUbXp3R0RaaU5KckdqblI2R1lqTWZpNUhxVS9NTWhCTFR0Z3h2L0ND?=
 =?utf-8?B?OGFKclNrTTVXZ09lTTRqb0xxVWxjKzlNZE5KZStSRFpSTVFKbnZGcEpSUjdH?=
 =?utf-8?B?UVZYVEFBc1Nwblp3MjN0YWJuU0VqcnZrMXN2RFFMektkdzZMb1AzQ0dlQ3JB?=
 =?utf-8?B?YkRuZVdzNXNNQnVHdEc3anhlYjlOSmxMaGhCd3U2NnRMMGYzS0lGcklYbDNL?=
 =?utf-8?B?OG5FNjBpU2xoeEVUVjhzc08wUURWTjFPRTAvSFgzMFovbDJjQng2RnhaejhU?=
 =?utf-8?B?eUg0QU9yQXV3aURIM0RyRCt6WTZWVUFVb05qbWxHVFRFdGFTQ0Q1UERaT2xj?=
 =?utf-8?B?eFJram8xU1JkblJGZ1ppamhtL1NOZXI3M3gyMndnd0g0RUdjTWFoMkM3dXpq?=
 =?utf-8?B?anpEUktCOGhMRTYwWmhoV1I0ekQwSDA0WFZkRnlVdVVObFZtUjJIK2lwMG5o?=
 =?utf-8?B?MG92UzhaUVErZGZjaXVuSUYzTDlVcjE3cGZwWURTVlNwKzBtM1JMMGtaUmFh?=
 =?utf-8?B?clhxdUtoZS83MTFrMUZQN2greHQ5aGZ4VmJ6YndXOUxPbU5HNThnRkxsd3Nx?=
 =?utf-8?B?Q2ZCTFd6enJ0RHVhWDdRYWZQUExoazA5SmRjWnZZQnVZNmtIWkEydUI0eUZX?=
 =?utf-8?B?OHFyMWF1a1ExeGV1Z0MvKzJmNWY0UHRlOUVCVUJIZ3hPWEJEV3p1eTZ6V2FR?=
 =?utf-8?B?dmtZb3AxRVhSbkl0Tm5iTGMyMEFZdlBVMjhzaldmMlQzTmdWd3EwY2NKc0pR?=
 =?utf-8?B?ek9BdlVVSGVYYkRINEVXZm9INm8veTNJdy9ZRHNvZjVVcEtIZmZyNmExZnB1?=
 =?utf-8?B?eTE4aEJiV3ZteDZjWG5Jckpody9mUDE0MW1FODZ1WVg1K0Z5NzcySW15K0hC?=
 =?utf-8?B?UzV0NUttZDFteS9ZOGp2Wm14Q1ZLeHdqQjN1TzlYbkd3RzFOTEFkem8xQmJS?=
 =?utf-8?B?QnhKdC9iV2NDUU8yY21UN0VGcUh0bWYyT2V3c0t3R3JkMElpYWZzemtLUEk5?=
 =?utf-8?B?R1NqZnZTOFpOd2MvY2xJMFRpM3N6M3MwMFAxWURDWEpCVnFKWjhGK0VWdXRu?=
 =?utf-8?B?OEpjU0kweTkwbFl1VFJ3OU84aitIQXVWR0Q2NXpoQno0QktlU0dnY0pqNXFL?=
 =?utf-8?B?MFdTV24rYUIrU0JCNlI0azdrYU9STVZjcVFMZVFSZTRUd3BKeURmRWROckpR?=
 =?utf-8?B?K3c0cmtkSUVXaldBVnlCU2V3WFhPS3RWcG50Wi9uanh5Sk1QUDdPSkJPSzZK?=
 =?utf-8?B?K0YyQW5lNW9XOVJFVGs2UWN6U0V4RzdMenVtNDdkalFxOFBRNStnVHJHYTd5?=
 =?utf-8?B?U0xhTk1WOE1lTEQ3bCtPNGJmdGRpeTFiQlJyVzJXZjNLWlh6dlZFRW81cVl1?=
 =?utf-8?B?T2ZXWHh5TW1Kb05MTFhIVDRlVVBzbDRnY09LbzQ4UlkxSGJGWkFtVzFKWmIz?=
 =?utf-8?B?RzJ1eENjZzVudmtWS3hTN3Zmcng5bGs2MjdwVTVJUVUxN1g4c25EeExJS2xG?=
 =?utf-8?B?WFU2MmxyaytmTjhVUzlYR09OQ1BoU1lwT0hUb0F1WjRkQWRVbkkzK3BCOVZh?=
 =?utf-8?B?SWhZTSs1ZEtZZkc5eEtjdmU5Ylo4NHVCVnNwb1JwZ0lERDBiREplSlJ0YTRV?=
 =?utf-8?B?UXczU1I2Y2hHcTZxRjRCeUFSNXFCbzRYdm5oRjMzYVB3bXVHT0svY0xiQVdS?=
 =?utf-8?B?QktvYXEvQks0dUZVL3JuYVFXVUhFaDNkZ1BHZ3kwaEVjSVhnOG5KdURZeXF6?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30728e30-bf1c-45f9-f916-08dbf82c2ba4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:28:00.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SshOPqQ6U2l60saHg/cGM3Ri8el6x9boBPsGF3RbOwIZRTzZd5PbIRi2XfRjWioZq1IEiLVa8DfAqRRjfR1IJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Alex
 Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <ltuikov89@gmail.com>

Reverse run-queue priority enumeration such that the higest priority is now 0,
and for each consecutive integer the prioirty diminishes.

Run-queues correspond to priorities. To an external observer a scheduler
created with a single run-queue, and another created with
DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
sched->sched_rq[0] with the same "priority", as that index run-queue exists in
both schedulers, i.e. a scheduler with one run-queue or many. This patch makes
it so.

In other words, the "priority" of sched->sched_rq[n], n >= 0, is the same for
any scheduler created with any allowable number of run-queues (priorities), 0
to DRM_SCHED_PRIORITY_COUNT.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231124052752.6915-6-ltuikov89@gmail.com
(cherry picked from commit 38f922a563aac3148ac73e73689805917f034cb5)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  5 +++--
 drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
 include/drm/gpu_scheduler.h              |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1a25931607c5..71a5cf37b472 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index eb0c97433e5f..2bfcb222e353 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index dd2b8f777f51..3c4f5a392b06 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -82,13 +82,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
 		/* The "priority" of an entity cannot exceed the number of run-queues of a
-		 * scheduler. Protect against num_rqs being 0, by converting to signed.
+		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
+		 * the lowest priority available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_LOW);
+						 (s32) DRM_SCHED_PRIORITY_KERNEL);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b6d7bc49ff6e..682aebe96db7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1051,8 +1051,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	/* Start with the highest priority.
+	 */
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1292,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1313,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,9 +1391,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_LOW;
-		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
-		     i++) {
+		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d8e2d84d9223..5acc64954a88 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,10 +63,10 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_LOW,
-	DRM_SCHED_PRIORITY_NORMAL,
-	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
+	DRM_SCHED_PRIORITY_HIGH,
+	DRM_SCHED_PRIORITY_NORMAL,
+	DRM_SCHED_PRIORITY_LOW,
 
 	DRM_SCHED_PRIORITY_COUNT
 };
-- 
2.43.0

