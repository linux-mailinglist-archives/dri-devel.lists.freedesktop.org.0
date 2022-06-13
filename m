Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A85484BA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABFF10E42A;
	Mon, 13 Jun 2022 11:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4B610E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:13:16 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z17so5439917pff.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hf4jIbSC0d5YY8s9rqomM6DgVm8XNv+YrOYwUOgBoNA=;
 b=LXWqlDW2i8o2CD+D6fikYhundWq6bCB6giHGiPurlzrtGHlwsplK3mx8a1NdxqTICD
 wQUiqLRKDT8VJLctE8Qyo1+yYsGZFNdBFubmnLWippbPRgB6MF9yVDZQoRuKJIdueXwO
 FM0jRPYl1fOnL/6rWLdXogGSFa2a5FpcWfZvQwec1lfsdVIoykmgXW9fd6LWHSAckdDP
 uxwPG0WS7/ESWkyuaAWgiASgRQQTdn9KLVQX1N8MvZI5kykft1vw8fvoOyjrwfEHNHKq
 p+yMOHkQEeFAkgJboqBBrgVM9NFCYLmM+itqsX9KU3HC5HJKe4SKoCUiaIXnJh74LlB5
 p/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hf4jIbSC0d5YY8s9rqomM6DgVm8XNv+YrOYwUOgBoNA=;
 b=7oesj+9ZDaEHGs2+H3XTTgmmeWJWfJHprg3/PhR9gKr5CDj/oqCDBrHjnBDdoVx1Af
 PjiPX17OQSojRkJbC/WQ4WVFV50Xp4BPcJYK7ULlDDWgYp53ZEE+s7o4DXwpoVh03Nhs
 ih2wfiQq4ltDEoG2PVK9M6i5y8Aq4smZH44Nc6yLgpQDvnOb1YwwOEQIr6qK53f3L/1B
 /05p6NmNI8vyLGLJ0zCMnvIGA+cxwSPoTl7OPAN91vNsv305ghp3vYsfii0ldjCg0ff5
 LDtAGPOi4CVznaWeu11UZWUk7+L7ot1cwXOPsKag9Tpv466M/quvLowh7maQrTiy0QBH
 vgpw==
X-Gm-Message-State: AOAM532kuZ1NQjIdfj4IF1xZr5YeJrHYz4YgCbc3xjtDzQcEipgHJFJ5
 PBAHC/UNmoi36HuiFgalAUc=
X-Google-Smtp-Source: ABdhPJy91L1cAhQPwaeU8vYLmrVlKb6COYEVKqbPaII+8J9gUc3Xz+wkNkvJMcJwWCAFDLtI1fb5tQ==
X-Received: by 2002:a05:6a00:18a9:b0:51b:f63b:6f7c with SMTP id
 x41-20020a056a0018a900b0051bf63b6f7cmr47127824pfh.49.1655118796098; 
 Mon, 13 Jun 2022 04:13:16 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:13:15 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC sysfs
 guideline
Date: Mon, 13 Jun 2022 19:11:38 +0800
Message-Id: <20220613111146.25221-8-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiaEn Wu <chiaen_wu@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
new file mode 100644
index 000000000000..039b3381176a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
@@ -0,0 +1,36 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage0_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
+		higher measure range(1~22V)
+		Calculating with scale returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
+		lower measure range(1~9.76V)
+		Calculating with scale offset returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 TS_BAT ADC
+		Calculating with scale returns voltage in uV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 CHG_VDDP ADC
+		Calculating with scale returns voltage in mV
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_temp8_raw
+KernelVersion:	5.18
+Contact:	chiaen_wu@richtek.com
+Description:
+		Indicated MT6370 IC junction temperature
+		Calculating with scale and offset returns temperature in degree
-- 
2.25.1

