Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E29A556D8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64B910EA91;
	Thu,  6 Mar 2025 19:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ECfFNCWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8EA10EA87
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 19:36:32 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e634c42a296so810508276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 11:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741289791; x=1741894591;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
 :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=awpkyp5i4scsjW7Ccl8yyq7MRbI82hp3pBv+k3lVOT0=;
 b=ECfFNCWoTn1xYuuuBAGE5VL3Y0FDJ/3SoNrx6tgW458uY3vyo9IWevCxTW3ypKbmKJ
 rwdkvxOHloMDF4rJfoZ0dK1ggCv/yOlnwdAexBRNyywNL9FMybCv0er7dt7KERgYjUKT
 AVmLS4kqdMnw4+2+yM4WH/AKXj73pofuM3RNQlk6yKPHt+m8LRrs7loBg+5EGHy5iO91
 9Ul1b+J0UKOfyLWaO7ac2C9TTdu9ICjH/dciz/IdXINcuYxA46zm23ogkZAuTvgt3+ZT
 Wb/DbFX2kvO3quV2WDgeyMtxdSasDuWmPH/M4Y5ZwVWvvvd3PbC8CTOQbuMLSDYkj9Ro
 dLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741289791; x=1741894591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
 :from:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awpkyp5i4scsjW7Ccl8yyq7MRbI82hp3pBv+k3lVOT0=;
 b=i8ns6mEgDMWUV7WXYwuwvTA+4Epa6pPDnvFiNVShvhbdrdR0wT20q5ndxUBidwhZzh
 CEYMkGMxLsjn1rmGYY+p2IG8LlnQSYqCIj+VALzbS0qyzGAXPQqn1sYk+csG0F0BSx3/
 La4A1AE7dC8Omprl7QjgxiKHGG0Rq1Oe8MnzVxJh0WYEKqVqpLRE2rxzPMzjA3eezHTH
 eUoLm5G/Mv8QydKkn8m412Kmq13PAGzbwtgMTT7WIyRjwH2M5izp81CUkxbh5Zjexuxm
 QTnoc/l2dDQkWJhqanF+cqKv3CkukiKxysn1OthgeVvK+tH6/VuzWMysyNUQ5nzCSMlf
 +o0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcTpnQA3UdrhxeL9dAFy7cc5p7kgXOLupHaOALo4XOSx6+ki3yYBCuoeiC2EEL/9iuzLcSDl/+HqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+uRTDyPWWrgULTyACrhdOLaa+rCZa/A/j7piCYutdhDTa+Cah
 Dml8WjkTmcdZPblx4FfaYdE0BIR/oJ1hH6YT64PtQM2YSaONABlAPnWUqtwe+7EeSIideJi+qxN
 dc1W/HdDoLSHRm932w5750cqBauDsOy2N697apQ==
X-Gm-Gg: ASbGncvbpYeJ9K1ha4aC4hw9ZtRW98YfUR5VnHoN/aD3cKhVVUYAJNvEtGnBm4xd0FS
 qp/WgIonYJIlEydp4KzLni3Druh/OeyxsQRBJFKTQZJlaWeJkPLxISI0kiWkdIp4V6eMOIZSGf0
 WGZ45mJunf92IWDZHiK+wiv46FuprSvn6XaiTLU5GI/3duFdEBC3+u3QNvLLQ=
X-Google-Smtp-Source: AGHT+IEIb+n8skvF5y/uF1a2RpqbYQe3zBLYOQQTEYWGlOehd+S3aGOeQR20TO32khG6Fxy+Yszj7b0COSvaIsCBuFY=
X-Received: by 2002:a05:6902:2884:b0:e5d:e23d:5603 with SMTP id
 3f1490d57ef6-e635c1c40b8mr666632276.38.1741289791431; Thu, 06 Mar 2025
 11:36:31 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Mar 2025 20:36:30 +0100
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Mar 2025 20:36:30 +0100
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Thu, 6 Mar 2025 20:36:30 +0100
X-Gm-Features: AQ5f1JpiU3OyfauzicSBZFB88WVvmtOIwnKeV8k0glt6KBMtvcLn54QsMlbPCHc
Message-ID: <CACo-S-28PRtUF-SniUuJz2VWD3JJ64yKGAt-GE7RJ7cN96Jn9w@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIHVwc3RyZWFtLW1haW5saW5lL21hc3RlcjogKGJ1aWxkKSBpbml0aQ==?=
 =?UTF-8?B?YWxpemVyLXN0cmluZyBmb3IgYXJyYXkgb2Yg4oCYY2hhcuKAmSBpcyB0b28gbG9uZyBbLVdlcnJvcj11?=
 =?UTF-8?B?bnRlcm0uLi4=?=
To: kernelci-results@groups.io
Cc: gus@collabora.com, dri-devel@lists.freedesktop.org, 
 tales.aparecida@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: kernelci@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

New build issue found on upstream-mainline/master:

---
 initializer-string for array of =E2=80=98char=E2=80=99 is too long
[-Werror=3Dunterminated-string-initialization] in
drivers/gpu/drm/i915/gvt/opregion.o
(drivers/gpu/drm/i915/gvt/opregion.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/issue/redhat:c82bb4d57b2c0b4362cb574123=
80836b17c0bad7
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
- commit HEAD:  848e076317446f9c663771ddec142d7c2eb4cb43


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
00:19:02 drivers/gpu/drm/i915/gvt/opregion.c:35:28: error:
initializer-string for array of =E2=80=98char=E2=80=99 is too long
[-Werror=3Dunterminated-string-initialization]
00:19:02    35 | #define OPREGION_SIGNATURE "IntelGraphicsMem"
00:19:02       |                            ^~~~~~~~~~~~~~~~~~
00:19:02 drivers/gpu/drm/i915/gvt/opregion.c:225:45: note: in
expansion of macro =E2=80=98OPREGION_SIGNATURE=E2=80=99
00:19:02   225 |         const char opregion_signature[16] =3D OPREGION_SIG=
NATURE;
00:19:02       |                                             ^~~~~~~~~~~~~~=
~~~~
00:19:02   CC [M]  drivers/net/ethernet/mellanox/mlx5/core/en/reporter_tx.o
00:19:03   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.o
00:19:03 cc1: all warnings being treated as errors
00:19:03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## olddefconfig on (x86_64):
- compiler: gcc (GCC) 15.0.1 20250228 (Red Hat 15.0.1-0)
- dashboard: https://d.kernelci.org/build/redhat:1702059263-x86_64-kernel

## olddefconfig + kselftest-merge on (x86_64):
- compiler: gcc (GCC) 15.0.1 20250228 (Red Hat 15.0.1-0)
- dashboard: https://d.kernelci.org/build/redhat:1701509117-x86_64-kernel-d=
ebug


#kernelci issue redhat:c82bb4d57b2c0b4362cb57412380836b17c0bad7

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
