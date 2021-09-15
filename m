Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA240BD4E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 03:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF3C6E891;
	Wed, 15 Sep 2021 01:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DC96E891;
 Wed, 15 Sep 2021 01:48:35 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18EKxbhG026050; 
 Wed, 15 Sep 2021 01:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=0ZZY0p2vPSKRoyzuLWvKu2U/plQdPdZRUmTKOxSdHSLe3FoyaiuzDLDa0TcbGEm5kgAE
 fX0E7Hxbz8bcU5StGi1TdwY6QfKQ3/ctttiUjVEvhjP2OFDvP4L5rx4pzTlC+4ZqgqgN
 ExTvHneblst9g2o/2qnUBrrCVpXjO5gWFoKUB/biVukscvh4jbOFG11s5yHqtFnUq1mt
 3EuukbqskkS4OuOWO7hLFCRbQz0Cre9LqzgbgN8kVCkkbIvMOZUp4XFYWgzPgK2cIa/D
 U9Czgn/eCLUBwmS3YTdgWcZosgccq8pAVJMhEcb2FMdKwZ+J+DJhH25OqBFGKlkAL4YJ DQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=APGMlZST5qBsYKRO+SGzlDTKWMiXA3h1laa7XorkM9z592fZWKG4hNSAdLpnoQVNj+2f
 YVRInNNLH+jdXuSTtDCTkQNO91NpU4O5rmj2Sqd+S+aPvnXgMgl+wuJ10wLFRgbaRZ6B
 yVc7far3TsBebaS/+qLCmWEZOzpY20zK37brz1xTyQf5uKvMdPrP67vuKFfQis9GVLnk
 hv6NSS7Mcnb5ca2ZOLG/eIoupltpcmzUKICUX7sPIT8GadDV/m+snqeZ0x7P04S11/+H
 RuhJpO4T+TayzX/6xMl3Wyf3lz94LmTJaXdQbgmEb5yoJH4+IMwsOVAszZNF4ja1Tt2Y KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2j4sbs4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F1fWfB091944;
 Wed, 15 Sep 2021 01:48:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3020.oracle.com with ESMTP id 3b167swfg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzD5wp40tlStcO851+8bIHyNIVS7zEi/tITs4QP7fWbLzCIW+XJOgZh1mOzFCmgtIWJj/fvkInW0XDLh+BbH6Eucg4XD0GCjPmRyG/rN8Kf76XQ1jOfftzfZll8QJjUUtG9/ze+SKJI6SvOU20IlAD5Wx6wiVnusjmv2CScvsRD9I2JeBU18spmV8sXDNuGp0E+sbwTxGu6XO4YLi8zH8ICCLhVpnpUejg9e+tNTR2rvT1qKVDntUlwxF0tn5Xm1BT1skTsgOJ0Hrf2lhzLSYEg/6ooA8wwqXKpcJc/x8tLSt7p1XQOZMls+ejXAS6Bw7Kp8kL+2yv5W6TIB1dsGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=VbsHBpzj0or54iDsqmmujIpi/0jBfAfbqgb1uRjd8tQE771bBmUwa76hI8ETITzeZz0rlO0zirJLEl/se0g0iF94ecj+t3WEoZ4Rkkl3+zJ+dU84SGAG7sP3wJEeqed3bQM7kJO1VqmblBaZLcWAh5j7mgu+kSM9pu8DghKFjTQ1sBecX+7exbN+YtDUDVEHVJ636SA9udg5IncskDLSvjAh/Ng0f7fuJtQs8cz9xf1wVJp6LZpjLrfLjljioJNohPl8qPf8z3xroTvKMMmrALORhGwWhZMGgynIub/1z0U7Ekjxhd8kte4jJmAfUntahnxqGfLVYO/QDzhqaRD0Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=GwaKiAWngeN7fUBfh/gqTc2CmYRE/Kbl9KzxjvZdMrRD2biidkyb5MGeYu2Wsx+VJyViWYfaPuOOnKJhzhR4CThu50YB8305Iic3tc4M1bnWu6f0JQjiejD6yFv5nxz3WiRubaJYpRLPT0t6PXb7HMmYMLYMScWyQ9qmylC7t9w=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 01:48:22 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 01:48:22 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND 2/3] lib, stackdepot: Add helper to print stack entries.
