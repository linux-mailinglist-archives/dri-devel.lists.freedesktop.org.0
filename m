Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9257B2619A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C815F10E82D;
	Thu, 14 Aug 2025 09:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="F1cOl1jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D75610E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:56:38 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-32326e2f0b3so629442a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755165397; x=1755770197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XI+YZTYunV2FqLAO3skSJTb4W7Qs6U1jwE5Hi8RZbYI=;
 b=F1cOl1jzMMFm7uGIjlQF1VMl1HfSGl7+TkFfEsfR4GpeEFu4J//zF193lVR55Pf4b2
 hgEniTLyj0q8KdqMaLbhw/EBSK+pzPXLKFgFyLxAKGccbXeJzeMLdejxrcBmVax7ZsaX
 /t+n37cqO5/WVvUI0/b0uW+WeDgTIcH03iT9LQQqxt1TgxzzenPk8LHLD004cBIVDkax
 B2cpEv0oKAG9lwCqNiIQdvWd1nu+Ki0b3uekzQTbHVr1BSw2su81HCK2bq7DXmGCULE3
 Z/4Gv+X7AcMWj+LZqRZMPSMln9w0c6CX1Pxk3xoiuO3CeASmpGuxw6xM7p7xJ5cRhtra
 yduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755165397; x=1755770197;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XI+YZTYunV2FqLAO3skSJTb4W7Qs6U1jwE5Hi8RZbYI=;
 b=t16GK/cKOW4DSlnLB2f9okwrac2mTbLgXJWUAH3vxKJhajWBMmC8WpwsbBa3+WOXko
 epchqyr76+nImlxAYOdswP+4N4prxEPUTQmZ5tan9urn2lI6HWL2ppAQ8erScIiThKGm
 nI2YhlzYaqpMxtXIo4zf+Lr9dDnrLrtFoRo0LNsTubO6Qzv9pZ1N3tO3h4t15g7LnES5
 K1RXfzHtqid1TD0qSPqeSK9oX9QofxoQbMiIsS0ltN61XNuUPs9HvRUtEv5fSkjaamh/
 TbtPqBltjXruYZMQDCpXPXBpRYCqtaH9hO4Hazt4LXJ/9ansgCZ/WzHlmkotKflRQmpU
 njfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuxyeB5073xkEacXDetyYsx2esPSFSgueQyk6IdHAI4w/8yoL28CgLbqssNWMkb+dNhtCBj9jdaXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS9wBpUaXJHsrTKvaYYKJAor9tx2w0bF+rqvIhQfFGj04YyfnO
 teXHxNvL3ksw1v7PSy5G36/06OXLv+hjMC6t89RaZol9NpClGaR3UW+PpybeiVHJwV5J0fnTusr
 XZs7dy1P/0gY2ImRFd+NWU/seMGqyUj0u3m4wLbA6HXk95OxIBAphfRI=
X-Gm-Gg: ASbGnctSapOgaWUdInLbz6J+XGeUo1kbsox9wA+1q0i2sZwVJwOh5xtriUbVYLt6q2a
 B9/wE1FgiTJnR+2ZlcT3AbX5Zz8qPs2W4fs6YJA51NldJDssFe9F8tQppPf4I8iI2xCoNRprIzp
 xEEdzi6EpQ43lY5gmRHuQZJMATyEjemjpp+rWwcgDk3CVR0j3ZIQ+wssYp3ZHeB0KN55tz8i6qd
 RXyHki9nM20orV4eyPN9vJebe5mBsem1rFoWKzcNA==
X-Google-Smtp-Source: AGHT+IGaR4zZTmwDXSgdhaPo1egDiTcMG6nM2t2wCL37J6YMrH29xvG0jOt6tRf9GiV1p2rkjpGso17ibnqCGKeq/Fw=
X-Received: by 2002:a17:90b:5387:b0:31f:28c4:e1a1 with SMTP id
 98e67ed59e1d1-32327a63a4emr4480080a91.18.1755165397484; Thu, 14 Aug 2025
 02:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
In-Reply-To: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 Aug 2025 10:56:24 +0100
X-Gm-Features: Ac12FXzUVXHq06uXn5xPUOGU0dlc09ccWHz8Yhyp2iyegiiKJqVAUdQEfClT-RU
Message-ID: <CAPj87rPos9HbByo9Dm0sQHDepYVp7O=PdMFaNMZzTZMdp9-JvA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] drm/vkms: Add support for multiple plane formats
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
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

Hi Louis, Maira,

On Thu, 3 Jul 2025 at 08:57, Louis Chauvet <louis.chauvet@bootlin.com> wrot=
e:
> @ma=C3=ADra: For the patch 6/8 I just removed the comment about yuv input
> size, is it good for you?
>
> This series introduce a macro to generate a function to read simple
> formats. It avoid duplication of the same logic for similar formats.
>
> In addition, it also introduce multiple "easy" formats (rgb888 variants)
> and also 16 bits yuv support (P01* formats).
>
> PATCH 1 is the introduction of the macro and adaptation of the existing
> code to avoid duplication
> PATCH 2-5 introduce new formats with the help of this macro.
> PATCH 6 adds support for 16-bit yuv formats
> PATCH 7 introduces a macro to reduce code duplication between yuv formats
> PATCH 8 adds support for P01* formats
>
> I tested the implementation using kms_plane.

This series has R-b on everything from Maira, and you can add my:
Acked-by: Daniel Stone <daniels@collabora.com>

How should we get this landed? Let me know if you need someone to help
land in to drm-misc.

Cheers,
Daniel
