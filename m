Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FCE2C11E2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 18:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFE46E054;
	Mon, 23 Nov 2020 17:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258986E054
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 17:25:06 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id y73so9540348vsc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 09:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YSNrpJ4OndNC4w4ulPWCJT3NfGZKd/DmZdSIZa2BOxk=;
 b=nJp+E2XRY1AUEhkNEZ0HQHS0mF2b3UiEjmB0eFubyH+jomZHsIxS/S+CRJNMqXa1VJ
 5n94PenFnPDOTRSaNBhD1MUdycYZCzk31+4LRFmjGOBHqYTvqIs2NAX9q1aY3ueWjQ57
 qRBCLSSlShNkU0MAOjUEX+nlzwIIqXAL/+ZpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSNrpJ4OndNC4w4ulPWCJT3NfGZKd/DmZdSIZa2BOxk=;
 b=ceEJ6PH5hOvdLKcp71T/Ke2klPlXEiuw1n4y+c5j+6Q/GYtq9F9szS4PWyGejis8eE
 cuX+Cho5Kaa7UiW0aU0IrjfrNuiS4dXD2Ck0tFV/miHh0XP52fm/AHbcPgapJCixoeA9
 ebSKbtsFGGglcqQo+66XPCBHmQq3F8+88/8QhxUvovBud18IPSQFxQ8rn6dLLyAyd17a
 sW2pbs3IuqkCvDzYZozpStiS+CzzHqtOjAlYujfUQM4MlRlkS1lemEFg28mHlVOrZTC9
 Fc/8/4beJui9XWYgbgw6eOjZJE3iEtEhddvD1MJVNH5KEeE5nqYBynVHDjm8ouSw+gQI
 WrOA==
X-Gm-Message-State: AOAM532Ffp0EAt8GA+qr2CamwutGrO/aq+g8OblSOu59QM+jqN/2RU7f
 LziyKCPFmhE0d5Bh/pPos9H5QoBM13Aoyw==
X-Google-Smtp-Source: ABdhPJw2XM8h4Cv2nBv9WOdBIg+xsl6MnrFiHiQraWt7Roac1DdAZrKHe8TffaqrGOZoN70e+9QOHA==
X-Received: by 2002:a67:ce8e:: with SMTP id c14mr846990vse.42.1606152304759;
 Mon, 23 Nov 2020 09:25:04 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id o193sm1573693vkd.27.2020.11.23.09.25.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 09:25:03 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id g3so5891396uae.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 09:25:03 -0800 (PST)
X-Received: by 2002:a9f:24eb:: with SMTP id 98mr611949uar.90.1606152302603;
 Mon, 23 Nov 2020 09:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
In-Reply-To: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2020 09:24:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WEL8OyZLGrdVz54XaHS-56D8zbKyN2ZZcnPMsHezPrbQ@mail.gmail.com>
Message-ID: <CAD=FV=WEL8OyZLGrdVz54XaHS-56D8zbKyN2ZZcnPMsHezPrbQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm: panel: simple: Fixup the struct panel_desc
 kernel doc
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 9, 2020 at 5:01 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> When I run:
>   scripts/kernel-doc -rst drivers/gpu/drm/panel/panel-simple.c
>
> I see that several of the kernel-doc entries aren't showing up because
> they don't specify the full path down the hierarchy.  Let's fix that
> and also move to inline kernel docs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("drm: panel: simple: Fixup the struct panel_desc kernel doc") new for v4.
>
>  drivers/gpu/drm/panel/panel-simple.c | 59 ++++++++++++++++++++--------
>  1 file changed, 42 insertions(+), 17 deletions(-)

I'm curious if there are any outstanding actions I need to take for
this series.  I know I found that on patch #4 I should have added the
sync flags [1] but I was waiting to see if there was any other
feedback before sending a v5.  If there's nothing else I'm happy with
any of:

a) I can send a v5 with that small fix.

b) v4 can land an the maintainer landing can add the ".flags =
DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC," into the patch when
landing.

c) v4 can land and I can send a follow-up patch with the sync flags fix.

I know it's the holidays right now and folks are busy, but I just
wanted to see if there were any actions I needed to take.  Personally
I'm on vacation the last 3 days this week and I imagine I'll come back
to work Monday swamped with email, so today/tomorrow would be an ideal
time to send a spin if one is needed.  Thanks!

-Doug

[1] https://lore.kernel.org/r/CAD=FV=UPkuJ5E2sCQeozNR3CO+LZW=DW9h77vfooeiSMqGnYpA@mail.gmail.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
