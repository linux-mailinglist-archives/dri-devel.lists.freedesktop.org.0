Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1CC75715
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312F710E795;
	Thu, 20 Nov 2025 16:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gyI8r2Gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f97.google.com (mail-io1-f97.google.com
 [209.85.166.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3D510E78C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:43:49 +0000 (UTC)
Received: by mail-io1-f97.google.com with SMTP id
 ca18e2360f4ac-9491ba846b2so41020539f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763657028; x=1764261828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMZNkP+DMRIZ8Ue4PkV8MekzAjhPPdsd8snKP/PE7qE=;
 b=OEpKJRc8PUW9dXKufgHycNhqWBJYApdyzg9t9ALif0XplomgBU6RjAtjgMWms0J5by
 /9jJDeJAgU7E4RtFfsvAooEThIHZV+Y4RbJuR9pswsMQGkQD4lou3Z2MB0MEaevr6FLt
 dXyU4EFC9mB2vQaCVL1zYGe0AIDOTpXvkW3AOajTPXH1qMpahqR+Mv9tC2HyB6Soi1hq
 6/713bRR2Cj6RhrfTsBwwCS9opNzvlqpcTiRjJycZgMKESfQcVdanreitsuN5Yw7HasL
 hwpW0NRblQtNdSISnLpjpbIin4yu+Rr1EZOn3+Q+lilk1jn3r8odbvVcf99l8gHpHKdo
 YE+A==
X-Gm-Message-State: AOJu0YwCRN/FcfEY9SYYsFP+zobIc2qHdfcfHT2PeO0yo3AJlf/4Xxfl
 uFyVOiS6JB7EJK7axs6MrpoeRO2tnXumm/k2/uMl2pMlUMdO7OLQ9/50vENbGBYf4FwsJ6kxtwH
 rYVJtibW6aXHR6X3r1E52RAemD7SpWMWg6VcKcSTxEH69bzAFhqzZnoWVXmuOp9OaRQC9ddEiLF
 LW2eIMADfJWeqiqAxN4LFb+GUUTKHjdv4ZMTXOysrGUG+qyrvUrJom8xy1KWBSiR48qVL3qnGwy
 Dn2PQxdiw+X3Fww0k0V
X-Gm-Gg: ASbGncsOO7EdDN2O7c+1G9j5VLiV4dJR+Eqz1XOX7MtlnVelA0QMapS9jiovYTPoRlU
 67z6saoGYhuWCuYotKw8EDtodHKXuowp3D2hmePXo61ECBRhvM25+j3u1H1DuYOEn+g6WbikqnF
 R0IN7CpbnZQ24tQ6m0SFMpRfC9ubeOpe+rUtMXhpysXJYbM02L9ww32eSgP1ERkLddHJ/mkC7gv
 JEsGI1PafoQHPs2Y1z9XkQ9yDe1gQkb60ipxHCc5bkGxW6mX1vnzOw9X/oWiSrlwj35kZ3spTan
 4MKBcB0Vm92NaIV1scWD6EbYYBRmczD/PnNkse+lfUAoZdDtqRrVfVA544zwYaKe0/bMweKrw/C
 laFeSB6Z7AUEqVrRJ5Pn2Jky4T1Ri5Sj3wsPxwFiOkLHmCtZbzbeWkIGA4Ejl7ZWs6mbmcnzhsQ
 VAJF0NhWuzY9NMBWeNzI1zFU2rJiY7unMUkG4evxeMOw==
X-Google-Smtp-Source: AGHT+IGE/z95XItyhUclflx/6Vau7qjJTQbA/f5COa9dMUO+xSgQzRW4igSIeBycywQqxoqnnp9fsxy1s7T/
X-Received: by 2002:a05:6602:1413:b0:938:9f22:ed34 with SMTP id
 ca18e2360f4ac-94938af1c7bmr246310239f.16.1763657028233; 
 Thu, 20 Nov 2025 08:43:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
 by smtp-relay.gmail.com with ESMTPS id
 ca18e2360f4ac-949385cb727sm13372339f.6.2025.11.20.08.43.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Nov 2025 08:43:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5944d65a8f5so591374e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1763657024; x=1764261824;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nMZNkP+DMRIZ8Ue4PkV8MekzAjhPPdsd8snKP/PE7qE=;
 b=gyI8r2GxYZpXnp2WRM4pHTdhKxBsIShC8Ne9sPlr8ygNCCiNyhLV3wIL4vC2kxNIS7
 XGsQBsXMY9IPa16TDhFdChWlfHRM+TKhX5WGZ7OajaZUpIL3XsoPY/+rFKaMYro6kT/n
 hsZwOB6qStpySe8TSD2sh82QWBZMNxxXJGLzY=
X-Received: by 2002:a05:6512:1252:b0:595:9da1:500e with SMTP id
 2adb3069b0e04-5969e2d05f5mr1348112e87.9.1763657024052; 
 Thu, 20 Nov 2025 08:43:44 -0800 (PST)
X-Received: by 2002:a05:6512:1252:b0:595:9da1:500e with SMTP id
 2adb3069b0e04-5969e2d05f5mr1348109e87.9.1763657023579; Thu, 20 Nov 2025
 08:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20251114203703.1946616-1-ian.forbes@broadcom.com>
In-Reply-To: <20251114203703.1946616-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 20 Nov 2025 11:43:30 -0500
X-Gm-Features: AWmQ_bnMd52X75-Z9l-q8N0jTsc03kF-qqluhT-2KCDc6exSIvbYca6DVqnaB9w
Message-ID: <CABQX2QNEROVXKA0e7KzHM3dSrBr2kW5oha08pyq3TN_iK6_7Zg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix KMS with 3D on HW version 10
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000723f21064409662b"
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

--000000000000723f21064409662b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 3:37=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> HW version 10 does not have GB Surfaces so there is no backing buffer for
> surface backed FBs. This would result in a nullptr dereference and crash
> the driver causing a black screen.
>
> Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 87448e86d3b3..4446f25e526d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -767,13 +767,15 @@ static struct drm_framebuffer *vmw_kms_fb_create(st=
ruct drm_device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       ttm_bo_reserve(&bo->tbo, false, false, NULL);
> -       ret =3D vmw_bo_dirty_add(bo);
> -       if (!ret && surface && surface->res.func->dirty_alloc) {
> -               surface->res.coherent =3D true;
> -               ret =3D surface->res.func->dirty_alloc(&surface->res);
> +       if (bo) {
> +               ttm_bo_reserve(&bo->tbo, false, false, NULL);
> +               ret =3D vmw_bo_dirty_add(bo);
> +               if (!ret && surface && surface->res.func->dirty_alloc) {
> +                       surface->res.coherent =3D true;
> +                       ret =3D surface->res.func->dirty_alloc(&surface->=
res);
> +               }
> +               ttm_bo_unreserve(&bo->tbo);
>         }
> -       ttm_bo_unreserve(&bo->tbo);
>
>         return &vfb->base;
>  }
> --
> 2.51.1
>

Looks great.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000723f21064409662b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIJNN
dcjAEPbA/FxNAuGuE41HUvRYBvb/CdZqXqG72lEeMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTEyMDE2NDM0NFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFSsgizuzCFePS3mNLqflKnADKcBdw9XwbQVj/ZK
oiw00oSXbDWPTorqOMDS3tU44Pj6WrI6NRH19QkgqQgB4PeFVEi7Nsg5eMkKQBgtr+QwLzXFpu/T
fGXa3LF31RHGm6eRbKComt+s6N0QHAyea3wHfsGA4+q3Mm/Wck9Ond5f5RJEQJw+681AeECU9kx9
uyXTQLkqwRVUKq1P9TCmrm+7cvjffHS1U5wzdXrbcaz7LZvZDr4ZtzbhDufMakJsL74hYVWumQwB
bOX+NQcEXWEhWgCy3qtYbU+nc+e5xFEJqHSiEX0v5XhTF3VFNg9g9b8OsTXmDLo+o57xu0ylLho=
--000000000000723f21064409662b--
