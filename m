Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1E7812AB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 20:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5E110E557;
	Fri, 18 Aug 2023 18:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8FF10E554
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692382584; x=1723918584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iLKYyW8jnAKABXQKndWxum9OIBDuPJSREhWJnSo0Xhc=;
 b=UQ3vaLLpmiHv1H0Cmt9QQVUbl1og7jkQgNNDaEn1zH97G9bF1HVIWwSp
 GPgmc0AQaowMp38CRJL4sMsJTwF3M1YOBk+UqapijHFnkMm2hHWTY9jz2
 1ttEdpALityQyl7aXvI1JBuCdWXB6sEzjGpPRgK8T+TaGN++eburaVrGN
 v8VaG2C6HI019AmiwTRAbugLPc7zvsDedxkTW5NUJXJhu9hwbRt9QHImq
 EXoN886h3517MVO1xQwL0T+JK6NQM3ExhNMKZrQzsRuvT+hpFoEXV0Fpw
 r5iQmdGOkux1zvDGm2dv19qUah49FFfs4h+gl/89FFREN0p3A3U6DbAi6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358139502"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="358139502"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="849403433"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="849403433"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 18 Aug 2023 11:16:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:16:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYwAtQFf1OdmBiKQD+Uv4+G+O7c174xszg4UaBEjSZ4xQeypdcVE2qs78Ifsb60rufXWookvssoLz6zAiubR1Nlr1aQvxnhpbN5BgmKweC8PL/FITOJe5wH+ena3d7oUCVxm2PtIjtl4kkPmogzI+abQvyY9+F/TTtkUzK3uzdzgVupU3Y8qSV32Koqmw+AKh33wJqcDcYrjBKLc4kb+3CTJE4M+72C8DBYvraGQrLPO2WkOoPQUJiAe6hbBpXEX+rMrByeYqVrVcrh1/iNQJS9vPO/7JejdKTKuJFn1QMOmWAvoj9631BqbLwqD4Eez64A2dDOuk3oglrOM2iwrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYO13o+GPFjYvOotzkaC7fMPTTbwNP5OYDk6VZacsBI=;
 b=N9xB813w8MBQpmExeVMU7aWib71MHCa6zVhvGSq/5YALxdsFCf1x17in0lgrMpQ4igHYHyw/thQPX1blzLUSSs+Zi5eDw3wP1afW+43feVsqSU4wgE6ZjLF9uCzIWzPhbLP6mmYyQy/hcx7R5nQRCTfpJou3+yv+JwvTeq1L9EUWYzxoPKRbyUlt2MEcNADOmAL82SU8zWpJvjQbrXtETQi+gt8anjrej0UVnFyJGfkSYr5Mh3eGIoJlqYjGrnpUTppK7mngGlaPu2oNVwvNTyb1nfZ1qHqo3I1SYHBjaHAatOjKehnAsy9rn6C9m6qWjmeXUi0dLu5q6Has1REDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 18:16:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 18:16:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <daniel.vetter@ffwll.ch>
