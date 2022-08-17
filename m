Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7C5979F8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 01:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C4C8B7BC;
	Wed, 17 Aug 2022 23:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F53DAE068
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660777708; x=1692313708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Q8XazYjtBW+hhugEO6TsKbA7XVDndVLjObZPW5f1X84=;
 b=RT7U3dIdDfdxTdc+5vBlcDo7thzrJ246hsY95tRyJLPza2fpYlMltO+D
 NavTn/ooUCSjIPmzZ7OU+4Kic7TqHKaoeMaASqa6rbxHssToZD6WAYGsc
 Q8kNhc6KzaEWdmWLB2Br2hoYKYZniEZHQ+qAhnstlTnJNrXr7Ml4N7jxx
 lKDwANTCkhqgWzq3oK7QetWyMM5JulX11J73rCoSL2cDNX3Uzis7diXk0
 1Ev5HLrk5Oh5csfQiDSs2++mSpVV4eNnOpljq6zr7stCyH19cFG1qgX8j
 xRZJ8+J/gBcvbAgf6L/EBA5kGOZRvLawqJrMLa94lTAI5CTMSH2IR2z4U g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="354361521"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="354361521"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 16:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="853205810"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2022 16:08:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 16:08:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCjUC3HRMI2Racn9LZG0CV8yrTIpBoaEijZ25bfZJnTOxNIzv2MmcJrAMwRG/UTxWJRp+gls6M02MHv93qiA6gwaInA2BkKaGslN+g9/Kplr3prkzduapnQtUjdML0YStLtbGHajdTYUOSe4Tj22fnlBJFaD8wV3M34rGY0MbEA6Mxcl7iH0kwMeg+cQCPnbWl3ak0svJBDAsFk2JOWvN89Kk2DOpuvTvhknWf/aaoxQ7kx5O3R2atS1OGX+HnrP5jH25ao9AS0/xDVUjk01hX2btwQi9103+m3lTIdElQwUREEcXUTYP+xQn6IRXxfhPZXVt8EM9/WJr6vzjvHZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO+K92HvKstucDSiGaZVWe/A/5/q9niq3GnLv249cZA=;
 b=Y8MqF0ziYKVIk3oYkqf9+Xda6m1WIALu3AiwzoQ8PohMvJ/XomdRq3m9+t/u26YI34qOonMUNtaGLNVFjZn670mBzPxOgD8pkUB85+uWjmyu3cj8AfiDhY74VXC8J391i50ETCp3G9Hxs70lM0ObisJeONEFODDOYBJw5KkUvC/9E8TfKu7lmPc/HoNyafJIxNXNrL0NE5oQx4MifDf8Ri5jdV2rTkEMn1oTSB0iDgPLog89GYDgxtjUt2nWMb5weczg30rBTZsD203L0TtgMMh1ontxNVd86fp6dLNoNW7Hma+dCKAnwCaSYawzwhOP3szRGDARG8VsRPBU7jMfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4190.namprd11.prod.outlook.com (2603:10b6:208:13e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 23:08:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 23:08:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm: Don't reserve minors for control nodes
Date: Thu, 18 Aug 2022 01:05:58 +0200
Message-ID: <20220817230600.272790-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817230600.272790-1-michal.winiarski@intel.com>
References: <20220817230600.272790-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a0402b0-3979-4cfa-584f-08da80a562d7
X-MS-TrafficTypeDiagnostic: MN2PR11MB4190:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldEmm1mBLPVNlqEWUTWjr46B9qknE4gvfCy4LRkDy1gxO4hPEdPXgqxo69CTjB9OPygjRPWL25n3UM8VZrPLTalIFnavonWHr4Nn04YtoURkyqTP/jTaiC52SFk4YR/KSrqmj2Rb9uGqCFNAIDaDPmPVKdLRDNZnAQAAVbFKFMwi0WQ7I0692PrpcPTDVWaP6exlaZ/Z3aKbfx2tMD/1y4a65nZZZb01rLtQX63dJoETqDKvwpjVApD4RteRajzF71q5emoqnUYahPnT0cvLccqx4liooM5JHCxPNt4OPrNd5TNPYjMTK33GGZdo2rv1S8sI3r4OShu3w3gZ5mHzo6iiFOIQgtJyoiSqMcPm+CgsAPQcRpeV/D0qGdgqO8piZfikC+txEAMQx1DkNa1CJtW/8Im2dWIg2hfiG++ToS2GWwxz+8IW9B3mEUosxH1z/bQkfYXp7zmxUberoTaU4kkusSQTmz2eprReD40dywcGACoCEMpndE/VAMakNVHt9HOYwxFx5iLQbynXaOz42HlF8mB3JOnPafuikTtnH1/qz4oaGaXE0Mn46Ut68dr8+9vvncYLcXtMPeDMJYfKINu6E9vdIT6LZX7d5NBZIUwBaH1Cc1og4UserO0BnjZ52cfbKJSoHacnnzPZl2taffIScekyFjjiBvNvNgHtjzLJ2c+Rya0aal8rQPmo0hBl03v4fV+g1GW58SkBQG/myQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(86362001)(82960400001)(38100700002)(316002)(54906003)(6916009)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(5660300002)(2616005)(1076003)(186003)(83380400001)(478600001)(6486002)(41300700001)(6666004)(6512007)(6506007)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJNVVBGZlpHMzIwbUNWOVk5YndjdVhNOHpVWWNBNmJnNFVpOUdvN2kwdy91?=
 =?utf-8?B?eEI2ZzJhdmVoQktIczlSR2JwOGtiNWhpZTZqb2VKSnlVS1VmcmM5Qk9ldVBl?=
 =?utf-8?B?S2Q0dFA4NEtGRGo3RndPdXhGbWNhRkM0QjRlOEYwNmpWL3ZTNjRFT2xGMkJK?=
 =?utf-8?B?SE9lNzJLNHE4NEtIN0NROEN2bk9HRWxVK2xHTTJvMGs0UEl4NVlFQms0eExQ?=
 =?utf-8?B?Q3ZNNUI3NmRhRCtSUm5FUFRiQkVGbmJ6ekpnNS9FemIyV0dJSFZ3Z25SMUhM?=
 =?utf-8?B?Ums5OTFDbzFOZUsySVJJUVVvbFFFYVY0eWFhb2FDU2g4WVpNM2lBWjd6QXpK?=
 =?utf-8?B?L2N6NUlUc2NzSXZNUnNKcXVXQWZUbmJDUm5kOUhMeXNQMlJTa3JyOHlZN3h6?=
 =?utf-8?B?RmYvRk9aWEVJMG5KV2doRnlSVTBFREw0MlpjK3VMQ0ZvTFViYXBJbUd5N3Mw?=
 =?utf-8?B?cEdDb0JyeVd4YzRJckJWQk8veFBNUmdldUF4akVHNzl4d0ZOYkFsM0VWYmo5?=
 =?utf-8?B?SFYrK0hGQ1YyMW5yTG9rZE5CbEd2U2hHeWYrc1doRXFMMS9JZUxkRlNzdTJG?=
 =?utf-8?B?dWUvczJOaG8zVk9mcU9zUFU1QXJxUWF6UXViK25CZ0hHQ2FrcEdWRXM5cWlv?=
 =?utf-8?B?THdBTnZvK01vWGw4di84cmhNK2pEcnYzaU1WbVdVbzFSdGVEVnlYdVFvcnhl?=
 =?utf-8?B?UUZ2SVkya2k5M0J1YVJ3ZmJ5czhzZHo3N2dUK3paOWlZZHNtVS9lWUhxMkI3?=
 =?utf-8?B?ZXRUQlB3MmM5UFkwT09Vb0MyT1lpMG90RElLbWY4M1V2a0xwYjlCS1owUG5Z?=
 =?utf-8?B?bHBTT05pN3Bzb2VKbXN5VjlNVkFUaFJKbWhuUzc2WUFLVDZwWXowR3RJVDNy?=
 =?utf-8?B?YVRmbHhJQmliS1RNWXliRnNVZ2cxL2pzVDlBbld4NDJOdngwbzVFd1NzZkpS?=
 =?utf-8?B?OGhWbHRzQjRWRUtpQnkwNVVLTlZGZk94STBSbzhmUTBHSHVwZHpVSnh5YUpo?=
 =?utf-8?B?cWRCTGNtQ2h3eHQvN002YTUvTFlRK1ZLcjFGeTNCSmE1emF4b0dHTzVYaTlU?=
 =?utf-8?B?SFkxMzJzeDlKemJDYUdjZ0llQkpPdjhtOEtnZW9QWS9ic0NTdUVyNXpGdEdz?=
 =?utf-8?B?TCtOQ1ZrSzczWnBwekFteUZPMTJIVmJaTjFTZlBNK0NCTm0xMDZWd28wN2FF?=
 =?utf-8?B?OGhRN1ZKYUFraE9VRDFMbzdtVWd1TCtKc0NGTXhHNEVsQktKWFhvTkh1UGJG?=
 =?utf-8?B?aUxuY08zbUlmaUNzditwZEpmWEJzZHgyQTNXbWRKeS9kdXY5YndxdURNSmNO?=
 =?utf-8?B?dnV5UG5EWVFjOFBZRllBVUpPY0lyR0pHNWNGMU5oRWxGb2x5K1pTL1RaTUM1?=
 =?utf-8?B?aVNodXJITzZ4dncvdzh1QnJTV2pheEdEdDF5V3lvL2h6TW5ZdlBnS2pCQllo?=
 =?utf-8?B?QjNTd2h5QmtvQUJMSXNRL0tjbHplWXRnTUN0RHMrcXVqVUFkSVNlVXRrUXl0?=
 =?utf-8?B?MFlidHg1bWZpUDRlZnJISHZxcVBkNTFLc1h5dGQ4Slo2Z0xmT1QrWWRrZzE1?=
 =?utf-8?B?bUhrRTM1Sk0rbFVZNnRyUFVYci82dFVoWG5XcDdWTkJtQjYwdUxQVVdwdE5Q?=
 =?utf-8?B?M1VGSWVlbXBhcmt1RWd1Vno4VFpGVzRzaXRHdW42N1J5OTY2V1pEVXJwYTgy?=
 =?utf-8?B?WHpTN29wRHN2eWR3ZE1OYmxRTzBwanExSlVubTA2VEVnbmtka2FiV01WTmpw?=
 =?utf-8?B?SERpQmREdWFVUUczYzZEMHpKM3QzMnJFdnA0U0pJQ01qVlRPUHlnT2psTERT?=
 =?utf-8?B?dHRNbVVFZ3RRS1BiQzlwdUp6RmFZK3NpNHlPelRLbVIvdy8vQjlCZ1YyQ2lX?=
 =?utf-8?B?MmM0RUNJQ0VOMWtrWmZZRCtaWFoxSldYYjd2OWhLd21pdWV6bENZQ3BiUnhq?=
 =?utf-8?B?NEcwbGVkRjh2Z3hnUlpINTZqOWFSYzlYSUMwSDRlWXlnaVRUTmZNb0JDUXVU?=
 =?utf-8?B?bVZ2YlArQmFVTm9ocjUwU0NUMmhaaHB6TkpwbnFpRzI3REIxa2YwVnpQWEdi?=
 =?utf-8?B?NlZNRTFreUZFbXE1RG16QWRTOXVRbmkyTWF5VkhkclM2cUdoVUtNMS9kakhL?=
 =?utf-8?B?V290TSt5eERCS0tjbHZNdzFxbmxMOGZHc2paNVI5L1ZNdGlKYlhlaElFSlRm?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0402b0-3979-4cfa-584f-08da80a562d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 23:08:24.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XH+b+5oAPfMU6PhTt1/zK5bHIRFW2H6xhr+z2UJRcfrOVGZEDNy+uogv3RClTAEY7VwBQmy8J7uef4pDVrrLzeT6j8HQGjAuz/kv+IjqdnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4190
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Control nodes are no longer with us.
While we still need to preserve render nodes numbering, there's no need
to reserve the range formerly used for control. Let's repurpose it to be
used by primary and remove control remains from the code entirely.

References: commit 0d49f303e8a7 ("drm: remove all control node code")
References: commit c9ac371d4b59 ("drm: Fix render node numbering regression from control node removal.")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 4 ++--
 include/drm/drm_file.h    | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..d81783f43452 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -126,8 +126,8 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	spin_lock_irqsave(&drm_minor_lock, flags);
 	r = idr_alloc(&drm_minors_idr,
 		      NULL,
-		      64 * type,
-		      64 * (type + 1),
+		      128 * type,
+		      128 * (type + 1),
 		      GFP_NOWAIT);
 	spin_unlock_irqrestore(&drm_minor_lock, flags);
 	idr_preload_end();
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d780fd151789..a3be533e99e0 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -54,7 +54,6 @@ struct file;
  */
 enum drm_minor_type {
 	DRM_MINOR_PRIMARY,
-	DRM_MINOR_CONTROL,
 	DRM_MINOR_RENDER,
 };
 
-- 
2.37.2

