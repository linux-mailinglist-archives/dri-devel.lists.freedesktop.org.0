Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838C9FC25C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 21:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB50F10E4AE;
	Tue, 24 Dec 2024 20:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EUTqe2Re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1A110E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:19 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so62936201fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072878; x=1735677678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVL1dmPSr1vk7EWC2qU43PTuiWRQrYk/i8+6+hYoAwc=;
 b=EUTqe2RePBxb908w0hYGUCWV39/mlVORzEHr9Um1aSmnON1fD34xfq5qodWXR2SD8C
 GT77sI5VIZFKrgFdb4g9zD76wTonlJhLR7ySkdXNuEsFIDxQHAQf6Vzu71DKBrL6DaNo
 pfKtsxMJYvdRt/nlGRB+lLGSs/RQeLaT9XCjFYlizdwUeY+6cwzFAfhV9sWNtBEgrOYE
 vqPF2gfYLeA4m84g7EjPnOGcPCtY1DuktNHcQ6VdEgyoLGZEgHQIzomMJRnsKeHZf4T2
 esssMpEMYztgfTRb4giwOtDUcQW5V+yq/6wZjhhMgfIcR9h2oAuX87CgMR6kqAH8fGn7
 0pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072878; x=1735677678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVL1dmPSr1vk7EWC2qU43PTuiWRQrYk/i8+6+hYoAwc=;
 b=TeFQiaAX++wU/Qj4A1WPp4armMa6oi3rBAng7+X77Q49XEQQCKe2V5nXqg7nQUNbRo
 ZK+UhjXF5egd4/1ZeY4vr/+78txbCKSNwYXHOdKu4U+vaMkCKcV8wavmRlJ8mC0Whfel
 nzjK2dbIv4zDmXCpGPAyarGJ1NYxgl57KmFMoctEiuctmFzSs2nsfoPYLAAjSK7eluS8
 PkFnag/+vU2qpfbphMfVVFboeAdbGj0i65iHEW/2kmCtdrzHebseYbtItjlZ+a2+lTV4
 Tlgx7XHm6Gy9oVUcWttZoTf3X93iEq99r6ulJwNcOHtdl0OypULfvK2EwTVx4mDuesqz
 algQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/F2uCGPY4PIzNHx7f8nZPKRfC0HRhuvuZzR7LYlO7Bg8nGOtYZNP6jsiKWEUVmRLOZYiKeLETOTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvAnWqDdtKK5G2eAsAbxPrnSB4DGmqJ4baiL1QzgK9irm2Fjbd
 Isna7HpMMYtbWoBjhHiwuWWDcTzP4+FcyNf8qQlCwZyz9voQ7H22Jmym2cPbnJMAzesn1ImRuVD
 W
X-Gm-Gg: ASbGnctq9bj7t9NE+nqR+Zd986QRR80soX1Ge8SpAxWVxEr03ZXmRMrKPRtuGEXyj+F
 v1ll5Ww31h/n31DubKwIc3LSXu5SdzG1bYgP0TahqGyIZYkKdhc5LufgbpbXbC/+fUDyjGmt/ma
 seG0HPB3mS0uXB27aMgj79dzR5WlvJ0sFTl3Nsv1VNmhSlFyWbF56P4mSb3wI+CUDX+L1gufEgW
 l7ofNl37+HQgH2v1AMcz+CCA6fcYiyX84MFNBUcQaL45FQUlSbfCIp6YgsqMq81v0xJN46Z
X-Google-Smtp-Source: AGHT+IFRqkuN0v8Twfp+3aoJNzJcDiCl9dFl3FddoHLtEBoe+bPkHlNyv3Kkk7el3kN2e8ga03/35g==
X-Received: by 2002:a05:651c:4cb:b0:300:1448:c526 with SMTP id
 38308e7fff4ca-3046861f16emr47329571fa.37.1735072878081; 
 Tue, 24 Dec 2024 12:41:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Date: Tue, 24 Dec 2024 22:41:03 +0200
Message-Id: <173507275848.561903.10083157563956874611.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Dec 2024 16:43:11 -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> [...]

Applied, thanks!

[05/25] drm/msm/dpu: get rid of struct dpu_rm_requirements
        https://gitlab.freedesktop.org/lumag/msm/-/commit/835d10620445
[09/25] drm/msm/dpu: Add CWB entry to catalog for SM8650
        https://gitlab.freedesktop.org/lumag/msm/-/commit/989412edae5b
[10/25] drm/msm/dpu: Specify dedicated CWB pingpong blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d1fe88dd53ae
[11/25] drm/msm/dpu: add devcoredumps for cwb registers
        https://gitlab.freedesktop.org/lumag/msm/-/commit/675c1edfa92d
[12/25] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aae8736426c6
[13/25] drm/msm/dpu: add CWB support to dpu_hw_wb
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a31a610fd44b
[14/25] drm/msm/dpu: Add RM support for allocating CWB
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a5463629299b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
