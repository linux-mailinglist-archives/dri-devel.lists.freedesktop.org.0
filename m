Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B0CF746D
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7710E4A7;
	Tue,  6 Jan 2026 08:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ci8d4Zwa";
	dkim-atps=neutral
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAB010E254
 for <dri-devel@freedesktop.org>; Tue,  6 Jan 2026 04:54:39 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-37a34702a20so4704811fa.3
 for <dri-devel@freedesktop.org>; Mon, 05 Jan 2026 20:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767675278; x=1768280078; darn=freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2spCPAekJlVxCKbkhnAmq7cV9YZXpTZhlqSOBzim5EQ=;
 b=ci8d4Zwaxv35TGGAcNdVkmtLSjICQE1rxJNf1Iyaa7NCNeOUtlChHQ7Fwv9Km3kHoF
 KyOg4B3o1LEf0B1y0dT3BG0muPd4x+5+uo3py3/5PONmz7rf2hO+1i3/JTV7DLs5aYud
 VYw3KGWwfb7Qzbd6QHBhg0SG9AANv8Uk0K8ZGvNeriIW7x/9mdLkpaHWVqnJJVwsq/Z8
 C4obJBMAFcXP295oXX2VGb0jQcLiGtNFwitxGFtuUwW9vFdLbmyqXJoJ+F91b3Xx2wQ4
 vYwkVQ6IZBj9lS0Pcj6AnjJcBXDAgv631WzLpxwz9qiaSEyayPwOk1yyKFoWTTV49BLL
 r+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767675278; x=1768280078;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2spCPAekJlVxCKbkhnAmq7cV9YZXpTZhlqSOBzim5EQ=;
 b=TKssN6NvNXomx7TpyaEVYUxy2vu+8m4S0Q162KmfgEN5RJnhSOA7lEvbUp9WSiJCOZ
 BmGRTiK+Mje6uz1IDVNEFvg3cE98UpjgZlOTOo0LXLFgeRO5BoRABYwI/eslQJjFldPj
 n4BJFu65JkYVCTey8AlhICR4riTssz7F5zCDMxDXF+BJzztAhAz9naJH6q0aoGcRkuVw
 A587Xn4npIRYr8Mh2T9Y/CNm1Edtc9WUrsTjT0hVclCAEXV080dcOmr6EzunCga5UscM
 vj7s84M6+vF4U9GcLV0QZLsRCqRY9YVXQpT04C5daXdmEL3uttGylYvxBF0Uw3nwD9Lc
 vJxg==
X-Gm-Message-State: AOJu0YxnmEtcXznjXEfUpSrj82nXFocIIfSLRQIKEV3aZTR5eZLXoJ3m
 T2Z2ET7Wy2CmOvu3iSEDNGY0LfwPz2yQuf2kI6CK8Osr23iQ7LCVTtWKDipWtcbHV1RXhnSvdUP
 L+r64qMNp3m0Xf1g2hqlGUACYufkU+PjzHoXl
X-Gm-Gg: AY/fxX44QGiGJH41f27W5KW2+visQ8HcQaJ1all8kneg/yNXDkJy/KuHvDnLKMu5Hhh
 B8ykS5gjECV1A1Bb7asv4jYN+2ohmt15aqAq25o8NG9rlFVOqLfc841InzNqHGx2enAzREXCFgV
 RS7eHEfLR6nn7Isv+torj62QbOoKtEVeNyz5JzXwcG/hjNT2Vi/3hY4SpvDZ40liRXLSmJgukpv
 g/ULJn/g+IRgMrkCP5Mpf5mehg8h6jLROfZyrxLbGeZ1NduPb+u9ujK0YlQ+Zy0NEIlp6Usqzjg
 TenKP1HrTE4=
X-Google-Smtp-Source: AGHT+IEpBx8nSYJoup+2PC9KmGsH81K0oRdJ7sJ2zJFfFM9DS8m606yODMal/IAL/AIBtCd1c5/F0wpq24NCdNJfwLQ=
X-Received: by 2002:a2e:be89:0:b0:37a:2b71:482e with SMTP id
 38308e7fff4ca-382eaac381cmr3953581fa.24.1767675277470; Mon, 05 Jan 2026
 20:54:37 -0800 (PST)
MIME-Version: 1.0
From: Christopher Chang <chiggiechang@gmail.com>
Date: Mon, 5 Jan 2026 20:54:25 -0800
X-Gm-Features: AQt7F2r3-QEUTWbOjmU3XEvNhgGjBlN8AcHo5vMxmdYD_i80uBBuVIpQKRLmH2I
Message-ID: <CAANA5JxV+5XVoiqoEdXvr7=aO4as64KKMVDY93dYb2s2M_zkvg@mail.gmail.com>
Subject: Man Page For drmModeGetCrtc(3)?
To: dri-devel@freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Jan 2026 08:21:36 +0000
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

Hello,

Is there a man page for drmModeSetCrtc(3) and similar pages?

The man page for drmModeGetResources(3) seems to suggest that there is:
https://gitlab.freedesktop.org/mesa/libdrm/-/blob/369990d9660a387f618d0eedc341eb285016243b/man/drmModeGetResources.3.rst

However, there doesn't seem to be a drmModeGetCrtc.3.rst file in the
libdrm source code. And from what I can tell, the earliest commit to add
man pages doesn't have anything for drmModeSetCrtc:
https://gitlab.freedesktop.org/mesa/libdrm/-/commit/2426a6a7112ae62755408a371831eddbe2d89d99

The headers for these sorts of functions are relatively
self-explanatory, so no worries if there isn't one. I was just curious.

Thank you,
Christopher Chang
