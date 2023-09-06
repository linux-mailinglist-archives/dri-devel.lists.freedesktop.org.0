Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44D7945F0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE8210E72A;
	Wed,  6 Sep 2023 22:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B55410E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:04:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so454974e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037897; x=1694642697;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=K/a1TmtmamqPXEdUE0Z+t8otjGm5SU4KAy0PSuw4Hus=;
 b=asZHB0r6rDZ36W5k4Kq+Ld8UdjTobnN4acvxuD7alixIG0zyfaDqX1c1tC7/nhlEhU
 MJm8TAc/UG6gvylDNMeQ+1GlvqBXmpEfanttesWF2FAj9BXtFF30ALxR/YkHAiSAsaw6
 uYPEs6YvOEhWEz0ow8WmwxsuxH60aJGArwnrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037897; x=1694642697;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/a1TmtmamqPXEdUE0Z+t8otjGm5SU4KAy0PSuw4Hus=;
 b=TvB6uTeQHv2FTATW3chluKoHGWyrHsq9IQ1pPlCUYKpKc1Sc66nvrH2A29958bFu7x
 fbcx7HBKjWdX3Q8EgPP2NFjK9l8zBiEP/WvgYnhYjc5TP9QNtb9AxajihDm7WvZUcl9s
 +j7F7z2wvdskgwg5bGY74rZ0jqKXQOslA4EWb3WRbMXf08TejJnYbUhgz7/I5MZzoGh1
 2+wU5KfRUn/4x6marmi2rVpnlGvC+xNPiXJvMn3irqRKhqNYjFU+7ablm/Xy1ePKzwsq
 P5MKIkfMeaWbR2vE4owYyKg3rUi7IMSvvxSn6jRlfhn/I+hNP3atj/Vo6KdW6WFnckqb
 dMmw==
X-Gm-Message-State: AOJu0Ywd3at93vgqEhxDKgFCUDDfgq4gMHeqj0vReed2llODuBTEhc1t
 66XHLZZ+W4rBYDoy1ku4Bf5s3ALiaJbVQh+0vDD5ig==
X-Google-Smtp-Source: AGHT+IHaZD0sJC8YRqHnLX/pEEe+4RFI3T0inoGPucjNFb+Bar11rJv2jpxoWR4VYrsfsmzf1TRv2xDZPFbvAJKg4+0=
X-Received: by 2002:a19:4342:0:b0:500:79a9:d714 with SMTP id
 m2-20020a194342000000b0050079a9d714mr2776490lfj.65.1694037896915; Wed, 06 Sep
 2023 15:04:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:56 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:04:56 -0500
Message-ID: <CAE-0n53JeHYLNneAzdDfUU7c05F8ZZw69F-Gq5wVeWZ96_UExg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:52)
> Replace the only user of the DPU_INTF_TE feature flag with the direct
> DPU version comparison.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
