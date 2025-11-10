Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1653EC44FF5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 06:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFC48930B;
	Mon, 10 Nov 2025 05:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lQBhBHaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F83A8930B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 05:22:40 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-5dde4444e0cso189462137.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 21:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762752159; x=1763356959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVbcQdsxhGJ251GekmogRgMgrAHB7EALgaSbuq0BgLg=;
 b=lQBhBHajntJSHJCKUm7HqffZKCdWGUhl219w98BEHlcc7obp0QpGfPl8ERUQMX7ADd
 QkHNtFuhzJoVbe6WiJWKSoGxBBNNQM4iY2abYQsjKv8o317Q7NlFG17XcmTWjuPRAZAT
 Z7OWsWg20D2zRe9kOjYKqYr1VvUJ1A+H01+2SUy7jM7goKs4C8BzzrHKsCylSOAPRKsw
 gONI5sbaCRnp4vfc9t7IQIOjwPMfXW4R90W+Q3vwMGhCVC9ekP2wQ0eJj7LKFTLUCVmB
 9Kayco2BRuVQaF9BKBMuF39pvUXlWs8kY59dvDUXU2cyp5JRPkbHEd+FFcISyF5Of0Ea
 eMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762752159; x=1763356959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tVbcQdsxhGJ251GekmogRgMgrAHB7EALgaSbuq0BgLg=;
 b=Acybidep6H5m0fG++1yEG6HsSelmm4nImxRu2zpMaXGJ46oZ0dGhMZvJUwoISjJtHJ
 sX87mS6TTXZrul4EspxKT9/+BSF8Jb3zQ1eG29BBVnP3zTSsI2eGDi4AxCt8J5smtlyh
 2VdIbg9ifqe/kmj+X92g3JqyVCHzWF035gb2LrwOWhqPsmc8c98QWxXnwIp9wmBT3WEL
 N44u00PPJ1aMCAcUUw9k4nQw8EAffK8NcPdvMrYkiIHATAs4T7Qb7KVukBvJ3T20nXFU
 XVobLbMy/vcFiWfXvq8Rjj9R8zkzSC7/L2xKdr3/m/FouzenazOWlI6mNB1jItzvq9hx
 uilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTsboE7VIQ5nsn5qu858Djr9SJgPxQ8p9d1AugSkVQ+Z23AWK8XaGuKPNIoV8iXaYtLjWsP6Ydck0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxupLuEKYMwAW/8BgqVItHvR8ygHx0tWJyvqaEcqhEOuiF8GnrB
 qDxTRwxZdjLn/R/8bgJEQ3gYSqlZmtHpnXYNt7P0S7MPQZ0gghVBmvfHirW+9urzrAmPQBfNMk7
 6/Mv+1GQEyG9BM3Pytjm1uUAX1KU4aU0=
X-Gm-Gg: ASbGncuwLfwLqjP40RbsgTlgmc1vqGfvL1ZDLaptgCtqFcQOXbeMINltqx9EzoqlYhM
 ySbVqlWCW6giom2YJ/OE3IyhuqcBnBzzrZ5vMg8w2bK9O634rQ3ridcpCgzQGJvb5nQrzV6tbfv
 i28uE37rA5WFfNpi1YCGNrugVRERDlVQYpfGZF4d70KrQ8fD9dtBvF8fLzN+sKIWcGSOOwxama6
 8L+nxmNmvyXwQnLJhRMzGmWB+d4zwepIuKk3jziNK/pOAKr4SrSBQstnfQ=
X-Google-Smtp-Source: AGHT+IEeFVULUntPJGmAB60bMxKjcERl9eTW1jbOHV8XuGq9ZMrcrkcUimjG5F2o26/OwntJmcCh8HHKGulh3BYrYP4=
X-Received: by 2002:a05:6102:390f:b0:5dd:8c81:d7ab with SMTP id
 ada2fe7eead31-5ddc452d062mr2218860137.0.1762752159000; Sun, 09 Nov 2025
 21:22:39 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 14:22:01 +0900
X-Gm-Features: AWmQ_bnqaqpr6mbii-XcWKvzW_ttKXH-Eb8J1UjIIWLeqzt5jQH_vRs30wQTWl8
Message-ID: <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and
 drop manual cleanup
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:54, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Switch mode-config initialization to drmm_mode_config_init() so that the
> lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
> from error and unbind paths since cleanup is now managed by DRM.
>
> No functional change intended.
>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 6cc7bf77bcac..1aea71778ab1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
>         dev_set_drvdata(dev, drm);
>         drm->dev_private =3D (void *)private;
>
> -       drm_mode_config_init(drm);
> +       drmm_mode_config_init(drm);
>
>         exynos_drm_mode_config_init(drm);
>
> @@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
>  err_unbind_all:
>         component_unbind_all(drm->dev, drm);
>  err_mode_config_cleanup:
> -       drm_mode_config_cleanup(drm);

In the current implementation, there is a potential dereference issue
because the private object may be freed before to_dma_dev(dev) is
called.
When drmm_mode_config_init() is invoked, it registers
drm_mode_config_cleanup() as a managed action. This means that the
cleanup function will be automatically executed later when
drm_dev_put() is called.

The problem arises when drm_dev_put() is called without explicitly
invoking drm_mode_config_cleanup() first, as in the original code. In
that case, the managed cleanup is performed later, which allows
to_dma_dev(dev) to be called after the private object has already been
released.

For reference, the following sequence may occur internally when
drm_mode_config_cleanup() is executed:
1. drm_mode_config_cleanup() is called.
2. During the cleanup of FBs, planes, CRTCs, encoders, and connectors,
framebuffers or GEM objects may be released.
3. At this point, Exynos-specific code could invoke to_dma_dev(dev).

Therefore, the private object must remain valid until
drm_mode_config_cleanup() completes.
It would be safer to adjust the code so that kfree(private) is
performed after drm_dev_put(drm) to ensure the private data remains
available during cleanup.

Thanks,
Inki Dae

>         exynos_drm_cleanup_dma(drm);
>         kfree(private);
>         dev_set_drvdata(dev, NULL);
> @@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
>         drm_atomic_helper_shutdown(drm);
>
>         component_unbind_all(drm->dev, drm);
> -       drm_mode_config_cleanup(drm);

Ditto.

>         exynos_drm_cleanup_dma(drm);
>
>         kfree(drm->dev_private);
> --
> 2.34.1
>
>
