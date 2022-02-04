Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBB4AA012
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2610EADC;
	Fri,  4 Feb 2022 19:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9D810EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 19:30:09 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s16so5798320pgs.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 11:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjz/d2uJSRskReEmVHKPPM9K20Vc4OsAmYuunLLpKFw=;
 b=nIRVyrBynAGmaqmots0Mq+aw1Avy4WkS6UPdfbbOrVc45NFzxxpY/9TWPB4t7o3pYY
 dll6b2poAli+XYy5rUVa4dTB5exq3qBNqKTnhC2Bf32hal1L/hovklTGk/YrufUtDo51
 h9TZPM1W6daiJ+dfC5cQOYRynQ4ltQhCmKqSYLep5Sn+r9USG6T/DhnBECkzhHDNWZJ+
 yf5FCQVjjG/R9Vvb2BLYD16zichIYpEBf8TeUT0x2XS/GhWXXsp5I2HZnx9lXleRP/yR
 mNgQa51908kvsqdlyNjPL5oHTXcNfsqJwyzQgtJf9/m4HKZtYG989mDnz6mclz4su77/
 2aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjz/d2uJSRskReEmVHKPPM9K20Vc4OsAmYuunLLpKFw=;
 b=DtzRSPwa92w2QVZx9bLfjJmpU3zWzfgS6eR5m9MlaAwlkyCVoiK+GO0onaX27oJDhL
 hbF7K/5IlfaaI05gCO37jRQdy/tdyZJMz5VOm6VsbXMhFqCu7grd38xYYRImB604A2vN
 RQfdM/u9wIY0aFtropVAyGWS/ngQbh/sY6VSNd8DN0WR8x0PZdzNwBspNwwuyEUKvpp2
 DgV73VuDzNao/vkmO5Rb2fMDEhz4i7agLamj1Scsy+TwcZX0bghtm2IOdHkc5lL/uY7T
 LdUzvHhAsEKTSzJC1XqDyBBeNvhZlSvQ5tN7k51l5lKYco5xm6S+zzpQO4wY+KiJmVYM
 Wp3A==
X-Gm-Message-State: AOAM530DaJY2aUg3reOGu+3+wHVXqbpsz1oGeiPNY6NppoJwZaZ20b0o
 Pznmt62CFHlfqJ08xJqLf/Fihr73+ezlieQhgZHMwN+Xm1k=
X-Google-Smtp-Source: ABdhPJwl/Ikwm+SRw8mO/XCAwWW+cI6ZLc926D0tRc+KyiKrxJHhusUtS8WUK1022mB/ftpk6q2o5I90X1d7yB8ZhvM=
X-Received: by 2002:a63:fc0b:: with SMTP id j11mr442424pgi.146.1644003008833; 
 Fri, 04 Feb 2022 11:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20220202150201.290c7d3d@canb.auug.org.au>
 <20220202150320.3e9bdd62@canb.auug.org.au>
 <f50d5044-7192-bdb3-7ca9-7217ed311787@redhat.com>
In-Reply-To: <f50d5044-7192-bdb3-7ca9-7217ed311787@redhat.com>
From: Rajat Jain <rajatja@google.com>
Date: Fri, 4 Feb 2022 11:29:32 -0800
Message-ID: <CACK8Z6EKsFwJcpmqFoVOkQYqLMK37Qz3FYkf+-EhP4AFiscbeA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 2, 2022 at 12:38 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/2/22 05:03, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Wed, 2 Feb 2022 15:02:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> After merging the drm tree, today's linux-next build (htmldocs) produced
> >> this warning:
> >>
> >> drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'
> >
> > Actually:
> >
> > drivers/gpu/drm/drm_privacy_screen.c:392: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'
>
> Thank you for reporting this, I will prepare a patch fixing this.

Thank you so much Hans!

Best Regards,

Rajat

>
> Regards,
>
> Hans
>
