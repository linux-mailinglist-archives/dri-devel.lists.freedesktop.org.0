Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD07772C94
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1810E346;
	Mon,  7 Aug 2023 17:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F194010E343;
 Mon,  7 Aug 2023 17:18:44 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-56c685b7e91so3124705eaf.2; 
 Mon, 07 Aug 2023 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428724; x=1692033524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47Rr/3UghjkQtHtnUD+LxrBoaPTikVLYxh6ulykjDi4=;
 b=TXhdtRQx2FmIOpLDtEf2CxM8TfUx3IKKt43guRPsVD2I3e4VN3U1DDE6vxswepiKXP
 yGtAbi42pg1rMhZ9WzSDjb35zj1EfeEnluDaJXoCZlZ+Kb4BC9IzChR68EnOGYYU1YRk
 VaJ+VLFCKRH6wNX0aBWNept//AvlhiMtw8+yoo7czF8t4y7vULYHopiFRjN5Rf5DKjza
 caXIkPnUuPq6mlz9TfNqNx0EtoHC+7oejVkQPJ1VDo603Vi+IFDDOpQHbrdpjsUR5TP6
 rbIbxEuhlCrDMrK0eyPH7OKj1NPuAaZ3bBlsy5LWwk3rFYf4UIoUQpK4G6kOxSSd2KpS
 yMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428724; x=1692033524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47Rr/3UghjkQtHtnUD+LxrBoaPTikVLYxh6ulykjDi4=;
 b=k5XVy9Eba/7Q87E/wBZFHZOOq84Oyn63pnZnppKjSMk/XjEYUrKUDOwxwbjdIsR2Ko
 IJ5RmYhTtGN3h4Y+Hv7dQulP2x/+HQGAjEg7HuE6xUjQWVgozY63t+m5TR3+EgHtwXes
 YWnb5cxDBfvKWmDDmFz5v47h1thQoAPQfHffhaEKetv1hX8DSjgXnLd7MiU6NtixVjqx
 vwoxRQVOwpFy8Ubyg7SudEWvCRhLQ9Q3C5YKnXh3RvJYazxFI7/Pbz9Id+q8rjMX9SG3
 OAFkVWSAXx+Qhl+GATNgXYEB5ctZCzyB+sFLrAM7Ofpm5wIWfEGjPYiyrKWwV3rfm4Im
 +zVw==
X-Gm-Message-State: AOJu0Yy0OilYaUStCyDGsbNPUfjHNLiER/eJq/SkPdsJg0i2TI09pkfS
 w64QIrXUCgEebsB3FBHPRC8J+0QOtvcLWr66x+4=
X-Google-Smtp-Source: AGHT+IGoKOewF1vuvkvqzojnNhMFKp4viXf3zxLKQiaT0fZK5/PbD41GPWSxmCvC11eqAMgQJxf7OuNGuEVeUXHX33Q=
X-Received: by 2002:a4a:8554:0:b0:567:27f4:8c45 with SMTP id
 l20-20020a4a8554000000b0056727f48c45mr8880807ooh.8.1691428724196; Mon, 07 Aug
 2023 10:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230802064606.12005-1-sunran001@208suo.com>
In-Reply-To: <20230802064606.12005-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:18:33 -0400
Message-ID: <CADnq5_P6JgNkvrV69LDc7xcbOnLD9suUfdBnxK0NR+mHPLwyAA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in vega20_ih.c
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

On Wed, Aug 2, 2023 at 2:46=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing statements should be on next line
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd=
/amdgpu/vega20_ih.c
> index 544ee55a22da..dbc99536440f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> @@ -500,7 +500,8 @@ static int vega20_ih_self_irq(struct amdgpu_device *a=
dev,
>         case 2:
>                 schedule_work(&adev->irq.ih2_work);
>                 break;
> -       default: break;
> +       default:
> +               break;
>         }
>         return 0;
>  }
> @@ -710,8 +711,7 @@ static void vega20_ih_set_interrupt_funcs(struct amdg=
pu_device *adev)
>         adev->irq.ih_funcs =3D &vega20_ih_funcs;
>  }
>
> -const struct amdgpu_ip_block_version vega20_ih_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vega20_ih_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_IH,
>         .major =3D 4,
>         .minor =3D 2,
> --
> 2.17.1
>
