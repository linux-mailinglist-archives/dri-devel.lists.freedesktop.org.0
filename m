Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF32D120064
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D886E19C;
	Mon, 16 Dec 2019 08:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E776E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:55:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b15so3623459lfc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=wKUsEhdA80Lou9udLLMMJ0RKGPE3YXGFvnIeFugvB0I=;
 b=FudX1P2UvN1RfIQ5yNyPLgpu5eHFPe46visxP0oJz3ZBBq/wzWu+E4+QgNIXzOaXUE
 ex1OlTkx/ZP14Dkbj9JZ5v4QRuYaFvQ2bJ9tCDeLtJqESpvGGN0Pr/AHiWBuLJyrmwR3
 +WjuFJq5xya3xjvsJVwLPQqcuTPmsyng8tqF4OJhUXZjwkjAB2BaMs7096dqeWsFQ0XH
 cdKAHwgB2ex0anytfVrK13PyeLgtYJnA8qvPJsmm4XxkwwXuolNenFpAX0b+eQstzyHk
 WWPXYHMBHcxzniFnwuQrbwxKt9Dr2Xw3mHnbMCDZ7FrSkSs2z7BruAXE1BjiPwzFti6a
 Qnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=wKUsEhdA80Lou9udLLMMJ0RKGPE3YXGFvnIeFugvB0I=;
 b=ot7WakFLWw45LTLzD+wV3I3M59pYxVo9BYU9uns4TppwplLTMzViX9m+GanxKPLcgQ
 85IEIGY9J71BnwG7BojZfea6FDeR6Rh1LDX85ERhW2ZRAhEIoWr7ytFs+jOME5CFawbR
 K1gbnssT67yAAaOq489NKNy6jLz0lbEnjacSsZ5ikjilAKsB7SkCF9gyddoPPNzzoqed
 kkF+WRBTB5SKJARgu57b6ff7/4QzexDGeFrwv3jGUGPWhAi5vuAVj6O+SlXxwxRw8RSg
 aTmjUYgSRrg8M5CisGD3OoxxzBUN0ib1+AylQ5kG3EzkMfYw9nACH55Pa/cFD2/DBQaJ
 U+BQ==
X-Gm-Message-State: APjAAAUY4mLK9eB99tt7u5R8R8j4Ny/QPvnhk4KxQGCRy//1i+LNNoE6
 m6b1Q6KTL90H4t1mmXlRTwc=
X-Google-Smtp-Source: APXvYqwxzZKWR/7ST61IOVqp2mZlL2OuwVP3cAGVI7aAVY1hKxOMinM2gklLkYcTBRp6g2ltVBngVg==
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr15446550lfa.151.1576486555467; 
 Mon, 16 Dec 2019 00:55:55 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a9sm8402659lfk.23.2019.12.16.00.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 00:55:55 -0800 (PST)
Date: Mon, 16 Dec 2019 10:55:44 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191216105544.1c343ff1@eldfell.localdomain>
In-Reply-To: <20191213165433.GC41609@art_vandelay>
References: <20191212203301.142437-1-sean@poorly.run>
 <20191213133446.392c9045@eldfell.localdomain>
 <20191213165433.GC41609@art_vandelay>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: multipart/mixed; boundary="===============0027284066=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0027284066==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=g/TomULrKpIWfmIUMhXr2c"; protocol="application/pgp-signature"

--Sig_/=g/TomULrKpIWfmIUMhXr2c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Dec 2019 11:54:33 -0500
Sean Paul <sean@poorly.run> wrote:

> On Fri, Dec 13, 2019 at 01:34:46PM +0200, Pekka Paalanen wrote:
> > On Thu, 12 Dec 2019 15:32:35 -0500
> > Sean Paul <sean@poorly.run> wrote:
> >  =20
> > > From: Sean Paul <seanpaul@chromium.org>
> > >=20
> > > For a long while now, we (ChromeOS) have been struggling getting any
> > > value out of user feedback reports of display failures (notably exter=
nal
> > > displays not working). The problem is that all logging, even fatal
> > > errors (well, fatal in the sense that a display won't light up) are
> > > logged at DEBUG log level. So in order to extract these logs, users n=
eed
> > > to be able to turn on logging, and reproduce the issue with debug
> > > enabled. Unfortunately, this isn't really something we can ask CrOS u=
sers
> > > to do. I spoke with airlied about this and RHEL has similar issues. A=
fter
> > > a few more people piped up on previous versions of this patch, it is a
> > > Real Issue.
> > >=20
> > > So why don't we just enable DRM_UT_BLAH? Here are the reasons in
> > > ascending order of severity:
> > >  1- People aren't consistent with their categories, so we'd have to
> > >     enable a bunch to get proper coverage
> > >  2- We don't want to overwhelm syslog with drm spam, others have to u=
se
> > >     it too
> > >  3- Console logging is slow
> > >=20
> > > So what we really want is a ringbuffer of the most recent logs
> > > (filtered by categories we're interested in) exposed via debugfs so t=
he
> > > logs can be extracted when users file feedback.
> > >=20
> > > It just so happens that there is something which does _exactly_ this!
> > > This patch dumps drm logs into tracepoints, which allows us to turn t=
racing
> > > on and off depending on which category is useful, and pull them from
> > > tracefs on demand.
> > >=20
> > > What about trace_printk()? It doesn't give us the control we get from=
 using
> > > tracepoints and it's not meant to be left sprinkled around in code.
> > >=20
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.19=
5540-1-sean@poorly.run #v1
> > >=20
> > > Changes in v2:
> > > - Went with a completely different approach: https://lists.freedeskto=
p.org/archives/dri-devel/2019-November/243230.html
> > >=20
> > > Changes in v3:
> > > - Changed commit message to be a bit less RFC-y
> > > - Make class_drm_category_log an actual trace class
> > > ---
> > >=20
> > > Even though we don't want it to be, this is UAPI. So here's some user=
space
> > > code which uses it:
> > > https://chromium-review.googlesource.com/c/chromiumos/platform2/+/196=
5562
> > >=20
> > >=20
> > >  drivers/gpu/drm/drm_print.c      | 143 ++++++++++++++++++++++++++---=
--
> > >  include/trace/events/drm_print.h | 116 +++++++++++++++++++++++++
> > >  2 files changed, 239 insertions(+), 20 deletions(-)
> > >  create mode 100644 include/trace/events/drm_print.h =20
> >=20
> > Hi,
> >=20
> > reading the userspace patch is very enlightening, thanks.
> >=20
> > It uses debugfs, and it uses the generic tracing UAPI. When all
> > distributions will enable this debug logging like you do in your
> > userspace patch (I really want that to be the end result, since
> > otherwise we are back to asking people to manually enable debug and then
> > reproduce the failure), does that scale?
> >=20
> > What if V4L2 is the next one deciding they need a similar logging
> > framework to debug camera issues? If the trace log is already flooded
> > with DRM messages, it will be useless for them?
> >=20
> > Or maybe someone else wants their piece and flood it even more
> > aggressively than DRM, making the DRM messages disappear before they
> > can be saved?
> >=20
> > Is there a way to pull out messages
> > from /sys/kernel/debug/tracing/trace and filter them on reading instead
> > of on writing? =20
>=20
> Hi Pekka,
> Yep, there's also a trace_pipe output from tracefs. So you could pipe the=
 output
> through a classifier in userspace and split off different subsystems.

Hi,

IOW, one needs to run a userspace daemon to read the pipe, filter it,
and keep a flight recorder buffer, instead of the kernel keeping it.
Right?

I suppose keeping the flight recorder in userspace makes it much more
flexible with things like dynamic sizing and remotes and whatnot. Is
this where you would like to aim for, for general purpose desktop
distributions to run one at all times?

> I think if this type of patch proliferates this could be a problem. In th=
at case,
> we'd probably have to become better citizens and reclassify some of our l=
og
> messages such that we're not needlessly spamming the trace buffer.

How will you do that in a way that people who have already taken to bug
reporting logging do not scream "UAPI broke, the logs are much less
useful now"? :-)

Although I might worry more about people screaming "my tracing broke"
if the buffers fill up with DRM chatter in the first place. After all,
the aim is to have this enabled in desktop distributions by default,
and if distributions get bug reports forcing them to disable it by
default, then we're back to square "please enable debugging and
reproduce the issue so we have something to look at" again.

FWIW, I'm very much in favour of your overall goal, but I'm worried it
might not be sustainable or practical in the long term outside of very
specialized distributions. Then again, I have no alternative
suggestions that would have the same level of code and UAPI re-use.

> I'm not too worried about this since we have a number of tools at our dis=
posal.

What tools would those be?


Thanks,
pq

--Sig_/=g/TomULrKpIWfmIUMhXr2c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl33RpAACgkQI1/ltBGq
qqd48xAAqIcGlSAgXWFp8ot5VVJfKga9A6qw5Roz0n6+micUkqlThyh8YS10PaX3
lszTWFiVzTq/XxAZYd1m+ycG6UoEU8f6extc8JGAYKfEsE3YdGpBriqfKRMwLmcP
a/O1LLuXoX8iMQ7Ees5bvlpMQFMOkAAOVXW1vp35m47jp+mz2wOlsGMhrN18dF4y
Mg5VjNPbvySGNKxmulb+yK6aLsSCruzGcLIynMZHase8Af8UR1/A9pzTqpPnG0eh
PtON2aupMQrIUJ0g20ektRUgqltbUtZOnTkNVTRd2UBpTLwRHBE73x0uYn6fmrwF
BXgHLf9kjTNTg2GTx5e1PcH2VTe42+dljFdhuTvFaPmKwhXFfO76irxyRY5dxHqV
VQ9mwMU+Jqk3n4As6ztCgmMMCLjj6dZrT8V+bmsyzqs/iuLF3lj7YLq4NmrKM2Je
9mjnKp6/72+1Bo4nK5UAsB+biWryqv/GjDNb5IZe2HY4Oj4K3vKAOkG9bjEs8o0I
z2BPFtdF8FFm8w0NHKZMPKW9lwJ5Cc3wVeketl/TkIFjYezVrfzWUvbxWoX92wsW
nXksvsKSB/Z8Z37lwEVpSulCIXHVfFgE5a//VQDObIFhmeY/SmYov2IdYWzGcVPT
xVOu2H7Ltdk3xR4MGIyrLbtw9H5gzyRCSBgFH57t2bFJJErPFZc=
=4GO6
-----END PGP SIGNATURE-----

--Sig_/=g/TomULrKpIWfmIUMhXr2c--

--===============0027284066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0027284066==--
