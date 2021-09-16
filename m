Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4240DB62
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2BC6EDCA;
	Thu, 16 Sep 2021 13:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB36EDCA;
 Thu, 16 Sep 2021 13:36:07 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GDCHpq012704; 
 Thu, 16 Sep 2021 13:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wx5WfZpBztikPSuUwtEhbSOsfuO0L5IaK5Z8T2MYYC0=;
 b=Z1NCjhAn05HCRc5PUeX+3xY79NnGUvcPQcWtpjGkHy7EbG38nLgY+JG1YEfyEESn6je4
 GCLTu4smb3+RYPoJdkdk3y7WrbydxAm7Yga3vw+hrJwSj2ECT6mAbbX8W6crilmW2NWu
 WC5uKaia1qjo1gxzgw8itMjfqtd13s4hQDs29DGgW/tbkhiKxdXd7edH2R8wt6Lg7wN0
 EJKWlH1Uj67bqPRHapopWUFPDYsslyJggbGLQgL2xg5BsJoQwrpB06g3GKYtTdPndT7y
 XZm7AkHO20+cRcfyGrWFTeIPB6JO0rxE8/mYA+02v1hijhv2Uk3Isg7E0TT25BZZqBtx dw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=wx5WfZpBztikPSuUwtEhbSOsfuO0L5IaK5Z8T2MYYC0=;
 b=j+UbCiJHQcAH0An/n/HAirlLRk3MoP7AMcV/tUEFhiRyfLwl+SA73nZTVmEC7G+jkyuA
 8seDs4JHF2HZFL/RvHAWCWSxqe5WPbSzX2jhBmKYQOR8jSvPD5mAiSkkI3WNRLoLqgv/
 BJSKp+XuDb0gA1AGXWR2FPAzW0fECv16WKqAxsBtA87Rq9khB+EWgK49DHDjVkUAFrzS
 zCZ1bCIGlytYS8WHyNfTdoCIg8zKrPPBhksC7tneOBYGKjfRgFPyaJqVM0iN5sNRXgYo
 B0owubN6v2K2uubXImRbKb0AU1IZzo0BOJ45W6pIxPc9o/qD3gk5J0Fj69AJgJIUTtS8 sw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3s74j9wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDZK1M084032;
 Thu, 16 Sep 2021 13:35:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by userp3030.oracle.com with ESMTP id 3b0hjy8gk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoFCokSP2MG2fQZcG4yK1Ji3pDIkMH3C0tPP7w8bXJSN+7n+ZJHFnK3Vcw6jmSvTAOpi3XOfo7KGkx0IbQ+MtURe+PSqfyJCDRAfjF5JLP3cK7dMdZ2yPsB8iWmKJfvx0O/oPKJIX+8wWDNIgeCWbxIPfnUDEItvb/R4k+KTMRBjMplYgXUznN3i8yyORIASDarfEnSoHzZepKhwNZgpCLCX6p2rYMkFsoVdIO9T4H6TaLSl3k8ZPRHKTMxqlCjzRObLzkI+FqewBlFRuoGX+nuO9ZyAZlCynuEkYxqrJ/AAAL2aBkELBAKHdQcqnoYtQOALgcsZQBGt0l5gHh6L6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=wx5WfZpBztikPSuUwtEhbSOsfuO0L5IaK5Z8T2MYYC0=;
 b=NYcmaX3jeSHzfokIZyRuDIFgLxQG7pICEXJjIlv0L72ACSbWp8Pc/FQVZCyB7wtqU8ZqtJcVx9jlPVWQ/fwEMyf61HS8iQ7Qy1QBEHCxOJIfSBCfEqDh27eVWyzMfFZ+/G7xYenUiGvr+GqLpGW98GF2SpvYnxHKcVLnW374g6p28fB2Q8VA4SU99RrGB6/5B+d5jVSb5DMWVFt6n/aMoVMbTkagTsGCLYXjIeAb84tXdfmP95Vfx9Ugh4k3tERbllP4U0cJmv3GJsOBOkEu3gD8tAu+IzrBejDPa3T907PddOOKEXUC0idUJ3V0UpuVLqcv3bOMcKAdJ60mYWHmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wx5WfZpBztikPSuUwtEhbSOsfuO0L5IaK5Z8T2MYYC0=;
 b=vMSulnLucVoQAHtr/nskOHitvGf04Ha/ua+4C1FkgpqHCxFkjdfxThU04Y6AY6XMpBLUEL4zSdwvm2BDqinQV27po5VZI6UKcUYQAfWs7c9a79sKKEFWiEAf0LMe/BEntvgstjJf9Hr3nRiSX1lP/N1yihqyl0LAF1id15T4EKI=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO6PR10MB5572.namprd10.prod.outlook.com (2603:10b6:303:147::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:35:56 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:35:56 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v3 3/3] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Thu, 16 Sep 2021 23:35:35 +1000
