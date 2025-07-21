Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B00B0C580
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 15:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB3510E397;
	Mon, 21 Jul 2025 13:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="ajk7lfZY";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="W2F72LhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45F710E284;
 Mon, 21 Jul 2025 13:50:39 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id E2B771D00227;
 Mon, 21 Jul 2025 09:50:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 09:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1753105838;
 x=1753192238; bh=psLXjC0I/mMFjYdgP4H7159qK6/TIeCOrZEs0qZia+I=; b=
 ajk7lfZY9UqUctfjhm5V0oAJvp6X1e9EWHFYbMbqMBRadQtGC9/9lLYZG84IPUXg
 X11hwv5Hax1ANrThyB7SNhZ2KdPfxHv2lbm6CfCjuCCIZ0VBGfJNtQYmEPAL0HX4
 srOByJJqmkfGdf9qKcO427YhsRFCQ4s7NCTbkxL81BOrhNTIK6PCKxzWKq6ZlqJC
 VMzVGqhENdS71hAOAMBSx0IBx8YyqGobnSfO952lHfUyJHw3yUlliE1JnQSjgxYP
 VZhT7OXq8r+ehwrMj5xVAyRV7Kp7H4hSHcqbbRIwN5xVEPy2psZxjLaoqlpzezB2
 TTk3RXJhL2GdgiiV8eb0EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753105838; x=
 1753192238; bh=psLXjC0I/mMFjYdgP4H7159qK6/TIeCOrZEs0qZia+I=; b=W
 2F72LhMkykc9VpH9AdY885mquIq+cEBUJktlB9mvLvx+pDeQBfLNs9BmwG+rreBc
 3Fz8jsa9IiAXfPv0se7UvtJumAqkI6Z5eMF8Uo91qxUHlwAc5fqpz5EjmpDampTi
 HxWcMRcKEGNOIuhSt+fXSYGtUyYM1hsuuV95L1bVHP5E/zba6hBfKE7hBrjYCrRz
 vDOImjnw2xvQ8mBiLxKZ/7CQl5KwutBqrC5OxL3PPC5XhyRruoAB1K8acyY2ajR2
 bca277qr4tM3Y8jIFnROqpv5kS2n/qtBO0GG4CYf7G5RLm/q/Y76/6HL1TwUzE2K
 o06S8vOyKAKjP1Y6gfjAg==
X-ME-Sender: <xms:rkV-aMs7g6nQLSwCua3bibYmyhBskrKPPZAvv9yq7xyRF1ENYTmgXg>
 <xme:rkV-aJfzsoXOB_xOxw-avMCYgntbG3CyIo7pQisw9CPRRH3FKF3Z-g_QQX1jM8mXH
 wR0XQw8rq7u8tYR0ac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhht
 pdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlh
 hivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrthgrughruhesghhmrghilhdr
 tghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskh
 htohhprdhorhhgpdhrtghpthhtohepnhhouhhvvggruheslhhishhtshdrfhhrvggvuggv
 shhkthhophdrohhrghdprhgtphhtthhopegsshhkvghgghhssehnvhhiughirgdrtghomh
 dprhgtphhtthhopehtthgrsghisehnvhhiughirgdrtghomhdprhgtphhtthhopegrihhr
 lhhivggusehrvgguhhgrthdrtghomhdprhgtphhtthhopegsshhkvghgghhssehrvgguhh
 grthdrtghomh
X-ME-Proxy: <xmx:rkV-aBIiYwVAYjwUL_8fwB7To4aTm22s89WWSFP3a-ER3RWOpcH5NA>
 <xmx:rkV-aDpN18Xq2YxFB9bEKR6V30-guLaDIb9UpYy03pvTrX_OvYnkbA>
 <xmx:rkV-aHsIcMI3XXubulrRu27NhTLTxE7cAnVVk8Ve6vBa7hdNmrivmA>
 <xmx:rkV-aFJqYPpuS9kIkLhfKC4khel-Aq3SfdcySqOvwswJRlFIEIznLw>
 <xmx:rkV-aBv6PUCABo5mWiHxk_msm8GB8e18o8VfFhKTRD3l4OWyd13mcbwu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 32F5C700065; Mon, 21 Jul 2025 09:50:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T0fa10d1000c4a2fe
