Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215977B8D87
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 21:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEAB10E190;
	Wed,  4 Oct 2023 19:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598AE10E190
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 19:38:30 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bff936e10fso15998411fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696448308; x=1697053108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bw5u1iYqP1gO7JpmF9fGALBGIOVHzGpkDwpUJegDcjM=;
 b=gLHgwxebbKTyOC1wQkeaV+kbhEWRBxhi6POHXsIcwdLQ8YSRdHYwa5MPoE98BVJ7Wx
 OeXaGX/7XUz05eV34CBjpnaFmpapHSKdGxQGC+TteRfqH9IjGGnL3x5CZFjZTYUsl/Ia
 t/0uFLxJerj/SIwk4KwqdlUTKS03mRO/oA6PmqbqMe4rfY3fQG9uATn+hqECr1TsuYGX
 Y4oEYsOkD37+HYXBrVy4KAPCfIk7d+hZWk2+pFoP5QuksoRvEvN/VVNYeTAuQ87m7si5
 zETGRIgnDOqlGqabzsDU3WyAVYdblIfI9n1Jp9KfCNZ4rVfQ4x6n7f5HXhj0tf0GZw/5
 VKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696448308; x=1697053108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bw5u1iYqP1gO7JpmF9fGALBGIOVHzGpkDwpUJegDcjM=;
 b=UY+JYLJRFOKnIIIZa1zrwcsd0dM2XyGdrw006vC32YHq4M0XUTFKOfqKBK2jUpDeOC
 insUD9fF8TZGeEUrBCQ/9fn5HEDy4d6hWb0yLxzAUv9fIYRB31uHVGsgpA1q4SyYMcKx
 epGgtq26tyGRPTOe8O1JQOugCvOaFapfE/4rLBQU0NHwuucaS2b0gn9mvcOPw51A+3Ca
 rkWgDXmtHQV60IZBl7E+7YPp1O0o89l+ngMCQQn8II91sJB19+kkQHUidmauvObrRd2E
 A9q0g11/O3VZIwp1GhT5cy4QzCn1/BdysHjEPOnEHUinCxOSmO8uwzumpTdYQPTAuInf
 rOeQ==
X-Gm-Message-State: AOJu0Yw63CAsxP6pnRnJobU59237Eii0joCPiizcxS7nLvGfMGFE9sMY
 9CptJTS1l1/kG1doc+9pObvenj0bAm2yTki8kmhxiZu+
X-Google-Smtp-Source: AGHT+IFw6GbFpaOxfk3hKLgHARQ8DgOiUAy5CpUdqqwqUxwl264aXGU99+YWJ9e7K10LGgmS+tFpYk4PRcna1DKzmME=
X-Received: by 2002:a05:651c:10ae:b0:2c0:8dd:9f39 with SMTP id
 k14-20020a05651c10ae00b002c008dd9f39mr609415ljn.12.1696448307771; Wed, 04 Oct
 2023 12:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZRWVpCaQUefzdZ4-@intel.com>
 <CAA_UwzJqwigNvMZ9C_tu0Hb5cLRq0u44FXa9+h3m7X05psGYhQ@mail.gmail.com>
 <ZR2giGixi7OqLzvs@intel.com>
In-Reply-To: <ZR2giGixi7OqLzvs@intel.com>
From: Ray Strode <halfline@gmail.com>
Date: Wed, 4 Oct 2023 15:38:15 -0400
Message-ID: <CAA_UwzJSzCBQGSVKhd0e4JE1xM7JCkqEK7hcDnPzgorSvQxsSg@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 daniel.vetter@ffwll.ch, airlied@redhat.com
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
Cc: alexander.deucher@amd.com, mdaenzer@redhat.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 4, 2023 at 1:28=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> No one really seemed all that interested in it. I'd still like to get
> it in, if for no other reason than to make things operate more uniformly.
> Though there are lots of legacy codepaths left that still hold the locks
> over the whole commit, but those could be fixed up as a followup.

Ah I see what you're saying.

> > > execpt I went further and moved the flush past the unlock in the end.
> >
> > Is that necessary? I was wondering about that but there's this comment
> > in the code:
>
> I'm not really sure there is any point in doing this otherwise.
> It would just change which thread executes the code but everything
> else would still get blocked on the locks the same as before.

Well in my case, I just want driver work to not charge the process cpu time=
.

But I get what you're saying, Checking if new configurations are valid
shouldnt block on existing configurations getting applied.

Doing it outside the locks isn't necessary to prevents deadlocks, it's
necessary because you're trying to avoid contention when there doesn't
need to be contention.

Your patchset sort of has a different goal, but it solves the issue I
care about at the same time.

I'd be happy if it went in... Daniel, Dave, what are your takes on this?

--Ray
