Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F54E4B03FE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 04:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D8C10E32D;
	Thu, 10 Feb 2022 03:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773510E2CA;
 Thu, 10 Feb 2022 03:37:20 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u13so4659748oie.5;
 Wed, 09 Feb 2022 19:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pA5QwYdbstHvdtGKZFEHHXd2GzfNuX/tLbnxeC85QfA=;
 b=nganxacKJmAbWaoG2oPGMx3UaKgrzULx2cjy/1ChlfYhb1866uW5ECPjKEyzH/Hkdv
 kI6k/iiadoWhX02NJxN/2TT+XMChtPk++tvRMkJoa9JzJv4AjCaOsOqeBRLykQsJ+/Mq
 bQYm19/4Goa/c5QAAshK2US9r9i78GimiPokGdnLDBX9Dpg3sJigZh6RXHqhHqKikby2
 0BFEI0MW3psUlzs6H3biGQQUxgddhFDDlUjWdfWl3TmyTakgF1hfV7sGrGLddkaocu1i
 HWLEoFlpcbMkPGtWROVBL3r2OqEAAWvKxjOIVNaogwppk3KtBWs2ReQ1oGZOahTQDiIK
 PgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pA5QwYdbstHvdtGKZFEHHXd2GzfNuX/tLbnxeC85QfA=;
 b=63FcuuWq8tEIP72pQyvzPObtNreDuCym+fZx64tUYbJ394U7HkqBW8u0sn4YolORwx
 tfirySYe4bJcVbgFX6Xdj2iN8C0rOue7y4XdclyuR3yKJ0MmcX80TTnwJqWVxWU3+YA3
 jq9dl6OlVpQ8RrChPGfRM3UssVhM/ZlPO0LHl+CLPSUmYCO08+pIa5we6b7aqHAdRwf8
 9jAm0wbbreegmcum+koGYuRCwLekoC7dHT6Szb+FpG+vh6Y+JPf5OBXYvuNtfhlOPUhd
 SIV5ga3xIvLfrJM3YeeEatVkTSvp9LYPCieKxHP6k1XIPsgdXNMQgv7i8J1RVGzLosPn
 +nNw==
X-Gm-Message-State: AOAM532FYHBnvXlzdISRYoPnFHjDKBL7cQXTXLEoe4eCIpq3X+0yLDD1
 oBGJ/L356qBR/CALhMaKqVLGsgXnaEGtYkgkNYw=
X-Google-Smtp-Source: ABdhPJzhTfV5UYaxHhcDHjfGCvfkMYjzyxKbr1W6aoBZfJ2qgM15BVl71UgzyrmfkZaEUUPd3OhmEbxjX2ajt2ljjXU=
X-Received: by 2002:a05:6808:2011:: with SMTP id
 q17mr254973oiw.199.1644464239350; 
 Wed, 09 Feb 2022 19:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
In-Reply-To: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Feb 2022 22:37:08 -0500
Message-ID: <CADnq5_NByQ8-UhL7ma+MTWtg8YtwGiG1bOovA1CuikRQnbN+2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix compile error.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: kernel test robot <lkp@intel.com>, Horace Chen <horace.chen@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, jingwech@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, "monk.liu" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 9, 2022 at 10:17 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Seems I forgot to add this to the relevant commit
> when submitting.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 92de3b7965a1..1949dbe28a86 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -118,8 +118,7 @@ static inline bool amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *doma
>         return queue_work(domain->wq, work);
>  }
>
> -void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
> -                                    struct amdgpu_hive_info *hive);
> +void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>
>  void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>
> --
> 2.25.1
>
