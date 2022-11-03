Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78B618800
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45310E2C3;
	Thu,  3 Nov 2022 18:54:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF8210E01F;
 Thu,  3 Nov 2022 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667501678; x=1699037678;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sfzsKh7CJrui0p0uNsJbwn3YSuDK1nMV9ttBXfCkKhM=;
 b=GLkX/9gLb+aGYru6neZQKnAIBmFfA2gaKi6JtwBHdcOxma4sJV1l01/Q
 HkcQg0ADJfGQsHEuY0WL+WpT747dvtZeNaLCFDMSjOylsPXdn2Tnf29Ow
 h0u1kE69MH3q4rlBESvoLFNVEQP7jdeOWRX4rcnN+H2gqGZ9AlCc3lkga
 iOIuCl/jSPiXVpSsczx16NURTEQ6unhX041fRMNfXf07KlBZMuoy1/PqK
 17buyopeI7fnwWhYoaRNn2q+KH/46gA8HRs31Cw064fvr/Ko1ajrxjWcU
 ypIcrvJ1WBgjvnNY9TROk3zI7ni3BDiElBkB64epgi0U97+0j0XLwZis9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="371880029"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="371880029"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="964046493"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="964046493"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2022 11:54:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 11:54:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 11:54:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 11:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GECqnBE5h6BG7C1T3O4zwTn2SJf6zEXXACVec1B8oo1xDNMQb+68CU8otjQBpKedpvywPSxeVKTz606oAGOWvHrLrpKFKPRD0QSxFdPv4exy88O4vuN5NWMhMXIgGVH/BeMQEnfKpfPkHjgxtHQ6VeQL0wRNrn4XnF0l+2zllFJvuGU1lpBrawQB5gJW9AXD/przKhxrKWkQVUxzgHkm1SYeiVGVeJmjUGB70TQFzJGqFrRvXvvioLBLSPA/QZ5W9HgYq3YWHSinAxuZdLx1td3DanIFoNgrTkTtro9lzOQTxPXBrs4FC5aBGBeMPxjJ1PceFyikoTh+nJ95COpw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwAidB+yaNK2HqtBHNp5NMffWQRruVVVMSwfNaNa1OU=;
 b=H7a77WpLPvtWjcb04+9pTGSGd/gMU6sg1CkoNvxaJDN2AuYCyR1+D+LUDGJuAF2D26qP9U/V5WUWghfJ5TsXMm7fsPdcLfdc8Mj1T8U+WoWjUSBfALpWXvnEDi5z7U0L7WerdUeH2J0Q+2rQql/C9A2l2wIUENKx/QlIhVAFlOnUFP+1m3gfRko/gtlvvZ9H3WErQpfg7pUHv6nUOqm9BDdTIQd1H8kZtj+aTAYI1x6xRhVQsGyW2Ao6Z0UWM0NGqlsPoyTC//J6+IZElmkHWCO/Zpcu7uVqj1rh6JM38rIR3PtCHYasPV2SY0uqzOdEaBRjWbev3rzD3nykAhkZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 18:54:34 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:54:34 +0000
