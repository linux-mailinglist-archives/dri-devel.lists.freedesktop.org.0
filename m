Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B4575301
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 18:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B3B11A2D4;
	Thu, 14 Jul 2022 16:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E7B11A2C7;
 Thu, 14 Jul 2022 16:42:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id sz17so4410519ejc.9;
 Thu, 14 Jul 2022 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x4AugeXSCRuPAtvlRBrwestY1qbTUTFaUEkz9JRRq9Q=;
 b=kzbJYz8gFAAT860gmXSmwM3Hxhb8XIRl5DSfP03ZfLvzBOxeICJpJf243fCimnF4cJ
 we5Mup3nU0svqCyfxv3qFuMm2HP1XUCEd6dE7PBkkBTy36pclRIY639hqXeVsCY2MDGo
 DAY8Bl+TQHwS9GqM7Pr+C0O8mOQ1nO9EQqaFSOlX6edk1UyYm8JZiHQAnw8LhYLh87pa
 wkMWq8KR0VfEjg7fdjc4Sy76XhA0NdTDffYNTc4f7vDTsQf+pXlmboUK2NF95vee7k0B
 DddM3DZEz97zS1koh7o7Sj7HJzE1HjgoZjp7xBpCIupVdecxYyqVHkzCclPl9Zly2jCi
 pudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x4AugeXSCRuPAtvlRBrwestY1qbTUTFaUEkz9JRRq9Q=;
 b=uySLTrttDdpU7yjzOolAqCgSA1iYDnsKEK4zDWnq2GC8m9boVECd2M/bTEswb69MwA
 cxWQ1qAT9YRBXG21AaazrSmK4octFBR2tSdm1YjETfjfqF29Cb8SP4jaxAeJCOjThR3N
 VYnkkpEe3FKIHjMNw9/mRKZFw9gWf81cQmubNbxgt/5Hc5/oE4RUv/x57xd6gLJyf6GN
 A0cKghh8MYRNSlm1aqCPaCHNN5+hwIB1bgtPFGSzW9Ruk4aaw7dhGB4wZwcwxSgpVwK+
 lPImv3ffR1EqRs7/YgKSyE22dpFkPUNFJpxBVPXY4s+PUPr3uwybd77YGJmJ0IEBdUIr
 p+Hw==
X-Gm-Message-State: AJIora/U00Aqk8z45ZPraiz6YH6x8YqpulhX9XtSEwGoVEFVf2Sk9Zly
 crtTC1nrJnD1AokeTqmCtlGidc+hSreHhEaYZaI=
X-Google-Smtp-Source: AGRyM1s+Mc89SMQKoHos9ZPccAugp4wweirStTpTkRhtA/tM5Y1Q4TJwHHRF2Hxi0vVkLIGbBFRQSHAyD0iQi5FCERw=
X-Received: by 2002:a17:907:2702:b0:72b:307b:98e6 with SMTP id
 w2-20020a170907270200b0072b307b98e6mr9658843ejk.658.1657816938448; Thu, 14
 Jul 2022 09:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220713151504.7521-1-andrealmeid@igalia.com>
