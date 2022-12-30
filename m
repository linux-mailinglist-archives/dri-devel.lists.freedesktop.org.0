Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E426599E7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA49E10E449;
	Fri, 30 Dec 2022 15:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655D810E441
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:36:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12983398wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 07:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tH0W6Q+n5Go7kNaJjIz/J403hZWvc6cemePnkkWb/v0=;
 b=OxyOgbPnT7k1489t76J3DHMIpe9egWOSHmjxuepfcChM73OBdggsYx9ol8HmoJ5cdm
 6aPkPqMpb5k0RoKhOJvT0pkzvBKsHaNCOiEyVOZJbNB/Xq+F6V2VIRXTGeOWGqxuq9hV
 cYhKbJqtgcfxVMk7dM2m2epQYDuASLRWRA9BT8fegSoatrzUmlpmzpfGDgtwKkCPcX/Q
 qPTn5E85AXvFRQVjFIgp0RAw3oYB9Uezg7x+Oz3qTTbzpB96v+4GFVg65Z+o4j2+1p2N
 o5I7/xvDgURSgAxhhqkuFqBvN/rEa1LBmkzF4oGSTzbkzs6snNPrqtI+3Cq2Z+dwGLUL
 qsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tH0W6Q+n5Go7kNaJjIz/J403hZWvc6cemePnkkWb/v0=;
 b=Rx+LRr1nMbOMyO5/EkqDXUqaGa+O1OzvZGQvFFjWyECeVmx7AohK76YjtEpq8LAe+/
 xxpTHNfkTdfHKfKDwqT5kB+9jIspCfArR91D/yD+iEeiX4n+RD9K/Zt+ESY4ReUVq09Q
 Gza9GR7plYhTF+HzkMKMKOUAN4NUIspiOBa5nzKdH2BQOGb3Y19TFhW+QBFFw4q0gFjm
 Sqzoi69L7ZXwXh+fZPZNHdePcfidqp9tCqfz9yuiL2WRg1Rk+s3GkCL0+TzoSESgFUHw
 c8MzteY0Sc+GzYVpX/WUPbatR6QKXAHtPmB9Mp8KVgjGxbu+GriFIcVQ5rHQNgYnf0YK
 5SrA==
X-Gm-Message-State: AFqh2koAK4BwwCQcNO1x7gn1f42Mi8eNYFm+7WBu0VJLk1sYGTgIYUX3
 G8UD75hmHUELpALiVy+vNzql0g==
X-Google-Smtp-Source: AMrXdXssVL6+uV1UQm23RMdUf0R9v/skxVrm8rB/Jv/1iZxEWXeDZ4e84DjIYkDzjEmQgHIuDwSitw==
X-Received: by 2002:a05:600c:3584:b0:3d9:719a:8f7d with SMTP id
 p4-20020a05600c358400b003d9719a8f7dmr15869596wmq.35.1672414571813; 
 Fri, 30 Dec 2022 07:36:11 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 07:36:11 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
