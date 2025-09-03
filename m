Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D2B423AD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241710E8AD;
	Wed,  3 Sep 2025 14:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kcDRuFBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F363C10E8A7;
 Wed,  3 Sep 2025 14:28:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24ca270d700so27025ad.0; 
 Wed, 03 Sep 2025 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756909723; x=1757514523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOhxeIFjpjrMf7aOEWMhCzpTvgFLShuhckx1Q3/cIMk=;
 b=kcDRuFBV+fKp+vu8XHyumIuW2vxezZ8NINDsoGdaflark47SR01oF977kDXqquDoEA
 e9pRUjprDH3tjesyKwMqnUIRxO1DgJ12vtrZODPP8OK1XHlhWV9gZUVIBU3JZLkVozWq
 8eUjRx3P7srxVvetzIRXw2RvGNZt+69sYhJBbcuiUUjcboy18ySuB06ScswQyzd48l1y
 F5vU+e42kEdX9jUwiiPOurQKgLV5WTRHcDVxu12ejR0RSIhANpWP1Cs0yEfrSeEPNULe
 Znx670mCSYmBd3R02qrjsA3OAVDRnW7K4wSIedrkq66YvBkCDXoNFrOaTx1b8ZY30Oc3
 hj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756909723; x=1757514523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOhxeIFjpjrMf7aOEWMhCzpTvgFLShuhckx1Q3/cIMk=;
 b=KUD4Ywbknjp2yA0OOA5Uzdx4mVS8JW6mkpZXh/Q+LqGAgcVZ66Hj/P4SX82psRFHw+
 9N1yOiUaEhczWaz6DBbb6p9s/O9XLDHlpl6AyQGxtVxio1BtOQbTHoY634K+JqrMfPHi
 wzjmrFhENnaWTFZBVLP57XjqSJYnIKfnnqztuNeztXwOqBtmIEUhvnkypFOlny+Dad5o
 Wp3lzwpcjRpeOOHfZGVgKSKBcb4ubaeVTFBnKmzJ9oHna7agA4GSEO6RzmHT22rRV5Nf
 8sL7m25/Djo/bJmKiatt7q/M8TAPkfGNUL+LcbClbhq7p0ibayve65pSXgIVz4uF9rVJ
 56ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj0xdb+Z7oDjWqYcZRCV5irEio80Cy7wLE1RLYSZhYDhXOQX2PrKu+PqO53BksSwZFTHTehoExClsO@lists.freedesktop.org,
 AJvYcCVEcZm3f0ErmU4QD/ebxQFLS7ORw+oR0s+sc9zoUssEWgAH7QItgs5lQzCzkc1bli6G4gdjVU8L@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaezuJvLej/OjD7L9qbeXa6WjLwKdXA39dbzfgfOrDIW/DNR7W
 TRpA3coZYadJ2zJxeh7OMDc8kJLixF62JQYBXlAkhflhtXv+xzNYSPMW7COLl7dZZ3i4Jf5atCu
 lRdQFs9DuqTUkPxkhOWzAeB/gp9llcxs=
X-Gm-Gg: ASbGncs+TOZT25Uzga7e66fKyE3zsUxxYxVWJHm/jQ2xWC+mC12FRoj9uRuUFVHSWLo
 QSffXtSqn76yY2z6Qku0jHzQ+1az29Q0An3WbabubP+VaI/ftsvhNh6U9ttNyfgtNEe0U+WZCbL
 QWJuN9hpVmKGJxOt0RW9vHLIYi6lqTqszpOk+c96zLwUacpD43ZqsMNTubMM/v4QvhAb1n3lVIx
 M3wEjauWH5oYq0NRw==
X-Google-Smtp-Source: AGHT+IFOnePYb4ywz6jf96HTmrHkdNDdlN7uSd1l6wzq/vofzodwjrS28jTK2c5zjv4zLJIFlbc42+Ai0y70GGbGTP4=
X-Received: by 2002:a17:902:db03:b0:246:e1ff:b223 with SMTP id
 d9443c01a7336-2491f1393cemr133123155ad.6.1756909723377; Wed, 03 Sep 2025
 07:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250903082018.2702769-1-colin.i.king@gmail.com>
 <aLgCkRO8jkzwuxW5@stanley.mountain>
In-Reply-To: <aLgCkRO8jkzwuxW5@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Sep 2025 10:28:30 -0400
X-Gm-Features: Ac12FXwZEbcPUl-6-Rnd5XZji0oaUsIwWztfkSuPcJ4GcwF8j6e-YBXz3n9gNeg
Message-ID: <CADnq5_Pkbpezj9p1b335Civb90fGxojyciExZgfAndRF1rUTmQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/amdgpu: Fix a less than zero check on a
 uint32_t struct field
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Shaoyun Liu <shaoyun.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks!

Alex

On Wed, Sep 3, 2025 at 7:24=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Are you editing your CC list?  The get_maintainer.pl script gives me a
> longer list.  The most important thing is that you've left off Shaoyun Li=
u
> from the Fixes tag.  Added.
>
> The kbuild-bot did report this bug on Friday so the AMD folks likely have
> a patch kicking around on their end, but just haven't sent it out
> publicly yet?
> https://lore.kernel.org/all/202508290749.ti6u3cLL-lkp@intel.com/
>
> Anyway, the patch is fine.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> regards,
> dan carpenter
