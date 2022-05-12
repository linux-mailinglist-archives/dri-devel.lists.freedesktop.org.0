Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA1525836
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 01:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EDD10EB6F;
	Thu, 12 May 2022 23:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268AF10EB6F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 23:24:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g23so7945894edy.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xP2D+p2j0XpeMP91WpwvfAiSjDuD02vLWMlVM5sdkSI=;
 b=TW6S5OGQE7UTMHdah+GzZiJdSO4wGVz+QaNpAV2t7s9ackgzkc+IyWcb+J5fxjCm9N
 peHzh1yXiQYsVgoTsn4mHRjqGARsKyczUxbA1Tsuy+OcmIIGsRMBc6qyKARz4FlR/lkH
 KjNs98sZURIhZSAjZ4j/GVKL90M3od7nHj7PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xP2D+p2j0XpeMP91WpwvfAiSjDuD02vLWMlVM5sdkSI=;
 b=tkdhryAm63xhTVsEi6q/hHLz6vo4NyuJfb2V4NOJ4vyj3p17ADQk2ZZWre96O4Zota
 ckTtU8y7l0z4pwTlQ13b/Wz/+QIASj8T5H7UriggKLorLpb5tdYlU9Yjz+cdIuznX6EZ
 KkL9cOdEvU0pAKIHJbJyeQrzOWzqUkmQ//Xu85LRovj8SETEbHKwOJMNNX7btxEXcP0u
 NKjNX2/i8B1zDfUdkIQaZedMUBfRuwqLvRdxc8UqHNHYS/XcHFZOo5VWw+7fQB35tdSI
 iBI7kN4Gqa2sQheHQhtJ8ce/TevoxKBujisJncJuKlcciCBoTpn9qe/KRWXDDgnFmMyr
 9VUw==
X-Gm-Message-State: AOAM533g4+ohbBlyIEaoCYt8YsonXQp8efv7lBx2YWJMzufbjoLu0nlQ
 KCb1nxiCZidYu4e6xFAS5RI1AZs46ArUVV1j
X-Google-Smtp-Source: ABdhPJxVNzXQonqEHL9U7pD9+VrkFSL1rB0C+dMbN68cVHeOlyHWR8zrar6/3q2hKnaN8N+ytLw/VA==
X-Received: by 2002:a05:6402:1d48:b0:427:e039:9262 with SMTP id
 dz8-20020a0564021d4800b00427e0399262mr38217152edb.148.1652397867491; 
 Thu, 12 May 2022 16:24:27 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 w27-20020a170907271b00b006f3ef214e12sm194523ejk.120.2022.05.12.16.24.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 16:24:25 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id v12so9192233wrv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:24:25 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr1564105wry.342.1652397864753; Thu, 12
 May 2022 16:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
 <CAE-0n51iNXN4oOP-wAqrm9U6qC84fQ+qMUBu0BODXjsCDk+H=w@mail.gmail.com>
In-Reply-To: <CAE-0n51iNXN4oOP-wAqrm9U6qC84fQ+qMUBu0BODXjsCDk+H=w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 May 2022 16:24:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6Z1TG4vQcDDeNsGkjZVAR8=A1L1pDfo1rDFCh84H4Rg@mail.gmail.com>
Message-ID: <CAD=FV=W6Z1TG4vQcDDeNsGkjZVAR8=A1L1pDfo1rDFCh84H4Rg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 6:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-04-18 10:17:54)
> > Sometimes it's useful for users of the DP AUX bus (like panels) to be
> > able to poll HPD. Let's add a callback that allows DP AUX busses
> > drivers to provide this.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Left Dmitry's Reviewed-by tag off since patch changed enough.
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Change is_hpd_asserted() to wait_hpd_asserted()
> >
> >  include/drm/dp/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> > index 53d1e722f4de..0940c415db8c 100644
> > --- a/include/drm/dp/drm_dp_helper.h
> > +++ b/include/drm/dp/drm_dp_helper.h
> > @@ -2035,6 +2035,32 @@ struct drm_dp_aux {
> >         ssize_t (*transfer)(struct drm_dp_aux *aux,
> >                             struct drm_dp_aux_msg *msg);
> >
> > +       /**
> > +        * @wait_hpd_asserted: wait for HPD to be asserted
> > +        *
> > +        * This is mainly useful for eDP panels drivers to wait for an eDP
> > +        * panel to finish powering on. This is an optional function.
>
> Is there any use for the opposite direction? For example, does anything
> care that HPD is deasserted?

Not that I'm aware of. Originally I was planning to have it so that a
timeout of "0" meant to just poll without sleeping at all, but it
ended up making the code a lot more complicated because everywhere
else we had the "readx" semantics where 0 meant wait forever. It
didn't seem worth it. I can go back to that behavior if need be.


> > +        *
> > +        * This function will efficiently wait for up to `wait_us` microseconds
> > +        * for HPD to be asserted and might sleep.
> > +        *
> > +        * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
> > +        * expired and HPD wasn't asserted. This function should not print
> > +        * timeout errors to the log.
> > +        *
> > +        * The semantics of this function are designed to match the
> > +        * readx_poll_timeout() function. That means a `wait_us` of 0 means
> > +        * to wait forever. If you want to do a quick poll you could pass 1
> > +        * for `wait_us`.
>
> It would also make sense to have a drm_dp_wait_hpd_asserted() API
>
>   int drm_dp_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us);
>
> and then this aux function could be implemented in various ways. The API
> could poll if the aux can only read immediate state of HPD, or it could
> sleep (is sleeping allowed? that isn't clear) and wake up the process
> once HPD goes high. Or if this op isn't implemented maybe there's a
> fixed timeout member that is non-zero which means "sleep this long".
> Either way, making each drm_dp_aux implement that logic seems error
> prone vs. having the drm_dp_aux implement some function for
>
>         get_immediate_hpd(struct drm_dp_aux *aux)

There's a reason why I changed the API to "wait" from "get". If you
can think of a good place to document this, I'm all ears.

The basic problem is ps8640 (my nemesis, apparently). On ps8640,
because of the black box firmware blob that's on it, we have a crazy
long delay in its runtime resume (300ms). So what happens with ps8640
is that if we make the API "get_immediate_hpd()" it wasn't so
immediate. Even with autosuspend, that first "get" could take 300 ms,
which really screwed with everyone else who was waiting with a 200 ms
timeout.

Now, in theory, one could argue that the fact that ps8640 had a 300 ms
sleep would mean that the very first "get" of the panel would already
show HPD high. I don't know why that wasn't the case, but ps8640 is an
annoying black box.

In general, though, the DP controller might need some amount of time
to power itself back up and configure itself. Even though the ps8640
case is extreme, it wouldn't be totally extreme to assume that an AUX
controller might take 20 ms or 50 ms to power up. That could still
throw timings off. Implementing the API as a "wait" style API gets
around this problem. Now the DP controller can take as long as it
needs to power itself up and it can then wait with the requested
timeout.


> or
>
>         notify_on_hpd(struct drm_dp_aux *auxstruct completion *comp)
>
> > +        *
> > +        * NOTE: this function specifically reports the state of the HPD pin
> > +        * that's associated with the DP AUX channel. This is different from
> > +        * the HPD concept in much of the rest of DRM which is more about
> > +        * physical presence of a display. For eDP, for instance, a display is
> > +        * assumed always present even if the HPD pin is deasserted.
> > +        */
> > +       int (*wait_hpd_asserted)(struct drm_dp_aux *aux, unsigned long wait_us);
> > +
> >         /**
> >          * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
> >          */
