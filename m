Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2063E1B5AB7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 13:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2DC6E250;
	Thu, 23 Apr 2020 11:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63F66E250
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 11:46:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e20so5433598otk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=soBENWxtv1Jx6Q4M8NjC2VsgjFKXOfQejEBroBd8f4g=;
 b=NXx4YPgvtOlyiKjB650mQVqamk7mwKi2f5oD1cAMtY5EWRnaThyz0h+QPOfwI1jQ9w
 6Nx1NeQyKFKmVdgwiYV71tS6SUDsNJ+4BS5yWOt41z7u06V3K9qAR9zAsV0eciBZ82NB
 MVwTigSQtl3NWsR6OlpVgGl3p8JXDydOI5XDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=soBENWxtv1Jx6Q4M8NjC2VsgjFKXOfQejEBroBd8f4g=;
 b=L5hdnEZnH+3AR1PPmLffmKp1GJpApExj9iUoELmVY3muedyw4EPcwUBHgmwYFVjxJo
 lRmUhDYkEbPzvLqE4FyW/bs+/bUFN8k4wHWrZ1rmuSKvx/vVpRdRGNAJaLq41DN5Z2zd
 8cBlO2hg4ngn5PDGCBUwSA+cprlptbjUvcbOc/rVHNgd/BqOjQJRwjvisvnLsh/423w+
 yHEGT6Vk2Gr7c18M4PA9UT27HFrTNGA3yKhTOFpsTD9tPFJKSQrlGuL14iidQKwZ0usk
 RJp1vn7rSaVeeDweLfGmp6D8/QSH/lFfILvSXYBlsJ9wx6exfns4ix8evFbnP50U9a9j
 jmeg==
X-Gm-Message-State: AGi0Pua66lqd+qZceFgXO8Bw/QgFusMWcgLzyNb5ZIUGLO9mmZJVacfe
 GFzeH4HkUMJMwrryarRm5gyecStaLThBdm/OQQYGVBOe0lA=
X-Google-Smtp-Source: APiQypKhOGBw+yldUeb3d73cJTyCIRTooxDShKtfsXpDubxWoQUNatT4V7/wpGHO6fgRNhipZQ5IOE3srpPVZe4TbtA=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr3147281ota.281.1587642406180; 
 Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200420074115.23931-1-galpress@amazon.com>
 <20200420170059.5a42693e@lwn.net>
 <20200421123837.GZ3456981@phenom.ffwll.local>
 <20200421103236.4b64155c@lwn.net>
In-Reply-To: <20200421103236.4b64155c@lwn.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 23 Apr 2020 13:46:35 +0200
Message-ID: <CAKMK7uGTP93tbpsZhc1On2ka+YiVhwHk32cWHEdvS5O5DGODTg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
To: Jonathan Corbet <corbet@lwn.net>
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
Cc: "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 6:32 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 21 Apr 2020 14:38:37 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> > > On Mon, 20 Apr 2020 10:41:15 +0300
> > > Gal Pressman <galpress@amazon.com> wrote:
> > >
> > > > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > > >
> > > > Signed-off-by: Gal Pressman <galpress@amazon.com>
> > >
> > > Applied, thanks.
> >
> > Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
> > drm. And maybe I actually get around to doing the doc polish for all
> > things dma-buf that I've been promised to do since months :-)
>
> I actually looked for it in linux-next before applying, but didn't (and
> don't) see it there...?

I only spotted the patch after I've seen your notification, so it was
indeed not there back then. But now it should be there:

commit 776d58823a60c689816972b51100cb322a0834ce (HEAD ->
drm-misc-next, drm-misc/for-linux-next, drm-misc/drm-misc-next)
Author: Gal Pressman <galpress@amazon.com>
Date:   Mon Apr 20 10:41:15 2020 +0300

    dma-buf: Couple of documentation typo fixes

drm-misc/for-linux-next is included in linux-next (we have some
special branches for linux-next because of some different rules than
usual for our committers). Latest linux-next also seems to have it by
now.
-Daniel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
