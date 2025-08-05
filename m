Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A7B1B2D3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 13:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D7710E65F;
	Tue,  5 Aug 2025 11:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j68Z3Qi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053FC10E65F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 11:54:08 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5392ba07940so2804362e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 04:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754394847; x=1754999647; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nMWT2yAkC9poiQmiDG3Eme4KwKIo8NaBao5tQDa3Na0=;
 b=j68Z3Qi1U2KhpDMWrUINtafS+ZXehCV/2e+SV7EyEUCBf5A2MF2qB4Wk1Dy5EYoyeQ
 iqR1UvhXBqcr7G24pZDoRE0rOMFT9FkX28xLanLJuNhHrYEzl09hsPDqB7q2VW902xW1
 9blAzR6i5bXw4CP/bE2udmTQr/m0TYgJTKAlPbm4UspjMH8Dx3818VWqHEB07dAuEbHE
 h2Xk/Wh1KsHnRoIAIezYqyJxkXE4S/zjiGNv1AMLceW32WIDxhqepFIFRgqrW5XSwIRo
 GQekVCufOYGlFsIESeSkBjbdEy/5zcbt3JXTXxjvhNptlQWIn3b3w0FgBu/BoJaw1lSs
 e82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754394847; x=1754999647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nMWT2yAkC9poiQmiDG3Eme4KwKIo8NaBao5tQDa3Na0=;
 b=hFgKr3fLj6FXallrOadW481hZrWjWKWXK7qBW8bYqbIX4vC9pfCT7xqHUc719hrvem
 IMKKUEXloiH6wqQkL+yKCDJP+Gd5cXC2DVTs61TvHp9+mMHw2pPFJOAFX6zyDxB5XW8v
 5iD/hrGZBOwdM+CL6hDSM4VTyK48XxOs1ADA1CyNHU3tsBclfUbC6DTicD+MEswYTYmz
 4vrJHWPjGgQkMO6Nds0YzDfAXWh48bJ9sho+/N24mXVZqHZn7MjNidMtDsRrGs3fJj8J
 gXTVuea68KeIw5kryI4V32BmH2jGmVg+MrL5Q0M+qmhuLPimqiobBhXLfBGWi5/GtLd4
 DDzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLE+W87cDlrNQ8f8v0AW0RMer3rLIsxZnpJrkzFtj9I5md5qnRQ1NPm8mLvBzPqCdPDzIUZcBMX7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDJ+R2HjHxCSKOCRoQ1+kUSEyBF/eQvG26nlKaUb4nlrOencGZ
 FjwrE2CpobalHVRVt3nMAK2aZnGbVqIi/fZUxD5UNKk50AM/kvKGaLeJEGfS4/O2S4cZ69Vc2dp
 4KX7LtyPvMCBePZdnRN02IhB6st/a9f8=
X-Gm-Gg: ASbGncuaEa4edq9lnQRkKFDugyM+1qkzgmxdPZ/Qa9DDTiqtIkaxLtJhwX93SXXWEtu
 ZpEM2UC8EZ2+db6Nx9mJKWG+9H9pRkGnaG4z57M8EEeB5wrDehnplgo+ooGX56GAxOiFggtX3of
 3QBtyftscyyfhlyVFstu5caGStEbqmKBpYyL9YIeYCoWSpKjZJpj5Bl5U3NpLRp0ES1UN1/3OPN
 C/cNkAVLyg8PZY=
X-Google-Smtp-Source: AGHT+IG2V92W0l0OwpbZeUfC3F/wkgbkb/9IsXo1nWVQk2+FSLJEs2+4PjRH84lDaaw9wrUSA24ZzgN99lkxqM+ysDk=
X-Received: by 2002:a05:6122:3192:b0:539:58c2:1e0a with SMTP id
 71dfb90a1353d-5395f19a9cdmr5983593e0c.4.1754394846516; Tue, 05 Aug 2025
 04:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250804212902.22554-1-rampxxxx@gmail.com>
 <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
In-Reply-To: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
From: Giant Sand Fans <rampxxxx@gmail.com>
Date: Tue, 5 Aug 2025 13:53:54 +0200
X-Gm-Features: Ac12FXweqU7nV9K56xaxh8ocEV9BLO_mODDYQxsm2W9z3W52maWYVlrxOG5FvRY
Message-ID: <CABPJ0vgz6gib5LdKY1O6uhPq7Tk5GN2X_dcGBwtx3b=TRQUw-Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Add directive to format code in comment
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 5 Aug 2025 at 12:49, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Aug 04, 2025 at 11:29:02PM +0200, Javier Garcia wrote:
> > Fixes the warnings:
> >
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.
> >
> > Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Fixes tag?
   Sorry, what do you mean?
>
> --
> With best wishes
> Dmitry