Date: Wed, 15 Sep 2021 11:48:05 +1000
Message-Id: <20210915014806.3206938-3-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915014806.3206938-1-imran.f.khan@oracle.com>
References: <20210915014806.3206938-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28)
 To CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 01:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25fd4beb-d08a-495b-6150-08d977eae693
X-MS-TrafficTypeDiagnostic: CO1PR10MB4577:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4577031E0109347C67139D10B0DB9@CO1PR10MB4577.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tayQhzbet4B5SveKAysc3+lQs1wvBlqjjr/+AUkPBd57GNIw7vhtG+de6U7Tbw0AiVCBWN2/ez1W0FhvkaMk2uRy9fKjc39jU1C9LekuhvGIwatL5LDE5EMnvgQRyh/IOE+M7s0NaFJH+uOlHtW9MJ1d69G1xzG+HNLujpQeXo9Q/RqxD0xkymvpd5JzOZWp51a9KoAqqwu+oM0ol5YTiVnIIBnc/Ut5FTmYJAxRCSHBUc8FzmQr1agRxzUfbcoyPsns8/0KweZ/UONGWLAMk6WvSquXQ7XHW2v1eemY7sXNSxJ9OwOtP8xCIKzPk3EO9Ih8bMnlYQnycOxCCn9/GaoVDhKa23phKFCTafgmsdNSecpy1DF2DfgCwWIMJb9o5I86Cis7HGVEJHYAHCFt+FtIyvVpMxQ4fuWi2MU/N0fJDXhIMdHWwbNl6M788IdzEcdXap85HBV0LBDJq9brpfmaG3j21NVSeqIkvkUzRZpQk3mbTfm5uEaOmPjtZHqzC+P+itpG9Df8dJ/0MPfXCZRfdHOojnEy/13oOqBvWdOTo/sJCdTXeWS9Kmai2RSP1ehZuYp6N625NnmEPsuhIT5Cb3O4Vs/ljyKIsqj1nuYvfZ9C7A1pE2EDidP0TQcJ2p6FY3ct+yIEsZ+Rtblv0KVwek4+0aJ3P6J26chkFWIXMUL/0G9gOhH9h056Kk4lkGZ+YSjBlcVMngrJB93ZjIbMtz3B5zz5qnlvHHn//RM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(136003)(366004)(103116003)(36756003)(478600001)(86362001)(956004)(4326008)(52116002)(5660300002)(6486002)(66946007)(2906002)(38350700002)(186003)(38100700002)(66556008)(26005)(66476007)(6506007)(6666004)(6512007)(316002)(8676002)(8936002)(1076003)(7416002)(83380400001)(2616005)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZbuR8++3DzWAtSZPwXRh95AXSrVxCpeF0FWyo5i2ywl0cJZEzlzDNUX5P4ri?=
 =?us-ascii?Q?fO+1iHtZrfGUwMUdFw53RApi6gZc/YXsMU9Xo2WD9k2dKIxXN0phQXUsov1U?=
 =?us-ascii?Q?pmL+4YUhgTkj82iMUofiHVJeQh6i8KkwFmYbTucc5UyItNT8ls2DSQDiI+iI?=
 =?us-ascii?Q?ru14ZSnyHH9KnSO1Kcy3I4TN1h7U/P9thZ7u2G0GbSV7QJjxxt2roWQIfxs5?=
 =?us-ascii?Q?AYiexKvxnzTJkUPtfbIzBqd3EuOi7U+QioBUhTib6EYUYuagGHdKHpcLExr1?=
 =?us-ascii?Q?OvEbZlbOkJAOvBa+kYqQxS8fAO77OzecMEkM4TtG0bfEQsAhpWH87qzyYuuV?=
 =?us-ascii?Q?MvXlYikDQ6zHG46q/7+Pq6galSeIaramvGCm4y7rlevzCTidFE++QIpwde3L?=
 =?us-ascii?Q?3EliXs1xzhqIT7wZilJwDhrlC4k2YDS8st8DtC4C8cTwH8lEhsRcWRp4t/GH?=
 =?us-ascii?Q?bfxXpMl+g3bjRV9PYnZ9XlwmpG+EpDilVFq/RMnMXQ7z71gyV3xH6oM/L9He?=
 =?us-ascii?Q?f72fRkksdZMCpgARTGCCtK6JdDzqcrO23oLtcDY6yKCD8Y1Bjdz6cwD1YncN?=
 =?us-ascii?Q?XCaZ3OppbFr5H79u8aWmob+EvHFqT4p+pIenvsmYDXAKVDrT5eeLQMPuupMV?=
 =?us-ascii?Q?bhMJemUwQ/l2An0B7MhSB7ew5ICoBCOj3SF8IxXrGwl8ZpXJq4upbY6pdSgx?=
 =?us-ascii?Q?+YlCOuHAKwRjdCZ+f4bz22KGxxCMiduL6mfpYRt32irGypAVYfSTM7l+ag9R?=
 =?us-ascii?Q?5H5KUrHqtl41kBLbpmwxWeIJHLJRJvOgcId3/Q+00MMPFUciHPDfHocPJjUo?=
 =?us-ascii?Q?O8P2x8QnMGdsSK27qRG+kGcs/I/IVxum+79ndvVR2gQdMDbDMgqNvTY49beC?=
 =?us-ascii?Q?IP7hwgpWE62dGQDgV1SlkAlQK+2UzUjpS3ECorkL9mTaWx5pYtzVUlbYyem7?=
 =?us-ascii?Q?LrfkGh+b5COOvbDXuEcEjO0hvpdWjaP+CYgJJ8ZPTPV/10HwrxP95wOcqo4G?=
 =?us-ascii?Q?ghlq31wKh/LS/dlkIkYZPBhteMltCRYstUwkWwv6xC4+eN2lEcm0O9hVJigM?=
 =?us-ascii?Q?y9+3xa5lXrqFAvMQmPQz5sfYUbtcz7Yg5HxSI11rD13lbn4Fg0+auF+LRGMl?=
 =?us-ascii?Q?W+r3Qi5MRd0BFsDt1gsX6wlywSOhftb7KQkmnoJwlVo6viTkZbtx8b2ItSfl?=
 =?us-ascii?Q?LCAluRim8YdSk+fFNEgds2+eASIbjeySswBi9ohHqGMsDO5PGKAAA1h5aZaR?=
 =?us-ascii?Q?ixxtVj1CUNVjIh3B5gdDs9AMsssp2nHf4PVw67CXsLAstg73RuauDfx4RCpe?=
 =?us-ascii?Q?ooI+4+yKHZf263PpEv3XvT5D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fd4beb-d08a-495b-6150-08d977eae693
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 01:48:22.5908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/8JFKW2LPg7rfGKEMfYIqQooIJiBF4nvJ/T0XJCJFGGGr4FiABbbNO7I25tJ+L9RQBcxN7o1yozfsapK0B/Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150008
X-Proofpoint-ORIG-GUID: 6Zj1zZONZy-82WMXeALUx-Mi4dJ5FG8-
X-Proofpoint-GUID: 6Zj1zZONZy-82WMXeALUx-Mi4dJ5FG8-
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

