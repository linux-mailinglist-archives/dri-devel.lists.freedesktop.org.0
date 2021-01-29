Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA9308977
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58C06EB36;
	Fri, 29 Jan 2021 14:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314456EB3D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:13:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h7so12684860lfc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=NUNFTnSs1MZJyfNwwFwXIGvuEzfSiwI9aRjksAI9oRM=;
 b=vQG4iZToTXWWJxk2xOfbJJ+p8l+/9T09WtRMWxorqCgYWSlG0Euv5Pp6n5UMoWCVoF
 NCxzBK+Vvwp7fS1e+9d5wqiuIs7bD5Xoa2NepSQbCDLseWjiHKFnMDEK0rvitoUJjk38
 M6yk/IOSOGkUxsnuvOmb7W1C+kH3wTgm16PkdoNsmG7/CdPZQ5e5GUDpLcLkjFlf+kw/
 VjzuYi4CPeuk3u7OWhWBO0Z+3ZrIQwWMFtS+hlcGMcoH3HGxAj7xntZOIssS+sLEX84s
 0PsxDg9YYgI4nk7wgx8I/z99q7HXS+6EyvJj50eyk6JmRiZTvpSCLPxIPhaufbY6jKrQ
 YuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=NUNFTnSs1MZJyfNwwFwXIGvuEzfSiwI9aRjksAI9oRM=;
 b=MR6C7s8BI1L6rCyKUW9LYJuCj8F1dk1pUsdOIlY13nPgFvhp5yB9A/s+a2THBdJgN3
 5AJUEn2ILOlvvMFdWcEGuL7EFlUcf5zdJmGUgU0wKIleLLg7as9PX/AHQ2YSl4Qbnzcj
 1QrJ0tXUlAfuTOzM+yL/thof9VfdcnVrhojg8J+86x6C49DIMQyxIRFywivPpv8Uie2/
 KeQz0bsO3TN4AWUmPS5R2P0PrHaupfqLBoaeLdIeh2C/5rQj9eRRpJEFYHhhzev2oQfa
 I6izy5CIXg3wwxCGzh0hFvyZB/T0BVNahcd8YvTVCrOXirdrKva48nGHJq76Aly5pe3k
 J1mA==
X-Gm-Message-State: AOAM531oMkiSH80+gS74QtquCjSb101soM1ruWBOCVQOkHY+dAA43VeZ
 Bg6T2ZcpykazDg5QkHOaOUk=
X-Google-Smtp-Source: ABdhPJymkMQtDf2Rl/GbeTJsyCU//yLbB7TZovpI1O6+1Zh5GaX/+FlHEqPkXfOGPZWLmvEZ2esNrQ==
X-Received: by 2002:a19:f70c:: with SMTP id z12mr2286375lfe.228.1611929626553; 
 Fri, 29 Jan 2021 06:13:46 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x26sm1910750lfe.248.2021.01.29.06.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 06:13:45 -0800 (PST)
Date: Fri, 29 Jan 2021 16:13:34 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <20210129161334.788b8fd0@eldfell>
In-Reply-To: <c95af15d-8ff4-aea0-fa1b-3157845deae1@amd.com>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
 <20210128120130.50aa9a74@eldfell>
 <c95af15d-8ff4-aea0-fa1b-3157845deae1@amd.com>
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
Cc: Michal Hocko <mhocko@suse.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Andrei Vagin <avagin@gmail.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hui Su <sh_def@163.com>, Michel Lespinasse <walken@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0282757393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0282757393==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lEHKifEpOup0nfCRFK_mo2y"; protocol="application/pgp-signature"

--Sig_/lEHKifEpOup0nfCRFK_mo2y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Jan 2021 13:18:01 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 28.01.21 um 11:01 schrieb Pekka Paalanen:
> > On Wed, 27 Jan 2021 12:01:55 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Somewhat correct. This interface here really doesn't make sense since
> >> the file descriptor representation of DMA-buf is only meant to be used
> >> for short term usage.
> >>
> >> E.g. the idea is that you can export a DMA-buf fd from your device
> >> driver, transfer that to another process and then import it again into=
 a
