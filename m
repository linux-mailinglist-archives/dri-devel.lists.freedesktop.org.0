Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D9A556D5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046F810EA7F;
	Thu,  6 Mar 2025 19:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Uhh8I9TN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AA110EA7F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 19:35:23 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so916936276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 11:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741289722; x=1741894522;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
 :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CvPMTrx2LK8ttn52lw1f4VuLYVYsKdz+5pXWmHGm5ac=;
 b=Uhh8I9TNM2BFT93H/kagTljD2QcgqApsln4DsF7PYXY8Ym85vZFKs/dpXd7k9eVAJG
 8MX8NPq7Nz6pCbf6bZaln4P62w5E5VLXZfEM8ser6LIndwBOBztQmCUWDTn9FJhTAcII
 KcVriG9DlhXc/oS3POJtNiC/mzrJOBTS5Ein8KR+92R1BEsEe0YJ1ECn0sNQAYVIFhLH
 4iNm+Igm5ggOqTCBeNRS9M8/ujOjaKBhiscxuqIDiInm+wFS+hzN6b9x7rasMG9ME+rJ
 MfCpOwBgM9Mh+y9iv3KJjyWyLysl78LYtn5L7D8RimyvFmcXzy4YqZSVL7W24u9DmT9L
 iOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741289722; x=1741894522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
 :from:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvPMTrx2LK8ttn52lw1f4VuLYVYsKdz+5pXWmHGm5ac=;
 b=uFIx6BSQ+Wyzm+lZ6SnFUbD0iptMXUApIPhhKfj1APQ4ZBMmHv1DnX2D7ho7vmieBR
 GPehV5wlaROF3HNqKAFQzIisGADQc579EqMvDIHuVLR7jxp2s433VBWJY2GI3x9HmLJq
 SAUgLH0/opAajwWJ0B67uXdPgAPyAG3SNUD86hCu4DOcz3NdkmT85n1JGaS/SG6no9lf
 kuUt8icVh3eWWE0nhpiYL9gqTrMt1vJJ1sTwY4+XKtPwigxrka1RX0J9cAmwcr4zwrm4
 jOcZ0HvHkabQp50ILjI7dV/dzUE3JzCVdU9BinuQ9Rp4VhcTIU6FWJxhMBZQ/F4skKxs
 NpYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEOhnkZj8R+o2ZFoLQojbbFri7Ey1R/5ela0sjokeM2YlNzv0+NWjjC8d0Y6nTcKlJQ3lwjAZ+zzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+wZSE+D0OJVnte5gS2N9EXep/Xy6BC5S2d/3mYXbyYbPHbPrf
 YB9kHq/AYI53FjNf3cTLu89bSyOTtqamQch1DAB2mlWH+vCIg4XjLN8yhqYoxEWrF9XTFU5071l
 i+3Kba8k7XVC2IlMTfgDFnkmyH5YaES37SsnO/DJwpowRxOUNiVY=
X-Gm-Gg: ASbGnctGs2DOphBGo65lrwhA81PLx59bd1k5dSdI6iqZXLD7oIsmXztaQoatZA72dNJ
 Eb5nOmtcvElmj169vwRyccVkgoC2cPVRDzr3gkizBIfHjeOKgh5ysee2qLgjP6TmYhkfpPOROzR
 5+FqZG8xvpSg63MBQPXQqScb/c1sAG7uYWfByJRmMFh5nCtFKHZHvRxlx+5Ds=
X-Google-Smtp-Source: AGHT+IFu5qzlSfjRyYEZRsFK8Ljwu+Xti1lksICN6Iz6HEI6gOkU2N/N44HMd7OnuaCh7zX7MxejwovVffPNiI2M2Dw=
X-Received: by 2002:a05:6902:98e:b0:e5d:d8ea:8c96 with SMTP id
 3f1490d57ef6-e635c18bcc6mr881445276.29.1741289720501; Thu, 06 Mar 2025
 11:35:20 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Mar 2025 19:35:18 +0000
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Mar 2025 19:35:18 +0000
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Thu, 6 Mar 2025 19:35:18 +0000
X-Gm-Features: AQ5f1JpR-IMILuWowlv8FzVS53GLeSDO5M8sexr3-UZ2xOgqG9jjR2HbNqHCe0U
Message-ID: <CACo-S-2zeP=ArF5idL4f--vTPEAJzQ0kmisXBh3tT_Vs3Xv-JQ@mail.gmail.com>
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
drivers/gpu/drm/panthor/panthor_fw.o
(drivers/gpu/drm/panthor/panthor_fw.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/issue/redhat:89b66683928343b36d40dad548=
87077a02269f3a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
- commit HEAD:  848e076317446f9c663771ddec142d7c2eb4cb43


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
00:16:36 drivers/gpu/drm/panthor/panthor_fw.c:641:53: error:
initializer-string for array of =E2=80=98char=E2=80=99 is too long
[-Werror=3Dunterminated-string-initialization]
00:16:36   641 |         const char git_sha_header[sizeof(header)] =3D
"git_sha: ";
00:16:36       |                                                     ^~~~~~=
~~~~~
00:16:36   CC [M]  drivers/net/ethernet/mellanox/mlxsw/spectrum_mr.o
00:16:37   CC [M]  drivers/media/dvb-frontends/tda1004x.o
00:16:37   CC [M]  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.o
00:16:37   CC [M]  drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.o
00:16:37   CC [M]  drivers/firmware/arm_scmi/transports/optee.o
00:16:37   CC [M]  drivers/gpu/drm/msm/adreno/a6xx_preempt.o
00:16:37   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.o
00:16:37 cc1: all warnings being treated as errors
00:16:37
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## olddefconfig on (aarch64):
- compiler: gcc (GCC) 15.0.1 20250228 (Red Hat 15.0.1-0)
- dashboard: https://d.kernelci.org/build/redhat:1702059263-aarch64-kernel


#kernelci issue redhat:89b66683928343b36d40dad54887077a02269f3a

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
