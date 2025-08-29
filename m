Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63346B3C264
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A26D10EC28;
	Fri, 29 Aug 2025 18:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gIr+Ifi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614C710EC27;
 Fri, 29 Aug 2025 18:27:02 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b47174b335bso369405a12.2; 
 Fri, 29 Aug 2025 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756492022; x=1757096822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkDLHFzMwhGrjPg06GqQv0+K8YzczfW4YoD6Re0s0a0=;
 b=gIr+Ifi05O3HWHrIFvnCj2FQZ7ffMZq8jkQRCFpXiwxY0MvnB/ux9NNgxSJ81DEZUk
 E3F5fYMKEj8q4+ibKu+2w+KZwHNt0vjWkAOQ9yEd/PnBq040/z8HQlPMdrOMkn3jzRfn
 KaG6mnqINzIJyKznv6EX9xwsoP//Ro/Y4uBSlO6dUzegr7Pp5lN7Yk1kr/CtJk7/Kwov
 joxGF7fCK614gjFsFZ8PTdNTlkhf9rzWyna8Ea2AVfvv1zBIY5Ty2PxMSJnoYuBgJFQF
 nYpVUm9UOlqe9rN+XyIuC3T4BJoRI5hMdbtMb/LtmMvX37+4yis75udw70+yZ4a6Qep4
 xthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756492022; x=1757096822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkDLHFzMwhGrjPg06GqQv0+K8YzczfW4YoD6Re0s0a0=;
 b=eNrbTjdlg9+cAE+nHaqwEekrx7Ad6M5gMnVcn4+qM3zmf7sOVwd4nOBDwWyqXkeuCm
 hDIoAdZHNW2YPUyrKYkAoaAyzZ7zmiXTmGlpGZvIkXelIjWv7bWMCaBbE/8RPQUbTSQ1
 rwr0xLADGWf9X1U1YQrGSPb+KCc4e9161vZKsvsj3ItiJBbwVccT8hWNpE9wYSeO/+Nb
 6KLLHwyofpEn+qwqsvcRBJVJ8x86+Vuc06wZFv87ikfdYJEmJIe7fmMnkmTlk1RhQ/oI
 uCwnfQJLzZb6q8ZwNrVpzFO3QkK81hTWboBs0YacetR/oZFi5mw2jzZTVeNjpij5pZ79
 rjGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8OWnaPFXUfxux6lRKUSUSSudViGITcQjvcZDO+LNbIl7OdNXWU5p09cOIDPF8eIz/salig3ugoOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxgjHzcNwXTfxRXE53dmAbclexlVbVLeZc1fTma92Ahs9TNnXU
 0zWPlVhBFRGZqYxOuyQO8L1AlGVINSoSPL8/0vMMcEtuk32g/B9QfuHEUPMB1hepb6xNJIkCDHz
 0VNhCo2vmN3X2Ei5sZxcYBH7daIe5lc2/jA==
X-Gm-Gg: ASbGnctvdMAgSB/useb33B9zmemCi+/InXVhbWDsM8rw4A2qj39cWFVHwwrov0C2R1m
 HnE7j3us56yzODlpgDGjIKQjoZFWbkftQtwwqaat4Nf183BtbASFi6RR0o9ynNTdyaO5q0Mc5L9
 dpz0WHstcRr+WDleyDMx7HkqUm35ZRmE1zDZdcrO2w86Cpf89+oGQCa+tRoElDIdF4nDsF+/7jj
 RIPjlM=
X-Google-Smtp-Source: AGHT+IFaWgOD9by+SQ/8OLiq6kJGXw7bUcexKwbwE1tkiknVjzj0JvoqLxDv5KO9XTlV8qM2PQy9fxP6box6128CsLk=
X-Received: by 2002:a17:90b:1d92:b0:327:e34e:eb01 with SMTP id
 98e67ed59e1d1-327f5b87d56mr1856537a91.1.1756492021824; Fri, 29 Aug 2025
 11:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
In-Reply-To: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 Aug 2025 14:26:50 -0400
X-Gm-Features: Ac12FXwPhh5l0LhWYYCLOfE636IYJClXvYP9fxX_dVOB1qxyhYB1RRM4ov0IJYA
Message-ID: <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Borislav Petkov <bp@alien8.de>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Fri, Aug 29, 2025 at 1:53=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> Heya folks,
>
> this flood happens with plain 6.16 on my workstation - haven't done any h=
w
> changes:

Have you updated mesa?  Looks like a userspace change.

Alex

>
> [   29.094609] evergreen_packet3_check: 115 callbacks suppressed
> [   29.094615] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106737] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106740] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106742] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106745] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106747] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106750] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106752] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106754] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   29.106757] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.579786] evergreen_packet3_check: 29 callbacks suppressed
> [   52.579792] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591825] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591829] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591832] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591835] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591838] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591840] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591843] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591846] radeon 0000:1d:00.0: vbo resource seems too big for the bo
> [   52.591849] radeon 0000:1d:00.0: vbo resource seems too big for the bo
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
