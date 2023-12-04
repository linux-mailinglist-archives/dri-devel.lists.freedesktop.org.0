Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625FF80350F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404A10E1C7;
	Mon,  4 Dec 2023 13:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E8710E253
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:36:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B49RV2D003429; Mon, 4 Dec 2023 13:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=kKIIKEvDN5siqvKD6fMSD
 BkrdGO2pjDobwMBtaSJADc=; b=EvWKDH35VnAg3D6wJspCZQHDwzvLFnN6BZrq/
 e4Q8OFEJKI9vEf7AuYg3g0vB+hAmkwHWzEESNYeMvPjQllHOFrouvmtZ9se4ga7d
 C52AUgwb709iFiOud+P5ckISu3FYn+IIak7Hj7nK2JuuV1+uBt8w9DsukO5gTwwF
 VAPv5UOONxZDPqaso3L/OHfVhr+4CLot8l7m2jCMUADyZQhzYMK9VtR/Ba6EpWjo
 ScmLo9uMQMdJsQ9LtBMfMHrMikJ9VZXto8X1yThcwAoYM01N2sNiN5kd1/a1DUMm
 fh6DHcNVRIPTLYims/l7yO1ds47LbLSti7C8hwRh6bIME7aOg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uqwhw9g4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Dec 2023 13:36:37 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 13:36:36 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Dec 2023 13:36:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBqLfm4jo/UCEj7RLOo6gSntc3OmOqWK7Ylo0w4rCnnPcMnZSidoCYYEahfeU9Y1uly8k+DrNzb1aw4MSwx6m+jIFh0WzIUJD3+qlj/fMSamFQbJjJMj5Z69nVp/8P8IHKZo7rZIlewnIIHC2UGyUV2rAj9LxDHVz68H/QJVuxdKwqBGtgp3rOMY/5nHoOguO2FTt996Bu2x1IkJ5DocS123F/0LXtQJ8lt7i4Dz8DmbMqGs+I8IVATDsbEvpmbTmonZ+JyMmh7KIL1ok0my7eryWTOwW6MsqClpoO4x9K1r0orxMBgWJVy0ekUwliYjvLE3xZmtuCvJL4LjoI6Rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKIIKEvDN5siqvKD6fMSDBkrdGO2pjDobwMBtaSJADc=;
 b=ifxvbG98IdYraJPF6IA7jQO8fvEobnMUsWJqzbEannv6z0VQIi4qBstvnydmd3LRW3mDLR6tkFYzCAquQv8MUUtHQZElLukPcvpUVqTwEpOecuj2BIuRcE3WQa6V8PmMCLes4UgocD/c7o9Bo5hcR+l1NHHcZIlzTRhOyuOKNd9ctWNy8gDYqCKlNzIAiHmHlM9AYsggWNek6nEnua9C+AKuKGoAeTzCWuzmWXdJIQMp+Sq5C8e/G7dUmBA0Oi64o4ql5urAHpU8IEQvgFGdA7kj7WBptyw8dJhPrXtyqTB7F54x1beAgvUw3H3JviJvxPdGr4RLuMK5Rowg32Q8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKIIKEvDN5siqvKD6fMSDBkrdGO2pjDobwMBtaSJADc=;
 b=jPOvZ7jOg2kkougAqHwoGOub/oDr8E6ChlNN5WWiq576FFtDq++2FRvsIVYzgN3vLS2QJMGrspmCQIS42vhm/x0aSJOdZhj+akamVwoKC/TBjybJBQ501W1ONpXzxs0ZHFDhyrteQcDYz+0J7fIYMtLm5rJ5uz12P++RfHk2LxA=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWXP265MB2389.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 13:36:35 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 13:36:35 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] drm/imagination: Removed unused functions in pvr_fw_trace