Subject: [PATCH 3/5] drm/doc/rfc: Mark DRM_VM_BIND as complete.
Date: Fri, 18 Aug 2023 14:16:00 -0400
Message-ID: <20230818181604.507051-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818181604.507051-1-rodrigo.vivi@intel.com>
References: <20230818181604.507051-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: e585ccf9-0a60-4ccf-2ab3-08dba0173906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXMdWiOKQQzVCpjt95sDfIrquc4kTgxmcS8JbzxzBAqYc+dIhlhA4rpVUUHTu3yhgecbR0YGUFKXbjqa14DpAnGkIkJhURv3XDiPVdWdi+3UpwQ6Uw/btutVIwdR5tUGhvuHZ+N8znGDbxt+UtEpc6oZYlvc8tnWG4XkktoM2aofxtab+7LQKZRawTMQQvV8z4QWhRMPH8aVEcbSGZ+m/QT4Yy7CT8D3VE+5xC0DoMwACskSMr6SOPcfJoaiQwmnXbW92ks6Y0CC1oAWHKJjOrYbUkocK88h0XU1ZgHBTvUf+trRPCPamKsoM+D0IhYNNepaGk3be6g0IFasQbcMAe/oCCe3hYGhBKncKKCO/aGLSOxv3mySOJccKYUUE8YOv/lbYZGFkjAFRqrBRm62l4nMXJDKJ6bdk79WLExEiVnF0s8RjmWESEmarjqZfJzJKpreZpMp82GsuPhN4FfKG8QUiqFSxXNuYTEuNIDjIYN7v/u3X1E6fzb6tTclzJhTWMaP9VEbV/qI5rv2I7kmCyjUUkgej6gKNJ+b1pzq0Bv282aGOKdnLSwb0H2guoxX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(2906002)(83380400001)(66556008)(66946007)(478600001)(6666004)(316002)(6486002)(6506007)(66476007)(44832011)(2616005)(5660300002)(107886003)(6512007)(1076003)(8676002)(8936002)(41300700001)(4326008)(26005)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDV0VFZWSnZCbnJTZ1VXZzZCMlRmQ1Z5c3p6UTJPei8yay9pdzBjUWdWM1dP?=
 =?utf-8?B?SktNVXZ3RHAxT1BCa1ZJWDh6ZVVza0MxRmNNMGlCV0FYdzFLUDhDcjlkeS90?=
 =?utf-8?B?Tm15REpiR2ZRUVdZeXJQU3JaZWpCUTc2ODNRMHZTN2ZNbUtoTDNuU0EzTGVH?=
 =?utf-8?B?S1FvVmxnRDlMS1Uyb3RWeDQvV0xwWlJJMVBGaUFGdWg5N1VXbDh4bFg2eTVl?=
 =?utf-8?B?alluMThNNU8zcll6Qm1FVFVidUxZUzlranNvYk10NmNZYlJtNUpLN2JzR1oz?=
 =?utf-8?B?OGdwZ3RQMWVaQzNQT2hjeE4yOSsrLzRGVkJ4bDY0V3NVcjd5akVPa3NVQTJM?=
 =?utf-8?B?T3pKM1Fza2dSb2NxOE1VNVVRVVk5cXRHNzhKNWZDLzk4aHE2UzVpeUZOZG9M?=
 =?utf-8?B?WS9VVS94QW85Y1lRekRiTHZQSUx1TmN4QTU2NFN2Z3h0UWdOWFJiekVlWmpT?=
 =?utf-8?B?cXdNSXNkSXI4VTVPUERwN0MxN2dOVE1yS3p2eGFQK0E5ZDAyWncrRWpNYmNK?=
 =?utf-8?B?K3pneS8zSmNmUnBsOWhOWWZReklLeTl2bmtYM3ArRWIycHNPbHRGeTZyMFJ4?=
 =?utf-8?B?Z0RCWmlpeUszeDN1eC9iYjhpOWpFbHNxWkRSbXNJUjBrT0RvOUlFZ095WjZk?=
 =?utf-8?B?dXZMTnlGTTlBRklSZnhZV1VaYnBLeVcyVk95aVZNdkc1UE41cVdxRWZ2VFFF?=
 =?utf-8?B?VXBlNVhhdlFIR1BqSE9SUkN2ZHorNDgxanJiMGVRb09TNWxVWE9Ndk9HR3Vr?=
 =?utf-8?B?M0NJZjlWUzBvRFhvdFo4TE1vZ0lMRnE0cS8xaXd1Q2JzWm81dW1OR1BLcWgv?=
 =?utf-8?B?cnpZVWNKNXUvQmVjVk5NSjJzdk9zSk5RdDU0YUdVbWdjNGw4Y3ZjejExTnFG?=
 =?utf-8?B?RGs5ZHBSc09vSjMrMDNRYnNQL2Y3dEh0MHJ2OHJPdzBnd29TQXQwVWJiVXR1?=
 =?utf-8?B?R3BEV0U3c0lvRi9mUVdHTVZ1cEl1OTdsMkN4eFlRaTJNTFZBTlA0SkhkcnhB?=
 =?utf-8?B?US9yZEIwZi9ESFdLZTQ5U25wRTY3UlM0OTVUa3FoOVFRdTJsQzMxYTR3YjZT?=
 =?utf-8?B?RW50SmRITlRZWjE4dFBlWm1yZS9GcW9CMkpZaFkvT1c2TzhzS1gxVW5Ib2k1?=
 =?utf-8?B?eVE5eEtjbkVlN25VN3dFcTZGVXIzM0JXelZzVFpPMW5iazZtL0hzbmhveFJR?=
 =?utf-8?B?aEZTRlY4SkNudEF0U0NXbjlaeUkrTFdmRmF2YjFNVW5lWm1RSWEvaGlPSVVL?=
 =?utf-8?B?MGJuNDZLR3NnNGNFdXJVM0dOeFFwSFBwZng3NTBudlRQQUNEZlNuMjczZlJ5?=
 =?utf-8?B?N0VTZjg0NkN6VklhYUQrK2diRXJna3dPam5lajRqVFpSN0swSEdXZlEwUDdR?=
 =?utf-8?B?QkU2NGNjZVF0cnoxM2dJb2c3NmlLZnZhZlFIdUtsYVREeGpXSWFsdElxZXRE?=
 =?utf-8?B?WFc3NDlvTUFPaWxOZUx1Q0JhblFDT1JFWmdEVkNYeDNDcnlSakwrcWxYdHNv?=
 =?utf-8?B?WVpXOE5QVHZUUXVFUzQ4MG1FUUdOZnFXNWNYYi9GUVBpMkJBV0tOeVQzc1Fz?=
 =?utf-8?B?NnZYdDdkRDFUQlZrTFFEcFdUSTEyTWNSb0h4VjViUEY1Zy9lQi80Wmc1SEJD?=
 =?utf-8?B?RzVITEdNRmRPWk9KdjdLOUhGUjkxa3pMZmowcEJFekdzSUcwQ3lJYlBoUjky?=
 =?utf-8?B?cVpSUWZYaCtCK0FEZUxCZU5YZDFCYTNuUTRENlNjVlJQNjJTUEVGb0FqbGx5?=
 =?utf-8?B?Vi9zRkRsa2hPVzBhdmZNRDg3R1N4S0JGa0J4QmhBbHl2UGovSjZDZ3BkL3d6?=
 =?utf-8?B?bTFnbHhCNFRJc3MrVllzOFZIUU1wSmRkZmd5NHQyeE50ZENIbnM5ZThXMWdz?=
 =?utf-8?B?Ynl5T01QRGJ3Qm1OaVA0TXBPNDN6SS9ZY2tFU3dobjVSTlpHb0w0eWVCUzFG?=
 =?utf-8?B?MjZEOVEzMWdwUStwNnFKYVY5NHhCbWhicHQ1N1FPRzJjd0ttTGNpQlpudDFr?=
 =?utf-8?B?MWF6NE0wcTlOTm51aUo2aFEybU56T3UvSHFidll4c0h6VGM2TGYyelIyNkVR?=
 =?utf-8?B?TEhBYzg3Z3lmRHYwaHB2bGFyaHJSbzEzMGYxZUhoeEVSamNQS2dNNm1haXBP?=
 =?utf-8?Q?IJLRIGwR6i0xw9rjq7yXZJOyI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e585ccf9-0a60-4ccf-2ab3-08dba0173906
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:16:20.7328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIxMc/74KceKSnfWOeTXsleYDm4+/0WM9cPgOf++H/PCKv3i6GzK//hlosRcp2AK67VCM8sxFQPklnMJnfZ+GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

