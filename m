Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCE89CA6B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B1E11283A;
	Mon,  8 Apr 2024 17:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sRp+oX9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2B51128CD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:08:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4154d38ce9dso5215e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 10:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712596134; x=1713200934;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/c2u8nyyYFgcLheudTCToLSGAWkJYgjVrD833IIsCI=;
 b=sRp+oX9MqoyQaoDGiuQsqdXevO5w4WBapmHQy+BSpZJT9Dx2UOPEdWirS9slKFn2Go
 T886b0Q2tRRg/52+FKTXdOTcyXfEFQMNtZrRDF4KTCGirzpZ6AbaCKJ+5maXm68C/6lt
 wpdo1MOLl/jrGW4oYytT3+KXbsA1ysOz4mHk+MYvnpQu6+M5AqQrZlhYMSZ/+NVeYLv+
 xoJSSrtJx0oJY5T9ZpkuwDZyh7EUnqsg/c1PcnLgNwfrn4zbOAUEpRzO0PmwL4+3e55q
 6KO2gao/HW4JIu3vY7cbLjY+4uTja3oEc8AlWBXmShd4dEl7jaol8fh+8WtLhZwZW9Bk
 vZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712596134; x=1713200934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/c2u8nyyYFgcLheudTCToLSGAWkJYgjVrD833IIsCI=;
 b=HsohpP/JzmHsuQPtmThZ8gnX5r/CBSHb4eBp+hGeIPHS/KdQ2FLU2QnhD4mabOyHGo
 0WgQCuQCvE/cwUQYSSEn97ibIUg/MA3R9qa3zZwQ77maB7+urtihl+3BvIo101iWOwtI
 cg6pqRLRga8tm9sHNLfmShRd/mxRjhwhyS+p+PJwbqVvN/IIaTUAtyJMWvIrDrf5JvV9
 KELSULxepc/psU6YAKBbc2t8z/iGvOgpswmIsw6Tc15h2u+5grrjwb/gDVu4tMPfiTph
 oywFxzgzTrUeGT5kvJnxX/qkJInTzkPO8r07I1pxKfzRlvCNWWAg6ncCcYR2G4RxHJ6v
 oOVA==
X-Gm-Message-State: AOJu0YzEH/eEF2ENMCYal7RavFZBp89ifN9C4GMox7qN+n0qs8hTMaIE
 0sYAcMBo37mfWWhScEfGJUvjzHYISh+gXxOsybhF3IKTDvsWSkoAAXGs8HLevqk1wROwuw+bs3+
 V7erUC2WUiN1mrpn8/f0YR6NX35UsH6+cJ9U=
X-Google-Smtp-Source: AGHT+IF8lo66jIXNwEsCzmBaaBtiasEuOpFJYJ5z6uTOyKm4Q40X2+UI/fw6XZ1TtqwLMy+J68/VVvwh8gzdYI966DY=
X-Received: by 2002:a05:600c:35c8:b0:414:1400:a776 with SMTP id
 r8-20020a05600c35c800b004141400a776mr380112wmq.5.1712596134408; Mon, 08 Apr
 2024 10:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-9-ville.syrjala@linux.intel.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 8 Apr 2024 10:08:42 -0700
Message-ID: <CANDhNCrgwXXP2SFgTtsS9OxZS=QATJujveo1RKLs-Wnu+mMkzQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] drm/hisilicon/kirin: Include linux/io.h for
 readl()/writel()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>
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

On Mon, Apr 8, 2024 at 10:04=E2=80=AFAM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Include linux/io.h for readl()/writel().
>
> When built on x86_64 w/ COMPILE_TEST=3Dy:
> ../drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h:93:16: error: implicit de=
claration of function =E2=80=98readl=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
>    93 |         orig =3D readl(addr);
>       |                ^~~~~
> ../drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h:96:9: error: implicit dec=
laration of function =E2=80=98writel=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
>    96 |         writel(tmp, addr);
>       |         ^~~~~~
>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: John Stultz <jstultz@google.com>
