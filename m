Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEF825537
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 15:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5C910E035;
	Fri,  5 Jan 2024 14:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4886110E035
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 14:29:22 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5574797e741so51073a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704464960; x=1705069760; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u39RBCFFtI0yX9VLekdwvDVmxDIhVLYsBRs0wCaV+pU=;
 b=GLYov6UT6DxAxRXJO9uK5FTxYCwvn91WkSfd3g9dT4lPsxrJRnAwgcEM9nK/zT1CIC
 eGcNrIwy8TUbOnEc2ZnpkMaEf2VkggCusCxNDhlKDzbenuvmf5Tv4jgBRqeIhmmVhL4d
 RlONTLc8I73Qn8xwKdPznf+5gQ+RY67Bt9eLnXV8PlcfDUOQcKDUaBsRQ5GuEl3dBerz
 aHI4m+xevpY/8NO7GlTQGCxvf9z05QkD30vGFyq/BKdMDPBYesUlykKRiQGjCIwD1e41
 harXBaCO+1OSl06Yh/MawpUqkfeU1Ppa36/3WPXVncdrUCzoWH5gHdUQXivIoRzR+zWX
 zOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704464960; x=1705069760;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u39RBCFFtI0yX9VLekdwvDVmxDIhVLYsBRs0wCaV+pU=;
 b=GTyefyKi45vlxBn70UbzVrFt9eZ/60ZCEbWgWoYZ7e4DYbWFTJOBtNnEWE3Qn7XQE2
 kZXc3NQ/+uF6Cpw8/MUzw9SWv47MnvykjNmDvYEtG11EOTQTT1rIAI+xbc9TU0lIiSIE
 TLszZ1npDFqUOH5TVzO+o2LbL5BbHkX/LQidcxENQZzNxQPlkt+t6PS//5ts+5kU9AWE
 wM0lPdPN6aTd4595uztw1Ms5LxAk8oqVeBpSeCV2X0FVLgIVESraWsUklrGU43d88MLU
 hvKunmYIkWIJpeT91eSEhReUKpiU0TZIwjq7WFSIsC5uKkgFTBHJehQL9k1V8fDfgaAN
 R9JA==
X-Gm-Message-State: AOJu0YwxVw9gRR9iYJGpIWzxlkoH7osj3YadUZfqlJi7abPngS5poFEf
 XXLw7kQvJ2Ui6GT8vHz04scJADYQymHRBA==
X-Google-Smtp-Source: AGHT+IFC8mQP7zYTa3qScnA9e4FhaBfqsr8V6I6BOY6f96K6u4BAyNvPTsxb81TwxVoCl0xiM/3dSw==
X-Received: by 2002:a17:906:d92a:b0:a28:b12e:324d with SMTP id
 rn10-20020a170906d92a00b00a28b12e324dmr1131944ejb.10.1704464960408; 
 Fri, 05 Jan 2024 06:29:20 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a1709067d0700b00a26b057df46sm927006ejo.126.2024.01.05.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 06:29:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add display support for Fairphone 4
Date: Fri, 05 Jan 2024 15:29:11 +0100
Message-Id: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcSmGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwNT3bQCE92CxLzUHF1Tg8SkRAtTY7NEg0QloPqCotS0zAqwWdGxtbU
 ABQmog1sAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the bindings and panel driver for the DJN LCD panel using
HX83112A driver IC.

Then we can add the panel to the device dts and also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU

 .../bindings/display/panel/himax,hx83112a.yaml     |  75 +++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  62 +++-
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 372 +++++++++++++++++++++
 5 files changed, 510 insertions(+), 9 deletions(-)
---
base-commit: e9ad8e6186dbc420e26d2ffbb05cdce33fbf041d
change-id: 20240105-fp4-panel-50aba8536a0a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

