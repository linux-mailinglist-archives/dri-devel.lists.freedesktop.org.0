Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E005786F2AA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 23:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD4E10E30C;
	Sat,  2 Mar 2024 22:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lJdfGRPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F08210E30C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 22:11:05 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-428405a0205so553491cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Mar 2024 14:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709417464; x=1710022264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTM56c3VIZxbBTne5xJnHplyY03OBsavmsip+EQ4Ouw=;
 b=lJdfGRPqeS012aN08q0f7pn0yFySCcMhINz59XJACaxCDN8i3AbxPmjIIZcROvY3GS
 3yUpEwdw8KdLeBlbQGb4YCPon6lciIxTwGe67HPQzZGnlOmoNfzF1p8mKYRYJn5hN3Oe
 ARU02zkcR74u9Sc0N6uGzuuxueDk+6aspVFQgnlKkrwHv2va3MNUdWb6Pa5zZvVab+KN
 BvkpTzBQWn0N+qcbeWjUWWI+pqM5m/CKpbakjJl6KyW7n0MqMeOHldRf7xDnvQb/QW0R
 s7a2PjrvWNCFS8rDEFdxI+Jte3qTtETPluD7syenZRQgqVrSvHRB+GKElxzOjVmfpDHq
 S20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709417464; x=1710022264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTM56c3VIZxbBTne5xJnHplyY03OBsavmsip+EQ4Ouw=;
 b=C1jNpp/xI4iVucvOwfv60jurJGaFBser/ajmJG6QF1kV5noa0OIYJVGn5ks2prT3OG
 ZZi5+LZ74oUFhUMloCDmuMsLlJI51dG3G+5rGnOGga4UKd61O6ahNUSIwF7lKaKUCVJK
 4QEW7mkA145f1nLCXONgQQkK487fZE3sjbwkuqp7Z+KPa/z9CClf2k3X1gc8OICjRlZQ
 T+ABewVGzSKNnySH6Nh2VLzgfe5DGQ7s2kMnBwKiCwO2tuChNpXXXpqY2bXopcU/7ReO
 CKVeTEZTRL+guGXtNCQ2eFhgL2piHik+ICgUGIoPaaWiZzqG/X392kz7kDSN9ID1nlBE
 w8Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn+nt/U9VrRkqdCqDfLpbLcmSlaf3oFvhHu0KKyBIsvt3ZJ0NQke8FOUMet9AobsLJsANL8QDpT2uGpX2OYM3vXsMOhj6eDNn1jmFGiNbp
X-Gm-Message-State: AOJu0YytQNw+Y9OfXwpRwAFQ2Smy+pq0iDbLlJeF88ZqWqGawMUEPPtI
 5gxp2vekHXbuqr1bngQS6UnUIteHGKqMrEewKLQYnQKbgEmZKkzOgflMkeafLUqyLizaNURWz4s
 Rpc1lvt4y0Zrcpwx34aLm5fpS8+w5sEtPOeq/
X-Google-Smtp-Source: AGHT+IH9sc7BkUOA/MoUZBJgDctjPHOF2trLohxTQjAjH4xi/HZsF8GyNQXPUzk/gDR+MwNciAkndO1CuKQxBDT3R0k=
X-Received: by 2002:a05:622a:1989:b0:42e:e1d9:6df8 with SMTP id
 u9-20020a05622a198900b0042ee1d96df8mr52100qtc.23.1709417463845; Sat, 02 Mar
 2024 14:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 2 Mar 2024 14:10:51 -0800
Message-ID: <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 29, 2024 at 12:21=E2=80=AFPM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrot=
e:
> >
> > However, I think a better approach would be *not* to add the .gitlab-ci=
.yaml
> > file in the root of the source tree, but instead change the very same r=
epo
> > setting to point to a particular entry YAML, *inside* the repo (somewhe=
re
> > under "ci" directory) instead.
>
> I really don't want some kind of top-level CI for the base kernel project=
.
>
> We already have the situation that the drm people have their own ci
> model. II'm ok with that, partly because then at least the maintainers
> of that subsystem can agree on the rules for that one subsystem.
>
> I'm not at all interested in having something that people will then
> either fight about, or - more likely - ignore, at the top level
> because there isn't some global agreement about what the rules are.
>
> For example, even just running checkpatch is often a stylistic thing,
> and not everybody agrees about all the checkpatch warnings.
>

While checkpatch is indeed of arguable value, I think it would help a
lot not having to bother about the persistent _build_ failures on
32-bit systems. You mentioned the fancy drm CI system above, but they
don't run tests and not even test builds on 32-bit targets, which has
repeatedly caused (and currently does cause) build failures in drm
code when trying to build, say, arm:allmodconfig in linux-next. Most
trivial build failures in linux-next (and, yes, sometimes mainline)
could be prevented with a simple generic CI.

Sure, argue against checkpatch as much as you like, but the code
should at least _build_, and it should not be necessary for random
people to report build failures to the submitters.

Guenter

> I would suggest the CI project be separate from the kernel.
>
> And having that slack channel that is restricted to particular
> companies is just another sign of this whole disease.
>
> If you want to make a google/microsoft project to do kernel CI, then
> more power to you, but don't expect it to be some kind of agreed-upon
> kernel project when it's a closed system.
>
>                Linus
>
