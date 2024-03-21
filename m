Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB8886143
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 20:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DAD112082;
	Thu, 21 Mar 2024 19:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iVg96LQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74152112083;
 Thu, 21 Mar 2024 19:46:03 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6ea7ea4770fso263981b3a.1; 
 Thu, 21 Mar 2024 12:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711050363; x=1711655163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vba/RjM6pvvbsfl0+e3q074Z+mH/WxL5U5TdVTaBNws=;
 b=iVg96LQuMD1d1qGG/i9akNIBINeLwWkffElfsag7adkK1ImAqaNfXjPO3VQ9dZI9h9
 BVcKh9fLISIxIr0dPTxkQ2G4K3O7Nshm3vnpnThsk1cdq/q70bGqtSi2Lf5f50gcjrZt
 /2+DpmRPvRq8+6StyfCYqX8B6net8DzftHxs27KUMfuF1RrXcHU6XikpJ/DXVt9xYhsO
 4YEawe5JEbhSnUVmQOQC2vsiQ3noBovwntdvcqj7v5+W23CN4VQ4ev5f4ad+IKS/zi5m
 RSLgZpz9Gpkj+hjf6FDlTZ9BcOW79vmEvgEQoA0w1p2BOH7uWR89Db1wYWBPZivXia3J
 MwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711050363; x=1711655163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vba/RjM6pvvbsfl0+e3q074Z+mH/WxL5U5TdVTaBNws=;
 b=OtZ4yk+oYrdt307QCr28mzJb/Wo7NPOU86OLbXWz5eMXB3oddihaqacjS7flxHVkmy
 18cxJqcgNlvLl52orS9lIUl93ps5m7Q+H3Nb+HlwdslYHbxvwaFJz4oB4/zeg0NbWovT
 sgshFFy+/TDAdUAmSS2c9OHwK3u1dP+5neWCRcsJHiSRF16EUMg65eBLBbKXPB1mHw+F
 /TtzbPvE9Bt0LfouKENsn7p3S79H1yFhQ132ih+0zGqJOCd1B5gyx4VuHSVjCOEQmFby
 Xl1dAlFKvzoSA13hK9DvTUbs3BnGGd0Ct6r5S6CP4WFGILk/1kxJ//umUc/JAunywSSf
 ebwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsNClGGsNYgjFmTij7hgR43Hkds5tZH9cdc3T5Xdvm+Inx2WXvtsDubIwtjMpSIKU/K04SeS17h7ypOsymYuT5sUesYN/1aQYhdYXbtasnhEbXZ9/rMcLIvz1qrySqYXLqNTnkZzVXlUps7s5kbQ==
X-Gm-Message-State: AOJu0YxFysmXCplePvBm3GIRYn0OdjGqbnTDeK6jGFCY8vjjXgUdPHH7
 KbrN/v/EPnHFw/fAJ/xktb1pmX9PAomhzPnFzhxSL5EsxNa7FBVBGoaYQbqqsgVEnzQTAhK4kyR
 cHZH8r3hqSlw1lMKtuA3HOr/PR2k=
X-Google-Smtp-Source: AGHT+IFzGDqp2c3xNj+jgmU7qMt5VRv/Iw4MyuHnNXDZd7os0Hll4oNTnqrKLXI/Pfvlyo6kM/qOIu0s8HeCrJArY5M=
X-Received: by 2002:a17:90a:fa0e:b0:29c:6146:6adb with SMTP id
 cm14-20020a17090afa0e00b0029c61466adbmr736759pjb.12.1711050362877; Thu, 21
 Mar 2024 12:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240321181403.1365947-1-sunil.khatri@amd.com>
In-Reply-To: <20240321181403.1365947-1-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Mar 2024 15:45:50 -0400
Message-ID: <CADnq5_NbOxav2U-hK8PGnsSymqKn_xjuxGtStjuHzWu_PjfPmA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix function implicit declaration error
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Thu, Mar 21, 2024 at 2:14=E2=80=AFPM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> when CONFIG_DEV_COREDUMP is not defined in that case
> when amdgpu_coredump() is called it does not find it's
> definition and the build fails.
>
> This happens as the header is defined without the
> CONFIG_DEV_COREDUMP ifdef and due to which header isn't
> enabled.
>
> Pulling the header out of such ifdef so in both the
> cases the build does not fail.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 95028f57cb56..f771b2042a43 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -74,10 +74,7 @@
>  #include "amdgpu_fru_eeprom.h"
>  #include "amdgpu_reset.h"
>  #include "amdgpu_virt.h"
> -
> -#ifdef CONFIG_DEV_COREDUMP
>  #include "amdgpu_dev_coredump.h"
> -#endif
>
>  #include <linux/suspend.h>
>  #include <drm/task_barrier.h>
> --
> 2.34.1
>
