Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D0B143AE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 23:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2451210E1A0;
	Mon, 28 Jul 2025 21:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D44l0Cu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E61810E041;
 Mon, 28 Jul 2025 21:04:11 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-312a806f002so655831a91.3; 
 Mon, 28 Jul 2025 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753736651; x=1754341451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQOZsxNcIwMWPzO0eYphZcFK2aSCHhJ8B+H+YjA4cbQ=;
 b=D44l0Cu6swSbu9xiEDbfFC0J7rGYXjI33jTTUldpLdqSMLVcyK4SMywWLfBQOrQxhz
 il0a2TPy34rFRdee7Kl6ZphOJKVP8N0RJOCHQ+zEaGwhGGUduHJTDHNckzlmeUNK0nEe
 8O2UUh8UAY7DRcVZFLpWIf3CMkQ3TVAVuNwTC2ZOQlfjbyH570XUeHSwPNBg7wfIFe2J
 H+zDBotr/SCPSNfYEtTteba3lz+qcYD8UG6ww0indDexk0K2Pm8E26dWh+xPAvWRUdfz
 J3p45rL4VmyE/YP1xGdqv/FZrIKQ5FRPRRcqLyJxtqCsEx97Ww/Yel9sf/Ia0qKAoydY
 W53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753736651; x=1754341451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQOZsxNcIwMWPzO0eYphZcFK2aSCHhJ8B+H+YjA4cbQ=;
 b=fb5TQbmn5cKDyIIpeOiA1SBu6SN4z0X+SUDTaounb+DGrrzjq9zoNSQHPGKIZnndIW
 VulwdDh3Mk7h4NCD7UVUUV1dnBgVq7GJTKeRhu2wDuQp+X3FuwddhPIdFuDa07cPaaCV
 cm/59m4tqOClc99j6lXOGYbxODBCPnTdX4O47K1CAcgS3lFvYECqNvX67kO0Cq9ESoQ5
 oCCaUFefOxkseEUWfxEDECZ4X4GhVvCL+rt4jrUNII4B1W0cnI7f5qZvuPSOolSc9/dm
 qieuLFvSJOVqH6kF+PGqIEIdNsxEDIBNYVIdnXQk8czGo+F+P4DUtfWF2xGYdE/lq9fk
 WN6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwD0jkhWY9EWXQXCOfkmyYUBszWplndqmkUvQzq3pI/oO/hclhTpeHCOVNUrKVUILLWa97xgtm2nk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOQi2b6SHcXATELJgmzgkJbg51CcKP8Ye0EqZMDl+H3D1sBROu
 lcXkZz8R+BZ1HnT0ZglkSeeaBwWbpf1h6Uez2kshHXTfZRX3FG6BH/ZBqWBJH+NtQ8cS0aliHdJ
 RC/BkyyDW8Q1C/cMBFCS/Dgx5MtcM+lk=
X-Gm-Gg: ASbGncvEFehcNCO7P5NLlEuuFgvO8m6xvyIBnKKvJQisbwkEmfbweZaRzlw9TizHEhQ
 0uT7g8CJqqa08EbTv+DqG9WbDjyoZnDHJLHVeXWN+zzEr2ycJ8VIpfMvbjTGOWLUY+vux2MQWvQ
 gYryTzQrbMr8bHxkaKpPUOK9XfnNHdtvNjiQd/jIxboip5nQT8iGb9JrTdrVXa8UX02uetLK5qg
 hV6HU7Ge3X22g+e4Q==
X-Google-Smtp-Source: AGHT+IHXV4AozNz1QhmqR3N4z/5+NI9Qmws9ZNXiu9ZBNY4JEZhI6MM87EguI/j4COGgXvJ2GC/HeH+W5+DXY6EfEJo=
X-Received: by 2002:a17:90b:4a81:b0:31e:cdc1:999e with SMTP id
 98e67ed59e1d1-31ecdc19b15mr3744592a91.1.1753736650794; Mon, 28 Jul 2025
 14:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 28 Jul 2025 17:03:59 -0400
X-Gm-Features: Ac12FXxL-grY8XpxM4b1WvaHOSNhuOp0PxeaB_JShxxPOJcM1Ma0s4Hr5Qf_lsc
Message-ID: <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> This is needed to properly interpret some of the sections.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.c
> index faca2a0243ab..e586577e90de 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_=
obj *obj,
>
>         print_name(p, "  - type: ", a7xx_statetype_names[block->statetype=
]);
>         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
> +       drm_printf(p, "    - location: %d", block->location);

We should probably at least try to keep it proper YAML by indenting
everything after another level...

>
>         for (i =3D 0; i < block->num_sps; i++) {
>                 drm_printf(p, "      - sp: %d\n", i);
> @@ -1873,6 +1874,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gp=
u_state_obj *obj,
>                 print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_=
id]);
>                 print_name(p, "    - cluster-name: ", a7xx_cluster_names[=
dbgahb->cluster_id]);
>                 drm_printf(p, "      - context: %d\n", dbgahb->context_id=
);
> +               drm_printf(p, "      - location: %d\n", dbgahb->location_=
id);
>                 a7xx_show_registers_indented(dbgahb->regs, obj->data, p, =
4);
>         }
>  }
> --
> 2.50.1
>