In-Reply-To: <20220713151504.7521-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jul 2022 12:42:07 -0400
Message-ID: <CADnq5_NASpkVUpPa=CPad39AYvzueGx9vsNbUcSgqzQhh+0Lzg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/debugfs: Expose GFXOFF state to userspace
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, kernel-dev@igalia.com,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 11:15 AM Andr=C3=A9 Almeida <andrealmeid@igalia.com=
> wrote:
>
> GFXOFF has two different "state" values: one to define if the GPU is
> allowed/disallowed to enter GFXOFF, usually called state; and another
> one to define if currently GFXOFF is being used, usually called status.
> Even when GFXOFF is allowed, GPU firmware can decide to not used it
> accordingly to the GPU load.
>
> Userspace can allow/disallow GPUs to enter into GFXOFF via debugfs. The
> kernel maintains a counter of requests for GFXOFF (gfx_off_req_count)
> that should be decreased to allow GFXOFF and increased to disallow.
>
> The issue with this interface is that userspace can't be sure if GFXOFF
> is currently allowed. Even by checking amdgpu_gfxoff file, one might get
> an ambiguous 2, that means that GPU is currently out of GFXOFF, but that
> can be either because it's currently disallowed or because it's allowed
> but given the current GPU load it's enabled. Then, userspace needs to
> rely on the fact that GFXOFF is enabled by default on boot and to track
> this information.
>
> To make userspace life easier and GFXOFF more reliable, return the
> current state of GFXOFF to userspace when reading amdgpu_gfxoff with the
> same semantics of writing: 0 means not allowed, not 0 means allowed.
>

This looks good. Can you document this in the amdgpu kerneldoc?

Alex

> Expose the current status of GFXOFF through a new file,
> amdgpu_gfxoff_status.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 49 ++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index f3b3c688e4e7..e2eec985adb3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1117,13 +1117,50 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct =
file *f, char __user *buf,
>         }
>
>         while (size) {
> -               uint32_t value;
> +               u32 value =3D adev->gfx.gfx_off_state;
> +
> +               r =3D put_user(value, (u32 *)buf);
> +               if (r)
> +                       goto out;
> +
> +               result +=3D 4;
> +               buf +=3D 4;
> +               *pos +=3D 4;
> +               size -=3D 4;
> +       }
> +
> +       r =3D result;
> +out:
> +       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> +       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +
> +       return r;
> +}
> +
> +static ssize_t amdgpu_debugfs_gfxoff_status_read(struct file *f, char __=
user *buf,
> +                                                size_t size, loff_t *pos=
)
> +{
> +       struct amdgpu_device *adev =3D file_inode(f)->i_private;
> +       ssize_t result =3D 0;
> +       int r;
> +
> +       if (size & 0x3 || *pos & 0x3)
> +               return -EINVAL;
> +
> +       r =3D pm_runtime_get_sync(adev_to_drm(adev)->dev);
> +       if (r < 0) {
> +               pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +               return r;
> +       }
> +
> +       while (size) {
> +               u32 value;
>
>                 r =3D amdgpu_get_gfx_off_status(adev, &value);
>                 if (r)
>                         goto out;
>
> -               r =3D put_user(value, (uint32_t *)buf);
> +               r =3D put_user(value, (u32 *)buf);
>                 if (r)
>                         goto out;
>
> @@ -1206,6 +1243,12 @@ static const struct file_operations amdgpu_debugfs=
_gfxoff_fops =3D {
>         .llseek =3D default_llseek
>  };
>
> +static const struct file_operations amdgpu_debugfs_gfxoff_status_fops =
=3D {
> +       .owner =3D THIS_MODULE,
> +       .read =3D amdgpu_debugfs_gfxoff_status_read,
> +       .llseek =3D default_llseek
> +};
> +
>  static const struct file_operations *debugfs_regs[] =3D {
>         &amdgpu_debugfs_regs_fops,
>         &amdgpu_debugfs_regs2_fops,
> @@ -1217,6 +1260,7 @@ static const struct file_operations *debugfs_regs[]=
 =3D {
>         &amdgpu_debugfs_wave_fops,
>         &amdgpu_debugfs_gpr_fops,
>         &amdgpu_debugfs_gfxoff_fops,
> +       &amdgpu_debugfs_gfxoff_status_fops,
>  };
>
>  static const char *debugfs_regs_names[] =3D {
> @@ -1230,6 +1274,7 @@ static const char *debugfs_regs_names[] =3D {
>         "amdgpu_wave",
>         "amdgpu_gpr",
>         "amdgpu_gfxoff",
> +       "amdgpu_gfxoff_status",
>  };
>
>  /**
> --
> 2.37.0
>
