Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799B717869
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EDE10E494;
	Wed, 31 May 2023 07:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2126.outbound.protection.outlook.com [40.107.255.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101C10E494
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 07:38:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjqhyX6dn+EBbiYsmKMl4nj+Hp/GVpG2x+WtdLtxUMPJOvZ+Z3CHnm7t2Ez8v7mHLd8XLOKpaEz2LgHmMerVmUCRPGdAgMHSBfNLQhu4Vk2KWAsjkHc1GGnPOM87EJpp/y3eXpB8hVvORGk3FtExnvUhHthxSsIz9s05d3+1Xa4TMc/DvdAooPedxaEqn7IXu+L8/FtXNIS7fsEA/LNicp1EA0M1kAocHZkHP1vOcVzXcilIRfPl9AqNY+db9+gi5/Ihkim9sRSCsjuU33LjLkByUTY7TnK2ml6jhy+fM3n5KzHmqNh4IjDQOtOdm0I8wHOkpS0VvPU6o3PK9SvKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWcWb4kBK15aAmXyOXHcgMskBxsxfIStyeHH/5j6LSE=;
 b=RUc6MgWLj+x15k2m58H6lpR1DsBXhtHiSEa12n755w6jAaHmp811JMl6T6ALTkSS6qf8LTUOnEsdmmYMXQ7cQh36+k73sSLnjYvDi8iQLnxbcbcC7qUJc7+nGuCQKCgRcn0TUvCBW0Sraar4yhnslcVaOkGHDgKm2fwDXGjbAkxkGxeWHue9Hhit2DJvq/8kgDicTdMy4XR0uD47aO9g1KqwY1P0RSo7kJ9bhvGHH3nylOsZx/KR7l6ibXltX13DBCOuuvsoj9zNcuRAfqyZiBeqPA2o79J0ymPR3noFACpnGF4G7cPukOE7tLvch8xrdwcuokQT+XmH2/70aq9LuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWcWb4kBK15aAmXyOXHcgMskBxsxfIStyeHH/5j6LSE=;
 b=l3cnqhWn/kmPtJ+4TgblP2373uJTumCMy/oOT2PxmHOVRczPEzolrHB9PjTNmusMtI6H+3qY8t31hyVnUNFcF0T2w++AKDdTnoQSffstS46oU2l/3KVOJ6gXiMn8TMozyzQsgOb5pZkVvJTw3UlOJXCEZ5VJ8RyLzhGVRifuYkDaImfRXZsQH8OsGvAR1P4SmwPnE4g/U12l4OVluqQJzXyFoc3Nzanh5tIKqUXhOsxUs04i+Aq3hf4LKi0SflU16pFzctQzdNS9PBvsqIU6USNrUKlXW0qG2Ec94xrVcCPArTkltOqSVYkwxSZV9C4G9n8+gdi3GceW/fnjP2Csqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by SEZPR06MB6457.apcprd06.prod.outlook.com (2603:1096:101:17e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 31 May
 2023 07:38:03 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e%5]) with mapi id 15.20.6433.018; Wed, 31 May 2023
 07:38:03 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu: drm/panel: Change the return value of s6d7aa0_lock to
 void
