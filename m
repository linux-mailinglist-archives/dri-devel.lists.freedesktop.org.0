Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB88967709
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 16:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E37A10E0AB;
	Sun,  1 Sep 2024 14:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TihVve3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C5910E07D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 13:31:48 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-201fbd0d7c2so27457295ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725197508; x=1725802308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YsKWtzwZWeFCKs3FaZQWcU1tv/xpkAb6aBGtye2T5F0=;
 b=TihVve3wAol5rffPNI5xk401X0khxoXlIcSX4YOTjH3vbsB9zZPhvM55snWfrrWNhV
 IZC4jvu/xRkXFLwhSgmEXh9gFk57T1cd3bJn3dTZAbZPOUnsuUhrVOET6ndi8AoI3OOf
 hsLOcmf/HDBG1fjNWt4DVQ0TVFRASlu0c7MQr/53ZTCOJVqWS4i+qXm/93ajYYOAG7JN
 1WrLib9IW0Srb1RQp1WXU3KMgOw7+SiY8KfQO3OVK09s7kmnVeeRQOaxuaNowUJKxbMq
 df+uzggFhXea3g8/lDEdNH5YsKD62uspzHKq8SpQ7XEtmYIQz3bhtMAJC3DkMXsOp8em
 EcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725197508; x=1725802308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YsKWtzwZWeFCKs3FaZQWcU1tv/xpkAb6aBGtye2T5F0=;
 b=EOPYvSNic6DKIf04jC61AQq9iqig9BSDPrspgX8kePZzujsqw/QzWPtXhW46GCcE7m
 dGFRvQsvUn8FOkR9jMubxjw3FdxaxaMXEuWkqx6+tGsYjsLLMyHJC0gr7OCg1HcnEjJD
 L5dPN5O6RIVxuXxBMceBoQf78YFELJPcvAylaVmDAciuqynvoEJJvpvdhOR4ICQqPGU8
 ON2bo5HMPZhPI0OV3JBfr17a6qLUaGy7cfQHf+j8uzH+tbTqovVuam6uOAToVXhq/TLR
 a/61GhoiZaqXPatu2zU7sZgC7ye8+eHfaJndFJlYNWNqw9Tq2hSNR4PHfXpyZAQohXrM
 C11Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX00XfireQV6ta+nvW3kycVW6D1vYeFdBLnygEDIc82ZgMM8fR1HK+n1XnVJWxWAj0XwjvT845PtwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEr98CXSwmhX/atHFELPZ2sBlNhJbVgUYcOXAFGnJGsJeUoE5h
 LF4Mff4PYaCkvy1RSt/ia/akQzg/vwD3VBuWi8A4FgRdXL/rpPEmyOYhjRtF7Do=
X-Google-Smtp-Source: AGHT+IHQskFo37TXYCxhkNM81uJOuzYc6x2rHUQiqaFyx3ld7bVbcmmjdrJ/L9XTt8DUGUelsCLEcA==
X-Received: by 2002:a17:903:228c:b0:202:508c:b5a6 with SMTP id
 d9443c01a7336-2054477bfafmr50122015ad.46.1725197506157; 
 Sun, 01 Sep 2024 06:31:46 -0700 (PDT)
Received: from eleanor-wkdl.. ([140.116.96.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20515537a2csm52691525ad.176.2024.09.01.06.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 06:31:45 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	thierry.reding@gmail.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 visitorckw@gmail.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] docs: devicetree: Fix typo in lvds.yaml
Date: Sun,  1 Sep 2024 21:30:46 +0800
Message-ID: <20240901133046.962263-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 01 Sep 2024 14:12:21 +0000
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

Corrected the spelling in the description of LVDS Display Common
Properties.

Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 Documentation/devicetree/bindings/display/lvds.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
index 224db4932011..b74efbea3be2 100644
--- a/Documentation/devicetree/bindings/display/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/lvds.yaml
@@ -16,7 +16,7 @@ maintainers:
 description:
   This binding extends the data mapping defined in lvds-data-mapping.yaml.
   It supports reversing the bit order on the formats defined there in order
-  to accomodate for even more specialized data formats, since a variety of
+  to accommodate for even more specialized data formats, since a variety of
   data formats and layouts is used to drive LVDS displays.
 
 properties:
-- 
2.43.0

