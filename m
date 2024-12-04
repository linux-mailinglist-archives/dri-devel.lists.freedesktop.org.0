Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8DD9E37A2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D992110ECC6;
	Wed,  4 Dec 2024 10:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gZ3BH4SY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F9310ECC2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:36:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-385eed29d7fso487176f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733308599; x=1733913399; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CEBWDAJs2F15pzwyozxNKYhFYdToRnM6LzIW6iWekBk=;
 b=gZ3BH4SYZVQ5Ax53NNzo5xieuHV9Njyi8BheOX0nRNfPI4ZR8BYzpPpFx8TZ5xQSWF
 ZlwjPaWqr5YYiqcu+9aRPmmvq3NscEdUVZB51hegAisUdcj51xIonBqpFSynVU9xiDcB
 6jxkScCeEzaKPfDCOU8mB2I6RoQq+bXDyPNHb4mIhs9MaV23W2uZ3BCY75vZDfdR7V7u
 x4vR6UzYDJXszx5fR/Ta69RdNvX8xA16aIQf0/fcdc5KkXkpu1vzlC3bF7jR/gMYwUCB
 NfdR0AWcXQJakBjZpjjZlXm03YDFP/stkTEzvmtjBP0F7VzDyhb4b0ZxU+GbI+WQ43K5
 0VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733308599; x=1733913399;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEBWDAJs2F15pzwyozxNKYhFYdToRnM6LzIW6iWekBk=;
 b=Wxb0sIOPxqdcrPbplRNx6oOlvhsXHyNZZ/XA3DvAN5aam8lP9tCnWYsQd7Oc6IFyp1
 6WB47bJMEKHwM70d0RJGPrCNqf1XOXmXNQ9QBilMw6OirIOxQWlLBAzRncrOusuGpCsT
 v6B2dzJ/WzSI35ma6Z/4jdGYmgHBx2UxzMabNY0J/iOA2h918SPU4sLlLtfHRTt/yU31
 KN4MO7bu8E9NlR+mckhnT/1z4TkzrCxTFnP24yCQj4ZGpe8QCtCxQyDaj5giM+3IYpev
 JTipXtkj4REWug4qyAjq1hdhEAc3Mfih0nqrIsITLz+R6G/QCW2G0u6b0XZCegqNW3Sk
 OTjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5f0GedwSqrNxiCJpRhiTFwLqfsmBYhPDMLsTSXF7IDqWXZ8b915Q7RVtg7/5E+fVOJqv7v2836WM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNbQXaqgxcq8dALPDXDMwgsnT1dkgKYkVTW5StPC/8wBHExoFZ
 IYFP1HTS33pwVQ8WgqnRiB9MUss1wJcDtZW296DBdFzh3VcLT87zOrJS+XlsFVM=
X-Gm-Gg: ASbGnctNtmyItZ1eH/GWWGgodtXFS2Ag3u8v8w3UDPkc8Yyjem3eXAe+PtOfXN99wfG
 MpsY99N4gJxKv3hLVL+Eph90xj8kC5plRdbhYXlZDxvvVKr8qPtM24p0cBp5jbqAEzLVWa5fijg
 W+unZ9eJnJl/BJW8qwuc7w+uf7rpEbk0BTblELtT5Cuiya7xQ0b8mvaBrfmYa2WCikSR1feC4Kg
 mNuTj4xPs5Yw2oCP2SkL5kVy9p/Md1TbUNZYzq/moFEVLN62CEXKO+iy3jdoDYxwgvKEaY=
X-Google-Smtp-Source: AGHT+IE1eKytGYhN/G2avEbscWDzaqM2N9y7QbNLOqIY3WvlHqBjWYhCRVwGHZqF/ZoYxBdvoZSCOg==
X-Received: by 2002:a5d:6c62:0:b0:385:f010:e5f4 with SMTP id
 ffacd0b85a97d-385fd9b6c06mr4026493f8f.28.1733308599326; 
 Wed, 04 Dec 2024 02:36:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df74157asm15409391f8f.0.2024.12.04.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:36:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:36:37 +0100
Subject: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the third
 interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
X-B4-Tracking: v=1; b=H4sIALQwUGcC/x2NwQrCMBAFf6Xs2YVsrFT8FfGQJpv2HZKWrIhQ+
 u8GjzOHmYNMG9ToMRzU9APDVjvIZaC4hrooI3Um7/wo3o383nZELrDIVu7Xm+OSzHhGTaiLcca
 XZXIyh5yjhEC9tDft+n95vs7zB4azNaN1AAAA
X-Change-ID: 20241204-topic-misc-sm8350-mdss-bindings-fix-1701baffc1aa
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=peYrt415YULllPSwRUnKU5Qx+NDdGSX6LQbwju+FB9U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDC1nleUyZQQLS9gEd7//NknovstellbNGR/a7EQ
 eyLt7XiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1AwtQAKCRB33NvayMhJ0YhkD/
 9U3qDvqecaANAURilULho5J/RjI0flxgZwbAVSkj2UH7c2Ifm0TEJm/PNkwLJgE/jIYZ8DP4o7qTt+
 x4TRZVYeu+QVirVM/e4z8PMgI0scaCwmrwkdjy1dyUlUxXxyZc2tUyOSpsnBmBSqmwb8SCvUoOKhSy
 NTXIvoP2J0YLDMTUryjNP0av/W+9k3Tw8wgy7lse1tXil3MhdXbufiSstkS2MZs9bFuYOvz8leUOR7
 8QE3Fa7FTMYdTWEU9dEwIPqnMBcmu4C8yfbXiWRnru075t6rcT2BKyvA57BY/PYjSYFqO3BTOt7HND
 YcHxVfEDXY7pNe0j1mZ+HQce2nCGEjtWyS8LUDPfntDpf3PaySc0ESyeu32Xm6Z1+2fvufXlUds3rV
 +Le2js2U5SQq2nFRXXzxLltckVq+6122EV+MD2N9ElD180lTFrNXXqSxEHHG+S+KlhuYTGRX1pHBKg
 iNrRGeE+97Ueyk9r1QXJ0whDnFsz32k/VHI7OkelttMYUdUm3HXDuTqyDN+7GcJdFgLZXwe6FFbBuN
 sPd5SpFM+y42SNCOMeiXfZ+DoACTRda1hBRWWGk2oO685P2uFJV21NN7b32MOQ9CJ04CXRQi/d26aK
 jvUGV67nUXQyNFkZiU2Ndxm28uPmob6GYdVFptyfrE08LgbJ8tRqnB1fB74A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
found on the Qualcomm SM8350 platform.

This fixes:
display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 163fc83c1e80cf07383f9aef510f2f58a26e1ecc..cd9c6c78413f887c984b522f83cc7e437ce97d25 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -38,12 +38,13 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 3
 
   interconnect-names:
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

---
base-commit: 667ff2368867af7000ce32a8b3fc025c2b3226b3
change-id: 20241204-topic-misc-sm8350-mdss-bindings-fix-1701baffc1aa

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

