Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F878C2AE0
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 22:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9510E0E7;
	Fri, 10 May 2024 20:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="imoqo6py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2066710E0E7;
 Fri, 10 May 2024 20:04:16 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso597077866b.2; 
 Fri, 10 May 2024 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715371454; x=1715976254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3w76oPIiLr/d19BookiO28Dm/LSyOamo5VRLJKyQTcM=;
 b=imoqo6pyyNKaqchacgMs9IPfKqOcdVj+K3xK/r4rEjkBOoLIlUJPQrljSe23d+smUX
 UjRPn4zOvV1NmDfmWgA0/sUB0jLrtlyhtTtyhyZfA4eUJU9Zkam4uIDFgeRoZW0NzcWq
 4UR7XQ0K8N0hRW39cphHsWtCt/3u1MuLIxb+sbNYyi1wV4MlB/Dk8YpygpD770bs6viJ
 zEuwrL+DNqRCq8KrALf3uqoqIewgcGAhsvGaiE/I/Bpnt8LTG38Y6jXgEZxqoi1wxRF4
 s6ldAAKVp0ntB5gtxCHGqHf7NU1n70gp4LPuFjDgkPWPL7hfBSL7o5zrqAUSjw8IgZco
 bzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715371454; x=1715976254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3w76oPIiLr/d19BookiO28Dm/LSyOamo5VRLJKyQTcM=;
 b=edcTaSfvSTnCWVqQMkIaPoviSOhTMzeluwBEDhOLla8cM7gyGGstefIUAVhqZWq86D
 hikD5PCTqTjkkWsCgoCZ1rggZ+BHv9+ztIAww7RYSv4D7/cGlAt+IUaktlaYnsL3zYxx
 +rUEQEur8e8QrpVgW9eLFzuPnvlWbCP2yBg3qXSGyhmvdquqL0zRzwZWki/fMp9cx7TS
 oOccVoVkg9+1VSvLaCfJ304SET7wLcj6BCs7QGHjxD9rLpklDrl4ev7aCLF/4iPURLDM
 QmTAq6rosivJ6zW6X5qgr3CEiFppJJ2lkVxOePZhLd7dIZ0djJKgGQDwLdJf1FlSnOeq
 n2CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSUp9n74GitI5oz0N2aMv1THZVJNeV1bm8SQEbo4jN7BMALYCn/mh9bGvezNm/+YJAdq/BObxVyTS3TnmHQLI2JYA4Fo2dtOdeH1eJwoZeGd5WS6/GWlXFO9JF86INCliMDf+EjV/2n9YWQNxj87DH
X-Gm-Message-State: AOJu0Yypt7I6kdkBI6U+Hvf8+lY2v8/R2bzT8Rv0m4lYN/E29AvaRfsA
 6Dr9TnFnxIVamfvWWYRmGiSsfTX0IUpGT3BdBFZ8+ZYLQtN4CHqq4Vf7jCl/6caxsF38kwl9eKx
 cRtWkpdlZztgP5wXfVPe30LbVIzk=
X-Google-Smtp-Source: AGHT+IEOZIt/kgQAQ9S2hYehUkMrxzbU+PDxfVocTwJSC9s/TAZ5/r2D+c6d3cBlKbP4DaN8BXoB1u0mHygG1fPm6z4=
X-Received: by 2002:a50:9e61:0:b0:566:d333:45e8 with SMTP id
 4fb4d7f45d1cf-5734d5ce24fmr2906201a12.20.1715371454083; Fri, 10 May 2024
 13:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
 <87o79ehtbz.fsf@intel.com>
In-Reply-To: <87o79ehtbz.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 May 2024 13:04:02 -0700
Message-ID: <CAF6AEGvTkL=JxGDaOab9XpJ4htWQnBA1dTEOUxBUTAavM0DB4w@mail.gmail.com>
Subject: Re: [PATCH] docs: document python version used for compilation
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, 
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

On Fri, May 10, 2024 at 3:09=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
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
>
> Minimum versions here also means sticking to features available in said
> versions, for Python just as well as for GCC or any other tool. That's
> not zero cost.

At this point, the cost to having a lower minimum version is pretty
small, so I'm not worrying too much about it.

Maybe once kernel developers discover mako, and start generating more
at build time, we'll have to re-evaluate. ;-)

BR,
-R

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
