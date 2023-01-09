Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B14663AFE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125EF10E554;
	Tue, 10 Jan 2023 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDCE10E0BB;
 Mon,  9 Jan 2023 23:16:09 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g13so15531492lfv.7;
 Mon, 09 Jan 2023 15:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
 b=G1y9r7t4uOCT+XdxQUuK+QFse1xo3Fgg68VHXsdMy7a3yMPp2VvWQi3dyyzq1lsMJE
 ycjOspEcV+5KAwycp/9gt/B0b/q9MsAR+6GHUdfrCIPsqo2y94XTY3b86kcKouCWILVy
 ig1Ec1VD/mqbY+PrPi4XaDUIDj0fG6ygmh+gROdhiVMMv0hYNO0NnoYLQo4kOpipTRn/
 knjLYn8tv5mBwf5l/EeNDAt45GAXJq+TK+G/r2bJB2H/Vq9AQwwt60GNjYdOBultHthj
 cjYKp/yGxh+4WoMCFoC7Gv8JWc19d997yq4cFjO+PbdHWzjWnbVIziX4apnyfLka3K7T
 g8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
 b=VeifCNenx/ptGpbzEi1L3ekmuYSDuvQvjQ74A0bDP491gbThj0VFQQ6JWP0ALs98QY
 SooEd3nAHpVmhJQhHClEL2bjKvvVt3MGFvmxPsXRjvY87mAzk40OPNWnSZQ0VxwstMhJ
 mVqBgc3Gd0sQ4Kaq++mHX6pRcGVQjp83dIJ8g/iDwhlewdl09/16Re/gYanlG1VpIk4m
 c3uYpnHCusB5Rg0vd1oFYCaoNS6jUPzFu5u4HwfHLpbXq4rFkQpnQku/WX+PqL/dxJM2
 2vKnlbfkRNhhyf6shVUH2Ap+EEfjHetTQGirFo+tsNgYrIpj63x4w3/GLGCtGnKKiS7a
 LcrQ==
X-Gm-Message-State: AFqh2ko6UVb0uWOYhRKKBjOGyNqCePMFA2F+qraDWDS1FafZRe2sHFtS
 b8cWRDaBazcsEXjwnEzTjyY=
X-Google-Smtp-Source: AMrXdXvOHAyy+z2Kd3L2Xj5tL7nzBB++EQoQPSpNA3MZ4zv9ECLiz2BDQH1aR1LezSkl6ePebDCh8g==
X-Received: by 2002:a05:6512:2a96:b0:4aa:8811:4c59 with SMTP id
 dt22-20020a0565122a9600b004aa88114c59mr18254342lfb.28.1673306167695; 
 Mon, 09 Jan 2023 15:16:07 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 r12-20020ac252ac000000b004aab0ca795csm1835413lfm.211.2023.01.09.15.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:06 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Message-Id: <167330408776.609993.2562174494126788375.b4-ty@linaro.org>
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


On Mon, 09 Jan 2023 07:44:07 +0200, Dmitry Baryshkov wrote:
> Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
> SDM630/660 (A508/A512).
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: gpu: add rbcpr clock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9bf1e33f9ca8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
