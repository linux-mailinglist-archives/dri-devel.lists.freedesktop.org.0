Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFF39260D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323496EE1D;
	Thu, 27 May 2021 04:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921A6EE1D;
 Thu, 27 May 2021 04:21:08 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id c196so3850855oib.9;
 Wed, 26 May 2021 21:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g3ObGWoYw8A3770dDfoAtEJd60ASO6sSETw7hq7iaWw=;
 b=jOs3/1jJupOalzeebxv4XckU9+Uu9UMC/mX+6ifUQ46qaTC0M/5bL7tZkCX2UZYODu
 gjR2CFjIrySHfkeUdf+ZsLqMwxDhghv9UDS9xWD4ty/L+uvKlpL5QJj/3/4s5LSrQ9h7
 sFVXC2ofmcrknmIAPan0e+iYNqsedzQLW529FdHYzR4qTd8P4QgLA79XgLKjBzRTaeye
 aBKoFNWbmICiMVRKzbfHhPlzEEbcszXkGs06yOIDu3APuchNNjH+oNyK163+l3B054oD
 NcM7OTxUYYcXGsZJFF5U/Ei4n8382PwTqcEgQlnE3JQ96J57UyPGajV5tqIi0O8q2gLX
 Clsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g3ObGWoYw8A3770dDfoAtEJd60ASO6sSETw7hq7iaWw=;
 b=oqGoj5t2p6Fh3+u3UIULcWIFPZdUPY0HWhTQJh6JC3poqANjdNnAGpO/CwbmV283e2
 yrJr7Fwb+tkFbM4ESBaPsln2QzPcI+jdnMPMRvAk5cFV3R3lmAceXdHi65k1ViZPLmH1
 foIIUlP0w1g7i/uFP26OxBkwkuWblmog2gDW1FZqFU3eU8Vz5S5wMrJF7Y4DVcMcsvY4
 IENDbGQTrWdTKZx/4Mty5KDAE2c5NvK6RYxNWbNZJfG8hB+RqZLTMjuOSzu+B/u0CWvt
 q7uAzf4kUwlIFKVOgF258AkLhyOTFDYE4wypZLmck0UU0zUh4ssCVX8foSp/UxVMXRFu
 VFfQ==
X-Gm-Message-State: AOAM530ZRQj7kgf0Im9TeLV6TBpOUv2G0NuRRysyilDpdkjAiCwhj6HJ
 cqHPt5Jz4aVF3HPQcwjB9qiZOIgAcIAQo2LMFAU=
X-Google-Smtp-Source: ABdhPJyz5ycopmTnjB2ZTxePhB77r9FoMwpQJutSgFKAIAc3x1USuW/E9yoOdo9oKVskhKra+DE3aZI7rmCir48ptR0=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr1068439oiw.123.1622089267401; 
 Wed, 26 May 2021 21:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-20-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-20-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:20:56 -0400
Message-ID: <CADnq5_NzewQQNd_JvZVKWibzJKL9GEQp9VD0qUZ4KdhJAmgY-Q@mail.gmail.com>
Subject: Re: [PATCH 19/34] drm/amd/amdgpu/amdgpu_device: Make local function
 static
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4624:6: warning: no previous =
prototype for =E2=80=98amdgpu_device_recheck_guilty_jobs=E2=80=99 [-Wmissin=
g-prototypes]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 4a040f89ca5aa..f15e180762d2e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4692,7 +4692,7 @@ static int amdgpu_device_suspend_display_audio(stru=
ct amdgpu_device *adev)
>         return 0;
>  }
>
> -void amdgpu_device_recheck_guilty_jobs(
> +static void amdgpu_device_recheck_guilty_jobs(
>         struct amdgpu_device *adev, struct list_head *device_list_handle,
>         struct amdgpu_reset_context *reset_context)
>  {
> --
> 2.31.1
>
