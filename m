Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5472E6F3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683DA10E3BC;
	Tue, 13 Jun 2023 15:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59E410E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35D6A1bA019659; Tue, 13 Jun 2023 15:48:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=Y+2NoXH4ZmFNsGK7TGCbs2P+Ejh+hdt0wRdXvSgRhzQ=; b=gHz
 CJS1stUIxSmaNCW6t0Q5c6qO3w9Y2+WCHTXxnnHD3yz9lTwt5OL6Dk86onOeRMGQ
 HYcJMS0wkdOfYr9X4y5jWYZQ8KfIEhQW0dlP/9uurxqlSUPpZwmZy4UXD7dJpPDv
 dYvm7wh1KP7BFGjENeeV8GuaNENnW5/rYrOiDprIcGazuW9E2RkHMiqOYWue9Uj8
 lBjLSNqqdhEfe0JsMDGrfcMnk5iArZC1uTkddmRTUVQSdc78o9mzvyKrUQwegEXG
 iKi0i9ZprEG6gqGFnJGd+WOwZMJsa7EuOjA/ZyKrEdZxEWWfhSryxffld/N0a40a
 QcRhgfJkjdEA/ub6O7Q==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:14 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:13 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9EOZ2+3dG9uATumt25QhlqWHuy3ac2ja19Gk3DmCWsOw177HmXMGt3J+dhXj4Kj4nsODyOaQ5fvZFXJ66wSYTs/tFmOcD+k3adS9Bh2y5HTsLr22yvamckAO+judYynTEnMNwBhGA+7rcwIVwb4Y+LkpKQaSbeeXAuBgx7PCONuKRovPL4ByHw6aTRVzYh0WOQJpNSfotSjK5K5VJyWuNKB0QKlHXIhopGax7wio3uqqVXlNfRzW5klDeDtxGLaE495OrIQP1CPsqYdXA5ISnrdr15Zl3oaMxstWbmCoK/8R6zdcnNfA6C6QiPYykYD5vd8LUnjIMSqqGAFjl2qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+2NoXH4ZmFNsGK7TGCbs2P+Ejh+hdt0wRdXvSgRhzQ=;
 b=l0AoP+k4cNW8nDGSzuSb9H8Ks3fVD/2mCpomCAxdbD9m6su490w9SPp6f+8Fn0zH7cyF3fqOwcN5hh3qr2q6l7Gojt8MY6kFQM1OpyxRJvjfiy1/xbXqy9KKNnB7GqS6osYA93DYe7DB36nSPZhJO5JUzQQ7Ot3oxMuGfokf5IiWAIZtGc0j4QF+lxiIcOC0Eren6z+tjSYw70YO9T2XKgm9iqwneSJRJMxtv5qAGb8HRpmE7g7iAY/rBWzYEBp1VrlVaP04iL7vbawqE0JCppMiutbHz4bQ48c/WtwRTDU0VG4JxFcJYQ/BmN7TZdNR30WRzqxuYMbWMOaq3mEKNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+2NoXH4ZmFNsGK7TGCbs2P+Ejh+hdt0wRdXvSgRhzQ=;
 b=WPz5L0/41SpfJWqXOAwPmal7ox+Pw2XSkuE5OYHZ+TgPiPyAPkcaRkZg7/3hO5TDHmWckTxw1Sbb70TFtIYfZ8rphkUN/tkNov+Dw6X8wFnM2PHsfzbWdwG0WhRsgtCU5u/7a0HKdFKk6+pWiOVSrMa7zUckT90rM1605mVNkZ0=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:12 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:12 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 01/17] sizes.h: Add entries between 32G and 64T
