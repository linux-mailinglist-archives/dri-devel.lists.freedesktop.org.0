Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929124CC7D2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D85F10ED19;
	Thu,  3 Mar 2022 21:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F3A10EDA6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:17:46 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id z7so6043443oid.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=e2GwE/etBc8Erbx+qDPyfK2b6bnQoQKlh2QZmZkCGw0=;
 b=IqNBWgHpJBN9OIsvdvC320YGgb7owQkrWetdfLWuoM7P4UlGQdbLJKpof83f9h1pZE
 eScsziKsjuxEjZIiufVnBNwkQEXjjo5Qd9MUy/LeikzbE57826NmsyOpYeA75WBxH4l0
 qPDwDywb807AeIC7YeJwMwMnEm5tlkLpeBQoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=e2GwE/etBc8Erbx+qDPyfK2b6bnQoQKlh2QZmZkCGw0=;
 b=NJccDY0R+4juMrv0NDL1bv1a3pRR6fbJ3vNY436CaMooVz6nVzHXan1jyxR1TBo8QL
 bxe+VwVRLSurdFQIoS/tboYARmBlUt8lMlirw32oKMcMJhP3k43n8KpHwCqftaR3w6Ze
 RkPQQHHhrAfZvUT4zPwKg2CN+ePfkBeMwQWMd0GUkzQEz8gArlhJ06ILzFo09IhD0NET
 Qvu8/Njnhj7+H/xiajmvh5qQITs9ZwjnMbXJr+e69l5BZ3Jr4H0Rr2SpqOZnw7yAi4Wb
 AQKzQWjFiuKRAExE8uMLJD6eQlYKGS5qs3YsqCRTuiF5d4CQG5IsabIhzosmVG9WVs0c
 02DQ==
X-Gm-Message-State: AOAM531lxPWd/yeUJK04/OHau9NFIKXoAyJp63OlgsrVL5hD01Vw7WfT
 XF1hcQPXBeuKoWZAKdw6fe7+2g2Vk0Acd98SDN3iSQ==
X-Google-Smtp-Source: ABdhPJy2OaJ7nt/oAxQEwMPJPSU7tb3bmd7tpnufgN1Oxgb2jMr1nMe0XjmXO/BnyT9pVQtNgRdAzGzdxiSdKJs2gkc=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6391521oiw.64.1646342265870; Thu, 03
 Mar 2022 13:17:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:17:45 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-5-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
 <20220222062246.242577-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:17:45 -0800
Message-ID: <CAE-0n53D_UwHZ8zCiLdK3dH+1JjdP0XrXVPMFjKpUMt1OReDdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/dpu: drop INTF_EDP from interface type
 conditions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-21 22:22:46)
> To remove possible confusion between (old) INTF_EDP and newer INTF_DP,
> stop using INTF_EDP in DPU's code. Until the 8x74/8x84 SoCs are
> supported by DPU driver, there is no point in using INTF_EDP.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
