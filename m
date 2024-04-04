Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67358987B9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842C411B596;
	Thu,  4 Apr 2024 12:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XU0Qmu9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3011B58C;
 Thu,  4 Apr 2024 12:32:52 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so1200315a12.0; 
 Thu, 04 Apr 2024 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712233971; x=1712838771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXyy4yHP0CZTf1IBrBojXYAs2I6dwIFFKPaznXSQtH8=;
 b=XU0Qmu9qFBuM+mw2LaNO73m+xRiDJVkX4Eq6sZLxh0j2+rRuyskz4hW+51sc0AZ+x8
 zbWgo90fUKLrtyieoVV0C1nI+faNfz9KgKVCCfieGP8CYmyqXDPbr4BTo0wOGaFmW04p
 OwfOuWr2Ntx2ae+KpQSHikSYShOB7E4D/X7MuqG+Tv0wVNFt4O5IxCQiSAxLeKmJdbo2
 uC8UM6CrvLSry7RFZ8T1YKE2Ac3duxzy0nRgZ/Xj9qik4VhVWfJTwYlZheaUA1z9Un5X
 i/kHA+iL53wgBxkYdgJEFwv2rjIgS3qkpAaemd1gnKJYjMppIarXPSs5l8rdMKwrWG78
 JssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712233971; x=1712838771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GXyy4yHP0CZTf1IBrBojXYAs2I6dwIFFKPaznXSQtH8=;
 b=DP9Q3y1Gl2Dbnbqj8ztSHbwqKbJAVuEx3DQOiPrQRs5IU1s+4vAU2IuUOXAkNBZRQY
 oyiNDdFLj/1dI3AKuQxJwA0QJXuN8Yv7BiaLl2Ei7QiLkHDu7cWLxvk5PLMJWiUhNaT3
 LdLxYlaxHMS9gEEEJMj7+sAcciyt+oGyClMSOuXLCFt9jOjm7z01n0j/FwEBvAp2n5oc
 Ipqq4dcyOqolPwQnhoGdUl3v8TeWC1plilp3meLFw85T2iSg5rCZBH0aDb2LaShCBLVh
 Bz69+9BDrEbRGEJMOoayX9Au93RAE/OT7k/hao6bGcD+acSwIUiAQDqzdcpvOZ2S/peP
 iJXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpjbG3W1yXfdVNDeP5dcsVEAmlm4gvWrjCrLYyeraJZQzsxDJxDr8HU9QeuO3dq4X7gZmlQpZlPbGWhcDXVOLab0aFW62sfutQq/CQ5TtBAvOqA9MbKxR/Nh7RF+TpitEUGAXMpE357evYpA==
X-Gm-Message-State: AOJu0YywoxJh98VublYUN5w7LrCMYGgXyMLyNmaKBqiKjrkv1nJMBZVV
 HZ6zDS5n1x7A8DcOZ3w1SI7aRv8lErlcsVHUWPaEfypYyJfKbnlfjt9Yildb0JrdUfRYWX+WdEn
 fTzI55N8S1K3SQfl1ogGfNl2PSGk=
X-Google-Smtp-Source: AGHT+IFKJiCM2SN2ligv8CNgpJzVYuF8k0i+xEowf+oRyvdrdJO/D69BQmMzHrbs7Ze2WfGJvHj+wCTVv7PdEhfM72Q=
X-Received: by 2002:a50:8a9a:0:b0:56d:f7ce:e879 with SMTP id
 j26-20020a508a9a000000b0056df7cee879mr1553500edj.37.1712233970904; Thu, 04
 Apr 2024 05:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240401212002.1191549-1-nunes.erico@gmail.com>
 <20240401212002.1191549-3-nunes.erico@gmail.com>
In-Reply-To: <20240401212002.1191549-3-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 4 Apr 2024 20:32:39 +0800
Message-ID: <CAKGbVbudN7s-Q3oUNkopcq1DdwEyJ+yK2j711cgmD-8g2djAJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/lima: mask irqs in timeout path before hard reset
To: Erico Nunes <nunes.erico@gmail.com>
Cc: anarsoul@gmail.com, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 christian.koenig@amd.com, megi@xff.cz, linux-kernel@vger.kernel.org
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

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Tue, Apr 2, 2024 at 5:20=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com> =
wrote:
>
> There is a race condition in which a rendering job might take just long
> enough to trigger the drm sched job timeout handler but also still
> complete before the hard reset is done by the timeout handler.
> This runs into race conditions not expected by the timeout handler.
> In some very specific cases it currently may result in a refcount
> imbalance on lima_pm_idle, with a stack dump such as:
>
> [10136.669170] WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/lima/lima_devfre=
q.c:205 lima_devfreq_record_idle+0xa0/0xb0
> ...
> [10136.669459] pc : lima_devfreq_record_idle+0xa0/0xb0
> ...
> [10136.669628] Call trace:
> [10136.669634]  lima_devfreq_record_idle+0xa0/0xb0
> [10136.669646]  lima_sched_pipe_task_done+0x5c/0xb0
> [10136.669656]  lima_gp_irq_handler+0xa8/0x120
> [10136.669666]  __handle_irq_event_percpu+0x48/0x160
> [10136.669679]  handle_irq_event+0x4c/0xc0
>
> We can prevent that race condition entirely by masking the irqs at the
> beginning of the timeout handler, at which point we give up on waiting
> for that job entirely.
> The irqs will be enabled again at the next hard reset which is already
> done as a recovery by the timeout handler.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 66841503a618..bbf3f8feab94 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -430,6 +430,13 @@ static enum drm_gpu_sched_stat lima_sched_timedout_j=
ob(struct drm_sched_job *job
>                 return DRM_GPU_SCHED_STAT_NOMINAL;
>         }
>
> +       /*
> +        * The task might still finish while this timeout handler runs.
> +        * To prevent a race condition on its completion, mask all irqs
> +        * on the running core until the next hard reset completes.
> +        */
> +       pipe->task_mask_irq(pipe);
> +
>         if (!pipe->error)
>                 DRM_ERROR("%s job timeout\n", lima_ip_name(ip));
>
> --
> 2.44.0
>
