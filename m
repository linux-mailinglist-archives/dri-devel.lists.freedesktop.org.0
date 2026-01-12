Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89374D13E03
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E686610E410;
	Mon, 12 Jan 2026 16:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="NlChRciG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A5410E410
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:04:00 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1FE8C33F73B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:03:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1768233839; bh=hr2la+8/JBfPcYjUwUtbWIuE339Cr77t3Ej9auuplwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NlChRciGGkDlE4G8RhDwUhzAEhco27lg76VyntBIXVJgDDNpJBe1hFdc+lXga0beG
 h14L4N881WEya0+LG040q+tvFOvduw5YM0NEeMZmdNW/qGbq7SHpyTBxtutfeEg4eI
 D6MpyhGBPxj/ExZm6qXQ6owA8FIc94f+PR6B5BRZWEW8sE+A+nTHxyD+fWlzMxBfcv
 Te+CN+sN+lGvOHueLIGf7pnQnT8/QuX3b+I3dYAVMHuU9BIM1530QW3y3q+Mo+Kpko
 HrI9wn3HfxLRIched+iKS+vCoKRfYk0209PUmUgMj3C4xjH6m2n1re0Z+GO1hMLVDP
 g51IdTR/h13IQ==
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-792768a0cd3so16139467b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:03:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV06ZlS04z1wToyP5x+X2eIFqenkY0aBGDvLQu+49qHeecapaoxX03B/jokMCVUVvSvQ/Pm8ed6bxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIXVMPiD9dVQzbgOukPkI8cFjO7/kczGDErDcGmetK4CDLQJPP
 uNxZbI6wZ8cubP0DzlR5QzNh8ylGoA07WRD/eHa4iux9qDt0lx25zUWtVXc4GnTrxA9G9nhguR0
 eEMIiWW/Abl7adnFechgReMeY+FwV1YI=
X-Google-Smtp-Source: AGHT+IEhESDidL9ipWyioVB98E0jff2u4z7/bM7Ubxstme7Bh1kkDw05miCNdkOT9ec3RpZmQlooAES9QRtdTG4sTE0=
X-Received: by 2002:a05:690e:1c07:b0:644:2e1b:c8bb with SMTP id
 956f58d0204a3-64716c58c47mr14446417d50.59.1768233837397; Mon, 12 Jan 2026
 08:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
 <385071a7-15c9-4265-87b0-fe30dcf6f87e@intel.com>
 <702511b9-28bc-4ea0-809c-f14135a80af1@mailbox.org>
 <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
In-Reply-To: <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Mon, 12 Jan 2026 17:03:46 +0100
X-Gmail-Original-Message-ID: <CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com>
X-Gm-Features: AZwV_QiS6uAS3cm2nJoqLpeAb3FcK1vPpWaMcJpsefkzkTvrPaAofwG-GcaXOKY
Message-ID: <CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com>
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar,
 Naveen1" <naveen1.kumar@intel.com>, 
 "Syrjala, Ville" <ville.syrjala@intel.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
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

> > I see no request for being able to mix sync & async plane updates in a single commit.
> >
> Sorry maybe I might be creating more confusion or my words are not
> giving clarity.
>
> Let me try to put it in simple words.
> The
> comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640)
> from Xaver says that disabling of cursor plane along with a sync flip
> should work.
> Uma in the
> comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2863599)
> has acknowledged the changes.
That's about a plane that was previously already disabled by a
non-async atomic commit. The issue is about the async commit failing
in a sequence like this:
- disable cursor plane in sync commit
- disable cursor plane in async commit + flip on the primary plane

I would *in general* like to be able to use the cursor plane while
doing async flips on the primary one, but I think doing that requires
more discussion on the high level API design first.

- Xaver
