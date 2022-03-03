Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC504CC7CF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A6810ECC1;
	Thu,  3 Mar 2022 21:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767BD10ECC1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:17:27 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id ay7so6003663oib.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=wYzeeIZFTYS/KurLrrqYigMllzmjedeg2meWYLtmJLs=;
 b=D4tg2jMDQATVChv7StvQYVpE2j1Tj+kDhpfEu/nlLJfNE8SxQ5d4TzX/bElISDi05i
 R3jC3zJgEcQ5/J+jFw+SiGbuX+w1RIYBjBsdLXqLEMQRBafBlY8Mt8uUk6Ri6HTiUQKP
 FkuPBg5veFnilziG+btyWOiLATOSFsUqUBhPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=wYzeeIZFTYS/KurLrrqYigMllzmjedeg2meWYLtmJLs=;
 b=bncMedsQdJAY9JgCN4mSWrSeSDImaRd9Oxs7WlDTz6gAWMKeDeI6f7alb5oUlpWAB/
 G/zDQ1Dni7xTyTqX4tK8UVG3j9p2E4UZPqy02YKdWipv74KbEpDCG4241r4RCongGYWw
 PIHooFH4dsLZkkPSAptFw3G3XNaB0Sssdf5+yWCDPipWsAxlT8Pz0rmrrtRhDiPMG0ev
 +fGWCVXq+s95x4jMjfAY5FuJCTrdBlPpuEi2JgB/QH2VlekVON/T2/7yAHCJimebWq9Z
 xbe8lj48k6F+4ST7f/vYpWqY53zdDvrCq2F7kxW9qhQxxnhnbyiuNtZUujd731AwJFF2
 mBQg==
X-Gm-Message-State: AOAM531vpM9ILX8C9j/vu21QKCkzQGCsrl5u+9c6w6kY+4XCT3HxwcxE
 uolJxYsKYtAF4jGo6Dn2yYHEAM2NBosmRv6k5ud0yg==
X-Google-Smtp-Source: ABdhPJwvzjaldM6yPnGiL2obFRFwrnHI2rMhEOfCp5dWyB7Vm8URBBIA4uwHZlOogwzCCxW4ZLySjZG/0DgisPYxpzk=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr633882oiz.32.1646342246775; Thu, 03 Mar
 2022 13:17:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:17:26 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-4-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
 <20220222062246.242577-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:17:26 -0800
Message-ID: <CAE-0n50uVsdWU53p+VVjT-Zv5FjjwHfdMOFyy4O28_baNSh4Nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/dpu: drop obsolete INTF_EDP comment
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

Quoting Dmitry Baryshkov (2022-02-21 22:22:45)
> DPU driver never supported INTF_EDP, so let's drop the obsolete comment.
> If at some point 8x74/8x84's INTF_EDP is ported to DPU driver,
> corresponding handling will have to be ported too. Until that time, the
> comment serves no purpose.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
