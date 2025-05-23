Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BFAC2A8C
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 21:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E3610E845;
	Fri, 23 May 2025 19:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dsmJEqW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF7310E845;
 Fri, 23 May 2025 19:46:44 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-867347b8de9so43749839f.0; 
 Fri, 23 May 2025 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748029603; x=1748634403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VH7Kc1vKStGhdLpNpPoNF5u+RXKK7FsevcMrcWkSN7Q=;
 b=dsmJEqW39+L1+V6mPQpgGc2qbl1s2Dz0eJOuYM95f7EQfIgMar9v7v2oC4ZpOlSyK3
 ndyE8lM1BH9vhfFyTIDzHq1HTAelXsnZuGETgpjB/rMjCHcHaPA7sXnb8A1+8ZiwxA62
 rTfdM8hlZ9KlwX+zQakj0pZy/VHHAtSUNaUnR8G6Qwq/uhXafhYuj5l0eFDh8TUmVYuy
 N5Jo+J+C4FwY3x0iOg3SB1arW+0n47FeGX5JnEN36IItkaOUqLfSQDjm8ZntpjblmfDX
 W/C8VpPau1RzwFBlaOdJ6Y9wEfOBKQ6GNvugmvcCIJZsXCEuLYdYnT8SkJL2Eu0Syi89
 vEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748029603; x=1748634403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VH7Kc1vKStGhdLpNpPoNF5u+RXKK7FsevcMrcWkSN7Q=;
 b=u/3fen8lvhi7euH6nxlVcli/Gi3qlDjwdkZkLFKCSjbPOVmuqNZGj1EW/ES0Z4yKNE
 D3ObRe9tyeNqN1K6ISZM1tGiJakd1VDIwSxMJROwtdVveV2NqGdZOh723+eDwdrDZUBv
 3QuC1W1xZtOUwzrjs1/5lL+qEKcn2CBNzmnRNK4wP54v3LIzbmhgL5tUxO0V/5SPs0cN
 XBq86ImzBEIRYQfevQloOJ+7KPrTMUkr95Q/fy4+QVOtDFenZ4vk1uqc0P7Wri2VJfVt
 Xun57+Ao+ua9Ye3aD6i4sXsl7PLamhP9+Kez+ZoeCl7aDBMq2jgEyv53E+izkz73JguA
 JhDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Q/fgjyqUs4lsTsNrhFw+EIG1EEW5iKQOrlrh6Sz5IvAapghn0agH3GhA9FPDUCUTvONgRm/z3oM5@lists.freedesktop.org,
 AJvYcCWv45JxmCsBIytBpGjnzRPDeUWEYxV9oPXJw4D/LUdKC02zgexDT1sZ89205eGuI6F9Y3N8s8yEymA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx6SC6yXVjFMraYDmXdXqWA9tz8j0EEnKUypkBi9MIZOgEcq/S
 5dW0tHfTlAz7XF+PwjX/2PoOr88j/LRhz62laLQyv0F25MhHsdEPDzJPNfxcpuUS1CzhKL3VMac
 bAnzzbFW5MSEFg+q0pNgiilE+RonN5zE=
X-Gm-Gg: ASbGncuw7ZZipUC18SCO4WaMMBZUsEbNwpGTB7G3mGPUIEph9qvnEItvpDFZ0Pu1DeI
 X+c6VXNZ/Ptblh/UVlC/qL6kqoxM9zkdxZVQmhPQANqd26pYFyQuSSsEnWjRWlvYjXv+DgY86ui
 umh81Bj6mkuOQIrGgQBLGzTzlqg12o04RByxWBf0rsdaNeCxfDqbV6El3zrkqQ/vU=
X-Google-Smtp-Source: AGHT+IGMftXo7Njr6w4K8Mw/ol29QY3aQyQ3p5YvAHE41Swza7DaKB+7+kOazksjYArbPCUaJPhAn6qMbwvTwjqEZiE=
X-Received: by 2002:a05:6602:36c5:b0:864:a1fe:1e4a with SMTP id
 ca18e2360f4ac-86cbb697f0cmr97966539f.3.1748029603262; Fri, 23 May 2025
 12:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com>
 <20250523-maintainers_update-v1-2-0396d439d6af@quicinc.com>
In-Reply-To: <20250523-maintainers_update-v1-2-0396d439d6af@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 May 2025 12:46:31 -0700
X-Gm-Features: AX0GCFtQq68cUClG56z1LQRDi-fNpHk0rCU3t98OHqV-tf8ZP0Lroq_Bezws8ao
Message-ID: <CAF6AEGv-UFTk1QmJtwr=_eP31wAOJF0ioS82i3LfmPF4arFb9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: update my email address
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-kernel@vger.kernel.org, jessica.zhang@oss.qualcomm.com, 
 lumag@kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Fri, May 23, 2025 at 11:27=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> My current email address will stop working soon. Use
> linux.dev email instead.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bc0da6f9033be0d5da35210a84ba189be4e5c0c..c2244004b966368fd4084d579=
df934f1cf6c1c3e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7639,7 +7639,7 @@ F:        include/uapi/drm/msm_drm.h
>  DRM DRIVER for Qualcomm display hardware
>  M:     Rob Clark <robdclark@gmail.com>
>  M:     Dmitry Baryshkov <lumag@kernel.org>
> -R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +R:     Abhinav Kumar <abhinav.kumar@linux.dev>
>  R:     Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>  R:     Sean Paul <sean@poorly.run>
>  R:     Marijn Suijten <marijn.suijten@somainline.org>
> @@ -20473,7 +20473,7 @@ F:      drivers/regulator/vqmmc-ipq4019-regulator=
.c
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>  M:     Vikash Garodia <quic_vgarodia@quicinc.com>
>  M:     Dikshita Agarwal <quic_dikshita@quicinc.com>
> -R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +R:     Abhinav Kumar <abhinav.kumar@linux.dev>
>  R:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:     linux-media@vger.kernel.org
>  L:     linux-arm-msm@vger.kernel.org
>
> --
> 2.34.1
>
