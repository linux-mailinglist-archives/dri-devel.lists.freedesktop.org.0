Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40E67D4DE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECBB10E986;
	Thu, 26 Jan 2023 19:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5675F10E981
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id mg12so7691023ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4KAdu7fVD19fhLCdbp0Xp7Oejh/hWZQK5rs1qa1Pvw=;
 b=O0ivBoSVGtwzhFUvGcQPGXy0ZpjVU53bvGlbLDxv9YMFLR1iKbfh/7qi3nYki6Jrh4
 KsQPmNbs8HG9utJxL5v2c4t7NpUl9tuDRgPAmg76uPoFkmMYerXkXhwO8CDH47W2PQYR
 limoICSUkkTbLVQDiB4JlSKW2nNy123HSj7rdAd8btJc0R5c9K7ml/82OYENz/IRO5Xt
 305CuRSyc8BUWMqRXhCDl8jmf5mQuDrYlPBPvfueYeJe+/hJwTUXijSRR7Sv44aDPL/o
 zUq0e5SXh9bI8qJ116XPvzU4TT1UEj/Xii/zTRwKTdBML1Jtaes/2IIBV83fMgFs6PvX
 ih5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4KAdu7fVD19fhLCdbp0Xp7Oejh/hWZQK5rs1qa1Pvw=;
 b=XYvjB21/2TtzVyI+poLPoX+BUOazENA6wX/1EiLOeNmn57R5f4MOQcXWWVWWUNOoT0
 Efyw1RaRaHrkKunpd1yvAcng7kgyhzlcm8eA+FbXY7r6cSPgoKlIh44+Vew+lpwY+QFe
 0sTIt+lf6WTOsHkh6PcPcbQjY1tVBlLYqclbL+3as9mS6rriLh17WXe0ZyMca/gCTfwK
 xg6KkuvlOOZzjsEBAG7DsXhGNFNwRS73qGoaIi+iWAnNqLdCgznTjzghLc5GfBQ7EMXz
 FYhh64JCIgjXt0lgpPYJOZ09aO+XCeUKIx3En1uw0HB2/YeF7kwnOtqujh12nVL7j+Kq
 EpcQ==
X-Gm-Message-State: AFqh2krBFiOx9NLVIiFoPzYqS7+1dENwccnypN3RbW1/a+E3BmOfVJTa
 Q16KjDX1spbeds+gu68JyWcAlQ==
X-Google-Smtp-Source: AMrXdXvu41l675MshRL57jAMLr96sbxQRNIf58cOG9+EOAVwYFrOA2yICLT+QRXIrFtq+izPN+BCxg==
X-Received: by 2002:a17:906:3518:b0:7c1:962e:cf23 with SMTP id
 r24-20020a170906351800b007c1962ecf23mr36294374eja.37.1674759672791; 
 Thu, 26 Jan 2023 11:01:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg
 doc
Date: Thu, 26 Jan 2023 21:00:56 +0200
Message-Id: <167475959092.3954305.14748093187828121221.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
References: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 21 Jan 2023 15:54:57 +0200, Dmitry Baryshkov wrote:
> The field ubwc_static was removed from struct dpu_mdp_cfg some time ago.
> Drop the corresponding kerneldoc now.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/daa9a2ec3e07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
