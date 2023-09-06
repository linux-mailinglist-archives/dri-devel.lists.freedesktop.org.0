Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC28793901
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731E10E5C2;
	Wed,  6 Sep 2023 09:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FB710E1DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866CjBa015358; Wed, 6 Sep 2023 10:56:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=4QbMq4fvWEMlK4keVK+67X/nvKY3JShHzHu/IuL36YI=; b=ddT
 Ldd6kq4bG62PpZvVtruqUFljzanOaRkZWavNw2OdacBg4Q9jtjUZ+d8hzlhEJksv
 8e7SYC75pCXresvtlukxoy+tNfRI9baXjDSiaIaWDK1x1jH2qzA6O+Q/b0JzH0zE
 +VeJqQC8d5O/k8F8TxgRDbsazgTwn8UwISqjcdnVgcqM7dOfSAT8WgUQY//I9eZB
 dsImczl8w1S4JH93gZDDxPqZP00CrvZWHjSp9L6l3Vgji0JauzGK3y2drvX9EAEV
 gaBfQglu/QqIzeQw1Z8sNMPPk5kMDyylqh77dqU0Ukk/eTJTY+Ky70eAHJfCmoKM
 F8tRK1Xq3Ls0NavpWJw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu2rv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:03 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:03 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:02 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjGqdpUV8D1QDPoYuEPIGobpkyzWhXcmu/aLdZihIkAjMdmzXMezKWg/K5Fpkn1p+sBnu0fBDlfSdjgfhbec8/EeUeSA8LKzYXPG7mrnphQwlkqh3KP781dczx87qp6usSat6fkl788JNkNSRY4X1vTylli0K0hmvvnFyW1RHm+LSp6GtoPUhvNYm2zfNTXDUqHc0W1mTmfKfHa3BCEW8gqcQerojA6rIC7C5NSUPMVCT2BazGl0B8BaVAoz99ZY9kmQAytNA3KUcnzdfTcYphqxvv9vvkUWxR3oDEpPj/MEiLrMFmvphn8UgNnNyw6UUjzQ0Ifk+M63RpI4aYDatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QbMq4fvWEMlK4keVK+67X/nvKY3JShHzHu/IuL36YI=;
 b=muRWUXYJ8hUEMIzarXl7shWnn5DFu5n5U4DMMSjqylPgZcQKYsL0qmVf2RsxHCyufwU7E2teZrq/S38aNYlgsK7pT/0nqRcGMxkskRxUK7QrG0qwH6r66cK/UamVS/b2JBvO/PUYC8LHxuBkgmnof540xcuTgFGRxjCGJ53gaOn2R9x7MRn/QXnMJVVDSu7V2e5uWhKksKiAoy6aDmcJn9gFsaRYG38ciNvxiGL5xEMjAFDEycUb2hNEgAN17HC5sgtQg6nqMtrAX7Q2GzSe5ZBV1RA61xra2ZNbJLCtFQ9ton57OqNJU414cLlA6Rh7IJdUGGZBvDcsM7cpshL1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QbMq4fvWEMlK4keVK+67X/nvKY3JShHzHu/IuL36YI=;
 b=quUXfqkE23/1slqMnK/eM7+krGbSBZKAhyReexqkWDa28jjOf+EPahThnNdJbaDK1Zo8le0d/lbAKsn/WqyYyfAIHw6P6s978JcWWZ7DXmH/zIODp5sqS+ME3d2qq95EgTxhZRzLh3aRlOualvmQP//eZ91+NurfYRLTcr7mjCQ=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:01 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:01 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 01/20] sizes.h: Add entries between 32G and 64T