Subject: [PATCH v4 06/11] arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
Date: Fri, 30 Dec 2022 16:35:49 +0100
Message-Id: <20221230153554.105856-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add GPIO line names as described by the sm8350-hdk schematic.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 205 ++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 0fcf5bd88fc7..e6deb08c6da0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -233,6 +233,211 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <52 8>;
+
+	gpio-line-names =
+		"APPS_I2C_SDA", /* GPIO_0 */
+		"APPS_I2C_SCL",
+		"FSA_INT_N",
+		"USER_LED3_EN",
+		"SMBUS_SDA_1P8",
+		"SMBUS_SCL_1P8",
+		"2M2_3P3_EN",
+		"ALERT_DUAL_M2_N",
+		"EXP_UART_CTS",
+		"EXP_UART_RFR",
+		"EXP_UART_TX", /* GPIO_10 */
+		"EXP_UART_RX",
+		"NC",
+		"NC",
+		"RCM_MARKER1",
+		"WSA0_EN",
+		"CAM1_RESET_N",
+		"CAM0_RESET_N",
+		"DEBUG_UART_TX",
+		"DEBUG_UART_RX",
+		"TS_I2C_SDA", /* GPIO_20 */
+		"TS_I2C_SCL",
+		"TS_RESET_N",
+		"TS_INT_N",
+		"DISP0_RESET_N",
+		"DISP1_RESET_N",
+		"ETH_RESET",
+		"RCM_MARKER2",
+		"CAM_DC_MIPI_MUX_EN",
+		"CAM_DC_MIPI_MUX_SEL",
+		"AFC_PHY_TA_D_PLUS", /* GPIO_30 */
+		"AFC_PHY_TA_D_MINUS",
+		"PM8008_1_IRQ",
+		"PM8008_1_RESET_N",
+		"PM8008_2_IRQ",
+		"PM8008_2_RESET_N",
+		"CAM_DC_I3C_SDA",
+		"CAM_DC_I3C_SCL",
+		"FP_INT_N",
+		"FP_WUHB_INT_N",
+		"SMB_SPMI_DATA", /* GPIO_40 */
+		"SMB_SPMI_CLK",
+		"USB_HUB_RESET",
+		"FORCE_USB_BOOT",
+		"LRF_IRQ",
+		"NC",
+		"IMU2_INT",
+		"HDMI_3P3_EN",
+		"HDMI_RSTN",
+		"HDMI_1P2_EN",
+		"HDMI_INT", /* GPIO_50 */
+		"USB1_ID",
+		"FP_SPI_MISO",
+		"FP_SPI_MOSI",
+		"FP_SPI_CLK",
+		"FP_SPI_CS_N",
+		"NFC_ESE_SPI_MISO",
+		"NFC_ESE_SPI_MOSI",
+		"NFC_ESE_SPI_CLK",
+		"NFC_ESE_SPI_CS",
+		"NFC_I2C_SDA", /* GPIO_60 */
+		"NFC_I2C_SCLC",
+		"NFC_EN",
+		"NFC_CLK_REQ",
+		"HST_WLAN_EN",
+		"HST_BT_EN",
+		"HST_SW_CTRL",
+		"NC",
+		"HST_BT_UART_CTS",
+		"HST_BT_UART_RFR",
+		"HST_BT_UART_TX", /* GPIO_70 */
+		"HST_BT_UART_RX",
+		"CAM_DC_SPI0_MISO",
+		"CAM_DC_SPI0_MOSI",
+		"CAM_DC_SPI0_CLK",
+		"CAM_DC_SPI0_CS_N",
+		"CAM_DC_SPI1_MISO",
+		"CAM_DC_SPI1_MOSI",
+		"CAM_DC_SPI1_CLK",
+		"CAM_DC_SPI1_CS_N",
+		"HALL_INT_N", /* GPIO_80 */
+		"USB_PHY_PS",
+		"MDP_VSYNC_P",
+		"MDP_VSYNC_S",
+		"ETH_3P3_EN",
+		"RADAR_INT",
+		"NFC_DWL_REQ",
+		"SM_GPIO_87",
+		"WCD_RESET_N",
+		"ALSP_INT_N",
+		"PRESS_INT", /* GPIO_90 */
+		"SAR_INT_N",
+		"SD_CARD_DET_N",
+		"NC",
+		"PCIE0_RESET_N",
+		"PCIE0_CLK_REQ_N",
+		"PCIE0_WAKE_N",
+		"PCIE1_RESET_N",
+		"PCIE1_CLK_REQ_N",
+		"PCIE1_WAKE_N",
+		"CAM_MCLK0", /* GPIO_100 */
+		"CAM_MCLK1",
+		"CAM_MCLK2",
+		"CAM_MCLK3",
+		"CAM_MCLK4",
+		"CAM_MCLK5",
+		"CAM2_RESET_N",
+		"CCI_I2C0_SDA",
+		"CCI_I2C0_SCL",
+		"CCI_I2C1_SDA",
+		"CCI_I2C1_SCL", /* GPIO_110 */
+		"CCI_I2C2_SDA",
+		"CCI_I2C2_SCL",
+		"CCI_I2C3_SDA",
+		"CCI_I2C3_SCL",
+		"CAM5_RESET_N",
+		"CAM4_RESET_N",
+		"CAM3_RESET_N",
+		"IMU1_INT",
+		"MAG_INT_N",
+		"MI2S2_I2S_SCK", /* GPIO_120 */
+		"MI2S2_I2S_DAT0",
+		"MI2S2_I2S_WS",
+		"HIFI_DAC_I2S_MCLK",
+		"MI2S2_I2S_DAT1",
+		"HIFI_DAC_I2S_SCK",
+		"HIFI_DAC_I2S_DAT0",
+		"NC",
+		"HIFI_DAC_I2S_WS",
+		"HST_BT_WLAN_SLIMBUS_CLK",
+		"HST_BT_WLAN_SLIMBUS_DAT0", /* GPIO_130 */
+		"BT_LED_EN",
+		"WLAN_LED_EN",
+		"NC",
+		"NC",
+		"NC",
+		"UIM2_PRESENT",
+		"NC",
+		"NC",
+		"NC",
+		"UIM1_PRESENT", /* GPIO_140 */
+		"NC",
+		"SM_RFFE0_DATA",
+		"NC",
+		"SM_RFFE1_DATA",
+		"SM_MSS_GRFC4",
+		"SM_MSS_GRFC5",
+		"SM_MSS_GRFC6",
+		"SM_MSS_GRFC7",
+		"SM_RFFE4_CLK",
+		"SM_RFFE4_DATA", /* GPIO_150 */
+		"WLAN_COEX_UART1_RX",
+		"WLAN_COEX_UART1_TX",
+		"HST_SW_CTRL",
+		"DSI0_STATUS",
+		"DSI1_STATUS",
+		"APPS_PBL_BOOT_SPEED_1",
+		"APPS_BOOT_FROM_ROM",
+		"APPS_PBL_BOOT_SPEED_0",
+		"QLINK0_REQ",
+		"QLINK0_EN", /* GPIO_160 */
+		"QLINK0_WMSS_RESET_N",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"WCD_SWR_TX_CLK",
+		"WCD_SWR_TX_DATA0",
+		"WCD_SWR_TX_DATA1", /* GPIO_170 */
+		"WCD_SWR_RX_CLK",
+		"WCD_SWR_RX_DATA0",
+		"WCD_SWR_RX_DATA1",
+		"DMIC01_CLK",
+		"DMIC01_DATA",
+		"DMIC23_CLK",
+		"DMIC23_DATA",
+		"WSA_SWR_CLK",
+		"WSA_SWR_DATA",
+		"DMIC45_CLK", /* GPIO_180 */
+		"DMIC45_DATA",
+		"WCD_SWR_TX_DATA2",
+		"SENSOR_I3C_SDA",
+		"SENSOR_I3C_SCL",
+		"CAM_OIS0_I3C_SDA",
+		"CAM_OIS0_I3C_SCL",
+		"IMU_SPI_MISO",
+		"IMU_SPI_MOSI",
+		"IMU_SPI_CLK",
+		"IMU_SPI_CS_N", /* GPIO_190 */
+		"MAG_I2C_SDA",
+		"MAG_I2C_SCL",
+		"SENSOR_I2C_SDA",
+		"SENSOR_I2C_SCL",
+		"RADAR_SPI_MISO",
+		"RADAR_SPI_MOSI",
+		"RADAR_SPI_CLK",
+		"RADAR_SPI_CS_N",
+		"HST_BLE_UART_TX",
+		"HST_BLE_UART_RX", /* GPIO_200 */
+		"HST_WLAN_UART_TX",
+		"HST_WLAN_UART_RX";
 };
 
 &uart2 {
-- 
2.34.1

