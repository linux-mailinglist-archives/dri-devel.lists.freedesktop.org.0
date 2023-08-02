Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4E76CFE8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC08710E1EF;
	Wed,  2 Aug 2023 14:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C43A10E1EA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:19:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso11170322e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690985987; x=1691590787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4wZsqR8LbrTTZv7kmk4RZ3s9EZmYRoAu6PO3sMdZUs=;
 b=VBAjZfSLPDTNwu0CV0rv4G5xg10wHSM/383f45p5UkzIDihYnJOVr7SFrEPpej4o++
 qhzsZLmUhm+Y1CguDPHbBSgmSYg4iV1qJA0JQ9pLeE4cUt386BnzSwesNCsvYS5selB8
 Wst0rOLT902/p2+bofyLyC1+iF4yvjOlIqGikNxnuuuwHodxfIKGfMcXDGwGejpBnSts
 Zs4hPiQ0F42FIkA4Yucbx6U/ajplONI6YvxD1jAxDvvO5/rmLntQ0Cq+ScNsyl3zCumv
 cygBhCtVrvN2zcJk9uEKlDvuk7Z6tJZTG0hGg4ItUPkBqmDOtY9tnQxfmsfolnvuvMEz
 72GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690985987; x=1691590787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4wZsqR8LbrTTZv7kmk4RZ3s9EZmYRoAu6PO3sMdZUs=;
 b=KEA7KsacM6U9Spof/XaankWOUTQYtt61gcJqw6T5zBalX8mYWNrcVu1XR8fPm6Gdo2
 ZJ9Yvd20pxIU+lyqsyFXzBob+7v2f10HBmsEyryJT2RQL+VyX5cImD95K/5dteMeCTw5
 hbRMogxZDqErytr0tjL6QCPgu7CA2lZCWUOKOuxEwSrWshR2s7cwc/HtARPlLyBQ2Wah
 fm2yO513sHg8id7YXH3AU5KtUFUoX5O45DEf4yFrUywRvKVBDlwAMieMtcc0NdsiCQXR
 7bseJwCtj75fV7wX11nV2y1sHKKcY8udF2JdG1/ABYnNRFbtcRfHSoFZsx0aLshUBYJn
 22fQ==
X-Gm-Message-State: ABy/qLbp/hxP7FzGere2La8enLz46ogtOMjTJty96EUOk7YReSWO+5KR
 YLIqeDU7bxbgX8TnxVKDCOtn1g==
X-Google-Smtp-Source: APBJJlHXFkd0l2Dl0uCDbmr5c23DuUa47sXDSuioFO/K6TtLmZZkga2NjOJcXcM347Gwl2VJkTXPJA==
X-Received: by 2002:a05:6512:3694:b0:4fe:193a:e15c with SMTP id
 d20-20020a056512369400b004fe193ae15cmr4097594lfs.40.1690985987197; 
 Wed, 02 Aug 2023 07:19:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a19f00f000000b004fdfd4c1fcesm2952851lfc.36.2023.08.02.07.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 07:19:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] drm/msm/dpu: increase memtype count to 16 for sm8550
Date: Wed,  2 Aug 2023 17:19:46 +0300
Message-Id: <169098596277.4187657.1718002880741720691.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802134900.30435-1-jonathan@marek.ca>
References: <20230802134900.30435-1-jonathan@marek.ca>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 02 Aug 2023 09:48:53 -0400, Jonathan Marek wrote:
> sm8550 has 16 vbif clients.
> 
> This fixes the extra 2 clients (DMA4/DMA5) not having their memtype
> initialized. This fixes DMA4/DMA5 planes not displaying correctly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: increase memtype count to 16 for sm8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/08bfcdc2c358

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
