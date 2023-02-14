Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B6696BEA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB03B10E250;
	Tue, 14 Feb 2023 17:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769B10E249;
 Tue, 14 Feb 2023 17:41:46 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v15so13586754oie.9;
 Tue, 14 Feb 2023 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uvbmejReXzVynWRcz0m5tOrs0kic+4HAMSMKJxA3af8=;
 b=XHUYwiB+VN7cKbV3Ik+Gz9WsNIuMCu0cs9XDglW/E/YrmkyHAnqkg/qqgaRqnIkoxm
 mwsGeOELo/7Hp5VDWnYjlcS6aWgsPTKWOQhs6dNCWML1gJ92YiGD47kyytvwcXPRpK55
 xVjT1P5cK5KuUwFYPqVheASmvqhPDUIjHCI4PnJ7ULP1Nj1V3FErhuvL/4ALhOyd5S2t
 EX/aGu7V3f5zoMGpD4YxEuCPPgHUAGu5YJXNCYa/2MdmOkgX3YnNEi2X1t2CuPJ60fsH
 vIWNUSAAmolxom4AmCy42MnxoBusChOJ7EAwwcoH3HlLJZ17XGnrNvv2tG3zTu1LNyZI
 IOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvbmejReXzVynWRcz0m5tOrs0kic+4HAMSMKJxA3af8=;
 b=Oqzb9zOCX6gl8M21lcHLc/ANjAzeFTFox0vmsrWMvMRZU+ZqGtY7rYJjDhh58sV73D
 rwxs8OnvUj2PRk1r6hDsA3JbfjxSSmAtC9FSG/5KaWImh4HapqbBEkvBijr4BlimuTXB
 oDGTIfKLEOepnvtTNiPwKeAo0y+GOeDx2OSjofiJ5OHKri4MR/fc4gIOPbA/E3rUPMyu
 8SyOnMVhl1KpFoy8ilBgp0EQ7k+NSwB8g4bURYWgfryWwCY9AWKQd/x2ahjQfhm/L8M3
 EjGXtVwwmWp0l10lg3EC0w9oKFr9uauEUV3+lUG0gaMM2ggy4D9tbF3ryHUCanMpbnXa
 nhrw==
X-Gm-Message-State: AO0yUKVZp9akZBPhofjJgTNKcHY0KdwoNTcZ+VZX3nejnC2fU88Mazi5
 6WEg9F7mVMYG4cNwocRAZN6+X+KiR29c3RzVeGQ=
X-Google-Smtp-Source: AK7set8RmHC9GCJHa/kN8CcYDIFNuFJNs5H8SQWFWv+TipKvwnQo1dz9jyjYkszsc/tmAmRFzh7dx2LZ3x2CdGvIJek=
X-Received: by 2002:a05:6808:a10:b0:35b:d93f:cbc4 with SMTP id
 n16-20020a0568080a1000b0035bd93fcbc4mr23878oij.96.1676396505738; Tue, 14 Feb
 2023 09:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-4-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-4-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 12:41:34 -0500
Message-ID: <CADnq5_P7R2X3ivKBwfdc=DVGYOp5UEh3O+=0CxK2HMxkaEK1Fg@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm/amd/amdgpu: Add function prototypes to headers
To: Arthur Grillo <arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Feb 13, 2023 at 3:50 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Add function prototypes to headers to reduce the number of
> -Wmissing-prototypes warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> index bee93ab4298f..b03321e7d2d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> @@ -538,6 +538,7 @@ struct amdgpu_firmware {
>
>  void amdgpu_ucode_print_mc_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_smc_hdr(const struct common_firmware_header *hdr);
> +void amdgpu_ucode_print_imu_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_gfx_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
> --
> 2.39.1
>
