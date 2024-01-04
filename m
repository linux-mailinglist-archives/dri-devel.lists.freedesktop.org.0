Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286108249E0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E74F10E530;
	Thu,  4 Jan 2024 20:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BCB10E530
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 20:57:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a28b1095064so113788866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 12:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704401847; x=1705006647; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vvXcTwEAZALu1hwQZOSPIUmEbe0txJKdEjQHOPyvDLw=;
 b=g0ogZJ/97BQ0JAC5hR1b5+VGiwViG3KvlpXa6vwrE2NBQ7tTVDWB+SPrDKLG/Zxvc5
 Cq75S6ZQ08LV74bwbUpuZv6yzKqyak7V9Fl6lbbI5QorT/gBersIVxAccxPLVMlAwC+d
 Azpw4+Ie/APpxZZVFzn94ibTqwDSChBCi4+N1HwMZ0c+/Koo8IK9MoxE8NxBJIp3q+f+
 MFq0K0pQKYgAAKXhVt5Hx5Zev/tNRM1gAS/2noiT2nbbgl4wA22DvQ9lZ1iu3/n6SnpL
 l01/syy/brHrL4A73OwmJwjz4b1thwRR1AsTDaW69MXg6NimVFQGDGQsGijJwYVc2l3J
 kOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704401847; x=1705006647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vvXcTwEAZALu1hwQZOSPIUmEbe0txJKdEjQHOPyvDLw=;
 b=kxVwBTdME4FQhZf14tvAC/ZQcldphf4DO5aZB9C9OEWxNDiqH5FXojHK0RyngJdGIC
 rXiw941gj1K0PGvZTpfj9B0DISN7nPzisMVKVyGexEIONJ2EdqmWl3/Au3breXGU0E7E
 cCfoxL7fqQ6a2JbQ9OXNhqhxkkFp1Ek2cG//A/etqNE+za7WHR4OdoyLurL7B2VHmWjq
 V0czLhzghbYLYNp1t/lOvzhDUaxaLPkOgDv1k7qHPgPVh2YUoYFNRq2WINnzVT+UrK3v
 DCBRs2TAHV6rNpAwM9Yxj1Mqht4rv1x909r6ycp3w/tbX86XDrOC9umDkvM+DdgGzpWe
 2LWQ==
X-Gm-Message-State: AOJu0YwyNKz1ClgLNZNH9LqrgbqKJO5Im1wyjw0xRdrjK0IjsSxcNCYN
 y31etv+6M0xSJhvEPVzjyGVqcJylHTSujBm/8Q4=
X-Google-Smtp-Source: AGHT+IGAdzQYZjuJzmE6y+1Bb22WF9EcRTCKzvT270yYTRlDJusTttSykGloMI1CdsWcopfxh7pRhn6DBbsNtNP1Se0=
X-Received: by 2002:a17:906:c28c:b0:a27:a34e:bcd with SMTP id
 r12-20020a170906c28c00b00a27a34e0bcdmr225146ejz.157.1704401846524; Thu, 04
 Jan 2024 12:57:26 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
 <CAHk-=wg26tNyaOE5jAcEg1t_zK37mHXqJN9nzmYDA3dN_WO5kw@mail.gmail.com>
In-Reply-To: <CAHk-=wg26tNyaOE5jAcEg1t_zK37mHXqJN9nzmYDA3dN_WO5kw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Jan 2024 06:57:14 +1000
Message-ID: <CAPM=9tyMgtWxXHnJGOpxtbkq5rGwUzovxwcJADrowwrwvkUoww@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.8
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Jan 2024 at 04:50, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 3 Jan 2024 at 18:30, Dave Airlie <airlied@gmail.com> wrote:
> >
> > These were from over the holiday period, mainly i915, a couple of
> > qaic, bridge and an mgag200.
> >
> > I have a set of nouveau fixes that I'll send after this, that might be
> > too rich for you at this point.
> >
> > I expect there might also be some more regular fixes before 6.8, but
> > they should be minor.
>
> I'm assuming you're just confused about the numbering, and meant 6.7
> here and in the subject line.
>
> This seems to be too small of a pull to be an early pull request for
> the 6.8 merge window.

Indeed this is for 6.7 holiday brain hasn't lifted yet, sorry for noise.

Dave.
