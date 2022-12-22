Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511865496A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFC410E5C0;
	Thu, 22 Dec 2022 23:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5082710E5B6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 23:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7L5RggvF/ToWbFiOedQvns7Wvc2gRZYGsbx1Qj2W2C7CmxNZtKbZ/iLr35UAsz+bAnUXwCnb72Fso+2Xz1kjmTFcfwAjLgl87kNh9M+h2rkZns1jHXSBnhFtM9nsSC8zMANA8Ju0N7tDek1sIhc73BxqTcduH1dR3hla3JVScwmO3+G1ctf4SzikOLHtALcbX/HWWDl2FagzxhgcEPciFphXTMKd0Yqvv4Q9op1rQ08ojvLsJ7y8VtA79K59HmFMXSaZn9dQBj7oLBt+udQ64nePS7JHJluRVx3NmYV4pgHYqGqJr9OVtzZyOzZnzFaKiSIMP+vAr0cmxpJaM6d5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9CZ1+ALbr/efkgZ6RjqeomdSWupx+pYu4XExJ+22ss=;
 b=UMOGcq0zfADITvs7G/chbYVWPNogRtV+KN5hFeAkLMwSM1jLg9tG+1pd1x2tgLj4CnsokP6SpNLfX5OEJHaGWOi0NkSMj/syadc79Euz4vvOLEKhmh6lklsbN9lbmAbHIYPTVCuYlZnnrez0EPSwSjf6U0aG3hnQuWyLi3POtIKAJj1Y3qTgFL1Gt2LJuZXOXpz5Z80UmWbq6Kzq551cyDw9w1fHLMJ4ivJZjVpNMZ7Mn8oj4n8X6jePWBw/Yefojmnx+XT9hsX4kb3mTJOjI10eN6yO7c9NcvlXs49uz7gMIie54wdQLO1kGMuFkQRtHgXhy5Ihe5Xfjd3iyQzW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9CZ1+ALbr/efkgZ6RjqeomdSWupx+pYu4XExJ+22ss=;
 b=wexo/B5dT3toJlOyXxFtx7t1YvCpbkoL3kot0RmC4G8Dov6Y7nE8RAn46d3eN+nMfn+f3gD+tyXYD42EeY0EXnyfxRD0eZpi1VhSPfp1kB7ygBfa8CUGffO3g3QRy3twZ+ajxLFl++n+A3NzR5zVGjuLokqZp4J/TeQj+a7pULUQKJlO5XNZlD7sHKVzmQJeuYgAu80rgdHX0M8872HeUMdQFaoHGs1KYcgKjEckdBrzoGgKM6ENJL/H5arvqaVUeM0wNjkEPwhC+Ob7VfdOlNtrBvpy0CkSe00SUl+pSTGAUEzbvK/6d7J9CCh20hIbA7i8cfzcZpd5/HxadsP2YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9100.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 23:38:17 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%7]) with mapi id 15.20.5944.013; Thu, 22 Dec 2022
 23:38:17 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] component: Add helper for device nodes
