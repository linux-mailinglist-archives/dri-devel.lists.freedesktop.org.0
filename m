Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829C5B16B24
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2AC10E248;
	Thu, 31 Jul 2025 04:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W7qs5nv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3DF10E248
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:21:28 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-61539e2065dso2658176a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753935687; x=1754540487; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9BJQuIYAIutl68a1U+8y+EA6p+nEfqHCPz7d3Cp+oAo=;
 b=W7qs5nv9IVBJr1PzepF+QdAtKap1WhLdgnw82bISzwURZhWuc6WhKIx50swe5oBhVo
 NX5YWqgZOhYta8XBSlrt1AdEyU9y4uuBxZs3jNUAf6fASvQzwTN8vojWT+VOvs8mxA20
 nb4HQ5Ta0ofdKtZIKck6lvlNDuFnUUBzHaO+NNSgglCe6iUCR1RJ+Awe814q1bhfkaxS
 kSXFOCBxt5y7/hd6xJPTRCXDGO9H0XtJ9b8tIDjydCmbQQOJ7W/Gt3IWGHYWDOnUFwZO
 s7ZuGMrLrQuwsrvm8cVgGXuWx9v0BzB6KP9uCZrtQzn2qUkNYkaaXk5e3+Tu5tRZ0Zfn
 qVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753935687; x=1754540487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9BJQuIYAIutl68a1U+8y+EA6p+nEfqHCPz7d3Cp+oAo=;
 b=CWmalzz0wfD3T4mAkW5CZkhQlD/BQh8UgS/9GOMW4vF4jfl2qhbH0Du3sXe5qr9nxa
 y0MGxULDJgwWtRw2vFDmZRCeDIaW6Jr7OpNWPY17LAhq7d2/dSdrQjc+pDVlVcD2uQbR
 FInOifjipCMyilL4EulU8xxz2aEnAV2p+LSLfDmcQ5onQk9BjmGV9CcE70sLTUGZFp+w
 vTtca6fwQZMM72/8j2uYz5bKByISW+sa69EuI0ix6jURLTuKPKRjy8XfeHR9qLlyp8jW
 f+FjC1q9KNp4soSMitSxN8LqinR0fhee/G1oIC5XHv8BLxHaQPZQ4fBEeHfTccUP8ZSH
 lAZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPynXeZwg1mstaf0tAC3fWwvNccEn4lChPlfVXGw1l7/WaSAZh+4LplP/QKS8yQcQDQZprCGmh/1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx6FFQeE6CVacYKU/Fw0LsySoye7KtjwexoV4OFNWUHZY3jE2X
 jI+Elb01MswP29tdIvLBS9e0ptDU21Ypk3p9tgMSw/Y/XV4UZXPo/JSdSWlVKMkQHcoVih7ubn4
 8LUlzTB6Reu3rskMQBXufHWZDJO+44/nNvg==
X-Gm-Gg: ASbGncslqeKhbEl0IzBXZ2u+GPgGDNnDyuc6Mnw791CQh8ADFkjzSiyji6Ca6aE36Pf
 0BwkyEYt72o3ltMfBl/5TZhNMHTEp8XMjQ34hx/ADmSFJS7GtpQx5ZGbKFJabbNqo3lohuLNycx
 vJJsm1rKdKP5eS6/OeHu5hdghR4YoJdpJrs8G5CQhkXLr7370FqhgIu1nR9KcFaZPMBnAb1C7mT
 hAbog==
X-Google-Smtp-Source: AGHT+IFsRIvPieDFYT641UvwL7THmLq5MSMZmAr0zOT6DiN0hmQqflFpA5SmiQmhMpOU4K4VJnJuubD9eFMLOnwZw9I=
X-Received: by 2002:a17:907:9809:b0:af1:4c23:c8c8 with SMTP id
 a640c23a62f3a-af91bd8c916mr72969166b.12.1753935687125; Wed, 30 Jul 2025
 21:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
In-Reply-To: <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 31 Jul 2025 14:21:14 +1000
X-Gm-Features: Ac12FXzNGe35UR-PT7t462E6zfwe3SyrAqAV_g_rnM4vwCxBuRx39FIJ9Sr-fqg
Message-ID: <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
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

On Thu, 31 Jul 2025 at 14:03, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Jul 2025 at 20:40, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'm very unhappy with the end result, because it just results in a
> > black screen at boot for me. No signal.
>
> It's not something in the merge, and it's not something in my tree - I
> see the same plain "just a black screen" if I try that commit
> 711fa2667d8b that is the top of your tree that I pulled.
>
> I've started bisecting to at least narrow it down a bit.

Okay I don't have an rx580, but I have an rx480 which is pretty close,
but it is booting fine with your tree at least, DP and HDMI connected,
so it's not widespread AMD breakage, anything in journalctl/dmesg?

Dave.
