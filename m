Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C773565ADD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1366D10E67E;
	Mon,  4 Jul 2022 16:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A4010E06A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:07 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w193so8945114oie.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixFS/lLVzK4AnsiITvXFoWkkOR9udc4jxnq+DXxte8Q=;
 b=ELDIg2fYmhNeuZS++FOlyGI7qQrJirWA67ek/O/GrP5yzY/ghQ4CdkuK7h5/GrW3gr
 1xwOy7pBdAEXa+aDGAa9weODT4On2ZDw/DQBRAWFvHkMJ2AWM4qLDOscQsPsyY8dBSi/
 8G3AKT8MyZz45mv0IKyFDy8dI6aeSrgeE5F5ByhdyIZn+xBCZKv9oReW1msAEYh4MjGO
 LSfUXS4bT3DAs0/ymlxwI00TxQtKcA6il4240yEdOksnu/3EOnu47y8lh8K5T7LZMSpn
 OWaFmFv4txw00507q6C7Qsx5DtJC6b/ODoct1HICemIDD9uq3NVq8up5GIO0LnJnaPmq
 s1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixFS/lLVzK4AnsiITvXFoWkkOR9udc4jxnq+DXxte8Q=;
 b=NFLMaLT6TR0bcnFLr4WiT+P1C4mDKoOu550o3VP3/ygH256duZOIsjf09xB97a586j
 LqKqMz6FLzWQ2gfIgdDuEnrnymnWbiE6UPhnl11v7Sshp1M8UaBeMfDkNI0MLomCE1EB
 Pz44664uAfASNSa9C1/jckYv0kZm+vk/lDPb0oVWFPcjR1gUJRM7R89qX6koP2BhExb8
 tFlQhwBPAtPyObfab4Xs1cUvuTjjjwhjff0IHmNTKusAIHeMP7spS2ULcQaCCvw50CwE
 Isl03EN98Mkf1vNFej1cnIg0+49aYnIsn32z78oJ2DdKvrhqDgFjZDy7uxY7lxX3EXVi
 ESng==
X-Gm-Message-State: AJIora/2f5KF9AGxYsrrt3ccu9i3Q9TinoT0E+6Kl3fJEWP+85pM/gN6
 jW/5xs6ahMqWo3XQLR2IydkhwA==
X-Google-Smtp-Source: AGRyM1s+D4CWrFB7V3Go5Nk6+CmS679ArdDFI7J3XZkIV/vfXB6uXOEqOFaxv/a5Y3dUyi9JYukbJg==
X-Received: by 2002:a05:6808:f02:b0:337:a7a0:204f with SMTP id
 m2-20020a0568080f0200b00337a7a0204fmr4055532oiw.68.1656820626379; 
 Sat, 02 Jul 2022 20:57:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:05 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: (subset) [PATCH 5/5] arm64: dts: qcom: add mdp_clk clock to the
 MDSS device
Date: Sat,  2 Jul 2022 22:56:02 -0500
Message-Id: <165682055971.445910.12967450195410688611.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
 <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 16:59:35 +0300, Dmitry Baryshkov wrote:
> Add MDP_CLK ("core") clock to the mdss device to allow MDSS driver to
> access HW_REV/etc registers.
> 
> 

Applied, thanks!

[5/5] arm64: dts: qcom: add mdp_clk clock to the MDSS device
      commit: 2e4ae611ab73d8e35d6059fc30cb4da4cd568d4c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
