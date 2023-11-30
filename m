Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5F7FF43A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5C10E728;
	Thu, 30 Nov 2023 16:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567310E728
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:01:26 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AU802vs013880; Thu, 30 Nov 2023 16:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=GjLYn+xc45MkLKwkxAhfqk6uUXp3h46M5oX8BDxJ5s0=; b=mAE
 QGXfS31L5LROPH/x3Xzh4ltjFCngEd+SH78ralvtakcten1LS1df/DPDQFDoRuoS
 zh5jAT4FssgfOu1H3gMsMWb5YFNqt4bA6lp5kedq6FmnmD2mMAmCLI86q8ijhzwS
 gdCNzHoX1Ux8CRv0DE7niHbSEWAbV+u2+gU5FWKO+3cB60qzPX0KIxsRHfC5ia+D
 4fNSs/D3li0qxIK36qbGQCmXfcDHDsfk4aaSfg5wMympdl/jgEAz4TsguhyT+D4O
 OWbCrGwyoY815+Uys6lx7IYaHslDg3MbOTDdb9zgdyCQKNnU8Uuf5Rsbeqli8rkz
 VfNIggexDBwAZ8uD4og==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3upgr70nhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 16:01:05 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 16:01:05 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 30 Nov 2023 16:01:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jswq3P3ZWNKRWYrM1PzNPVeRjKUnZcGWMo+24NUX+PB+MjYaWapoHpgKulOXTtPrYnbl+IWdyLoDVOE9oPNNS7lP+87a8goZgkNiKZV9zNl/cXJOP7MLHSpuuFUoI68amIBxFaaqJnUf3pNkiLeHMqeoIorWXpUUIeOC7u2N7kSHEfKeNVLUbiMiLyCXolQyCzPnYl0aTDxA3XkR6o0/2IQMAF+tkn4EPiiaZmOor0EkRJaKPjpQc/S+S3r3QLXKzghK7mwH2XSfzeJPhlLl2LRXTtws09ukBjiJhZNiBZ6MPXMXACp2d/U4THwy0TtwJt00iEIVVqjmEN/Ej8ihLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjLYn+xc45MkLKwkxAhfqk6uUXp3h46M5oX8BDxJ5s0=;
 b=BfoPa9UpW8w5ZWDXoWzSfNJqBDxU41pWTEvDRw5EZyvSBLWpozKAd2X3pgviI7bTKKmpBnzQlmb/+64vRIzL7d7lumLizYJFr1Q7ABJYt1ftvMtWDvh6ftjFLPveSyu07/dLUQ9Wew3BV5vG64NJVZX/4Qb805N6vIli53pyCJS9hq10bEoS12PD79+orEVgqYWkkPrqL9TId/zX8Phe5t12VwP587EijJqSH/AH4ECL3eNE0FByZoFQOUYIA9r3/tm24gbdjrwVcW8O3HC/eMhwRL3sqDBacY5OphqF6tFAle3pGe0gXe/otkGT8Em33JikQ8u9CZABhXKiH4Ad3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjLYn+xc45MkLKwkxAhfqk6uUXp3h46M5oX8BDxJ5s0=;
 b=cwhsyqM42XHoDJpNeFl+J1HO1ppNN9Y+9zfgXQTee01AMDnd68oPlXeYV9oftXf9WrXPVWsU+4LF8h4sAb8gjfam0IzhnNPqBCUaTVFzFQ4R0lJ/aSNYjucTp9XUYb94x//8O/UlTM41UjhW6nd3j7HsvVHN8HuCiewZ9qgNXvs=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB2410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 16:01:04 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:01:04 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] drm/imagination: pvr_device_process_active_queues now
 static
