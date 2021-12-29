Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D386C481593
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 18:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF9F10E22A;
	Wed, 29 Dec 2021 17:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5304C10E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 17:04:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id o6so88563949edc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fairphone.com; s=fair;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
 b=N176GTGT9uTNBM/lNHY3viroE2j7RNyzIAGjMDuxaY+V0D1fgSqOgdkj7epPgiTGPt
 JWs++rwSKtKOm00NQTTSStWwOJAStrOxAXAt31ULVJ2KERgnhgR6pvu0ofJFWHOL6N/N
 gvr3SgzulkVNvRJqBhZzf/7YojmoO3mNH9a7R3l+a8wI9KrZ1dEIgJqJAwb30a8rUpdF
 EpGRJhVSJBas722q8AlK2fVsJHVnE77VwOG1RrcE/pXZm1zV2Fa8/fxGVRDDpVrVz0sn
 oDd+5LJnq3SQELHBtEqC8W6AivL8O+5qMg8275X6Lb02g/2IBnn5DoF/JKj1k7nj1cmk
 kGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
 b=Gm/kQmGM2NqvqbLHGGZHnLjH2H/j4Bgnja1+P1mu5pRmQ+vw8Qd/dSxuaYBm8WzHvM
 8gE/GkEsCGfY5oVW98qQEv7bNDd+1PONkTDacVRAWBA2saNJEOXPACsurG/lURzIxe7Y
 YEaZRkIiWbZ7gQBh4NJydt9U+shL2BdpCeCcgXtXjnB06hz7F1C2bkycOcflPiIYcrpV
 Ntvhi9Teajitun17SD5rPqMcMTjgQk3A89k1kMwKelnrmZdwoZxNAqwRm+P0VCkbPnpo
 0TMHYidtP+P+tyzNI28xr1HJzp9igioL4oEawwj+iWHFBQuuD6CpeZv0o3NGF8zCUlLu
 Q+pQ==
X-Gm-Message-State: AOAM5327jrvZUgPLYi7MwtqTMWFd7Ye0DkZul+JQe7SU8EXPQB0mnTA3
 EsSb8aIG+ZmRwVer+7C7bCHNSQ==
X-Google-Smtp-Source: ABdhPJx7fmCGVyYTONde3Afz2YEg3Ytza6u1AKO88xPsobuwvKKB+blwvg5emdFPJYP//+ZNe1xong==
X-Received: by 2002:a17:906:5603:: with SMTP id
 f3mr21611529ejq.272.1640797470828; 
 Wed, 29 Dec 2021 09:04:30 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
 by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:04:30 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L compatible
Date: Wed, 29 Dec 2021 18:03:55 +0100
Message-Id: <20211229170358.2457006-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the compatible for the wled block found in PM6150L.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index d839e75d9788..1c24b333c6e2 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,pmi8994-wled
       - qcom,pmi8998-wled
       - qcom,pm660l-wled
+      - qcom,pm6150l-wled
       - qcom,pm8150l-wled
 
   reg:
-- 
2.34.1

