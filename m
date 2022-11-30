Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B695163D7CF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458A10E474;
	Wed, 30 Nov 2022 14:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F09310E472
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:10:59 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id s7so1043251plk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mY9gN84AcxJJfq4ubBnvLL6F+pAMi7N9Mps95qULuYc=;
 b=OsLvuAvbBmKybDjDejqrhM+c18g0OtX8iJCi75eNnSethkruOtsb5qhSpxRIuKbJhn
 bG/1gOX28dKsWkfaKALW6PGB4dXi3b1SIua4CW9n7tfMHSzu6HVVclDB5h5aO9Uy7dYY
 vqS6n7TfM4VlqQCpffeC4Lkcf7vM8VDaL4mtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mY9gN84AcxJJfq4ubBnvLL6F+pAMi7N9Mps95qULuYc=;
 b=MnwhA5Gc30n+3JiccirdPRdp2uszLtYeYCR2E7p6JlGHWgNSij3FTsK6PHwdv5v49x
 sJHj9Y+l1giijv39dS7/5z12TC6eFa2I3uEnupFkr/L9RkOYyDBTZy/UXJchQCuUmRKT
 /njdtifbRTf6//UIse/tjhPaKXFtgGYZXkhqp6yWEiGeOJS8wVkZUgALTEkssAz2tqmn
 H1o0t+sp12x9S2zve0ZX6AmFqFzTtMUoYGMNJkx9Aq03y26GVjTAu0KUp/8CUy5WWINC
 TJf3TR8ezwzUZ3wnAyCW2qpENZ/H90yoK7YGTqIkhlRSqnSMtt37XU3ylBbbfjMRc+bo
 0kpA==
X-Gm-Message-State: ANoB5pk/sPWAz5LKN0wvxw4QcGsLQ1gjBLX6s8maM0srJfd1N66XZ9SA
 rZBbYmrQn9W7ofByJY0RSjlEyZ018Va05NWESiMCeA==
X-Google-Smtp-Source: AA0mqf6wBtm8iJFnzHNeZdgrVxETvL+4xfq5ZCRQHhI91nyvmzLS8hYvDCPjpg1ViN5/6BKT/fw+UPzQhG9RoNV4inY=
X-Received: by 2002:a17:90b:3c91:b0:219:608a:75c with SMTP id
 pv17-20020a17090b3c9100b00219608a075cmr4170459pjb.33.1669817458838; Wed, 30
 Nov 2022 06:10:58 -0800 (PST)
MIME-Version: 1.0
References: <b37af070-21f9-fa40-89f5-5a1be6aaa20b@linux.intel.com>
 <20221130134301.ia2vhzmupwer5auo@houat>
In-Reply-To: <20221130134301.ia2vhzmupwer5auo@houat>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 30 Nov 2022 15:10:46 +0100
Message-ID: <CAKMK7uHmJ4=yjQc_jeUoaYEoxyrHiwrn-dt_FYeWksw1j6O=Zg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-fixes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 14:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Maarten
>
> On Wed, Nov 30, 2022 at 02:16:05PM +0100, Maarten Lankhorst wrote:
> > A single fix to vmwgfx mks-guest-stats ioctl.
> > I lost my internet connection when pushing the tag, so I put together this mail
> > manually. I hope you remember where drm-misc is hosted. :)
>
> For reference, you can generate the mail content after the fact by using something like:
>
> git request-pull drm/fixes drm-misc drm-misc-fixes-2022-11-30

Maarten, can you pls do that? Otherwise we can't feed the thing into
dim for processing, and have to do that also manually :-)
-Daniel

>
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
