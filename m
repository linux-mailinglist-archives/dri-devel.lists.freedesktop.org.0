Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BC12FD54
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 20:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219789F49;
	Fri,  3 Jan 2020 19:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084B86E33A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 19:58:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t17so42516320eds.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 11:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lElfBd/8jigO1KSCmDplgs5SeL89T17ANPHJDCQ3IOA=;
 b=Coe0w+paNOOQSNE3/OF7/NyZkbuDuTiyGJaCeDoUv+GeyzNQPhIm58cgy9bk+qZHj1
 oCnaRvLbS8kQ8y11xuOpVuaRY1+GBhFZ/cbtR3/VoLOh2Crv53tN7lc2yPjkWM3htBs4
 3sf4oPhGAsdw37jeFw0b1YHfxilF8wK2I/0ZFqA7ZH3lz2VBVtYolZGnGJU3OoRmqP8o
 4g5tpxdV5+amASC8oDIvLB8BPaIXsTEsUG0yZj2es4AUz5Xyo1qDHG+HUBFaeQPJoae5
 9K83e5zWYJAbiWkX3DbbmmTWKiFznYDlfF6zx8MnrIBPXPeKM2j8Rx3PPX6SGihtBApN
 E1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lElfBd/8jigO1KSCmDplgs5SeL89T17ANPHJDCQ3IOA=;
 b=EaM5a0YOGwuHj7ALjj1xIhmRMJN/kEGu9j9A5qTeM18dhhdTvqrQrqX9nBZ0GwbF/Y
 6ZlFn3Ld/KU2Vz/c2ZxUQMC366xtN2VolBL7ZoN328M/5vecNTahOeAZYgWZvMqSdP0i
 BocGUzfSqLkYcUDkX9qkW9gEhpxtYoGnx4uckqmXPmDS/1q9GffACE8orW5XQkzgW8q5
 ZzI1xxSqDHlH/ks3BBM5RE7hTSGFnN52NTluK5EJKFE4eYFWONOKJOhyKzqMMk4cA02U
 9p1xhdvOa/DNkyUUIMVKLG/0BGTtbePtb7b0uuak97q9DG2t8x6prm6PO5cInhZjQeLg
 6Y2g==
X-Gm-Message-State: APjAAAX5k+D7vJV1UVk09BM9O3R9TcdAlHOkQyBcxK/6g9wyqWM3iP1K
 S1HQMQHUVdFMEOxuUW312vi7pMFbON7eFgEXtr8=
X-Google-Smtp-Source: APXvYqyugADp3hO7h03oK2DaaWliYETiOggFR6uHjCw4XYSOsGVANeWDg8mecDKvovZmnz2SYVwWs6I2LeUmZU+WXP0=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr94729576eds.163.1578081498516; 
 Fri, 03 Jan 2020 11:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20200103183025.569201-1-robdclark@gmail.com>
 <20200103183025.569201-2-robdclark@gmail.com>
 <20200103193135.GA21515@ravnborg.org>
 <CAF6AEGtdFA7XzSq3w3N6_TRLWQY+zumU2mahbsPY=pc0r_x6fw@mail.gmail.com>
 <20200103195406.GA22623@ravnborg.org>
In-Reply-To: <20200103195406.GA22623@ravnborg.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2020 11:58:07 -0800
Message-ID: <CAF6AEGvCNK8fQW3JvXk63ecpTU7Q-ixf4yJsYQyxwiV-4SUf0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 11:54 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> > > Please fix and resend.
> > >
> > > I am in general holding back on patches to panel-simple.
> > > I hope we can reach a decision for the way forward with the bindings
> > > files sometimes next week.
> >
> > I've fixed the sort-order and the couple things you've pointed out in
> > the bindings.  Not sure if you want me to resend immediately or
> > hang-tight until the bindings discussion is resolved?
> Could we give it until Wednesday - if we do not resolve the
> binding discussion I will process panel patches in the weekend or maybe
> a day before.


sounds good

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
