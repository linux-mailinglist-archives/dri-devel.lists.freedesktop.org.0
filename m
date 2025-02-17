Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C7A38995
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008F910E556;
	Mon, 17 Feb 2025 16:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DxVnnOM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43410E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e064eff5daso94890a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810507; x=1740415307; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N+5aoDlUUPJ10rJqXrmf7ktYiK86nyUI9p9lZazil40=;
 b=DxVnnOM29sIrfPPrFOTV0wK3w3NJl5zBTGPGOZYz6kF8nLy7E+ZKHOSv8/Zmf32FXQ
 /eW8Wi3hP7D5URPVZpCfXjm9yQzJfiGQPW01GHOZlQiEIC1K2jR86L0uRLN2OlZ9Se3h
 kZ5fWJcLGP9jX0wcwtkafeen2lIFuSta42vLUr3/7HmpA5RjBdGdKhLQoc+i2rqWhqB2
 pwgGOi/ULzHHm2twDeoPfgc3MkWNNbnLd92X6QfzzUBJDXmxs0eSJMEggQR0aWh0rCGY
 rTn1UjHVauZ59DSMLcG7x7edt+bIW4N1JTG4BAXxtwV7ztHMsHLszGQWqpypb+F2tYzk
 /EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810507; x=1740415307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+5aoDlUUPJ10rJqXrmf7ktYiK86nyUI9p9lZazil40=;
 b=P8LDzzZYJrXEJd44U9QD8gmdVE2BeikxTbQStD/lU6e8jRoVI1ZpwpCXcsrA1QtJUG
 OgYi0bCyWEHEKibnyl4zCnrcZk02x1J7BTkvW7bFMUi1w7st16X8h6HJnTcKnuU6hhTp
 GBylfapqSRc73zwnAXaFVNwwFvdhlONjXsEz5yHXfoER9Ihnsm5yPNk8/j0GDq6+lUHT
 QYtadGS/ejQqomjKRVSYWn5hom1+wX66gVuPPukicOMkRPjm1S8t7mZxKC1ko6401f3H
 cxaVgNeMD4MadIToqN/VOkrnTRcP2rXk4RnWJvR33E7bXIfJJDw35cwhF3gPjcgIcAdP
 NpMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZLyk6Qi1vZVHScZhQf7jy5zP3Qpc6XLu5kJJUycL8K+ApVrrJ2syVNup/ubD64kO4HisDFgcCwpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydtX7ID3WMusu3VSppv/AXOXkZFvY7hD1PsGL6w/ZoS+NAPWwz
 RTB+r8oLzzstczmkWXXlsAQHo49VVc3T6hciF0PfzyQDg7JDKdT4PNHm1VIapA0=
X-Gm-Gg: ASbGnctuazyN+t7ST6vspX8DeMrc0dHRXU6Nez2USsN2LkBdrodY6QjePtBsbw7z/Jj
 eGp8qA8n29v0sKZMpYtxWOWyC0Nh8TI3q2rJ/oo/UnkjTwrwFiYJsSaJ6Uu7TiOCgx9Fr61ySKk
 X3r83cvKau1QpT3oveRBvcMBugqT6ARcipaCyg02QgE9X7gQyYoGKKBQ6Yc7ql9IYQ3tygsjqwI
 bXFyXGZFWjBx3Vb0XV6dZIsihsWtFfuwWJdVMe0bIkUSNMvwOsLkr6Mw5u9sU+oTs1rTGl9be1X
 x8bJ4QA3MdXaIVH/Af18Y0pdQvRtvW8=
X-Google-Smtp-Source: AGHT+IHRBktJ2CMWFcJl7zTzhiegmw14O+ej0MwM1UHqZCG86dEftz5Cx0FG4ED7AqXi7Fd5goBe5g==
X-Received: by 2002:a05:6402:5254:b0:5de:b604:355e with SMTP id
 4fb4d7f45d1cf-5e0361b8ac9mr3287589a12.8.1739810507589; 
 Mon, 17 Feb 2025 08:41:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:23 +0100
Subject: [PATCH v2 02/16] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-2-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wf+CuC28ypTqu4EQD5hdI+GDr7Fn9S7Y7CIcU8MS5oE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a4hP1oKS+5fk1zOVCpOHjK18I1sB8j5kDHF
 64DS60m7cOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmuAAKCRDBN2bmhouD
 16czD/47KDXygwBuqAB7VjF3Nql/EcBgYmDNCQH4Vs9GqJpR/YCiOStKlTsIY6A1WCHPP2arpML
 ojcquVoxXC8dRFfPRP/YjI7pLQBU4oKV9C9P/cfdWSS7uKCjKp0hlfhnlJ1rYVc9ekvDTgu0egr
 FqMKaiUncDx00ORd4/IYAAJIrtfJYsmEd7MlC079iIJDd5JxwTiRvoo/5p6AJOWRQho+aIkPje9
 BVzoCrWGm+ZcqMErfsYTVSJpgjHY/Vf1sDl17MFejYyEXPo1VcQyNNblxsrZ2NwghOgXsItXXIC
 ltZuyEsoG3n+eisguigZElJqHvSBU/+btT+qDZOlP609DaYmw0wjDPl7hG80perADV0fhnocOJX
 /LI8FnN42wi3zxxhX55/ZkhX9eCzKB977V+pbOMiJeBxZBBPKXkEKdL15BIK9UzL9oT0KFDtN3u
 QcptUq2QZANSehzBqMJEQhDCW/4J642FUT6UZKYT6eOB4LVvXnSTFvK72KVohvYqkoOXARq2FMd
 GFHIqugLpTSp3EmuaUgA30u1gI80jpK+9X95fL37bTZLkp/ptIAPRcVp7ml20DYHmm9KL69wpJa
 L7wVyFHHsyKMNuwOSpDizRAw2AqmLewg9LLQhC1QfejxGtnEBYkKeGzytxIeUKAphRlyJXSC9kW
 JCeb2pfpCCbcZtg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e496e5430918d54b2f07f1d5b64de85d29256951..2aab33cd0017cd4a0c915b7297bb3952e62561fa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0

