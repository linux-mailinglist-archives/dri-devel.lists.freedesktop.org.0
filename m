Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED207F4C7D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801E510E686;
	Wed, 22 Nov 2023 16:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6451010E684
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:35:24 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AMCaKJE020106; Wed, 22 Nov 2023 16:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=Zi8AOeDOdj1x0erlVdaofiiJpR7zAbn10yP0fAu/tQk=; b=ceT
 Kru1SPdAdKvYWmBDTVlCT6zkpPA93Jo+UQVzlGWS9l9QKLXLWcmGSR/V305yCuWS
 BzGeya6OagtREAUJl2N9Zl/RxfHltwLwCSP646Talb+BnEFQw/btbGLbVBi8qDoe
 ZB52ixhW/xi8uhiTZEPOPmyTpQ17HnUcGMpTZg9yTdqAiOFaezSRTwQHBVaJrC0M
 uanMBAz6zUetL5ZRv4uQoklgrbXIKPxPX1E3yGl9aMKWS/IDVPnY7zfJzmwSWtA8
 btFKR8nIoYHTBVxGbjPielZy6s+RKpCiG6J/nVl0V5HsRdiKGSzSP0kMMD1+VGLd
 FTr4zmZdcidAnBePeAw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99g9m20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:07 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:06 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 16:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRKZs5dU5WGZ51HxCdLHCVz0640WwHO/687wjlDxp7rBcQoC3OOtVgB+GB6QCmv1FgD+RZZ0GFeNmyMQ3jjk3m0JlRlLNNX2mIK4TNJXx+J6k37LExmLYBjg7ZrExnx9iFEZl4NAxXO5nUQO9tHSo14SU4+A+YQe3bj9iUlVrdQ3RmckB35K7Gyi5spvNltraV7RJKFT+jTFTn4gXdZYJ7JQ4s8p4koe0StNNao4jEIFlKL98Rs6jStU7j+fePTUnl8IgIzQ9KK/RBTs2+wVh/SQmxKL1Cat82+ZEb7dVBLIDmWT4TiWpoJbuoYTYsa1YeUpoyewTiEaapoooOHdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zi8AOeDOdj1x0erlVdaofiiJpR7zAbn10yP0fAu/tQk=;
 b=ngSfuAkJ92gScSNo/i3BXY8TkFpYztRdjZCehi/rfvEfdEBzn9FA3ZZDeHa2ABl3NZPsWuLySEpLMCP6Ll0odBZrzw4oh2k9XnvdVcT0PWfTXXOB6Y2P0HwSQKQAlcnEtZGZlut/Q1ukXPS3q36l/9TKEkpQmX74vhJ2grVb0VkxB+sUuZX4U10e/n4qoz1W/M3IahI30eeozrZK9fcJ61ObvVhDlXUUl+su0OklU1EoCXZQ1Rttib+9pUi5BMUpPuZI9AQHAzFQ7rTOKSxfrVHnWzUPXo8HrdiZ8GlXhS81qYRbsIPDqQ5B8IxxB8A9r4SNcsGw5bnW6t+Q1af3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi8AOeDOdj1x0erlVdaofiiJpR7zAbn10yP0fAu/tQk=;
 b=HTSmNgkLyIZDYy/EHN4HlAvvBsRaEu0MPBFdNEFlNH4rkB7RxL7oW4xpZmM+7pzL4586Gy0k4pGUcxvNbAlfAQlPF+NP5fOH9kD04NDJ++8dZrVbuh5UmzfVop98/LFF28Jgv7N1sYoF10DY6y8By1hLIl9cFgPxGeDETPGOmqY=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB5329.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:35:05 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:04 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 02/20] drm/gpuvm: Helper to get range of unmap from a remap
 op.
