Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8ACA7BE50
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18E610EBCD;
	Fri,  4 Apr 2025 13:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aF0g9kG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC18D10EBCF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:51:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54996d30bfbso1917161e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743774662; x=1744379462; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7oeYXE1eEK0nqbgFOnEoB4sUF240CvHswwo7c3zgx8c=;
 b=aF0g9kG0jcbuUFJaujVYHP4aQkt9Kmpv7U51QCjNJ6vagpGOiBYjYAEzM6ylhMlQCQ
 j9uRhWroUq/v3j6Rs+6PKxVsSSnQ8zP1PUAdgOHj+BHORJW96Gf/htoETcVzUzTIetqL
 PMgFwOjTTCdIb+m8x3jC3NAjU5FCTABiM+MrCvTA+IDjcwGqHPd3AlJ8ZiLGN3bdVMLs
 yR4/TRun6EqLrgmgqBQ+ykFS3TtVXfLCesTJMRJkppQQalc4xCq3hki6Z0iOZKzGZV4O
 jcCnmRpznbLgcgDPZbLblVUZbbt4GxEPmvaSGjUiUIHWD0atjuEMY/bANmgzsXvEWEqZ
 UfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743774662; x=1744379462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7oeYXE1eEK0nqbgFOnEoB4sUF240CvHswwo7c3zgx8c=;
 b=KPT7XKwVBv0rX06ZzkVAKLE0QL87n1BinzFqZURP+WBlkqx4Tr1lUo0ZQL4zEP1O3W
 awkA2pke/nWPuabmFFtn2MHHVHocm0xd81QbyVAb5b96UOYhacm0rlCTwDLMcd7BVdaL
 6r5SEz7VEMDGDRbzeE+KGssMxTRcfNhgGIJq6dGBQDZQCs/SPRsDJP0toer0K8Zc5R5W
 1Xgc2I7Bc7IIJv7ykW6eP5YTUUS0orAiwm0viXvVxzCjtNmOOvQOke3GhUkqHHOq1J7r
 1SHWrhhVr/eHdbjak7R5BguQum8qTsPPPz/WF83b2TQvqaUX+cdche5vxMT6gET2c1Bh
 ggLA==
X-Gm-Message-State: AOJu0Yy5iuxlPLwXz1l8qv0Lblej6QmOY1tDoBU1yB1EgCJaTMHZolGO
 SW32D32LfPQmo2/SVSfuDJtyXDA6daRb9xpJkaALkZ4JFX3zs7Ao
X-Gm-Gg: ASbGncu1aidqR1EuEaNsjQK1ceQORp6XMaX2vH8fcSQJDdMxUmHSuP4mEmqmGlQ/nyi
 PQEcNJMRXYuft62hz7Vev7MhlQ+HywpcwqnYs0GIMawJvtLBp2kzsAiaqD69Iukuy/oAkc06NKZ
 b+dSF+CcF58JQsBT/hnBTaJcpWFuGAdc4Xua0GL7cLpsYrwNLE7Uka7Ohi0jHFBtqljVvAWDSiK
 8ABVEhuzGVvsMaHozUGj+Vsdrwt+TVDi3H64QoMyPAPJWpuB70fDCDFwht2/HCAKZldZYaZgvna
 FlXx441mvqQVFkIhoVoRDgs0FaTrrQMIHXFvyjhIVkysqmZecOgk3PWSn6hurYzOfE5NFE7C8Gm
 mgSls1mwiX7NUYw==
X-Google-Smtp-Source: AGHT+IEKYC0A+OIpvVVeNH+HCV3q86I0QOTaSCNFYghvEZatVGd3VxKRiKDc4eoS0KWXVEiU7uTTCA==
X-Received: by 2002:a05:6512:39c7:b0:545:1d13:c063 with SMTP id
 2adb3069b0e04-54c227787famr786251e87.14.1743774661912; 
 Fri, 04 Apr 2025 06:51:01 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 06:51:01 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 04 Apr 2025 15:50:34 +0200
Subject: [PATCH v2 3/3] MAINTAINERS: add antry for Sitronix ST7571 LCD
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-st7571-v2-3-4c78aab9cd5a@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
In-Reply-To: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=odqQ1fjz8HbSFH/9v9/SL1blNBS1x7rL6Pk/QnF6N+E=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+O7/dA1u7aRKnjw6v3db5mxgQbrWUlUP9vgE
 4r8qX5FcXmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/juwAKCRCIgE5vWV1S
 MpcyD/4q8hgZGdDxFkgpIrAFE6ODVzre4mi3fTpe45o99a6PX2GMAHLSBepOd5lLY3Dc3hY2FLZ
 p3GMptImSkppxlb/YZbH6uRzksUyy/1Iinx/QpxHW8VTa4AJnK04Os4Mp5uOcwMd+6SweW/E6ab
 YFr4H4WH0TRBTHXo7hLnx0iqqqOmZ4THTtxJs7EGhBuF1dn/ioNK2tfYx9xyUMXd/ouzyiMl/ig
 lsq17CTKtqD27zULsC+hJr9jUCpFbCYUKs+vlHh1U6oiEGogux5fzg716px5OhOi1vvIkxWTC1D
 NqSEWMB/kYzSKvx2LhXY3C1S8ZCBof11zTrEtUNXsRKfvRl5lPcx2v/+doH0srAmsTBbT1d+y2c
 7w/gXse04tJT7lmPdVKgT379wB/f9VHQx3nn7FuB9vz9hx31MVIGsLQfh2F0ZPnkLsiaJC/IHmy
 vCfihSShL2kA/sJJnomTBHz1TLjMEC8Q5UlqxbAH9PuYb2FmLSTPOKDm7Oml9zDtg7QThJNWfCL
 qLfaM35vVyboldv/b1M77a58/bFt+1GvcUtDNcnK5mQkPmOz2UbtDnbDQzf2hJIfDC25BYGOzGM
 SoEFcgUaMa3TOUM0X1vMtbi4PDL1Frt39iBe8GOSwl3AQ7CKMlOKTZE+M+8EbDdS5Cc/nc7f67M
 PyVjW+lrVYuHZjA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.49.0

