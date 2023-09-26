Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481D7AF2B1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 20:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C883D10E418;
	Tue, 26 Sep 2023 18:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66CA10E41A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-533d6a8d6b6so7580038a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752686; x=1696357486; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1mXLi+0rIXccn25x+LJrv2RkBxKqdDr4aU+Gv5GVsoM=;
 b=RkMNM4czImzXYEl0CI7RrO5+lPBGct6e5SDay8Ug5NxtO/YvXSJtsOw1+06sJqUsiF
 6vyq20krboP6g9iruNjvo41wgElxKwp5xgQ90yUw7aFfc0XGLTz5WTseora9UFFghHFv
 og7ktRQ2DSNi0LsMv3Ru8+hX62racKX0SlwWn6QFjbmvLjuJJc+4laditouhq9Ekc/T2
 0SQEh1YMj6VHlcsFiEdhwZckCiQVNCMnvLeZxvsz8oS/6Bzhf/wt8cB5FH56XMAZ7qOB
 t6+WxoUMdQmdNeaw5Co6LAGBqlvKLtgaG5o7wpGbzTxYH2IQumGGB5gcQRJHu/Goo7wF
 dB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752686; x=1696357486;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mXLi+0rIXccn25x+LJrv2RkBxKqdDr4aU+Gv5GVsoM=;
 b=eK0R9ahpqQbUIPFdHIt5x7G64f12xG3bKSXiPDs5AoDJscts7yYzHBMUUDOGMp3t7s
 256ooCiFYdI9uXSS/AFzDifAcWsuyFgOB8stWHFvGPtL9UZTGTdpYdJvLLIua/e7CuOZ
 /quuY1nTz6TJiAZzaFqDb4qc/JeRUzmtBj6g2PFgueesztfTovMM9vyzzeLPVAwaVvMV
 YAageBpWTWathkVxr9FL5DFlXDpOZ4gdHD7B3VDyn0H4TcDXyz4J97JnJItgXPfaOt4i
 FeiiEOTGxV0iKeqJixjxEvHKLWCAnnvAw6tAVvQdMKqSf+FB2uJ4XevS1JSjtm69J5vc
 wpMw==
X-Gm-Message-State: AOJu0YxEoonnCxFQT1FWM8W5HZ+YvZ3GwZPxOOMLS1Wn9fcZEKH92ioy
 DWhU2b+6HGjt/5GVaW1qtngVVg==
X-Google-Smtp-Source: AGHT+IGh0ktD94Pk4wwsYiXRvrPoEyd0YO/XrDphwvk3G5mbEos4//shaUTYKbj122Zo01fAUAE68Q==
X-Received: by 2002:aa7:d7c7:0:b0:51e:53eb:88a3 with SMTP id
 e7-20020aa7d7c7000000b0051e53eb88a3mr8851616eds.25.1695752686393; 
 Tue, 26 Sep 2023 11:24:46 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:38 +0200
Subject: [PATCH 3/7] drm/msm/adreno: Add A635 speedbin 0xac (A643)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-3-7af6937ac0a3@linaro.org>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
In-Reply-To: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=751;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4Rw51EV+m1pbTmR00ftxlMR26PkphHnsyFSR2kZ1LeI=;
 b=SXUVrGfcSRMs/58bky5kYAUilsScEIoXeRRt6NDpibqMT9twn8G3KlhPx8o0SOlAHp7e6EZAZ
 ljAxQUAiqQsAsx7kSjWbCIUQoLnRFJOt84DDBQzWxWuw9V//8Y+N+Ur
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Downstream calls this the "speedbin 1", but that number is already
occupied. Use index two.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 16527fe8584d..4977fd759b5b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -460,6 +460,7 @@ static const struct adreno_info gpulist[] = {
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 117, 0 },
+			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
 			{ 190, 1 },
 		),
 	}, {

-- 
2.42.0

