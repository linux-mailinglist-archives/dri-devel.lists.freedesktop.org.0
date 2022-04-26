Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4250F469
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6756510E55E;
	Tue, 26 Apr 2022 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DF510E583
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:35:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p12so25083039lfs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=INXPZWbiDLeqBv29y7IVgd95f3iPhbVXDs6wohIQ/1M=;
 b=dFPK/YsbVBUzFPW0XTq+4NUqqNRtbSm/xLj1iXEmWJCweHXno/HDNjb9ujZvxCilBd
 ZkfqNa7Xwxv2CVHxHnxLDccjaJs8G61stmcAbVBahvtj9EpYbaVdz32HqUHXwx8ZkL2f
 DGHEEPIi1K2uqaPJ+JZKauFtpxXo7fY0b8Fu4BznLRd2hiPYvtQAALF9nOCW6EOhempR
 hXu8fhmsJ/ghNMeMRPngR5BCiiUaUPuco7Gt8LccXkIeXp/Ga7iqzHwf43Kdunb0nsyK
 BHNvXfhfVvYCLhO/cFaM5tBF7Sw8a+dy13UUvenA8qe2R8JoHw7TgkSzTllujeBqFaCj
 X8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
 bh=INXPZWbiDLeqBv29y7IVgd95f3iPhbVXDs6wohIQ/1M=;
 b=z3G+CJt10jG5e6J6Y1amJ3pDjNloiPkRuRt6i/nZqL+tAhCd4Hf7ViEjTFECpuKOdk
 gwECwyYzfrV4h6wqwXRhIzRhBJCVFSi7Wl2VjHNXgcD0EsobWnavGvsPf2Q1B6Mc+Wlj
 /uQ2GzfUgWZWRRJd4Uypd+tHWn+GYyTC/nW34adXs+K5ZKuihZsiIhdCOBrQ63EKkeb6
 DN8iH0NenOoptWWqPqNCZkyqpge2HORgtLwx9PwBacllecNI2M96mnaJ9/hq+lz0CaZo
 7WGg4StvO1Vpn3N20P0Z/8+6zazArbUDb3nKnEnvg0wJ98NopX1Qh1ujF/yR2GTxCevE
 NtpA==
X-Gm-Message-State: AOAM532C2gxRM0HdXYdiTu8UKVMvtXEINUQ9aTZCWuNLaxUYvoxATCod
 hL3xZNZH+QWs5rhZI8dX07K8iNPX78E=
X-Google-Smtp-Source: ABdhPJzFf1tcZpwtSilMvHRe9UsTYh1QFawGaoGYedgMEsL+Rz80ZsvuGJ0AUQehAvgXZprGMME5rw==
X-Received: by 2002:a05:6512:3995:b0:471:b3db:1193 with SMTP id
 j21-20020a056512399500b00471b3db1193mr16374028lfu.532.1650962105441; 
 Tue, 26 Apr 2022 01:35:05 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p11-20020a19604b000000b004720b965eefsm541238lfk.179.2022.04.26.01.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 01:35:05 -0700 (PDT)
Date: Tue, 26 Apr 2022 11:35:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: How should "max bpc" KMS property work?
Message-ID: <20220426113502.224d0a90@eldfell>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iKTddM2jNVmrZmpYqnZ3ST4";
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
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iKTddM2jNVmrZmpYqnZ3ST4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm working on setting HDR & WCG video modes in Weston, and I thought
setting "max bpc" KMS property on the connector would be a good idea.
I'm confused about how it works though.

I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/issue=
s/612

Summary:

- Apparently the property was originally added as a manual workaround
  for sink hardware behaving badly with high depth. A simple end user
  setting for "max bpc" would suffice for this use.

- Drivers will sometimes automatically choose a lower bpc than the "max
  bpc" value, but never bigger.

- amdgpu seems to (did?) default "max bpc" to 8, meaning that I
  definitely want to raise it.

If I always slam "max bpc" to the highest supported value for that
property, do I lose more than workarounds for bad sink hardware?

Do I lose the ability to set video modes that take too much bandwidth
at uncapped driver-selected bpc while capping the bpc lower would allow
me to use those video modes?

Or, are drivers required to choose a lower-than-usual but highest
usable bpc to make the requested video mode squeeze through the
connector and link?

Do I need to implement a fallback strategy in a display server,
starting from the highest possible "max bpc" value, and if my modeset
is rejected, repeatedly try with lower "max bpc" setting until it works
or I'm out of bpc options?


Thanks,
pq

--Sig_/iKTddM2jNVmrZmpYqnZ3ST4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJnrrYACgkQI1/ltBGq
qqcTFg//WkBVnd2ybIPPVZgw56wKjRZmpu69v5NrBIKxLU6xJ2/HXXPpNyLS97qm
0xqDXPQ2GJ6V835R3EOnFvTw0GKSFBZJH7g9f/PPC0NBgeYBWeyhQP7mfBaCN45S
M5OdJ6K5VlTL1NPEJii3ogDrigyynsHvt2h0GNXIUhGn0GmD7TLHdTw0wKe48S80
SiF74QFhT6vtEpIXv35vaqnyHEvmEEyXVTQjxEpHR6SMj0hU5eWG7NpoRbxedZNQ
Vo75+HzWQ5JW3oNVpXAJ33/7yVZ9zFGH/X3DayTV96RFhykq1uJFSb942uHbGtob
LLAaRyhgUhBrLlLRUAIq01UsKSTP9ie9KqP8EEJ5vRY9oIkDm8AnyFJoJOqk5vZP
dnBqS7kh1GoesJm3Bq3ZrpvBNs11o80hERSPvMsBA8XSqWr3xg5XThVxZEe3VXOv
TpcbpmQ+L5pkDAwMoxPPLLF7MAa/kNWi6Uynztt7G50Xco3bJXjGUbFflxOKLMe1
8tYZrCQXGRfSSImuGzzLwtnmri7D/JTOy8uO9PH7BcXL/alKTfYz2SqxJkBml8Mi
hkL/M0817j0RyEfr0TKeAINuwhIcOfV94VZowF85WuAuwtBmWpsDbkH6pyVgZhDA
UOPDccMRZtWeN8wAhtXVM2qm2GJY4dwHTLRJSJ5g7M+ES6cAOjQ=
=SrxZ
-----END PGP SIGNATURE-----

--Sig_/iKTddM2jNVmrZmpYqnZ3ST4--
