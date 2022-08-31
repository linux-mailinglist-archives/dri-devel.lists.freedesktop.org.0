Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EE5A88A6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197D610E425;
	Wed, 31 Aug 2022 21:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7497E10E425
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661983061; x=1693519061;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zsPioFM5wYFWCkLRbTTswgDX0SQJrC8qqAHd8F95EWQ=;
 b=AHwta+XyjscMMqHgAD9FUgwOnJdYBFE72lJzzyh18JbyKOQC/78Lxr7w
 3i0rZ7UrZULf24bzwuKEAd/Gm3Eg1Z5Q9wW3oKaLvDRQEB+40oqRNLUfK
 w9yCSHD6RkGCsyhthphvA6FMV4Ya0jL5864wQ+1PTPESw9rS4Wp/YSis1
 nmStadySGbDUZhd7t2lP2ADwkTo/m14HHX6NtM21LNQZJggN78h+QULie
 UNXlP4WsbWLeI7BJHieoWxWDk8z9rc69zDyA94DX9hh9AeOhOzSRxGpYw
 1oUrqwA438SV8Bw7v1ySmffGtUasykUXhFbZSc65HW8mIZpEAZf+F4L0H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278571281"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="278571281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="612244855"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2022 14:57:40 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 14:57:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 31 Aug 2022 14:57:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 31 Aug 2022 14:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnQyhre8Q9a8pHJt5J/16o11fU9u2UAv32SUw7+m04DAOBzSVnJbGZVyGOpINpBQhpYOTmWzrsxOkfp4KgmNjjFpdhrUgaVeW68ecK/x2qXCYcUQZjZdQQCVaB2YxwBCA7M5WhAVNskhA1i8T2FQmXa8CSycpzHBHzPCpxS/UU9sh59TUEhzk5YOj98Nq+S6PE+5C761GGU8EiJu+/VcCboIMSxPnntufuSx+EMQfWMxLQmvaVKm9k64wbae6y792n7jSAmtBR7OGxDX6HcUVuh3he7rymA6lkRQIUY/VCR/6t7JfdZWUpw4TQUTr4mFQCy5LeyCrpJASzf6y26z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4GO6Oz0Pe/6p3WVWPjE6Ojfakw1hOwb2/mjOK32//0=;
 b=CXmfF4Hq/i+Xv7zvMq9Mixm4gqwZa1JYL3EnZQrCTLjxnyRTKoBoNyo+wKB9siGdEawzzDNcOPERF3IJCeNxq+us3H3UVuT7QrHcxX3ul55kcyAlfgoDSgDGBq/nVXZyKQ04B89M5JXhH3MIjpNnSOCx+W9uySDSx5PEAuXRKPE3a/e0HprCBcrHv3lATIxlxW/MNz4vf5bdH6F5KetyHk8hLhhWixTOFDCsuQR1HhImtF6Ghvw1cbx3qkOVkWcRmrl7o+IIoFQAN2cKD0cWjxbzCOlKciMf3Tin0bqbr2kABGhk08vaF6PanahGPzigF8LuXqIkH2ICUjmuIHeSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MWHPR1101MB2144.namprd11.prod.outlook.com (2603:10b6:301:51::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 21:57:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 21:57:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/format: Use appropriate types in expect/assert
Date: Wed, 31 Aug 2022 23:56:07 +0200
Message-ID: <20220831215608.349269-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a430f68-8f1a-4ec4-50ff-08da8b9bcdea
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2144:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iaqFdFAN/jh06FhIaB4iXqEcwh+KQS8/8xQ0rdsRGdJ5RfB8ngPRzNrWOMyMi1BYDQz/6tfFTQbfP4xnGt3vJkkPqfLUssSqC7E1C/dtT3GR7FtEmA64o5xTbgAxfK64BEnAnIAvJpX4HpRaiQ7GLRioGLZSZ4eIaHnn//WMfVUteuvrVL0mNHrOuwjTxOz8o12lSwq0NMEyAYP1aQ16J6mRxnEyleGxQ63w3w7g4lKeyKPaZ8xoIE2MoooQ875jkDc9lJOjbl+bez249/PszuOQSQwEQluarRXZSBYOJq6JfrFdnObE6vxGaAUWvH+Fe9gkeElZYGOao/knDeou2Kq9UpYm6ZdEaOTqRzp8BuVY2YaSrICl8UIdw7iW8vS9U4dVZdFv32SpNteIbyyqzeuTIKetKaT+GSd3cYExxeAWQvnvLDPZLgo9XYpPhR+cn4dHrA5eb7/+zUnX9mr36BQHRLRo5KXIrIdP7igjLWiUN8NOgF+eBeOSDlp04oS5H2bc2anleU9bDr0BoDXjzBnT52GOHnwN+r24GH7LSYbkiSv3QK88X4ClH/2NsMjF/GzgXT7iLKD940w8JWViV5aJfT5yoZZkR+5YwK0rrGJlnhEJoGJJGBoVPk+ZkbiDLw8bKOs899Mw9u/AC6+iyuicoHiZNX7wS0b2i/Dt39YDPi43npYND+5l2VeloPlGE8S20aMn7P6GA0SNMrJ5AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39860400002)(6486002)(4326008)(66556008)(478600001)(66476007)(8676002)(66946007)(316002)(54906003)(5660300002)(6916009)(8936002)(2906002)(30864003)(82960400001)(38100700002)(83380400001)(86362001)(36756003)(26005)(186003)(6506007)(107886003)(1076003)(2616005)(6512007)(6666004)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEZVZWNtL0pReHE5UzRFWWRibG5rYVA1NXFzREdiWWtad3I3YjRsdEpIV1cr?=
 =?utf-8?B?alRwVVNqSk4wWjdhRDNBT3JtU0s0T2ZUbDNGUHkvN2Z4NXFqVzNOcm5HTmhu?=
 =?utf-8?B?bGxKaFp5ZVhYVUFaVHoxTVh1a2dSOVphZVNQb2tKcE9oNnpudXlMSG5QRWVF?=
 =?utf-8?B?dG1aZXRWOXBnTkFzVVFuZWU0bE5mZUt4bWVjajZzVHl5UnFtMldCY3ZHc1I0?=
 =?utf-8?B?TVYzbnJkb2ZPaWhGZURtT2xIMVREU2VZandFSlZBOEh1RkhXbFFERko0UDha?=
 =?utf-8?B?aVBlc3ppMmdKR3hLNUNiTm1VZ08zdGJwTG90SWo3dDNrcDdCNkNnUEhvYlhi?=
 =?utf-8?B?ckFrcitkZVJXUmIrTVZWRDBhQVcvY0ZUZzVZTmdEb0VGeUlOc3JvVGppZy8v?=
 =?utf-8?B?SVF0Q3BJZXg5eERVV2sva24zcCt5WWhxa1k3S0hVc2hNZml6bHhKVWtwSXJJ?=
 =?utf-8?B?NkZSTndzUXJLSE5sdEUyN3QrUUFoQmZtK0ZBa1lXMVpkRDZ4UzFuNDBiUE13?=
 =?utf-8?B?Q3pDa3kzek11UUZBQ2cva0h4cHRlaWhWVGtxTXF3NytHeW9tQjZvNFJnVHVt?=
 =?utf-8?B?SkpCVzlPY0E2ekd2S3pwbk5xUEl1ZXJwMnFRUGpjNzJyL3RpMkFTV0xRWkR6?=
 =?utf-8?B?TU05bU1YQS8yZUtxMEFaaFJaTFFFZUEwQlZ6WEtYdzhyckJWT2VOcjFGMUdB?=
 =?utf-8?B?MnRlTENONFlXMEs4c2V5bE9LUUR0Qzl5Q3JueVYrZlcxc0dCc2IzclptTWx4?=
 =?utf-8?B?b2N4MGZnYzJrck5BZVpES3ZkMXZCQzhSbjkvTlk4ZTY4U2t1VEdzaGp1S2NX?=
 =?utf-8?B?cEhsZmhLLzJNTGNsbkk5eEl2emUxRVZTdnJaSjR6bkpVL2U2QTA3ODA5S0Nm?=
 =?utf-8?B?TzBQRWZwMmhaeTBkOUNUcml3MDhKMzVTNkxzYjgxdUxQMDI3U055OUxsVVFE?=
 =?utf-8?B?MExtTVlqbG1nbzhJTkRVejBkSmIxazZKYktLSGZDblFPaXpVTVpGOGFFdUFh?=
 =?utf-8?B?SHlYKzNBSDdOcUJxZytwWUdjOTQ3RndXRHZUd1ZmTmlBK1dkWmFVclByazdE?=
 =?utf-8?B?VUJhRHBacm9Ic29sY0t6eXI1OVdFc21KazBaWGlra1kwcmhWenByRmlPUlJ5?=
 =?utf-8?B?RWtWeFVFSjlmUTlURFpjTUxGaEllN29DZG16ZStRR0MwaU5vN0hQejF1Zm81?=
 =?utf-8?B?RjJwQ2cvNXUwOThuaC83N0RFUDFzVEIvcG5BR1BZV0tjZ0JSYTh2azJHREhG?=
 =?utf-8?B?SzFNL3h3a3ROYk4xMU5MY0RNcHlkR0dVV3NaQkJQTXBKOW1CNmZjSVZmNk4v?=
 =?utf-8?B?QlhVNjhYUmFUYjBPUnJlMFY1VkJVdEtOczU0WnYyV1BoempXVkVPbDhEWjA3?=
 =?utf-8?B?THRldW1WdURod2xGSGFuQTdhVHJSbGgwTThlcFBlaytrU0drSUdabnhpTTZN?=
 =?utf-8?B?dnFkMHVlbTU0OG5zVXJhY2JqMFlxOWdvZ3VKTk1kbzRXdjQwb0lwMm1RT2xk?=
 =?utf-8?B?U3RUbWF2RXQ5SDAxVWxnNnpCcktrL2JPZTdYK0RpVmdxTzZPemNCTGJQVUpr?=
 =?utf-8?B?WE5IMWxiK2p4S294SHBKRHdOZFZkOURVN3E2T3RMWi9qUi9ia1plVE5aWVRM?=
 =?utf-8?B?RDdKRlZuZENQWVh4SXNnM2V3cTVJQ3hWN2JOZHpTUktGeTJaYjVBZ3BncTEx?=
 =?utf-8?B?ZG53eXRzdmNCWXpCRzl0dG12RjZsZHJzZ0hWeFFrZ0QxclN6OGllUld5Wlhm?=
 =?utf-8?B?cERUVWJzT1U0ODdPL1JwRzEwN2NYK0F0MXlyRWlIUjdvUUxGNXAzZmo1ZG9Y?=
 =?utf-8?B?SHFJUTlSaUhpdlZsYUYxcXNmbmJMMExyZERLeDlhU3ZyRUFCWnpuWEsyangw?=
 =?utf-8?B?Yit2VUhJSDBQWWNpd3IwbE03Ym5IOUJ6VnRjazYvak9kbjZTbTgvZmxQV3FJ?=
 =?utf-8?B?MUg4MnBieVlyTnErUTErOWRrdkZhZlNibUFwbFJCbmFpV1BSSkNRUmp0M01D?=
 =?utf-8?B?c21MSnFmSnZ0dXN5cE1CM1VvaHhqM2FyMUpyVVg4N1JWUmE1MXFkTzZOZ0Fl?=
 =?utf-8?B?cWlXbWxsdnlHWHhzUlZDMW1XdWRaR1QxUU9tU09LRXdrM1R0WFIxUm5IQXlH?=
 =?utf-8?B?c1AyaXl2ZkdyLzFzZWl5Q0kydXZEZDNTMk1BUm5yeVJicXFuRkd4NlMwU3Vx?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a430f68-8f1a-4ec4-50ff-08da8b9bcdea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 21:57:31.9567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Xw1bVDdcwDINdJGAyTsHcwrWlvl6dKXcXM1OXm6DbQzeuhdnzjWyVxHoGJHyUOeQ1dcOdI7E6tl9qV/fLVoNtsHDI2j+D9pyfQXrhwVovs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2144
X-OriginatorOrg: intel.com
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_format_info_* functions don't return bool, and the info variable is a
pointer.
Expecting non-NULL info will cause the test to crash if it is NULL in
checks that follow (which dereference it).
Use appropriate KUNIT_EXPECT/KUNIT_ASSERT variants.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_format_test.c | 152 ++++++++++++------------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/tests/drm_format_test.c
index afb4bca72187..0efa88bf56a9 100644
--- a/drivers/gpu/drm/tests/drm_format_test.c
+++ b/drivers/gpu/drm/tests/drm_format_test.c
@@ -14,40 +14,40 @@ static void igt_check_drm_format_block_width(struct kunit *test)
 	const struct drm_format_info *info = NULL;
 
 	/* Test invalid arguments */
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
 
 	/* Test 1 plane format */
 	info = drm_format_info(DRM_FORMAT_XRGB4444);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
 
 	/* Test 2 planes format */
 	info = drm_format_info(DRM_FORMAT_NV12);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 0));
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 2));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
 
 	/* Test 3 planes format */
 	info = drm_format_info(DRM_FORMAT_YUV422);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 0));
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 1));
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_width(info, 2));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 3));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 3), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
 
 	/* Test a tiled format */
 	info = drm_format_info(DRM_FORMAT_X0L0);
