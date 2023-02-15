Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E1697971
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 11:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA2210EA7F;
	Wed, 15 Feb 2023 10:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093DA10EA7F;
 Wed, 15 Feb 2023 10:01:32 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id t24so6538236eji.4;
 Wed, 15 Feb 2023 02:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dz9vllzKoHBb6DA1A7MKhCFZvJ98n6y0MD2xLT4e4Gc=;
 b=dgQBNwZDSgtNGJKK1fQ57MCsZfNS+NLqv+pQc+W4gSjlPrKUQiP7vax8A2txNB1IRS
 lWoJHJJGSbI1DfIWV7ELmQ0Sban2dOlgKF8JQkhWAneBe6MSjDN3UwiRvemE9yhdJfpA
 sw1+YelZsgr9bjo7MdfAkMXkq7GHj2m0CFyXhiGAWHtsX4FynFX/brAPWo/5FnH1mTKU
 2E8xZh1JX09qt60g2zXYQTYvrnColZg5RfaiieCLrWxW0YVl3GmJOBLuYVL27zYJL+sf
 8cEpp0JtuilWLrKSDil9q4sI7eznm9WgA38kpLIH+bQH7Y2gf/xBUUot3A5tJtalDAM1
 qrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dz9vllzKoHBb6DA1A7MKhCFZvJ98n6y0MD2xLT4e4Gc=;
 b=J2MhxopAJRmFXGsB24UtoOfWCDLYuj/pw6BV3sMzaCDfEHT7pLyAG44jeZTypn28Q9
 XYQjB5Mwuwv4VsGrOfjaUcyKaG5NVQSuf9UWwVGLys3IDzm+dRf+O51LwCHI3nq0mjC5
 KROp1vZhgAhLIz9LBF3yFQeqww+r5B1Z4wl8EnZWCsYWToCJorceVbf/QuM5pgSiJcxu
 iI3ggeXLYxyxPq5klDidgOBtJTnNXYgGQ+54Myor0Bwu8YbV4LZ2Zh13QB7eEuPIjTQH
 xF+hpveCwGuE2MjegR0qDlweNa+dpUiakM2a+AAZYxhncCEMnJIbbiRTXmNxDX6+u8nI
 jPBw==
X-Gm-Message-State: AO0yUKVxvOGzM2TzVm676WJQDbeCfFayibOTchFiHjtlOZLSFfwFH5Ch
 5Ou5oqltbgd6hwJsMijF8nc=
X-Google-Smtp-Source: AK7set95rbVUueJvjnrbG85Xf7CWjzBixNroyz0+feMVW4XW8qPoixUtQPElG2UcAOh6J05JxqRUZg==
X-Received: by 2002:a17:906:1ec7:b0:8a9:273d:634c with SMTP id
 m7-20020a1709061ec700b008a9273d634cmr1777795ejj.21.1676455290203; 
 Wed, 15 Feb 2023 02:01:30 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b0088091cca1besm9448986ejd.134.2023.02.15.02.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 02:01:29 -0800 (PST)
Date: Wed, 15 Feb 2023 12:01:25 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230215120125.59b5965c@eldfell>
In-Reply-To: <Y+vqu3qGUQayTjd+@intel.com>
References: <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
 <Y+vqu3qGUQayTjd+@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i20NCVKD7xBSv62G7yFyKfA";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/i20NCVKD7xBSv62G7yFyKfA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Feb 2023 22:10:35 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Feb 14, 2023 at 08:45:00PM +0100, Sebastian Wick wrote:

...

> > We also have to figure out how a user space which doesn't
> > know about the new property behaves when another client has set that
> > property. If any property which currently might change the pixel
> > values is used, we can't expose the entire color pipeline because the
> > kernel might have to use some element in it to achieve its magic
> > conversion. So essentially you already have this hard device between
> > "old" and "new" and you can't use the new stuff incrementally. =20
>=20
> That problem exists with any new property. Old userspace and new
> userspace may interact badly enought that nothing works right.
> In that sense I think these props might even be pretty mundane
> as the worst you might get from setting the infoframe wrong is
> perhaps wrong colors on your display.
>=20
> To solve that particular problem there has been talk (for years)
> about some kind of "reset all" knob to make sure everything is
> at a safe default value. I have a feeling there was even some
> kind of semi-real proposal in recent times, but maybe I imgained
> it?

I've been talking about that too, but I think it all collapsed into
"let's just fix all KMS apps to always set all KMS properties" which
results in patches like
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/952

It does not seem to be a serious enough problem for anyone to put in
the work. And why would it be, when you can easily fix it in your own
project like that Weston example. The Weston example is not even
representative, because I did it before I saw any real problems.

Other musings have been in the direction that maybe logind (since it
opens DRM devices for you) should save the full KMS state on the very
first open after a reboot, and then KMS applications can ask logind
what the boot-up state was. This is a variation of "save all KMS state
from the moment you launch, and use that as the base if you ever let
something else touch KMS in between".

You also never see the problem to begin with, if you never let
something else touch KMS in between, so that already makes the problem
rare outside of the tiny set of compositor developers.


Thanks,
pq

--Sig_/i20NCVKD7xBSv62G7yFyKfA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPsrXUACgkQI1/ltBGq
qqeCUBAAiAjI/J/36l25DY7OQcIQL1j8hTOVE/tfkwfxvqzx4MvFFfJCeWWRhK9l
zfTb7y5vP/YYxGOtX4zbOQpkKRMOeDp1RAQzcr961BPZr58J7EODG2rwMsFqGrIU
OOMEsy4BiBI1x8QnOzeemvycXuFW3BUEUwnvXy+bvSSBXjMdkM0699F0tvFEfU7t
sgTL87GCTK2+wPG2Z0QDwYHQwjLhdPzZZbRygsSfHq2qieIhf6qbRxLlrvMl0yuO
jcRs+U0OuRu6XnilbjmofEF5BEUs9J6i518FbCE4XvHzO3DDNn45cVjDmucRa8pQ
w/85ILU2+cHYQAYgO7PEjOxvlXv+aDgrxW4ezt/Vcld9BP1QxFOdSfCAXSQiGh03
yVnv41krTyPZ7hfgzvk338VvqLAp4n8t3j6oBxpOnQjNuh6pUrnoSEIMkabP1FBw
NbZhp3C4XPg3oGAxE22UrDXe/RTVx5rGgNxNNmry+xH21ZudgJqIsTWeE44UbXJZ
IfEkCexaTu3wF2dvkDbDWfXRehQdevtHS0iwvTeIXKjmT0L+g2NQdFqCIMJNrgWP
oJErl9j8BiErrvADK3dk2JVxJKqZsdSuKQT9Rmca2NnI4mjQWYqfMo0Zz97zu6tF
4AvMAeN+ej+YrdRCtrXoAkNoMBCarD9UJghJO5Zf5Jdjh0NndzU=
=CJr0
-----END PGP SIGNATURE-----

--Sig_/i20NCVKD7xBSv62G7yFyKfA--
