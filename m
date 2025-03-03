Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DCA4BFC3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6760E88BE3;
	Mon,  3 Mar 2025 12:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="grmau2Za";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178388BE3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:05:13 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54964f8ce4bso1096960e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741003511; x=1741608311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZbRg4EAl+//ILxj7dao5FHZeWZVMErRSC6VDwPgGXM=;
 b=grmau2Zau7A384Bgs7KqPl7JUS9LKAZzI5LG6oNglNUegn9zpme/tHWxoFhtupMZYs
 NvblgMxTqaUJ/XmUi9zMQxZwplzytqCArVQEAeopo1s+i+Qr+n5LVXMEAYPhkW1QjV6A
 gddwajki+xdG6OI95pMip5Tb5ZzUsuaCKrMnU+CrEqnjRJCF96+Qt2iINp7uzbT9RWr3
 m4T/vxjAemJOB+CGuU067iHj9HhvEQNrkFVCjUAyqYi/c8PqjL+BoilbqtD+FfQGeP3G
 qXGbDVLyGX70oepftL4uIi6qPzSoiV56+EQRWcFceljP+JyO3/Fi3z78OWeF3+0SlwVq
 Fzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741003511; x=1741608311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZbRg4EAl+//ILxj7dao5FHZeWZVMErRSC6VDwPgGXM=;
 b=jQjzYidteWtzSHdVezW8XDzaH+HWs9Lhl3CyyOMP1fiOqHzeeeXS0p+tHVa3hX8n4z
 EYdOPdOoB4hG1DIaSdqAhxqHoFlo60yMpS0zizzz18Cn51SbyTRvtqwNsfVGmhbU/613
 LctL8sGvFJ5lWDQ12IWf7DrBb+oQ+4xrKPSFIFkHh1cSswAFqasrcObKN35azMxzu5FW
 +VHnaQWrUqgKVAvLhkGsZByV7y+VFM0BrDRGLJnrSMwEK7sRLPvD2CrBr4Tby9hCToei
 iYkoMZN6yr1zOjL0kVU2PT9s/1eFeGd9BA37S72VM8D0jnd7WCekLk1Y8vm5GD/W6uPi
 cFUw==
X-Gm-Message-State: AOJu0Yx2CBS3DNCLqQP8mhMvZtYL5eH5tVQiPFtfFyGq3ePnB2uSkJDl
 3V+j2aseCS2MoJYdmebRWsgGL4cy0z5wBsT0dp57B2OaWnhYXSyK
X-Gm-Gg: ASbGncvs3YsGNYoGcnjiZQsEJ7J7g2oUWgSH7Z9/qvw13wPNHAM7QYnFXrJcy8caBS1
 FkZ6rBNk6HPyjbKXdGZRBK3yDzAA9i/XsxNPNzzJaNvL/JA2iNzVZqK6pi+rndNSvZJkLTbu3FB
 /2KEJg23dZyail6qLUipzIkXpXizvqUUxDJOb+wV9ejINXUW2s4JV3rASiqwJhTUQEh+oKu+wJy
 mHMHqZ4fLGMh3HfEMAe5eZsOL7pJ15Uz2oojRv9sXkOv8eKFlNcA8Lz9M/kVOWLVBEf3hlNqEUZ
 xd94WkR5lzlDYbN5CpcPCkCy5A5QRsu9RL8t
X-Google-Smtp-Source: AGHT+IF/Q0oGm1Q9MPyNXdByKkwXSQ32YjxUslcjcvqDeHAcJMc0URzg5RQfPoQyXKBi8STKc7rvQw==
X-Received: by 2002:a05:6512:230c:b0:549:66c9:d0d9 with SMTP id
 2adb3069b0e04-54966c9d394mr1256627e87.53.1741003510684; 
 Mon, 03 Mar 2025 04:05:10 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549576b88d9sm869095e87.12.2025.03.03.04.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:05:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: display: extend the LVDS codec with
 Triple 10-BIT LVDS Transmitter
Date: Mon,  3 Mar 2025 14:04:53 +0200
Message-ID: <20250303120455.90156-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303120455.90156-1-clamor95@gmail.com>
References: <20250303120455.90156-1-clamor95@gmail.com>
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

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 6ceeed76e88e..24e89c1d0c76 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0

