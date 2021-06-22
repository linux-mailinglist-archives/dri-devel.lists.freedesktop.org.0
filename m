Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8D3B0CF5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 20:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAEC89C80;
	Tue, 22 Jun 2021 18:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C488189BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 18:33:27 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id q190so39386859qkd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pumBvi+qi7d1sRM6cwo7R1W/BHxp1boGJK8L9dh8S7I=;
 b=Gnb/8JfrLJ+yvZfpmSoMuJKpnj9MskU5T49YYM3w8+ZW9IypPBpCVKfYBZ02l5sZS0
 52RS8k1paGyZM5BA6bltHp9N0Sq2IWSZwbT/ojCUlljFvnkTkQmcIHt74VxA+KVyV8lY
 wiVJcA1DfdRMryKyocv7WRfaVD9tANv1RWGyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pumBvi+qi7d1sRM6cwo7R1W/BHxp1boGJK8L9dh8S7I=;
 b=AW3j1dvmT8G4jTc5weciKPwHEcUclNk/suY4IkJwQxwrC+0WOp6nGYcm3ijKL9fpXo
 c3d1lgSyhW32FooAvhX4y7K40d0Z35BoCzTDdGUMrpk1KAAfHhqOuTyJmHfuGnwSapEu
 5YEK9VglDNvQVSa9BerW1yAnnyEZY2azHSEwNXZn99sp7kbU8pwDrvI8+s1+moHtLKrX
 3kXn8f4opKzQxpd8hntBbaJZc3F6n/vuhOgl1dVBwbqHVoT8CDVaK6OwNTNEpsRan+mp
 QXB7Z75UouA00bLPxiQflyyOQi9nQXRUSfge8xpSgzVRQ1lNVlKgjFxdJfWeFKkhH6Xs
 TylA==
X-Gm-Message-State: AOAM533nRBdjSoDNhYsCqEZbFXPNgbXReu92T08KWdntUVb5vJdmApoK
 8UCe6jCnYOtcbRiFCTtBUFuD82DFMeFUXQ==
X-Google-Smtp-Source: ABdhPJx+go5Cb5GOw5Itfxel/FHwSJq+XOhC2UYVPzynLxy0JGMWO51PDQVtv7x28B3T41t0azCn9A==
X-Received: by 2002:a37:8b81:: with SMTP id n123mr3654326qkd.340.1624386806685; 
 Tue, 22 Jun 2021 11:33:26 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172])
 by smtp.gmail.com with ESMTPSA id n64sm9957155qkd.79.2021.06.22.11.33.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 11:33:25 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id o6so6697534qkh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:33:25 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr6520278ybp.476.1624386805037; 
 Tue, 22 Jun 2021 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-2-git-send-email-rajeevny@codeaurora.org>
 <20210620093141.GA703072@ravnborg.org>
 <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
 <20210621183828.GA918146@ravnborg.org>
In-Reply-To: <20210621183828.GA918146@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jun 2021 11:33:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
Message-ID: <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
Subject: Re: [v7 1/5] drm/panel: add basic DP AUX backlight support
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 21, 2021 at 11:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > > I cannot see why you need the extra check on ->enabled?
> > > Would it be sufficient to check backlight_is_blank() only?
> >
> > This extra check on bl->enabled flag is added to avoid enabling/disabling
> > backlight again if it is already enabled/disabled.
> > Using this flag way can know the transition between backlight blank and
> > un-blank, and decide when to enable/disable the backlight.
>
> My point is that this should really not be needed, as it would cover up
> for some other bug whaere we try to do something twice that is not
> needed. But I am less certain here so if you think it is needed, keep
> it as is.

I haven't tested this myself, but I believe that it is needed. I don't
think the backlight update_status() function is like an enable/disable
function. I believe it can be called more than one time even while the
backlight is disabled. For instance, you can see that
backlight_update_status() just blindly calls through to update the
status. That function can be called for a number of reasons. Perhaps
Rajeev can put some printouts to confirm but I think that if the
backlight is "blanked" for whatever reason and you write to sysfs and
change the backlight level you'll still get called again even though
the backlight is still "disabled".

-Doug
