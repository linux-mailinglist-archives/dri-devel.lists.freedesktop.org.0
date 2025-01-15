Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2BA11F6E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1CB10E5BB;
	Wed, 15 Jan 2025 10:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4EA10E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 10:30:41 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-85c559ed230so1512289241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 02:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736937039; x=1737541839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fFz9PasHUXW73JJSPpGUZLnbjAFldUmvO6Eocb/wDHE=;
 b=Uf5SAOCQI4ptNMwT0kwXx/FlHevoHsJh/f6Coar0jngE/mg+ZhmmfWE49pEztMO7Sh
 2XNxGdPoIvRUjQpkAXBi0SibJrqi9nIlTqoxlAYvVGPloMvXiVlDYjKglzoLeoSOeBet
 Lyl2g53AnmMUCiAnEumAJztfRggfPpuu2MjS0ByC8f1YH9EhxYlvLNbiCQm7WZwFDhY/
 aDHYB77ahjptweXOb44DGXlWhRkR7C33wuOwxrqbaGdveWb4sv+rQR3Ww3lMM1Wgl1T+
 BM9p6gEHU7+Ffv1IDYq9WxyHt0oXg2GXNIGkFlfdjNP3vvmGJVdnyQnaDYPJFb6uPbNE
 /zUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg1sV4GgJv+Nez7N5LwdwMXbeHLA02sf0mWGHrQPS+xIQ+tg8LKhwvqPHZUnEusy3/nghZGxQtOTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySs8PNa54TLXxO2WpvBPgp93DAusucPkNrgq9F68z1ktuhksTo
 IVOB4ryh+FizFGotwLEG5krzcJZ/sBmhv0TX5ZDxB/c8WRQJl2qXO797MOjg
X-Gm-Gg: ASbGncsoP+QAOuqnWts7im9RJnmmWnYeq6j4SRmlztos7dCyeFqFYZPM1RSDArdIVNF
 LzGLez0zTyuj0iHqhjZ+MIVnYZCvjeRmSCdTk45QFVQZKd7neYIJUqgoCLlDOhSgLUK+auJyEIV
 TCLRxfP6mGwnGBm/+/p9wYJKEtov3J8GvoyMz45mFFpGFSHXlZ1QAEnODB8DpzGcMpyTbp1MnOz
 j2if4x3bIxNm1gnYxqgqbKdCcEmfp/SNFEJ7m+3og0PwEDI/VGMXO4TsXnD2WABXZP57xW45V2j
 MsREXbGwh4detfWad5rvRmY=
X-Google-Smtp-Source: AGHT+IGtb0Jhgyh8tCPmnyuFw+t6MJQQjuDPOnyDkvufuPtHwTOQZe2bx5ZUDZAyxZdzST1SRCbD3g==
X-Received: by 2002:a05:6102:418f:b0:4af:e99e:b41b with SMTP id
 ada2fe7eead31-4b3d104ad80mr27316693137.19.1736937039196; 
 Wed, 15 Jan 2025 02:30:39 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b60916f9e4sm5022254137.20.2025.01.15.02.30.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 02:30:38 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-51c8460328dso2214295e0c.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 02:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6BWQ506r/hY2uAB+7+WiO75OeP4o5gHAvlfFWAb0byiFcJe9Es5MOGyrJkxdalBwG/GgFA3u5PgM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:41a1:b0:4b6:3d72:5c28 with SMTP id
 ada2fe7eead31-4b63d726a44mr11631291137.18.1736937038252; Wed, 15 Jan 2025
 02:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-3-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-3-160327ca652a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 11:30:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMEEuCcmzvet=9sfYzn2_XtSkTgvpHkYz+RALCzHDzfg@mail.gmail.com>
X-Gm-Features: AbW1kvaABBYHZ4mYsO-unZqxZKnHe3EW4XQryVGulktTLq2QtVWgYecDsS4wN9Q
Message-ID: <CAMuHMdUMEEuCcmzvet=9sfYzn2_XtSkTgvpHkYz+RALCzHDzfg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] drm/fourcc: Add DRM_FORMAT_Y8
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

Hi Tomi,

On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add greyscale Y8 format.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for your patch!

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -405,6 +405,9 @@ extern "C" {
>  #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-su=
bsampled Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-su=
bsampled Cr (1) and Cb (2) planes */
>
> +/* Greyscale formats */
> +
> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit=
 Y-only */

I don't think you need this. We already have:

    /* 8 bpp Red (direct relationship between channel value and brightness)=
 */
    #define DRM_FORMAT_R8           fourcc_code('R', '8', ' ', ' ') /*
[7:0] R */

See also commit 8aba4d30520ed656 ("drm/fourcc: Clarify the meaning of
single-channel "red"").

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
