Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3288A48AB8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFABB10EB9A;
	Thu, 27 Feb 2025 21:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jG/QPvbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC18B10EB96;
 Thu, 27 Feb 2025 21:42:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so2363091a12.0; 
 Thu, 27 Feb 2025 13:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740692548; x=1741297348; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F7A7Tz7g2FCUPie3WKQ6N05ixy8h/zaSxwfvjnOeJGU=;
 b=jG/QPvbTAFfOAB6KlcX6yJBQp5mZAKpWquwBPoyYQiWIvFNorPjn8zSJDapbQFaULV
 GlKHtzITensKVVqtwB6Lp9vv1auLjaVjJDh9HfIUWB0cbba7FSS8A01wWVbdF+ZKJxaQ
 /PEpI4teIzCvPWe3gXn5uK3Hxe+jEw2cBMBOM5aDELwlNmR3AuB9pxXhl/cCXAVt8ZPH
 48ivBLz3xmYffQdeYutDsNcds3aGWLSJpF2Sf+4cVXqZu0JlJwNdisagp1hivq6aqAVU
 WD3K4wm26ynv41fpPvbD+30uZbk1HK5bK1Pisuqq+pfb6nrEa6QEuPsZ8yWejs+YnJT+
 Mcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740692548; x=1741297348;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F7A7Tz7g2FCUPie3WKQ6N05ixy8h/zaSxwfvjnOeJGU=;
 b=pwA7DKmesp0tKMPLfjSvv15t4XeZ7mf2L1Y2lgrMzhyi93DjcP/AaXjkcyzYS9rdsB
 lymKb4IBkEOvV0ng5NEY40iOk4jzaygkTbpVgUxlF5CX1FLojj5Mz/v7Nm9d6gYhDphP
 eHtHEtiWmOb5d9w0Igqwen7aKE3c9U/l/79AZKeJpYCAiIhH4U4BvLmyWiGrK8foCtQd
 HAez+n8fplXfk6Y0ydjw01ViBqFIdHcoHg5wVyOlRBBzZMua59707joejoi3pMCfBCdW
 nA8hChkmC9xTCqhZcdziVPP/4C4FTd/fq+9/DHcaLrTJGu2+n0ELw4gm4DnOyaFXBb44
 +Qxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhILIQQ9L8v4dPjpppbeYkamOl8Kz8CgL7tB7sgsBMNx8wRSFr2ZrK6JUhooJ4El9giGVENdNLW6g=@lists.freedesktop.org,
 AJvYcCXsgaj1rq8aXoJqIhLhwyj35abOoxh2/ztUN0Dh+Wx5eqRKA/29dDa/9tQiL3nW4DR7Eqs/yDbM+w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWxVcd5iRjoByZbVHZTTfLNKzJIoznBhkz5NCDFY746diQqeRs
 Q/ycGs9aDfKn7Jx6PoXS+P9bJLGxp8sWwjtNblzthyStYRJVVU/AF5hitdAispXKIYb19/sOSRo
 f0qeOnpqZQBbJYjP+42CYvvPzDq8=
X-Gm-Gg: ASbGncuABNK8vitFAT+XnK5Q2r7ok9Ph2xL81tWjowyZcd3jx3BTOtoTjJKCE67EzgI
 8M/h7Tq35hRqicn7+nLcnc8LHBzOx2PAlN/7nCVnI5hA4W8S5chmUbOY0STm2ZbPAxHJyvVqHxg
 75Do9gXQ==
X-Google-Smtp-Source: AGHT+IEyUR259zBhUCHDJy65pOw87s0pkKQrEtcK41k9OYzWAulpVoau3ShqRLX/t8YhweziRQmpCp+v5WFZxhtaqsM=
X-Received: by 2002:a17:906:f59f:b0:aae:fb7c:50df with SMTP id
 a640c23a62f3a-abf265e903emr103365066b.36.1740692547826; Thu, 27 Feb 2025
 13:42:27 -0800 (PST)
MIME-Version: 1.0
References: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com> <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
In-Reply-To: <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2025 07:42:15 +1000
X-Gm-Features: AQ5f1JrLTmtHkCd1E06gAqOr7bQnTtzsccZk8EDXt2lxV9P7KCyAhTQQP23iQ0Q
Message-ID: <CAPM=9txrRFOb6Uzm=e0S6Tfxmskm4zwAZgsWnkvCzxN=XCZ6Vw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: John Hubbard <jhubbard@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>, 
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, paulmck@kernel.org
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

On Thu, 27 Feb 2025 at 11:34, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On Wed Feb 26, 2025 at 5:02 PM PST, Greg KH wrote:
> > On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> >> The way misc device works you can't unload the module until all the
> >> FDs are closed and the misc code directly handles races with opening
> >> new FDs while modules are unloading. It is quite a different scheme
> >> than discussed in this thread.
> >
> > And I would argue that is it the _right_ scheme to be following overall
> > here.  Removing modules with in-flight devices/drivers is to me is odd,
> > and only good for developers doing work, not for real systems, right?
>
> Right...I think. I'm not experienced with misc, but I do know that the
> "run driver code after driver release" is very, very concerning.
>
> I'm quite new to drivers/gpu/drm, so this is the first time I've learned
> about this DRM behavior...

> >
> > Yes, networking did add that functionality to allow modules to be
> > unloaded with network connections open, and I'm guessing RDMA followed
> > that, but really, why?
> >
> > What is the requirement that means that you have to do this for function
> > pointers?  I can understand the disconnect issue between devices and
> > drivers and open file handles (or sockets), as that is a normal thing,
> > but not removing code from the system, that is not normal.
> >
>
> I really hope that this "run after release" is something that Rust for
> Linux drivers, and in particular, the gpu/nova*, gpu/drm/nova* drivers,
> can *leave behind*.
>
> DRM may have had ${reasons} for this approach, but this nova effort is
> rebuilding from the ground up. So we should avoid just blindly following
> this aspect of the original DRM design.
>

nova is just a drm driver, it's not a rewrite of the drm subsystem,
that sort of effort would entail a much larger commitment.

DRM has reasons for doing what drm does, that is a separate discussion
of how a rust driver fits into the DRM. The rust code has to conform
to the C expectations for the subsystems they are fitting into.

The drm has spent years moving things to devm/drmm type constructs,
adding hotplug with the unplug mechanisms, but it's a long journey and
certainly not something nova would want to wait to reconstruct from
scratch.

Dave.
