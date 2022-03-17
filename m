Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8644DCF5C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 21:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C252D10E7AD;
	Thu, 17 Mar 2022 20:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EDE10E7AD;
 Thu, 17 Mar 2022 20:31:34 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id z8so6851824oix.3;
 Thu, 17 Mar 2022 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V4LhBNYnhdygc0CZZHH2ej2UF+qrm4ulwWEIxzmxAaw=;
 b=dar6Vs3kjGkCthhBYvhfxSifJx9V/Ldg9ALQfn/DAwU7An1VoKquqdZhbmS/6Yzub9
 QbqN6HXQaSgE3UTOC0oN+gejpLxQxIFQkHjs8hplnYWwKhvOvUAvtID/1WYMBW9s+t5h
 dTBX6BdaXctfugE6/4qMa0PCgBsKKIMaBFLkf334qEAK3CI2SunnI+cHHTIiE366YE7U
 taG1Hr1vOdFfqhube0rpis+ncHTP3XYWtFQIVMEcqqd4vGE0gXF8mOngvwLnnTHCxDFj
 mjihcCmduqABv7XB10XJxA/Sp8ahuxiqPMTgjGm81S3JHjZhWiNjjWLPcxXiV6NpukQY
 h3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4LhBNYnhdygc0CZZHH2ej2UF+qrm4ulwWEIxzmxAaw=;
 b=OLhy3u1Uj9/rleUa30HIl4CtxjkHqyrLNp2ZdvVbQHk9Ptq8trcjURVRW3qjeOpJvM
 zZsRZfrjith73aAetmv7tcTdWLDHTqtXASbPx5OrwJRTYgnY6j+YxC787VkGUqZY4Uxa
 SmUXKNumhuTMAiJvLJcd/ndQak/f2UPoyDgAZjhWuFJt/TVCskriRGSHbOOAMuzBpr0b
 znXjDvH+37zqQEYQgAuKC1Akc0SHfaUQfka24ivCw8i4o+hulesG97I/3cIKrMqsX7b9
 bFpUjAejVQxh3y/oNfVYwsPP09oApI68sJrHSOtojG6YNufFD7pHk5JK8qOJuDTQUT7Y
 XLrQ==
X-Gm-Message-State: AOAM533kNCyz9AN0BMgyjlKoBJngMwKjGoTb8o/YxFrHoFI9c7VsaNJC
 bguJbSFIPzaIHu1zakayRdkNN4j9rQXLRopb2hc=
X-Google-Smtp-Source: ABdhPJzfXLl6CjRpcz/xsIrozszoM9Zxzo1ZghzalC9LjaTSEVZBWPtjOkaOWTRLElQXRVjGKWPWZU4nF/4n3UlgxUM=
X-Received: by 2002:aca:d07:0:b0:2ec:eaaf:a036 with SMTP id
 7-20020aca0d07000000b002eceaafa036mr2865348oin.253.1647549094217; Thu, 17 Mar
 2022 13:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220315201959.2952327-1-colin.i.king@gmail.com>
In-Reply-To: <20220315201959.2952327-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Mar 2022 16:31:23 -0400
Message-ID: <CADnq5_PE-zWB9Cjw05Pby44G-uNG4t8i09Z92-f9O_QiPo+HfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix spelling mistake "regiser" -> "register"
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Mar 15, 2022 at 4:20 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a dev_error error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index a025f080aa6a..9aa355a5ac3c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -919,7 +919,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
>                                                 "wrong operation type, rlcg failed to program reg: 0x%05x\n", offset);
>                                 } else if (tmp & AMDGPU_RLCG_REG_NOT_IN_RANGE) {
>                                         dev_err(adev->dev,
> -                                               "regiser is not in range, rlcg failed to program reg: 0x%05x\n", offset);
> +                                               "register is not in range, rlcg failed to program reg: 0x%05x\n", offset);
>                                 } else {
>                                         dev_err(adev->dev,
>                                                 "unknown error type, rlcg failed to program reg: 0x%05x\n", offset);
> --
> 2.35.1
>