-	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_ASSERT_NOT_NULL(test, info);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 2);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
 }
 
 static void igt_check_drm_format_block_height(struct kunit *test)
@@ -55,40 +55,40 @@ static void igt_check_drm_format_block_height(struct kunit *test)
 	const struct drm_format_info *info = NULL;
 
 	/* Test invalid arguments */
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 1));
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
 
 	/* Test 1 plane format */
 	info = drm_format_info(DRM_FORMAT_XRGB4444);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 1));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
 
 	/* Test 2 planes format */
 	info = drm_format_info(DRM_FORMAT_NV12);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 0));
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 2));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
 
 	/* Test 3 planes format */
 	info = drm_format_info(DRM_FORMAT_YUV422);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 0));
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 1));
-	KUNIT_EXPECT_TRUE(test, drm_format_info_block_height(info, 2));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 3));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 1);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 3), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
 
 	/* Test a tiled format */
 	info = drm_format_info(DRM_FORMAT_X0L0);
-	KUNIT_EXPECT_TRUE(test, info);
+	KUNIT_ASSERT_NOT_NULL(test, info);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 2);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, 1));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
 }
 
 static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
@@ -96,16 +96,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 	const struct drm_format_info *info = NULL;
 
 	/* Test invalid arguments */
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 
 	/* Test 1 plane 8 bits per pixel format */
 	info = drm_format_info(DRM_FORMAT_RGB332);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
@@ -121,10 +121,10 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 
 	/* Test 1 plane 16 bits per pixel format */
 	info = drm_format_info(DRM_FORMAT_XRGB4444);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
@@ -140,10 +140,10 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 
 	/* Test 1 plane 24 bits per pixel format */
 	info = drm_format_info(DRM_FORMAT_RGB888);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 3);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 6);
@@ -159,10 +159,10 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 
 	/* Test 1 plane 32 bits per pixel format */
 	info = drm_format_info(DRM_FORMAT_ABGR8888);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 4);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 8);
@@ -183,11 +183,11 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
 
 	/* Test 2 planes format */
 	info = drm_format_info(DRM_FORMAT_NV12);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
@@ -214,12 +214,12 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
 
 	/* Test 3 planes 8 bits per pixel format */
 	info = drm_format_info(DRM_FORMAT_YUV422);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 3, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 3, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 1);
@@ -262,10 +262,10 @@ static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
 
 	/* Test tiled format */
 	info = drm_format_info(DRM_FORMAT_X0L2);
-	KUNIT_EXPECT_TRUE(test, info);
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
-	KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
+	KUNIT_ASSERT_NOT_NULL(test, info);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
-- 
2.37.3

