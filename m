Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205680027E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 05:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1ED10E7BF;
	Fri,  1 Dec 2023 04:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EE210E7B6;
 Fri,  1 Dec 2023 04:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701404552; x=1732940552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JY63ZuHPIzhKKs1CyHfKkFKnpgxH6SlHTV3aLoack74=;
 b=KP4PGJsOsD2OyTDxG/RNId9phoIE48VyLPfzbWiCcrfiPqfHp8NBP3bJ
 2MxToYb/MzR1xSR06Hgtk/ti4bY15ZTQwymi7Vo98rSz+c5skRUBHSuLZ
 LgFooFtoXTmTWMiNtHTZYlNYFEJNsEDcDp14E+m4NG2joblHpjPEl78Fc
 JEdPr5TzpvbrB09607tBBTGKB5LJ8DvkNMEAxjXZxozOskYyQxQCFY1JB
 65hR72xEEaI/tPuO27PWVJcmQ0gGDX4zGa9MNhjK7tBktneseyp3CD6eT
 3hI4yf196TKuEYkiIIAdnvjV4DvTs0f458RPNNH0JdNWMZSYV/RF/XXa1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12145981"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="12145981"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 20:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860435450"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="860435450"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 20:22:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 20:22:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPr4GAauhAVMuzmOlDgBytLodkDXc6634d5ghCPLVE4itLL9b26ygl/RIRk6a8SP0J6YSAisgPJNyHqXcynlq2W34QylWZGdN4YW8CzcEmarMPhtre8gMpDhixa3EQa6YOuIhpbaEHi2/UXJiFSdjfhAT5BX9UyTV9PAXo1nFEk4a3W4+H9J4VdOrV23QJJzwR0Bz9Y5iDVKArpxsBOidPKHW3Tw4q2chN0vOdNyDRz6/gQbFrggcB/v25mdJaCs846axn6hTLQLRlBWsWV2IEyPxpnjM9mj/1tAq8+sSpWooZtPefLBqtG4gN7IXuFe7QVivbHgyhB4O8E5pT+lUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abPpy5bgo/rnAGKjS7nxoWMXANZk4CU6YNXpxfs3BWQ=;
 b=X0/zaI56jdRXOVCa2C4vF4i9EcefWBXoAlBXSqLLhVSSMa3NqdtP7a3NGlt0m7+zwxq5UsVU+Q2yyCg7xwO+OFr3BvL4F783DecWQxiwCQ263O9PJMKhMuoUh+HAUO2lqjtFP7dj4Wa43pVJZt7yUI0sfS0rjvS+wfeGoVR2NOyqgrBRi/SP14qSrE02MioEHEK0hp8z0d4VV7hlyRoQs1CgCFpt8Oxk2rFoFjh+OrgYlD2Gu7mjK/jxQBtfiexKkSJoZ8Sk5KPGI5T1x5BlHXxR9GJOYu4VOLT+0nh4eOeYUj9FTXWwmH6wt1iSi+FXjSwttPv/eYWrD8stvHUyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 04:22:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 04:22:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>, <christian.koenig@amd.com>,
 <lina@asahilina.net>, <dakr@redhat.com>, <boris.brezillon@collabora.com>,
 <bagasdotme@gmail.com>, <alexdeucher@gmail.com>
