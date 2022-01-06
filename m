Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF7D48608B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 07:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F296E10F799;
	Thu,  6 Jan 2022 06:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2091.outbound.protection.outlook.com [40.107.223.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229A310F3DE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 06:19:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N85hKDgCFjua5d5r2qkDPnAwPA/cPyq5cYIGr4fIN6D+25nnJdbKUUaBSX0G+aRnGkmEtoIjuUDC+S6Yknrn+0GqkZobxrnWKSzfXDqAsz0TGXRyF6MKV38vkOtAcr9wuznY02Y5mzABtUmpoCjurhcImCOFz5Qa+pL3nwxhhQ3xJUoiLX7YATVNaMUuOFJ03gy9/1bWlBkj98OL96JqKkqqgQBckCISadJXPlX3HCjKXd9/wT/YAAaFfib6tU6V2LMbJvNiJtWg2mXY+U/O7YsxgsHGw9ME0B+Tu4tXLi7Gmm8nTKgCt9ECWecZOaRUvOCUO2VOmeSpPt58olziPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21ROVAILycghSjloxPbCJZ7payhrIttvuJrjqp3YKyM=;
 b=byY2uxZBSDHL4MSivjNARb5pMkpTSDTv5HBZMQSU5MNwnfyOA0pUSqdNeERDRGZt6mScSU0zSWSJRntUnjyI3si9Sju06G25nSdLDXOJFt5OosC4q2GUhw4MTJ7BExLt30ylAhW4agYEU4UhBovJgOyUStqrU0oAZ7KHFhSyesGGwZt0GftXqaEbiULX7NvGLu3/FGIjly9L4f29Ay1rFVufFjJexVpY35AiUARxCfw92VriYc+grcGqT85OM3WmHlypMpfmRUuM2nQI0i2Id8rI3ipDcylf1NxkY6TA/Reh1amG9slOZ7pDNjei76wnpRhPxTPdNLYcdZasg9OW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21ROVAILycghSjloxPbCJZ7payhrIttvuJrjqp3YKyM=;
 b=ZByZU6gt+AmiJHH1Dg68mrH18yRXRDPGHHDJmR53WEshWlT+K36VvVecAK7mufdSvk0EkH2WwW9MwYmlkZ+rJedndfMHUhmsMUCljX7dZXakAajFQiGR36qx8C+QkXLXsVJfUkAnwDMGl8PNXJM+bAd07RWbSHqGbbr1RqEs7b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3925.namprd04.prod.outlook.com (2603:10b6:a02:ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 06:19:42 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108%3]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:19:42 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] drm/bridge: anx7625: add audio codec .get_eld support
