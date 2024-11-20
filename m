Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7849D4389
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 22:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187C10E3CC;
	Wed, 20 Nov 2024 21:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AtSw+IkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54B710E3DF;
 Wed, 20 Nov 2024 21:35:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 04296A432BE;
 Wed, 20 Nov 2024 21:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B797C4CED2;
 Wed, 20 Nov 2024 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732138529;
 bh=221kYit23f9QJxeOwC9neMdzrf/0CgYCMcgmEKVkURI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AtSw+IkENfdI0iMOfNeq7N4J+o6eLyrxtLEhUpNLjN764qstmpkWErj6nM+WDxFvC
 KS7baZBiPlfQLyoTVQ/ZbCUOmn1KwYvwDisz4fYt+46LgWWwFgmx87JbRw81D8U5VW
 /5aAVRIkoBGzlVt7DEabGrd7tK2chDyXUo80bw8xJNFQGGdwwYIDozvkEdrWk6O2KO
 0QX/rMGIZG8oH7EK2KxZJ8jACWLVQAzonzZUsCGBSf5Y/fg/NkAxhEHeHWB2dQYD1u
 IyN5E9jT3qy/B84GjPNFhwk0Nth3O31+HsseGvRqzl+zYnc3Nnsv2Pvc/Iyxu/OsXc
 M4Zk+a4/J6gug==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo213138e87.0; 
 Wed, 20 Nov 2024 13:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSp/1EQ7PyFbrQid/qo+tPD4YMMJTyH3KPn4QHSMp5BcleIfCt6ydM4wl5XzgFvEbxs3PkZFiLHyU=@lists.freedesktop.org,
 AJvYcCW/Kwr8whVEV8n3+OlyTorNGVRuCYljpTbqHvJHLGCj/199uvHRXRqXe3Jle0g1n9bgsCD9hvXVoeEe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfOsCsHnoarXf0+7B2RdqfWQ/L7fSf3JEZPxpYBDCoH9p65FOY
 x8ctmia3eoSISZRSKt8Oli2qGO+ZGBf4StARLmMWjgEeeX8LubleYXAB1bd0grSQf9IJmtdHTy5
 XtaVIJ9+dvPMy24V9Nf9zhTDES9M=
X-Google-Smtp-Source: AGHT+IFtmpACgo2WdBjeF3KSeMaOZg3iR6IINYTuzz6B/NBI3VQXA/HLNEHHfQg9tbjwQt/LklOU87alu/iYAe/eofU=
X-Received: by 2002:a05:6512:3d8f:b0:53d:ab15:1aee with SMTP id
 2adb3069b0e04-53dc136dc37mr2166462e87.49.1732138527773; Wed, 20 Nov 2024
 13:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
In-Reply-To: <20241120204125.52644-1-pvorel@suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 Nov 2024 06:34:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
Message-ID: <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>
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

On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> It will be used in the next commit for DRM_MSM.
>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v3->v4:
> * Move definition to the end of the file


I prefer to not check the tool.

Why don't you install python3?




>  init/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index fbd0cb06a50a..c77e45484e81 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>  # <asm/syscall_wrapper.h>.
>  config ARCH_HAS_SYSCALL_WRAPPER
>         def_bool n
> +
> +config HAVE_PYTHON3
> +       def_bool $(success,$(PYTHON3) -V)
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada
