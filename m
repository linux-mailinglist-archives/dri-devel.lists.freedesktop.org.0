Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0154AFEB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D010E2DC;
	Tue, 14 Jun 2022 12:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D41010ECB4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:08:46 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EBYGWS013796;
 Tue, 14 Jun 2022 12:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=aC2bHVsRuM+ZmtzC/LN5sv4UG/z9gIyYYDE0P0oZNZk=;
 b=w6jysFgzQe5uoa0ALHvEzViyb1O6e3vrQWqPbbAAnc/+lJr4QQbjhpSD23OzyyVXWMu4
 X/PRGXgC8qHXCcous4y4Kc/SBlx0Wl8IzxbJSjEv8H/TqnC8XP0NCdr8eNq1IifQwKxZ
 Ci1DriEQrB8Y8N1izQiDo/loy5EvXNQwVOiOcl9ANAgDmQqD4PZXmMklF3MwXIEYz+nB
 c1fVYq5xZc0QMDVHf2+3sGlmN7J7k7rYpbAOLUHfoyA4ZRnm5Kcib+2xuWG5x3nPRJ4F
 2M1Bwv72n/IcR9WqJvu8TofOwu/SyAfmlxgUpwC4ohR4VhUhLqvgQCI8A4pDtH/HMY/M Hg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcnmwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:08:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EC5rt6037886; Tue, 14 Jun 2022 12:08:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr24k1xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2DUg7AsLDHt7pL0R5WUhLLoblQYpLWHSfWFlj/IyS8MC5ABBqtaea/h9eqD0PyV9Hm6o1t9I5y1z/yAgqk3ota7sa0cc6iO3J1rtHtAIN17bnIAqYqQCKXZtk6a6GFZG2W+d6vudnfNeksgFVAeKa2oe0aJuWaNgaa/mjv6yEHk+33x/nZ8fcmG8o6P9g5ZKnfgGWudgPvmUcDNJwPRJSpszvhCe5aI8mp1vBRrNXA0YjVz85GTp7SaJ5B7fAttjmLyzjwL/wUfn8rz2Jyfnf7kCbJopD8/ABAQyRq8F9A4IXMIatkz5hRaxqLAcOwroX3Wy6ITq4rSwz5EzRLwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC2bHVsRuM+ZmtzC/LN5sv4UG/z9gIyYYDE0P0oZNZk=;
 b=b59evJfzkXePI5/yDAsHO/d+GRuLKJdCUnWlYCAAIoZr0It1WhmKNMpiO3UkUpVRdvbA+5Ejadlm2SSIYsoUMefHYfbFxMic9iaC5kU0ORDe8py7k2F/YR9LLqfGMMBAqr83t3hojoLXIusgMJkMwLCSPvmtqs8j5duMQeC1u6gImbQ1x2GTwWER0xw5ZdEIukCCJ5CT9kuk7iuE+g1KfT5ZOrSYrhgpKBdiVm02FNbTbanHRxTXwAAXN3YNyYbJdzaObzoUrZAoAzKEzXg1IEFsqtcMOvPenio1zGRWrxYPafjVA5r1CWwyv9UMu8pJgJlhZ2dZecXp6Ha8jMS7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC2bHVsRuM+ZmtzC/LN5sv4UG/z9gIyYYDE0P0oZNZk=;
 b=xk5DC+utKUmc6VPKx8aw5aG5w57uOxDjWwyltjT46OsbBLSpt+Sf6XR2oNigCm8jABXs7ZcZu5jayNuxvPCiJV2zOHXuhX8m8/wpwdQRzeZghmZ3xL5b6np7FMTZ0U0e8kREWC47h+JjyYxW7ESJFfDO9lw02g3S8cJoJWfZAZQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1482.namprd10.prod.outlook.com
 (2603:10b6:3:c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 12:08:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 12:08:36 +0000
Date: Tue, 14 Jun 2022 15:08:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] drm: logicvc: Fix uninitialized variable in probe
Message-ID: <Yqh6OfSiPFuVrGo4@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a97ef641-808f-43f9-4948-08da4dfe9c17
X-MS-TrafficTypeDiagnostic: DM5PR10MB1482:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1482CCEDB6FA06AAF09E4B8A8EAA9@DM5PR10MB1482.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1EQiz1wHGNMODIFvxn5GRKkftDV9Gh8aPY5N8rG9frGt8spBkCGeEfVoLDBwbXPmcp+lVZPvWYoSet9evIFo4Tr14wXNTUEA0ji2TZvaO0FpgBhwZWW5javIfyrHuC8Nq3c96KomNDn3g2JTtef0N69uT+NQWRsKANOz/IxQBDcuUl3a8KV/PG7KTon75GOCsqrKK8THLD02tdWsh6Hvz174HQrtmDtzXXGGRhgTzz6+YiW+Y6+BBF9Bzhy9y9XKOV6G+NUAoUPdN+rQCqwj8Q/Rgn4K6XMUYJt8mU1CHc18Y36BX5kHAh4rYmsEHWGD0tAu4oXtS0vDPgcq2pHnfZcFl73lRUutMTly21pPw64zhy/A+Yoi/DfhiBFWimRdKCGOf48j5Z/FbI17hbyeoFym1j0TvsDgRqy5L3OQvlo71BXV/O1wEAgiiVUzbTIt2t6DIVhOl9xx20KztpRMBD9qejd98GUviWfIBREPuugOVsIQlt3ta8+qjveXbzbceCU0ie4ZhxwfKVWWSwb22Naj4ycXeOZACGyDw2wRA09hJ8DqE2DLtUXrhIXKqm6s3/jY3KzeWH/sgFNf74NfBWmuWkDjZfSjXsApoAUgXI80Xs+hnYGDFB2+Puba/dWl8inueiSOP8u3e+OT9Tn3pUv2lf+saP8PvzzHcIOFVRXV3vyWvDY596OuMMb9Q/r8/6wGIfdMnu+7b+7ZKR/EQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(9686003)(6512007)(52116002)(6486002)(26005)(6506007)(54906003)(6666004)(508600001)(33716001)(38350700002)(38100700002)(186003)(86362001)(83380400001)(5660300002)(4744005)(2906002)(66946007)(66556008)(8936002)(66476007)(316002)(8676002)(44832011)(6916009)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+l0sBFhf6ZmbFs+O33zZqvvoWkoNxyAerS8YWUabM2F2AKU400RffZg3Fm7T?=
 =?us-ascii?Q?YZFnRXtbJVpYYvb2diq1jlnBKERvWemRESCMS8yQmCdFwpd6dBDt8Lc4a4dR?=
 =?us-ascii?Q?PQol8a2SZbsu1iPl9vWEBmVnOeDpyyVj85oJio+LhkjiSBBCnrunwrL+ebKV?=
 =?us-ascii?Q?9MdsQ1L/lLPYNhOZ41J2qIF7bT3RfQNbHP2rZ9O5A3vp7HYZPpYcqb1orYvG?=
 =?us-ascii?Q?j+/4Q0f/t6qFq/NEmJvz3Ko9mkcbMB7BYZExZzjtPqrUkUt2XlkiuMjf3rSw?=
 =?us-ascii?Q?0uOqbLWKS8mNc5Jb2sOl+6nj2eThrXvSLU2LQo8+Q8af4HNqD7G7anhZWrli?=
 =?us-ascii?Q?ocfkDb7WgEBhqPE7R5CDWNtJShLyN2ft2xndpp/+XSVep9iPU9Rfjs3J+7ht?=
 =?us-ascii?Q?CzlnAcB7VwORwfkKe/opc+MaiGNkpwncmRshw0yQ/oQzTlkCKh9gsY0Dq2Wa?=
 =?us-ascii?Q?amzSPXYmvBjQHiCbbf5G3kQi3fB2lZ0xSSJABLnTkjvA8MttT4Wjx0RlVwAP?=
 =?us-ascii?Q?+bamMyuH1RW2KvUx6QPaEh6zZO2ByMMBXp2fX2PFEMcElfLzKE08H4I/dTSL?=
 =?us-ascii?Q?wJAuPgeHpltC/KirLoCyv4DJ1GeF1P3PjDRcQIRLnt5xcrFZ1Soak+xkwHeY?=
 =?us-ascii?Q?GTdBMz2kRzuxrwSZqf9i8L8X6HTAg+PcS5mUXy7lJZOqK9iOFyhI1ZyclAG8?=
 =?us-ascii?Q?Ummyg9ovLYt5kWWd3qZjvagAZcbOWKbRouuUacOe77IjVSPa3WfN0HnTv17G?=
 =?us-ascii?Q?gPn0QNojQD7kvleu0JJUD237mVDGDwN4gguMBupLo3uKNYOoN7Gm8R2BW0fb?=
 =?us-ascii?Q?KT7SmRO4OO2G1LS4SR7Kp/fgVpgp975Pqm2wC0iplA6zyDvAre7aRcUdwYgf?=
 =?us-ascii?Q?iPxZuCIdytE1ZRHQeK+5FSzGLx8Ieya7zSI2cn+/DcIm+tDwLtJP60Ekdpvv?=
 =?us-ascii?Q?yoANSAVWS0yT7G10dyds277QMFyZJssdfdDZ0oBLWqoLXJlMu892ozC1LZeQ?=
 =?us-ascii?Q?dNST8dIdCR9FXwkeEnLaeiKpYRUxqvId3QZ4xd8WzFShe78232zPJcBhWG9t?=
 =?us-ascii?Q?gI2zLXMsHUH1g/KMUI7Ix4ENMX4cmgXFVl5Z14ZfHiOKBegyW/ARF2zc8kdZ?=
 =?us-ascii?Q?DDbUGmhW/fCXSFk8oVCVbHVrgpUFMwlyEwEaAkZZQacL40K7BrUKEiX5KUrQ?=
 =?us-ascii?Q?vNICRUZwY2IaCKzbH24vv+Kxk9WzYIrxeU67/Tay4C78UtRexz65wX5UnyIj?=
 =?us-ascii?Q?tv0YA3cMFgitB8M9ePtRLmv4jRkNN8oCD1OOQGP1wBKEOJnA7JRfWB9Cw0M4?=
 =?us-ascii?Q?C4dmYClL6q1oKVKafg61GNdW8gKddTCG0/8DTBuKpM1flhQ9ZKcbEiIjxAKG?=
 =?us-ascii?Q?P6KU9P4rnitDFzvKtHlgRxNopq34myqod4Rwt2QzcdzasFPSomBzGER+0mHw?=
 =?us-ascii?Q?Y0NLVt3IaPsrT4vgHtUuFj5lo6rnDO/sOlcmy64y0iPsNe1nH890smuUTFmw?=
 =?us-ascii?Q?bcjsRNLV9RE6v/oWCWlAb7OM7vfd8m4WV+QMFTvBakaNyGZncOGvvIR+tnA8?=
 =?us-ascii?Q?3KNumefrkXuRxWK39Cwr3o+6hWOMKK6vP9ffi70yW3UOMRu2QSiBzV3y1NrI?=
 =?us-ascii?Q?VFPlZkQnrGf7dio2m0GLfd9HKPvRrwZManyWS5Qap8DBk6Dvai9Nh3M2xUzq?=
 =?us-ascii?Q?7Ejm1xW2TfhNB6MX10KQs7p8tyEjNvg8qPg42z5OBGSBauGquP0TJYtxCgD4?=
 =?us-ascii?Q?pxR1M7EaYiFlRPRxED90QD9nbNHWNE4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97ef641-808f-43f9-4948-08da4dfe9c17
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 12:08:36.3243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zI+AEbGzFigJEkGZYtNEiqJQfrzNQQHXvm6OPZtvCXNznfSratscsX+molSSp3TMyQ91d11Lh707leCiPrnB6ncMA0NuvFrkMbNJ4o2b8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1482
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_03:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140049
X-Proofpoint-ORIG-GUID: Mm5AAlG265Y5dDELt3hPUyVQFNy-MGIf
X-Proofpoint-GUID: Mm5AAlG265Y5dDELt3hPUyVQFNy-MGIf
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "regmap" is supposed to be initialized to NULL but it's used
without being initialized.

Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index df1805cf0f95..0b983a33f9ff 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -298,7 +298,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	struct logicvc_drm *logicvc;
 	struct device *dev = &pdev->dev;
 	struct drm_device *drm_dev;
-	struct regmap *regmap;
+	struct regmap *regmap = NULL;
 	struct resource res;
 	void __iomem *base;
 	int irq;
-- 
2.35.1