Date: Wed, 22 Nov 2023 16:34:23 +0000
Message-Id: <8a0a5b5eeec459d3c60fcdaa5a638ad14a18a59e.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWLP265MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: e053100b-cd6d-4112-9ab9-08dbeb78fb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMnorzumK3+7/toW2r6+Cvl+ik7wIp3qqRV0PWDGYm9Mmr2HINSgz7SIHHyv5bB9k9F/+Ww/7rKdcESEJm3bRdQVFEV0BLTJSmnRaXwE0/+zd2UjlZxpQfOyZSKPEx0IisiithpSYhQ66f56gEemY33woFdvvez6rAANiOGxcXiwJblpgJTh1PUlwFyJAfcbyvgxskSfYyqUfhL5Io4qZPZ+GkpXf014uozLPrbTYEab4Z3e4PMXU6ITRwdU3HwWm0tIhbGuw6yyNIhqNh2cMck0YMZ2IdF0GymBFytixIsrL++wt3oUhPbZQS9w7efEYHmQK3AGdwEShA9aHN4dLmTAqZI+etl347YYDG9lxK0zYyVnMMW0pagy20Gv32uKfN8MEK/OUGWAO4Dt+GN86jKXz/lDBx+O3zdmtqDBlsmj0Ed5GmSWoyR7BA0Q/f0ipWIY8IsSjL2q2AykYJ2EMKvvZKb9qxPa8k+lAUxpohiLNzLJtX4LHfqHZIWvImbY2pHvBmOGCoVtzTSaLZMsFkVixsNinQS4H2T0e5gBRy15+uOX5VSadNhwXiQIrclmKSs9/KWd/OYsAph6w5ai48tObCuuofp1HEwkN1hPDtuxIEyOSw8Qi5Q/jmfZclZ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39850400004)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(52116002)(6506007)(6666004)(107886003)(2616005)(6512007)(6486002)(44832011)(5660300002)(4326008)(8676002)(41300700001)(8936002)(7416002)(2906002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(86362001)(38100700002)(36756003)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5V8uyeOZiwFb0qbBbP1aDic4sMwUorM+ODxj9HsBBtArxxFbznBFd7eiLAE?=
 =?us-ascii?Q?8m+ktdhK3GK1J4nP611OuHd9TClAxyuBTHgCzTOQW6nPjL6KfgTaFtMEkg3Z?=
 =?us-ascii?Q?BYbDag7/sUk9Y6t9oHxQHF3tllH34xNFMUbch15HqtNVbwYgVbNdrQTmrGoy?=
 =?us-ascii?Q?UHhjKDN9X+1y/k4Q0Krne8EcDKdu9/uzFfRJ8x6p8n+Ip4nHfrQxC+MZkMoW?=
 =?us-ascii?Q?DhtGUVhTcww+Xhy3XvVKcfvhMUFgtrNjD6xCSIgoyF/0iGoNDO3nYmRdpXy/?=
 =?us-ascii?Q?1Fb2uIKi5EFzGqeLHQrXlCCMJqhvbYjLAKAuJinTLd2Mbb9odz1wfjN7Rwyy?=
 =?us-ascii?Q?JP5Nul5pXQc2A7jOkZzBSg+SH1upq8Xf510it2TfDG5/69tnC742+RnKy/Mr?=
 =?us-ascii?Q?I5NB6Chvq6MT587eaRL497IfE33G3a7gzKUtCuEuk+rLVjodfeQcPjb9wrwZ?=
 =?us-ascii?Q?6zgIpOo28hk9l1b9yzoSl5F0WGNDVnFS1StmGVVsEnzp8WwDflhBzC8qcieX?=
 =?us-ascii?Q?bWO1XA/sXkCwOnmpdUYjNDG6qdzRZ5hawxMP3IWLm97XZq6uTHQV/qTSDGDu?=
 =?us-ascii?Q?dRGENwC9pdE3cDHcgQT/JDhA/ucsJqoUt8UEOctBv/lvqze/pAKMS8k3/3x3?=
 =?us-ascii?Q?T7IguqFbJL2EywWGq0af0xcnhEzF2vaUGRSf+eOTmJr8IuxhYlV2OivVQeIw?=
 =?us-ascii?Q?sTbXFOLz89NDoX8TuwMgN9r27SyvsCieX8SjUmICCSa6Ud1GWJD4BBByIA4q?=
 =?us-ascii?Q?MZ5bZ/V7PNuJcXmAtTizREtYtOAjy9b5ozMHay5KqjIGa0tPLAWf6H6KGjYE?=
 =?us-ascii?Q?CzEjAWNB88Z6D2agdBt0bUkl6ZBt+FO5iF3Y8kP2Hphz7c3MnmC5CYRTZErl?=
 =?us-ascii?Q?m9gkB9IO0TfqjRumf7z/pevyB0o72Db3jyYil6EsOJvpfxcBmkBzu7I0OkSi?=
 =?us-ascii?Q?IA2XVvOdgWYQohBIY/4aECraEQZwWssmZm+J2MMh23KnJzaRAjhzBEJ2DnXe?=
 =?us-ascii?Q?s3x7aM32T83n+FB+n5FaYf4mYy866FhsSsgqzr36S32t3yQupDF935BhmpLg?=
 =?us-ascii?Q?hJ16bVHL3eLz6DiEPFYDEAcmLe5QFy/doT33aALJ0KarsFXhxxrA4QdBzD2d?=
 =?us-ascii?Q?C9MP8CXvJQXsFAsBCEOqErB1xsKJQlvzoG0l1zN0g1K7hijv2diUhFV+667I?=
 =?us-ascii?Q?fygvgtVTadxhTi7kbgdfLTidp1GtqNn4lOneq0CewK7ADS07RoNDQfKmZc4y?=
 =?us-ascii?Q?36fyFacM+Khowe0AksmDuqGtON1PQaPPFaR1KpI1v5GEMYNnnIn6TGN6MNjC?=
 =?us-ascii?Q?U7+aeUAclv+nn0zM39LdLTpmnfatwgTCyCACLH44JFRnWCLTP7LJKm+07gOm?=
 =?us-ascii?Q?xwbkdoByrWdE6HpMAJB/CXXsHQ1RhJpMuggyuLCbhVuoqX6kcGAQ7M0cA4jK?=
 =?us-ascii?Q?Wd3ZeT5+iUPFLPD6gmal+DakscsZyI4R6Wf2F/VK1oWLqvBgxhF5E76xnMMu?=
 =?us-ascii?Q?AY9o7mgYkvJ7Oq39vmjiYWql30TvU/ZTN8nLpbkRBogfM9SS1XktdB62dMCb?=
 =?us-ascii?Q?Uuhnr5u3ZuYUEKkJXoCEU/uweSUzbEPDZlt3xD6ge0qmh04WJD1w5QdE/iej?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e053100b-cd6d-4112-9ab9-08dbeb78fb56
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:04.9473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +biMBSpXDl5tndv2ajJdcAR2serR5d8GDK3PUhcEKXUD2em5+ldpdL6C5AE2rZvu0ooHhJmYrYwts6rV41Uok4cMbceB0AGPc5g6Xf5Jflc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5329
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: q4jC9LirBfnW3Erusc8LNU0SlP46kHm2
X-Proofpoint-GUID: q4jC9LirBfnW3Erusc8LNU0SlP46kHm2
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Determining the start and range of the unmap stage of a remap op is a
common piece of code currently implemented by multiple drivers. Add a
helper for this.

Changes since v7:
- Renamed helper to drm_gpuva_op_remap_to_unmap_range()
- Improved documentation

Changes since v6:
- Remove use of __always_inline

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
---
 include/drm/drm_gpuvm.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8ca10461d8ac..f94fec9a8517 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1213,4 +1213,32 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
 
 void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
 
+/**
+ * drm_gpuva_op_remap_to_unmap_range() - Helper to get the start and range of
+ * the unmap stage of a remap op.
+ * @op: Remap op.
+ * @start_addr: Output pointer for the start of the required unmap.
+ * @range: Output pointer for the length of the required unmap.
+ *
+ * The given start address and range will be set such that they represent the
+ * range of the address space that was previously covered by the mapping being
+ * re-mapped, but is now empty.
+ */
+static inline void
+drm_gpuva_op_remap_to_unmap_range(const struct drm_gpuva_op_remap *op,
+				  u64 *start_addr, u64 *range)
+{
+	const u64 va_start = op->prev ?
+			     op->prev->va.addr + op->prev->va.range :
+			     op->unmap->va->va.addr;
+	const u64 va_end = op->next ?
+			   op->next->va.addr :
+			   op->unmap->va->va.addr + op->unmap->va->va.range;
+
+	if (start_addr)
+		*start_addr = va_start;
+	if (range)
+		*range = va_end - va_start;
+}
+
 #endif /* __DRM_GPUVM_H__ */
-- 
2.25.1