Date: Mon,  4 Dec 2023 13:36:11 +0000
Message-Id: <20231204133611.53913-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWXP265MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a9db46-9a04-426e-e6c4-08dbf4ce08c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YWOxc0f/18fDW4wQgnsLVyFumH30tywUIQHjJhRBDsbqoo3ir3IfQuG+TDLRQk6SSLkb3ba4W/JUuNPMoWZDeooIj48Gpzdplu3pdMKu9J4mwVSZwK0IutUkh9XSIfzynVjpmpHQ/M4NATuMkAk9oHIMUIvRdNvcqlKqBlmecM4d0GNNLXQvfT+oEOkE1RNIJCBFpsh+H5JzbvdCQj/CpmRZMo21WaKD11cybjlFgpoh0RyIV+U7GC9oXN3FrPrFIN/bOB7uQ+OcGteMFWzWcivpO6O4jnA19bB94HvnHDUyhXKBle+uyjeijeSYDcFlxQiZaxixT+V3VQXgpsg400eCqomkS6pDqcWjiYGhLQ5cqQgXjvU6tEJA58jXdDpDBhyg9/e2I7uhpRSnT09FvZZm2gX1Ohk7bMm/GLxXXvvvBYwY3H0ag7ybhR3XWtE2jxwAccVI3GrVvYRqeKaDA4nrFzTeilkbWnp/zquisR8rBKZq0slBypAd7cYgjEzAnnMgcEwOCgwybdv65bhZecI2Fml27mJ2FPlO0vpTnZ3a6tWVQIx78vHVUl4pn4so+lKfKfDM0CV63+Pq/znG9Cqjn93xUKFd7JXiDMNN/3GM7CJthkT9Z+gYYlqxKkx0CT94pMEY+DK54nHIdtKg1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(39850400004)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(451199024)(64100799003)(1076003)(2616005)(8676002)(4326008)(8936002)(6512007)(6506007)(52116002)(83380400001)(26005)(6486002)(966005)(478600001)(6666004)(66476007)(66946007)(66556008)(316002)(2906002)(36756003)(38350700005)(41300700001)(38100700002)(44832011)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EwJsaXDw+2m6G/1vtcarul3DHqpiNGP9B4BzkBxA19xP9XjOoOc/ZpLDYvEg?=
 =?us-ascii?Q?+NSsFMKB1TkOmlu9NKrUK2v63IUQ7AjswIlWtmSZjs8cYqIxrC3hDN08FIHU?=
 =?us-ascii?Q?USEbZeHzrvPOooPUiyfQbU2oI8FkXtpuV+igYl4ys3Y3ibIzzBtvK1ZhwIwV?=
 =?us-ascii?Q?QPhu6Ub44vpVu5C5hBU5VckePl6gtZdau7zeHXb5KhlxN6xO/XrtwNd2K6QA?=
 =?us-ascii?Q?Y+HYkIprijh/hEAYPkxdV+zUbmMq3CqPBoOkSCHkXHnehs+HaElMXoczM8lu?=
 =?us-ascii?Q?xCkaU74n5vrVh+aEDNqyv5wHljlpOrAvK8mNCl8VTf6MKbMhQgg/s3LHOQNx?=
 =?us-ascii?Q?c/dZAC9GjbH7MEeZX/KIa5MWuQnGTqGmjQVEoq03tGf7uFvFaZlFwsV12Vpe?=
 =?us-ascii?Q?XkLtyVFaw7Ddnv0cWwodiZgdHdv+tkz0n4gaZgK4LsZuuAa1Ut8F41j0ev7L?=
 =?us-ascii?Q?G4di0IBG9F2onrPXEv3sp63lGgmaOJTdD7K69dGH7kgslJCu8msb4UZQ35n+?=
 =?us-ascii?Q?1q75vA6fQ1DZ6yeUJWUaBm0AKM8DVuLCMrXzYtKwE6KTcOc0/dU8gpwP+3O0?=
 =?us-ascii?Q?9jeOIcnxXB3iJuSJJ1RjoOST3kPJnp7kIjGSZZ9OeScNZ69A5FNOFbWbLbyd?=
 =?us-ascii?Q?nEG9Nvpbf6UKR0UUGoJqaY1U4VlTp5B3ltRR3Ecs6vp/TuwGh8lQz9D9wNQO?=
 =?us-ascii?Q?djXBdaLS/gSiRpXjrxAMBquP45zS/4pnsKtwBOSeUnlkWMzseJsZrPtEWJ/+?=
 =?us-ascii?Q?pSCQfgy2GLiU6AcKz7tmeI+obDY/r7O2bK8ASXIirNleRjMVPa5WHnQowjyF?=
 =?us-ascii?Q?RYWCH/1n4siJhhE1TWo88NT/MYtc/aXrEdHBUKuckisawl53gnUQ7mKECbhp?=
 =?us-ascii?Q?XJJbs9LvEv6NG4Z+eoQDyyzRqMZA1+bzFdXnIS1uSPstOew06uJ6jsanPiJ2?=
 =?us-ascii?Q?IugVq7LipZR+eoE+Jc7WVV5HdnwBlGOkXAQeKS3qV9FK+M7OnVmQny6HL5eA?=
 =?us-ascii?Q?66BeTzpyrad6Cn9u2XhwQXP4F8197/DrURRONGTaKR5SP6XiKuFr0AIxdNbR?=
 =?us-ascii?Q?o5/WzCzUiKXFbtLnODhWyTzh3CKo+pmh9u47fTqAwVNKqdZocqzklnB31WOz?=
 =?us-ascii?Q?px8y/zFhc4PhtCdQ7zj2D3glPYrUoumT7eHFj4NGMSfoBILVdVHY2cceeSjS?=
 =?us-ascii?Q?UlIDKnTPmLaUFuNrFhj7oRXtaIM5QKeANzg/eRPInYX/UQx/Sk6iEKECFkYq?=
 =?us-ascii?Q?YSG3Qa9EyErf0ThsWJFOAse2TbkNxnbmooPgI5jUL7pODNFrkn1HHpYKxZG8?=
 =?us-ascii?Q?hpn/nRGy5rEY6Z/k1JG1YkKkuQl4kuE7SZr77teN6TyfAQm0XYxMShKkmG3W?=
 =?us-ascii?Q?MVJxItlHqEd6SK6mWdbUbXU3Ieh5h2VFnZkw06/yJF5sI/QdbhVs2Yjg41LO?=
 =?us-ascii?Q?b+6cyIZiaOdHwBr+WRZfPjTAoKKxnUelu8RURM9efRHq8nhn89eKyUcOOtAf?=
 =?us-ascii?Q?b2VBDZCzJ3PiePrihPnCSOyLRzaOJQRB8Kp/djS6CDsfTc34XS8+SGkmnQo5?=
 =?us-ascii?Q?tFJtBF0xQUL06B27FwGt64945OVmyHOXNJpg4bz2vAm8bESrwbsAio0+vOVR?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a9db46-9a04-426e-e6c4-08dbf4ce08c3
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 13:36:35.1928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX37Ax3Me5rNCKMDSD7en9vIoMbwV21sey8Mx9OtPr5IGV63LoMntE7m3ewud1JXNZ7NcIemNetIai/kad8sKUBtPhVsU+UTOV3L5JMb8Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2389
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: pP7d2Pk51SyxniYPK9gY5cA_80gGjits
X-Proofpoint-ORIG-GUID: pP7d2Pk51SyxniYPK9gY5cA_80gGjits
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, donald.robson@imgtec.com,
 tzimmermann@suse.de, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixing the warning below due to an unused file level vtable. Removing
