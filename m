Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436725EDD26
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4510E734;
	Wed, 28 Sep 2022 12:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24010E70B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 12:50:38 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z2so17146897edi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=aCbdLya+ld7bMamcEDTWwB9niwCrFGpu9B0QN9EkD9Y=;
 b=Zv5BcHp3fiCoDa+LSZ+xPzUoJEFCLPbI7jeryUI4F/uIM1FGNCNIq/2iTEp/WZN7wW
 Z516ZTNnIB7WZ4kV7qQyrxOiC5i7vJMKs4aOEYcWRYQmFcKURZY2cef6AqyFL46zI5IQ
 idlkJqJjlWjBS3r1hR10/v7Z5s7G9fiopyGTQnvj5XiYg4s0fuTo8OcfdZ3Eqwz0kaRs
 d6xWXbt828WEtqD5sk/5zyxvxF8mRRPwWz4QczIbDFF79Fy6iyWQo+QTAs4yqvSgrY9W
 qxSEJVgmi/+70kw9d9JBu0Da1QUZY+gH3+pIU+zmr/QByiuob5QG/5JEiZ16ciJJGnwu
 OVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aCbdLya+ld7bMamcEDTWwB9niwCrFGpu9B0QN9EkD9Y=;
 b=euX3gwHHS2JP5fCbqke1uamThepoOCg3Qkfe+EY/Jvy39JSJ0mCefw4l94SN9hC4HK
 y1EA/3SXMC3mrRbEcD0w3iQh+rynEqIrusUMESx7uZE96pxKV8/q2OAa5U3P5SUHYUp7
 cUhQVYOupMD8bG30H8BbHzfTudhCJEq2KEwmPp5Q5hpAoxnzv5mEXvpwZPfV4aD6UAxs
 PtNbrv5QGdQXXgmmsfqb6+7+lqg93XgRGuMBaP8F8o/PLWVDnTrScOIIzD1TjsZiKVLB
 p8QDVZjgIWfq29ROoq4C6ZpjFKknYLq5fcmKRPK9bnpFOduEyXEQPD1BsFEW5huQifoC
 ghdw==
X-Gm-Message-State: ACrzQf1ThncgYP95ztbOB+vTBugl0Mm9Do3oNhN5mR2hPIkEloMB5VDo
 0C/M4WW6Q0jZu1z+/Oz4ikQ=
X-Google-Smtp-Source: AMsMyM5iWWcJrZa5f2sHiUBkY0lZQMpUGmkqsvwtdHXRAJduc4O8iMtQXdKT+pwhM9pkNMdNTYhi3Q==
X-Received: by 2002:a05:6402:5190:b0:44f:2924:78f4 with SMTP id
 q16-20020a056402519000b0044f292478f4mr32402503edd.217.1664369437005; 
 Wed, 28 Sep 2022 05:50:37 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a50e703000000b0044657ecfbb5sm3303222edn.13.2022.09.28.05.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 05:50:35 -0700 (PDT)
Date: Wed, 28 Sep 2022 14:50:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] pwm/tracing: Also record trace events for failed
 apply calls
Message-ID: <YzRDGUxkah8Ridik@orome>
References: <20220916151506.298488-1-u.kleine-koenig@pengutronix.de>
 <20220916151506.298488-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1nXplf5oGjFx1iy9"
Content-Disposition: inline
In-Reply-To: <20220916151506.298488-2-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-gpio@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Robert Foss <robert.foss@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-leds@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1nXplf5oGjFx1iy9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 05:15:05PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Record and report an error code for the events. This allows to report
> about failed calls without ambiguity and so gives a more complete
> picture.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pwm/core.c         | 18 ++++++++----------
>  include/trace/events/pwm.h | 20 ++++++++++----------
>  2 files changed, 18 insertions(+), 20 deletions(-)

Yeah, I like this one. Should make the traces much more useful in the
failure cases.

Thierry

--1nXplf5oGjFx1iy9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM0QxkACgkQ3SOs138+
s6FH0A/9Hynr9rb8tCmQHfWWe5i6JIYSs5Xn70OcHYnRc98AFjPuXISUDbLUUfD1
epf/5ixVuASGD945ZOL7Ibci/7cPAJI3FECRUa520xN/EAv0f/39OYXy1xfk38oi
rCGHa2IGdSPZceAx/0CtB5dwDL6c0Z8nS6akQmrtSY6XQowy14C0t9sjcnRWyNGF
qw+uwHjSjglnPfZFWJOwwhJVRzbq4BcSww33AawYStTMvaWTBGmuwtxYbavrYDMl
/TEEPlRF1K2OAvbQNtShEf0WXQG76A9+1ikZzAdmJ4n2K2oaZuPDh4bNbj2j4EuI
a39I8Fgmduo+NsZClqQqH77wNZPDxEA1Nbl5RVa8r5D7kugXpfLWup+jdOuRdl9t
bsXfkuSWKu0SjRvLstBZIM0/mpcU3lTAxwVd6k6nNro+1QqkAP9lsXURsBDK1Jaf
NDs5q6+l5WoVxhPm5axZfYYXzX0wGr+IT79XKzVR9hgvuZbxNsiGo9HAzn22Jn9F
4fER8jLXcvfqiOCGGp9Pl3WJ6Zmp0mKwUx6AbqXoYDvVpqpw9r02k7YDdcpyq+wA
nA5YM6v+GD9QCBv0VmQF8ZJku0ktlG/eNGonA/N7naYNJnf/4Qj7LGWTXrmjUOQU
Kuy192hnVn+LpEizF2DPaGqSrosYVskFC6f1cRfVWMKaR9vIcnc=
=T2Ll
-----END PGP SIGNATURE-----

--1nXplf5oGjFx1iy9--
