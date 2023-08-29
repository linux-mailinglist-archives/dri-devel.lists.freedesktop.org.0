Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC57678C9AF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413B10E447;
	Tue, 29 Aug 2023 16:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6A710E442;
 Tue, 29 Aug 2023 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326828; x=1724862828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iLKYyW8jnAKABXQKndWxum9OIBDuPJSREhWJnSo0Xhc=;
 b=JWUJvJXeO/hxuRhPggMH6utPVWRM4nwalOpRQ47ROxKWNQ5m9rB7uUW+
 oNQoceNC8B3KoRAUw4hzFtqYxjSW7rIGmfxjCO1pX9hfeHl8kudBzKP0L
 Cco8H99DqWFmMRb16KZ+A5cm8P2imXhO/krIv2rNxJd7AZEHBv9dU0m4V
 O/+0xwsYwOn/sGlUIaOIlmkVViWyYSyDXobWW5lPMeoc3O1a5e2Lozn+l
 P2nPhD1VhHuwUcTm0qw51lbjQYJirUCPmsqZ7v8hTkTWjwaSCWIHcV52y
 8/Dtk7jFps6trsX9Mc16bNVkS4vdl/TGCHmAKiriGkyBjJUetjIaak90x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360417100"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="360417100"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862307970"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="862307970"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 09:30:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 09:30:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTy2SPRtOA72iHc+Pt5yP1ZMwPTFnQfj70JET2aqbZFhr2TEsLiddYv9IsuJqeEMxSNu02QiBEitLlkpSCSvhhWdDCW+/eVqXE0vqeXbYJZRCkicp2XGXER0fzWo8EmgWYc9ZpqdfsLMpS9p8F1/LZFgWQ5DkDo5ZrzF0E12/Ysfuivl5GMPz9t3B3705s6TiQ0qtiHtI9pTbX5CpjOksqOmQdK0HVmhQBxN4c/A18KjHH4OZ3eYu0QFPPTLxt7SvsbWm/NfhJUoEKZNgwaxp3jJUFMESJf8Q3iBdKo6nMni5KUU47G+HDZe+kF1Tql8ZtCkA8UNB+ocxAgMDamW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYO13o+GPFjYvOotzkaC7fMPTTbwNP5OYDk6VZacsBI=;
 b=YM4IMyqYwmqiTh0OzesBYn/30NMeulITeSd7yKuEUhu7GvGKtzh4k+SNGcNKZAU6ozeGCA6NMvJM7M5hfeUCuXfSNo6IkYy/X1asp+OyaW0suokLuaf493I2gEwb0AO+uNPyyXL2AsFAMZkb4uQ1nI9zh1q/8aeDG5yo69WISvpObvF/0yF4YC4mNB27eN9tVpQ/i/k/OW9J3WF7qtjRGDNJwtgEerpFzEyMXS+U6Rz5hzUU/EKK2e8FMeSVeit1WuTPw4NYS1PS8Xp/Gylg3IEbRVmKnkAZNjzpSS67X1Y4dFRDk+Uh8hg99xUluU4c/rcNtCI5IhFMPfioBoRnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:30:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 16:30:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/doc/rfc: Mark DRM_VM_BIND as complete.
