Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C32163D1A9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0867110E437;
	Wed, 30 Nov 2022 09:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C113410E438
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn3rHK+OtKkuoGm6NiKR/kPMHVY7FWzLXqIu2C0U+Uc5QQQ3sBbXyXYRAxdHcDVKeRUI9MUVTgBgdBNywmY/ww1bM0gc7CFzSOvJWVBuixRK3pFhhYLZ8+4rriiXBCe4XSqIAV5Y5D62e/cmvPc8CeRltVIQ9Vteg4uGJMmZvHhwBIWQUobM4xav5fcJs8j2zN90CVKTsqbXhOn1ZZbuRVGH+G/7mIsOfWTbFp8zF2b5sQkYtQzjU4QHoAqMOu2tT9WpJxK2LBY+HsgVf/RZoCLFIkTtR2KPswU5Xr2N+e23gZwMyXOa4qXaDqBBk08XQ1tGBFNMSMqkXz6OG5avTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhcLVcuUqtxtsbfnHqCxtS9G50W9ouDoSS8xbVeFTi4=;
 b=ONviR2CLRMlS+gmRSjH1HklmhgHvifJ4blCEboPuAY7Qj1aDSzjJcX3oCaSOa0hy5iEJIE++2L0RHhpb4qEIxncr24WRJleMNGAo2fynlP/gE1E7B0r0gZ5Q/sPJgrv5Qzjj8JAYnrDLgYGN913p+mrHd4tKtRHHomFNKgJZ840c8ir0CYyRtR2jUhWTDTgn/UDSX8ot8B9cGTwdKdaWrifPCkkK7xsSWHblkYWam5Q1gCmpi2n5jc6GBLwq8IlsMCUUNPCHkWvB8T/dkCXj3N13nrZ7V8pzjEJWRg/AMiAkhY7MLFHuE5x+brt5LgecNS8dPl/SfW3KVv9BEs1ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhcLVcuUqtxtsbfnHqCxtS9G50W9ouDoSS8xbVeFTi4=;
 b=h8fRt//dIXHx5TFH69xSM+/nHn0YDHKfSkC01rZNthyHgL5lr27ebfO77RnOZ2voeDW26VJVTEQFYTfgv875YarpLevKk1Kr5G//U+Cfwo2WgFaG1iDFGhdIsjI7E9wCMv6lUdxG9CL9zoJhvMe4Q5B6U8gVexYrccyMMotu2vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by PH0PR03MB5799.namprd03.prod.outlook.com (2603:10b6:510:34::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:22:23 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 09:22:23 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] Add pixel formats used in Synatpics SoC
