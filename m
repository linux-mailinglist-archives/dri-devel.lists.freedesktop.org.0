Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1611E2D9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB456E4FB;
	Fri, 13 Dec 2019 11:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1942A6E4F9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:34:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r19so2284236ljg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=WogMzTkghm09DpbDrdprz0J+jLbOGZD7ka9HR9tpZTM=;
 b=S+s1+bj8K/GF9H1kfq9SdXNfF3tV+tPJ73B4AupSUqSTQfp4oyDwMG3d9KT9qeSwVw
 CYQ8Mq7S1dAIfz4IfWEoCEw3TWNgyRE4rLSmIwd6lvJZDx6Pe73++nkfsn9OaCCprWMK
 g/R+NlSBoi1Fi7Db/pdaqbw4edRljX66OstnppV19WOr+hn2UgiPQVusELYNuopYfZJs
 J8pzLnJEjBRxgoHaAyWdTlnRefLWA+C0CRlxW4UQ7DuhJa9NVtwT/6vNIbARrG8ZRtMO
 LRT/G65I0quihezreJAkg8x7h8UjcfH08RZRBu8ZYBEnnSeBRWXwm3sefyjVYL1bOrEl
 GINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=WogMzTkghm09DpbDrdprz0J+jLbOGZD7ka9HR9tpZTM=;
 b=tIbSX3l43ea/VMIzbEGC3OEkWuQ/zJBVWlNM/vnh1K6VELE9Uh78DEw0Lu9QB2OiDu
 f82Ovvbxgw6QC+9BWESCJieTFOaTPkuIfN8J84FZP6usDoob7pbg6ruX9jkhdwgSXcGw
 R919Lh7cXR7ZaKPF/nVqSgah5JT4rRnqUej75z5lj3nybnyCLjquWuaxHVyOupcYSUDE
 YYlwAuBbrTS5CnwPmwgLKP+kBaWCii5U7nCYx+gCejpgsaGw31xMWmVDeUYH3LTTPx9s
 pRNBdJFVW54+KchjYebLwrzmxkrPKLArEy7+Cr7takIC2pHyKX110J4sRToEe9tLmXB7
 HAsw==
X-Gm-Message-State: APjAAAXkWsj/pXUjElinOfb5pUeKygcDdUc09MKTTm582s4peb/CEA28
 kr6AFHQh6JDTDwfikvA/AXE=
X-Google-Smtp-Source: APXvYqx0S9LMd/azYXm+z5Gcvk4CWgCxwhIxL6ud+2R4LEY36MVvouhfAiLbmSxpMhmDk09K/DD1cg==
X-Received: by 2002:a2e:a402:: with SMTP id p2mr9479233ljn.143.1576236897413; 
 Fri, 13 Dec 2019 03:34:57 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m15sm4731371ljg.4.2019.12.13.03.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 03:34:57 -0800 (PST)
Date: Fri, 13 Dec 2019 13:34:46 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213133446.392c9045@eldfell.localdomain>
In-Reply-To: <20191212203301.142437-1-sean@poorly.run>
References: <20191212203301.142437-1-sean@poorly.run>
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
Content-Type: multipart/mixed; boundary="===============1611054155=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1611054155==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vlxu4XzO8S1m1lOH5Cs/V=f"; protocol="application/pgp-signature"

