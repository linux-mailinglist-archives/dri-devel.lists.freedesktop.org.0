Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BAA07FB5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 19:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064D410EE95;
	Thu,  9 Jan 2025 18:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EJz3VH2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCE810EE95
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 18:21:39 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso37167739f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 10:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736446839; x=1737051639;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YE52UWa//63zOLhkKbTA7P/TXKrT6mNgxI2ohish580=;
 b=EJz3VH2+2qxfG6kxDp0QedAXOOg0+z+FupJWAJs5pYiKrtisnIbUx1IsI3MyoOKYxY
 M0vqS43LpN5ph8wRqkVyhkFD21luwmF11Y5leP1/wK5islsOO/NH+KFvVv/rxerE1oKy
 jDEJ+VW5AJzByWC4fNVtEdDIhIyTd7jGh2jPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736446839; x=1737051639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YE52UWa//63zOLhkKbTA7P/TXKrT6mNgxI2ohish580=;
 b=QVBhNlOzzZaS+rxcu+pbkNNMRRsoYE1P714fhyQdko+6e+UWdRo8NXu+5ohbLZZr+V
 uYcfeNX8vNag8MYgjp0sf9+cV2yPO7loWZT9FldAYWMMBrUcg2p81wRivbaJ++Bn+3c1
 PumJCP845a/RVSWCfXufkdExIPGk09jfWo6JAu8+GovuAoKYtyip+4Nf4SSklA2W4QWm
 05+BCenf5tHxRjToMjgR93MBW21rAoLJrNxTE8VYUvvNda3CfU60949JOoMGc6z07XnO
 mfAZz65zPzbURba9URE60OX9OLEpzMV01RfmOu+4WNdve3/Bj/WlCDLjo8Sbg6My/ufD
 d+fA==
X-Gm-Message-State: AOJu0YxVtl24S8OuNONlhzzAlhx4NO6z6pOFiJsU/Q6r13+Zfu4bEcv3
 /6KDTP0td61UTi8qNqlQoMBoH6WxScDgKTb2nXwyUykw8GGh/fyYJkGhf9yxGJmqBqj46Ju9B9s
 k8oT04/3WGGZX9QJnilXWK/vTqpgoO4eEkWbT
X-Gm-Gg: ASbGncv9KIFy7W9WKLC9KVCUvbL4v6q8AKLOOYpqKzw5Zir9wYC0VWV32pQAM1Co4wJ
 Tv68Fvdq4WWWgezqChUAtmSs1cU7T7yOQ8Vqksg==
X-Google-Smtp-Source: AGHT+IFAIKYH4ACboDH5xVBueX9aslWyvPo9/DGwcYveQn2oLBXy0ytA477gKqeqGQuVti+XN1WHpiAl5GLl8KKsZ1c=
X-Received: by 2002:a05:6e02:b44:b0:3a7:c2ea:1095 with SMTP id
 e9e14a558f8ab-3ce3a9a572bmr65850515ab.1.1736446838908; Thu, 09 Jan 2025
 10:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20250108201355.2521070-1-ian.forbes@broadcom.com>
In-Reply-To: <20250108201355.2521070-1-ian.forbes@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Thu, 9 Jan 2025 20:20:28 +0200
X-Gm-Features: AbW1kva5uzARrU3k6Mu5K07iRN_o-6ti5Vpfe7tTOE5dPfk9gUQJEZWPXM1GLXs
Message-ID: <CAKLwHdXe=fX4EPyKhTDYbTPUt-heA4wFAEY=LS-qhFpS3xE=Kg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Remove busy_places
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000004e713062b4a09b1"
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

