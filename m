Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108D5620FAB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3110E291;
	Tue,  8 Nov 2022 11:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF36C8989C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 11:59:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e189so11254519iof.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 03:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CXsk1mCcDSCxO8pZyOxPVPpi8Y+w18c1q2hqTt7a5PE=;
 b=WIpcMn/mwq0TzQFxTxKZt3DD2TtjK3CkAqgjRCkGCIfFkWecUeRQ5Iyv4BNNfpp/KS
 RIDQgo7f/xiAsG5wtV2nSeEQ3RYI6fv6k4Ju0dKGhl7W+IA3ZutcczXbL65E7kwFI7AK
 5yTh32v5DWwGsGdv1MPlmV/YLv3D1I5Bpp7p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXsk1mCcDSCxO8pZyOxPVPpi8Y+w18c1q2hqTt7a5PE=;
 b=bICFIvI7WX87D6xfoANWwA7ntuOsM2OSErbDizl1H1VMq0VOaKy3Q8OXkQ0rP13u4V
 NSxau+ATEFpqXd6J9wJ8HIxpCu44mr7ZJR/ONqXLPrzSyHFqItmxaawRJ6YHVE0YQaqA
 CHPAKbvFU4WVOLRjxlnfN9WzxhoylFar/xEjD7lw47/p6+rVqWdrAW22KLKLFdrLh5Wj
 2wbMVAk0LOMINJwiyLD7IWg/PK6Ef+YbggWRFOilgup/8nM1YxxXWiWdan5i6nE/eae5
 YQEN9f+pQOkOkmRq/LEe9Nig/leZiM1PAhWCXGTUg50YFyg4c38e0r+eaGP0w2hhvSbk
 LgGQ==
X-Gm-Message-State: ACrzQf2Wk2btU/9rtVTCVrEVFR4w1xbbtpCKtx7aOf8ShBKnJZe9TRkq
 dXg8vlnIa7P1omyppW9LyQWpsLGLDoE8ArIYs+84KQ==
X-Google-Smtp-Source: AMsMyM49MEe3AzoIi+i4+4PvEOiz9LC0kpaCPJ2sRyWMyS+fkN3Tjxe5zRXlxuOemyOSM1zOTozUqYa/WYkaU33SrHA=
X-Received: by 2002:a6b:b882:0:b0:6b7:56c3:b602 with SMTP id
 i124-20020a6bb882000000b006b756c3b602mr32443363iof.5.1667908791200; Tue, 08
 Nov 2022 03:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20221027104406.549734-1-daniel.vetter@ffwll.ch>
 <87tu3n6cb2.fsf@meer.lwn.net>
 <CAKMK7uHXz7kteQ_sckTQx=E9cWSqGXS_Y0_pLjX2CRcApOvKRQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHXz7kteQ_sckTQx=E9cWSqGXS_Y0_pLjX2CRcApOvKRQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 8 Nov 2022 12:59:39 +0100
Message-ID: <CAKMK7uF7riJszvbVNA2PGAxndVkA-TmzBx0uVVfYZ4L_BLaEgA@mail.gmail.com>
Subject: Re: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
To: Jonathan Corbet <corbet@lwn.net>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Nov 2022 at 21:06, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, 28 Oct 2022 at 20:19, Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > Daniel Vetter <daniel.vetter@ffwll.ch> writes:
> >
> > > We love to nest our documenation for good structure, but that means
> > > the table of contents needs to keep up or you can't navigate them.
> > >
> > > Realized this trying to find the drm property documentation, which
> > > with some shuffling around disappeared. Why I didn't realize we can do
> > > this earlier, no idea.
> > >
> > > Since the relevant parts of the toc are only loaded if you're in the
> > > right .html file there's no harm in going all the way to unlimited.
> > >
> > > Note that this has no impact on the classic theme (which doesn't have
> > > the sidebar) nor on the various :toctree: rendered inline in the
> > > output.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: linux-doc@vger.kernel.org
> > > ---
> > >  Documentation/conf.py | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > > index 934727e23e0e..5dc141c66726 100644
> > > --- a/Documentation/conf.py
> > > +++ b/Documentation/conf.py
> > > @@ -240,6 +240,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
> > >                  # Add color-specific RTD normal mode
> > >                  html_css_files.append('theme_rtd_colors.css')
> > >
> > > +        html_theme_options = {
> > > +            'navigation_depth': -1,
> > > +        }
> > > +
> > >      except ImportError:
> > >          html_theme = 'classic'
> >
> > So this patch isn't against docs-next, and applies to the RTD theme,
> > which is no longer the default.  I have no objection to it, but have you
> > looked at how your docs come out with the alabaster theme?
>
> [sorry took a bit longer to get back to this]
>
> Hm looks pretty, but more in a print style than using it dynamically,
> you can't really click through the sidebar toc at all to quickly find
> something, and if you're wrong, navigate up a few levels again. It's
> just the toc for exactly the local document, nothing else at all. rtd
> theme always gives you the full toc all the way up, and if you have
> epic patience could actually give you the full toc on every document
> (but that's probably not a good idea for the kernel). Do you need me
> to send the rebased version or can you smash this one in?
>
> btw on today's linux-next the sphinx.rst page isn't updated with the
> new default theme choice of alabaster. That seems to have been
> forgotten.

Sorry got confused on this and looked at the wrong tab/build output
locally, it's good. Anyway I sent out a rebased version of the rtd
patch, I do like that sidebar a lot more for navigating the docs :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