Date: Thu, 22 Dec 2022 18:37:57 -0500
Message-Id: <20221222233759.1934852-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221222233759.1934852-1-sean.anderson@seco.com>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS2PR03MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9e61e8-3a39-4a61-188a-08dae47599b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+F5X3ibdASRfMs+qUYtctW9xF7jevC4+Q/iL5DS57JYX+zFqJ1wZbGYFbSqTzGwZ/1NxEhKKW53YNBk7bOrpbeB/IRQa0bMENLBFN+lOiExAEPfC3rMIeApJq0iClKYwBmtECz/Kuj2aybGpGjLrHBNHVkhMAm/u4ZlWA5ov3FhWIj3JNBFQhJL82KSu7wFe1WBjix282NgcdA0llOwQng9lZTbuU0PPHaCfri3F0F/u7GElirvq1VISHwLPaD064cY5vC6mhzJopT0PU9yL1UTzPj2kCm0A6tYWj4NPvTSJc2IB/tZyM3Fj1SYKBg6cQsAf3zGb6p+7Xr8JTixcaf1zUkiDipSd0ACsqo+VXAq1d6oe2LwfcIObU7p75eZwzNVfT5kHDVn9YJy7jY+MdiFg6TCAU5fRAUOPZq4CBhHBUa56CCFIlyx9gnVfMtShhMNAiuZu0mcu6phKVvIdzUxfoPxgzhzbJz046AhBIc9+kmSjyQ+LOk05Fh0imBfd37CVmMZXKktNUamLUr903D7kUvJ8387JM+qbrA0dfytE+AIUhYab7cmTjSXVxlPdkQwDHLErhyAeYGtUne9ybnIQyYofCY452UXa9q+CLcZduNFBko0ZTWbsO3Xluje/J7tqp8W88x4Dx9K4f3XWVrtFXT25Xi3Oq3xM02jaN6icAYgiAVtsGu7dLfOtjLaHmm4TZfEUvDh8rvv18F7HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(366004)(376002)(136003)(39850400004)(451199015)(86362001)(36756003)(110136005)(316002)(478600001)(38350700002)(52116002)(8936002)(44832011)(41300700001)(2906002)(4326008)(6486002)(66946007)(66556008)(4744005)(6666004)(5660300002)(66476007)(107886003)(38100700002)(26005)(8676002)(6512007)(6506007)(186003)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HcoNNo25drsB6ZpW51emxNuDVri4NnLksNRscktv0/OtVXvvEp42CVQoA41T?=
 =?us-ascii?Q?qPXGLnZ3UlYPhRkC0ZX4J8UaZfsjMFOemmaPHHrRiIVBtl5oM5vg1arqC55f?=
 =?us-ascii?Q?UsTY+C9mPkL0NDi/DRrsMP79WHs8BZRMa3J9bQEdA/wRCGx1WywkP+B4Pr93?=
 =?us-ascii?Q?xFOotxewCtlBMl8LetFzXAPFNfS3Y+0Xs0Lx4ptVL2gyzyTm2y5/xgrdOkT6?=
 =?us-ascii?Q?Hafn9bkUAd1DPiJtTN9QDjLalumSRXmsKXo8i4BVRpY/Ar/WXB11TTdspl0z?=
 =?us-ascii?Q?N0O+RVNEf/RJEF7suyh5ziyxIJ7hBtfGD/rIUWAWt/P3WlwfBOuC5rWNwpxc?=
 =?us-ascii?Q?WEY0anw6Tbed9jx4Etm6BmPu84J6U+zZpz/sTKuHti65LZMPGfc6QNQhjkiQ?=
 =?us-ascii?Q?RX2k0Flog3FYpOu85C6gdDWrVrpLUFLkIpWy2sMz24lAUcRUTfXOgbwMcpfB?=
 =?us-ascii?Q?SFgPke0XeUKRg3Onb+VHQqfjyHoIEPZQRWPj+V4MSZ/MgETbvPzHXsTK7UYu?=
 =?us-ascii?Q?ylK7k2gGx/t+ojNbxGW3OT0dx4Z9SumU9eS9AfoEdblWvXs+YgrRTMbGYqjS?=
 =?us-ascii?Q?Cmeo246E7f1so+8l+hkhjU2MYtBtOtI2invFQ1anYIQR+j1n+Bifq/KfJibU?=
 =?us-ascii?Q?UIdoWVs9BDHmfVf1pB8qiyI+YJHmnI0QwpL2QStnnftRIGORNIcq+0eiQ20N?=
 =?us-ascii?Q?RbHN1illiFUa7fHWc3qD7tbUH9Lc+x6zsKRcurCkkiPXGE8OuX1KdGrkq2MW?=
 =?us-ascii?Q?r2NWFWcJSo+D1a7vdalTluCsjt6nXbcqAh3I/MtXOQhR1I5AIAQ+rvrS2xu6?=
 =?us-ascii?Q?IwdJsbXQq2WmHN/i7T0SJzRwHaMe7BZiBRNfovlwNCAKJRrUnlnzK0lEaX90?=
 =?us-ascii?Q?03SQDuf2e9oF0gkE2ZHUMi44JC295lHRTZJfipao6rvL2mo9GV2tF9sE+GCy?=
 =?us-ascii?Q?QVHibFUKIv5hw6AhC4m2jaPC+XHWYJSBw8X4oCylXgLuLoW7tmidSotjVEk8?=
 =?us-ascii?Q?Z2yWNjZzEF4dZXm1/Racox1mfSQ4QT8/04J4kM4D2jeLeoIE+fTiNWLmVQd5?=
 =?us-ascii?Q?fTjORb8BFjuJ21vdsYMs7l00B1ixXBZNiWF730BL/M5dnMBxUV9r3bBVsX7K?=
 =?us-ascii?Q?cRzRLiHnkDW2AIwVQ4YEbkgCUtFhO6DtpNIFCLC82KHHY+BJRJ+kZTNoyeBq?=
 =?us-ascii?Q?6t0as70p3vj3G3E88z5WD7KkwfOV+PLGoJd9x/PWrdjbcEnnpszLk+7CdPwz?=
 =?us-ascii?Q?IsBK6xaoB9M5kLvhTIwEQFXBEyJmLF5g7g09q7/wAmaAmpVatkoBYgOT0KTu?=
 =?us-ascii?Q?wtqWQIX5zc5f8LG7OqEhgmlvAdNn0Oc4/DmWs7gtyFMAtzHHSgkt0rnZomYj?=
 =?us-ascii?Q?GadOtB2oWLxF4unqO2reUigeL9DWwgsGWtbexe6bPMI/DBkEnX55r6Hzvh6y?=
 =?us-ascii?Q?zwq5RUxgrRlqm2mcd5yE7vkucwGe49Hq8PFaa2FsD2NpAW7+ooD7Kz8dajaX?=
 =?us-ascii?Q?1Ou+okdfTvmddHJEHE6lgrCXd3Fk+GE1EP6uQtC1P4zrzoEnk7hNUuxbTQ55?=
 =?us-ascii?Q?IsSBX14omg9ajU5tjyQAZdHw6Q05J4HOfFeUIRGaUI8kd3u8NDAyQEn1Lpok?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9e61e8-3a39-4a61-188a-08dae47599b2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 23:38:16.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vFlrSbeMa5wfkk+nQz08dK5se0ZZ/Sdg0LojzjjVKjP6t2R2lGo0RuxXCzAQcHxZWaIitLWV3s8X6AwRANqmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9100
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
Cc: Sean Anderson <sean.anderson@seco.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a common case where component_patch_add_release is called with
component_release_of/component_compare_of and a device node. Add a
helper.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v2:
- Split off conversion from helper addition

 include/linux/component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/component.h b/include/linux/component.h
index df4aa75c9e7c..fb5d2dbc34d8 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -6,6 +6,7 @@
 
 
 struct device;
+struct device_node;
 
 /**
  * struct component_ops - callbacks for component drivers
@@ -128,4 +129,12 @@ static inline void component_match_add(struct device *parent,
 				    compare_data);
 }
 
+static inline void component_match_add_of(struct device *parent,
+					  struct component_match **matchptr,
+					  struct device_node *node)
+{
+	component_match_add_release(parent, matchptr, component_release_of,
+				    component_compare_of, node);
+}
+
 #endif
-- 
2.35.1.1320.gc452695387.dirty

