Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC807E6CBD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 15:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A911310E8C7;
	Thu,  9 Nov 2023 14:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C104C10E8C4;
 Thu,  9 Nov 2023 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541937; x=1731077937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o4gkPcPkWN4/TKYn+DgQjPsXSwmDLNLH3gZIIcT+HOw=;
 b=Bf3mVBtSBaSBRAcH+yQUkKRzDPM7uAgHGPLj3R8wLIUyKDR43UGTMm4m
 aiyFDrYPiTgMoaocBdObebytfYX/LaeBsboofiTyZEkPgmwVi5C/jO7Q6
 2qsH45hTa8ERvDAQWPDoe9q6q63aYLZX90I+LEqvep+QqDi5s5lPBh7iF
 wXLbKsDOMmC7GSzzxbg5bqhxhdAN7vMbY7UTAGTGTej4HU9GzLNAkCLrO
 bdLy2gbxlQOjOW609qVvMh+2FlYziaFVmir+ERCzh/VdRMY+oGJAxKyty
 XKdqwx/qt96ngyxn+YBdMX/erlfrr1LQqiT39oxaPq7caKIaVt7httqIr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300348"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561435"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQiiCrrm3Zpw4ZtKd+EjN+6wL23neKADZdIvjhuBypDLTuvIGgNmrgxRJ9qZH/PVf89wuxLDtTHR0jqTF6ghIvnBfBwlLSE+rzQlkrvSxtByDRZXeybpTNEW53nk+GK8HKrrQNo8BqqeN624PrtofN5XRCuLqFY3BXMrJVmn2ugF77Df9MEKs+NBaKK2vRiEy2z5rdpGm2mFG3nArzqagbCkl8066DxVbIhoFFU3x0NSUEBTYsG+QMFuxlpJTVC44Xz5a8rACqbFqJswnqpR1Xvr3+WUPMhNsbPi58/V3874ItWxSWiQws4d6egnbweVSqigtWypTyG6Q5OPps10jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9Tk/i2ZbKAQyIdk3c9ZfWgKjwlRufr5dt+FNS0rNdQ=;
 b=byBY1wnVOfIzKQjXapwyZoBOnjkVPr3fqZqZ8AwVHTDruZU8SluO7kqGwmHptK1qxlsGTbjaiVxseDXXpGGTN8dRyzgXFjQOpG2qRJuBqebJeAMOKZuyC7Ofsml8rHj1EnI5chz+v+oVs7UvOhtaU2uzYPZ40UdbdkGvmGtvZcaSGfzSc4Ufy4f3Zgm957j+2qIM0LsZt+xv3z83rHKqV1GHRPRTFkRh610pc/E75BxVNqsYeSB84gPMCVMHz9MJ72b3ORkj2yJfhiDHg0CKp6dbeauwdjzBPbBORyLLftzHGIIjz8RCVjPtFFtjA3L8WEW5n3BAeOCHLAxg/Fv4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 11/20] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
