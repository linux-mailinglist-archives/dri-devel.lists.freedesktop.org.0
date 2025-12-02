Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D0C9B931
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B210E63A;
	Tue,  2 Dec 2025 13:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="MySuNzYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2E910E63A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:21:51 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5957d7e0bf3so6327922e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764681710; x=1765286510; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXw+zlU9ZytV+KbuL3Lo9Daw+c/7AyiMgzUtu13lgVo=;
 b=MySuNzYdDZ8LiI8fRRUEgHkMiQM8QlGxNUxY36VJnu0+jLUSGnjCWTYZ6DvMd5bj2v
 apYye5qniNY8h5nMlbJG7UBazwUvnus9VDNvpvOUgwX4jpHoL8zEEEdNQDkgctXbnpNf
 GoU++paXAtlMes5sz5680et9HthoL5eQOa9XFudUKojEHU0b9SyNhlOtv72Vufo4H3Wb
 n6+9dYqNnU4fFpZscv2en7KmqVctXCix8Sb10+xTBEAO5N5kimrnjn2coAQVHHWwr0UB
 593mnycEfRlwoDXSegZxNz5yYE234hqXbGjTJ5qT9Sa8Ee6VPUL0UMrfUt6qd3CfpFX+
 pb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764681710; x=1765286510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sXw+zlU9ZytV+KbuL3Lo9Daw+c/7AyiMgzUtu13lgVo=;
 b=q6mXG2pPa6/8bBv2v4KftrxdR4Mi0AL8MQvhFbHzPHsVDIPG3yeKbQxUHGhCLWeBSQ
 UZK/g9vMUaS9RDcnaeFlEnWaXA6+JEI84TogZE0+JZkWN6clCE4EA1rfJ+gOWUhw/ZuJ
 7eAONQ9jFRvrWN99QjAuxyhp0fEnNAESlRsL2JQDpe2BExRHqEG19CbJ55t+YhkN6lGk
 8gOfj6/PTMdNTYOewXytQj8KGsZVY0yxJpCzKJwYohKM0Wu4zG6l4azeaehN/OOHRsWr
 13HOmnYOhJ26zH/Mpsy3f0GrBXJ5dCamwwaCOEAT2JLiUWGLAXQ7mBUuvCEqqpMJSyr6
 S5Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwIt8oIjGj86u/QR8pB/h9okyXZD/mXKwTNsgolkELlJm8QOIq0gVARMTCeSE0vP/4/Z4OV71spAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXjcwLZmZVxBcmV0+vbWd2yZOOK5raY7jrt2KITI9i4dE1SaSW
 RAMaryUMdAXKLi1DiWdNoypyEuRAo23EVHqRndRg7dpjsmL4moyxxTomjA3dOM1njebw9tAIDGo
 CDzaHxiFILCZUYhCFa4YdvjkZ+UlS7+Wc1LduLFYynhZwJNpfSXPI
X-Gm-Gg: ASbGncsrdy59UrkOVW3xOGjFM66u9Dr+3O7F+B0M2ybwKg0sjrKLSOYAMsy+KK5iE3V
 o4wMnInICwLOSeQe1ZAK+nYZ0/G2ptmL9CF/iWNOoPXshSLU20+8t2z51/cfGtb/bJw322dHzK9
 XQNdF5PKBWn+rvn0dtKirC06FQk5KF/otcRBuNjHtIkvBXF++TCW6vwDRmVIJCG9RWkq0XyUSZT
 1Z/Nd62O+4tK0WmWUXCHF8I1D40fbtZrksSoHCt28LotYzgUkXKyqadGOtkYOhGLfxrQkB5xqN6
 2BC0Oz0tKJqi+GR1IEP6ya60oyumLaZJMXEzSmE=
X-Google-Smtp-Source: AGHT+IFQerVbP+TgAt0hu8ZFkBM9gB9GJFSza+hvmHNLmFZ3E4v1e93owjhl1bgRgatzYTEm26tvXhFcrqXrn2fSosQ=
X-Received: by 2002:a05:6512:1302:b0:595:7ee5:96c5 with SMTP id
 2adb3069b0e04-597cfae0f6dmr981907e87.2.1764681709762; Tue, 02 Dec 2025
 05:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20251030162043.292468-1-marco.crivellari@suse.com>
In-Reply-To: <20251030162043.292468-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 14:21:38 +0100
X-Gm-Features: AWmQ_bmivfU8rH3ZbgJq7bL5ad1nti03TM4dlm4Nxw_KzAKHtjbmwMmwpC9ao1g
Message-ID: <CAAofZF5J06=i=WQGR9CajDctBWzdku+qMF0oDaJJtqPxWGhzZQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] replace system_unbound_wq and system_wq with the new
 wqs
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Hi,

On Thu, Oct 30, 2025 at 5:20=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (3):
>   drm/atomic-helper: replace use of system_unbound_wq with system_dfl_wq
>   drm/probe-helper: replace use of system_wq with system_percpu_wq
>   drm/self_refresh: replace use of system_wq with system_percpu_wq
>
>  drivers/gpu/drm/drm_atomic_helper.c       | 6 +++---
>  drivers/gpu/drm/drm_probe_helper.c        | 2 +-
>  drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
