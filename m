Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9048C3BA823
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 11:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE976E1ED;
	Sat,  3 Jul 2021 09:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B006E1D8;
 Sat,  3 Jul 2021 09:46:08 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1639a2UV016033; Sat, 3 Jul 2021 09:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=GySA7FNOTDvnQjz+PZ0epQM1iUfrbgMtaraMa8L2cnk=;
 b=hqqOnRnSti5A3FEXPMfLEs+cYwGXdpMrAABBKV+DbfBrDn6ddDnt3rh3sBT3Fv20TQiO
 bdWXDe4y7Bw0flixsAw8fhjTicy6oyasWsWLGy1sSCXfkCbGR1lcnljG5MdeU8MRzBXI
 DCzCi1I5tTRwcdZ1nwY8j97+FKgK4ZLwOTD8mX5LC7Uv7+hc1G2mPJAbFNZgp4pN/mO7
 Vr0riXcwpSSWSMX5RyLc9R84d+MEfE/OpHCaGrBsyCOk28UYnXvKzDUeAoeNHnFvtWrQ
 a5h6y1PXMr8QDBoY1GNt1gD9NTKDZhAyuxnx320/Xfx26Cq8HSoqqXJuB0PSpYjhsM8F vg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39jeacg9yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:46:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1639jp6w192840;
 Sat, 3 Jul 2021 09:46:04 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by userp3030.oracle.com with ESMTP id 39jd0ucej6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkvMVmPhQWhGvZinQOd7E7CPkt/NV/v0nGNolxKL56J69q37UXBcc59SDWvkrHuBxW3JiqYdBFbUTT5Jbm6C3pwA2l06IbIt/7uLHgSUCMvYNLascFpuP28Hp2GIXSksYWOJOvxrallu+WAQwKjCkVv7ZQ9X0jXvidYiJ1kVcOP85gs7RlZ0jIG7W6CbRZoaSp9BxbeiOexvS3uI0WZTKZtemD/TyrbZqeHpLtgp9wIZgPWtFnRDU6JHqY4IK2+2lPfspF9XEfmB1XfGNUwyZV1A9DCv73gMfb0osEBfPBXzzu/AwoGQg3tPHcmkq37CaZc7WjYu1VVSnYnDU11UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GySA7FNOTDvnQjz+PZ0epQM1iUfrbgMtaraMa8L2cnk=;
 b=PTztnc0uZ1PSYlgZprXAUEJbXuIdtoCnvugopDfJIaddLZ4SStfu5SvhuamzdJjXZ/LJPS13tljuoEFISny+dWvzEthQFU/v0bQ84HhuYCMabz+1Nsz/JEaoqNKCDxoR8F/vsk4HXFopXtUtUzzDWUM4EZ2HZD9VhyLd8ujzwaL4hAJf3JboU2mrnQlQfVwB/vyua5URz5U6OELlTWD8Wbnctp4qpO7kXhVXFnVgVGA/GCbOrHo9lOxmOUe7JsN5sgaM/J6GFYX8CB2FKbDY2DV1VRVNpVKWcaq+2Ox0ySyO08pgBNETshrAX760R+EqQUtDm2cwstjvSwKugdsVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GySA7FNOTDvnQjz+PZ0epQM1iUfrbgMtaraMa8L2cnk=;
 b=PhPeEl6Cyx4qmGyP6pKA70DM3fMlD3gPCdPdLfb99XuRkaUBOFXJQuMuSDBAixm4um5EtvKn7VC8n9iasMvwQoGbr21lZ1nvv9ldbLK36c1Ui20fJ/AY4uuJPL93nEtixRampGO/HT3mNsEuWPTDCoZisHqziKMPxpfkDl6l/MQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1616.namprd10.prod.outlook.com
 (2603:10b6:301:9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Sat, 3 Jul
 2021 09:46:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.030; Sat, 3 Jul 2021
 09:46:01 +0000
Date: Sat, 3 Jul 2021 12:45:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: unlock on error in
 amdgpu_ras_debugfs_table_read()
Message-ID: <YOAxw+SsPy2FI3va@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOAsdyWeZAHF0oll@mwanda>
X-Mailer: git-send-email haha only kidding
X-Originating-IP: [102.222.70.252]
X-ClientProxiedBy: JN2P275CA0046.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (102.222.70.252) by
 JN2P275CA0046.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Sat, 3 Jul 2021 09:45:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 517aacda-e833-4464-b7f2-08d93e075e11
X-MS-TrafficTypeDiagnostic: MWHPR10MB1616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1616E35D9E57EB8DC9CDAEC58E1E9@MWHPR10MB1616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymiKYccTJ/b3NvR9s9i8aFABF90yOxhTHtWBfoyGNQvpZ675HUGyCYDHs5j6DKfyh8fOBwekORUx++ZCI1FXiYtWIu/lTcBRcf5ZPRCNhFqCwvd1+YaBQM7Kkskgay2FiVmd11Z3wmeH5dyfiS8Y3KtJMcXw3qeq/P6yZXMElHVzEastEClDM/zOvH4tKerrCsSqKi73/dzSmGlX0TBupe6bZEF5GFRSGsGVZ1imVfaU8YceterB7F/KrRnTVrTxy4r+klV1KMzQNm9Uugxo10TF+Ciz6mKmt+HaSaEKGpBDDAS/pQdNFcn9fqf58pB48lOv4+pkDE1r4W4/F9ZIy9MmxjL29Fwey+An0+cQDY2itC4Ck5FEutnchasik0c1T2jVDOBjAhT7nF+az4Ww8b6whTfNbNOtyl/nWLnhum7wnBte6Rj795/P9zVBYFKQSGct0F6BcBmqhKk/x9435BHLJkN+GsEVMsbwT4rXbU4etNtzFLcHgMpMNnMfokDTz3hEyjqb25WBBd9Crujz7sMAjGq49IhY3tOXC7tjUdOf6k2khH5U6HN4kHjrT1crsx7dE0CePJKE75UoxLBnyiQbHAusPh9W4qsPMKrzqNQizomJJbZuEjJdx2iQf39eI2hjgLK23DoMwII7Zwkx2/7r9Gkkvmuqjlz9lltjDeNMZG13i3jtuUusEgKB0kctGSok9iG2PXROn9NEkcN8Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(52116002)(6496006)(66556008)(66476007)(8676002)(2906002)(6666004)(33716001)(38350700002)(4326008)(7416002)(66946007)(38100700002)(44832011)(26005)(83380400001)(316002)(86362001)(110136005)(5660300002)(9576002)(54906003)(956004)(478600001)(186003)(55016002)(8936002)(9686003)(16526019)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVLo+shetTuMAWO1kzoVCBm6Q98S/gbs9oA1X6/deMFTcy6QF3n+2SlLXQoI?=
 =?us-ascii?Q?vG3onHcdCH9fAPHAXw/5lKEYnyeEPTTN9QbhDj2OxJ0Okddupx0k1uSkXeUZ?=
 =?us-ascii?Q?UAfxw8qUk6KQCGCHJn1kmslYRY/Q/puDaDrtZ6CGIafsmbM3Kioca4DgMs9h?=
 =?us-ascii?Q?Tm6yTnedQHa22plf0P1CJrY88vs7vamq25tNPYZZyWAKXoautp+1Vx11tCI0?=
 =?us-ascii?Q?a2b9brSpjL1LWfBJpwX+1y0/CnDXYXgkzY3iJVm/eHpk2YwBfKftpbRwjcaG?=
 =?us-ascii?Q?8XGs5qNFOAzMDJM9SDsYZnNc5+8ctAiWqXSfHOvboUNWDQW4Xres5zMAEU3w?=
 =?us-ascii?Q?O+TCRecy0RPU+ZFlB4nbM01l+y1lani06TJM4GRI/qmPMSPXUd+FYvM5o5Rp?=
 =?us-ascii?Q?iLgdixlT0Nd6WLjXTz1lC9vLLS86C7DuaGG3JSsoJ72iUfjfuOSYRQNaTHAQ?=
 =?us-ascii?Q?xwXsi3ZPB84nixX5EG9P42Elz2rXyx8yw45gEjmMEdhFhUt8taNb7ubDai7Q?=
 =?us-ascii?Q?I1XkVy7OlEj25fgmw0HuQCQ4k0S61N1l5yZQGp2b4c9PEGAEMwLnYXExiBXo?=
 =?us-ascii?Q?6Kg9oo9v6wn3IYwH5dfgVcanGGtwyV7Z1iy0JFPJeNk7OEnD2sWQSZIWczdT?=
 =?us-ascii?Q?q9n6JCZNsm2Hquz2x7cLamW0NxFyPrXj0kb3UGg0RByFB+U8+iZJrwiAndBT?=
 =?us-ascii?Q?IlucTZ9dapza76r1952wRt8KV4PQvOJE7VEUw+Y5u5LqT8pk8sThFDjfM2pY?=
 =?us-ascii?Q?1fFiaEQzg9aiYguBf2zoVKU1F7YwPiWvPrzkKUhFHZcBh6R22Yd1RrS/GerH?=
 =?us-ascii?Q?feL6Oqetc7mxC78bWf0YPYRqFVA9LbzJxSqcKQ4XBbGjWAWwhi3YDV5YXUnP?=
 =?us-ascii?Q?WC5atWLWnfWGTlGf7bdgEN8wh+rIJJBnT8SpVySJjn1q5ihhiroM7iajlvVn?=
 =?us-ascii?Q?1af1Dv66Y6T+Ucp2zOWYzgXQ5BS5IkG/1Cz9zvLrcPJD11Mo+G1vpMA4/sGc?=
 =?us-ascii?Q?khi3I3WIeLO/7GSSyZQvGPFvRVze9jw6dNGXmhetY0vz+PrXEHIzdnOFTiv0?=
 =?us-ascii?Q?m5KaqiWrypqGOFb6qO1if8jxFIEfFsZKpb0fA9aCMfcaITH6+0RKDXAAfuLL?=
 =?us-ascii?Q?WlpDYSIUAJZKPvk8yx2BUCD4p/4FjfcHGBLKhCNPPHxIS7UVbhplPCCsLk7H?=
 =?us-ascii?Q?ZgIEAKp+Ps47Rida3Cv/VufUUYMx42KM7wjQVAVjXv4ha+lnofzwbLIkOHOj?=
 =?us-ascii?Q?1I/ipbdp4041W9lIk5S+uJNJNHz6vyU0fyQkyuwq3vMFR8lrOhgsV0GXF84t?=
 =?us-ascii?Q?tGSuU4MKA4M8zatql4CD6z8F?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517aacda-e833-4464-b7f2-08d93e075e11
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 09:46:01.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIWyWYjXjJHxPugQ6qwHDOc7M8/LOGS2wzC4b7u4sUaISpNhPGCTuvdndb82Pn7La9n2SoOV64ZM0CLf+xQihYxlM57MPdI76AlWOwsMxKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1616
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10033
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030060
X-Proofpoint-GUID: Ox1U_b8krWplqGD46aSjwYgrNPLUBOcF
X-Proofpoint-ORIG-GUID: Ox1U_b8krWplqGD46aSjwYgrNPLUBOcF
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This error path needs to unlock before returning.  While we're at it,
the correct error code from copy_to_user() failure is -EFAULT, not
-EINVAL.

Fixes: 9b790694a031 (""drm/amdgpu: RAS EEPROM table is now in debugfs)
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index f07a456506ef..3e33e85d8dbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -821,7 +821,7 @@ static ssize_t amdgpu_ras_debugfs_table_read(struct file *f, char __user *buf,
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 	struct amdgpu_ras_eeprom_control *control = &ras->eeprom_control;
 	const size_t orig_size = size;
-	int res = -EINVAL;
+	int res = -EFAULT;
 	size_t data_len;
 
 	mutex_lock(&control->ras_tbl_mutex);
@@ -912,8 +912,10 @@ static ssize_t amdgpu_ras_debugfs_table_read(struct file *f, char __user *buf,
 				 record.retired_page);
 
 			data_len = min_t(size_t, rec_hdr_fmt_size - r, size);
-			if (copy_to_user(buf, &data[r], data_len))
-				return -EINVAL;
+			if (copy_to_user(buf, &data[r], data_len)) {
+				res = -EFAULT;
+				goto Out;
+			}
 			buf += data_len;
 			size -= data_len;
 			*pos += data_len;
-- 
2.30.2

