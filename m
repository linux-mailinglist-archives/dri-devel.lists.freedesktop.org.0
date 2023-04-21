Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2C46EAA10
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 14:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C004F10E0A2;
	Fri, 21 Apr 2023 12:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA34B10E0C1;
 Fri, 21 Apr 2023 12:13:19 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5529f3b8623so6403167b3.2; 
 Fri, 21 Apr 2023 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682079198; x=1684671198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pOvME7tAXZ9JphDrU67XmOOlY2Dekn7UQzOnjzIbu/w=;
 b=dOj7qsSoqusi9JzHDMCTpPvIgyQPzCzKLm+sIKYvK1CvZPROIce1ddULWduEJd7jrh
 h9EtoGJ6m1GHmYGpXJU6/6FNPLsCuLt6cW8q2qImYUU4Me5AQY5TlzdLNG24YUAq4d/b
 zlGbTzgDvqJDlOwMKaEiRsVixMQR0LYg8I9uzwd9DuXOQdacYh2RKW3yFarSSqIZm0e5
 jXgDJyaLluMrwFMsYHZLR3DOju3AwGzSKT33SyiKGKcL6YgeBrcoJbjsBjTKixLnXlG+
 W46y8eXZCiHZVJ+VEK2Y83z5BnDuzZ4ANfbtnti4CzoG2KX/btAfDEYaiJwWihMcIxck
 x68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682079198; x=1684671198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pOvME7tAXZ9JphDrU67XmOOlY2Dekn7UQzOnjzIbu/w=;
 b=hwfxfzuRB1273/tIQzgYZAPKhyJSsRArNVia3W1IjafD3bh1jVfVglVo4CbE5sQmF7
 OMQQ94N3xXeRNRyZMM6VxsCTQ7nI1U8KdtCKvUTrdUV83tIRjt3jQuBFis7ir4DQhqRI
 OZnBPZymp5pKdo2Wo9eA8cW6ulVd9G+TKTEC6a1cgn8yU5xvhqurQM47rP+N/z2QonV0
 fTlQMh6FFUQPj7Q/QybpMVgU4OOY8tzZn/HnEXZW56Z0eXTu0/g148qz5c2C4tIfx0Ek
 slLRioV/4a63ZPKVS2VgA01mVguw5SM+htFYUNslQkET6Yo7fgeHNLCP01r6AoigvC53
 Sizg==
X-Gm-Message-State: AAQBX9c/0YD7MaVIKqtLaKNoWtDJpO/J1NvtnKxLTGMfL5fIiRFbaPtk
 jBFVb7taAAFwNm/DN6EObVToJheww30v9nFCtro=
X-Google-Smtp-Source: AKy350bjuOnxJWwW5k1ckin1yG5kiI/s5+t7bZByyWpKZYMuEEODDrY8+cV9Rp+5si3ja6aSq0oE9UHI8YlKQLjj0RM=
X-Received: by 2002:a0d:f205:0:b0:541:8810:8d7b with SMTP id
 b5-20020a0df205000000b0054188108d7bmr1918894ywf.15.1682079198356; Fri, 21 Apr
 2023 05:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
 <20230314141904.1210824-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230314141904.1210824-3-tvrtko.ursulin@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Apr 2023 13:13:07 +0100
Message-ID: <CACvgo52Bb3kBua8dh+eac6dhSwiJLMGAdGDAa+LQYoOwCLPLNA@mail.gmail.com>
Subject: Re: [RFC 02/10] drm: Update file owner during use
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, cgroups@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenny.Ho@amd.com, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "T . J . Mercier" <tjmercier@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings everyone,

Above all - hell yeah. Thank you Tvrtko, this has been annoying the
hell out of me for ages.

On Tue, 14 Mar 2023 at 14:19, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> With the typical model where the display server opends the file descriptor
> and then hands it over to the client we were showing stale data in
> debugfs.

s/opends/opens/

But as a whole the sentence is fairly misleading. Story time:

The traditional model, the server was the orchestrator managing the
primary device node. From the fd, to the master status and
authentication. But looking at the fd alone, this has varied across
the years.

IIRC in the DRI1 days, Xorg (libdrm really) would have a list of open
fd(s) and reuse those whenever needed, DRI2 the client was responsible
for open() themselves and with DRI3 the fd was passed to the client.

Around the inception of DRI3 and systemd-logind, the latter became
another possible orchestrator. Whereby Xorg and Wayland compositors
could ask it for the fd. For various reasons (hysterical and genuine
ones) Xorg has a fallback path going the open(), whereas Wayland
compositors are moving to solely relying on logind... some never had
fallback even.

Over the past few years, more projects have emerged which provide
functionality similar (be that on API level, Dbus, or otherwise) to
systemd-logind.


Apart from that, the commit is spot on. I like the use of rcu and the
was_master handling is correct. With some message polish this commit
is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

I also had a brief look at 01/10, although I cannot find many
references for the pid <> tguid mappings. Be that on the kernel side
or userspace - do you have any links that I can educate myself?

Thanks
Emil
