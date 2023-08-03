Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCEE76E6A6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 13:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C6E10E5FB;
	Thu,  3 Aug 2023 11:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D80010E5F4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 11:18:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso1525234e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691061515; x=1691666315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbHS6G+E5ew6ukOcvSxZbb7o08XJK+VVOu6GlWaMLPY=;
 b=Ezx62w0NkkQ2W7RPIfEX5KiXiIDOXDRGzvxiWHJtZ+Mo4+WiVx+4Mm0XTE/9Rc5cAx
 pcearRiloj+28lHxm83ZlODolQNNXm6XGduRwyonetEDLfzq6JBUxZ+y6gJzUSJNZNiF
 YbgpP8y1zhTGoF9tYHhmwh0GKRPDOrrhVJpa/h0+ZFQT0Pai8yP8dLuCWYJ1blv/0JBX
 sW9XzLha5rsMAeWkK4XgHF1zp/F+vLLUK9pxG21u6ZzpOnhO/cUVK0egvE1imtdVUwjk
 6Ye5daf3gxC/3zzazD6+4Too7Skwn0LxTngdUV7DVCVdj9acK+X3BLg8qpgZ7CVUCVyb
 rNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691061515; x=1691666315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbHS6G+E5ew6ukOcvSxZbb7o08XJK+VVOu6GlWaMLPY=;
 b=LM1ljlLckb1LYFfCfYUrL52d7RtZLvxboU6GM6/8B9ts6OmAD2XYdoC3Yta8+u78U7
 v/JpMICqL96Y/tCeZ5FNyiUF+Ci2K5WW2eDSpIQXYACNSqQZlfZUDXyCDprZBQFDqMhG
 eyDVaCnJwyjZn0cqbQNxxGVzj9dlixAQE/r4d6GSXVNHd765YRGqUwyeW9MSIB8RAQp+
 K8AwYpADxT3LV2ib9zcSK02Knx4UJy4LFNiIZZcTg5lHDeoqQhD/jK0V3Z1fNGg8YKEc
 dG36BEyGC4vDsVJVThzDovQr8Zdi9K+ZeXtVnIn0j1KXp6DWbyX5cEcG80PcpXpOiSIe
 G6eA==
X-Gm-Message-State: ABy/qLZJAjzVsw48W+M71zfFXNMV+k2VULDIq0PPPCho9enfeTRmKHbN
 rWgpbTQWxz2/vSeJFp/jIPBh1w==
X-Google-Smtp-Source: APBJJlGlLC32wnQ+ROJ9sEig2uRPBUqQcJgdNoL8amDhUgC2YK8CenUOjuw4GvfOcbt+WN+mqfRJJw==
X-Received: by 2002:a05:6512:3d91:b0:4fb:893a:d322 with SMTP id
 k17-20020a0565123d9100b004fb893ad322mr9200736lfv.68.1691061515201; 
 Thu, 03 Aug 2023 04:18:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056512092e00b004edc72be17csm3296417lft.2.2023.08.03.04.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 04:18:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] drm/msm/dpu: increase memtype count to 16 for sm8550
Date: Thu,  3 Aug 2023 14:18:33 +0300
Message-Id: <169106148047.4192382.5517957454190733148.b4-ty@linaro.org>
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
      https://gitlab.freedesktop.org/lumag/msm/-/commit/42d0d253ed03

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
