Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0908B978B6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 23:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D578010E32C;
	Tue, 23 Sep 2025 21:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QcVUiynb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A50E10E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 21:02:00 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2698d47e6e7so12970565ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758661319; x=1759266119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IiShayob+wMbBulEHfowX58N88DexQXEmp0Our0Q2Vg=;
 b=QcVUiynb+UcZP7Juu7185igt5HkIOj93agJPhP8oToZSXdGA29OWn2f8TF4kHeFUPo
 XkHsyp/L1VSZzAcmO/pQYKbnFuvFG6V56zoTB7tusL3s3eh+1JVaGvqD+wiXskwgYk/O
 jBxKh7vaTsFtwgHnzArUCtgtEqH2/hJItuQTBZZ2mS1xNk7D35Iem3gf7Of4sj1215iY
 sb2ksMb6c+Tr4PJcc0r2uEVposkcF4av514Ur8F5jRc8wG710dKsaQjIu8M1QVs0Itzd
 wX9VSAiY1SYVvzJv6mwGnbnZgoocN6A7UMXUI7Rj0NIZTDp4h+A+KNWtcqCSFpoGUVAx
 TJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758661319; x=1759266119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IiShayob+wMbBulEHfowX58N88DexQXEmp0Our0Q2Vg=;
 b=U9QToSr8kdaQuz8YOq1KjfejmM/JGPCMTlrNcLgZVd3KIEi7BvX4ojRZKzbiGm+pDb
 LkGkw+Gt++GUh3nejOkU4HbRawMFoFgdWI33IYjaSozXAy2iutnzpEZscbl8SkPhA/Jq
 HjAtcHjd9Q6fPBoXJhueBuySPdCSYG1LoSWmAlC9PS35eNcsrHv3owNSat0KRUJpbqN+
 dJFNeo94iminEKPCu2d8EsayBAATuqm9kjt1Oig9DxVi19NEHb3Mn8ild9AteRsGrNDL
 VKeCt3F1ggVtklKeL0AT72yA1Jl96uKcKhLmp+Bji15tn7t+gIPMcU4ACXIbZS62qskH
 V2rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLobLwL06/qBGij+3rB16jZVH3R+4iv7SdAhb8Wtl8ym30qA71X5hgqz/UjgOfB+dBll8qZdG1jck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOKL7lIgCCnbH0uAhOFF8ibFqnueUers6x1gbQPrJJibADXW1O
 8dol1v/AD/ywlhAZWYO9TzpaZ9VMAO7oMSinrSqLfbdq0j4e2T0CEV/77JRVS+kI6RFGZz81xRY
 eZwZKl4jmYxM3rEb2+lJSgr1AFh6OGXs=
X-Gm-Gg: ASbGncvX9IqAdA8uqPSJ9yopJSM32kAbYs+VrrT4XeNLrg+YATi3kg9rfFkZCXMXePZ
 6le/Gv+TQFZ1xgn2CGC8jJEe+syIer52GkVkxZwtO1FWmnul7qRm1zprrb/bFa1WGC94wmkxyQO
 iBmvIgPADjAeevGjcKbelnye9MTotSVfmKSxj8UcNXkVxhWzhOq+qCCz/VAa54bt/MemvNBA7h/
 oKQAk6PWPfAfEtGyg==
X-Google-Smtp-Source: AGHT+IGBIpx9mrFyDSaaGSwsEdyPQMz8HXLpGnW+28xc1uhmMzsInV1+Wy3g/FV+hkJat3S8a2AqMq6CslP7cPKpxFE=
X-Received: by 2002:a17:902:ec8d:b0:269:67e9:4c20 with SMTP id
 d9443c01a7336-27cc41d582fmr27553505ad.5.1758661319381; Tue, 23 Sep 2025
 14:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250923171409.25927-1-hsukrut3@gmail.com>
In-Reply-To: <20250923171409.25927-1-hsukrut3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Sep 2025 17:01:48 -0400
X-Gm-Features: AS18NWAaDRkmma0nmJvOC0wFTTFBrD_CmBl8W6TTz0Z5Vyhfubp9ivnudhX4kc0
Message-ID: <CADnq5_P-UsY-uCYaTU5nA9jioCaL5jNPQHFn9YdtsBEVC_4aVw@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev/radeon: Remove stale product link in
 Kconfig/FB_RADEON
To: Sukrut Heroorkar <hsukrut3@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
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

On Tue, Sep 23, 2025 at 4:19=E2=80=AFPM Sukrut Heroorkar <hsukrut3@gmail.co=
m> wrote:
>
> The product page referenced in the FB_RADEON is no longer valid.
> Remove it to avoid pointing to an invalid link.
>
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> Changes since v1:
> - Dropped the link entirely as suggested
> (See: https://lore.kernel.org/all/CADnq5_NHu5=3DesJZrgy_S80jF68ZapRRYX4_L=
70DwDDSN3VXitQ@mail.gmail.com/)
>
>  drivers/video/fbdev/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index c21484d15f0c..27639b2590d8 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -948,9 +948,6 @@ config FB_RADEON
>           a framebuffer device.  There are both PCI and AGP versions.  Yo=
u
>           don't need to choose this to run the Radeon in plain VGA mode.
>
> -         There is a product page at
> -         https://products.amd.com/en-us/GraphicCardResult.aspx
> -
>  config FB_RADEON_I2C
>         bool "DDC/I2C for ATI Radeon support"
>         depends on FB_RADEON
> --
> 2.43.0
>