Date: Wed, 30 Nov 2022 17:21:47 +0800
Message-Id: <20221130092149.102788-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|PH0PR03MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de05845-7803-4fd8-56f8-08dad2b46320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyfjJdfBMBKALq4AOoHe779vWrnKxz56z32r8EkaeTnHPFN8WOfblciJ3f6TyWwcy1C1pdByt5snZjepaTRMyw+kagcLjuS3JDVzcVvdeWamOg8bvcS+7a2CGZYqVvG7yEtOW3t/x4JpRTqwlKEV6mEdIblXJgmF8AddJfssoiqRK7MifSeNsyjijjJpCzV2cPUguSUcyuEM/14HWp8ReF6W7RzepwtpJraWSOCFb6+pc2toQ+jGRZMJMy6HhQKWGL7SFUlV63XDa8+0ESYv+qV0+r+jiTmr4aY3xHakUqQ6rrFhKP3twnNI7rqrYd32Uny5Mfeb1cBvXD6cWbZuf2gaFjTwlMGu75hWRdnwr/C57p9Bvm6OLztl9K07Fh5MPlXfik7W2fvKpFaXymlrp9WVMBzeDuWQvEiyOFK4P6G5KX72SiOHOAi+9JAQOns2Y+TUyfdqvXrxkD6pMN6I4/MNSxvpxydmQoH+uvz16jz/yrLxWdBdLFNeX7Nfx6uOjGo8QcNjZMstxugthUmcCADjJynjKQi2JoVJqZWWuYvwuR7ZlNAVWT7cGB/iyQcdeu0Rlm5YyGy5UtQpWH1rdBsW+Z5qK79RDcWTKUz25JLh/8vnVjiJ64sInPp+Z7k4g+UCiu/w+sxvwEkqLBplS/6kZXFOEhqneQdZz+jyiXWplmwuQHLgR0pOFb9JXEdIyAtVgwy5NYtgPt9MWW5UVbhPXAj8N/YYVmo11mUDAYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199015)(316002)(478600001)(66946007)(36756003)(2906002)(6916009)(1076003)(966005)(6486002)(86362001)(38100700002)(83380400001)(107886003)(6666004)(38350700002)(52116002)(6506007)(26005)(6512007)(186003)(2616005)(8936002)(5660300002)(7416002)(41300700001)(4326008)(8676002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vs7uvlXieJSoYddchReRBWtuWJ/ZhBZF1vesmMc9reVJcqalX7ScSYkM1a6o?=
 =?us-ascii?Q?1ABsZvpktL9j0oNRdV17wk4rYEaSezixqzgTcg+tS+KJNAnN92ENJPrXJgdS?=
 =?us-ascii?Q?RMZ7VdSQsNcOA0gtBvfjaTRNMEyZQ4oO/AHjcVmdfBg5spgkXRKRKH50qdBq?=
 =?us-ascii?Q?GGLa855lr7MreezPLoQw0Trm+PBKoa7RvMLkIrQyvkW5+zQxmwN8MikoiJeb?=
 =?us-ascii?Q?UdJuAakhFxY5pucPHeLQLKVlpoA7K1+CBbFWvA3hBEzJy0f6B0ncitx6Tsxt?=
 =?us-ascii?Q?q7ps6KKyeYDCP2WPPilLkuRLLqKcI08OsJVtIFzOcGtvlpCPGBK0F/uqr5vH?=
 =?us-ascii?Q?SA3fzo9/G41UhTr0uaPRROpapetU6KHGLfx1nZSTD5K/kmskzQxgNQBhujW7?=
 =?us-ascii?Q?acj0Kjx2k1smGpYOxVdngw3dVRQMNMUP+8LUaMFe+HCMRryNW7dBCdqCihMu?=
 =?us-ascii?Q?xOyJ5oCMDsjIHw17eFq8gULgcqtpOAYaE8q2T1t2g+gdQvTdAO7q3MFuZR6p?=
 =?us-ascii?Q?zbMYA7k7ZNgL7Ikvpue++YqgSZfWLdOrzL2LLVoUwApd9kl8Y4Zm4mvsPg5E?=
 =?us-ascii?Q?SWKph7JNTCKO15bwQzy55hUf12KKAst6RTOXzj2OxMXPB52PcJ7pCh9p4+Ww?=
 =?us-ascii?Q?Td5KgChci6DuQlY9/tsbOZKi6mOPcygM5Wg+DRTP1jwBrkywW6waLRYwimna?=
 =?us-ascii?Q?r/+rEBilvtkqzsXEOXx0l2uYX79hUTX8rRtqwmjeAR/G7tsEsYTdqLEfjkP2?=
 =?us-ascii?Q?9LeVXEjQuGx0rg842zchhWXSMPzLUqLpjs4gF2iV9FWbL4/BEc/+65otGZMy?=
 =?us-ascii?Q?5ivk0JidPUdf4hUov+FEQNhj5lfvrbwHZ/tZnFyZd3q8qTFL7o2nPRgogapR?=
 =?us-ascii?Q?S+7XCHn+6lqiw6ZyKglXLWz/ItPaRy0nKk+iOIilAZpcGSV1unYc/DuoA71G?=
 =?us-ascii?Q?l3NL1vTPqcq80VU4dyOgn0vZeQPHwHZRhiYZ5wEb+fMTQhaOfw8sZ2KYvqDU?=
 =?us-ascii?Q?62y7SR2A/kG64nDJOVebrIxwfSDYh3WcGQoQEFQAY9PODkek7iyhxLDEN1Bt?=
 =?us-ascii?Q?TmcC8hKDd1gDS/QvTJA50CPE2PPVJfEcU7n6xCAtNe5vzGwMUhQkiEg0iIh1?=
 =?us-ascii?Q?z/KLHodZvMSBbJY7qaicWFupncrGrL11I2aNnw1dS6cZkhex8ka71zcEA8Mt?=
 =?us-ascii?Q?2LESDCE1HgNlk5JBY3FwcWE8osZ3BKSkIyUWbzQqc9OanOIBoj4cyXupex2N?=
 =?us-ascii?Q?tAKPBR5JAfH9A2KEz+gs1bMJIcn6dg7IcGZgeVSvysAjkjj0wZmWFNlHNvT2?=
 =?us-ascii?Q?1D2X031mfPS6MCdVrg74o0y3mQMDKgrYAlwje+hEmPRIukFMNj/djgVbR4Kh?=
 =?us-ascii?Q?jgYbiXbWG6GFzP/thRZWqRvSrkpoTGCbJjU1Vh+V58GBN5cP/UFsqz+TpSgY?=
 =?us-ascii?Q?sWnNjIcJmiKXWBS4kLBRyjnlV8ACQzHopaTsxLBkAqoIGaleGxvY344qZU7g?=
 =?us-ascii?Q?DseE2ebqjJy+QNX1x4TMLhx1WaeG8+eRPOE/CtSBwf84bSj47dIQca0CAatC?=
 =?us-ascii?Q?kq1YN1M/fSjve7X1tgTexATxSR8p70f3dl0KuZTO?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de05845-7803-4fd8-56f8-08dad2b46320
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:22:23.2007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQo0zSjper/K8nuYI54jmO/l+6ahddrvZiedSpV3uzWiTYnO+hxXIsDV6cvWgfLFJIvHDDKw9Sm/4+ssb5QlHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5799
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
Cc: nicolas@ndufresne.ca, sakari.ailus@linux.intel.com, airlied@linux.ie,
 ayaka@soulik.info, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
 tzimmermann@suse.de, ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Those pixel formats are used in Synaptics's VideoSmart series SoCs,
likes VS640, VS680. I just disclose the pixel formats used in the video
codecs and display pipeline this time. Actually any device connected to
the MTR module could support those tiling and compressed pixel formats.

https://synaptics.com/products/multimedia-solutions

Changelog:
v5:
Moving back the document and rewriting the description.
v4:
Removed the patches for V4L2, V4L2 would use the drm_fourcc.h .
Moving the documents to the mesa project.
v3:
There was a mistake in format macro.
Correcting the description of 64L4 variant modifiers.
v2:
The DRM modifiers in the first draft is too simple, it can't tell
the tiles in group attribute in memory layout.
Removing the v4l2 fourcc. Adding a document for the future v4l2 extended
fmt.
v1:
first draft of DRM modifiers
Try to put basic tile formats into v4l2 fourcc

Hsia-Jun(Randy) Li (1):
  drm/fourcc: Add Synaptics VideoSmart tiled modifiers

Randy Li (1):
  Documentation/gpu: Add Synaptics tiling formats documentation

 Documentation/gpu/drivers.rst   |   1 +
 Documentation/gpu/synaptics.rst | 104 ++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h   |  76 +++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 Documentation/gpu/synaptics.rst

-- 
2.37.3

