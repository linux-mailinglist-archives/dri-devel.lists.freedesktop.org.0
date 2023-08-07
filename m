Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9716772BCF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C3A10E2FE;
	Mon,  7 Aug 2023 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3C810E2FD;
 Mon,  7 Aug 2023 16:57:31 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1bb7a1c2fe5so3509354fac.2; 
 Mon, 07 Aug 2023 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427451; x=1692032251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kh1xzBadLmh2qA8wkKzSd+vRAvsZi6LIWJNonqOAF4=;
 b=AINZ+DhsEQhQlmOljZ+xtGPGL0DytFbSQVnn73Q1Je/I5GOFflZx0PfcT8ncmMcq+3
 Z0OKGSaHziRAa+r+aSbsc17Kw8zVFenaJ2BGpA5KCKQyqCfeNm32zD26Oktr5hBxPOed
 O6xS+pdu1Hx+hPlizgIl5FFSYp1ykPSyA7HoxMpKEVcxg3mYY0vlJ7Wp97Ys0gUHcawW
 uQLcivNjmeyUjso4zBNZhTyC3S4A4BAB9dsOTJVemlBQkDVfVbCXbHmrG7++DuQaMECR
 WV3JngWAvz4SkVrQyXbDWr/CIx2OTiVltJcY/f/0XpCDq2/unP8kEPU6Zci8bPZD17zZ
 hDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427451; x=1692032251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kh1xzBadLmh2qA8wkKzSd+vRAvsZi6LIWJNonqOAF4=;
 b=JXttm3PQW6mi8DjEluQpkUhhHtphAFpapWVtmc13mfBbLGRK3stpyGUAMUAfSW7c3H
 ZfhosEweql3+B9rGcv+eMgAX6xCcdWBgS2CVw9JqTg6IY1eFp9O4H7hxh7iQgZWZR+uC
 JorkgAHN5/O7kiReo4eTGQuu1s3SDGh3kdrLu9epFPXuQYdWM/WGO5x/uSEX/emuRVyp
 lqQHrgyG7eMnHeaaJl8vMuXQz/YXBYMMa23H0QT7AhPZHFONrIaTlDOYSsP+ukchAHkV
 bVf6s4jmb0maKbW6cta60fgnN0NDdybDRiGjYNqW4y5vGJMhDLxAAJD0bHamUujUQkjT
 c3iA==
X-Gm-Message-State: AOJu0YykZ8LpxBWdGcMrqIuZFAiY9E1DLOk8nPZCAa6cgke40bt0HWRc
 jn6PgdxWmpBSUVO/2DIxng32NS595DbETrDurQG5Lt+v
X-Google-Smtp-Source: AGHT+IFgIiyoPnCL1Z493bDNIEvDWWcfT8nAXm9S5Di6zVxHONd01uFMyhOHHiViiSNz2wtQ2zBhupM9zVUisfGmTUA=
X-Received: by 2002:a05:6870:a113:b0:1bb:8d8f:9c6e with SMTP id
 m19-20020a056870a11300b001bb8d8f9c6emr11573707oae.10.1691427451074; Mon, 07
 Aug 2023 09:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230802013118.8677-1-sunran001@208suo.com>
In-Reply-To: <20230802013118.8677-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:57:20 -0400
Message-ID: <CADnq5_PAxk1EvXnPMT2xVTFyC1E7f_ThtH_gqhKrM7H4v14a=w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu7.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 9:31=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h b/drivers/gpu/dr=
m/amd/pm/powerplay/inc/smu7.h
> index e14072d45918..bfce9087a47f 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h
> @@ -101,8 +101,7 @@
>  #define VR_SMIO_PATTERN_2        4
>  #define VR_STATIC_VOLTAGE        5
>
> -struct SMU7_PIDController
> -{
> +struct SMU7_PIDController {
>      uint32_t Ki;
>      int32_t LFWindupUL;
>      int32_t LFWindupLL;
> @@ -136,8 +135,7 @@ typedef struct SMU7_PIDController SMU7_PIDController;
>  #define SMU7_VCE_MCLK_HANDSHAKE_DISABLE                  0x00010000
>  #define SMU7_VCE_SCLK_HANDSHAKE_DISABLE                  0x00020000
>
> -struct SMU7_Firmware_Header
> -{
> +struct SMU7_Firmware_Header {
>      uint32_t Digest[5];
>      uint32_t Version;
>      uint32_t HeaderSize;
> --
> 2.17.1
>
