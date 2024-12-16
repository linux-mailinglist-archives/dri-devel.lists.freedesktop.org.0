Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436929F3A40
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 20:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DF110E2D7;
	Mon, 16 Dec 2024 19:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f9y78Cb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3199510E13A;
 Mon, 16 Dec 2024 19:53:39 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ef05d0ef18so794549a91.0; 
 Mon, 16 Dec 2024 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734378819; x=1734983619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MIYj4bJCscXDlJoY7W+vXtaBhQexWWb3wrX5bFyCwNs=;
 b=f9y78Cb9HZ17C6JDDViRrbIi1D52tv8IhX2jWSOK1gRNY2WLvGEDWLOg+V3l/5NLC7
 rJjAZEgS7EA8XnsFbooTuiwe1dZK2hD8K6Fct8KNJ6R1UPB5ROvCN7jFY2l/uvPmzNPa
 T6rFfpHn0asn+E0HtpaVwUNnO7nsz7l/T+f+bb0kcjVNgQew+CZrDa8tpLI0YMG5TJt/
 66kQOKX+i7ZSUoFcBaaZFRqeqZR7s6VttesF5LHlAdjHVJYvb74YHLixTf+3hSJ3BAhG
 dDNtLnLGuW48mzqrC//Uxcxx3R2/NhB3S6Mf141ywHjHwl0a4CyMLW7phR+nUI5+KvyF
 UljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734378819; x=1734983619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIYj4bJCscXDlJoY7W+vXtaBhQexWWb3wrX5bFyCwNs=;
 b=ao3EaWoARHWFhxsqQ3H6pfZgQQBdlV9k48In5phRyOu9P/x6hYITtr9WlOtk+IPQrE
 7XHYtVHdgYfsu5tsHzy1ITXZJr1VCUXYdw7sn7T+I8WvSWhCylgxQA9Zb1ZJMfoXTIaz
 8DqMkdeLwQqrjf1IlY4zfw8F44rHs9k+4NZGGFmVC8VJRV064KxGAx937hcxtXBnZ4zF
 bRb96qhwvfLrEIsTJue+t3/+dgTKwullwifVWLNLRk31alnEOy1LVrhx19n9iDyL9lzI
 GChCPm4qMPbuP7IPlMCSbMBXSEnehgWe3S1hJ03TjXzH5wuLtXJqPAM8eT+1UtbnC6KA
 G1Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZo2kEFnCn7DnYViIG+ZYwunKb3gJAe33FHwugKLqT20imrhzagJ9fOi1565tu30ENfGkkkA==@lists.freedesktop.org,
 AJvYcCViyYAnRfOznoLpsghqgj0K49SwVXUDfjGFMoQo/ml4zM/GPpGQtTG1Rqv27GbQUcFRYOm7H0b7@lists.freedesktop.org,
 AJvYcCVpLYv4gl8wJFKQjwFg8y0ycVfsRPahjSXgrBerbh/A80AHMmW3m3+fGgG4se556dQbolGfgrcI0sQk@lists.freedesktop.org,
 AJvYcCWHFe+R+8skYu+Kog76is33CSsKgSQkeSPo2t+pghLtpPWnCONb7xdHboL+UDYGElvcrHqhddItGeCQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM7RZADF0cv0xUTpprjgagcp7DSdotNe0LsyROBQgmDXIzEwuJ
 zeQ+LCzyQ0WYUQIlBtH4+f6VzBncEE16QEVwKQwDCzSOqkq+hsZaVYtl2J1Rs/2nhFUgtO7qGd0
 D4RF6u8UcOyib9fPBpOnHq9j+IrE=
X-Gm-Gg: ASbGncvm365eBMJw4G9ARL076YYcEyK9C8SFlkg4EWHEMJOdsfn0r4Z4tFXTGMSQsib
 h7E4oa/I3B0azvFJicUhUkpTl/KzT5yZsbu38tA==
