Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1064CC867
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECAC10E9A6;
	Thu,  3 Mar 2022 21:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679AE10E9A6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:52:12 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id v5so5069774qkj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7H8W+iRhHgP+pCnSQOjF4hQNmgpqnsMBxwOtw5ONNI0=;
 b=D8Lunl+P1XayMvWFGPMHQYu097oqvfILbigErXwqOgwLBbKtZycF9/9n+LUfKjiqCG
 psC0r6hbO7EOWq8kiPCUK6tGeckGqfUZVvcYldpC4NGnHFD1J+n2OctfkOOsC7xEiVQ9
 xjqri+didOFMYxx6FXIXiCvds9aDw3dhoWuB0GfT8nasQAluVBwE+KOpKQ1rI5T8GBK9
 tvmiZHbdjZRRhYvFa+Rp1iNNrFmG//Do4tZLx/tCIQZwFxEKlHX86GZyoIGkPFWbVD9J
 tge97PbNMDG9G5skmhv3PD6Gw6rK06l3C6rIdfae411dKfo/FYqv1JHFZm9got+3M563
 EkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7H8W+iRhHgP+pCnSQOjF4hQNmgpqnsMBxwOtw5ONNI0=;
 b=2sY5hF6+JtV9FD1xy1XAs8G3wtu1V7fcpq5ae3TEhW5N/C+PhW6QzpAUyR+jArijq3
 sVX8sb7N8ssSmPxMQS1bY2/NrNzsPGr9kVCOLpS0L6VV2Os64P5ZgEVh+huZnUaXqnzW
 oP8pbt8KynfB8RL8YdvE1hI5DuoPRYDQWRNRE+bXkOAVxEJ9oglLHWxmlQ8XFf+1j4Az
 FyQtEQGfVwXmz0yNTQl/jQF7Jji5blzny9MkYFhQ2EwwcSVbVWGONU5krnwiT8tDjQ0I
 lrzUbR032s8sk/34t57vEqzoLDL5N9YI1FIbOpZKPKIvbQfLpTfDQGysoCN0knxJ4TmP
 z9oA==
X-Gm-Message-State: AOAM530DrqWRJ1BMEkDAEO/dAbJEoJ7tT/5y1VNRoeUv2UEVQ/1eXbGR
 Ul0h9zz8NH676RbLHtks7ddpU2pIEMUDhdEJG25w0A==
X-Google-Smtp-Source: ABdhPJxOwj+3tNXzMiaHU4qnZoihRIXcuB3LLrxVK9tzS/R5Y4vbwr2p+GBm/Qq+c8tRTIsvJT8y+j4N85Uo+hCDgnI=
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr821322qko.203.1646344331420; Thu, 03
 Mar 2022 13:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
In-Reply-To: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 00:52:00 +0300
Message-ID: <CAA8EJppziFTb-L=aSkr7nU8EwS=nv5rbX+aKwq8YZDCCvu2TJQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 00:23, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> > This is the second part of
> > https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
> >
> > Changes since v1:
>
> v2?

And the series should have been v3. Thanks for pointing it out!

>
> >  - Fix warning ins dpu_trace.h related to
> >    dpu_core_irq_unregister_callback event
>
> Any plans to migrate to hierarchical irqchip in here?

I haven't thought about it. I think that using Linux irq framework for
the DPU driver internals might be an overkill.
I'd say that it's not at the top of my todo list. However the point is noted.


-- 
With best wishes
Dmitry
