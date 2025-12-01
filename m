Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D15C98212
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD0210E42C;
	Mon,  1 Dec 2025 15:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="blme0XPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com
 [209.85.214.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6C10E423
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:54:25 +0000 (UTC)
Received: by mail-pl1-f228.google.com with SMTP id
 d9443c01a7336-298144fb9bcso42915885ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 07:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764604465; x=1765209265;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEg/6pGGoHlc+89GJoVf7YwtKTHSknZrx9CmmEszmRA=;
 b=D4fwR+HssPhRQ0eLcmf+DA8oXWD1NR7b7aVKGARaIS/9/cq4cdKAPjMCqNQrSM+m2D
 YuGy2uVIbl76DGTCK7iSLUI02KqUUhd7S/sZ5y4qc3hw8spk4nPrU54pUzVdD+SLc9hV
 j3GiVQUW5BrNiPBMg7/QZpwuYgM+Z0HHV2qyZVhprqOFzNU1vBZijIAgB/fl/96+ZCTl
 +d55+/I4NujNt4ri020fD5LU/odFfPmLl2U1quNjLvbZTEobxkv3p+lamQ1ihR7mpl7t
 sLK3v19kRapdwrX3M7/0DhBzKJe/47p995/ggIVdTnZAqfCHz3nuDllnABOOecO+PlHz
 YB7Q==
X-Gm-Message-State: AOJu0YwG3kUqqJCXLmfKj/Glv2ZutNwk7qAMCiM8Gkw53kyhVqfEgfS1
 RnPkxG0qCP4P6aahjLNRVN+vi86d+5QUaoFm7wHsgAerOAa5RuJJDs9YQvnNiKcejSnG2aEGb3R
 sqRTgKNX9MUy9H+/0Snb8xRx98esFT227jEHo6AM5F/Ps0Zu68ogcHq0iYygRyixEuYnl6tImYe
 mZ+uCwBjx3AhIuDqaYew8wOSqci2qCl9jSEq1hYpwEatl1cQCPpIUI0g/5iB6F5hq600LNLnSrQ
 Cj61+OaGOfYVCF9LCo1
X-Gm-Gg: ASbGncuCEuixa2rtIUxrtEf3tiwrkJJL4dyGIhnIoZfK5tVVD5eCi/iFEBFFEYZGk5t
 +4pNINagDjHMzYg1u+ZO+4JRTRlo0N3BYGqeeGWXYcn/uwkbns6uqFabvy/tTj1Mz/C9N06WZul
 +7x4uxTfclj5QcMiJ10VSVkWZPwfvanp6DbkKbP4NJF2sYq9/zhRJbeDctsTRV41Y74v7QcXmCO
 F7zjBtqqJ8nvMkW0xPhxiA+f23JhD7q+xvjxbY0h8fkn1efZziHVL/LbSbi8LK0DlPBoVhmSTsF
 PFnzvM3tD4V9+fTHRbPGkQAn4qYmcLrXHz/8/L0K/IzYSr+yUV07q7xITxwXAWJo/mSYC0bV6ne
 OUI5sDXU8Jb1msBWHMN563mZVuEM7pipGRR+BQVGllVJYM6/aeSvTdMCL9rMVbevG6A/Gl9K4e7
 wGEJb0Q+MoX2K4qNlktIkYAdWrNwx1u2YTK8Czisbz+jfk
X-Google-Smtp-Source: AGHT+IFfin5uG0Ye9u9RPbB23PSLPgGT7YRggeOwwuwZ6w1nyJvv/VTTHiWXOuS9iu+kqBKsiCj2X1QdIJYh
X-Received: by 2002:a17:902:cf4b:b0:299:e041:ecf6 with SMTP id
 d9443c01a7336-29bab191618mr282155345ad.40.1764604464514; 
 Mon, 01 Dec 2025 07:54:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-29bceb0d309sm16685675ad.52.2025.12.01.07.54.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Dec 2025 07:54:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5943838a6a3so2953957e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 07:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1764604462; x=1765209262;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kEg/6pGGoHlc+89GJoVf7YwtKTHSknZrx9CmmEszmRA=;
 b=blme0XPXQf2jFzsYJ26czCez2XSgJdA5dCsp5zKSvVDebpBoYXBRv4smbx64JmitgC
 x59BNx6QsBBW02kp0EgyjkQPgy5SJboNvOaJV/G7crXp8ny7v0/pvHxmJA3+zLq44Rou
 hZa1D6nK2ySDS5sofPbBsZGdT6jLUJmGoc3XE=
X-Received: by 2002:a05:6512:1096:b0:592:ed29:9dde with SMTP id
 2adb3069b0e04-596a3ee064fmr13740420e87.44.1764604462252; 
 Mon, 01 Dec 2025 07:54:22 -0800 (PST)
X-Received: by 2002:a05:6512:1096:b0:592:ed29:9dde with SMTP id
 2adb3069b0e04-596a3ee064fmr13740405e87.44.1764604461728; Mon, 01 Dec 2025
 07:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20251114184702.1909989-1-ian.forbes@broadcom.com>
 <CABQX2QP=F5zFzCub1H_hhBw4Y8OpyeHDNT=uj2CeSjj77gSRcg@mail.gmail.com>
 <CAO6MGti3ZFkgY-3zvWe=R0Vo3a9Sc=ZRXEUbubzDh-bT88qojA@mail.gmail.com>
In-Reply-To: <CAO6MGti3ZFkgY-3zvWe=R0Vo3a9Sc=ZRXEUbubzDh-bT88qojA@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 1 Dec 2025 10:54:08 -0500
X-Gm-Features: AWmQ_blYr7woupC4UmfLd_Um8NYMs-le2fP_5lOeQJy3VwEgti8o8FUkOUAZNJ8
Message-ID: <CABQX2QPayi3OmydKCSBxPgPkeF+xZzZUEj6MPsUF8X3AAC0yjg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Move the validation duplicates hashtable
 onto the stack
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000002ae62b0644e5febe"
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

--0000000000002ae62b0644e5febe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 1:31=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> On Thu, Nov 20, 2025 at 10:43=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.=
com> wrote:
>
> >
> > This bit looks suspicious. It looks like if ctx->merge_dups is false
> > and the resource is doomed then we'll try to remove an invalid node
> > (because it has not been added to the hash).
> >
> > Other than that, it looks great.
> >
> >
> > z
>
> It does look suspicious but since the hashtable is intrusive we are
> just nulling out the node which is still zeroed at this point.

BTW hash initialization, you've removed the vmw_sw_context_init that
was calling hash_init and started relying on .res_ht =3D {}, which while
should work right now because hlist just wants the pointers nulled, it
might break in the future because we're not exactly following the hash
api. I think at the very least we want to call hash_init after
DECLARE_VAL_CONTEXT to properly initialize that hashtable. Anyway, I'd
probably shield that deletion just in case anyway, even if it's just
because it looks confusing.

Did lowering the VMW_RES_HT_ORDER affect any of the benchmarks? e.g.
unigine heaven or valley ?

z

--0000000000002ae62b0644e5febe
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEICZM
wbOJMSd70euaYp5YrJ/soT2/MwAPKSng/wz/m5lEMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTIwMTE1NTQyMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIOx1yWR/dcUqQ/TUSC/6FhNgo9xCGfPXTe8/Pwt
UgeZKpbIGca6NZRqomDaFjZYUNcUDjUrbdL5iXvDys2F7zjR/HaoekkfDhOGIToSO83PPHrHOBCo
o8cXLhx5wMbL76vAPnv+pEFS8SbWf3ojQqfdzco2N4abTKPpzaXKRJt4rFUFO/HRdPx1SUClzb8I
Ks0xUV7dIEyfDwWdNjAOOEcOFL7QiIG6hNQisplcNH2W5cff/ZTINsrnVgRsykOSVWG/HjL8NUjB
3wBYckPRNRt2S1E4gZbiS/TNMgypKabf+kU/D+9u9NxD+711xQbXVIclrSWZTSsxMqPLK2jcsqM=
--0000000000002ae62b0644e5febe--
