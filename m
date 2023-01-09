Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4563663B06
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AD310E55F;
	Tue, 10 Jan 2023 08:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F710E0CF;
 Mon,  9 Jan 2023 23:16:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bx6so10639797ljb.3;
 Mon, 09 Jan 2023 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pymBsysiRj4PWzpdrYvrGh6WCe9aRMDyVw4Cchu5q1Q=;
 b=oBjSl446gX8Wvv8tqNz7s0ruSNsj4f1Kl4m2hgWyKIb4Kzh/wCyAVc68HCWWCFs/vP
 Sv3jFQr6bhzohzSt0O2RA3c5Xo+H9itHusV1dz6c33pXSfRsMxNX/eQMUhCUo3q/lWXN
 YhMqG/LQ3ybq69MEwAOut3zb+vNOGvH0/qY8B1EbK4K3e7B+TtBYpbU+OMfDIqZimirM
 dBtCWIjGzVTeUFb/CTMRCHeIEjwsvpl4pKbsY/jfvWxtSJEAq8BT6PDMFDoaVPx9OXrD
 jyQlkTJMIcC/511AAENai/8lg4O9RdY1YMpF5VDiEmTFZBuzQCJAkxpqvboT8eZBqgl2
 UuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pymBsysiRj4PWzpdrYvrGh6WCe9aRMDyVw4Cchu5q1Q=;
 b=sb2SkHrnSIi1mJfotz9C7MJTpdq2TxcBoCgfX0nGKAYbEfZhQjLyg775acVSzGIhjy
 AepOlD38sEynSFo6JCHAaL5J1fVGd5750k4+47RLNghSRxrNE3WZ5axB9KYTBMCVN8AS
 JXwkyCcjLKc/L6CT9x4pYqaifyD9qmS8KncWLMMxzQ5QJKX0o43ByPFCjPv0Gjo0tCBu
 o5dsXKFEUQ0mCBm79kY/oAnPYXz523S/z7gvDpmQVkmSH7q69PTUcPFJtD+Wu2DNutIl
 174KMWbrR9WE3Pwg2jqhIUr9zhhZT481z8QxE4WbpkC6mYxUDO+OxIQmhV1Ys3peSY0V
 oseg==
X-Gm-Message-State: AFqh2koo2b5YpDItqtGJjnlxRmQuMr8kfPe0RzZ0nHo5EUi3nc6nPa1+
 xgGuxX7fw/Iy67FgNjfETDk=
X-Google-Smtp-Source: AMrXdXvi9TwYn3DHh44maaSHdojbkWYXp5Sbtq2hKe0+o0eVBCV/tiwi3CGkaKZOwy25UDOuwJzAmw==
X-Received: by 2002:a05:651c:198b:b0:27f:cd6a:db02 with SMTP id
 bx11-20020a05651c198b00b0027fcd6adb02mr19801959ljb.20.1673306177939; 
 Mon, 09 Jan 2023 15:16:17 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q16-20020a2eb4b0000000b002862cc92061sm315979ljm.76.2023.01.09.15.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:17 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
References: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: msm: drop redundant part of
 title
Message-Id: <167330408778.609993.10640569681810813503.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:49 +0000
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


On Sun, 25 Dec 2022 12:59:24 +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> contains "DT properties", but instead just describe the hardware.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display: msm: drop redundant part of title
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e90c380ea283
[2/2] dt-bindings: display: msm: drop unneeded list for single compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7ad6586652fa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
