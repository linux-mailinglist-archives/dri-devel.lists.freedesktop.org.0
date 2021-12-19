Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF947A168
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 17:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25212BEC8;
	Sun, 19 Dec 2021 16:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CDA12BEBC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 16:40:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x15so28917894edv.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aZDhe1+X7dcTDO5SYf4GQuIC2RY/leIj44gk9bS0yU=;
 b=j4txCKuIV4jYOe0+uyw4+PyUJh/NG5FK+hjvrB79BAa+/bSClWOOKDQyXy94JZjLp1
 9XQ/txJvaZdtEZq750wsdh3wy5AQxi/OKIQsoJS4ZLVvm2lcN2GsmjQqYL+mshGhFUd6
 j7sTstIbpJ4UH2O9EvJfOGqeUvBssbHYSXUnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aZDhe1+X7dcTDO5SYf4GQuIC2RY/leIj44gk9bS0yU=;
 b=WycWFDPy0AsdXKXcrF07YgNM38EkrH3e/QRN0JmYws/01foHWtsRegcCazMt/r4FXY
 JbRYD9Jq/KMT7nzcp33Duedr/YobEAiG6ELe76rssz0S30CbTvZ0QzFn6G9YM6iXod14
 hm3hlg3IDIGUT8MR5rH3KvPoKyRjCpidQsLkZpASd7DFAKFDjWMGldqGfKg6Oc8LQE9b
 +eNYLF0/df0kbUKu8WiDQ5bLwcI73mYxMjlVt/3uzOjNlQH2cxYgi2fjJCCr1KnH2OiC
 tMPC9iZ2A20SoaJytdwsYnON9knUuZnHshPw83jRkFj+KqlngzGai5tnJChWnXTbhJo+
 P0XA==
X-Gm-Message-State: AOAM530D24fNxLZbE+SulCCAOT368bKm7HzpvZSSaZdJPp9qXOBVo4xM
 jfbSN7f28EAkwU61xz9g5uaA8+IWC+UL9VG+m8kdKg==
X-Google-Smtp-Source: ABdhPJzDfUkevwjyB6MMywd7yBYPYDl67kiicaogFfCYK4yudoPMk7rh/WFTlMUP66IXblk03KL81ukeAUk9WA6QmFA=
X-Received: by 2002:a17:906:c312:: with SMTP id
 s18mr10367669ejz.620.1639932021009; 
 Sun, 19 Dec 2021 08:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
In-Reply-To: <20211111094103.494831-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 19 Dec 2021 22:10:10 +0530
Message-ID: <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> recent testing in i.MX8MM platform.
>
> Fix it.
>
> Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index eb475a3a774b..cf3f21f649cb 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
>  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
>         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
>         .num_modes = 1,
> -       .bpc = 6,
> +       .bpc = 8,

Any response on this?

Thanks,
Jagan.
