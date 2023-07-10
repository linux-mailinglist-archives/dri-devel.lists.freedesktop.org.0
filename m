Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088374CA6E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B5510E133;
	Mon, 10 Jul 2023 03:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4C010E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKjrSN1ljoHwony/4/drYtuBqGdP5JpHPEx70+kmSHbTGcsp0Aauyoo4zqpJW1p1dDkJL3m5v6XBW1G1N0ZUjB08/Dd5Nn5SKFflO0jGZ9FUJlq9/9td+Q0nymhtYDsgGqZ5Qz7mNpEXXihlXs4LCywvVKmMj7uBbIgiCkJgmKEtOw/qKq/pTrrq1gpfpyvlk+/DDX5UqxFU0+5I2a3xhNpbIGxtUvCSzor9bqgJvUuEsn3h7Q2XCBh126QUJ9wKbsF+16A9TslyuZCLWQ/nUXzkFiaBt1CClXTmHEfF50vQ+kKkhtKskoW/f/nYgBeSDcIVqP7NsC/AKcT/5WfnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knzUxvGvqoz34bQk9/fazohrqw/Viy3iwwLrhFB7wXM=;
 b=BITkIyuifbp4Wx8WRDESKbskvpbosEcgVVtn36dY2ZGMWt2/7/AJggjPsKms69B+aK5Daekl5ozJvbGKCPYRWLt94JxpOBTXtxZY8VGVwyZhmS8T/jR705uyLTGHveBxX1VOc3+FdgqV4dX2c9tcspFO0pwGjxcxW6HIvDtMB19JXx6mxo4c1lrN3axzSDmgNvcJg6kbGdZ4U7Np/48Mu/YxEqUaDwruVUusaWv/3cRe76Xv7gvBXoZatw0YBPzy6qR/XXJnYZJxY5/PRYeLD6hooWMkQpPyiCBCQhYJcVah4Ebva3okK6slxkMe/XRkWAaVnqNEpgo5cXve10cXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knzUxvGvqoz34bQk9/fazohrqw/Viy3iwwLrhFB7wXM=;
 b=JLa7KM9BVQzPvVsV5MISsLENMYuqRqpkt3WLpOlauRGfmhlch4jVUeV/9iDC/vAqZpuX55fhMf1lgzytfgQWY4vgfYnvDrphFLhMC/RGV9DOuC37GsxDPWjZ34DsO0zM1mDHM2DwjS4nOAIWqz3fwQbMDsFOutIK65fF9KVWRnX8k+5exqldoAzPi0XrjDhtuq0lUDtTAtsffgAzNPEyMHFCWJXkc3coexXncdPKZvVoOO8ajAY16HM5nH6N9hdgOIaBVGZpo/zZ/GaW/2s3BXyygzosTZaMk/TJqaStXcNd6LanZjYTyCMrxU8rPKi4fEkhLEKu1AIFEhOJZisOrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:24 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 07/19] drm/bridge: analogix_dp: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:43 +0800
