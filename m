Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC75549DE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED0E11335C;
	Wed, 22 Jun 2022 12:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F76E113360
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:26:14 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MCNTqT010475;
 Wed, 22 Jun 2022 12:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=kX6HEkm58ZPl24+NxCYde87SxqqGudnZkG5OniMjibg=;
 b=ZrVsn0AEJkiukPauECwUv5HeSyX4dfj17rlHKnkKE0R+1q5FK8VVfBCzLZNGRFbmuuXX
 xtZ0ejG7norh1gDQoglAeMXoNqX7tUDvpFkHJoip/j8NIAfBPhbN45SwWDo2P/6dxCsz
 AVcAY8+qaitHUkA/SduYewlnces69q4bT6VyIieVPM9VKPlh21jJ8Wx+zhwtt4MoH7pi
 OG+/CEuET2H0er0n/BdPhm8gtkA2liNo1/wetW8Cp/2gHzrIrS9eo9xCKOfRI/4qfPOK
 IA4pRI56l3tdZeBeRE5RfTYvu15m7pi89Wc+FgWAncVT5/QWYbwHbcWTrs1R6fajEv/q zQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g20cnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 12:25:30 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25MCGqKd021130; Wed, 22 Jun 2022 12:25:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gtf5dhd87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 12:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG3/+mxel7rvPETpHq3apGJWKNnVfcWWnSIs4vU2xE/CDtfMs4I55g4dCZ6tzAy9t2tb/gbjMnTuLz3kHCkiSwqnRjwx8hdT2DiTlyT8hj1AQZOeYMLQt17TzpOiuzTy75WEuxV+5+LRDeYr9D6j0Yg4t09BM4RLH9CuGK+gadUQprUvZNF6n7Sc99BS4J6965/S8W3aCILTtDCBWETrtpAH5VBr0xsKCioBIw0vd7Av+KJ+1EQeQasG0KHQZ9+uLRhmqwRNSHGeL1MRNeYY8Xv7yLTFjzNqcsxLTa7gFUrdB6EZeNSL6k07fHv0MolGjJe87CeIodl8gezJA7bDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kX6HEkm58ZPl24+NxCYde87SxqqGudnZkG5OniMjibg=;
 b=YYED8twXqXRcWxE7U9rSZKvK3BJXXcuv/mdcGJXEfNdBGfekWF01HR6ecQlWDbaJzTBYI3bzodPO56MI+zEUf5wjFF+acNEuZPfPPZOpOuUHpPIwxk4Bofj0auZe08IIc+sXm0Urr9K+W2uuINAmhja9kD6BldiK/iOYIA1kBDqt0H4kiWP8n5vbfhtZvu0BRWLMBuPU9uLAnA3gWCDkBhRaFEEoxB++KrpVnWQ/zPMsYakiaZKtQ+J/PmtsoBGrokzjLw4/53aoNaz/CskfCj+XPlvxjnmcuywlQ5zMGgeN9d3xBb7QwSg6y4lRh4yzz05WwmTEh7bdPC8Bp94XmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kX6HEkm58ZPl24+NxCYde87SxqqGudnZkG5OniMjibg=;
 b=o6WiDUjiNURVoncGJjMKSYd6IRXoe1QlTe0upJxIX7sWZ5FTsZA+jII3AgOzTnfgoHz9zKZdvKg96I+qM8recqiM8KAZKBCAUZhaXrcYqTJO9tCc5tOzRziP1TuWtY1CqOBt/zn843yPv45KmuPaiRc1t89Mr1cSAtwGN0izWPI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2669.namprd10.prod.outlook.com
 (2603:10b6:805:40::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 12:25:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 12:25:27 +0000
Date: Wed, 22 Jun 2022 15:25:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/vc4: fix error code in vc4_check_tex_size()
Message-ID: <YrMKK89/viQiaiAg@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZRAP278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bde9c8b-e1cc-4339-0ef8-08da544a49bd
X-MS-TrafficTypeDiagnostic: SN6PR10MB2669:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB26694331C0563D1A9CDDF8728EB29@SN6PR10MB2669.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jekHbnPojguczJUKpU0JaMfilos8UMoxIVMQyctHMabrRB49RSopjW233VtYgvx8cLXdOVOHMp+G9Ac/sRMvgru5wSo8gEi7dEyC905vXMJ/JYPCUO0osF/5WkVzG5T/Wnby10A79X+sA9df6Xxb2vbnZVXwnRzLiaWf5gj+YEdvwCNZq6EwHQE/2YVYhYOFup+AzajF2Ne2dk1y7PTtE2cMM7Nqoq50cjd76pZbdkfGDrmHHf5aGog8BdI1rGgg5WlHfItsdpVpwwlSFhJqe8n9szIjPHmY9LmrDaEMUCtvfvP5MBsP0GonjwrU12fmECEJQqWdOoTxfE1b0HyjKoSSVYniEaTso4vDXfHGkbVg8xWX3zjAq0wmsSUbxWaUAFyhXbyotAt6xesskvcgMAFkmgHKKnh/Lgzz+/P4Dgnfd/bDoNnV+tbejlZSw1kDz5HIj79X4Q1sdyA2mjFSF9k9J6deQQuC1qcS2PZjg+LWLTc40QbL5H2s/75fnUZyjLRAjyq2GM8U78gI7buEp1bRSMO5v8bnxTi/EDNcxhrHjFkeOxZCG4eb+EDgTEvplqLEo86ATh60eUs+3o9tn/rEBhKst4Tc+HS47pLbwmhlgQ9R3lSWJsWqykG7HPegWfmqqSj8PkdKWHswXAhCONQdES0UYt0CrtgWMn0XRqgbIEp7UxEWFhE7L0KSPthS9gorPrPCQDuFJMJq1mAp5heFyU8bd9WSKqrcyvThgxCq/q8MujB0EvUChX34eMoB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(366004)(39860400002)(376002)(396003)(136003)(33716001)(8936002)(4744005)(44832011)(5660300002)(6486002)(83380400001)(9686003)(186003)(41300700001)(478600001)(26005)(6506007)(66946007)(54906003)(6666004)(316002)(52116002)(110136005)(86362001)(2906002)(6512007)(4326008)(38350700002)(8676002)(66556008)(66476007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0HOEOkWq1HsAIwwD2o7IhVUMQSb9K5iScVZRY+OmkDzSTQirmdf9+g2wLSqh?=
 =?us-ascii?Q?0tftL6oDJfu4GcyCBe35ls+4CAMvexJyh+Zhmxl/0JWwKrESppoDtYYedI2V?=
 =?us-ascii?Q?1KVWlh/XoG6tumsTRuqOY66Fk6xRUgTcuh0Cxj2e2bvZ+iydETY1RTE2hUGC?=
 =?us-ascii?Q?iU3etm3ond1oqlmqidObbLwS8ztJfdvMgeNwWfu1fd29wAxDbLTGDVqIKPpp?=
 =?us-ascii?Q?1knpohychN2SVLAm8S1sz6yGYFQDy5ODFYXq2nSLMeR91HzOrhT/8o32nNT3?=
 =?us-ascii?Q?VxCVQYLGw/miMxyTk7i5uGwGJkWEzxmOIL4EwXtd7305HFouqmTMzY5f/5PV?=
 =?us-ascii?Q?UC3W+WOYGrID1d7SkuNPOzPhdCAkaa+vR9yIseGFw7YjjcOkDNPKMHRMGXH5?=
 =?us-ascii?Q?haQyFZx1LbwRVjHq+JpZXaDY1dX5jXxV5NGvARHG5uf5hBt+2wRdoeRyW3qN?=
 =?us-ascii?Q?R7zs6sSYVGpYvWQP66Cs5jS+Yk3cdbgKAKQIvTOGbpeEGYPNJEhzWf8tcjzd?=
 =?us-ascii?Q?7zKSUqFAxJ4JZJ1+BKZAF6KFh9uTv6yg/zN1Uyev/Kz7uhIgWKSYJPAW4Q3F?=
 =?us-ascii?Q?qzjTrrneyUuALje/alCEQC67aesWbN9roMxgWpojOw2MFCTpPxeV7dnRGOMW?=
 =?us-ascii?Q?9lwzh0ZnuIoNKQVM16VYRqR2TqcEbCkjSmxjIpIVVbSKQps+hKZCQcuvvtQ9?=
 =?us-ascii?Q?bjI0DkbNj48qlzENDMi45oarvMsrNjQT/yI5IHgnDk8CL3EsxamVFOapStWf?=
 =?us-ascii?Q?j5EKsQh703YFgZ+3mV43OLdN8CQn6rmAhoNhuYofdacrOLx9UseGXeXGY0p2?=
 =?us-ascii?Q?xTeYpr5uaJ880ci5Xz/fMWKxihFMszxRKYRRHkN8SBhN7B12llntkqsCbuHc?=
 =?us-ascii?Q?yHsNCLH7RiDopB/gK5j1tZCDD58quDPCtzXMyqz+D6rDvjG7vLabZ1tppa+D?=
 =?us-ascii?Q?bzzQxNYijXfL9u4TQB5lUbKqB9jB1g1TNUSUsPT6utX8K+R/4mfrgQYjHciB?=
 =?us-ascii?Q?dTOeW8U5NU+v3mzP2GD6rZmQo6npEa1L/+7mn59e+j3SFGldECK0InGRgPke?=
 =?us-ascii?Q?NT9eIgYmA9yCKaulvZgQmV2yfoGz9LFufiiksozXvAP12lXkGgRS+yrBA5M7?=
 =?us-ascii?Q?4owp3bU8H4y6SMeGY9FcWGwgTQ++bKIFoeaXShfA66lBk0tamAds6ECHLBVb?=
 =?us-ascii?Q?Avn1L6sFULganDhQxjfjzYnNur/qkvVFKvVEHIVDBNIsGfring53iy4xifdB?=
 =?us-ascii?Q?487qHgDKJ1T7/QcYx7BbhcTCS7e7Ps5GL9X6+peDQaTojrPfUet0b6HIaS8U?=
 =?us-ascii?Q?FbJjbL14WtihXzTy/Xp1da0pugdZmgXiVCxRYgJzw6/2RPE7eY5ezXTG9PTl?=
 =?us-ascii?Q?z0NYLZKRFNzt/kCFWaDF6sklTMiRa8/aA45SG3oB3d3LmI0ADYP/PBwWGGki?=
 =?us-ascii?Q?L24xmZMCcwPhwg9wYeMNOQV98VhaAflhAfQpmOaOVJMdD1oxGAEr2jUhpxH0?=
 =?us-ascii?Q?mC+u8OZ9Es43sDTigaOSBAlC6tQtZmFqBoMdZxYzPZPrCQGKw/gS9EpMdtfb?=
 =?us-ascii?Q?indxVOw1qYPNg+wsoZqAFfoLXFbavYj8CXMHvjkYKZKr9EURtL5rLi86EZzV?=
 =?us-ascii?Q?ZHZCyqE51eoSRB6+HKpogdgLXsjDT867YuV8O83NfhyUsTW18N2ZY0pjCsVF?=
 =?us-ascii?Q?rrk+BtUC4P+e4+UslN5ExjQOFWv+heMZzk6dk8XtRZavGLoU1ihUJlbZgXoU?=
 =?us-ascii?Q?9/HmCKoEkDIxHYVraMYHcy+auCKREfo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bde9c8b-e1cc-4339-0ef8-08da544a49bd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 12:25:27.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHePjaQCQOVI66OmF+0VJ04Iv0yzBvIqOkKWzXTQChecbv9t/rBA1x7lCdAXjwe2u/4EOuJ4EcjFH2O4qotKehxfGzMIT2RCcmsvuDerFb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2669
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-22_04:2022-06-22,
 2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220062
X-Proofpoint-GUID: S2kZrgOEICdeJAvOILHy-G3yLbwop1W9
X-Proofpoint-ORIG-GUID: S2kZrgOEICdeJAvOILHy-G3yLbwop1W9
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
Cc: David Airlie <airlied@linux.ie>, Melissa Wen <mwen@igalia.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_check_tex_size() function is supposed to return false on error
but this error path accidentally returns -ENODEV (which means true).

Fixes: 30f8c74ca9b7 ("drm/vc4: Warn if some v3d code is run on BCM2711")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_validate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 833eb623d545..2feba55bcef7 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -170,7 +170,7 @@ vc4_check_tex_size(struct vc4_exec_info *exec, struct drm_gem_cma_object *fbo,
 	uint32_t utile_h = utile_height(cpp);
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
-		return -ENODEV;
+		return false;
 
 	/* The shaded vertex format stores signed 12.4 fixed point
 	 * (-2048,2047) offsets from the viewport center, so we should
-- 
2.35.1

