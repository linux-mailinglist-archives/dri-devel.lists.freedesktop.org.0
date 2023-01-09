Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213666359E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1B10E518;
	Mon,  9 Jan 2023 23:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C0710E0CF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bt23so15577728lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
 b=WymG9EYGwNpjOZu8XQGCmmXAH0fdbVSfAdqaleh8KnZy6WB8NMETRkYJmyFOFlaYpm
 DN/Pfpnv/qgNcOaCLoWLJApnt8Z9jX+rLqWOUx54nwg3IoO68WGmOUUNj/9d5vN6FXsM
 YTc98Kd7z0qbS65xFtl0KgN9j+x/NV1pRnHK7TaxOQ7x6K7Fwow/uJpPkrEYKt6Hq3DB
 1fa13/BQczvW/zOYdUGNfJuQGs/cHyJgTPFqARKfjxtINz8JkkgSSoiTRwjmPNBds59u
 TOVzpSXn7nOVmXYhKbfPOagwaXtjOaBb7DbkFAbhy5Uw6PcLYTe5c7hYr4Qe120+ayjS
 ejyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
 b=aoq4qaTf47vXoaao3l3YjyMLK696ZPsKY+jlS0U0DNsYphHLss+28Uw5+P4l/ZD4CI
 xZ0VU9vP+vto31Upkexz2Mx8/QdnYXedbZ4aDO5xaEmoO8pfgb/MImLG1Vsrd1wXfHiU
 hJFQHzVbiTzKx7pB640L3d3HLnmWFOidPqp+cswPX4QnJmupceMkJyrfrlQUgzVuI6Oq
 R+rSs3/WqlOkg1gc7xjSFBU6FFtfkp9xbeYsoUkUB4ESRNc+2Fdn0YqbYLOFEKxnpoV4
 tyLvXLn+F3KuY8UYBXkQMpYxHlrmcSmQTZrca19f6Ab6OUq7ueTCJfcUkunO//tBLvPs
 zY/Q==
X-Gm-Message-State: AFqh2kq7Mg/aSJ3QO9/gDvP6EYZG40itflTwmymndeP1ms90x3eOnscx
 JI1NnMcM/9pnv1IoZxFmDoqYLQ==
X-Google-Smtp-Source: AMrXdXtUH8/HDneehsv7HPVZGtwvYhSPv9laSh5y/3e00019/hxA5LPGKbrp+Bri2WRSow/UlphJvg==
X-Received: by 2002:a05:6512:c01:b0:4cb:3449:1354 with SMTP id
 z1-20020a0565120c0100b004cb34491354mr9712298lfu.22.1673307840979; 
 Mon, 09 Jan 2023 15:44:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Date: Tue, 10 Jan 2023 01:43:44 +0200
Message-Id: <167330408776.609993.2562174494126788375.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
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