Date: Thu, 9 Nov 2023 09:53:29 -0500
Message-ID: <20231109145347.345120-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 194ae5ac-a878-4dc0-cfd4-08dbe133ca50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgC8O0W+50yTabahOtNO5Pj8r90Nvb2vffMwwUMV/AHnKU86HOiFlAtiVAHvgr0c4fcMAv1aISJTLKXSQEC3LMPz6P7AIJn55dhZS047VETG+L7GRa7QsYV+2YZw1MDm6AkDPGa2/WQqlGl5h4z7GwbZxXnDYxLQFHXbjHLfZcRDVg0QR4rd1pDeAbMzRoB2QxwVd9lPzQFCDJv/gGFw9VTs68DCQG9ks21+gGNJ8JTy7HDgH3Itb27GDK0xlRlWXy6qVrscEtwqOSna7kp5rX92Ptil2/koX4pJaVM7mrbNqsiWaDi2MZMPmrGXuQ6T7IbSL+ARe/ENnQ0WNx1hJ1QjhMZoaMTmlFt25r4Qn67Kk0whYMtGiMJpU3WoHUj6XDYBW9Y1L7g/kry/opMgD3yWKMoQVf9utIDCcmOsx8PF6q0IJS7ve6nhHs0aHnep8jPTx6U7Tg+n5otNZSBHDPDHE+JS57YsI3i/xm6S5atI4tCx5R/jwgYfdUh62WYRmq1KtpqcI2fTgs+8SYelT0PjPILwIruZESbgQfrtjKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(66574015)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(966005)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(7416002)(6916009)(30864003)(54906003)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZ1amgrVGNuUExsbHY3bHV1aTBYT3oyVm5QQjR3S0dYTUZGU3o4SncwZjRM?=
 =?utf-8?B?RlhrNVNOdHJGeDBkMlZnVmJJMVlFbWJhQTFWVjFQYllEUkRzL29QWjFXV0Yw?=
 =?utf-8?B?S3RUaGtNUTlScTNXOUJQbnNxYi9xbktUblVPaWJRMzBqTUpXOWxWRmlQN0tJ?=
 =?utf-8?B?TlpUL2lJbnF2Q04ybktGSGFxb1dlWjdFYlNQTE45U0hBZ3p4UkhhWEtUL2FZ?=
 =?utf-8?B?OHIyNE1aQmtHKzU0YVhVUEptYXVXRHBnS0FCazhwSkN1UUFuRXVLTUFPdzNm?=
 =?utf-8?B?MUNjTytsZFFKYnoxeW9zOVBNeElIU1czM2c1YjAyd3dKQXhEZjh5RXdhRy92?=
 =?utf-8?B?K3VxbWduZ2cvck9BU2twUy9XT0VYQU9iUHlxN05HRmU5SWtkMGpmZnh3VjNF?=
 =?utf-8?B?Ulhwc256cDY0Mk1OU0JSTU9PRVBHRysxd0VpK0g3SGZRbEQzdDYwN2NvWWM4?=
 =?utf-8?B?cmxjWm5DdHJVclFwb2ZLTWdhNXJLQUZGNDBKWkMwM1VVTXJLYW9PSCtrNTF2?=
 =?utf-8?B?TzcvMUlybHVTcld5Y0RKclZLMzJoc3BDKzRSYjUxOStKekhKRE1tOEVpaU9F?=
 =?utf-8?B?WVVaK0xMclc4RnF3ZURQanJ0R1ZmczNIalE1NEZQdDE0dGRaQkg3cDRYTGtj?=
 =?utf-8?B?Y3ExWlBZKzZzcE1xaS9vTmpRMUlNOGJwd3dpT0Qwa3hEems5TGFUTGVITXI5?=
 =?utf-8?B?RlpDcGdKZDF2QzROZWdjT09ZaU9ja2hxQ0hNUktMY1lqSDdnZXJYSEV4LzBM?=
 =?utf-8?B?TWswakhDOUIrUUdzbk9uNVFoOHl5UjNTTEhBd2lWNVBJdG1lVDJmaXNjbkZ0?=
 =?utf-8?B?OCttM3kyNXhTNmF5TnJCbFUxYTM4NEg2N0NEOUw0TFZkc0pvek1WbUNFcTR3?=
 =?utf-8?B?RlNVRklPZE5UcWoycVZMeEVwZlhsU3cyYVI2eEFKNUtZekxERmVrV2p0Qjl6?=
 =?utf-8?B?Y25SR1FVcjhTODNaR2VVUGtKM3Fid1lVTnFTOUw3Q3FtTkRjczlQVm9vb2cv?=
 =?utf-8?B?MHNjRXo2aUtVREI5SEIzY0hIeThmb3d1a0RMTm5RWnJ0dGZPR3BIbXhWMEFx?=
 =?utf-8?B?RnRhK21MYzhHKzhNQ3MvUVN0ODhrdHk3NEprT2R6VmVGanRpRTdBM0NLdDdT?=
 =?utf-8?B?VkN6K0VyS2dLOXVZaXp6NS82NW84RUN0dkFEVGQwVk5MUW9VUUhncWZQOEgz?=
 =?utf-8?B?UlJPRmpGMVpxalRGNTNNSE4yS3lpVGd3bVkyeVkydkNrZXJFWXhTQ0x1Tm1Y?=
 =?utf-8?B?dU5ieHVIcGNGZnM1YkVRVkVjRFVCd2hIYXZ2cmFSSEFxZGIwLzAyVTlwZFZs?=
 =?utf-8?B?TXRUWVczK29zQmZPai9aUnJxYVl2T0ZOOGU5SXRnK1ljVzB3TzI3WXhKSFBh?=
 =?utf-8?B?R2NjTVZFMy94R1RNRnR5MkVsWGR6U0FhaHJQU0lRWSt2cEVtcnVSYkkrbmJt?=
 =?utf-8?B?OS9zT3ppUk82Z295MGp2OWlrWkZzZW9lRlYwY05mMFpEcjhMcktmRnI2VmRQ?=
 =?utf-8?B?dFNMOFBpYkZ4bHEvTHh5VUM5a1dveDcyVlBmU1JhUmREQzYzN3RLaTZFZmEy?=
 =?utf-8?B?VHM5SjZ6bUhGS2xJamNoTmtnZHNYRzBqNytsUlFMbG40dCtOWUxqNUQyR1Ba?=
 =?utf-8?B?d2dvODRBQmlSeHRRRzdzdUFyL1BoaEFWdVFQa0lCR2V2SzFEZlhvcVVZcTRw?=
 =?utf-8?B?ZFJ3dmhuNkY1MFVMZmFFWEd5bC9JL0s4QlFHSldBcmZWUlBTdkpOa2d1T2p1?=
 =?utf-8?B?Z1RIalhyTUFwQVQ0YWduZ0s2b0JFd1Y0L2s2bjhENU5adDhMdHVKaTRZL2w2?=
 =?utf-8?B?dFpuYk1aK2VidTNPTXluRitmOXNNUjJWQThqODFuTE9KRWV0REdKeDdSOGMx?=
 =?utf-8?B?aFB1TlErblFKdjN3M0lsMllHemVuUHJuaXRGcGxrRmRPWkpLV25tekVUZjFP?=
 =?utf-8?B?SEpsUVh6NndwMVZNN2JMeHlrbmdpS2x2RGhsdGxhbWMybjFvNnlkOUxzM3VI?=
 =?utf-8?B?aHNSdldZL3Vwd3l1Z1VtYTFUY2lrKzh3MXZOU3lUelZQNWhVamFQWXpyWUFm?=
 =?utf-8?B?MDcvZWFNb2tmTU16NzlTMHVHMEtuWEhkVlJHMnIrd1lkY2pzVUxFdjI0cysx?=
 =?utf-8?B?em16akFOcFBIcllRZkdLa25IYXJJclFFZlJzS3BrSUVZZEVvUmVraUg0dFRN?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 194ae5ac-a878-4dc0-cfd4-08dbe133ca50
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:35.9825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJAQc1+znwMNi+kYgj1fx9GFe+LLS3SMBasKE19U4Wsy4oXuVy6rurhAHoH7lbvnzSE3Ht+038GvLQdQCTcKPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
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
Cc: Matthew Brost <matthew.brost@intel.com>, lima@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, nouveau@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

