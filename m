Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2267D4ED
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DBE10E989;
	Thu, 26 Jan 2023 19:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067710E981
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:19 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qx13so7606416ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTeKhYCgAYLn9b2pOWJlFiilL2KqGbxWtCO1YZ9/UkM=;
 b=Zq2IUYVCIk2ZkmKL8yTQ9rD/RcF7gQkTdEVyT/G8FqICTK1KKopxh3D9QABs16DCb/
 nnJEx7GPNlXadntyWwRU3iU7tGl4GKtw+JiS3zk4w5HI89y/f0oZEw6PNbJFEKuZISbn
 zT/m7gWdk3qZScZl88I9FMrgp1U8MqLgL+mfZjYjHDOOQf+IPVynotCJzf+6QlMdxp4K
 53odFHDtAn4mrs6R2dRyBsEQPlY0PTrn/6ws/vrXuvumBXXHW6dH2nd/1dXBDAM4lOAQ
 t1Qg83AcSL0v08OfFO+rcilwdDuCa6gqFpPC8LmX5Yl1XKk3ihClp4EcOMrWAfC4Pe7K
 0Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTeKhYCgAYLn9b2pOWJlFiilL2KqGbxWtCO1YZ9/UkM=;
 b=tQp4Kg+aTALLWV8GHIwAS+8heJQjGHA5NBZIo3htRlEiwkDIesVJkMHeipGPEqBYhI
 REZOnMtbP2Kr2KwEROdZHZ3ToXMNokBrpgpJObYnLHE357mgNrskqeGAZGsLusPH+gwY
 huBJ2wcvZZ3kjQ+alZNc3YDjV0yuzZpBOIh/FWT/iA+1hqvBT603i0It4v6c8gBSvsdB
 gRP10aBrk3fyGEwpzvacvwd8OA1dOZy2oRl6e/tJGrIwQ5NlNTzjqbQsFuMQnqMuboXz
 7u/Yt895CQqLhTUXKssSGZSQmoZMCdKNhMC5ZjyqOgrQll9jNPP69YNq8emFMazYrACM
 hMig==
X-Gm-Message-State: AFqh2kpud1WXjrpn5LwKeIdo7OhMR4jGK8Pfk2d6r+YfYioXsRA3s4z7
 dTgayHG8Ijq3LCrul3Ge/M+wzg==
X-Google-Smtp-Source: AMrXdXu/ugKU0aSJjN4CCNX12KjO9+Qm06X/CVkhbq7Os4veQCxLQBwbP5hQm2BV5NQe5Nn4RpOaIg==
X-Received: by 2002:a17:907:8d18:b0:7c0:d6b6:1ee9 with SMTP id
 tc24-20020a1709078d1800b007c0d6b61ee9mr43109147ejc.11.1674759679427; 
 Thu, 26 Jan 2023 11:01:19 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/dpu: Add check for cstate
Date: Thu, 26 Jan 2023 21:01:02 +0200
Message-Id: <167475959090.3954305.6194600813887477862.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
References: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 06 Dec 2022 16:05:17 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check cstate
> in order to avoid the NULL pointer dereference
> in __drm_atomic_helper_crtc_reset.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add check for cstate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c96988b7d993

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