Date: Thu, 30 Nov 2023 16:00:15 +0000
Message-Id: <20231130160017.259902-3-donald.robson@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: e27b8734-8b99-46ee-37ed-08dbf1bd8e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NurumudLd5fzmbajAmF+W6tcLKSeerr312zUZATwVwL1FJ1uFv3oaGESxWxKJEH0WA5P671I2ehQZPavRxSH06x/NzwNr+1CGldHxLgZQ1j1hCYITkYjLULBE6MIkgm86PBzKK+7hv5xOA1OU+mllCcsfx7kauqyvRn53lLKAunWAFv6qLwhdVWZqMbp2EPPYofzchmEAv0okSeipqpcu/Am7SBsT5Iu5TQqIG41Mmjs1E8zCYt2nnGsXwV43/v5sXrq+OVGtF9yBZ2S2K94KDQSLJIg31o8cuIPLv/oHgv1jsq5ILvrRxU56IW7wd7Vh6HCmXirmE2UlgajVhgkINA2kg3ddPMGVB+UBHNDnocwBZoyuu7FZki1JK5/vx0AAsVLSlYTtNXcnm+J+WIltXUXp5kb2XWZoUd4hoW2t37mKFq3CA4Re0ZD3A8uxq4II421n2CK+b5wHtSXAL3Y4yDdQ40qcBLKLYFs+2jkd9RZyYjtT+ntXFWned5tS4kj+9MNuQK627yqv1mjb/eaxyeQfueorMuSZF2FBemz2rfa6ALmiwL8J92U055p4SF0zLIi8abJWlBGrvqJoZssyVYreFTEOoKqkraDA7m+qGoURlgiamUqpovtXwoEwc9FLpQ43qpFRzIN48opw7y3MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(26005)(1076003)(2616005)(38350700005)(66946007)(316002)(66476007)(54906003)(7416002)(66556008)(2906002)(5660300002)(4326008)(44832011)(8936002)(8676002)(86362001)(478600001)(6506007)(52116002)(6512007)(36756003)(41300700001)(6486002)(966005)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jKMP+vJqX8H6rVdktp02TfhDeFbe0Cmx6IJd1Kb6Xf6pHLzeGeXJeVFpxe2o?=
 =?us-ascii?Q?IdQu1EPCm8zCn0xcsNu/Ct8yhuUaSItEzVZVxTAH7JRrTwIedeoTdYaw4w6S?=
 =?us-ascii?Q?vAvAhlcBlYgo64PcCBolid88UYAqbX5a/qStVMRGh9YNohuYLiLXX7KUNhAi?=
 =?us-ascii?Q?XdqgU/D5itV423nAcJA4jaJQdvbE7J9QSO0PrSOfkmbiaRteO+FzvYfx5Lx0?=
 =?us-ascii?Q?A1kmI3HJqLfzshcJ9z6PRdhWcrBuYNYt/YgAgpKH0rfFKFEdAA6teb66LbWl?=
 =?us-ascii?Q?77yODUCs88wVCd8eAfQqKyWV7r+udG2IHsLm0hl4tdcUhuz1vu2ZHmH1C182?=
 =?us-ascii?Q?bF26rVjLPZ1ZvLwCmZjRe+Qq82qTPE4NK0e1Y6p0pUSxbd7QJACozkjFpqql?=
 =?us-ascii?Q?DjrxqRLYcjo5rb6BXThKO6N44CxlWvCId9jVATF2ROBrrJClGqvV8GQWeS1a?=
 =?us-ascii?Q?CYt8XROarw5sz9MRuGAb/u5sA5AYCdBvtZZvCk9HFlnAIxUc+aKK4rL7xcyZ?=
 =?us-ascii?Q?/F6a3lnirXXIWqQbEBymi5VREUXtvKOpUGUXla/cdPODne/wQaRAtUn26z8K?=
 =?us-ascii?Q?WAahwWC/ZYg5sAXSO98c0iAH1ywQfsnJVHIyPs5mpSS+yoJgB6rAMQRv2QG/?=
 =?us-ascii?Q?1r/J8rtzsbiYhTvGrBGxPpTZs6NvyjvmKe92FWb+ZbVsXbI38XXt5mOGmogK?=
 =?us-ascii?Q?ktgFiJ5mWaMulaUTUUzvTXw99MR8HwrMrKLviO/4nKchKwbIGhBQEu2j7bhU?=
 =?us-ascii?Q?7NkDry+MMZyJZ9XBBmMgGB+VOYVm+n6E9FEjp/thOP+NUSgMiuAcerM86Nti?=
 =?us-ascii?Q?Ox2aKbIFOXpcoi0nPARBBElk4RL3NOFWN49ar8TSChz8akdR9cVxshiGmDc1?=
 =?us-ascii?Q?X5RtGADhQ4T+BLBVjukVGo/X0s+fZQVUpp0H9xfM7b/YIH2qNnm0P6gWF8Kw?=
 =?us-ascii?Q?K6vYM+6nJA5LTfDEr7QbygmBIqjzDAkYk6ylbJwdv4BHQfWP1UWeaR0skrwn?=
 =?us-ascii?Q?Pga5mMjXbE6ExHRGQgSQOeOXBSN23otX/WTXl3VPJ/EOQ60pNUadU1ncnbF7?=
 =?us-ascii?Q?8o9VI0Gozc8AHPdAu+MYZZOFWfNZ4rvv06L6SJrN8i3dG7XQW3jV+Wszgtjs?=
 =?us-ascii?Q?4mWUaPL0P6Oc/39Q5RD0NBJ4QGA6fia4WrpQN4iSOBkhZdX+bx8jQiEITQPK?=
 =?us-ascii?Q?RE61OeUVxVvCskRWjugGlH6JlKPJXeh5RDW5q39VyfAT8TKBJhizVM2H6s+C?=
 =?us-ascii?Q?UoSoPr9bMIqksE3cmE5EyR8LrGrEnYFdKNOh99hInijOX4vJQBN8evCHeDKi?=
 =?us-ascii?Q?4R0XD/Lnd6+MiQhBG+4JzChJiu1xEdTBP5LZdnhMslVcG+MT17XktWxVBR98?=
 =?us-ascii?Q?hC+jMgG8GYFeh6Ojdw2v2QiJwCd02fuImhxFbR3FO7uUyF2BAKxOQfSpvG3u?=
 =?us-ascii?Q?ohqa2JGFll2YipzMTd3b1NRoMmej8wQQImkLjowp5LEjCcHrH2IhL8mhZTBd?=
 =?us-ascii?Q?tjlmEIaIg9rXoB5m9tJPPk0bHkG8pH0fbmqSYqd4p+zvnOprcYrENefFgmqy?=
 =?us-ascii?Q?8NXtefY47Tmp4SwRpW9PMA2yqFLV3xEkWENgPowkiTLB0t4jcqU0wadG7tbr?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e27b8734-8b99-46ee-37ed-08dbf1bd8e1a
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:01:04.0188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuWFxZvTMFuCn6i9J0k3ElLVS/qtA5KoBepCIW80R6N/Ejmbx4NxQdZUyrAZB2Wa5e97Mm9cvGbG0jt6YIri+68vvHkQ2E8aazPWXFm2f5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2410
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Q5128QbsUAxBhDNJX2n8Gw3tuiXdkRjV
X-Proofpoint-GUID: Q5128QbsUAxBhDNJX2n8Gw3tuiXdkRjV
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
Cc: Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function below is used only within this source file, but is not static.

>> drivers/gpu/drm/imagination/pvr_device.c:129:6: warning: no previous prototype for function 'pvr_device_process_active_queues' [-Wmissing-prototypes]
     129 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
         |      ^
   drivers/gpu/drm/imagination/pvr_device.c:129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     129 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
         | ^
         | static 
   1 warning generated.

Make it static.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311250632.giVEx7MU-lkp@intel.com/
Fixes: c98dab7a5f5f ("drm/imagination: Implement job submission and scheduling")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8499becf4fbb..048eba776cf2 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -127,7 +127,7 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
  * This is called any time we receive a FW event. It iterates over all
  * active queues and calls pvr_queue_process() on them.
  */
-void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
+static void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
 {
 	struct pvr_queue *queue, *tmp_queue;
 	LIST_HEAD(active_queues);
-- 
2.25.1