Subject: [PATCH 5/5] drm/doc/rfc: Xe is using drm_exec, so mark as completed
Date: Thu, 30 Nov 2023 23:21:55 -0500
Message-ID: <20231201042158.80009-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201042158.80009-1-rodrigo.vivi@intel.com>
References: <20231201042158.80009-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf59a67-1a96-4ce8-c628-08dbf2251dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0cV0SOQVeeLlONeb3RPMwBnGMbkAYgCjHFqUX9twlIbzOM+WsiIDSYI/1XKWgYVH+IUNwGljoClvyFFFF4AOgDqStj3+z+N+uMFK7p5L1kVoAHmcYfW/zn4F9k3IlAIkeOo1ewQRzGwA4crE7Bj6NiOLDgzfcpVzCvfz6dqirM2yNP9D3C7fCog3xwhB1J0R2gom8Eumo9omf+4gcUq+FP8SjIGhtVEh0YN64acCKYo1bnGJVVyginwUylJ6765QgjhN82C/ln+MvC7UkjZn+7Th14Cjg1i7SKDsvt1lsjyFaoQOjvoDvZftx71hwmnY2XrXY6AdD4Mgpavnjby9CktAsdrNdKViPAOE2t9VFKo9Yg1NLtkw8gL2E+OaIxX7lIq47EB4aReHR32EK+ScibMovUag48mcF8tC/Q0zSmoH1937B6ZuCFo/7tJCAxugjIGn2w4OohJ4gZwhyThIsA8GGuOrSIaAhOxYW+vu0v8cDnxGc83Y9PHQZ5VgFFIgznRs1KVDDBET1BLgine1Fiwy1+Y3T4cIGaNdDi+pq/QvJJYn2ncVjTZkPMIhomIYw4ErF0pRZebC5P7SMrlwh3BQ7dcM+5vlZqLvmI+YTK/tM0T5ddbH1gEKx1dmEomgnhPchRrIRw34p/fE07E+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6512007)(6506007)(1076003)(107886003)(44832011)(6666004)(2616005)(83380400001)(478600001)(4326008)(41300700001)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(316002)(66556008)(66476007)(66946007)(36756003)(38100700002)(82960400001)(86362001)(66899024)(921008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTh6TUFvYndKcUE0S1FTdTU0UGhUMllkUmtKK1E0MmVpWTJmdUpmYktlRTdt?=
 =?utf-8?B?YkY4YW81bUw4Z2xTSnB1cnRzL1ZXeFc3NWFucmZnOXJNWXNCR0Nhc0xxWDIy?=
 =?utf-8?B?MWpydE5VKzIxMXVrZXA1N2FCOVRvL3VjM3NPbmYzcnZGMHZIRHVJSFNLdW4x?=
 =?utf-8?B?aHhIZXhHY2RLTjM2R2VLczByd1dnYW5uTHcwYkwrOVVvb3AySVo0NW5GSWMz?=
 =?utf-8?B?a3NsMjVtU0NkNy9DNUFFNGJseWNrSnE5RE5VUm5ETE5TS3p5WitMMFVIYU1K?=
 =?utf-8?B?Q0VwRUErRXRPcXJtblRZUkVtWi9CcElYRjd4NUo5Snlpa2lMNDUzRnFHa2d2?=
 =?utf-8?B?dk5ITzlsTXlvTjRlWmx3VVQ1T2thZ3Z6SVpuU0RaSCtSNU4vc1hqMlg2Wjha?=
 =?utf-8?B?SGxFaE1ibU5xV3dibDJ5dHcyWjdERVJKckg3ZHp3R0d0NkZZTmdmTjJUdGtN?=
 =?utf-8?B?OExraXgvVTlPZUtaZktnTldyanpSc3dVUE0ydlBSaEdFRlFKTmNSekNCV1Jn?=
 =?utf-8?B?a1ZXd2p0WFNxRHJQOE5ENFgrRG9kUEMxdGdsM0R1TDNxQjhaUkJYNTRHc01M?=
 =?utf-8?B?RzFuaGd3NzdpNDFseVZLdnlaZTM5VFdPcVR1SXhyL3ljalR3dTlCT0lENTVD?=
 =?utf-8?B?cEdGNVpoRnJ6UTFwUEhsRE0ybnp0OFMvS0p0VTk2SGNIZHJnNnZVMFZDT3ha?=
 =?utf-8?B?Z3FMQ015R21kemJoRHBOaVdJY054RmFkelJ3b3RZMHdROTZVRm1YcHdWcEJh?=
 =?utf-8?B?ZjFDVlg5Rmp2ZTMzRVB1blU4MW52S21lWFJrdnVxZXMybmJ1UmR2MGhuUVFl?=
 =?utf-8?B?RzJxK0ZSQnlzZUVOVFpyOVdtbWFGMjAvMWx2eGRjOTdyTUc1NzlxQ21rdHpw?=
 =?utf-8?B?ZitlZ1pWVmUzS0dWaWhua2NoVTVsc01MZHd3TlJrb2lEYXN3ckRpY0RvZW1S?=
 =?utf-8?B?Zm9IY3VKeEprU2RvS1NQQU1TcEgwcmU3Y0ZYRFVpNGg0SitFYnIwNkc0akhY?=
 =?utf-8?B?MGt3UDVBVGtYcXhtU2c2NVFGSmlUdzhtb2ttc3hScnNsSHlQM0lhYzFNTnBz?=
 =?utf-8?B?dTFWTmJENzZxY3M1bXpWbVRiTy93WDczc0t5QVJMWkVFS1BBYWU4aHFzUzh6?=
 =?utf-8?B?OUZJWWswVEF3c05Ec1k1QVdHSEZqZVdNMDJhOTBQVnBhTXRqK3RBQ1FmbldO?=
 =?utf-8?B?NlFYRkpUV2g3OG5CL0syWDlCNkJQZGF3TGFuaURlWC9uVDBZNHl5ZHRMTjJI?=
 =?utf-8?B?RFRMTS9NeSswVmI3VmJTa2ZuOEluZlJ4T1ViSjc3bjlDemY4WHhwcUZ1U3pW?=
 =?utf-8?B?Y0d3THU3QW9xenBZYVlxSms0ay9SNFNGWndXeUQ4SFR0TGNUQUpGM1dkUzhM?=
 =?utf-8?B?NGZ3MnAwNU80NHdCNzRuSWRHQ21MK3E5ajcyd2pNd3BCd0RKWE5sdTUyQTJv?=
 =?utf-8?B?dVphOXZxYXdlNStzK0JNRjUyTWVEb3FCTTdZNzMwRmkvSTQxdldwcS8ybGN1?=
 =?utf-8?B?WWg3Wmg0VWN6V0xyQlcxeGJpVlBoaUVzVzZsWWZrd1ZReVhJT0xiMk5MUytC?=
 =?utf-8?B?RDYxZTF1N1dBdG9kNk5YK2p5SnJLTldFcnphNmZGRkY1ZGVoZmMyZUcyQU1x?=
 =?utf-8?B?YlhIRmpiWDdWaU9KM0hTN0luby95SGtFcFEwbnV5bGVBQXd2c2pKRmV5cmxM?=
 =?utf-8?B?alZqQW5FODhMMis4YkpWdmoxSFVPbER0Q3RLN1BSMmlmNWhzYlRVekppT2tM?=
 =?utf-8?B?UFh0cFVlb1ptZW9kSUllbkltYlZZUitscEhVb1hpaTlmTW85ZExOMlp4Z05i?=
 =?utf-8?B?Zk9GdVJ5aXNpZXZ5N1VuUHdhbmpsWUpNaUdBQWpGOThqdllZek9TVnZTRHJo?=
 =?utf-8?B?VWdadTV6emtvYjBPT1lRMzZjVEVxQlFjTGRKOG1ibVRQNXlqb3VQS09yMG95?=
 =?utf-8?B?aGVrSERydHRZdnFmRUhicGFNTGRDSnM3SFFCQ3E0M3BVOGV1enFKU3JrV1g3?=
 =?utf-8?B?RDkxMEtHREl3T1g5SHVUMkh1bVZIRlFLdGh2VE5TNE9Obm1RZ1MzSEwwd29O?=
 =?utf-8?B?MlVzTDVpNmphQWZwZk1idXlmaEtGSXc2VTJ6M1krRFhzc0lKSElKNFVnSXF0?=
 =?utf-8?B?cGlITkkrRFRYZHdYY04rRUZMNG9ZRTlEbEJCRVVIU3p1SzV5Y01LSTEza1Jt?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf59a67-1a96-4ce8-c628-08dbf2251dc2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 04:22:23.1777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf/7PZ2dbV/TRMN6ZHBhls1ULqGxgCSfow7o9Zoh9YaxEmZr9FYWfmRfwWjuhDx0UY05rEVep1P0zGI2WhMtdw==
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

Nothing else to be done on this front from Xe perspective.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index cfff8a59a876..97cf87578f97 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -85,6 +85,14 @@ from the first pull request of Xe towards drm-next. The expectation is that when
 both drivers are part of the drm-tip, the introduction of cleaner patches will be
 easier and speed up.
 
+Xe – uAPI high level overview
+=============================
+
+...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
+
+Xe – Pre-Merge Goals - Completed
+================================
+
 Drm_exec
 --------
 Helper to make dma_resv locking for a big number of buffers is getting removed in
@@ -99,14 +107,6 @@ This item ties into the GPUVA, VM_BIND, and even long-running compute support.
 As a key measurable result, we need to have a community consensus documented in
 this document and the Xe driver prepared for the changes, if necessary.
 
-Xe – uAPI high level overview
-=============================
-
-...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
-
-Xe – Pre-Merge Goals - Completed
-================================
-
 Userptr integration and vm_bind
 -------------------------------
 Different drivers implement different ways of dealing with execution of userptr.
-- 
2.43.0

