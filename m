Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF707503D8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A12810E4C6;
	Wed, 12 Jul 2023 09:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 381 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jul 2023 09:50:11 UTC
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [138.201.91.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A3410E4BA;
 Wed, 12 Jul 2023 09:50:11 +0000 (UTC)
Received: from hemera.lan.sysophe.eu (unknown
 [IPv6:2001:a18:2c5:a501:fa75:a4ff:fe28:fe3a])
 by smtp.sysophe.eu (Postfix) with ESMTPSA id 1A675260A610;
 Wed, 12 Jul 2023 11:43:42 +0200 (CEST)
Date: Wed, 12 Jul 2023 11:43:35 +0200
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/17] hid/picolcd: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev driver
Message-ID: <20230712114335.42644eab@hemera.lan.sysophe.eu>
In-Reply-To: <20230710130113.14563-11-tzimmermann@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-11-tzimmermann@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023 14:50:14 +0200 Thomas Zimmermann wrote:
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.
>=20
> Flags should signal differences from the default values. After cleaning
> up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Acked-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>

Cheers,
Bruno


> ---
>  drivers/hid/hid-picolcd_fb.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index dabcd054dad9..d726aaafb146 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -527,7 +527,6 @@ int picolcd_init_framebuffer(struct picolcd_data *dat=
a)
>  	info->var =3D picolcdfb_var;
>  	info->fix =3D picolcdfb_fix;
>  	info->fix.smem_len   =3D PICOLCDFB_SIZE*8;
> -	info->flags =3D FBINFO_FLAG_DEFAULT;
> =20
>  	fbdata =3D info->par;
>  	spin_lock_init(&fbdata->lock);

