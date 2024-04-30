Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F28B748F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 13:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9DE10E06E;
	Tue, 30 Apr 2024 11:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VuTmflJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69E110E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714476797;
 bh=0w5YEUbbQDmxnlY8WtAQqQUNXq1ZpWckW2j0exEtYoo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VuTmflJDRloBpily1/ruHfyUL3wBKRo8vjc089iaNA6WTIitox0oHlZKj3G3NG0X0
 mS+JttWzMev1kV1P+VdS3e4AUOSF1QaWwKDKm4okHRhIaVFb4Dg9ADIKRlf2vSJS1B
 eJZ91QMu1Z++FORYq7A5b3WL8h3gxxRKg2F/wbVVdj2WgoHcFGg2T0a4jZPjR7v5sh
 iNvcyhun6D6B0v6o9i0HDjqM6DnuG+9vXAupSxWgePPtDyJOxDZDvQjgHuJCEWgm0/
 CnOP9O8Wo1CHhT97AVpD7ILlGt93ADClJWOu5zBNCWNvGixaiUEpUFdpXOeOUuLsaz
 a5vbFNYJKfDnw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D3CE37813C4;
 Tue, 30 Apr 2024 11:33:16 +0000 (UTC)
Message-ID: <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
Date: Tue, 30 Apr 2024 13:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 30/04/24 12:17, Alexandre Mergnat ha scritto:
> Hi Angelo,
> 
> On 09/04/2024 14:02, AngeloGioacchino Del Regno wrote:
>> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
>> NIO-12L with both hardcoded paths, OF graph support and partially
>> hardcoded paths (meaning main display through OF graph and external
>> display hardcoded, because of OVL_ADAPTOR).
> 
> Is that make sense for you to add the DTS changes of these boards into this serie ?
> I asked because, IMHO, that could help to understand the serie.
> 

Yes and no... but I imagine that you're asking this because you're trying to
prepare something with a different SoC+board(s) combination :-)

In that case, I'm preventively sorry because what follows here is not 100%
perfectly tidy yet as I didn't mean to send the devicetree commits upstream
before this series got picked....

... but there you go - I'm sure that you won't mind and that the example will
be more than good enough for you.

Please note that one of the reasons why I didn't want to add this to the series
is that the following changes show only a mere 50% of the reasons why we want OF
graph support on mediatek-drm (but mainly, it's because I didn't have time to
actually rebase etc :-P )


Cheers!
Angelo



  .../boot/dts/mediatek/mt8195-cherry.dtsi      |  65 +++++++-
  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 153 +++++++++++++++++-
  .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  24 +++
  3 files changed, 231 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi 
b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 86d283ffe807..b05b6bbd457c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -267,12 +267,29 @@ &auxadc {
  	status = "okay";
  };

+&dither0_out {
+	remote-endpoint = <&dsc0_in>;
+};
+
  &dp_intf0 {
  	status = "okay";

-	port {
-		dp_intf0_out: endpoint {
-			remote-endpoint = <&edp_in>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dp_intf0_in: endpoint {
+				remote-endpoint = <&merge0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dp_intf0_out: endpoint {
+				remote-endpoint = <&edp_in>;
+			};
  		};
  	};
  };
@@ -287,6 +304,27 @@ dp_intf1_out: endpoint {
  	};
  };

+&dsc0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsc0_in: endpoint {
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsc0_out: endpoint {
+				remote-endpoint = <&merge0_in>;
+			};
+		};
+	};
+};
+
  &edp_tx {
  	status = "okay";

@@ -481,6 +519,27 @@ pmic@34 {
  	};
  };

+&merge0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			merge0_in: endpoint {
+				remote-endpoint = <&dsc0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			merge0_out: endpoint {
+				remote-endpoint = <&dp_intf0_in>;
+			};
+		};
+	};
+};
+
  &mfg0 {
  	domain-supply = <&mt6315_7_vbuck1>;
  };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi 
b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 88a0035a31a5..982572d7bfd8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3077,14 +3077,6 @@ vencsys_core1: clock-controller@1b000000 {
  			#clock-cells = <1>;
  		};

-		vdosys0: syscon@1c01a000 {
-			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
-			reg = <0 0x1c01a000 0 0x1000>;
-			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
-			#clock-cells = <1>;
-		};
-
-
  		jpgenc-master {
  			compatible = "mediatek,mt8195-jpgenc";
  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
@@ -3143,6 +3135,38 @@ ovl0: ovl@1c000000 {
  			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
  			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&vdosys0_ep_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
+		};
+
+		vdosys0: syscon@1c01a000 {
+			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
+			reg = <0 0x1c01a000 0 0x1000>;
+			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
+			#clock-cells = <1>;
+
+			port {
+				vdosys0_ep_main: endpoint {
+					remote-endpoint = <&ovl0_in>;
+				};
+			};
  		};

  		rdma0: rdma@1c002000 {
@@ -3153,6 +3177,25 @@ rdma0: rdma@1c002000 {
  			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
  			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint {
+						remote-endpoint = <&color0_in>;
+					};
+				};
+			};
  		};

  		color0: color@1c003000 {
@@ -3162,6 +3205,25 @@ color0: color@1c003000 {
  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
  			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color0_in: endpoint {
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color0_out: endpoint {
+						remote-endpoint = <&ccorr0_in>;
+					};
+				};
+			};
  		};

  		ccorr0: ccorr@1c004000 {
@@ -3171,6 +3233,25 @@ ccorr0: ccorr@1c004000 {
  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
  			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr0_in: endpoint {
+						remote-endpoint = <&color0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr0_out: endpoint {
+						remote-endpoint = <&aal0_in>;
+					};
+				};
+			};
  		};

  		aal0: aal@1c005000 {
@@ -3180,6 +3261,25 @@ aal0: aal@1c005000 {
  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
  			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal0_in: endpoint {
+						remote-endpoint = <&ccorr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal0_out: endpoint {
+						remote-endpoint = <&gamma0_in>;
+					};
+				};
+			};
  		};

  		gamma0: gamma@1c006000 {
@@ -3189,6 +3289,25 @@ gamma0: gamma@1c006000 {
  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
  			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma0_in: endpoint {
+						remote-endpoint = <&aal0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma0_out: endpoint {
+						remote-endpoint = <&dither0_in>;
+					};
+				};
+			};
  		};

  		dither0: dither@1c007000 {
@@ -3198,6 +3317,24 @@ dither0: dither@1c007000 {
  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
  			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither0_in: endpoint {
+						remote-endpoint = <&gamma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither0_out: endpoint {
+					};
+				};
+			};
  		};

  		dsi0: dsi@1c008000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts 
b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 7ab19b4e046f..b4a7dad2fea7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1063,6 +1063,10 @@ &disp_pwm0 {
  	status = "okay";
  };

+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
  &dsi0 {
  	status = "okay";
  	#address-cells = <1>;
@@ -1089,6 +1093,25 @@ dsi_panel_in: endpoint {
  		};
  	};

+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+/* old hardcoded dsi stuff, disappear!
  	ports {
  		port {
  			dsi_out: endpoint {
@@ -1096,6 +1119,7 @@ dsi_out: endpoint {
  			};
  		};
  	};
+*/

  };

-- 
2.45.0

