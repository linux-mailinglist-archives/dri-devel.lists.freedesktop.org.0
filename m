Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9617BFC5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 15:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA96ED26;
	Fri,  6 Mar 2020 14:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB26ED26
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:00:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w1so2319776ljh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 06:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=K0HBakyvyDpY3R2a2pai/7kYrrVZW4UZcdz5asoXQrk=;
 b=ojfBFYC/1tZauE3ZBi3q7TnnKUOad7tCptcjG24SRhZ5tNCmDRGpOsDqokI+aPIckl
 kmASD8AetUuwYK9EuhJ7HEpePriocd+pc2FPsiBVNxRZXvsqHVdymyq21edaQG5MTBWr
 bEAiCYA0tGWptPyVHyffmRx8nmawTksHkis0ituDCbuI+4fx6+luQ9qy3vQ9eoQX6UjI
 KlWr7ItZlnaf6hD099mkomZ71ky3P5K21FRPEN9ExqB3aOm/i18gP6hZBpX86+Jnctv5
 jTPBjjftIIRBPugdL7990QfZq+5NGsf/rMp0F9mL608bs8hZZE0CFTi6tvSNykkH7azQ
 KtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=K0HBakyvyDpY3R2a2pai/7kYrrVZW4UZcdz5asoXQrk=;
 b=Q+cRr3qTYTySAfY4l1Vh67/EokhpVDsaXoVMh6f3cdSauykUDm24zemOZDHw2nAUwd
 UWdw1XDxS8fNeUuTndgPQA8Cwt4zJEN7KCA5+vgjPs86O917OpJQwwMpikkMd3pevxag
 UPtKMrQ/OYdbNc4co95ML0RM9PJr4R36kZT0gWWg4m6mO+YbbLimO7kQF0cPFX2noqEV
 PXIkYRKNP7AwTyUS1X//XJLT/a8hKay83Ib0oJJ15aVqnxfgYKNa48bSO1+IGwJz8Pko
 4ISfiwlDnIQdwc0TEj9QKj/H0eFRjaPY4Ae/1V9EusCy9IGBKl/6kAU1jVMz7JmYkUns
 bI+A==
X-Gm-Message-State: ANhLgQ03RG0yfJ8hu4Wto8VW2C56knekXsrOP02lN0Km7xVFggXBlcsB
 zyhdW7ecVL9TqbytOd+UXAA=
X-Google-Smtp-Source: ADFU+vsJ7P0lFtfgBu+zb5geZNyvCy/Z9rBEgnPklFcURcKCVjIwDxu+cfB1nwhKgZjaaFbT+j96kg==
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr2192630lji.254.1583503216428; 
 Fri, 06 Mar 2020 06:00:16 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y24sm20422100lfg.63.2020.03.06.06.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 06:00:16 -0800 (PST)
Date: Fri, 6 Mar 2020 16:00:12 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
Message-ID: <20200306160012.42274b9a@eldfell.localdomain>
In-Reply-To: <20200219132728.64083-1-emil.l.velikov@gmail.com>
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2058133290=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2058133290==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NmOq3mN6SdFF2IrVf8cH7NN"; protocol="application/pgp-signature"

--Sig_/NmOq3mN6SdFF2IrVf8cH7NN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Feb 2020 13:27:28 +0000
Emil Velikov <emil.l.velikov@gmail.com> wrote:

> From: Emil Velikov <emil.velikov@collabora.com>
>=20

...

