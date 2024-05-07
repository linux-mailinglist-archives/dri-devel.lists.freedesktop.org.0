Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCF78BE7E9
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C3F112202;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OmCgz2GA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4835B11225D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-34f7618a1f2so767344f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097331; x=1715702131;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=yXS5VajCSTK3v9W31Qq62RjCeYKSVh+QNoTBnWyhQpY=;
 b=OmCgz2GAMjt+amjdvwVAnfrITUzjygZ2xZcYpAgZdhWsVBu1BqU9u7P6LFmIfYzHQU
 fr71a0QgqHRlqH51QHj2+8fKi7iBbwc+MOBaoCZai9xG6trg5S8CsarJN2j7Mrcgdv/3
 +KGIg9xGxonpgAkcyzfNPPeFhrBwSdIHSc80JHqzLJ0Mm6HS5uPSQ8r3CxQdAPu0iGc8
 5qtaxWs9A1qfbZ0lg/QXY1yFArzPMvM5WnXWePtAkrOHLPPDf8naS76k6cSvTUKQpFM7
 6BEFGpLyVPigUIu3OtROivxiTe4dX6vQNSJZHOU38jFuuU3yhyUYowj+yjqrIsoJKmjj
 7TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097331; x=1715702131;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yXS5VajCSTK3v9W31Qq62RjCeYKSVh+QNoTBnWyhQpY=;
 b=I8/gL3hdUSk+std9QBRVxH8sHH+lrBrAD7mtcw7CKu8vy4Zfw8uMt0AmhKKf2CJ1CZ
 nxZczpuq+B3xsc0FCsuYaoPNv7hUNdvMIPYbCrkgZMGzCcCAgv+284VrEn5uxQtjkQCB
 9TbIK9mQR38ULg7RmlzdI5JK48yx0UwGficoDroW3g5eDqUzyLnxVGBheS9xon969hC1
 y14tok9NyIbe5KFTTsL1cfmMNVo5LiR0oPKvzriX0mEyGiHBNl2pB2MxgmKZuMecfxNT
 oO0e89XLiyfV9Y9d0aUEpyZG+LJ2AOV1cO8jeqtdIJqUM1DdGdTVg64jYv6alrqj9PGu
 vIUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbTRiqW8U3eJSBs5bga2734u38NYvibcZ1XwAisOp+XyatuCwZIlwEy1oA7kA8v2gshLpjqojhQqR22rTQ0mjvp+w/JX5TQg79Vzyc+PbK
X-Gm-Message-State: AOJu0YwUG5l5jpzK9amLotTGYVg5FtKVgqaxhBHNj1JTJ1WMOEOH2MZI
 aH8ik2/VFO9ih/JxiW+GDJR0/83P8v0Dj+gPHSd0XOFx4wJWYyMN+9N7fIfI86l1CwfXjb5beEh
 /a7MIGU5tyQ==
X-Google-Smtp-Source: AGHT+IEOC3rOHQV8YVJAKI1i9P3AoSJkILWdGHZJdDgg4sdQ1vQUA5cL0b88ZoFM3DAb5X37SFDTdxDsbHrrgA==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6000:912:b0:34d:71ca:82fb with SMTP
 id ffacd0b85a97d-34f81747f25mr7345f8f.2.1715097331600; Tue, 07 May 2024
 08:55:31 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:13 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-11-panikiel@google.com>
