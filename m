Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507F67D4EB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BE010E97F;
	Thu, 26 Jan 2023 19:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E279F10E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt14so7733718ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoTZ2Jk2oo1sJu0z9U4fY49QhdA4VbOjy5AeWub00mg=;
 b=zFCkTttsnqQaCwrfwAGBQ+ACq42jLXqAWnuY3wlE2cC4ZthG4+0G+HgJQQeQumj6uA
 9grSD+txpZ1qgxQrl4PoeyYbQO6FjTtbmqIkKCPQZGCu1+gfh7DhFVGQZPdJGYoZuZlY
 Y1ybkASLuGOK/ukJyFzJ2ODZXfomJFWKEQUo1tstN3N/ZXdKMllxHG3xhEm1K5pbBkO8
 idQ8LmnhVupZYF4X7bmAb0wnQI9Ew/sgMTXVBo6n/Y4UQTng0pPdLR9bDxFv1X8npW8A
 tJ7iTu9f/3sFqLIHdeqpnqiycVHkZg4oxaByZ6McSd5oeXHsuiYfw1yLm4A2Zj7PW7Ej
 O4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoTZ2Jk2oo1sJu0z9U4fY49QhdA4VbOjy5AeWub00mg=;
 b=CSijSIjhHG7RsscLIS4eKpdnUfzC65XqRZiYu4bvEe5JYTqp3SYhHaSOEV1FH5eBED
 slX0G3krNgGjMNAnyd+8zQ+8srIj9bAmlcufHV0rNmbwAKcIHZCtjhmskJwmK/vOTBhZ
 Gt1/3CND5C4mdUbVfRrLOL2rqmdWnmNIZUJiXx898SH2wxg9rQ5hvRxNWeuztEKN/1g6
 iV/mC746BZD/2IRU8v90aqmciH6FMC2m9MhLpUI1TsSs68gEDSB9TtpRk6h7xmCYOFVO
 DAEEJi+bT0GuDLrsE6/KCaTbr0REhD/AUb33gTrx4EiDS8gcxDDAr/sPYJq9IucDZVQL
 sANQ==
X-Gm-Message-State: AO0yUKXNFkl1TBK35dVLWRLH/X8VHRDX/153otj4q4AXhs5Xk95Fyqlx
 E+IONtIbIPH/u19jucOJmQItcg==
X-Google-Smtp-Source: AK7set8CoXdSqRs9pJYWdfzKjq27yB4L36ss7j8AdDvAqlKH7VBunIDH1x18EQGPeIozH4cWpvZp0Q==
X-Received: by 2002:a17:907:205a:b0:878:4e5a:18b8 with SMTP id
 pg26-20020a170907205a00b008784e5a18b8mr4548339ejb.66.1674759670455; 
 Thu, 26 Jan 2023 11:01:10 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/4] dt-bindings: display/msm: more dsi-controller fixes
Date: Thu, 26 Jan 2023 21:00:54 +0200
Message-Id: <167475959093.3954305.15907989272487832068.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:24:28 +0200, Dmitry Baryshkov wrote:
> A small set of patches to go on top of Bryan's changes to fix a small
> number of remaining issues.
> 
> Dependencies: [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230116225217.1056258-1-bryan.odonoghue@linaro.org/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm: dsi-controller-main: remove #address/#size-cells
      https://gitlab.freedesktop.org/lumag/msm/-/commit/65e835945aab
[2/4] dt-bindings: display/msm: dsi-controller-main: account for apq8064
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f8e5f8b2ea4
[3/4] dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2fd5293df88d
[4/4] dt-binbings: display/msm: dsi-controller-main: add missing supplies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/05c578d51624

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
