Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1D86680E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C91C10E5E8;
	Mon, 26 Feb 2024 02:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JDnG4n+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1382A10E5E1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-512f5484a37so1396031e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913517; x=1709518317; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JHkrFptKcAQS2aCzc8WX8fmPvNb0p9xnGPcIrFGOzfk=;
 b=JDnG4n+XPCHX3TOfsjxLuRxz5ofgQE7jcZVzyOm5+ofKAEMaXLcHC8J8uuGdkfCB1v
 qhwHkAgSsED9j33oKqOjSNat8so+U9T/45Hs2Zhk1KiwLcncKuJHNScA4r8/K87wzkRa
 2JNLIs1OIlEi9aXLiMFrVc6pdi+k+dl4S8IX0Iko7M4wsmuxoklzyRN+9a0WHtZau1sK
 40arQbGtbUhBbF/jwtvfDjxCsfkPZlV1Sye6MoHQrUDg7O5IpJUDCRJS9adKwXsaEXpj
 C5OsMwtXqp0YCyID+oduqOOSj4WEFz2vGT6Pw+bhWF8tsSJ6iMowNhNiPJAge2YQSr4G
 o76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913517; x=1709518317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHkrFptKcAQS2aCzc8WX8fmPvNb0p9xnGPcIrFGOzfk=;
 b=uot6yH4ygwKhR9z26JtNF5S953g3ovsmfXddyrbYeWTkbqnuiiCO3csYh+0iZfjCNT
 3HZucX+b7irDLQUMm64hcsqJgkqEEcUMNqz7DWkO6JnorUfClgEOGIUtrkPj7boEr5d8
 x/f5fb35xTGubEsUrdlPNW9NiV89aJgNr8566+L02sCFApXV5zAXVsZzaAc2mkTK7x14
 3P318/N2tcJu9QUAJhIPlgazUYouK8Ddyx5JOSGbUmJNuvqEJcE2SaQ0jXBih74zWj2Z
 ATAYoNLE1FMPe8ReXyFJLQ3chLu4OQJeA2+4hqAyyflj2weZlBV7u2pTJHvbIks07Opl
 oH2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk/apYvjiFNGapdU6K9FVtmB1JMav5abED8vBih9GTV13fwb2ZiWgK5sE5NwHLhBoh4muu16RwKvUstv9bqg2RlOX/x1QnUhhFMcVpm/ml
X-Gm-Message-State: AOJu0YzH/Z+yXNPho3yl4NPk8+rLWgVNhR0TOwMnDZAIeHvQv43KUSz4
 e+wSn6oysWqTrm0tUuXW+kWwJ2VIDvDu3BfEnZTU1Tqcme6BqUsR4dUn+mOueOA=
X-Google-Smtp-Source: AGHT+IH52ochobAvFKf+WD9za0SwYxt9EWXFefY7/8dMoH9mYPqXj6QRJWC6EpE/aWO39BrHfbLQGg==
X-Received: by 2002:ac2:5dca:0:b0:512:ade9:ab55 with SMTP id
 x10-20020ac25dca000000b00512ade9ab55mr3320058lfq.20.1708913517088; 
 Sun, 25 Feb 2024 18:11:57 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:47 +0200
Subject: [PATCH RFC 11/12] drm/msm: tie regeneration of shipped headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-11-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WJAciFwr1hQdTciXOJ66qPYz2JQPrCax+6yI1HNHRek=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NiSW1p5kKdo+GZ4dM4rtQKoNKgQiCmFpqNg
 MQvEgRqyfmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYgAKCRCLPIo+Aiko
 1U/HB/9d+h5AEgdqMUN84B6Qw/zOhfMOAfqt+n4aDbrXbDTtSADPY/JTWpB/cLH0SLGWTDosz2U
 aXdAn3/oE9u82nq43lgVZrPEUf3vVcxbNiLvCQIQpsBC0/otnVfunZD9L6C+Z9WrcCHTeKf42wp
 U33HDrRau3WjnEDJSs5mwYCyOm+H3pUzr5uUfjf8OQ2hrThEZ2dr6+QVYpRNnV8uEEZ4w9BWETW
 pfBuRQkqK7BPfkTDnQEQMQBPhZwmVcJPpE/mMpH8WXwIO1uAxYkLQIkaVX+pK5AzJ4o13OufhMI
 OB12UGhi5Bd3/tosxExuNMCPIqWCFgEOdKeYn/UDtkTdpqo+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Finally add support for regeneration of the shipped autogenerated
register headers. Pass DRM_MSM_GENERATE_HEADERS=1 to make to force
regeneration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile             | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/.gitignore |  5 +++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 89c9f5f93b85..a19ad02bd701 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -180,3 +180,30 @@ msm-$(CONFIG_DRM_MSM_DSI) += $(msm-dsi) $(msm-dsi-y)
 $(addprefix $(obj)/,$(msm-dsi) $(msm-dsi-y)): $(obj)/registers/dsi.xml.h
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
+
+ifdef DRM_MSM_GENERATE_HEADERS
+
+hostprogs += hg2
+
+hg2-objs = \
+	headergen2/colors.o \
+	headergen2/path.o \
+	headergen2/rnn.o \
+	headergen2/rnndec.o \
+	headergen2/headergen2.o
+
+HOST_EXTRACFLAGS += -D_GNU_SOURCE $(shell pkg-config --cflags libxml-2.0) -DRNN_DEF_PATH='"$(srctree)/$(src)/registers/xml"'
+HOSTLDLIBS_hg2 = $(shell pkg-config --libs libxml-2.0)
+
+HEADERGEN = $(objtree)/$(obj)/hg2
+
+quiet_cmd_headergen = HG2     $@
+      cmd_headergen = $(HEADERGEN) $(shell basename $<) $(srctree)/$(src)/registers/
+
+$(src)/registers/%.xml.h_shipped: msm.xml.h
+	$(Q):
+
+msm.xml.h: $(src)/registers/xml/msm.xml $(HEADERGEN) FORCE
+	$(call cmd,headergen)
+
+endif
diff --git a/drivers/gpu/drm/msm/registers/.gitignore b/drivers/gpu/drm/msm/registers/.gitignore
new file mode 100644
index 000000000000..2e422e71e590
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/.gitignore
@@ -0,0 +1,5 @@
+# ignore empty files
+msm.xml.h_shipped
+freedreno_copyright.xml.h_shipped
+# unused files
+edp.xml.h_shipped

-- 
2.39.2

