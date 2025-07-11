Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D8B02683
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 23:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C0310E145;
	Fri, 11 Jul 2025 21:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CWYWgcRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE8410E145
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 21:46:22 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ae0a0cd709bso755253766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752270381; x=1752875181;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LWl0ZCeXiXBuL5nfGt864S3rVP453Egy/lQ9GBy3dco=;
 b=CWYWgcRp2bPS8OFNUz3aB/FS6yfzGsIDNJfX5of1/gANY+gYy7HAV/TNMqYXFlSz9x
 bdu51bSfgb+4+q21P2O7MhINKftA2ocvU8ELKI/26GDL5Pi94gNzNYCWiuweJwPO8O0u
 QT3da3uP2JsvwiyR+rZ2lo9ihVnU9Uq69MiMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752270381; x=1752875181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LWl0ZCeXiXBuL5nfGt864S3rVP453Egy/lQ9GBy3dco=;
 b=b8tWl+ximu/kxy0hJws8TfpKNdV7t42rOQKsOxICD90dhNMe4QT2v1OVxtcnhmYkQK
 HEQMgW6eVg8AZp/6dpFINPt5OKxZM+rw4VnueP5yeM7qugmGXmfyd/AGBNRN7p7H3e6w
 A9kwUKYZG+41N8Ppru28u0lildZrpvusbfPWjqPX/kPfdz35dupoEYaV3ChZJLH33k7G
 KXp1Ibp4N2EZQFoummzXMYbqdah0geVkvaI7OHatBtAmKaWJ+Z7IPpOSPJeGCy5MKLNE
 O9d4UtM75tyPDPjvj/2KxHYd+3HlD9K4uk25jEuetsqouryYJseuT8Rj+w9wPM5cU6e/
 bJ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmYIiK+4WWHrT7UsCYk4RZ1mbs5AjVVuvpCtBaLaies2/DYCIHLDO/xhJmDkFuXmSfNxbUW1GpK/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6PMFHZjlM6vgIE9UMKF4HLefeO/p8v+5ebxs8by3OXwy1iNkI
 0hoZsR2zoL88Au/Js5ZOYmC2+mZBNfshLcGFuBnuFvIY/FhQehPenvnfBVFNOozOqCkThDy4JvT
 GWPKGWo551w==
X-Gm-Gg: ASbGncuQs4sBkfo9AA7x9UxQmFdP8RXPzPWMp8Zjk1pD+HrCibu6fTE8Y9Dnch9dmm6
 7eDtasdc1tZX/MWMHRLdLEEZ7aXePn6gzDyQSZ6PPwEvXHU7SkeE1fvySfdy5zEMg2UIRuNc9gK
 ff5PidXEQy8N7Hg6q7EeJY7YyI9zvtWdD9X5QVaFgThW7biB0oZjWobyTva3PMJ2vpH3efpSLcl
 d+Jsl+6R2e/ImPTrbeE7Bm1f7izJb2PCzBbpino/WiDZzJ3YODq3vxh+v3qX8yhWNgXDkawRN4x
 pWy1+ldWYr3VpZyBDXQIh3dAojFz70cO4RYBv1pfK/HpvTXlpFP8fgXpxzj/JR+yTUODzV7nHXH
 B3J+idd2To3TSma41FVNFioSOfTrMqQCDrD6nLjRSRoBjmdwBjadx/zpQ3sTjhY8OTZZo8Y6H
X-Google-Smtp-Source: AGHT+IHmrp1f6CmHSZJrQtj4wUfi9SnsLXiNvF3XJ7nFa/44qr44sTYh61Xpeu7rXvtTAxNpEApKRA==
X-Received: by 2002:a17:907:d19:b0:ae2:3544:8121 with SMTP id
 a640c23a62f3a-ae6fb6bc5admr426278466b.9.1752270381172; 
 Fri, 11 Jul 2025 14:46:21 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82dede9sm356955166b.167.2025.07.11.14.46.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 14:46:19 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-60c3aafae23so7616467a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeRgHgbS5PV7JI2TCq+sV0ngdnBfBgH100nPWpaVTZvnzBsL9A6qPf9lvwwkwB+YJcs2bBgg+52dc=@lists.freedesktop.org
X-Received: by 2002:a05:6402:350b:b0:608:ce7d:c3b8 with SMTP id
 4fb4d7f45d1cf-611c1df53aamr7638873a12.17.1752270379368; Fri, 11 Jul 2025
 14:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
 <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
 <20250711125349.0ccc4ac0@kernel.org>
 <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
 <CAHk-=wjv_uCzWGFoYZVg0_A--jOBSPMWCvdpFo0rW2NnZ=QyLQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjv_uCzWGFoYZVg0_A--jOBSPMWCvdpFo0rW2NnZ=QyLQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 14:46:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi8+Ecn9VJH8WYPb7BR4ECYRZGKiiWdhcCjTKZbNkbTkQ@mail.gmail.com>
X-Gm-Features: Ac12FXz-E7TSeMs6PS6FH7HeMIkvC5P9gc2EaFCqanu5QU51-la_uVcLprbUluM
Message-ID: <CAHk-=wi8+Ecn9VJH8WYPb7BR4ECYRZGKiiWdhcCjTKZbNkbTkQ@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>, Nam Cao <namcao@linutronix.de>, 
 Christian Brauner <brauner@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 11 Jul 2025 at 13:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Indeed. It turns out that the problem actually started somewhere
> between rc4 and rc5, and all my previous bisections never even came
> close, because kernels usually work well enough that I never realized
> that it went back that far.

It looks like it's actually due to commit 8c44dac8add7 ("eventpoll:
Fix priority inversion problem"), and it's been going on for a while
now and the behavior was just too subtle for me to have noticed.

Does not look hardware-specific, except in the sense that it probably
needs several CPU's along with the odd startup pattern to trigger
this.

It's possible that the bisection ended up wrong, and when it appeared
to start going off in the weeds I was like "this is broken again", but
before I marked a kernel "good" I tested it several times, and then in
the end that "eventpoll: Fix priority inversion problem" kind of makes
sense after all.

I would never have guessed at that commit otherwise (well, considering
that I blamed both the drm code and the netlink code first, that goes
without saying), but at the same time, that *is* the kind of change
that would certainly make user space get hung up with odd timeouts.

I've only tested the previous commit being good twice now, but I'll go
back to the head of tree and try a revert to verify that this is
really it. Because maybe it's the now Nth time I found something that
hides the problem, not the real issue.

Fingers crossed that this very timing-dependent odd problem really did
bisect right finally, after many false starts.

                 Linus