only this causes additional warnings for the now unused functions, so
I've removed those too.

>> drivers/gpu/drm/imagination/pvr_fw_trace.c:205:37: warning: 'pvr_fw_trace_group_mask_fops' defined but not used [-Wunused-const-variable=]
     205 | static const struct file_operations pvr_fw_trace_group_mask_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311302054.MVYPxFCE-lkp@intel.com/
Fixes: c98cc92ab6ce ("drm/imagination: Add firmware trace to debugfs")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 44 ----------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 87a42fb6ace6..30f41a10a0cf 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -167,50 +167,6 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 
 #if defined(CONFIG_DEBUG_FS)
 
-static int fw_trace_group_mask_show(struct seq_file *m, void *data)
-{
-	struct pvr_device *pvr_dev = m->private;
-
-	seq_printf(m, "%08x\n", pvr_dev->fw_dev.fw_trace.group_mask);
-
-	return 0;
-}
-
-static int fw_trace_group_mask_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, fw_trace_group_mask_show, inode->i_private);
-}
-
-static ssize_t fw_trace_group_mask_write(struct file *file, const char __user *ubuf, size_t len,
-					 loff_t *offp)
-{
-	struct seq_file *m = file->private_data;
-	struct pvr_device *pvr_dev = m->private;
-	u32 new_group_mask;
-	int err;
-
-	err = kstrtouint_from_user(ubuf, len, 0, &new_group_mask);
-	if (err)
-		return err;
-
-	err = update_logtype(pvr_dev, new_group_mask);
-	if (err)
-		return err;
-
-	pvr_dev->fw_dev.fw_trace.group_mask = new_group_mask;
-
-	return (ssize_t)len;
-}
-
-static const struct file_operations pvr_fw_trace_group_mask_fops = {
-	.owner = THIS_MODULE,
-	.open = fw_trace_group_mask_open,
-	.read = seq_read,
-	.write = fw_trace_group_mask_write,
-	.llseek = default_llseek,
-	.release = single_release,
-};
-
 struct pvr_fw_trace_seq_data {
 	/** @buffer: Pointer to copy of trace data. */
 	u32 *buffer;
-- 
2.25.1

