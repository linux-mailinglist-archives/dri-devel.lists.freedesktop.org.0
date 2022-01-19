Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A1493D5B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3510E35C;
	Wed, 19 Jan 2022 15:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D932910E35C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:39:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso2968831wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=37g4UuiXO6if6O4jKw433Ctu3fSZBlrCPlzA7Fzx8js=;
 b=gK7HKEh4pEJNXBWO6n5GiHnZxfjl/Vu1FBTKM0IfTGemrzfmeB/Uhe79b0okiTixUi
 nr+K+Lgm31TIFsfOya6ZteoMxbGY2ZOnr4Jl8IF2FHd8lIPpoUramdITYWzPCJ7hbmrr
 +P1RrkQ8g/EjvR41Avz3poNagvVQfMxo5HGQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=37g4UuiXO6if6O4jKw433Ctu3fSZBlrCPlzA7Fzx8js=;
 b=pboAgM9qqU+iSdsuBgiFWU36B2ZRNr9xGIvKclD84XIyn9pGdZpG9tM/JElCxrOigw
 yJ3t2+0rGZNbW4qebRFkZkksh2ttyS0gjQzXUqbdri02334iwvl8gpDkTOvNxF2T1sk6
 XXdxw9k1EBX9cMeoRVdKpaqVB6dYRaM43aoMIAijd7UoGn2TX/Vu/dVAkBkure9al6bd
 SiVoBBsxMvISyUIpTD8ePxMh5fwRnbc1Vz8yQ8yVJZUqNR1zjsBatxb6Grm7ebG6n1kO
 e3Z+K8oZb0avMF/JcG0wQD+70ZyNCe7kfvHiq7pExa3KNqrRzPx+0nAVpMnTrQTMM6ER
 9vCw==
X-Gm-Message-State: AOAM530ZIqrXw2RLsJ3yJehW1EERGRohDxdHmnKqJObvZLWs1+ZCVv1B
 FUe8d2NnZeY/LKQcX4sSoCZ03Q==
X-Google-Smtp-Source: ABdhPJy72r4B7yan+nxdt7FSI1SKVo07bVD5jhVNqztRvBA1fBMhkfG6WrkFf25ELM9tXG36OYArHg==
X-Received: by 2002:adf:fbd1:: with SMTP id d17mr4928145wrs.626.1642606746468; 
 Wed, 19 Jan 2022 07:39:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm1057896wmr.25.2022.01.19.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:39:05 -0800 (PST)
Date: Wed, 19 Jan 2022 16:39:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
Message-ID: <Yegwl/rwRhjROxcy@phenom.ffwll.local>
References: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
 <87zgnz71ic.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgnz71ic.fsf@x1.stackframe.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Hamza Mahfooz <someguy@effective-light.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 10:46:03PM +0100, Sven Schnelle wrote:
> Helge Deller <deller@gmx.de> writes:
> 
> > I may have missed some discussions, but I'm objecting against this patch:
> >
> > 	b3ec8cdf457e5 ("fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)")
> >
> > Can we please (partly) revert it and restore the scrolling behaviour,
> > where fbcon uses fb_copyarea() to copy the screen contents instead of
> > redrawing the whole screen?
> >
> > I'm fine with dropping the ypan-functionality.
> >
> > Maybe on fast new x86 boxes the performance difference isn't huge,
> > but for all old systems, or when emulated in qemu, this makes
> > a big difference.
> >
> > Helge
> 
> I second that. For most people, the framebuffer isn't important as
> they're mostly interested in getting to X11/wayland as fast as possible.
> But for systems like servers without X11 it's nice to have a fast
> console.

Fast console howto:
- shadow buffer in cached memory
- timer based upload of changed areas to the real framebuffer

This one is actually fast, instead of trying to use hw bltcopy and having
the most terrible fallback path if that's gone. Yes drm fbdev helpers has
this (but not enabled on most drivers because very, very few people care).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
