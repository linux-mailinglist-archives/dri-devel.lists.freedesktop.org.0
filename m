Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DC414FC4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 20:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7B6E02A;
	Wed, 22 Sep 2021 18:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDC46E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 18:23:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i4so15463756lfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLXLTgVBlIsYGUnptVEmh5wmzNsWwAg5srFOANEsOjk=;
 b=BACF8CJscB+sTIFEZP8umRgC50ndWOAyAGfzm8SVDb+M7yhh1iuf4PiTO9E8ga42yF
 s6UGwMPJSebCCFGL4KFJ0G+2LtXZMqdn3pvHU1ZY+udIJV3CLTpXm43byp2fSF7pFOjM
 17KgNVwZdr3cZLasbHyYPyzpqF9WlW/wi5I4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLXLTgVBlIsYGUnptVEmh5wmzNsWwAg5srFOANEsOjk=;
 b=4X5WOdxqlJNYBhQCkX7eoaCvwKpsOuLUTaM3X7Y75aa4mXd87T4q47B4yLOB76riEd
 ROMVxv9xmMnuqm1xiV4OZ/+CLl1qYnWtUvoLG7bYanHTqnWwMwl2de0YWgvxZ3Y0X9Ia
 lVmRQIPWTYA2gj46fB1qMl6LfShu677Buj2emQ4+P463wu45YplPrHgs/qvuysx9EsR4
 wQ68rtK9HCw9mHpm+SKVhsASg9TjiICLkDcxsRRpvmI7jqYWswZpp/nXZml+a6thFvSF
 8Wa1vX8iCtjHzWvw8amkQWCFomTIYD1ODAj+sqas6YjX8ffrt1hyYjaHUGnmBxNwjF7E
 Najg==
X-Gm-Message-State: AOAM530GWSoTfeAKdrQ+FNrZuHakNO5vJuenCK8tMMWBpFbUvvtSm7Co
 9mTGONuY7o2d8BWhNym+unsxq0TwoKFtyHHZSho=
X-Google-Smtp-Source: ABdhPJwUTUVjs7DeoVOh/hc+aMwauG5Gltm8GMcGAR0dbbQ1Z04aCIQwzBrJxGXSdY81e/nDLx6Llw==
X-Received: by 2002:a2e:8ec7:: with SMTP id e7mr693544ljl.486.1632335019326;
 Wed, 22 Sep 2021 11:23:39 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id s14sm329099ljh.38.2021.09.22.11.23.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:23:38 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id p29so15137741lfa.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 11:23:38 -0700 (PDT)
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr705404ljf.191.1632335018277; 
 Wed, 22 Sep 2021 11:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
 <20210920155350.h6624mt65vwg72p2@gilmour>
 <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
In-Reply-To: <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Sep 2021 11:23:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
Message-ID: <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Wed, Sep 22, 2021 at 10:02 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
>
> Attached is a complete dmesg and also the decoded trace.
> This is done on 4357f03d6611 ("Merge tag 'pm-5.15-rc2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")

drivers/gpu/drm/vc4/vc4_hdmi.c:1214 is

        tmp = (u64)(mode->clock * 1000) * n;

in vc4_hdmi_set_n_cts(), which has apparently been inlined from
vc4_hdmi_audio_prepare() in vc4_hdmi.c:1398.

So it looks like 'mode' is some offset off a NULL pointer.

Which looks not impossible:

  1207          struct drm_connector *connector = &vc4_hdmi->connector;
  1208          struct drm_crtc *crtc = connector->state->crtc;
  1209          const struct drm_display_mode *mode =
&crtc->state->adjusted_mode;

looks like crtc->state perhaps might be NULL.

Although it's entirely possible that it's 'crtc' itself that is NULL
or one of the earlier indirection accesses.

The exact line information from the debug info is very useful and
mostly correct, but at the same time should always be taken with a
small pinch of salt.

Compiler optimizations means that code gets munged and moved around,
and since this is the first access to 'mode', I would not be surprised
if some of the calculations and accesses to get 'mode' might be moved
around to it.

               Linus
