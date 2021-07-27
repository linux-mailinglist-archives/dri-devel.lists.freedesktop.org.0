Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB23D7D38
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826D56E175;
	Tue, 27 Jul 2021 18:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668636E175
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 18:13:41 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so14410097otq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aKtC8a02oPudfVTvfPjLwqW431wvay6OO1xdiJh08rg=;
 b=nKrFC4siEB5TMlf0Ki68ELxlcROLoP+EW8hSS9g1RRRSwJ8DskybY3HuBugBkwUgRk
 YuzHq7j3MrquDzlTixYwmfIdwrBY8dp20RExmfsKuFSCLvx2OJtCCS1CGh0fsxvL3EY6
 VnGlZXTO0PO0yEalK8LNcbCms/i7021GjZMj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aKtC8a02oPudfVTvfPjLwqW431wvay6OO1xdiJh08rg=;
 b=ZPQXIf0dU/Y4asUSKGch2JXLIjpyiYgLs+xjJhR5377GbkRDnfeGxX467AmdPfTkSZ
 C4beMqmvkFnPxjpYmqp5N0TInsBpNxodYDKQqKvqK5sgjp6tSR1l1/CxL+Bs4ACaKLmH
 Y5vkT754byXNy7ebAu38UK8RpcBQfU42jrE+OMule0KoZxlw98XntG4Hqq/OsdMJqNna
 +9f4up5Boh+5LQMZ3yAIMFS3AXTtrFzTQJJSinNG59vSq3g+UFda/OVZFGIZUDbLaf4r
 opKAvsNJdXxb+9SZel4ds8zpOZR+uy6ZcezusuVeb9MOCt0e1cxS9SMy1IjYvPgSziLw
 a9mQ==
X-Gm-Message-State: AOAM532J47YcOKouMkKtTwm+zt8AUF1kETftk/zPvkbKiCIH5+9s96fv
 kPpGE4Y5L6iUS2ElBWLdKPuFZpyduZiy8AYHHKCtZorQgEg=
X-Google-Smtp-Source: ABdhPJy8UQyIpcBk4ZgmdXAlqDPodoBsHwvzpjrdu+G7df2CikTzmvsUFtRH5Qv9r+9c0uahcJGB/Z2SNB2pM8LZqfc=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr16069312otl.34.1627409620250; 
 Tue, 27 Jul 2021 11:13:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jul 2021 14:13:39 -0400
MIME-Version: 1.0
In-Reply-To: <1627346298-11528-1-git-send-email-maitreye@codeaurora.org>
References: <1627346298-11528-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 27 Jul 2021 14:13:39 -0400
Message-ID: <CAE-0n50FtzCHyZay3__8Y+Cj6kZaTtx_wdRom1jDwx1E01xRgw@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: add logs across DP driver for ease of
 debugging
To: dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting maitreye (2021-07-26 17:38:18)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v2:
>  - Got rid of redundant log messages.
>  - Added %#x instead of 0x%x wherever required.
>  - Got rid of __func__ calls in debug messages.
>  - Added newline wherever missing.
>
> Changes in v3:
>  - Got rid of redundant log messages.
>  - Unstuck colon from printf specifier in various places.
>
> Changes in v4:
>  - Changed goto statement and used if else-if
>
> Changes in v5:
>  - Changed if else if statement,
>    to not overwrite the ret variable multiple times.
> Changes in v6:
>  - Changed a wrong log message.
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

It may also be good to add some logging into the dp_pm_resume() and
dp_pm_suspend() functions so that we can figure out what's going on with
all these problems due to disconnecting the cable during suspend.
