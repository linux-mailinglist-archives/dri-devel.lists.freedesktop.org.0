Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8B40B8A7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700A96E5D3;
	Tue, 14 Sep 2021 20:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5C16E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:02:34 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id b10so285441ioq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2K42Cco3VEzvh5/q/0m2XAwxpLXefoWzF9vdOC1B4Gw=;
 b=BJhND6MG+JUZihcXSCVNsVkdDkscbXLe8kths9jHgjS4SLgYrqGaQp9OPqfXejdGA/
 ZIntkKlQZztXJwl/c/22qlX12SBrSu9xI7kd5YDbYcDWkLHLSQisKoAr972kYDUnT241
 jPCyXtIrFjVVOZz3sqJrKkZeNMO/myXFIEVEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2K42Cco3VEzvh5/q/0m2XAwxpLXefoWzF9vdOC1B4Gw=;
 b=Gb3e3yj/uZkIajGez0ngDkjJQDvM1N18vNb6NGyE3dp43bG0XnLzuDqfOS36SiVCQJ
 8U1DH52SqjQ5Xs7fYhqjS+EVfAFFphD9KbygPLQWKnDeSjRhu2xHTx8syDq7j0YWi6HS
 J+2zzprxLfQk71IUs2TadGV9cpiVbiFzJkz7/0HtXUvyPMzvoCnuNEFcXF3Mn4zQP5Jo
 WvnY1jx5/lQrl4XfNG18yi+BjO18zNiGy08fzjcoduwBFjasWGj9dpGfcL4PBCxzkExZ
 otrMeGhlFMhYu1bbdonfa5nnNNHszyvVGWlebVm2RbAKmX8PCQRuCLaa0neuF5e+JQ10
 +Wdw==
X-Gm-Message-State: AOAM532SSH7p/4hvIUwsDQeAFqN9NQcV2Dyzs9hqDaG2SAwiE+ORfc6m
 gZIvpZsQJzja+dEL8t0jRrG/Ild1zpM0xQ==
X-Google-Smtp-Source: ABdhPJypCLYMiQz6BFWzX0mjBnvt65OhbhtJzeChEVHsd+41wx6BbOBuStK5ctECDZ3bJXYTVHoKzA==
X-Received: by 2002:a05:6638:2644:: with SMTP id
 n4mr5860266jat.10.1631649753967; 
 Tue, 14 Sep 2021 13:02:33 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id m11sm7494620ilc.2.2021.09.14.13.02.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 13:02:33 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id b200so251779iof.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:02:32 -0700 (PDT)
X-Received: by 2002:a05:6638:dc8:: with SMTP id
 m8mr16281460jaj.93.1631649751964; 
 Tue, 14 Sep 2021 13:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
 <87ee9r10qw.fsf@intel.com>
 <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
 <CGME20210914185943eucas1p145cf1b087572ec1c4da1f1e269c6f11b@eucas1p1.samsung.com>
 <87y27zyodw.fsf@intel.com> <5af6cd50-0ed3-1a70-d7d0-66ca18a83d65@samsung.com>
In-Reply-To: <5af6cd50-0ed3-1a70-d7d0-66ca18a83d65@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Sep 2021 13:02:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHvFq5+Rtax7WNq2-BieQr-BM4UnmOcma_eTzkX2ZtNA@mail.gmail.com>
Message-ID: <CAD=FV=XHvFq5+Rtax7WNq2-BieQr-BM4UnmOcma_eTzkX2ZtNA@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] drm/edid: Use new encoded panel id style for
 quirks matching
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
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

On Tue, Sep 14, 2021 at 12:36 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 14.09.2021 o 20:59, Jani Nikula pisze:
> > On Tue, 14 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> >> Hi,
> >>
> >> On Tue, Sep 14, 2021 at 11:16 AM Jani Nikula
> >> <jani.nikula@linux.intel.com> wrote:
> >>> On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> >>>> In the patch ("drm/edid: Allow the querying/working with the panel ID
> >>>> from the EDID") we introduced a different way of working with the
> >>>> panel ID stored in the EDID. Let's use this new way for the quirks
> >>>> code.
> >>>>
> >>>> Advantages of the new style:
> >>>> * Smaller data structure size. Saves 4 bytes per panel.
> >>>> * Iterate through quirks structure with just "==" instead of strncmp()
> >>>> * In-kernel storage is more similar to what's stored in the EDID
> >>>>    itself making it easier to grok that they are referring to the same
> >>>>    value.
> >>>>
> >>>> The quirk table itself is arguably a bit less readable in the new
> >>>> style but not a ton less and it feels like the above advantages make
> >>>> up for it.
> >>> I suppose you could pass vendor as a string to EDID_QUIRK() to retain
> >>> better readability?
> >> I would love to, but I couldn't figure out how to do this and have it
> >> compile! Notably I need the compiler to be able to do math at compile
> >> time to compute the final u32 to store in the init data. I don't think
> >> the compiler can dereference strings (even constant strings) and do
> >> math on the result at compile time.
> > Ah, right.
>
>
> What about:
>
> +#define drm_edid_encode_panel_id(vend, product_id) \
> +       ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
> +        (((u32)((vend)[1]) - '@') & 0x1f) << 21 | \
> +        (((u32)((vend)[2]) - '@') & 0x1f) << 16 | \
> +        ((product_id) & 0xffff))

Wow, I _swear_ I tried exactly that syntax, but clearly I didn't. It
works great and it looks _sooo_ much nicer now. Thanks! I'll send out
a v5 shortly with this.

-Doug
