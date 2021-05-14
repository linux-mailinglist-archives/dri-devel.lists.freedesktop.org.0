Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C9380F1B
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 19:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F8B6F3D6;
	Fri, 14 May 2021 17:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964A86F3D6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 17:38:06 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r5so26934514lfr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eP2HKjmSPGQBFEyZcyYKZJWe+JMEKFqkR6pP/3cc9M=;
 b=JPqpxKZ6h3pPkH87PqOfka8i1IvLu5pzfn+4fmxzhXwXId5mvFlsZuxvc3IbwTgQ2+
 YAqCTph+MdHtowFy9sHdUp52ddR/WU1LlpaTEu7tOLf0Ng19sYa2m+RPBSfAz/RuGY7X
 d70/1XU+SVTEVIgb1aYeWNkl8HjlNXomO9/CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eP2HKjmSPGQBFEyZcyYKZJWe+JMEKFqkR6pP/3cc9M=;
 b=I8DoLOr6ao/pO/J60C89qN2JrLEAKb6jIy7UubCQKtnD/iFA46Y2PBNZWL93oqa95c
 RAiscpid8XTC2KGYJGrdhFMtgvswdpHahUP+vlhZ7BS6OUrLWaQVvPVr5ACbq3AiME+E
 Y8cRhGS77EFzQh0vlQIU82jjKOGbllhEwd21udDkK+9soOOvNgFM53KRX6IwkBQ3o7CC
 cusRAQ0yelCZGTOsYBbWE2DppuMTvdK2r+fdJ7EvQyk6mdKFT645W2SYz6ZH99JC7OlZ
 b22y6mZtpAJvqS0Fr8+/rBNT3HrAHqN/8TcZw8Jmb2b8Bv6LP1hAqU+YFKn5XXmZlt0D
 KKOw==
X-Gm-Message-State: AOAM533bxqAvhJ6TZtAG5n15tangdIZ65sITaE0wN5VegSCyn8L95NLQ
 nmujXlTn7gbWBY+iCMPOeYs8k6LJOGOftv9EE2M=
X-Google-Smtp-Source: ABdhPJzIcYKQj1260zM4ITo5/Svcpo9LI4m4SkCanxlMlSoAopt48wqPEzPALCgkHgfsKPTpVjdXEg==
X-Received: by 2002:ac2:4ed0:: with SMTP id p16mr22535863lfr.546.1621013884831; 
 Fri, 14 May 2021 10:38:04 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id 12sm1284061lju.41.2021.05.14.10.38.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:38:03 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id j10so44111914lfb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:38:03 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr32359155lfs.377.1621013883280; 
 Fri, 14 May 2021 10:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
In-Reply-To: <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 10:37:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whN=zrJ8BOLaGsJDH8d3sXLEoXA2DVsCq40OAUc1npOOw@mail.gmail.com>
Message-ID: <CAHk-=whN=zrJ8BOLaGsJDH8d3sXLEoXA2DVsCq40OAUc1npOOw@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 10:29 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So why not just say "that clearly already doesn't work, so make it
> explicitly not permitted"?

IOW, something like this would seem fairly simple and straightforward:

  diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
  index 01645e87b3d5..f24e627b7402 100644
  --- a/drivers/tty/vt/vt.c
  +++ b/drivers/tty/vt/vt.c
  @@ -1171,8 +1171,13 @@ static inline int resize_screen(struct
vc_data *vc, int width, int height,
          /* Resizes the resolution of the display adapater */
          int err = 0;

  -       if (vc->vc_mode != KD_GRAPHICS && vc->vc_sw->con_resize)
  +       if (vc->vc_sw->con_resize) {
  +               // If we have a resize function but are in KD_GRAPHICS mode,
  +               // we can't actually do a resize and need to error out.
  +               if (vc->vc_mode == KD_GRAPHICS)
  +                       return -EINVAL;
                  err = vc->vc_sw->con_resize(vc, width, height, user);
  +       }

          return err;
   }

not tested, but it looks ObviouslyCorrect(tm), and since we know the
old case didn't work right, it seems very safe to do.

           Linus
