Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D3530B0C
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 10:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDC210EF6E;
	Mon, 23 May 2022 08:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38C10EF6E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 08:22:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w14so24186859lfl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=IWA0nyJJ0Da8x7dz+uUT5ULJnVD5a01Qj3BKi7RLl+Q=;
 b=q7z9eCX1KtgnrL5z9vLuSau3OB5rUZyMMQnNCZFUm8+iHDywrtUqeWUQJyGBwUHfKN
 oLjx4ErAW8jG1uslZLhz8hth7n6MWOuDbwzeToGyJlUtOy5atYVBP9pFML3c8WWmHZ0x
 7ZDeRBkxAnJmcmC2wuOaHHaZLe9C3CiizEpmaizwZpNmPnzGg7hmjo7YEw80Ja3zkkdw
 /5w/RBAMRoOHqdZ7fy2mRbKzKfAsvHO9EKjS34hAiCOHK7bi3a1LxtuHCETGA880Vvki
 l09sKSv6ULzGnrasX0Rt1siUD5GX+evs55a4YhZ4al+R2+Zh1aMpBdhk6zJ7v2LZWdeH
 cvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=IWA0nyJJ0Da8x7dz+uUT5ULJnVD5a01Qj3BKi7RLl+Q=;
 b=5mIcJj6N6BRgTnfqhrcDJQb9VI9h5Q+EYF2mDubuskLcBe/py0O9ZtCe/nTcfws41m
 iy3sI7x4kcYujGFixH80opx+lHWyzZstCsCAGREggWtVRMVO9LGuiat1OKcz0G97gp3W
 xb11lUedZRNcdCCmn3SVikc8yfEHt9KBM5bJ2crNEKdOtbKZaiyLWP4B8aSa0kA7oKbO
 hGYGFOjBaCWBIBLWKo4+3oIqxeLdUUeoPTyVKruacVxS00JFmeIkPza0LcwCR4v80yEF
 8/FvTIzNni1yrVlEoBzve4hpLWDDllXeklWe3g7NJn1Yqb45Nzi6HcW+DEHjapO4YwEj
 IzCg==
X-Gm-Message-State: AOAM530YIbM8chCKAlF74UnsRKZVIKnPOJlHXUbvQQ85EaZXkziwZpfF
 ylvCXtZokmi9uFVIeSqX/yA=
X-Google-Smtp-Source: ABdhPJyvL7MiIsI6C5QYyEqqO2WyfBUUDmpih8nS6sDE/YYTpV/V0inuLgD3EnjR3BTbv4hqKevKHw==
X-Received: by 2002:a05:6512:16a7:b0:445:862e:a1ba with SMTP id
 bu39-20020a05651216a700b00445862ea1bamr15195533lfb.85.1653294176507; 
 Mon, 23 May 2022 01:22:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25319000000b0047255d210e6sm1850590lfh.21.2022.05.23.01.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:22:56 -0700 (PDT)
Date: Mon, 23 May 2022 11:22:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <20220523112246.056ddc99@eldfell>
In-Reply-To: <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YDi9kt5+Np1E2WPYM9bz0_y";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YDi9kt5+Np1E2WPYM9bz0_y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 May 2022 17:20:50 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> I got pointed to this thread by Jonas =C3=85dahl while asking some questi=
ons
> the "max bpc" property related to:
>=20
> https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102#note_1382328
>=20
> The current i915 behavior which you describe here, which if I understand
> things correctly is for "max bpc" to default to as high as possible is
> causing problems with flickerfree boot in plymouth. Plymouth does a modes=
et
> on the monitor's native resolution in case the BIOS/GOP setup the monitor
> in a non native mode. Plymouth does not touch the "max bpc" property when
> doing this modeset. Normally this works fine and when the BIOS/GOP has
> already configured the monitor at the native resolution the i915 driver
> will do a fastset and all is well.
>=20
> Still the modeset is causing the screen to go black for multiple seconds,
> despite the resolution being unchanged. What is happening according to
> the on screen mode info from the monitor is that on plymouth's modeset
> the link is being configured changes from 8 bpc to 10 bpc.
>=20
> Is there anyway to avoid this without hardcoding "max bpc" to 8 in
> plymouth (which would cause the same problem in the other direction
> if the firmware sets up the link for 10bpc I believe) ?

Hi Hans,

there was an attempt to get much of the current link state information
delivered to userspace, but I've forgot most about it.
I did find https://lkml.org/lkml/2021/6/18/294 linked from
https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_963469 .
I said the same in the Plymouth Gitlab issue you linked to.

Personally, I would need to know all current link details for
(professional) color management: am I still driving the monitor with
the same signal as I did when I measured the monitor one reboot ago?
If not, I cannot trust the color output and need to measure again.

Nice to see there would be other uses for knowing which might be higher
priority to the larger community.

Would it be proper to initialize 'max bpc' to the link depth used by
boot-up firmware? I guess it could make things more reliable and solve
the Plymouth blanking issue, but not the professional color management
use cases.


Thanks,
pq

--Sig_/YDi9kt5+Np1E2WPYM9bz0_y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKLRFYACgkQI1/ltBGq
qqfDsQ/+ImT4nm095HozuXChgMyrrIYz+xwr+NWBKkQAQuY3lIx/gC2E5f8H3PHq
hSiluJUTNg9MjVpBr9rt6hIlspBl8q9d+27wD+CdpkA2PWRi+INGz9BWJMBc3WBo
eKk3ZgbC0eqJyyG7JZZpgqWzDk+OajaIkDiT9Jt0V30pO25fPCAeyDwpGPWyeh12
rcHX+0G37QjdsUqtDCPqlkb44WmRKmr17UZlRvFoSfW5HrJEryQqBqSQA+LbMawE
1dVfaEbRZ7DjW0DPf0yoaHsp0Yeq836p339AWc4bB7Ah52US0t55a2qzX4Cv3c72
4ZhwDk2Fi5r/QbaNOwmaWlM6j4muAwleb76bqpS2euWoIpo9/95aN7mKuBJ+Dz9G
qEUGUf9VTKa8aWbnQbv7fgWuzj7YL8rbCFX5NT+TiK43RRUKtMiYKUaTo5ISxuRm
G2a6LY+BUKsK6A4bCBfAfB0kXoKel7PJ04+oPHWWj9TsKBlbQqp5rOSFDNISRAfY
GdFhXFWes5CBsMAsrGcOTeOu2c6gWKMiSm1m5WE3v1KaYPmMYF3gnBjgHPw0nXx1
vIh6v0kb9YUv5htLYhA6R3t7F8bFXEM0Jp7gvJvh1eYbx+/Kw08s2HHKOlpDQ2Yp
DRAxW2XH9iu2g1QGxM4vthdadvWBpQgSVoH0FoSx/MbAwqsji5I=
=tJIC
-----END PGP SIGNATURE-----

--Sig_/YDi9kt5+Np1E2WPYM9bz0_y--
