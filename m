Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49C543E21
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038C11A2CB;
	Wed,  8 Jun 2022 21:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0C711A2CB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:04:10 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f9-20020a9d2c09000000b0060bf1fa91f4so8752064otb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=h3WYdhT+bSyEFJQRK2T2Y7MQ9aMLpv/BsDHvjB1RCFo=;
 b=OV8nFHwFV8+oaUgIpeZSsMa+igLoLIgsbGnG1Ekd6Pju2FJ57wm40rgHI9uPr/tLzX
 WXq76Gqx58nsJjvNT0+UhRTm5PcUqWeeV+0phPaDqsk0aJpBXduSfsl1UpE6+Ksr1bYw
 NU9pj/krznBcya3uKkZSxUBbF6zSq2wr+EF/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=h3WYdhT+bSyEFJQRK2T2Y7MQ9aMLpv/BsDHvjB1RCFo=;
 b=a9jAlRjdvbATfICPxfOHzCh4nYFlkSiqryao0+THVnJRes9gy4Y/m1qPfdHmSGRbbV
 2pAI9xCe7gVB6ebUpgaC2K03kRgcpUG7I+JPV0wzLdHzskRrYNMHPe8LpZlciyisblF+
 IaDdF57MgsgyBh68fISPofW6WqZVUZwo1OqDZkdgSklGCLf+o4+STTiouOP6pBAom6j4
 b1NFPejg/zU8Os/0uhJe/Y1L8uPvGSqq6A5E1NhrMt2pqBW4P8agQvJ2ZRwXl9BjKer/
 iPwjkWiuAj4lnnhGya6nUIHD5lHIGz8zrCNq9DimcroLEAMbEXy5phHM6DQDrFPm8zIo
 5hQA==
X-Gm-Message-State: AOAM531shVIMkE45CpyujyFNLpTCxz0Wasv9a+22K8NDQ9xQAc4VfjRk
 LjcU8NHNTmvmS3INfNfLVoPABi1hNubJmE+BSSb9yw==
X-Google-Smtp-Source: ABdhPJyEjeij56wVLmMzReZohtc8fJnmcF7nuZKiyj5xoJItE95hmxq6PmAGeiZCmyQ8BoRvSHdowjvMNXYqpBsHYXA=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr602063otj.77.1654722249602; Wed, 08 Jun
 2022 14:04:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:04:09 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:04:09 -0700
Message-ID: <CAE-0n51Yr4PCGRakrSapUEdCKe7oFa3axw=5BXdDXK3D6b8NMw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] drm/msm/hdmi: merge platform config for
 8974/8084/8994/8996
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:21)
> Since there is no more difference between the HDMI platform data
> between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
> single entry.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
