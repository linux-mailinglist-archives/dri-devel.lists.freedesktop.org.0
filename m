Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88193AF0F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989D810E0DA;
	Wed, 24 Jul 2024 09:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="eqWvWseX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689410E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721813451; x=1722418251; i=markus.elfring@web.de;
 bh=GI16kZp/DZvJnXEv3qKUE7rVQHnu64qzaMVHUItjoNw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eqWvWseX8RDPKAwb2VcpWYv+kWCGBIWVyhmp57Dn7iSBNPaKf/2mo1q3+739GeO5
 FYctuKYDMo0gWeBAwfG7ZuDmFmQzdhYIzKF9e9Cv4iyAVFwJhJ6teIO3ghKA6U34y
 KXE3JTcrlBQfqPqNQsxJ6MjtMSeVEqJtxcqwKITMNgLsTyRA5uc/KaxeFayzfP2uK
 fWzcocvnMpYECZLChYebvUNNGjXuqT02ZLF2QGmxiDTALaNmaQaDtzDJdyl2Epr9I
 94Ett4G/bKFRf48NmvNCYDG7gh7XnscOp4Fg9uxhZhaltWESHdsFZH5UPnK+fjGG2
 ogTcRvwVCg1sCEwb5g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4621-1s6FvG0jk9-00wNRB; Wed, 24
 Jul 2024 11:30:51 +0200
Message-ID: <6ccf3891-fd72-47de-ab89-cdc7e9425c56@web.de>
Date: Wed, 24 Jul 2024 11:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/debugfs: Simplify character output in
 nouveau_debugfs_vbios_image()
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Ilia Mirkin <imirkin@alum.mit.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, LKML <linux-kernel@vger.kernel.org>
References: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
 <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
 <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RrGA6l7txMMXcnwEjtBSuPugQcQ+Aylad8jkNWgceoTGStNyfqr
 wTlrqWtDAlH0lOi3LmxFuBdFOurzcAMSBbVSOyx+7nYCzF9yEcAoO29vnrsaXFglXk2xPCj
 xn93kdCjgeIzu8z0n84elnUVbB32IjyF3DtuT04QF72Qb6Ozr7fwwcCvhY/mPFW43KB60nl
 6D7f2g3ZueR3VhfSCZLEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C3lcjC5oZS8=;DVJfFXGPfp7ihietJXxV4YSOv0c
 un3HOOokhKNsh4QAHnFrfQuzuFCEpaGi1xrkfUj7MDr+0JCPOwMXLBxeAJmlQMxLPNreUsjtQ
 roNUpubYtHHL+EVpYb0Q7I+g++Oxh5F2ZMY+vGlYo0AvceELcybcPZTxlBtb3IZCoauTU9m1S
 ht+BIOh0cb7KGtpZBbhOxYQ8kQJl7atuVYvsAFZ0SNyv2k7HbTmS3K54k5JuI6e67KdR0XMOB
 Y6PXS6gXmoN6QSN3uygBUPpKhfLQatXdnBL2nyMgwYa/9CzDsFuAybofJMTqd48qxJbvlEG7D
 1Ath9KSnstLC0AO0PDvsJgiW0gbffWXdYcDzfpyRsyQztaPnJMoW4NqlnrCsUcqXSJM3ixK0R
 gdD/GdiU3w01EVoYYfClF/bctRxLulSi/0abkHeqYXi4hzXDMRpSr3VRstAghGzYMWs3w57hC
 sBtXZouQ21rTIakIC9AUlAEO2h3O03M8bcoFzrnZMnMxKUAirtjr/tP1qZ0VJGC/5pOMa54VK
 6yCYdzL4qCqhMQOCXvkcNm/T3Aw9WkupeD4uMxwYKgDulRbnW8ka4DnRCQNH1pB/2z81XXvxf
 Zs1LcxjShshMbARhoCdgPUxYUD85eLKlTLrfYIurRgm3oT0ryXtLiex6PfRKU9t0157H7qHa4
 5D9wKxcGzpyqxOIifBWUKQP0qy4JokmQSa8Gp/YZ1d1kl/i08lbfYddTuP5VgeUO+Lfyjuo/y
 Qf95saO/iqx7QkxbB6wIaneO0g0yXG0DduVsxziGHh7v1FiyYC5l9XKd/4JVfyT1yk/6Jls5X
 AKenXixwFu+XceBf6IsDYOUQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> Is there some reason this whole thing isn't just
>>
>> seq_write(m, drm->vbios.data, drm->vbios.length)
=E2=80=A6
> I don't know if my answer is relevant or not here but:
> =C2=A0=C2=A0=C2=A0=C2=A0for () seq_putc();=C2=A0=C2=A0=C2=A0 =3D=3D> wil=
l fill 'm' with everything that fits in

I find such a discussion approach strange.


> and
> =C2=A0=C2=A0=C2=A0=C2=A0seq_write()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D=3D> is all or nothing. So if 'm' is too small, then nothing wil=
l be appended.

The clarification can become more interesting for this system detail.
https://elixir.bootlin.com/linux/v6.10/source/fs/seq_file.c#L816

Was the sequence size (or the file capacity) appropriately configured?

Regards,
Markus
