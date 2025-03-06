Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24DA55512
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5A110E0B5;
	Thu,  6 Mar 2025 18:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ccZyQl7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AF110E2A9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 18:33:48 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-85af81a1febso30358039f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 10:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741286027; x=1741890827;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V0AfpxtP6RGSXXsSk/Kzu3eTx58hRVEsdhgVs7T/AME=;
 b=ccZyQl7uiK6h8ZyJXqEF/oNVFFSSwvn61jK1gJl8YdbaYndN5sadnOXRB5JOxI3EWc
 gh5tqBN8dfSk7nkRGbLWDDvTz8Y58qeMMk2H16JVNEeAlXGJvYj/Ljf+p80Mx2dZklI8
 dsVPVPRByU/X9rErpyM//AbKqfcxdNLK/pFoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741286027; x=1741890827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V0AfpxtP6RGSXXsSk/Kzu3eTx58hRVEsdhgVs7T/AME=;
 b=NvkTHSp341V5lkJTTV2lOJZr+vbJSz3f9pxoo856TGLIE+5jawehVWaNicgxb+qUF2
 eMBDfitrwRnpOQ08TctUeTrfu6WB21zQfoZGwJF/aZjTsCW6/bsmk2NRJDfEQde8A3lp
 mew8Dv1YSvfuOZy4X03bjjP+r1CnHAuqwx5FvuLdC1ooqaZGlTqpCkbNm9Cb8Mb6ty2O
 7xCj/E2p1+vkA2YYeCC0Qf9lyEfIrVOgddXBM6zfwoaVHXH2sP3sb/WiD078eQSFi1Pp
 GIpCOU02UaMCmpGBTyJ7/Y9G0wETenyAQoNxcH8mDuAV8msij0xzNzD1rgZwmnDquZ3S
 8lwQ==
X-Gm-Message-State: AOJu0YzgrcY/YZUpZikwDgXj7D39hZRjLT8+w0H3iaOkG8Evn2eQmo5O
 SYco+yLf40B034PtQHTn165ASpwtryPisQyQFZzmO/9DqJN0FFqY5lUobt8ugJGM3zdXvEOpdgA
 jCyfDACHAFZF8g5Ncjxj5STe56zTpPttYLPht
X-Gm-Gg: ASbGnctwBr/9NrWfeRx8LC7TolQd0K0sezq9rafTKSBL7DiqgXYPBxIcmt2c6pyLHnG
 TDDQGQseKXLV1dcQwNEvhkdeQgsKH8QPaqEGayq1va7AR8Ff7irhKM8W/10iZsHZKHcTJ3mrd0g
 +QXueQUzBNpQK6U2cGNdBrym4KYxA=
X-Google-Smtp-Source: AGHT+IH1/6PYdD7m129BFQaRMVbnK4nn3cTGyO37ycEXjHiynuuJvq3WhjS8sV70Yt1OehmbRFR3YB/RKsCra6ialT8=
X-Received: by 2002:a05:6602:3687:b0:85a:f9ac:47ce with SMTP id
 ca18e2360f4ac-85b1cfce63bmr98113539f.6.1741286027243; Thu, 06 Mar 2025
 10:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20250306041222.2776379-1-zack.rusin@broadcom.com>
In-Reply-To: <20250306041222.2776379-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Thu, 6 Mar 2025 20:33:43 +0200
X-Gm-Features: AQ5f1JqS88j486BdiOY5aYcHGnW-3txU-RMuPs8TWanUCbJtUK2bwj9CQtImeXA
Message-ID: <CAKLwHdUqjYLjfaUQiKZG+QYMWc-yVpN=F+Rk25sTjVuNO9qy2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix native cursors with vmwgfx
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000206201062fb0bf75"
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

--000000000000206201062fb0bf75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 6:12=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> vmwgfx had a number of cursor issues that related both to our handling
> of dumb buffers and general detection when a cursor has actually changed.
> Fix those issues and bump the kernel module version to allow userspace
> to recognize fixed versions of the driver.
>
> v2: Include the fix for leaked dirty trackers in kms fb surface
> cleanup code.
>
> Zack Rusin (2):
>   drm/vmwgfx: Refactor cursor handling
>   drm/vmwgfx: Bump the minor version
>
>  drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 ++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |   3 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  12 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |   2 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 851 +------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  49 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  40 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  25 +-
>  15 files changed, 1031 insertions(+), 917 deletions(-)
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
>
> --
> 2.45.2
>

LGTM to the series.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

--000000000000206201062fb0bf75
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
X9+qyhUml9AcGonyzWyK+KoiW2d8gS0x1lrsD4/jV149/usxggJXMIICUwIBATBiMFIxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdD
QyBSNiBTTUlNRSBDQSAyMDIzAgw5cEYo72FZtNYe5cwwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZI
hvcNAQkEMSIEIGRBF7o3igwWMByWPLf5cqe3xscPmNmF83eD6l57tOn7MBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDMwNjE4MzM0N1owXAYJKoZIhvcNAQkPMU8w
TTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBABTunS3v3ENfcdkW/og2bvjh
fhoFKwdCv4ZuEpq+KbVsBiGxQT6riz+hZnkdpfFtkyEryH0/8kZ+VtwWGBu1y9Em/00mUQlRFUFP
+LYjSXQ9sO8LDEsARPa6fvnwxyUHdIXR9fndMKGa1zoeJTjQllk64Sgq73j6D5ni5+FMVEQ37t3Q
QcWr48By8cWVW7e2jgXqivdHeln93gOGecUcewPg9rZv7smRBHtXKlZTkxDwpErN8vCatLBAbkHe
JtGCtzs1MXcqxDNPIJ3dig6G57n/L/HJ2BpbGjkDd4m0WrCo6u6HYrmyEnbwgAcD+nfs1/Wk+aMf
/GiYpUJlt2S1OcU=
--000000000000206201062fb0bf75--
