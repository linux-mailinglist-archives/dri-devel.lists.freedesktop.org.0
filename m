Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFB6B16CB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B6389322;
	Wed,  8 Mar 2023 23:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8089322;
 Wed,  8 Mar 2023 23:51:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328NM30C027821; Wed, 8 Mar 2023 23:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uImggc5D4ypwE9/xwrZDnSkkgADBMwIpMnndNwAQ8pQ=;
 b=RFLSlMmAiiBuv8gaRL8K6oqXi6mGvo1jKKteAMNf4q32OGB/aIW7j8GDAiN3zS5jLCIA
 J6FkBtZPvy35bngTy20F5s6RtRLreL8CYAAvuxn9TkbD0hIqqQTPEoPfeHYafJQwoVCy
 Ppb2eIo3APQlvSEcvi6eOIJ94STHs3LuWJAm2gJnZPwThOYU/Li7D1zYeZd/c0LAa5eU
 x6XPrgho6hkOkcdoYFIKuDIkPO/Qjv2vumEbuaOS6qeXgW5Tzo8wcAhxm8M7WP4wsfQ1
 DwBZEXAq2v4ZrAGayH3sZm+s/xQE9e4OatP167i/AXAlhZX6N2scxPWeOtFGnd+GGARp 0g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6fej350w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 23:51:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328NoxNg021429
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Mar 2023 23:50:59 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 8 Mar 2023
 15:50:58 -0800
Message-ID: <37276093-4565-03e1-b3cc-7db4bdabc0b3@quicinc.com>
Date: Wed, 8 Mar 2023 15:50:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/11] arm64: dts: qcom: sm8350: Add &tlmm
 gpio-line-names
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, <robdclark@gmail.com>,
 <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
 <sean@poorly.run>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <agross@kernel.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>,
 <angelogioacchino.delregno@somainline.org>, <loic.poulain@linaro.org>,
 <vkoul@kernel.org>, <a39.skl@gmail.com>, <quic_khsieh@quicinc.com>,
 <quic_vpolimer@quicinc.com>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <liushixin2@huawei.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 <vinod.koul@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-7-robert.foss@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221230153554.105856-7-robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ETk2DUqjOOmYfre7yVPMgUeKv20b77T1
X-Proofpoint-ORIG-GUID: ETk2DUqjOOmYfre7yVPMgUeKv20b77T1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
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



On 12/30/2022 7:35 AM, Robert Foss wrote:
> Add GPIO line names as described by the sm8350-hdk schematic.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> #SM8350 (HDK)

> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 205 ++++++++++++++++++++++++
>   1 file changed, 205 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 0fcf5bd88fc7..e6deb08c6da0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -233,6 +233,211 @@ &slpi {
>   
>   &tlmm {
>   	gpio-reserved-ranges = <52 8>;
> +
> +	gpio-line-names =
> +		"APPS_I2C_SDA", /* GPIO_0 */
> +		"APPS_I2C_SCL",
> +		"FSA_INT_N",
> +		"USER_LED3_EN",
> +		"SMBUS_SDA_1P8",
> +		"SMBUS_SCL_1P8",
> +		"2M2_3P3_EN",
> +		"ALERT_DUAL_M2_N",
> +		"EXP_UART_CTS",
> +		"EXP_UART_RFR",
> +		"EXP_UART_TX", /* GPIO_10 */
> +		"EXP_UART_RX",
> +		"NC",
> +		"NC",
> +		"RCM_MARKER1",
> +		"WSA0_EN",
> +		"CAM1_RESET_N",
> +		"CAM0_RESET_N",
> +		"DEBUG_UART_TX",
> +		"DEBUG_UART_RX",
> +		"TS_I2C_SDA", /* GPIO_20 */
> +		"TS_I2C_SCL",
> +		"TS_RESET_N",
> +		"TS_INT_N",
> +		"DISP0_RESET_N",
> +		"DISP1_RESET_N",
> +		"ETH_RESET",
> +		"RCM_MARKER2",
> +		"CAM_DC_MIPI_MUX_EN",
> +		"CAM_DC_MIPI_MUX_SEL",
> +		"AFC_PHY_TA_D_PLUS", /* GPIO_30 */
> +		"AFC_PHY_TA_D_MINUS",
> +		"PM8008_1_IRQ",
> +		"PM8008_1_RESET_N",
> +		"PM8008_2_IRQ",
> +		"PM8008_2_RESET_N",
> +		"CAM_DC_I3C_SDA",
> +		"CAM_DC_I3C_SCL",
> +		"FP_INT_N",
> +		"FP_WUHB_INT_N",
> +		"SMB_SPMI_DATA", /* GPIO_40 */
> +		"SMB_SPMI_CLK",
> +		"USB_HUB_RESET",
> +		"FORCE_USB_BOOT",
> +		"LRF_IRQ",
> +		"NC",
> +		"IMU2_INT",
> +		"HDMI_3P3_EN",
> +		"HDMI_RSTN",
> +		"HDMI_1P2_EN",
> +		"HDMI_INT", /* GPIO_50 */
> +		"USB1_ID",
> +		"FP_SPI_MISO",
> +		"FP_SPI_MOSI",
> +		"FP_SPI_CLK",
> +		"FP_SPI_CS_N",
> +		"NFC_ESE_SPI_MISO",
> +		"NFC_ESE_SPI_MOSI",
> +		"NFC_ESE_SPI_CLK",
> +		"NFC_ESE_SPI_CS",
> +		"NFC_I2C_SDA", /* GPIO_60 */
> +		"NFC_I2C_SCLC",
> +		"NFC_EN",
> +		"NFC_CLK_REQ",
> +		"HST_WLAN_EN",
> +		"HST_BT_EN",
> +		"HST_SW_CTRL",
> +		"NC",
> +		"HST_BT_UART_CTS",
> +		"HST_BT_UART_RFR",
> +		"HST_BT_UART_TX", /* GPIO_70 */
> +		"HST_BT_UART_RX",
> +		"CAM_DC_SPI0_MISO",
> +		"CAM_DC_SPI0_MOSI",
> +		"CAM_DC_SPI0_CLK",
> +		"CAM_DC_SPI0_CS_N",
> +		"CAM_DC_SPI1_MISO",
> +		"CAM_DC_SPI1_MOSI",
> +		"CAM_DC_SPI1_CLK",
> +		"CAM_DC_SPI1_CS_N",
> +		"HALL_INT_N", /* GPIO_80 */
> +		"USB_PHY_PS",
> +		"MDP_VSYNC_P",
> +		"MDP_VSYNC_S",
> +		"ETH_3P3_EN",
> +		"RADAR_INT",
> +		"NFC_DWL_REQ",
> +		"SM_GPIO_87",
> +		"WCD_RESET_N",
> +		"ALSP_INT_N",
> +		"PRESS_INT", /* GPIO_90 */
> +		"SAR_INT_N",
> +		"SD_CARD_DET_N",
> +		"NC",
> +		"PCIE0_RESET_N",
> +		"PCIE0_CLK_REQ_N",
> +		"PCIE0_WAKE_N",
> +		"PCIE1_RESET_N",
> +		"PCIE1_CLK_REQ_N",
> +		"PCIE1_WAKE_N",
> +		"CAM_MCLK0", /* GPIO_100 */
> +		"CAM_MCLK1",
> +		"CAM_MCLK2",
> +		"CAM_MCLK3",
> +		"CAM_MCLK4",
> +		"CAM_MCLK5",
> +		"CAM2_RESET_N",
> +		"CCI_I2C0_SDA",
> +		"CCI_I2C0_SCL",
> +		"CCI_I2C1_SDA",
> +		"CCI_I2C1_SCL", /* GPIO_110 */
> +		"CCI_I2C2_SDA",
> +		"CCI_I2C2_SCL",
> +		"CCI_I2C3_SDA",
> +		"CCI_I2C3_SCL",
> +		"CAM5_RESET_N",
> +		"CAM4_RESET_N",
> +		"CAM3_RESET_N",
> +		"IMU1_INT",
> +		"MAG_INT_N",
> +		"MI2S2_I2S_SCK", /* GPIO_120 */
> +		"MI2S2_I2S_DAT0",
> +		"MI2S2_I2S_WS",
> +		"HIFI_DAC_I2S_MCLK",
> +		"MI2S2_I2S_DAT1",
> +		"HIFI_DAC_I2S_SCK",
> +		"HIFI_DAC_I2S_DAT0",
> +		"NC",
> +		"HIFI_DAC_I2S_WS",
> +		"HST_BT_WLAN_SLIMBUS_CLK",
> +		"HST_BT_WLAN_SLIMBUS_DAT0", /* GPIO_130 */
> +		"BT_LED_EN",
> +		"WLAN_LED_EN",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"UIM2_PRESENT",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"UIM1_PRESENT", /* GPIO_140 */
> +		"NC",
> +		"SM_RFFE0_DATA",
> +		"NC",
> +		"SM_RFFE1_DATA",
> +		"SM_MSS_GRFC4",
> +		"SM_MSS_GRFC5",
> +		"SM_MSS_GRFC6",
> +		"SM_MSS_GRFC7",
> +		"SM_RFFE4_CLK",
> +		"SM_RFFE4_DATA", /* GPIO_150 */
> +		"WLAN_COEX_UART1_RX",
> +		"WLAN_COEX_UART1_TX",
> +		"HST_SW_CTRL",
> +		"DSI0_STATUS",
> +		"DSI1_STATUS",
> +		"APPS_PBL_BOOT_SPEED_1",
> +		"APPS_BOOT_FROM_ROM",
> +		"APPS_PBL_BOOT_SPEED_0",
> +		"QLINK0_REQ",
> +		"QLINK0_EN", /* GPIO_160 */
> +		"QLINK0_WMSS_RESET_N",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"WCD_SWR_TX_CLK",
> +		"WCD_SWR_TX_DATA0",
> +		"WCD_SWR_TX_DATA1", /* GPIO_170 */
> +		"WCD_SWR_RX_CLK",
> +		"WCD_SWR_RX_DATA0",
> +		"WCD_SWR_RX_DATA1",
> +		"DMIC01_CLK",
> +		"DMIC01_DATA",
> +		"DMIC23_CLK",
> +		"DMIC23_DATA",
> +		"WSA_SWR_CLK",
> +		"WSA_SWR_DATA",
> +		"DMIC45_CLK", /* GPIO_180 */
> +		"DMIC45_DATA",
> +		"WCD_SWR_TX_DATA2",
> +		"SENSOR_I3C_SDA",
> +		"SENSOR_I3C_SCL",
> +		"CAM_OIS0_I3C_SDA",
> +		"CAM_OIS0_I3C_SCL",
> +		"IMU_SPI_MISO",
> +		"IMU_SPI_MOSI",
> +		"IMU_SPI_CLK",
> +		"IMU_SPI_CS_N", /* GPIO_190 */
> +		"MAG_I2C_SDA",
> +		"MAG_I2C_SCL",
> +		"SENSOR_I2C_SDA",
> +		"SENSOR_I2C_SCL",
> +		"RADAR_SPI_MISO",
> +		"RADAR_SPI_MOSI",
> +		"RADAR_SPI_CLK",
> +		"RADAR_SPI_CS_N",
> +		"HST_BLE_UART_TX",
> +		"HST_BLE_UART_RX", /* GPIO_200 */
> +		"HST_WLAN_UART_TX",
> +		"HST_WLAN_UART_RX";
>   };
>   
>   &uart2 {
> -- 
> 2.34.1
> 
