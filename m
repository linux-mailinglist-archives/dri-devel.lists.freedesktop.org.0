Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235F39B43B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE8D6F5BB;
	Fri,  4 Jun 2021 07:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FA6F5BB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 07:45:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a1so3027982lfr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=un0F/vMB1as+8PlF4+ud9qIkBU19hc8DoD6YAjyWcy0=;
 b=Fwupc6a/DGTOQ8oMq0bGNwyIcz7ZET0LwWu6M/eKzjcQXl1Jh6Ett+hbBZcTy64rGi
 JVxlS3+hi9Jlbd3dnE6RN7lGqJt0+G07bnsojvdx2HwX7ptHC/7zXWcOpDKAciOBZn/p
 9DXWZNP6ErZaz4liObuPSLBYGQFDPDCKHgKbLD3TQZjGKIf2diSYSQb/Kyq7nZLI+pz+
 l1JqDaK3Cbi80PkIFW+D07pUBTk/bVr4QlZ9ezzO5QVJUldMpTI/aAokfqZV99gaVA65
 Rq4G9yjmP7vkyb8UKVZM9kd/NtTXwcZiNMH1uSppbVELQbBq49/hAdStrNWxemYxDGtj
 jfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=un0F/vMB1as+8PlF4+ud9qIkBU19hc8DoD6YAjyWcy0=;
 b=CgngfdUXy01G/P87gEy4vs5aq+TbcKi5ychR7vQPTsNqayW/wW8gZdKAV78IRMJdrJ
 JFVtIRqsfFilDMf2zqmYxO5z9CINibzK3EhqmGA8DH8avZsZ+JLJJEbzWrRJJGRv9fBG
 xvq8fgWPwxXaS1kI4RqruecOKxFcjhzD16erjlWOEF7/OY0T/0eYLIu9GHLkR3VZJpP4
 b36HxEPiPFF/FBxoyYzPTqvCwPrpiIQuubwC7aU0TAx55vVmA4YAcYqzFBWM+g8pcMew
 0i6mcEUdO7747kYbOX4fBiAAvUsI8h1Zy66jxzgLn0AGgSbe65qM70XmffZ8O7iddchk
 oZ9w==
X-Gm-Message-State: AOAM531BBvlj2DPmXk8+Pr9jZImhERQIMpGNGVmo+wwYyki3dGdzPF7j
 P+F071RNg10ZvMMd7XObt/5UUfnrtQ7FaYhzy+8e+A==
X-Google-Smtp-Source: ABdhPJyCL1nfxZX8uruHiA3tWdgiKaudqb70qSKVJdKsGXH4fPxr3neGY82tPW/2tqrKSJshAPLxXaZK31Xfsw0ae6I=
X-Received: by 2002:a05:6512:2105:: with SMTP id
 q5mr1858743lfr.649.1622792711079; 
 Fri, 04 Jun 2021 00:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210604014055.4060521-1-keescook@chromium.org>
In-Reply-To: <20210604014055.4060521-1-keescook@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 09:44:59 +0200
Message-ID: <CACRpkdZEQ+C7tSppcJ83Go70CaBLe4XYKBqYqJfZWAYq-H2+wA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
To: Kees Cook <keescook@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 3:41 AM Kees Cook <keescook@chromium.org> wrote:

> VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> pl111 is modular. Update the Kconfig to reflect the need.
>
> Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")

Yeah that doesn't work, thanks for fixing this!

> Signed-off-by: Kees Cook <keescook@chromium.org>

> -       depends on VEXPRESS_CONFIG
> +       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on VEXPRESS_CONFIG || VEXPRESS_CONFIG=n

That's the right solution,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