Message-Id: <20230710032355.72914-7-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYSPR06MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: afe32803-3301-435d-cb4d-08db80f528f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXIhxrmcB+4qckqKt+99vLJtN06VOBKp9liodZo7P4cbKEb1XWJCVnbjnkBlsfZkBNst9JkAqiuHR0OmVNVUXpn5DmuDz7OvYFnag9M/ZZxtodmjP824CjpFBpZheLbuxyU0wZZtmvAEyKAoh4nhDomMn+t4rlTq+FewVf/FHzew/2AC4eOPhAB1scYSC4JIKdvwzicxPQz4ktmpaQAHODWT28FMGmNqUHi2cyLwnTuutUrgcaIuG02H3VUjeJy2from1ilLz4fHrA13l1U6DFmxwO/kUFfIRpHdnoCKvhviA+h7u965tkMtmkAYAQVSRA7QFi/Qy7jXOtZcP8Scz+kJ+wwCMbwL8TnVDz//3Lxk8OVOFPYoYm032Iw1vVDfTVPmZXpRUSNh8k09sVh0xOsfPnviY8g/FSUk990D8FEw6wCgeulQ7X9NlKf8psZvIOZEOpgBBh6Vz/aQWbg8w5UrYFEUdhMDQs/gjGhbykRiLoy7gfhP0eRCKk2U4j76aQuep78SZadEytCbFycY+TqC2/RqjV7rFhUTKrnfWgiHRUP9qINzCYjUxVxKNiMOVFmbtfg6fydGSvVa06g+WYHNEfBCnk/RuMHXBdZl/3/wc3FQnkpNEVLHLyRjDZnx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(7416002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kT8oYoRq2KwuQlV+QKu71RcwOSvuLncCQ1Wi49rg+7kfXMzb99asmxtUrWwJ?=
 =?us-ascii?Q?qUtjLcSsn0bKdQtDh3FblZTUt3NIpO+L0XDrLTC1tDGpss7vliitNQZ6Qs51?=
 =?us-ascii?Q?HrCVlqwffng6VJjaXWBCvMlZwdM9t1eFlz4CI3UopklaAY1noCzUoGpUBoPU?=
 =?us-ascii?Q?yKPlsV92mfBAThOhrReK4PqE1X9sq08l4H3j+3Xz8RuH21+eh3UnsEc3h/AF?=
 =?us-ascii?Q?Vu78ksZYpvZN7JX7QS+/Rc+Yv+vOnm8qyUnA8UgbT3/UPfHhsRjSB6mdNLKM?=
 =?us-ascii?Q?jt8SxmwMFXgisd2ywootiBdeDwoFjKWwuLYcVCUyqgZIaP/g5WXJf8rv1J+k?=
 =?us-ascii?Q?oNu6hFG3h6audpzNtolxdekodGpFy9LmzJrIbzKpT/n5R6Cy9OPe8ht9/6q6?=
 =?us-ascii?Q?P89D04//KcSZlBULwEgetCMk1DLV0Jfnkp1IEJd3oaNhtCxHoufGD7/9G9wJ?=
 =?us-ascii?Q?yofjg4E0scesU68FwGqM/IYVXaNxbBluSi/O4xQY1QIh65d+eU+NbJZmSiyD?=
 =?us-ascii?Q?RvIsrm4gosMIQoEQ+aeDeXQRT1ZwILZIWd/zoZWKLV8Fhh4au8FYaZV+8qLy?=
 =?us-ascii?Q?Ny4WzdfmR/WWMic5xkpNmz68g3tlrxG8hCcPQEK6Yq0sxdLxyj+0mB9Ofav/?=
 =?us-ascii?Q?4jMuX/KOJqZSeyNT9Cg7Rin1Pm9N1qzd+D1iiLxIEHEEawgawz+QKdoucdcw?=
 =?us-ascii?Q?PO2K+7vEcrfCnkY5OGLK3iRnGrd91YALA+3d5yhHMRYXFl7udiXm/pVuhf5G?=
 =?us-ascii?Q?bU6y2mdmY2oRSAp8CogzyaYYSV24ZD0liTPUfDW5qKu7DoSY7QmlolEqjh3l?=
 =?us-ascii?Q?f7gXIDpGn3ueN7xRVPtkuhrgwjQGsxIo9aiqvaS7qak6imu3CQwQCz3nuSnF?=
 =?us-ascii?Q?vIOV1yue29nukvOleXZxdAMkrpBZFBLgZWvNUkBenaMP3LiClqinCTNdgjnj?=
 =?us-ascii?Q?6/UMYDxGfEnNoH0jRb3srk5cuopo5mAZj08YO6f/nrOpL+L4CL+cD4ocD9tW?=
 =?us-ascii?Q?t4XqkgQMPMLr8Q8+z9e7cgMTJ8mg+2PepAicpf97Tqeruwy8ZKtICk0HLj5/?=
 =?us-ascii?Q?cbHpQFS56bkfs61JNGv+oEzjSIR0CcSfjAuTArmq/iHSs1Gf5u38k8vVFlxZ?=
 =?us-ascii?Q?7zu01l+YxncapADlC7hH9dJCrcLboUMLIpZ2khBx6/IjP80XwNyyi7T/ZFR+?=
 =?us-ascii?Q?58waDmUOLkjenCzK4TGU+il1z95qnULuk+XACk/44zFiBSKe1F9AX+9PDRx+?=
 =?us-ascii?Q?a9w9KlTo8JxcrbNoCHSkcQO2QQmJ1G8QOiorxeAv2RW3PpuGw19uIYjmJdMV?=
 =?us-ascii?Q?uj6wjJjwd+/VNAyRTov7CkOCFJdF8JdkZNgypcc048l2PSozLaJxBsAW4EPU?=
 =?us-ascii?Q?Pq+PFSXL7AS4xu4uUfZT2B/jyTPXal42dOcqzrCfayQj8c71NbN9FaMH+jg7?=
 =?us-ascii?Q?T+4CcWEZznxttjbN9sJArEGZztfMW3VamTlLNq830PbO6C+8+tu3ezh7Jg9Q?=
 =?us-ascii?Q?70QOTWx6Ufi+KwfD94kUP4mQZmwLh0fzIoTxRf1arT4GWSIKbVwNyN4IR40N?=
 =?us-ascii?Q?qBOsrUq9kUgCSdsUl5GpPSIwlr//3EWrQeyDaPTH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe32803-3301-435d-cb4d-08db80f528f6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:24.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apnW5bYV3awwq56PZLQiEG2XGsJdFJ058oh35nX6ZhvcVuayc2Hki0fRJ7XK/KwMtiB5XeTU7rXzPO25e7gQ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6472
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index df9370e0ff23..c6b228f1ed4c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1686,7 +1686,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct analogix_dp_device *dp;
-	struct resource *res;
 	unsigned int irq_flags;
 	int ret;
 
@@ -1740,9 +1739,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	clk_prepare_enable(dp->clock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dp->reg_base)) {
 		ret = PTR_ERR(dp->reg_base);
 		goto err_disable_clk;
-- 
2.39.0

