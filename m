Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E58A8A914
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9612810E385;
	Tue, 15 Apr 2025 20:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TyDFvOIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795AF10E385;
 Tue, 15 Apr 2025 20:17:35 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7040ac93c29so61983197b3.3; 
 Tue, 15 Apr 2025 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744748254; x=1745353054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2f4lqBJ3KU4xN2C63AmFZML3WVt9PkuM4udxa8upYQ=;
 b=TyDFvOItHgQ6PIePchxvq++seiVfSRa8d7sGKdjjCNaPBwKn41viTQQZyRGExw5+1+
 inJO5ol5Dl0xn7mRvSbpL0UWBckjChJJaj/z1z8alJ1oOhLiMis3BwCdZTBlbk1U8fLr
 voE0HXSz1nQKlQSGglLwjkc14XYGEwwhM1y+lYBI5CcezqlRlPtV5ulg6GeS7F/CDMJY
 U8pnJSWvV7VcgsrPULmzwbNuG94NbW9aP59SiZuRGPXM0mN4mKxrIAuY3uHnesCeVkRV
 24gnnDSJvJW2BHooLJwX8JB7iq6evzbLfEQt0V/Vle5iyXyqfGpZfvcVIejFQkrkoX3J
 l/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744748254; x=1745353054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2f4lqBJ3KU4xN2C63AmFZML3WVt9PkuM4udxa8upYQ=;
 b=pxORBRsxeriHXsGdER+v57PVFXRjZtjEacZiBav9UVjxj6dntP2kLYwqOh9HMgajm7
 2RYaw0iWV0xBvONyWGvnSzqbvWIRXrsc/7IbUzYPjCo4quX8fD0U73xQ48E3xZtJy0nO
 gR+w8+SWA1GlSKJZifkAHV9L117LftPqA2gtAhIcIyqjk2CnzsI9GTBLb6g0V/51++Km
 3hravM+Zyd/NOHf8hLaYyHbN3FK9HFzKQtjFKXSudsosTc4b3PfMyHt/fI2PsZSUuEWJ
 QfdWxFJo/IJ+LlgKfCdXX1Kz0WgxCY7QGWGfYRHiq7C+1/YwFfVa/HFtr5gv2Wkqnsxw
 EfLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2BzGdPN/1QkCnGGrkE6NJg2el53BwUIr20VQwmXpoHBtRHKpCc6jj4qu4P+D06COtfwYUVd0EcpYEJwuyGw==@lists.freedesktop.org,
 AJvYcCV4g1BPhLdrfxfKt8lTYn6j/gVZsT4mfV6qI+1zCLuQXrwQWi3TATwvJcpdzqFgdhmbqscGqsKh@lists.freedesktop.org,
 AJvYcCVVk3Isvcf1pWoThEltZFYGKGiMZ6sJ9xyFYw6OEKUotmGMLwqbL4jlJS4n2K8c6l47Ez2I6ESKEAXF@lists.freedesktop.org,
 AJvYcCX5U1D26KF3fHzM1WUI/GsphSocpkjykwRmYnrFPeEdaFA1DHBGgUwKZBMV2veUPmMwY/VVwmS2xsMR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqNXsqSOIVOLXAFlhA9eiAGLKN2v0bBs/vYdkSpnhB+NjX4tKs
 m0mFuAu843yrXj7uYJmEUeHk8KQeVV5tV75HBKowfoS+Xp38ZWLcsfoKuOoPfSpcJDfijRQ9t1Z
 nVro7NWUDGpNlRC6mEa3w0AtLut4=
X-Gm-Gg: ASbGncven1SvycU7Qo2MtsXFNszPkV0gSBOI8Q5pUKNVo8hy9OcnjedWo6G0ple3MhN
 Qk2+fEgDyyTIl39htCyPC0FwdKapoOX4RtLr9i5DdM/Mq/Fdt4LBvnt4bWK064keZFr8t8C3Isq
 bKhhXW/4So/mG4PCQ5DHQ1FUCKBZ8/8kA=
X-Google-Smtp-Source: AGHT+IHASz86QMUepPNXOhocPuVmLHD9gr+x/9kxgl75W95uEZj+zDqeKUtyT5YmfO9onCBuAwS9eq00pIaqEmsXvA4=
X-Received: by 2002:a05:690c:4491:b0:702:5927:cf74 with SMTP id
 00721157ae682-706aca34f9emr12312777b3.0.1744748254431; Tue, 15 Apr 2025
 13:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-24-jim.cromie@gmail.com>
 <d97fa4de-ee0c-4bee-9cf2-cd3a343e3439@bootlin.com>
