Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1061EC56B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 01:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D846E225;
	Tue,  2 Jun 2020 23:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D596E225
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 23:04:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id x1so97839ejd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 16:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/hK2pkd+Z5BdN7BnkioQ9YwCnK+wEkzGRT8j006e30o=;
 b=ljd4Hsqvv4x5t7BIYVJ6FLNvaDXQrMEbry287T3fN6kYs67RvbQmTqSw/PVJRC5X68
 MHQ1pm5h7g+Q8RDXtS+4/NnhH58+Vo7o7Zc09S3z82/AS6bhP1iuVQ3u0bdgNFYdZBL9
 YcN0TmV4PUV+MrOXfu6gG1QjJSWvgZ0g+2C4HwCk1Uw3fNnNAqTZ9rLzzkSoEP1HoDsE
 Z6Fiq8W5XF1fWuHxqkGHBLZlYeT1FuCWdLZ5uM6y70IRTsucFmZLqRrx4G3PlBxOc4/R
 d8dC8L3t9sUkJ5WfNwNTCfgCNatEsCmRYz21Q9SDQnaxR+1hEKUQb+8rOgtLBo7KmOQE
 CVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/hK2pkd+Z5BdN7BnkioQ9YwCnK+wEkzGRT8j006e30o=;
 b=TsXTg2CGfc8JZ8FKboelRuNbg4liCVOAvEoCkyxxxJynV/7JQ/PdYIKimnkbO2jW7f
 XpczOjiYZmL5aY/UDDa7fuMXfevvIr5CGZwWpad8GAJdkGseV5xTMcCXnzbZxKNIJceH
 PEQwVN22mXPpoA5ymlb87K958EKO1c81afyJrChZFEPvSmWEAiFkiTWPDMvdnr2Lv3pJ
 GYCORMV6kt6bk9JT9CN7hhQBGwVh88oquceOygBepycQrcUf6tCtuRh+IUjvPsdfXj7u
 eK2Ig/WqQ7DrQPhUhdtOPbstDB9Iy5ybrHFDx+wxjSEkHk9CV49X8XAAzUgI4nu7N+QR
 zlMg==
X-Gm-Message-State: AOAM5301zmZn87Oj+I2vfDrPGFzQqyNnXHTjKO+U6DhgNMWpPTtupItD
 xEGPDInOVhLTywool6GgCaMVdo3UdY4ZFrDj6jU=
X-Google-Smtp-Source: ABdhPJzf3Hv7N6HXtJDyQa56Qx3EnDu/soSg6vJ5rPIOxB9nSWoyz7vRoutiNnKn/K9s3XdAsmFQcuHsZsK+kpjE4aU=
X-Received: by 2002:a17:906:a44:: with SMTP id
 x4mr15211068ejf.237.1591139045061; 
 Tue, 02 Jun 2020 16:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <CAHk-=winp5YQv7rFmUe2z=xYSuzF9t1mMt+_C_1iFwxjoqG6gw@mail.gmail.com>
In-Reply-To: <CAHk-=winp5YQv7rFmUe2z=xYSuzF9t1mMt+_C_1iFwxjoqG6gw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 Jun 2020 09:03:53 +1000
Message-ID: <CAPM=9txAkrg7KiJu4V32Gf4h04ku_Lez8dZFFG3u1JcTm-4Tmg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Jun 2020 at 08:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Jun 1, 2020 at 11:06 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > I've pushed a merged by me tree here, which I think gets them all
> > correct, but please let me know if you think different.
> > https://cgit.freedesktop.org/~airlied/linux/log/?h=drm-5.8-merged
>
> Ok, I get the same result, except my resolution to the simple encoder
> issue was slightly different. I removed the simple helper header
> include too as part of basically undoing the whole simple encoder
> conversion.

Yes sounds like my experience.

I spent time on the tides and it was a revert pretty much of the
commit in next, I just missed the header include line.

I also realised I'd likely mismerged earlier when fixing this up, I'm
going to have to put more time into merge fixing up, I'm still not
always happy with my methods of figuring out what the correct answer
is.

> But other than that we're identical, which is a good sign. Apparently
> the drm mis-merge in the middle got fixed up.

Cool, thanks for redoing it, since this was definitely one of the more
conflicty ones I've had in a while.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
