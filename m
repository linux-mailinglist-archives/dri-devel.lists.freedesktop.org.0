Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139164D9010
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A04810E1CC;
	Mon, 14 Mar 2022 23:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B4910E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 23:09:36 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e5757b57caso26892557b3.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 16:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uaHzF6TrXW0NSJUFo3An1+l7RvH4BTdcE0aQaUC5jBU=;
 b=Ief16RMQA8dLPsthfj9e8Vk5VYApCRJCiF36Y2gNh8S3B1HsFRZ0KpWRHAFABdWOt0
 qAhyAYMYD/TmH149CcU3DhJWm4jRCSkKHq7hfS5vAbYtwyl3gP1PgduKeYFPP2p6jkpd
 uxSDVV49cYqH7T5WeQrcYJZcIKUCYeWeXTJ3r5CHS20Ex3mIFfAaXdOYkDnnVVcF3Clg
 VxvlPPSugzUnZxCMA+4QnZp3AirWeHjY3Wy5ZNIANnrXtBlmNHdxdtZF7Re/GXmPNdA8
 M1wrY2KTa0aEsNQ5opGoZDGdCAn3dhckUiz5ROkl4qVyXXrfIyP4mBufb75E090H9tbp
 51mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uaHzF6TrXW0NSJUFo3An1+l7RvH4BTdcE0aQaUC5jBU=;
 b=jQT+BUSIgnMB9XHTwIgpX3nMD4zdJ2ZojrccoH3gktt/pCeg3M7G1VLmGrStpynzdt
 vX9mKd6UgrXhw1FtGPpDB4sOSp+rllf95NU89h+yYE6Gp7qKrabmW41/TSquXoXWI1YF
 8/aR+Zkb/lT/turlnPXl6jQb1tHsjzFYPDGQr96j7NsECXXAOQOAYiSUpA9jRlLphF6C
 LgrkRIR94wPl8ODrS1oSOGOOsBp3XBSAazeX8qgPJXmdEzlGQ5Wj7cmIGEOPJNcMBpvF
 28jUXvPrq3vpoFyYTbtU/Fd2Nv0dAU6ey0clcaGILUeJwJeooHepcuNfH/1kRhwnf6b4
 iL3A==
X-Gm-Message-State: AOAM532F33dSxXdZFssJ2TZEd7XwhF16OvTpqeMg7JTwAt4Jg68S33bP
 0c15d7X97S3pkg28PyIeliCUPT4L7VPKHpuNepntdg==
X-Google-Smtp-Source: ABdhPJzTjNf8VjU+5wNWfzGBH2Ab09TB8RGaSPyIanjMtlcet+02i2JqrrXAHCdJu74ae9TOGkAK7gM6LCv9lk2fO+U=
X-Received: by 2002:a81:1182:0:b0:2dc:4e58:da41 with SMTP id
 124-20020a811182000000b002dc4e58da41mr21584965ywr.268.1647299375492; Mon, 14
 Mar 2022 16:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
 <20220308082726.77482-8-jagan@amarulasolutions.com>
In-Reply-To: <20220308082726.77482-8-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 00:09:24 +0100
Message-ID: <CACRpkdZZL_V8qucyxfSxhb=CZ45dNsYFHBGZYPJMSR3yEB_p-A@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 9:27 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>
> Replace explicit finding calls with devm_drm_of_get_bridge.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:

Allright v3 looks like it can work :)

No time to test it on hardware right now, but:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
