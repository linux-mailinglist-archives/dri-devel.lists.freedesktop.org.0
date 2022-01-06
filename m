Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9708B485CC7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DD310E4FB;
	Thu,  6 Jan 2022 00:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD9810E4D8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:03:05 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 131so1100826qkk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 16:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssONjB52T9db6+AwacpF9Z0HfuTWVxGvlKDXaL5sZD4=;
 b=WZSBpVwh3QTZfHBZLV54czxSDHcNrFDD00XjYyiQ2Ka0nqTU3wAFileKOC0v2xWY3F
 aYi4Ljg9ZJ5sZ0uCtB2FGIsbQ93KsMfvFApEF9mplhGmhQkMBEvI0OYcS4Lx1xCHCEJD
 qMJKxW7PKiWXujlSeqZBy4CT6x5stkKE2gEwjEaPLyAuvS5myEtG6eGJccGTEanGwDCU
 CF4FXMTGJutk/aEv8WS90+JA9xE2WhN7tZ0Mr7SjgK2zgj4Jgupn3jzjLHGcRgtFy6SK
 0DQnyL5RWLYfDn+zf16qdI7qauoNx1hue19JXGopxYDaQorZ4awyZT4sfyll5CWgKZ+5
 jXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssONjB52T9db6+AwacpF9Z0HfuTWVxGvlKDXaL5sZD4=;
 b=oAGayv9//TOW+deNw/F2ryKB2sZBdCQ0f0lKVcI4XmJPapDwXEOQ59KlXmh0bDANEV
 ZgRAvF+qUSRZRS7qdB8qN9xJIj7lC0IQ+jdW4q9MSBGl078edKmHTRq1REpUyr7Zqk/Y
 PFvCxXpK9YK+F87Cf+45zfPAesuyMbUtUGrsk+nc2X4xRliv0nCPb8uhKmdj3fhceoQj
 g+EG9TvjSiyoHl6BhPikODlZl7X/1KUoEFiYNap6DWuG09nkk+TsQb3hOeyCOe5JMY5w
 y3kOxx8nT9JHYaKx+C+X3hzr5kCBdCMKNwS3Udc4RYpE8UheM3aANuTi86+ik5myOAe8
 NReg==
X-Gm-Message-State: AOAM533TVhhXxZxQbZkMyCxJ7BSxPsILHimigLyw3XAtFozWsrL1NaBy
 yYB9PpxXgcVmSgIXhivd4Jw6JlxQG5YLkrBb7YbQJA==
X-Google-Smtp-Source: ABdhPJy/OoApJncON5r6kNBonHzIlP9P6S23pAbv4nLVXCuC80zPXDfcJ33V7h0DY405MSua4DBRdlVX+QeRcw+KvA0=
X-Received: by 2002:a37:b8b:: with SMTP id 133mr38079500qkl.59.1641427384486; 
 Wed, 05 Jan 2022 16:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
 <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
 <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
In-Reply-To: <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jan 2022 03:02:53 +0300
Message-ID: <CAA8EJppodnj9sW1oyXu8POd2Evkqz0vuNLmz5v8RYw+Ww-rpCA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: move msm_readl/_writel to msm_drv.h
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
 Abhinav Kumar <abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Jan 2022 at 02:43, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-05 15:27:00)
> > With the reglog removal, msm_readl/_writel became single line wrappers
> > around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
> > remove need for extra function calls when doing register writes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Any chance this can go further and replace msm_readl/msm_writel with
> readl/writel directly?

This can go on a step-by-step basis. But practically yes. With this
change in place we should be able to drop most of the io wrappers.

-- 
With best wishes
Dmitry
