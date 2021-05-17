Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69618382832
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E812C6E91D;
	Mon, 17 May 2021 09:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0736E918
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 09:06:05 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id o9so5444766ilh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhBsFoPhptVa9URs6mSG4ZbNLPUTyIwgN05U7hJwC9Y=;
 b=I18S2Ws4GXN8FkRQGVN44p70lrOeDbCwwxy2JNL33usq6DMThhDbsztztNkzxy2ECD
 SIbJ9IJ1vXEkm5dkOfwL49+pjRR9jvx+hkuHiTCaSxb7CgVu+xH46ree6wwllUvzcFwD
 wlj0ogH4TPJXDCYmhQZekW09cWzwAXvB2F2QbG2vfvaGIiRj8eic72eJmMwrV4mzNs35
 xpRKTOjfOm0CsHUvjbfcHYzVOTAOK8wMaSWQ81YPNkZBzGjphwrYAY+smuY+25j2ZQKc
 kaqB4jUyY6r4DQNlkP0GJnHzHEfXXEJewixtP9INqFJIBW0MOKaFRbxIs0d1sYqRAijV
 tYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhBsFoPhptVa9URs6mSG4ZbNLPUTyIwgN05U7hJwC9Y=;
 b=NrTeRluCEFatdf8wpbb0+Yhgbgs0mKodbCY+taTg8V2QO58RKkbTl8KsPgu7OcnOOF
 nJbZx6Y09+bnfJhiubZO5K4n2Nyhlmi1fwE0ebYQift1hsxUyNGwClKtl/5Rs0aWaPbh
 KCUuQ1o0r9IBro9FiBT5dTv29t1KbGYMfrmiBeunIz4bu9S761Rh5lX5Q1qEbIDLA8U4
 cuK+DJoys3jHBCiqGL8L1gcNq39X8VDug/w1jpX4qVd8V07ASb+t+np5oTTh+lTYgcqv
 WJvb1kR+phwgcZTWKhYBPilAm4ldDJfmhkMU4wfV9if9BatfM8FxbvvBLxCzjik6U4x1
 /dyw==
X-Gm-Message-State: AOAM530zHJJFiZ75KXXPN9ImkLxh9Qw4pGHH91TcpqzQPkwmU6efV73c
 cHe8MAKquCXWVw2l8QPVI5JwiKtsq8gD+asZPzaRbQ==
X-Google-Smtp-Source: ABdhPJwFIdD7WIAmMb0ftSFmMfOmbQ2rPnD0CLUqSD5jJWRXpFILUElK+6sgSg7DIonnb5hq79j/mfF6Kn/fdqZe/mk=
X-Received: by 2002:a05:6e02:92f:: with SMTP id
 o15mr5689524ilt.127.1621242365082; 
 Mon, 17 May 2021 02:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210517063553.554955-1-pihsun@chromium.org>
 <20210517063553.554955-2-pihsun@chromium.org>
In-Reply-To: <20210517063553.554955-2-pihsun@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 May 2021 17:05:54 +0800
Message-ID: <CA+Px+wWRqpsF+P8wZXfN1LAEEb2pAUc5S9KJvaP=yEeevUDtyw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: anx7625: add suspend / resume hooks
To: Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 17 May 2021 09:22:53 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 2:36 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
>
> Add suspend / resume hooks for anx7625 driver, that power off the device
> on suspend and power on the device on resume if it was previously
> powered.
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
