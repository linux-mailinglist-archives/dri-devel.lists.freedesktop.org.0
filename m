Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AF67109B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A384910E636;
	Wed, 18 Jan 2023 02:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFBD10E632
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qx13so21451160ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzS/zvWe4dE4qAlzyHEWNojqR1ZH/s6LTLUTq8cJCDs=;
 b=x1UIMFzhhzmPp33rMJL9P9/UdyqBh0ezz8HdRiZ+FCVBLR2OShryDc+uG9Xvznt0vB
 5cCrPmQCV0teL8HGC5L/s4RV3HC8ChldGjXbGsiZwjPVrQe2smTtDRRf7iqYqqn86TTk
 LVQbZrb/+9Zbg3bHkzZp0HPycouflZYRFZ5BApQc5fCqveUceFQQI8X4Q9TodF6H0E+L
 PsV3n7mIYFa0vm7jF+alaBDlUtsWJcHIWlCpZuUQsUxXdr+eF8htRbeQoPbKWKoaWv1C
 w3P3jvnRQvUG7MFjeFymVS6p0OJBFlCKHbVNzYuTwjmpB+1q1Q1MGH55JGmDjYtJbDaG
 2bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzS/zvWe4dE4qAlzyHEWNojqR1ZH/s6LTLUTq8cJCDs=;
 b=DRFqEqDITkdTmPkoDU5XHpBtIiCwmwPy3I7DXVYScfqPzMnui1qBbYDtw/WFhsu7jj
 0l85Qznd2dWQHk8HIZmIwoGaopWpBH68ZDR8piV1Uzpvjr0NdCiYgm6usLgIvttfzCBV
 tE976TKJacf1ATwGQlQziRm8ht7KIbGgjeHJ0na0QZ10JTRqYyOyOcrABZzRqPml6fsI
 ssrupAyout+AeMydLdLo81kTaECkn5K1k/UQonxC4DtSwCECLngE6DyaVd51cc367EKJ
 zSP7ocsY1NElUZPEhFnukZqUgCg525kTsOsWo5xD3VILgTdWV6ARUh7IXbywzopCkklJ
 /cyQ==
X-Gm-Message-State: AFqh2kpks1n27T4es+HASl32tg7m2IsKn9w+BQQ8nPUCcElJWR2gR/TD
 1YiENPDHgi8FaWAGQN+fNEz7cQ==
X-Google-Smtp-Source: AMrXdXtPspMwAZbGwbr77eEM5eDgiYrt4RPaQoYwIAtRNNe3VLezx4/sosP5jnJFOjMOoW2VPQl9oQ==
X-Received: by 2002:a17:906:ca59:b0:870:7e7d:97a3 with SMTP id
 jx25-20020a170906ca5900b008707e7d97a3mr4427567ejb.59.1674007589171; 
 Tue, 17 Jan 2023 18:06:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,
 mdss: fix HDMI PHY node names
Date: Wed, 18 Jan 2023 04:06:11 +0200
Message-Id: <167400670545.1683873.1367688768865327080.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
References: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
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


On Mon, 09 Jan 2023 06:54:53 +0200, Dmitry Baryshkov wrote:
> On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
> phy. Follow this change.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node names
      https://gitlab.freedesktop.org/lumag/msm/-/commit/759cc4914fb0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
