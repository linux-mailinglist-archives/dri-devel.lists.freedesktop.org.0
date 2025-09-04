Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DEBB4781F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6950910E419;
	Sat,  6 Sep 2025 22:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CinlZdUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28AE10E248
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:17:25 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3ee6485e7d7so9477285ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756984645; x=1757589445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FevmIjnGLzL+vnOv7ajDIjX5AeN2/FSgvjUim7dAHaw=;
 b=CinlZdUp5ZHqhotH3Ch7QJGhHnCo16jvSBRBM7zCfg+7EFKjwXwHddrHqRppYKAhIA
 osGtx0IozkL2RNvhiiOu/uH8QFY9Cwa1MpENDp7xoSkkYvm6bqdbXoqJhfm5uGs6OxVv
 HV/MzpFkn7xaFAObTXuQXNGT3BXOR8umeDNn0fkusgBrsI0N+DhAkvD5zPXNMybVv1Hh
 1lCkGd4yBygZOy1iBerivwhyj55E/4jzcfXhm5kiotHhHfBZ2Mxf2e4ftbqqbog2Nlmd
 fWnK6o02XFW3bM/H8311++1EGbZlBnfxIahq+YOd2WLdGmPjBxKPFLmdyMPWWgJB0pAR
 KvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756984645; x=1757589445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FevmIjnGLzL+vnOv7ajDIjX5AeN2/FSgvjUim7dAHaw=;
 b=TgeV1wanOGis12gLud1ZCqIxVcD9inXaOG8Ft9SUxRIjF0hrhtKlQv4BBwPO2/OFc8
 AhTAcO+zgO1mYcn4fevLeCPIqzj2qgcYERpX9fnxSYF9mBJvKVxlsZDBeX4duhTgzxyy
 bn8dygHAJY7XRV1LEuRLusIO0i04GPclOKTXv2exsbxz8Gyb3jjfHU52ZRjETDcDq1pS
 d3PG+nSZOcs1rLsRTdCJOnu9BErUMv5t3gqovFUh4pC6sIpN+jIdV0zwtTXwqJZbpH2O
 4QjiehWZbqDIsIHDVAuUNFOUIyXWYaD7ZPQ1kFMp4CGQ6sGJWwTPE8MIL+VNxLQPsyk1
 pwdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYFVLkqgbz5aLzEhriuI3LwRD4Ys0tYxQF1Af/WlHfeZBocMQkZDK3UOpGKUfX05wdhLU6SyG3PoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9dQPQLPfq4vvDk1PbrI1olHHbeT2pD5YM6ueu2YC9osrAtnS5
 azFGBMtUmbxjfbO+AyJ10VUHdY/tmlAUoLIvu6xmVihSZhpwwyWPfuoHDWQtQ+AJ1lwUnu3SeSo
 Xq31mgUHrG5/pAXTXsMxiQ6Rb9g8kdlw=
X-Gm-Gg: ASbGncvAMmy1oMj8rY//5Lb730HAxeR0DeNEGwZ7S3r12wc+TjZGyhgwclNphOU3Y5I
 EB1PHqxCOxcp+8joUWCB2ytI6fFvc0kNK9K9qEfpytW9BNqwqpbuJYeR2ukoakFucubUjNvEGDe
 eKYt5YlgzBtc0OKzFfDG5NyOs5p7xXw1HoP735U5Nw7citaYeKVcKrgxumIOL1LZi1mfQ+hhOO9
 3HAELUV97hZMeqsWA==
X-Google-Smtp-Source: AGHT+IGpLZ5D5OKWZTWLeH3TsPwenZWq0PAACyBixD1XRKbsVqVkCws7MNZmFCwC61LiajeLRRhN0KJyoRdVvIst79Y=
X-Received: by 2002:a05:6e02:1a8b:b0:3f6:609d:1855 with SMTP id
 e9e14a558f8ab-3f6609d2eb6mr76703435ab.31.1756984644753; Thu, 04 Sep 2025
 04:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
 <24rahlm4kkob7knapdxxnjixye3khx3nv2425y4kkirat4lmam@gjey7zqsnzks>
 <CAFQXuNZUfAJe4QEDfi+-1N99xO0_z5_Omnsn_-SXr2QPtvdL_g@mail.gmail.com>
 <e2c40d56-e0aa-45fa-958d-97dcf4f92a6c@kernel.org>
In-Reply-To: <e2c40d56-e0aa-45fa-958d-97dcf4f92a6c@kernel.org>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 4 Sep 2025 19:17:12 +0800
X-Gm-Features: Ac12FXwWY13jiEIokP_wWXDkVpoD5cdJII0KZ8QBhaK5G6WDofGKHIoKI31db64
Message-ID: <CAFQXuNa0-_kLpoy9EE3rrQvPZj0XPaSp8F6u7wYZb8TEJ72hcQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 syyang <syyang@lontium.com>, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=884=E6=
=97=A5=E5=91=A8=E5=9B=9B 19:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On 04/09/2025 12:48, =E6=9D=A8=E5=AD=99=E8=BF=90 wrote:
> >>> +
> >>> +static void lt9611c_cleanup_resources(struct lt9611c *lt9611c)
> >>> +{
> >>> +     struct device *dev =3D lt9611c->dev;
> >>> +
> >>> +     if (lt9611c->work_inited) {
> >>> +             cancel_work_sync(&lt9611c->work);
> >>> +             lt9611c->work_inited =3D false;
> >>> +             dev_err(dev, "work cancelled\n");
> >>
> >> Why???
> >>
> > ?? I don't understand.
>
> You need to explain why that line - printing error - should be here. And
> focus on "WHY" part.
>

I understand. Thks.

> >
> >>> +     }
> >>> +
> >>> +     if (lt9611c->bridge_added) {
> >>> +             drm_bridge_remove(&lt9611c->bridge);
> >>> +             lt9611c->bridge_added =3D false;
> >>> +             dev_err(dev, "DRM bridge removed\n");
> >>> +     }
> >>> +
> >>> +     if (lt9611c->regulators_enabled) {
> >>> +             regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), l=
t9611c->supplies);
> >>> +             lt9611c->regulators_enabled =3D false;
> >>> +             dev_err(dev, "regulators disabled\n");
> >>> +     }
> >>> +
> >>> +     if (lt9611c->audio_pdev)
> >>> +             lt9611c_audio_exit(lt9611c);
> >>> +
> >>> +     if (lt9611c->fw) {
> >>
> >> You definitely don't need firmware when the bridge is up and running.
> >>
> > The previous text has already described the working logic of the firmwa=
re.
> >
> >>> +             release_firmware(lt9611c->fw);
> >>> +             lt9611c->fw =3D NULL;
> >>> +             dev_err(dev, "firmware released\n");
> >>> +     }
> >>> +
> >>> +     if (lt9611c->dsi0_node) {
> >>> +             of_node_put(lt9611c->dsi0_node);
> >>> +             lt9611c->dsi0_node =3D NULL;
> >>> +             dev_err(dev, "dsi0 node released\n");
>
> Your driver is way, way to noisy.
>
> Please read coding style - what does it say about driver being silent?
>

Thank you for your guidance.  I am learning how to make the driver silent.

>
> Best regards,
> Krzysztof