Date: Wed,  6 Sep 2023 10:55:23 +0100
Message-Id: <20230906095542.3280699-2-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bae67d-ec5f-4542-ffd2-08dbaebf7a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJluzG0QS61M+ZRbFsLKmBYrO5z37w0KVCP12V0a5JmfPtEls4OoY4+CUDTW55D/Jo1i2kuwkuGzPhYgwTx7mjI2nBY8Mv/Okagf4BdIOlrnQcpb/tdyGHNYGJ5cS3ddQ1QUFGF/aOMdePvaFKl0AE4DJhD4SBQLi4SM99L4NrzFvQ4IHfjUXHSdCQh6eUuIPcAQD1uPKh4jgB89Mqw3a9jRaoNe4Iu+Cv5LV0xTx0lEipn4zyOujPnlOdlAI6qVWdTafrDcfpemDs5G/gklkvwQlKJn8AwlEYspUysdopQHMwkgmQgMbscCP0bWqVjCq2/0aOt0EqqwOm1HZVdxM/2NGEyX0c6ZS/yuE5rKwq2K2GmIrbMczf3BR9jqn+MyMN56DMCQmzbdinxG3zol+o0qXi2qv5BFEoERaDg10cwnMmcSxZX8ucRz1wZ4ydk8n4VYRm5BLtauNqrVO0lfBSglrW3yVviNo8Cby/EmqomKfjrYC9+zJrg4O8BSsUHL0okJ8i53w0xeR6+47IuyclAzoWfnAQ5BWj73Gp6Uhu8c7zyT/wqnJkWD/Uf/cTGcH+B9MOukICRR7mlmt+cp4M+5tnAhZxY3go21nrMtUGqGiXvSRmLmsOw5b2aCW8It
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(4744005)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9X/3DJgHWZwfo4AbTz3EgZQOoalHh536fB2Sl/PwQ2hi6rXp0o0tQsqH4K7?=
 =?us-ascii?Q?BMxr75l2h5r0FZ2A6cEN6EW4znZwlED2X103fDFPZK4vNVtstM0fmPUEiLS5?=
 =?us-ascii?Q?LhJkursT0b2de6ZCBbKHrE0ERevAisWEHVVf9bXMEjumdUOMaE0+wNgIvGgu?=
 =?us-ascii?Q?D0c/RRw9zDin0BHEhA0JV4LmPWvGietviBSaqK1UAMvGfYFnF/vCh0MsMhep?=
 =?us-ascii?Q?ktnlUiA+GGzCwfCmiJe+AfQt/f1corRbbrP2yht0AKKPBMDf0H67U8eoa9ed?=
 =?us-ascii?Q?8XHdb2h+2lHbUQlwT3U3gQuRAfFieco05bLDN+YM9nKBMtsO93BDkAcp7qEH?=
 =?us-ascii?Q?TWDhhL57Sgb1krWSut+EjAVc5yisqwJPokWD2j3U4ih3I9UyYEjUeCe6g4Kr?=
 =?us-ascii?Q?UcX75Bh7BHtPFqVJZNBh8WXV0ur94yTQ8Aetce8IurTow72OZMjRSudSxkck?=
 =?us-ascii?Q?bjq8Hor7rgb2OQwfGZCN2Sv0nHC9Km9rEg69EndZdSo6Zs/5T5D2/FVBNcYU?=
 =?us-ascii?Q?0Jhjf6PipyihT/mjtPbR47c9+PpSzAseXXsONDwO9u9D5i25VsoUNB78bJdn?=
 =?us-ascii?Q?jE4YsA6wokstQe6jysEMv2kd/2afHWR5HTutblV6RwPvv65uzgKsk9PiELz3?=
 =?us-ascii?Q?aiIy9qmW4r0kh+cEQ5jn4e7aYM9m4fHe5r8+X4mYt+Mnc4twDVpsIpAkUAvG?=
 =?us-ascii?Q?rE6lojg3MtMbIuvOXPD1V4vYHAjcqDfLA/l39QgN6fmRCNtSHMTujIkRzojQ?=
 =?us-ascii?Q?4HXX4O1GjLXfnm/Ado1BTV6DjCE+z2gf6DLznfOfLPBmSHtXFhAIvh6YN9BI?=
 =?us-ascii?Q?E5UVKGngeoy1+e0jICTNm+ZLcAb9SI6HklDdKMiPMQPvCeEV3M6pN6o5X4h9?=
 =?us-ascii?Q?OtFWlz65K+b8W1E1+pqjUFn2CCL5OJH4eBQ+hn/ezky1UXQ/0GuXEyp5ySPr?=
 =?us-ascii?Q?xZM63fYJfWTVlNG4+FWGdp+PIK9RbR9iRV19K9jTG0Zp+wYzpNDqiNhMmiuT?=
 =?us-ascii?Q?LkYF6CUBYT/41KSfih6CgkAvz5yU/xH7Opv79LqKJuG7rXjTIpT1KaMkxR8n?=
 =?us-ascii?Q?EaQw6080I9+JOtUv+i39HKrX0jDO65G+O/s/z1KVNt1agtZuIE1J1OMmxKg9?=
 =?us-ascii?Q?wDp/RG9dsXNVBRBTZqKpAmoT3RKQSW3kNrZrbxv081nNCYbii7MXNdpDpa2u?=
 =?us-ascii?Q?+kYiowpI7Pq1tHjci+UBA7AW9Ovr5BcQq1jeHTf7+rDc8ZnXIgN8ro3r4KXS?=
 =?us-ascii?Q?MfM1o0XNTtxSLv9RSBaemQ/dEMHDh28QnndRUMKNlA4jtA5DX3wdo35P+wKE?=
 =?us-ascii?Q?M1rBwbBYOh8NXJhq1IuQjuGI+huTC3UOMn7cfH7AATyyXo7geXKaDOLu1T2P?=
 =?us-ascii?Q?dTm6FQ71JRG0z8E9tPlIV7pKhBmWfLwxwiZY9fM/ttPH9RKV+2b13Z102wJh?=
 =?us-ascii?Q?zhrk/ZPTcQUtlo1rJejS63j078iN43+hHof2Y6rf3LgfZ5V/TnXdoPpoBXlI?=
 =?us-ascii?Q?re1b/F9/oOJenV6aeLYKPZUQ399lQomim+RIac28sfzxr/0ywIMVUXCMnlQv?=
 =?us-ascii?Q?WHlUpXg2jTMyQ1++JyZIBlCaanGNxqvney5Pw9sHa1vbB3ovds5y1pI6dBF7?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bae67d-ec5f-4542-ffd2-08dbaebf7a17
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:01.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diOiRMWnAFpBh3DRqvn9lkiyg0f7o3TKndYYZCqzv3csCtzTF8OucaHEOlfRVPydYRapp2hKmBtMLOec3vk6hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: WxtYMuxXSdiMP_u1uIv3jrICRbV6s1t-
X-Proofpoint-ORIG-GUID: WxtYMuxXSdiMP_u1uIv3jrICRbV6s1t-
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
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Coster <matt.coster@imgtec.com>

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/sizes.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 84aa448d8bb3..c3a00b967d18 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,8 +47,17 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+#define SZ_64G				_AC(0x1000000000, ULL)
+#define SZ_128G				_AC(0x2000000000, ULL)
+#define SZ_256G				_AC(0x4000000000, ULL)
+#define SZ_512G				_AC(0x8000000000, ULL)
 
 #define SZ_1T				_AC(0x10000000000, ULL)
+#define SZ_2T				_AC(0x20000000000, ULL)
+#define SZ_4T				_AC(0x40000000000, ULL)
+#define SZ_8T				_AC(0x80000000000, ULL)
+#define SZ_16T				_AC(0x100000000000, ULL)
+#define SZ_32T				_AC(0x200000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.42.0

