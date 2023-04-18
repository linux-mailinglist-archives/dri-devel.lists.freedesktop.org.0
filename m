Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04896E5B2E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEE010E6D4;
	Tue, 18 Apr 2023 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577A710E6D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:01:18 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A3B3824001B;
 Tue, 18 Apr 2023 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681804875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLABZBNg77lXkYmbYD6rmCLffL1EmDa6Je6DquhfXlI=;
 b=jCmpIYQWDWm4Ns73jcDFnertj7akxCBeeQSqWOL1zM+b/J50TmHltmZ7HVZM2dRhCFaMTQ
 zGHK/tnD9UKlhNq6SVmyblQJr70Xcf+2u8eaIxQk1w8dLaZhvL5bB/M8gip6kmyN7BlOfU
 /se22K5p/eNQQL5j+MMBhBUd2S4pZz8OJk2ww18fn/Ipjv2yKq3RgnEmobOT3ypQmPt/R4
 MCjl7Mwvh0nYGLVRc4Muj6JqkdE84buC68fjPv7mUEm2TBcO/oL56vIEStZJ4g/EgNZWlv
 1RZIX+SqvCTi0SblwJi2AolIDcqDY39P/Gpgwu1pl1OJGzIij2lg1qmRP8Y/+Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Subject: [PATCH v6 03/20] staging: media: tegra-video: improve documentation
 of tegra_video_format fields
Date: Tue, 18 Apr 2023 10:00:37 +0200
Message-Id: <20230418080054.452955-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
References: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some fields are irrelevant for Tegra20/VIP. Add a note to clarify that.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v6
No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index a68e2c02c7b0..5396bf53ab75 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -260,11 +260,11 @@ enum tegra_image_dt {
 /**
  * struct tegra_video_format - Tegra video format description
  *
- * @img_dt: image data type
- * @bit_width: format width in bits per component
+ * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
+ * @bit_width: format width in bits per component (for CSI/Tegra210 only)
  * @code: media bus format code
  * @bpp: bytes per pixel (when stored in memory)
- * @img_fmt: image format
+ * @img_fmt: image format (for CSI/Tegra210 only)
  * @fourcc: V4L2 pixel format FCC identifier
  */
 struct tegra_video_format {
-- 
2.34.1

