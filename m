Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F0C8A0120
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 22:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2BC113126;
	Wed, 10 Apr 2024 20:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A08swq0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E0113126
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 20:17:06 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso6879093276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712780225; x=1713385025; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wpl2t5Lc6cJesRDWuT7gFpPkrIAxWIcY6OKcyPvyMSg=;
 b=A08swq0uZCPZ/Zc5plu8xS0YVR4MW/qVt+lJw3/uvAYl7JZqnP9e6Hz76o0TixKKZl
 0PpTmAdFz3FG8vA3sTbb9yTw5hcdJIHfUHYjDVyAxJGyRMePVSgJWGgetG3+OUyRPnri
 dmewS5X0gdLXLnoo5VKUtDz+bXe2mxc4IQob9ZAdSylwkL4IWkttttk8a1eXCkRc8F4C
 2lK3qHkTMVKFdYOiYCrnYG+rxSg6HauKB0xJXbF2c0L9if1PKJTrF4gqgL+PioSMWhP5
 uX7nrKfEdR4+wJvz2Xg+OebblSFW32R7VQCg3fIExql3OQwry/gbXhHIghR1LhY9LC7b
 c0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712780225; x=1713385025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpl2t5Lc6cJesRDWuT7gFpPkrIAxWIcY6OKcyPvyMSg=;
 b=ggoR+ULHzicAqrNzT7WGoXk/ypKnSPp0+djuNH4Yr1BGa9Y6R07Q6Bza4zvEzoOx8d
 AjMpXNtpTwl/rjhXsvqwTzGYJRncnoLFZUy6er1lAorbZGPAMMLZXtcvsuR91K3PhYMO
 naHmTGPUH/YrcybH5LRtrQ6NA/S3gfrFrYTvsZyOMAHHpOUnaZ+xZswejHQCvrhFC4lR
 CkiWqGioM/WOBKm19de6vOGa5QZ3xMvinqq4H2NVJ4c/2Lc2l+XBAKa7AfpYgko6D6Js
 sZZZ6vCerOMmYFSxP+gd3v29mr3fUOqapwZL6UurXPvRxXl2ZxeGWvANwv+1DD0MxpwV
 dY+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxoV1yhDmHcoabfdF0QbJMlBpIf9YAvlLbzyZw8UutRoVN/KJr6MnIfTDXWY9JqrByDpN8AavVhER0vP6Wcqxo1QQl+ip45npF8+LQpTmO
X-Gm-Message-State: AOJu0YzRU1h2UId2XcdfOST7Pnr3Sn193jM/c2u5HHGEODaAoRew0ROx
 lGvVcSASwAGwU1IKWNg/sVN0PFL1tFD3n9j9aV8o02LnHy5CUC5/fpKvTzZKRtUc3604IuZEZ/j
 tcTiWC0uJrB1jnQwWfBIs/jaFKQcywIoCm7DsQQ==
X-Google-Smtp-Source: AGHT+IGTqWvCcFmYbqYwcD8nzhhjYarPwwHUryzKAMP0hx7oyV+Ds53KdnlEjDiNmbxewoDT4W6r4oBzplgf7Si93h4=
X-Received: by 2002:a25:9283:0:b0:dc6:6307:d188 with SMTP id
 y3-20020a259283000000b00dc66307d188mr3572884ybl.25.1712780225450; Wed, 10 Apr
 2024 13:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
In-Reply-To: <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 23:16:54 +0300
Message-ID: <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Instead of having DPU-specific defines, switch to the definitions from
> > the mdp_common.xml.h file. This is the preparation for merged of DPU and
> > MDP format tables.
> >
>
> Adding MDP_***__ usages in DPU driver is quite confusing.
>
> Can we align to a common naming scheme such as DISP_***?

No, it's not something display-generic. It is specific to MDP
platforms. In the end DPU is a continuation of the MDP lineup, isn't
it?

-- 
With best wishes
Dmitry
