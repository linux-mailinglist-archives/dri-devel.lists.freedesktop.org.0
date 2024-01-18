Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6D831D8C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 17:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F81110E896;
	Thu, 18 Jan 2024 16:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879A410E845
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 16:29:43 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-4b857733f9aso2563184e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705595322; x=1706200122; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=24YGzNFfb2dZMXk9KQ35lM0bRbJvfqRp3l9qkSkFvxg=;
 b=khxG5WVnCeB3AMo1UN2TSku9LmAjZJw7+IQYhLoRH3wFIAnaEOrLVgD643AZAcdROj
 hFbuN47kAmRy6FCkiJW4fk4xTXv0cb2S70I6yGDu8IW5+cx8adyJQEXSPbo03eamALVZ
 aGMHoyvS4czwWbvKl80DwV1IZI5XmlD2oAWOvTfCVm5ICPq1tZEn1ArJyJhwpsacmlYf
 OlB+FtLs15j1RypUMaiOK4SyrNgEVPjlgH5lmv3GTdgLW/44ar8Yq1H+bUFXNxLHzZ1F
 fQ3Xw9+uCc02K+aNh7Ja+PpF7p0UXt7MNE8SjhFX65xm4To+aLG2tG4A7CPERpMfc+Vw
 qjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705595322; x=1706200122;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=24YGzNFfb2dZMXk9KQ35lM0bRbJvfqRp3l9qkSkFvxg=;
 b=TWZjlOUlVEyDaZp2HqrJe2+efNP/3NuF9vQYrGFrmkHsclirV6HXm1yMAhpT10nKqj
 LwCwE+BRbR4X7NC524dGWntZEIqWpFdgnNXF0Aj9q+ts1MDAPoRkB/nBB2LW5DTc/GD7
 9XgUaxDf9jVyXeN8uUA97TOmPz3dKRCRWPTY/3n/LaLosZ2NCFZ+EDBh8iIJBhisZqRd
 JKZwXe5ipqAzfqo6OK+TH4DVQNRm2Hlfrdp8wUnPGfp7pYj5f2lpRozIssGh3f2O4Y4y
 sZgufFDtbC2sW/9Cw0twRu/HKL+nmuRJEJIbh/i/wVSVuyHO8HOBmHvPKAu8jHdSDBG8
 eupQ==
X-Gm-Message-State: AOJu0YxI0qrjDNpt/9k8rrmRfVPkrRyl8SsHrHJXPOq8dMqnHdIwYrZu
 1AUa8V5DqFLwoLOOocLHI4mETBupbEOe33+dxGsQwoxqT7gCi4eAQqhagnIe/itHDrJa7Os6//U
 ZUwJHNZQPrQq70rXiRo/SZmdKGPh2rZpRAkc=
X-Google-Smtp-Source: AGHT+IGZ3QqbTovWBAqtOHwCNma5fmWe2Bsm95cSgdGwAkoLOPf9G+j42pCaH3hH9M2Mi/rkSt1jAvPO0sBhy0Ojo5s=
X-Received: by 2002:a05:6122:3c54:b0:4b6:d44e:2897 with SMTP id
 fv20-20020a0561223c5400b004b6d44e2897mr772085vkb.33.1705595322385; Thu, 18
 Jan 2024 08:28:42 -0800 (PST)
MIME-Version: 1.0
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Thu, 18 Jan 2024 10:28:31 -0600
Message-ID: <CAJgxT3_4BxxwvZ1gLPYxY+RwR6+0+sAO_yWMKfv=OMStsd4zcw@mail.gmail.com>
Subject: Documentation showing requirements on correct userspace DRM master
 behavior?
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000524c7f060f3adbce"
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

--000000000000524c7f060f3adbce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m trying to find some sort of formal document showing the thou-sh=
alts and
though-shalt-nots of userspace DRM applications=E2=80=99 interaction with t=
he KMS
UAPI.

(For modern atomic commits, not the legacy modeset API.)

I=E2=80=99m interested in stuff like what minimum set of properties are req=
uired on
CRTCs or planes when activating or deactivating a connector. There=E2=80=99=
s very
good documentation at
https://www.kernel.org/doc/html/v4.14/gpu/drm-uapi.html showing the
expectations on drivers who implement KMS. But I didn=E2=80=99t find the eq=
uivalent
stuff that would show how to write a guaranteed-portable KMS application.

I find that it=E2=80=99s easy to write DRM masters that generally work on c=
anonical
drivers like the integrated Intel GPUs, but show odd behaviors with forked
vendor DRM drivers. It would be really nice to be able to point to a spec
and say either that userspace is doing things by the book (so the bug must
be in the driver) or that userspace was unintentionally relying on
undefined driver behavior.

In practice, there are lots of working examples in libdrm or a reference
compositor like Wayland. But those don=E2=80=99t typically have inline comm=
ents to
differentiate between required and elective behavior.

Does anybody know whether something like that exists?

-Matt

--000000000000524c7f060f3adbce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m trying to find some sort of formal document showing the thou-sh=
alts and though-shalt-nots of userspace DRM applications=E2=80=99 interacti=
on with the KMS UAPI.<div dir=3D"auto"><br></div><div dir=3D"auto">(For mod=
ern atomic commits, not the legacy modeset API.)</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I=E2=80=99m interested in stuff like what minimum =
set of properties are required on CRTCs or planes when activating or deacti=
vating a connector. There=E2=80=99s very good documentation at=C2=A0<div di=
r=3D"auto"><a href=3D"https://www.kernel.org/doc/html/v4.14/gpu/drm-uapi.ht=
ml">https://www.kernel.org/doc/html/v4.14/gpu/drm-uapi.html</a> showing the=
 expectations on drivers who implement KMS. But I didn=E2=80=99t find the e=
quivalent stuff that would show how to write a guaranteed-portable KMS appl=
ication.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I find that it=
=E2=80=99s easy to write DRM masters that generally work on canonical drive=
rs like the integrated Intel GPUs, but show odd behaviors with forked vendo=
r DRM drivers. It would be really nice to be able to point to a spec and sa=
y either that userspace is doing things by the book (so the bug must be in =
the driver) or that userspace was unintentionally relying on undefined driv=
er behavior.</div><div dir=3D"auto"><br></div><div dir=3D"auto">In practice=
, there are lots of working examples in libdrm or a reference compositor li=
ke Wayland. But those don=E2=80=99t typically have inline comments to diffe=
rentiate between required and elective behavior.=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Does anybody know whether something like tha=
t exists?</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Matt</div></d=
iv>

--000000000000524c7f060f3adbce--