X-Google-Smtp-Source: AGHT+IHw07J50LjkLVhVLiSn1KCIPan7Le0TMFJV6k1ZwY/55RNLENGR9IgNrc4XNQq+FbWOpLs0wM/oMgnVdK0H3xA=
X-Received: by 2002:a17:90b:3509:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f2905b4479mr7485753a91.8.1734378818588; Mon, 16 Dec 2024
 11:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
 <20241216-sysfs-const-bin_attr-drm-v1-4-210f2b36b9bf@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-4-210f2b36b9bf@weissschuh.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2024 14:53:26 -0500
Message-ID: <CADnq5_Md9Oy5LdrNSPLFcH7fbtJqjxZ-usrVwj93OOxLjjEgmA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/amdgpu: Constify 'struct bin_attribute'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Qiang Yu <yuq825@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lima@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
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

On Mon, Dec 16, 2024 at 6:53=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 14 +++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    | 13 ++++++-------
>  3 files changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index d272d95dd5b2f5eb83be279281d55af323f7f508..88459de2cd2e47390d33e5939=
875c3322b740b4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -223,7 +223,7 @@ static DEVICE_ATTR(pcie_replay_count, 0444,
>                 amdgpu_device_get_pcie_replay_count, NULL);
>
>  static ssize_t amdgpu_sysfs_reg_state_get(struct file *f, struct kobject=
 *kobj,
> -                                         struct bin_attribute *attr, cha=
r *buf,
> +                                         const struct bin_attribute *att=
r, char *buf,
>                                           loff_t ppos, size_t count)
>  {
>         struct device *dev =3D kobj_to_dev(kobj);
> @@ -259,8 +259,8 @@ static ssize_t amdgpu_sysfs_reg_state_get(struct file=
 *f, struct kobject *kobj,
>         return bytes_read;
>  }
>
> -BIN_ATTR(reg_state, 0444, amdgpu_sysfs_reg_state_get, NULL,
> -        AMDGPU_SYS_REG_STATE_END);
> +static const BIN_ATTR(reg_state, 0444, amdgpu_sysfs_reg_state_get, NULL,
> +                     AMDGPU_SYS_REG_STATE_END);
>
>  int amdgpu_reg_state_sysfs_init(struct amdgpu_device *adev)
>  {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 448f9e742983f3ef0c5fccc18d85f0c2449aa08e..cda25174730a6852bcb6e01ae=
ec858faad172b19 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -3969,7 +3969,7 @@ int is_psp_fw_valid(struct psp_bin_desc bin)
>  }
>
>  static ssize_t amdgpu_psp_vbflash_write(struct file *filp, struct kobjec=
t *kobj,
> -                                       struct bin_attribute *bin_attr,
> +                                       const struct bin_attribute *bin_a=
ttr,
>                                         char *buffer, loff_t pos, size_t =
count)
>  {
>         struct device *dev =3D kobj_to_dev(kobj);
> @@ -4005,7 +4005,7 @@ static ssize_t amdgpu_psp_vbflash_write(struct file=
 *filp, struct kobject *kobj,
>  }
>
>  static ssize_t amdgpu_psp_vbflash_read(struct file *filp, struct kobject=
 *kobj,
> -                                      struct bin_attribute *bin_attr, ch=
ar *buffer,
> +                                      const struct bin_attribute *bin_at=
tr, char *buffer,
>                                        loff_t pos, size_t count)
>  {
>         struct device *dev =3D kobj_to_dev(kobj);
> @@ -4057,11 +4057,11 @@ static ssize_t amdgpu_psp_vbflash_read(struct fil=
e *filp, struct kobject *kobj,
>   * Writing to this file will stage an IFWI for update. Reading from this=
 file
>   * will trigger the update process.
>   */
> -static struct bin_attribute psp_vbflash_bin_attr =3D {
> +static const struct bin_attribute psp_vbflash_bin_attr =3D {
>         .attr =3D {.name =3D "psp_vbflash", .mode =3D 0660},
>         .size =3D 0,
> -       .write =3D amdgpu_psp_vbflash_write,
> -       .read =3D amdgpu_psp_vbflash_read,
> +       .write_new =3D amdgpu_psp_vbflash_write,
> +       .read_new =3D amdgpu_psp_vbflash_read,
>  };
>
>  /**
> @@ -4088,7 +4088,7 @@ static ssize_t amdgpu_psp_vbflash_status(struct dev=
ice *dev,
>  }
>  static DEVICE_ATTR(psp_vbflash_status, 0440, amdgpu_psp_vbflash_status, =
NULL);
>
> -static struct bin_attribute *bin_flash_attrs[] =3D {
> +static const struct bin_attribute *const bin_flash_attrs[] =3D {
>         &psp_vbflash_bin_attr,
>         NULL
>  };
> @@ -4124,7 +4124,7 @@ static umode_t amdgpu_bin_flash_attr_is_visible(str=
uct kobject *kobj,
>
>  const struct attribute_group amdgpu_flash_attr_group =3D {
>         .attrs =3D flash_attrs,
> -       .bin_attrs =3D bin_flash_attrs,
> +       .bin_attrs_new =3D bin_flash_attrs,
>         .is_bin_visible =3D amdgpu_bin_flash_attr_is_visible,
>         .is_visible =3D amdgpu_flash_attr_is_visible,
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index 4c9fa24dd9726a405935907524ed7bf7862779d1..2991e0967b5bfc848328aaa59=
ddfb9a8f202bae9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1732,7 +1732,7 @@ static char *amdgpu_ras_badpage_flags_str(unsigned =
int flags)
>   */
>
>  static ssize_t amdgpu_ras_sysfs_badpages_read(struct file *f,
> -               struct kobject *kobj, struct bin_attribute *attr,
> +               struct kobject *kobj, const struct bin_attribute *attr,
>                 char *buf, loff_t ppos, size_t count)
>  {
>         struct amdgpu_ras *con =3D
> @@ -2063,8 +2063,8 @@ void amdgpu_ras_debugfs_create_all(struct amdgpu_de=
vice *adev)
>  /* debugfs end */
>
>  /* ras fs */
> -static BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
> -               amdgpu_ras_sysfs_badpages_read, NULL, 0);
> +static const BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
> +                     amdgpu_ras_sysfs_badpages_read, NULL, 0);
>  static DEVICE_ATTR(features, S_IRUGO,
>                 amdgpu_ras_sysfs_features_read, NULL);
>  static DEVICE_ATTR(version, 0444,
> @@ -2086,7 +2086,7 @@ static int amdgpu_ras_fs_init(struct amdgpu_device =
*adev)
>                 &con->event_state_attr.attr,
>                 NULL
>         };
> -       struct bin_attribute *bin_attrs[] =3D {
> +       const struct bin_attribute *bin_attrs[] =3D {
>                 NULL,
>                 NULL,
>         };
> @@ -2112,11 +2112,10 @@ static int amdgpu_ras_fs_init(struct amdgpu_devic=
e *adev)
>
>         if (amdgpu_bad_page_threshold !=3D 0) {
>                 /* add bad_page_features entry */
> -               bin_attr_gpu_vram_bad_pages.private =3D NULL;
>                 con->badpages_attr =3D bin_attr_gpu_vram_bad_pages;
> +               sysfs_bin_attr_init(&con->badpages_attr);
>                 bin_attrs[0] =3D &con->badpages_attr;
> -               group.bin_attrs =3D bin_attrs;
> -               sysfs_bin_attr_init(bin_attrs[0]);
> +               group.bin_attrs_new =3D bin_attrs;
>         }
>
>         r =3D sysfs_create_group(&adev->dev->kobj, &group);
>
> --
> 2.47.1
>
