Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4DE3819F5
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 18:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225E76E41B;
	Sat, 15 May 2021 16:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ECF6E41B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:48:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id w3so2996362ejc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKkVD1Qtnhdv59KfIngIIRAgpMVGtUMoAaJE9aWcwDg=;
 b=ZTy8QEEoSvjvmpGGdABqj29z7ZcuL0IRQ9UBKh89fhMz+j8cPVNUeZBKE8yaOCqkMJ
 kXzjCIiBF/NlemQsWsYyOaATN469b44wJYerSUSZFnkQiC4aQLy7om0FmX9cUarP4FxA
 D1eo9OLAbDq5eCqiokMYbyAbQahObMHCCCKQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKkVD1Qtnhdv59KfIngIIRAgpMVGtUMoAaJE9aWcwDg=;
 b=DS5Qjet2aDiIjFmffVTDDt7EWIewy3Oo0VpjRhquyC4rbeYiRAfbBb4wW9P9U2Fjd3
 77C7+AHMy5Jvtr8R6aGlXl1fNJcCrMyvMsIb+VJlxdxf/+JLh5xlX3Z5XxmEsN69PrVb
 YL0J46EP+Xw1NyOiCAqrTKx5Rc2yCCDEGbmcT4KETTOR6b6lewhMD3z/5Yi2NeypeOyg
 DYrOrqucDIjJzYjLLu7UR1JBSsx29BszLdvzb61r1qpoRP+pT/2NqrmJo0a20UQwl2/a
 vHe+Tb561HyYHyzXZvgPxLfP97+CenoxpS9tBtavpYTIRBFO720fn6WJIE2x3691ztqq
 NWDA==
X-Gm-Message-State: AOAM533YLZh+2u7ZF5d1AtS60VZ6c5QkalnEzavIhjYFDjTv1NuNP9Jv
 ESboiiNJD92kpwV6NOecje7xEDv7gbxs9ctURfc=
X-Google-Smtp-Source: ABdhPJz3cHXxbHCQjbZYrrfCBo4La2lvWKnyutNALnBw8j7jEyQCRkw1FTN0hoQKiJ9urkwu73T4EQ==
X-Received: by 2002:a17:906:b315:: with SMTP id
 n21mr53457822ejz.219.1621097329463; 
 Sat, 15 May 2021 09:48:49 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53])
 by smtp.gmail.com with ESMTPSA id t20sm5636478ejc.61.2021.05.15.09.48.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:48:49 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id u21so2928299ejo.13
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 09:48:49 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr35147289lfs.377.1621096929091; 
 Sat, 15 May 2021 09:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
 <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
 <97f1d292-c3a8-f4d6-0651-b4f5571ecb72@i-love.sakura.ne.jp>
 <alpine.DEB.2.21.2105151815040.3032@angie.orcam.me.uk>
 <alpine.DEB.2.21.2105151828380.3032@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2105151828380.3032@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 15 May 2021 09:41:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgz-iC97f0cnawKZc_S4-0ZEOdOx43J7pVX6b=AqYUhfg@mail.gmail.com>
Message-ID: <CAHk-=wgz-iC97f0cnawKZc_S4-0ZEOdOx43J7pVX6b=AqYUhfg@mail.gmail.com>
Subject: Re: [PATCH v2] tty: vt: always invoke vc->vc_sw->con_resize callback
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Colin King <colin.king@canonical.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 15, 2021 at 9:33 AM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  NB I suggest that you request your change to be backported, i.e. post v3
> with:
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org # v2.6.12+

I've applied it to my tree, but let's wait to see that it doesn't
cause any issues before notifying the stable people.

               Linus
