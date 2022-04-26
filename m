Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2A50F523
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585ED10F135;
	Tue, 26 Apr 2022 08:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C86510EA95;
 Tue, 26 Apr 2022 08:48:22 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q8lG0K022262;
 Tue, 26 Apr 2022 08:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=7z1XLZHe1nPZGm7zwIfEtye7cl0hLCE2hUueFXUr+0I=;
 b=weEHFf06J6o8Pd5CMZNmyiQoq7YLmEORrQ2ailC3SD8x6+IPDvyoRmRoclBLmrp8EQAD
 tdMXXbkphlgDRkLjLP3+Jj5VO5Scy9UQBY/AW/M+0ZCS4llGKHQxcJ0OdmJYWD3My/4P
 3pzfcoPA0GmdzmpJOPlFkOdyfpmtwZ932/2pa+jxRWtP+HUuuxBNU2Bmx3knGqBVHIlx
 xpI8WH/oNade6MrP0d5IWO7pdoIe2pCkD1hm+pKOk65J+OmgOlj8PplE/tVypgM5w2Hq
 cEJsw090h4kuBhNnkJJEHXwwjxw48lHwAf1Y8gN2rm4yIrCaso/MQ2y6sT2csGa0sUNK Kw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4dh2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 08:48:19 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23Q8evtd005557; Tue, 26 Apr 2022 08:48:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fm7w33ac9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 08:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWpBfI6hgQQWLiYK6Na1CjP+LEkSXo6lqqSQXGyAF5OcMUfUBkoM7ahUqQl0JFpGRPcxGVrO7hectg4LbHA0gPsUw7chqa4fbmVSgz5whm7Xpm08echcWBaiBhpb9HJiDweIHfLjRsgk7iz2sY4BvfQ36wOOQZm3iocB40brOa49i1yrVDjGYzHzYJhTouThkWxYIyeHtE1eh5hzo/mirO6NA753gxJ8uR6r35ubcWh/KDVH537iDam91zNegVCXGjhi3b8ukD+NW/FKwc6ViJa+FyBXNKzcuRc3clv7X1lNDOfMaRKGWWEWaaEoAioIBZXnSStpYySCtFCe1Clucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z1XLZHe1nPZGm7zwIfEtye7cl0hLCE2hUueFXUr+0I=;
 b=Hec8Kjv7K7xpc9diGWBK/uq1IRT9DwN0RmStTYBwLJ17UYqqleb9fjQqMZ1z/3sFIwXS4UVwGqqnm6osVlx/3RAxhDvGK4Gocwvnq+MkgSsKOi8kf4dxucbrFx/bQBbXmCnu4Td5AsBbOdXSAffbwXl3giFuaff3zUutdzcjCROozfQH+z+ymxjgQYkTnkcDct9r1/a1fhrtFET0LDSfMVPPJlhCBEShgkV2hLUN3SIL76t+96kFpqkrl8qjZXZFyC83LHvFYRcEOvereKaBXAsg8t8yZZNIgHhczSqP/KBDNWws+lYGF6M84Nx4XEL9VWOBadW3eEZS1QvUZf/PEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z1XLZHe1nPZGm7zwIfEtye7cl0hLCE2hUueFXUr+0I=;
 b=Qu0QHrLnUN9GfksTq36RUagekJcyN6RjPgSCMA6/gF8TxdUqVydTJiwcJaGjKTYKpZ61AIz2BPfm3q3VQp7kFdpzN2nwV0TGDj8hZY434pFGH8IzajdLFDdzBrquC1Q23hlm+rMH7nO20YPU6M8a4v/2mEDt5y/swcv0KHwZUNA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2618.namprd10.prod.outlook.com
 (2603:10b6:5:ab::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 08:48:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Tue, 26 Apr 2022
 08:48:16 +0000
Date: Tue, 26 Apr 2022 11:48:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: debugfs: fix error codes in write functions
Message-ID: <Ymexw96moFElQvqG@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0070.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a382975-47ec-43b9-57ef-08da2761812e
X-MS-TrafficTypeDiagnostic: DM6PR10MB2618:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB26186E21087DE7B366351F8C8EFB9@DM6PR10MB2618.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ofTdGxW1IA7Y5VjkrzL/iHHuJhpuF5FK81vqtDA8smSb+RvILvj8/bIIeD2prhen0tf17IKmTosxzgVZ91sQO5RyRUKC4o6rixihi5fmIZY2e59zMPCWUXRuGkkCKJkHX+qXvX6LLdllHXn8LzqLnoSHzGyxjBzS4lEXfmWzo4e+RxwUZSIJDpJTQpfvw7PdFFn2IaoJ6q2Sam8HOliw1+kiIdNoUBkc4KBfD0cuGRSDYCb2lH4dXUUEKaJ7MSmzmR099kw21aXS2GMt4uq6xPLLdzbHeFKLj9WwoDZ2hUkJtZXub66KcrtHwRWeDtXxaxEM3w/hX+2+TiiuxzWbpcYxwRXLOU0cuJt3RzBloHmOD/SoR6qwStnwlFExn7Dbn4JfvMBkB3ICg+8KK7F1Lo2/QuziyRS69qJU70XQvVR3QrvEFHfFZsnJ+l67QBSHYZ3PtIyILr0++GojsU5pHn/qmQHG4BrjPwoUqG01f8R89aYyw5b5iVPBt0NCB0iafEDLSupZB/SD3S/h7ZPI+YlPpOdk20Ll+WA1LSW539c8saqTi9f1a3bSZMyFzHUxD+p2FtOURBYjYZRH1k7Bv0seiwAqKV8VfTvxsfthG26GtOjoz6RB5E0+SLd/dhBaEx4qJgOp7eNQ/s1om/JYxYTXo8BYuxF+8No3RfajN+BYhZGX7k8PVR3rHExUaxyGnxKMXpf3NEUyRTZsnIoCRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66476007)(33716001)(7416002)(508600001)(8936002)(2906002)(6506007)(38100700002)(38350700002)(26005)(9686003)(6512007)(186003)(44832011)(86362001)(6486002)(6666004)(52116002)(5660300002)(66946007)(66556008)(8676002)(4326008)(83380400001)(316002)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?szYIW5P1bj4VaJ0mSmlHVyWSSYUnmljH272wT3GC/ALQVHgLSBuVFcuvvdTa?=
 =?us-ascii?Q?IsHnmFsCPEdcPYHXV6qpS6U62sCjIDw/QhY37sGwdbvBpaPJQUH1tPs/m8pB?=
 =?us-ascii?Q?xnibcXUO0sm2FbXEEfARcBW0WIdfBc++Sjt94OOrUjRoBjdkCgeAfnMQ6Q4Q?=
 =?us-ascii?Q?L3ry6refLcnScx74z5uhYpFaZm2JP0ah+VvE/C/LeJ3iQvgkqsK2++zrbfXd?=
 =?us-ascii?Q?Ykk+4Pk7CMioWlDeju9J8UMWd2Z0rcAI2J7QMwhdbSumCWx7VTuUC6k/43Vd?=
 =?us-ascii?Q?1qZIbVH/qM6hTgSS8+t0dRRPwFkTedaJUAwVJrnydSEdhWBbFKlVbKBAxnpv?=
 =?us-ascii?Q?bMA6pxx3gAUKr9PqNZPDBCdYdyZdn5WTPZ717esjjNZAGd3x79L5vgMitSUa?=
 =?us-ascii?Q?QQJedCKAMAE2ucPFTyAO/8kietXWN+fZ+L8x3Mwf+CjFQP1TTLtmU+dsDVAm?=
 =?us-ascii?Q?V0znSrHmPzITeMI2l084eAhN0U1gtrES/1xGc5/mwDNtRcMRfiTuA0xYwh3j?=
 =?us-ascii?Q?wmtriPadN0THbKbivoeCHddE7DGA/EWaHyvDOcm/ctwu+nXs39E1JFZMGs+m?=
 =?us-ascii?Q?tQBhkbGTR0NQNBAjt1cKtNCkdSTnpKREZbmPZRBO3jbXBNWT2CDWTO6TrNTt?=
 =?us-ascii?Q?/BV78yxqcELLaEGKs25+VJWSkFV3Q/SrwZ6b2PmglRM3DRkdVoCtdBTmF5FB?=
 =?us-ascii?Q?YtOBjmjTCPEC7L2JbHKb322clUXnYFE58TgmzVTm478tg5vuG7Na17ee4cwJ?=
 =?us-ascii?Q?i/yPaQYXRkdFaDP3RxGvCxSQ6rSILlOwzU8xPR4Wg7ef1AIMcrL2PMmx65HK?=
 =?us-ascii?Q?/NmFo+nhujJXqWJ5YqICuqy4SgZLmtI5Ho68barhiHOB3qlJrCh8k+nyqvbs?=
 =?us-ascii?Q?r4qIbHzErzYQl1O8lWdG2dUAvFjHQtV1F8vpMttSStwLnyfYdeO2O/v7fVDi?=
 =?us-ascii?Q?9c9Y/GyGZw2ijb18pGaQQ289mmjMh/opCvEXK2ppxKtsR/HrY95wvPNv17zp?=
 =?us-ascii?Q?ii4gLPXeASFD7wddDLjrcZeyx8t4NMffEyWS2x7ReLtpUHhoKN2+LXYQcgDt?=
 =?us-ascii?Q?pJLe064TVimNpOLIuU90HFriOs4aF7v8uV3ZVVZkFgiutCs/3c9LP+E1LgQK?=
 =?us-ascii?Q?l2eJWcs0ZE8McxjMBtlqLapYEzs3b3SpC37+orrkCcDZCmxHvZ82hCam0Sw2?=
 =?us-ascii?Q?cU9L6AbPWhd67Bb3BU6zFsJ8zlfhCvrsM0C+WZj1crY8TRTYCrcovRNhV1PJ?=
 =?us-ascii?Q?0Acdfvns3CjK9B/uj+1ZcaHJGLkxWB6Mj296yN7yQohHvVmWQKQVSVkCIU5Z?=
 =?us-ascii?Q?K1UnoSGkwq4ECsjXhJ9T6uQ2ZkM5CfBUS35cqIJcVq7AmkTpLv6wolyyE3LC?=
 =?us-ascii?Q?DVGLwRJMlIgbVM5cohOQgul7zI92YzXCLXB05XctjfNUFhR92J6+CQHCYi2a?=
 =?us-ascii?Q?oRp3/UxAcxxtYfH+mxn+HWutS3VSTw5NS/VUsnN9eqZIHpQ1bOyND8hfqDAo?=
 =?us-ascii?Q?Jmq3sBOo4jBYhiFIIKeV7JfAbokMA2uXDTANKI4cKXsWO/Vwu/EZnznvqIQk?=
 =?us-ascii?Q?dd/IqGawYcNLi4JfHEPyAZyA6hFaxUTp16Q7KWEtZLqJtWhxPhhZJQp7Gm3e?=
 =?us-ascii?Q?9j5+dz/czRBc+z6wvGW8hLZsNehOqkJbuJw/1AL0sC4iluBT3otBTr1+cz2E?=
 =?us-ascii?Q?tEAEcGD9UCQc+TUxJYKssyIdwdVPkgj9hQjOF3HOcs3T2F33ea5qV9zhwqOR?=
 =?us-ascii?Q?Vw7Lwmbjmi16E7IBM9knVUcZ1u9L+Rg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a382975-47ec-43b9-57ef-08da2761812e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:48:16.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ypjtoLgH1mMewtaj74Tn7R1UlKHtFUZOnCE9Xjd4PTezoBPkZvkFsb0ERi2otFJvzfM0iNxAeP3K5dJpFY0W9/T0HmsfnZ3PsqQmbDkju4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2618
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-26_02:2022-04-25,
 2022-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260057