Message-Id: <20210916133535.3592491-4-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916133535.3592491-1-imran.f.khan@oracle.com>
References: <20210916133535.3592491-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20)
 To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 13:35:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3078b39e-e702-4bf0-41e3-08d97916e926
X-MS-TrafficTypeDiagnostic: CO6PR10MB5572:
X-Microsoft-Antispam-PRVS: <CO6PR10MB5572C23437CD7F020345E1A8B0DC9@CO6PR10MB5572.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RqbqLMlJ1H/keDqGbML3JnTmgdnePK/+IEqZIcwTTPu+MseEZwuo4NJf3EZYkEYIjnNcvRKSgfcaA7lnoqyew+1DkxQQA9k1iPZsQDQLUidhxE6bcBR8jCZzhmCFcfm5IKbZQK9OOV4TCa4BLNGTjU7vuFGjAciJpz65pTmV0J54IyN3T+eyTdFfqT+mnvAPuPkZKA1ugtE9OqbgdenoznM1urs06BJYc0WeJdXsAuAKyc+AIZhF0Uyxw5NXOXsaKO2wMGreH8gWFqEaf08S5iYApDNez9OJLaqzzN79Tx50Y3fuyC/naeSwnCqgIJRjdYuvXqNLqJsBOBt6l1yON9eNp+T3YVg0fQGaX4ODxw10R53dbwLLgWvCdlJV64qt12v+7FBEJhE3JueHwNpyWZ0zGxaT7ueAtWteGWckirsetBTCv1CRvZsCztlcff74oqAJ7TVH/KnLBxcDV1v7WhawUBvdj1AkIFwTxpgcUHo1zQ7WxkHq1PLl6ZQL7u7WNV5Ivm+fh2SzDQ9Fkh58ZRwXeqPofOMK2sljzvgkz9cRBAF/b9ltptsArIeF/9OcbOM6Dpb3Uo1KW5LxQuqoxI+szzMarGO1Wneo1uffn+dYQ3i5A01OyXCL89Aidf7drnCl+WP7orSKqmLiX2GuaoQLKSLrUTHXH1gJyThcAIAvrkf1uEZCegkdzHmu1GFigIZzEMuZU4/CKwCsjKaU2UhCLyp8bepMONBsrkbohwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(396003)(366004)(346002)(956004)(26005)(38100700002)(36756003)(83380400001)(2616005)(8936002)(38350700002)(186003)(316002)(2906002)(8676002)(921005)(52116002)(6486002)(6666004)(7416002)(6512007)(6506007)(103116003)(4326008)(478600001)(66946007)(5660300002)(86362001)(66556008)(66476007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?glgeouBfCvFvuzgKMz8698ZZ8dP3P/TdGVBri8zsdjHC9sDcyj8pRJmz253f?=
 =?us-ascii?Q?SuuL7NUQuUyhtzw7C7QomZaWfT0ODar4JaPDbMM6XbLdk5+UT+j65z6GMewX?=
 =?us-ascii?Q?kIDo7zBQVWvhzqMh5WMoWakFU47KD4mKmQ5fc/V6XB6OO2a0gGDmm1HaNUmL?=
 =?us-ascii?Q?XvTK5z/vWTL8nXjqyM4hABVIbf/pU+oANx5fqB5AwBmkZRYjzMPUJNbFO2SA?=
 =?us-ascii?Q?FZrki7PPUVtn3+t+hK7MJ2qps7VLmB0lHH58unk1gjbNxNg2P+YWJx9DV8OE?=
 =?us-ascii?Q?SIIik7sJDXTw+Rtg7/dlRPhPLMW7zKKIdkGBY+HQSYPU1wfjK0Y227v5xiF2?=
 =?us-ascii?Q?ccbCCLLWsntvgdk7G2RdlQ4C4nPAqwnxwqOVPl1+DMPYBibcaN4qF9JCl8o5?=
 =?us-ascii?Q?g3d1X4VB6jt/uy7O+GdlH5EQwtYgEdAMOBWaoR0AtAKzWZEANNwi+dundj1f?=
 =?us-ascii?Q?6AjoHVOnbUIrDb6qS6PvUQLfuLGcy/Lsq8GBNSFVAAItVsX10SOGpEV2UllB?=
 =?us-ascii?Q?wqCeqyUAhtvfmb2eZh4n56Lwq9/zIkGbKbfXi7f9OpVn9l6ZPkKUb/dU7OSV?=
 =?us-ascii?Q?Je+UjHwYuOndLZU9gIw/+lsyY0J8sWD7K5FKYx/kKeyq6yxq4lEHrMFgYeqS?=
 =?us-ascii?Q?K5Ee7uoC+nX8MMO1vjBl/SldbZNDvh5aMRpwFsnE6weOzJ237QQzVAD8O1yP?=
 =?us-ascii?Q?a8zrw5O65hHHo/gjimGutPKy0erYno/u0KRNfgO6PO05ecP2CXKm9K2a1GUP?=
 =?us-ascii?Q?tmDtD0d1ElXAi0Tr5rmuA5yLc98EKfPbTXyAmbvLnBkwmXCabpwdKzt9yY+P?=
 =?us-ascii?Q?u6ijKtzAr5ylWpyuLhNTujGNqne/cNOhuxna+DMN/gNPopcVvBTDJ2ykVTkk?=
 =?us-ascii?Q?Incxvu7n23aaYCiqabUQk1Ks0MkLFscieuMBs7dFLSo6ehGnVAQq7WpQh1tq?=
 =?us-ascii?Q?gPwFieg84APvvupqg+Wb04PTunMggPWE8J4ys0VSsaHDun50NndSGAL1Z48L?=
 =?us-ascii?Q?ecPKfh2u1rwEqfBQ9FXNaAn4r7slwR9FZsoQ1S8im2CgBnKz6JJOFCJL+bVJ?=
 =?us-ascii?Q?7zXL+es+KxEQdbl654gRg/3HWRhGcCkIS9Wpb0KcUn8EsZVZYncOn2/Jch4m?=
 =?us-ascii?Q?IacAu5A+lZgedVe56wgha0ue7O8+vUECIHl1iWWMrCSZpqBvSO+PJ1jcLU9J?=
 =?us-ascii?Q?oTI5E3Fon4qkNEYqyNfyZm7B9BiRUQecm/RvyAtESMtEhPQGVHyAJfqluU42?=
 =?us-ascii?Q?xyqSYupJ8+X98MaKWRmeyHmN8kHVVK24n2+qKvvoOJPVBI8Fjw1JrWHHlmLB?=
 =?us-ascii?Q?KJcz02w8n4KnAyouGmEavhUh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3078b39e-e702-4bf0-41e3-08d97916e926
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:35:55.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGRTPMeViesqycXGR2SoGHNs6VU+Alc0YzU5wrHr7iSKUOhLNaI5G6rZalMIR/samrKCAG3nOFWby3crSni0ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5572
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160087
X-Proofpoint-ORIG-GUID: V132fvO_-FHOSG82cGI_Hrto9Gt2DnMp
X-Proofpoint-GUID: V132fvO_-FHOSG82cGI_Hrto9Gt2DnMp
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

To print stack entries into a buffer, users of stackdepot,
first get a list of stack entries using stack_depot_fetch
and then print this list into a buffer using stack_trace_snprint.
Provide a helper in stackdepot for this purpose.
Also change above mentioned users to use this helper.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Suggested-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
 drivers/gpu/drm/drm_mm.c                |  5 +----
 drivers/gpu/drm/i915/i915_vma.c         |  5 +----
 drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
 include/linux/stackdepot.h              |  3 +++
 lib/stackdepot.c                        | 25 +++++++++++++++++++++++++
 mm/page_owner.c                         |  5 +----
 7 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 86d13d6bc463..2d1adab9e360 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1668,13 +1668,10 @@ __dump_topology_ref_history(struct drm_dp_mst_topology_ref_history *history,
 	for (i = 0; i < history->len; i++) {
 		const struct drm_dp_mst_topology_ref_entry *entry =
 			&history->entries[i];
-		ulong *entries;
-		uint nr_entries;
 		u64 ts_nsec = entry->ts_nsec;
 		u32 rem_nsec = do_div(ts_nsec, 1000000000);
 
-		nr_entries = stack_depot_fetch(entry->backtrace, &entries);
-		stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 4);
+		stack_depot_snprint(entry->backtrace, buf, PAGE_SIZE, 4);
 
 		drm_printf(&p, "  %d %ss (last at %5llu.%06u):\n%s",
 			   entry->count,
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 93d48a6f04ab..7d1c578388d3 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -118,8 +118,6 @@ static noinline void save_stack(struct drm_mm_node *node)
 static void show_leaks(struct drm_mm *mm)
 {
 	struct drm_mm_node *node;
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *buf;
 
 	buf = kmalloc(BUFSZ, GFP_KERNEL);
@@ -133,8 +131,7 @@ static void show_leaks(struct drm_mm *mm)
 			continue;
 		}
 
-		nr_entries = stack_depot_fetch(node->stack, &entries);
-		stack_trace_snprint(buf, BUFSZ, entries, nr_entries, 0);
+		stack_depot_snprint(node->stack, buf, BUFSZ, 0);
 		DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
 			  node->start, node->size, buf);
 	}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 4b7fc4647e46..f2d9ed375109 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -56,8 +56,6 @@ void i915_vma_free(struct i915_vma *vma)
 
 static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 {
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char buf[512];
 
 	if (!vma->node.stack) {
@@ -66,8 +64,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 		return;
 	}
 
-	nr_entries = stack_depot_fetch(vma->node.stack, &entries);
-	stack_trace_snprint(buf, sizeof(buf), entries, nr_entries, 0);
+	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
 	DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: inserted at %s\n",
 			 vma->node.start, vma->node.size, reason, buf);
 }
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index eaf7688f517d..0d85f3c5c526 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -65,16 +65,6 @@ static noinline depot_stack_handle_t __save_depot_stack(void)
 	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
 }
 
