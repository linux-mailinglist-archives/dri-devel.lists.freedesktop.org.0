Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD209B4B15
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4757C10E65C;
	Tue, 29 Oct 2024 13:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XY50Bt7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A540210E65B;
 Tue, 29 Oct 2024 13:41:52 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-72088a79f57so149345b3a.3; 
 Tue, 29 Oct 2024 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730209312; x=1730814112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4568fy1CyLu7ue9QZlYfB1BmFVst9PUnOLzhnVMfc4=;
 b=XY50Bt7Iwvu4JL7vhtPpStlBFWKXMd/m4Bg8r8LQnU8IYBqooeTxCpsWtrkfXSLVXV
 DWvjvlGtCZhfUJBYTKPkOrRGz6WYH2j90EaW3sr0JQhOdg/115h2gXO2mw6SpsdtD/Fu
 qGgOw/5cKC23tkMHfgFPFyTJhZaI1X/dGCsTfqsenqmGXqMA0MK8hLIAgP/1lxzzeIDB
 3DjeL/pYdpP4AhGYVOzFaFa6Qzk7fA7cdy8RKygMy9Cp73kK8qXFUAvjKERmWWhwmIjY
 W4Z4mkTu8XMVM+kYY3RKPaSITRNOuEFGW6GOQOqCVbsxFVLt8M4MM2X3WIVGQ/w63AGS
 uYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730209312; x=1730814112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4568fy1CyLu7ue9QZlYfB1BmFVst9PUnOLzhnVMfc4=;
 b=AMcNildcPviUVQfM2KQeTM6mGKh4BpgaYJ8WazJ7PR9I+KtGxJYR3TMUKSvUp2r1ga
 9zuAYYeX63z1s2mN5Qq1YZwaMynyEWxmGlWGq9CPQMLsPYIAO/V2Y4kUT1HG7OymR+OS
 Nk0JaHd3aUXDDsDwTOVjO302Le61XGTo/HWF+Cx1mzVBer7knqwTazGgBU+yDf/kivKj
 X2lUpB9NLp5LtPmHncqWNBiF505PGU6U4QaLc3QBkVRBIHtwEirUy6d8udmnty+hFsEl
 0Cz5nDlswkghBKx+f3ccdmemCDl4560Ce3AiY9GR2DAN+C+ug53kQOiW6t9aiK0Omlsk
 wbCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEfCpa1eM3Gv2MV4lJk3AXsJAXZzHtc8Uxd/U4gQ4hhSPUAgavak2N9Pl/6jFFmqDcBFoI1cqj@lists.freedesktop.org,
 AJvYcCW6s5yypsPhIAoEJ2AHqMoNhzrbX3f4QDPLhI/UduiDSszpA15wU8cIh610AeLhxBB3CrnevpJVgNCA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvkDb2fs2YMXc/aATFY4N2qJDzPZ2olTf5SxAO4giJtSQFCHRK
 +FCB6hXICI2U6G61p8mnmEmz99mVUDabOeLnDf6ut9mZyzdffdcUd5KhIGKJQrQ7rIi32DrLTzy
 3sNmp5c/dlDsXOY9tCxyqLVGmaE8=
X-Google-Smtp-Source: AGHT+IFUBsAPh3iVaLPACK1QaY6fyD7GQy1DyI+2ph/A/x3BuCmAIUM7Q46z+qAua5Rfh34UsSxy0OmVdBsf5SeHV7U=
X-Received: by 2002:a05:6a00:2d25:b0:71e:658f:c43d with SMTP id
 d2e1a72fcca58-72062ed3c37mr7171390b3a.2.1730209312110; Tue, 29 Oct 2024
 06:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241027140537.503264-1-prosunofficial@gmail.com>
In-Reply-To: <20241027140537.503264-1-prosunofficial@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 09:41:40 -0400
Message-ID: <CADnq5_M4QwRfROybHrQfNuiXNhHH7VFAUVZMWkriwZs7K4KLUQ@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: use string choice helpers
To: R Sundar <prosunofficial@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, tao.zhou1@amd.com,
 kevinyang.wang@amd.com, 
 Hawking.Zhang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 luben.tuikov@amd.com, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
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

On Sun, Oct 27, 2024 at 10:18=E2=80=AFAM R Sundar <prosunofficial@gmail.com=
> wrote:
>
> Use string choice helpers for better readability.

I personally find this less readable, but if this is the preferred
method going forward, I'm fine to take the patch.

Alex

>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202410161814.I6p2Nnux-lkp@intel.com/
> Signed-off-by: R Sundar <prosunofficial@gmail.com>
> ---
>
> reported in linux repository.
>
> tree:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 master
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c:145:8-12: opportunity for s=
tr_read_write(read)
>
> vim +145 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_eeprom.c
> index 35fee3e8cde2..8cd69836dd99 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> @@ -200,7 +200,7 @@ static int amdgpu_eeprom_xfer(struct i2c_adapter *i2c=
_adap, u32 eeprom_addr,
>                 dev_err_ratelimited(&i2c_adap->dev,
>                                     "maddr:0x%04X size:0x%02X:quirk max_%=
s_len must be > %d",
>                                     eeprom_addr, buf_size,
> -                                   read ? "read" : "write", EEPROM_OFFSE=
T_SIZE);
> +                                   str_read_write(read), EEPROM_OFFSET_S=
IZE);
>                 return -EINVAL;
>         }
>
> --
> 2.34.1
>
