Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41184B8A1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1483010E6DA;
	Tue,  6 Feb 2024 14:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="sJgg5LAE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2CC10E6DA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:58:56 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6818a9fe380so32177296d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1707231535; x=1707836335;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTPIjvgxei1QrV+EgKvjq47/rJB2fjn42pZ0bvykzvs=;
 b=sJgg5LAEIZ1H5LfhEKtZLkqX2+gHF84K0w6ioc5O2D+gn39Bzo2Y55G4CA6jj4d5mK
 n2RfyCOvVxfGH9xSi1ttBsEBm0xcewQGXznN4zcDH7+OcmxElYVcYdFcqghe2KwcUkIB
 w34E2jse3zGiEP6OSQNW+ITU3zoz+ZFH8F3owSObmYLDsr5iBOrhC7Fo/eWcGgtqLOa1
 HDcl5U+9VnIuyxpDcnBmPSaj3/AFjcPCMQtwkmxBXfXp0Hpt1x9lnVzvseI12knTCmeF
 jlLD7Kv6KvKjWsSHFRkEhw+hCvNS+t9qQjEJdUc4hhKnJ0v4P3UEaxnFVmDrrPLc/NoC
 Xl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231535; x=1707836335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTPIjvgxei1QrV+EgKvjq47/rJB2fjn42pZ0bvykzvs=;
 b=WCSaGX3gf+VbnjPebmB84msSPjQnYiR0FztqxVkKIx0qorbbhUZV7cm/inYdsOXfTt
 XfGbTvxEhZ9ogGnBpFuMHZU98tjRK18VazeA4S6G57p3SKXwQaiN/1dJFy3Cn3tyS95S
 PHjlJ92Xk0vVkCyPGev3EZu/2AYblEH5Y4Mp2UcRzK/OU8aoqRO5hinNCdCXgWtsRk6a
 IJd4rbmCJstqVF0fHU/VR8mLP2fO6CWeUkO0AZqBzqfXnErGQPWpc6dKTvCMJYikoCg/
 lqjUQxZe1T8frLDcALXWVDYzp1JAwmpo8UGKZt5zBTTLXz+IDbxLS439VjAFvXTnwzdp
 z9ZQ==
X-Gm-Message-State: AOJu0YxPsQFwgw/+wvtgNbm9fnHBpuOhO4f5DWQT97yuT4UrS6aOmlCi
 YtA2HuAflV6jv3i58I7rCiwKK/kDuWu+d8LGKJ6Xyo6a0FygrxoeoywvkirhmJqszZvpl+r/EXC
 3gzDNf9Av9opLoXrr8pI1KrBnecOEusqyhi4R9A==
X-Google-Smtp-Source: AGHT+IFLWz51QJAPeDmQLqWSofaZ8fq52wIiELwDXee909VFovP2joO8OHSxbjIhF0tLvLZV+92H82eyDJww8dGADMg=
X-Received: by 2002:a0c:f210:0:b0:68c:a3ef:18a1 with SMTP id
 h16-20020a0cf210000000b0068ca3ef18a1mr2201790qvk.54.1707231535535; Tue, 06
 Feb 2024 06:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
 <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
 <613cf732-fc95-4f61-b64d-772206460535@suse.de>
 <CABQX2QP8nLpM6e3D3qQASvbxr1DDON1dq=s+iNBcczhSJu8Ggg@mail.gmail.com>
 <CAPj87rOhA6jwq3A5kgQg1w+y-ms2=gF4bZ+Obp3ELq+3f-jemg@mail.gmail.com>
 <CABQX2QNaQ3yN-njyw7zE7qH_p=JB3JpxxhTxYDqSbcmA5DicFg@mail.gmail.com>
In-Reply-To: <CABQX2QNaQ3yN-njyw7zE7qH_p=JB3JpxxhTxYDqSbcmA5DicFg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 6 Feb 2024 14:58:43 +0000
Message-ID: <CAPj87rPvHwzThtf3Qi-pDR+wmFYKYKOe=fCHQN1VwSKutpvU7A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Ian Forbes <ian.forbes@broadcom.com>, 
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, martin.krastev@broadcom.com
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

On Wed, 31 Jan 2024 at 02:31, Zack Rusin <zack.rusin@broadcom.com> wrote:
> On Tue, Jan 30, 2024 at 6:50=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> > The entire model we have is that basis timing flows backwards. The
> > 'hardware' gives us a deadline, KMS angles to meet that with a small
> > margin, the compositor angles to meet that with a margin again, and it
> > lines up client repaints to hit that window too. Everything works on
> > that model, so it's not super surprising that using svga is - to quote
> > one of Weston's DRM-backend people who uses ESXi - 'a juddery mess'.
>
> That's very hurtful. Or it would be but of course you didn't believe
> them because they're working on Weston so clearly don't make good
> choices in general, right? The presentation on esxi is just as smooth
> as it is by default on Ubuntu on new hardware...

Yeah sorry, that wasn't a 'VMware is bad' dig, that was a 'oh that
explains so much if you're deliberately doing the other thing'
realisation. I'm not suggesting anyone else use my life choices as a
template :)

> > Given that the entire ecosystem is based on this model, I don't think
> > there's an easy way out where svga just does something wildly
> > different. The best way to fix it is to probably work on predictable
> > quantisation with updates: pick 5/12/47/60Hz to quantise to based on
> > your current throughput, with something similar to hotplug/LINK_STATUS
> > and faked EDID to let userspace know when the period changes. If you
> > have variability within the cycle, e.g. dropped frames, then just suck
> > it up and keep the illusion alive to userspace that it's presenting to
> > a fixed period, and if/when you calculate there's a better
> > quantisation then let userspace know what it is so it can adjust.
> >
> > But there's really no future in just doing random presentation rates,
> > because that's not the API anyone has written for.
>
> See, my hope was that with vrr we could layer the weird remote
> presentation semantics of virtualized guest on top of the same
> infrastructure that would be used on real hardware. If you're saying
> that it's not the way userspace will work, then yea, that doesn't
> help. My issue, that's general for para-virtualized drivers, is that
> any behavior that differs from hw drivers means that it's going to
> break at some point, we see that even for basic things like the
> update-layout hotplug events that have been largely standardized for
> many years. I'm assuming that refresh-rate-changed will result in the
> same regressions, but fwiw if I can implement FRR correctly and punt
> any issues that arise due to changes in the FRR as issues in userspace
> then that does make my life a lot easier, so I'm not going to object
> to that.

Yeah, I think that's the best way forward ... modelling the full
pipeline in all its glory starts to look way less like KMS and way
more like something like GStreamer. Trying to encapsulate all that
reasonably in the kernel would've required - at the very least - a
KMS-side queue with target display times in order to be at all useful,
and that seemed like way too much complexity when the majority of
hardware could be handled with 'I'll fire an ioctl at you and you
update at the next 16ms boundary'.

I'd be super happy to review any uAPI extensions which added feedback
to userspace to let it know that the optimal presentation cadence had
changed.

Cheers,
Daniel
