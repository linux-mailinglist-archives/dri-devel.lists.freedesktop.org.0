Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB77FF43C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597BF10E72B;
	Thu, 30 Nov 2023 16:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C632710E729
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:01:28 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AUCeVF2029829; Thu, 30 Nov 2023 16:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=h3RV2x5k1HOGTrlJIY8d/m7gbws6MahuRj8Fe/I1AEg=; b=clq
 arNNpnMPn735MY3ZLUW/2sGS4uX6bQH+QPm0c+3/HLYl5aKpV2cpVtvzntxY+HLo
 z2oudgOVxjWPIwYfYPrz8qVLpv9YalYmzr9PeCCxBRug7f9j+LjJuQZY9y3WujiP
 vR8mi6KZfoCCJ50ScLlCZ6bDqfbzyIfFnhT03fCIopsVRjaNz0eC+YSEbKzane7M
 ue95YcECmBgTiunFzmoXFRpJDFW1v6UJYTNzQj+zCp08qjGQ1i7zkR9OqwJk/uBx
 pa4eIJBzcVsiItCUNqemPEDTFejWllW8iaImrjqtQZ1AUS7axXoLPvPGeZslAUwn
 infnqKOI2/G+SoQd9sg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3upgv6rktp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 16:01:14 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 16:01:12 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 30 Nov 2023 16:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maYqYoN+nWe4Dji7zPcAr4BqrViqBh/7Av68PfYcbEsBPuqsrETOOVcJWyT2P/P/zLq+rPNrbthn7wwoeN3FxIkHGZouV8HtT4lKbqm6/NXTX2H1OsZMT4w9aBJ3QYpndROVWuWhc9m6DFsph6QCxxqk97VXeq9GSXPuI7LLQOV6wqKpj28f8EAjEdwv9iK0QB22Mmzo2HnNHFlU8TjEDp/dl9KonjOsQyi3i/fQxRgY/GQLSahZ1rPIk4STCH6Lal5dZMv6aqDwR1npR2qn/L5LXuqag57LszBLHTBvTx388w+QPjxrN37G+Mi/OoOWk2rwN0W4C3Zga9ZpJ8QSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3RV2x5k1HOGTrlJIY8d/m7gbws6MahuRj8Fe/I1AEg=;
 b=My9UUA+xVq2x/6XzSZ02iemmMhE6JENqFbXO5mhiPgCavqsIGpT8jXGYIACXghSbUc329u2TzwjbTnG0WRKT2ay8e06SGjUgWSLabsv7Mm+UtjqGoH9nmzk70py55HMYdFgqpMaMd2wENtJNc4g5UtXcb+117yVHMUM7E5s9O4xaJXuSAnfg6z2XBxKW4mNf0pIFCY5onWWukSfB0PGMXstmFe9FJcsmLtyn+GeBAk8LBtsav7Zny0QD3Wck9nWNpCNCJnBqsfiG6jXGEDQto0Et9l2A2eC2AqJeQhHzJYU2J4XWQ3qJLny3sER+jGgY9xtrHc0Cfi3Ogd3F1gT26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3RV2x5k1HOGTrlJIY8d/m7gbws6MahuRj8Fe/I1AEg=;
 b=dZt2lc3d614gyFKfkbLcxuioGUVtmOwrSOzOBTlQhIznAfht4aUp4q0SvDoFoG41hVZmGRaKbAANqrGGZi9bRIc5rRWpLon/mTh7MmTvG/491g/sYAwMnuCvHRCllIoQzhKX8Dr9e08SjoW75lLyIrDfPTC0qkyggaZ4Q49B5Eo=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB2410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 16:01:08 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:01:08 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/5] drm/imagination: Removed unused function
 to_pvr_vm_gpuva()
