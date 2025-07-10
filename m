Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F079B005FE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DAE10E8FA;
	Thu, 10 Jul 2025 15:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ga6JD0VP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4339210E8FA;
 Thu, 10 Jul 2025 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160141; x=1783696141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BmalzQef0p0s+rP9nqDd9ic5JYAqJg5eIDQFxFbHgEU=;
 b=ga6JD0VPLGVOmPPwooJ/ktYJSYPk+cK5pFHho+S+W6GMYNSfAjndrRso
 AFnyrpffVKqdGNQ2RJBsFyyrjKBhuegqZ+Upy6neD7vIoGHg7IBS8R1AH
 ud4DKKfb46q91g9VF6tM+yG63/asB71V6WfIW/95+rme6ejhkDF6B15B8
 v8WpCjlFyND/c2hmddDQe0n7XmUTMQy4EqJozudIm0A1wkh7OCkgY4pl0
 BV2TXV5Msh7zN4LVf+ZBclkCfWApLijR4J4dbVqbFi+ahdHrIgsUBnAoE
 XCZrlbMP7TbpbZLm3u04hBLts5eqyrfyKD2XtNDVY6oAYx7QpUcVzamPW w==;
X-CSE-ConnectionGUID: 4D2H31TzSIOKoAwgq1Y5wg==
X-CSE-MsgGUID: tu1qizwfQwGgnuBzhd9deQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54296593"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54296593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:00 -0700
X-CSE-ConnectionGUID: wi+OJrMaQVm8PyWkZQKFRA==
X-CSE-MsgGUID: zdrPiUEQTuymVvElOqBWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156600196"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:08:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9eRRapYzLRKEJ0kAvaqLdQMjyl2rY+zKRSab2drHFAQVntBWjck98voNBkVKjbYWg/6A8PTICtNpz18TiclzzPxYQk0Dn2JuLSJDdz5XaYBHdLyeR6d4Ym2tF8silpdSNWWS8bUCj4gfWmPotDbNikkOej3fkTiQJhbaxAXa5Z732CDefbU8LjOuYn7JMjIIE8S/Cxq6uefTl/EmWGap6J+u/EedfxN6TLOMtioWIM20i6o6Spc++yMO3tB3qiDSe84fV0vcMxAkgrpA3GNXcs+KxsgpwyFUgnw+3flyVFFZ+dYERJ9WdrwhZjy839M92FnAvCIOLTTZvTZ0pbqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcJ9bZXaTMndB4s2gTBmen85R0QyJ+HZ/puOW1kZ89Q=;
 b=PFzzyrqpGOTYuDa0nD6L2NnRqDlTcM4awZdMh3DRG55j+p5wzXVy4Lu1oGTwpEMkYqmit2HlmED5Lju4lbq/Uz5G6mB1fD86DF5smeUHjSipIdpAKzmZMN13iobXywhkK2A2xD29NnIF1YjxvGY3A/os7jcxTNxqOHsp8ZF79kE83t0xDwYr/8bNzT/+0ouWEVcoo08ZEGchDStn31uByqyO+EarWqbca/ANQsWZ3OYuapnVVkftIbGAj7TejqgnT7poxapps3L9aXlnH1alxpLYfnO8ZRi/ZahYysufezRlZdXvPSM7ACxuwZWnrGI3AMo5l79AFco3EkUZ14YJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:08:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 7/9] drm/xe/xe_late_bind_fw: Reload late binding fw during
 system resume