-static void __print_depot_stack(depot_stack_handle_t stack,
-				char *buf, int sz, int indent)
-{
-	unsigned long *entries;
-	unsigned int nr_entries;
-
-	nr_entries = stack_depot_fetch(stack, &entries);
-	stack_trace_snprint(buf, sz, entries, nr_entries, indent);
-}
-
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	spin_lock_init(&rpm->debug.lock);
@@ -146,12 +136,12 @@ static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
 		if (!buf)
 			return;
 
-		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
 		DRM_DEBUG_DRIVER("wakeref %x from\n%s", stack, buf);
 
 		stack = READ_ONCE(rpm->debug.last_release);
 		if (stack) {
-			__print_depot_stack(stack, buf, PAGE_SIZE, 2);
+			stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
 			DRM_DEBUG_DRIVER("wakeref last released at\n%s", buf);
 		}
 
@@ -183,12 +173,12 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
 		return;
 
 	if (dbg->last_acquire) {
-		__print_depot_stack(dbg->last_acquire, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(dbg->last_acquire, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref last acquired:\n%s", buf);
 	}
 
 	if (dbg->last_release) {
-		__print_depot_stack(dbg->last_release, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(dbg->last_release, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref last released:\n%s", buf);
 	}
 
@@ -203,7 +193,7 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
 		rep = 1;
 		while (i + 1 < dbg->count && dbg->owners[i + 1] == stack)
 			rep++, i++;
-		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
 	}
 
diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index d77a30543dd4..88b0b4cc9906 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -19,6 +19,9 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 			       unsigned long **entries);
 
+int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
+		       int spaces);
+
 void stack_depot_print(depot_stack_handle_t stack);
 
 unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 354fe1b62017..f953752aa885 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -214,6 +214,31 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
 	return NULL;
 }
 
