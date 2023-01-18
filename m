Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A56710CF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427B10E63B;
	Wed, 18 Jan 2023 02:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C793A10E63F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bk15so22323190ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOhzWcuJTV5IFxzT83GfyYBuQFtDL43V4pgyOp1rbt8=;
 b=BZJK9KYCD5pDLNx+WgkyVn+9Aice3BiaQUQN1pTMQjOe0S/UgnMYDMsd6auuyRRE8S
 H+Oo++QA68kwSRtjanvLC1c8pSUYlq5R6nDKMIdLhvKk/tsnye6h8asfpRBQ80BiMLNB
 YsjKRFT9YPM8996chk28sJipFpOnIcbSvk6zQKaIFdxFWWeJu/BUh52E7tvk52LBvbL6
 +DodcHcfFrO6Pds1bm4BukCz+ONuBuzOflwOu0HskpfOPSXcM6wZTjI2q8R85LiX1XbN
 AhwoqmzPpILLsGRqMFqWJVGBC2acu4PLhtRgVHCcZC9klniZSagH7uK1RwlOJnTCYJAQ
 V0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOhzWcuJTV5IFxzT83GfyYBuQFtDL43V4pgyOp1rbt8=;
 b=34cAc1uTUNIlLLWYGn300e/WRzpOLyyfm319sCBCPJKkM/pPZC/vcqf5snyuLqpCWw
 RBZc+dAi5Mlx1gVBvk3MWS79YQ559gkzMxsQO/xMEpftwBtEl1h25CLuos1/CpIX43oa
 1j11j8/cXyxj1CUAy54iXTxnTMqcvVB66Cq4hzjuHybg7QaQHMvnQvQuOJ20dTZKy7oM
 Y290f2Qp1eYKPNUuT1hxZVqjp1rzOUTh4u3BUv7Isgqz7PdsTgzJEF7Xun4DKWjgT/FY
 ehFaBXDNPiycgBfcuD08M3B+9iY6TpHPhk7lXPXc2mDdYH9lee1Xi5vBEPeiqttfD07G
 iNYA==
X-Gm-Message-State: AFqh2krGEj/hp/924o+ryIDUtyawAlhTdf74iohm0cecAn15RDoE002v
 p4i9iALmF4crhZDohSFbBgCi6g==
X-Google-Smtp-Source: AMrXdXth30o8N6JigOeU9QfoMuA2uNMELa4iXuVsuYWhFwvd5DrSr8U0u5P3kBlF3wcOxEFzST5SJw==
X-Received: by 2002:a17:907:d606:b0:86f:b541:cd02 with SMTP id
 wd6-20020a170907d60600b0086fb541cd02mr5993456ejc.28.1674007595443; 
 Tue, 17 Jan 2023 18:06:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
Date: Wed, 18 Jan 2023 04:06:16 +0200
Message-Id: <167400670533.1683873.6641648531354230560.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116114059.346327-1-konrad.dybcio@linaro.org>
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
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


On Mon, 16 Jan 2023 12:40:58 +0100, Konrad Dybcio wrote:
> SM6375 has a single 7nm DSI PHY. Document it.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f8e6d45c8152
[2/2] drm/msm/dsi: Add phy configuration for SM6375
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88f46d2ccdf0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
