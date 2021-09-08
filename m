Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364B40406F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 23:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAE66E2F2;
	Wed,  8 Sep 2021 21:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D3E6E2F2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 21:11:03 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id x5so3810861ill.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zj8C2mmfJJ638Qd3bWay3eU4cSnuwWClo1NJvPy09M=;
 b=f+YQT8Zhcy0WJVMXuqJy2SGXi599VEQcwuateIHU89hho6VH88YCmFtNPQL7F+BwZy
 EbGX1Hd6esS8YLn7GMl5tjV7129L2lj3bnXT5O1GQCN4kS6ooyEADilIHmtURZTu9IJ5
 h8DVzEDyJOpMpGR1KNeUuiee1NF/E/avz1xtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zj8C2mmfJJ638Qd3bWay3eU4cSnuwWClo1NJvPy09M=;
 b=ZRWAKmhJjXVefVI/r7l5ZNrdqqafc1ycgLp3U2cteiBct6FI/idWAgigLR0nNEyylT
 zgmZc3DikyqU+hiUDM15z7vI5wrvQ+J9XevpXt/5gxfyKB28DwQuwpD5fmHllOljvhmZ
 Mobe1r+ULQTIxYK9bFFaCselFURAESI+T3jdSUHCWj5RadpeOPYiHqInTva67dnhWUXz
 Vfe//m2HkUKXcpE4WUNn8af14A+DI0Iam3HfgO0UEh+3rc76n1vFwhcUajtV0sddXSF/
 yx2CeIxEJWt1PFe9EXrtQYuDLq90vf7OyQN0jIGHt85WNJmS2Q9py9bFm/AOM40lhTF0
 jSWQ==
X-Gm-Message-State: AOAM531DiwxSXjWhPZChplhgI5eNhf/71uziFS/9J470U4mIkwk0emfr
 so5oQe+/1KCDElb5Ijib8c7eMkM3xDQK/Q==
X-Google-Smtp-Source: ABdhPJyLr1z4IWVGXdXXH8wEyv1TRCCg6XQSH4NEqbU6dKqOOd5bt7XRwwbE5H1AwcUOT4bzKaa8EQ==
X-Received: by 2002:a05:6e02:1b05:: with SMTP id i5mr200275ilv.5.1631135462028; 
 Wed, 08 Sep 2021 14:11:02 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id z7sm132452ilz.25.2021.09.08.14.11.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 14:11:00 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id x5so3810772ill.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 14:11:00 -0700 (PDT)
X-Received: by 2002:a92:c8c3:: with SMTP id c3mr171707ilq.165.1631135460113;
 Wed, 08 Sep 2021 14:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.10.I77d7a48df0a6585ef2cc2ff140fbe8f236a9a9f7@changeid>
 <YTUQhnt0GxYxqg/i@ravnborg.org>
In-Reply-To: <YTUQhnt0GxYxqg/i@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Sep 2021 14:10:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-bxUOyLpe+iM_6HNNyoxi6skzWK417_VE9qGy_oSWwQ@mail.gmail.com>
Message-ID: <CAD=FV=U-bxUOyLpe+iM_6HNNyoxi6skzWK417_VE9qGy_oSWwQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/16] drm/panel-simple: Non-eDP panels don't need
 "HPD" handling
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Sun, Sep 5, 2021 at 11:46 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Sep 01, 2021 at 01:19:28PM -0700, Douglas Anderson wrote:
> > All of the "HPD" handling added to panel-simple recently was for eDP
> > panels. Remove it from panel-simple now that panel-simple-edp handles
> > eDP panels. The "prepare_to_enable" delay only makes sense in the
> > context of HPD, so remove it too. No non-eDP panels used it anyway.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Maybe merge this with the patch that moved all the functionality
> from panel-simple to panel-edp?

Unless you feel strongly about it, I'm going to keep it separate still
in the next version. To try to make diffing easier, I tried hard to
make the minimal changes in the "split the driver in two" patch.

-Doug
