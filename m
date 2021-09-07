Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599BB402BB9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A7892FF;
	Tue,  7 Sep 2021 15:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C915892FF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:24:58 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id r26so13255445oij.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PVsetU4MuTuOph97cvN7xlDU/pXM0FRj571cukB9x6k=;
 b=D+gf8Tyi+Gh6DqT98imggiP7I24zWdFJ0YNrYNaG13hemytS0xUcKQwQ90vrOtZ3BW
 QE9GWeXEPmJgbmztxfbekIfzunXMuhjwCFyTUbnMBHLZS5rBQ0a272BnZ6w01Ouff15W
 PU3Z3eF3maHrJWQiAxdqFEec4+nehVRaEgd3a5PeZWTI7w4bcrm+ehSqtBjfdzjpLHOk
 pInVwFojKG7oyPGRTcrpRGQaIdNj51lCH4Zmh+QngAqTduiKj7RTqfrs4z+JYORVr0Z1
 E4eXe+PIN682YXN3nOeR+yyRHDFlZPdXogf9zllsOIkODRg3TgRqwANO79axDdwdYqXN
 VjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PVsetU4MuTuOph97cvN7xlDU/pXM0FRj571cukB9x6k=;
 b=ZdWN+XJFr0LVGFeqE/zlmlk3IJCL4ieDHTaqZqBbThDVlnS7DCwGrApWzfoQEaTMvr
 +QdtAT2MbG4e0M2qSBuz/VNUUysbX/lr89Pqcb0vox26lah6/W2xP+9LF0/FvODYXlq6
 GXUSBvod4efNSDjz1R3gTLNIgOYpXDRSDCuUVbmDYDEvv+OrBQh3j+YAen9dRLcwg2sL
 KYxkegfYEL4nW1Hb91V6bmWfUWdbLvrIk5H7IrjeyIS5/UAEzJ2aYWiMBFjknwiLQsE1
 Cv2ybmBVPM7tenNncpl5t9rm/qSU3dtZtehCWKYGSBMuWz81v3G0NmNC+uFK3oc1Gnut
 l3VA==
X-Gm-Message-State: AOAM532rAWm++LNkad0uJlulXZoH05hrbv2pwMNzIpSrHwlFuJeGhy04
 YK2mEv5eJzSzyF/0TFkLd7jyl8pCDl7oNfIw+cfEoc+3
X-Google-Smtp-Source: ABdhPJzmqplE7qEsPYQ2GBQyBXo1K2ZoGt1hLXrMKn4gBaW3GkO9TmngvZ2YluCI2911pq3CO9Csj/U73XathSAOp64=
X-Received: by 2002:a05:6808:1310:: with SMTP id
 y16mr3364288oiv.123.1631028297342; 
 Tue, 07 Sep 2021 08:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-3-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-3-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:24:46 -0400
Message-ID: <CADnq5_NpgUExmHB_MSUB4Nbdphqa6-Q-Kd752iB5zURxg+HbHw@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/ttm: add kerneldoc for enum ttm_caching
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com
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

On Tue, Sep 7, 2021 at 4:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Briefly describe what this is all about.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/drm-mm.rst  |  3 +++
>  include/drm/ttm/ttm_caching.h | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 6b7717af4f88..f22c9f9a2c0e 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -31,6 +31,9 @@ The Translation Table Manager (TTM)
>  .. kernel-doc:: drivers/gpu/drm/ttm/ttm_module.c
>     :doc: TTM
>
> +.. kernel-doc:: include/drm/ttm/ttm_caching.h
> +   :internal:
> +
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.=
h
> index 3c9dd65f5aaf..235a743d90e1 100644
> --- a/include/drm/ttm/ttm_caching.h
> +++ b/include/drm/ttm/ttm_caching.h
> @@ -27,9 +27,26 @@
>
>  #define TTM_NUM_CACHING_TYPES  3
>
> +/**
> + * enum ttm_caching - CPU caching and BUS snooping behavior.
> + */
>  enum ttm_caching {
> +       /**
> +        * @ttm_uncached: Most defensive option for device mappings,
> +        * don't even allow write combining.
> +        */
>         ttm_uncached,
> +
> +       /**
> +        * @ttm_write_combined: Don't cache read accesses, but allow at l=
east
> +        * writes to be combined.
> +        */
>         ttm_write_combined,
> +
> +       /**
> +        * @ttm_cached: Fully cached like normal system memory, requires =
that
> +        * devices snoop the CPU cache on accesses.
> +        */
>         ttm_cached
>  };
>
> --
> 2.25.1
>
