Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314650F525
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306710E5E5;
	Tue, 26 Apr 2022 08:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1B10E5E5;
 Tue, 26 Apr 2022 08:49:40 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q7Evt1022547;
 Tue, 26 Apr 2022 08:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=AF4Y+Jio2GIHQ1lITJJkilmpFixNbwWT/8iRj9O4zp4=;
 b=PTxtThjtPIoKc2FD0caqPUOuOvEqb0M4PZ4IfM0hVb5VEKwRQQgRZqfI4KZ/ZoCm24qq
 A9krmQrTSixyswgkUCBnKEa0d7KufD7Hf4PHkHmqXUVYjUuaD58JBAKS+7mWJoxZxhf8
 bQ0abDCp+W2gUioI0OgDEOIQVU5iZPwNb8OJFcenf38jv2mvcR5oIaA6DjeqjzGUdUKt
 oHBONreGIAf69yQDJG2lLjsTIhRs0s2F5MvdkRjaist3FCZ6QdphzP976SzKxpB0aH1J
 lUcKsXfTueAyJK+Yqwdkksmyx4G4WxpS7mmFrCKMrONGaL0f1pKkk9r3R4d7anaXlgLj MQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb0yw903-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 08:49:35 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23Q8ePlt001558; Tue, 26 Apr 2022 08:49:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fm7w2jwy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 08:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftDPDiQRezMPNxjrp3v9cqz3n/pVuJVPv2rsxrq/2covmf2a9xHJptXXApxy3wP7oH7yOSOse9jWliSJUInuVqfsIXtcs6LKRTEp6VJu45Xdhvl8noR1h8G4O/y1KmGQ5YJFb3gegfKAJXFCk2wYazSLMW9dOFNQL8lGVvEQLLyYCPqkEN8Q13ac5GWZ9xmc5pz9h91fBFeVtfNFsbDqWtKBHH5Pnzh6bMhzBGhyNg4vEAjCdeBYc2f+nhTskw/wSfR3/vhTBgequxSJi/FJzr9M7pPe7OHxE4ql73TxMpZrDvW6nEmD3GI2JXVF8rOOy0O9eD8pAldIeuD+YT19RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF4Y+Jio2GIHQ1lITJJkilmpFixNbwWT/8iRj9O4zp4=;
 b=NFKpBUePltLr9PjUt7DI9EmBStxplivW8Hg/pqdPraeqggWu5ZKIv/rrVjSgWCUPzPXDa9D5v/Unx4lk8jpcUS8ojK1dtkK39WNXlxbHK2FSP23g+ii9TdmpIBnsIp9Xh7AEgXBiGvKnVH9L8Kx6X3p/kAKG2nKsTX9FTn1yQ5AVNvqxEK1xOE+22iJbL9UMODjc7JsIpAZD7tA3wSB0Li2Oyzu1N4EGNJP1DW7GsKg/U7i7VXK/riIx56UR8HzZ5uTVtOLGsAIJclS3CQwROtrdhQCVd9SDDuAjMQQVBYTbPJoT5KBh8DaC6ykHZZcpLK+lKfAnAYekfvZ7LqIWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF4Y+Jio2GIHQ1lITJJkilmpFixNbwWT/8iRj9O4zp4=;
 b=F4D/0S/sCZIJQkJaHh249jE5EkI1J0qMfGJGVvWFoQ9tFsgJn77l7bZVjb8qdIL3g1AzJPCN1aF3Nw7YDYoFAaAlat3XpdI4ljI9Sz2uqiUSPwZ4EwxwiSHdYjjsb5qSUlUeSEN48BCwTOlxtfio9vjy4nGdfysPer5Bxbvjdcw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN7PR10MB2467.namprd10.prod.outlook.com
 (2603:10b6:406:c6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Tue, 26 Apr
 2022 08:49:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Tue, 26 Apr 2022
 08:49:31 +0000
Date: Tue, 26 Apr 2022 11:49:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: debugfs: fix NULL dereference in
 ta_if_invoke_debugfs_write()
Message-ID: <YmeyEF4djrguNMEF@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ymexw96moFElQvqG@kili>
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0151.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a729adb9-3f71-49d6-02f0-08da2761ae29
X-MS-TrafficTypeDiagnostic: BN7PR10MB2467:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB24675C066FBE795C67BDD0D78EFB9@BN7PR10MB2467.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2rTIZthiwXSaa2QId643pL1pklaZqiJGudxjYYesM3WJ6BeUMBCHvHTjVcA45C/nrlma01IO7h/ftfzdkQThcZIbybxn/m5JUaq780SmNr2EdMknE/riAdpUkBO0H7gF2f8CcJ8Ue1qHBw1yRpBLqgtQpy5KyeaxxZpynIG2eok9wregZBiveW2wy9fFNEwqDP5vMdOwVLMFDcm/cEB0ELaFuDl/W5mGbLJiv9XTtEnaTO1TbmA/ATUcYp5gvMdZLsE9xFbOm8YV6/Il7S77/RcuNpZPftOOP/LmNL8/hK4pv/jl4YImOdi5n/N3g0Ar+XDmdm1bi0EHdDZ3UXjBC8t+NdYykbY++X+Zp4YbetWzRN8NZSkNqvB3hBC9U86Shse9+7rp4q5hIrP5PcmPoBhnmNsXM9b2zY0ie9fyQ5HH7sZHTzbDtcjnzAeIfSe+gQAaWvH5z3gp1CWTLEKTUR6NwGTymw68XHGF+EoDUsWvCzng1QPk27lIT9FyIGp7OvOugC6oqjAH97XCSwGMwYCl85H7/Rc8g0oCrhXrT+4a2r8b8ca6SICP/75n1lohhX9JSzdu/UVloo0U3Nl0odRZrgP2AikRRKCmu+cWBIB/+E1ZsvYY2iJpCtOQfYPYezfHiZg7iTjLyi1+jaErqCMD4uc9chbjJQVWZxQoGZsG85jQ2YHs8pJb1HjeK/sNfCH38xRI2+nEIFeCyJjrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66946007)(66556008)(26005)(316002)(9686003)(38100700002)(38350700002)(508600001)(6506007)(6512007)(66476007)(6666004)(83380400001)(6486002)(110136005)(54906003)(8676002)(86362001)(186003)(52116002)(2906002)(5660300002)(8936002)(44832011)(33716001)(7416002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9j58edAq1askUiPJ31tKg5cN1qgqEUZmn7ohdUK91BNPDcKBQOvO1RqQULJ?=
 =?us-ascii?Q?dNGoOhJm3h85WneXwyjqDoOrYkQOUeL6NWlqbnxAWJkZVPH31ulaGewFNON+?=
 =?us-ascii?Q?ObEEwpawUgdX3nQ+iKOlHi1NbQhBj47c8pXSn29xU+Bho4F3Zs+4fjVbj5AZ?=
 =?us-ascii?Q?e3TCJ/0RlQy//GFz0LEaCjtVD7vkvDlDWgIPjT4xfF4grfYsYck7UFhfp+xR?=
 =?us-ascii?Q?BPG4GxlKfDYiPeOy/Iuq++O6J1rC3DfWm0/O2yHiUkKd/it3WndliXaQ4Dci?=
 =?us-ascii?Q?DOJjzDK7mzwjvIBOgt9ii6y9skCuNcX/ZdPqL7E+CARjAhQgux43T4EE1/oy?=
 =?us-ascii?Q?7lo8MW5L0Ut4foJcuJQe6E5elYFLhx5QdqzWXjuUKty9R4FDfLryZgV/9IsW?=
 =?us-ascii?Q?VH7SDSWJQtPtOmM3paiIJ9008aM41YO6+a1y3JJr/IDX5W19ZRt0PVppcNFi?=
 =?us-ascii?Q?Tm4CHyPuBv1US+AunzBYptfjnBWLrg/jvbxeNkv0TPoLmFrYiA/HW0RpbM7s?=
 =?us-ascii?Q?vnI4l+FdrW4Cb3aFa1f1/Bj3eSlEypGbbjWJn08s4HRiRpZ2loJHt8gfrIJN?=
 =?us-ascii?Q?q01ELyIQ87ISYyoAcjSQSnXh4Ha9ZzgC1jolgwbPZQ1vNSBf29deVw6JWAxW?=
 =?us-ascii?Q?1mnQmmISUth2bFfXznLAmYfB9r2fVzjTNRPE4qfRJbiTUOoQ6KW78ic7JCgE?=
 =?us-ascii?Q?qdMSx563kejRHmP8IVUQuVUWof6CqtwrnQVVUSYAeQsTfRHXqH9cQhYfWJ/G?=
 =?us-ascii?Q?KXxeAaZ7GQWAihLqffqlubiVHDfMUJTTCgi3q2ZN8BKlpo3ALhbGvY4S16IG?=
 =?us-ascii?Q?I8HitRWYuPC++w6fSvMzw9ANdmTOWHMpuKvCKY6ZZZX1zvNYbJ4locNq7aKs?=
 =?us-ascii?Q?nosX4sEhmyzn1LeBTZyFJorXYmFWXATO1QnN6gO6BdqvUQwcqXjg3Ab7AU0g?=
 =?us-ascii?Q?/9RwLDC6ySQK9aul4RFEse4PIr1zJpoe6i6FUNvoee9OtQmMK6cfR9+wvhOD?=
 =?us-ascii?Q?SvkGC3mliK5UQlLdLAIzcN6zYl/GTQ+WxRTuabhaL5Eo1HGdObiDg/902v5M?=
 =?us-ascii?Q?xEGS/lL2eGy+tQfWhMWZx6geptGlgI+hGg54F9CVrguheh7Gpwtaud9re/jW?=
 =?us-ascii?Q?TcIGLEITenVvDjGQMPdkQAVjBKYGoAX3lb1mmvbgfysacyZenwg1HDK4rhQ7?=
 =?us-ascii?Q?BGKZLi8VazYJOliZPavVPcr6rn4/OyFuEn26rIdxyr7xeNr5QZmp801mxIBy?=
 =?us-ascii?Q?cTL1QxDzPzdCcCsxur5eT45PefAGd18TIdfpowLnKczVR/WZMMsro1qaeYtE?=
 =?us-ascii?Q?cSYy9221pj1mVopAM5BwpJf44E5f9lQomd7AOFr0Rwh43N+VZcFBfCbwUyIY?=
 =?us-ascii?Q?e6FqE+OGQBvsLKnv84wofxMcL0draH7qdT24QNGpAOroWnPA0ROprL2hevoK?=
 =?us-ascii?Q?9zjnUnxlrFx3Yiml9HnxhfRvdKez06JI4XwvpqZZ+RFQOLUXMcnnNMWMJsRD?=
 =?us-ascii?Q?Ynhgwj3e9YvFvGls16VcP5M0pC7A5aA2agNFtSXCDVdkO62dFTLB1Dmjy0ee?=
 =?us-ascii?Q?gpxDITFsEtjrmkH8xrZJn7IdDSyQoMZQ8axOUFhnp37SWuR8T+V92pP7mSnk?=
 =?us-ascii?Q?phrvtMV0xY1Qz+e2xix8t1HpGe/4Sj1khyYjPTsPpT7p8GCc5WMV+5/DRR2T?=
 =?us-ascii?Q?mF4ni/akUJWxsQMX+dBGrDN5X3gGbSNOyoOcj6+CzhI/5vlWGdw6bFVjmojx?=
 =?us-ascii?Q?9cIaMDX3SYchgEUjiTchqMKxixz02is=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a729adb9-3f71-49d6-02f0-08da2761ae29
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:49:31.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCkfrvTywYAE49X69ykfhWgZlNhQAhs9vS3GJmlN41+6f/oXhPPf4Jz2JgEaWFIVCKV06kYdy5SmoaEJ4FKym5YWfWvDq3TVJcE3LqZxYiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2467
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-26_02:2022-04-25,
 2022-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260057
X-Proofpoint-ORIG-GUID: hCAL3DZ49D6145n7u5FsmJG7RiUfp-KP
X-Proofpoint-GUID: hCAL3DZ49D6145n7u5FsmJG7RiUfp-KP
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

If the kzalloc() fails then this code will crash.  Return -ENOMEM instead.

Fixes: e50d9ba0d2cd ("drm/amdgpu: Add debugfs TA load/unload/invoke support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This would look nicer as:

	shared_buf = memdup_user(&buf[copy_pos], shared_buf_len);
	if (IS_ERR(shared_buf))
		return PTR_ERR(shared_buf);

Probably eventually this will be sent as an automated Coccinelle patch?

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
index 32bcc20b9e3f..6806deb098d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -254,7 +254,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 
 	shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
 	if (!shared_buf)
-		ret = -ENOMEM;
+		return -ENOMEM;
 	if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
 		ret = -EFAULT;
 		goto err_free_shared_buf;
-- 
2.35.1