+/**
+ * stack_depot_snprint - print stack entries from a depot into a buffer
+ *
+ * @handle:	Stack depot handle which was returned from
+ *		stack_depot_save().
+ * @buf:	Pointer to the print buffer
+ *
+ * @size:	Size of the print buffer
+ *
+ * @spaces:	Number of leading spaces to print
+ *
+ * Return:	Number of bytes printed.
+ */
+int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
+		       int spaces)
+{
+	unsigned long *entries;
+	unsigned int nr_entries;
+
+	nr_entries = stack_depot_fetch(handle, &entries);
+	return nr_entries ? stack_trace_snprint(buf, size, entries, nr_entries,
+						spaces) : 0;
+}
+EXPORT_SYMBOL_GPL(stack_depot_snprint);
+
 /**
  * stack_depot_print - print stack entries from a depot
  *
diff --git a/mm/page_owner.c b/mm/page_owner.c
index 7918770c2b2b..a83f546c06b5 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -329,8 +329,6 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 		depot_stack_handle_t handle)
 {
 	int ret, pageblock_mt, page_mt;
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *kbuf;
 
 	count = min_t(size_t, count, PAGE_SIZE);
@@ -361,8 +359,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 	if (ret >= count)
 		goto err;
 
-	nr_entries = stack_depot_fetch(handle, &entries);
-	ret += stack_trace_snprint(kbuf + ret, count - ret, entries, nr_entries, 0);
+	ret += stack_depot_snprint(handle, kbuf + ret, count - ret, 0);
 	if (ret >= count)
 		goto err;
 
-- 
2.30.2

