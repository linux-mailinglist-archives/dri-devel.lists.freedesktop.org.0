Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0C3E5059
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 02:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6B189DA4;
	Tue, 10 Aug 2021 00:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03A89DA2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 00:28:49 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so20121424oti.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 17:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HRoKBbC120mpZO7Rwf3yY2Wqv2ZDw0SsZhaaP3iG9Kw=;
 b=b7oTI7pXK4UvT/slNhXBHpYCZP7+MeBmfeSSbjI/aKYSqGEunyiYcIMcqA1eq8BC+H
 oBPqmdPIA6cv0p6LCUDFdtUC2mXrZd5B+ZzB5di1KJyFAwfYBrwtoEgy2bp7dQ9B6FCr
 yJ+hAioIV+wD6A0vvTE08xu163VL+w/zKRi7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HRoKBbC120mpZO7Rwf3yY2Wqv2ZDw0SsZhaaP3iG9Kw=;
 b=ZHXK40wVgvBVJWWxjberq6Pn6aiOjDt1C5Ol+eu9fq0nPgUtkLSA1ko50cEuKzkmZ7
 1rYIqeivyL1yxBZ1R2fypxI+5bf0BVVvCre8W6j8HZcjU+YjfDhZzaNtEjHjRCrnqqft
 pb6VseRimVMUzNRqUnFMJHGjaTVYsgnQDpinF9qniPhKNgMH+ASomk6j4/k5mA8WSIAN
 unlEDyQVJ4IDW/ugo4fedYzOXP8VhSvf3vbmTH9cY+j5fDX6n3t90wM0P/KVmUc1jqtX
 MnpP2uEq0s0o34LOWaOJin0fjguMDlRB0SCqBgwU41pKITFhHVWVMZ05B/ULQRnvLiuV
 jS8Q==
X-Gm-Message-State: AOAM531c0zxHlc/Vd3CtaqyiGhXVvNRJzNxKqivMuEF4VOo/1/4i4f/x
 JaYiY8GnGoJEuEPZ16HtTq4FxJ9jDA7SKKAfbpTCtQ==
X-Google-Smtp-Source: ABdhPJxoo8NK9wFlwHerqC8A8M68otlXDKJXzE8FXoEI3Z9Tb47KJ4Do1b1frIJJ5Zy4cKOXDh55LHg6NY73iIRVaGI=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr19010939otq.233.1628555328400; 
 Mon, 09 Aug 2021 17:28:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 17:28:47 -0700
MIME-Version: 1.0
In-Reply-To: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
References: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 9 Aug 2021 17:28:47 -0700
Message-ID: <CAE-0n52Ebezuek_HrBHRFVyUv28aj=F+6FqnBkZZLMYwUa8veA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2021-08-09 14:58:57)
> Add drm debug logs to dp_pm_resume and dp_pm_suspend to help
> debug suspend/resume issues.
>
> Fixes: 355ab7428f09 ("drm/msm/dp: add debug logs to dp_pm_resume/suspend")

BTW, I have no idea what commit this is. Best to probably just drop it?