--Sig_/vlxu4XzO8S1m1lOH5Cs/V=f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Dec 2019 15:32:35 -0500
Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>=20
> For a long while now, we (ChromeOS) have been struggling getting any
> value out of user feedback reports of display failures (notably external
> displays not working). The problem is that all logging, even fatal
> errors (well, fatal in the sense that a display won't light up) are
> logged at DEBUG log level. So in order to extract these logs, users need
> to be able to turn on logging, and reproduce the issue with debug
> enabled. Unfortunately, this isn't really something we can ask CrOS users
> to do. I spoke with airlied about this and RHEL has similar issues. After
> a few more people piped up on previous versions of this patch, it is a
> Real Issue.
>=20
> So why don't we just enable DRM_UT_BLAH? Here are the reasons in
> ascending order of severity:
>  1- People aren't consistent with their categories, so we'd have to
>     enable a bunch to get proper coverage
>  2- We don't want to overwhelm syslog with drm spam, others have to use
>     it too
>  3- Console logging is slow
>=20
> So what we really want is a ringbuffer of the most recent logs
> (filtered by categories we're interested in) exposed via debugfs so the
> logs can be extracted when users file feedback.
>=20
> It just so happens that there is something which does _exactly_ this!
> This patch dumps drm logs into tracepoints, which allows us to turn traci=
ng
> on and off depending on which category is useful, and pull them from
> tracefs on demand.
>=20
> What about trace_printk()? It doesn't give us the control we get from usi=
ng
> tracepoints and it's not meant to be left sprinkled around in code.
>=20
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540=
-1-sean@poorly.run #v1
>=20
> Changes in v2:
> - Went with a completely different approach: https://lists.freedesktop.or=
g/archives/dri-devel/2019-November/243230.html
>=20
> Changes in v3:
> - Changed commit message to be a bit less RFC-y
> - Make class_drm_category_log an actual trace class
> ---
>=20
> Even though we don't want it to be, this is UAPI. So here's some userspace
> code which uses it:
> https://chromium-review.googlesource.com/c/chromiumos/platform2/+/1965562
>=20
>=20
>  drivers/gpu/drm/drm_print.c      | 143 ++++++++++++++++++++++++++-----
>  include/trace/events/drm_print.h | 116 +++++++++++++++++++++++++
>  2 files changed, 239 insertions(+), 20 deletions(-)
>  create mode 100644 include/trace/events/drm_print.h

Hi,

reading the userspace patch is very enlightening, thanks.

It uses debugfs, and it uses the generic tracing UAPI. When all
distributions will enable this debug logging like you do in your
userspace patch (I really want that to be the end result, since
otherwise we are back to asking people to manually enable debug and then
reproduce the failure), does that scale?

What if V4L2 is the next one deciding they need a similar logging
framework to debug camera issues? If the trace log is already flooded
with DRM messages, it will be useless for them?

Or maybe someone else wants their piece and flood it even more
aggressively than DRM, making the DRM messages disappear before they
can be saved?

Is there a way to pull out messages
from /sys/kernel/debug/tracing/trace and filter them on reading instead
of on writing?


Thanks,
pq

--Sig_/vlxu4XzO8S1m1lOH5Cs/V=f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3zd1YACgkQI1/ltBGq
qqe+fA//dhrmHYCO5afLPPkNlA7MbFAfI6F1SxqM7/e+aS8Qq0ySNCikHR7VEsb5
qna/KRNcBRSH+FKuBdB4QddvqWL0/1gsp6M2VPhcmzXKKyT+fSK71yt6P4atOunJ
d1vDSYtV5o/2hZBg9sZ3uPCX+lPBacX/Y+NH1r5SwbytpYmxFDuSMInhQkfGN3iJ
ijzBnWlUEFOydANQ+mOxgQK5RRQtiBg4w52+R11pltuc6QXYIEwNoxVVYGnk3kXQ
zXhqNTjE3bke4IgcjIlL40jFgYecXbhn3kaDWITRiwaGP65T6umCs3/J/stL0NYw
i0da4gbmPOmAY6iPMc08lgsVpdphaKzcO2VHBo1jTZ0NtiCw/Cgic5wgmAVpMQ0F
JX42nGTESAvdkxKav0LWOMOtbNgr2ZOGDvWd89mHxVNt/T573axN52uNTSD/qhdU
M+8TIqu3VuZPDbYnygy1rWdjdVODmyDDQcIAKR2oe1rIJOJl5s9WX1WJuw7KIgrB
2wbtuuDZWzbeCdGRVk9I+TlJkugArXu8aU0YnRrbroFJAPvfOSuXYpUCoXW8NQsd
kEhNiKnbbJmnazwerIaWPYBNOiU1K+n9Br/pN2jNU96ISmoGRRu0tZ7FYRsORWpT
t02tOKXtrtnJoHW+nDAihCJS95dI5d7sDSwok+cKC3GGo8EaZyU=
=5wgt
-----END PGP SIGNATURE-----

--Sig_/vlxu4XzO8S1m1lOH5Cs/V=f--

--===============1611054155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1611054155==--
