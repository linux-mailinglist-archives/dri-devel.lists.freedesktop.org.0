Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E349851477
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F5C10ED30;
	Mon, 12 Feb 2024 13:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ruoZny77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F7710ED5D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:39 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-33b0c264abbso1861808f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743678; x=1708348478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=oX2+cr2GJmybLTxSkR2z2RsI+0zR7H0TC6zqB4mg2qY=;
 b=ruoZny77gVL+ZDHHhF5wyAqi4FNJmQeXzCVTWCyy+NPDGJZoOeRP+iF1JhUk4HT+B8
 pgb+7/45UfBUOy0+GnFeYTolOJWb3T4HiJpwtOh5wWBj1khwLhdLfrFpAZKjpOmDiSU8
 lN4BoLzOmzhS1KlaCBdfzXXA8BQ/0OR7VDC3BX1Pc2sal6lokkeB2ZBe+W9ReQ94anMO
 gZgysznEZrjZZc7broHNQRub2lkXHFIiJAPH/bEzUX8s9RT4Pd6df3wH1jIqoARdgN7B
 4MCa6TTH8y3ucDP2eHQ2Yw2gws5xe74wm3fzLj1ylCSYfPdwXhxjNPEtocn2b4FFtWaU
 /XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743678; x=1708348478;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oX2+cr2GJmybLTxSkR2z2RsI+0zR7H0TC6zqB4mg2qY=;
 b=GC+Lu6QYvhxwixOpE5XfE1tw0S8CjUlM1McZIDOrmPuMT0Y5PyS1MKbtIXuOy8Zhzk
 dsgJmDQVtFsK8VlUe91G5giikhwVkH6aK3Zst6Oto4iIw9SuGnj7j/J4rqfiemUNzrUe
 r39BdALd31frmNmo0tk1UqtQFbFrzk4nBmo4zRBvIgDGRy4oELQz5j1DD1F0n7RdsWHY
 HT+cR1UWeOvUYIjeTbuiYtKbhXDd6ZFhFz5oE13kqpgalMmWcKfuZ52wJicmw7j2k7vj
 qqniZDzSyraqahk7kqH2zAXBv8XUCU4YrMcGsCX1sK4o32hbqSM9T1OJkzb6bkcnmLsZ
 mUGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFPh0plbV34fjVjZWZiMhSMdBNN8IG9HcBrIvK3PO95YkvK7pXG2Ine5RESCj+B8Xvsrvj0syUMoA81fL10mC4OYG251MmUmc1KhaQfjG5
X-Gm-Message-State: AOJu0YwxbDwrYZUI2T+p6WYYo8XANm18SQsxaL1BNmxguuMZu226DWXe
 Mrw3GBrq+UAAFSVVj2GV7ZtHBo3FAmh/wbWsFs4xlffdZKXpHX1bkaXetEpnoSplmEXznstAW38
 czWp6wrEZcg==
X-Google-Smtp-Source: AGHT+IFkFcklODkA+IZce15OW7imyMehYzYa0bp9Q+4UUqUKMp1QHbHOQZVoAphFa93JEGMlAaRIokbaJqszdw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6000:1751:b0:33b:8f6:2a77 with SMTP
 id m17-20020a056000175100b0033b08f62a77mr15650wrf.2.1707743677947; Mon, 12
 Feb 2024 05:14:37 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:23 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-10-panikiel@google.com>
Subject: [PATCH 9/9] ARM: dts: chameleonv3: Add video device nodes
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
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
It consists of six framebuffers and two Intel Displayport receivers.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../socfpga/socfpga_arria10_chameleonv3.dts   | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dt=
s b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
index 422d00cd4c74..9bc0c1672b18 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
@@ -10,6 +10,136 @@ / {
 	compatible =3D "google,chameleon-v3", "enclustra,mercury-aa1",
 		     "altr,socfpga-arria10", "altr,socfpga";
=20
+	soc {
+		fb0: video@c0060500 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060500 0x100>,
+			      <0xc0060f20 0x10>;
+			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			google,legacy-format;
+			google,no-endpoint;
+		};
+
+		fb_mst0: video@c0060600 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060600 0x100>,
+			      <0xc0060f30 0x10>;
+			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst0_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_0>;
+				};
+			};
+		};
+
+		fb_mst1: video@c0060700 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060700 0x100>,
+			      <0xc0060f40 0x10>;
+			interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst1_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_1>;
+				};
+			};
+		};
+
+		fb_mst2: video@c0060800 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060800 0x100>,
+			      <0xc0060f50 0x10>;
+			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst2_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_2>;
+				};
+			};
+		};
+
+		fb_mst3: video@c0060900 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060900 0x100>,
+			      <0xc0060f60 0x10>;
+			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst3_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_3>;
+				};
+			};
+		};
+
+		fb_sst: video@c0060a00 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060a00 0x100>,
+			      <0xc0060f70 0x10>;
+			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_sst_0: endpoint {
+					remote-endpoint =3D <&dprx_sst_0>;
+				};
+			};
+		};
+
+		dprx_mst: dprx@c0062000 {
+			compatible =3D "intel,dprx";
+			reg =3D <0xc0062000 0x800>,
+			      <0xc0060f80 0x10>;
+			interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			intel,has-mst;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dprx_mst_0: endpoint {
+						remote-endpoint =3D <&fb_mst0_0>;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dprx_mst_1: endpoint {
+						remote-endpoint =3D <&fb_mst1_0>;
+					};
+				};
+
+				port@2 {
+					reg =3D <2>;
+					dprx_mst_2: endpoint {
+						remote-endpoint =3D <&fb_mst2_0>;
+					};
+				};
+
+				port@3 {
+					reg =3D <3>;
+					dprx_mst_3: endpoint {
+						remote-endpoint =3D <&fb_mst3_0>;
+					};
+				};
+			};
+		};
+
+		dprx_sst: dprx@c0064000 {
+			compatible =3D "intel,dprx";
+			reg =3D <0xc0064000 0x800>,
+			      <0xc0060fe0 0x10>;
+			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				dprx_sst_0: endpoint {
+					remote-endpoint =3D <&fb_sst_0>;
+				};
+			};
+		};
+	};
+
 	aliases {
 		serial0 =3D &uart0;
 		i2c0 =3D &i2c0;
--=20
2.43.0.687.g38aa6559b0-goog

