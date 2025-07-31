Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2CB16B3C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EAC10E6F3;
	Thu, 31 Jul 2025 04:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTzfOyaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48B10E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:33:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-61564c06e0dso626564a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753936386; x=1754541186; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3JSKm0nEKJAPwalaqeATZOhehjz4nhElR0L2lw2f1iM=;
 b=KTzfOyaU88NFqvvgHI1mmwydUvQqWIqDu0SbSJ7MvkJ+m+WrMoo/1gmO7atXPAVREI
 z49zd3GBMrJmPjEumai9PVNZFZ4zBTBQCzIDWUGd17wYnAjs9B4U4Brv6i91NO0Wes/O
 rxvITRh6FGkUX9JSrqTqplKhxgw5nETOoAq7aM94JO/2PK0VGHDs/iqTBNO4U98CH9xe
 h1UdWV1aTUFtBmzn2kXd5Dw3LoRg9kCZ0aaXOzJiBjklAlys1dSokVCkQnTFzJYwEwV+
 VQ5TXpz9hVkVZhGDiD928qG5RObbPTUtHfRNvTUNJXVG/cFyNxsHnyKk5FhnDOUJVGEE
 Vvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753936386; x=1754541186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3JSKm0nEKJAPwalaqeATZOhehjz4nhElR0L2lw2f1iM=;
 b=FZE2usVKwoTjgKisHpd8cGk2hY3gi6ta6IEDT0ES7ria19jbe0di+K5FeZ0pM2I5Zn
 0jX0jSCJDoceAdMPqfKvZio9a7K5zw30UpNOc8llHosZz8vQ1eIYXr3BcFuERm9mLnvZ
 SbQ5o4m7D3YzX99T0wX/buTRJlzkmqAiAG5kIRKae2ZtvB9aUEMvBVG0fR0brlzVmH8z
 0Wlf/uEDfrlahJTkXLOmtqT0/nF/pfN7sP03NBjgg0oxAjljyUod4I+QQGzEUNkxv3ET
 G8JMNfRuAKFE4Pk7HSi+XPj5kq2ggiby3NUZtQad100J0LXVcLopBfG31DOiy5FMQ8kg
 1r2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4s+Rppwwo0XFtLo8TqB6+VDaqvivuoaWi8lt9WTEyk7dIMApC0mZyirXzN2ACqN0tgjFWTm4pPqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMdlk2wZOkoOfcE5tBkxNcIjrELpw0SO39DUJzsm8HdzhY8//7
 TXetz599RGWp/MhuXiPcgjk5yZBSHqHzLntw8c9h/U04pz66v/3sY77srRJI1mFYQRWGOigQ0ax
 hZBFqXHjS5lvZ1eiD+kNu7WrTFSiS0v0=
X-Gm-Gg: ASbGncsVElmo0WKZ+Qkhhsj6cnqaUileOCy4kleheW6yRwmYkMpxT3sgQSyUkvFeWNh
 Y13J3n9wSaYedgy/x4jnQUXp4ykMgyGj9YMKkPqBKoZ3zhTw5rhTWfBKwIvJTo9Bz82AqCsAruy
 utG/1F70EPosijM2D2LU+XU1yP64Pesn2c3UVTLXckWLqVuxZ0zhLAcWAsFAUdjG0X15uiZcstz
 gbrDQ==
X-Google-Smtp-Source: AGHT+IFR294yFMaR7jpG795FUdiCyJUFOSMzzfyfSWWRkIQbJmZBB1Npd/gZaUqeCtoQlf4i7AudhewhVV5fIXbIyWA=
X-Received: by 2002:a17:907:d7cb:b0:af2:42e8:ad92 with SMTP id
 a640c23a62f3a-af8fdabab00mr688262466b.61.1753936385865; Wed, 30 Jul 2025
 21:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
In-Reply-To: <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 31 Jul 2025 14:32:54 +1000
X-Gm-Features: Ac12FXxApAHcU8vrdpewkW56zUfDSRJSjiaR2iaLbGXiegB6RNJj9CqjC3-xjDU
Message-ID: <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Jul 2025 at 14:27, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Jul 2025 at 21:21, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Okay I don't have an rx580, but I have an rx480 which is pretty close,
> > but it is booting fine with your tree at least, DP and HDMI connected,
> > so it's not widespread AMD breakage, anything in journalctl/dmesg?
>
> The machine doesn't come up far enough to mount a filesystem - my
> disks are all encrypted, I never even get to the "type your password"
> thing.
>
> So no logs.
>
> The good news is that it's bisecting without any ambiguity. So nowhere
> near as painful as last merge window.
>

You can boot with modprobe.blacklist=amdgpu and then modprobe amdgpu
once it boots and see if dmesg

But hopefully bisect lands somewhere good,

Just seeing if there's been any NULL ptrs on old GPU reported.

Dave.
