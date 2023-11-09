Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3F7E6D1A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE5B10E8C5;
	Thu,  9 Nov 2023 15:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1110E8C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 15:15:04 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a82f176860so11602567b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699542903; x=1700147703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vksZsL2057Z1Pi05AwLB2ITd/up5C2UZsDtQWJqE9tE=;
 b=Y3qjWIhBkxPEvBaW7YA9SFJf6imd3t327tcUbx1X3pQCw1YyNrEyyZr9s2hyAVScos
 065oerYyYOGUDE2ApgrnlUot1mLnvnDdsOFY6zYVpCVYRgGATYBiXpRC+0cj4/uqCCyl
 FHx6OVcO6AjVGGEdlPZZFjs/zbZzAAm28x/QunIKIU0an5Fp0uP9od7d3ohHCUdg/s5X
 NdhYkW4zP9Sk6fnsqyXwu1CY9P+xjcV9iadYtIsCVxRyU0cERIysaRgQqmUNn/lfhmTt
 TwifT9yILjxtJ2MpKixhtTHblI20VmgVvA9buai/nV/Mq3LCE3WYkbEavDLMnGOK5/4/
 +W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699542903; x=1700147703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vksZsL2057Z1Pi05AwLB2ITd/up5C2UZsDtQWJqE9tE=;
 b=V2d/XfvCm4ctf2aP9ag57LD87INSYEFlQGgzDjRRlwKHivRWWTQ4uTHGKcNHzSKe4s
 jTJIzDMsbT0n0Tn5jyDy81cIbZ1MxhEetT0XvVT1x/Mkikaycp/vD2emyN98laDjXdKu
 Th9PV5dksScZWBkRfx+cWKUkDGYbYZZkpfsfzwBFIO8HVP1RjFk4PLsPsZ7Nuzk9mi36
 rD4KBnxWmd5nGAOz3Box2vfGbmJkW6xH9GjRv231p/hjCMJ1EvwLpNo15qR0lQw33tfz
 CI9DVWCshG3J+UOMv/0bntjgsumJRYeKAA55sgQUzv+ZTGxUwOHaYzP0YiIcwaZPb80M
 Ug9A==
X-Gm-Message-State: AOJu0YwrG5uNZsiIEBByVr3HwykRdqNSC11yfQfkAJ/3EUYl5fLwtESx
 rYfi5gw3tHD4RCRmZRUoTzyHg2hNsCCkBhzJbMFr+w==
X-Google-Smtp-Source: AGHT+IHPzLdZcKU+KCnsgdvKu7v9HttQEIe2sINYRExJ3iJBUagCmbA+tq8y4zA8jBZVdDJSJlCLgrw3ivv4ASI2+Kw=
X-Received: by 2002:a0d:d8d1:0:b0:5a7:bb6e:796d with SMTP id
 a200-20020a0dd8d1000000b005a7bb6e796dmr5673249ywe.19.1699542903274; Thu, 09
 Nov 2023 07:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
In-Reply-To: <20231109074545.148149-2-contact@emersion.fr>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 9 Nov 2023 07:14:51 -0800
Message-ID: <CABdmKX0PgD0e3zYUNCpKRPuDoW68KTL5BTvHGuAwE1CRwVCtQg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
To: Simon Ser <contact@emersion.fr>
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
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 John Stultz <jstultz@google.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 8, 2023 at 11:46=E2=80=AFPM Simon Ser <contact@emersion.fr> wro=
te:
>
> +int vc4_dma_heap_create(struct vc4_dev *vc4)
> +{
> +       struct dma_heap_export_info exp_info;
> +       struct dma_heap *heap;
> +
> +       exp_info.name =3D "vc4"; /* TODO: allow multiple? */
> +       exp_info.ops =3D &vc4_dma_heap_ops;
> +       exp_info.priv =3D vc4; /* TODO: unregister when unloading */
> +

So unregistering a heap isn't currently possible, but we're trying to
enable that here:
https://lore.kernel.org/all/20231106120423.23364-7-yunfei.dong@mediatek.com=
/
