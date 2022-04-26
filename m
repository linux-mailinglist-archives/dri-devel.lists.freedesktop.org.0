Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F57151047E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1539910E8B9;
	Tue, 26 Apr 2022 16:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562DD10E8B3;
 Tue, 26 Apr 2022 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991805; x=1682527805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mFfNI4FODjVGNAGq0nM2wd/bI+35OODuP1czI61BXaU=;
 b=VaxvphZnakwTniy+Ile7/iQOBP7DpFprCuzZ/FjBS5ylrCmmQZdRgIN7
 DT/v25fY+3QSLAvK1N0Csm4C8IjvxLOzcmqRZL3yCzxNdteCixtUPs0Fz
 mmo0vJRafMC/7MsLwFo2Yk1OL/csOyoqEe9xC9ELsanhpnYkvlsB4+YID
 A/gkbgKejh7NAlPgzHVAjZpnrhwSssx43A1orIy9JuS6sv3ayw5p135cG
 txzofsFxt4JXj+vlcQduFMxg/X4zDUSvJnP5/5RGZatGtANa2AZ2M0nkN
 rKFq+kbek/3dtVBHEOEVakD5TXh/w/eiVtt8AL878NvfDDq0sKfznRQtb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265174510"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265174510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="532759029"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 26 Apr 2022 09:50:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:50:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyGkkZDk4ysW8vhJaWl/qa5px2NtubEd8hIZI3Qc4xw4N0A/ogqWiojtCK+PhoEhv0roM5aDRHHcqefnyBt3oRUK2ldYBSTHi5iYz1fObXyF3kL/Z58gCpX4xpMyLzW/KX+QIedhShd9g/t3QLEabzrDcE6e2cwHOu6+aH/lNl1xXPaK1kml3trxX71aVao6N9LqCP3Vv8ko2bu36Y7qu3fMsdXqCkkB5aSBCphhYecTeVVBJJboh7vwXiWkPXew0SMc7rwwVf2SMudf3SjOlFwCVPc/xrHJgm+P3cRbksUrIau9AwjRZ2f+SGgGnV9PCFVmIue0tZrmzm7DWLkj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaWQQbN25JpiLrIbOt1liLorG61jx7ZNedw35qWqlHM=;
 b=KVwzdv62ZkyUwRFnBcOuAAw+ae8dX84k0P1/KIiIIh4cIvbBaTXPt55jTI/gOp1+JTcnrfp72dbxwbX0Vf8UXnxxYfbGBNE2Zkkwo7omwqaYoWRkxNkxWQoPIuqsoPi3NiQphzK4i098KytZWL7kUkGRk6MvZz/U8b/ukPnMFyn/iAsoAlwt7ayXIW04nulRzt/xrhmEmbgCBFJLZ2VKVI/FgmUd0fO4FlV0JEHuSUnm/ltXTPYgXK4VO/gufyTCySUsrCagBWmNX1gzVuS26/1eNmliJvwtOnrclthdSFKub6gWnw9B3ka3gpa6lccOICvSx518y3q/K8w0yaX8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM6PR11MB3658.namprd11.prod.outlook.com (2603:10b6:5:142::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:50:02 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:50:02 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 4/7] drm/i915/guc: use iosys_map abstraction to access GuC
 log