Date: Thu, 10 Jul 2025 11:08:38 -0400
Message-ID: <20250710150831.3018674-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: cc235ef7-1d2e-41f3-73e0-08ddbfc3b11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qXVqxaSH4DcvQVvPeaOpzwVgtTvQ4uVV14ID5utXOLqlcI86UAlarngayk6i?=
 =?us-ascii?Q?3QZFBuxga+F2Zc2p6wQU0cjNFdl/m0iQEkXYCE8UEM68+g6NWTC2bdqheExz?=
 =?us-ascii?Q?8ckDB9jCkONblAU2+mFoy/qa+hDxPcvEHt97+oiE8kKV3KK/o9cYmf3NAxSA?=
 =?us-ascii?Q?Krca9YPLSfcwi7YVXxKNsd+saSi8hQh3UoEXtnANJYx9ntHmco6JBdPtSyGQ?=
 =?us-ascii?Q?JXCqav2MIS3Nc8BPkGU/Ejk+QmaJJBnKWsplQuhi7tljjziYOsAkfz/Dy3VI?=
 =?us-ascii?Q?tvr7i3YOZdwECIDkP+Ys/JjUmyfCWKJRjF83x3V1i5gJu0vDvLLGGtca0e13?=
 =?us-ascii?Q?S9O/u5aFjXUXQYRr6BE3rCuzigwsG6CxG1EZRavIQW/BF00lsXAByiIB+ObM?=
 =?us-ascii?Q?UiKAwOaUIGXEejLwPC4rMeYT/324uajrpvYan3KXGu78h23jLWiwPBf9VLuL?=
 =?us-ascii?Q?joyr8qeCHR2hK3SD1Uh1E3HY8j5zXbk+eOyK0jVOuznyGrD2K0yOULOZ0ScB?=
 =?us-ascii?Q?J0SZc9BXcp5BHYk3+AAwN/LDRe68ecmuSHVRY9Dy0aeFQLEP+cMVZHKkrBy2?=
 =?us-ascii?Q?kWBkrnFrXdcbgk+7Ufcnhu3XeDlLmYr6belk9swMXq5R8AOs5yuoSQ11nuuw?=
 =?us-ascii?Q?p4SvkwBrTTs+KNL2G8M5601A+xW2gTfqTs8NxdhLdQg2+RU0nTQEJaJ8H8eH?=
 =?us-ascii?Q?NmJHNzV7N8Q/HmLSQ+61xl59WJJooNgh9aM94YELfNwTh01tRYl1WURJek41?=
 =?us-ascii?Q?AJuVC71K0UNit1CswK+hlfBl6QSIq4PhIt5aPjgkXVJaAk/4TvELVxwjHEuk?=
 =?us-ascii?Q?FF9t+K7waaVPwLTnBdbGimyfBJ1fpV85txxnwANMwANE8tApotRUz4E5yzS1?=
 =?us-ascii?Q?zgN1YgwCAsAwB4HwvKdISJxQudeJ9X83/2/EEu82863NEb+MbYxq4YYhIDKi?=
 =?us-ascii?Q?B7KIguNcSG0JiBIrKgvvfBK2XMxELhdpBd+zQdtHM1WsqlC3AZTdMl6FGzra?=
 =?us-ascii?Q?g3pJ0fVqQNKwela6jN9Obw683t3yQWShC6b4m9T5K0i0Befj3epJXwEK6pCL?=
 =?us-ascii?Q?IIn4R8KpxvL0k38spOo0jQ6vAvrKdZ+tlUth5KvkP4B042zUg7Z+qQJOPYA3?=
 =?us-ascii?Q?ZkdVC5S8YCAviH21LZ1mO7/eiAP4++Kroerv0NrrNT4FVA0t7PFShozuJL20?=
 =?us-ascii?Q?MFJChRQlXvtRudwjBbPgOGveFgbCnccFlNwJu9jKuq5TzMSkHf3+5HxrWN6Z?=
 =?us-ascii?Q?20Ei7Nh45vUSYo4qElMJojpsRpQ0+EvZJjuo0qfih7pmXSEFU8J2wVBoyvUX?=
 =?us-ascii?Q?GLrJ1MBUD71TDiBjBPFqWmRkQPFE0ZTHVZcEnB+KZafT9sAXyLSTIDtLJZyr?=
 =?us-ascii?Q?w6L8L/G7B+RWhXRVyMDay/PMAtNdJhxR4/0dIVjk7lK/8hPHrbIuno3N6BAt?=
 =?us-ascii?Q?lIejG5cvVfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ZTy/W8dX1mPTuq+fviFOze3s8msAXqSUSeYb07xfTWaS1/EIFInBJRxeCrM?=
 =?us-ascii?Q?UYzg3i8FphHhImfoNces0qx3b+b8u39s/G5dpCbBYSlLZbpKbCJNMzu10H24?=
 =?us-ascii?Q?AZp0zBfJrTvyqOwURoGOZ+0nGmFSJodnUW+b2SMIZK7++9g4YHYcn3AvcsRJ?=
 =?us-ascii?Q?0qzcJLHffBcMz9KHIelz1ENiU7sO/Q85NdAM+VX3IsJvPsVZKeU0lF97k9oi?=
 =?us-ascii?Q?87Co5eDNDkqM/yH/jeGvgxWhNBvUbbBn06bLxARfPaPSVLGyIrRSSv1JPiV0?=
 =?us-ascii?Q?OGm/WVpAl8fbF3qO/lOWkNAimdeid8jXFeol3QOZt5CYhvSKdRb+dnyrtJKI?=
 =?us-ascii?Q?aBj+nYCAf9uNINYN1WoaGxm9/haTGJEHAPpMd/0JiEvx6n4fQwoVMDimmdhD?=
 =?us-ascii?Q?BZQrDXMW7MouEETfThc5kJNK4k8Vt4UI/xKjf6LiUTbFMxLacrYL1wv4yZ24?=
 =?us-ascii?Q?/TWxxUeJpFO6kBlIGwpAx53ERlu3iTZC5rsZ1bJEweYuKRvk2oIeVIqoMzMH?=
 =?us-ascii?Q?QtkwKfbdqqLkV3tVGB0uVCE29k1wudslhQdTJZ9ZmtnElX1NCP/Ls2JsU85n?=
 =?us-ascii?Q?aGivRl5xqZFmve2ptimhh68sqjploR0mCj58INkF81EuHpb0z/WooywHsv9y?=
 =?us-ascii?Q?0OCow1VSX6ek3EpyOtVnsSHjY0w3PNUSGXP5NAjNLnInjgY2exAaOYmi3Z0O?=
 =?us-ascii?Q?AmA5HylNw6kdkPPbFvtCZZyCMno57sGOdw1K95LVYCoU1RprIE7nvPYB7lId?=
 =?us-ascii?Q?pBqzJIHFRCdR3ubed+oEM16f2bKZoDa4VQCVjdtmT0msoLAAIpM8zDFi70gh?=
 =?us-ascii?Q?kl+N4IG+xKBkihXzXdnqW+KCsGA2O3ODML1gtgz41mAcOG3MLxFMeHe9E2mP?=
 =?us-ascii?Q?kKwu55KRPThrC7rhbOs3X577cGWSn4IRmhetk3dbq+9pI1WqYWNMGeP4WJGb?=
 =?us-ascii?Q?Eq/SIKeasCFBjFAXyuzYcL2uBENuGz9pQeeZCtmJtbuz4orBCBbncR5jtxfI?=
 =?us-ascii?Q?55pz4+6Cdg6oIo/IllhJ7TeFt1yKtCEGK4NZzGNTRhTlCxid+5LUHvlDaZeN?=
 =?us-ascii?Q?w3iIm3Bxrr319FhNCmwx8hFkzGK+wNtTE7BOZtfvZkPOmdcz2jhc2sKPJkC/?=
 =?us-ascii?Q?plu5yTAttP/UFKI8R2evt8511k+QQk18zWe9+9tyLpcy/vXvwEOctQFXrf1o?=
 =?us-ascii?Q?Jum1KX8JZZq+Dkv0oC6AkPxiz9CHCBVnNS8XucRI2+m0Hu6Rvg6UdCHadwRj?=
 =?us-ascii?Q?KTBj48VWDNv8sA6ijCMUXQOZR9jroLmzohFG5zlKybuWAvujUzvduV2H5KJ+?=
 =?us-ascii?Q?Jc0p4gp6SENPlK1pf45ZxCbdbsRXMnFkDVRSCyhrqHW+PFRuPzeVJpoWW1U1?=
 =?us-ascii?Q?k/+NpgWaI0n7rwxx0Z4fMy/s7mvU8PZoFdKnQzNoH2FHgSCQUGPH8Mfrzwli?=
 =?us-ascii?Q?Psb9KXBPUofoBnlwXU7qNvN/r5JbnX4Dzw1W7aFflZg2SfqjXNzBlS3NVImU?=
 =?us-ascii?Q?Bn+VShqPGPXM42lOLdxpkIRQfSpsC6ll8zXG8k9eabdHdIHCM7pK/ztEhKFn?=
 =?us-ascii?Q?TIerYoPOgQoUKvkINWz9kQNlvTqQuANF7w/FSda6QhAgoKYZCVdUxmNG5dBr?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc235ef7-1d2e-41f3-73e0-08ddbfc3b11d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:56.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQu9U8a4bH6LzsWk/kLalSUnPWXKA+0oDblQSHrZD14D3e8338V1C1rSXp0BkDwAA0MTFI8tAlkni/xeQCPjNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
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

From: Badal Nilawar <badal.nilawar@intel.com>

Reload late binding fw during resume from system suspend

v2:
  - Unconditionally reload late binding fw (Rodrigo)
  - Flush worker during system suspend

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b2cd94dd817e..75b65eb61c76 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -127,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -204,6 +206,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.49.0

