Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C478EE65
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 15:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6420C10E657;
	Thu, 31 Aug 2023 13:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228A610E657
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:18:31 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5735282d713so480809eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693487910; x=1694092710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHwmmwrGfDSkCjztvNTCgRkwWwsnvAt3/1zqnbkw4UE=;
 b=kvmAl1GpkzSI4FuXYBXt4kE6cWvtjTuBqSFNvC4T88DlgOiTU8Y1f2sSn7DxhSbuIh
 KG++yzc2vz4Wl0UQ5hx+D+svEi0PolOsdKzuz9XJ4Xmh6A6z86Die2LtafLAVVKBc3Hd
 +9rG0NpoFNJHTNvAPnO1hqwN5SN/9SrN0Ncke9R8eP9A+tKr7bVc2RYpcLDDWJZq9K7Z
 Je6LgacIKPohQPZIwVIkXQx6k/8mWtkGrjYpII1x1WAzjh9FGz+TWlpGlcuJxvF16tPl
 3Q4J3fy00afBNAClWy5AC+0KdvxDgv4bODOofM+GMy5aUwh18F60ddG5o7PLm6Bbb3Tt
 s5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693487910; x=1694092710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHwmmwrGfDSkCjztvNTCgRkwWwsnvAt3/1zqnbkw4UE=;
 b=SBugIUb23Kf7G6BRgZ6QKyiSbzo9jmiunYVAo2usX03hV39C04MhWvXf9YkEs9DDrX
 Fs5/wOzcaB8eYX0NT7xqi1YWOhaO4KI7Dep8HmKrCvvVXZccjpZPJ0HA9W66VNROeZdh
 fCgBlB7FAdb5/vzsf+NEELZ3jbFoLGnidbVQI5n44a0ua5h7gYiFT1wr0nrloc1RLi6U
 qpqW1HkdsFIC7N98uV+jIzwQytMuXQJREzgqc3I6XXyHQdgZ83ZO/pkCp3IkksR0C5Q6
 hk7TWflicnqUSsimwmljdyDil/B6sOqiXmCyVJbUV2om/gPzFoKxsVPtZ5wys9APVDVA
 aU5w==
X-Gm-Message-State: AOJu0Yz+sO0OuVXl5uuYTfQZbgC5EnwetRSDD8ZWae3Y5n2s/3W+4SKg
 RwI1TmTxJ08vPThRc8tcwpt2qUvhEcnlWYRSO8k=
X-Google-Smtp-Source: AGHT+IEKwsKaxX8FN7thNvTRv4YUKZ/hXURRhwTFIgLKkuYrezXPSfhwY/Atro+sW4IO7Vj76e+t2OY3b1M7LZ7lpJE=
X-Received: by 2002:a4a:3013:0:b0:56d:e6:21bf with SMTP id
 q19-20020a4a3013000000b0056d00e621bfmr5008308oof.0.1693487910302; 
 Thu, 31 Aug 2023 06:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
 <94b893ef37fe0cc0bcc52e8b54c62be3853a7bbb.camel@redhat.com>
 <CAHp75VcNyE9uJu8-v2eVWRdZ3-nm2r-kdxE-naQB4VN6zxPFxg@mail.gmail.com>
In-Reply-To: <CAHp75VcNyE9uJu8-v2eVWRdZ3-nm2r-kdxE-naQB4VN6zxPFxg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 31 Aug 2023 16:17:54 +0300
Message-ID: <CAHp75Vc6Bj87V5HVZeNXJRmN1qBYP8_eDDSj5tLnfL7d81o9+w@mail.gmail.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
To: Philipp Stanner <pstanner@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 4:16=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Aug 31, 2023 at 3:22=E2=80=AFPM Philipp Stanner <pstanner@redhat.=
com> wrote:
> > On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@red=
hat.com>
> > > wrote:

...

> > > I'm wondering if this has no side-effects as string.h/string.c IIRC
> > > is used also for early stages where some of the APIs are not availabl=
e.
> >
> > I forgot to address this point in my previous reply.
> >
> > Who's going to decide whether this is a problem or not?
> >
> > My personal guess is that this is unlikely to be a problem because
> >
> >    A. either (v)memdup_user() is available, in which case
> >       (v)memdup_array_user() will always work =E2=80=93
> >    B. or (v)memdup_user() is not available, which would cause the code
> >       that currently uses (v)memdup_user() for copying arrays to fail
> >       anyways.
>
> It also uses something from overflow.h. I don't remember if that
> header was ever been used in early stage modules (like
> boot/decompressor).

Also we need to be sure UML is still buildable. Dunno if they are
using anything from this, but it appeared to me recently that someone
tried to optimize something using (internal) kernel headers and broke
the build in some cases.

--=20
With Best Regards,
Andy Shevchenko
