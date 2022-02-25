Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C64C41C7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908C210E830;
	Fri, 25 Feb 2022 09:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08F410E830
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:51:48 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j15so8393782lfe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Q9HzXjvkO3iwuM4XVXTM9PZM47sfeVMerpV3kphMHTk=;
 b=kfk47SUmgYj0CKubSLD4jEU+3DWVhDckoFmvVPC4EVQIYMyq9IB6KWKOA3N5qlgCfL
 zTJZS23qL/u3oWiI+rgX9ciFnKFbh7yfxznGCWDVyuuzFBT9VBPThl9Ec0f0FIYRpZV7
 K7ZcS8Qhup2LWCwxxVvJF0qgyP0YElxb1uUksMlcxvZko6WzW/LMsME9lVHAgByMey0Q
 v6q62F+PtXfgE2/4xw2A09GruiXDEYrWvGRLC21xqss5ssw/giYhQMwJ1AI8gvWTZvLb
 +MMvMcFzZpOojG4tiVxHbtN2N8wSA684/FLI8GmRMNJ2hot4+ZpzV+HZnW1Ze2orCc4X
 Ew2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Q9HzXjvkO3iwuM4XVXTM9PZM47sfeVMerpV3kphMHTk=;
 b=vRS09NnDS1yHl/elp8YZPblsdnkQXy6Cj6l3NO7tmm16S9vfpqiPfd4d9/C+FGFTGg
 +Wqk+04I0M2lSXg+/mnZGFaNjyBdP3dXrON+bLRnafvOAu6Xl501qm3wvGC7yNJffJDD
 0k3BA9vKfUm2G4umrvQegfobSnOjeL/IH/IqHiB1dw2NFWP8PKSlQ+PTpYLIddeCNQxy
 QrkLhTH4z8kxRHIgEqonpitaLGZD5We8fyf5OYqRPMrMPoJ5XYXPaHWCD5ZZOVqdxkSQ
 uuCyM3G/oVjXaQrM8Bb1ytYF+Ji3S00psAEZXTlHmF2DwMRbNWuFrDEq712srkkAUddF
 DukA==
X-Gm-Message-State: AOAM530xc8DUahXTBhaIbLx8XnRPQQFTqBZTr03bWVTxbwJjzh5+BUlf
 Ot407i99UB9hn2Q8k5usJYI=
X-Google-Smtp-Source: ABdhPJy2q6q4FHtCNKgPS21rbjLSWj+Ev6k5pdn4tm5oBHuvoD3jleyEOHYACg2I8kxI9fWrTMCkog==
X-Received: by 2002:ac2:4475:0:b0:443:5a36:26b5 with SMTP id
 y21-20020ac24475000000b004435a3626b5mr4639580lfl.424.1645782706750; 
 Fri, 25 Feb 2022 01:51:46 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x33-20020a0565123fa100b00443d3cffd89sm155947lfa.210.2022.02.25.01.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:51:46 -0800 (PST)
Date: Fri, 25 Feb 2022 11:51:43 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/todo: Update panic handling todo
Message-ID: <20220225115143.55b872a2@eldfell>
In-Reply-To: <20220224132425.3463791-1-daniel.vetter@ffwll.ch>
References: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
 <20220224132425.3463791-1-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6zW_0GeLRZ+y3jOLMTdqlxJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: gpiccoli@igalia.com, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6zW_0GeLRZ+y3jOLMTdqlxJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Feb 2022 14:24:25 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Some things changed, and add two useful links.
>=20
> v2: Also include a link to the QR encoding work. Plus review from
> Javier.
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: gpiccoli@igalia.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks,
pq


>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7bf7f2111696..2b1e7fa45603 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -475,8 +475,12 @@ This is a really varied tasks with lots of little bi=
ts and pieces:
>    achieved by using an IPI to the local processor.
> =20
>  * There's a massive confusion of different panic handlers. DRM fbdev emu=
lation
> -  helpers have one, but on top of that the fbcon code itself also has on=
e. We
> -  need to make sure that they stop fighting over each another.
> +  helpers had their own (long removed), but on top of that the fbcon cod=
e itself
> +  also has one. We need to make sure that they stop fighting over each o=
ther.
> +  This is worked around by checking ``oops_in_progress`` at various entr=
y points
> +  into the DRM fbdev emulation helpers. A much cleaner approach here wou=
ld be to
> +  switch fbcon to the `threaded printk support
> +  <https://lwn.net/Articles/800946/>`_.
> =20
>  * ``drm_can_sleep()`` is a mess. It hides real bugs in normal operations=
 and
