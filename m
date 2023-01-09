Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E6663B08
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5F410E561;
	Tue, 10 Jan 2023 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0A10E0BB;
 Mon,  9 Jan 2023 23:16:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d30so10615659lfv.8;
 Mon, 09 Jan 2023 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
 b=kXzNDKMPeb5e6lJRcwwef0qDEXt9Kf/UfU1M+YcIBbkS3pXfnA+B4wWSrPGHCyskF9
 Rsg1DqAQsfjQBh1td3BfPWXG8Hizai5plx0RmpEy0nVCZ2kgFyThGE4EkBsR4b+Mgodw
 AKDHhkSjq0Q2xJQB8OWksF7b1U/YcKLm9RskjZAUMR+y3QDnukDHRukWoWpWoHnX2C8B
 Zl/JvgDeyn/5cv2myxEmJNi+SFhuas+YcKJb8UxJthU0A863lh4yjhPfUn3CTQ06DvWn
 8o84QlT+cscfbEAyLt7ARgnRXZS89/VWWpAk8gv48bgL2A7qpgzFRON46sbvWWgXHL6m
 toEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
 b=i63G/mEXwPOJ860Q0vFGGfAsTsVOzQGDviBFu/JCIDe+bMTPWY2EL7m+B5Od44Yljv
 Lud0JoGkUx4NYh+oPSQMQBBjV/139pcwq/p4rECRZlWXeLAUo9Ql2DDFrxqddAOrNGS+
 V9Un8k3FSV7zhVMFX7FCw5AHltFXdKWJlWS0aunvghDoVTmdRgClVkEZs7L3USWQyTs7
 EqOHSbEZwukA7r1oT9HPbxdtOo06qIaoqRnkES2HkoPlVinoFe9lay9EpKfUeGQcQ8kS
 lzU1mSqbYSU0v9YNDWWe8JYVstEM413FwNKFR+rGReeyrAedWmkuBa1iOTOdAU+6gn2I
 PRuA==
X-Gm-Message-State: AFqh2ko+djzWe9FlT4qHkaTWpAWlsMZhZ4CstCldqo42WHeMYHIwGMGF
 o/3hnymxtyFdp2nf4f1YtLU=
X-Google-Smtp-Source: AMrXdXvsvMbJMxbVIOP7MhGcARYLYTaMj2qJsVj4hOLnwTk6gCkRAHlDRVLXezAOi1HZGO5X8RuPjw==
X-Received: by 2002:a05:6512:2314:b0:4cb:4571:9efe with SMTP id
 o20-20020a056512231400b004cb45719efemr9847698lfu.35.1673306169077; 
 Mon, 09 Jan 2023 15:16:09 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m9-20020ac24ac9000000b004cafe65883dsm1847495lfp.122.2023.01.09.15.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:08 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
References: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,
 sdm845-mdss: document the DP device
Message-Id: <167330408776.609993.17059327526924867379.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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


On Mon, 09 Jan 2023 06:54:58 +0200, Dmitry Baryshkov wrote:
> Document the DP controller added to the sdm845 display subsystem.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sdm845-mdss: document the DP device
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d26407788cc0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
