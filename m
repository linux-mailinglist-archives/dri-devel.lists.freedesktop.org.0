Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F53E503E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 02:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63D289DFB;
	Tue, 10 Aug 2021 00:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE71389BC0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 00:06:49 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 z9-20020a9d62c90000b0290462f0ab0800so10686284otk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=z7lFn/OgIbozxfPpWIL41tqWAyoo1c25CUhE+wVHy2E=;
 b=YhtgTTL24J2Q901pxxraRzr2e6aEAsvLQkHaiYTevOHYcVNNb70cjDiaEwdsIq8BXN
 wpYvPIjDyag/iyLToGVOJkKLG7uJdWDBeQ0RrSjIpGoUS+WRXWr4Uuc+9lFlSBwQdix3
 ZJi1BJJhihwUbTrgXthbzJEm8hOQtXIW2ldEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=z7lFn/OgIbozxfPpWIL41tqWAyoo1c25CUhE+wVHy2E=;
 b=b5QOYGDLQELcWe4oA8HT3mX3O51uVHGPS8diTPh8PZgiY96Z02Sn8DMu+9hT8QmGmT
 6WxCmzm1cdhiUn4+uVmi3TGbVBZodDzM43PWxk+f7qceM9TK/Q8eeXzUecEr1zpnv71/
 GA5ReSNON+9F5dErOvB4+7r5uANuD3Zk/l5DwJJbDPS+G0K0ZvYpzerUYvlQNXv9pSyo
 8UDTtGfNPrpRT93GPI0D1EQo3dwAYqSy9cOwMAUES7Kdmt8KvTIBARdW/YGceSGZDwwA
 AH2PoqBi9z5Ow+oB8SGh2T7NhUor8NZYHkSZssuUOH2jdVhfeDXgFS1BZx8ZeDbI2wwF
 lcag==
X-Gm-Message-State: AOAM531f4KJqqS2vTvNjpl4kY10PbMoanZUczrPnxnN9Emvg+5fMyw+w
 CIt0BTa5lDhXTbxhkla7uiBPyClP/5cq6sxgX0hAKg==
X-Google-Smtp-Source: ABdhPJyHxPiz+4jZdua08WndVHVUUZwOp93vnlfR/lihn4zZ0NeOwGKE8URDZ20NU/NwrBeRkck27YsGd7/EAhlLU98=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr18959569otq.233.1628554009313; 
 Mon, 09 Aug 2021 17:06:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 17:06:48 -0700
MIME-Version: 1.0
In-Reply-To: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
References: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 9 Aug 2021 17:06:48 -0700
Message-ID: <CAE-0n52+DWvcO54WJEJUaFQ9y=4sb4SeuVzQ5LSXGm24bJ-16w@mail.gmail.com>
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
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
