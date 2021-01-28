Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013630734C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 11:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDB26E0F2;
	Thu, 28 Jan 2021 10:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2E96E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 10:01:36 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id v24so6801945lfr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=w7zs4vtlCOUzPk4JPVodMGjOwCX7vvMr8Eyh0CtBlKY=;
 b=aBdiFZ6Y4Kp+nOhlgpCK6Z6WTIvAH7uPf6Dw5GNH8lHwqAWrTPwgv7vL2KYjq02Vzf
 shdsv89u8LsaAAr4C9B70PX49KyEWjk11sBOUQy5cKQC7sAnotKMqxOnFd5pwGXnuYyy
 l4f3pSmC2a8RsLkHnRek405USQ2daHF00hHJonK1HWU4GiqNMZaAeTUGMoThii0wUOzP
 NDy6YjY8kZgEdVBQIdn4njsH+p0ACV44wG9Nd5DeSV8KqfTab60BZgHhtRoUq+xmcC5v
 I+zA3q+ohcTZQbquqDT8HBeN8YzAWKtplRBAFKkGxorn+I+YQQvbBqrzdDKBAsHw2dtU
 037A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=w7zs4vtlCOUzPk4JPVodMGjOwCX7vvMr8Eyh0CtBlKY=;
 b=LC2vFDw9rJ6PjYiwcx4i65tcIUWf2JL8wjw/2ZKE0OWv/3PAvSy+6gSRHUWn+3COdi
 tucBPTilNRaClU8o4Z5pRWWj/j9d7cG/5oGTP0G3x1Dofq8aMb3Kas8Gf8DJTfrHMZjY
 7G6Y+6WQtTdJkfKtwiu+cMTpGmZftO09X1c4Cet2nd5a+MV/YccmecRqOGawaO+ZTYnL
 NwfSKYGbPat0GBoDS5QqMLxgLGbQ3JFNjGlH02VbpQIaElrS/SnnQS3GlB1y/BPlHPl6
 ohVPae82C7HGhZSJHsavKAnWGUG9fN19OYdO+Z8lI/SXtO/FHmnfzRBh+JY9CxfCYKQl
 0NuA==
X-Gm-Message-State: AOAM532k8lzzfFlSSC7lbmvGG7M0tVwk4VSlqAjGpfP8JvkQynueFD4v
 Oo1T8yse0zKf9fWYQo30SQA=
X-Google-Smtp-Source: ABdhPJzKkeFNRZJelT7Yxb3Qx2K7wJW+lwf6EmPqVdUlg7UlihZ29bW2xvQP6sUABgj7ntHv7PIcuQ==
X-Received: by 2002:a19:7507:: with SMTP id y7mr6874145lfe.334.1611828094763; 
 Thu, 28 Jan 2021 02:01:34 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y20sm1830647ljh.124.2021.01.28.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:01:34 -0800 (PST)
Date: Thu, 28 Jan 2021 12:01:30 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <20210128120130.50aa9a74@eldfell>
In-Reply-To: <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0150785769=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0150785769==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EjrvI7yGo=jgR=BTk/_==YI"; protocol="application/pgp-signature"

--Sig_/EjrvI7yGo=jgR=BTk/_==YI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Jan 2021 12:01:55 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Somewhat correct. This interface here really doesn't make sense since=20
> the file descriptor representation of DMA-buf is only meant to be used=20
> for short term usage.
>=20
> E.g. the idea is that you can export a DMA-buf fd from your device=20
> driver, transfer that to another process and then import it again into a=
=20
> device driver.
>=20
> Keeping a long term reference to a DMA-buf fd sounds like a design bug=20
> in userspace to me.

Except keeping the fd is exactly what userspace must do if it wishes to
re-use the buffer without passing a new fd over IPC again. Particularly
Wayland compositors need to keep the client buffer dmabuf fd open after
receiving it, so that they can re-import it to EGL to ensure updated
contents are correctly flushed as EGL has no other API for it.

That is my vague understanding, and what Weston implements. You can say
it's a bad userspace API design in EGL, but what else can we do?

However, in the particular case of Wayland, the shared dmabufs should
be accounted to the Wayland client process. OOM-killing the client
process will eventually free the dmabuf, also the Wayland server
references to it. Killing the Wayland server (compositor, display
server) OTOH is something that should not be done as long as there are
e.g. Wayland clients to be killed.

Unfortunately(?), Wayland clients do not have a reason to keep the
dmabuf fd open themselves, so they probably close it as soon as it has
been sent to a display server. So the process that should be OOM-killed
does not have an open fd for the dmabuf (but probably has something
else, but not an mmap for CPU). Buffer re-use in Wayland does not
require re-sending the dmabuf fd over IPC.

(In general, dmabufs are never mmapped for CPU. They are accessed by
devices.)


Thanks,
pq

--Sig_/EjrvI7yGo=jgR=BTk/_==YI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmASi3oACgkQI1/ltBGq
qqdcrA//X9uN75QyHDm8jqei3p8rmD/duy0jDCn6W2DbNy+6VM79pp8ZjqqdpeEp
ZLe9ivqRVUOCUclKfiG2d0/vdgYwU2xnkWYSz0KUNP5pVE+4nZY3O/SA+SQcefkg
KwfFhyM0XXm8eTVLVl5h+1dMMQ8tWkXpEwXqed4l0/478wepY8srMWoH3YRBxpiE
q/PSkaWrRegUA8nYHp65kLVAAgP2kOeylAO/DmmtGye12AGMlNESNJHYuHPyc/wT
Aos56muFTYYGhkICx+eqTsJBCr8mk32rFyIj/dinUcXUyvbj+sUt9eTZVAazsjjx
NLC3zr3OSnKjQz2+kkXeGIHqTBCEWXFw3VHsPQLv7pf6XPqxJVoWtgHvzvTVduzo
3Oxff1eYaBN54Evn1xLWLdEGhqc7wqH6RFYDnKhbOxWmBujXHpdF8Ge5xNfPauBP
gFAtgtHJIyyu/j+CCCo1z25ToKsGTuiJnbXalIrlmWNeIq8m7XKZ3JjhR3WYZOJU
MEOXDkeVcodCfo0ZueGvTj5meY6eJ1LIBdWBmT0h1/xA/fBocbRADBFgez42NN5s
ro5soi7B49KRuSygUPsaSMnjpr32NwCIrQIzGtZQzgJVfRPSdke9ZD1wNle9jAXY
B7ZbDZmlD1St8rxL+usyhRjZdUoKXjfG8d72ss37EHIhch+3CEQ=
=oEE0
-----END PGP SIGNATURE-----

--Sig_/EjrvI7yGo=jgR=BTk/_==YI--

--===============0150785769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0150785769==--