To print a stack entries, users of stackdepot, first
use stack_depot_fetch to get a list of stack entries
and then use stack_trace_print to print this list.
Provide a helper in stackdepot to print stack entries
based on stackdepot handle.
Also change above mentioned users to use this helper.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Suggested-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
 include/linux/stackdepot.h |  2 ++
 lib/stackdepot.c           | 18 ++++++++++++++++++
 mm/kasan/report.c          | 15 +++------------
 mm/page_owner.c            | 13 ++++---------
 4 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 6bb4bc1a5f54..d77a30543dd4 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -19,6 +19,8 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 			       unsigned long **entries);
 
+void stack_depot_print(depot_stack_handle_t stack);
+
 unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
 
 #ifdef CONFIG_STACKDEPOT
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 67439c082490..354fe1b62017 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -214,6 +214,24 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
 	return NULL;
 }
 
+/**
+ * stack_depot_print - print stack entries from a depot
+ *
+ * @stack:		Stack depot handle which was returned from
+ *			stack_depot_save().
+ *
+ */
+void stack_depot_print(depot_stack_handle_t stack)
+{
+	unsigned long *entries;
+	unsigned int nr_entries;
+
+	nr_entries = stack_depot_fetch(stack, &entries);
+	if (nr_entries > 0)
+		stack_trace_print(entries, nr_entries, 0);
+}
+EXPORT_SYMBOL_GPL(stack_depot_print);
+
 /**
  * stack_depot_fetch - Fetch stack entries from a depot
  *
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 884a950c7026..3239fd8f8747 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -132,20 +132,11 @@ static void end_report(unsigned long *flags, unsigned long addr)
 	kasan_enable_current();
 }
 
-static void print_stack(depot_stack_handle_t stack)
-{
-	unsigned long *entries;
-	unsigned int nr_entries;
-
-	nr_entries = stack_depot_fetch(stack, &entries);
-	stack_trace_print(entries, nr_entries, 0);
-}
-
 static void print_track(struct kasan_track *track, const char *prefix)
 {
 	pr_err("%s by task %u:\n", prefix, track->pid);
 	if (track->stack) {
-		print_stack(track->stack);
+		stack_depot_print(track->stack);
 	} else {
 		pr_err("(stack is not available)\n");
 	}
@@ -214,12 +205,12 @@ static void describe_object_stacks(struct kmem_cache *cache, void *object,
 		return;
 	if (alloc_meta->aux_stack[0]) {
 		pr_err("Last potentially related work creation:\n");
-		print_stack(alloc_meta->aux_stack[0]);
+		stack_depot_print(alloc_meta->aux_stack[0]);
 		pr_err("\n");
 	}
 	if (alloc_meta->aux_stack[1]) {
 		pr_err("Second to last potentially related work creation:\n");
-		print_stack(alloc_meta->aux_stack[1]);
+		stack_depot_print(alloc_meta->aux_stack[1]);
 		pr_err("\n");
 	}
 #endif
diff --git a/mm/page_owner.c b/mm/page_owner.c
index d24ed221357c..7918770c2b2b 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -394,8 +394,6 @@ void __dump_page_owner(const struct page *page)
 	struct page_ext *page_ext = lookup_page_ext(page);
 	struct page_owner *page_owner;
 	depot_stack_handle_t handle;
-	unsigned long *entries;
-	unsigned int nr_entries;
 	gfp_t gfp_mask;
 	int mt;
 
@@ -423,20 +421,17 @@ void __dump_page_owner(const struct page *page)
 		 page_owner->pid, page_owner->ts_nsec, page_owner->free_ts_nsec);
 
 	handle = READ_ONCE(page_owner->handle);
-	if (!handle) {
+	if (!handle)
 		pr_alert("page_owner allocation stack trace missing\n");
-	} else {
-		nr_entries = stack_depot_fetch(handle, &entries);
-		stack_trace_print(entries, nr_entries, 0);
-	}
+	else
+		stack_depot_print(handle);
 
 	handle = READ_ONCE(page_owner->free_handle);
 	if (!handle) {
 		pr_alert("page_owner free stack trace missing\n");
 	} else {
-		nr_entries = stack_depot_fetch(handle, &entries);
 		pr_alert("page last free stack trace:\n");
-		stack_trace_print(entries, nr_entries, 0);
+		stack_depot_print(handle);
 	}
 
 	if (page_owner->last_migrate_reason != -1)
-- 
2.30.2

