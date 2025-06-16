Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9EADABC5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2077E10E2FA;
	Mon, 16 Jun 2025 09:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="tPNEq1gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D0510E303
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:23:52 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7qXNA001111;
 Mon, 16 Jun 2025 11:23:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 g+teT4hcWlE6FbbDd8cFYpmDv8L8s8toVgg8l99SV50=; b=tPNEq1gwIwCMGT1O
 zShj60AR3KvMaxqHUr1gonPu1q5PSb3u4Il3S1pGyDpR0f5BicdqadtheYmia7L9
 xUMR+75OZSMXaTB/QKd145RsmVGtsNMdGdujJ6kAOVAhJk+6pOC/C8UTe2HctrxA
 lZErrSRksn9RluAkr3jlvSZaTILINPfEmxuS1ui4/Yut+Kd5SA1yIZpkJiTPMAX+
 DYsTcDLj/Pu+Y6U/y3gjW5PnRqaRYrWh0anBSzQSYedUIXbd40JC2vz/VEGa/59N
 fa1Kwdzwf8KPHUf+1I0XngPZ6oOii2R1kBS9rRYq4XPtciWzVH+tYLXp65ZmccDu
 D4Qiew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479jn4mm80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0832F40050;
 Mon, 16 Jun 2025 11:22:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30AADAA6EE7;
 Mon, 16 Jun 2025 11:21:11 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:10 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:06 +0200
Subject: [PATCH 5/6] spi: stm32: deprecate `st,spi-midi-ns` property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-spi-upstream-v1-5-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `st,spi-midi-ns` property, which was used to set a nanosecond delay
between transferred words, is now deprecated.
This functionality is now supported by the SPI framework through the
`spi_transfer` struct's `word_delay` variable.
Therefore, the private `st,spi-midi-ns` property is no longer needed and
has been deprecated in favor of the generic solution.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/spi/spi-stm32.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 8581f24c111f..3d20f09f1ae7 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -283,7 +283,7 @@ struct stm32_spi_cfg {
 	int (*config)(struct stm32_spi *spi);
 	void (*set_bpw)(struct stm32_spi *spi);
 	int (*set_mode)(struct stm32_spi *spi, unsigned int comm_type);
-	void (*set_data_idleness)(struct stm32_spi *spi, u32 length);
+	void (*set_data_idleness)(struct stm32_spi *spi, struct spi_transfer *xfer);
 	int (*set_number_of_data)(struct stm32_spi *spi, u32 length);
 	void (*write_tx)(struct stm32_spi *spi);
 	void (*read_rx)(struct stm32_spi *spi);
@@ -1880,11 +1880,26 @@ static int stm32h7_spi_set_mode(struct stm32_spi *spi, unsigned int comm_type)
  * stm32h7_spi_data_idleness - configure minimum time delay inserted between two
  *			       consecutive data frames in host mode
  * @spi: pointer to the spi controller data structure
- * @len: transfer len
+ * @xfer: pointer to spi transfer
  */
-static void stm32h7_spi_data_idleness(struct stm32_spi *spi, u32 len)
+static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer *xfer)
 {
 	u32 cfg2_clrb = 0, cfg2_setb = 0;
+	u32 len = xfer->len;
+	u32 spi_delay_ns;
+
+	spi_delay_ns = spi_delay_to_ns(&xfer->word_delay, xfer);
+
+	if (spi->cur_midi != 0) {
+		dev_warn(spi->dev, "st,spi-midi-ns DT property is deprecated\n");
+		if (spi_delay_ns) {
+			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
+				 spi_delay_ns);
+				spi->cur_midi = spi_delay_ns;
+			}
+	} else {
+		spi->cur_midi = spi_delay_ns;
+	}
 
 	cfg2_clrb |= STM32H7_SPI_CFG2_MIDI;
 	if ((len > 1) && (spi->cur_midi > 0)) {
@@ -1975,7 +1990,7 @@ static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 	spi->cur_comm = comm_type;
 
 	if (STM32_SPI_HOST_MODE(spi) && spi->cfg->set_data_idleness)
-		spi->cfg->set_data_idleness(spi, transfer->len);
+		spi->cfg->set_data_idleness(spi, transfer);
 
 	if (spi->cur_bpw <= 8)
 		nb_words = transfer->len;

-- 
2.43.0

