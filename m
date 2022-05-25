Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18565533758
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 09:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73A410F1AD;
	Wed, 25 May 2022 07:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD9D10F1AD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 07:28:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u30so34585457lfm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=pO2mmWknTRH7wF1MKHGepXpW+xnhRXHIrQaTD3UJxBI=;
 b=AxBB77GyI6Thna6NS3LW9lY3FjnTxWELbjrY8dMrEed1nyq3HDXLQEh41iQEGWGBBe
 BOpllTCe6qkh3fX1axi+/EJY90v5j2UV/eOj23akkiUFJzD+wNugDVBG5mve+ZH25GXY
 8EeIim+0JDfWNmOozeLzFUQDm7GyQ/lRmXK2SYjYPsA2Yolz3aBmaERjySVElqdtapUh
 pZJhVVTGYgYb3mPv2hpYLiaSll33uSPkPMG0MklyWvZy32M97iNR8TaIQ+Bvk1mtgUee
 mF2ByX3oIhWJ0ruwVlVLTUbCD/hrtul0B2bhBNKd4oJ4JSKy1WVc9MA79rOXWoJq6M4R
 eAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=pO2mmWknTRH7wF1MKHGepXpW+xnhRXHIrQaTD3UJxBI=;
 b=7vi6BrxTLXwULYu2YXPgERfsGaYf5bV99+fuDcdxDYaJ4gY/kfrOxugxfmla2NRQn6
 8ZzoGOMuMV8KKgNncbHcSuGoM74XBcSvgKwSzxLcEBkh1bWPxkJP93KyXbekLW53txHR
 SQHBEN03wExhqddijW6/Nft8AEdGWyf++FBKysMz2LfNeCAJOGkWuJRuZz6eijJTVkl+
 1HnQDfibmpidJhgos5HKJBixfEImyp1ASmHuWPnymq3pvN6yy5HKleDzj29gBkAz30tS
 ukRrTLZMhJT24jN5hFISvG8tmb0wZfDPGJnNgdKmFXawqSiDGOB6iglpamlGQ6cRg8dJ
 860w==
X-Gm-Message-State: AOAM532x2W2t/vsnNvimLCIbvKgSd3p0AFrxv/RHHFFIk6/s8cRPSphV
 bnbyzJA5tp8c+F74hSJ+FW4=
X-Google-Smtp-Source: ABdhPJzVUxVdPDP4ZeDOjuJzptr2bq+IY7CwW0KSIeDD2bo9lV2eIBsedSFnXDVgkex194kM5UOg4w==
X-Received: by 2002:a05:6512:1281:b0:478:5d5e:114f with SMTP id
 u1-20020a056512128100b004785d5e114fmr14790864lfs.649.1653463733041; 
 Wed, 25 May 2022 00:28:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h16-20020a0565123c9000b00477a0eb9ab8sm2002186lfv.133.2022.05.25.00.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 00:28:52 -0700 (PDT)
Date: Wed, 25 May 2022 10:28:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <20220525102850.5a70e58f@eldfell>
In-Reply-To: <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VUP2s1iucz9FZgMklEsqk9o";
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VUP2s1iucz9FZgMklEsqk9o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 May 2022 13:54:50 +0200
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> I was always under the impression that if you do an atomic commit
> without changing any properties that it won't result in a mode set
> which would clearly make the current behavior a bug.

This is a very good point.

If one does an atomic commit (even with ALLOW_MODESET) but has changed
no KMS property at all, there should be no change in KMS hardware
state. That would be logical to me, but I also understand why KMS
doesn't work like that yet: the existing KMS properties are not enough.

Also KMS properties with "auto" value are probably favoring "the
best/highest possible" instead of "keep current state", which raises the
question of how such KMS properties should be initialized when the
firmware has chosen a different value from what "auto" in the driver
would. At the same time, this should not regress old userspace that
never sets a KMS property because the userspace was written before the
kernel exposed the property and the only thing happening was the driver
automatically choosing the value. Actually, the definition of "auto"
therefore is neither; it is "whatever the driver happened to be doing
before exposing this property".

Another question is how userspace can tell the kernel that it wants to
keep the current hardware state. That's the Plymouth problem.

Mind that "max bpc" is *always* in auto. It's only an upper limit, with
the assumption that the driver can choose less.


Thanks,
pq

--Sig_/VUP2s1iucz9FZgMklEsqk9o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKN2rIACgkQI1/ltBGq
qqd7Kw/+Lg2bpqHnBC2jgXYqKouP5TAkuQYgoFba3tFPC1yW45JfSLlBXdVV7MuD
2W0oU1/xyaP7Rqogg98D5tiTC9ntO4VL96oldqAasbZPriU+IFPQusbEVU3ll7v2
aCPp+JX84GgBNgleCn46zc72OtfwoKkSslIV3helf8qVKEIoTrSwm890RoPQGiip
+5puECJuRekI9MzO3VIN4I9NBUVl8PCxr+rLaPKK4o+5lkiELrHUkfzYbAUv0ol2
h6ceGvUKyRbnJxAa2jOB+SK0sjUSodZ1773xnfm71+8Nowv5SoZKNHYMSCpCsFN3
rRMO2CAB3GidW9kIhvroYHxqn+NQwVv87kqQ+Jv8zrUbHiB+OwWT0EP5m23Rn+8J
lAYwyoAJRWHGRyZandU6xxg+j4HemsHk6c6s2pZQIHc465vKyDil2pJaqtq8/apx
UXNOE6C4dfT8X15seNtArpHrUttxBbbLn79/nrtZjZAzlFexnyupxl9tR5frxZze
1hADrVUH2RVRvzI6D/nb9FHRZ0wlTrKHNJ14yXp98i22c3rBGWYb/eqCgCdh2vMe
xnDrmQ9l4WvlZhDbbaDeVx7Q2tVvxixrX/AzvUIA/apuEJZ/At57dVFVEDZVKP6z
+9WDWxnbFcdOKrAJ9fJhii3HIpvJoRAgiKYAOLGf4nkfvgLH0h4=
=8nue
-----END PGP SIGNATURE-----

--Sig_/VUP2s1iucz9FZgMklEsqk9o--
