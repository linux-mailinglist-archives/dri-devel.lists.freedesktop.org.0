Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181AF3C9336
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 23:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C286E303;
	Wed, 14 Jul 2021 21:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609356E30F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 21:39:32 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 r14-20020a4ad4ce0000b029024b4146e2f5so1005791oos.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7yU/lXVPq8v5DxUavviakd+XqTwyKh5GL+eckjJwhhU=;
 b=Huzsn41/m5wNJTthgcAkHFWvNusXC97KqI0iRCAyi4I1V8yYIvTOhj+iZO052RBDgY
 /jxRFEZK8vH/CEYJ5CnaKLfuPND5/1DeDeNXoS5qhh5axGrqcLRDIAgCJvKCy8aLX8g1
 uCSMpbZnly1BXgEIB0LWc1Jh/Ao6j+lmqofVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7yU/lXVPq8v5DxUavviakd+XqTwyKh5GL+eckjJwhhU=;
 b=g/SCu6VrTSCIdml4uwzyl1hcwEs7RU1MnR4fgdAg2D5KApzbH382+0Qxdr1XhI9x00
 FQTjvi9iKXPc0pM2ricemmLw0rwAfD6c57v2kHW/w9FJudhz+9XQFS1zQ5feW7Xpnv46
 7A/rJVa64KB1EX4wyNY1Fzi4vXr3mqj4vehVSfFVLibqBTehFdj9w7/9mKwf3QjYxcko
 NIlR23IcCymZbZrLDfJ8OcdYrn0hQMVOEgbsMazjy2Dcb9DSusfgToaefJbPmswKZiA7
 EpXHUCHyuQRhG+LrsW+zrdjBW1a6ZlVoaZ2vJSb7c+HbyNNqLFYR6ojBUMcoIk8Klujv
 n0cg==
X-Gm-Message-State: AOAM532uVleXrWfcX/FOGdFsddy6sfBDeqTgygxWkoW9G8Wj9tFt8JVu
 yBE1PN9UxJE4h+RgfwTniDQMQZW40tPBCc9OKpz7JA==
X-Google-Smtp-Source: ABdhPJwE2R3+k8+ce7HwbkPywG7nnMFEF4vtMpBltJIbIWP52CkUWZLrAOaoBO6XdJi33DjezNuNWFNaiYMAd18hPNU=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr17846oot.16.1626298771497;
 Wed, 14 Jul 2021 14:39:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Jul 2021 23:39:31 +0200
MIME-Version: 1.0
In-Reply-To: <20210709024834.29680-1-jrdr.linux@gmail.com>
References: <20210709024834.29680-1-jrdr.linux@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 14 Jul 2021 23:39:30 +0200
Message-ID: <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove unused variable
To: Souptick Joarder <jrdr.linux@gmail.com>, abhinavk@codeaurora.org,
 airlied@linux.ie, 
 chandanu@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 khsieh@codeaurora.org, robdclark@gmail.com, sean@poorly.run, 
 tanmay@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Souptick Joarder (2021-07-08 19:48:34)
> Kernel test roobot throws below warning ->
>
> drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
> warning: variable 'drm' set but not used [-Wunused-but-set-variable]
>
> Removed unused variable drm.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
