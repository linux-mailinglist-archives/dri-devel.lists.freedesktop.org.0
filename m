Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91157567221
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BB112A0A0;
	Tue,  5 Jul 2022 15:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562E10EFB9;
 Tue,  5 Jul 2022 15:10:21 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ay16so22189321ejb.6;
 Tue, 05 Jul 2022 08:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dkpN1b4wP9gTZUtEgRoxQX0uUzfu9gESHo4XVBhNNPA=;
 b=jtX3byuXyfc2mF/rBU1M4/i77Y3tRdz2XH46byqIsfIKKhOLkoBSf+LTlU7hrA6X2j
 8iKu9cxdOL/P9b6KmRtmTaKvprIJ42mVGAdpNqhVtfAnpBOjqNtHWcfnTd9JOfMluq8V
 3t1exD8XY3OfFVfq50fAeo620chL6sdXcvktq3qjgBgPHwRkEFXmlhFtILjfrXZ7fGPo
 9FbxvE388pdW6PVWA7jDHcswPCzy/j0JPDhP/6OeXV7RewR9E/G+8J5C9H0gSaM3GiEl
 K80kZ8LmV8wNAJbNoZM+6zll2pSiw1hlxn0S+ZFqHHULCmt4KZXnUHUeQRnKzYDsKYYQ
 iG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dkpN1b4wP9gTZUtEgRoxQX0uUzfu9gESHo4XVBhNNPA=;
 b=DRxgDKh5uviJeu57VSQ55He5jRF3SVvK1ZyJ7JT+6LbJ7LN9dpiKpy4sRMyDBG06Nr
 ODAoYaBNQ/j8e7kOXI1bgHOWCuoJa94BMSxZLmuTBXeDRk7+kPC3SxMy6/GRyTDPhMQH
 7aPycnqwrKPkS/9r00qUHnmfvPGZHjbajmPO0Tc9p8LRzTRJGWgybwe14wQ9bCHIGZ3o
 qUjvrMMxYiVuL+dWH/LeyiJbhxQd24t1yuMsuL4HVfrWG6vUSFFK9NXVHsfllqeA0u+L
 iDYr/aRQcvDBH2cm3TfIM5Mf5vO0i5RNu5HuTz+DJ47lFB6dg2/CwE7ReF4RK81nZCIf
 CDbQ==
X-Gm-Message-State: AJIora9dbxijbk9EWzHa3sgAXnqvoUXryriTuHKBKWbNMH7g3No7TZFI
 e8M+jVgqis5Xx1Z/ym3ni62Hq8PKAC+ceVwYC1eaN1NF
X-Google-Smtp-Source: AGRyM1t2xhRsfyqVg5935Rq05PnjacmxfFyEeFcbXVcIX7X+PnwWDRi5pnasbbuvQSDhCYj3EMsFY8eF4tcYWyJs1Sc=
X-Received: by 2002:a17:906:5d0b:b0:726:a043:fcb4 with SMTP id
 g11-20020a1709065d0b00b00726a043fcb4mr35047447ejt.508.1657033819797; Tue, 05
 Jul 2022 08:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220704134532.103876-1-andrealmeid@igalia.com>
 <db6ab6f5-e3b1-f068-37ac-807e1ff074a8@amd.com>
