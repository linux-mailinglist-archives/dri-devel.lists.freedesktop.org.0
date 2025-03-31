Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F762A76AEB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454110E13D;
	Mon, 31 Mar 2025 15:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C2xejydd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AB010E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:43:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso807157366b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743435793; x=1744040593;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yMjGxaRDGHxjr3R7uBwpfoqzwwin8pE68FeG7DU6JqA=;
 b=C2xejyddg4h/CeLs+Ns9zGnYtBmnTDLDyTDqkazV7Yb3c1GABhVauoEQ5Ok8XlUKUB
 BwwuGiQrBa7hlFPgVwnlJwwKjIBFCxb+k9uywH6OnCYN0u6cgUD//fOHd3xXPdywYwEL
 pGKE5iZZJo26ZlvtT1QlgIcExKU/DC+3kyB1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743435793; x=1744040593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMjGxaRDGHxjr3R7uBwpfoqzwwin8pE68FeG7DU6JqA=;
 b=VB+6KjH3uJ+1S6NI6Bdz5URHnsloW+xb2SKEduCUO4/KUCHwBPIcHB5YtmnkFFu3EA
 nM5NXE9rAqwSZtSOHMZSPcSUKQFA/VAFb1ASVm2/2POn4mNJwesa8aRJoB1grAPMJx3I
 z+EYMjcEAXzm4qwbmKl4p+QNQ2r7MxAI/q+AhU3x8JYt+6klbL/35sSAHxoqp1QTYDYy
 C6OsxTVAnBHIezMFY2MkSHycZYRdjFtId4TbKVQz5EiMGeqbDzYNWOxkpBR/cD9YeaRG
 N7SgqA65QWuYRlJ84FBdTD3LF8qCrmgsIKuvhpwChhU7msWrH6PBhosy34IjnA3eOVxC
 ITOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvFUF2xzfDhDGZjpsFbqFY7Fy3AOLnUwYl9AG9IlHJKr+PfTSdgx4kfsSTq37OHtICJ2s1jbS7y1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLLmnMovvLITiuK7ihTpBmORZwK2FmDahWtrdIGLkuO+U9WDHA
 90bHwOyXN3lk4TnenQuVenQFuR6yYNk6mhy7Rfvoz5XSsymcF52KOwDvV/wwDCUDwW3tl4STA5d
 UaYE=
X-Gm-Gg: ASbGncv1E+vGxGf8ucAgRCD/XHwsIR3ERLLNPfTJqyfS7bLt70yKvpXvrXKoi3k5UUb
 pgKV3na/x6BDp0i3ZsqTyySA0wRWqzlSGl5uNLu/ubuEiPhpnJ9RBcWUt95oYkM4CZIS+W2tW3P
 UdxcrcoMzyM9bEpywGD0xrFbecoUMbakozTylSI4IjWOKhTPm+qw5iloL+mX8f7OblepRBFWHgU
 3NhEijtTL0UjdGtk37+BJnNUq/gy8pfWadGFSxEf0IjNsorUAw1fH3prOfZgi+Uk4sp6ynhi9I6
 5ewaHWGXfpK2rqbpw6i4+JePPKhcAQR843qxAwiVqCXz1XoeL2zeoO4yCO/5qslUue5ynOhsbz+
 BVRxw8G/AsWCCMfKoZ5G1FqprXDFRTg==
X-Google-Smtp-Source: AGHT+IFh+s/9Cyb9WRixgzPuwHBb56/qx5Omf9DCj9fc529fU2vSPvnbhY8L4apG0wURvEVsPEEBlA==
X-Received: by 2002:a17:907:a088:b0:ac6:ba95:dc02 with SMTP id
 a640c23a62f3a-ac738bad240mr781068766b.44.1743435793265; 
 Mon, 31 Mar 2025 08:43:13 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922b975sm649055666b.18.2025.03.31.08.43.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 08:43:12 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso930927866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJtxAmeeZi3g6UKqspjlwvBBhJ0oDzEfilxcWZpChkk2yCY+4Ad/PGYMy7/bGn/mTSz/+1eAmBSk8=@lists.freedesktop.org
X-Received: by 2002:a17:907:3da3:b0:ac3:4227:139c with SMTP id
 a640c23a62f3a-ac738a5064dmr780994366b.24.1743435792395; Mon, 31 Mar 2025
 08:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com>
In-Reply-To: <87h6394i87.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 08:42:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqDOQu2rXYlordNqK8OP1UL71OTMOmBdN7AbqaVHtfzJ6PVQyJ_bez4boI
Message-ID: <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, simona.vetter@ffwll.ch, 
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

On Mon, 31 Mar 2025 at 03:17, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> I suggest a Kconfig knob to truly make this opt-in, only for developers
> who actually want it.

So honestly, the thing I *really* hated was the horrendous naming.

I live in auto-complete. I basically never type out file-names, and I
replace keyboards every once in a while because my TAB key has worn
down (not really, but you get the idea).

And *if* this feature is useful - and while I disagree about the whole
"header files have to be self-sufficient" as a general rule, I can see
it being useful for uapi headers - then dammit, the file naming needs
to *DIE*. It needs to be taken out behind the shed and shot in the
head, because it messes with TAB-completion.

Having "this has been checked" turds that live in the same name-space
as real files is wrong.

In the kernel, we often hide them explicitly (ie using the dot prefix
to make them hide, but also to make them not mess with auto-complete).
That's an option. But some people hate the hiding, and if that's an
issue, just put it all in a different subdirectory entirely.

Yes, I realize that you guys may live in the whole "different
subdirectory entirely" world of doing the whole build in a separate
build directory, and might say "why are you working in the same tree
as the generated files in the first place if auto-complete is so
important to you".

And to that I say "because I equally often look at the generated
files". When they make *sense* to look at, not when they are
auto-generated makefile checking crap.

So please. This feature needs to be done completely differently.

           Linus
