Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B11F21D1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 00:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652E889F07;
	Mon,  8 Jun 2020 22:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDD389F07
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 22:26:01 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id k15so15045754otp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bc9tsjIFv/jB6QM+YnSZNZcJOlFnkdAaejqLZYVYxEA=;
 b=BLSZRjuywFEWfrzDsWBfP9L/UD63HowwitzIJ8ZQDiSGzaYpks1b2U9LlDoJlCAh1B
 7bRYKtOaOCcX+qfCaB6XxW9qtpsYVIXv/rO7pUoQsHxqBBQwuNStQYxxdUZrcY2sVEaF
 JRUw0EUxUgkG0aW2gXuz6MlGRVnC8wq/zbzOso/uojEYoGpZkJ3lkVls7CABw8X8WADe
 InLkZddLI8woa2s6PnDkQfNqc7WBwUC3zdRkcvTRJYZ00vxHgTbPq4RmVVRCVUhaua0h
 NLDvKCNa9F/wn2ffBc3CxlbvQsUPJagssMuZmOxuDDe5F4a5UBg6InhK9JLs8kq2F5Dx
 M4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bc9tsjIFv/jB6QM+YnSZNZcJOlFnkdAaejqLZYVYxEA=;
 b=bTEMLiQ4BsXv9NYAtIFUFZl6zNC0odrVQxcpULwA6M6ixjw7/FBaDnyfkqQIKw9DML
 AjSqj70WSz2ELxtpMDvKVa1KBUXr93rIJS8sppFmaWe9it0YNRj5YZpCVrFu31Jk5u9F
 7N1mc2rOWfyoDE1T0b4YWzJSM+6rk7U7t+GHcO6hv99SR/TpG6XJO1RJaLqAk2E3usso
 i/5qpmkLrlWp+tZ7B5DPYiFgA5RLCIZCLAlQgLJOABFajb3RhMDyP/749tmW4xdFdMSY
 36b6alYR4NdH0rzDoVXlNrXYLlaNgQtYPIXMApRVrj7eMD5cHVThjHjzJsMr28cd0kms
 KCaw==
X-Gm-Message-State: AOAM532mrXazoKJ3dquy9vVrMi/lLmX4nm42UFqdAxupopkuW4iPZs/J
 I4aceqcGSei9euOeZw/y6tydyijsPugmbode8cPExw==
X-Google-Smtp-Source: ABdhPJyMp64A28sOxzeSkkFqGhDUVU7DykXVmi2Ng6Irnv+4+gn54jjMjWOaLN2VKHEcZDo9gLdLayjCOhVevAod6FU=
X-Received: by 2002:a9d:26:: with SMTP id 35mr12455930ota.352.1591655160681;
 Mon, 08 Jun 2020 15:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 8 Jun 2020 15:25:48 -0700
Message-ID: <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add support for color processing blocks
 in dpu driver
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, mkrishn@codeaurora.org,
 travitej@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 hoegsberg@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change adds support to configure dspp blocks in
> the dpu driver.
>
> Macro description of the changes coming in this patch.
> 1) Add dspp definitions in the hw catalog.
> 2) Add capability to reserve dspp blocks in the display data path.
> 3) Attach the reserved block to the encoder.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Hey all,
  With this patch now merged upstream, I'm seeing a regression on
db845c that I bisected down to it.

When I boot up I see:
[   40.976737] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   40.985600] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   40.994587] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   41.003492] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   41.012283] [drm:_dpu_rm_make_reservation] [dpu error]unable to
find appropriate mixers
[   41.020369] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
resources: -119

Over and over, and the display doesn't start up.

I suspect we're supposed to catch the following check before the failure:

+       if (!reqs->topology.num_dspp)
+               return true;

I suspect the issue is in dpu_encoder_get_topology() we don't fully
initialize the topology structure on the stack before returning it.

Does that sound plausible or is there likely some other cause?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
