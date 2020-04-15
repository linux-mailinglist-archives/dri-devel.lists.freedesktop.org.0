Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD01A9F9A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BE76E9C8;
	Wed, 15 Apr 2020 12:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAF26E9CA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:21:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q22so3467724ljg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gf4JKz8G7G+RjuxPUQbROZcRoIiDOaO3pVHjI8FiM28=;
 b=hdLQvp4xXexsPNf8SvM98AkXj+2vHccxZyduR99WtsZamr+si18rNTK/Lf08fP+RL4
 y7QmlU3K400hh/QpZ6fVLZbWDMkdSx7XcSfG5bdLfscCO7BsIzBujwkpSQqNRozf6h4e
 QOPGCqfoQ+8+Mm/FC1NhDlcuC7anHuEpSq11X0AqZuHZfpLp+cg24+Tkse4WBQTHK11p
 x/LHmWpflAe/ifl9zN0scbTsOp8ZFKitcUiYS7my9wvG1Wjg37nGSIQPSPZbNLIr2HxI
 AjleSi+HdwisiD7zmDqT3w9d06fcaxLffhiPdm/ZNKx/KvFneH8MCyP5EbLj5GpKYqmR
 HuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gf4JKz8G7G+RjuxPUQbROZcRoIiDOaO3pVHjI8FiM28=;
 b=EPbOKDwyI7w502cKYg8a1e0EBu/JpR/22KGRiq4bkX2xWL6BW5Md9J/xX+TlF68dUg
 T6naZERjWy+ag41fuHbAm/jIPm84rMq/gkZAHnIUH9aFR4HSQPai6qMh0DfqZ7fyeIJx
 TL0COWQyNLLyjiG5Xqcpm1r93MvQer3bYWYxAfAevq3g0fOSz1JibPvw0egJLRWPtvU6
 IqR5wo03QkFNOkchvdTblDlkLnJxGOxOsvtL+OB+jP+g0QsT08jswxXzj59gDqTTbGLZ
 v1RwewPrCD+K1EMAmUZQUeZ2YoA9LZpx7l08b3TNpBQxmIu1mdwGTfARv6MSKsQeAIbS
 JAQQ==
X-Gm-Message-State: AGi0PuYWldf5AbrJMJ1lu1M0XyfoIjyDLRtpbc6XWOOuAVIoAAFZ68PT
 5Ts5p8My04R/PcL6R+e3pis6BLFI0Fusix2etp8CsXGY
X-Google-Smtp-Source: APiQypJeRj5KclZmKitqCFQrAgzzgpXQhsRU3AvPywLr8Cq6njjwRUuW8ZRT4PD5wXqIbWQ4Ow664bYE/dk3AZnH2y8=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr3018795ljh.258.1586953260384; 
 Wed, 15 Apr 2020 05:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-29-daniel.vetter@ffwll.ch>
In-Reply-To: <20200415074034.175360-29-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Apr 2020 14:20:49 +0200
Message-ID: <CACRpkdb8gWz_R=5Ca0tLMVWr+Xrvi_eOsMgb9rkWnPshhMeZwg@mail.gmail.com>
Subject: Re: [PATCH 28/59] drm/mcde: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 9:41 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Already using devm_drm_dev_init, so very simple replacment.
>
> v2: Move misplaced double-assignement to next patch (Sam)
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
