Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D094A0051
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEEB10E3E0;
	Fri, 28 Jan 2022 18:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BAE10E3E0;
 Fri, 28 Jan 2022 18:47:36 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id w133so13986272oie.7;
 Fri, 28 Jan 2022 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEjXoPAEz8WirABSDqS1VUwttblJowoR0W8TU5D2lVM=;
 b=KFRzjl5NTJdsPdkPMCDpbIuJjDHgQwM51Fs65bDH+tfGTW9KIaOqhdT5kG2e/5yRM6
 NArO4NpAK/BjldFJSm9O9IXDgCedtUpqaYjm7eRusR5xsmmq+08nP1KxL5757ynFlsDB
 xEcz9SSXcUPJwbN9PTuxoD87NTqsS4L7VKtcnvKbS21RqIvXcGiyX8oT4lpUCfG1h1tJ
 yxZu4nYQfbxv4wMay7gKh/sxgDsZbd2qp3TbtsmPh/OgpTKlsJuqlpKGibEKqF6tFS4r
 N/f4aEaRTx8eP5qY+zVag2yeH15isrxZeIK7YMYLLqZjr5B7PWbnODYOn3gT/F7rxArm
 V8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEjXoPAEz8WirABSDqS1VUwttblJowoR0W8TU5D2lVM=;
 b=jbXdZqTzChf7st8IdneZUcHWn8PgjgFMxiAlo9+1LHE4iUrEqHPfKtmq5iYPulNtmo
 5YJVAJtUHCc3Aqo4fIVsHeHfMprGcfD/+V8dQmDwOCsNdgTy78NCTj+Flxi7INtGvrtx
 FXQ4aba3ZTO5e4EQbtkESNNe4Sczir4lgKpYh5SlIpJ85o7H/gSCZVqN7+JZy8ToGXX1
 QYuX1J1iwxroM80tfK0Or2ub2SvZ/C7EzzrS9s0y/lK1rM6EswUnztHOdH2cjFn6qf+Q
 KRwTtP6x/wI9Td5KB8t3FX5P2NkppYy5Bjh6KnRl+A6y40eEQbAOpgBfxnkAj4mv/sr2
 +OTA==
X-Gm-Message-State: AOAM532CazsqLTtCTDMx0avQ726my2o5jD66qW/eZyrCTeIEFQ9sw208
 c73FaHIgW3Rh08YkLLn+GwV/2s6qNfb+WouKoSY=
X-Google-Smtp-Source: ABdhPJwM9t2ruoxdGjT3rJNiqxAPK3A1fVDMMJuvwY5Biz08JHaqoxdPUhurTw22ug6GZxDVXG4WGx9bVPOZ/vIhhGA=
X-Received: by 2002:a54:4e94:: with SMTP id c20mr6267113oiy.132.1643395655765; 
 Fri, 28 Jan 2022 10:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20220128070519.1210105-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20220128070519.1210105-1-deng.changcheng@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jan 2022 13:47:24 -0500
Message-ID: <CADnq5_O_RyzKDfaFE9zbEWgioAfoczDgWFtd9qBb5vwWLS9Enw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove duplicate include in 'amdgpu_device.c'
To: CGEL <cgel.zte@gmail.com>
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Dave Airlie <airlied@linux.ie>, Zeal Robot <zealci@zte.com.cn>, "Lazar,
 Lijo" <lijo.lazar@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Shaoyun Liu <shaoyun.liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jan 28, 2022 at 2:05 AM <cgel.zte@gmail.com> wrote:
>
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> 'linux/pci.h' included in 'amdgpu_device.c' is duplicated.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index dd5979098e63..289c5c626324 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -56,7 +56,6 @@
>  #include "soc15.h"
>  #include "nv.h"
>  #include "bif/bif_4_1_d.h"
> -#include <linux/pci.h>
>  #include <linux/firmware.h>
>  #include "amdgpu_vf_error.h"
>
> --
> 2.25.1
>
