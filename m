Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B956A704031
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 23:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97C410E298;
	Mon, 15 May 2023 21:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C266310E298
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 21:59:31 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-55a8e9e2c53so129799237b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187971; x=1686779971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GMYm23l9ibyEA8HUJHfl/AvV67A+HY6Cv4WCVFopURo=;
 b=j1X7Qv96dW3f9LQR5chk1cefyZbq//+zHluPryhT2tj+SA/om1LC10EQWZ6hkH6t0+
 57HyfV64mL38B++LU3IVVwl9iZXIGJUeY/DwI/NTMJYUwdgwQYBSSVHxaFK9ryQiQiTt
 J8VpAtBb8lg0pyyHtHOKgGtjQbsms/PdxStFs0eDPYmLPYnHKSP/3TL3QnCbe83tBd6k
 cwdvTAe1zav3udbJjaftZkjXagyGA/9Y2pstMbTt9V+scX85esXJw8knvWHTIviuUJLQ
 DSsfnFV6YOvrCR6n1c1X8bWJOvzao9u06pa4rjXeUKlqytpdqBEalIFaOU+Szrp/baLH
 IzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187971; x=1686779971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMYm23l9ibyEA8HUJHfl/AvV67A+HY6Cv4WCVFopURo=;
 b=OWWGBK7EzMoabYVcOnrF1Y6I6GpMG2kA5WKNhJprE4/r5zGbdbjEGMKMX/tRktEvJL
 jIoi1Ebv9Mh+m7qqkcX4wfZ+Q26qlStkef5WJDHpRnWKVcl+rmNerx7/eJQOHIvXj3hv
 UVkYA+W0T/jKO3exa56KSBETwKlXza7w8avt3784nemed9SCUrQUS/OVbxt6Q1rehAPd
 i5k9L2m2DNaERbmz0pgHudbro/JTW3gmJH1DWTwTPBESxLUMYBx1wV8Vqec08N842VGR
 J7pOEx4M36ngDRE34EFXssqMH6KzQ1f8touz1rn0NGHlVdTCZYwmz7gWNBMh3eYdLhqn
 jC7A==
X-Gm-Message-State: AC+VfDxBgW8H8iZYm8xC/cZ1ZEvreIz+ZytmhelKkl1Ic2dyk9Pje9rk
 BZPYcgWKZzT0pyQGnQZMYn7D715PsWQ/8wZGmRHVFg==
X-Google-Smtp-Source: ACHHUZ5HTNMDc2UouI5L7kXNW7BWxFq3QX5bY09M90wdI7FXDh/qgp2Pl75Yn6yZLGmtyl8wfXAJg1GopJEz8kKUpb8=
X-Received: by 2002:a81:d54b:0:b0:55a:6dc8:e084 with SMTP id
 l11-20020a81d54b000000b0055a6dc8e084mr31032603ywj.17.1684187970898; Mon, 15
 May 2023 14:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-8-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-8-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:59:20 +0300
Message-ID: <CAA8EJprgavuxe+FqVg0vqL+ssaBDu6x1vkJybjAE6G6cpHOAkA@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 andersson@kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
> feature flag information.  Each display compression engine (DCE) contains
> dual hard slice DSC encoders so both share same base address but with
> its own different sub block address.
>
> changes in v4:
> -- delete DPU_DSC_HW_REV_1_1
> -- re arrange sc8280xp_dsc[]
>
> changes in v4:
> -- fix checkpatch warning

Two entries for v4?

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 ++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 ++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 ++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 +++++++++++++++++++++-
>  6 files changed, 89 insertions(+), 1 deletion(-)
>

-- 
With best wishes
Dmitry