Date: Mon, 21 Jul 2025 15:50:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Satadru Pramanik" <satadru@gmail.com>
Cc: "Dave Airlie" <airlied@gmail.com>, "Dave Airlie" <airlied@redhat.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>, bskeggs@redhat.com, bskeggs@redhat.com,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list" <linux-kernel@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 "Simona Vetter" <simona@ffwll.ch>, "Timur Tabi" <ttabi@nvidia.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Message-Id: <0d8287db-4943-4cce-87d1-25a22d3228ea@app.fastmail.com>
In-Reply-To: <CAFrh3J-SpU03=Kgi8vj1XLsMfruQyF1Rew6L2+aYUgZnkTLJAw@mail.gmail.com>
References: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
 <c32114e7-a61a-4c2b-ab4b-b103d028d05f@app.fastmail.com>
 <CAFrh3J-SpU03=Kgi8vj1XLsMfruQyF1Rew6L2+aYUgZnkTLJAw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
Content-Type: text/plain; charset=utf-8
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

On Mon, Jul 21, 2025, at 14:50, Satadru Pramanik wrote:
> Sure!
>
> Here you go.
>
> The command I ran was 'glxinfo -B'
>
> diff glxinfo_working.txt glxinfo_broken.txt

Unfortunately, the 'diff' output makes this a little harder,
try 'diff -u' next time. I suppose passing "-X raw" to strace
would also help since the ioctl commands are heavily overloaded.

> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x48), 0x7ffc5a254340) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0x88),
> 0x7ffc5a254390) =3D 0

I think this is where it goes wrong first: (0x64, 0x47)
is the correct type and number for NVIF, but after my patch
I only accept the _IOC_READ|_IOC_WRITE caller but not _IOC_WRITE.

> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_CPU_PREP, 0x7ffc5a254250) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0

> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0

More of the same

> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)

This one manages to actually overload a command from another
driver, but DRM_IOCTL_XE_EXEC_QUEUE_DESTROY happens to also work
out to _IOC(_IOC_WRITE, 0x64, 0x47, 0x18).

Obviously these commands still need to be supported, so we need
to (at least) allow both _IOC_READ and _IOC_READ|_IOC_WRITE versions
of it.

Maintainers, do you prefer to just revert back to the original
version, or should we do another round that allows exactly the
necessary commands?

It does get pretty ugly at that point, and is not that far off
the origial version, with only really the _IOC_TYPE check remaining:

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nou=
veau/nouveau_drm.c
index 7bb64fcdd497..8bc61dfe7d9d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1284,7 +1284,7 @@ nouveau_ioctls[] =3D {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_AL=
LOW),
 };
=20
-#define DRM_IOCTL_NOUVEAU_NVIF _IOC(_IOC_READ | _IOC_WRITE, DRM_IOCTL_B=
ASE, \
+#define DRM_IOCTL_NOUVEAU_NVIF _IOC(_IOC_WRITE, DRM_IOCTL_BASE, \
 				    DRM_COMMAND_BASE + DRM_NOUVEAU_NVIF, 0)
=20
 long
@@ -1300,7 +1300,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int =
cmd, unsigned long arg)
 		return ret;
 	}
