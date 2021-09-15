Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20140CBFF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 19:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8315F6E9CB;
	Wed, 15 Sep 2021 17:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999056E9CA;
 Wed, 15 Sep 2021 17:53:53 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FGe1Bk008933; 
 Wed, 15 Sep 2021 17:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=Y118mjc/otwgsCK4JV0Ne++zcG23rxtLXPp5cbsRI2wS5PuNh7Czh8Vr6rBX5hgv95Tj
 tsnOLB83WsTOGQp50hkAOuoJ6PrYB12za90bdbPGNoH5guF2UDqRGRV4MbweAMPsrxho
 o5/A1zX8ZjRRGLZcmR62KctH1bEanY1Z5U9+pf9Whwn0j76myurIq6bvMhtITQOi2VpI
 Kw+2p2Y8UvGzfUDox/XLHtpJj8AhTG2ZvLBx2dPYZ3k7cB1b6nSULwr0zTPgKbVp++Ww
 qQrXUDRwpkbGaJZlaVQ91hnynGwUp0yY5aO3mBQjpOlTdaT4jAQCc3GpsOlLPMF0gwGW kQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=oYJqXSY7QmqnuJpm7lW1pBZiO7EtfwPzzihXXgpoo6TOBnapemsonv5JL8EMXgNVLSkK
 zRVSYy1cDLWCkKAwLl4RhSolfkwGpA/SAuWdGUB8DSBwOnKPyVrIWBaUTE6CJ+LseGER
 fIR9myW1zG1hxTUw7Mgelv+cpHfL5SmsYzdcBpTUrdT5jjwIOryBkj6BuCLHt9lm/Z9J
 cD+zyQ15ysChR7Ha/19h3FUBi7xDeiZei2w0+tCOaj5g4GZ2XL5sCwZ+eOh46YR81fx8
 S0jREcADt2L03ha+u35Rb2kihCS70a+JQkQjCv+BQgYntub3dHhoHZTAO4UiBna42HTr rQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3jysgpyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18FHkb8T011001;
 Wed, 15 Sep 2021 17:53:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3030.oracle.com with ESMTP id 3b0jgeywn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey0Ql64XX06krrkzdhuMo5oIQxw+TfefvqMt7pX93f1584qX5LLPqhIRO3Xv0JPHWawp3+apZBWlwGwZpT8NwJipbgIU36UFL+ATHhLRv1Y8Mofz6yKfbngF9A2yTaSj0vqj6eQWon2478Yq1r+TZ+no24XmjZvnXW1HWXD/4Smw2U6ZwlqfUytW04hT9AxNYDuXwjHgTievwX/vVA4Ljgf7pH/0MaXw6JYfneVIYtfw1M5lXa0amluoyzloGSixpHmQPY3kkWgoby1GOnk+MC3xF+oLLGOvnELL8IQJt324EvJCkJh7ONUVamMI9KaxlM1e98XsMnm2bfEj10JeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=GNR189uZeXkf2aqPJWhWxiprvCNHpfbAbiePiPcfFzLapS/SPyFUYZPXyfQKtetZdq+xA4jbfrWAR9Y0NFcLVFZnx1s1OOtwI8oHpCWp4cREu+rPSfLqQ1QCQLZTVZ5swnPBqI8WM29Q0wIkRm7MyVyKD0AqQ/Sl5HGK2iczVafmVO8u+5ER6/6N49FNjOixXIHDojnv+qx5nHi9lQgfVK5ZZVyMRvNEpEDOan3Qke7lf4ZmiciyzHACzP1eFnpDqJcVbyMQpyNYvWLX/5JFXAvk54KgIOcVVMNpAZ/ydXOpbTXg/l7aHwjBxaU1jIks+fH3XfluZEEx/EE+B0+yMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=l0fRAhAnU700uxYPTsF2GTxF1oC8WE2lvPQlXtCoVdMOouX7bQ3e2T9ayxEKQBwbsP3guOsa8T7f7WP14Nh4O15EnJQX2+AMge3iPZDNLxG3Vko/DJ559967t2LfeZLGEntC20vhkxiaxvZOVFfWvmEGafK9/Q565xYpPz5+518=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1568.namprd10.prod.outlook.com (2603:10b6:300:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 17:53:37 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 17:53:37 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v2 2/3] lib,
 stackdepot: Add helper to print stack entries.
