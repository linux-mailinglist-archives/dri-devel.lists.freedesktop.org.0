Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6128A2D5B3
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 11:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026B110E0CA;
	Sat,  8 Feb 2025 10:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Y2F55EcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD7210E0CA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 10:53:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fa0c039d47so4034059a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739012018; x=1739616818; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbs6wjnY4vaySC1A59WocF0CXdHs9avCvrqKoElPFA8=;
 b=Y2F55EcECCBCwQCHkSR/m2NzTqLUJe8oYjekUta6VN9xkAH8v8wtYtGueziRl429LP
 rbOSNAOYwzGXTeAfCdYnhX2KhhH0ny8y35+Fc59g4NMqwHJAClPZ9VHWdFDtZtBskqxQ
 XAospOmxAXZKXg2pz9SFUmvJvGcpe9a0dEcseEtwxW4xXyAvZkDcTA4pek1sc7e44/4z
 rzvA/ueOd2ZMGGjz7BPMeU7zEecIrAp9vVmk2OV9UN4gkrupR83ESMKUy6wZVKl0S5/+
 O6MvpOSYoXFtHM3UVye6NZWV7EOKwMQDXvHa/OXwXXN664CFXB3dFd0kCHEbWDVRVPOC
 AhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739012018; x=1739616818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbs6wjnY4vaySC1A59WocF0CXdHs9avCvrqKoElPFA8=;
 b=SIVDaublgr7IZK9GaAWvZExft89vXJyjAaWIHjGYhQFs55YBJdNuLhAr3KSqd22qPl
 VDx/uTJh3QMwRg8skhr86/QoeoFP1FNmcy7q/fclJqgMWYPQRCia9xmbDVcxLcPVDrbu
 WApvBNRZP16qbVPh35N14ciNuLuLwVTeDArFPnIYEh4yix0F0cdShP5jiYLzcQlQhwqN
 uLn+Dhi82iElZESQ0b2vj/v0AiqOPaLSdVgux++8l827zKFC8LGssNsgYXdFYVN5bsjo
 l7EREwglQRPxynQA+aT4/IFnbtYzhnhe1vnCZwoL4UQvX3bfluRV0Qa0gPU0cx4u1tpE
 pkMg==
X-Gm-Message-State: AOJu0YzYQF+fSI0Xv+7OySi0vDcLRexOrtNFRO+CsshdD9hbiSzBfej6
 efBQ4fH9KifYvZQIt1BOaNZz98TfYAYk1ZyuivvjE5TZfgFiKpTRH2nsok7eMsw=
X-Gm-Gg: ASbGncuixssaZDcAEyg9p8mBoks5dGZHbekSUgnl4fDkFLlwV7YYPXczczNbxZbmJVh
 cluaSsxb11RIKajMu8XLj/tObBTsK2geUbAwwCUyv385YxeGBRNuVZazQZYoUJXLTL2333qBFvt
 co5Difwi8+yWE76q4SuWL9XKeP/rzaOpRvpMEycXpHQ6CsatSlBR6zGLhTgPPJdDu0xTwjLXEJd
 flTAl5Z0sKmVABRC4OELWN+JAvcPUZO5wdIM3651s03ieY3WqH+hknrzDWdblDLyqkFeiZyvsnC
 FSE4OHhZh3xeWDRIXfxbmjeCZbkjH8N3rDrA/oIbf/oOcn3DH0F954G2mSAe894=
X-Google-Smtp-Source: AGHT+IEV5Xl0wWYrSrkRkZ1oHtQxnN+LgtfamxZdI4uYbBB3qhpK+ue4hvRde3hbMze7Nvuo6PH1TQ==
X-Received: by 2002:a17:90b:4aca:b0:2ee:f80c:6889 with SMTP id
 98e67ed59e1d1-2fa243ef19cmr11273338a91.33.1739012017749; 
 Sat, 08 Feb 2025 02:53:37 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa36f185c5sm2142003a91.16.2025.02.08.02.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 02:53:37 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible for
 the panels KD110N11-51IE and 2082109QFH040022-50E
Date: Sat,  8 Feb 2025 18:53:24 +0800
Message-Id: <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
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

Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
add the compatible to the hx83102 bindings file.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index d876269e1fac..e4c1aa5deab9 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -22,6 +22,10 @@ properties:
           - csot,pna957qt1-1
           # IVO t109nw41 11.0" WUXGA TFT LCD panel
           - ivo,t109nw41
+          # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
+          - kingdisplay,kd110n11-51ie
+          # STARRY 2082109QFH040022-50E 10.95" WUXGA TFT LCD panel
+          - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
       - const: himax,hx83102
-- 
2.34.1

