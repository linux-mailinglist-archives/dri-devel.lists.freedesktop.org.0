Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DCC9D56E
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 00:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AE110E5BF;
	Tue,  2 Dec 2025 23:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DbaGvET1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B9710E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 23:30:36 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-787da30c50fso58918887b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 15:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764718235; x=1765323035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0sphT7RRXrJ1L9gD/fYq9/V96uQDmUTcWJcH4nhgxM8=;
 b=DbaGvET19K2jwnujMmx8lkxi6fyzy2rQ/j6p/jvtebizwhGEofDA09VowHStAz7fPC
 uQgNBKp2zxpiIwfHHWg70mqYSFDCEeDS9x5qqS04WL5j7Ojs+bOn1BhPRyN+gvw+URJy
 cslVL7RqwCn4uFrUA+nCEkqw3FmIuD7S/rwoTkpwN4rA5Te/gsFFXuGh/pAdzbA26Fd7
 k5k+Hcb7oXfiYjbOuQ4Rw7gHxMAjD5uDhkQSFcgyuStDrzBXE4qd7tktdjGFV29UAab/
 EWWB93PmALz2Pa/wxDvgGDrK/pNm6oo8t31symXMzwtFoolUMcP9/f0DzGK5l1AMprIE
 tHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764718235; x=1765323035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0sphT7RRXrJ1L9gD/fYq9/V96uQDmUTcWJcH4nhgxM8=;
 b=rBrG4uTCtLkla/GhbD+Q7pHulSGGGciMQg4gNDDbV0JLT2Dv1sj43OP7TyQVDFK14w
 Ud8l+Ir1ljy6UMgdiEdVH/dzIX6zzcNHKo9AxzaZT2NldLhVabovLVnrbJ9niTwmLGt3
 YS/UnTYZIihqN6mhzSNgvpg2i5XLzO9V1BvgH+nsG23HXJZ/3tf1XwEc/+xlkTjUzTYj
 YnSrG+rfLis7lUAi+dBdWLlqvV3ccrGHsdPyBdoyW2gvrhdRG3IYhO4O1gIkLTC6PW4F
 qS43+q1mJYJvcl8lFWUmM5SzeBzXz5gAcN2EAwJwvZi+UJy/7I8QRRbNpbPDshp/lYMq
 aP/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJUNYEYEEbEnJEwZ/htV+EZl4DZDefAdlBEx3pGv+dAANuSkuXjdL4EuklvleoX9C269wZZ57Dz1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7DQGzczvnq2giYZetDMtV+d82QeJQLQxPc2s0nUpeoBArmXt3
 fEPkv3+N5Ch5WYEoM0rRgX+Sg2DogxkZBoC3PW86/7a7JTOUCzrBm7GmFexCltXdIeiBHP5xQc8
 lLMGv11Qy/CuRnDh5dYfJwZ6EEOZxPPk=
X-Gm-Gg: ASbGncuFu9iXkHko+FcyLIYZ4AmxmpBRWpAWer3akwxLDPWDpbFcy3td14cyIeC6iOJ
 qBmWVlgWWVh3CZCaOEHKo7q/mGYuAuSb/syLKyfVnTvZHjAt+4T3sC0g6kOAk2e/msUHvT52g6U
 ded+EnsjtujrYUchgTPjCj4mhYB48BNF0dhled8E9aAXuNuRhIJzlA+51QoWqdofKCq/vMaBmPS
 r8Qbp6SRbVU+ZCyR6QvWbY6C4KfWppEumT8cSOUmoJA8M3Kgw6MOHg+KB5+3967Is3OnNlGFHJ7
 rA7H0RhivYQZ5GjJhV7/6laEmw==
X-Google-Smtp-Source: AGHT+IGoIWstbDdTqSD4I8bl5rcuRkY0c3EeAU7xFp0Zcu91xthhOhnOMX5DazH9JBA25ZMxjNgJza04VNCEHRyfj1s=
X-Received: by 2002:a05:690c:700d:b0:786:5712:46c7 with SMTP id
 00721157ae682-78c0c1a6837mr5633807b3.41.1764718234513; Tue, 02 Dec 2025
 15:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
In-Reply-To: <20251202133538.83078-1-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 2 Dec 2025 15:30:23 -0800
X-Gm-Features: AWmQ_blDgsFg2ML-KjEqqwvL_Y_at-nCPhQVBLBb1my7cB_sZ3-1xpHfYue2mJ8
Message-ID: <CAPaKu7Rcx-HdD6nGqZ4FCOQC3W=RbrHhr2ayhVuuZbN2myWVRA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] drm/panthor: Fix regressions introduced recently
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
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

On Tue, Dec 2, 2025 at 6:14=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hello,
>
> This is a set of fixes for regressions noticed while testing the
> drm-misc-next branch against mesa-ci.
>
> Regards,
>
> Boris
>
> Boris Brezillon (3):
>   drm/panthor: Drop a WARN_ON() in group_free_queue()
>   drm/panthor: Make sure caches are flushed/invalidated when an AS is
>     recycled
>   drm/panthor: Unlock the locked region before disabling an AS
Series is

  Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 37 +++++++++++++++++++++----
>  drivers/gpu/drm/panthor/panthor_sched.c |  5 ++--
>  2 files changed, 33 insertions(+), 9 deletions(-)
>
> --
> 2.51.1
>
