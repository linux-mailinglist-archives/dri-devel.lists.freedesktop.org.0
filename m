Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1468A43E92
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 13:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DD48952F;
	Tue, 25 Feb 2025 12:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J8BzYnB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DCC8952F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 12:02:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38f406e9f80so5056676f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740484936; x=1741089736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9CPivFaP7s8yYZJY+7sb+ThsoYL7A75p/3P2VihSgE=;
 b=J8BzYnB6n7RY4i0rjMPrfnv6gR/9fdAWkCsQNyHflLUI+fburxkmY3F6wbO3IeiaQ4
 YepwTiHJiFflxgBEkrtNSMw3VLVQ+I6hOvPHaeAeT+EYBuTWE+syl5ihisaD8w57zy6x
 xOeTODXJoAf5MB7ycL6ft3gcKsWAtEEYXb0xvq1RTjpkAZg0G39gA7hUZpsMQ+NtjRdy
 GYLGc+Dg22pYueV8t4nwEyZ/qd0DYIgL/HNVXBXnd2RESH01T15VKcqQHnUCGkm2m9JC
 4x7UkuToDlMCJG2GoM+BmpYWJrjj6ARULAVbVIRQXKVsiDNBN7BvNHmQfVD8ySHzoUNL
 +KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740484936; x=1741089736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9CPivFaP7s8yYZJY+7sb+ThsoYL7A75p/3P2VihSgE=;
 b=h6776V5CFFIvHcvEQjO3gLf87hOlms8wTuvmfZI/+1aCgwHzFY3JLFfmsFS/mxUVDZ
 RFO9IO3fLd2gLO8h1Rvr2/Jd5mrNac6fPTDb3gGWrMJJNx1PK2k+pW/Wev6cwwgQh041
 iX+1LecNiWt1z8YqaIAe2dQqSPd1jrg4v9S29hoViFNvvWpxlye+rSpjEAnsuxbC2HdA
 msga0xaLd14R0CNJcl15/S9Frm/XhFCbOQcstE8IQaDCQUR3SxvjPpnkx50aNmhY0JGY
 jB62cHSMp//Sd+aB/VbZ/Kv4llkBeIlRcKiMCoFvYvSKkDx5OjunwT7DkSbjbARTcptg
 aMhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULFrV5MKRm4z76tBrFsryWs/8extli99Sz07GbjKteHQjLWNDw3DvU/DMhneqaaiDG/FQj6eHNdfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxkz/AI9i6F5zXce+ADrebz5A4ZytefoZwDyi6fl0IiyPC39iMq
 WCj2y1OatzyN+ZJtGjTljpvvHWZCdphWLRbPs6D/pEcD27m0eyb3LPT/yp+cvKlfNOqSqIwkpFj
 tPqzdSEQjEDOlCK7I5pI0XKOLC4E=
X-Gm-Gg: ASbGncsr19jo1UW1bqxBYQ672BrrYjtX0YIogEarEeiDtM52P8hvPpGsmMyeG4G0XGx
 97jjdD9/gm4bVD2+o1CcDwHIbQ4f520dAecH8dJYkJXPG16+G+LYKi//PgsRnIvKQb4y5b5+c6d
 VD3P6j9cG1
X-Google-Smtp-Source: AGHT+IHovLsSDlGsjXOzdOi3XJgV2ZoGBF7JDLcQsA7MCDsWNsbn+uTtfMOLk9ExL8/K8w4JtH77uyCbj5LQKa5LKkg=
X-Received: by 2002:a05:6000:1a8a:b0:38d:d5af:29af with SMTP id
 ffacd0b85a97d-38f6f0d1ddfmr11857129f8f.49.1740484936293; Tue, 25 Feb 2025
 04:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20250225083344.13195-1-clamor95@gmail.com>
 <20250225083344.13195-4-clamor95@gmail.com>
 <lkfxsq3daspjxdw43dofch3nulprpmg4soxsgflsypu3kem4ok@utt6rfdtbg7j>
In-Reply-To: <lkfxsq3daspjxdw43dofch3nulprpmg4soxsgflsypu3kem4ok@utt6rfdtbg7j>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 25 Feb 2025 14:02:04 +0200
X-Gm-Features: AQ5f1Jom4uPLrGTDkdpnTwd36vkgtR0yhjPU5X9ii3Faj6MxYp_0WM0zWEbVF9c
Message-ID: <CAPVz0n3Jc5GE5szjPGJXJNjKVfynvqmzSuZLba5XbLPtcycjwQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
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

=D0=B2=D1=82, 25 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 13:57 Dmit=
ry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 25, 2025 at 10:33:44AM +0200, Svyatoslav Ryhel wrote:
> > From: Maxim Schwalm <maxim.schwalm@gmail.com>
> >
> > A simple HDMI bridge used in ASUS Transformer AiO P1801-T.
> >
> > Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Robert Foss <rfoss@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/b=
ridge/simple-bridge.c
> > index ab0b0e36e97a..c0f1f7baaa37 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -277,6 +277,11 @@ static const struct of_device_id simple_bridge_mat=
ch[] =3D {
> >                       .timings =3D &ti_ths8134_bridge_timings,
> >                       .connector_type =3D DRM_MODE_CONNECTOR_VGA,
> >               },
> > +     }, {
> > +             .compatible =3D "mstar,tsumu88adt3-lf-1",
> > +             .data =3D &(const struct simple_bridge_info) {
> > +                     .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> > +             },
>
> This entry should also come between adi,adv7123 and ti,opa362.
>

Original list in the driver is not sorted alphabetically.

> >       },
> >       {},
> >  };
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
