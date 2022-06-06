Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492353E513
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861610EBAB;
	Mon,  6 Jun 2022 14:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFFE10EB9E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:30:50 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id h23so18243195ejj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9gSJdumX788ea5ymBPhF6Qx4oKS3kXqxz2HGbJIL4Q=;
 b=NDhxYiHFP2DQ/Hg/9TucNlDLLMsU/ntXpeN0g2X8O+A2BUihfdLVBLLH7RWDprBeHQ
 YwaJrLW49qHLVTYYoKNvynnJ3jb79kiSyxeSMy2uxFQjXwG+gVg48vktfIa85w7hKfQ1
 g4jx4e8LsxUAl7JSRLIBkVIW6BW0V9jVja/Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9gSJdumX788ea5ymBPhF6Qx4oKS3kXqxz2HGbJIL4Q=;
 b=TqhwRfedrXT374sinuZaZg9qfK/ladsfE7gDjFJMjLjmGfQQ2n4qqbfu1rA0Hk236M
 BVTrANHytfG3YSjhqIWZCoXDk03RMkp9FClMw4IGt5o71jsWMLSfvS7HzFy2QlBNZZor
 fah78kqFv5xPkextqMy6DDordAgTCmjWmPIZqzwb7lCLQw9we93m90yBGvQBRI8cVaBW
 aMn1GKUHxYzBNqSAYazma2pfLVBjyFZVxi3FKRZK0ZQAsqfcXeSNzeE/4elcAlUcD6m0
 YHGRGOUA9aETCBQqsFQ/df6yAYeDNW9zTeY1Kac/BsyP61KrDRJrld0l3LYPIwL2/dlY
 tYfw==
X-Gm-Message-State: AOAM532vqLZ6pki7NXn78xJHGeIRc2aqRb/qCNpodLSZiIdKDdMfWmT6
 s9Ex4hXsucJE6DtyL0ttXGqVsHC9S4XKeKSCQX0=
X-Google-Smtp-Source: ABdhPJytv8cGqC2CftTMVHcHzFpoLLS3sKsndhg36c25nqdu5D2LMqs6n7zq6PSBPNhh0K7AH1VJqg==
X-Received: by 2002:a17:907:608b:b0:711:623e:b344 with SMTP id
 ht11-20020a170907608b00b00711623eb344mr9386216ejc.230.1654525848284; 
 Mon, 06 Jun 2022 07:30:48 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 ly2-20020a170906af4200b006feec47dae9sm6362522ejb.157.2022.06.06.07.30.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:30:47 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id o10so19079124edi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:30:47 -0700 (PDT)
X-Received: by 2002:a05:6000:1685:b0:218:45f0:5be6 with SMTP id
 y5-20020a056000168500b0021845f05be6mr2533347wrd.301.1654525406801; Mon, 06
 Jun 2022 07:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-8-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-8-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:23:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7EiaYgzr57geyeqEafLJ67G2PJa8ejZwgWNV+icD0RQ@mail.gmail.com>
Message-ID: <CAD=FV=V7EiaYgzr57geyeqEafLJ67G2PJa8ejZwgWNV+icD0RQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] drm/panel: elida-kd35t133: Implement
 .get_orientation callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