=20
-	if ((cmd & ~IOCSIZE_MASK) =3D=3D DRM_IOCTL_NOUVEAU_NVIF)
+	if ((cmd & ~(IOCSIZE_MASK | IOC_OUT) =3D=3D DRM_IOCTL_NOUVEAU_NVIF)
 		ret =3D nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
 	else
 		ret =3D drm_ioctl(file, cmd, arg);

    Arnd

-----
(full quote below, as the reply was off-list)

> 1,129c1,20
> < 10221 ioctl(4, DRM_IOCTL_VERSION, 0x5564c66a4e50) =3D 0
> < 10221 ioctl(4, DRM_IOCTL_VERSION, 0x5564c66a4e50) =3D 0
> < 10221 ioctl(4, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254e20) =3D
> 0
> < 10221 ioctl(4, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254e20) =3D
> 0
> < 10221 ioctl(5, DRM_IOCTL_VERSION, 0x5564c66a4e50) =3D 0
> < 10221 ioctl(5, DRM_IOCTL_VERSION, 0x5564c66a4e50) =3D 0
> < 10221 ioctl(5, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254340) =3D
> 0
> < 10221 ioctl(5, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254340) =3D
> 0
> < 10221 ioctl(6, DRM_IOCTL_VERSION, 0x5564c66a4e50) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_VERSION, 0x5564c66a4e50) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x48), 0x7ffc5a254340) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0x88),
> 0x7ffc5a254390) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254330) =3D
> 0
> < 10221 ioctl(6, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254330) =3D
> 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, 0x7ffc5a2541b0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a2541c0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254110) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254110) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254110) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254110) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a254210) =3D
> 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254260) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_CPU_PREP, 0x7ffc5a254250) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a2541e0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254260) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_ETNAVIV_GET_PARAM or
> DRM_IOCTL_EXYNOS_GEM_CREATE or DRM_IOCTL_IVPU_GET_PARAM or
> DRM_IOCTL_LIMA_GET_PARAM or DRM_IOCTL_NOUVEAU_GETPARAM or
> DRM_IOCTL_OMAP_GET_PARAM or DRM_IOCTL_PVR_DEV_QUERY or
> DRM_IOCTL_QAIC_MANAGE or DRM_IOCTL_TEGRA_GEM_CREATE, 0x7ffc5a2542a0) =3D
> 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254260) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254260) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254260) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_READ|_IOC_WRITE, 0x64, 0x47, 0xa0),
> 0x7ffc5a254200) =3D 0
> < 10221 ioctl(6, _IOC(_IOC_WRITE, 0x64, 0x47, 0x38), 0x7ffc5a254240) =3D=
 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254230) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GET_CAP, 0x7ffc5a254270) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a2549f0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254940) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254940) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254940) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254940) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_CPU_PREP, 0x7ffc5a2548f0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254a10) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a2546c0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a2547a8) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a2547a8) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a2547a8) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a2547a8) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a2547a8) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254a10) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254960) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254960) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254960) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254960) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_CPU_PREP, 0x7ffc5a254a40) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254a30) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254c70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254ba0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254c80) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254cc0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254cc0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254730) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254a30) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254980) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254980) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254980) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254980) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_CPU_PREP, 0x7ffc5a254a60) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254a50) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254c70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254ba0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254c80) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254cc0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254cc0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254d00) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254730) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_PRIME_HANDLE_TO_FD, 0x7ffc5a254818) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254f70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254ee0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_NEW, 0x7ffc5a254e10) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_GEM_PUSHBUF, 0x7ffc5a254ef0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254f30) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254f30) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254f70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254f70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254f70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a254f70) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a2550b0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a2550b0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a2550b0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a2550b0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a2550b0) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a2550b0) =3D 0
> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)
> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)
> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)
> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)
> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)
> < 10221 ioctl(7, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, 0x7ffc5a2550e0) =3D =
-1
> EBADF (Bad file descriptor)
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a255060) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a255060) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a255060) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_GEM_CLOSE, 0x7ffc5a255060) =3D 0
> < 10221 ioctl(6, DRM_IOCTL_NOUVEAU_CHANNEL_FREE, 0x7ffc5a2550b8) =3D 0
> < 10222 +++ exited with 0 +++
> < 10221 +++ exited with 0 +++
> ---
>> 5236  ioctl(4, UDMABUF_CREATE, 0x7fffd017e990) =3D 6
>> 5236  ioctl(6, DMA_BUF_IOCTL_EXPORT_SYNC_FILE, 0x7fffd017ea00) =3D 0
>> 5252  +++ exited with 0 +++
>> 5251  +++ exited with 0 +++
>> 5249  +++ exited with 0 +++
>> 5248  +++ exited with 0 +++
>> 5250  +++ exited with 0 +++
>> 5247  +++ exited with 0 +++
>> 5246  +++ exited with 0 +++
>> 5245  +++ exited with 0 +++
>> 5237  +++ exited with 0 +++
>> 5238  +++ exited with 0 +++
>> 5239  +++ exited with 0 +++
>> 5240  +++ exited with 0 +++
>> 5241  +++ exited with 0 +++
>> 5242  +++ exited with 0 +++
>> 5243  +++ exited with 0 +++
>> 5244  +++ exited with 0 +++
>> 5253  +++ exited with 0 +++
>> 5236  +++ exited with 0 +++
>
> On Mon, Jul 21, 2025 at 8:38=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>
>> On Mon, Jul 21, 2025, at 14:22, Satadru Pramanik wrote:
>> > Hello all,
>> >
>> > I suspect this commit in 6.16-rc7 has broken acceleration with Mesa=
's
>> > nouveau drivers on my machine.
>> >
>> > glxinfo -B reports that I'm using llvmpipe.
>>
>> Thanks for the report!  Can you run the failing command with
>> 'strace -f -o logfile.txt -e trace=3Dioctl ...' to see which command
>> it tries?
>>
>> Either I made a stupid mistake in my patch and don't catch the
>> intended command any more, or the command that gets sent is actually
>> different from the one that the kernel expects.
>>
>>       Arnd
>
> Attachments:
> * glxinfo_working.txt
> * glxinfo_broken.txt
