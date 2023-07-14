Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E52753D36
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FB910E899;
	Fri, 14 Jul 2023 14:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7BB10E899
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:25:09 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBU213000769; Fri, 14 Jul 2023 15:24:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=2JlrcO76QfHGQi9RSMwwr
 m3ohkOuHCDQJ90Fn2fC5do=; b=JH0wM6USwg3me1VdgD6CPft2byYAHd930ErfK
 A5DID+Ux07tuOTZbkYQGS5Ck0OADrfWkubE3JCdLNr92kosUFWfgg37SwPemRnkw
 KqTBbvWbWVXT2yoWCrapaH678Jx8ZM0x/D38FFIyKogHhpPGVnj0NLoFSf2rTUxq
 Oo+suLUXDHgjzf/EyOshLS8hGgyLjCHgq51yPrbEE3TOLPp1o4zPs71bVLhqJcjx
 soaKPMyCoaGioavjdTEOWHuxhhaT+O5KkbWL4T0+bzG+hKPf0AoJESDqyXRT+2Du
 Xp+xTOJ9L1TvR47uXEcAzGlAXZf8/ccO2lLOovigpfE7rYLAQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gmad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:24:37 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:24:36 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.56) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:24:36 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkGP6bwmjDZDrzKnyljJJnrTAITKG3SCWl9SKfSVaA+YhZ0E9JaGHWQ9w/bpQ93AvdWkgNiemxf/lso/5u9Mvf0x7/cQ5Aix5oRGBK0sgHI9SIqFCvckB9LtgDhMMxSjIik2pUmMtx6VZmxc4Tr/EUy6ccIS/vSLF0TMJedOHseFHmnu81KBMeIjZpYoQ3yK7CRXfKjx2wAQXVM4EICB1AVdLs4OY6wC6TEkFPsRuj7yeb/ExBnzBRJw4OFQIBx3AcRmJWFQfoN/oWoFHnRqJjTkuhG9/4c2wXg6AULGHS8ahU6vhTq3vr87HMwkrC+6G1PGGfdHTl9rnAEPSGMQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JlrcO76QfHGQi9RSMwwrm3ohkOuHCDQJ90Fn2fC5do=;
 b=FCIvsmTzSwyKYkWFDET4tkyntOvOLA9cZBMJ+CUELNbkm4SVlUJou1H9Z8DoHL1TsivEJFMUXI2o/PHZBAr78sCS8M1M0Wo7fVtMf8prkYK5t7OkGmoHxGl0qnEj8b21pGR1c4ltXS+hFJ0UUGUfPIKZ86nVlIco/iu7tIWfugJ187z/HvZLjRS+JjG39AvQN04Tk7LDF6noInpxz0zYObsJgoTm8CpCOLPUcfu/Z7k9wmNLVIc3KSY1d2AMlWFlRHs9zRHkSuhVq0g5cTXbJ5USB0ohYE2ICvbaTKh24hff0x11vg8dkZpVz7vgVgLYMzhalzSOiJ7vbI3sxaHJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JlrcO76QfHGQi9RSMwwrm3ohkOuHCDQJ90Fn2fC5do=;
 b=AFtRgeltw2ainhoHd7mfB1rknM7HNVlDvSHE7s+ZHzw3WvNyKBFH2WoKIComrXjmwRwOyUe/xpZl2kpMEDGvR+qhLCrJc8+G+l3DDFh7Vh3Ry2Z2K8EK+UXnmlRVV7wbNxCpyhLbEATNQxzbNEqkzDKd+W6y6Zc3T3qpxv+sHvo=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LOYP265MB2077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:24:34 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:24:34 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 01/17] sizes.h: Add entries between 32G and 64T
