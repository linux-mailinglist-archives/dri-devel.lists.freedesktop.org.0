Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B22672855
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7582510E831;
	Wed, 18 Jan 2023 19:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518B910E825
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:30:49 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id y8so24442593qvn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 11:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/52S2yQO347VCYnw3lcgURc+RsitVzGCjZgdtUF6R2c=;
 b=B2/cZWZAuvHw0Rt4dcv6ipWOsx/xa87RiYmMSjt40gPQiuZW28kSOCN18cHj9JEHYD
 JlP5e57TRa7JOqyxL/ZljMb4hA0UTkb08WLbJzclztGei8o3eRLybHFr25EV70aQ/iK8
 vK2izOMFI9OAEj11M/H5SfB8e917SA5SlbFaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/52S2yQO347VCYnw3lcgURc+RsitVzGCjZgdtUF6R2c=;
 b=U5zsG4bDUZ672jnKKFZAmPX0qqXhOD1srNmLR6nBbd62gpRT5TmZxRwLS9oKLAhUoK
 K0wzMWhoWX/FenoxH/RPdOHRp7RYPnXKxw2ekrMn3JPQlMC7JnEQLwfo8uSlf6S3/+tT
 mTazKJaoccki4a4VFdI+YzLbIbZz2ZeWZTlVDAtY+FXS7zhooUpdwiMzi59TxB6PCSOt
 q4f1skXGUHmBZ1ByFaeigy+gz1gTeuhCVxXhTBtYSz1SLDnQk7brVNzre7HE5zft1wXa
 9X9/ucXJwlYfAdODOYf/1VHRP3w1tfN8qyf6PCyiyfj2Pk9i3xl+iShFk/sFfsOm1h7z
 AmNg==
X-Gm-Message-State: AFqh2kotPsi0ulZF13SRMcwBAyryzzQbUL9zp1Y/piWddYQGBFfTWM5t
 gGu+cil6nAIYP+YbktrlbeRcPw==
X-Google-Smtp-Source: AMrXdXswgWPxSK5vtG8KVOUpiv1dsMdMlTWhfTgij9ORwe5l2o9VqGfzDsuK+S7FR81euFwjYj3agA==
X-Received: by 2002:a05:6214:2d41:b0:534:e0c4:226d with SMTP id
 na1-20020a0562142d4100b00534e0c4226dmr10247851qvb.16.1674070248272; 
 Wed, 18 Jan 2023 11:30:48 -0800 (PST)
Received: from localhost (29.46.245.35.bc.googleusercontent.com.
 [35.245.46.29]) by smtp.gmail.com with UTF8SMTPSA id
 f8-20020a05620a408800b0070543181468sm23215117qko.57.2023.01.18.11.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:30:47 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 08/10] dt-bindings: msm/dp: Add bindings for HDCP registers
Date: Wed, 18 Jan 2023 19:30:13 +0000
Message-Id: <20230118193015.911074-9-markyacoub@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
In-Reply-To: <20230118193015.911074-1-markyacoub@google.com>
References: <20230118193015.911074-1-markyacoub@google.com>
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, hbh25y@gmail.com, marex@denx.de,
 ashutosh.dixit@intel.com, sean@poorly.run, abhinavk@codeaurora.org,
 javierm@redhat.com, arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, Mark Yacoub <markyacoub@chromiu.org>,
 quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 lucas.demarchi@intel.com, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 robh+dt@kernel.org, christophe.jaillet@wanadoo.fr, maxime@cerno.tech,
 rodrigo.vivi@intel.com, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, markyacoub@chromium.org, andersson@kernel.org,
 dianders@chromium.org, swati2.sharma@intel.com, manasi.d.navare@intel.com,
 tzimmermann@suse.de, bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

We'll use a new compatible string for this since the fields are optional.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromiu.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-13-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20211115202153.117244-1-sean@poorly.run #v4.5
Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-9-sean@poorly.run #v5

Changes in v2:
-Drop register range names (Stephen)
-Fix yaml errors (Rob)
Changes in v3:
-Add new compatible string for dp-hdcp
-Add descriptions to reg
-Add minItems/maxItems to reg
-Make reg depend on the new hdcp compatible string
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v4.5:
-Remove maxItems from reg (Rob)
-Remove leading zeros in example (Rob)
Changes in v5:
-None
Changes in v6:
-Rebased: modify minItems instead of adding it as new line.

---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f2515af8256f..17d741f9af86 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -24,13 +24,15 @@ properties:
       - qcom,sm8350-dp
 
   reg:
-    minItems: 4
+    minItems: 5
     items:
       - description: ahb register block
       - description: aux register block
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -154,7 +156,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0xaed1000 0x174>,
+              <0xaee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.39.0.246.g2a6d74b583-goog

