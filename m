Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3841E2B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 22:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E3F6EC6C;
	Thu, 30 Sep 2021 20:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B56EC6C;
 Thu, 30 Sep 2021 20:36:45 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 e66-20020a9d2ac8000000b0054da8bdf2aeso6706583otb.12; 
 Thu, 30 Sep 2021 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C0b0Hq/LPYCpY2/2mq/Adw+L8zwSj+4o7ctZaqLsgik=;
 b=CsYQryrzj6jYdwNEy/z1ZPKJF5SyBxlYW40KPR9rkWCmSUaS+8ciUtkhQFxh4GFkXS
 hbTsNxnszOQnnNjnghl9wlNFMymtNeQNrELW5yIPUvpo8jTc9pTEybJOqLj5KULiPDJZ
 DHwjbfGlbp3z863DbSWCuXVLZghGLgg5oA5SdkRwckKYx3BuoWKYgE5wc/gbsv8bh2Tk
 4GMx1mNAHXX+kapgoUWOYDCS1wH/ho0lqybOUWvr0PjDnyvXLYOuIDzJam36fkOEnevw
 AVg8fTnkjQpivYfFzb0yHOq16C0JdrJzEXWdgacKdCVmf8wD5VXftGXGBfF8GkDq/vKt
 +ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C0b0Hq/LPYCpY2/2mq/Adw+L8zwSj+4o7ctZaqLsgik=;
 b=VH4oJm35CDFgxosajnnX8tJ6koL6ZrOaUpd/5OPM64RNabBSaM/Osu49pArJjddmMm
 SmISKm/fjqV35dccY1TQYZfXvTDfrJfqK0UbS0kTu9pV4fx2NegkA5Li6Ss6Z19cCSbM
 hA5q1n0o8dtBf1Tzgg+EhsLcem77eNwQUY1roOdnLZy4J0KfWqNPkbOjMdwLlGWoYpmf
 pDAOj4hoTwaMTfwBZISNxzx04K3Mvabn4poqtTQG7lPfrM7vOA6Q5MLpuAXK+HIdttqR
 TKyDmnY81BRBXfs59nP9JJlCQCXn9uS3MJk/5P+2waOriUs7rS4yeAM+NUqWDVSXXQiP
 8Lrw==
X-Gm-Message-State: AOAM531isEaPr0ne39iaKom6GBgNTQk+MhQ5kdrU4TsRDCJW/r6XSFD7
 15ttDlLLRozC67JHF6zqtxjTK+gZWWU2fxkEIfY=
X-Google-Smtp-Source: ABdhPJzgWrrn1lG/uf8m8Y072LrtYojw2gJ8ABZQUrjI5Vhr/KmpovudArA6EvelUiRTfXS6ukIKJ0rtRhbLOgYnUOI=
X-Received: by 2002:a05:6830:1bc6:: with SMTP id
 v6mr6899764ota.299.1633034205062; 
 Thu, 30 Sep 2021 13:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210930203458.441556-1-trix@redhat.com>
In-Reply-To: <20210930203458.441556-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 16:36:33 -0400
Message-ID: <CADnq5_PVz+2XxKfPJxSb3-s+ukPKeGLCSxRwT6X6hduX8_n0Yw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: match the signatures of the real and stub
 kgd2kfd_probe()
To: Tom Rix <trix@redhat.com>
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, Sep 30, 2021 at 4:35 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> When CONFIG_HSA_AMD=3Dn this there is this error
> amdgpu_amdkfd.c:75:56: error: incompatible type for
>   argument 2 of =E2=80=98kgd2kfd_probe=E2=80=99
>    75 |  adev->kfd.dev =3D kgd2kfd_probe((struct kgd_dev *)adev, vf);
>
> amdgpu_amdkfd.h:349:17: note: declared here
>   349 | struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
>   struct pci_dev *pdev,
>
> The signature of the stub kgd2kfd_probe() does not match the real one.
> So change the stub to match.
>
> Fixes: 920f37e6a3fc ("drm/amdkfd: clean up parameters in kgd2kfd_probe")
> Signed-off-by: Tom Rix <trix@redhat.com>

Anson fixed this up earlier today.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_amdkfd.h
> index 38d883dffc20..69de31754907 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -346,8 +346,7 @@ static inline void kgd2kfd_exit(void)
>  }
>
>  static inline
> -struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd, struct pci_dev *pdev,
> -                                       unsigned int asic_type, bool vf)
> +struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd, bool vf)
>  {
>         return NULL;
>  }
> --
> 2.26.3
>
