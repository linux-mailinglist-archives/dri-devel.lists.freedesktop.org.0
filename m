Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E2404243
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 02:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186246E3E5;
	Thu,  9 Sep 2021 00:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1A86E3E5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 00:24:20 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id b7so90065iob.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 17:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SBJZ+xd67CiFIsbUo5ZILupshCxiGwC5Wpwkm3BLH6k=;
 b=QFvS6izIE+d1GGVRGHR1QEMy4lxOUpUzI8cdpEPvcnmHg6ncVokDncdiZFJpdPUMfv
 a8I1A8s8Vi1L61d1h9JgrEGyy6LFUztBBvesIm5nHaDH6EXFqKtgt5okUQHR7jxF5sC6
 3L1eCO4Ec7roeo/DZl0f2C7fNach3w+CA9UlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SBJZ+xd67CiFIsbUo5ZILupshCxiGwC5Wpwkm3BLH6k=;
 b=AaUNugkgKRgZK1a9De9BXGaBy7trJCTPKSYhS1tWhpGNHV004If1zbk4PojUCppUOb
 0RCx9xNirnKLOYzuutL8JZYZ5L3wCct5S6ke45rnUXuq5TSAJGYdulhVZp4gehyRv9Kp
 3ITbrqw+sCYoazmxaiG/UHhsSQZrsTwXcCe04VUFYUmKkaPHIKN3WA1o3UYlGXCWD8/r
 4StKL9nCS+gqaLdmN28MxiuiXmd9dBM5aWh349e1H3slcsgLA8opAlTrGBXEe1PgNnlt
 8xeElmgfah84rEY6GKneDKKtAF4gM2c5Dcb4aLvZ79JnCfhApf+Q/z+gw5bXP1SsmeLB
 rxrA==
X-Gm-Message-State: AOAM5311Yx8ZddDYi59zmElX2GyAAWc3E1vTjR+pvLyXSv26HV73xmtH
 kQrbc5fq7nkjqQNnuijmhm7/xjje9+WnJQ==
X-Google-Smtp-Source: ABdhPJxca3ze1anJvD/BqskUNc4oUwzzoi0vqEBtdTN/uFTc0UpIKltqH9LYL9yWCyJZGaqNz9vF0w==
X-Received: by 2002:a05:6602:584:: with SMTP id v4mr216053iox.85.1631147059330; 
 Wed, 08 Sep 2021 17:24:19 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id m13sm80308ilh.43.2021.09.08.17.24.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 17:24:18 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id a20so120352ilq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 17:24:17 -0700 (PDT)
X-Received: by 2002:a92:6b0a:: with SMTP id g10mr141704ilc.27.1631147057200;
 Wed, 08 Sep 2021 17:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
 <87h7ey81e9.fsf@intel.com>
In-Reply-To: <87h7ey81e9.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Sep 2021 17:24:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Message-ID: <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] drm/edid: Allow the querying/working with the
 panel ID from the EDID
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
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

On Mon, Sep 6, 2021 at 3:05 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> > +{
> > +     struct edid *edid;
> > +     u32 val;
> > +
> > +     edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
> > +
> > +     /*
> > +      * There are no manufacturer IDs of 0, so if there is a problem reading
> > +      * the EDID then we'll just return 0.
> > +      */
> > +     if (IS_ERR_OR_NULL(edid))
> > +             return 0;
> > +
> > +     /*
> > +      * In theory we could try to de-obfuscate this like edid_get_quirks()
> > +      * does, but it's easier to just deal with a 32-bit number.
>
> Hmm, but is it, really? AFAICT this is just an internal representation
> for a table, where it could just as well be stored in a struct that
> could be just as compact now, but extensible later. You populate the
> table via an encoding macro, then decode the id using a function - while
> it could be in a format that's directly usable without the decode. If
> suitably chosen, the struct could perhaps be reused between the quirks
> code and your code.

I'm not 100% sure, but I think you're suggesting having this function
return a `struct edid_panel_id` or something like that. Is that right?
Maybe that would look something like this?

struct edid_panel_id {
  char vendor[4];
  u16 product_id;
}

...or perhaps this (untested, but I think it works):

struct edid_panel_id {
  u16 vend_c1:5;
  u16 vend_c2:5;
  u16 vend_c3:5;
  u16 product_id;
}

...and then change `struct edid_quirk` to something like this:

static const struct edid_quirk {
  struct edid_panel_id panel_id;
  u32 quirks;
} ...

Is that correct? There are a few downsides that I can see:

a) I think the biggest downside is the inability compare with "==". I
don't believe it's legal to compare structs with "==" in C. Yeah, we
can use memcmp() but that feels more awkward to me.

b) Unless you use the bitfield approach, it takes up more space. I
know it's not a huge deal, but the format in the EDID is pretty much
_forced_ to fit in 32-bits. The bitfield approach seems like it'd be
more awkward than my encoding macros.

-Doug
