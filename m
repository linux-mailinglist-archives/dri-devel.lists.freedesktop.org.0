Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F23E85A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D041089709;
	Tue, 10 Aug 2021 21:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6812589709
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:49:40 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so842803otu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 14:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+HYiu1hW88Bpj8WftJ5CqOz/LeBLWxJEO+HNgAITcxU=;
 b=f/xWfkbKitmRmGG+Ekhc7MQBa3QgQs/6Zk8sKw0qdYl62Xwpi3CX4mYHsahRMBxy5f
 Ik1Q9sJy77ceI/3yp+qhALsMcAcLPD3NleInGIoO8w0rtylP7FsxDgC5kWN4LrhjNToV
 HGyfInuryvPdOPn/iUR7AO21+najA4fciE/lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+HYiu1hW88Bpj8WftJ5CqOz/LeBLWxJEO+HNgAITcxU=;
 b=bIjiaDn5vPxH3yNn6np0S/m//DVRHTyNndtjIWI7y+MJB+YzfEhBmVFsRat0GKbAAi
 G7G/uTdAmmwOXfGtdS+lnL3ykNMsBSBUwYYWhrv2Se4/Z2E4Nzs1JAJiGyNG82hCH++R
 enMd2zavQX6DACo1qF27QMG+a26gI3ACkIYZwHprLfT0ZgrFp6FnodLN8XSwm0i+Ltu5
 rBzaDb17fKbcsndtgW3LnXdacyRp4pkmr9nYub8Fwd+dVmmNEbW8J52T9M3ptafueu5P
 unoYPs/wtJqsYL2E2EYYrsP+KL5fiAlGCoELdFsndo1gfS/KaR0Eapqml4dPxdJlpmF+
 2YwQ==
X-Gm-Message-State: AOAM533D5BzbTVLWCD6LxwWhAALKCXaBCSMoEUAYeD4VspivO26hgE+V
 P5WpvTt+Jfl2IY50IpHlYJqtbdL5AL4NPkubyMgQMA==
X-Google-Smtp-Source: ABdhPJwWB0tX5GDFBeHZ1LiAt30TiVNcHXV5DfsWQz9Zp1GM9/8CHg1+g2E6eAgybkGTqrk8/i3G9uSY7xs2fWzT30k=
X-Received: by 2002:a05:6830:44a7:: with SMTP id
 r39mr22563794otv.25.1628632179611; 
 Tue, 10 Aug 2021 14:49:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:49:39 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:49:39 -0700
Message-ID: <CAE-0n506f7yb3g7bGj0Xk43qL1Xw2Qzo5nRw76sdAYZz3NhO9w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] add fixes to pass DP Link Layer compliance test
 cases
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2021-08-05 13:44:49)
> add fixes to pass DP Link Layer compliance test cases
>
> Kuogee Hsieh (6):
>   drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
>   drm/msm/dp: reduce link rate if failed at link training 1
>   drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
>   drm/msm/dp: replug event is converted into an unplug followed by an
>     plug events
>   drm/msm/dp: return correct edid checksum after corrupted edid checksum
>     read
>   drm/msm/dp: do not end dp link training until video is ready

I'm still able to use my Apple dongle with these patches so

Tested-by: Stephen Boyd <swboyd@chromium.org>
