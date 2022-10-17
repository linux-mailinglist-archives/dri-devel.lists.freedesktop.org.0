Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FD60128E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 17:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2FF10E517;
	Mon, 17 Oct 2022 15:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEB310E517;
 Mon, 17 Oct 2022 15:14:36 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-136b5dd6655so13614653fac.3; 
 Mon, 17 Oct 2022 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C0k/V94Hup9eBfg7SuZ2cCUb+ul85Fg6mc4OEJdv/0o=;
 b=IEovFP95JMex4zXL1DQ0svc0+EUKLExxkV+mGn9ZeW8ZmD+uPQk3KCWXdbi6usPiQQ
 hJwGqTiC0WcrQpvRXgjpclgnewXMVIWQC9bfvtBE0PDRO7d5LODnBzg+KwjT29k5T/zA
 H3r1ZtTOh0iNS9fKJJ+VBpDOsuFTFPfa1lwh4TnCoXFR1JdCRQ6q6fAr44drW9gYwaQW
 Gjr9QGr/M2/fJJjfzl+Jn9SECz7IxlODUjQKiuajPnSrDJ1BUJv0bu51QElJzP1Zjaok
 Jgd+8lx0onVelr7PUXSRnVy1cbGdOZT8S/giqPPaIHa6AN114Kum2v80fKztL5tqbVFM
 1UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0k/V94Hup9eBfg7SuZ2cCUb+ul85Fg6mc4OEJdv/0o=;
 b=AYaKC/zVZA6EyTqbwXSIRMB1Cb7KuSpJG92YwhhV0qu0zCnpgzDCZJqm3yC5OTJsW8
 EZfLcSFU5pwYXNMgH5GvDcnmkomO9LqYxGDDmkyQ5FiZmLArkTrvGnloKu4mM48mYNJI
 t7y55/+Ow+5NA/D+EWYzbUgExi06gwAZttKLPNY2abUKhQ4kcda2AwJhVuUuo0DVoRoi
 JCFjHR7BRheJ19ae4yfrzjJGCDn7jkIou773UCVCTRX7oeG10D2maJZLpE6yUFJEYHfN
 PWRjtlHV7FMu/SIZuw4z0S6hNNATIQMqCTTpM5sxjMeW1NqdPqstD3x4fzP+/nwN9Vi0
 AB4A==
X-Gm-Message-State: ACrzQf1/02gl/d784SVQTKe0CkPZ/HV3K+hWcA/72x/JrZQyaiyE4vIV
 Pcd26jTN0eIQYg/0xFxAYdRpsF8yMUUC1nB/Efg=
X-Google-Smtp-Source: AMsMyM4pTI888ntuHyVZaruicFUJcVFq9AyzsZI2hRj+fKOygSc1PA8aUQ27gw/7RbbP5lHotTjyLcWG9kyjTxWFX6k=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr6111763oao.96.1666019675897; Mon, 17
 Oct 2022 08:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221017090352.117843-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221017090352.117843-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Oct 2022 11:14:24 -0400
Message-ID: <CADnq5_PFgg=JhCzii=798zXmfjtatCWhWbYuMhDBctkmW6cY8g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove the unused function
 amdgpu_ucode_print_imu_hdr()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 5:04 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The function amdgpu_ucode_print_imu_hdr() is defined in the amdgpu_ucode.c
> file, but not called elsewhere, so delete this unused function.
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:129:6: warning: no previous prototype for function 'amdgpu_ucode_print_imu_hdr'.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2416
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> index dd0bc649a57d..148cc2d475c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -126,19 +126,6 @@ void amdgpu_ucode_print_gfx_hdr(const struct common_firmware_header *hdr)
>         }
>  }
>
> -void amdgpu_ucode_print_imu_hdr(const struct common_firmware_header *hdr)
> -{
> -       uint16_t version_major = le16_to_cpu(hdr->header_version_major);
> -       uint16_t version_minor = le16_to_cpu(hdr->header_version_minor);
> -
> -       DRM_DEBUG("IMU\n");
> -       amdgpu_ucode_print_common_hdr(hdr);
> -
> -       if (version_major != 1) {
> -               DRM_ERROR("Unknown GFX ucode version: %u.%u\n", version_major, version_minor);
> -       }
> -}
> -
>  void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr)
>  {
>         uint16_t version_major = le16_to_cpu(hdr->header_version_major);
> --
> 2.20.1.7.g153144c
>
