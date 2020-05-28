Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31391E5694
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 07:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A2D6E044;
	Thu, 28 May 2020 05:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB616E044;
 Thu, 28 May 2020 05:37:05 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id o15so9301565ejm.12;
 Wed, 27 May 2020 22:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gy40l8ytYFD4On3jgRuXuVgXsORjyYNKkP1fvl5BPX0=;
 b=vWo864aurC3+M/TSNk+TthFtkQQX7o1qOe+6xoraeNLnBopLzJ+cKiNE9ze2TczG4A
 apWyilBlgzHifms1ZTkgrkWquMTTFnicFuQj8WvbFCPUTiFFCnCrt+2MQpOY9TEQ/GtE
 tWwMFlYSdq20cIKnO45SgFSiS316pCt0NZhT1LVoUsOrD7dNSc/QTpaQLXc5ZqXl81OI
 dEd76mirnI/VA4NAvDYULb0mSfQ48A74hJ9dv1t3bQZisfpvfIFExUEaOwcHCnfGzcqF
 /8eUgfVNyWcDB1FXKHS8vjYUgjmNPKqFHWHnkdEMsNFq0Z1ao1txQmdO/utYhgaUEYu/
 9UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gy40l8ytYFD4On3jgRuXuVgXsORjyYNKkP1fvl5BPX0=;
 b=S2U3QSSRaBjSGLFLlHy1CoRwPjbaXDaQsj/6M26hpZekmSAekPFrryyThIBzDJVvp4
 jHiUwQga1POGL2W9/9iOGJXjMyt0oQrHyKIcbXh0D7aQxN61Kw7EXwo6kjburqeTO2CO
 4QK3EB2vo+D0WdVh9I0JRVDDKuqBTeZhpN1IVPj/9gw0AXd9odI774BZHS8q3aZVj+Ky
 o453U9SIN/RXHVK2KZlk2G/BkaZ6s3hzJCYk/4eqDBfz9jELvWlJG23ZT3cVCnDIvRD6
 JyepfRK0BA3tApWvk65YQ+53rZmgOyCO/cqgFwlFaZW3npjdUDMhJ8LDDInLVHYWi2EI
 t7sg==
X-Gm-Message-State: AOAM532ZY1DNXMXyTqr8cjEECYEKRylPGjOXbUu6QNbq6e7EaPzzgV3a
 3UEQdNmp/EDIq+6QJMe87MPbeYiz/OWzmPbuxp4=
X-Google-Smtp-Source: ABdhPJyX6LHyIsUbfRxySNpFhUlOfjIe8odA5lY+ulB8QAePBB1iqSkzOITEmqNMBTGJ6Z5OnJTvXRT1ZsFQGxUMdWI=
X-Received: by 2002:a17:906:57c5:: with SMTP id
 u5mr1409803ejr.419.1590644223757; 
 Wed, 27 May 2020 22:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134254.854672-1-arnd@arndb.de>
 <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
 <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
In-Reply-To: <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 May 2020 15:36:52 +1000
Message-ID: <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 May 2020 at 00:36, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Isn't this already fixed by
> >
> > https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403
>
> Ok, I see that fixes the link error, but I when I created my fix, that did
> not seem like the correct solution because it reverts part of the original
> patch without reverting the rest of it. Unfortunately there was no
> changelog text in the first patch to explain why this is safe.

No it doesn't, I think you missed the pci in API name.

The initial behaviour doesn't use the pci version of the API, the
replacement did, and the fix used the drm wrapper around the pci one.

So this patch isn't necessary now that I've fixed it the other way,

Thanks,
Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
