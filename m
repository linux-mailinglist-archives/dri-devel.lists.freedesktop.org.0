Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E7B23A48
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 22:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A7A10E028;
	Tue, 12 Aug 2025 20:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="zSeGqx/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1767410E493
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:58:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso7855559a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1755032278;
 x=1755637078; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrV4F3ggfLONJKJPHxiw7oTtdul8n2s16wFaeOsH0aA=;
 b=zSeGqx/+KqUpBwS3Ah6+0ZVUjP/v0gxcJNrUbmEjeT+fPOgL3JZx+vZFdT/KUXerHq
 8FHIaZtaUFMAZAM++Dvv+3LkpXBBgc5yAEzKpX3JWICKbzl2MHUzxSaVBH6iHONQlnT/
 QnwWohvJujQcMjzP/fNzESBdvQMku+xvvCyn0UK+640rld/1aIHbYwZYOv6PCzC4NXTd
 e2z3Z96mGZa9T1tJwsw/rI8njkK3Ax7yAApWtjqgizmEcer3/54X2QTyIchw9L9URPya
 W138+1FVYZbeXWIcxw4LDheIazmkl3bEpPuf6vFCmtQTvMCPEo/q2t3tt6R5GgtVkVBi
 rPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755032278; x=1755637078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrV4F3ggfLONJKJPHxiw7oTtdul8n2s16wFaeOsH0aA=;
 b=mQsVNCdHctDrlD1G42EYAZoVzq3zD/V4ERvTPoP5/e/T2LeAKVQanFhEOnm0fpTLtK
 KamYzWE4inIXuLlv9Ni+frPA4PvxfJhaZakyTyoRq/7RlRxlPStAfb99M2K2G3vLlvyP
 idJI4em5wIVfc63WDW7lFkL8FltEdspo56vnRx/lUJlCkooO+2tUqSkH6t371OW1ACgd
 /Qz4v9EYjdSgJ1W59qUBaEQks+q/DeU+Ss+crMOQ521VT2YC6oAVQWBf7WI0CNY/VqVO
 mfpjgsWtmKFY3ZHOH+pwccun2vOuadZs+jNh6sMbKrKb1qljzsf5tjbXkL273T7EJXPA
 zpHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlt6fJcbOaPpJGhQkuRQ5uau2raTZFWyP4kzwDRjuG9tW62AHt6pvBajaOYL8xK7PmDOZ9pk27w8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzixCuhSkPvb18hkbg0uBB44QKDay1t/xVq45yThkiEM5t8ONE
 FyGIjgZoC+557XIQjjbvDuuvZhfxuj49YgeiUAInqy+ry5Dvf6ht83DFEbowkPa5+eMQDL2F+v5
 WQVlqFeyee5yiB5C32PST4/gpTf484aWkjx88GQFozg==
X-Gm-Gg: ASbGncvBd/FUNt6fqXJ61uGulyqTOiwsa8DjH6dPiZstUrfTuDxG3KMYGXC1WNlPHDH
 wKCD/TX4G2NeWY8K5j1QAQqtQtcoV2aqyuEgnbsW9WqukvDkvNXkMcxYMNUgZx5CxvNWngepAPc
 GA842h/PgujyJ4VQZkCCOVXJDEvxEnfxST+tNy3ykimD8XSSCZIHzoiXKrlpEFha+kdV0hYAw/k
 CDfAnVs
X-Google-Smtp-Source: AGHT+IHXenokGDPc7c+8AH3VQpKGDsLvDZhkCKEmxn5Bfy4MOrgqGlHyzXk2gIBnArM7BAOgBhV3oZF9xry4JlFgUu8=
X-Received: by 2002:a05:6402:5201:b0:618:1835:24ad with SMTP id
 4fb4d7f45d1cf-6186b74ffc5mr259423a12.3.1755032278274; Tue, 12 Aug 2025
 13:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250811213843.4294-1-mhenning@darkrefraction.com>
 <e4d721185bb0e9304f685f99103e63105fb80103.camel@redhat.com>
In-Reply-To: <e4d721185bb0e9304f685f99103e63105fb80103.camel@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 12 Aug 2025 16:57:32 -0400
X-Gm-Features: Ac12FXxsUM0d30wXYjK2Hx0QCx-YAjMVgZSnrBeTiZQsLkUfMCMOw-lFErNABec
Message-ID: <CAAgWFh0yvFsns=7YuR89R1Bq1SUMGPxq7AT6Mn=R2aaHMAQQyA@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 0/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT
 config
To: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, 
 martin.peres@free.fr, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

On Tue, Aug 12, 2025 at 4:27=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> I assume you need someone to push this for you?

Yes, please.
