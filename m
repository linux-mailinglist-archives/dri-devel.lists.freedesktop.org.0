Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF41B023B1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0CC10EAB3;
	Fri, 11 Jul 2025 18:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="G2hm4xH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F0B10EAB3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:33:30 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ae0dad3a179so395326066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752258809; x=1752863609;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fkiMZ2J4WWxAe30Yz9eXRKes27bISK6iOQFaa/jG/i8=;
 b=G2hm4xH4Pd79OAcBTi46rnn2gzSVWa5J0kaD3yPpXFTuuwKT5x9yUg2NzAD7bNY4s+
 RB1n83vNmhptPpZud++AR2QeGRd4k6LWjjj0tf/PYLrSZkNQHdEzLHLDmwZuKMNJJdrX
 FunsR8MZIb4+Anv+l1831rECOLzdVESCWTE58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752258809; x=1752863609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkiMZ2J4WWxAe30Yz9eXRKes27bISK6iOQFaa/jG/i8=;
 b=POhEpm8SW+FhC1wu3UOQsUq4bkTriiGQQ6j1qhEJMvHYDTNyt2+HLqFjiPVTa81P/H
 dNz2HCzf42lBSLjBZKcbTEbpeqUQfTTBUp9Aww7toG9oSEh3PZBs3S7TknYDkeQwug4N
 5ZIR/EK+eBA0VGDBFqmfpQ64mmweVv1MR6LBFtb/Q0Q517332175DgCqGztU2mP4035H
 Vs0cL4tPJQUyBRXQUj77LzQfQymQHEJXImXN1/DKB/C8xdVqXIk/6Ep29MmPBSn36IyI
 uOK41/z2ff93xLNpWt7vC0SsiWTJVKuEgzf7UORbJnbmu0v+OU4OD3pzSIC1uAI2p+hV
 kd+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxFaaKajsiPSCxebhglSyePRyUX+q8pP6EINJnEQy5cGPRAKIgnfNZKVfotclQUa76Jja8ZcgTrIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPnZl4fLskF/UAkCjwwenKSeyKw+0nhkeDWfw7hgqWEiuohhQ6
 o/Xu/gGCeIZ1dqVW5Mrgkcz9AiFo4nX0RaBWWiu43pzEZn+yJ8TeIewrvj1RLndzmgk9bKQpy5F
 LSmAgFeWG/A==
X-Gm-Gg: ASbGncu3SndUIsqNVysGEORzj5yEN15Vmo9lvF4kqQAanrr+KB7+nawQTnzNl7cgjD4
 EA4NYA4mWHHIwqxvWj15sFiuxTxYhnNdqToci4G05sf+DmSHvNN4zx0EbWiJv0tg6ze6zSO94UT
 PRtDV4UjHoyP2gd12iTNUvPog/wXO7xpI6BTrZKR1XPdog2hkNzpIdCLW82FN/Wxfuh0ErbFTvy
 iboXeH5yx3T0YE7y128uaCKZRg/I/SKOoj6wE2J7vGAJF9tcNLBjHCDrJBeeZUGun5qgy3rm2o0
 b9p6IHjKQ4zzH52PH9jasiDnv9D10r5CYzMqWEq3AQjfRIHzXr1r3HtbK2l6L8IqGsT5INSC4Bm
 CbWAfoJ9hhyOplufMViMyQEWnXOiDTIubXBjOrPt0LDGHeXiIMU5Jbktn9P0fnSviddO/0M0E
X-Google-Smtp-Source: AGHT+IEnXnakRg/ARaXPesMdwKptLUgX/INB3Hv0SGk6LId3pYHFlAfFxaX5jbmW/AUx7Ehe4dG62A==
X-Received: by 2002:a17:907:86a1:b0:ae3:65a7:5621 with SMTP id
 a640c23a62f3a-ae6fbf22a3cmr477992366b.37.1752258808620; 
 Fri, 11 Jul 2025 11:33:28 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7edd6cfsm339919666b.38.2025.07.11.11.33.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 11:33:27 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so434831866b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:33:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpJzyFZWCS5xsfyROHrTvqHsw1yDWcT7Vk5hD775YMxj9kLpwSCpYZp3hYfyu3qjB5DX0td5CYZVw=@lists.freedesktop.org
X-Received: by 2002:a17:907:3e95:b0:ae0:c6fa:ef45 with SMTP id
 a640c23a62f3a-ae6fbf96592mr483791366b.41.1752258807150; Fri, 11 Jul 2025
 11:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
In-Reply-To: <20250711151002.3228710-1-kuba@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 11:33:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
X-Gm-Features: Ac12FXykIL-Mz_Bqw9_dzJEakCBd9Y2pyk80DOugpUKw15R_JJAEpkwfYZHB3M4
Message-ID: <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 pabeni@redhat.com, dri-devel <dri-devel@lists.freedesktop.org>
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

[ Added in some drm people too, just to give a heads-up that it isn't
all their fault ]

On Fri, 11 Jul 2025 at 08:10, Jakub Kicinski <kuba@kernel.org> wrote:
>
>  The Netlink fixes (on top of the tree) restore
> operation of iw (WiFi CLI) which uses sillily small recv buffer,
> and is the reason for this "emergency PR".

So this was "useful" in the sense that it seems to have taken my
"random long delays at initial graphical login" and made them
"reliable hangs at early boot time" instead.

I originally blamed the drm tree, because there were some other issues
in there with reference counting - and because the hang happened at
that "start graphical environment", but now it really looks like two
independent issues, where the netlink issues cause the delay, and the
drm object refcounting issues were entirely separate and coincidental.

I suspect that there is bootup code that needs more than that "just
one skb", and that all the recent issues with netlink sk_rmem_alloc
are broken and need reverting.

Because this "emergency PR" does seem to have turned my "annoying
problem with timeouts at initial login" into "now it doesn't boot at
all".

Which is good in that the random timeouts and delays were looking like
a nightmare to bisect, and now it looks like at least the cause of
them is more clear.

But it's certainly not good in the sense of "we're at almost rc6, we
shouldn't be having these kinds of issues".

The machine I see this on doesn't actually use WiFi at all, but there
*is* a WiFi chip in it, I just turn off that interface in favor of the
wired ports.

But obviously there might also be various other netlink users that are
unhappy with the accounting changes, so the WiFi angle may be a red
herring.

            Linus
