Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DA69B39E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAE510E1ED;
	Fri, 17 Feb 2023 20:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489D610E1ED;
 Fri, 17 Feb 2023 20:15:51 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bl6so2272382oib.11;
 Fri, 17 Feb 2023 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rP6chO04lc7ekuPk1zfavwOera2dGN+z5RAQbiNip0A=;
 b=c/o5+JMqpV4w/gCrwUzrclh8IUkx+naSc01t25qmVdEHeQfPZLCgSfLqa8FGU3HoxM
 kQhyREUzF+HHivwpnnGB0gf7+rpUGzyGcHUv1b6vpgj2Hjy8msZ0YQrV1ifjvOSrOBjb
 erJnfumcTFfMhgmKcl2oDGXk4XFNon8E6LBdmLOKS7NRKWwJq8zGk/XlC1HkY3D9qVl5
 +2dStyqCMIA5AV8ubNG9pJRDSuC8/2bIfUU+IOcXewjQaUCCBvaEniBIuI0910Hjpa6e
 Rccce9GZoFX7/P53sFQq5hKP9c1v13LeESNV0lmaEHljOBBFrS59mUdDNXQu8eOqECv9
 G1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rP6chO04lc7ekuPk1zfavwOera2dGN+z5RAQbiNip0A=;
 b=VFWunc5BMrP1UnXCNHAIlpBxVuzk9mN7JCP368PLxJjBzQIx4LqGotOEUIe8CNhyG3
 KdNLm2JxtSn0t63KECTpAZPh2KmPADgL+bMjD4d+facm3CpnTT+TfkxAw9mUP9xnl7eO
 SAnISR0JRUP+WhoTOf4GxP5sYu6iIhZsYZASr4JVT8Oh+b9oKesuGS419EVHcE0fjeWR
 kFYqN1VM+k72hfAc5bFGPUuXXFJET185WX98QbDNwz/pr99KvCRiFhV/O2hdc4soSWzZ
 /smsId+iFpoWiweJ/fgruJNjzikdUdFngPH6T7c35PzgaEKqNN7351R2whR5EB5fkfTm
 9vaQ==
X-Gm-Message-State: AO0yUKVdt9JDd99jJAmyGsKULW7BVkoLlsuc4mKq/P89cTsjzvpEXw4A
 oO8wMk4EnWz1+yNljJV9Y10ZL/7qqpZk8UlhSgs=
X-Google-Smtp-Source: AK7set9/p/SSPp+u7EARomWZBivjModi88bB9KWj7e/7q3sRrnClsfk8HHMudPME9YEAIIO7I3hbwAHb9p+voiBPKF8=
X-Received: by 2002:a05:6808:1287:b0:37d:7bc1:889 with SMTP id
 a7-20020a056808128700b0037d7bc10889mr603652oiw.138.1676664950482; Fri, 17 Feb
 2023 12:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20230216-kobj_type-amdkfd-v1-1-337abb104da2@weissschuh.net>
In-Reply-To: <20230216-kobj_type-amdkfd-v1-1-337abb104da2@weissschuh.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Feb 2023 15:15:39 -0500
Message-ID: <CADnq5_MX7gnjaZziktVUxbCo+GCfnKo_RvAD6ELpoE0VGo_eTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Make kobj_type structures constant
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Feb 15, 2023 at 8:09 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> the driver core allows the usage of const struct kobj_type.
>
> Take advantage of this to constify the structure definitions to prevent
> modification at runtime.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c  |  8 ++++----
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 10 +++++-----
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_process.c
> index 51b1683ac5c1..8d719f90db40 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -344,7 +344,7 @@ static const struct sysfs_ops kfd_procfs_ops =3D {
>         .show =3D kfd_procfs_show,
>  };
>
> -static struct kobj_type procfs_type =3D {
> +static const struct kobj_type procfs_type =3D {
>         .release =3D kfd_procfs_kobj_release,
>         .sysfs_ops =3D &kfd_procfs_ops,
>  };
> @@ -469,7 +469,7 @@ static const struct sysfs_ops procfs_queue_ops =3D {
>         .show =3D kfd_procfs_queue_show,
>  };
>
> -static struct kobj_type procfs_queue_type =3D {
> +static const struct kobj_type procfs_queue_type =3D {
>         .sysfs_ops =3D &procfs_queue_ops,
>         .default_groups =3D procfs_queue_groups,
>  };
> @@ -478,7 +478,7 @@ static const struct sysfs_ops procfs_stats_ops =3D {
>         .show =3D kfd_procfs_stats_show,
>  };
>
> -static struct kobj_type procfs_stats_type =3D {
> +static const struct kobj_type procfs_stats_type =3D {
>         .sysfs_ops =3D &procfs_stats_ops,
>         .release =3D kfd_procfs_kobj_release,
>  };
> @@ -487,7 +487,7 @@ static const struct sysfs_ops sysfs_counters_ops =3D =
{
>         .show =3D kfd_sysfs_counters_show,
>  };
>
> -static struct kobj_type sysfs_counters_type =3D {
> +static const struct kobj_type sysfs_counters_type =3D {
>         .sysfs_ops =3D &sysfs_counters_ops,
>         .release =3D kfd_procfs_kobj_release,
>  };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/=
amd/amdkfd/kfd_topology.c
> index 3fdaba56be6f..8e4124dcb6e4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -278,7 +278,7 @@ static const struct sysfs_ops sysprops_ops =3D {
>         .show =3D sysprops_show,
>  };
>
> -static struct kobj_type sysprops_type =3D {
> +static const struct kobj_type sysprops_type =3D {
>         .release =3D kfd_topology_kobj_release,
>         .sysfs_ops =3D &sysprops_ops,
>  };
> @@ -318,7 +318,7 @@ static const struct sysfs_ops iolink_ops =3D {
>         .show =3D iolink_show,
>  };
>
> -static struct kobj_type iolink_type =3D {
> +static const struct kobj_type iolink_type =3D {
>         .release =3D kfd_topology_kobj_release,
>         .sysfs_ops =3D &iolink_ops,
>  };
> @@ -350,7 +350,7 @@ static const struct sysfs_ops mem_ops =3D {
>         .show =3D mem_show,
>  };
>
> -static struct kobj_type mem_type =3D {
> +static const struct kobj_type mem_type =3D {
>         .release =3D kfd_topology_kobj_release,
>         .sysfs_ops =3D &mem_ops,
>  };
> @@ -395,7 +395,7 @@ static const struct sysfs_ops cache_ops =3D {
>         .show =3D kfd_cache_show,
>  };
>
> -static struct kobj_type cache_type =3D {
> +static const struct kobj_type cache_type =3D {
>         .release =3D kfd_topology_kobj_release,
>         .sysfs_ops =3D &cache_ops,
>  };
> @@ -566,7 +566,7 @@ static const struct sysfs_ops node_ops =3D {
>         .show =3D node_show,
>  };
>
> -static struct kobj_type node_type =3D {
> +static const struct kobj_type node_type =3D {
>         .release =3D kfd_topology_kobj_release,
>         .sysfs_ops =3D &node_ops,
>  };
>
> ---
> base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
> change-id: 20230216-kobj_type-amdkfd-abd9fe9ab060
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
