Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86044220EAE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFB96EB6B;
	Wed, 15 Jul 2020 14:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6CE6EB6B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:05:53 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id g37so1524756otb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAYoqkDRQAeimHaUrZmBQDu7Jf6R2HY8pFOK/1qjsZs=;
 b=ExB08Ndx/lwe9KJ+y1k309GKK7sF/MF0efPoCdBiTbDymxtxRRaQbxExAxojod4PBh
 EA1jZVNhexWK494JzUkP235H3ZZ5wBejzUF/Jy/yFYghfhFMwmYmwvsuLl9R7AaNP410
 iz0R6ZFCV4dD0kZ+Y9WGWd0YNYbbAl2sWiI0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAYoqkDRQAeimHaUrZmBQDu7Jf6R2HY8pFOK/1qjsZs=;
 b=aYF3sUdlWfT1aOfhFjh6QkhJXlLWKGZVrf3VqRDurlhxoE1YuIfjJbjwzg2VAVgRCw
 BKrf2Prvom4ZZMnoKfD7WQ62XGt1KykCXgcogzLFOYUebAnKCL2WLMVR1HVGM0tbtK7G
 3eWsItaDYY3jF1lxb/l0KGg0mwNpP4p0t0xqS1wn4/agWHCAgeodwdf2Sm3st+uWoiWG
 Mh2FKPe/FjWaw1oxzQ75LINHKCpimZlI3tFTHJQyuoYbLkROhQsXnHlTci/ROg6xZLDF
 3SoOo+pMvCzrgYTwuMd6eA86oGwQOc3nsAW/FPWYnM44wwklLG9R0N0R18Q7muhqMCQI
 PGZA==
X-Gm-Message-State: AOAM530iCTGrEtvE61mYvEhnTMrcreoYyLrMKoFIJVSKrNBHNBIPt79N
 uROwuOHCy1Yf/r8XwaaxVVyfWBH4kRMgS2yuwiku3g==
X-Google-Smtp-Source: ABdhPJyaiNWDvfSd56kH8sua2TotZr//W7ffRo893laPrqhjhye1a7sziKFxpauaVvOzh9CFNxodbysgjearB3i2d5U=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr9444012oti.281.1594821952517;
 Wed, 15 Jul 2020 07:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <87a70029vz.fsf@intel.com> <875zao2989.fsf@intel.com>
In-Reply-To: <875zao2989.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 15 Jul 2020 16:05:41 +0200
Message-ID: <CAKMK7uGbLrp+sreKNV0FUdG_o7NRvRf=B-rN3zM91174diceJA@mail.gmail.com>
Subject: Re: [PULL] drm-intel-next
To: Jani Nikula <jani.nikula@intel.com>, Lyude <lyude@redhat.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 3:34 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
>
> Argh, failed to mention:
>
> On Wed, 15 Jul 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> > Lee Shawn C (1):
> >       drm/i915/mst: filter out the display mode exceed sink's capability
>
> The above depends on:
>
> > Lyude Paul (1):
> >       drm/probe_helper: Add drm_connector_helper_funcs.mode_valid_ctx
>
> Which has changes outside of i915:
>
> >  drivers/gpu/drm/drm_crtc_helper_internal.h         |   7 +-
> >  drivers/gpu/drm/drm_probe_helper.c                 |  97 +--
>
> and does not have an explicit ack recorded, though drm-misc maintainers
> have been Cc'd. :(
>
> I decided they were benign enough, but needed to be mentioned.

Yeah looks all fine, adding Lyude just as fyi.
-Daniel

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
