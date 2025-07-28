Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06821B143C9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 23:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1BC10E030;
	Mon, 28 Jul 2025 21:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lSVMRHDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4210E030
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 21:24:06 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-31306794b30so905698a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753737846; x=1754342646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnyU3zBHht6Z7NOh1WUr0q1KrJ4YVsGuKsvaRq6aEj0=;
 b=lSVMRHDD1YcglrFJD2RjvGEsGVcY1BwFyVLj5UFFZstfVZf/q6G9HwCSeOBI0Jh0Rr
 SebQ4KPHi1PSSihqM3JiD0bBo5P/AFKhQ7i/cCbc+5cbylntS/VcZeuZ3UVYkjhZmHul
 PYVTenBk0dKagxcauqfNuMlrTXHWoSR/H7azRME89jZC65iRjv+YXyvSJ0MlG9RmK/ie
 mI7KcWKA3Y2YY28e9c/DpZqUqgPYPNYJWjAcvjO30zFjMMeoKgnqsOfYbe81iY97WgHx
 iDPsT2PzumQ/6g8Lpgo/IzRalafFH+ZrOz53y4fLu+URjA7gUHlo346JrENj7VWo589C
 lAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753737846; x=1754342646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pnyU3zBHht6Z7NOh1WUr0q1KrJ4YVsGuKsvaRq6aEj0=;
 b=mBgfZMwLJgdaf94zdymo1Bx0IdvcnDjCkVa16zHTd8zT3kE10dIiXjjdtGShFGt7W5
 M8LFpESWd/kyLDHljpuZgz1owe/Fr28SuLccg8ddLa10bHngp6c+Om+KLxYFjZ3nOTQF
 FqW/KRTJ1TQ1/OxvQ/tsdqB21f0ordxTrCtdkXS5wGZdycbbPRi5XKLyYiLPEooey9RG
 TR2mdudGYvSpYHfKVw3oWr7TpF06I3YZZ/lMrtIBVeE1rBdxB2GjM5uGzmMYJCjNJcJR
 4YjAxmd3BfY+lRGa/UwF72bNZfhIi/LzbTrgQSirV4xb7Nhs2v78xSD9SRpohYe73sRP
 FToA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUictvKCCuOlo32ISCwbh7520HNUzsB8b/W2zjOcN7LK/7YpYZRvYdxuxY1AWLS1Ef7rLcbBrPObq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy86gVgZULU98vHr8lNgpcRQ4SV99NiJh/8jvg1ZxVQESF8u5jH
 0GFifXhRCm7ymwf3ldu/sMfTmm3i+755fWuWRjtvF8s6fVs0lF9G/cox63B4mQ97r11+C+gYT/k
 2wWBieYxQsnn4rn7K7fbWJxRVXLwjuYI=
X-Gm-Gg: ASbGncujqDe7RpATbjEwLH3PPKSwzfK+n5YJpSqFhcJiMYu96pBjiEJlEUKBfQc0Vw1
 Uy7v0yjtdHGvzPaXQzZVPy6EBq0d1XyFbd5twXjgM7I+xinarn3hRpTw3fs5YrjGOHeYqi57643
 Nl5lhiKq2K0YB8n4PC4EttCsKEvGIe5V+1eeIOEIMPJ617ocZAi+bc2jDbhAF5oyMZ6TT+DdV3+
 /gHrjyG
X-Google-Smtp-Source: AGHT+IFMn7Er+ZI3GtpQwahkfKbUlbo/uHN3By9Q6pXGy3EiuqVCs/JWXfbQW+C8U14fcf4BfKNW9as6KGrtg48yANY=
X-Received: by 2002:a17:90b:3ec7:b0:310:8d54:3209 with SMTP id
 98e67ed59e1d1-31e778d9e57mr7217472a91.2.1753737845604; Mon, 28 Jul 2025
 14:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Mvhc-w6nUi6WmpL3Czp+0kqsFaZa6bgVqodps=8F1t=A@mail.gmail.com>
 <20250728195338.GA3244723@bhelgaas>
In-Reply-To: <20250728195338.GA3244723@bhelgaas>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Jul 2025 17:23:54 -0400
X-Gm-Features: Ac12FXwxHztX7Rf5OYTgYrAe8edepb-DozRr-c5yN-yRJsV-5dsHhXNuQl5WncA
Message-ID: <CADnq5_MwdowKPsdXZN=Ku4pQHMRVCMK=krdciVWnPC+rD5Zfig@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpu: Fix typos
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
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

On Mon, Jul 28, 2025 at 3:53=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Mon, Jul 28, 2025 at 03:16:32PM -0400, Alex Deucher wrote:
> > On Wed, Jul 23, 2025 at 4:28=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > >
> > > Fix typos, most reported by "codespell drivers/gpu".  Only touches
> > > comments, no code changes.
> > >
> > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Any chance you could split this up per driver?
>
> Sure.  What's the appropriate granularity?  This?
>
>   drivers/gpu/drm/amd
>   drivers/gpu/drm/i915
>   drivers/gpu/drm/nouveau
>   drivers/gpu/drm/radeon
>   drivers/gpu/drm/vmwgfx
>   ...
>

That should be fine.

> Or I guess I could dig through MAINTAINERS and find the most-specific
> entries?
>
> What's your preferred base and timeline?  This was based on v6.16-rc1.
> I can rebase to v6.17-rc1 and post early in the next cycle, or late
> next cycle, or whatever you prefer.

v6.17-rc1 would be preferable. Feel free to send them out as soon as
rc1 is out.  We should be able to handle any minor conflicts if there
are any.

Thanks!

Alex