Date: Tue, 13 Jun 2023 15:47:44 +0100
Message-Id: <20230613144800.52657-2-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: dfee9536-c2d8-4bca-7337-08db6c1d3637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvgpd8U9W6n1hfmVqN9K0ZXdlP4V/TOKQbZFNH/CkIwWV9OtWo8i8FUWsIhIzuA+nln6RKPJaXqBoBUiBx7aNga2Kn0juqEmq3IiX5EXGjwo3wrNIckMTUM3gjdAcr6s96t6godAoRBkYh6/cTbHtSgWdFQ9jgq9+vAj710h5BQ8K/90IS5uqcj+bPUzX1leAgL2n6dDwtHofIINuE5HqC7ZDOb6WnFA6T4AeM0HtYQORP0CgM3G9NYOW7hFrSKZZPYnV6gwA3F4qZl2TmwGYJzUIx8erFLBAvvOq/uTCisR2xs0Y1pYRD1yaKGgFQ5IZrql60hUpMQHoz/2INIo6kUPt+MrP0JkvCGwDJa+dAPbX/YWji44qK6jP2V1sTIN737cKS2kbPVvaB98B+93b0zuyVEx9FqPsRM4Lfk44rslCJ10kVDhcy5PhJszM8Snmjfa9nseNI4heKS+8mKKY853Z3cICBMyMPi0S54/LSQfxW0szbAsQQT9xffDaXj3UUhOsG+f975HTXk172zajWlcR7rfjGSsmVnkYxcTHW6Vg+/J7CkpBoeZu167DrMewLstJrhBwm/oEMUxBmVS2h5Jz7fIwHRTD8XxPV/ng9QjP35HZ6CQI+NThaxR+VTp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(4744005)(66556008)(478600001)(8676002)(5660300002)(6666004)(52116002)(6486002)(107886003)(6512007)(1076003)(6506007)(26005)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tTls5AIn6fKpAOJDNKgu4IwbNboB+1h5w/qtpz5U77Lpgt4Z/kZcVJESpWE4?=
 =?us-ascii?Q?FzVgRQrJ0fqef9DNH/ZFKhfBXqhrusbJOm75VErZ+/rB+4LCQ5YF36s75mZU?=
 =?us-ascii?Q?Hb/DFhS1hflP2ON1BYvfeOobv6tb9SSae4G2BNVWmRIVMINAIg03sW9QF474?=
 =?us-ascii?Q?r5rCBQsit/8kcYG5vrg+260HZjtGTU+XOClS5BMfpDRY7ACsF/9rBhfIyJF8?=
 =?us-ascii?Q?w+1bp7+/KwnvdQOeiFOVkTX1PWIjoL9sPMvQeSthXVF8zYM+3tXOXlMYgAwQ?=
 =?us-ascii?Q?frq3+W+olf0my5BUV7Ef6mleQFhB8qgKgThyA/RX95gyVygpSwMTto85bMLb?=
 =?us-ascii?Q?/UGd53m6VFQEDKoNkQtTrtmyRBkad4CEMJedC6DV3xqW/KSaQZcy3ge3czOC?=
 =?us-ascii?Q?QocDuRiyghiG5JSK2u1NJ3b9SoSE1559w/iVMsX3yH/+0mtpNMlAwGzC6bYY?=
 =?us-ascii?Q?/dnJ/d91EA3n8IG68JE1BNTh86N5jG1AB9pN6NXq7tQp2iF9duYupDP9mYjF?=
 =?us-ascii?Q?Yeznk0AMaR+WeNORcRy5MwLFvvsL9dOnYwm5ESPrt8PbcFUDHkQjn/FHeR8/?=
 =?us-ascii?Q?7llWcUvnadoSBSmagVMTYyPaumKTZY7MEP7XYsfO8VuODyCcppDSTebwiXoN?=
 =?us-ascii?Q?0dIKEEmVkszOuTNDYeim3x/L+OhpMTDaO0qZDp1Az2XHyGLwYZBdCojkrTmd?=
 =?us-ascii?Q?YPvndj9YFRLjMGat6SU+TXqPK4fIt1LZHVrjMZdjVW5sM64y0pJcnlyLppmP?=
 =?us-ascii?Q?jr+XUgqejCXGNrRTZLTaIRTo0Q+K1/9ypgi4UEmSpWllvcFs8n0PYskLKfri?=
 =?us-ascii?Q?tMUopQHNbeR3V96FKRUCS5PPDao6Tkbrx6olo5XwMJl1E/2/EwpT/6nnYGGp?=
 =?us-ascii?Q?zJQT0rY2xiyD4sZlt/Q/Hn1qeQaTxMo7XByfIr+yUuTlq6gpG8Za/K5eh2A2?=
 =?us-ascii?Q?bNc2kTrL9fyg3b1qaMSXlqBNtLGv0rGSMn2oRJLi5CA9bSbsBuMmRUTGzT6p?=
 =?us-ascii?Q?FYMorercjuyKRG5A5ABBVb914hWHloON39eju2UoKnuO1wXKZa0Ct07ed880?=
 =?us-ascii?Q?kB2ibqjn0GWfLSw7vn2O+W5NTeOl3wLHN8DyJ8nYe3nhGwHjBKBqo+rC/vIR?=
 =?us-ascii?Q?8h2CjgKrgnZTM/jspV6IdGPr/2l38LvbdHiFWvgt3Vrz6z8U8uvr66nOBngU?=
 =?us-ascii?Q?9TL4lE698qFxg/wIVZv6NfRW0RTQSKbE8mzfifVt6+dvurBOoubjBqblHQGv?=
 =?us-ascii?Q?c6Kxw3cdEcMrV4nzFZX0Mkg0fJLT2uBNZHt64nBmNdhWmQgu4tQ0/rUkmjyF?=
 =?us-ascii?Q?3eGo3wzQ7ei3XUSgT+0wCuWjhG1Mk2VSlLkFoBmU7EMBk/Kb4rhTlYEsbwbR?=
 =?us-ascii?Q?8dR8ftFAl+IqkJh5pPz2NXrPVWAcnWiECAmlntRvaNhcHr+tRBgolOrePDWZ?=
 =?us-ascii?Q?4qbnn9t/66wNbhgnhDCfAJJRT4eH/2yvygpDrpGb4fr5S8JIP3JOLfkqpV91?=
 =?us-ascii?Q?b6XIorgDKtNjkiHFiuZm18yBOVhTz7DzacT1KlcgUWIw1oWMXnuXqJSZsTgh?=
 =?us-ascii?Q?arcute/Hn0Qf+QlS0nQDXw+lBLUbB/JNJVyW7O35zF1jUnAafZ5KJRy2RXKp?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfee9536-c2d8-4bca-7337-08db6c1d3637
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:12.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAIXCmLD3ltOHpH0NtBGlxRnORiag+BZxjTa4Z8maarYUuzIJA2RyptWtOWSYQwPomz6Pj7g5apBCzkwOFHMmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: P8S6oPH70i3I1Nj3kY4sU1ccXiedYJV-
X-Proofpoint-GUID: P8S6oPH70i3I1Nj3kY4sU1ccXiedYJV-
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 Matt Coster <matt.coster@imgtec.com>, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Coster <matt.coster@imgtec.com>

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
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
2.40.1

