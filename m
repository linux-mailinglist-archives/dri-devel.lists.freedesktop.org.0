Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19790F3B7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEAC10E078;
	Wed, 19 Jun 2024 16:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XgYWdLjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8CA10E078
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:09:13 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f6fabe9da3so53530875ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718813353; x=1719418153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/fhKeqXwdBabG9gGqODZt9AmUaxqtw5Yc5I2ZNbcZc=;
 b=XgYWdLjWDUOkYic+De8gHSIFWGQ6yowUT4hYHyjDqFZAC/N5voL7VMBIJ5m2xQ/6Ir
 baTsyk9NURlpYzAqCngbdlyNNJQwKqAg9j5zn8/JqijWdfkRBYgM9ysCAjCAwP4qlPf4
 OKUEPqRYTPerAjHyIcsdkjPgs606O1p4aZiUboSBmzYpN00PnXdQhbLAjvUFydiadq4x
 1VgX620FAjkooAy37ZAtbh/vim+KJrryiEk5LSjlXZQJC+KHewAil5lJxvumGp1yZ9Uo
 hqSoDvtRwQrvp3y/NMI6yOFOqGDvjk2e1klBsS3pX3V7YRCmG+7wjBjwSXq9/J3NEKLE
 BR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718813353; x=1719418153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/fhKeqXwdBabG9gGqODZt9AmUaxqtw5Yc5I2ZNbcZc=;
 b=qLpytocjC9MZn40DLsd79w6Dco7eIUdl8igTiWH+42pOZKwWnsm9lv66NsDB8dcLwM
 Xh2eaqL3A2bP7EJovK3JhVJBOe/OJ9OcpOgE2As7+oHskwm5J0oW2flOMkuLiG0Qj3kK
 Ki8C5CPJzDl9SdWTssuzN9HtUJNADrJkIUi1WEpluS8OnfOYgUdRzcOP5DOJVr99wOUQ
 Xz+KHSnILLxo6JrppT81NfByM7mhr+RCGKYK2oOVChZbwAa3jZy5/LgcCwesImX9+PHF
 WBBQTI/yeU5915oa6CmbRYalRnoxRSvYSk1vHtAS3Jg0HtkvwT3qGoKiv7laFujeKkHQ
 vrbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzS4eMYRYJN6Di++OgwQt7XvJW/u2a3gL9XcvvDfKo/qSjTuRzYBal7l2VuKbhLMZHl35CA5lcPkNw3XTijz7vrA20yHuEGgzczKZN5WjQ
X-Gm-Message-State: AOJu0YzEGXrVPnpru1jCQYZ+ISLg0v1W57ednLXVDfsJ4ce1eQau5N+p
 JwaxDHfQA/WKZ+gJolGgrOaEu8adY6DrqUsDtHiY9STDq15ylrTI8I/r/eLsuD+UYCE3L8Mvsf2
 oUYKXGMg/KV1qV7h8RaQQwOS487k=
X-Google-Smtp-Source: AGHT+IEDOiO473ys6Ak9efHr+g1BlO7WA4M+ocyDNSDATskVxTFHeVNwAibCrmrNOFTs8Y6xrWB6IY9qk92Bdt1hcDs=
X-Received: by 2002:a17:902:d2cd:b0:1f6:80cd:ec92 with SMTP id
 d9443c01a7336-1f9aa67e7f4mr30204215ad.63.1718813352875; Wed, 19 Jun 2024
 09:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <Zl7qB1YmMSd43hZB@amd.com>
 <e1ec42ca-7166-4efa-a972-1b4bef6b691a@amd.com>
In-Reply-To: <e1ec42ca-7166-4efa-a972-1b4bef6b691a@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jun 2024 12:09:01 -0400
Message-ID: <CADnq5_N3T6T-8iKrmdx=0L+z3+nd6-Mt7xJKKjrbNPoAE9SrYg@mail.gmail.com>
Subject: Re: [PATCH V2] drm/ttm: increase ttm pre-fault value to PMD size
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
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

On Tue, Jun 4, 2024 at 10:02=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 04.06.24 um 12:18 schrieb Huang Rui:
> > On Tue, Jun 04, 2024 at 04:49:34PM +0800, Zhu, Lingshan wrote:
> >> ttm page fault handler ttm_bo_vm_fault_reserved() maps
> >> TTM_BO_VM_NUM_PREFAULT more pages beforehand
> >> due to the principle of locality.
> >>
> >> However, on some platform the page faults are more costly, this
> >> patch intends to increase the number of ttm pre-fault to relieve
> >> the number of page faults.
> >>
> >> When multiple levels of page table is supported, the new default
> >> value would be the PMD size, similar to huge page.
> >>
> >> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Reported-and-tested-by: Li Jingxiang <jingxiang.li@ecarxgroup.com>
> > Acked-by: Huang Rui <ray.huang@amd.com>
>
> Not sure if there really is an architecture with less than 3 page table
> levels, but the build robots should be able to tell us if everything is
> fine here.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Has this been pushed to drm-misc?  If not, can you push it?

Thanks,

Alex

>
> >
> >> ---
> >>   include/drm/ttm/ttm_bo.h | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> >> index 6ccf96c91f3a..ef0f52f56ebc 100644
> >> --- a/include/drm/ttm/ttm_bo.h
> >> +++ b/include/drm/ttm/ttm_bo.h
> >> @@ -39,7 +39,11 @@
> >>   #include "ttm_device.h"
> >>
> >>   /* Default number of pre-faulted pages in the TTM fault handler */
> >> +#if CONFIG_PGTABLE_LEVELS > 2
> >> +#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
> >> +#else
> >>   #define TTM_BO_VM_NUM_PREFAULT 16
> >> +#endif
> >>
> >>   struct iosys_map;
> >>
> >> --
> >> 2.45.1
> >>
>
