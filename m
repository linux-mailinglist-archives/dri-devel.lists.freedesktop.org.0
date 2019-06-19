Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CF14AFEB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 04:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBCC6E27F;
	Wed, 19 Jun 2019 02:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39CB6E27F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 02:17:41 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e3so24607471edr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M9Qva161FZElXztDQcOXpRrTkzAjxL70acGAEB3fgxs=;
 b=iMlCJuSmyD3MaSfZEzCaN6/q2Kx6l46JOLhf8b7u/DJFOlwzTItIY/HBjQBLmGsUrP
 /XejmlznJ8VxIMaBJjaLmwlETx0q4gqvW6mc9N2BzaZrIrLNwxyG3RfFEc256yJOSakA
 x7j9oH/HhKkjsJwEXs/Xmv/sQSUzWkPRfKKWtvjtsFlCgbUO3KFtzUQ0MZ7Sks4kfcdT
 LtXgbycZbR3uUT5Yo1D+vwOripONgjbfaY/Vk6mBTQQoFrZIxpSa0wAhqXVcA5GQjVd6
 WoeqPO76GMtbrvq/jvVfGRKsXdiJn1GPism/g2gKh5AK68ymnyEIxz2+R8XMggmK6I3d
 qk/w==
X-Gm-Message-State: APjAAAXh5mfT472dqBraP+7h+ykigA/Si+HMfcBtIHvob5qRsAGTTnQF
 TtSekdiSE2r5s8npZjTFjUs=
X-Google-Smtp-Source: APXvYqyd2cBRhSSMrQkBhcsmXdLEmdy0ure04Ykv8/FUhhFIlNHjJYaJBl50eGf95GLDmIY8RI7WNA==
X-Received: by 2002:a17:907:2130:: with SMTP id
 qo16mr27367796ejb.235.1560910660519; 
 Tue, 18 Jun 2019 19:17:40 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id f24sm5226504edf.30.2019.06.18.19.17.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 19:17:39 -0700 (PDT)
Date: Tue, 18 Jun 2019 23:17:34 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/10] drm/vkms: Dont flush crc worker when we change crc
 status
Message-ID: <20190619021734.xhjn2ydx7y4tokgq@smtp.gmail.com>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190606222751.32567-8-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=M9Qva161FZElXztDQcOXpRrTkzAjxL70acGAEB3fgxs=;
 b=kVxsS5CrIU1Und/aaqcESpN4tUrbabWJWbHAcrdOsSIJC14l87TDDgbXeIKv4jqdXt
 T0sYwjeTl4sk9xtptNPDs41+R8LbcTBTWE3kwT+M3aLS2PJATqaKDcX672lD8DHQDot2
 gbNUFUvO0iYkmUSlbDiNq81749VolstPhfvzrgGCwREyIIFokHEkoRpQrGbYM5Y8DStN
 HzX5QZaNAT2dF8MvxlxfZhRecUXVk5Ta5LiFlnqx1sI1I2dum2rkXoc0WtB6et6WuFw1
 i/G/m+Q2ox+Tv1NzKCeQrm+F2eDJcwqM4vQ6IJVNxxkrP9GbRCy2wlKuZLR44cMOtz3Z
 eMVA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: multipart/mixed; boundary="===============1415463570=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1415463570==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clcnsybfld6pw3q7"
Content-Disposition: inline


--clcnsybfld6pw3q7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/07, Daniel Vetter wrote:
> The crc core code can cope with some late crc, the race is kinda
> unavoidable. So no need to flush pending workers, they'll complete in
> time.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_crc.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crc.c b/drivers/gpu/drm/vkms/vkms_=
crc.c
> index 96806cd35ad4..9d15e5e85830 100644
> --- a/drivers/gpu/drm/vkms/vkms_crc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crc.c
> @@ -249,9 +249,6 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const =
char *src_name)
> =20
>  	ret =3D vkms_crc_parse_source(src_name, &enabled);
> =20
> -	/* make sure nothing is scheduled on crtc workq */
> -	flush_workqueue(out->crc_workq);
> -
>  	spin_lock_irq(&out->lock);
>  	out->crc_enabled =3D enabled;
>  	spin_unlock_irq(&out->lock);
> --=20
> 2.20.1
>=20
Hi,

I tried to apply this patch, but git complained about it. I fixed the
problem manually (it was very simple), but I noticed that dim did not
add the tag "Link". Because of this, I decided to check with you before
I apply this patch. Is it ok to fix conflict without dim? Is it ok apply
a patch without the tag Link?

--=20
Rodrigo Siqueira
https://siqueira.tech

--clcnsybfld6pw3q7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0Jmz4ACgkQWJzP/com
vP9FhA/+MYPao8GHuL+l3+1pHPTokNTnahWHmBJkY4XxtX47ESOfdfvk4+lLcLYd
1+R3USOVGllL28yPahxprSMKYRuiyl5xx53+QAscC4CfIZxwMiJVJA044y3xdgYQ
7ZdTQ4pAaBWI7V4V2MoqwrzAtX0JdtyusXB2hDmGsCFnacMytdlUuP4i0XWf3XwV
6DB/P2oGlRTOBAVo2v0RNuhQypYMELK5epmMvA1nFYC/6bSmhqW3PIT+tL7QY4aH
YNwo8Tq2pPlf6jb/xhD8DbkSNp8CpQjTPpriXRRpA0Qwj347fEAcR2XqVOqAXBBS
j+SXUo/iHUiD+J58cF6A0kz0RZsDP8n/AxnkgcgWE+FuG5yi9ny96bT261y2zvZq
u0SqPhJtyYmNhQ+di9HD45OK7qEG9e+M2wsqPLXmWuLssHxfTR36lfG/msvoRS2e
qW/a86/qr+JMDEud4LjCzPZJ8JIgXN9HxfjGkiKed+5a+T2rjiSM71pW195bgvf0
/eLoCJsU9acJ4KQZbqBt2AJQXaVBVXOFo8/WkrrVFEORu1WTDvQ+aEY/OQ8+Pxk0
4VIJWPYzIu8CM2UAEKlr1j1fcatjZK3Zk9Yygh8rLa4CGQqNyH5VAzUp2qsvEfI8
ADSyd8YW4SE83OjiBfJchmFIrLLjAVm9zY7YEO8m0jkr+Rj+eKU=
=DLn9
-----END PGP SIGNATURE-----

--clcnsybfld6pw3q7--

--===============1415463570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1415463570==--
