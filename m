Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE636992FB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDA210ED3C;
	Thu, 16 Feb 2023 11:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE1C10ED3C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:19:18 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b30so1589715ljf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nd20msd7SEW7SizJmRzHGz+kV7Lx/UlUEaH+b/pbN7I=;
 b=AcKnBFCsPIxdBG8whZbvYnCVcxsyeSXxsxcfY/eVOooElcFqH43hoSoo7AvVgScpqu
 ik4j2eZWVf6MaELQ9ehfkUwqf6Svuk2Jntnnxr88tUJXiIBQ4sDipNqQUr0d1HqD0PFj
 xyirfsmWvfJl5X4B9U41J1pj6SR64HE0neYLogsvsrjqa4lUePmJjlYGGT4McSu8qQ4J
 IlB6Ho2W23B0Dixj0R3Qsd5e92gLNhlMFzaht4+CUy4Om+q7fjIHktUL68txvRsZGG9x
 GR7oQMhyESwKIdqp6/La36MckiFTbsNCt9YO/uGlxdDMN0xMGDzRmtgY0MZYEJ7olZpr
 UVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nd20msd7SEW7SizJmRzHGz+kV7Lx/UlUEaH+b/pbN7I=;
 b=QGU1qoll1t+y3ivCK9XV/M6CHfGWWT1Rn2yGZnamkM0cblLDlpJmRRySOhz5/LMT3H
 MvqYZojSJlxxcNh4Osv3sYXJTWfx93wOCfRAOVgIho2aycXrf08iRO0gTk+HXB+hyDnO
 /E5R1sghhWBG+5JIMUgJvHlK9I4pulwZC3bFwilreb8Jz2GVsqTu6LbiFRdiyzs7HyEh
 RtXaMVcFRTek5Yk3HlS9hW1LwZuyuH6dz23lGdRCKlJuZ4WHeu8N0Ws7wBtnH5GBzCkx
 Kg9B4v2G3a+4e8EUXXkAUCVVoYlEmhBtTPeAjk4ItTCphsicBuk1uDv8Az1tK3hkcAuz
 kumw==
X-Gm-Message-State: AO0yUKVDPWGcNHec4bxoG15+MOlx+3wWSR14o/x27DIxA2jzXWWPSdVV
 l26bepZOE3nloUWwMhkq9MI=
X-Google-Smtp-Source: AK7set8WGmKT1Z4fZE9Lnj8BdSD6VJZvDGZmVa94AkBiumpsyGAvigDV35U3Ui/Bs5vXSp8C0HL1Jg==
X-Received: by 2002:a05:651c:4c9:b0:28c:ee7e:21b8 with SMTP id
 e9-20020a05651c04c900b0028cee7e21b8mr2037681lji.30.1676546356834; 
 Thu, 16 Feb 2023 03:19:16 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a6-20020a2eb166000000b002934fe524d2sm156337ljm.83.2023.02.16.03.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:19:16 -0800 (PST)
Date: Thu, 16 Feb 2023 13:19:06 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document expectations for GETFB2 handles
Message-ID: <20230216131906.49a5a062@eldfell>
In-Reply-To: <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
References: <20230215124152.101548-1-contact@emersion.fr>
 <20230215154123.3f9fefce@eldfell>
 <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
 <20230216111110.5d1e8e7d@eldfell>
 <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wGqNTx2PZr=fQ.K8W5K1_jK";
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
Cc: daniels@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/wGqNTx2PZr=fQ.K8W5K1_jK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Feb 2023 09:25:38 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Thursday, February 16th, 2023 at 10:11, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:
>=20
> > Btw. does this also mean that if you use GETFB2 to get handle A, you
> > export that as dmabuf and import in the same open device instance, you
> > again get handle A? =20
>=20
> I haven't tested it, but I believe that is correct.
>=20
> > IOW, you should never ever export a dmabuf of what you got with
> > GETFB2. If one did, one might import it oneself via GBM, breaking all
> > reference counting. But you also cannot "just leak" the handle A,
> > because if GBM happens to run on a different DRM device opened
> > instance, GBM would get a different handle to own.
> >=20
> > That's... err. How is a compositor supposed to do transition animation
> > from an old FB to its own thing? I guess mmap + glTexImage2D equivalent
> > to make a copy of the old FB so one can use it as a texture? =20
>=20
> I think the compositor can export the handle as DMA-BUF, then close the
> handle immediately. Then go about its business as usual.

Ah! Of course, I didn't think of that.


Thanks,
pq

--Sig_/wGqNTx2PZr=fQ.K8W5K1_jK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPuESoACgkQI1/ltBGq
qqebGQ//V1dVeVmVzqJlvVpbDtF03AuU8Ip5TAjXYc+nbi085qjotqlK/HucNWnn
etZQEey5VtkzvwrT6F5GQWD0UGoY8yaO9dKq7k3nVva00uiF1rtpUwvAPW45MP2k
C3xG6QtGXpDyBK70sD/ehvSSmrMYP6yqjgw+OAK0bFOFTITZswpZdO5Kl56NDj1H
Jw6UkLuBJvbS89kxq9ZeJf8u06HhdG/DYsvKjqOqol7sZTU520LZj8sKqQSPQt5d
z4rJ8i/Xy14n9/bYOpP59vmqqe4AtGuWPJZOpCmT61NyH19sCIW2WxX8icOXJkDr
yWnm33roFd/3u/8IY5Q9pSu9PvZg+pSWT36jrCH3WKDZmm+/6/1qq1g/zADj8uKo
l7t+BQEhtukogybrpUXtmAuq6qqJBL6y8oTbPJQ2nzf4Zs6m60UV9NvXg4KlmgL6
I+STfMDixR5pvI7r3dGiLHL+/Fo+3laYrVsIOy/NaUN/LUBXzHuaR9xO8A2U56nt
lY0DxJ/sqcA+Umlh4+yxEHNKnxd7L6l0v92MZZnkevHXbwaFp+o0U1f23Tn2+jZd
lgj8hDaC8obzvjlsiCiCgdTaA1ix1Ws2D9i7WKRTznRfRs7O7mj7bCEbA3TGYijs
7ewyffX/38mFEG8zEUWG9GRuGrZ24WRqvwN5YdOIBjs20xSf0Ag=
=f7XW
-----END PGP SIGNATURE-----

--Sig_/wGqNTx2PZr=fQ.K8W5K1_jK--
