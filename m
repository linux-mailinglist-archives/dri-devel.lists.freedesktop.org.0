Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7867810CF1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 10:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A439010E759;
	Wed, 13 Dec 2023 09:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0472910E759
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:05:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50c0478f970so6960950e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 01:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702458329; x=1703063129; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uPVstSGHW2mJYYKDhOcbHVvFc6FCpsaEprPwYoO2QrU=;
 b=TgInXD9cSNRhjOwjDILApW43riBhQTY6nv20JahjtFI3TqE80XqYcS9yfg7OvM1Rpu
 2XNgsK1KYeCiYfy5+jA0ba0XRQbgRGG1UZ4dxAl0G2t9kErlS4sY1prZU/AA9GGtywly
 Tipup0gjt79MLtlr936Jy4gSuOSZV8doWvrVs3bZWA5tS8DDvIjg6qgG0a+WSnXbZd5U
 Q92/YTXJzQqOLZ2QQfxaxHV+6+geQqelSfLo14m0kHaKcBPgk1Bmh7jknIVnwOIDmS0C
 gyj18RTwufWqmpQWBsWqWLgoKXi9ak8Cso/Z0rcF8UT8Udzr6DcZyeRhJghoS9Nf4988
 FV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702458329; x=1703063129;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPVstSGHW2mJYYKDhOcbHVvFc6FCpsaEprPwYoO2QrU=;
 b=RSekmqnZkblxaGTT0qbrRo9HHeFBSDsGRC9CdypIvtfKSDsVjH8mZgL6Vvh+qm3gCX
 QNm0rbAbTxFIqaR72A9XOZxQkIGasqODAhLgHER66KkEOO2Qa3/Ar17azo7nWigTTyqR
 NK70MEukW5+wmlveDaJDAv/+b69fWE5d9/jDX1Gn9eicNMEJEAx1BWENM8mWz2tLVM84
 f8ywZ/VCFZBZdQB7UC6/8eg367REmY4WeVDlfsSEOgzu2P440etYWSh4FQ0Kqmoq3RMg
 r3eBgYwSUkWEypKgL6lfxjd9Cf2O6RKoR9g9Y5jgIw7HDg1YVU9AVb53HCuyhuoiekP2
 O12Q==
X-Gm-Message-State: AOJu0YyoI0o21iggKNw0nu6zdDDUprbcMt28dNegv1R+FTMnzjXfrxHR
 Q4LgyaPSplu2mJ1qpdZZMmk=
X-Google-Smtp-Source: AGHT+IGWpeNIT+ctXpc3/nJZFateSOhCrGMOM+zwxTvVL6e43wnzc3r3OJ2tC/PYR81yyP2zfmy63A==
X-Received: by 2002:a05:6512:38cf:b0:50c:5aa:83b4 with SMTP id
 p15-20020a05651238cf00b0050c05aa83b4mr2890212lft.114.1702458328719; 
 Wed, 13 Dec 2023 01:05:28 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y18-20020a199152000000b0050be6326f2asm1597596lfj.64.2023.12.13.01.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 01:05:28 -0800 (PST)
Date: Wed, 13 Dec 2023 11:05:17 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <20231213110517.6ce36aca@eldfell>
In-Reply-To: <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaWmOigQ7D9ggi2.WnkRpp3";
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/DaWmOigQ7D9ggi2.WnkRpp3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Dec 2023 16:36:35 +0000
Simon Ser <contact@emersion.fr> wrote:

> Is there a chance to pick a better name than "secure" here?
>=20
> "Secure" is super overloaded, it's not clear at all what it means from
> just the name. Something like "restricted" would be an improvement.
>=20

My thoughts exactly. Every time I see "secure" used for something that
either gives you garbage, refuses to work, or crashes your whole machine
*intentionally* when you try to do normal usual things to it in
userspace (like use it for GL texturing, or try to use KMS writeback), I
get an unscratchable itch.

There is nothing "secure" from security perspective there for end users
and developers. It's just inaccessible buffers.

I've been biting my lip until now, thinking it's too late.


Thanks,
pq

--Sig_/DaWmOigQ7D9ggi2.WnkRpp3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV5c80ACgkQI1/ltBGq
qqdqdg/8DMTwQfWf/EfE0E0FOjM0IPMnzZreMPcRlHBqMJqgQA5miVL9CVE+novh
ohRbfFYLwut7eqtK6Dzn+6hOIVFRMpGPkWe8qHfT+CJ8Wr3hD8Q23PKEveH/FENO
G+XUbPzsnlDTDs5MB2Bb1TAiWQLS8Y1/nstMZ49l8mmW6Iim0Z+/xhyqUyLaHfpm
zB7JRM7CSN8gyPhoqoAAITy+ZL4+yD7D28izgQA4YZD4JzkE1fYOUFzNb4QRA/T7
GxPSExZlU7+CdIL5zAJvhqpHh9nxMdOUvaP3aQBzShcTKDVoet/TZ+0QuEOuD1QJ
gHG05Hcp5gREsbjn9oytS2km0LcL7ZmR98NOrf9idl4jZDjVTEMQvV/FrSSwiyGv
5whtFHkkDVy1nXjyYmgiGO7dvIptO+dNGgRtACt3xe0tdvu5ndP2+hG21ADVWebc
fd2T4mnUoANro1gOjWATV5+0fzlOK5hFff70pvE9U2ATvqXo7i2I+kzW/EJFPilA
4EqR7cIyLCaVRb7q/dC4CdWUu0NIxCp7+u22Z/B8pHFw2MnQZa0twIKV3GJokfrR
A4PfZLAvpbSkfr7SalrN6eYFHhJOpcCJPHXCiQSnRT7DU5u6NhUr35IZgq/YuANC
YrU/v7fiWv2v6I0I2FN8fBaH1baL6/SWpA5q43OECPVewbA/Uwg=
=DQfN
-----END PGP SIGNATURE-----

--Sig_/DaWmOigQ7D9ggi2.WnkRpp3--
