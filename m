Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EA39C3D1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 01:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979DF6F59F;
	Fri,  4 Jun 2021 23:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21376F59F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 23:19:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a2so16391483lfc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOhQyU7zGziShp3NbADCB7cFUwMTl2wSKNvhDlD5IRs=;
 b=N1YXPbjsSml+e7RYPDpm05eswG5mLHLOfIJg4btWkRGfg6ucoNdUpmlMe4YjbQyW8d
 gP6wtg65wOEIVbomYH1bqgtic+hGt3E7X3CIQijUo7IniIzShrQBz2oNySTXgIPYdFu2
 YXiNUbMvl9qhYEWLoQhTsMrDN42Z1m4E4SWLD7CHHLsNFKiihmTmgykYZnpDP/BfzV6n
 fr+VT2TiUYDVMz/lRNlnLjgNvC6FfKYY8wLp7CECSBXVukcwhJGJct9JgHNbyoz5RRU4
 /9zqMQdn+0iLKS3lyIo68K9FXquPtPtecwWrgKguWNtK1LgIi0jUgreBmJUvXL4c35Hq
 yDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOhQyU7zGziShp3NbADCB7cFUwMTl2wSKNvhDlD5IRs=;
 b=pwyKODA84T5TNsWFgS9QrWLt9pzkmPGVATJWjsyg8/Ww1q+wHUKm1qD6bxkpCL6X8P
 fwT8Eb+4jUz/u99P6ly/4VZzBdgHg/rjrda7VpZqhaOua2LYURGsEMKRgsmzeZKfVNQk
 G4y4/uiYj9CdfgDnyXsrOvkL82TDvIeF3LWsfVBNw+uJyJrFqdM2U9+Xe32/0ZUSiwhL
 R+F+DSctd5ejboJCJIIsK92bXZS7e/HyR3qHYy0syxzFxKxFNnMkQewxqL08Jnz94KGA
 3AAmYVzTB4dSUIjSHTru1yKl7MSgXpdNKanfhJ2Dw5ebCIq8rBxOjJenq4Cxnbw0QDsv
 L9+g==
X-Gm-Message-State: AOAM5337Dr1yQw1exoKkUaLgvX+KD8BPICXWBmhBS8lvkKMeLZALksHA
 7LCMbY/x8hBQIGf4hMNflMVoCwPpM0JrBezLc6JA0g==
X-Google-Smtp-Source: ABdhPJxN/ChFWzxD8UT43gX3J+QI6N6IH8Jko8/jscLq8VJGDr8PRWjw74HWQbjs0Src+hv/Xbuy5foc/7NYH/Aa4Jg=
X-Received: by 2002:a05:6512:3241:: with SMTP id
 c1mr4393879lfr.29.1622848783804; 
 Fri, 04 Jun 2021 16:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210531102838.2423918-1-linus.walleij@linaro.org>
 <CAD=FV=XHzqi67_bf0EUCF=cgzGt-uX=+-ehkOfjm32Wg8YBt5Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XHzqi67_bf0EUCF=cgzGt-uX=+-ehkOfjm32Wg8YBt5Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Jun 2021 01:19:32 +0200
Message-ID: <CACRpkdYvdPBWm8zc5EB9iEXoCXFv=0VwPXvLTxNXAoV3RbsYZw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: db7430: Add driver for Samsung DB7430
To: Doug Anderson <dianders@chromium.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 11:31 PM Doug Anderson <dianders@chromium.org> wrote:

> Still hoping that this can work atop DBI so we can avoid the raw SPI
> writes. You said you're trying for it for v3 so I'm looking forward to
> checking it out there.

Struggling with this. The DBI bus is only used by tiny DRM
for the panel drivers that are jitted with that display controller
ATM. No normal panel driver is using it.

> panel-simple also sets the bpc in the "display_info". Do you need to?
>
> I didn't see a reply, so I'm still curious about the answer.

I think it depends on whether the display controller/bridge actually
make use of this or not. It is implied from the MEDIA_BUS_FMT*
in practice and this controller (MCDE) only had settings for
BPP, no fine grained bits to fiddle for BPC.

But I added it for completeness, why not! Who knows who else
will come along. I think I should patch a few other drivers with
this as well.

Yours,
Linus Walleij
