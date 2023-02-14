Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91991695F7F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1450F10E84A;
	Tue, 14 Feb 2023 09:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487F710E837;
 Tue, 14 Feb 2023 09:42:33 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eq11so16455197edb.6;
 Tue, 14 Feb 2023 01:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CneLcNePTxmxPCuMN5qgIM5RhFk7J8/AUOOpDjXCfTo=;
 b=YBEhYcRWrVFXOsfSSWfonp/Ty9WSpV18PzjzrXCoMq1c/cqAyRoXS9uO4qGQgKdiJ4
 YqC6SRScz+yHlIOFLmzJmgrBwj4jaV+mrZPyac77o7qscxPdhPeOxrParkCsPIU5zKOO
 V2+0b2yUPwYZhSondGbOVdNVAax98z/wurwVlUWkSsMWcCTWy79gURMOapAsQno7oRSJ
 kwEiq9vX/YM1PzRuP+jlSdulUOrTFkFbzZW6MawrvPyjeN1GnGQaQh9sM9FEG7fh7jHY
 21ArKpcy96sfUEYHE1f/Pvsr3lhvAqBS90+d2sfJ2MU9dBGYVItFhY1c4JuyNlk3ahi8
 7nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CneLcNePTxmxPCuMN5qgIM5RhFk7J8/AUOOpDjXCfTo=;
 b=J8FFJJYz6u9EEj1txhwarrxPzT7uhiIFHpa4UFlrt/aDTdEcTz1W+TxDLoC6BOjUIO
 amsQRcdumu0UV1T8X4U2PHLNKf5/K0xri9oN7/s9ZRZXBnKUHzuZVieKtJXesIqNlwQQ
 fse9bkfnfrTdY9WiEOfOObcdduBhFJKhGAIHfZmhmYmsANpu6AKeRs8GhJPy/JBUfTBi
 QyYUWpQXk3ONPkF+WPzoYX0QMbSBNXAvidkKLeteewczDKwDMBlPRKJWteZez7fvJMrP
 vVJQH4rP9Ksu7PS09H5KNrRPxo0FyOb4IBs7nONHsk9510QEsgeuTmGh6xE8KScJtLUe
 PCKA==
X-Gm-Message-State: AO0yUKUbDcegmawbemw7p/9Bk0RwedAmqnFc4p6wNAfcgdOh0LuFjqtx
 9nITZHJ5geDwCNDRp3/XjoU=
X-Google-Smtp-Source: AK7set/DKg4offrj49NOcxRraTwrBgS5kW5JzQYHzaPC48O0tJhS6QfPsTr0d+WQ7dX0m9sIgNFifA==
X-Received: by 2002:a50:9b58:0:b0:4aa:c3da:3ac5 with SMTP id
 a24-20020a509b58000000b004aac3da3ac5mr1582849edj.3.1676367751641; 
 Tue, 14 Feb 2023 01:42:31 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5099cc000000b004acce817ab7sm1884104edb.2.2023.02.14.01.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:42:31 -0800 (PST)
Date: Tue, 14 Feb 2023 11:42:27 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <20230214114227.7fa94b78@eldfell>
In-Reply-To: <20230209135105.4137872c.pekka.paalanen@collabora.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208141312.76df0cb0.pekka.paalanen@collabora.com>
 <Y+OdtR78JnQOTj38@intel.com> <Y+QRSH3kLD4Xrktc@intel.com>
 <20230209135105.4137872c.pekka.paalanen@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/On3glXAj27+16GJv4.m=zYE";
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/On3glXAj27+16GJv4.m=zYE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Feb 2023 13:51:05 +0200
Pekka Paalanen <pekka.paalanen@collabora.com> wrote:

> Maybe we could refine this so that userspace uses the stride and height
> implied by the caps for allocation, and then use the exact cursor image
> size for AddFB2? And have drivers pick any size between those two they
> can use. The kernel would need the userspace to promise that the
> padding is always zero-initialized, so the driver can simply scan out
> any area of the buffer it needs.
>=20
> Then we don't need SIZE_HINTS.

Would there be any problem with this?

If this works, it would seem the superior solution to me, because
userspace does not need to guess or test for the exact right size.
Simply allocate at the CAP size, pad the cursor image with transparent
pixels, and let the kernel scan out the optimal area.

And if the kernel needs to do a pixel format conversion, it only needs
to do the optimal minimum amount of work.


Thanks,
pq

--Sig_/On3glXAj27+16GJv4.m=zYE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPrV4MACgkQI1/ltBGq
qqcRDBAAopAby9MTWTwn7DiqGy1CRVadFw6HjCoSZ0kej1evlbqCHy8YC2kkBM+g
xw/rPWJ5Y8k4AKDw2iLKmWW+zCGMPCgodSBmfx+HTDs7AIhGK6hwCkeOQDUolDG/
SJ2M6RX1IN/qE4Ru4Wav9SDPqTsre4ph58DjZtWQ0MWwXWJFNDdGLddxDzOrILXO
2FkxZcCAAqRDm6Z5O+O2S2rQiuAv2fMgqLTr1tc2FpGcygmNSpJ6KKx6cmSD7pyE
Ay9KiFdU68FGVqSmbvxttDBdM73cgrBF4VCb/lnSuIhn1qDrg4tzoya3gHVoEGTu
QZHb+Zi9MhwCKZWjPShdILtcPDGG117CsZprzvb+7jEPezkX4OVvxIbm8A7fllxJ
R37N+yAf8I/RxAYq1chm6vUG7ZMaLhSqRb5+Smi53m9dbbVW8sbiVO63A3oPia2r
iS6b61C8GjfegLH7KLtBd+gmKgX4e3QlCcAz/cJnz7gkj7KWaBVCM0IL92isq1t/
XhKsYQNnhuAolcGDq9ZYIBxk6C3ewktkhbYGlsiPjue8mk6oGDMWjPE7x2r1x3tS
4p06RYdCrj4ZeF3lRVJv4WzABcqMQsrLXnW7hQbEytV2EyFLAvsvUQ4hl6u8JOyr
5R5VRGBhAa7jhssmG9Uxi8DdwAt4yUr7HPV55ccMVRyGnneGpIs=
=EWOM
-----END PGP SIGNATURE-----

--Sig_/On3glXAj27+16GJv4.m=zYE--