Date: Tue, 26 Apr 2022 22:21:45 +0530
Message-ID: <20220426165148.1784-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65bf9eea-b55f-40ca-f6da-08da27a4ce81
X-MS-TrafficTypeDiagnostic: DM6PR11MB3658:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB36584D3342F7A21AC25AC7F49FFB9@DM6PR11MB3658.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PB7wtq2o3ZrSR6UbQPJnkcoerx1RT3orPg6m864Oxzy49RdPqKSIX0NRvZm43ZJF1MRDrPz6/gnw1UzrdjEmtVhEpFjHqoxd5Q7Wm1gPn0s6WH3YnMGFD4hkvkUIdrc6ZcDx5XTSmFAuKymtJKupJsET7T7YxG6Img/87TWkztpfB+u2A2PmbSWyF56n+35EGAb4/o8qXuynJswtJt+lMTg5yWgJyUPIm2IAbLs3U9f/NYSZ5CbUJPLfOPWmH1chRyNMKcOsT6hHpDwLgLo17ug3T9rui5PpS4BgNgD90OcjJ79Dut8N3xU3Xa3Mbf387LpBPiREdjkOh71df/Kfav71d4FLUqYiKIV/bOi1hpzx/2KQaOozzykgbS9HiHWtn93N+zUAFit/0AOmKmSOklpLqZAjLjHSrBcvOYA/HMUhGIp0+EgN5dhyVSHaInNf2R9DPETMfTRB+K0WTGAfJQtrAqdCZtZ4O05dFMWr54SDZlmzj4OacSjAXDScJ8YS3VrZagaoDtN9WZUVitIrctWuXv7xL6NQbNZtHoobsCmrqYTXTMTx3VJqobBs4QFgQ1ihtlzw79aHLj7Ci8A1ftruQ8QcZdzFaRuDpLXqyv/3DMmoA4381DQuT/RttJwWc9ejS0vRurHZosbryidQ/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6506007)(6512007)(107886003)(186003)(83380400001)(1076003)(2616005)(2906002)(316002)(54906003)(86362001)(82960400001)(36756003)(6486002)(508600001)(450100002)(30864003)(5660300002)(44832011)(4326008)(26005)(66556008)(8936002)(38100700002)(66476007)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBxZ2x5WXhDcUFwSHRRYVhBWWloWitqdUorUWRnK3pFNFpXUFRJOXBQejdZ?=
 =?utf-8?B?MDM2SWpzTDQ0TkNsQmV4NFpxWnRSSDVGNXZYcWJ0dGUvNktiMmZrY2dOYWF5?=
 =?utf-8?B?MmNTNmNpMGJRN3Uvd1VwMWZmRVJqQUZPczNVYWJWbzRScXIydkpNdy9NcDc3?=
 =?utf-8?B?MWZvL1Zoa2tXMXAzQTFUbWtjZktlcXNLTmhualFTdWxidjUvNHBKVmtERzZD?=
 =?utf-8?B?YW9qMkZFYzA4ckJKcnk2VWhoNW93QmJmZGZINUk0Zmpwei9kMC9ON1A5V2Vl?=
 =?utf-8?B?WHNxU1dYWE1XZmQzRFZPL3E1VHB3cTdCV0dxeUZraEhoY2lFK3VkcHVoUnQw?=
 =?utf-8?B?SndVTkZ3RGY3YWVsbmwrUERlcEd3MldaUnEyNkZKRVp1YTZBZHJXYzR0U0N1?=
 =?utf-8?B?NVYwV1g3ZldHSVhpb2xydjRsbkRDRHh4WjVpYWdwcUFwSFRuWXoraWlMZTJt?=
 =?utf-8?B?aEQyTVVMRjduRDdVNTEvVFJ0OXlKMmVvdWQ5YmlhRmI0L2hUcWpta0dkcTZH?=
 =?utf-8?B?cXFhaC81cnZ2Y1hlWS84N2JMMVZkNzB2TkYvSjk1cnFMc2x1QmdXSHFZaVhk?=
 =?utf-8?B?VVRkWjN1NHpUR3VXVkFsU1krMlk1bzNWbFh4bUR2Y0hVN1Z5Sndsc2RUL2tv?=
 =?utf-8?B?ZzhJNm9EeTlzeWppcWh2cnlPRTRRSjJaZmQwSmVsTzRBSjF1UGxSWnRSMzhv?=
 =?utf-8?B?VDJ0SEVVNzBFeE1EUTZSSVltME0vLzlkeDkrT2dObm5Od0pRRFF3RC8xYzVn?=
 =?utf-8?B?ODZqZUJLMzJuK1d2K2J1Y3dadXl1N0hvaFBZbklQcU43Slg1QVFSdjVrM2Nq?=
 =?utf-8?B?UGlTeURQZjhRc3pMbE5PamJ2aTY2bFRIa1pLYXBlbXF6eFcwclFZbzBYUG1o?=
 =?utf-8?B?TTRXZnNqU29qbGpseXFiajVWQlpQc2h4aEFFak8wdmdnbS9sMW45eEZ6WlNE?=
 =?utf-8?B?T2dsd0k0WFlWODRNMCtlbUFQMUpiZlBDMFdkZ2NWdXA1a090Z2I4eTZFWWxD?=
 =?utf-8?B?Z2tGMy95dGMwcUZIb01vTEorSm1tMVBOaE5BWS9iSCtJczJlOFI5cHpIZWJo?=
 =?utf-8?B?NExhYi91R2o3b1NRbU9EdDQrVUkwY0l4Z093Y0lEdWNjOGtLRWhqZFZHcm9x?=
 =?utf-8?B?RFhJZUNqK3h4bnVvNFhiZlRCRG9LTWNtbmdqKzBXakVYaWM5czRxTkVHY25I?=
 =?utf-8?B?MDJnTFhUMkFYVEN0WExWSENhMEhUZ2VWN1FXbXpqQ0FyOEhRZ0hsRHJzbk5S?=
 =?utf-8?B?S0N1a0hBRGJIRTA4UVNsTCtlYlcyaDJvOFR4Q0VsbmphSWkzbzdVbEY2YU1L?=
 =?utf-8?B?MU5nQmZsbmszVXE3T1IyTHhwL2xkdnJPaHZuVzR6Mko3Z1dwNS9xaGdocXVJ?=
 =?utf-8?B?Qm9EV1BpbUZ0L1JnNHl0YTQ4SE5NcVJWL1JTWkR2eVFzWUg0a3VOMjZxeGtm?=
 =?utf-8?B?NWZBRFdVWDhtZVJwSEJDb3BWZ3ZXY2xuMGUydFdOK09Sdzk1SE9zeGZqaGdM?=
 =?utf-8?B?bUIzOFAzNWtvb3dNOE9NaHFVdTkvYnMrR244ZHJkNlVQSkd2SjlXZytobVNS?=
 =?utf-8?B?YnFMcWt6RjcrdklEcmxPTk9TWWpKcHFLUHhvbFdNYzdyY3VtbkV1Tnc1ZHU2?=
 =?utf-8?B?RE9WZjVmZGt4MlhzdkEzM1ByR3dWUjJHYnhPanpEbE9mQmwrZHRmYXlJRmZ3?=
 =?utf-8?B?VUwrc3dXYXlnYkk5TzdENmFha3lzT0pUT0pWdDYwV1l2NXd6NE9ZcG0yQ0xw?=
 =?utf-8?B?a3kzU291eUZzdStMbnlQYXVBVWNYanJrd3VRb2dzNDVCbmVJQzBKa0VtRVYy?=
 =?utf-8?B?eDV2WnJTMUFlZFZubEpZcmFMVWRoQlhoZFRwOFNlS3M1bjhEazVqYU9uL1Jr?=
 =?utf-8?B?N01abU9oUFFpemVxRmN1bU1HZXFXdDVuNzNZUkNqdGRyTFZBTXloSERTNmxM?=
 =?utf-8?B?cU5EWnZ2dU9YVWJoc0ZNeXcrTXJKRFM3TGNvUjkrMkloVVlQUW1oekhrWWxQ?=
 =?utf-8?B?SExFVFZHaFJOd21mUVNQelZuam1JTVloTEhFMFZPMllCRlltU0hyc2liZHBP?=
 =?utf-8?B?OWZ4SE44WURlNDBZeE5ldlZqbkh4RkNJcTJVZThrdlRuUFI2ZjFreW1mRHd4?=
 =?utf-8?B?djQ4Q1JlQ2VQTHVzakZ6R2JjbHZqaDE4UjArVzNkQTVrN2NzUkczMDcrMWRO?=
 =?utf-8?B?WTArNEpaVFdTQ2ZIOXNaTE5lSjlBOFNMc3VGY2tXVU9Oay9PMVhwZlVpa0VJ?=
 =?utf-8?B?V1pESmwveHBHNFRSbEhIU2VybDZuU0VyM1FxMC9RVjJzK0dxM0FDWS8vTjRx?=
 =?utf-8?B?YjBkQ2UzQm5TTkpNUGh3VXptZHhBSHB5c2p1SGM2WjU4VlJHTjAvMlk2bFlB?=
 =?utf-8?Q?lhzQdfLeJHxt1fYMkctQQckGlEuGh3XDM0Ib/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bf9eea-b55f-40ca-f6da-08da27a4ce81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:50:02.2204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qvZkXwouJWtazjB9uK5IUb1rfi2lN1xMFeVH83Zx93sVkL1c8naikSfP7+8phr5SyC5T8O1zzS0Xi1wBKIlEHoXjjNsJdytZxdHbRTleUj8H4slLxfadneHklcQu5sc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3658
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
Cc: siva.mullati@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 lucas.demarchi@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer to the GuC log may be pointing to system memory or device memory
based on if the GuC log is backed by system memory or GPU local memory.
If the GuC log is on the local memory, we need to use memcpy_[from/to]io
APIs to access the logs to support i915 on non-x86 architectures.
iosys_map family of APIs provide the needed abstraction to access such
address pointers. There is parallel work ongoing to move all such memory
access in i915 to iosys_map APIs. Pointer to GuC log ported to iosys_map
in this patch as it provides a good base when changing to
drm_memcpy_from_wc.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 52 +++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 77 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  3 +-
 4 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
