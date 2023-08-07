Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB6772B0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6B10E2D5;
	Mon,  7 Aug 2023 16:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370B10E2EC;
 Mon,  7 Aug 2023 16:35:31 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1bb69c0070dso3611194fac.1; 
 Mon, 07 Aug 2023 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426131; x=1692030931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DqtZMNFkHtE7NtetbFmM02AlfhGVT1s/OA7WGoZWJgw=;
 b=O1FdvLNo2u7VnDpYvsN6GXkWaNuvA32nyCOocicZIPzzPZRMOxyL277vOMBmL5x4Gl
 KhUfU93Yhb5e2he+cOSbqICKKNtdT6+oIq62WjFjw7v5wD4jS+JQ6m73KWbmT+JY1lAu
 GPaLtWWeG/1GW1PuhLgrTGR+ICKWqHmKUl5OYv3mI6+Tu+InSpweqGoe5XfwNbD3OW6o
 OtE7d5PWwTaIVSOiBPKSON4Yj8nbFH5wsEvrMLpKXdAl+jxSYJbhzA+QMf4rVLDjgwo9
 oE12Dorsx7+vIOscd4oEkB9OfA52u3Sv5VTqvj4kB655SjgQoieEfaO/QaOemmhqdQyE
 0QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426131; x=1692030931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqtZMNFkHtE7NtetbFmM02AlfhGVT1s/OA7WGoZWJgw=;
 b=hZT4DExhIysSEJpdjTb3tvWf0XK1lAUAaadGWmyXav9h7TBv3ZhILwbcEFZLXkspE1
 aenlQSruSkHGNpRgIqAbmH9VrGf4TwzmU3aF4Il2jW0PuxqzleqqFZLVLCejYJa+9gO4
 4IYDNTxaOeYTxE3y6Ntnzlg7Gun8+PvoYhsUbT8mE+e12JyZBUWOoUGljxHNXu3RFdbH
 bydasuwLglXvCWppDweYI4kmH0bQDsVS2pXexhtLEHHJjeuiiSLRzxXeE+6PSw1Fw/k3
 q8kFo5yiq1Bymjl3ubtOK91HvweoB3Zq2Z/gOhmvtGZ5d4p8D47wFbB8Nj8Cu3+YJNiy
 AY9g==
X-Gm-Message-State: AOJu0YykZqa011sliOoph0YxcM9Pht+5wNQceZ1nBqQEsSXCiJOoUWs3
 qliUBnJO4Dh7Ypf5mvidhnOPJjswfrvUMBhryyY=
X-Google-Smtp-Source: AGHT+IGhboSGrM8BwO6WHv6vc0JZfIHQ4hqv0io3t5Xhe8kg/xy7oZ3nOWEcRemjgOL8st18ke2YT0XkQwSfONDDXFc=
X-Received: by 2002:a05:6870:e74a:b0:1be:ccce:7991 with SMTP id
 t10-20020a056870e74a00b001beccce7991mr11787641oak.13.1691426130867; Mon, 07
 Aug 2023 09:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230801075507.6377-1-sunran001@208suo.com>
In-Reply-To: <20230801075507.6377-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:35:19 -0400
Message-ID: <CADnq5_Nzn41tiiYuA8mM2FuhUQ5xEeuGsO0WkAtUKNfKoFxYeA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in common_baco.c
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 3:55=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: code indent should use tabs where possible
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c b/drive=
rs/gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c
> index 1c73776bd606..fd79337a3536 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c
> @@ -42,7 +42,7 @@ static bool baco_wait_register(struct pp_hwmgr *hwmgr, =
u32 reg, u32 mask, u32 va
>  }
>
>  static bool baco_cmd_handler(struct pp_hwmgr *hwmgr, u32 command, u32 re=
g, u32 mask,
> -                               u32 shift, u32 value, u32 timeout)
> +                               u32 shift, u32 value, u32 timeout)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)(hwmgr->ad=
ev);
>         u32 data;
> --
> 2.17.1
>