Date: Wed, 31 May 2023 15:37:51 +0800
Message-Id: <20230531073751.48451-1-luhongfei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6697:EE_|SEZPR06MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0abbb8-8b0f-43f1-ed61-08db61a9f76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhZ02FFtlfNJQZ+wn9ONaFGJwv2JHF3fHfxp9/g5+sEcAmTBCFyPeJ+HOTP5C7/uVdJaJ4FnQ+vcI3a3Wstc4mlWm5YZN/Pw5M71cZSBvnkI3cYi9XjV567itcZqda5k8uXPdMswcpbK+5Ctz7gpA+5jAmvsxfzMf7Qe4hCrdupCsGWQU3WgsSIChPASZBp9OZvwA6KYPUbcWiA9ZxgsGY80tFQb/YbowiaVC+oOFavPPGM/bJl+nnETOA8xzz5TWOd36ed3CJrh/yb53odyOwdf5m3UJlMRDmRIEpUuhAeQjOx7XzUpxJFRifzxa1u/1LMJRnW5JR+MhyhQ3iPpFdPjQVxmdOgwGNNlPneuoCOMd0uwBugNvtzKkX+igVXyV6g6BmnyHl0tQZ+esUl9df/naDcoOu/kx5nRf5d2ZefMRYMduJZ+C+dqzmAtD9GYqfVADKBPtARFiRp0O/1N/Eb30yZxPz4KmORyB6uQJXZoFsZybRKuBGSesmVxX5B3ZsonFEDoSGIxyD4v/M36JkiQ/PchUBd60rF2RVQ0ANxS6VFQadkDL56r6rlZTyvacHPO0IPdmas5ueZKskWDb/UJfI6iAsrTEntpNg5j+qzJPGROdNOwsv0HiB6L7+CV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6697.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(66556008)(83380400001)(6666004)(478600001)(4326008)(66476007)(66946007)(110136005)(26005)(6506007)(107886003)(1076003)(6512007)(316002)(52116002)(6486002)(41300700001)(2906002)(186003)(38350700002)(38100700002)(86362001)(36756003)(5660300002)(2616005)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cNasMst5luVph0lIZU4skspDMPcyzfKIRu5cIts7z39p4OrwBdmdhmih6Q/G?=
 =?us-ascii?Q?1XRqtLhjpKwdI7ay53NaHXPRktWYN0HPytVFgQ9+XAMwfHIS2zXiqCdN7brD?=
 =?us-ascii?Q?o2xmbbadktc2wBJ0LeKAtpDUxjHPZWWeg1w4pft76csxXR84Rs1dhHVWWh07?=
 =?us-ascii?Q?e665Vg8umn+OFbW9+Fhz1C8hLSG2q31FwqhytODkPR9yDam09M/OfBCpsXTk?=
 =?us-ascii?Q?teFN0eqtSG9Fo6TgYZhnA7jlLdMSyrEnWKLApD4jxufuahJlTwnr3rcTloDh?=
 =?us-ascii?Q?HbTJYFM1grPSRbtpVAost3efPsCwgMsaTMWR8pyGWlSHWZs0570ivuaQQFJ8?=
 =?us-ascii?Q?LizslrCFkj5f78HNIt4c+YUBzQMA+KVT5BpejCqPDuNC3KvH4wjiUD5Pbfhm?=
 =?us-ascii?Q?BpedNBilLq2eChjXEsTZLTc1LmL+B1SNvSdHtGZZG9u+I1LlRasHqIYem1OU?=
 =?us-ascii?Q?++gRRQJUHnGhNLolPS1PdunHaCCBN/tsevj3ArXfvbK/OBhsKDeDjagSNpZr?=
 =?us-ascii?Q?zJ+Nv30t2Iyxw+2uXciEBLPmdNTOSbfr2mAD2XsrRJ4esgZqB22QBJiKtnw/?=
 =?us-ascii?Q?whWTbeo/zsNdheHGmrizQaXvMWZui3v8sFQ7FBoQ9CE8nxga/1V8RG4AQ5CG?=
 =?us-ascii?Q?Ytl4em8q11jawcZYU2+3bL2Ry0d2WmLyjp0x5VK2YmUXo5rTRYUSL5UWIJ+j?=
 =?us-ascii?Q?NflbXSh6tShiwvjnIz+1Rj/v7JjUeoynMJ5HvPeijC6e/3s+W8ZdtWgQrlVD?=
 =?us-ascii?Q?ydjXdWVR4y9whtM3D7BVHdDAm5NnThSsVOVRcOSYh1+SdsmX4axk6T+INCgn?=
 =?us-ascii?Q?Y5XpzszZCZuSmxnQj6NsFPAGBVqfkist6t2DDpUeazwA7qhX1M2baZRx/fXF?=
 =?us-ascii?Q?MqqAXZq+OirF379bL9BUulZzNI1u0I7mDM2gFhg7pmqdv1/EXQE6fOKgfFmO?=
 =?us-ascii?Q?LtZH0aBKz3zs3smKpGRMM8ItMQ8huoZc5BZcfASJeEX92nnp7Is2evFmnsUL?=
 =?us-ascii?Q?OunvLAGJkZ/zzUOs49VnHCYqALfwfLQwV51sttxQTcgA6UEJTI6n1ni02eMy?=
 =?us-ascii?Q?92OhXS6WKYASMQbANkbwjIOMF8Ud0KEHfNOLJ9HzfvMfYI7c5y9OtZ6n37/O?=
 =?us-ascii?Q?FkEbU9JQuWneoORyaSj3WiCytUqhJZPhD9m8dFaVnrauCwJujKROo5ILTkdY?=
 =?us-ascii?Q?jnjLMkBXb8c104EspqtbuaAnLzsUzOkzNdcg7vNpcC6Elzv1Sns58pNbaqen?=
 =?us-ascii?Q?Id+RRpRaguond1ajNSdJSK2D+EQ0DoXeNupBXPP7qrMv6VSM/zLRB680hBoh?=
 =?us-ascii?Q?YCQJSL/dwpYGti0vzqMqXUQQYPU5Lk9ldN8h1YgTV8GYFGjmTAg+P4rU1y8e?=
 =?us-ascii?Q?fvrRybXJV1gXNfeybVIPqHsc3CZxkwrmJ3qwsOvEWU2rwTBMdGU00VkmScgh?=
 =?us-ascii?Q?ghJzmI0WB2pWeoo8v9EqENRx5BTjX2Ms767n1oINAKwkhJjQyNudnRtZ1C8v?=
 =?us-ascii?Q?ZuEK/l152XPOzUMpcIWSZlrSFL1UCaUNnx3qAR2b8swqTN4fUSgKe9Gimm9R?=
 =?us-ascii?Q?4FAcsaqFi+LPrzqA9d33O/ul42x8+kHURINsuUhh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0abbb8-8b0f-43f1-ed61-08db61a9f76c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 07:38:03.3840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aikAzb2lWHGB3WIbZubyxKbIYWxxmWxatNkMt0qxiy7TRJE2gn3zEk8bB8C+aHHpoQp1E/dBv01iZTXI+ZILTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6457
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of s6d7aa0_lock is meaningless,
it is better to modify it to void.
This patch fixes this issue and modifies the place
where s6d7aa0_lock is called.

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 29 ++++---------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index 102e1fc7ee38..c5924e7b9e36
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -63,10 +63,9 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
 	msleep(50);
 }
 
