Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A219038B78B
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A266F515;
	Thu, 20 May 2021 19:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8F96F515;
 Thu, 20 May 2021 19:27:03 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so15845675oth.8; 
 Thu, 20 May 2021 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R+7fnEf5+D7P9bpLMhivSuEMA6+dJMHLKzG/8S3WGrk=;
 b=nEhTq9xZXBPLnP+28MBTDWiVpvaDNpWS2ZczCd0MemXJVUJDan/EB/QsRfKAVgHtqk
 9nedqwj7u2ThftbxV3kJpB9OW8gj97IZqSFADRpdpIzl9HLYGeXI4dxnSvPPv2mSjEIw
 0Skpj/hMdFgEXs/rps5GO5c17N/bDNgorozvQVsNP6BT52pdghhkTLuFRiU1fNlvultR
 m6UPNyKCBP5ybL7fSglsonYILWwqbEcxt4bC2xslsC3YUeaNHWtoRwJCZSZBpyHTVqtb
 ILeKIYMHcxzh3G2SsDba2+szf1x8008VtB6zbIi7eIndnVQmP6qEUWbe0JAKbJpChE1R
 KGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R+7fnEf5+D7P9bpLMhivSuEMA6+dJMHLKzG/8S3WGrk=;
 b=iGsW8jNcYqIyU99ogV5q624KQC2Ia//CKeUoomA7s971GFxarFNu4E7ESSt4qQN+bx
 vsfUFYnyvx+Tm228YOkKS5h6pSBgMUHDv8ySThIQ+eL5Lgikl41d8qmx+bCR6T0Pd1/3
 9thfmL5V5vtwZMRpjksmjqDrx2TK5Hhu5Itsj/W9VhQJ1fstsOdsTHl0aa/ziLyGWLuU
 Xn0ZILP5o+ulf5eRttiEGYNQrhaesv5lz4MKKZOW03bLXY/zsM/BQZ0AT/SgGvIsbMMM
 ymlrvG6CB5pNe/W1MpNZGOkvxiLa91B1/8PfIA9VaW7LUA9xbhCq1xtQD4gFQztyObBI
 Bo7w==
X-Gm-Message-State: AOAM533sRQbxIrIFCbiOdtNhZWGk9cUbdZwxGZR37a+peIVT4k0mGTlf
 lSEUa2StGWwLvCdrPm7b5lhOL9Mv/jD3yGxcCkw=
X-Google-Smtp-Source: ABdhPJwoiZrUETM2yFPXjegPd7djCrTKyeTo6WbivlDrp6LYzG0wufjvHh04Km1QUNibBmSLKIy7aZ+maj5RPBkeb/I=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5162050otl.132.1621538822372; 
 Thu, 20 May 2021 12:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-39-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-39-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:26:51 -0400
Message-ID: <CADnq5_NLnfGYuoz8+1z=q1Y90Re_XCkDHREoMZW2so0gk-hwwA@mail.gmail.com>
Subject: Re: [PATCH 38/38] drm/amd/amdgpu/smuio_v13_0: Realign
 'smuio_v13_0_is_host_gpu_xgmi_supported()' header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c:99: warning: expecting prototyp=
e for smuio_v13_0_supports_host_gpu_xgmi(). Prototype was for smuio_v13_0_i=
s_host_gpu_xgmi_supported() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c b/drivers/gpu/drm/a=
md/amdgpu/smuio_v13_0.c
> index 3c47c94846d6d..39b7c206770f6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
> @@ -106,7 +106,7 @@ static u32 smuio_v13_0_get_socket_id(struct amdgpu_de=
vice *adev)
>  }
>
>  /**
> - * smuio_v13_0_supports_host_gpu_xgmi - detect xgmi interface between cp=
u and gpu/s.
> + * smuio_v13_0_is_host_gpu_xgmi_supported - detect xgmi interface betwee=
n cpu and gpu/s.
>   *
>   * @adev: amdgpu device pointer
>   *
> --
> 2.31.1
>
