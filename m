Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5B6576D4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 14:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FDC10E1A2;
	Wed, 28 Dec 2022 13:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596AB10E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 13:11:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z11so6904729ede.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F6wwrS7RcdUciPublS8eDzKLlrNTuJCUJ8yWm395dEU=;
 b=HQID7UlXuGYljA8lWzj1CBVUHd9+8294st7MpCGh2yB+noGxikCM/UEtjIr+GXSLlI
 UMh4Puq91qpnhMLj9Ota6dO4XoHI0ASsotTZ2vxxSGiZ5wXZR8ruJXKeIheSjJwAWFOj
 j5MPzCX4xL6NTi/ZnZmTLOzDA4yJ9Pnw+mCF/92PFZ27HdnNmxHWWdhe3yXvIWYpZfDD
 EGnQ4Uvd8jHsLMGSR7LI1ZxSW7/eOHH3+wst5JG1N2q4p32Abi+NHg/2/v0/rg0TyyEn
 JAhYV4rSq/7p125wk5oMCOLhTZKPALdn02lg53eCe1+8vHS3APpdKDZQYAO0t4N3la1f
 F1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F6wwrS7RcdUciPublS8eDzKLlrNTuJCUJ8yWm395dEU=;
 b=K/Dm4DUg1wES2QM0Bq+so7jErpNIeBQ3NYI/tTRqL3V5LBsysSEDICAAQjOVySupN4
 dyFC2D62NpeaGxswd4tK4uKtukD6MC/b8gcpt9y3OQXFqjkmtVQeKSn883zZX+gBMWHa
 2+35etZFkaH9siahJ8G7krPBi6i1CRbweGNnv6lJnZBXjy1jvgI2c9ECKhcmzR+Zlsb9
 aYoA1wFuK22p6PVTRajHBMZrrexq1YNBNjD0/5FRq1Cu0eiJABUY8csat4TXTWx6lhzk
 zDGB4/dUcTqxMKaOnbPgrJoyOpQ5tOjpgbj2UCARNjMugvvA8HgJ7Dwy5ueVYb2cgtX5
 S0/A==
X-Gm-Message-State: AFqh2kpz1Z5un/u6JF84JwVeLnvhQv7JpeXIkswYQNIL4OUp70/dcSnG
 1guox8W4gUpOKcxTAybNlPoJKQ==
X-Google-Smtp-Source: AMrXdXvCEIaQ/+rAZCjHFzbt62dc75UuPXrtdkwyrRSmtxO55O1twdfpHfhj6AE0hBMtXuZXr06Y7g==
X-Received: by 2002:a05:6402:528e:b0:481:420e:206d with SMTP id
 en14-20020a056402528e00b00481420e206dmr15879206edb.42.1672233072828; 
 Wed, 28 Dec 2022 05:11:12 -0800 (PST)
Received: from planet9.chello.ie
 (2001-1c06-2302-5600-85f6-04b5-1651-3b6c.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:85f6:4b5:1651:3b6c])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a056402180b00b0046bb7503d9asm7099545edy.24.2022.12.28.05.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:11:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 0/1] Fixup documentation for dsi-phy-28nm
Date: Wed, 28 Dec 2022 13:11:09 +0000
Message-Id: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 bryan.odonoghue@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the one remaining patch I had from a previous series for
mdss-dsi-ctrl and the dsi-phy. The mdss-dsi-ctrl set became a bigger so I
split out the 28nm phy fixes.

I'm resubmitting with Dmitry's RB as a standalone.

Old: https://lore.kernel.org/all/20220630120845.3356144-1-bryan.odonoghue@linaro.org/

Bryan O'Donoghue (1):
  dt-bindings: msm: dsi-phy-28nm: Add missing
    qcom,dsi-phy-regulator-ldo-mode

 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.34.1

