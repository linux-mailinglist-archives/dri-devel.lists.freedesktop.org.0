Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14F3107B8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D086EB54;
	Fri,  5 Feb 2021 09:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253101.outbound.protection.outlook.com [40.92.253.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86EC6E9A3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 09:11:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6O8aZukv7rMdHBdqpaLPvtEBCCmmO9voB5r88P/rdu2lBNGjSprRlfqYFJZ8TYx5S1Ko5gsB3uaWeOaV9pz7sQHlgzRr+e/0UwCrqL41+UVo7a++hn4hBjXvO92/Nuwxog9LZk1TuBrkJvwIMWns+mlY54vWm6PiNDziK7SLfNpVne+kY41PeQDLB9VzAG8gxtwVhoho3ZR26gAA1R9MJlgfU8HqkfmDNx5nvmEzdcfaqmn4+vEyUO7eVCY9adeatQ8DVZis+29B0AGUrzBoJEUCO0vvaWTlwzDiKHiW7B8u4eLHi5N4KE5u7zYJiTHuRxEy8cy9JaQcK2Fh0pgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyAaggpKXlqNBVpH7HCuTwA7xTLbNf9sNSFgWaX3M1w=;
 b=DvFlwhfxQYvWEHg1/pwoonxsgZGj8jYCy8rX8z9+lbE/gsQY9StZJbf5r4bqMogrhqVTiEwyfeSujXy+soE5uapFMmqD6JqR0Is/5CW67z/6CcWcpiMSTdG7VTw8k846Te1Q5XPkYIXK/gZr7soy/Esh/xBwcUQXBY27Nyz7TJlzhw7rF1UWI2hQiHvP9Y3wfG012FflpQws+rxsrVZInuUSnIofLJBiluX4zVjQ3PEo+84ukFolyMCb+/9M4p3iguM6O043z06RuXjhRvE8UIWyDUGyh4K1Y+VGI0r6VxzE+ItW8gN/TYbvrID7VW0I2L6DoGmpHF4D0KXAJhBt+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyAaggpKXlqNBVpH7HCuTwA7xTLbNf9sNSFgWaX3M1w=;
 b=bWj/e6L55IyK7c8elCtWKMpckhuVbFk92t1cF0DTUE4o2sESlCwY3TGbO6TWbdvshI3zlJA897BDTpyzWBS8pDBeuBweFWU6FEA1UJDPZXTCfdZpwxEANlhRHtaM2eHWqut/ghllPj1wFO0tq1aRv8av3+zgkvfOA2cFzKaOg16oLN+Vm78vApqtPHCXStR0HpvsELdJI4HMmfg9VLLIkyiFoKRNkDPqrJ2nXDPgcQYgdM6t0LIfoGnus2wlW1BDazx1Hi+hGasBhEH9rxrrAnJZkk9ywz6ZrHUBEkQ+PBTgNBf4kdtumaU749IEPjJD11IY7tyhc3JtPzu17M/pJA==
Received: from PU1APC01FT043.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::41) by
 PU1APC01HT183.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::454)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 5 Feb
 2021 09:11:33 +0000
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::52) by PU1APC01FT043.mail.protection.outlook.com
 (2a01:111:e400:7ebe::262) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 5 Feb 2021 09:11:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AE3A65ED5B137D831F8B145509833EB02648F8D350B6735A64DE31A300941FD0;
 UpperCasedChecksum:3CC019D8A067AD27104857B5766A34BCC26B85E9C8BE3EB6F9E5BC7CED926006;
 SizeAsReceived:7485; Count:44
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297]) by PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297%3]) with mapi id 15.20.3825.019; Fri, 5 Feb 2021
 09:11:33 +0000
From: Mayank Suman <mayanksuman@live.com>
To: gregkh@linuxfoundation.org, sfr@canb.auug.org.au, mayanksuman@live.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: fbtft replaced udelay with usleep_range
Date: Fri,  5 Feb 2021 14:41:13 +0530
Message-ID: <PS1PR04MB29341C7117657B1F312444FBD6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.30.0
X-TMN: [fNC3v8HBfu/BQltsmUk1UYAYOsqFhc/TJmLgRs+VoKw=]
X-ClientProxiedBy: BMXPR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::16) To PS1PR04MB2934.apcprd04.prod.outlook.com
 (2603:1096:803:3e::21)