Date: Fri, 14 Jul 2023 15:24:24 +0100
Message-Id: <20230714142424.111465-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LOYP265MB2077:EE_
X-MS-Office365-Filtering-Correlation-Id: 0338399f-2efa-4e55-3ebe-08db84760c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfYBX5SEgucTCe/cETrVNwo4fiwWE2dh/FV0u1YdBAI58ApgLz22o631ENSrEmNQsebFyP+gCnAG4dNXYbp4WoAOIKVvDcBwysVc5U/l1SY3VikADznF+euiEqRPaauTt8UFM2eFU3OFJth9FkczcrERHS3nlQb4ldJBMde7SCJDlNoKsjzkm9ieK/c4cAuURDS+zxZ2uSuUTy4fm8/yXvqVG89Mh+lhH9Agfz9Iya5QqhfX3g5QCq9eFmAwS1P4Z+9lHBWJS6Yr6kjt29Wx0rzgMudR6D0WYzmx9zGJHjzo2TLkva2aCK4uspCOtJ8A2x4qznKOe7iYkqEOXOUmH67ejIQMXE05vXZd0m32sGXmql6Gear+DqeKTXuPEibiDNXC6aAZKPZ2KgX9AmlSB0TA0B2SoTIPflKXn3ZFlz98t0M/eeRt0qkJiJ/TPXvqobAlWMcURq8ZdmtKkwzck16brWTUvdyewTytH8CPP04BS+j46f9HRWpyzCPP3vrS4ffHyqQll7OZ54KwYkY2ZRVhPGNy88QCsONG2ZvGuHuSgEGr5EGazWAQGJqs0vrrpZR5ndV8GfH1a4nJe2KuExRv2400lpLHBH+1vqLc4bgkaSh1ELYrrrT0nMVkP+9v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199021)(41300700001)(44832011)(54906003)(66476007)(7416002)(4326008)(66946007)(66556008)(6916009)(478600001)(4744005)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(52116002)(6512007)(86362001)(1076003)(26005)(6506007)(186003)(36756003)(38350700002)(2616005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Moq/zLMgq4D+n+OHjLWqUoEbSITmC1c0jWKorD+1J5+5dCOIgtFZVCHZK7Iq?=
 =?us-ascii?Q?Mo20/PdX4mVvlAXdHHfKzq3al4VepS3BM5NqeKd/Ru40gUwRTtvcrtM9cXfp?=
 =?us-ascii?Q?mn7otNUvrpPY93ICiaExLPgs50HmDX2tXS/WT/ndBlBZDFp64e+E4zsxtzIA?=
 =?us-ascii?Q?hlq2DSZRWk9uFat9d5AI3ZHpXsEY/T5G5Cx/VbwfHqhiyqOTTygbGkS0srf+?=
 =?us-ascii?Q?p55x0kssqTriKNWR3W7+3a+0egtpdz1tFpz1tIzExwLYEUcACxSd79v96cTB?=
 =?us-ascii?Q?bzXXQRmw+RuLOzufyGYn6ERZSxVQsqMVv7kKYHJsGh/sAPdHAgTZHo54iTl3?=
 =?us-ascii?Q?A/7obRNeuL8NALJounss8UJN+m5+6SuAjewtjXJ0wXZFYVhhUH2qEM5udgRb?=
 =?us-ascii?Q?Y/OGF9eprWjTw0AQyr5qerK463eWgdPQQpyLTjH53tchn2/mlOxm4+vZtp9Q?=
 =?us-ascii?Q?xFraTQQ4m59K4jrlygxIWXDgDbbF30oYYoSXwpRyH8VFh9hZmzNpJ/VIwh7Q?=
 =?us-ascii?Q?TsqtBEgmKZ/wGUAbsQ5FttWQAvet+bnFaCIsbjwD0nruZrhi6eUJJ90l80pq?=
 =?us-ascii?Q?F9jc1PzH0TicNj/xLoctBcNrhi5DlEV44q5en4sdl7KJl4t7M+gw5DpIvDEy?=
 =?us-ascii?Q?QC/WRk0H3MABVFheAwEkKCvrC3cxDHkP8CitgUOLvzel6VgBvKAN4TvDDHvR?=
 =?us-ascii?Q?SMJk2akAMfyfqfttPUdo1vTpmXEsyvif+WjKJJbA6LtKflORRHzAxqT3IGv8?=
 =?us-ascii?Q?NNf/m4CYWdeDMPKTH027OKwTfTPUBweqVqO8uBp5B/tZpxFVQbDdjdLGGXvV?=
 =?us-ascii?Q?qCdTedN3lcrMGWkOraC5KFs1HD+zeKEq7y5vTNik/RED0ZvSM4fbCrUWRxhq?=
 =?us-ascii?Q?APBR4ool6ggPUyojYuvF35sapmmFRsuYv1sp9QrHa3DoOpuBGkzJ7w/RFa7F?=
 =?us-ascii?Q?Tg/QgRqHUhAzAO7jTGdokX40u7x8i6e2vHWYAR0eVdf+kCxL1WtZfa/kEUIR?=
 =?us-ascii?Q?H0vu7rktG1zn9AkROcEiYmxE9gDT+69Mou+Rdch0QApGkkQcHKtf+c7Zi7hf?=
 =?us-ascii?Q?D+5f0HCY8ewtoKm3xy8jxcEXjgsLgbsHybOhKwyLr8rN4arsoW+MAKuahSqa?=
 =?us-ascii?Q?L5gWjqBK2UYnwH5vdMh5lo1quz5B5LdCBbm4+YF+6q+a2w4XqAvFqMp0K/em?=
 =?us-ascii?Q?bRIY3NQOg7Kr0GJVqU5v3zhEf6N5GVjLGnGnTx42tLzY9gWm+ZgB8bha+2FB?=
 =?us-ascii?Q?V1j/LGsm4bMFYP3KOpY5X3+FuBUgeSley1KH7cEZyrKADd/fm9fZIZ+4jT1v?=
 =?us-ascii?Q?MWKfTvgSwM0CoM00pqtZR2k/ufolnXi5eFGNPP1vo+sQOQb1CMTTY1F/P5YF?=
 =?us-ascii?Q?bqOrbki4JFu0WgXsmF/oM1ksmMfAbhwYrFbEwD4IE93kRpRYkY0iiH6PBzVJ?=
 =?us-ascii?Q?55ZzNHr0xFeYn5aLVl6h0VO3M8MbxNGOQigjHGO4Cxlx+ItCwj5mKS+VizpB?=
 =?us-ascii?Q?DP7Fu/33SDJ+GOgnKt4MS/OKedN4tHZm+Z9yWnd7/2urf3wcJcE1yFUfahdt?=
 =?us-ascii?Q?M7fC6HiNgdcju1FpHvI7wJNt0bhjx4Ipv7VVMRQ2yzjIFbFRAHLvRh8m9MS8?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0338399f-2efa-4e55-3ebe-08db84760c12
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:24:34.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdwBhjnCQ10NJUpUf2pzuAYQf6FKqYmVoZZ8OK8XkRRHEulP3KYbcMFKrVE2A8H2SHLreenufCFI/D6Eq7OAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2077
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: ySa2DRCMY62YT-u8zB5eO0jlm0QxcP2I
X-Proofpoint-ORIG-GUID: ySa2DRCMY62YT-u8zB5eO0jlm0QxcP2I
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 Matt Coster <matt.coster@imgtec.com>, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, hns@goldelico.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
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
2.41.0

