Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C137F9EF289
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ECC10E303;
	Thu, 12 Dec 2024 16:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OrxqRG1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF51910E303;
 Thu, 12 Dec 2024 16:49:57 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ef9f17cb7eso67057a91.0; 
 Thu, 12 Dec 2024 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734022197; x=1734626997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ep0U+ID3D7MVAJ+LCtsE76Z/dmWp4CPTtQb6wuqT31c=;
 b=OrxqRG1q1QOiaksKV+OkB2CG8dliswjZZsEcuhndRnxOO1ed4hXm9Ya6uS8dnpCixm
 NvU/XhrIeTl9v7cO1e+CAlX/VcMMdn4tIHZNa8tpm/0t22YQJsrAyLrtOcM8SI/HDaYD
 swaPs64H6D2d6e/teU5XugOTm8L0IpPyhIMwp63K2BRRq7MnkUoGY/EVKsd4nqQkEXuy
 5KT846pNrJQn0JRVtb2QUkCKkyzOukE7wcsn6YPHkFV4t56iVv61V2onDL9hvDWNajXj
 zsZRaO4fQOvHgSkb21sjxamGeaP0KyaBd4UGY2d/687KEgp6BlcCxJBf6ktcbm2fJBNG
 5mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734022197; x=1734626997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ep0U+ID3D7MVAJ+LCtsE76Z/dmWp4CPTtQb6wuqT31c=;
 b=E26MiDhdgCrVJhdtpWQ79BxlsK9tSGN4GC5sgmOx3BdFst7KlnlqoTqEuHyExT4V0K
 lKOq66wbfstrrYZlt8EsDmXhXKgfl1vWDoEvKtJNaaWeGlNyq9bNpyeiGmbv/IIh6kxh
 f/0F0Cm1b/Pzcudevmdv89pBDqh+LR18PdwnrCFEZTSKjF8n2h6/gGK1Bhlc4x6KUNmW
 BfpXyZ68ACMYYuejolbOBnA3OeptmgU+/QRCCfveInLCCb2Nk369UM3/jLYo0/fvkPMV
 lH2o9uue9J/jyqJ1RtgGQ41+ikNxShtfQBL71m/LRYtf8BU7rbBs9OdzNRUh+TNp2Hdz
 Zm9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiFqLqW9N2WPQKkDmzIrCu4ca34HbZWsv4IluoRwesf6FErz/g2M0CJQKUMKR5fu5jS/FSTthfkdBD@lists.freedesktop.org,
 AJvYcCXbYOVEgsdYO1+kqiRo9gWa8UqB6joDwRBm8yiXZiNdO1ByLyZ+UYD8j1OH+ooOlRipUPQBqWgo@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr8n3xovlTfF9ymBduN0V/n1fdrvtEW+WvmoJJ3iQzvxMJpBv5
 w5GDtY/FMADfrjXUrIMIzRTrpVJETCVLQMmWb4YM1cPN59ErGXpufS/YOn6RNu2GB3K2YW5riXG
 8lXlLISQtDBiX27LiFD3vQ9HVEZU=
X-Gm-Gg: ASbGncsjQ2DDX0ZRv9F43a5rNi/MBR6LOY9a1FaxwedjyZltt/mA/tnwvh0YJokSXJ2
 UNjjeTuqUBs9fQkPGZ42coZMTlUpEwWPq4Wr6MQ==
X-Google-Smtp-Source: AGHT+IGQS+ajJVfdydep2zLW7YQ43auFsikDF5sJxBaTtkOo0qYDloNm6tM59UfROiINvuJyNUr523mafV7gsTyVoQA=
X-Received: by 2002:a17:90b:4ace:b0:2ee:f1e3:fd0c with SMTP id
 98e67ed59e1d1-2f12807b34bmr4185920a91.8.1734022197316; Thu, 12 Dec 2024
 08:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20241212105624.35877-1-dheeraj.linuxdev@gmail.com>
In-Reply-To: <20241212105624.35877-1-dheeraj.linuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Dec 2024 11:49:45 -0500
Message-ID: <CADnq5_OxYp-Q1ugfgJWvzAwe5SScykujHJrF4gYX0-ztKBn9Lw@mail.gmail.com>
Subject: Re: [PATCH drm-next] drm/amdgpu: simplify return statement in
 amdgpu_ras_eeprom_init
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
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

On Thu, Dec 12, 2024 at 9:18=E2=80=AFAM Dheeraj Reddy Jonnalagadda
<dheeraj.linuxdev@gmail.com> wrote:
>
> Remove the logically dead code in the last return statement of
> amdgpu_ras_eeprom_init. The condition res < 0 is redundant since
> res is already checked for a negative value earlier. Replace
> return res < 0 ? res : 0; with return 0 to improve clarity.
>
> Fixes: 63d4c081a556 ("drm/amdgpu: Optimize EEPROM RAS table I/O")
> Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?select=
edIssue=3D1602413
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Applied.  thanks!
I've dropped the fixes tag however since, this is not a bug fix, it's
just removing logically dead code.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index 0d824f016916..52c16bfeccaa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -1390,7 +1390,7 @@ int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom=
_control *control)
>         }
>         control->ras_fri =3D RAS_OFFSET_TO_INDEX(control, hdr->first_rec_=
offset);
>
> -       return res < 0 ? res : 0;
> +       return 0;
>  }
>
>  int amdgpu_ras_eeprom_check(struct amdgpu_ras_eeprom_control *control)
> --
> 2.34.1
>
