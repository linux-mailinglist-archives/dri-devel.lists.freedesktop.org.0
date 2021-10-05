Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADBE421B41
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 02:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DFF6E2B6;
	Tue,  5 Oct 2021 00:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF316E2B6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 00:41:04 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y197so22375245iof.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 17:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8/bkKiby+7EkwB2wz+nIC2A5KBIG95pAQLX24jqAYI=;
 b=M4ztBx95ziwV0D+GbQdUtLp28pZJUKwn8h37ftcAcvY9Q+EomhOOR8ELG6jdaRGj3a
 QVUY+CqmNTnFHSoiLipf+EsQQkWXzpd3KFueYcdENLdMuAKkkHMaY/0f7xI77fy+JeFB
 EaXeVy1tYdpZoF8k/8oUKSLYtCLcaRmwShGnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8/bkKiby+7EkwB2wz+nIC2A5KBIG95pAQLX24jqAYI=;
 b=Uf88N+s5hGa5hx4ElPOlMcAokqotC3p8X6GVYE7ExKiFTnr5pf4mqS9OiYoE9XWQvE
 CMhKhryGTQNd/iouoqK+xb0q9ogudVgLUuHYUNiQ9U+URJc48oVqCAA12hkkYK6ZHfGK
 gUcIZ1s2xIpjJV1f3NMXm7Xrshbo/t9FDmBo8bQfCZxL8xAYUNqxUrtxzsyzmW606q1H
 yqXEgHZnEJLdC2LoIDe/jg7gHHAMSIIiyhK/maux5uuwJlGertML+TauOlMdi5+9WjHp
 oG+ehNXrdjvtf+IruOf0KKrd9IyEM3JkDvPnHRPooyYeGiPC7aKrESgVk1noXs2lM5T+
 zZNg==
X-Gm-Message-State: AOAM531naF0Sjvu8MSnudR755TlZFmA5K3mC9wuukYLTVznUwq1qNjRk
 BrC5Ot0ZPQkJDg4yKiCOCd65HdpGAsXzLw==
X-Google-Smtp-Source: ABdhPJymZCUwazgKn9h4CFtZGYSe2TWq9TeQkR0ol/q2afj9kdb1yZEH1Jt1USvISsaMlUe8zMQcsA==
X-Received: by 2002:a5d:9493:: with SMTP id v19mr164127ioj.34.1633394464071;
 Mon, 04 Oct 2021 17:41:04 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id x13sm10925454ilu.86.2021.10.04.17.41.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 17:41:03 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id e144so22398737iof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 17:41:02 -0700 (PDT)
X-Received: by 2002:a6b:2ccb:: with SMTP id s194mr153772ios.128.1633394462524; 
 Mon, 04 Oct 2021 17:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Oct 2021 17:40:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
Message-ID: <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 kernel test robot <oliver.sang@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jani Nikula <jani.nikula@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi,

On Mon, Oct 4, 2021 at 10:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Douglas,
>
> On Mon, Oct 4, 2021 at 6:22 PM Douglas Anderson <dianders@chromium.org> wrote:
> > In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> > the EDID") I broke out reading the base block of the EDID to its own
> > function. Unfortunately, when I did that I messed up the handling when
> > drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> > when we went through 4 loops and didn't get a valid EDID. Specifically
> > I needed to pass the broken EDID to connector_bad_edid() but now I was
> > passing an error-pointer.
> >
> > Let's re-jigger things so we can pass the bad EDID in properly.
> >
> > Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> The crash is was seeing is gone, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for testing! I'll plan to apply tomorrow morning (California
time) to balance between giving folks a chance to yell at me for my
patch and the urgency of fixing the breakage.

-Doug
