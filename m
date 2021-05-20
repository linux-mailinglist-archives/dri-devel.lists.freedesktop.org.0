Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DF38B752
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01966F503;
	Thu, 20 May 2021 19:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADBD6F501;
 Thu, 20 May 2021 19:20:19 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id z3so17423149oib.5;
 Thu, 20 May 2021 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PfgwTVkMgiwTa2ZUJi4Rqpy4DzXkVzihsc1UndFlxZA=;
 b=NKXl/O4Ah4nhqRZkqVf7JWT06B7xn241Wl6InCIzbJbLIuLi4vfTnaDrtlDTjxDQVi
 n30NCGYnAoGxnSG/VWuWTQ+YK7PcX9F9m5Xpy8FvszrYZNU3ITT17+QkEfw/+eCQ+Pkt
 mLk4rneTHZwhebapO0piSnDF2/cEBjYQY/NbDQitSmHZSiZ11NWAPqW8C3iOPpcFafJN
 qCP9cMoArj2JNtrRctLNjX6fyLtrTmYEkwu0AHzbJOi4N+RnXc2su55cSnse9MAWxLBJ
 z0h7NrAKCgvhrjjYExJ3ftsS1HKoD+9OnT8mPmjAez+Vncw+mZOevxqJhe1TsUGEAEbS
 mq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PfgwTVkMgiwTa2ZUJi4Rqpy4DzXkVzihsc1UndFlxZA=;
 b=OXg0BI1/007PQW2R32UChj4yZnWguun+NMudKFz3udskPsce/hMNMjWg+ejEQ4CmPI
 uHXbPyIP9MQiIUJqToLEG98PIkP3ILTPLqPyX50yXCVYcAWQQJBkxrAVIxKs5O4LjMN9
 RtyO3wTWBgqIODXVrh97M9U/pnl7jVNkzTSUp6ho4B/sbBoad0srTrRt6LeXLqbh8GYx
 vmz5pT82Nmkrv7wlOnev46/ojiBOPiNa+pnGnkWVuhsZjqNU+NSRPy1H1oYiOGXsfotn
 0f3KweDqe5whA8rcjlx6mNF4OUYV4Gcrc6eH+gaXcJpoWDoXRHbvBWRoiFDuPytIFLSP
 WsUg==
X-Gm-Message-State: AOAM530ee/Q1j8MKKCnGQQDMrW88MExKfy/B3L6lg+8rWSiJ6c5IGpW9
 jnm3YyUYVWLn2ukSzRtEb69hn/YkqSyOWhTsh7c=
X-Google-Smtp-Source: ABdhPJwvc46ikCv5xL8krtN+XasKLQNxgGwSb0z9zUHEbeOTG8SunshtMqXtCUQ8+ULgPYLiJCxGyKV39ZYg0zNwFbc=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr4203881oie.120.1621538418645; 
 Thu, 20 May 2021 12:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-27-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-27-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:20:07 -0400
Message-ID: <CADnq5_PaefTWkWnOPTJMTgL-zocXtB9wGnK30PiZG2iNAA=oOw@mail.gmail.com>
Subject: Re: [PATCH 26/38] drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste
 issue
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

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:955: warning: expecting prototype=
 for gmc_v8_0_gart_fini(). Prototype was for gmc_v10_0_gart_fini() instead
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
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v10_0.c
> index f02dc904e4cfe..105ed1bf4a88c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -947,7 +947,7 @@ static int gmc_v10_0_sw_init(void *handle)
>  }
>
>  /**
> - * gmc_v8_0_gart_fini - vm fini callback
> + * gmc_v10_0_gart_fini - vm fini callback
>   *
>   * @adev: amdgpu_device pointer
>   *
> --
> 2.31.1
>