X-Microsoft-Original-Message-ID: <20210205091113.1183466-1-mayanksuman@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.127.101.171) by
 BMXPR01CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 09:11:30 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 44
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 35973a73-eab1-4187-ffb7-08d8c9b60814
X-MS-Exchange-SLBlob-MailProps: 7MJMDUNTCtxonY1sqs0A+FAVLkVdFa61r9V4wI1z8pop/cLlFsUo+0lms4aKY9zdvKeNre9lBufoi0hI7sb8t3jSIzLb70TE5pfj5nenzSakctR4luC74xYXVuMTEI6HjtuzhliwdYFqSwB5E3F2dYVcVwtNzfbI6I9fcaletIWGZ6qa58Lwl84eZSyxM9QRjweV/s7eN9qXryydzLkKqqiXs3inbplZfoFmQMMli/WlkGbszUIuU+0gVzgqOEzsvtS6ybUg5cMCwEiUWeQjDCbxQnipTqUcoaV9L4Ed2ysSz9NNVbW7zEQ/Oa1CLXVIpLqQr0ZALz06jXwHa/YNWgXm68jLsOyPUCBhjwK0cfrtNpkJs9S2ZGZiHetSkQprD/CVeq8tJEr8qdL4vWWXIVprfE8dCUiz9gvs6xPQwq1yZrgFhdi9dbY1kOYJTCXQE3qeuaSrvbt/lK/cwaeUXZC281e+5jz++2YWaj3OjLQUcXzJU5Q0mWR5UY/zO3saMfmmYUxvrC0BiEWt302oHcNdP8ojGKPN4blOs6YiHUCyV7lblbxU/BVbLASic/FUJrAWuX+D/1zBGblCOa1uOGRwxtAxzXFKzUBxAcqWyZSWOx298cXx1OmUtXv3D7xhI6JST2h08hxaw4H/10Dzzp54jDXjHYeNpRCRBF6KjJKE+LN9ckZRLLLxoAXkm6vsdXktiXtNiUTwz92CWvRKgox266A8nyMQi1nZw5wiHBCEC/Xd33/kVQ==
X-MS-TrafficTypeDiagnostic: PU1APC01HT183:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5dUEFrNUo1URNA5SG6kJWtOG1LUbnNy1IPkpDnMvmeghH9IXh6SXP6Szu8yn+ka/XdhTgkv0Vf0gi+t07DUqOuUeDqtL1vp6JBCSeUWaXvvoeNWY9sf5kwwY7PuBrVDfL4Hg0ySzb583HvHD8Pr2hyOyVywCPyVCVNQXRcn6SKLEUE+gycFApGRTiRFB1mWArv8PiR3E+unZ3JUtQwwMPYaERbGAcxOsm4pgNFinZaZpxuFGIVBwT4JCS7bWAW9TvfTCQGvnhmbGz1qU8j5p05aVxk3hG8Cec3SPG6p2s/SC2PFltbxz7s/llphXQTLkEhQ5X6Z39ArfiZ7fqAyczvWGen07Es1h1y3TCsn5Qvg9h8Vdq58vQvtr5G8fX1bBKGXRnQqrG3vfY4CKBudyw==
X-MS-Exchange-AntiSpam-MessageData: fli3bkGsiW3isVSCAwTVyn1YSOiZje+yNR3uY3KUj7BE96Y16vB9978+uGIS6srSrMdbd/fqt7V5BSYOMQdpHpa92WdeLoJNxWK6ZgbzuFLJFDWWd5l00zOmztGVB1mJKAJpruiIuPUgiunaM3XPIA==
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35973a73-eab1-4187-ffb7-08d8c9b60814
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 09:11:33.4371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT043.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT183
X-Mailman-Approved-At: Fri, 05 Feb 2021 09:25:18 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Documentation/timers/timers-howto.rst, usleep_range is
preffered over udelay for >=10us delay.

Signed-off-by: Mayank Suman <mayanksuman@live.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c |  2 +-
 drivers/staging/fbtft/fb_ra8875.c      |  4 ++--
 drivers/staging/fbtft/fb_tinylcd.c     |  4 ++--
 drivers/staging/fbtft/fb_upd161704.c   | 18 +++++++++---------
 drivers/staging/fbtft/fb_watterott.c   |  4 ++--
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index eeeeec97a..9ac523511 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -85,7 +85,7 @@ static void reset(struct fbtft_par *par)
 	dev_dbg(par->info->device, "%s()\n", __func__);
 
 	gpiod_set_value(par->gpio.reset, 0);
-	udelay(20);
+	usleep_range(20);
 	gpiod_set_value(par->gpio.reset, 1);
 	mdelay(120);
 }
diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53..61d58efab 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -217,7 +217,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -238,7 +238,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2..fffd39d96 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,10 +38,10 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+			0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c77832ae5..bdcfda868 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -36,27 +36,27 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0025, 0x003B);	/* amplitude setting */
 	write_reg(par, 0x0026, 0x0034);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0027, 0x0004);	/* amplitude setting */
 	write_reg(par, 0x0052, 0x0025);	/* circuit setting 1 */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0053, 0x0033);	/* circuit setting 2 */
 	write_reg(par, 0x0061, 0x001C);	/* adjustment V10 positive polarity */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0062, 0x002C);	/* adjustment V9 negative polarity */
 	write_reg(par, 0x0063, 0x0022);	/* adjustment V34 positive polarity */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0064, 0x0027);	/* adjustment V31 negative polarity */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0065, 0x0014);	/* adjustment V61 negative polarity */
-	udelay(10);
+	usleep_range(10);
 	write_reg(par, 0x0066, 0x0010);	/* adjustment V61 negative polarity */
 
 	/* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -64,7 +64,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
index 76b25df37..580d5329e 100644
--- a/drivers/staging/fbtft/fb_watterott.c
+++ b/drivers/staging/fbtft/fb_watterott.c
@@ -84,7 +84,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 			par->txbuf.buf, 10 + par->info->fix.line_length);
 		if (ret < 0)
 			return ret;
-		udelay(300);
+		usleep_range(300);
 	}
 
 	return 0;
@@ -124,7 +124,7 @@ static int write_vmem_8bit(struct fbtft_par *par, size_t offset, size_t len)
 			par->txbuf.buf, 10 + par->info->var.xres);
 		if (ret < 0)
 			return ret;
-		udelay(700);
+		usleep_range(700);
 	}
 
 	return 0;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
