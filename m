Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA94F9779CD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5482F10EA9E;
	Fri, 13 Sep 2024 07:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OMuyapwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3710EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726213099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Avl4iry6mR0AB1YY7uHRw42ef7yROe7C/fBOKfnsI2s=;
 b=OMuyapwK5q6IOc3mRQT1tLhr3iq7aMp6QBS4gEIn7govJRJJTRx0W7p96qoDDD0TR98hlp
 6J8zBwYRKgIE0rbyq7UvFJRkx+0DSoZ95F0m37e59krMPMrTziYnqSa/z0L88cD3Ag6kgn
 3IcmzrEnupXSU8d+Ad2LHCWNkQKyS5E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-LeARSHJnOauQIkiR7iak5Q-1; Fri, 13 Sep 2024 03:38:18 -0400
X-MC-Unique: LeARSHJnOauQIkiR7iak5Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374bb1e931cso1480280f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213097; x=1726817897;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Avl4iry6mR0AB1YY7uHRw42ef7yROe7C/fBOKfnsI2s=;
 b=R69QLRQrd+4PhDC+LS0Gq0HWEfYzasomBYDZLFgUuI9HTQ3lb5P9TDLyoXW0aFWkvT
 InuDLccwVLkyfMMfaLspb+0UmItzxQp0uLChvpufoYMGQwVfor4FATp8e/ccvIb+H3LH
 fZfCoKL28NeSv+zv2k3YqDBNjfyzJ8ia0PbbbtTeOhWF3RBLWuJYvIxayCvJqz6aQYtB
 D20KB6GG2Eq0AZ5JUlXfwq4MtjvO1ccIqzPDDY7wH6KLv9HvQCHFTbIDtY7oRxT7ycoX
 wLJKj3V7f7/8PEjg5oYo1S1qEyU9Hox/xTrpu2Oq9iICAc2jFQieL/MYi2MjJ82svXk9
 DSZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVY3r5FnfRQUfySuzIWyoEoLGlQlm+QInZJqESuM7XYYNHYrOwqQHqSAe3dk2yU9SudtCYRGpeaqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD3zdN2+GEAZ/xFKACMRqTLHU7W6it3kOnotNfIbklW6y0Ir14
 KvxJTVvKMy3vCkf6vHKrEr4RinXKk99qZhOh5y8CkzVEbsEt4dHch2P4SON3w8hh9n1XNOBHJ8a
 gjDeHwbJN2cN8Yj9vrdqD4u1HNhdbmtYOH2l9JKbh4QY0BYawWqzBZJ+xoFIR4NFlHg==
X-Received: by 2002:a5d:4575:0:b0:374:cb8e:4b43 with SMTP id
 ffacd0b85a97d-378c2810ca9mr2670660f8f.32.1726213096925; 
 Fri, 13 Sep 2024 00:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwvEaryqUUG8XQkoN2seMqJGO6so+gHVrF76d6zn7a0hT0g5VoWxTmfEzo3MdgpuhPsRUXQQ==
X-Received: by 2002:a5d:4575:0:b0:374:cb8e:4b43 with SMTP id
 ffacd0b85a97d-378c2810ca9mr2670632f8f.32.1726213096336; 
 Fri, 13 Sep 2024 00:38:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a279sm16180955f8f.9.2024.09.13.00.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:38:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, jyri.sarha@iki.fi,
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, praneeth@ti.com, nm@ti.com, vigneshr@ti.com,
 r-ravikumar@ti.com, j-choudhary@ti.com, grandmaster@al2klimov.de,
 caihuoqing@baidu.com, ahalaney@redhat.com, cai.huoqing@linux.dev,
 colin.i.king@gmail.com, dmitry.baryshkov@linaro.org,
 geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
 robh@kernel.org, sam@ravnborg.org, simona.vetter@ffwll.ch,
 ville.syrjala@linux.intel.com, wangxiaojun11@huawei.com,
 yuanjilin@cdjrlc.com, yuehaibing@huawei.com
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
In-Reply-To: <3y4pqlazkuofc37s6zlw7waqzmtdl5iydhm4i3i45n6d6pnflc@osyocv7wxtif>
References: <20240912171142.3241719-1-devarsht@ti.com>
 <c501c5d3-d715-4ac5-98be-35d23ad1cfbe@kernel.org>
 <3y4pqlazkuofc37s6zlw7waqzmtdl5iydhm4i3i45n6d6pnflc@osyocv7wxtif>
Date: Fri, 13 Sep 2024 09:38:14 +0200
Message-ID: <87ed5oypeh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

> Hello,
>
> On Thu, Sep 12, 2024 at 10:47:31PM +0200, Danilo Krummrich wrote:
>> On 9/12/24 7:11 PM, Devarsh Thakkar wrote:
>> > Modify license to include dual licensing as GPL-2.0-only OR MIT licens=
e for
>> > tidss display driver. This allows other operating system ecosystems su=
ch as
>> > Zephyr and also the commercial firmwares to refer and derive code from=
 this
>> > display driver in a more permissive manner.
>> >=20
>> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>=20
>> My only contribution to this driver was through DRM refactorings,
>> but anyways:
>>=20
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>
> Similar for me. I only touched one of the affected files with a
> refactoring change (34cdd1f691ade28abd36ce3cab8f9d442f43bf3f). I don't
> assume this gives me any copyright to that driver, but to simplify
> things:
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>

Similar for me too. My only change to this driver I think was to add DRM
panic support in commit b2cb6011bcaf ("drm/tidss: Add drm_panic support").

But I'm also OK with the change, so:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

