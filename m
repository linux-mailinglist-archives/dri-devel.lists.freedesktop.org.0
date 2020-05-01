Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBF1C1340
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 15:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9F46ECA5;
	Fri,  1 May 2020 13:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800136EC9B;
 Fri,  1 May 2020 13:31:00 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id g129so2676081vkh.9;
 Fri, 01 May 2020 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZ7QyG2hsna1y/z+nQV4Eu9dHzqx+15AW1Ph689mvrM=;
 b=IBJcSbC76fYkGeqt+vGjs0/H9b7Dg5SWRHQ999pEQJ1u173hJgwLapyFbENmBIMTcd
 ZXVeYdvfpyhIbwtIAiRTWgyQVP7XjpQ0qR7AVlhMt+6NF7Gm6rNvRz0a2cL2/10fa3y3
 pyyhQ9F4k4cVPXkegJ9K/U/eAT5gUZ3LgKx+iWPnVDqublkUzjlYBD+bVZEBGOzAHIl7
 THGNj0kYZhfxayVjgM389/MCMO4ASYU1UxfVPCBfC8cA6l4eCjWrTw1rUm+1T6efRjMv
 0c9zHwpybqft84ycfGsBZ7xiOQNQyo1Pd6QVKwswKjqYAF5WbdYTIA0U4ZV3RlHBBJVa
 9JAQ==
X-Gm-Message-State: AGi0Puajii8mzlH1wUysZaWXx+jxyxQbBBhOKU16rLa/LRPG4hKtLini
 i20pkajvELeCBu4/t1BVROnrBzG/l0GhTvPfKtU=
X-Google-Smtp-Source: APiQypLUzCKdKX2Ff0GAXLqJ9GShRDU4GFVmNwrGhfcJ1DIfhH3Mt04Y2LEgmNR4vlW2vVf7TWTB94yI9ZDGLFe7nlo=
X-Received: by 2002:a1f:cd06:: with SMTP id d6mr2515722vkg.94.1588339859596;
 Fri, 01 May 2020 06:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <1588278413-21682-1-git-send-email-jrdr.linux@gmail.com>
 <CAKb7UvhNzfJLS8--5LySAjyzH2bidfZbP7VgzEVfeV2Erva4YQ@mail.gmail.com>
 <CAFqt6zaRjjJYo3RWjjug4GJFZH7CT=6c0kRf=UjtH3_MeQa5Ew@mail.gmail.com>
In-Reply-To: <CAFqt6zaRjjJYo3RWjjug4GJFZH7CT=6c0kRf=UjtH3_MeQa5Ew@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 May 2020 09:30:47 -0400
Message-ID: <CAKb7Uvhr3ViZBZ0knMYXqbaJsb09Pp-meCR5XRZ=rWWk8KnkhA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv04: Remove dead code
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: inux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 9:15 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Fri, May 1, 2020 at 2:21 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Interesting. I do remember seeing some snow on NV5's overlay at high
> > resolutions. Wonder if it was because of this missing code...
>
> What was the problem ? Does enabling this dead code will fix the problem ?

This "dead" code is essentially documentation. It's from the
xf86-video-nv driver which was the base of the dispnv04 code. It won't
compile as-is, which is why it's #if 0'd out.

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