In-Reply-To: <db6ab6f5-e3b1-f068-37ac-807e1ff074a8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Jul 2022 11:10:07 -0400
Message-ID: <CADnq5_O3i2ciutAFS-uzX8bedOXxeOJUNWGRfsuOqpmL-tW64w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdpgu/debugfs: Simplify some exit paths
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, kernel-dev@igalia.com,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 4, 2022 at 12:23 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 04.07.22 um 15:45 schrieb Andr=C3=A9 Almeida:
> > To avoid code repetition, unify the function exit path when possible. N=
o
> > functional changes.
> >
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 107 ++++++++-----------=
-
> >   1 file changed, 42 insertions(+), 65 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_debugfs.c
> > index f3ac7912c29c..f3b3c688e4e7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -383,12 +383,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struc=
t file *f, char __user *buf,
> >
> >               value =3D RREG32_PCIE(*pos);
> >               r =3D put_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     amdgpu_virt_disable_access_debugfs(adev);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               result +=3D 4;
> >               buf +=3D 4;
> > @@ -396,11 +392,12 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(stru=
ct file *f, char __user *buf,
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > -
> >       amdgpu_virt_disable_access_debugfs(adev);
> > -     return result;
> > +     return r;
> >   }
> >
> >   /**
> > @@ -441,12 +438,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(stru=
ct file *f, const char __user
> >               uint32_t value;
> >
> >               r =3D get_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     amdgpu_virt_disable_access_debugfs(adev);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               WREG32_PCIE(*pos, value);
> >
> > @@ -456,11 +449,12 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(str=
uct file *f, const char __user
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > -
> >       amdgpu_virt_disable_access_debugfs(adev);
> > -     return result;
> > +     return r;
> >   }
> >
> >   /**
> > @@ -502,12 +496,8 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struc=
t file *f, char __user *buf,
> >
> >               value =3D RREG32_DIDT(*pos >> 2);
> >               r =3D put_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     amdgpu_virt_disable_access_debugfs(adev);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               result +=3D 4;
> >               buf +=3D 4;
> > @@ -515,11 +505,12 @@ static ssize_t amdgpu_debugfs_regs_didt_read(stru=
ct file *f, char __user *buf,
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > -
> >       amdgpu_virt_disable_access_debugfs(adev);
> > -     return result;
> > +     return r;
> >   }
> >
> >   /**
> > @@ -560,12 +551,8 @@ static ssize_t amdgpu_debugfs_regs_didt_write(stru=
ct file *f, const char __user
> >               uint32_t value;
> >
> >               r =3D get_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     amdgpu_virt_disable_access_debugfs(adev);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               WREG32_DIDT(*pos >> 2, value);
> >
> > @@ -575,11 +562,12 @@ static ssize_t amdgpu_debugfs_regs_didt_write(str=
uct file *f, const char __user
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > -
> >       amdgpu_virt_disable_access_debugfs(adev);
> > -     return result;
> > +     return r;
> >   }
> >
> >   /**
> > @@ -621,12 +609,8 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct=
 file *f, char __user *buf,
> >
> >               value =3D RREG32_SMC(*pos);
> >               r =3D put_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     amdgpu_virt_disable_access_debugfs(adev);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               result +=3D 4;
> >               buf +=3D 4;
> > @@ -634,11 +618,12 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struc=
t file *f, char __user *buf,
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > -
> >       amdgpu_virt_disable_access_debugfs(adev);
> > -     return result;
> > +     return r;
> >   }
> >
> >   /**
> > @@ -679,12 +664,8 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struc=
t file *f, const char __user *
> >               uint32_t value;
> >
> >               r =3D get_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     amdgpu_virt_disable_access_debugfs(adev);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               WREG32_SMC(*pos, value);
> >
> > @@ -694,11 +675,12 @@ static ssize_t amdgpu_debugfs_regs_smc_write(stru=
ct file *f, const char __user *
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > -
> >       amdgpu_virt_disable_access_debugfs(adev);
> > -     return result;
> > +     return r;
> >   }
> >
> >   /**
> > @@ -1090,11 +1072,8 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struc=
t file *f, const char __user *bu
> >               uint32_t value;
> >
> >               r =3D get_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               amdgpu_gfx_off_ctrl(adev, value ? true : false);
> >
> > @@ -1104,10 +1083,12 @@ static ssize_t amdgpu_debugfs_gfxoff_write(stru=
ct file *f, const char __user *bu
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> >
> > -     return result;
> > +     return r;
> >   }
> >
> >
> > @@ -1139,18 +1120,12 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struc=
t file *f, char __user *buf,
> >               uint32_t value;
> >
> >               r =3D amdgpu_get_gfx_off_status(adev, &value);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               r =3D put_user(value, (uint32_t *)buf);
> > -             if (r) {
> > -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev)=
;
> > -                     pm_runtime_put_autosuspend(adev_to_drm(adev)->dev=
);
> > -                     return r;
> > -             }
> > +             if (r)
> > +                     goto out;
> >
> >               result +=3D 4;
> >               buf +=3D 4;
> > @@ -1158,10 +1133,12 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struc=
t file *f, char __user *buf,
> >               size -=3D 4;
> >       }
> >
> > +     r =3D result;
> > +out:
> >       pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> >
> > -     return result;
> > +     return r;
> >   }
> >
> >   static const struct file_operations amdgpu_debugfs_regs2_fops =3D {
>
