Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B83FA417689
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 16:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744026E1BC;
	Fri, 24 Sep 2021 14:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0252C6E1BC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:05:19 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y8so8970651pfa.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vH2YhvPec36tzF9CqFvv48FWCLMK8cS6dcfU+nnIHyY=;
 b=MULBtZwJXLYw882PNkC1wdIC6xsntlfC3Jqk68hXwFyDrHTB+5MPik7dimveBvicK9
 czoHkx9kG9TCx/Q0u/mXNOVOnge0HpxCKoo9h1TN4Th3MREoijDCtzjsI9IzhTeV8JJL
 vRiuoKD8opz3Gwxmjxn7QjH6rynmXpiiqOlLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vH2YhvPec36tzF9CqFvv48FWCLMK8cS6dcfU+nnIHyY=;
 b=wYPLiMBri1VUf8ptWA8FtS6zL8KVf+k6IraYByWshBw07T8wpnUTLEMW08BQmBl8lt
 OMXxxUYJrqqT8PlIUMigQO3gLPxFL9RLrmRc0f9I5usXcDIM+74FUzya3ttIFOnpjc6N
 mPI1m4SbgZnUnf0CD+msP/U5M6I5fJPjUAJ5pr3SIIrwvCpRdIQUSEm53luKoKuAmABB
 ompATgGpqdXaPhIX+c/VHiujL4TnttITsGjb2zzjMN4l/p1aVRxCJhfIOMFA8CssUgMe
 zXGJKkIFKhdRIXNDgb5G8hHT15K40El+KBWgW/w48O0kSxPMFR0bxyHMpOL0SQ2PMleR
 NHYA==
X-Gm-Message-State: AOAM53335GI+Q2R4yoblATbnetc/iHyAaoOkFeeL9A+N54tnx+fqa01s
 gxn4ycJV8HdRXN0u+SY0UU+CUcuusJBwYQ==
X-Google-Smtp-Source: ABdhPJxnmDIjAR3XnenWVDSgxWl7j1bKDGM230h6pVVo7cZ8RKxDbUXtr/8Ev/l1SIaSiu3YRrIAOA==
X-Received: by 2002:a65:6287:: with SMTP id f7mr4012741pgv.444.1632492319280; 
 Fri, 24 Sep 2021 07:05:19 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id l14sm12623792pjq.13.2021.09.24.07.05.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 07:05:19 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id m21so9911217pgu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 07:05:18 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr8008800ili.142.1632491957963; 
 Fri, 24 Sep 2021 06:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
 <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
 <CGME20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b@eucas1p2.samsung.com>
 <874kaabdt5.fsf@intel.com> <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
In-Reply-To: <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Sep 2021 06:59:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
Message-ID: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 MSM <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Russell King <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, linux-tegra <linux-tegra@vger.kernel.org>, 
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, smyakam@microsoft.com
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

On Fri, Sep 24, 2021 at 2:10 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Hi
>
> removed most cc, due to server limitation
>
>
> W dniu 24.09.2021 o 10:03, Jani Nikula pisze:
> > On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> >> Pushed all 15 to drm-misc-next.
> > ...
> >> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
> >> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from
> >> the EDID
> > Hi Doug, Stan's reporting "initializer element is not constant" issues
> > here that were discussed before [1]. I wonder what gives, you said you'd
> > hit them on a draft version, but not with what was merged, and I can't
> > reproduce this either. Curious.
>
>
> Apparently this is grey area of unclear specification.
>
> gcc version below 8 reports error, above 8.1+ should work [1]. I am not
> sure if there is nice workaround for older gcc.
>
>
> [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18

So I think the only solution is to go back to the character-at-a-time
version. It's slightly uglier but functionality trumps form.

I'll post something today though it might need to wait a few hours
before I can manage it.

-Doug