The GPU scheduler has now a variable number of run-queues, which are set up at
drm_sched_init() time. This way, each driver announces how many run-queues it
requires (supports) per each GPU scheduler it creates. Note, that run-queues
correspond to scheduler "priorities", thus if the number of run-queues is set
to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
i.e. single "priority". If a driver further sets a single entity per
run-queue, then this creates a 1-to-1 correspondence between a scheduler and
a scheduled entity.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/20231023032251.164775-1-luben.tuikov@amd.com
(cherry picked from commit 56e449603f0ac580700621a356d35d5716a62ce5)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  1 +
 drivers/gpu/drm/lima/lima_sched.c          |  4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    |  1 +
 drivers/gpu/drm/scheduler/sched_entity.c   | 18 +++++-
 drivers/gpu/drm/scheduler/sched_main.c     | 74 ++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c            |  5 ++
 include/drm/gpu_scheduler.h                |  9 ++-
 11 files changed, 98 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 30c4f5cca02c..15074232fbbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 		}
 
 		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+				   DRM_SCHED_PRIORITY_COUNT,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 78476bc75b4e..1f357198533f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,8 +325,8 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
 			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 345fec6cb1a4..9b79f218e21a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -135,6 +135,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	int ret;
 
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
 			     dev_name(gpu->dev), gpu->dev);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ffd91a5ee299..295f0353a02e 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT,
+			      1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
 			      NULL, name, pipe->ldev->dev);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 40c0bc35a44c..95257ab0185d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -95,8 +95,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
