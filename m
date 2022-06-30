Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1B56270B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 01:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D393010E430;
	Thu, 30 Jun 2022 23:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0C910E480
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 23:27:52 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 72-20020a9d064e000000b00616c2a174bcso568155otn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=SH4c10UHd2jm5iXZMsMlumPvXgKDKSukPGr/j2MwBes=;
 b=DOYeB54ERnxkc8KCdfg/9ohDBPJKXF4Zj3owMi8p+AOUa5ARLSnQ6//fWAcXaUSeYo
 pIbJo7hLhKev5eib3IyLpSXkMUnnDGAeqPNe8oSsRGAG/ReIqkW/mKCkXzKhz0k0zx7P
 XiC1PDBqdFcx69rKuM+WWlCRM4kpBxZ2tDOdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=SH4c10UHd2jm5iXZMsMlumPvXgKDKSukPGr/j2MwBes=;
 b=ohwLtdDEYeb1yIqK4TyHNwSpZ/1dnqzwvJNBlT+yC0ymxRAQuNH3DpdTnZQx02QX8H
 nCF/XYuGR+WImRHkZW5NH6h6+5XyoqxrnUwm8JNkldP9jeMlKKzZ0pGUIzc4IwqPaIUY
 FoCR0yZJS4/YhnibaYNNDYqVUSuHEyLzX7PohoMpreEpGBeNiVr18nw9uC1bsud7ayVt
 a/1EAHSuV93Q+NKWC2GyEBxIeHN8ntk0542RYbOps8rXvKC6VU/BofBOuMhiB7mEg8Ju
 /OA2tv3itb+6dxFVDrCTFqEtBVBTF4WHupsPU6caFFUrMxqX7PcIYWLZxFnzpukjaPCP
 0bGw==
X-Gm-Message-State: AJIora8qJ6Agnm9zsAf5Y1YlaE+oGUjZkKOkb7fIzgiRgLa+T0tPsu0O
 z4N5riY7+GuQwOw9QyL2+Lx4C2bfs6VsHjG8WRLIgQ==
X-Google-Smtp-Source: AGRyM1uVXOUlD37mLQ7pLmkL8BIEdZdsnlXTlVxy7cY0Oa3nZ1gzq/kLiCUOdFyoe5MDzqiDJ+32/N24XhJQNeSiK8s=
X-Received: by 2002:a05:6830:d81:b0:616:c424:6f22 with SMTP id
 bv1-20020a0568300d8100b00616c4246f22mr5252300otb.77.1656631671458; Thu, 30
 Jun 2022 16:27:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jun 2022 16:27:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220630173328.1369576-1-hsinyi@chromium.org>
References: <20220630173328.1369576-1-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 30 Jun 2022 16:27:50 -0700
Message-ID: <CAE-0n50Pe2=tYeuuhBVHsTV9BqU1huU-w-xMMn-1scj2OxBWbg@mail.gmail.com>
Subject: Re: [PATCH] video: of_display_timing.h: include errno.h
To: Hsin-Yi Wang <hsinyi@chromium.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-30 10:33:29)
> If CONFIG_OF is not enabled, default of_get_display_timing() returns an
> errno, so include the header.
>
> Fixes: 422b67e0b31a ("videomode: provide dummy inline functions for !CONFIG_OF")
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
