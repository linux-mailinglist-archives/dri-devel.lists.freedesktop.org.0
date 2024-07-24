Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D321793B553
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E1710E769;
	Wed, 24 Jul 2024 16:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="coul+5+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AAB10E76A;
 Wed, 24 Jul 2024 16:55:40 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-70d162eef54so2749783b3a.3; 
 Wed, 24 Jul 2024 09:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721840140; x=1722444940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lz1eZFacofG50PzjABJcoZwyNtMnxyd2cyFpXgSDLu4=;
 b=coul+5+4AVQohAWbhMTDlpy7Dis0bXO1on3GbFmnBi1YCFWh7cv8+pcGBqnbpeBcd5
 jwSENFI1CgU5rtQEf5ZPcQuo3BzKAONxiTD2vdudFQ4Eb24AoqCAPZ7aiqpReWNFnXIM
 ImKGtgiPeazy6MhKWscTOEh8fXlclN1ntcIIn0ldCQAqRy7D+/s1dePpHRbejyXxt+/D
 G7OHTdOh9R7++f/Y/HL+xW6N78PJMDJfwlDGA5gwwT47Auo/28mdhO5FMjMj/Ps010KY
 ILvsUyqlSYwDLJ08Ro1Z0odO3FvRSMmFkaO45YjXAS3iy9Io6ZbqBDPqovoiamsUrAG2
 2PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721840140; x=1722444940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lz1eZFacofG50PzjABJcoZwyNtMnxyd2cyFpXgSDLu4=;
 b=VEPIqlfIm88ytsDi91nXKRgiZyoAdQdiMOkuMSBrixYouswHVohaD3RmZGkxY2eoUl
 R9kaiTaj0qgKI/PwBM3aID/2ftxtvinp8Sz4x+FzhPy2CrfztelGyOkPUR2Vx1JgfGGh
 g0BWOJF2qelSVr00cu08w6jFfuBgvyBDR/+8RoY7jswFDZgcL/FkwGTgCfqteVJGmuDf
 NkUA7DM9KwiBAc+/1kenpwRNUxBDHZSi7oCmSaDyD98ebjEHDb00TcQnXdUfizVqQCgJ
 Hp5/8Q/ux7CxcsBpepU4Sd7h2kW0JKMLyvsNb2pTbT3J/9c87nqjrqgvO87CykvQ/1Sj
 xJyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7G4GvW+CY2yviF/Y7f1TLpYu0AVfA4ekFwgXehkCcSn7Kks5eVG0BJ/RJAa+asgUEhPC7WWQCZRPlpJMibzRVw+4vevNvfKjTz2V/+o2LZXmd8aTUjWEFUsNuST75vVRS2Zps1OKHKdQ/25LibQ==
X-Gm-Message-State: AOJu0Yz5zi9JHL/Z/SsPEkeAj/iw+KKKtk75cc3cFZlkSY3lIxt0ZKK3
 FsJ+rTyI2VPM9iEyE8edensMBocIA87XhDGLpnKVUJAuP9CCBhsfqiI0/1TXAq0FZvi4c1bdo3l
 BkO4BfRgbvAVU8d/LQGOe9xcdkaONpQ==
X-Google-Smtp-Source: AGHT+IEI/jYWEqsiZsqhBV9hscFEVHePulf2aw0vBqzWx/Df2tLi6FgJfCRqF8NmHRQV0P//V5uvwg4rUzgjAjaolbw=
X-Received: by 2002:a05:6a20:12d3:b0:1c4:7032:253d with SMTP id
 adf61e73a8af0-1c4727e2f31mr626089637.6.1721840139863; Wed, 24 Jul 2024
 09:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240724073749.14338-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240724073749.14338-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jul 2024 12:55:28 -0400
Message-ID: <CADnq5_M=Vy7g2zFCpbUEY_Gb3S7zKvfPCUxqtyT-_7ZTXatu=Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: use swap() in sort()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Wed, Jul 24, 2024 at 3:38=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Use existing swap() function rather than duplicating its implementation.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c:=
17:29-30: WARNING opportunity for swap().
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9573
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c    | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_=
pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pm=
o_dcn3.c
> index 717536d7bb30..8e68a8094658 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn=
3.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn=
3.c
> @@ -7,16 +7,12 @@
>
>  static void sort(double *list_a, int list_a_size)
>  {
> -       double temp;
>         // For all elements b[i] in list_b[]
>         for (int i =3D 0; i < list_a_size - 1; i++) {
>                 // Find the first element of list_a that's larger than b[=
i]
>                 for (int j =3D i; j < list_a_size - 1; j++) {
> -                       if (list_a[j] > list_a[j + 1]) {
> -                               temp =3D list_a[j];
> -                               list_a[j] =3D list_a[j + 1];
> -                               list_a[j + 1] =3D temp;
> -                       }
> +                       if (list_a[j] > list_a[j + 1])
> +                               swap(list_a[j], list_a[j + 1]);
>                 }
>         }
>  }
> --
> 2.32.0.3.g01195cf9f
>