The consensus is for individual drivers VM_BIND uapis with
the GPUVA helpers that are already implemented and merged
upstream.

The merged GPUVA documentation also establish some overall
rules for the locking to be followed by the drivers.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index bf60c5c82d0e..a115526c03e0 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -106,23 +106,6 @@ our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
 related patch should be independent and present on dri-devel or acked by
 maintainers to go along with the first Xe pull request towards drm-next.
 
-DRM_VM_BIND
------------
-Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
-fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
-development of a common new drm_infrastructure. However, the Xe team needs to
-engage with the community to explore the options of a common API.
-
-As a key measurable result, the DRM_VM_BIND needs to be documented in this file
-below, or this entire block deleted if the consensus is for independent drivers
-vm_bind ioctls.
-
-Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
-Xe merged, it is mandatory to enforce the overall locking scheme for all major
-structs and list (so vm and vma). So, a consensus is needed, and possibly some
-common helpers. If helpers are needed, they should be also documented in this
-document.
-
 ASYNC VM_BIND
 -------------
 Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
@@ -230,3 +213,20 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
 infrastructure with overall possible improvements, like multiple file support
 for better organization of the dumps, snapshot support, dmesg extra print,
 and whatever may make sense and help the overall infrastructure.
+
+DRM_VM_BIND
+-----------
+Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
+fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
+development of a common new drm_infrastructure. However, the Xe team needs to
+engage with the community to explore the options of a common API.
+
+As a key measurable result, the DRM_VM_BIND needs to be documented in this file
+below, or this entire block deleted if the consensus is for independent drivers
+vm_bind ioctls.
+
+Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
+Xe merged, it is mandatory to enforce the overall locking scheme for all major
+structs and list (so vm and vma). So, a consensus is needed, and possibly some
+common helpers. If helpers are needed, they should be also documented in this
+document.
-- 
2.41.0

