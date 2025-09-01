Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AAB3EB06
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B5F10E4D9;
	Mon,  1 Sep 2025 15:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="SMpTfH/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D2010E4D9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 15:40:36 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e98a18faa25so2022293276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1756741235;
 x=1757346035; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=em/9vDUrj0pedA4nKRso3xCwe3GgZ+2y9mHvn6I2icE=;
 b=SMpTfH/LoN8UxK9dPFhuxMdLTLaT1QIWQCBix9dSaqTXEETnVuGGjdH6Unbh/W7gdr
 2EdpHTLzscM2exwE9VP6vrPOJf3he1yN/YCuvI+Q2dVtZJaIMbDA3R8A6SsrywhXyJY6
 ioFprHoNM59kIvYyvYnFxUwolFEj6WjjPB1dwI8J01iOHv/zMiwqNvIdPJtRW0diJIuw
 osxMaLol7FL0FSsoA4swtF4eBgohHTsSeBQRAeIvXPu8VYkxNWCYCY5nhdJtyFMzKM9A
 US8LvmyP3E1LYQ1qw3N+4Lucuf04w7l04Iu+lxkJIpD4VPTEyXAUKnEIak1U7ZBnw2Br
 h1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756741235; x=1757346035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=em/9vDUrj0pedA4nKRso3xCwe3GgZ+2y9mHvn6I2icE=;
 b=GYpYWh4oPUE5DKVrwZi4lFnOn6U4xiDZDvM8PQlECU9HBpEJNR6BmKw+O3U8S0Lpbg
 ysVnk4Kv444m/UlT8odXlsiHBINkMWGhI7PiBqQz0X8NHvhqcp9TG8Y429oYtG+/T/mG
 ggMv28GrTSywkTXOvr5WpeZmc4ZEtiY25AlkAtf9oNus4rrnD8XISjICV9dM+N4cI8ln
 7Cu0cxQCu4/l1wiFKU2fM16GQscBk7+QrrrKkSpnx8FJTMoR72IuxE6/mJYsVWvZUlvC
 zPMy3++YbDEydxH/SZRpa5n+bhygqoa/O7NUYdvuE/mSxRCW4sOe4UHPrlbry1MBHZ9w
 sSiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+6OwVyaK2d8lOjgZXK5QPT/eoAufMZDCA7i3+Q0HdpCfNrLNQNsJmVj6Cbe9EKOL+m2+BIX4k5vw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrYUG8iwpIxgV/bJ5/5qC1fnHcwlFd8honM4Cd4Gaqi3mxfSy8
 wfu7qqkWIerp8J0KJZNPCe3U0/sjK8O6lytd/KGcjcZ0/yLHgSlyAzsgpVxU4CGStdv1rUULtPF
 tJG9qh28=
X-Gm-Gg: ASbGncvCVoMILni4wrD7l3eGhZVoQ2ZR9mBIxg4MjFyjkRGS85GHnsWnBKfJcbm2IG0
 XZYb8okA5Yorc44z52Sa7BwVIcmfxW7PrAQaBIqDN6eYoki7u4R1FHFf4GOjDDB0q6qdrenGJue
 0BmEP4/KdMGRo5/AbDftrbvVTzckrlLi9ecoRED1B2xGx1XOnhCpagycjwMU//rqKuLJD1hBfHO
 b3wrb1dFqz6Xb2FKjLmyOdbs+ZYM88zauipRRpAQ2oStx8hd0iuSs/CeX8oIBT7fmpQZvqsidgD
 Ma+3k4mdiDpokjaeJn3fntWuVf+4mdwlHjt8aCc50z7dFMeBqcYwbM9zYbLd6ecHbxjULVKEOP3
 HUjBxxTnvjhwsA/6YNwGBdDhwDCrsDcGyGiPWaamBBvkrF4KkIj449OkKPA3OsuYUaTL/Li3q/Q
 Qn
X-Google-Smtp-Source: AGHT+IH9CnzDYv4qKJdv0O82uvPHLeh+PC46CkGQ2pn17lnZbyaLJqeBlA0IEdmxrxpM/EYOFjKFYQ==
X-Received: by 2002:a05:6902:70d:b0:e96:c7b3:b726 with SMTP id
 3f1490d57ef6-e98a5820859mr7415124276.30.1756741235126; 
 Mon, 01 Sep 2025 08:40:35 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e98ac5a8a51sm2102068276.33.2025.09.01.08.40.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:40:34 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-71d60504788so36372997b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgWbIAmvGdlQ1OsHHwwa1exQNw6mhF3LLux1orBKBV4YJnXFE13QcNDfckRzQO/gNdyQBtjqDeRF0=@lists.freedesktop.org
X-Received: by 2002:a05:690c:4c11:b0:721:5b31:54bb with SMTP id
 00721157ae682-72276408c56mr100755167b3.23.1756741234330; Mon, 01 Sep 2025
 08:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250826063248.32153-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250826063248.32153-1-lukas.bulwahn@redhat.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 1 Sep 2025 17:40:23 +0200
X-Gmail-Original-Message-ID: <CAAObsKDxqhZ5McrDXD0koa_vZc8NnPHTMbKdNrsPNb9qrKfSCQ@mail.gmail.com>
X-Gm-Features: Ac12FXzuk1Gcnj96u5r1uDpZiwfQREbRtmbKct0ZTYs0gxuteSNfDWyua5Sgwls
Message-ID: <CAAObsKDxqhZ5McrDXD0koa_vZc8NnPHTMbKdNrsPNb9qrKfSCQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in DRM ACCEL DRIVER FOR
 ROCKCHIP NPU
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
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

Thanks, Lukas, I have applied it to drm-misc-next.

Regards,

Tomeu

On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Lukas Bulwahn <lbulwahn@redhat.com>=
 wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit a7352c849492 ("dt-bindings: npu: rockchip,rknn: Add bindings") add=
s
> the device-tree binding rockchip,rk3588-rknn-core.yaml, whereas the commi=
t
> ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU") adds t=
he
> section DRM ACCEL DRIVER FOR ROCKCHIP NPU in MAINTAINERS with a file entr=
y
> referring to rockchip,rknn-core.yaml. Note that the file entry is missing
> the part rk3588, compared to the added file above, which it intends to
> refer to.
>
> Adjust the file entry to the intended file name.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d4bddc462c07..a569828c9f3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7542,7 +7542,7 @@ L:        dri-devel@lists.freedesktop.org
>  S:     Supported
>  T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:     Documentation/accel/rocket/
> -F:     Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> +F:     Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
>  F:     drivers/accel/rocket/
>  F:     include/uapi/drm/rocket_accel.h
>
> --
> 2.50.1
>
