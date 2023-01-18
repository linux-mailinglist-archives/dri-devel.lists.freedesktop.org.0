Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCF6710C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB09710E64A;
	Wed, 18 Jan 2023 02:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD310E63F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vw16so16687589ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iu2lmDtgcoBeAYM6gGh53UxWG0qeailU/FlKFijEGOk=;
 b=h086/2nQ2W1KOvaY3mNIjiu+FbWUv3/dHgY/xQVayIj8uGyXDQwM9f8/cj8gIuCFjV
 3k6NCXHSoGzkTl70xUh0BA4VL8imLpXY6XL/VNwi/+pBvlCePLc4noWn2zUWGaTFPKuC
 Kd99DvlqFLxdObExHD15E/G9XJPbfZIR1Fm2hV+UKPUcBN0AlOzUfloP6Or/S4BXaCTI
 dBftvA/S8sFBWqMhqSRRxaZAbV0zX6DEE5aNBxRpe/MesLwXVzaCD9iwMF1i9GvWGmMu
 tA3mIXYSF98eUwSCxzuMGO+7lVRTLKIpI/suz2pb24rxXGs4s5uAA1oRagnHkv9Ot4hQ
 CvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iu2lmDtgcoBeAYM6gGh53UxWG0qeailU/FlKFijEGOk=;
 b=thD7yBsfhTPiAB2qXmmVOHbOtQy3BTql936qYQogS20O+/qYiDnL1D2ggl8mL5mQ+S
 o2EKc/YaKyAy5HhkzgrNbn2BNH7hGL64mPxCJnHdhcusGi9ZA9mpQ6H8iIhkxZAiyWwk
 OLXet6qLY6iw2ISdtGOucuNOP/o7KYOb71Jr1OagcTmkV2DRpbasCRCsa4qrVbuvPKP8
 xvtkO8s19K0V14tlvg367pSo3oDq2MPa5VauWT+OzPjN9XPtLWwbuJVBTxCos80bUxME
 EvzxBTu6e4nv1z+5ijt6d88ZJp+vI7nrZOPuxxdiG1bLt96a6IIzJrnZ7m/RXTKgqwfU
 x6WQ==
X-Gm-Message-State: AFqh2kpe/rBJD8Mrv22ydhLAH9D/69ZG0nYt/46e3LWnw9EOTCQ2CFzz
 W9wJBhucjVSlLD4uzD5NObPPLA==
X-Google-Smtp-Source: AMrXdXsGRlD3SDRIHHy/5S7y2T3T+y6gbGLje+Dh/2Uwev7/umKTAb80X+U78jbo97FaiZdhuIZPHQ==
X-Received: by 2002:a17:907:2135:b0:86f:fe8a:be with SMTP id
 qo21-20020a170907213500b0086ffe8a00bemr5128958ejb.4.1674007598052; 
 Tue, 17 Jan 2023 18:06:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
Date: Wed, 18 Jan 2023 04:06:18 +0200
Message-Id: <167400670532.1683873.2224335545021677491.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 12:51:32 +0100, Konrad Dybcio wrote:
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> 

Applied, thanks!

[1/1] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4ff00ebb193a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