Date: Thu, 16 Sep 2021 03:53:20 +1000
Message-Id: <20210915175321.3472770-3-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915175321.3472770-1-imran.f.khan@oracle.com>
References: <20210915175321.3472770-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0105.ausprd01.prod.outlook.com
 (2603:10c6:10:111::20) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SY6PR01CA0105.ausprd01.prod.outlook.com (2603:10c6:10:111::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 17:53:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00ec7627-1dff-483c-7f6a-08d97871be5f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1568:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1568ECF103E71A04F489803BB0DB9@MWHPR10MB1568.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yv18ktMtu8YKm4nGfpioKOJdNUUC4PfbH6j5qLaH0FkI0Mf4CmXb+zACs+I6taSKfdhfZPoJNNM/hXZtYg/xvHaFk6Hf3d+Jtswe8qx5Q4q3iJSsLZzzQVJLKn9Z8sG69BiSkSXKL8EbTIOKIulw72HHTheuYQ+zGWjla+wMn7zEk2SghKqnilgowuMghlINikbj8M8iQ7iz/P3bIKxBrJUATj2nuHPU3X+HrCPVU/TXcpsXQPH3M7KLpnWXFLPwz+o/0sBU6UQm3wjJoPKXiVtub6DLWcDlWLnQYOSbrm/MIcFM+MMRGrQj9SSa1UxUBemcjszcBNJ3b6FsyBqeAXTQH64Y2Ge9gSGsJPzhzOj3OasTY6+fK3XL2PKtNsc+w/XV0A/NSgnpXqLqz4Bura1dgB7PJ2tVA4n3Uo57EWUgRf9XyckvHOLDjQJMcbpzQQJRTSKMFu9Aot9xRzOAsBtvO9xaH0o6lHFBIGEl3PAzuZAYnixNglFxoRk9jIXOldt0m8sOSlw54/dfVfr1+Xt16lMxFIMjl08OAtNxqOxnWefEDLbq6d4Z/NQI6tKf6+I8ZI9vZg7CNZuxLJ6hwlifFMeQ5enz8ZqOJRjEO7m0M0cUR8XlgPkieF941xdHO73uHQCHQ3mw1gPdYV/4gjQfdsOzWv1dpZHV2BnkiA5Ttv4Xh3Y4pzW27cHn3LXy71w+VlMPdY6gHFW/efXYh59eyYwuAxhBiMCythvB38c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(396003)(366004)(346002)(6486002)(66556008)(66946007)(2906002)(6666004)(921005)(66476007)(38100700002)(8936002)(6506007)(38350700002)(83380400001)(7416002)(956004)(2616005)(8676002)(26005)(186003)(52116002)(103116003)(36756003)(316002)(86362001)(1076003)(5660300002)(478600001)(6512007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/JrJ7PVGJYPqF9xroHqOLGoVrkHurGfkqXwIoDM433gQE8OWed1nbv+oirD?=
 =?us-ascii?Q?zWPex3yjpi2sk2cAoSMglh+KP93efeZTm+QM8TCjodfWTA8qqn9NH8qSf1B7?=
 =?us-ascii?Q?4Ucb63jQY89hby3WifeIMrFID1mbaUwqviGxnDCx3wNr0lORWTANpomrT6Z6?=
 =?us-ascii?Q?V5gncLZwmi+RrmzuWfCJnEpYPXsmqS3pqqToJo8NnY9BMKFjKQf1WHrbrtAi?=
 =?us-ascii?Q?x1iFXgbuwN/xjUO6W2mBDxb3LDe+nhB8NLHs79u+nnLhGaywMTR94oO1eeTp?=
 =?us-ascii?Q?tQsKu232iWYoE2Sk0jwMprb+rml/pK180zeZqLYTRlcM7WJERcbSk0SwYChG?=
 =?us-ascii?Q?bFo6ClMwhST57kwdXuw8bjChVEkN+4n2M1CsPOEh9eECDFKXZQtEJjjweha/?=
 =?us-ascii?Q?1f2eilcAkyrx5lC3QuvS+bIF2fhV9d1cY8DYHNxpGlodX+5E5n8ykJIat20i?=
 =?us-ascii?Q?JKn/3hEWaNVevYXFAwNyqbZdA5SXoa+saxJuvC43i/OZ9VyySQJSBuR1etYD?=
 =?us-ascii?Q?0wWIiObP4OX6XZVh8Iy1QB4ikWOKKGEVmVaUU6zXdywhZrPv8n/PCwBX30Ga?=
 =?us-ascii?Q?2Iw5X6Q4/V2MnrNUbIMKtaVaq7xklenKCJNrnNRk3DNUVXcAmQGj+Dz/wB0k?=
 =?us-ascii?Q?9EHPJIxaKD4hhLkyQFuaOO6nqRXxlW3Fc/va4XDSIVIFV7Mw1MiRCFfP3fdu?=
 =?us-ascii?Q?sEthrnBlMTTUg6+PrhFoEA9nY2WMpxyWhlVnUZ39YPUtrierLBG4arcXvd8h?=
 =?us-ascii?Q?vBjHMSY+nwWnp/s3ubYEIrsjC8dyMvBcsojUyNVg16Y253muRfiF0CykmCDc?=
 =?us-ascii?Q?PPSDPpDYmewUsVY9NPjuM9t4XxKi0WFfIl71shSsJivwpPCK9Pyvn7tz+Xq7?=
 =?us-ascii?Q?rDT/Opt+1aptuhNmQsnbp9EYqLgFDaiD3KciwhX34pHaLTDIe7LQAC4DIyol?=
 =?us-ascii?Q?+upoQ+1+pOJQokX+7eAu9FIoDcxyiWAvtZRCriWqWVS+ISlArCS55qZ8ZOYn?=
 =?us-ascii?Q?zwpvGJfe/rMIxuCk4EyKBQc80BrTIyZw6RVsHBpEPo9XJ7Ef7x+qhfXVlWft?=
 =?us-ascii?Q?KhgXBEH47vc9Bb6lu6yLVc7tSM7ZZ4Q5LsYSXJis8eDMaaPOEBHh51Y4FFyB?=
 =?us-ascii?Q?0oBi0lvp9a8EdJ6Qx3T2MN1wTwpDks59xHOh/V1C/KIQ/3/q6XQ8QlRf17UL?=
 =?us-ascii?Q?+MJ3zw5uTYoYZ6LfzC/sCym+ow/R7eN50RegPAIQVz7FW/V/FtxqhnTwjlso?=
 =?us-ascii?Q?gf37+TA8OOcR4Jsg6w/6zJFTST4y89oyXq/m88nPMptpWmHSyGK7Wg5tKqUz?=
 =?us-ascii?Q?vuQKeYW/YOHaOvUWtIO4RVed?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ec7627-1dff-483c-7f6a-08d97871be5f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 17:53:37.2114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auBqZSnXVNp+qmx/YXiR2sP2dh1ehdW+OjVSpXXDGj/0s6AL0ddRohZg6AmFR5Ox0FdzmVa1m4zRJDPxTkaNPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1568
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150105
X-Proofpoint-GUID: v4IUkiFq3A7L96MP7GwmVN-b7FQbPO4w
X-Proofpoint-ORIG-GUID: v4IUkiFq3A7L96MP7GwmVN-b7FQbPO4w
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