X-Proofpoint-GUID: -jlq_IltqOHTsXtZbxEYn2BB1Ihh_sH0
X-Proofpoint-ORIG-GUID: -jlq_IltqOHTsXtZbxEYn2BB1Ihh_sH0
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
Cc: Tao Zhou <tao.zhou1@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two error code bugs here.  The copy_to/from_user() functions
return the number of bytes remaining (a positive number).  We should
return -EFAULT if the copy fails.

Second if we fail because "context.resp_status" is non-zero then return
-EINVAL instead of zero.

Fixes: e50d9ba0d2cd ("drm/amdgpu: Add debugfs TA load/unload/invoke support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
There are a bunch of exit paths where copy_from_user() fails and this
function returns -EINVAL which is wrong as well.  If the copy fails it
should be -EFAULT.  If the data is bad, then -EINVAL.

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
index 247a476e6354..32bcc20b9e3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -159,9 +159,10 @@ static ssize_t ta_if_load_debugfs_write(struct file *fp, const char *buf, size_t
 	ta_bin = kzalloc(ta_bin_len, GFP_KERNEL);
 	if (!ta_bin)
 		ret = -ENOMEM;
-	ret = copy_from_user((void *)ta_bin, &buf[copy_pos], ta_bin_len);
-	if (ret)
+	if (copy_from_user((void *)ta_bin, &buf[copy_pos], ta_bin_len)) {
+		ret = -EFAULT;
 		goto err_free_bin;
+	}
 
 	ret = psp_ras_terminate(psp);
 	if (ret) {
@@ -180,11 +181,14 @@ static ssize_t ta_if_load_debugfs_write(struct file *fp, const char *buf, size_t
 	if (ret || context.resp_status) {
 		dev_err(adev->dev, "TA load via debugfs failed (%d) status %d\n",
 			 ret, context.resp_status);
+		if (!ret)
+			ret = -EINVAL;
 		goto err_free_bin;
 	}
 
 	context.initialized = true;
-	ret = copy_to_user((char *)buf, (void *)&context.session_id, sizeof(uint32_t));
+	if (copy_to_user((char *)buf, (void *)&context.session_id, sizeof(uint32_t)))
+		ret = -EFAULT;
 
 err_free_bin:
 	kfree(ta_bin);
@@ -251,9 +255,10 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 	shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
 	if (!shared_buf)
 		ret = -ENOMEM;
-	ret = copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len);
-	if (ret)
+	if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
+		ret = -EFAULT;
 		goto err_free_shared_buf;
+	}
 
 	context.session_id = ta_id;
 
@@ -264,10 +269,13 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 	if (ret || context.resp_status) {
 		dev_err(adev->dev, "TA invoke via debugfs failed (%d) status %d\n",
 			 ret, context.resp_status);
+		if (!ret)
+			ret = -EINVAL;
 		goto err_free_ta_shared_buf;
 	}
 
-	ret = copy_to_user((char *)buf, context.mem_context.shared_buf, shared_buf_len);
+	if (copy_to_user((char *)buf, context.mem_context.shared_buf, shared_buf_len))
+		ret = -EFAULT;
 
 err_free_ta_shared_buf:
 	psp_ta_free_shared_buf(&context.mem_context);
-- 
2.35.1

