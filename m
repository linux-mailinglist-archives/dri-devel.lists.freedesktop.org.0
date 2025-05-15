Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C519BAB898F
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A75210E8CA;
	Thu, 15 May 2025 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bQDHhP/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5025910E8CA;
 Thu, 15 May 2025 14:37:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-231c88cc984so521035ad.1; 
 Thu, 15 May 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747319851; x=1747924651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yhx/trwlq7m4oFPBZzH0TmWWvywnM8oewCNJl0cBG00=;
 b=bQDHhP/2R7eOWmBv8PJCah01cScSi4nms49+zWj/bzNARwqqBCGOJyc7KeNyCMvogF
 OcR0pPVAbB4cT9/pUqNKCaUwMN/Ejg2dGI0h9Y2nWxsYQdRVuFOR40b8HYLu2HJR1JrK
 moe0rGi1Qb8nF+L9raSZ0vBWj4PBGIc69WJ/Uj0I+ZiW+ohCl9VyE5XSB2So4Tx81/Pn
 3nQbkr4VHjrkAU3od+vBEWZTg3MRk5LzaecVrIv6ynzJUAcFiVi5ow4QLkmd/A20EDVM
 xO5EzmB89PZYsKxDL3SeLM43wu0vZ736YlFMMIj1b6t6BYPfA4J+1yZlrzAe83In/c3P
 MKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747319851; x=1747924651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yhx/trwlq7m4oFPBZzH0TmWWvywnM8oewCNJl0cBG00=;
 b=guWP14Ce9GfLQX7DHgiBLcq6nyHYmAvWSAzjH9ZbjsCuN17pvA7pyPT+OnglFRHGHK
 h6N2EmLcYvkN/JsUDD7lGvojsZngzVqc2T7e7GmDaxEOtSb7EWB9Guw81pZ8HpYKDwkt
 YL7ejbDnrkXlJV6otgi0saimXqSkinJV5KFIA4EHyU8wdRdPPnbNU++4CF7bWc9a7CFn
 BQFBsi1HGKOVB0ca4RNvbI31JZaAmG9Ld8IkMlxhn35Ox1pF1Ueq74S4HGFatOabANoJ
 bRyi3j23oa6AsG1lFPfvaUYNIFtBbNgsGCQh7acwFNL8vi8WhhC7Qc5n40y+9GXpzENE
 3pKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBJpm7PAhz0jFqjG4yFc+eSp4oeQYo24ehINt63Gowev3Mf0x4YcAI1r4DCJnj+TgSZq8cCYjD@lists.freedesktop.org,
 AJvYcCXoRhrJ/nNber2Zop+bz93K5B4LhQYjK9jEpRHCu9xK23iPDuO8B+F16ZuowcVraIGyzbbrmLBCg4I+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+RgDonNPEisr4eFcXU6Wa1hZKl/+LX2MKAGbqhqXPDIS3qCyS
 yUzsOWIFqz6vG827PkXWxrbTTAAhGsILmWADgNBMwoTMnp5xYqoMnXGeVGmoIBU7eBOsB1w94nz
 iieKzxtGU3P3ojH6lfpiTMMqrAcE=
X-Gm-Gg: ASbGncsubEN8MXOrzQXowCT8CuIKhu4BEG0WrZZnZZelE6HXIKdC6d4I4/UIa6PGI2U
 S5vqUedoBJb3dwjBufOx0cg0r5q9sZnLKH4dnY2arkJTSIsUsOwfwC4eCGqhuOVLSSeFcME0Ql4
 m17VnuNt8tjiLr79DvNjAaYQnxvJ7YmDOg2w==
X-Google-Smtp-Source: AGHT+IE6YzckvATVsA8ojqUKzTuHbFQEbdpn6dyEbZwwrvVfuh9yZqbs6GMEM12xPFjFO+94qbP7aQBl2ClYYnEZHX0=
X-Received: by 2002:a17:902:dac9:b0:22f:a1b6:4495 with SMTP id
 d9443c01a7336-231980e4054mr41337035ad.5.1747319850679; Thu, 15 May 2025
 07:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250514213511.380890-1-rk0006818@gmail.com>
In-Reply-To: <20250514213511.380890-1-rk0006818@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 May 2025 10:37:19 -0400
X-Gm-Features: AX0GCFsggvZBkjWGjCTAgk5MrozCZH-a5UHDUJm9gsAKzfN3QltHqMR6QfX5QOI
Message-ID: <CADnq5_NNRfTM-Cb_bvtEQcLRE4LXh7Uf1Pp1+chCtfRmee0aug@mail.gmail.com>
Subject: Re: [PATCH] docs: fix doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK
 in amd_shared.h
To: Rahul Kumar <rk0006818@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev
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

On Thu, May 15, 2025 at 3:09=E2=80=AFAM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Fixes a kernel-doc warning by correctly documenting the enum value
> `DC_HDCP_LC_ENABLE_SW_FALLBACK` in the DC_DEBUG_MASK enum.
>
> The previous documentation was incorrectly formatted and incomplete.
> Updated to follow proper kernel-doc syntax with a full description.
>
> Verified fix using `make htmldocs`, and the warning is no longer present.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Thanks for the patch.  This is already fixed.

Alex

> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..ebe0caf1fda4 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: Enables software fallback for =
HDCP locality check if the firmware fails.
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.43.0
>