In-Reply-To: <d97fa4de-ee0c-4bee-9cf2-cd3a343e3439@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 14:17:07 -0600
X-Gm-Features: ATxdqUH2ijE33CYVEiEjLWi5zzDtsvJCrFygD06lZ-2beemv0ZLcXrrrFfEANFE
Message-ID: <CAJfuBxxR9GZwRmVCuu=at2RUXT_pUWHrG4V61G+WjQSKJnh2Fg@mail.gmail.com>
Subject: Re: [PATCH v3 23/54] dyndbg: treat comma as a token separator
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Tue, Apr 15, 2025 at 4:05=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > Treat comma as a token terminator, just like a space.  This allows a
> > user to avoid quoting hassles when spaces are otherwise needed:
> >
> >   :#> modprobe drm dyndbg=3Dclass,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p
> >
> > or as a boot arg:
> >
> >   drm.dyndbg=3Dclass,DRM_UT_CORE,+p  # todo: support multi-query here
> >
> > Given the many ways a boot-line +args can be assembled and then passed
> > in/down/around shell based tools, this may allow side-stepping all
> > sorts of quoting hassles thru those layers.
> >
> > existing query format:
> >
> >   modprobe test_dynamic_debug dyndbg=3D"class D2_CORE +p"
> >
> > new format:
> >
> >   modprobe test_dynamic_debug dyndbg=3Dclass,D2_CORE,+p
> >
> > ALSO
> >
> > selftests-dyndbg: add comma_terminator_tests
> >
> > New fn validates parsing and effect of queries using combinations of
> > commas and spaces to delimit the tokens.
> >
> > It manipulates pr-debugs in builtin module/params, so might have deps
> > I havent foreseen on odd configurations.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> > - skip comma tests if no builtins
> > -v3 squash in tests and doc
> > ---
> >   .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
> >   lib/dynamic_debug.c                           | 17 +++++++++++----
> >   .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++=
-
> >   3 files changed, 39 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 63a511f2337b..e2dbb5d9b314 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > @@ -78,11 +78,12 @@ Command Language Reference
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> >   At the basic lexical level, a command is a sequence of words separate=
d
> > -by spaces or tabs.  So these are all equivalent::
> > +by spaces, tabs, or commas.  So these are all equivalent::
> >
> >     :#> ddcmd file svcsock.c line 1603 +p
> >     :#> ddcmd "file svcsock.c line 1603 +p"
> >     :#> ddcmd '  file   svcsock.c     line  1603 +p  '
> > +  :#> ddcmd file,svcsock.c,line,1603,+p
> >
> >   Command submissions are bounded by a write() system call.
> >   Multiple commands can be written together, separated by ``;`` or ``\n=
``::
> > @@ -167,9 +168,11 @@ module
> >       The given string is compared against the module name
> >       of each callsite.  The module name is the string as
> >       seen in ``lsmod``, i.e. without the directory or the ``.ko``
> > -    suffix and with ``-`` changed to ``_``.  Examples::
> > +    suffix and with ``-`` changed to ``_``.
> >
> > -     module sunrpc
> > +    Examples::
> > +
> > +     module,sunrpc   # with ',' as token separator
> >       module nfsd
> >       module drm*     # both drm, drm_kms_helper
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 0d603caadef8..5737f1b4eba8 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -299,6 +299,14 @@ static int ddebug_change(const struct ddebug_query=
 *query, struct flag_settings
> >       return nfound;
> >   }
> >
> > +static char *skip_spaces_and_commas(const char *str)
> > +{
> > +     str =3D skip_spaces(str);
> > +     while (*str =3D=3D ',')
> > +             str =3D skip_spaces(++str);
> > +     return (char *)str;
> > +}
> > +
> >   /*
> >    * Split the buffer `buf' into space-separated words.
> >    * Handles simple " and ' quoting, i.e. without nested,
> > @@ -312,8 +320,8 @@ static int ddebug_tokenize(char *buf, char *words[]=
, int maxwords)
> >       while (*buf) {
> >               char *end;
> >
> > -             /* Skip leading whitespace */
> > -             buf =3D skip_spaces(buf);
> > +             /* Skip leading whitespace and comma */
> > +             buf =3D skip_spaces_and_commas(buf);
> >               if (!*buf)
> >                       break;  /* oh, it was trailing whitespace */
> >               if (*buf =3D=3D '#')
> > @@ -329,7 +337,7 @@ static int ddebug_tokenize(char *buf, char *words[]=
, int maxwords)
> >                               return -EINVAL; /* unclosed quote */
> >                       }
> >               } else {
> > -                     for (end =3D buf; *end && !isspace(*end); end++)
> > +                     for (end =3D buf; *end && !isspace(*end) && *end =
!=3D ','; end++)
> >                               ;
>
> Why don't you use the skip_spaces_and_commas here?

yes, thx. I will.

>
> >                       if (end =3D=3D buf) {
> >                               pr_err("parse err after word:%d=3D%s\n", =
nwords,
> > @@ -601,7 +609,8 @@ static int ddebug_exec_queries(char *query, const c=
har *modname)
> >               if (split)
> >                       *split++ =3D '\0';
> >
> > -             query =3D skip_spaces(query);
> > +             query =3D skip_spaces_and_commas(query);
> > +
> >               if (!query || !*query || *query =3D=3D '#')
> >                       continue;
> >
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > index 465fad3f392c..c7bf521f36ee 100755
> > --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > @@ -216,7 +216,7 @@ function check_err_msg() {
> >   function basic_tests {
> >       echo -e "${GREEN}# BASIC_TESTS ${NC}"
> >       if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > -     echo "SKIP"
> > +     echo "SKIP - test requires params, which is a builtin module"
> >       return
> >       fi
> >       ddcmd =3D_ # zero everything
> > @@ -238,8 +238,27 @@ EOF
> >       ddcmd =3D_
> >   }
> >
> > +function comma_terminator_tests {
> > +    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
> > +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > +     echo "SKIP - test requires params, which is a builtin module"
> > +     return
> > +    fi
> > +    # try combos of spaces & commas
> > +    check_match_ct '\[params\]' 4 -r
> > +    ddcmd module,params,=3D_           # commas as spaces
> > +    ddcmd module,params,+mpf         # turn on module's pr-debugs
> > +    check_match_ct =3Dpmf 4
> > +    ddcmd ,module ,, ,  params, -p
> > +    check_match_ct =3Dmf 4
> > +    ddcmd " , module ,,, ,  params, -m"      #
> > +    check_match_ct =3Df 4
> > +    ddcmd =3D_
> > +}
> > +
> >   tests_list=3D(
> >       basic_tests
> > +    comma_terminator_tests
> >   )
> >
> >   # Run tests
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
