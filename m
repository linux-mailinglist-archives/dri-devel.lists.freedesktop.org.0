Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28277E51EB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 09:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B410E484;
	Wed,  8 Nov 2023 08:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C2E10E484
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699431883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IcyEyeBn8dwCnfd3qD8hbZp1ovPrRyNeLjPOqOr47M=;
 b=HJkYiqKujqU2XnWzUkIZ6xsPIXJBQpGnKUsYQIW/r8F/TCr91UIl2TTwfGC6PyEfk2tofk
 AGGR4/YYBFS6o/u6BwmAoMg7N1f+ZT6qoQBBJhTsJzz2ktdBdsFmQJyyjWMqrAB4W3bINT
 sIl2jCw0TyL+Rd2owGY7CJ+zetGCuQY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-NH10ExV4NNSp5MKiJk6A5A-1; Wed, 08 Nov 2023 03:24:42 -0500
X-MC-Unique: NH10ExV4NNSp5MKiJk6A5A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9d28dd67464so487489766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 00:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699431881; x=1700036681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IcyEyeBn8dwCnfd3qD8hbZp1ovPrRyNeLjPOqOr47M=;
 b=B5Butm7NH80j+E85mLuhecLVeyo8VQyZf9NEq49uNtszhrbtRG56a7NY/lztqjiinc
 FI06P7ZU7OZsIpV75XkIwiG8qHaEvIFi4rsjwjU//V3Ls9pwjeq5VjOZuk1wDlu/ZlVt
 nWJMdd9aPNT86a1DRHIPFFsKVOP9+sHWwnyW8DAKZO5bqVOfkrp70kgU1iqUb0mhVnFE
 hKo50Rsj4ujr21/YpKvticg5fH54yks9Fb8IrgW1LGVeiC1EBiAT8MZnkF7SgzymASr9
 UdL6QOvskdK+lrvOUvIx3b9FFI38Al/doCfFkitNFl8KhvRmy9pPVrjuJDBkWrkg1LXR
 uzPQ==
X-Gm-Message-State: AOJu0YyXqS1BOVzQM/Z/BE10NNHj9mQK6eOJQHK5dH0+4xsyezTJBJKa
 qIe9Q0QgTQLG4d2kcRe6W7uKwSHmr0tVx3e1nc3ypfFCSbpJY+cqHMh8AoFgbWngSuuQZ0FpK6e
 MQeqIj/y9kllap8Gk2ARyYKq7rr/QpiV/ndws/NQvxy4x
X-Received: by 2002:a17:907:26c4:b0:9be:45b3:1c3c with SMTP id
 bp4-20020a17090726c400b009be45b31c3cmr844193ejc.64.1699431881068; 
 Wed, 08 Nov 2023 00:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH49GFxx71Bp3NOR4baVAymipCWf2J99CwqwjvfLzbKt+ZA/XBO1pc3ccuEOdhdzieidWE2MH2zTTJ7wP0e7fE=
X-Received: by 2002:a17:907:26c4:b0:9be:45b3:1c3c with SMTP id
 bp4-20020a17090726c400b009be45b31c3cmr844181ejc.64.1699431880788; Wed, 08 Nov
 2023 00:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
In-Reply-To: <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 8 Nov 2023 09:24:29 +0100
Message-ID: <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Jaak Ristioja <jaak@ristioja.ee>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi,
>

[...]

>
> Relying on linking order is just as unreliable. The usual workaround is
> to build native drivers as modules. But first, please investigate where
> the current code fails.
>

I fully agree with Thomas here. This is just papering over the issue.

I'll read the lengthy thread now to see if I can better understand
what's going on here.
--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

