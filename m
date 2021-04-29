Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBE36EC78
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6846EEA7;
	Thu, 29 Apr 2021 14:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D936EEA7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:34:55 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d12so460037lji.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JY1YQAciLBg2SXCK38LTLT1Il7RxDxbwi4rPhLOMIU=;
 b=vGokkhrLWkftxs9CXzLZUdzyBzjMN+7lJmlAV3A0Q9Qr0f45z49OjbjQPSPDvVGnH9
 lUhmmV8MFmqaeVRkZAxUdysNw0UpFBTkC4DLJgKZviIwIVJiblLonYnrSb3kadnZaLge
 71+9E0bfNRr2wnfF0t1E8JaBIQkGrF8GikHiXrUAitTZ+0uCtZvLo+/0SiNjOGI2hymg
 8bxyGnRt68l0LfOFwrRkNBH+cX5cPrFtP+8DCgLL/XtdrPuIzfvjV3fit9EBVNS13xFE
 NjxodrUoQgQi5SiEGqou85DyDQIo4nCKsaF/c933fj0+C7RjAxj+VX94ut/kLWff+SAN
 b16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JY1YQAciLBg2SXCK38LTLT1Il7RxDxbwi4rPhLOMIU=;
 b=LDN19lcIUuWlP0iyXwoybPGjzak5aBRkentybqP3x+6gccKaHK2+CxVfuO73bSdjqX
 ErDdzOGg1TeF3P7uHYFT9O15vg8uJxmVnjvD1IFiT79j/LLtWybihgtuq50i5dFfn096
 FEYpiD6D/qeHQXpRA0bbWJeLcq8rD7Th/IAHa8k27TF92TIMQjZD0WoeoAf1ChsMOUcA
 MWBqGXIHkpt62z3MgYQTqQjoGPSl95W2T7w7fglbSJxJAKur12mFcusPZxRRgr2JjmHF
 s2nKnUEc7GEJ70rXcVy8Ek7Nt8/KU1enI7eqopJWvcFm+g8DMc3gYxHO3FZxR2gXZ6ke
 AX/A==
X-Gm-Message-State: AOAM531twus9CY39ta/UZ6QqqLlCOiDXnigEmSapjzqThaFfC8gkAppH
 pPnCHTaAwnloYKAkarx29myU7Kc+zss7V+PjWLnZAw==
X-Google-Smtp-Source: ABdhPJzpAtvS8SvpH5ijGaUyYzuFfu/GqADQI5kuGerH21whrN7qZWKTmJRI1VlfQqqj4SZDgZJ68ZS5/4yUqL/zZjg=
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr24655828ljp.368.1619706893639; 
 Thu, 29 Apr 2021 07:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210405234713.3190693-1-linus.walleij@linaro.org>
In-Reply-To: <20210405234713.3190693-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Apr 2021 16:34:42 +0200
Message-ID: <CACRpkdZVDN2tGLiVT2sZKAT7PKYi-Opk2Gzop3DAj5Lm0OVdzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Samsung LMS397KF04
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 6, 2021 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds device tree bindings for the Samsung LMS397KF04
> RGB DPI display panel.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Someone on DRM misc up to review and/or apply these two
patches?

Doug? I bet you have some patch(es) you can toss back at me to
review in return.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