> +/*
> + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES wh=
en
> + * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
> + * from becoming master and/or failing to release it.
> + *
> + * At the same time, the first client (for a given VT) is _always_ maste=
r.
> + * Thus in order for the ioctls to succeed, one had to _explicitly_ run =
the
> + * application as root or flip the setuid bit.
> + *
> + * If the CAP_SYS_ADMIN was missing, no other client could become master=
...
> + * EVER :-( Leading to a) the graphics session dying badly or b) a compl=
etely
> + * locked session.
> + *

Hi,

sorry I had to trim this email harshly, but Google did not want to
deliver it otherwise.

I agree that being able to drop master without CAP_SYS_ADMIN sounds
like a good thing.

> + *
> + * As some point systemd-logind was introduced to orchestrate and delega=
te
> + * master as applicable. It does so by opening the fd and passing it to =
users
> + * while in itself logind a) does the set/drop master per users' request=
 and
> + * b)  * implicitly drops master on VT switch.
> + *
> + * Even though logind looks like the future, there are a few issues:
> + *  - using it is not possible on some platforms
> + *  - applications may not be updated to use it,
> + *  - any client which fails to drop master* can DoS the application usi=
ng
> + * logind, to a varying degree.
> + *
> + * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
> + *
> + *
> + * Here we implement the next best thing:
> + *  - ensure the logind style of fd passing works unchanged, and
> + *  - allow a client to drop/set master, iff it is/was master at a given=
 point
> + * in time.

I understand the drop master part, because it is needed to get rid of
apps that accidentally gain DRM master because they were the first one
to open the DRM device (on a particular VT?). It could happen e.g. if a
Wayland client is inspecting DRM devices to figure what it wants to
lease while the user has VT-switched to a text-mode VT, I guess. E.g.
starting a Wayland VR compositor from a VT for whatever reason.

The set master without CAP_SYS_ADMIN part I don't understand.

> + *
> + * As a result this fixes, the following when using root-less build w/o =
logind

Why is non-root without any logind-equivalent a use case that should
work?

Why did DRM set/drop master use to require CAP_SYS_ADMIN in the first
place?

What else happens if we allow DRM set master more than just for
CAP_SYS_ADMIN?

Does this interact with DRM leasing?

Looks like drmIsMaster() should be unaffected at least:
https://patchwork.kernel.org/patch/10776525/

> + * - startx - some drivers work fine regardless
> + * - weston
> + * - various compositors based on wlroots
> + */
> +static int
> +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> +{
> +	if (file_priv->pid =3D=3D task_pid(current) && file_priv->was_master)
> +		return 0;

In case a helper e.g. logind opens the device, is file_priv->pid then
referring to logind regardless of what happens afterwards?

> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
>  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
>  	int ret =3D 0;
> =20
>  	mutex_lock(&dev->master_mutex);
> +
> +	ret =3D drm_master_check_perm(dev, file_priv);
> +	if (ret)
> +		goto out_unlock;
> +
>  	if (drm_is_current_master(file_priv))
>  		goto out_unlock;
> =20
> @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, voi=
d *data,
>  	int ret =3D -EINVAL;
> =20
>  	mutex_lock(&dev->master_mutex);
> +
> +	ret =3D drm_master_check_perm(dev, file_priv);

Why does drop-master need any kind of permission check? Why could it
not be free for all?


Thanks,
pq

--Sig_/NmOq3mN6SdFF2IrVf8cH7NN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5iV2wACgkQI1/ltBGq
qqe2NBAAjh/pqXYyGjp3uZUiBRiwoUt55taXdHJePdg1o6OpWxKlPQm4sPEK1mrZ
lTbkRB2tRqgVmLFeyZYkTwNnUBKVLds9FDns/qEbvOJ+tAMWh3gkcPJq5uJS+NQZ
I0B/ma4/ro11z852I+OzLPmiMFhoXLhiqoTVmY+AfBZ7eUKpPsq2AaDqNR9OTB4B
qBJ7zujbXPccsHTgkgKYRkyfnXdmO6zJRzwjdVnVMvp0E/KvZWons5ZGhOXi49ub
WUcKdX8BUoSG7UYrhJhjGyrWDxpVhkxyTOFwGFyMM9JAAOFJEEAcLbzr7XDw7BkJ
tTLemMlH+vAiA69wASRdW1LDs0+nDNzQs7HV7Nh4dTIvZthfMVga6iQX3BJH/Rsv
p0vMB9MyyVghAmcaoni6tn09eUinlNjK3rLOYkzcOYgwZ7N7uDQ3pbg3RUEUwnIC
xcm2F5+Q96M+YYkOxvlhRP7MfeG84PhZs7TSBphAZjkCV96Q9Go6mwKW7kqYILYf
flaBL6yDhKPuJiEs8yaFJvj4o2mYS290O4zhIbviHgifr42j9DlLrn0z/i53ce4N
x0sy9E6L/R/zQOEl3HXEWEp+razqDrt3b2/t8oRoF8h1PC8cfoveWFR6imBwX6o7
mFE8/+jSiUJM9epPtQnhDE/ZS6MO+iWOyqHWpkeZG3bUVKUXGEA=
=MoYI
-----END PGP SIGNATURE-----

--Sig_/NmOq3mN6SdFF2IrVf8cH7NN--

--===============2058133290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2058133290==--
