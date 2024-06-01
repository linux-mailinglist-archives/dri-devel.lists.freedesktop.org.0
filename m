Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F28D6EFE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 10:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685ED10E09B;
	Sat,  1 Jun 2024 08:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="O3ek5nbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0CB10E085
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 08:46:50 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-24ca0876a83so1463641fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1717231610; x=1717836410; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YRv2PtZi00/2hPXILDXcKojI53syn820EUeP3F5EERo=;
 b=O3ek5nbDTvMyxK7qKf4LN9nY88cffM+3kLpshGplX0yPwufA5HPH68CTe0SEtDn7jO
 YRcXhbtWlJuPrDEmGMqbxI7RV46mpPaIz8IrGY4ILrxoEa2prYzJ2GYREeuug647QnJw
 AiJc7lfZSKF1LecBqnPZxu/OgoRNYy0/MtE+oGKmnI37uuDpvPXgMQwSGHY7OoghuarO
 NF2yQvUPinlfrfAZjcuCXiDk38gCJt3GbUcN8w5VmDLIXZKjwGp7A+evsT9+nTXaTBZm
 4wCHtdZ79k56bEGnPISpKChlsJOwd7IFDRUUr4q/jAhhsANsZWnqdikxTOMRap7ILq/O
 lXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717231610; x=1717836410;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YRv2PtZi00/2hPXILDXcKojI53syn820EUeP3F5EERo=;
 b=ZtI8uoSZli5f8XGdxDdg17HUydcpqEEZoAAjLlZQWwdpMSeuGngCXwNvhBzJWU9UfT
 /T80J+Af4qbHkj9T2WMe/AnBaRCHbTNuDcNQ09mRXY5qOSOJRXBpOoL75zAlKUE1B76F
 SvqBKJkAltBaKQsavjSpAzi2UxKexf5mJUOFRzLgV7LVXXiP2WMbEnQuhQXJnRhTfq0g
 KNTe6pP9NcRm/2ApJAJNwqupwjGAIAcsKmHd7cQAosQMKgY78K+ReVx6PWnE8m3rNahS
 csgHY8xyNHx/MitYPa+RFjhAmRepjdX6Gff1FEknr9KoVQ+LBOsHEokqubTmW2JCfkLx
 FFXA==
X-Gm-Message-State: AOJu0YzlvojY8ZEK5DiPcM7g3UWWo3SIV9jh0Ts6C/bwGN8x54qK8Hk3
 1yhCW36TZBFh0wffzsLsnzhEWbdkVUWET/qxbqLbgBH9g29K2CY2PCmvjjQV7Pw=
X-Google-Smtp-Source: AGHT+IGVSORhKrAAAYALmovD6wpHQKp2se+8zqYb9+3qW3OyRhLDwSKSTJGk9/lv6cR2Yq+ifUtYng==
X-Received: by 2002:a05:6870:8920:b0:24f:c95b:acc with SMTP id
 586e51a60fabf-2508bb1ffedmr4480092fac.35.1717231609791; 
 Sat, 01 Jun 2024 01:46:49 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-702423c7b49sm2512044b3a.37.2024.06.01.01.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 01:46:49 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/4] dt-bindings: display: panel: Add compatible for
 Starry-er88577
Date: Sat,  1 Jun 2024 16:45:27 +0800
Message-Id: <20240601084528.22502-4-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The Starry-er88577 is a 10.1" WXGA TFT-LCD panel, which fits
in nicely with the existing panel-kingdisplay-kd101ne3 driver.
Hence, we add a new compatible with panel specific config.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---

Chage since V2:

-  Add compatible for Starry er88577 in Kingdisplay kd101ne3 dt-bindings.

---
 .../bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
index b0cf12bb727d..68c43d2d21a6 100644
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - kingdisplay,kd101ne3-40ti
+          - starry,er88577
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.17.1

