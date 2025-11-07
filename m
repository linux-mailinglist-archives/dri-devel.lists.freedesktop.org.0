Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF3C40D96
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD79A10E063;
	Fri,  7 Nov 2025 16:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gbpJrFa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com
 [209.85.210.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A08110E063
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:22:13 +0000 (UTC)
Received: by mail-pf1-f227.google.com with SMTP id
 d2e1a72fcca58-7afd7789ccdso965329b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762532533; x=1763137333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGuuzJ2XsbuhopXVZ9xTrTugReRhnrUYsU0aVk2gpBs=;
 b=X3cDWFNOVVSKFQnoySBdgXsjQeXJIGyWy+fGX9l7WWmIaqZfTceqjDjW/wllU50Nj3
 r+tzyEbSxXI/GK4QnCXroRK9bAPTzWQ2etykRe+DUu79SrGUtCIo2ghRECqdaMVSyEcP
 nUs30V4cVKBWp9WgFVTmHzCf1J4nnuIi+xZnBVUyWkFbS1/3B8HT0964oPhiuLlfLrF1
 Wcr8w+hDYNgC7skZpoTUqCzHb0g9AbtZlErlK6zrvGOfEzkrT2xJ8i0jcH+NME9QOrbk
 sOt+vL6Ev7uRqTIWqYm4PP7FgEA282B4whX6CUMKUBePjsof5ka592LRBhXQZUvY78xi
 Vx8g==
X-Gm-Message-State: AOJu0YxJjM9oL1qB/I/jYkFel1FO8qdeRaZ3MxuSbefmCrLZ2pLpho68
 SP44QMfwpRJSUYzjLhn3jJRJGKjZx15rl2vHnWLdg0ZqcWxPeMrV9BH92sY9V8zMso9jo+y6skJ
 Qek+Fi8AxOmRzLWW4vxCsvx4GVPAUqfWWk32DE0rNoU6L7YY5AmWuHN4IobeglhfZ0xMCy0waYq
 c2XXnDo0sTJyj9KpfDF4e/A972nftUHsxqp/UyiSYPNYzWC4ODZBkYwFHDUWwKETFx8Bdt5mJCG
 cdIOI2Sd/KvOED4UCfF
X-Gm-Gg: ASbGncs6jPkoDWDDhM/QTF/jN6pQXDtMNa+fS0rgAfYvDe/WpzUmxfxUrhVasoPRELY
 LMCXBW45cpel4tObOxjb7mHQ0YzYgOilz2v4kr1TOybR2g5S0HFd7lp7pE5u2cwwgwmgsrhvhga
 Cj42u2wpfxkOPNu1GFQxTLcJmYUbd/4kWnzNfbzEjQ0yawEidLfXxUe5JbudLAo98f5+Q1xeKnz
 /JfEixpVBgvJv27XGqKdXhOPxZZf5A8LfJwb9rHPnF28fcF9ZC8qB9hbbqhM1XBaChPmfcUG4Er
 0vUuySK3+JdXyPU65+KQgrI8v/GpP6gGqWy0+Kq9CP/GguP36DzRFNOktM8+ZMUYkH244mlYwg8
 6Y06FtBrmpfP3avzAnhP0oyIeDFwRO8D1vfdcc5ZBw8nAZC+Re99vgmBL2lcj3gCJkWbdVs1WQg
 5r469/h4WYYfMhWajHJoEM3oaCc9JIdJ03cg==
X-Google-Smtp-Source: AGHT+IFoEH8N4sLk9DZ1RHXGQvzGoZX75ZIkOsyKdzkA86oWaFAxkalMz5JqTaGK1rJZmDpT4iEY4mJdEgY7
X-Received: by 2002:a05:6a00:18a1:b0:7a1:68b2:5341 with SMTP id
 d2e1a72fcca58-7b0bbb0ad0emr5358809b3a.11.1762532532845; 
 Fri, 07 Nov 2025 08:22:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
 by smtp-relay.gmail.com with ESMTPS id
 d2e1a72fcca58-7b0cc573cf4sm286317b3a.8.2025.11.07.08.22.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Nov 2025 08:22:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-429c17b29f3so674594f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1762532531; x=1763137331;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AGuuzJ2XsbuhopXVZ9xTrTugReRhnrUYsU0aVk2gpBs=;
 b=gbpJrFa3AOXrL36JasQH/YAc0dang29/kERAGMZNrJXWK+dCpxliWz1ab4cvwTexPH
 S1nFXejc99p46ZTIDeRDV2K/5c4k4BVSd5rhaKjx3WocHr49BMUU2BaRqESxJsw2KoVm
 8WTAzkUPLaFnI3HtkEZemaF2qt1kuz/9vojNE=
X-Received: by 2002:a05:6000:4026:b0:429:ef2d:5dc8 with SMTP id
 ffacd0b85a97d-42ae5aefe18mr3092205f8f.49.1762532530760; 
 Fri, 07 Nov 2025 08:22:10 -0800 (PST)
X-Received: by 2002:a05:6000:4026:b0:429:ef2d:5dc8 with SMTP id
 ffacd0b85a97d-42ae5aefe18mr3092176f8f.49.1762532530385; Fri, 07 Nov 2025
 08:22:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762513240.git.jani.nikula@intel.com>
 <5157c2e927676aad75348855cf7b6745cba90003.1762513240.git.jani.nikula@intel.com>
In-Reply-To: <5157c2e927676aad75348855cf7b6745cba90003.1762513240.git.jani.nikula@intel.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 7 Nov 2025 10:21:58 -0600
X-Gm-Features: AWmQ_bl0hXyYQbUqiIQK3tQnr23faeZzM7VkxYWFiUbnmgzaWDEaYDApKiB3Zog
Message-ID: <CAO6MGtjDuxJiyn5JW5SOJnpN5bDUL+Q90DqUrfrWhYLB=pRXfQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/vmwgfx: use drm_crtc_vblank_crtc()
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000006c9f8f06430395bd"
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

--0000000000006c9f8f06430395bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 5:05=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
> for a crtc. Use it instead of poking at dev->vblank[] directly.
>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>

--0000000000006c9f8f06430395bd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
V0fYJUiKJMCwvDmndOil8EtMA8j2T6taUZoQINiKQ0oDWgY6eYVv7AdPVIeOOs3noCyUL8AyA7Bl
yoOPBB2/gk8VGcolEKgAAj+3hPbBF/d19x1bZzU3wABizBomVwykx5ms1nVXDbQajz8jqYECKWh9
3OMo7BuC3TAClu5mLr2zs0Ccpp6NRRkjTF8WtCJ+jSnjFJGLAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF2lhbi5mb3JiZXNAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSvJWzgGK7aSByS+CQVBVfM
Xgm5azANBgkqhkiG9w0BAQsFAAOCAgEAfrWiLF3zrYq7D+KPNRaAP70FbxHeaiUfn27Hbu37Eefz
xeJTcFZH04IEtXqpM3NWYZm4A/dFn/VQPbLCRaeXzpT2TESVH6EFY7BEF0rnSSlUbFyi000MnSH3
h5m+MoyE+PzLqfzLBZS+EU/haCpPy6Nqhs3fPKG3w5VTnUPsAxXK7rSmkIDVNsvwRttuMq9KHJzH
Bx51dP/z3mel4OuMjgrwHk5uNY1Sn1MZAUQztVUsWguyfoKcmhxXbBccR5DdEfBgDEbq8bicPQ3J
kqEy1QZXJfHlJuAJIiEw7odGctwqLeGCU6cBLhnsg54ngjO3uYC6tIySul55MRxFKE8HIwIrx+D5
2SwhDeVLZ8sTK40uPzW5xg5laOWVCvmy2b+cHCGzarUeIlYdtw0ejdH9Hbkm0G7IrDvjkhPa64gR
6Q+m5CGRDk+8iWhieH6WFE4HL++BpZhoi+YsOkGU3DK0dA+pxQnXNcNw1s0eNbSUVwQzmlC4LqiK
Gj5JV81HTPLhoAya57a9i28Fp5qHZiFnCq4HMvwiwY7IWe+UwUuueU199aTK80xNiS553vHc6FpI
/vxGy+LveJqEtodfKqQKwDOVu//c1Lz3uergJHqFYTMykk5U95J3FG5q/7Mqe4RF6E9OgtuAJidS
6Ca5anjLQ/qzIfTjoXX7TJSjPztehRQxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgx2/5+PPF/QoW30N7swDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEILGp
ew9LrSDwCZYXWUPKN6YEu+j70jq0jzxsTaQ1DHePMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTEwNzE2MjIxMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAG4H0T0C7CHSR8VuzUpkuIrXPptGXVAlEpadD+Ph
QVS8o06TevDW8FOlBHh5Veqik2m/gxBQeEgP36yGVUFq1/LgwpYDb8BnaA6aTJmi3YfVq/Zu2D7u
Ul9e9qYOybJDbNngWPB3uoErBmXKr4itMNGdkTP5hnFHtXRxfWnW1liwZh+3AAghNLndMItBifVY
X9KSSlMVip6MpYMiX37watpat+v88tM98bsnhw0ju/SatJKTD12odi6dd6kwb7ugfjqk/U9/UudK
1jKr+mrbphjoZwi3V0aR0Y/s2EaXSF+sYv3ADLozKHiCsedkV9ovx51NsHA9WhQof93cAcMaI+0=
--0000000000006c9f8f06430395bd--
