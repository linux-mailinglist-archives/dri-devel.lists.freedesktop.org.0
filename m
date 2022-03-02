Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E884C9A8F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 02:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D02210E63E;
	Wed,  2 Mar 2022 01:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527710E691
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 01:39:29 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so306330oob.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 17:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=c8c86OEqOSehxlQhPxGLo0iioV8oYfqJEJFuDjvqLWo=;
 b=hIE/VP6awfGy025Pee+jBTHAeWWsN2/N4U2oVA29EZ6sUVlp6ZS33TimoWvJ74FSJl
 WZUZTV8acVAWTHoaqZANsb9aRlIwGrgMCvpZqNmF1+R+V9lXm60GkhdkUYnagxGNYtpG
 zICC0orF/OdRvUeQ0kK3GMm5zET7oci0WXlsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=c8c86OEqOSehxlQhPxGLo0iioV8oYfqJEJFuDjvqLWo=;
 b=JfqfKH5Gs2/Wt7LfSkSOHAFv2LgJlepS/7vAiqSrdgQ5lgzu7AkNP+IhfiKXZUbEwZ
 aoHbkK/mIqVJBEhwkJX7KrwMZp1KdSEVOuoj2rCho78QJaGEADkWWYo3dmJbwWfg3eBu
 le5A8+OVkZeg/7PNJD5XjsxqPzVH8kVY3EtevMz+Ih5rFAGiKOHmt2nw+fCd37eoyVo9
 Z+Q8hOvWE/WsSg8WYcVz0d39XoCF2JxIMu3A4sAyuiYGhY+QaxatxRRj0RoUyGNjuJEi
 qdj3VX95O7Qkr5CO7NgyUnN9FykNkxjGpaX6fa6qe5V9xcaG4QE4ZohMHzVlB8fXu2LJ
 /d6g==
X-Gm-Message-State: AOAM531UUl/OrAlu3pKLg9Bps06AjXIxLh87u6vgYxAmw2qqMs+jjzew
 mTYX/CVrdy958ERT49fyOIL8zBoQYb0tYG0gl+rk0w==
X-Google-Smtp-Source: ABdhPJzrJISuUSwYLe5NX4z7wkzXV0rSJsqIg1aIyyv6HslMpOfb1uyj0QJbf+YVMB9TH0G981YvTpkC/Lu/VyeRMmA=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr7908109oab.32.1646185168324; Tue, 01
 Mar 2022 17:39:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-4-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
 <20220302005210.2267725-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:39:27 -0800
Message-ID: <CAE-0n53S4q5JN3a1ypwaR8kEKbJVjmLZVgY_O0+T3KY5eXjesg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm845: Drop flags for mdss irqs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:09)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
