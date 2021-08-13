Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1C3EB4A0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 13:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797176E7DA;
	Fri, 13 Aug 2021 11:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20996E5D2;
 Fri, 13 Aug 2021 11:36:35 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DBWCth016087; Fri, 13 Aug 2021 11:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=mTuO+uoxWKAEhsQha4DW1IoDkeK2ZzorBUWTEvxls7A=;
 b=ah/tbLEf1BPXKU1fL+njfAHrsUUUxnw6Ru+NBkwYmY5ZykOjyRDlcqZpcaiKEqOhTNNT
 W5ByiRsvcHDZEasPJLX0bF1Swre1xd2iNQvIqJKCW2ahRe8lwlfSGYTpFCjtJGhYtCQw
 gUVk9PapEunBmVmLsnle5bX8iDG9+aoB8E7fOwBl326Rej74Krf7msVrSzlWnoxNWfgy
 HIoDqcmIoT8VROGb87Sjxh1BQpePHi5xhksp1wnjL3wlQ9ZbcSfZuxd9y+2LOmYXssqn
 OwgYZKgYmIN/JNTV2u6Qm3j7n0DU97ZTofb2KWn/Z9y4tobcFQQpqXfPsWTv38C6SYRY fA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=mTuO+uoxWKAEhsQha4DW1IoDkeK2ZzorBUWTEvxls7A=;
 b=Rm3YKrmh3j+l5pjNpiHM4+WpxckB/GWW7q9cVkAE+4J+l3kpiQjMyYZY64wB1m24B4Fw
 qcXCF0u6CdaNUDmz8wpSbmpXvcGsKFk7t2Jn9vSfbl0R4QiStXW8KZZqKD9kbwi6x+0D
 NOHkpmnMF0yQbQ+0dQhQwa4OIRK7DwbO3eN7CgLwevAWuZdkZ7ob2jAoYbq/Qdng0gDs
 kPhaKXFf1crYQHfiPxza56iiExQPIhpaNTuUbGvub1A7CxFBHSpXOEEMD+ZVq687UM6J
 qeUeLMmPjefaIoOlwycTto9XP351W5ekWIXNOsiSFfOjz34YX67ySddbEdw3ZrN2QzVu bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ad13vaqvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 11:36:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17DBUTGS162924;
 Fri, 13 Aug 2021 11:36:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 3aa3y07wev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 11:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myPU5WREk1WgSc9Sg9lJur97PYAobjtEv5e459jd498hgZdd2b23kl8j+2IxP16j4jrjR2WUpdeOwzLdsT+lEGfHZl+URMUDgYldy4uQxzUDdFSHkMb63Y0ZZwdRkr4j8S63cv4zXPup8hi0IHagjJn4Le6z/L41a1PEzblkYf8L3D5Wk/hN4qmTw4cW3vQGsnHO9IvA2S9FvxRs4f8gIB88GFRtdoc+3fFdATD2Da6XpH79JcZGJP9PCar5AXYaLi4TCYJNaetEJgLaUzhCdgjAD2ZlF0hH7sYRgnWfApo94+3xX5WVO0JRDOidxu+PCe/JMMiaCLLEewY3HM2ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTuO+uoxWKAEhsQha4DW1IoDkeK2ZzorBUWTEvxls7A=;
 b=Ea8J643FboM0oDSpMpweGCX23lGO2cXw/eEWJtrAxTMMZ/mhjR3MLwHPuyAuPxWZ+FrHSdcwUzLAZMa9cOtTvWIkLj26EJfd77Dr6bOLLMH5OISvJ16Evfdgn63dVXTEylE9ISAvjy96tYto6Z/JM/3Efb3E1PCGuA6n0bllnAMARmCXQmWpMto1lCBGFEaG4kofu2K5Z5fqptapKUZNX0KiYwPRfCZ0aSyiYMozx1Nr3vju7USFl5XKpEmtsn3XexKt6t8tC9nLPV/q+1pSxP0eCoVzF9h/isaZYWGcUZurttqcR0WHRqN7EsMJKxJT/sz53cgkUb7GVHcecwAr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTuO+uoxWKAEhsQha4DW1IoDkeK2ZzorBUWTEvxls7A=;
 b=wsPpn/BJWchaRAbqXA1AjnxD45ZKqE8VJBCUKraxgoVruMMRVUSKsgCjBuZXwcLuMcWwVxxpxEOdoBs8UwVM/G5Z9Iuc53ABiHswpm9PwhUQGW8Z4Ih2sOSGrO8Kn7u1h8bqJVbRanBUzV/EHBpy5EtFTPe9gL44Xk3wwLkY9bo=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=oracle.com; 
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1725.namprd10.prod.outlook.com
 (2603:10b6:301:7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 11:36:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 11:36:22 +0000
Date: Fri, 13 Aug 2021 14:36:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Potential error pointer dereference in
 pinned_context()
Message-ID: <20210813113600.GC30697@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0065.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0065.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Fri, 13 Aug 2021 11:36:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f698d61c-40b3-4baa-e072-08d95e4e9396
X-MS-TrafficTypeDiagnostic: MWHPR10MB1725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB17251ACEA8965F9DAAC8F46B8EFA9@MWHPR10MB1725.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H3QRyVawgrjZGTHFYDNBO6gjYSntzpYYu/6KrnURNYEa6LMk4V6xn88h36mKQWjR3ytxR4jpXOvZg0i2PNpDmZWs/vzieOWDI5i2Vd2qVJ9N1VvJYZ2R9uNeaPfS/qk573nmzVF/vihiDDhAsxoECFfOLKpaCbH8JsRcEtPGkOmqckf0IMzjoFB8uAE82WP3xzdyUGGb1yogAvRAhjwJ5yZ4nHv1DIxIDmrJC3hNV4zLUQsYJHFQcm4WQKI3NpDvRlAi73d2Yg4zJ2N35LvcIXkAdTJp1E64HXzQp52NR9bllM76PMDli3YzKIvFiIC/rQOwcfZGyvZrQX8ljqEGYaehtRrI2hBtKDtGvJ7YwV7k1vCNgfyBbARMiRiaCj4GM7ZQ00qmACyqc4NHYLfVmcfZgUL8MSnO1Ps4CnGOCZbqOWXBHsnwXfJCtE5scFXhgbM+XKjTXdR5QS7P2KoKc9gUyqw9wl6wPNMtjdbSk9F+6EllrXQb6Ym3gRDmDokCThy4mrrs/7xggtOlxAUQv3/hQ4sFK4T0uG3buNxTkZKbYuxD86mVcZWaQmnNzlU3BmBZ/0uz8ztX8z1zpG5R3MUEP3/3Vr4kdJFOiSVpxTKBlRLhBoLgCbHsiXF6sHH/X2xAeuTktVCxTivR8WihR5kOtpTJ9V4BXElVLm04UEiwnXCIfKrt8nL7hk+YUgYMspLQJuYbHLsiHzvEl26/cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(316002)(54906003)(33656002)(5660300002)(52116002)(26005)(8936002)(6496006)(478600001)(8676002)(33716001)(4744005)(44832011)(1076003)(66946007)(38100700002)(66476007)(9576002)(186003)(6666004)(7416002)(38350700002)(66556008)(956004)(2906002)(110136005)(83380400001)(9686003)(86362001)(4326008)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i3S2YLQlrowarjuWYqJizKvFl39ezYh9BTp91Da+0NVRFQJ4DdnC0d/HBK3W?=
 =?us-ascii?Q?qaIeNGTv8HR9ZwoI7TBCFW1u6jCETc1/aB921wKNb9S4hrCG4k8pK4EF/8Ky?=
 =?us-ascii?Q?yIjPW6nk2+lsjQHpFHK3uY5vO5xEqsX+zXiB2AuEJUXyzpXr6YcOZFlGGXdE?=
 =?us-ascii?Q?CM9OynSd/zOJODFLdyRV8uTU7bRz1QGbeLzMqDA29sSMivPG7xaoxgmV5yRi?=
 =?us-ascii?Q?t36Bihb8bPw5IIcTYTDlG7R2iN5T6kh64fA2LtROZZCUdqzmqXp6xvWzu3OE?=
 =?us-ascii?Q?PcZU7zVglEQJPaUmoBmbv1E5c9De00Lg17RcR+SS1SWxqNEGahM6ymNhtdor?=
 =?us-ascii?Q?g1pF4hT+rbYoG0Wd8js81Ytp1DM18u57s0E9tgtsgMVJhgiJyUGU7ncEIS6e?=
 =?us-ascii?Q?68n1J3zQRGPAqcEMINxDwiu9S51QlTmFtRXwQ2bhIjx054RP6p+0+cOzlNIE?=
 =?us-ascii?Q?y4Fqh36rjpxUacdv5swUkQuYJpSn+s42n1+N4qpRCTWpfjrVWUaRql6COzQQ?=
 =?us-ascii?Q?bt+TgN4euUJmiDTO8IRlsrjJGTbXJ7AWPK1XxByrVVcaO0y7zJTcjA78ArP0?=
 =?us-ascii?Q?DaYTrtBCLRBd2+rYToN46XjAzsl9VYKWyJuxqtHGT2Q2QYbOe8I7hbYpyDYz?=
 =?us-ascii?Q?Ad5f+fDw2FrclxepPusDbpOJzeok9Bw7PqnjRvcWdek4jbZR7aNlKvdOchsA?=
 =?us-ascii?Q?Z0pZdEkJhaWVs3WJVemrXmdi0j3ETa8i0Mr0IicryJ+XkDiKvw6Yt5o8y+gm?=
 =?us-ascii?Q?6+qF7GqHKW6TG+kbVK6ri+Hd8IB4DIBYARt0EuhIVCZOKH2ej9DskG3iCrq3?=
 =?us-ascii?Q?CziVv1CDDwexwEpL3Ha8yzKQCaDmttj+7/1OPlRsFgLCDp4M0ZVRxvPLcyAb?=
 =?us-ascii?Q?rmm1wimWXgtLJrqaSJyNq4Unb9o888Sf/CT+nuo2/vjJhU+yhh48gbOsbNw7?=
 =?us-ascii?Q?ZCCzHrfC3vwgZumEBgyGhVT6BYKLBXbf8dOQ674LxsrmBOSq2Q0diD9c4pIz?=
 =?us-ascii?Q?Ry+ssTleTMTLy0p5OPdm+QkoKELUXtypCHVq2u1pF4wmU5bEw5oH6xQZldxQ?=
 =?us-ascii?Q?D5clsPiyF4bgZEnLOMFZ2qNbYLNwhVRcsOthYQABahxY0opRFhKfSHgSDbNT?=
 =?us-ascii?Q?cxs8rskr9BtDCm7Zpq1J3VMXJ7pHV+TGi9h9OLCewJ1hGVQAk9NDHowebTvl?=
 =?us-ascii?Q?h410TkPZWsTA+0WLLXVmSE72K9zph8P1tJ/srrGTLWg+u0bq2uUL1+R2A5D4?=
 =?us-ascii?Q?4GPv30Ji9Jp68GKFCyCid5Ts+A43FMpDXgDQKtZ6Ey+pOeBZ5Dqt9J8Ms0Oc?=
 =?us-ascii?Q?annYADw0ITJJ6qCAqQEOEoQs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f698d61c-40b3-4baa-e072-08d95e4e9396
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 11:36:22.7323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVQFTs5I4GLohn4mzw+cWwQeL7HMrINKFC7t7TBJyBmz1i0ZIvnYyPLUkDWW4m3ybRXUu9K49nMYsSnjpaCSEOK56cYxwT5+5cDm644yfc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1725
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10074
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130069
X-Proofpoint-ORIG-GUID: 6uQPVqGrDEDRb5UD44eCeX7A3iXReCOW
X-Proofpoint-GUID: 6uQPVqGrDEDRb5UD44eCeX7A3iXReCOW
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

If the intel_engine_create_pinned_context() function returns an error
pointer, then dereferencing "ce" will Oops.  Use "vm" instead of
"ce->vm".

Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index d0a7c934fd3b..1dac21aa7e5c 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -177,7 +177,7 @@ static struct intel_context *pinned_context(struct intel_gt *gt)
 	ce = intel_engine_create_pinned_context(engine, vm, SZ_512K,
 						I915_GEM_HWS_MIGRATE,
 						&key, "migrate");
-	i915_vm_put(ce->vm);
+	i915_vm_put(vm);
 	return ce;
 }
 
-- 
2.20.1

