Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFE6F36AC
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 21:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94810E2E4;
	Mon,  1 May 2023 19:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9633710E274;
 Mon,  1 May 2023 19:24:59 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-38e3a1a07c8so1852405b6e.0; 
 Mon, 01 May 2023 12:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682969098; x=1685561098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bLR1GbZyZQUdq7br0qZHdQ9hAXjjgioO0YDBrhDkvo=;
 b=pXZA61PiZhaZlnA+xdKWkmYbzFs3eWCrQJ8H26eQPJ5EhIP9vceeHgFdijexnZeuTa
 zva8i2qX3O/jIS293YZUCi9hSKEDvKIr9QntcEczJtJMLZHLPseq6Pc+LhuaQjXE1jtr
 HTBBHUMRKOj9byGzHQle9Tj3/52RtiZysg4sEmcXgo9JTUdFi4z1TFYZ8gs4epy+6Is3
 eALRJ0e8JNELbb4zriVyatIA7YEVoCNem8b8UpsZDAdd8q8IrQJ9KisngOuHKQOJ/VYI
 Vm9e0XMNcHfMIHM+WLwX4trfGehb9Ko+g8LocHXn1uIkMwXFd6loNHHdPEubWnGSUJ4J
 bqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682969098; x=1685561098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bLR1GbZyZQUdq7br0qZHdQ9hAXjjgioO0YDBrhDkvo=;
 b=YROw3o0iZFNYrkauGXf33ntVAj8JcLHaHNjzTa7cJzxookSxlWz48sOBm+/u2kIcul
 cw2Q4khyuG44YJHKRDf9t8t4w+kbU7hCtkmfVQdAkjjwabzPgdlbjnEqInEIu/GQoSE2
 JVSeCBT6d50yCeniFzDVyiBxHxOHQW5GrfZruI7mro0i7raeZkYCStffXbtM5G2KQ4p8
 f8ZlSC3mDwDgbutpoWRykpZE749yw6T2hlgWQ4kBW5B5QUFGfuDrtu9LcJLS64vjbW2C
 lvsSCqLiHqQusi1j+YfGfHbFgx+e495ICJksBy3nIbWtHBYTsHe5trImI54/SiRGKrxT
 3KGQ==
X-Gm-Message-State: AC+VfDxoRijYBUmc7k+qPVge67LzlPGFUXlzZYaL5KKS30vvhaA/YOrT
 v57PUTTkfLdqy7DQGbkFrZBevVxW13T439SlTOTGXCHzaBY=
X-Google-Smtp-Source: ACHHUZ59tWI8+zhOkYkZ6pl9dhM5SsMozl6Skp/3tRe2BBRCrTjJMg8N/8iR0vG+rgDark0GOGaqZmsDR2BrWi16Wxg=
X-Received: by 2002:a05:6808:2342:b0:38d:ed4a:52eb with SMTP id
 ef2-20020a056808234200b0038ded4a52ebmr6825147oib.38.1682969098214; Mon, 01
 May 2023 12:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230501185747.33519-1-andrealmeid@igalia.com>
In-Reply-To: <20230501185747.33519-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 May 2023 15:24:46 -0400
Message-ID: <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Currently UMD hasn't much information on what went wrong during a GPU res=
et. To
> help with that, this patch proposes a new IOCTL that can be used to query
> information about the resources that caused the hang.

If we went with the IOCTL, we'd want to limit this to the guilty process.

>
> The goal of this RFC is to gather feedback about this interface. The mesa=
 part
> can be found at https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/22785
>
> The current implementation is racy, meaning that if two resets happens (e=
ven on
> different rings), the app will get the last reset information available, =
rather
> than the one that is looking for. Maybe this can be fixed with a ring_id
> parameter to query the information for a specific ring, but this also req=
uires
> an interface to tell the UMD which ring caused it.

I think you'd want engine type or something like that so mesa knows
how to interpret the IB info.  You could store the most recent info in
the fd priv for the guilty app.  E.g., see what I did for tracking GPU
page fault into:
https://gitlab.freedesktop.org/agd5f/linux/-/commits/gpu_fault_info_ioctl

>
> I know that devcoredump is also used for this kind of information, but I =
believe
> that using an IOCTL is better for interfacing Mesa + Linux rather than pa=
rsing
> a file that its contents are subjected to be changed.

Can you elaborate a bit on that?  Isn't the whole point of devcoredump
to store this sort of information?

Alex


>
> Andr=C3=A9 Almeida (1):
>   drm/amdgpu: Add interface to dump guilty IB on GPU hang
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  |  7 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c   | 29 ++++++++++++++++++++++++
>  include/uapi/drm/amdgpu_drm.h            |  7 ++++++
>  7 files changed, 52 insertions(+), 1 deletion(-)
>
> --
> 2.40.1
>
