Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D11487E0B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 22:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9754310EF7B;
	Fri,  7 Jan 2022 21:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD5910EF78;
 Fri,  7 Jan 2022 21:11:17 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v124so2701702oie.0;
 Fri, 07 Jan 2022 13:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CC7rkV9VPExvEz7sd8V96EKukO7uSQmnri+7pqYA5QU=;
 b=fimEXfjs2yx4VWXNRdfKBYbml4Uz5wUhad0i9v40w16BnjPGZWzn+tTl/ZGITRhzSb
 E6VZdKDd8vjLhndkI8jdAsthwzm0S97yCklMm24l2wD8r5/W4D+60ZEgvXTocekLJ5Uu
 tTyFKb7LVyosR4h7XqHmVQ45zrJSeMLafMxWpLNF7XqbULIDYhSmJ2YVDRhqzKRv/eX6
 EyZDyd2QQLC6qahyrloFUo/cYEMXFMWZ9ZRsGozPMjP1IF5We82NGRGAdFdGeCI2JtcT
 x6/lYT3rw0uE+Wg28gvwHAspNLp319p6SUlw97pB4e+sKDNC3TGVUxzY0PvXFD4GQc9I
 LbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CC7rkV9VPExvEz7sd8V96EKukO7uSQmnri+7pqYA5QU=;
 b=E8x8WTCkbjrgwSwbq+waImfqRhi3eQYEL2XJKvFknljFi0ASxRG7+8Jv4j94JDIPWc
 xDgSgrAujnNeWc2eaWuatTCY8eLFZMxR0dfG4eGCLa+SgLt+uBaknd2ae+9Y41IS9tca
 +R7038/vmHJoNb2ox4m3pE9SJ2Dos1RNjhduQYZYR8j9VcbEQWkZABZODl6r7kXtZCSd
 DaukwGD17ROw9ggiZEmEX2fsqRv+1nkHI7BekgBn8noM2nWZEmEk+m7EEe+GoPf3pKE4
 vynagO0erra7UGzS1I5Sm6ruPTezYdPPF5u4vD14tUjAIVVCd19XqQwpny5B6XR3eoyV
 t7kQ==
X-Gm-Message-State: AOAM532KU6Zu7ZYztmiNyeEzVkceTZCNMxo7Ag4O8x0CCmrsEyISNzpE
 yf1uwM8VU21oz5s7lzAzMyVeBWXxD+vfaA/WPyw=
X-Google-Smtp-Source: ABdhPJzKm+S1E9EjLlqYZmiKF8D3k2idVtuWjR5VDpwCTDmfQHE/WUGGODf03izJ9cCWVRh/RmLlPgrYrYC2BC+hK7U=
X-Received: by 2002:a05:6808:4c3:: with SMTP id
 a3mr11268120oie.123.1641589876388; 
 Fri, 07 Jan 2022 13:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20220106095713.3276112-1-gregkh@linuxfoundation.org>
In-Reply-To: <20220106095713.3276112-1-gregkh@linuxfoundation.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jan 2022 16:11:05 -0500
Message-ID: <CADnq5_OqOUXHX-1Ri=BfhBwhSwwy=bxP_vPq2ejAF68kOGbLCg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: use default_groups in kobj_type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 4:57 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the amdkfd sysfs code to use default_groups field which has
> been the preferred way since aa30f47cf666 ("kobject: Add support for
> default attribute groups to kobj_type") so that we can soon get rid of
> the obsolete default_attrs field.
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_process.c
> index b993011cfa64..1f4a07f984eb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -462,6 +462,7 @@ static struct attribute *procfs_queue_attrs[] =3D {
>         &attr_queue_gpuid,
>         NULL
>  };
> +ATTRIBUTE_GROUPS(procfs_queue);
>
>  static const struct sysfs_ops procfs_queue_ops =3D {
>         .show =3D kfd_procfs_queue_show,
> @@ -469,7 +470,7 @@ static const struct sysfs_ops procfs_queue_ops =3D {
>
>  static struct kobj_type procfs_queue_type =3D {
>         .sysfs_ops =3D &procfs_queue_ops,
> -       .default_attrs =3D procfs_queue_attrs,
> +       .default_groups =3D procfs_queue_groups,
>  };
>
>  static const struct sysfs_ops procfs_stats_ops =3D {
> --
> 2.34.1
>
