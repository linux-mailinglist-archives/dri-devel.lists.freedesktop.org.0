Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F19FA2EE
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 00:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977D610E036;
	Sat, 21 Dec 2024 23:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ndEjihUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0DC10E036
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 23:39:59 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6f29aa612fbso22605267b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 15:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734824398; x=1735429198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufEE3A0MU2Uk5Sn2+9G3EJDO4sgMqk3UZvfF2JF73xk=;
 b=ndEjihUOfrJ2I0BvSLgLqM001QXMWwNFSe+stk6cKpd7k5R1dKEellsoNC/BqwCjdP
 e/5VE3IKfifDCT4wvFgRe89DCQiiz/o6DwV0oRN7KPJrlF6jJP03vTjhzcFxN8upRVaX
 Ta4BhY1VgKo22VcZ1MUDev71NjQbH/FeWAwsHZQ62EWmMzj3jrhi/+lBnKpQbbwmUWFY
 asX9VMIF1dj8GW4cgEMWnKt3ucN/hbbjj81sZRfIks5Qzr74zqgcGxEO3Fp/K96yKzVB
 P5Yva+lWkhaZN+J5EYF+XdtdCHoLH7mJIWZD4yQUrdZpI/EZDCfZvtoQB1ySghncKtTL
 MD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734824398; x=1735429198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufEE3A0MU2Uk5Sn2+9G3EJDO4sgMqk3UZvfF2JF73xk=;
 b=Mfg04WFxITFVWRwneu76fN23t31HgaIJbolDIjM5bQAbHBGz+VsBqNJALiBHhQURYu
 VZKOJP/fbRCUYO7Sol8TbxQV5tdOv+5gGu6qP6gAJjMjx9zWItYCN91JmgY6npWGhwRF
 PqVUGEs91aGCK9wYmSwgwlrMpnvq8Jv1oXU5apSgKQTOw2QqsVzR7cz3qVgccGCf6FNA
 Mmyhz5cZoMLe9QBa+kkCJeTno+JrXcwGoEEH4jsWZPlhQ72azg93t5+unyVEpTQCKH3I
 diZJeKz76CgerAGzaOBrTgDnFx8ENgGaH2r0ito0aoUOAF/sDLgi14kCgr3fFG93LwNx
 bNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW109rwSaPxx4YFDPI/zsgeGFjrczEq+dGByc/ixJNQYAVnO7VFZmFXKxsgkIBF4Ble5hC0R1wEvSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPoxymTbV459Wm/YWubrKkLRFba2bPzlceldXDqKgduMUfJz8j
 WzdRpUvrX4pXhuB+relYgyGb3Ewi6Zlw1sD2MqWkrMXMXPLwkDAZMS8KvTPXDGFMZaCuPHpshN2
 +saWWc7BD4A06kmyF9YtNmXfmaSl8Ep1eMwS6wQ==
X-Gm-Gg: ASbGncuaJNCaGqWEHlTSImDthjC8X6sYGhss2ddkCs4QZK0DOydJYNs66si/SsGzxme
 knlZDZAOGuqGcFJAgpjzFSC14RKRsGNtdiHUBDQHtdJD1R/yF8i/k
X-Google-Smtp-Source: AGHT+IFFlozRglu5wo7tELzkDlRVQwW037GHWKCV70fh9LMObfF72yVcT9I+4j7PQ5bHwyPmN9syDdqLU4bPE3S4zPw=
X-Received: by 2002:a05:690c:6212:b0:6ef:5848:2a82 with SMTP id
 00721157ae682-6f3f813620bmr57981887b3.25.1734824398242; Sat, 21 Dec 2024
 15:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
 <bmaigvj24rqriugxykrbe47poonji4nw5up5orptx5ajd2mzad@imazjm7fmuj2>
 <CACRpkdaSYQkMD5b5hSnoPY4Wxf=Zmn3iHygtt9YeHFcL3LWaHQ@mail.gmail.com>
In-Reply-To: <CACRpkdaSYQkMD5b5hSnoPY4Wxf=Zmn3iHygtt9YeHFcL3LWaHQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 01:39:47 +0200
Message-ID: <CAA8EJppBwWNjtNRSJOuVbQAY68YA8YkdE-8WT8igZp=M_w4Zhw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Assume maintainership of PL111
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, 22 Dec 2024 at 00:26, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Fri, Dec 20, 2024 at 1:11=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
> > Could you please convert it to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > Likewise pl111_display_enable() should use the bus flags and input
> > formats of the next bridge rather than the ones of the connector.
>
> I can surely look into it.
> Is there some example committ of this type of conversion in the
> tree?

I probably can not point to a single commit.
There are a lot of drivers that use DRM_BRIDGE_ATTACH_NO_CONNECTOR and
then create and attach drm_bridge_connector manually. I think one of
the last conversions was done for the imx/ipuv3 drivers (dw_hdmi isn't
converted yet)
For the bus formats it seems we are not there yet. At least panel.c
doesn't propagate panel's flags and formats, so you can ignore that
comment.

--=20
With best wishes
Dmitry
