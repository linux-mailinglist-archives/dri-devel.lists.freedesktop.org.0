Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F44C796F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C5589718;
	Mon, 28 Feb 2022 20:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB1989718
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 20:06:24 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y7so14282926oih.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+3/hnEGttHw+ykEYwuEW4fvQITLLLeGWeScAdvHl/KA=;
 b=gma3fcbTcxZs3ntTjPMhGnHZHMQhmpr/uq9NeQaA/FpHt4PaWcWXyyH8LNzrSfx0a6
 hWWWhBwmCCtiQdtL9EGlRtEH8eX0XZkWrQPYviWFPnRfcZ58Bo9uYvkT9gadQpsFyn4l
 OGvWJt25QD5DNWSKVbQC9N8mNXyRpjj5T5esY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3/hnEGttHw+ykEYwuEW4fvQITLLLeGWeScAdvHl/KA=;
 b=2qMEQDg1D1MSiqPnENmxFOR+nMV+BO2861uyE75r/6hzSeqHnUZg/H59pHuOiFknXd
 VKbhKJnb/5ABdMsBQYBjghvnDbQ36DYw6rJ42PJYU6+6Gh7Jibmkq6RcvOSulQepiHPz
 OhfE83Thl2PD9fiDp2RLDZxqp8+LYZimfIW70eZnOpIrWYRNph1rzB4Y84ZNvVHBkzp6
 zG4rcf7xw5WK/XlRn4XJlmkUWpqrxA4x5YN5gny8vh4e5up0Q6owLt72g8yaHvRA+23q
 tfFl1/aiXcr9q8mmB52Z97FkJU4p61pG4j1KOmg8KOG58+AJSlGrUy7L2sSvG2luQIZI
 5vjA==
X-Gm-Message-State: AOAM532bl1IiXQAr1gzcJQGI5Y+sy4WBIOYKu+QGlBQgSumEvx9miQmx
 RxX+FBEzzxuE0RRc/CZE6Wf4P3CsskkW5g==
X-Google-Smtp-Source: ABdhPJz7iIPNXk4PXWU8yaD4U5xkMC6EPflSIBprG3cAyCCqGjZ7UeSrbHTpncnkmM9Y4qstWHEytw==
X-Received: by 2002:a54:4494:0:b0:2d7:652b:287 with SMTP id
 v20-20020a544494000000b002d7652b0287mr9790817oiv.126.1646078783529; 
 Mon, 28 Feb 2022 12:06:23 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com.
 [209.85.161.47]) by smtp.gmail.com with ESMTPSA id
 e25-20020a544f19000000b002d53ce2f979sm6547636oiy.38.2022.02.28.12.06.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:06:23 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso4393161oop.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:06:23 -0800 (PST)
X-Received: by 2002:aca:5e86:0:b0:2ce:de77:5256 with SMTP id
 s128-20020aca5e86000000b002cede775256mr12030360oib.117.1646078402626; Mon, 28
 Feb 2022 12:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20220215235420.1284208-1-briannorris@chromium.org>
 <20220215155417.2.Ic15a2ef69c540aee8732703103e2cff51fb9c399@changeid>
 <6344d1828760d4d8625a87243fcc5f5b1096b9d4.camel@oss.nxp.com>
In-Reply-To: <6344d1828760d4d8625a87243fcc5f5b1096b9d4.camel@oss.nxp.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 28 Feb 2022 11:59:51 -0800
X-Gmail-Original-Message-ID: <CA+ASDXOFcmLO_UBfzZ37NmQ3i3n_=5XPcHa_7=OLFvg6xg=YHg@mail.gmail.com>
Message-ID: <CA+ASDXOFcmLO_UBfzZ37NmQ3i3n_=5XPcHa_7=OLFvg6xg=YHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: Force bridge self-refresh-exit on CRTC
 switch
To: Liu Ying <victor.liu@oss.nxp.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Sean Paul <seanpaul@chromium.org>,
 stable <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

On Mon, Feb 28, 2022 at 1:02 AM Liu Ying <victor.liu@oss.nxp.com> wrote:
> On Tue, 2022-02-15 at 15:54 -0800, Brian Norris wrote:
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1011,9 +1011,19 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
> >               return drm_atomic_crtc_effectively_active(old_state);
> >
> >       /*
> > -      * We need to run through the crtc_funcs->disable() function if the CRTC
> > -      * is currently on, if it's transitioning to self refresh mode, or if
> > -      * it's in self refresh mode and needs to be fully disabled.
> > +      * We need to disable bridge(s) and CRTC if we're transitioning out of
> > +      * self-refresh and changing CRTCs at the same time, because the
> > +      * bridge tracks self-refresh status via CRTC state.
> > +      */
> > +     if (old_state->self_refresh_active && new_state->enable &&
> > +         old_state->crtc != new_state->crtc)
> > +             return true;
>
> I think 'new_state->enable' should be changed to 'new_state->active',
> because 'active' is the one to enable/disable the CRTC while 'enable'
> reflects whether a mode blob is set to CRTC state.  The overall logic
> added above is ok to me. Let's see if others have any comments.

Thanks for the review, and good catch. This actually shows that most
of my development was before commit 69e630016ef4 ("drm/atomic: Check
new_crtc_state->active to determine if CRTC needs disable in self
refresh mode"). In fact, the "state->enable" condition was included
here mostly as a complement to the "!state->enable" condition that was
present previously, and I didn't adapt it properly upon rebase.

In practice, this portion of the condition is not needed at all; we
really want to exit PSR on CRTC-switch regardless of the new-CRTC
state. So rather than change "enable" to "active", I plan to remove it
entirely.

I'll give it some local tests and send v2 eventually.

Thanks,
Brian
