Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F229A878
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9E89FDB;
	Tue, 27 Oct 2020 09:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E1589FDB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:54:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i2so1037567ljg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dlZKihEU47KO2Q4wXh/mn6fHnYIgZzljB9zpEIZhZu8=;
 b=NItm7iccu0ev/qqIqm16sypSo+zBzIrorG1+c6Z1TIxSDMiFde0Hl2fmmVytXGIPPD
 LUqYzvXNdrn/eAoQPyJkQGEOzg/KQCozSg0VTGSehoiRmqxgpYU5dyPbAltUWZVWtI22
 Lcik3pFj3nyaUisDmpa6H3njzoFOP7vl8a0x5K9ZYZJ9tBIHsq8uI1RfW2HU/yiYZkZc
 62hfCxBEQCyDGv8jTCEOKes7HGS/39JLTUrwmdKXE7TtroN3BTYApJEhnfs+9YlVW4NJ
 lTJth/sVYP1UznAbFLGUOOBZaW3QbuNpIgg7jwyzRtYpztVG35s/xmhbPNSokIIBlsiZ
 3ImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dlZKihEU47KO2Q4wXh/mn6fHnYIgZzljB9zpEIZhZu8=;
 b=WYPJlgtSMBP9BooDKns+nhLLsUNo4pUcnjUUg8sv/GnBYX6esN6guSGr+0FZc1mCh/
 ganPhcb9Qde1xmefD2VytG8wPfAG6Jc0WLsjI6XDf0XRxdHgaPuCRLUUmaS2mVtzRO9E
 IcQISiPocecMe1q17Q8YjiF5XXN9bZzyAPjWZYgiStA6AWPBgrT2jd1avL/ltIAs+qLY
 WJSmOig3PQxkwqS17B74q/WF+dmaL8QmXbPh1VqFrPqjPDOHnDldu2W+tSWAp3FJYbfl
 6GuUWDkD0hJJUALQBsl+hdHVucWRzIYYvO2XfEfGgSlJydwn9BLvg53KKzLexzszcDVF
 ZexA==
X-Gm-Message-State: AOAM533UB5VR8fyyWDLv/ABU0xy3m7bhARPE1y4MlkWW7I07XNjJHAb5
 Ew7BzCeX8rl5lEwzqfhUSpEuxyIFdGBRPQb+9so=
X-Google-Smtp-Source: ABdhPJzSgEcO8GMdK0RxR+ju00EjciXRlSPfuOfVG+uJDA3TOJd2ggA4xrukLCBlg743XPya5LfA3fGmXwMpmdQHRZw=
X-Received: by 2002:a05:651c:11d2:: with SMTP id
 z18mr694563ljo.423.1603792478736; 
 Tue, 27 Oct 2020 02:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-4-arnd@kernel.org>
 <20201027093350.GI401619@phenom.ffwll.local>
In-Reply-To: <20201027093350.GI401619@phenom.ffwll.local>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 27 Oct 2020 10:54:27 +0100
Message-ID: <CAMeQTsZ9rBh2W_y8W4aaGJR3v5CA4g2BLmr-wAvcoKjOQtL68g@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/gma500: avoid Woverride-init warning
To: Arnd Bergmann <arnd@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 David Airlie <airlied@linux.ie>, Stefan Christ <contact@stefanchrist.eu>, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Emil Velikov <emil.velikov@collabora.com>, 
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 10:33 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 26, 2020 at 08:41:04PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc -Wextra notices that one of the fields in psbfb_roll_ops has two
> > initializers:
> >
> > drivers/gpu/drm/gma500/framebuffer.c:185:20: warning: initialized field overwritten [-Woverride-init]
> >
> > Open-code this instead, leaving out the extraneous initializers for
> > .fb_pan_display.
> >
> > Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Scrollback is dead, so I'm not sure it's even worth to keep all this. I'd
> just garbage-collect this, maybe als the entire accelerator code and just
> leave psbfb_unaccel_ops behind ...
> -Daniel

That's been my idea for quite some time. The gtt roll code is also
broken in multi display setups.

Arnd, I can take care of this unless you feel an urge to do it yourself.

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
