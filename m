Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB351A24C93
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 05:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3F10E041;
	Sun,  2 Feb 2025 04:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRg/+Yb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0134910E041
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 04:03:26 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4b6398d477fso1008019137.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Feb 2025 20:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738469006; x=1739073806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=;
 b=DRg/+Yb2XScfuACxE7OVyK+3FbRjl/L5G0GZn0IDu/47YKCTjUZmbKJWC9hEEFPMEw
 NN8QKn1GxA1MJo/6SuPritNmbNcwBOLbRod6j38xItAAUXcTLdNfgkDu63xscWiA4QXk
 tF4lAILWtiMUOkITNCmuFztJWK/bx4sZMzqvjsVG1gk8/8EG3ccfn/2ZNFeuf4r9gb+s
 1Yjdm2K97PVKWsNFkQgTS88eqs9s1EM8eOc1AdhBgDblHCDsdVI2oB4sWPGJc5G6kywI
 nMuui5OLKIlKxz0mETzt3rcTLGqqyPG9FYY5SIOxBFLkpfCllOZaZykrqL9rGmjg5rwR
 nInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738469006; x=1739073806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=;
 b=uw8X/jn0cc6jl8vFoqH/TPHdSKXoY/yHVBi6C6Jd0Iizzr10CJ3GspEOzW5nkCjS6D
 cwx07WAYi+KNRDu7B654oBAhgBnAmqnThheF02CaJ87eMyx8HQH4M3gB7E7jYu4hP3s3
 4ckr1qTpxIhu+gRlPhyOGOz6Lp2aq3Ax9n3culnIXhG8RYSyNwxD37MUYktVVfsnQ8Kk
 8Ykn2dva5935uzxurImgd7fD4OjlnkI8gTpXtbHhb4vYul/3gF6tGUZOxpekRns298/Z
 boa8bAKvkV0bDA5irWPMIxf8uOhVGaYxGlRr5Hg4QB1Sf4P7HfifkbG24gsT1IaSoFoc
 nCtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD9ZQPNW4zuyesVQTq4xaCr+nnBHavLlKo1jCgC8jm2wnoZa3qk4DNqmhXpf4fBlNXsngPsGvwVxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUcELGWZEJ9cNqbn4KS6bK/mRp28ugV42bNmXnQAQKu+cY/QTJ
 /qRInKsN5NFQ3ouPkua8ICVOdUL4+7x3NZBqyuUJa8sYc2B17xNXxOwySUjJ2XHcXfEf3/S5Yhr
 aqqjseTHWS19CVRi/mNn5yMjDs84=
X-Gm-Gg: ASbGnctIv2g5w3byDJe3rXuMQUlGzvfFGJBhi1+en1xTlYTKgEfl4h29TC6nPtvAuPn
 1D8E66yCEcGPuVgSgBNQp32jFjeOh1+hqw3fi1NHUtYbZDukAfD//ajw2n5UFVcM9EHAkU7E=
X-Google-Smtp-Source: AGHT+IEl2hwFbFW7YBYOu+GLWt5eM+n+AOb40sBzZ1Uqgh3CYrzMGQfoNdzZenlrAl/ISiDC0/BrrxYhxOBYcrRDv1o=
X-Received: by 2002:a05:6102:3ed0:b0:4b4:6988:b12b with SMTP id
 ada2fe7eead31-4b9a523c972mr13337687137.23.1738469005670; Sat, 01 Feb 2025
 20:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20250131165549.GA684322@bhelgaas>
In-Reply-To: <20250131165549.GA684322@bhelgaas>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Feb 2025 13:02:47 +0900
X-Gm-Features: AWEUYZmqMRW6IjLJ2-1W_gEn2kSwXk8I9ORt1L9SvKNpwZDk2Y6UeiwO2M7pvFE
Message-ID: <CAAQKjZNqFt=SYxCzpQ5JwOADRUwsWsq5KzLRoPG++27SXGubnQ@mail.gmail.com>
Subject: Re: wait_event_timeout() usage in decon_wait_for_vblank()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

2025=EB=85=84 2=EC=9B=94 1=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 1:56, Bj=
orn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> I don't know this code at all, so this is likely just noise, but the
> wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
> me.
>
> decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
> to be cleared.
>
> But decon_irq_handler() only clears wait_vsync_event and wakes up
> wait_vsync_queue when !ctx->i80_if.
>
> I don't see any i80_if connection in decon_wait_for_vblank().  Does
> the wait always time out if i80_if is set?  Is there some reason we
> don't use decon_wait_for_vblank() at all if i80_if is set?
>

For the decon series, the implementation for the i80 interface has not
yet been completed. If you would like to see how the i80 interface is
handled in Exynos, please refer to the code for the legacy display
controller module, exynos_drm_fimd.c, available at the following link:
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree=
/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=3Dexynos-drm-fixes#n1053

Furthermore, please note that within the decon driver, prior to
creating the CRTC, it is necessary to implement the TE handler for the
i80 interface in the te_handler of exynos_drm_crtc_ops and register it
as a callback.

Thanks,
Inki Dae

> Bjorn
>
