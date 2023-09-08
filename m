Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD4798655
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 13:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277C210E897;
	Fri,  8 Sep 2023 11:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58BC10E897
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 11:16:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so3318342e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 04:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694171810; x=1694776610; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OcN5cw/C+gJCgvXRNdQZdkPx4WgOPpUAOuQOlvAgh8c=;
 b=iuDWzgAshHAkyKR+gtOBqvliWUF7rp9ix0d//QXDeSjkzxqlixFUVYdz6YpMjlNqHb
 QDF5D6+j03A8XLpZ6+DZkn2Hs7KJlsf83Gghe0XpQihLEbjcSAsa8+/7IQoaJoG1azXi
 ETX+MnwrVME5hsoiw12ZC5Hm/FwqInzuBof+ir9RT5zyrOLCenOS9RxfLnREOv6Lns/N
 GWSlrMtUwLlbtqBNbVbqBtwW3J0k8LOFHAtnfVzTkbK0QlB7G+Bf2m8G8C91E9sX9b4w
 a7+L2qvPXPAJ8k3xrx7TZ5CQoH2XPH2xDpMYKsh3rB8bE2x7+jGXEKK0eaSogjCoQ+fV
 hhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694171810; x=1694776610;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OcN5cw/C+gJCgvXRNdQZdkPx4WgOPpUAOuQOlvAgh8c=;
 b=DwaGWlNmaHWwxpWzTLzrdchWtg39l2vQh6wj4OUgIZP/WyTP+LF1Ty1gj/ZNZJxWor
 tHixoZ0slu/C6tineKJLCpr2Cs+zZ+nY3MBMO2mHl7IDpAfyjozVJkia2CNAKw2ETrvb
 Lk0gZNtGvaBtX+J7U4fVAtc5MaqSz/hqJ3YF70CHKQY2orDwb7U5Yf52DEs/DX4iLgCe
 Riq1wNkgQiKCNElOdvWNkoRnbdEoHMJ+3Vbw1i0b47cw3Q/F8z5jpb++GmXQEKNCiIYp
 wWAdunHsxPB0WfHUFZr+e1NBFhIpgTV1vpCud9dd7zPxjPlbqCjjKWyjK2vMuvCi5eTF
 OG1A==
X-Gm-Message-State: AOJu0YxyQhBFZk4Gen+s38fUcuhSZnkDDdBoUsSc9+/UrMtZzXt2tDCS
 6JmqY/ByUZeg5yCSd9hA9OI=
X-Google-Smtp-Source: AGHT+IG4OJ3LskPYSkDT4/jdeLf3b7I9JsZ82pW7k+6cnWFfbXilXJTXCWw+6koQDkWD7VhQg6pMbw==
X-Received: by 2002:ac2:5bcf:0:b0:500:b553:c09e with SMTP id
 u15-20020ac25bcf000000b00500b553c09emr1603445lfn.32.1694171809547; 
 Fri, 08 Sep 2023 04:16:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g25-20020ac25399000000b004fe2a7a2ee2sm249783lfh.160.2023.09.08.04.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 04:16:49 -0700 (PDT)
Date: Fri, 8 Sep 2023 14:16:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <20230908141638.79b31d1e@eldfell>
In-Reply-To: <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pppjceL.c_/LXi=naHSaMCB";
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/pppjceL.c_/LXi=naHSaMCB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Sep 2023 11:21:51 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
> [...]
> > + *
> > + *     But there are two exceptions only for dumb buffers:
> > + *     * To support XRGB8888 if it's not supported by the hardware. =20
>=20
>=20
> > + *     * Any driver is free to modify its internal representation of t=
he format,
> > + *       as long as it doesn't alter the visible content in any way, a=
nd doesn't
> > + *       modify the user-provided buffer. An example would be to drop =
the
> > + *       padding component from a format to save some memory bandwidth=
. =20
>=20
> I have strong objections to this point, _especially_ as you're=20
> apparently trying to sneak this in after our discussion. NAK on this=20
> part from my side.
>=20
> If you want userspace to be able to use a certain format, then export=20
> the corresponding 4cc code. Then let userspace decide what to do about=20
> it. If userspace pick a certain format, go with it.

What is the reason for your objection, exactly?

> Hence, no implicit conversion from XRGB888 to RGB888, just because it's=20
> possible.

For the particular driver in question though, the conversion allows
using a display resolution that is otherwise not possible. I also hear
it improves performance since 25% less data needs to travel across a
slow bus. There is also so little VRAM, than all dumb buffers need to
be allocated from sysram instead anyway, so a copy is always necessary.

Since XRGB8888 is the one format that is recommended to be supported by
all drivers, I don't see a problem here. Did you test on your
incredibly slow g200 test rig if the conversion ends up hurting instead
of helping performance there?

If it hurts, then I see that you have a good reason to NAK this.

It's hard to imagine how it would hurt, since you always need a copy
from sysram dumb buffers to VRAM - or do you?


Thanks,
pq

> > + *     On most hardware, VRAM read access are slow, so when doing the =
software
> > + *     conversion, the dumb buffer should be allocated in system RAM i=
n order to
> > + *     have decent performance.
> > + *     Extra care should be taken when doing software conversion with
> > + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explanation=
s here:
> > + *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eldfe=
ll/
> >    */
> >  =20
> >   static unsigned int drm_num_planes(struct drm_device *dev)
> >=20
> > base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781 =20
>=20


--Sig_/pppjceL.c_/LXi=naHSaMCB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT7ApYACgkQI1/ltBGq
qqe/jA//c5JyRUphetm/8PV7mbgHJTkr2R9o2p5MA5N1RnGDOW4DQROwhhfmnq9W
yFB8OAbDacCQimDgwvWVSxqKuK3F7K9bWVP9hvO2///HdaeOs8quo26EVLk3p+Vm
DllnH934T26pjAQQmp6Pg/5J5Rk8K0kw4iQevD4fwjalzsHMaNCA5oehkm6e+Ktx
DSSayidJtL6rujljdU260wf5xnP+pzjPApP81Gk/AEwJt8iZQ1K5g5FS7ZZoAB7V
tXSkP/P4b0nDPBzMko9oD+SxMmfb0+d9ZqiprlLIOEDD1mpytDN6VyKidFNuy69D
0U8XYU4LKuZd844Xx5i9ZgRR8Hg07ZtbFq0IPAqYKXXNr3xk8jJKEE+GfqV3XSq4
O/yuyHhViOUm8/ads/DpzAjVnjBS4e8Rvz8PQtlCgIEHxvo2xQMH20PEREGVNDpu
8UdazAKpmCegbS0KbdexmCecp7GzRDzc8oGSGayEy9DEvj81oKtbKCl592A/1Glv
rNsC+fs1e8FICbsd5AsCmmqrg//IUxFDXVmK2TxDagHaOi7LubuiTEezPQK1xkzi
190ZSB8Cx2e3KEpP8zPyGTJce+dm7fqcffrQf8Tw6hAT01kypXOpFb4gltVtOiWk
mDfvaIhRB0ang9s0gjeh9y+Q0Qv4ca89Xq4VhDVXGGBG6HeHrSI=
=rOp6
-----END PGP SIGNATURE-----

--Sig_/pppjceL.c_/LXi=naHSaMCB--