Date: Thu,  6 Jan 2022 14:16:30 +0800
Message-Id: <20220106061630.1752762-3-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106061630.1752762-1-xji@analogixsemi.com>
References: <20220106061630.1752762-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e566ff78-f28b-429a-56d6-08d9d0dc86e0
X-MS-TrafficTypeDiagnostic: BYAPR04MB3925:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB39257CCFD13888BDA9F641D2C74C9@BYAPR04MB3925.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCuYNkH1dpX3BMlp/kzLBKhNXMl9qrM733m2mdVnw4UvsDGhFw7AZ0kuyTWtaaxsW2sR1TTZ7QICsggaqRPWKett5bG8xRrsWZ+1+lyEdJGucYkiBLtwenc7bmd82dmvJBjA+Ovb7lkX0qJjHXutEO6gDIK8J74LNDrxEymHeqliFDXie4PqGRdgXr+7BV3BY11FgkBum+DTwt88XnbgUCKVBPkgaVoWZx24CtZ1OnELHedxYgbgG8FzC33gOeQPWrQsG3vK1XcxNfN5n8QUCF7j8KkSzXewkksE/MlKXFz6MbmM0SHkHrh2pnM4UYVJPpmgMZqKWB2cP5RLhVlrTjZySjitBOetpPffYkT9+k8bVQ8/Vj4wMSHGwia6u6whOxuZYN2RB8eD024ndMVgy8bQhEaWAlZG3JMg9jcQBVWVIVpRTM9i5S959x5vJrmAW9r//5T2JPsyKmdxKQUqOm8K+WCaUF+t/95ESuYx8K/DsTyWGLx+zN5w5E1DI6Ll6UYsrK9VY2TNuAJ7ZlVElg70mHvzzvA22mkQbupaPQpsEDd0eb76+NoV6ffAvfK0V8pGtPfjjEeAJO45VcmmZLgmF8p84sXdym6Nx8FmOrUvAeI4tCr2hPdo/MtZQMbvBx5SoFsoDuUZhHsU8M72Q14YG1y3pEHJ4CovBWaUHwwmLQ+WWdC2Py7+wRousRz8GIX0dbDA8WTxSkpXkljYIkvu5W43SO+8YUh6U32tR1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(2906002)(38350700002)(186003)(66946007)(66556008)(66476007)(2616005)(38100700002)(4326008)(36756003)(55236004)(52116002)(8676002)(7416002)(6506007)(1076003)(8936002)(6666004)(508600001)(86362001)(5660300002)(6486002)(110136005)(6512007)(316002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RxZJW8J3Mi2cngHcoTXcMZA3I7d1GdOKFSRrIwhdtrhQZQ+C/Jm/YnQbRyhN?=
 =?us-ascii?Q?/+EjLbktWF2qmU+Yic9O7InVMkmgv6E+BmZC0ji0fjj5MnNIDSqvAN8IyZva?=
 =?us-ascii?Q?UwGCR0vkjcS+0vQFa58ni8yzI/29zsHEtcjT1UZX+Mxc55UTZeGbePveVsQu?=
 =?us-ascii?Q?AbeedYWirEe5oC8L6zBMiwu/hu7P9GRaNU2Sguh1VYMqfYxrYULqwO5jA7ko?=
 =?us-ascii?Q?szD9FeSRWqjUlqIOjECyAZhvlRfPzUMRUV1id2XWOgHhtROCLaX/pq5uQh3s?=
 =?us-ascii?Q?5n40rnQwXp/oxlPAXf+C8QkVoaw7pHvqn3qpYJV2vZ65QFKQkozL3Ej6OUo0?=
 =?us-ascii?Q?doF4biJANnoMSN39le6rA2LJU/D9xEa1OIkYEJh0PIIcBNjrFHPcNq+B+VRf?=
 =?us-ascii?Q?40JGW56Fp+yQ+onqobwtB5uauYmtnK+tWfh0OgsXEbtW6l0IWjGMkrrx5SfT?=
 =?us-ascii?Q?4ChByLeso62K12YIr/kBXXiCsMCPlkeZY1VWf1VC0CZsSiW7XgkoaXT/OtOv?=
 =?us-ascii?Q?dOtXdHGlE5cmwdcewokiy5z04UZFXBCI8Gl/rCOPU+6B3LdosI/ZrFGq7H67?=
 =?us-ascii?Q?coq+kgNbo1BycFS73hJJNOsd/LsvFXTZUu18pm4X1cJRjWrsFK90Egt6Pfm/?=
 =?us-ascii?Q?3toIZI6GPRuT8Vh95xLkjTQTEZ9N3dnGke/olBIahlIm/hEeQEI7KU8RbNpe?=
 =?us-ascii?Q?9IKupjkr5XUI6J9QMVx54vynZv7teAtmvTns5uFpv732JmYU40NLN9BRZBGa?=
 =?us-ascii?Q?rzrL9x3UaB/qhtRGwXqS1+//wSaFejTYv43ibwH+RPHqqalWfoe0xq2/rfyr?=
 =?us-ascii?Q?e1PX6YjJB/a+BbDL0V9+AYTDYG4pfoEG0HdgNB3Npx8J4VMhzWIEnYsGX7sj?=
 =?us-ascii?Q?w2weNFLotnQf58kbI+16kCIOnGv/h13wW7O8L+nQS1+U3LjO/0xszTlmRFdu?=
 =?us-ascii?Q?Fk285Zs34TVBRf48fAkV4d6qYD91oYFCMvyI+duFSK1IjpxwVHzAdAHWlv2h?=
 =?us-ascii?Q?VCy8tCkvdaTXOfUFyRthPl6vyOyMi6xFoSpgiBYkQ734h3pZDueJ9BB6qTap?=
 =?us-ascii?Q?gKkfoF9ShDuhvLdThCBPbeiI/TZ3NwYLeO4CC1HllTYkJSnLmOKbLC0rGOq4?=
 =?us-ascii?Q?n4F+OnDMjxU7Ntclyv5QS6XtBG9ls4gsKlULmoHptR5KYw/+Rr/lO+PeNyXv?=
 =?us-ascii?Q?yAQn/iC+Fn5f9QFjHgofKbUmUzwUr3yNwB6NCWuQ1E80kUpRPHlKIAUWh2sB?=
 =?us-ascii?Q?KC//Cr0yH0tAoBcjzPlZp3EfpoT/jnIWs87jhWJv7kIpKGUVSc+XtpUZyvRB?=
 =?us-ascii?Q?XVvhLhFf6GMYsFA6GVPPSIqFTmIAGGeAKY5Tk1zVYQFrh4ULIXWlypWjkW1k?=
 =?us-ascii?Q?O1KBiX3JVBJQ0q3h270UCZ307x8f6NENjQvcdT3Rjtmb7U5GkPfFkG1CwETA?=
 =?us-ascii?Q?Lw+fPWaRksDJXqnQK+DJg/TqdB4r/jP2osN/td+UYH7DzewiuLKmOwpyM29n?=
 =?us-ascii?Q?GZp5gunJ+PbQ9bqwynsGIasI++chZpg6snOiNI7oru6vHSNrRiLpJiCJKuD/?=
 =?us-ascii?Q?kQcSVTINtDY4mOqoh13n7KrLnNpKwHl2JN/z7S1AJvHw38h+WD2gRGShdmLs?=
 =?us-ascii?Q?d01CE0gpv+VC/EHCFQemqCE=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e566ff78-f28b-429a-56d6-08d9d0dc86e0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 06:19:42.6679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w68JHHQLM+UaIibmhWsxLgE8+PYT6nf8636icpdNcclSMpxpoeXa1SGEIrp/rFiQNZN24qzdsv9nuxoaP3h0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3925
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide .get_eld interface in hdmi_codec_ops for hdmi-codec driver.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a225dd1abf41..a41f22d0e088 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1840,9 +1840,27 @@ static int anx7625_audio_hook_plugged_cb(struct device *dev, void *data,
 	return 0;
 }
 
+static int anx7625_audio_get_eld(struct device *dev, void *data,
+				 u8 *buf, size_t len)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->connector) {
+		dev_err(dev, "connector not initial\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "audio copy eld\n");
+	memcpy(buf, ctx->connector->eld,
+	       min(sizeof(ctx->connector->eld), len));
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops anx7625_codec_ops = {
 	.hw_params	= anx7625_audio_hw_params,
 	.audio_shutdown = anx7625_audio_shutdown,
+	.get_eld	= anx7625_audio_get_eld,
 	.get_dai_id	= anx7625_hdmi_i2s_get_dai_id,
 	.hook_plugged_cb = anx7625_audio_hook_plugged_cb,
 };
-- 
2.25.1

