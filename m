Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690BA39C70
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 13:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4248710E6A3;
	Tue, 18 Feb 2025 12:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JeN8iacY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522B010E6A3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 12:49:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso59588505e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739882941; x=1740487741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHMEUUgzJ5Lepuax0T+IdRjsT3yoJrxVgzW4e4ftDcQ=;
 b=JeN8iacY9BHcey4cCA3Rs2qfaAamHyuBjEuwlGLCGmf2dnLewAVJEUpQlw4lfUIBCf
 vJ61Of5/0Eohiy0+O9vCq9vYlmbPVHj/zLf7uVmsMih9ThxCTeAPuL5L41l1y1GdsxU7
 9EiZQ7qryrFk3tNFDK7z2DCdkgsI57aYE/dl9PQY2KvRz0+m8wBZHGQjagpcCH9nrvCK
 QFEnjJzVMdqd7h6PKEoRur3ueoWMezrOcxdqYLhHWJARwEwWqnQRphGIc8ZlUrtJ+N97
 4uUKFaluErORNfDaIEkU0KVnRR8i611KzWiUmOzvt86B/3T7gJGpPCZHUvkZ4vbDZnsO
 52bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739882941; x=1740487741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHMEUUgzJ5Lepuax0T+IdRjsT3yoJrxVgzW4e4ftDcQ=;
 b=TCOXCPTDUqF5l4y+PFVAGbf4S7P+laxy87ZA5MNGremsU8sVWAnbeURyGypQT4j6ou
 HOXJCV1yf0f3EKMMOGIIB2KeLDrwn/nRcEMCv29vck8vY3CagNt7rUaIufJKrZATamwL
 r/hY/Xlx4HusDo8pj9K8VUS15/kqNjkYnb2MfoBWD7OuYYHFktQFSeEneyWMaxukR83o
 +8H2CVCtx9L0kQ1QFFEhNVHhIVXGfi0IIpT5dS84QMiXHeuaJttijSUHfFBXBMPP8rK8
 bdkhqBG7+K4lCuf7aGH30FsxP4af+6f9EPxt7acwMNNlzmFxpatz8rUBJ7pPlDumBCW5
 8xMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9XElzW2t8KU5P/4lmvidl7Sa/4P7B+AKEKno7zdF59mMWD519SeW5Qo1XLYNLLqOIaAOs/S3SdG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWDsvK1uRJkA7ZLs9eJow71IeH6zxPGXBZA0RkTWaiKz+UquqG
 DwuEcjME2UYhaCzNfv5JwJzFVxPfh8D8V7SbIXOXvr7VuTD8nrHK9C4YDTGtUv8F49Z3aenZio8
 2o03HS/TYYkIbIAThQ3SqiZ3ykxk=
X-Gm-Gg: ASbGnct91xU/HZ67MUeCuu1xiiLf0IWLQ4cEr9XhrAW65RzJyMtpt8hTh3rd5PYilt1
 hTbM6OE7aSLdncwxAPWWXXW5zMsZHZ1LEER4IsvcfWO5YT1GYkiRfU9+fjsVSThpfze1n6+JUqQ
 ==
X-Google-Smtp-Source: AGHT+IG+4guV9zL2bAZNHMObNNITOjYzmm8gBHf04+Fx5knp80glZYkRGDTbsirq+bKDuplePjSR8kzavUyBoBLNCGo=
X-Received: by 2002:adf:fa08:0:b0:38f:2a99:b377 with SMTP id
 ffacd0b85a97d-38f33f57459mr12091977f8f.53.1739882940549; Tue, 18 Feb 2025
 04:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20250217140910.108175-1-clamor95@gmail.com>
 <c19bd9b3-86c4-4f1a-beb9-b6aed32b3ef5@suse.de>
In-Reply-To: <c19bd9b3-86c4-4f1a-beb9-b6aed32b3ef5@suse.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 18 Feb 2025 14:48:48 +0200
X-Gm-Features: AWEUYZknhrRerz9466maOIJ-JIcnOjmCvbeJ_Q4ULJO_5cv5VSDkdN2CrbigW9c
Message-ID: <CAPVz0n0WG1Q51SONb4fmkzi4q7Q0sZ_aKSLrLnGboNNya6nO+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 14:36 Thom=
as Zimmermann <tzimmermann@suse.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> (cc'ing Javier)
>
> Hi
>
> Am 17.02.25 um 15:09 schrieb Svyatoslav Ryhel:
> > Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
> > and LG Optimus Vu P895
>
> There's a driver for Solomon 13xx displays in drm/solomon. Did you check
> that this new driver isn't just an extension of the existing code?
>

Definitely no, ssd2825 is a RGB to DSI bridge in a pure form. While
13xx as you have said are display controllers family.

> Best regards
> Thomas
>
> >
> > ---
> > Changes on switching from v1 to v2:
> > - added description for clock
> > - removed clock-names
> > - added boundries for hs-zero-delay-ns and hs-prep-delay-ns
> > - added mutex lock for host transfers
> > - converted to atomic ops
> > - get drm_display_mode mode with atomic helpers
> > - parameterized INTERFACE_CTRL_REG_6 configuration
> > - added video mode validation and fixup
> > - removed clock name
> > - switched to devm_regulator_bulk_get_const
> > - added default timings
> > ---
> >
> > Svyatoslav Ryhel (2):
> >    dt-bindings: display: bridge: Document Solomon SSD2825
> >    drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
> >
> >   .../display/bridge/solomon,ssd2825.yaml       | 141 +++
> >   drivers/gpu/drm/bridge/Kconfig                |  14 +
> >   drivers/gpu/drm/bridge/Makefile               |   1 +
> >   drivers/gpu/drm/bridge/ssd2825.c              | 824 +++++++++++++++++=
+
> >   4 files changed, 980 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/display/bridge/s=
olomon,ssd2825.yaml
> >   create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
