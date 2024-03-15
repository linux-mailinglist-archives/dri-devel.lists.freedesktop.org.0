Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12687D29C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5D61123C7;
	Fri, 15 Mar 2024 17:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LgAdGsvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A921123C7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 17:20:27 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so3281285a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710523226; x=1711128026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwAX4nwSw1BpGWmAiiHfKPKPhAsbNxBwd5lUsCTzQaI=;
 b=LgAdGsvfWkfjXehpZKoblZTYqQZtANQ0W9w8b+Xy0/NdHuwZZmJO0aB6cZt5byz3Vw
 DK6D07iiHgZgv+Y0597yY+HAIWJNpkxVkkgaA0kjgr/2mLDT33b1coj3IA7RQGIYgOjm
 EroF204Q0cVaU3eUIDHthv59EJK8YMSGY4u52SJFyIapirFx2Qsi+3vacQThwyBHK+h8
 wenFE0/1hfAk3CgPmtHVrmLF5EFXW21sV6Gy0CV2CPXGrBSLTR8DdoZwFiPqFMbZh5qU
 eKrFwIFbij+UHQEddrb1Lhzh9+AlmJULt5Y+XrAtqm0Vh8uX+CHjPKtiOFUFDucbcKGA
 /6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710523226; x=1711128026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwAX4nwSw1BpGWmAiiHfKPKPhAsbNxBwd5lUsCTzQaI=;
 b=DjKOi0mZjOan9kBkxnQA84hsXRfeMpJdfpeZKLgWMWkkHe1SgpLhNvePcpQQxDEXVz
 mYtWpwPUbU8Aj7HFalATATL9OOdm4uNlFOITczvwPII1F7TUw94LdvGKQj58QG7PTgkI
 TUq6zNv22SxeeKLFJGRUJHQkty//Vf/gW/qi9Clc33nprVspj8bf1UDhuZYykksAiNaL
 VfACuD0KakwccFhOuoVudoKO2HxvEtvymsl3OXP/xYEKNBFNLp9UQRPvaNIlKyaM5R/R
 nPc3E2EkxlFO97U8fK05D8/4eJZZ23lHsMyli4ul+QxIWEVJpgHmZlK3pyINYo+gcNqH
 9B4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6ZxsEts9MeG5njhuZo/YSw6oeT3Lq0ZPQWF37/qdLlXRLzghVa8LvR3yBINNMfk7/9mbhrcATlgwXfLAjNvbRfuO7nv8wIQcrOOKSDTwX
X-Gm-Message-State: AOJu0YyYZpZE+1F4a20tmLZT5p2Gb1UPX3TcbLnKRl7iGm07RQMvsj+W
 WBjBa2eMfXqGNuCrnzHlmoXq/Esv2hn9d+wg9g5KeMDvaG9auTWtTRflzFY18W1dT8A3nk5D5E+
 X9osSMNFHb7ly8jbT8+VJOZb2xCU=
X-Google-Smtp-Source: AGHT+IH3oICyMBuaPYkH/vdPPUm0CFjSt4vNdxpkF2VIOGaHx8olpd7wN05RI0TOibBnfV66eaTs9EbyMQKXPpkJx2w=
X-Received: by 2002:a05:6402:1f82:b0:567:3ed0:47ec with SMTP id
 c2-20020a0564021f8200b005673ed047ecmr4813763edc.23.1710523225862; Fri, 15 Mar
 2024 10:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
In-Reply-To: <87a5mzrgie.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Mar 2024 10:20:13 -0700
Message-ID: <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, Mar 15, 2024 at 2:28=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 14 Mar 2024, Rob Clark <robdclark@gmail.com> wrote:
> > When we first merged drm/ci I was unsure if it would need it's own
> > -next branch.  But after using it for a couple releases, a few times
> > I've found myself wanting to backmerge drm/ci changes without
> > necessarily backmerging all of drm-misc-next.
> >
> > So, maybe it makes some sense to have a drm-ci-next branch that
> > driver-maintainers could back-merge as-needed?
>
> That's a crossmerge instead of a backmerge, and I feel that could get
> messy. What if folks crossmerge drm-ci-next but it gets rejected for
> drm-next? Or the baselines are different, and the crossmerge pulls in
> way more stuff than it should?

Yeah, it would defeat the point a bit of drm-ci-next was on too new of
a baseline, the whole point is to be able to merge CI changes without
pulling in unrelated changes.  So drm-ci-next would need to base on
something older, like the previous kernel release tag.

> IMO the route should be drm-ci-next -> pull request to drm-next ->
> backmerge drm-next to drivers and drm-misc-next.
>
> I'm not opposed to having drm-ci-next at all, mainly indifferent, but I
> question the merge flows. And then the question becomes, does my
> suggested merge flow complicate your original goal?
>

I guess we could avoid merging drm-ci-next until it had been merged
into drm-next?

Basically, I often find myself needing to merge CI patches on top of
msm-next in order to run CI, and then after a clean CI run, reset HEAD
back before the merge and force-push.  Which isn't really how things
should work.

BR,
-R


>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel
