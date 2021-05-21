Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E281338D222
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 01:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117A4898BE;
	Fri, 21 May 2021 23:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7150898BE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 23:54:51 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id o8so25975024ljp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tV/CvepLnR5+D9t29ytGFL8Nj7AdpJJt34520cSY3LA=;
 b=M713uKIY66inHyiEO1T+DBuoxnFAlNemj6CtaopVQxn8BuphkSpRK9jZMLATFw/+jg
 BaGUTJrCmSP6/yWnoxXxICQnpjzBfTZSjElWrrbnEr7ReDqHqTSodw8ijwHxo8diahZg
 D1LIllew4h7IEWe2u4MX9gtgErERqcubYcinEmZ9l1pQvwYhh2uT5QrjBltHrfsPPBVD
 Aljket5JV5L+VoKae0CRUf6ysY+vPcXtoeJXXyigwFvZ1mUO2jOaUCkIlmAgcSQhRRQM
 iO7e4K7gdTKUaKUz/JhpI7oqJzQ4aGISExjH13EDf386UExM3RLWpdcV1QF0gioxwRT8
 n7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tV/CvepLnR5+D9t29ytGFL8Nj7AdpJJt34520cSY3LA=;
 b=LxPjp4UrxtYUbCGEmmsmS/RPE0A6grgV+ru8ZFYL/M/AxM/mdo20+FDAIF0Qpby/5s
 zlgiUamRAlJFtjwdAhgb4e9BVpUCg0XaES0jQD9Dlr8UL46ZEJQWMf2oorZxPaC5pdnX
 wkGpwPaEPveHbUaYKXCuzM5MPYO9aBZQ3D9ku9ACiJ52ag2arO/EWc8QcM5cH/UVPuaW
 vFeHrDmg3qNsbkVO60Kf426Aypx+NssfIhvaD1w1dqwITlkLKlv8yuC7Fhx6UyQMLTEo
 bSPlK+/R8fw+EGl4H/uSI303WIaaVoynKqMyvuudB/LFcx8R6n57IQ4zu5KicWdYT0dI
 2S5Q==
X-Gm-Message-State: AOAM531T1iH8O6xH/0iDKqniOuPphLtobgBMGBGtKbk0EEnDa5mtOQl7
 polvZBaLJDzkAzRuyWc9o3fw84e+hsiGVLHI7UpN+w==
X-Google-Smtp-Source: ABdhPJzJ0T69H5XFqUQwsNg04Epi6XpxdeY+ogh1rdWQ9QB++gsjxv/67mcs+CsBli1tiQ6/dSKRkAWMwWN6iLTO8Y0=
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr6305514ljm.467.1621641290037; 
 Fri, 21 May 2021 16:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210519203547.837237-1-clabbe@baylibre.com>
In-Reply-To: <20210519203547.837237-1-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 01:54:38 +0200
Message-ID: <CACRpkdb3TratOcZbi4Y7t_0i0fZ84Ek8vgT5xXxObUuZRYvrCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: convert faraday,tve200
To: Corentin Labbe <clabbe@baylibre.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 10:35 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> Converts display/faraday,tve200.txt to yaml.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Patch applied to the DRM misc tree.

Yours,
Linus Walleij
