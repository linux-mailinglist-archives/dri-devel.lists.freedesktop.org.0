Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932F60CFF4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D1D10E22D;
	Tue, 25 Oct 2022 15:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C1810E169
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:07:04 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id z17so5582068qkj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=;
 b=Qao3n6VBojqDPD+nyuHaNb8aRuC3dHiWWy2AGSGIeYcnvqBmtYGQkw0ZAnJFMbgl3b
 YXIsxmYnbPg/gkeIi50KEfyRBdnGvB7rOyE6AKwAWbos4tmP+xf33xTqrKYAFctdgjEV
 5bJSY6/fZwHsi070+kf0Dnmrd9VA6kpKF5vcsJbaF4KkD+ujQ6HfenyTPpf4q34P817v
 Lw/cRjg8xI19gsnwTd7/9PilD6/WIP9eNa1DtNk+gWXZdxuCJP9myXKQJQF5gbDxLWVe
 PS22WiRQZeD4cAN67FUE74f+0buJO7v71DQP6WC4ve5q5Ibyz3V9+9DvZel0/LU50VSx
 rUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=;
 b=2pECqM3Oj9DzT5scse+0QayFZ+Ird2RIGIq31hn36ooqqMVnEWDyb92LrICc8U5rwB
 v6LoihAqK88JigO9+hKfr5cLN6zXakzx+atnPEZoWqH7q0JFB8Gxl0FeGjHzaUB7Kz7R
 64ioDeaqDZ1ZyT4vGInsiDzhbDebjC2Ad81W5kUPNvmGiedoGEpRvLkEYgTN9QEmWGGq
 egGz76trgiCIky/SVsfMxa67y5+BuCWk/e16VrinCmKWft8XnOeFS0SZy8AOUowDeP3o
 vOWnsFuBEMgFxd1V+E/8TB/v3lqgQ3dSoNjb1xye85XRcEh/dZMeqfN5MypV2YnUll7P
 DvYA==
X-Gm-Message-State: ACrzQf1Fg7p6UHFVbRJO0soiHT5Xw+MFR6ifBX5pHNuYk4Kk/KrFI10F
 VZIJpMgR3SAqSyJwVRcQR1cnicTKJp8hNJPZE3RziQ==
X-Google-Smtp-Source: AMsMyM5WxUziOboPsxC2N6qlers3FkCq6d6ddxCwWgeTeLHIKEFc0BoQutxorsr/ysGcAgO7sfY3nB5LJLrWXyNsPDs=
X-Received: by 2002:a05:620a:25c8:b0:6ae:be73:86c6 with SMTP id
 y8-20020a05620a25c800b006aebe7386c6mr25824699qko.531.1666710423705; Tue, 25
 Oct 2022 08:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220829093141.45583-1-tomeu.vizoso@collabora.com>
 <20220909141528.5090-1-tomeu.vizoso@collabora.com>
 <CAPj87rMYW1xZdacZ1Y0qk+D9xpqsqE+cwbQ1j1nZ7S+RKpzOoQ@mail.gmail.com>
 <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
In-Reply-To: <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 25 Oct 2022 16:06:52 +0100
Message-ID: <CAPj87rPTAhcqSnhzYPdDn93Kh9aGJtN9ZGVAYUP2Ke6w6frH5w@mail.gmail.com>
Subject: Re: [PATCH v8] drm: Add initial ci/ subdirectory
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Tue, 25 Oct 2022 at 08:32, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, 9 Sept 2022 at 19:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > But equally - and sorry for not jumping on the IRC (?) discussion as I =
was in the middle of other stuff when it came up - I'm don't think this is =
the right plan.
> >
> > Mesa having all its CI in-tree makes sense, because merges happen rapid=
ly to a single canonical tree. If the scripts need to be changed for whatev=
er reason, we can merge something in under an hour and everyone immediately=
 gets it. DRM is quite different though, given the forest of trees we have =
and the long merge paths between them. I worry that merging the CI scripts =
in-tree - especially for our initial attempt at it, when we're likely to ne=
ed to make quite a lot of changes before it settles down to become a stable=
 system that works for everyone - is shooting ourselves in the foot by limi=
ting our flexibility.
>
> So the entire "we have multiple trees" is why I want at least the
> gitlab-ci.yaml in tree, to force people to collaborate more on one
> thing instead of everyone rolling their own fun and hacking stuff up.
> And there's still tons of stuff outside in the separate repo, like the
> lab status so Linus doesn't get a silly history of lab flapping.
>
> Also wrt "developers don't get the update right away due to
> backmerge/pull delays", that's why integration trees like drm-tip or
> linux-next exist. So maybe initially we should make sure the ci
> patches go in through drm-misc, to maximize how many people see it.
> And even for mesa it's not fully automatic, you still have the rebase
> your branch if you picked a bad one for development (but yeah marge
> does that if the MR is ready). If you're doing kernel development on a
> linear tree instead of an integration tree, you're doing it very
> wrong.
>
> What I think everyone agrees on is that we probably get the split
> wrong and need to shuffle some files back&forth, and that's something
> we need to warn Linus about I guess. But somewhere we do need a split
> between internal and external stuff, and personally I'd like if at
> least the pure sw testing (build and virtual stuff) could be all in
> upstream.
>
> > Given that it's currently very dependent on fd.o infrastructure (publis=
hed ci-templates, the registry, the specific-tag runners for Collabora/CrOS=
 DUTs, etc), there isn't much of a portability gain in bringing the scripts=
 into the tree either. It's a good goal, but not where we are today.
>
> I don't think there's huge chances for any non-fdo gitlab anytime
> soon. Once we get there we might need to figure out how to standardize
> the hw lab interfacing, and if we have all the sw targets in upstream
> that should help with shuffling stuff around for a hypothetical LF
> gitlab CI (or whatever it is).

Yep, having talked through things on IRC, I'm happy with where we are;
let's give it a go and find out.

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