index 3624abfd22d1..47bed2a0c409 100644
--- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
@@ -21,7 +21,7 @@ struct file;
  */
 struct __guc_capture_bufstate {
 	u32 size;
-	void *data;
+	struct iosys_map *data_map;
 	u32 rd;
 	u32 wr;
 };
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index c4e25966d3e9..c4f7a28956b8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -5,6 +5,7 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_cache.h>
 #include <drm/drm_print.h>
 
 #include "gt/intel_engine_regs.h"
@@ -826,7 +827,6 @@ guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int tries = 2;
 	int avail = 0;
-	u32 *src_data;
 
 	if (!guc_capture_buf_cnt(buf))
 		return 0;
@@ -834,8 +834,7 @@ guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *
 	while (tries--) {
 		avail = guc_capture_buf_cnt_to_end(buf);
 		if (avail >= sizeof(u32)) {
-			src_data = (u32 *)(buf->data + buf->rd);
-			*dw = *src_data;
+			*dw = iosys_map_rd(buf->data_map, buf->rd, u32);
 			buf->rd += 4;
 			return 4;
 		}
@@ -852,7 +851,7 @@ guc_capture_data_extracted(struct __guc_capture_bufstate *b,
 			   int size, void *dest)
 {
 	if (guc_capture_buf_cnt_to_end(b) >= size) {
-		memcpy(dest, (b->data + b->rd), size);
+		drm_memcpy_from_wc_vaddr(dest, b->data_map, b->rd, size);
 		b->rd += size;
 		return true;
 	}
@@ -1343,22 +1342,24 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct guc_log_buffer_state log_buf_state_local;
-	struct guc_log_buffer_state *log_buf_state;
+	unsigned int capture_offset;
 	struct __guc_capture_bufstate buf;
-	void *src_data = NULL;
+	struct iosys_map src_map;
 	bool new_overflow;
 	int ret;
 
-	log_buf_state = guc->log.buf_addr +
-			(sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER);
-	src_data = guc->log.buf_addr + intel_guc_get_log_buffer_offset(GUC_CAPTURE_LOG_BUFFER);
+	src_map = IOSYS_MAP_INIT_OFFSET(&guc->log.buf_map,
+					intel_guc_get_log_buffer_offset(GUC_CAPTURE_LOG_BUFFER));
 
 	/*
 	 * Make a copy of the state structure, inside GuC log buffer
 	 * (which is uncached mapped), on the stack to avoid reading
 	 * from it multiple times.
 	 */
-	memcpy(&log_buf_state_local, log_buf_state, sizeof(struct guc_log_buffer_state));
+	capture_offset = sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER;
+	drm_memcpy_from_wc_vaddr(&log_buf_state_local, &guc->log.buf_map,
+				 capture_offset,
+				 sizeof(struct guc_log_buffer_state));
 	buffer_size = intel_guc_get_log_buffer_size(GUC_CAPTURE_LOG_BUFFER);
 	read_offset = log_buf_state_local.read_ptr;
 	write_offset = log_buf_state_local.sampled_write_ptr;
@@ -1385,7 +1386,7 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 	buf.size = buffer_size;
 	buf.rd = read_offset;
 	buf.wr = write_offset;
-	buf.data = src_data;
+	buf.data_map = &src_map;
 
 	if (!uc->reset_in_progress) {
 		do {
@@ -1394,8 +1395,33 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 	}
 
 	/* Update the state of log buffer err-cap state */
-	log_buf_state->read_ptr = write_offset;
-	log_buf_state->flush_to_file = 0;
+	iosys_map_wr_field(&guc->log.buf_map, capture_offset,
+			   struct guc_log_buffer_state, read_ptr, write_offset);
+
+	/* flush_to_file is a bitfield. iosys_map_wr_field cannot be used to
+	 * update bitfield member types. We make use of another member variable
+	 * `flags` which is a union of flush_to_file as following, to update
+	 * the flush_to_file bitfield.
+	 *
+	 * ====================================================================
+	 *	union {
+	 *		struct {
+	 *			u32 flush_to_file:1;
+	 *			u32 buffer_full_cnt:4;
+	 *			u32 reserved:27;
+	 *		};
+	 *		u32 flags;
+	 *	};
+	 * ====================================================================
+	 */
+	log_buf_state_local.flags = iosys_map_rd_field(&guc->log.buf_map,
+						       capture_offset,
+						       struct guc_log_buffer_state,
+						       flags);
+	log_buf_state_local.flush_to_file = 0;
+	iosys_map_wr_field(&guc->log.buf_map, capture_offset,
+			   struct guc_log_buffer_state, flags,
+			   log_buf_state_local.flags);
 	__guc_capture_flushlog_complete(guc);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 78d2989fe917..62b917fbe731 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -3,6 +3,7 @@
  * Copyright © 2014-2019 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <linux/debugfs.h>
 #include <linux/string_helpers.h>
 
@@ -217,11 +218,13 @@ size_t intel_guc_get_log_buffer_offset(enum guc_log_buffer_type type)
 static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 {
 	unsigned int buffer_size, read_offset, write_offset, bytes_to_copy, full_cnt;
-	struct guc_log_buffer_state *log_buf_state, *log_buf_snapshot_state;
+	struct guc_log_buffer_state *log_buf_snapshot_state;
 	struct guc_log_buffer_state log_buf_state_local;
 	enum guc_log_buffer_type type;
-	void *src_data, *dst_data;
+	void *dst_data;
 	bool new_overflow;
+	struct iosys_map src_data;
+	unsigned int type_offset;
 
 	mutex_lock(&log->relay.lock);
 
@@ -229,8 +232,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 		goto out_unlock;
 
 	/* Get the pointer to shared GuC log buffer */
-	src_data = log->buf_addr;
-	log_buf_state = src_data;
+	src_data = log->buf_map;
 
 	/* Get the pointer to local buffer to store the logs */
 	log_buf_snapshot_state = dst_data = guc_get_write_buffer(log);
@@ -247,18 +249,22 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 	}
 
 	/* Actual logs are present from the 2nd page */
-	src_data += PAGE_SIZE;
+	iosys_map_incr(&src_data, PAGE_SIZE);
 	dst_data += PAGE_SIZE;
 
 	/* For relay logging, we exclude error state capture */
-	for (type = GUC_DEBUG_LOG_BUFFER; type <= GUC_CRASH_DUMP_LOG_BUFFER; type++) {
+	for (type = GUC_DEBUG_LOG_BUFFER, type_offset = 0;
+	     type < GUC_CRASH_DUMP_LOG_BUFFER;
+	     type++, type_offset += sizeof(struct guc_log_buffer_state)) {
 		/*
 		 * Make a copy of the state structure, inside GuC log buffer
 		 * (which is uncached mapped), on the stack to avoid reading
 		 * from it multiple times.
 		 */
-		memcpy(&log_buf_state_local, log_buf_state,
-		       sizeof(struct guc_log_buffer_state));
+		iosys_map_memcpy_from(&log_buf_state_local, &log->buf_map,
+				      type_offset,
+				      sizeof(struct guc_log_buffer_state));
+
 		buffer_size = intel_guc_get_log_buffer_size(type);
 		read_offset = log_buf_state_local.read_ptr;
 		write_offset = log_buf_state_local.sampled_write_ptr;
@@ -268,15 +274,39 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 		log->stats[type].flush += log_buf_state_local.flush_to_file;
 		new_overflow = intel_guc_check_log_buf_overflow(log, type, full_cnt);
 
-		/* Update the state of shared log buffer */
-		log_buf_state->read_ptr = write_offset;
-		log_buf_state->flush_to_file = 0;
-		log_buf_state++;
-
 		/* First copy the state structure in snapshot buffer */
 		memcpy(log_buf_snapshot_state, &log_buf_state_local,
 		       sizeof(struct guc_log_buffer_state));
 
+		/* Update the state of shared log buffer */
+		iosys_map_wr_field(&log->buf_map, type_offset,
+				   struct guc_log_buffer_state, read_ptr,
+				   write_offset);
+		/* flush_to_file is a bitfield. iosys_map_wr_field cannot be used to
+		 * update bitfield member types. We make use of another member variable
+		 * `flags` which is a union of flush_to_file as following, to update
+		 * the flush_to_file bitfield.
+		 *
+		 * ====================================================================
+		 *	union {
+		 *		struct {
+		 *			u32 flush_to_file:1;
+		 *			u32 buffer_full_cnt:4;
+		 *			u32 reserved:27;
+		 *		};
+		 *		u32 flags;
+		 *	};
+		 * ====================================================================
+		 */
+		log_buf_state_local.flags = iosys_map_rd_field(&log->buf_map,
+							       type_offset,
+							       struct guc_log_buffer_state,
+							       flags);
+		log_buf_state_local.flush_to_file = 0;
+		iosys_map_wr_field(&log->buf_map, type_offset,
+				   struct guc_log_buffer_state, flags,
+				   log_buf_state_local.flags);
+
 		/*
 		 * The write pointer could have been updated by GuC firmware,
 		 * after sending the flush interrupt to Host, for consistency
@@ -301,15 +331,16 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 
 		/* Just copy the newly written data */
 		if (read_offset > write_offset) {
-			i915_memcpy_from_wc(dst_data, src_data, write_offset);
+			drm_memcpy_from_wc_vaddr(dst_data, &src_data, 0,
+						 write_offset);
 			bytes_to_copy = buffer_size - read_offset;
 		} else {
 			bytes_to_copy = write_offset - read_offset;
 		}
-		i915_memcpy_from_wc(dst_data + read_offset,
-				    src_data + read_offset, bytes_to_copy);
+		drm_memcpy_from_wc_vaddr(dst_data + read_offset, &src_data,
+					 read_offset, bytes_to_copy);
 
-		src_data += buffer_size;
+		iosys_map_incr(&src_data, buffer_size);
 		dst_data += buffer_size;
 	}
 
@@ -331,7 +362,7 @@ static int guc_log_relay_map(struct intel_guc_log *log)
 {
 	lockdep_assert_held(&log->relay.lock);
 
-	if (!log->vma || !log->buf_addr)
+	if (!log->vma || !iosys_map_is_null(&log->buf_map))
 		return -ENODEV;
 
 	/*
@@ -505,7 +536,11 @@ int intel_guc_log_create(struct intel_guc_log *log)
 		i915_vma_unpin_and_release(&log->vma, 0);
 		goto err;
 	}
-	log->buf_addr = vaddr;
+
+	if (i915_gem_object_is_lmem(log->vma->obj))
+		iosys_map_set_vaddr_iomem(&log->buf_map, (void __iomem *)vaddr);
+	else
+		iosys_map_set_vaddr(&log->buf_map, vaddr);
 
 	log->level = __get_default_log_level(log);
 	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
@@ -522,7 +557,7 @@ int intel_guc_log_create(struct intel_guc_log *log)
 
 void intel_guc_log_destroy(struct intel_guc_log *log)
 {
-	log->buf_addr = NULL;
+	iosys_map_clear(&log->buf_map);
 	i915_vma_unpin_and_release(&log->vma, I915_VMA_RELEASE_MAP);
 }
 
@@ -568,7 +603,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 
 bool intel_guc_log_relay_created(const struct intel_guc_log *log)
 {
-	return log->buf_addr;
+	return !iosys_map_is_null(&log->buf_map);
 }
 
 int intel_guc_log_relay_open(struct intel_guc_log *log)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
index 18007e639be9..a66e882ba716 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
@@ -6,6 +6,7 @@
 #ifndef _INTEL_GUC_LOG_H_
 #define _INTEL_GUC_LOG_H_
 
+#include <linux/iosys-map.h>
 #include <linux/mutex.h>
 #include <linux/relay.h>
 #include <linux/workqueue.h>
@@ -49,7 +50,7 @@ struct intel_guc;
 struct intel_guc_log {
 	u32 level;
 	struct i915_vma *vma;
-	void *buf_addr;
+	struct iosys_map buf_map;
 	struct {
 		bool buf_in_use;
 		bool started;
-- 
2.25.1

