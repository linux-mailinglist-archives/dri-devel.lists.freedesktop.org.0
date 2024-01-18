Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A53831895
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 12:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B838A10E79E;
	Thu, 18 Jan 2024 11:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B773710E79E;
 Thu, 18 Jan 2024 11:39:30 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so14292736e87.3; 
 Thu, 18 Jan 2024 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705577908; x=1706182708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVdU1A74qUHSIDgwEfJ6kfyoxaDoAPC8NwCrvfgSTKE=;
 b=PlI8qV+p7Ip0hnqKEM3BXX7CFBi1TgybZUiTs8Z+eGBDYQFEzWNMSQ4sHoVXpamy5d
 khEANdTjKPhjwkB2XE7MGBE6MQamtAmnAD1nBain/DsHOUM0W/YWSCwjvi3oBCWOgI5v
 qI86BeT4WbeYWHit5AakL2rUTXcrtz7gHoMAxcrQy9OVIolngymIQf/Y8I1FzajCH4nT
 Vvgwv9HK7n1gKXNWaRmzr8SRYcnPOSb2xRsf4tXWR8zZWjM5I4pLCoB5z39HtGytcvJc
 rihj6iWymor4Hs3WhApFtlxmF9FXta6dcr9koryCHHSCKPBakuWEnrcQH/u/NLkWIJyu
 u2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705577908; x=1706182708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVdU1A74qUHSIDgwEfJ6kfyoxaDoAPC8NwCrvfgSTKE=;
 b=WMuAIaMkki86fbSaYvP/4FF3c4JZk0nPLTGIezO1U0unEp+vXXx2VMAeS1vWYV/RaG
 dKB0iLMzacbV6+8sWKZzx+o1FexV8s7czSF+ffnwzJk4ASqbVlMLnVmlw2khDrXmCPjt
 GMedqApAlZSiuQOOoRtQyEzt28RkxN20hHbwevd2HxhmfNHGuP6tqTVILaVi9bVWh74B
 6u5DtXi/Bc0q2b4xE4DinsfpNSpexTr4x5Q2iIlAra11Tvq15yHwhj+Repq2KiPa+O+D
 utlW+ZWBPtMGClpvYbAeLxUmBd8gUw5XQGdxh3FlN7bLRWHpWVk4HzVGy2xaK7Buu9Dx
 +J6g==
X-Gm-Message-State: AOJu0YxXpPsYMDrDVICtXDCXneQ71vdxyMkGDcyQ4YgnrYjUiaEtP8yQ
 rqdyHScGNw0gk6vYvuFeFMelP8ACHXt5IXHH4veJqaaPhIcOL8drC5Pe/RoEBmSDvoC6vz6pRnz
 5amK5ujLEGgTgmQGWG4rfDZN37wU=
X-Google-Smtp-Source: AGHT+IHsLB7D3zC7yf0/PqxZZOADB/N4A+vAqZ64vtrz7tqCewkjZsXZAU9Z3RINJC6ixlMaoyiy2Fw1PmN1O1VR344=
X-Received: by 2002:ac2:5de8:0:b0:50e:aac2:b88d with SMTP id
 z8-20020ac25de8000000b0050eaac2b88dmr261576lfq.94.1705577907999; Thu, 18 Jan
 2024 03:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
 <CAKGbVbsYJ7dusKREwpMVsxi+ryh+1ieshhwfJ72XVQ8b3x5OaA@mail.gmail.com>
In-Reply-To: <CAKGbVbsYJ7dusKREwpMVsxi+ryh+1ieshhwfJ72XVQ8b3x5OaA@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 18 Jan 2024 12:38:15 +0100
Message-ID: <CAK4VdL20-9LPKJeWKB1hduNyE_TxSviKOaEnHJv3gEtZasFqYA@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
 latency
To: Qiang Yu <yuq825@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 3:46=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> On Wed, Jan 17, 2024 at 11:12=E2=80=AFAM Erico Nunes <nunes.erico@gmail.c=
om> wrote:
> > diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/l=
ima_sched.h
> > index 6a11764d87b3..34050facb110 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.h
> > +++ b/drivers/gpu/drm/lima/lima_sched.h
> > @@ -29,6 +29,8 @@ struct lima_sched_task {
> >         bool recoverable;
> >         struct lima_bo *heap;
> >
> > +       struct dma_fence *done_fence;
> This is same as the following fence, do we really need a duplicated one?

Checking again now, I think we can reuse the existing one.
