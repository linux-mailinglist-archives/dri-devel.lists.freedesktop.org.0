Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A2B16AF7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DBE10E469;
	Thu, 31 Jul 2025 03:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L1Yc25Iu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EC10E469
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:49:30 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so712741a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753933768; x=1754538568;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O4eEVtAEJDb2ctLJ++Vqx913Dg03dcfMbig7xRZPFfM=;
 b=L1Yc25Iuhn+qxLf6kLhpp67oZrwwW1AXJcL0nYWmowOK2eXCCrYh6J0wQSukqlyzGs
 7nXZ1uACDFoFSX9f9Mm6FXCzu9DB/SSE31Ki/ZUequYxFnQaYUmerV2HpMjSdSFsHsdi
 5DKSTWXvj4qf3sPStsM3w19SILKJpU/363gN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753933768; x=1754538568;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O4eEVtAEJDb2ctLJ++Vqx913Dg03dcfMbig7xRZPFfM=;
 b=FDcIx5+lvQ3APifT/BcYWpT648W8b2yabl58CzPmfL0O3f6DBZIcPzHVyc3MAbQIVo
 mqMP3I5JxrUtJkFHXuPYP5F05YRD+6BjuOjLwcV5K2p7MzURdpe+iSLTQcpU0hUUgpS8
 nsXAjXrjAUpSgwqCtIN9hFhajkRjMo6BCtRkBpHJeJLW2FPz9JOR4FOkVhfkjebKcH31
 BNxfryIhhBH1ODeDnURczx8q+9Vt6vbU0VEbsTuvGigwtV67GKuv9xIcpZMRJ8pF1QgH
 N07jEJYf4RBDT9RHyvzuobOBGvMkAh95272YkLR+edprFN8HJMzYtsdJWK6ldSrf4K5Q
 pGgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS+TgJc6Rj0F0UGUMj3qbyVC1N4pLkQ+XAGN13Y1fH7ndZjqVL21TBfUJ0NxOVFq6Ojbd+eWeJSdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMpFotUsvVCV5qlgz+w43XCNZ3N+Byw2IOMgy+DFzAVsYnLHHI
 jIUF+x1mW5lWQ84odKeBLta9/NOKH1hORL22j1ZQ9JaJUXtFbWaFt3WKca5XxXpPA929apwSEGo
 QTQH0gTo=
X-Gm-Gg: ASbGncsBin7h10QOlR5Y8KGjJUxQLN/48u0+PKZRppGSNYB0dI6/yY1VUGRwu1A9PE3
 CNn4Y7ja379cwHv1XKQxIAuzsqZ8SusibmhMc/TiGIEz9sellawW4+rr0ZWHU07CD8CLXsiqEeZ
 61VUfkoan1Tev0uKxrQaZNsL50BhdSAlSQWeoBqtw+ncHtIk3wO5yFTxHuYCqTKVGos6YyUBEXZ
 uMl2vz7lYAFg9EKz9jNMA44mXDNC+XQ1fN747/UmPn6utLQ9qnP7HwB6zQ9NYJlemh6CSlEtE9Q
 vuK+uxX2tJ2KxbUjmyuy8zyQlcrxm21GKTxQAOWJ84uWFvHQCa1bwykqnu38DNTNT8kEbR4KbYK
 SKkC0BBftbHPqRgEftKhwxeqMzxPCV2/PIDUGj8nMa5/K6JS3LrsE8wrxQoIiOZgnNewN66rD
X-Google-Smtp-Source: AGHT+IH/MV5JlpB8d3LR5E9Mror58OClk9xNkyyB0fq8aVcQbhEuF+QVaR4iSK9PzA4aIiUJ86yNSA==
X-Received: by 2002:a05:6402:2344:b0:612:7439:4190 with SMTP id
 4fb4d7f45d1cf-61586eeaec5mr6359255a12.10.1753933768549; 
 Wed, 30 Jul 2025 20:49:28 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7a32sm477745a12.37.2025.07.30.20.49.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 20:49:28 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so712720a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1YDCdw8ICDlmQu204U7lwXhzfs7UdPPHLlZ3Dh95IzIgUsKqWh1nYPj36ba7H/ayV/qhgAhH/nPk=@lists.freedesktop.org
X-Received: by 2002:a05:6402:234c:b0:615:aa8e:a19c with SMTP id
 4fb4d7f45d1cf-615aa8ea47bmr1012635a12.32.1753933767648; Wed, 30 Jul 2025
 20:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAPM=9twG7By95nYrkoyLtAT5YPV9WdMUgVPwjuZ9kiZFuse+Fg@mail.gmail.com>
In-Reply-To: <CAPM=9twG7By95nYrkoyLtAT5YPV9WdMUgVPwjuZ9kiZFuse+Fg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 20:49:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCQ5fYwt0X3mzD8zXK=pzWNYeFEUX=H6n4TWdjkOXbDw@mail.gmail.com>
X-Gm-Features: Ac12FXynvzq3d8ZVSwaZILoYPT2AjueV5j_-TkKoD5yqQDDlVrC4n1M2fNlJ904
Message-ID: <CAHk-=whCQ5fYwt0X3mzD8zXK=pzWNYeFEUX=H6n4TWdjkOXbDw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
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

On Wed, 30 Jul 2025 at 20:39, Dave Airlie <airlied@gmail.com> wrote:
> >
> > But I do think that the drm people are doing actively wrong things
> > with the random cherry-picks back and forth: they cause these
> > conflicts, and I *really* think you should look at maybe using stable
> > fixes branches instead.
> >
> > Would that require more care and cleaner trees? Yes. And that's kind
> > of the point. You are being messy, and it's affecting the quality of
> > the end result.
>
> I'm not sure how to parse, stable fixes branch, do you mean stable as
> in a special branch for stable tree? or a fixes tree we don't rebase
> every rc?

I mean as in "don't cherry-pick fixes between trees".

Create a separate fixes branch that is *stable* and that is *shared*
between the trees.\

> Currently all the base (drm, intel, xe, amdgpu) fixes branches are
> stable, we backmerge into them after rc1, and very occasionally
> afterwards if a backmerge from rc5/6 is needed.

Not at all.

What you do ihas absolutely *nothing* to do with stable fixes branches.

You do random development in the main branch, and then when you make a
fix, you just do that in the main branch, and do a cherry-pick into
some other random branch.

Search for "cherry picked from commit" in your logs. There were *92*
duplicate patches that were randomly cherry-picked from on ebranch to
another.

That is *NOT* a "shared fixes branch". That's just throwing patches aroung.

And that is literally what is causing all the conflicts - you have
those duplicate commits in multiple branches, and then you do other
random development around them.

> We should only cherry-pick one direction,

That's nonsensical. There is no such thing as "cherry-pick one direction".

Direction doesn't matter at all. A cherry-pick is a cherry-pick.

It doesn't make one whit of difference whether you cherry-pick
backwards or forwards, rightside up or upside down, or while sitting
in a tree singing the national anthem.

The end result is the exact same thing. You have two different commits
in two different branches, and then you have unrelated changes around
them in those branches.

               Linus