-static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
+static void s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret = 0;
 
 	if (lock) {
 		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
@@ -79,8 +78,6 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 		if (ctx->desc->use_passwd3)
 			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
 	}
-
-	return ret;
 }
 
 static int s6d7aa0_on(struct s6d7aa0 *ctx)
@@ -238,11 +235,7 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 
 	usleep_range(20000, 25000);
 
-	ret = s6d7aa0_lock(ctx, false);
-	if (ret < 0) {
-		dev_err(dev, "Failed to unlock registers: %d\n", ret);
-		return ret;
-	}
+	s6d7aa0_lock(ctx, false);
 
 	mipi_dsi_dcs_write_seq(dsi, MCS_OTP_RELOAD, 0x00, 0x10);
 	usleep_range(1000, 1500);
@@ -266,11 +259,7 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 	msleep(120);
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = s6d7aa0_lock(ctx, true);
-	if (ret < 0) {
-		dev_err(dev, "Failed to lock registers: %d\n", ret);
-		return ret;
-	}
+	s6d7aa0_lock(ctx, true);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
@@ -327,11 +316,7 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 
 	usleep_range(20000, 25000);
 
-	ret = s6d7aa0_lock(ctx, false);
-	if (ret < 0) {
-		dev_err(dev, "Failed to unlock registers: %d\n", ret);
-		return ret;
-	}
+	s6d7aa0_lock(ctx, false);
 
 	if (ctx->desc->panel_type == S6D7AA0_PANEL_LSL080AL03) {
 		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0xc7, 0x00, 0x29);
@@ -370,11 +355,7 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 		return ret;
 	}
 
-	ret = s6d7aa0_lock(ctx, true);
-	if (ret < 0) {
-		dev_err(dev, "Failed to lock registers: %d\n", ret);
-		return ret;
-	}
+	s6d7aa0_lock(ctx, true);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
-- 
2.39.0

