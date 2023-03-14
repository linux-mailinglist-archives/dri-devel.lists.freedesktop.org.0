Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604196B8AC6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 06:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BAF10E706;
	Tue, 14 Mar 2023 05:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2055.outbound.protection.outlook.com [40.107.241.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF9F10E705
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeDzBi5v94aKQEO4FrCdef1lCimgHwoyJr9I3jeR/kgveffkBGN8xBw8xTanV1oW16Cypkf2JSWyxeUqPgVdmPmsYq7Gg8IB3Pezq8Dbk6d0/QCo5VzXzQ00mh2ht9Krs3/iNYRTba3MNsNRhmda4FMJRAigMeopOrL4YjYfrXQ6+HJ3z7lz2FizTEYBNBh11sYQx7xl54FRuX8dGVV8EIza1jP3SJXNmMdA1fkt0KHW8bK/wowd6AH8QLiu7wPM5hLb+WZ/VjVa1cXh8kzFONiP+6FuytGIZU0jBP3haquHnj95qeXB0l5keRQu+d1z/qKnnUjOuzT5JwOSFVulJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxiO69OSIwNAaJahyZhLfcGktfUvJ/Qc8v8Doyii3qs=;
 b=CDVQJqT02lCXo7/DlnXqtHDHEJ56FeuSunDIiiu/peYzyvxf5KA5NVpSYbyKC9GjZzkxVaNnupYqwaw9E73Pw4jRvB7wwkgZ+IhwFTsroXwtbPy+TfIaH7GPcGbKrmwcfPIjQF1b6WnNIu0bW50sH7obWrj0WABiN/H74mE9wmkjIWOT5BrXAk+3q8O5g1PFtro1yhyuzhM1as6B0nMQ8aCNXUd0+A0V8MDTOl19GDKVO1x5JO5kf0NukFAeSpxGgMWPeQVQ+cRSGi6zs0vl8rLr4APPlFyz2heeKbLoVKRWmaRr0FKbuZtSscaEcG1C/yRFfY7BBrI0vqTlC+a80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxiO69OSIwNAaJahyZhLfcGktfUvJ/Qc8v8Doyii3qs=;
 b=EMdX7zQIkaa0zASTnw/j0HY5F4yG0C1N+ic/pgS5ep1Kej5STHU7g6PXfsW2AUeHmi0nBYarB+jAALe7QzyVbZYGYgSKzQD7KrC9hJ9YQS9E3f6KeL4ZZPy9K+m4QG9hZG/AExlb5CqkeTlUCbj6G0urqsuHHUSdt6yGwP/rFvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7709.eurprd04.prod.outlook.com (2603:10a6:102:e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 05:45:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 05:45:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: Fix returned array size name for
 atomic_get_input_bus_fmts kdoc
Date: Tue, 14 Mar 2023 13:50:35 +0800
Message-Id: <20230314055035.3731179-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 2457fd27-f83b-44b4-9895-08db244f5290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLPsQT69v7ah//r+GYmC6qPQMieQGgPl2DTt0S8pTAsozL3QphnnHU4nLpp8eQ/Zp/zcOgJBu8efxdfbBJddiY177POxelCJy/yVbDu6xTPxh7FesycgBpMfV4cKDQscXC0d4iKeodAM7sex4ZkizmmzmA3wxBB8AvavQpuF7og8tC1aLX8MBhn0rv4/HEuTQfqkdnsuVNoHBtpRxIJ9/4fz8a1rTseE66wgZNvyrZ3cYrXlFBzvWV9qqwVRlbqdkEUqf6UzNY2AehyYHJnXwL5QeAp+jkQZE4l2fdng5m4rrfkaEZQbXfH2o804/zTiTSqMYHCkR1KlMjXaW751Va/fLLDUm9jDBZO7vqiS5lfng3rQ8bnFjSxMM/buT5qEmn8hdlmp25qbL0DjnTXVFe3i0/q/EsdKx6F1d92YkKGGT/PbGLqohmM67p224++EGsITRdCPd51uBSDJpZQHTUWHhVURBj7pC0MVKwxzgWsxZQTky1jpfDT0teQV+vOzbbu4VOPYQfiGi4cNQ8vyWoF9OesnNowi/X8BPY8efnnnFQLmc/YdTYu6a10zA7LPpCXFnFVy01Ec9IC7KR8FfjWTmMg9Bhz0TYfv7UmyewXcokY0exI9CFkcDs2f+Gs62SAJSJ6J0Nvqq4Wbl2FMfW5p7gwTDMEBt1jJzgbNQJ7z6i5XpObI5lRjT1QTbykmXzszAkxgGz4Es+2ihFfctQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199018)(52116002)(7416002)(5660300002)(8936002)(2906002)(38350700002)(38100700002)(86362001)(36756003)(41300700001)(478600001)(6916009)(66556008)(8676002)(66946007)(66476007)(6486002)(4326008)(83380400001)(316002)(186003)(26005)(1076003)(6506007)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G3887gTAPmjfP/P3RckvhJ5EvT6t9GoXOIfP1QeKpienY06EKfotngN791Pt?=
 =?us-ascii?Q?lAZ3zXSVneuZVmAWGtKanZM+YaUnCQ4mqml10ojgoiEcSqRKIG+wPMxBoIsM?=
 =?us-ascii?Q?CpDtWaVU1unPzdH2FFsgcGIAyds/SFJQxJIhJX+LKHqn/KqJrVXX6HAc+G13?=
 =?us-ascii?Q?IJjsH10wZGivXShrAESw64sLc46CkbdC1cQ9P1oMPACK5suOc5iFg7ic9yDA?=
 =?us-ascii?Q?0HXiuUTrlvr83OpH5H1X0UUkPb5GLmNEU79fyw3QFS6jYnscEEDiEpJoU969?=
 =?us-ascii?Q?itBcWc1aQXD4mkR5BaDloR84/LaDxJM6JEJgNKuDkJ9IXupYSCfdXVOyudWl?=
 =?us-ascii?Q?pn9H4gcnyKC7bTGeg4qnLc+braZvRXDpL+qHCWNU0jMx/Tbc5Qh2xICqNk36?=
 =?us-ascii?Q?TJR+T7BQ/CUTQ1PWIVHusvgk09fENxH4vgL4uND+SSVni0TMGGDqQ/3E4/4y?=
 =?us-ascii?Q?XfHYEXH1azzD968p/2l+JHp0GSdtCld6IDWgEc++M8zDk7ZF/zkWIguRY8aU?=
 =?us-ascii?Q?PnJ1/jG0GZLi07m4HVBO6JYir5UKHiXDSLDuspDEWFv64Rzb950dcc/+Y51b?=
 =?us-ascii?Q?Mj6cYK6+iS+t+YmgkiMy9yThbYjhiXyEYQFmeWqRBeQNwMhBsHFfLMIvlatR?=
 =?us-ascii?Q?cqJBz2iLIqaxy5uxA99e+v+CagvYYAOchm8CJmGK9L+G8r10aQlw5EXDDWGb?=
 =?us-ascii?Q?XKrHzj2xQq3kx3ai0xXfWsf10KI9bcbFF/J80Iehalwc318r9njnsks14zFL?=
 =?us-ascii?Q?/hbea7Uvjb3bSZ9if7OWHfzmQ05gLC9jBjNmFENO43tnlqT87ojB2jav3FdQ?=
 =?us-ascii?Q?LhpAsj5ZQH+CcM1aYOQToxRs8lY9qtfTA9lfVdDv1mCBL4n34sNragiwQhPf?=
 =?us-ascii?Q?lpVYoZi4FyfrfxXIE2YKmpNwEqkWj6VBPsvBcj6bFlekAP+37c16JiLSV3dR?=
 =?us-ascii?Q?SJqcOchRuwT18wufHA5UCEOKAX58IZ7Srp+kQHCzpT+V7q8W8vyydgXQOQji?=
 =?us-ascii?Q?WJ+2TiYeBs6Yb4yy/zb7ogVgROWQxIIcNeN9F1GY7VdqE+zO+idahqAz37g7?=
 =?us-ascii?Q?YcQIXrUwtt1iqCtR2omh8b4b5seIx5NWAR1IzWgIiuazTI1c/RFcL7ORF81C?=
 =?us-ascii?Q?Slyq/HCL8+6Ic9UOsxyX+7sYqWHVfyRygdVZdAVLj44FJsihnC1cfc8ADsjb?=
 =?us-ascii?Q?uMLJ3g/d5jgP++7sxvgOWR3cUxoMAKM8r+oHL2tTIvnGybU+NVxxWVjXJhEp?=
 =?us-ascii?Q?TJxUc9swdmA6yifkYE3oiloIyC+esufJByK7yY2PBEKZkPpA2l6ik8QU7dTF?=
 =?us-ascii?Q?T8fqzIPUYry3NdwvzDr5H7nHivCbnZMDM1VT0HJfDnXHznDvvKsTN3FSrWof?=
 =?us-ascii?Q?xS5LDJ0x9oJdIlAlzGH70hrqIDUSQz59e+uIHabVykz/8Ggagw/U6sMYtoRH?=
 =?us-ascii?Q?/hjfY3/nMA6QjZ4BC9vfALsEoRGja9zcSyvO9IfdUC9MmC8v1LE2Q2vfhqqt?=
 =?us-ascii?Q?N6PsilTgF1zCQamscWQ8ojH551NsaB6WwB6qQO8ncrvn9t1rOHEEzXDvjLhN?=
 =?us-ascii?Q?S8e1mAxAeSgng/FhxzVOyZXJH/W4CH1Wpiq3+WBA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2457fd27-f83b-44b4-9895-08db244f5290
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 05:45:31.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InfTNxzmZpgqkPp6ouI3fu/hcrGH1VghTjLHCrJyS3VhXDaB2jJu3SKNRszzPm4IYdkleAWxpL8HK5AWNZkNTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7709
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, boris.brezillon@collabora.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The returned array size for input formats is set through
atomic_get_input_bus_fmts()'s 'num_input_fmts' argument, so use
'num_input_fmts' to represent the array size in the function's kdoc,
not 'num_output_fmts'.

Fixes: 91ea83306bfa ("drm/bridge: Fix the bridge kernel doc")
Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Correct Fixes tag format.
* Copy DRM bridge driver maintainers.
* Copy Boris.

 include/drm/drm_bridge.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 42f86327b40a..bf964cdfb330 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -423,11 +423,11 @@ struct drm_bridge_funcs {
 	 *
 	 * The returned array must be allocated with kmalloc() and will be
 	 * freed by the caller. If the allocation fails, NULL should be
-	 * returned. num_output_fmts must be set to the returned array size.
+	 * returned. num_input_fmts must be set to the returned array size.
 	 * Formats listed in the returned array should be listed in decreasing
 	 * preference order (the core will try all formats until it finds one
 	 * that works). When the format is not supported NULL should be
-	 * returned and num_output_fmts should be set to 0.
+	 * returned and num_input_fmts should be set to 0.
 	 *
 	 * This method is called on all elements of the bridge chain as part of
 	 * the bus format negotiation process that happens in
-- 
2.37.1

