Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036ED7BCFF1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 22:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1459210E03B;
	Sun,  8 Oct 2023 20:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4348310E03B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 20:00:03 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d868d8363e6so4540979276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696795202; x=1697400002; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2eWQS+wABqdAVoM6ZVRN79K1EujhH8FxWaSNWwoMdbY=;
 b=PzTem6P5rEPu/g32l8i6vtV5QDzUkg9NSBgZapO6LM9wcnKWbHs2iiutvW9xJe9BZU
 tk7A9qEbC7BrALp1KWoz6xmVKQy14WOfRoAPEzhFuJCF9/G6fNEf63LgGLn2OkahvHMV
 S2QmCvJt9yMgtqiL2CVhkq4YqLqKhxcsMTX6abs/v6hm0sWTyC9jzYJDSTc1rXcLkl1Q
 LyEUcFOrP/9kLHo4+FHdW19iLXQ4GkOGCFKbS3IExAfpqO8vb/4PWpGQdc5y9rvLRFgJ
 CshU4hb76Dc1Hf52Z4mRS2QOc5mIPujD/EHDzlECjqu4SSQH5n+9sjE/qpNLdfaqdNn0
 qQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696795202; x=1697400002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2eWQS+wABqdAVoM6ZVRN79K1EujhH8FxWaSNWwoMdbY=;
 b=g8bUxk+j4hTCo0aYdi5PBHxkywvip+U2FbjtLDT6p0Tt4z9AaTCsD1tM99ohdGmUpp
 a1468XvsAYZkJBUHE2qkIydYofVo0cRjjFM5AZkcx9ZaAQIoh0jEnMmTeGuWsiXGXf3G
 AmHw41ntag9rZohteV57iHqfhsV5I6qBRHP5BH7DfB9hBhqglvIw5V+g6mk2buV4md1X
 Eix07N59wBzfxqYs/X7YQu0RXIoVYbm57KpodZcRqI4YIy8GIqhPRcFZ+tRPd3sdw8km
 Cx+1VsM8Vau1+Xbp3ROU9urbGnydT6ilCkNVCbfoS2qK9s+tmFsA8pA7Ab6nMMuYaa+Y
 MPNA==
X-Gm-Message-State: AOJu0YzuUZ0U15GE+uzw08Isq9ygHjgoZpHA2e1OVs/gWSEolCaZ2IC/
 QGEDT/NCAvrPkwC+Nw7PXAQir8ZzFtjWcQNmL0T95A==
X-Google-Smtp-Source: AGHT+IF5uHocDVEehYHwATnyUF2wBSy1xa65UxYQAxkUfPBXcnqMQFryQVME6DT00RvcJN2KycDZLyIzKS1iEqzbLvg=
X-Received: by 2002:a25:5503:0:b0:d91:c488:5b65 with SMTP id
 j3-20020a255503000000b00d91c4885b65mr8239359ybb.31.1696795201929; Sun, 08 Oct
 2023 13:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231008175615.413497-1-robdclark@gmail.com>
In-Reply-To: <20231008175615.413497-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 8 Oct 2023 22:59:50 +0300
Message-ID: <CAA8EJppgUmkLrhTw779tq5wkgXfu4sypGrQbJFYtrnCrbwa3=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Use the encoder for default CRC source
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Helen Koike <helen.koike@collabora.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 8 Oct 2023 at 20:56, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> i-g-t expects the CRC to reflect any applied CTM.  But the layer mixer
> source is upstream of the DSPP, so it is before the CTM is applied.
>
> Switch the default source to 'encoder' instead so that the CRC is
> captured downstream of the DSPP.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt |  4 ----
>  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt |  5 -----
>  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt | 11 +----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  6 +++---

I'm not sure, if updating the CI skip list together with the
functional changs is a good idea, my preference would be towards two
separate patches.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  4 files changed, 4 insertions(+), 22 deletions(-)


-- 
With best wishes
Dmitry
