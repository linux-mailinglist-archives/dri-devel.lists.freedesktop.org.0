Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20B061FF23
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561F10E40A;
	Mon,  7 Nov 2022 20:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D4110E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:07:06 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q21so6931412iod.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 12:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8hV5ZSh2seubDdRrNeUCchubOhAcqvi4PJAb4HdDdB0=;
 b=XFhq0Xs1jn9mlb/AMwxtrT0VkUmekAjemvzCWhPsc1Ud0+riFpyDUOqaiMwrJeA3Z6
 YwvXvpSGLpp5GbahQ7vv81j2ecpKUXWI0A0BSqH60uAjtpy68h6e/ejR+/LIKk93mcTa
 jO+VPdm7g7f7628BIvfrcFqI2yT5xKpz+qHCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8hV5ZSh2seubDdRrNeUCchubOhAcqvi4PJAb4HdDdB0=;
 b=MOvfFwHN5AF6TcAgxanRh2A0HqubVeRDhzPnIVi/FH+/P5J/Og/lQtmkjP7mzXCY/1
 6tz0j26/RBbJ6MAuV5dmqD+tfkTYypi/OX0fuw1aNgDy7f0h9PR4zzBdxYHNIueRmOKd
 ft8H6o1ziM1RTcDUU0dFnNf4zgAnZ1jazWpRf8iSF5tzPoc7vVlnSBpU8qcz8fzuCk8+
 nTKXBg5/IHO3KpAfRhviqVuLL96AQ9QZtCEG8CaL20JRA8J+EQfna9+BWhRa3Fkl7/3N
 gRe8/uoILiho4QAQ6WGg4vI82mqBIPOGH2wq6Xpjn1vUxoBrPhjLyzs2ZnqHAjTgdxaQ
 Jbxg==
X-Gm-Message-State: ACrzQf06GW5gutJtRiVS/q05Q11FBZlrDZUZZtH5VwktVmdPj4Grdr1v
 +2z03jxs7gUfSMiVrULF2Gw3KZAg3UjmlwYdp2D2cvobJUw=
X-Google-Smtp-Source: AMsMyM766uk95+uCyh+ZkJmMUM61FCimR1/A3TW5Hx+jV3LnaGnqApC2gedZ+O3jgliaPdRUfL3HL1UMwKMghdeC55E=
X-Received: by 2002:a05:6638:e8a:b0:374:f6c5:cff6 with SMTP id
 p10-20020a0566380e8a00b00374f6c5cff6mr31358868jas.187.1667851626098; Mon, 07
 Nov 2022 12:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20221027104406.549734-1-daniel.vetter@ffwll.ch>
 <87tu3n6cb2.fsf@meer.lwn.net>
In-Reply-To: <87tu3n6cb2.fsf@meer.lwn.net>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 7 Nov 2022 21:06:54 +0100
Message-ID: <CAKMK7uHXz7kteQ_sckTQx=E9cWSqGXS_Y0_pLjX2CRcApOvKRQ@mail.gmail.com>
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

On Fri, 28 Oct 2022 at 20:19, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Daniel Vetter <daniel.vetter@ffwll.ch> writes:
>
> > We love to nest our documenation for good structure, but that means
> > the table of contents needs to keep up or you can't navigate them.
> >
> > Realized this trying to find the drm property documentation, which
> > with some shuffling around disappeared. Why I didn't realize we can do
> > this earlier, no idea.
> >
> > Since the relevant parts of the toc are only loaded if you're in the
> > right .html file there's no harm in going all the way to unlimited.
> >
> > Note that this has no impact on the classic theme (which doesn't have
> > the sidebar) nor on the various :toctree: rendered inline in the
> > output.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > ---
> >  Documentation/conf.py | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > index 934727e23e0e..5dc141c66726 100644
> > --- a/Documentation/conf.py
> > +++ b/Documentation/conf.py
> > @@ -240,6 +240,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
> >                  # Add color-specific RTD normal mode
> >                  html_css_files.append('theme_rtd_colors.css')
> >
> > +        html_theme_options = {
> > +            'navigation_depth': -1,
> > +        }
> > +
> >      except ImportError:
> >          html_theme = 'classic'
>
> So this patch isn't against docs-next, and applies to the RTD theme,
> which is no longer the default.  I have no objection to it, but have you
> looked at how your docs come out with the alabaster theme?

[sorry took a bit longer to get back to this]

Hm looks pretty, but more in a print style than using it dynamically,
you can't really click through the sidebar toc at all to quickly find
something, and if you're wrong, navigate up a few levels again. It's
just the toc for exactly the local document, nothing else at all. rtd
theme always gives you the full toc all the way up, and if you have
epic patience could actually give you the full toc on every document
(but that's probably not a good idea for the kernel). Do you need me
to send the rebased version or can you smash this one in?

btw on today's linux-next the sphinx.rst page isn't updated with the
new default theme choice of alabaster. That seems to have been
forgotten.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
