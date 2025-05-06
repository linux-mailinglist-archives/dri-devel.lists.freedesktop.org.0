Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8FAAA8BA
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 03:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9A710E00D;
	Tue,  6 May 2025 01:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6DYBQSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C77E10E00D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 01:00:04 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so1059436166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 18:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746493203; x=1747098003; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5R81D6pXLeI58Px4MI6+StkbIro9njk+44YwXX+iqYs=;
 b=b6DYBQSLC40IqkK+NwQyWBa7dJuRNqpDUY5PKUuIoIcin9TdCJlDOyNazyh6DN8Uny
 ISI29mH8EvZRVM1NKLerVaWuTMf8D6eTF1L9VrFsT4Qu1/YtQ9RA1U91VMbWh9ZX3SXV
 xAd9Y0l2TwPSGkY7BaBt6r4BGoQkcg7g/QMklRgykc500TLLxTPFECyA2PFJHed2Fbsc
 HGjQCGXQ5dRepr3ruOUWV5RKaqKxlPbmGE1kpbRHzoGxO0PstDa8L9xizOpw8URPP4Uj
 sBGrSvSdJNnJhuYsdlzH1XdhlKhZ8dIbPJ8LmLAtIcHSvB39XcIy/iKQ8Gzb3pMF6IZS
 AQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746493203; x=1747098003;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5R81D6pXLeI58Px4MI6+StkbIro9njk+44YwXX+iqYs=;
 b=oqcxDaeINdofQEcrNqg08rIi+PRLN8zPn/nDn/IgLPm6iRIRXjeXvhTNU90g6eSa04
 jfg5POwaDsHSu1uhaTff+oWHF8JTGRjqGr0PB8toPuNbVh7EFSaZJdWSJPpMLTtFyh3a
 /GdTM4WGziIJ+pVUH7fG+/351DtxpmjO419YmgdTE+1m6G4YBTpU0MWNVk2SjsepaeHh
 8WX6FPuGXmfD/8GIRKKK3CKee6DJMgTK/CSnQTCYX6QI+zpOkj4Dz3MXWTiVJxVj1YtX
 Ke0LNWqPWYFtB2wjTWYqGCqX3omQ+9dk+nFjsrbY6f8JddNKXQUDApEGw41TQWBmDS7s
 YH1Q==
X-Gm-Message-State: AOJu0Yx3JktaUBgoezHBWb6rkUIjuexrsUfPrYy+0YYlEOgllcQGFnr2
 3OJcHCauMM2Z3pF3V39xhh273BbaJeCWImUIqMsJaR41PI37eTsZU5xg3UBUPwN+LTDjV+GPP6G
 fqwrLHoaAvecNRwGCVZa6h2cb3AA=
X-Gm-Gg: ASbGncs4XyHOhpK5SAt31sBThQ/3EOae50pw1GYG7rFBCrsTlb1isS6EiIboAH5hyEy
 grlDJQN57HGAZjsH7M4i/Ti3lAuUnY9BRGoa0XTaU5f5pkcW1GQulakJydT1GYcAEz8aXS5zxLE
 ghhrQ5K5w288zKsJPwH2+O
X-Google-Smtp-Source: AGHT+IHCYyQWNIpyLCWc9H3OVPlOxI0B4ZTcatIhbhJ4lVyxoRZR5kJpe0A6MugPIL+frHkwoQgRIG0qKc11n5ViUZE=
X-Received: by 2002:a17:907:3d90:b0:aca:c9b5:31a8 with SMTP id
 a640c23a62f3a-ad1a4abedc0mr786336866b.45.1746493203215; Mon, 05 May 2025
 18:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250502034046.1625896-1-airlied@gmail.com>
 <xa5d2zjyihtihuqu4zd63fqnwxwx57ss7rrfpiiubki3cxib25@kkgn26b2xcso>
In-Reply-To: <xa5d2zjyihtihuqu4zd63fqnwxwx57ss7rrfpiiubki3cxib25@kkgn26b2xcso>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 6 May 2025 10:59:51 +1000
X-Gm-Features: ATxdqUEQ1N5j7DpwIaP1vTgakJKUDxDussvNRSLElxjY-Wz8ZBJ_yuyPcyS4o3o
Message-ID: <CAPM=9txmnq2S3C_fyGysRt+DXCMq85QYXgnXfpwq=3v6=HAMDw@mail.gmail.com>
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
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

On Tue, 6 May 2025 at 10:37, Shakeel Butt <shakeel.butt@linux.dev> wrote:
>
> On Fri, May 02, 2025 at 01:35:59PM +1000, Dave Airlie wrote:
> > Hey all,
> >
> > This is my second attempt at adding the initial simple memcg/ttm
> > integration.
> >
> > This varies from the first attempt in two major ways:
> >
> > 1. Instead of using __GFP_ACCOUNT and direct calling kmem charges
> > for pool memory, and directly hitting the GPU statistic,
>
> Why was the first attempt abandoned? What was the issue with the above
> approach?

I had to export a bunch of memcg functionality to drivers (like stat
mod and kmem charge interfaces),
whereas the new version keeps all of that under a GPU API.

> > Waiman
> > suggested I just do what the network socket stuff did, which looks
> > simpler. So this adds two new memcg apis that wrap accounting.
> > The pages no longer get assigned the memcg, it's owned by the
> > larger BO object which makes more sense.
>
> The issue with this approach is that this new stat is only exposed in
> memcg. For networking, there are interfaces like /proc/net/sockstat and
> /proc/net/protocols which expose system wide network memory usage. I
> think we should expose this new "memory used by gpus" at the system
> level possibly through /proc/meminfo.

We do have some places where we could expose this info via debugfs,
but maybe /proc/meminfo
should grow this stat, so that it makes sense.

>
> >
> > 2. Christian suggested moving it up a layer to avoid the pool business,
> > this was a bit tricky, since I want the gfp flags, but I think it only
> > needs some of them and it should work. One other big difference is that
> > I aligned it with the dmem interaction, where it tries to get space in
> > the memcg before it has even allocated any pages,
>
> I don't understand the memcg reference in the above statement. Dmem is a
> separate cgroup controller orthogonal to memcg.
>

The TTM code that deals with dmem in the tree is at a level in the TTM code,
v1 of this added memcg interactions at a lower level, but Christian suggested,
that ttm could interact with both controllers in the same level, and
with the new
approach it seems right.

Dave.