Subject: [PATCH v3 10/10] ARM: dts: chameleonv3: Add video device nodes
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Add device nodes for the video system present on the Chameleon v3.
It consists of six video interfaces and two Intel DisplayPort receivers.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../socfpga/socfpga_arria10_chameleonv3.dts   | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dt=
s b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
index 422d00cd4c74..daafcc14e8cc 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
@@ -10,6 +10,200 @@ / {
 	compatible =3D "google,chameleon-v3", "enclustra,mercury-aa1",
 		     "altr,socfpga-arria10", "altr,socfpga";
=20
+	soc {
+		video0: video@c0060500 {
+			compatible =3D "google,chv3-video-it-1.0";
+			reg =3D <0xc0060500 0x100>,
+			      <0xc0060f20 0x10>;
+			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		video_mst0: video@c0060600 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060600 0x100>,
+			      <0xc0060f30 0x10>;
+			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst0_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_0>;
+				};
+			};
+		};
+
+		video_mst1: video@c0060700 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060700 0x100>,
+			      <0xc0060f40 0x10>;
+			interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst1_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_1>;
+				};
+			};
+		};
+
+		video_mst2: video@c0060800 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060800 0x100>,
+			      <0xc0060f50 0x10>;
+			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst2_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_2>;
+				};
+			};
+		};
+
+		video_mst3: video@c0060900 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060900 0x100>,
+			      <0xc0060f60 0x10>;
+			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst3_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_3>;
+				};
+			};
+		};
+
+		video_sst: video@c0060a00 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060a00 0x100>,
+			      <0xc0060f70 0x10>;
+			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_sst_0: endpoint {
+					remote-endpoint =3D <&dprx_sst_0>;
+				};
+			};
+		};
+
+		dprx_mst_irq: intc@c0060f80 {
+			compatible =3D "altr,pio-1.0";
+			reg =3D <0xc0060f80 0x10>;
+			interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			altr,interrupt-type =3D <IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells =3D <2>;
+			interrupt-controller;
+		};
+
+		dprx_sst_irq: intc@c0060fe0 {
+			compatible =3D "altr,pio-1.0";
+			reg =3D <0xc0060fe0 0x10>;
+			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			altr,interrupt-type =3D <IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells =3D <2>;
+			interrupt-controller;
+		};
+
+		dprx_mst: dp-receiver@c0062000 {
+			compatible =3D "intel,dprx-20.0.1";
+			reg =3D <0xc0062000 0x800>;
+			interrupt-parent =3D <&dprx_mst_irq>;
+			interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dprx_mst_in: endpoint {
+						remote-endpoint =3D <&dp_input_mst_0>;
+						data-lanes =3D <0 1 2 3>;
+						link-frequencies =3D /bits/ 64 <1620000000 2700000000
+									      5400000000 8100000000>;
+						multi-stream-support;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dprx_mst_0: endpoint {
+						remote-endpoint =3D <&video_mst0_0>;
+					};
+				};
+
+				port@2 {
+					reg =3D <2>;
+					dprx_mst_1: endpoint {
+						remote-endpoint =3D <&video_mst1_0>;
+					};
+				};
+
+				port@3 {
+					reg =3D <3>;
+					dprx_mst_2: endpoint {
+						remote-endpoint =3D <&video_mst2_0>;
+					};
+				};
+
+				port@4 {
+					reg =3D <4>;
+					dprx_mst_3: endpoint {
+						remote-endpoint =3D <&video_mst3_0>;
+					};
+				};
+			};
+		};
+
+		dprx_sst: dp-receiver@c0064000 {
+			compatible =3D "intel,dprx-20.0.1";
+			reg =3D <0xc0064000 0x800>;
+			interrupt-parent =3D <&dprx_sst_irq>;
+			interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dprx_sst_in: endpoint {
+						remote-endpoint =3D <&dp_input_sst_0>;
+						data-lanes =3D <0 1 2 3>;
+						link-frequencies =3D /bits/ 64 <1620000000 2700000000
+									      5400000000 8100000000>;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dprx_sst_0: endpoint {
+						remote-endpoint =3D <&video_sst_0>;
+					};
+				};
+			};
+		};
+	};
+
+	dp-input-mst {
+		compatible =3D "dp-connector";
+		type =3D "full-size";
+
+		port {
+			dp_input_mst_0: endpoint {
+				remote-endpoint =3D <&dprx_mst_in>;
+			};
+		};
+	};
+
+	dp-input-sst {
+		compatible =3D "dp-connector";
+		type =3D "full-size";
+
+		port {
+			dp_input_sst_0: endpoint {
+				remote-endpoint =3D <&dprx_sst_in>;
+			};
+		};
+	};
+
 	aliases {
 		serial0 =3D &uart0;
 		i2c0 =3D &i2c0;
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