Date: Tue, 29 Aug 2023 12:30:03 -0400
Message-ID: <20230829163005.54067-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829163005.54067-1-rodrigo.vivi@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 35988559-d40e-411b-9b66-08dba8ad3aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7AOFxARaq1VYeFhmhHW3gPdU3CoetpEBMbfqWpbccrym3EF21D9UUXPO8L8okDf/4pRCM8KQVZMGeIaqDvp3RacVTajW/bvH08ifyT5NpBnHqwcFmsypOBXpt2ENVms/Tqro5XrDGnJo/J9NgSIPbcLZC/USZf/5NtDU4zcOJrVL9O/kY8Sdc0ZtSkMqK0IbABjrvRr03oArYj6XmqRENSvjtWCd3nXY+4LFj/Hd0e21tVl/mN3bHrJDxfh7TUTP1hnB8Q14GruZVYLnMJx2yr4p8GBxJS2HRnY+tjCHUIxlevIZTfT7p1gZXiUoWRRAF2qSvOYO21W0Gx39MxTld1kEb2mwixQ/9dM2PeOVoNTf0KkJjK72GBJc6hZnV6uBIVv5TPnmKMSXNx0RY8dtUYQbsFj5zIDsypeL3WWvZN1jXgjIvYKwvgI/MoRZlibtsvt7HEl/ZiShkq6Thg+MsOVICOJbgj+CIEpScdzXhLiBGjYOm1yp/atiVF5cE8xoOJy6jirtke26gKKnlkruugEJww95g4esTCKRu/fG4JD5ssKQ8hdaRp9BM9AyEQit
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(478600001)(6506007)(66476007)(66556008)(6486002)(6916009)(316002)(38100700002)(41300700001)(82960400001)(6512007)(26005)(36756003)(8676002)(44832011)(5660300002)(1076003)(83380400001)(2906002)(107886003)(2616005)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3UyeEgyaGdoNGF0RGlkR0pDcWtUZzlqVXJYd3V4QmlhaWJlYTlQWUhRWkFT?=
 =?utf-8?B?cXl6cHc5b3VldXJXUGpMMFhML0NpbUtrVXdTVW0xYU1NcE1pYUV5T0VrV3Nx?=
 =?utf-8?B?NHBhU3NtYTVuTXZNSXh2UXNXME5kZzJabDFVWnZqYW50NkNsUDBvV0g3dFBK?=
 =?utf-8?B?RzNkZHVCbER1TzFoTVQraVVKeEI5a2N6NVRBTHZaaGpRcXlHazZ3ek1Kc0dW?=
 =?utf-8?B?NmNBQWJkUEdHRjRBMGFvN1V0K0Q3eElaVTVOeGo2RWlTakZZTHBOK2plZWVQ?=
 =?utf-8?B?YWdCQjBES0pwQndKb1A1NitTQzR5TzJPNFluaGg2QmFrRHVrL25ldmdLbHQv?=
 =?utf-8?B?Vm9NNytsWjhCNkdmVkRNRmNjRTgvRjVyRHBocStzWm5sVWFjcEZaMjF3dGRR?=
 =?utf-8?B?eUlFTXVHVzZMdXBqMTFlNHFNSVdnb0tCVGwrTmc2N1lNb3BKRjdtYmhYTUdO?=
 =?utf-8?B?a1VuRmFiS1JteFJDOWdLRUI4TDA5VCtBamRzVytudFhORXZnZEplSzVkTG5K?=
 =?utf-8?B?WUdUcVU4YnJwbUFuM2ZmQzlSdHlnc2ZIZzVnK0szY2ZMZXQzY25kVll5Q2l2?=
 =?utf-8?B?Sjg2UXRDQURNZ240Z2liWEcxUHZ2MTJoRkFOY1l2TlQ5MHlkeVJsR0o0RlJw?=
 =?utf-8?B?TkFaWGFFY245WVlmUG9ZbmQza1BsOG9UdEtYQWszT3FyV1FJN0pINVpWdTl0?=
 =?utf-8?B?M1NRT3hDZGJtN0Jwb0xqQ0M0V3hxcDVvU1pMUVVPU2ZyOStHNTRCN1RZVVJx?=
 =?utf-8?B?NlB0YXF3bDB1MFRsSFFHYjRwVXBTcXdnemNQWTNiT1A3Y0FsTGdKQWtKU2F0?=
 =?utf-8?B?bEVBOWtlejZtdkNua3djeXdLSmp2VE5oaW5pNGRnZzRGNUxhZEZlcy80L29p?=
 =?utf-8?B?NHpxZUhJRE94aXFXSVBYUzhwN1ZLdjhnT1E3aUNha1g2Rk54emUvcWVrSVQx?=
 =?utf-8?B?SDljWEVsN2o3UUhTUHpqbE9MQkk3UTBORTNFZlVhQ2xIbVdMcksxaXVUZFlk?=
 =?utf-8?B?emJlL040SzczN0M4U1JhZzlLVjlWWmNtclhpTTVLUS9hQmN4Q2ZwU2ZKWHgx?=
 =?utf-8?B?QU9MbUprYXYyTngzS2o3YmQ0Ulh4TlQ1R2RvYmpYT3U1ZllEL0FzNjJzMXRM?=
 =?utf-8?B?WHhrVkdDZURGRnZadW14M20rV0dEWFIvY1ducm1mMTFsQS9ZSmx5eGd3Qy9T?=
 =?utf-8?B?S3p1UmNyVmd6eDJTWnFnR2xnU0UvWEpjOGMrbW5mc2RVTTRVWWU5MEl2Nm42?=
 =?utf-8?B?empQdVlQdmJ0bTRZSnlyTCtlUnRERUtNaURoR293bXV0NEtCczRPOHNpWWha?=
 =?utf-8?B?VjBScnU3UUpkMVBxb3F1NU5iblhpSkVYY2RPOG9wQzdjQmtLMkRkWFhwK0VS?=
 =?utf-8?B?cDZyUXVJaXlxeDFBRlduOGtnOVZub3hCNDEwM21qUXZSU01JQm5UeHBhTG9m?=
 =?utf-8?B?TFlxTEdiVDBKWWxXd1FMM25SbnkzQ0ZleXA5VVdTZXFSWmp5N3BsM3Z5QWJp?=
 =?utf-8?B?RnI0ajgveXJHSFNCbnF3bDBPWlRBb1phbFd1Q3IwSDhnNzYrSXl1TmxmYTRz?=
 =?utf-8?B?QWhpRTY3YnlnYTdMYlJ5UUUzdGtNblZuejBBM1M4bXd4dHVvRVg3MUVMcUt1?=
 =?utf-8?B?M3RmLzdiVmc4cmx5L1NSTlh6SjRXL0NHSVJBRGpXOHozWnZ5ZjR0TTYzUHBr?=
 =?utf-8?B?aldQVHpKOTNvYzF0QTBDbVhQZ3dSaG4xVUJiOGNiZnVnZCtlZ2NqQVVOREFT?=
 =?utf-8?B?elNJQlFubTVaNHNpeUxOL1pNWTdGQmhOcXJNNzF3em0xK0hBL1ZHU2ozZlJ4?=
 =?utf-8?B?cDlZbURwQmZUVFIxNU90MTE3cGw2WmVNcGdxOHBFQnpjSTVWcUxmNWM0Ym1E?=
 =?utf-8?B?aS96VjRkTEJrYnQ2V1RpbG0rYUJYVGpXN2t6M1AzUVNyaUpuUXZjbXdadWVh?=
 =?utf-8?B?aEdVMElNQkhZNUplQU5kM09VUEhqQzJ1K0ZQSVpXMzRMN1BOQmdxelcxYjgy?=
 =?utf-8?B?emNoRndTNERoVmN5RTkxaVJWUHduV0FmVUtyS0RvdFRtUFd2Q3JrcVJuQk11?=
 =?utf-8?B?c2JHb0hEWWVvd21IQVRVSEErbHJzcE9ud0R5V2dNSXJVYTl3K1AzTWZnK3Zx?=
 =?utf-8?Q?Xj4F9g8FAlhq7oaIgYfjzv2SD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35988559-d40e-411b-9b66-08dba8ad3aa8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 16:30:17.4235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y45gGPi4MbDcRtq0Gm1jiFroS5G3VxUxacHJROk0cbdPi4Y5UoEnFiMg9sn2aBaDMYDbutjgUdtSj/0NDTqFRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5442
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

