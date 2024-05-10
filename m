Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB268C2253
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139E810E786;
	Fri, 10 May 2024 10:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jpgFp/wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA510E6AB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:39:29 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so1380988276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715337568; x=1715942368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSdbA5qcDd+aDIma3WfgeZKWbBykON/+pmgqe3sFuHA=;
 b=jpgFp/wdQGixpskZh9ekN8B1+5L0oMeVUhnZH4BUckFLTdp0EJYvx0t0xG+TToAV29
 iGpEcyUo5nEcXhceUxTnQpefsMhqHHSqI9PnekwE6K/3m0rVz7F9HWxP3oUDJgHfTMZ1
 EOjsrXJz2m91K2lmcJLTfRIKV0lThMKx7Ok9lxzVtNBuzPdax3PGKiPRjlJBZ3nwoyOK
 OPJuo5OJba46Gu+XNSIAB8KcgZU7zbZw0vmazX7bzNLO3E1YtK1Abjw4gwHbK0HJy0DP
 mOivcwP1MiTsn73FteI2HpiQukP8Fyb3npPGUHN5H3AG84/T4qiN1plq16XqsVrVpFBv
 DI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715337568; x=1715942368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSdbA5qcDd+aDIma3WfgeZKWbBykON/+pmgqe3sFuHA=;
 b=kjTpSF2e5wy87t9e+x1QBUbeKsbrEJTgTqiWxAjkNEUzVMu2AQRsAwy4RMfE3HsRqy
 /It55mG1aT5v5m7Ppbc3YxjysUVKBPeacbsYIKGLIhv+CUCLXqFbJdLGlJuVqF04sNko
 34g2qZhKj7KCi1AUB5YVE3gZpeD5M1t3wYBWchDj1FDWwRPAPCdaZ5nNz1gb4H2wWTpj
 EYweo1vK4NhaQY6JoJt1qB42fZ/jiFEGcrQ2y0E2bki/Uj79vKPOz1LT+qGQ3lROiXxf
 LmnLk/1l1Ev/h74Hl5S808MDePArn5U+537//KfucFj4iK8BIyB+TkeZFBcgB4T6eclJ
 cmOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf6LYKu4Sfrx3SjL+QaWk3bPrySwCK7EGBmjS3p1GKdCfsNtD5oZsstuA87NTo/iDGn77Did4M6J2WYKj7gGN56Vrwntb63o3YVBCujxqQ
X-Gm-Message-State: AOJu0Ywu7lEdmlv/vKo5x6o7jRa44xC+bU1jlw5K7nlqoL5f2NSd0wC4
 gEWUWRRvVaUkYbwU1SUmVQVsGrTzvjs+/IpxdE9DYULo3sJQ902rEmCfuC/Kk7fAx+A6+AChuX3
 5+Ib2xCXUbpMNc1ZF3ugH5FIKd+fhuSvEJexOgg==
X-Google-Smtp-Source: AGHT+IE60A+Q6FsjMepyIFHqpurncO2vDMU31WvgWXjOym8lcgrnre7Psf41fL/Tzu+g3TUoglYPMxGy1JdpTZZOp70=
X-Received: by 2002:a25:9e11:0:b0:de4:5c34:b8d6 with SMTP id
 3f1490d57ef6-debcfb72954mr4114585276.8.1715337568134; Fri, 10 May 2024
 03:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
 <87o79ehtbz.fsf@intel.com>
In-Reply-To: <87o79ehtbz.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 13:39:17 +0300
Message-ID: <CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
Subject: Re: [PATCH] docs: document python version used for compilation
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 10 May 2024 at 13:09, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > Em Fri, 10 May 2024 11:08:38 +0300
> > Jani Nikula <jani.nikula@intel.com> escreveu:
> >
> >> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wr=
ote:
> >> > The drm/msm driver had adopted using Python3 script to generate regi=
ster
> >> > header files instead of shipping pre-generated header files. Documen=
t
> >> > the minimal Python version supported by the script.
> >> >
> >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > ---
> >> >  Documentation/process/changes.rst | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/Documentation/process/changes.rst b/Documentation/proce=
ss/changes.rst
> >> > index 5685d7bfe4d0..8d225a9f65a2 100644
> >> > --- a/Documentation/process/changes.rst
> >> > +++ b/Documentation/process/changes.rst
> >> > @@ -63,6 +63,7 @@ cpio                   any              cpio --ver=
sion
> >> >  GNU tar                1.28             tar --version
> >> >  gtags (optional)       6.6.5            gtags --version
> >> >  mkimage (optional)     2017.01          mkimage --version
> >> > +Python (optional)      3.5.x            python3 --version
> >>
> >> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point=
 in
> >> using anything older than the oldest supported version of Python,
> >> i.e. 3.8 at this time?
> >
> > What's the point of breaking compilation with on older distros?
> > The idea of minimal versions here is to specify the absolute minimum
> > version that it is required for the build to happen. If 3.5 is
> > the minimal one, then be it.
>
> AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
> at least be aware *why* we'd be sticking to old versions.

From my side, the 3.5 was chosen basing on the previous feedback from
Jon Hunter: https://lore.kernel.org/dri-devel/20240412165407.42163-1-jonath=
anh@nvidia.com/

After checking distros that I can easily use, I don't think I will be
able to test the script with Python versions earlier than 3.7.3
(Debian oldoldstable).
I can try setting up Debian stretch (old-old-old-stable), which has
Python 3.5 and so cover the needs of Jon.

>
> Minimum versions here also means sticking to features available in said
> versions, for Python just as well as for GCC or any other tool. That's
> not zero cost.
>
> I guess there are two angles here too. The absolute minimum version
> currently required, and the, uh, maximum the minimum version can be
> safely bumped to. Say, you want to use a feature not available in the
> current minimum, how far up can you bump the version to?
>
> Could we define and document the criteria (e.g. based on distros as you
> suggest below) so we don't have to repeat the discussion?
>
>
> BR,
> Jani.
>
> >
> > -
> >
> > Now, a criteria is needed to raise the minimal version. IMO, the
> > minimal version shall be at least the minimal one present on most
> > used LTS distros that are not EOL.
> >
> > I would look for at least 4 such distros:
> >
> > - Debian
> >
> >   Looking at https://wiki.debian.org/LTS, Debian 10 EOL will be on
> >   June, 2024.
> >
> >   Looking at:
> >
> >       https://distrowatch.com/table.php?distribution=3Ddebian
> >
> >   Debian 10 uses python 3.7.3.
> >
> > - Looking at Distrowatch for openSUSE Leap 15.5, it uses Python
> >   3.6.15 and has an EOL schedule for Dec, 2024.
> >
> > - RHEL 8.9 uses a bigger version than those two - 3.11.5 - again
> >   looking at Distrowatch to check it.
> >
> > - SLES 15 SP4 and above uses Python 3.11, according with:
> >   https://www.suse.com/c/python-3-11-stack-for-suse-linux-enterprise-15=
/
> >
> > From the above, IMO kernel shall support building with Python 3.6
> > at least until the end of this year.
> >
> > Regards,
> > Mauro
>
> --
> Jani Nikula, Intel



--=20
With best wishes
Dmitry
