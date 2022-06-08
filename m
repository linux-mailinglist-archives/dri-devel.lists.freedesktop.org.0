Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7B543E16
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8559C11A275;
	Wed,  8 Jun 2022 21:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A7011A270
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:02:38 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 a21-20020a9d4715000000b0060bfaac6899so7185200otf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2CGBmWLR2xIwoDoHoMFGRINdSlBNsIoLd8gsi73vQfg=;
 b=VzQ3zIc3G7mt2Ifg7TTSBMylzEr3xESyWpuSJuEeASkLmI2ziP3vZFx6MUyazXRZWf
 IbR0GT4Kx5+vK9gjLbXyiiup3rC2TitC1VuNWcsyzGo/pBvAyBo5kV9FYf/lGZxgor+X
 h5o+08/jecsCbonvsupxcV3+NOtXTcDlWkl4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2CGBmWLR2xIwoDoHoMFGRINdSlBNsIoLd8gsi73vQfg=;
 b=hdcagZP9lTvbLTS4mY3lkPVSi5R2QH7HXAWT+POvxFUuUWmp4rc9Ukt+Ht4YdwHks+
 1IlsdO9M6VQxs31UjPW0l9gp2Df2gHSyMVYcn5Lr6pI8VZXMxi9JgtcHpfxtoGql4O9k
 qF3wD583L1Tl2i4iyaZgSwKCkOOFYOIR6jFZRSpSOJap19jeXQ5MtjXvHBIgwiya2oje
 JNKdPa4JtGJiEByrx+TF1xet3Ufp1W+0AFmJV+9zKy7d28mtHgPGKoabNFYKW0ZGzx6s
 81Kjl9ARDLTc2eLo4g1w5CFn/bHrYTZlyi9Al8Cj7djMJdxQIAmmXG042YReF/1OSTnz
 c+qA==
X-Gm-Message-State: AOAM530dlqVSyi1Rm/4idWPPWb5I+tuNMwu5Nk5MFwikrbpJ8UTnlJWQ
 c3mD+uQRfgxYDSy4tlXr8VA5Wt1HRed/1hu0OyxVNg==
X-Google-Smtp-Source: ABdhPJxyMYGo6n+3U+XbOkgU/x6UlYrqKAW6EHI9VoY0z/klK3N5HwW21ZWy5t1rGHjjVuGeU6XWfVcApWoGdSEAFVI=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr599352otj.77.1654722158067; Wed, 08 Jun
 2022 14:02:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:02:37 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:02:37 -0700
Message-ID: <CAE-0n517WyGbmN86=q5Qx06ektgKFNdY1N5fgkH7ZM6AhGJ+9A@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] drm/msm/hdmi: enable core-vcc/core-vdda-supply
 for 8996 platform
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:18)
> DB820c makes use of core-vcc-supply and core-vdda-supply, however the
> driver code doesn't support these regulators. Enable them for HDMI on
> 8996 platform.

The 'vdda-supply' name makes me think this is another scenario where the
phy isn't powering on the analog supply when it should be and so the
controller driver is doing it instead. Is that the case here?

>
> Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