Date: Thu, 30 Nov 2023 16:00:17 +0000
Message-Id: <20231130160017.259902-5-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130160017.259902-1-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO3P265MB2410:EE_
X-MS-Office365-Filtering-Correlation-Id: ca20fb62-570a-4038-7fcd-08dbf1bd90a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLufWT7vxGsL5tltaiQUl0/PLxkY+izuYOpoAGq/CUk+ltGWj95TAMDgCkqoUA8gVofvw40dzUGqrmjTuUA1vnxQomd1guJzpcIyM2WQYLv/vrATEdcHxiVKofJernbc4yZjEvV5D7RzZ+OoxtenYdvxJ1SBN1LlcAYCTVAlAlczOgGkPihIfKlj3GCjW1DMPxislUZeZ8UNJ0JlT9NoTIExHPkg9u6p//A5ntVLD4qGLivi1gQFVgnXqUMpz5FfzAJGJeAMiaenPHkDR0gereXrRFz4aqjFNKK+RpUqByhN3QcgzcmTUJ6nSV2nljCzRBRWtVQbpB1Ar1a5DrHTXVMGJC2Te5jPpiLdKAliFLYkwF1ROx1IaJqsDGPbj6u3cgpMwpFrN6ndZ7Z+0M2EHPh3eLXautBQEkNEakXEefZrjw6ODnhEBV4n3ho4RhAoIP5OO80LhKLZcYiifepVafvZx9tCJGqsqb7lu2YbYkwjrVY1CW5eB6CVB0IBKuJWvByF0WcEca+JSh1vPxd96QBP6kD6sn/Colp+3P4y/6IqGeUrZv+YDz4pQXIduN/qPu+4D76Mm7SQVJ9V/Hv3pNMy1VzcmQfadIUGhr1oK94wPCISggK/+PdjFZggtUpJiejLAMwtKbik89lUDEgBeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(26005)(1076003)(2616005)(38350700005)(66946007)(316002)(66476007)(66556008)(2906002)(5660300002)(4326008)(44832011)(8936002)(8676002)(86362001)(478600001)(6506007)(52116002)(6512007)(36756003)(41300700001)(6486002)(966005)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIrAEnWO/Y9zZSg6zySEF9P+v5Qt4HmFUORA3Ds/ar5THzVq1obAAxDEarsC?=
 =?us-ascii?Q?80mJbhnAPFyIQ3QLEenejvvefsz6neEtBrh95QjuY9Nb4KhZ4aEQnBdsQVng?=
 =?us-ascii?Q?U81F6fS34UcJcr95NGXNkCRRI5AheHt0VxzYyutKXkodh64L41+GzsSoOvYF?=
 =?us-ascii?Q?547C5qJnNn8KbZonCROoOiSYS6BZeBdYMQbb9y3ITbaCAfqTpGFf/KcbTfVi?=
 =?us-ascii?Q?hnhPWjmrjyj7w/3jSbcQ79DikA658qXKQkX6Eb2UntzqUJ7WDJ2q1iscZekP?=
 =?us-ascii?Q?+Dpp6YT7Eb+ZE8sAcy3Ntct6FDtG2VXtH5xriYineUnpKqNbcr6SI+3EJQRQ?=
 =?us-ascii?Q?+S09Rck/qmmbjL4eYPoSkX7mahusaGIuW+hSJiq/fR8vOgTZpvTkQDwxOKS0?=
 =?us-ascii?Q?n5kgIsq+AX+Tw8G9gGTswzMlC7cdX00cZkgOisVXEoMo1Oj055CUlhGv8mK3?=
 =?us-ascii?Q?BllVTFb9cy2BsU5OMsQnYbqAEte6XY2KC5KeXw8LEgBi0l+Dd/E3q1SKdRGL?=
 =?us-ascii?Q?o7vnm7QRppRuW5lu7z1akdfgU6bRCLHkcpjnrfHdhgVr8dWONXUqcy1MEOTf?=
 =?us-ascii?Q?LTDnsUbpQZdy3cDLdaQxty9OTuZD01LySeOYB7yugSsxQ/+i+tVQ0rbp1gAY?=
 =?us-ascii?Q?UFYK/X0mp1bQcmkNQLcGOsvf/26d6MNK6bU5fZ0YcHryTDgIQEZPGZgNeVgI?=
 =?us-ascii?Q?0BP3ZvoOGLj39OGQSKTIUKdRbIdeNet/PfDdOtO8ukSbyVKtj1aUY7m4Q/aE?=
 =?us-ascii?Q?MA2svwFMt1FZMbYWqdtoegmMC5yyPZNz4+UyT2sJtW9qjmWWbxLG7ceufh+1?=
 =?us-ascii?Q?l6xWqKbNkNkKvfcjUCcoqGzdUwj8w62XMWTonk5mnxVybE0qZLUEvIuYhycl?=
 =?us-ascii?Q?ecs2wr9RzeWS3VTGRewCKbsZQt+BHWIZm/iQDN/k8wnusNWT8ahMqVrai43g?=
 =?us-ascii?Q?XAIz7F79H2bVZJivtD9sGjdvoMHSqi7qn7X/7e9glzqzh/G/MJsZBoPFDm2l?=
 =?us-ascii?Q?BFQsJrxGx3uqeHD6d6+RaXLWXcxZkftLtN+wNp26xWjJfOEhHte6MSmwVRBS?=
 =?us-ascii?Q?DePSTBPk258K0w4LTNYoNj/E1JofzBmABiUwiOHhlOGz6tkjseXS6C1KxrHU?=
 =?us-ascii?Q?NY1AIYufNLxDpV2T7bx/zEmOSf4dYmgo1aUEn56MBATtMkwKYTT4vwk3vqGq?=
 =?us-ascii?Q?Z+CckKPRjUU33R5VpRGrvesMPymImlZst9oxKItfl6eAmkS3/w20LA232jzg?=
 =?us-ascii?Q?wJeTrAWkd1dkBjWbjEwy+QjyH5Qig1Eh+Ft3eAEVL/gRi9gZYIah+w9i2hq/?=
 =?us-ascii?Q?q77CGSmS3zMUlHODIYXSuy/BMioE6hUdnJm23mqrjd0dyJ9igidW81cpyG2k?=
 =?us-ascii?Q?a4ijvaqXKIPASusnVZskU7rZJoPvroagI6oxH9eBLdpz5/+dr6yJ70+MsjJO?=
 =?us-ascii?Q?O3V9AFPKGPGUKnOVy765qm7NQ4risZIY79JxT+rS+0dD4EAF+SmlMy04llYP?=
 =?us-ascii?Q?hW8Lr8lPvxcEr5ILWREbJbMy/ORVRPtBxD/JUrX2D8yqJbf4lwx2zRDSTfVH?=
 =?us-ascii?Q?oEMwqhfwjbayU8DAMs+6pl5QqV5115WuSUU6gkAiSz097j2ZdxEZ8RrBmHNk?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca20fb62-570a-4038-7fcd-08dbf1bd90a7
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:01:08.2146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpilt6KN9Xr1h4ZFTzqb6CFCsiyRXW8R8dTllqI1zncXjwxDyQolhDqmevsa39v8qX6RvVv34tpgmi8OBdrMyr0WraOwdhUVTbdW1Rn8p6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2410
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: ztB_vfYQslCbDsobH-k1sAMMq0G_loR9
X-Proofpoint-ORIG-GUID: ztB_vfYQslCbDsobH-k1sAMMq0G_loR9
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function is now unused, hence it causes a compiler warning.

   drivers/gpu/drm/imagination/pvr_vm.c:112:22: warning: unused function 'to_pvr_vm_gpuva' [-Wunused-function]
     112 | struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
         |                      ^

Remove the function for now.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
Fixes: 3c96dd170efe ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 89eb6ee1bbcf..375a03707f4e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -108,12 +108,6 @@ struct pvr_vm_gpuva {
 	struct drm_gpuva base;
 };
 
-static __always_inline
-struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
-{
-	return container_of(gpuva, struct pvr_vm_gpuva, base);
-}
-
 enum pvr_vm_bind_type {
 	PVR_VM_BIND_TYPE_MAP,
 	PVR_VM_BIND_TYPE_UNMAP,
-- 
2.25.1

