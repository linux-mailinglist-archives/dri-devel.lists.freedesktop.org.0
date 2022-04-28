Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F317A5133A6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730EB10E3B4;
	Thu, 28 Apr 2022 12:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5129610E38F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:26:51 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SB1k2q015535;
 Thu, 28 Apr 2022 12:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1hvGKSvzYzszlPQmMSg4O4pQKOYaD/9ul/dAoxiyltQ=;
 b=APJaIzRMvYuKpkI5UJHyDhDT2LEhCu1+YSlGm/MlWOuaZFZ99Zg6uEcXcX3kaFN1EPwn
 5gHeM5wcnO+n/wsEWXB4Qc54N0HR0LmXLwOtRYvWNJNeo/xLrN4wazu0aRrZ4k68Hc3U
 FJkCAys2d8OD9k3FZI4pNgNBI+T1qRVezfXhbkmUOKPVI4UjgeT0uX3KvmEU29phh7Ud
 SHVIKqFMuscti6YNMqeV551sO2XBJKodA5l5oRGeQlOAYwCyfMPvUOqYVbnAW1dAq9aC
 Zlh5uWsSfjQdq5/PzaRVcHmuPw7v7amGNiKatI0axVbgBcnmtDTUzJhuSV7YG59H2hqB Eg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9aus6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 12:26:38 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23SCANwj020419; Thu, 28 Apr 2022 12:26:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w6hpj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 12:26:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDNmxwwGf4oewM0PYCD1psBYZwlosgRdchll/u1FVHIzuFCLV/SP/kBLlY/TFLORcVqeZOvHQqlsZGeV4qFvmN/u/vm4BnKSo5aEeNbHFY1VMXfYcFM0l2Cd09I1Ej+CldKblykP0CMYocJdGQnL7Bz+0oLjVmlRT2Xjogx6x4a0t7AeFZdDAMxCU2fwe4yeZ/fM4qCW5DDiEjUDAWA66P/P57OFMYw8eJ21a2DmyQXjGaMRl8SzNJ8pfpVN+pBMJRI0pgo3ETle9ZTTCqG/p7keYpT1bzfGBJGxv4GeL2aaDpL85v2lwDUQXsy2153Qvo4H0j/pCHWS9l58hYvt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hvGKSvzYzszlPQmMSg4O4pQKOYaD/9ul/dAoxiyltQ=;
 b=Ogl6gzzEfyYYDqDuO0+O/AfypYn8AGJTjB1To5OarZ4NmXzOhHP4gumTB3HmY+HgXvUZAcz5YOrXvNe+ehEmRoIAHmV/EPd6s6snv6ioiTeK5pT3JxDkgv128cf6chkdx4KnVXQe4hluBge4QsrWq2ha0qhs6E69+qzG6w2JtEsEWwivM7HNxcOZpplN8m1JMV9cNzAw3qOE8eJ4EQIWjE2JjVD8SIoxALjQ/8yTjzjAy/pH6v5fKghoV0pasK9WUBUAliXWB2UTlpkyHnENTPS8OwhsRhoHbqJPu9Z24UnZj10zdqa5rD5fgRbjiF+QCZQlS5EtA2BePfTFJIAhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hvGKSvzYzszlPQmMSg4O4pQKOYaD/9ul/dAoxiyltQ=;
 b=CChoQG88CF1E4SY+nfa5ac61LehKUZE6y6WyOinw1eZH1rA4wtzP1tTIb1aUGZg8o95eXIn6530QC2MRvSTq4gAktcdh0jny4fk924TvrBp3YZYMJ8ru6bKHkuUpdECY3hE2CMtPPXTAUJzOw1/7S+vhAqIaH1jwyrdLnTyDNqI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN4PR10MB5800.namprd10.prod.outlook.com
 (2603:10b6:806:20f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 12:26:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 12:26:34 +0000
Date: Thu, 28 Apr 2022 15:26:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/sun4i: dsi: delete unnecessary IS_ERR() checks
Message-ID: <YmqH71MtoGn2AXUg@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0041.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 680f1a99-de5e-4410-b0c7-08da291254fa
X-MS-TrafficTypeDiagnostic: SN4PR10MB5800:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5800660F5A96B21ACD5C72528EFD9@SN4PR10MB5800.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4P6Yj7BFJphN5uDDGqRvHtACX+Ox3lrkGX2tVPwIxP2skOeLK3r6R1Jj+6EH1DE9brM66fYwbtecYu5D1Q+k5aGk7UYDKC/A7Vn5KLvMLWWCevNmrMH18JVLVWoMpJFrd1JV2LVaW52QyIc1hmcgekCZdxyXmNfUXi7WzfmFzYakRezEokyt3Q7sCv5oJkwJqKRMQCMxi926GZzjHo1Rp+gCuSaASBgh8RfcqOWI1+AfwKFg241SHMwe5FZL1G+E2umytCPygOvyruFhLAzX7NS0bYXMvtbN+4NzDSJNP1a7N79KGk3unMx6knjOuDyK0S9kYa6H2wjzBL9V64Z6mSWXP3ovXMxRWK+dV2UGPMyV3nnvM+nNRD2Moi20Nsjs5MNqdEkGwScv7EOZU5CiUxcWXujT5qB9Ng324S+uKNUGdQLiNu9NX0i1d1fgt8PERXT4RRO482sV890VGQm6LTmcbGOBQN8/AKRlT8OfObLaP7e6aVBo8mVp2OEGhS2eSbh/pYRZaWDVmhuup/lEWdeHYLaT0cCKnRu1YnminN3dRI4RVTld5WeGK2lJfMNyj8ftX8v7k4xiHwAPdM9Kj8ECRg/n7Vmv/kjp4c6D9l+OlxDOqPkKCP8uxOuO0MVmbYdcxVRZbxlEAalTkY6k8rqKSB90uPaqcbmGr/u69t/vXMb8z1oLWYlg5jfaFBd0ZRqPrnwU0nw1KhpdfWk9tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(33716001)(6916009)(54906003)(8936002)(4326008)(316002)(186003)(66946007)(8676002)(66556008)(66476007)(26005)(6486002)(52116002)(44832011)(38350700002)(38100700002)(508600001)(2906002)(86362001)(6512007)(9686003)(6506007)(5660300002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5vFcU5q7u5/KaScfmzC+tKHNVrVgFqShgOAdSdzU5CgnAMXYdk3d245zC+1L?=
 =?us-ascii?Q?p7eVOlnUf1O6dDmBWGickizibaFqG2XxB4nkAraNMFiXdUxt+d+Sy4/11ufK?=
 =?us-ascii?Q?7gqQb7gT1LtaGEBQ3bonKGxKepYP6tgHQVwvrglPJNGh7I5NqitBAV5pvuxT?=
 =?us-ascii?Q?1F1v/SsfmD7ZBhsEXeo3QyZIMQZSiZ1XYFj4PkPa7MdI/+ItXVf02Ky0RiWZ?=
 =?us-ascii?Q?6wE2V08U9oIZprOL69EEYBs5tU1M1qqQbzOyBDwHQLuVtQvqdWuy5eMBWwQQ?=
 =?us-ascii?Q?VmEeqq4hAQaN8Wv224AO0H3VIB8Ov7LC52KNxNeWV/aVv1oqjVmoIZks7NZw?=
 =?us-ascii?Q?YHStRifonboQav7K7tm7FDcXjca3a/JjZFnXBMv4x4mqUA659FdKKgDjgLJg?=
 =?us-ascii?Q?nR9xOe3s0nAu/Kgn2L80GITECsLmYJPRd6qD0lBD87NW6dVRrVIETe54Bp/I?=
 =?us-ascii?Q?drbgdhrFqDkQbnMeF9IOndcMxYPD0ijTNiLRJeyz0X39evMTAqFugXAZaHbb?=
 =?us-ascii?Q?JK0AcTqetD6SLp6VQC8etAa3dAOwBMUNLxo54PdT87lZV1TW6+H+HAzPq6rh?=
 =?us-ascii?Q?r5GIADpoBmBli+9ycH+dU8ueLMTwnfZaRHcVt4IuClQ5CrVZVGV648yak1WT?=
 =?us-ascii?Q?ro2vyGAX3r5lqgw9TvqSUj1ZyLjSzKN7ZzfhMn4YVHjNsCS5iTktgTiS8JZw?=
 =?us-ascii?Q?oNMDg9kf933hdpoNmN/OFd+KFUoyX0EM0mmGlqi/ybdXIr8nCAYTj+Pagyom?=
 =?us-ascii?Q?efys1Y8IXT5xI+fk+6QJvs/IKQO/q6zNZ9ftDIBNCKgnGdNYa9FTRz+2eGaT?=
 =?us-ascii?Q?gAACBsaThp0rCkG23bIa3G1UcPAJCvcQZ4dg0/B3MrTRxle4HdTS7ptC/2X/?=
 =?us-ascii?Q?tA/MiC+b+QtIY40ZHWkILPm5tCgUs8BDgA26pz1upDLmogRTc3uUfmRYTKF7?=
 =?us-ascii?Q?W08X0qmOJPOvtj/26BURyDdS3dL3lupeU9JcV7J7WCGnUp0+xAd0L0d3vUCG?=
 =?us-ascii?Q?cBRJLzRj8U9JN7jXoYdiTTHgl42wh4jZPGlXsiUNSAY73jUEgcT047CUA3hw?=
 =?us-ascii?Q?+ueMVCpDFH13BvRF/KY0ZZF0GElUqjdfPV+YQeAnNfZzhd9/2AB2pnEhIVKL?=
 =?us-ascii?Q?g0aiYgNLoWdN23DXJsjqVQx28UAxCH/LjCMIoc/pA6zd+xNyZHo+Mr/gsiwZ?=
 =?us-ascii?Q?jOxPEsBViJOSxH13jzcmTkQYK7oXd5OtHhhYQxuBZD4VfJFvY7+demq0T0lZ?=
 =?us-ascii?Q?BVm18MbsyQillrtQQBUT9Y/4QCM5iqsMSd0u/T3lbM4cVZ5uofWWkuAa+QGS?=
 =?us-ascii?Q?VRGVh5msT9byEVLd6Cktk+XIYJ4Kd7D3UzUIKWpipkM2QxOt/JtN7eXnTyXK?=
 =?us-ascii?Q?3VLHiO1369XD+HDxMf3U4riqfxTp9YIio/WdVh1IoVpK8nbJokippe6lbS+Y?=
 =?us-ascii?Q?ox1UjjjAo0Jgs44guHii8+e8o8uXcF+TWX0jrlpzaq2C7gwkv8gaICpLCKoU?=
 =?us-ascii?Q?g/CVTb+xljtOzOnJZjwGs3JXjCQ2Hik7Npdpw7f3UOEzyGWmh1H3ZJXWgZkB?=
 =?us-ascii?Q?9WILRI4/x8KuInyRKa2zz7doq2gRP5QVfJkIjRa+Zgr0nT3objoC7jj0EIZ6?=
 =?us-ascii?Q?4/VEagqxBmiNZ6gOdQnhP5/cd4bIj8waMqG1EnlFg2mb2Tn2GTJL5rFKXuZD?=
 =?us-ascii?Q?Y39JMgf4d70i3GsbrDQyFUNjXjS7BlmWKBb7NV4JsrGZyrl2hotty4876Mc2?=
 =?us-ascii?Q?8g0nbAxAmjARhlSWHKFsrr4+g3yAiOQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f1a99-de5e-4410-b0c7-08da291254fa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 12:26:34.0868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAZkDT29rG01I9sOqUDmNs9ZJLCvI9tHW4/Hs5FH/UbbSx9XK4UF9+GugDWhUrLvQ3cMONI8G6RXZh+DyYbS1xf/6NXfmhSxeQIkTsmpNTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-28_01:2022-04-28,
 2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280076
X-Proofpoint-ORIG-GUID: 7Tt377KX9KIUe1DC4xRixdziz07vARtP
X-Proofpoint-GUID: 7Tt377KX9KIUe1DC4xRixdziz07vARtP
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "dsi->bus_clk" pointer cannot be an error pointer at this point.
The check is confusing and unnecessary.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 527c7b2474da..b4dfa166eccd 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1193,8 +1193,8 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 err_unprotect_clk:
 	clk_rate_exclusive_put(dsi->mod_clk);
 err_attach_clk:
-	if (!IS_ERR(dsi->bus_clk))
-		regmap_mmio_detach_clk(dsi->regs);
+	regmap_mmio_detach_clk(dsi->regs);
+
 	return ret;
 }
 
@@ -1207,8 +1207,7 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 	mipi_dsi_host_unregister(&dsi->host);
 	clk_rate_exclusive_put(dsi->mod_clk);
 
-	if (!IS_ERR(dsi->bus_clk))
-		regmap_mmio_detach_clk(dsi->regs);
+	regmap_mmio_detach_clk(dsi->regs);
 
 	return 0;
 }
-- 
2.35.1