--00000000000004e713062b4a09b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 10:14=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Unused since commit a78a8da51b36
> ("drm/ttm: replace busy placement with flags v6")
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index a0e433fbcba67..5f13285f83e0b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -228,7 +228,6 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *d=
ev_priv,
>                              VMW_BO_DOMAIN_VRAM,
>                              VMW_BO_DOMAIN_VRAM);
>         buf->places[0].lpfn =3D PFN_UP(bo->resource->size);
> -       buf->busy_places[0].lpfn =3D PFN_UP(bo->resource->size);
>         ret =3D ttm_bo_validate(bo, &buf->placement, &ctx);
>
>         /* For some reason we didn't end up at the start of vram */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.h
> index 43b5439ec9f76..07749f0a5f294 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -83,7 +83,6 @@ struct vmw_bo {
>
>         struct ttm_placement placement;
>         struct ttm_place places[5];
> -       struct ttm_place busy_places[5];
>
>         /* Protected by reservation */
>         struct ttm_bo_kmap_obj map;
> --
> 2.34.1
>

LGTM

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

--00000000000004e713062b4a09b1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
aB4epDaANYRhU8JHkxW+iknr9YlBD7/vaR0b3f0xscNO0KR2RbRxBd7ldJIaA7T83cwnqXXOVzGm
mrHMSsP6TfmqvfoSrZWNOxf3+aFjexRg0I13QVFNW1nYTYYAjBRsito6675X5s3qynY48fFTvTN+
C1mZTTJwBSMD6E8bazTZhq8x8qEz678juqIw9KzVn5lRMf1X7qjByj4MPB0CAwEAAaOCAdwwggHY
MA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBBBgNV
HR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
My5jcmwwJgYDVR0RBB8wHYEbbWFydGluLmtyYXN0ZXZAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoG
CCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSk9QW5
tnlW331MiMXmPO7S77wBdjANBgkqhkiG9w0BAQsFAAOCAgEAUqNCJy3ZYS+BtXtQDl8fFRt6ETrX
F0uFFdSZRPCSQ5FAFJziQU9YLymmRYnNlmw1+NGCkImoavvCiQeqCcy5+L2iGa6MbGlkYVFtQc26
uBJbRIDJ7Dj5GZiNou67hIQvYsLDudJM/TGQe2dtv2JYPpaysa7cKJZB08ZniVKvSqc+ZAbpi7ld
CrtzlZU9Bq2dJEwrU7fm1MvzV8KbNndChku/zlxh4dVijiNGEI3Y1FIKfzL5eq+rTZnQBOzbxdwH
aJ96//5ej4kM/Bl3IB2EvAM7DTttpUNI4C/udXLNKhTCKFdgfeo4K7+49VMOMk8ZbEeKkiA0W1SP
GeLqPoKhzbwN+aagS0c9GFlE01Zmtqvlgkgwv3EQjI47QvK8KsQCyjTYmckxYT+OAhmL7ai5P+jm
R+KlxSCyDOg3+E4KjQnnXzYsEnuXw+olduPLcCE29LM26pHrAOxbc4YarhC0vYbemNruZdZxIca/
/XGY8l7LXKbVw/RUcoVDTjcQ5QO2y6wm9YFSf6tKtXkbxMz6KNmNeuYloos1Y9YO6eUK5VU5owyD
OcXk6j4USOkI67pbnbzE9DzgeYcEZr3i2N5qxmqoMTs5FkZdPQbrI2b/PjXb9zqpUlL8QQ7b0tgN
X9+qyhUml9AcGonyzWyK+KoiW2d8gS0x1lrsD4/jV149/usxggJkMIICYAIBATBiMFIxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdD
QyBSNiBTTUlNRSBDQSAyMDIzAgw5cEYo72FZtNYe5cwwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEINpKtCacggczNcHgs+PBFO3qP7Yq4GLW+RsKk9ln4FIgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEwOTE4MjAzOVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCJknrK
Jx9LS+0pxMH4JT60ruhlu6+f7sOO5CRraLlgeoR8wq2qfCW19/igGK+jxdyg4/z1e/j+0m2VBPsH
TcUghGkxu4/kjCQ7gDSvCmFCiWYNXvouJlN3cTA1boPwTpvmkpR3OPVFGbvrYDmnfiZgGH2i9vTK
GCvfhzB2IMm9zOmLFytV46++K1WXXaJ0NknzwsBKd/EhqtntAn8Kn0nZZCyMhxRtAIM3Vpq1BE17
CufN4bC0jSYSLkH4q38WowQnzY/OQGnyo2hk7HE1adnRLMs32WpmWOGc4qaC+jPo0ihT6DsHqKMe
SE+sN0MGUwGq9Fyvko37li80/Z01oT1k
--00000000000004e713062b4a09b1--