-			num_hw_submissions, 0, sched_timeout,
-			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+			     DRM_SCHED_PRIORITY_COUNT,
+			     num_hw_submissions, 0, sched_timeout,
+			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3b7ea5221226..7c376c4ccdcf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -436,6 +436,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 		return -ENOMEM;
 
 	return drm_sched_init(sched, &nouveau_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 033f5e684707..68a5556dcd92 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -832,6 +832,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 
 		ret = drm_sched_init(&js->queue[j].sched,
 				     &panfrost_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a42763e1429d..409e4256f6e7 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -75,8 +75,20 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+	if (!sched_list[0]->sched_rq) {
+		/* Warn drivers not to do this and to fix their DRM
+		 * calling order.
+		 */
+		pr_warn("%s: called with uninitialized scheduler\n", __func__);
+	} else if (num_sched_list) {
+		/* The "priority" of an entity cannot exceed the number
+		 * of run-queues of a scheduler.
+		 */
+		if (entity->priority >= sched_list[0]->num_rqs)
+			entity->priority = max_t(u32, sched_list[0]->num_rqs,
+						 DRM_SCHED_PRIORITY_MIN);
+		entity->rq = sched_list[0]->sched_rq[entity->priority];
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -533,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->rq_lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
+	rq = sched ? sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 506371c42745..fd755e953487 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -632,8 +632,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq)
+	if (!entity->rq) {
+		/* This will most likely be followed by missing frames
+		 * or worse--a blank screen--leave a trail in the
+		 * logs, so this can be debugged easier.
+		 */
+		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
 		return -ENOENT;
+	}
 
 	job->entity = entity;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
@@ -671,7 +677,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	sched = entity->rq->sched;
 
 	job->sched = sched;
-	job->s_priority = entity->rq - sched->sched_rq;
+	job->s_priority = entity->priority;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -888,10 +894,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 		return NULL;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
+			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
@@ -1071,6 +1077,7 @@ static int drm_sched_main(void *param)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
+ * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1084,11 +1091,12 @@ static int drm_sched_main(void *param)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   unsigned hw_submission, unsigned hang_limit,
+		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1097,8 +1105,36 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
-		drm_sched_rq_init(sched, &sched->sched_rq[i]);
+
+	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
+		/* This is a gross violation--tell drivers what the  problem is.
+		 */
+		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
+			__func__);
+		return -EINVAL;
+	} else if (sched->sched_rq) {
+		/* Not an error, but warn anyway so drivers can
+		 * fine-tune their DRM calling order, and return all
+		 * is good.
+		 */
+		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
+		return 0;
+	}
+
+	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
+					GFP_KERNEL | __GFP_ZERO);
+	if (!sched->sched_rq) {
+		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
+		return -ENOMEM;
+	}
+	sched->num_rqs = num_rqs;
+	ret = -ENOMEM;
+	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
+		if (!sched->sched_rq[i])
+			goto Out_unroll;
+		drm_sched_rq_init(sched, sched->sched_rq[i]);
+	}
 
 	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
@@ -1115,11 +1151,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		ret = PTR_ERR(sched->thread);
 		sched->thread = NULL;
 		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
-		return ret;
+		goto Out_unroll;
 	}
 
 	sched->ready = true;
 	return 0;
+Out_unroll:
+	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+		kfree(sched->sched_rq[i]);
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
+	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
+	return ret;
 }
 EXPORT_SYMBOL(drm_sched_init);
 
@@ -1138,8 +1181,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->thread)
 		kthread_stop(sched->thread);
 
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list)
@@ -1150,7 +1193,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 */
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
-
+		kfree(sched->sched_rq[i]);
 	}
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
@@ -1160,6 +1203,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	cancel_delayed_work_sync(&sched->work_tdr);
 
 	sched->ready = false;
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1186,9 +1231,10 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
+		for (i = DRM_SCHED_PRIORITY_MIN;
+		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
-			struct drm_sched_rq *rq = &sched->sched_rq[i];
+			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
 			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5c..038e1ae589c7 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -389,6 +389,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
 			     &v3d_bin_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_bin", v3d->drm.dev);
@@ -397,6 +398,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
 			     &v3d_render_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_render", v3d->drm.dev);
@@ -405,6 +407,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
 			     &v3d_tfu_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_tfu", v3d->drm.dev);
@@ -414,6 +417,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
 				     &v3d_csd_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_csd", v3d->drm.dev);
@@ -422,6 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
 				     &v3d_cache_clean_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean", v3d->drm.dev);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ac65f0626cfc..d2fb81e34174 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -471,7 +471,9 @@ struct drm_sched_backend_ops {
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
- * @sched_rq: priority wise array of run queues.
+ * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
+ *           as there's usually one run-queue per priority, but could be less.
+ * @sched_rq: An allocated array of run-queues of size @num_rqs;
  * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
  *                  is ready to be scheduled.
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
@@ -500,7 +502,8 @@ struct drm_gpu_scheduler {
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
+	u32                             num_rqs;
+	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
@@ -520,7 +523,7 @@ struct drm_gpu_scheduler {
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   uint32_t hw_submission, unsigned hang_limit,
+		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
 
-- 
2.41.0

