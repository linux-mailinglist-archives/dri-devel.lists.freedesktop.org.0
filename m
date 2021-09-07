Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8F402FEF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 22:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7596E0D5;
	Tue,  7 Sep 2021 20:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67A6E0D5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 20:51:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id s10so474853lfr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H83XDR5yiRIxqWB2WwqMMGV8X/KgdmEIglGXxV2ZmFY=;
 b=p8Dbjz23mSMtmoOdbzIR0EkM9FxkbpZoZ2ZpdgEbJHI4FOCp5puD/bRxkTMNLE25RS
 2pYXTNF2fEPgCAAN1ubLAQm6dEr2kyOFJy2E1M9oFTtTcTYTFHJrcWlqplkp92v1a8oE
 iurursMWyumOUOhFyt3xq0VvDbcNuPk2cztErfcMyvBGDiT32liXMG8zRnVeyNKsNg5d
 Gg1T+ucA2si9m1o6kXy/ogho1EaEMx08zlHg4mj9MoNopolZIYDzhZpzU8GRy04ctnoB
 V9OlLvk5b7cve2x1/wq1EADxtBvOZcmiPm0F0uBlmPu3cc9syTwSptTpTPXdgdXQLzfq
 yF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H83XDR5yiRIxqWB2WwqMMGV8X/KgdmEIglGXxV2ZmFY=;
 b=hP++xWBVtXXCzlNxhvj5oyDp4ettrM5+5zjt6QfVsuh8ukRjprmIfsEMLgQnJwo6io
 kCwnqafnSdLcJ3QYrjAyJb0XHUUg+QmOke2cOsX9thw5S3GgK7BkxVX8+pUbQCDyMu2G
 1VfwQP9+x1jPT9GIhXaPouMfYAPhj7jHUnqvtpyAUMYnrAu8vjypEJM5uMtL8uX9gAnL
 wubhGW5uS+xbXr9WGL/prUWzRw89zZw67sToPNVmm8VAbJHJb5nVkj1rE7JZWgVNmV9S
 nSTFKpW5Yq5WjBCVgSGmHMcpKXjX+b9BtCIy4J5HsR2SOd2leBuWF4ySRrWqKxFKYON3
 V90w==
X-Gm-Message-State: AOAM533EwkNt1gzF+dGSvXM4Tx1fSqX2v1H4kATogrimRRw17PA/ZeRC
 cbrblvT+3RqU+1/vdBKad63VF+v7Hvp1Kkjut4T6wX0Xis4=
X-Google-Smtp-Source: ABdhPJw/s2+umwvpUOEOyJq1xy8mOoWzaPMLcDKqHBpM+YPMAybQZDnb5U3DtHu/hDulb5NifytPNCEeGeKn9d7R+7s=
X-Received: by 2002:a05:6512:12c4:: with SMTP id
 p4mr246495lfg.72.1631047865550; 
 Tue, 07 Sep 2021 13:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210831135602.4476-1-caihuoqing@baidu.com>
In-Reply-To: <20210831135602.4476-1-caihuoqing@baidu.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Sep 2021 22:50:54 +0200
Message-ID: <CACRpkdY7nz0RC9qmJ69+CQZ6rLQ4pLtdSEgfDgHVTS63Z=4imA@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 3:56 PM Cai Huoqing <caihuoqing@baidu.com> wrote:

> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Patch applied!

Yours,
Linus Walleij
