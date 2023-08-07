Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95252772D0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9C10E370;
	Mon,  7 Aug 2023 17:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463010E36C;
 Mon,  7 Aug 2023 17:33:02 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56d0d7300d9so3327359eaf.1; 
 Mon, 07 Aug 2023 10:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429582; x=1692034382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slNXbmbSSnIwi3BpDNUJS0+fwnT8XgMHLlRFXSdcVVg=;
 b=kyVwv0vLuRg9EY/dgRbk8n4WXHmYQ04yaQgTCB4v/M8ramvvAGtL5yG4GTx+bD1jdi
 QRV1GH2b8yQBt9IyCYkOq4N7iliFzJ0CE63vl8XW5EeMg8JKd2qFcsIQ+ieqZno4m+vo
 HBDtOaHPkne2kT8uWWNvteB95MSi8jWiGUIRV342qKJY7QCi6zr3xDe7szTj97WEroRw
 oC+B4ENHKteZxs6RCmbgSb4geAbSo0rWAPOtkVs8sSd5ZqBsNeLy09q+pfN+R5H7oA9F
 1vKML60T1L69es1bKX/xOqe+Mqa/P9MCL0gwQ7wEulST6P/Jum9zvlLfgrfbC/VAnj+4
 vcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429582; x=1692034382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slNXbmbSSnIwi3BpDNUJS0+fwnT8XgMHLlRFXSdcVVg=;
 b=fx/DW6k3b/Vmgq9CJNuMyRepdnnhfsiFUR65CrZTyO7FGDdJhD+101+MYGXsPI++EQ
 RLNcN2FvB5JagZpKtDVTIMb4DihfgGXWaVJHV6G5PFLkJgLr1uWgqFIT1EBms9V8y6La
 0E/l1JkHScII4Hhly55onlu/WW1oWs/qsy96fKeFHgs/Oqa/4v/Dfx5aN2Dz8BXDVSMA
 iQjo7j06v5TehV3GPv6yJdxVb0HKfAMcy5yjE1mBH0MqvjXfo0dMYTPz2N+FD5/SbnMZ
 fDEQRpA3N+RZ12t8yEAzZupi1lO1LmtmK9aSf2YtGZZID/eIHYSKaHMG1LVzU7TLE7pB
 cXuA==
X-Gm-Message-State: AOJu0YyC21yk8+XamInPy2GDOfOEKddAh1GpwloEbcMNl8ZUIW7UvDjm
 4tn4kTTB7MMmUyqSdGixntwqbfoIqO0AKbWnqhY=
X-Google-Smtp-Source: AGHT+IFkOeQkxPjn4cm9wX404EzPeGgHSyPEfKx3Z41F0ikI5Dv6r/HQGP8wlX8dojWOe3D9aspuzyqqbwmJVZRu/fk=
X-Received: by 2002:a4a:7658:0:b0:560:ac0f:b87c with SMTP id
 w24-20020a4a7658000000b00560ac0fb87cmr9846723ooe.8.1691429579607; Mon, 07 Aug
 2023 10:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230802075014.13861-1-sunran001@208suo.com>
In-Reply-To: <20230802075014.13861-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:32:48 -0400
Message-ID: <CADnq5_NiDj8fO05_67E8ccRwZg2j-fekwbi54EiTc+haQSUvBg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in tonga_ih.c
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

On Wed, Aug 2, 2023 at 3:50=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/=
amdgpu/tonga_ih.c
> index b08905d1c00f..917707bba7f3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> @@ -493,8 +493,7 @@ static void tonga_ih_set_interrupt_funcs(struct amdgp=
u_device *adev)
>         adev->irq.ih_funcs =3D &tonga_ih_funcs;
>  }
>
> -const struct amdgpu_ip_block_version tonga_ih_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version tonga_ih_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_IH,
>         .major =3D 3,
>         .minor =3D 0,
> --
> 2.17.1
>
