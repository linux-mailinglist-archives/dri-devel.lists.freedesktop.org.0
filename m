Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F503727308
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487D10E575;
	Wed,  7 Jun 2023 23:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6354810E572
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:33:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4effb818c37so55086e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686180813; x=1688772813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lDlutq59/7K4O/ryHd5kkyj0gex47Jt6UQeyUtN12c=;
 b=J1TWoMenYdXW7obNzZw8NOC/SdNCGnZFQHwTb+KuyzNhslN/CNgiYWG4I4mYo8mA0p
 Pjtgaf68KovPIblJBL0S+zMTL22sUxFWT0BtwVwOILPBy/UskI8p1F5winjluuMFhQyv
 X38s5ii26ANVaMtySX40ZZMNTgcR2QDKiJMiYZdT8JUBwECCFTIQrzahvQsvGG2jGFfy
 uhjqFKxpvSUIWMtsmQ83yv+vIvJ9xq/PPPSujykLQ6QUjLEXVs7+4rdEaL/8PG7/g3EH
 vaasv86oeJgAoq3phFBNRX0BnE5SIk4in1G2h4bb+RMiJDSHMTxhv18sN35WUelMGfl+
 5Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180813; x=1688772813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lDlutq59/7K4O/ryHd5kkyj0gex47Jt6UQeyUtN12c=;
 b=G5CR1VmA1HNzsuNwtsxgxLiPv+gpWvP7Dpbp+nkqlKPfPfqpex6QuBZ7pwUsGbtv8p
 P7cXAYSJMZVz/icd3pgvP6iGSkIbb/K2H8QTfyHQtBPLleif9HU7GLKYQScGU5/913Q0
 Cr2/kZLBaVJGY/qheogv3XFXGbwXM7PYiicju7xWW3i8L2SJ6Y4Vp51K0uUV0TFiJny6
 HLv9XaQ9FKwn25gIiB+VZo935VUu/OJhRhbglq5yTdw8ilQS7or9kyq3SoESpzrm6Zng
 avN+A2zzoxPWLdjZWzJyXALww+Bml5Eo6/C+ZOxtzOgTm1AUGP9NMzJ/Q2SMAogG9SVR
 gYww==
X-Gm-Message-State: AC+VfDy3QVx3Sy7H6zsyiTBI1ak9mjRsbBsCB1YDglv2QKtV0+oKEjfP
 fCRFWQkFxKbeKNsdkZCJ5QrsxQ==
X-Google-Smtp-Source: ACHHUZ5PDGB3d5i12eL55i/NBR8u8kJFenkMlHl7KQCxpRKMLa9dTwF9ztv8RLWp1CgAvjOdeb0e1w==
X-Received: by 2002:a19:f00a:0:b0:4f4:d41b:f421 with SMTP id
 p10-20020a19f00a000000b004f4d41bf421mr2490086lfc.33.1686180813420; 
 Wed, 07 Jun 2023 16:33:33 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b17-20020ac25631000000b004f001b0eda2sm1951199lff.56.2023.06.07.16.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 16:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, andersson@kernel.org,
 marijn.suijten@somainline.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v17] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
Date: Thu,  8 Jun 2023 02:33:31 +0300
Message-Id: <168618077608.1883603.14367317273588128557.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
References: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 06 Jun 2023 13:11:12 -0700, Kuogee Hsieh wrote:
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/203b2019b3ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