>    isn't a full solution for panic paths. We need to make sure that it on=
ly
> @@ -488,16 +492,15 @@ This is a really varied tasks with lots of little b=
its and pieces:
>    even spinlocks (because NMI and hardirq can panic too). We need to eit=
her
>    make sure to not call such paths, or trylock everything. Really tricky.
> =20
> -* For the above locking troubles reasons it's pretty much impossible to
> -  attempt a synchronous modeset from panic handlers. The only thing we c=
ould
> -  try to achive is an atomic ``set_base`` of the primary plane, and hope=
 that
> -  it shows up. Everything else probably needs to be delayed to some work=
er or
> -  something else which happens later on. Otherwise it just kills the box
> -  harder, prevent the panic from going out on e.g. netconsole.
> +* A clean solution would be an entirely separate panic output support in=
 KMS,
> +  bypassing the current fbcon support. See `[PATCH v2 0/3] drm: Add pani=
c handling
> +  <https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronn=
es.org/>`_.
> =20
> -* There's also proposal for a simplied DRM console instead of the full-b=
lown
> -  fbcon and DRM fbdev emulation. Any kind of panic handling tricks should
> -  obviously work for both console, in case we ever get kmslog merged.
> +* Encoding the actual oops and preceeding dmesg in a QR might help with =
the
> +  dread "important stuff scrolled away" problem. See `[RFC][PATCH] Oops =
messages
> +  transfer using QR codes
> +  <https://lore.kernel.org/lkml/1446217392-11981-1-git-send-email-alexan=
dru.murtaza@intel.com/>`_
> +  for some example code that could be reused.
> =20
>  Contact: Daniel Vetter
> =20


--Sig_/6zW_0GeLRZ+y3jOLMTdqlxJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIYpq8ACgkQI1/ltBGq
qqdmOw/9HxTAR4cdAtT30V5wy7yZKP9vs7xv1xMNzUqMdinmb457AZJcMbYKEeoQ
RtXPoYKYLp7Jc/kApgX6faaiVdn0xEiOhPLwh3ih0pLj8+vn0UiOLa/pkk0stGEo
OXGUJctZJ5yqUjW1g97BFl8jx+V4ue5KJQcimsGPY4ibtvk+54hPb211wiONPph3
ymvVk7MuWGVh40UsFRrJqkuTzU4hKwzKGjtsf55o6OEVFmBiF9dC/AOtVJWMGT7a
pSsU4AYB/I/UpQPlLZ00o9Z1tOqi9fHs5j5zx9dADHY+qqqsCl4q6s3Mvjm8O+Pk
QrKKnh3FzrfOpQoiRfERzu541uWOjiN4jps9LCpJHlBP+2c+fUNIiF6h4SPdLV6N
ZzBHgRyb1FBuszmNa4SUORu6zINNnHXHmBzwwvBKbKLWdgtZ9lbm5zZnSMBOAhma
oMiDViVnIWIAc8r+f1FNwEwoyD3trhmIqBKmTO4bov3cRu1pHMwwNQasI+ug4QRY
ijXeuyj0FFi2fzHlk1isMcExs6m3sdMWVmR2FnNyoqwd8I5cruy8X9m2QhuM9us6
l7jHDGu7etXxmSnRF2kW+GSnZ3u5immFaJWBEWVyy6mfO5ozk/2AgmnfKPucCf0D
2t/s2LVYaUeWbB1PSsZ/lWrkGckCSWxubvWlvHyTAYV+onjKsY4=
=VuV2
-----END PGP SIGNATURE-----

--Sig_/6zW_0GeLRZ+y3jOLMTdqlxJ--
