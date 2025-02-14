Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7840A35AC7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6753110EC30;
	Fri, 14 Feb 2025 09:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="HjSqG/+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A8F10E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:29:40 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21f818a980cso27893615ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1739525380; x=1740130180; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WouWPceWJIfpsOVdhcRUS2Lf4QwDD30xMzMCVCUGUMo=;
 b=HjSqG/+MEfxAbSDYBVNAMKxVTpJjnWcqqLaQ5RfJznLsBEm+pkKzlC+PikIcwGyLyG
 ToWVbHl4Mi+7C+wWu/Xp/qdjJcaXnv9pGbxGG2VgETdqTR4HcMJMmVWANIi+y87DKKPx
 NG9g6OXnCasv0K54kmJbpwKV6txrmh0JXJ3Aw1SYulhaSuW+Smf2CjKDEx9AIX9GxJOq
 kXqbkr4ff9alq8Cel2IrCTDowM09wHtZImOM2kHx5eVqGBLmasClIgJCkRT/J/rj5a8t
 PrILZpwoLsY/hcdqLpflOeqRcF2JwPHPmSNdvKuxpNSG9h81N8JQDHB0pC97484v/Nyd
 3avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739525380; x=1740130180;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WouWPceWJIfpsOVdhcRUS2Lf4QwDD30xMzMCVCUGUMo=;
 b=rDNWLW7Z+u90uHVCbeBgapccNzN++JR+wsVATqdslOmmiGgWE4xTpHAI1qLcVq3Ub3
 +IB8s85k8eK2SjllNn8EOZjK98QbL0uQfCtv809BufimHPm8kxusG3+HKT1naii0VOTB
 yo7yEmGGWHVgye09HCHZBPFX9lSFw25Wxu3fjmQfYVp1gW166QI9lQ0g+KEd118nG5ng
 DiS5T48oh71888pgNz4lNBHQGhLcL+wTrDPxhYO42GDscjiYmIED75vdcRZs4E5qniKs
 Oc0QxKdMEShnNcItcllHBRsOpwPNRFzbixZeoJvew1lx5pGO3H8Nsf70g8K/lTbIwPgU
 mF5A==
X-Gm-Message-State: AOJu0YyLLk5j/gjtF0Vh+c1Y4pkIemhflaZGhvAfQJ9/36lQkYAx5uJz
 ypaWjBRcO0YCG3DbC+xDovrER6thMd7LnqS9beNpT4yvlb3SgPXCrRMzQtTyQiRY+LYYv3x/49X
 ReAA2rzkrC14gcaA70CpMjwiIyUtNWcGih9+FdQ==
X-Gm-Gg: ASbGncvRciBLm/i8aW+BlO5bLvDor3ySHCAQ1piWWf9kmJ/TDwq/JHV1xDbQmEX8eBq
 CxXsW1qRBgQzFDr0azbVyFOwas1ftqNW0Lui6q39sy3SfEc5OsPtYR+mLvIgg8usIpqWofFE=
X-Google-Smtp-Source: AGHT+IFDjPz+bF07xBwC2+apIyVrIe7XWFiAe+UIGvoVnEKUDHIruaw2RkgWypdP693CqdEYFySIwR/D178A3ZNcz8Y=
X-Received: by 2002:a17:902:c94c:b0:216:2bd7:1c2f with SMTP id
 d9443c01a7336-220bbad0fd6mr141195545ad.18.1739525380051; Fri, 14 Feb 2025
 01:29:40 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Fri, 14 Feb 2025 10:29:29 +0100
X-Gm-Features: AWEUYZlmqXZkhmBHNnMkx7qIcBwgPBhhJmZsfgrua1LO1SbSyaf3AR7xaMducko
Message-ID: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
Subject: drm: mipi_dbi_hw_reset() keeps display in reset
To: lanzano.alex@gmail.com
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Content-Type: multipart/alternative; boundary="0000000000005b38ed062e16d086"
X-Mailman-Approved-At: Fri, 14 Feb 2025 09:49:17 +0000
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

--0000000000005b38ed062e16d086
Content-Type: text/plain; charset="UTF-8"

Hello Alex,
there is a bug in mipi_dbi_hw_reset() function that implements the logic of
display reset contrary.
It keeps the reset line activated which keeps displays in reset state.

I reported the bug to
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63

Unfortunately, fixing the bug would mean current DTB-ABI breakage and
device-trees modification would be needed.
I mainly write this email to let you and other people know about it, so
hopefully it can be found easier.
What are your thoughts?

Regards,
Josef Lusticky

--0000000000005b38ed062e16d086
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Alex,</div><div>there is a bug in mipi_dbi_hw_r=
eset() function that implements the logic of display reset contrary.</div><=
div>It keeps the reset line activated which keeps displays in reset state.<=
/div><div><br></div><div>I reported the bug to <a href=3D"https://gitlab.fr=
eedesktop.org/drm/misc/kernel/-/issues/63">https://gitlab.freedesktop.org/d=
rm/misc/kernel/-/issues/63</a></div><div><br></div><div>Unfortunately, fixi=
ng the bug would mean current DTB-ABI breakage and device-trees modificatio=
n would be needed.<br></div><div>I mainly write this email to let you and o=
ther=C2=A0people know about it,=C2=A0so hopefully it can be found easier.</=
div><div>What are=C2=A0your thoughts?</div><div><br></div><div>Regards,</di=
v><div>Josef Lusticky</div></div>

--0000000000005b38ed062e16d086--
