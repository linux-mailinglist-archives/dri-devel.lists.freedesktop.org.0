Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D5A906AB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6132E10E26C;
	Wed, 16 Apr 2025 14:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fUfM9VaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9F510E023;
 Wed, 16 Apr 2025 14:39:59 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5f4c30f8570so961225a12.2; 
 Wed, 16 Apr 2025 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744814398; x=1745419198; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zxt45jMJDQOtkcUTjcG+veyilm5TTDRtbDkcyqH4sy4=;
 b=fUfM9VaDOV/Ge5PHuoIYbfSmurNuMT/JzgFANOOLNTF8Od8hpq+xOKh/DtBG9cT5iz
 9otkokAHdaxIELi7xbMNIixqSg/hGELavBebABUmY7cWlmW9ClhOciuAfEfFYLZgjJZy
 VTmKQppOb5B0wjRZdQouQb/YINF0Yww5dLbBvRZ8PnDnMBZiwqVKhG3upNliZEPltMji
 mnKw9bwrQO3RiwvfluLXoSzZ8RHMayqUocL2y5dok3euyDEcmm47ki6GG8Fh0ovtucGm
 wwdakMd+/dlCsWJsSBMJ4Xp876jDggZ8pq+b5XKfmOY4OIoo4Lohu4D6zshnygmPDPf/
 v6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744814398; x=1745419198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zxt45jMJDQOtkcUTjcG+veyilm5TTDRtbDkcyqH4sy4=;
 b=riwk7TgV9HYMUu2wqay9dPVQxBXNep3Yf3jwlq5G4GxKL7pMlKCbm6r7AQ10AnRleA
 OAKXGJ+sTQnvkaOniZBcq3anELXyN+Am1e/ChE/U9MrMQdFPQUzxZM3HTvhhI9/i/8lW
 17qy3KGbvubeUEagoZMGolw+5cA5IyaBzLvAwlIjQDNVe6IBH71otSKaM722Pfk8b+Dw
 t6E564rZqe6pXMqmlYbzVli19P5tih0Gd3r0GgXRtmTps1lSOKg/XK7G1yj+WAzNPNDg
 H3WfqzA6PGtH+7UEdhLHxTn94kqY/1c+gc9XjOB3qT+ggU1Au80lBc4wyeJMc5YLNrQw
 Wxuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQRQN1STTS3tpeqdjLT/LNFMtw/E8hPpR/X9pKY1JQkxtCIyt5R3p4xTOikt5QIK8kIIJyt0XRpBzq+LVS3A==@lists.freedesktop.org,
 AJvYcCWn73P3dTnH9f/W7HZOx3CR1THZSboQ8d/aiXMbVHI5UGYmEetsYwXj1tjhLqx/yuAolYeX1FtdKZIf@lists.freedesktop.org,
 AJvYcCXJM8V2FRlPxCQWvMhCaDDKVCdJaP82Jojecv6SiZhWMdh8Kd7YtBggWt/hztEWDz9o8VIs5cLr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQXGfMoAg+uDtNdOkOB8iIAoVyjDr+y+k7otNDmaWx4hhF5K+8
 RSQo0TOQSTAkM03CbNVrGZacVoq+SeeaEaouyDd44yeYHiFC4nCeJLYf/SG3ShMFgU/ls19EcSn
 T9Jgc2UA7qjC3kSnvsxwnMmKFdBZ+6Gyk
X-Gm-Gg: ASbGnctQqaDY2SOUnbf2B7FXd8VG/rzpWVDGsIw2dMeGSls7R7tk01w3HW+zkDE7FKR
 TJm5esNnQzls/ub0xA/dH2vI6NvoBeQzbPXacZ9VWiqycqCZfMI3K3mTZOK0wZJrzuONS90wUXV
 R+hf1aqjn89qKsQZ2/uC5lH9S4ocLYRjKRV32WEhLvVd8xdqqA41WyFHUrpkPDKUIqgw==
X-Google-Smtp-Source: AGHT+IFDPBSw/zuvs+PLGIujOSSpcTk3PY7p/OkgGifxXJj8q/XW4o/NjSg5pPkEch7v+1OkB/w9fLxCIpWVl2X+UtE=
X-Received: by 2002:a17:907:1c92:b0:ac8:1cf7:7aa7 with SMTP id
 a640c23a62f3a-acb428f0f93mr196475366b.15.1744814397939; Wed, 16 Apr 2025
 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
 <87fd7840-b021-4d3a-9d0b-2724e941c5dc@amd.com>
 <20250410105343.606bb75c@eldfell>
 <a557d929-7bf9-4a52-96fb-ed7a696744c2@amd.com>
In-Reply-To: <a557d929-7bf9-4a52-96fb-ed7a696744c2@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 16 Apr 2025 16:39:46 +0200
X-Gm-Features: ATxdqUGZDWjwucAkJ_n44KzFQ5RZID-3e8S1qfmhJkag_OWKRiraEMngrVjE42g
Message-ID: <CAFZQkGy8vEwfe-6sR1Fkant3=Yyn1tnPqTZpd_3aPAqhHDTPTQ@mail.gmail.com>
Subject: Re: Pipeline vs. no pipeline (Re: [PATCH V8 06/43] drm/colorop: Add
 1D Curve subtype)
To: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Daniel Stone <daniel@fooishbar.org>, 
 Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Content-Type: text/plain; charset="UTF-8"
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

> > The 3x4 CTM colorop is not yet explicit on whether it clamps its inputs
> > or outputs. Should all colorops be explicit about it?
> >
>
> Do we expect all HW/drivers to be able to support the same behavior?
> Is this critical to using the colorop?
It doesn't need to be the same on all hardware, but it is critical for
userspace to know at runtime. If a color op clips to [0; 1], then
using it with scRGB would be a bad idea for example.

> Harry
