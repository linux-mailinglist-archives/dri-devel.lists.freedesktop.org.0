Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433E7CA7E2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 14:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192010E1C9;
	Mon, 16 Oct 2023 12:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141E10E1C5;
 Mon, 16 Oct 2023 12:19:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so2734623e87.2; 
 Mon, 16 Oct 2023 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697458752; x=1698063552; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6EhyDqUQjEdCPm8wLm8OFPGsaItsVSXANH1gNBCUPXs=;
 b=BuRPzH2f+Ad6zXuI+q/My/wciYlDe4MYL7XjPzhR2FevHnNBMQmj06UE/q+onyclnq
 yQS/8WdmlGKdnkWmSiqeTI/gJSYuo61L2YjUocvcSDuGgcvTNmC/hErP7hAe+f3qfqcp
 zurQa7CvaQGrp138ckYVp34F4/murKI/Ab3+kAUFf2ayiaoC8hgNy0N9P8tmH6rXdBKZ
 V4S5oIbUhldp8z4vsu/Cwqkfbg1Zg/MYjvzAR9Kxb7JrcFZm5GPl1qHqafumzNTNcQWc
 i09EBH+dlfvtHTh6+L579SpC+XdkT+kThuUMwK47I9MYeGcL6rcNc+Urv3xz83uuRGAt
 CKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697458752; x=1698063552;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6EhyDqUQjEdCPm8wLm8OFPGsaItsVSXANH1gNBCUPXs=;
 b=DW/JYkUCWZ/p/bWMzy9ChMnEFlknPRu5F5ArWqMl30fszgte9sZSEWSOmyuYpasnc0
 IiSsSade8Z6zD/nrUd8pEg1ICof4z+0gUhR+uTDbu3PT5lsJK0vmp+mrjCWL5MWbCEGx
 LhMEQj89DKvWYNP8ZgxeChjDwW8FFlRNHWQyMLs3Bc5tzb+aMhYFasOdenQqN4PTQ+qz
 /rY2ifdzS+Y/ZQD6CChArp2GEvuxNZTZWaUtv7vhVXwUoa/3F52Dro3im3txC/L2I8N4
 zf9ou9oEGzS8KtQRie8m8m0v9cpZYLpPCdz54Mn8ZChpj9rPAKa2xZaZNpTn6eQ1ST+B
 7sOQ==
X-Gm-Message-State: AOJu0YxXgdyQTctBl8J+JtpTrC4R+EqtTAXg5dQI4OptQ1At/c5jPZgP
 EyGAve+mkpJUOCj3J1BVV1A=
X-Google-Smtp-Source: AGHT+IFEsLXStxwkdwRXiQB2HK7VTB81PgSSMx0CUVuOSYNVWvv3i/9WVm8Y1nugkxm6d3lmo6GTdA==
X-Received: by 2002:a05:6512:132a:b0:503:2877:67e3 with SMTP id
 x42-20020a056512132a00b00503287767e3mr32451180lfu.6.1697458751652; 
 Mon, 16 Oct 2023 05:19:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x9-20020a056512078900b00507a0098424sm1175692lfr.109.2023.10.16.05.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 05:19:10 -0700 (PDT)
Date: Mon, 16 Oct 2023 15:18:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <20231016151856.74af9305@eldfell>
In-Reply-To: <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <20230815185710.159779-7-andrealmeid@igalia.com>
 <1b23576d-1649-ff5c-6273-b54729ea46d8@mailbox.org>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/69O8rYFAi5QP/ITj8UsboXe";
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
Cc: pierre-eric.pelloux-prayer@amd.com, kernel-dev@igalia.com,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 xaver.hugl@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/69O8rYFAi5QP/ITj8UsboXe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Oct 2023 12:52:32 +0200
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Hi Michel,
>=20
> On 8/17/23 12:37, Michel D=C3=A4nzer wrote:
> > On 8/15/23 20:57, Andr=C3=A9 Almeida wrote: =20
> >> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>
> >> Specify how the atomic state is maintained between userspace and
> >> kernel, plus the special case for async flips.
> >>
> >> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com> =20
> > [...]
> > =20
> >> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> >> +effectively change only the FB_ID property on any planes. No-operatio=
n changes
> >> +are ignored as always. [...] =20
> > During the hackfest in Brno, it was mentioned that a commit which re-se=
ts the same FB_ID could actually have an effect with VRR: It could trigger =
scanout of the next frame before vertical blank has reached its maximum dur=
ation. Some kind of mechanism is required for this in order to allow user s=
pace to perform low frame rate compensation.
> > =20
> Xaver tested this hypothesis in a flipping the same fb in a VRR monitor=20
> and it worked as expected, so this shouldn't be a concern.

Right, so it must have some effect. It cannot be simply ignored like in
the proposed doc wording. Do we special-case re-setting the same FB_ID
as "not a no-op" or "not ignored" or some other way?


Thanks,
pq

--Sig_/69O8rYFAi5QP/ITj8UsboXe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUtKjAACgkQI1/ltBGq
qqf20RAAnw0oZXemzgfErYkfbspei2AiW5NBarJedqPGc6nsl6TnUV3oNRGogGLL
vJpsyTvfxmYgb79fTvuB5fc0nJJecuwtQ17W6x9VcwJkZOpdRi2Uez2AO9dvNpSW
VKVVuyujVmyCk+UofjyHa+zUJC31YakmhiF6LFPB0IyYdo/+o6svRpn2lmHNXRU/
v4KFGi8S1wsg3iokMemnpJZYvdc+mSH0W9WJ0kaesv3Wn05xnBpmfySR9DZzUq9t
qUoGipgOnfQ/LLfkvLqece8bxP6ENtFNERXfE6YpWz0LTIqsW+TCV/QfmcgrD6iU
2R/+LH8GzZ2pjovxbqXsps5QKTB+wkSydkDQuwt0eR4Rx7k1NAzaKWP2Xg934wDB
BIOzsHzjB8dchzjf3+8/ezSuocAxWtGRV6eaJ8sFLYFh6OB+bi6K00v7eg4J5scK
aSjf5fmeP2JNWbfEqLlK1tWYAsT37g08MUEIewGXBceG3C3vaNgwLjgKFbL/KNff
uLL0zgusaKtDxxKsDCti6bVJb+ntmpnp92PGh2lPp33DplZ32/5/kd7fwe9Sh21K
iPFaqtyBR4u1BadTVhekLmXNY0YIpevjdNl+B+EBRvM6HaxHRdrnakLgg6IWDEsY
8oEZ3kIQ1cJxtNVktLqy6X8T9fZL4U7emXJKvYdJMiubbMq5MFs=
=ZKmt
-----END PGP SIGNATURE-----

--Sig_/69O8rYFAi5QP/ITj8UsboXe--
