Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154228C7717
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA9C10E00D;
	Thu, 16 May 2024 13:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fD9w8CJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0C10E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:04:56 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-628a551d10cso137263a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715864696; x=1716469496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHzuz0CH6x1TfON6MZpHmTkKmz49+sk28IRI1d2Qybo=;
 b=fD9w8CJIvTSbtR77gjqCShf54mh36r3paLpsWLm/MZDTF+NBtPSvhMOWrPQToLTqye
 fW9IC63JtQElubXaeLeCISzLX9UIcYGkFJBdX21qmrIeurANkwRwy3L4NYCaVltOINgb
 FZBIM94ihs2Hsn7sRrqbZCPSTY9er6gX0lsCpUuSfBDAi0LsDL948EtmrZxXfcv4AVSO
 JBNezCFS3rlVWIjrOU14WeDiCC2AMe0JwAZoT6mGV066yw42BeUIeLRrrjWP/olPukjI
 i5f2BRAFc8hXUD6uKVeSg2zB9oXFtF7q8gsUaSF0yuwnn+1Eqa6o21ydFHsfLzIgdCVz
 Tb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715864696; x=1716469496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHzuz0CH6x1TfON6MZpHmTkKmz49+sk28IRI1d2Qybo=;
 b=ZLcEO0wkorH7q2+Q5ycomrnnxA7XqMEKsUN02ZU9mwbNr5Nwa19kDLVzp0EljmDBqh
 FhZdYplcWYfROJHkhKI4PyUgoi5G98B2s1YkTFwRUF1rmsEJpKi0/lIobe/d4y9WWYpm
 06Ew4O3vgTYUk12XwzTPA0rzAKLI46qlQjBLsEbb4l79id3cRslGwM4iDNwfKNPVfiZT
 SXsr78IGyPkzhiu/774WeMcagC7Jgk0iqdEjy+zhhpL4vMXyD85bj5i44dSacKZ+IeLA
 MEJ7MvSCPlOpr6l4JfEbhEHk1jfONErUvLBSMHLZM0FmOngwPZtG8nk6/6OBEgPhMj4R
 tQeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Q4yjLNg8Y+xg/7U19SterQIJRVRPphB+oOQH7oZyyr22ffmPOpcdm8SBe47/uRiBYwz5ZckfU+7ywltBfr2OagsvVa0GTgtNgnGlSw+O
X-Gm-Message-State: AOJu0YyIWifQBVtSSZhKnH98wnKSuNt3WmotcSr09FSH4ic1yXYXkQrM
 4ryNFphOKuUDvsD5UAIkdvkLKIxemJ4pxQOGvSB6nfDm6ous47PnUC6yKrimExhZt/hqN7dY53v
 EDzJMpck1cGoe0fnF1YIFaQhhRCw=
X-Google-Smtp-Source: AGHT+IGD6aSzAfB1khSEG7/IvHVW4QgklsGIhvcD1YMnYiRrZrtPPyg+BeZe9Crho+h371LSrzuIesWHhZK9P4g1BzY=
X-Received: by 2002:a17:90a:778b:b0:2b6:5156:5b9b with SMTP id
 98e67ed59e1d1-2b6ccd6c165mr16100840a91.35.1715864695987; Thu, 16 May 2024
 06:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
 <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
 <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
 <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
 <CAHk-=whuCX-NAGOLzwn5sObPDJX-pdqamZ7YTpHFHODAMv4P+A@mail.gmail.com>
 <87v83eb2sn.fsf@intel.com>
In-Reply-To: <87v83eb2sn.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2024 09:04:44 -0400
Message-ID: <CADnq5_Nw_Tr5DABc3XGFpzQhePnVNGW-tzSZAQq0CL=s0iT8sQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, May 16, 2024 at 4:42=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 15 May 2024, Linus Torvalds <torvalds@linux-foundation.org> wrote=
:
> > On Wed, 15 May 2024 at 16:17, Dave Airlie <airlied@gmail.com> wrote:
> >> AMDGPU, I915 and XE all have !COMPILE_TEST on their variants
> >
> > Hmm.  It turns out that I didn't notice the AMDGPU one because my
> > Threadripper - that has AMDGPU enabled - I have actually turned off
> > EXPERT on, so it's hidden by that for me.
> >
> > But yes, both of those should be "depends on !WERROR" too.
>
> Fair enough. Honestly it just didn't occur to me.
>
> The main goal here was to ensure the drm subsystem does not have any
> build warnings, but without halting CI on any non-drm warnings that
> might occasionally creep in and that we can't fix as quickly.
>
> If there was a way to somehow limit WERROR by subdirectories, without
> config options, I'd love to ditch the config.

Right.  Same thing for amdgpu.  Our CI was often breaking due to
-WERROR in other subsystems or with compiler updates.  Maybe it's
better now.

Alex


>
> > Or maybe they should just go away entirely, and be subsumed by the
> > DRM_WERROR thing.
>
> For i915, this was the idea anyway, we just haven't gotten around to it
> yet.
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel
