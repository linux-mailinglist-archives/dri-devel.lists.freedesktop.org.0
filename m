Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19108704027
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 23:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2600810E2A0;
	Mon, 15 May 2023 21:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1CD10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 21:58:56 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-559de1d36a9so189629197b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187935; x=1686779935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2GhCPVz0jzDkj0tIcHEjP7z8Dxr8q4noyGfNYwo8Fn4=;
 b=T20qXytAdukd7caoUSDVMp/Tqbeas2tlJge36KCD65W3BB8AvL19MYrGci8Xjrlcxy
 jswP+Z+Al205C9vDw70XYnIDCXmcMJ4FxFP43ap/hZtYn0yDflZiFLkt/iHerTDFr7aF
 lw34oYsQtEk1A6KBz/08vq0f2/ApjxP+qE3eO+QlEBeULbWi/y8Ar/guz4xNBcepNF7l
 jNcLoXp8zCEXlpfcEtjFyHdaGE3z8UhEZf3ORvlpIbKm6HX58RIAgMLZJzWPj0HflOGY
 bAnBSbDqXkaFCskBYCzt5HWNbjwhbFchUCc+fLBLdmspNX5fAj5agc/Newb+XE3oT6YY
 m2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187935; x=1686779935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2GhCPVz0jzDkj0tIcHEjP7z8Dxr8q4noyGfNYwo8Fn4=;
 b=ly2dl0+ObiYzEkSNRVjyAVMVxXM2kUYTb+8tD8LYGOFgj2WDrM2K2mRR9Dpgle9Yzv
 4S1CJA5qQEKKoi9fuANwwdgHNdnz3su978kjDM/lSvv2LCPMQQZgW3/FGAS+EMlMBp/B
 8wvrqx2W0OHPvrdQSJu2b3fXqeoyybcXR00Ij7XvaSEOp2ZGDM19BGki3cKw1W+OAzLZ
 nmptXz18G+B4IFsrYnsHuVuj4eSuM+wiWNLZ3VxAXB6Bg6P9FKUfnFBbsdv6yB8T8dvB
 nc1mWHeAEo8hdK24JTcxeEKarqn15ZPkLRTUFaHLRMEQ52QC1XSiG4EJz2RwXWlPNoTt
 +Bhg==
X-Gm-Message-State: AC+VfDxAHkfy8hVJb9d6lcoD/Cmnap7BOPlFxJvw3lYm0oAJ175Pu3Tu
 SHRJpjFvRWCug9hZjO4uxyiTBzS4Qi2KsSwasmOyBA==
X-Google-Smtp-Source: ACHHUZ7wH41QbNMvn4niiaPesS26XWfJv3Ub7CgOhVFWa3tfs9gH7O2bfRrojl2uZIX+mtAE2Si5HM9b5TfE0lS9xS0=
X-Received: by 2002:a0d:c205:0:b0:561:508b:b8f8 with SMTP id
 e5-20020a0dc205000000b00561508bb8f8mr4524989ywd.50.1684187935098; Mon, 15 May
 2023 14:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-6-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:58:44 +0300
Message-ID: <CAA8EJpqXyoBjZJythTw=gDp4jDda5eWL1E4W_YmgGfzGijWBPw@mail.gmail.com>
Subject: Re: [PATCH v9 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Add support for DSC 1.2 by providing the necessary hooks to program
> the DPU DSC 1.2 encoder.
>
> Changes in v3:
> -- fixed kernel test rebot report that "__iomem *off" is declared but not
>    used at dpu_hw_dsc_config_1_2()
> -- unrolling thresh loops
>
> Changes in v4:
> -- delete DPU_DSC_HW_REV_1_1
> -- delete off and used real register name directly
>
> Changes in v7:
> -- replace offset with sblk->enc.base
> -- replace ss with slice
>
> Changes in v8:
> -- fixed checkpatch warning
>
> Changes in v9:
> -- address Marijn review comments

Which ones? This is not a changelog entry.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
