Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3EF8122A7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 00:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A909610E874;
	Wed, 13 Dec 2023 23:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2161C10E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 23:11:15 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e0daa57b3so1713425e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702509073; x=1703113873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/j1Onoc3138zJnsU8yDEiGjQqVsbV45Cqho1Gb5ccE=;
 b=aTP/AZlRnLah4mpFb+H1GPljI7qN6hA+rneUPpmh7M6zi5jazcXg0tGGqxwR3HUzpi
 gulBJP0AlrCeNdM4gA0uS+Av6b5ii1ZbItAeskyEArmdEf8iA8QOFzOwZEiQR1Yu17av
 LGuUy+vBpWkz4tqMwGaTI8sk9LV+WLzDqc5cvLtALYdTKmASmfdqwgyncDp6D3zGbl5F
 EpTolFOdWBBmJ0SbvIeAl0mngPGeItBs6DNN1H4xz6U8/lFeohVZ8ern0revwShGJ8Wv
 +xoKYtQcDHfWKDMd7TCSY8irwc8RSdceD7XyQfU0w4QxYFXisRAD1z6gxJDgSlyFauzy
 PBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702509073; x=1703113873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/j1Onoc3138zJnsU8yDEiGjQqVsbV45Cqho1Gb5ccE=;
 b=fa2F6G0UlOHKvAqE93to82b5/9dQ0Bxwo3bC+YvtVOEt/YPn0Nj0Bstc3UetB+y6x9
 kDj+gzuMOaTmJKSHamctl4pcJs6lxHusBNih/qfz0I/Tn1vt1J+76BV7y6eHW0rRku25
 ePunmpLr6AOZP7bvx2+9XPFxrjOOQG+J7v3iUeFEEvqvL8LCtdZwL8+Fj/7LClx+nnCg
 UtnY+j16cxMJi1GdytXy7jyP4F0a3VnnWcBPWa/jTRXhEF5SY/kjzeStUPphllOaJnkw
 +OXkaJeWlWabwvQ2ZypyILOOKKI5Gy5B3HnwVTAUA3QAtKiGzcPAT99Cu9eIWsxBDpxL
 8Wzw==
X-Gm-Message-State: AOJu0YwB9s6YGncnm/ftl0uBdqQ2CXqzL2vzocBMvL+eoeH33XRuQhD6
 vtfuJ8A/N0w2ekvezJzuzXEy6Q==
X-Google-Smtp-Source: AGHT+IEhLGLbpNE5ofHBlyMYQRBnTcLYD16vUtw/hL1PzWKS86x81znzu3niMguSuXMWF+hvlixwCg==
X-Received: by 2002:ac2:592f:0:b0:50b:c2ed:e28a with SMTP id
 v15-20020ac2592f000000b0050bc2ede28amr2806480lfi.13.1702509073150; 
 Wed, 13 Dec 2023 15:11:13 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u17-20020ac248b1000000b0050c031e2873sm1735908lfg.288.2023.12.13.15.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 15:11:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 0/2] drm/msm/dpu: INTF CRC configuration cleanups and
 fix
Date: Thu, 14 Dec 2023 01:11:11 +0200
Message-Id: <170250905097.800728.11004644949884575762.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 13 Dec 2023 13:30:16 -0800, Jessica Zhang wrote:
> This series drops the frame_count and enable parameters (as they're always
> set to the same value). It also sets input_sel=0x1 for INTF.
> 

Applied, thanks!

[1/2] drm/msm/dpu: Set input_sel bit for INTF
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b932e07c321
[2/2] drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e5c08a41bcf3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
