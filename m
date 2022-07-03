Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85631565AEB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D65F10E293;
	Mon,  4 Jul 2022 16:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE9110E06D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:12 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10be1122de0so1887299fac.7
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UR/oI/Q76VxA6HU7lRgndk3Cfr5LCInpXcddK6lqF5s=;
 b=lQv1BdJni9Px/WEEhsnaFpO5GuaonU55zc14yKU+LSh+octtrDzM1XiRp1pREg7zpd
 fZUNGjJu2ArjO1UeuXLMvUC+N3x2fFvS3oYa0UWpXv/tHHWIhxlGaXIh4jgYquQ5VQ18
 0ysDWH5JXOzKCi6yu80CtbJvfD0YTmgnVcqePfeqDhQkASxogm9fPiPkHDLU/AQ9KIEE
 441A+lz8K+Mku+YxDfWHY1cUqU+75PQmD8SpR2+OqYu1Vq+R1WmyS1EHsicjWoRMj4p8
 bch0TbdRy/txwR2iIPoQJID/3ifmU9sePRuGGuEEufMJ9qm29K+r1/dUtM44T88Jwp1Z
 dtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UR/oI/Q76VxA6HU7lRgndk3Cfr5LCInpXcddK6lqF5s=;
 b=RUBW6PQ0nN1T2XUimqREJ41sE+ycux0SODNCbD8ZpfbeXKobKLgR9JNC2THzqgA7cw
 2a2bYjTYrWJgzBYUbxB/qE3LgkI55qEwtP9pmG+KySwQXXJgL0Tdpi+I78BKH3qYFxnO
 BUlniTpGn6wwm2OUJ7JM2pZaLuXsDcuUi2Zx5fdmSu8jPDhR4IClOLI30LPigtR/dTsQ
 bVE4tdFZqSppn/MR6dMaHVn7KY7vCTxFhYLaWHhxa31YZsn1s9IASn+jZlzEBYKvutYB
 koBpxz1dizJtEpruE9Blpn6pckbgGlz6obcs4ihwHZ/F6iPdfsVMwsRK7j/tKRp6rw8d
 qKMQ==
X-Gm-Message-State: AJIora8rQqPk74ZYRTB8OrxYoaVoS2OBixce3IrXCptebi4WErPy51/u
 9PAQnVch35J8gqyrzRnSwyT5XA==
X-Google-Smtp-Source: AGRyM1sKOIgfdKvYKJgJH7p7gU/hFoji4Z+mz/VwOJMgNWtzLtip0KO3QlhQZJkrJbW4hY+m0QEDEA==
X-Received: by 2002:a05:6870:6a8a:b0:106:a8fe:c621 with SMTP id
 mv10-20020a0568706a8a00b00106a8fec621mr14301860oab.163.1656820631293; 
 Sat, 02 Jul 2022 20:57:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:10 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: Re: (subset) [PATCH v3 14/14] arm64: dts: qcom: msm8996: drop
 phy-names from HDMI device node
Date: Sat,  2 Jul 2022 22:56:07 -0500
Message-Id: <165682055971.445910.4131004773759034075.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Jun 2022 15:23:50 +0300, Dmitry Baryshkov wrote:
> The HDMI driver doesn't use the phy-names to identify the PHY. Different
> Qualcomm platforms have used different names for the PHY. So, we are
> deprecating phy-names propertty of the HDMI device and dropping them
> from existing DTs.
> 
> 

Applied, thanks!

[14/14] arm64: dts: qcom: msm8996: drop phy-names from HDMI device node
        commit: 917a6de1b0a0d55c67533c5d3827ddd4388b14a5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