Date: Thu, 3 Nov 2022 11:54:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Message-ID: <Y2QOXULYgIb9vyFP@unerlige-ril>
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
 <20221102192109.2492625-3-John.C.Harrison@Intel.com>
 <46b26193-8f46-af55-c152-b43839087ea4@linux.intel.com>
 <989a06f7-9b27-cdf3-c521-60156c78f0ca@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <989a06f7-9b27-cdf3-c521-60156c78f0ca@intel.com>
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ0PR11MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: a14861e4-53d4-4583-3689-08dabdccd962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fAGOEp8Kfp0L76W/uBPb3EhS1285hFYfFpWpOyBmT885H8esYCZaEimoRP0NQGaa4qvVHkaTyJPeguz2ag1fVoVIK3+4buGXdx1wPtquEEaqAfy+XskEHIG2EK9ip+LgEqjGgrG+Xq/I/WoMddx+s6Od/lk8LkeILxp/e1PtTG28ZYZKrUH04Do3Yc0Wagm5Lhifw7NY1P798sx0d8qyLa1Fds2b2zIuSt2+C1H35bby6i6hh80AnY5gigc1huUjwxfcqrO6hB+z+3DeVakir3I8YuZ1h3ga7J23BEhK/zFz4V0TwZx6in4oQa7z0IQxfDELw7s+xZ5hFQAGuZ924zgFajaEJqiiV/hrr06qiOqGjfgyo6CQQdCs/TA6vMB1sH8cyr4800DxlQSV8reM6GKufrFGLzZVi4n3owz+3i3QwL4imhnuEkjAv1yGkU3L3vChBHe9ERggz3VeCGyqsKf9Ajcw6XFIgaXqw+XqD8TLGk7/ibV/yj8vKE5pNabp1IG6kIeFLxeaSuICcmV0eqWQQXbeiOgWdPpOWyqeDwHWIKVZftWxkQps0E4w5nDFW1Ap9R11tb/49hPMq3r9thUvuL+wr8dhzvhdjcN/rq3LH3mJGmckMJ8jVYHVrx0dfHXC+7O9maKYj55Btha7ffls0rQCKoP5NtxUvYvzvhUac8l/f5lIm5dda919zkLbv6WpzGlTCwBVD1XiS/13xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199015)(66946007)(6636002)(66476007)(41300700001)(66556008)(4326008)(8676002)(316002)(2906002)(5660300002)(8936002)(6862004)(26005)(9686003)(6512007)(186003)(6506007)(478600001)(6666004)(6486002)(33716001)(38100700002)(83380400001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlo5cTkzRDhHTTc2dG50Rkgxd0h4WnJyOHdZQjQvMFBRS1lGUmExVjMwZDly?=
 =?utf-8?B?ZUJoWWVUakM4d3RtSXVpTTRCNnplc3Y3dllRWENnQmxaWmVyRmlHNi81bUFJ?=
 =?utf-8?B?VGwzYzh3UnJLMGRoVUVNYVZ6NDFaUHFHcDBzRVI2RzQrK0VrTE9LcU9LU0Ey?=
 =?utf-8?B?cCtOa3hHMmxmelNIUURWS3Z4VzZ6SGtLbXdIQVYxYWdRUHNhbEdVOGtucVdn?=
 =?utf-8?B?UTdNQ0tRQ0NtUFUxMDdzSnA5YmhVYkxXaU13T2c3R3lrOUR4Tm9CN01FUmJ1?=
 =?utf-8?B?VTl3YjJsSkJUVElzRDZlYWtRM2hGK1pMeU5XNVo3SS9MOHY2RkppQjlILzVE?=
 =?utf-8?B?cm1DSzkwTHVqSXdpK2FGZFJ4QnhDMjlwbW9xMk5SVHVTR25WY1cyTnhCcm9Z?=
 =?utf-8?B?N2gwTVRzZnlvOG5nQzFQeUNXSFlYd2ZNaXFTcWpLdzZkY0hWWnhzT1NpODl4?=
 =?utf-8?B?ZXByZGx0OElmenY3Mis4WU1tam9IaW1GaUpMVDhnNkxDOXNSbmRVT3FGblpv?=
 =?utf-8?B?blU4S3R4NUIwSFpONkovUWZYekwwNXQ2eUhzS282YWprK0gvN2E3ZTBWMDcv?=
 =?utf-8?B?RE51TmtLYUNFVnZSUVVNaDRZdHY4aS80MDBESlZUQ2EvRFpFdlJicmIwRWx1?=
 =?utf-8?B?ZUl6ckdNRUNZdmxmTGxudmsvZTVwaGdpaHphM3VsQ3cxaUoveDMxVWVRb1Y0?=
 =?utf-8?B?UGtHbzMvNWdxenUzSGNEb2lxeUJqcWZ2OXpwVWNpNTY1TG9USU9LMHJwT0Vi?=
 =?utf-8?B?d3lNcTI0QVc1RjFxbXhVcHRYUUZFZDlwcThJeWxLa3BwY3NmRVZtNHhOaFRE?=
 =?utf-8?B?ZmFEVUhsWlY0SE9rL0pDMUlaaUVuSXZTRlZ1TU9XTVNQZmY2RDdDNE9mRnp0?=
 =?utf-8?B?VUFLVmhDbVYyaVZoOVBpakIwUDJGdktZNzBlSFpITDdrNGhNL1RnamNORGVO?=
 =?utf-8?B?NDIvU3pIMTlnUWc3RTRJbnE4bVZqdEdjYzBZNUtpV1BPK2RhTVVlanJld2Vv?=
 =?utf-8?B?VFZGaGl3NksxYnYzenhobnpiWGVaU0Zud1ZKWnFqOTltYU9kUzVpV1dwQnY3?=
 =?utf-8?B?SnpQWmJ0NWcxdCtRek1RM3lZUXpQbEZNVXQ5YndjR0Vacis1Wmdtd3R5R1FB?=
 =?utf-8?B?QXZ1RkxHdGNNaVRPcllVUmJkUVd3bEl4RTkxQXdoU1M4bVUyNnNFL29LOFc3?=
 =?utf-8?B?UGp2R0F6amRuUE03WG9EcFgzMEd5QXFFcHJFbEdIcE9QZnpmMU9Eb1V6aTRO?=
 =?utf-8?B?Q1ViRUZhRnl3dkQrOXhtQW02UmQ0eG5GVEJOOTlzenZXK3NVS0lzZjBnanVO?=
 =?utf-8?B?WXpIblVhczgwYWVBa0ZYNkhURks0citaSDBMTWp2enlaWVlpVGJRTngzWGFs?=
 =?utf-8?B?RHBHak9uUG1LWVFEdjRITnpWSUxvNXhXempuay9QRVRWbHNsVFAyWXBhTmdW?=
 =?utf-8?B?WStVTUlSOVZrOXZWMFN3QWFLblNzOWJyZ2JCOUtFVWx3TW9Gb1FxcWhZRndr?=
 =?utf-8?B?b0JMWjkwTFFKTUVRUnBVVk0xT0ZQK1ZGdGxOQVFiU2NST082OTFleUN0Mkow?=
 =?utf-8?B?eGJQL292eG9CNks5a3p5ZXBzalZTZ2w3NFIxUE1kWGpwZGZ0UC9nemtNanJz?=
 =?utf-8?B?ZW5yanBWRGlrTUcwdGZzUERxZGJndE9Pa2hNcDNsRzZVRWlrMU5EbHB2RGN6?=
 =?utf-8?B?MWxSb1ArUTZ0U0dzTFJ1VnJNdzlzMU1GQzRNNXE5S3lWZEhFR3ZXNGNzaVhO?=
 =?utf-8?B?ejdVT2hpaUs5bUtXSDIwQTVsNTY5V3ZFU3pVK3RQaEVkZ3pxcW5seVZxZVdD?=
 =?utf-8?B?aURua3phdUgzTlpoMlptelNOQi9ET2tTbFdSNnFXSEZWRzZyTldHNy9jRVc2?=
 =?utf-8?B?ZjlBRXhqVWJEcG9OWFRyczdBYmtEZEN5eG9PRFpPajgyUHhLUjRqZ1hSS3ZD?=
 =?utf-8?B?MjYxQ2hNSGNid284NEhiMXpxeXVkMzIvRTlZVUs1bzZRV3NWN2cxRWQxcklO?=
 =?utf-8?B?dU5sUTREWTd3ajJZL2NGT3NtWDdvQjdjSDVZaG5UNVlkay9vSWFGMTRUdm1Z?=
 =?utf-8?B?azRZU2F1cjhNNGRHTUVMTDY2bXBoSlh0YldFcFFhczdGSU5vU21xM1BlY1lD?=
 =?utf-8?B?bHVFY3NzQVZqSFluOGdzM1VSdjB2cnM5aTdjRm91UWlSTFlwSDZ5ZGRsT0pQ?=
 =?utf-8?Q?LiGo0rCTS9mbPGCOaY4v4n0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a14861e4-53d4-4583-3689-08dabdccd962
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:54:34.5979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZNvBl5uadtmk+VG+G8uZsQgv9eEjbnkGXdVRhupaenqFTPpgXJemZ8jT38KBIhbOVNmWKSnfOg9wqvivlW5R6PxnloQJ3162fE8dzaYCl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 11:45:57AM -0700, John Harrison wrote:
>On 11/3/2022 04:31, Tvrtko Ursulin wrote:
>>On 02/11/2022 19:21, John.C.Harrison@Intel.com wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>The engine busyness stats has a worker function to do things like
>>>64bit extend the 32bit hardware counters. The GuC's reset prepare
>>>function flushes out this worker function to ensure no corruption
>>>happens during the reset. Unforunately, the worker function has an
>>>infinite wait for active resets to finish before doing its work. Thus
>>>a deadlock would occur if the worker function had actually started
>>>just as the reset starts.
>>>
>>>The function being used to lock the reset-in-progress mutex is called
>>>intel_gt_reset_trylock(). However, as noted it does not follow
>>>standard 'trylock' conventions and exit if already locked. So rename
>>>the current _trylock function to intel_gt_reset_lock_interruptible(),
>>>which is the behaviour it actually provides. In addition, add a new
>>>implementation of _trylock and call that from the busyness stats
>>>worker instead.
>>>
>>>v2: Rename existing trylock to interruptible rather than trying to
>>>preserve the existing (confusing) naming scheme (review comments from
>>>Tvrtko).
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c       |  2 +-
>>>  drivers/gpu/drm/i915/gt/intel_reset.c          | 18 ++++++++++++++++--
>>>  drivers/gpu/drm/i915/gt/intel_reset.h          |  1 +
>>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +++-
>>>  4 files changed, 21 insertions(+), 4 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>index e63329bc80659..c29efdef8313a 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>@@ -330,7 +330,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>>>      if (ret)
>>>          goto err_rpm;
>>>  -    ret = intel_gt_reset_trylock(ggtt->vm.gt, &srcu);
>>>+    ret = intel_gt_reset_lock_interruptible(ggtt->vm.gt, &srcu);
>>>      if (ret)
>>>          goto err_pages;
>>>  diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>>b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>index 3159df6cdd492..24736ebee17c2 100644
>>>--- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>>+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>@@ -1407,15 +1407,19 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>>      intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>>  }
>>>  -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>>>+static int _intel_gt_reset_lock(struct intel_gt *gt, int *srcu, 
>>>bool retry)
>>>  {
>>>      might_lock(&gt->reset.backoff_srcu);
>>>-    might_sleep();
>>>+    if (retry)
>>>+        might_sleep();
>>>        rcu_read_lock();
>>>      while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>>          rcu_read_unlock();
>>>  +        if (!retry)
>>>+            return -EBUSY;
>>>+
>>>          if (wait_event_interruptible(gt->reset.queue,
>>>                           !test_bit(I915_RESET_BACKOFF,
>>>                                 &gt->reset.flags)))
>>>@@ -1429,6 +1433,16 @@ int intel_gt_reset_trylock(struct intel_gt 
>>>*gt, int *srcu)
>>>      return 0;
>>>  }
>>>  +int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>>>+{
>>>+    return _intel_gt_reset_lock(gt, srcu, false);
>>>+}
>>>+
>>>+int intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu)
>>>+{
>>>+    return _intel_gt_reset_lock(gt, srcu, true);
>>>+}
>>>+
>>>  void intel_gt_reset_unlock(struct intel_gt *gt, int tag)
>>>  __releases(&gt->reset.backoff_srcu)
>>>  {
>>>diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h 
>>>b/drivers/gpu/drm/i915/gt/intel_reset.h
>>>index adc734e673870..25c975b6e8fc0 100644
>>>--- a/drivers/gpu/drm/i915/gt/intel_reset.h
>>>+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
>>>@@ -39,6 +39,7 @@ int __intel_engine_reset_bh(struct 
>>>intel_engine_cs *engine,
>>>  void __i915_request_reset(struct i915_request *rq, bool guilty);
>>>    int __must_check intel_gt_reset_trylock(struct intel_gt *gt, 
>>>int *srcu);
>>>+int __must_check intel_gt_reset_lock_interruptible(struct 
>>>intel_gt *gt, int *srcu);
>>>  void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
>>>    void intel_gt_set_wedged(struct intel_gt *gt);
>>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>index 941613be3b9dd..92e514061d20b 100644
>>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>@@ -1401,7 +1401,9 @@ static void guc_timestamp_ping(struct 
>>>work_struct *wrk)
>>>        /*
>>>       * Synchronize with gt reset to make sure the worker does not
>>>-     * corrupt the engine/guc stats.
>>>+     * corrupt the engine/guc stats. NB: can't actually block waiting
>>>+     * for a reset to complete as the reset requires flushing out
>>>+     * this worker thread if started. So waiting would deadlock.
>>>       */
>>>      ret = intel_gt_reset_trylock(gt, &srcu);
>>>      if (ret)
>>
>>LGTM but I don't remember fully how ping worker and reset interact 
>>so I'll let Umesh r-b. Like is it okay to skip the ping or we'd need 
>>to re-schedule it ASAP due wrap issues? Maybe reset makes that 
>>pointless, I don't remember.
>The reset is cancelling the worker anyway. And it will then be 
>rescheduled once the reset is done. And the ping time is defined as 
>1/8th the wrap time (being approx 223 seconds on current platforms). 
>So as long as the reset doesn't take longer than about 200s, there is 
>no issue. And if the reset did take longer than that then we have 
>bigger issues than the busyness stats (which can't actually be 
>counting anyway because nothing is running if the GT is in reset) 
>being slightly off.

In addition to canceling the ping worker, __reset_guc_busyness_stats is 
performing the same activities that the ping-worker would do if it were 
to run, so we should be safe to skip the worker when a reset is in 
progress, so lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
>John.
>
>>
>>Regards,
>>
>>Tvrtko
>