> >> device driver.
> >>
> >> Keeping a long term reference to a DMA-buf fd sounds like a design bug
> >> in userspace to me. =20
> > Except keeping the fd is exactly what userspace must do if it wishes to
> > re-use the buffer without passing a new fd over IPC again. Particularly
> > Wayland compositors need to keep the client buffer dmabuf fd open after
> > receiving it, so that they can re-import it to EGL to ensure updated
> > contents are correctly flushed as EGL has no other API for it. =20
>=20
> Hui what??? I'm not that deep into the EGL specification, but from the=20
> kernel side that is utterly nonsense.
>=20
> Could be that re-importing triggers something in userspace, but this=20
> sounds strongly like a workaround to me which shouldn't be necessary.

Hi,

there was a pretty long discussion about exactly this on #dri-devel
today, starting at 12:30:
https://people.freedesktop.org/~cbrill/dri-log/index.php?channel=3Ddri-deve=
l&highlight_names=3D&date=3D2021-01-29

The conclusion is that indeed, it is no longer necessary to re-import
to EGL all the time. It should be enough (at least with all Mesa
drivers) to call glEGLImageTargetTexture2DOES() every time you want to
ensure you get the updated buffer contents.

So now people across various projects are thinking how to keep the
EGLImage and not re-import on every update.

> > That is my vague understanding, and what Weston implements. You can say
> > it's a bad userspace API design in EGL, but what else can we do? =20
>=20
> Please open up a bug report with your EGL driver if that is really=20
> necessary.

Sure, I would hope there is no such case anymore.

> DMA-bufs shared using a file descriptor should be coherent when=20
> written/read from a GPU or other hardware device. What is possible is=20
> that you need to do something special for CPU access.
>=20
> In other words once a DMA-buf is imported and available as=20
> handle/texture/image inside EGL it doesn't needs to be flushed/synced=20
> explicitly again.

There is still the case where the some GL drivers sometimes need
to make a copy when turning the dmabuf into a GL texture[IRC log]. But
indeed, that seems to be not EGL's concern.

>=20
> Re-importing it adds quite a huge CPU overhead to both userspace as well=
=20
> as the kernel.

Perhaps, but so far it seems no-one has noticed the overhead, with Mesa
at least.

I happily stand corrected.


Thanks,
pq

--Sig_/lEHKifEpOup0nfCRFK_mo2y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmAUGA4ACgkQI1/ltBGq
qqfCJw/6A6LbHMcoeq45qLQm3EDgpg3mOZ33qHwZUwmjkkfk0SQC6Bm8iveXMCoJ
OkVNl5Yy4QJYB9wwP4B7sylC3sza03jQYWTQLHT5WmoP0pGnN7t56yDtwwXXMdz8
XMn2B4pUHtjNLzeMJrYdJboxY9JFIh5SiSHoXZABPYVmVPgjkYZdGZu4MyBfo3Ir
GEfMD5Gl6ubk4Q2trVEkShFdRCG2fI0rrkfLlSFgYccwJ2Qx7yJJZo1o3Slo7H6/
ieT8fpL3fLfabkPsOdShmRWWUYG+isQ/7plTwdFQ4UHmp5ro/guuTbV03tkgQSnM
0PEq1LbhrTte+ol6cXPA67N0BQUxJNS9sIc9ZAVcybyt5mNTEY9SIsHDRJ5qY6aH
lqX/5nMnPJziRBtFN6oD1jmPz2dYrphIk4PNBbuk63qq/p/SmzllOiFZkmRT6DF8
lCABkSG5sxFG281NDZGWnpgxrwDEs/avQarXmy9tEAXzw+tQSuFEVIUNQV03HlMN
tluol0vxyHH7PjRx2pkAkXRYapnt29BoxcndNLmrZhC9VUwx7xsc6tpKnE/M8+3n
mmHnB3K80+u8gU4vZXw3ih2RRPnuCGjN/JQelKRH9FphoQKwXOWRdnxzkHteCA5L
tr/7kQDC02oCXuYU/PGbKxdeGg4WJ//aoyTTRv/4/m0YgJg0BPE=
=csw1
-----END PGP SIGNATURE-----

--Sig_/lEHKifEpOup0nfCRFK_mo2y--

--===============0282757393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0282757393==--
