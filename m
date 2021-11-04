Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38967444EE5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 07:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488306ED11;
	Thu,  4 Nov 2021 06:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DC56EB70;
 Thu,  4 Nov 2021 06:32:25 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id o26so8959472uab.5;
 Wed, 03 Nov 2021 23:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXnPAB3AiBWrY7SU8k+mx2QdDTS+Fxkn/CtfTF2GojQ=;
 b=eczselLNEhFBMle12JjPVn4CXc0ejYxMnkpeCQWhy2+uu85TAv5xBPI5w7Sg6KM2v5
 aeJmwjLhWaJcDh8QLY+lAOxBC34RugJQgrPcvPuCXlzhJNDtPdMaY+piD19HHRPFMPhd
 ZDz9C2NmtqaKAzs9A0IBA8ib5nrh19O8rUar/2jeovtwfW8J6NJA2hADuM05Mv2rIPKK
 JXZZObJ5btcIu3rCHrksGMCWtFQFrN+BjxcbNvHvm7WP/s8TRKtEZfUiEvL9drvDcNq1
 +rtm3993TkKiBMe3dcwZkFgV1Ge7hf/s1P7xaPfDaasHx+LvRgdvh/lqQthyxlz9wM2s
 PFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXnPAB3AiBWrY7SU8k+mx2QdDTS+Fxkn/CtfTF2GojQ=;
 b=4luaHGUZjLogGYEOewWCgiWCf9b5wutvFdNLi24ecCSwZFeTOjqlkqnS6hqwcimHU0
 uPH+2rGBVDHwp7Zkvjf25nUlW3PDNBHTREBfVR21T1ouA7oxIiv12umoIIBwb6gSPJ4j
 ppb64av7ZK+o1tk/BfM9lPVcpuR2D5xJMnRljYj+zwbyNQbRoJqRbTSPukO9dMKZ1Jqe
 hmW/LyzXReOYht+Oi4PusC1CgBOdmth5O7qXFHxFxE90LCu8mdcUWQhS7G5w+HfWtxlE
 G1oAia9AxD7pzGKaToydmIHIRkEET2xxIDRWH8xn0ahXcZZyFO5Rn4FI2rlab2N3z2SG
 zkQw==
X-Gm-Message-State: AOAM531amsqXHscib3nNK898kiK7U/3fIdiF8OxL8+9tTRIysW5gtX4A
 TaZjUNrU7qAlhKJe7+m+lxHKE/nOk4o3k85XTCc=
X-Google-Smtp-Source: ABdhPJwnwimOYTTmodrLByGFncVyeNmazEftmcNcyXiRSrc+/9K5LypExo+SZI7+7QlNp8TCpTBhp8bDClQJYErw360=
X-Received: by 2002:a9f:234a:: with SMTP id 68mr54022717uae.13.1636007544779; 
 Wed, 03 Nov 2021 23:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211027043645.153133-1-jim.cromie@gmail.com>
 <20211027043645.153133-11-jim.cromie@gmail.com>
 <3a55ab9c-8109-8025-21e3-e3635bd891b2@akamai.com>
In-Reply-To: <3a55ab9c-8109-8025-21e3-e3635bd891b2@akamai.com>
From: jim.cromie@gmail.com
Date: Thu, 4 Nov 2021 00:31:58 -0600
Message-ID: <CAJfuBxyMeC5_H-RakOpqH9jDuh07gn4cjCuJ=ebQ8tLQVOTGrg@mail.gmail.com>
Subject: Re: [PATCH v9 10/10] drm: use DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES
 bitmap to tracefs
To: Jason Baron <jbaron@akamai.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 3, 2021 at 9:58 AM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 10/27/21 12:36 AM, Jim Cromie wrote:
> > Use new macro to create a sysfs control bitmap knob to control
> > print-to-trace in: /sys/module/drm/parameters/trace
> >
> > todo: reconsider this api, ie a single macro expecting both debug &
> > trace terms (2 each), followed by a single description and the
> > bitmap-spec::
> >
> > Good: declares bitmap once for both interfaces
> >
> > Bad: arg-type/count handling (expecting 4 args) is ugly,
> >      especially preceding the bitmap-init var-args.
> >
>
> Hi Jim,
>
> I agree having the bitmap declared twice seems redundant. But I like having fewer args and not necessarily combining the trace/log variants of
> DEBUG_CATEGORIES. hmmm...what if the DEFINE_DYNAMIC_DEBUG_CATEGORIES() took a pointer to the array of struct dyndbg_bitdesc map[] directly as the
> final argument instead of the __VA_ARGS__? Then, we could just declare the map once?
>

indeed. that seems obvious in retrospect,
thanks for the nudge.

also, Im inclined to (uhm, have now done) bikeshed the API in patch 1,
and  change _CATEGORIES to something else,
maybe  _FMTGRPS
or  _BITGRPS  < -- this one

ISTM better to be explicit wrt the underlying mechanisms, (least surprise)
let users decide the meaning of "CATEGORIES"

also, HEAD~1  added DEFINE_DYNAMIC_DEBUG_CATEGORIES_FLAGS
which could be used directly for both purposes (after a rename).
TLDR: flags exposes the shared nature of the decorator flags,
the trace and syslog customers of pr_debug traffic should agree on their use.

redoing now...




> Thanks,
>
> -Jason
>
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_print.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index ce662d0f339b..7b49fbc5e21d 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -73,6 +73,25 @@ DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,


static mumble-map
> >                               [7] = { DRM_DBG_CAT_LEASE },
> >                               [8] = { DRM_DBG_CAT_DP },
> >                               [9] = { DRM_DBG_CAT_DRMRES });
> > +
> > +#ifdef CONFIG_TRACING
> > +unsigned long __drm_trace;
> > +EXPORT_SYMBOL(__drm_trace);
> > +DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES(trace, __drm_trace,
> > +                                   DRM_DEBUG_DESC,

                                mumble-map)
