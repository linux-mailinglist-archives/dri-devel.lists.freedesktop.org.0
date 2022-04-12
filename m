Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D74FD339
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA4E10FC83;
	Tue, 12 Apr 2022 09:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F093510EE6C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:15:32 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C8lHW6029741; 
 Tue, 12 Apr 2022 09:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QMMB1FaxCvvXG/7zxw1zn+y1rAVNvkTXDGjSq+j7TQM=;
 b=zw5HhisGdwdWzfn9OjW4J0kB3mgAaMVGZv14m0lW7rR1qRcZQ2CtgoOyrtKq01FUC3WE
 ke5gWLfR0Q9P2IiFv/VdwXas2yrsECsXyhSCi9tCyPpRH/d0OZqToP9EaiIncgEJplSZ
 85Htv+W2WuVl4lH1CVqOT7f4dxQ32DIulrvNrNtnwsGRHIzLZd0XJStYDEQcV3XqlzPc
 nJVFuUx0b9oSm4wDzgdvo9NtMgwAN0O4our+tPV1Sfl4h5o0ivUMar1AwNyvmzc7swX8
 H074NWicUiSlYM29iTPhulW7QuODP894d9sGQ3rwpruUVXGNbz+1ETBM4oo8numDsJ7t 7w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0jd62fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 09:15:30 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23C9FK16033629; Tue, 12 Apr 2022 09:15:29 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fb0k2y0ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 09:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMsj06P1ByrdfCNRYYf4MikQOJ8Zu5Dwu+7SRa4kbYcGHlLDxH6IpWOhEDE4cnHT8sn0QVIPP5Pn6r/dnDRy0s2MMb0SUcN1TxtDkVzfCgfVn1fl6TA7RpzfLcrhpt5NCX81ryDHNQuC9NT2hKSMauu+13P35uzo43tXLpWSeGmz82e4/cxThUyrL3UTPQr6XXtmPcHvl34Z8wRWETkBJw5rCvVE54Yn2wANyLiFvBiNLobXVcLigb2mF85Dck4jgUYGSEsNeKOZR0ExHWFdEUnhv3h3wpIiqhmsAqdJsJZTqYNIlVQ362Tp3j7d/Hb9iE5ajUmVYP4+lynloDSZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMMB1FaxCvvXG/7zxw1zn+y1rAVNvkTXDGjSq+j7TQM=;
 b=m0e453l1rIxoS91jNIjXCopu3pshPl44P5HphGo7OIKw3CftcK6FH1W2W2WjUVfvv+C1n4pIXQI/o/PbPZ5GMaNO3piN/DSGaQjea6vI8Y3MfiHEBvgL9NHWoSH5oj0b5Dl2WjqIyW/uIGTj1SKC0J4+hXz2cw0y9uc0aAhGJcFEkPp+Rwj9u0NX1rhM/FpMOf3lLlj+YWJKzd07ADkp1jWk/RXLOeprrje5LEuTAh21DfIH+gwLLVMzAVB+kmoKjCsRhiGDorPMkXIAovRaNmLpUHwXAtlUjJKaNAuHxXK9xVdehgs4KIcv57VnD3z9YZmz2sJ5uwx98rQ/iz8bWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMMB1FaxCvvXG/7zxw1zn+y1rAVNvkTXDGjSq+j7TQM=;
 b=VPQ4OwydTIGnWUaFynoinEODrrt68KACplL4UR/tK0Pxo8qyepgwgQtJxLaRzHDSbNxy9NCpdQgbgPiiFjpbCt6bQRqBEYL+BRxdOr1H1XbU3IFhEsaK+uf+HrAfsdIVWc2omCsWZBPqZHef9CxXLVLjaJo4XpKk8cM4wymXXP4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1471.namprd10.prod.outlook.com
 (2603:10b6:300:23::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 09:15:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 09:15:27 +0000
Date: Tue, 12 Apr 2022 12:15:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zack Rusin <zackr@vmware.com>
Subject: [PATCH] drm/vmwgfx: remove bogus NULL check
Message-ID: <20220412091516.GA3229@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5b3f4bc-b1e6-474a-5d26-08da1c64fbee
X-MS-TrafficTypeDiagnostic: MWHPR10MB1471:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB14716E1B40E5F76D8D2B054E8EED9@MWHPR10MB1471.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 43xPT5guaXNKTVwT9xKxWGrQbfBUyqq7RAhRccHKtUhZ8Ezbt232ktuWirMs+W32Q5CawBG12tbYoh1woMfeqoApeuLwnbiZtz81aAsme0tE0ZqiFGzndpY+fzEuxPv5gFbx3DFEyNUQd2qiiOZi8SL10pvx3uQlu/AeVI0tqZWUrjaulLw0ViDBh6CkJkEfMFZyqPtMWUbK0yot8DY3emaNKOErX65GDdLo/mBSfCKrCkHksx2fSXNLdRi2+Kzo8PdYRcC63NnJvYApkGXgkHqBp5s4Uw9aJ607OJgBgCmHj3cpy6u3X9Nx6aKiliwxuJSj5LjE45mc0dsgaD9xAXbtuncQBAmUUQZVTMtM2/d4ZloeHGb5lOvQDkVc2NszWQSt9jmwmXY6vqHfNL7wxyIePKd6rirDI/94gr2RovJ5b3SO6VTRH7MPtFCYgVKSv48+7ooW6k4W6rlEOBE3iVzEOLO0xeWiytHnd+KmtwfA1TDPoSoYKKR/CJyCCf3sViUyHlttGfaPHC5EL3GG5hKDjrg/cFPnKwX2bCPpvjIFP+Cfqad0Nokifbi3XQ9utoeFdXEIqmpym/86HRtK94mTnpiJRRSTy1yVgeoOpkFmkHbMp/CsJLx6rsJZ63XjlxkknP+HOJ03ZJx7uyWmr/tNXwg0Fb+lZx+5wKRdBJCL7/gaI+om35qdS/ys/MoQNh8cMi6ycACWGahlUex0GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33716001)(5660300002)(33656002)(6486002)(1076003)(54906003)(66556008)(508600001)(8676002)(6916009)(4326008)(66946007)(66476007)(38100700002)(44832011)(38350700002)(316002)(186003)(83380400001)(2906002)(26005)(86362001)(6512007)(6506007)(9686003)(6666004)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nLwSFWJOvYskTLXf7cVy3BdFMar9HuQO54tMFjBUbPlKE9MamJxkQmCp9fg?=
 =?us-ascii?Q?3CVr3K5xP1ortoMdAn1iUfMtYUY6BsM/hAMs7H9CmcOxffg0ArNFxzOUWa2T?=
 =?us-ascii?Q?jjpMSLXE8x8VCtsWbej8KMoBGbKps+GtuaPUWducIlL8pQ90IYQpSc9Pmp6b?=
 =?us-ascii?Q?n6DVMkvELcWo/sBnzeo6DsHFymfObcWeCwXxYkG3O+4S+L+Sn4xG2yVXUy7M?=
 =?us-ascii?Q?jRoLd7KG32AgofHUAcb04GRv28Wmtj45jQwXitukfZfh1Y6dmEvLw+pyls/0?=
 =?us-ascii?Q?NOvMUEvZv4d3WvIzZL2XQ85JpDdBBw+Y5al9z4DhaXbhY3+4v/ZFd0zq7dwk?=
 =?us-ascii?Q?w6/dhhgo+MoE9icFTHmdwCxRe3NkwPwcP7Q6VW6X2x63Wl/fKpbbLOnJxBLH?=
 =?us-ascii?Q?RnfJurUcJQgbLEtHnERC8xhiHooEcaI11bN+wLH0kD0WbvRoRppnWm/b0W/6?=
 =?us-ascii?Q?Maqo3YZhzRb0m44qrH6c7xlGeO9os0hMeoGXyPX6ZDTSDnwkm0MQ6tisvVO/?=
 =?us-ascii?Q?pZqogZz7mJkGQcGaZBHMYGy3fN3Fy/13Jc2MVmSZcA4gcXQZNYjl1SBjyTWK?=
 =?us-ascii?Q?UhGkHpJIdWT0qCoZfZTbm281bKgWuqj948zYsGrHRDK1Vyqv/DBHPKL0jvLX?=
 =?us-ascii?Q?WnJ8J/DB/I346dv82Mmcir+hYpGkOBRabyEKzTF/1odfly7bglLt3HBgtwpy?=
 =?us-ascii?Q?q3JBdJ2nqouOb01zODJ1a1vt4cPAzvYqFBeJ8Mz4csocZLdC8eUKZhz0/RMH?=
 =?us-ascii?Q?oWb0ltIOD6kdP1kRREpfRXX3DP5ksqn88VNf1LfrlEYoCSvLIYZSAN+eSiGa?=
 =?us-ascii?Q?OW1wwwp2RT5rRsKKHlyFXPGfbOfiBLL/0bFbgnAjusKxeyDYWLyf5EOc3XzD?=
 =?us-ascii?Q?bxTyCzXc4CIzlDVGqt+V5UBKO+/GMhno6EWU0eAlpWlaGApsI/PfjG8tx9Tb?=
 =?us-ascii?Q?lxf3qKtrz7PfchK+jhh84CcuzhYHwxkqZNOa5jAuIVncYxLPFCQZI4c1luIh?=
 =?us-ascii?Q?QSBMJPdt+Hyo9Z1QANr5dvCz50W/asJ4ze8qF3/8L71piK01lkbtW2v5ASjX?=
 =?us-ascii?Q?PU0opP6Vn4iaFZ6/nZcip3i/2lCyOp0RTF+c0PrN9xdA9T4HrzW2h1OdcTwO?=
 =?us-ascii?Q?5Z6+WnmoVdYXz9V7V0e1KxdvlpK3Q8oxdSPpVQtq/+zkyvscytrBMlecMnXH?=
 =?us-ascii?Q?DpN/wDEFsQG86kDZAF1s3tbvUaEPEu/8W7UHhbTJoXVI2/Kxl/OjbCSgthM9?=
 =?us-ascii?Q?Hwg9v0U1PalurFHsQ8Ms12hGV8HSMv1oS8yzWemX/gzB37qB5kavoLaA4DO2?=
 =?us-ascii?Q?o4pBDGTwhoJANkt+hxzgVLY6uT747sVmckRASdSSZEI1xo0ktHqZyO1KhZE0?=
 =?us-ascii?Q?S9RMlgDq3sxDGueCzBgOnIT42hYeBIQ2A7s0k2e8BjWqbVBM1acTLnfp7Ia2?=
 =?us-ascii?Q?rdfqJ6TgNyDWn3Qhg55X9TtMK6Fsd17F3uDHu+Ie0+HAxCaqU4RTb0g8EkaW?=
 =?us-ascii?Q?FwZVGk5pJThaVUnXm9/yVO2owKrm72y6o1sXMTwUFVQy61eUC0LGSwsYgYqL?=
 =?us-ascii?Q?8m2vuoUf8o3OuMY7b2CAYIv+IDGc6CUXOyi1axuWqodQA9JutBE+9GHNpzcw?=
 =?us-ascii?Q?45ghZBj9N/G9CXCdgqUuqhM50JNMg1VOgnzEsMX8GMIvtu8jbh/4z6Ornpnr?=
 =?us-ascii?Q?y7cDw77LR8UkW0GubQtI3GwAMFcGpTK5n4nKeOizEDfuuFShFo3qwqyHSscO?=
 =?us-ascii?Q?VHh7NXhBDGMP5OCU9ZQtCPRr8BxhGd0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b3f4bc-b1e6-474a-5d26-08da1c64fbee
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:15:27.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdS192OT6ZKsymYxvc/TJBJlQo7d9L1PqbjvYRSZ4k597/zLB1jR1uHaJdmhW1ywZKjroN2b5n+qVoB4A49f6dlRsFZQXPJ/eOmsKn6HgiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1471
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-12_03:2022-04-11,
 2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120043
X-Proofpoint-ORIG-GUID: 88SnPnmBTrd2qQ1U30iaxowWcEi5ucg1
X-Proofpoint-GUID: 88SnPnmBTrd2qQ1U30iaxowWcEi5ucg1
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IS_ERR_OR_NULL() check in vmw_translate_mob_ptr() should just be
an IS_ERR() check.

The NULL check is confusing because vmw_user_bo_noref_lookup() can never
return NULL.  A NULL return here would only lead to bugs and crashing.
For example, Smatch complains that it would lead to an uninitialized
variable in the caller.

    drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1314 vmw_cmd_dx_bind_query()
    error: uninitialized symbol 'vmw_bo'.

So clean this code up and silence then static checker warnings by
removing the bogus NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index d49de4905efa..8072c053be97 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1172,7 +1172,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 
 	vmw_validation_preload_bo(sw_context->ctx);
 	vmw_bo = vmw_user_bo_noref_lookup(sw_context->filp, handle);
-	if (IS_ERR_OR_NULL(vmw_bo)) {
+	if (IS_ERR(vmw_bo)) {
 		VMW_DEBUG_USER("Could not find or use MOB buffer.\n");
 		return PTR_ERR(vmw_bo);
 	}
-- 
2.20.1

