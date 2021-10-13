Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8342C023
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1B36EA4C;
	Wed, 13 Oct 2021 12:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908E56EA48;
 Wed, 13 Oct 2021 12:35:29 +0000 (UTC)
Date: Wed, 13 Oct 2021 14:35:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1634128527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LuvsWeBSy53ChBP2WMB1pyRVCJsvjLNQnToTYFMrYyE=;
 b=SJpxKjEVNLO+PsR8Iintrp3yIHhyFZBjJ8e8uLzgHezxWSCNrn8hDyw4kFfqSo/ZQhe1EQ
 Qkzo4UZvXEAKGnyc7dt5isK0Wo8X3hQt8hWfgtFqSPuNjMBCcjv/9cp5io9iKv/0dOfs7Q
 N9a2s4ZyYpgmnR5wcqPmtMu7jFfRdeVVav245pVLavZexeH936gm61edyQtEJV27GwMcn+
 9j7TYdnU4T4YBevnxbjWILMigPR40TQO7pIM0rKfxRVbryy2UYGfxG1fZd0k9cd+XCM38K
 tOgMBAqs8HZ43adjfGmy54nCTm0RSgQdj6fBNCX/6iLHAIn9wy6cwj0hUu2dCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1634128527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LuvsWeBSy53ChBP2WMB1pyRVCJsvjLNQnToTYFMrYyE=;
 b=HNqbTwaiKhIzWvPoEzx4UOkj01Zpdyi4zHvNyuSWvE1NFC+JHlKYT5VErttndACifUg4az
 oNFE6PTZsCBmKPDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH] drm: Increase DRM_OBJECT_MAX_PROPERTY by 18.
Message-ID: <20211013123525.5nijgyx5ivnuujes@linutronix.de>
References: <20211005065151.828922-1-bigeasy@linutronix.de>
 <YWbK8wSxNjVu9OLm@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YWbK8wSxNjVu9OLm@phenom.ffwll.local>
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

On 2021-10-13 14:02:59 [+0200], Daniel Vetter wrote:
> On Tue, Oct 05, 2021 at 08:51:51AM +0200, Sebastian Andrzej Siewior wrote:
> > The warning poped up, it says it increase it by the number of occurrence.
> > I saw it 18 times so here it is.
> > It started to up since commit
> >    2f425cf5242a0 ("drm: Fix oops in damage self-tests by mocking damage property")
> > 
> > Increase DRM_OBJECT_MAX_PROPERTY by 18.
> > 
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Which driver where? Whomever added that into upstream should also have
> realized this (things will just not work) and include it in there. So if
> things are tested correctly this should be part of a larger series to add
> these 18 props somewhere.

This is on i915 with full debug. If I remember correctly, it wasn't
there before commit
   c7fcbf2513973 ("drm/plane: check that fb_damage is set up when used")

With that commit the box crashed until commit 
   2f425cf5242a0 ("drm: Fix oops in damage self-tests by mocking damage property")

where I then observed this.

> Also maybe we should just dynamically allocate this array if people have
> this many properties on their objects.
> -Daniel

Sebastian
