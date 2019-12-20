Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71A1282D1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 20:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D5F6EC9B;
	Fri, 20 Dec 2019 19:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3706EC9B;
 Fri, 20 Dec 2019 19:39:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so10527982wru.3;
 Fri, 20 Dec 2019 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hg66hkKf1/l6gSi7Ru8j+0F4eQ0bALANcCRIs1Swg2o=;
 b=r/+yaoUAVeaMIGg3aNjF1y+tpFeSm1Ds7vqOIVrpyjRCx2u/9/6Ymr9/+P87/OCQRE
 +Nk77dJwyms5xgFPK4+f/eSnyCDgP0Gn4nwxhWVtUTA2C5eZWRLrvcOLyK2uwyWL1Lhf
 M4Ro385jhulqaoz57QOvwJrKtcSRJOT70A3UKDwx1A9xyfn7dxsKbNgBcj6zx851qfOB
 mK+7+An8JhIjPYonOvPOqmCgGa33/PBWjnvlb67MqwshycWxFHM4awVofKI4JJNmuz4j
 q4OpajkPXuZiRIUYtxQ56Y3DRUMsHKaoeB/3sXMzO6dAhyD4U2Vo9Bx1GGfgl3ngWyfF
 21kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hg66hkKf1/l6gSi7Ru8j+0F4eQ0bALANcCRIs1Swg2o=;
 b=isc8n/xsM3Yx/4K2XMum24BDexV66FBRejZh+QVZBZAMUgjF43sQs4x20j6nJviF1a
 IdxxXGGFQ1+FuXs345zqbxUgnuXwz5SV8qZwPNsRTsaotv6W9Kkn611u17P0F4uET3hw
 xM3ymQMl+0DePouBFlzxs5QGiELbJAhnaZhBzlVPddmQqG/ISbF+utflj5xvj/KVAAnT
 UQYypmgl9aVR6XH+kX3TdsUK03Jwn4oALk0OLl/k+v7pZIqfeHgZ7TB5gqXo3R96O0Il
 zRgwU3NmFl0C4Zhmq32JyZAYLVwiFWAJstv0qYmuu+M0462v76kW4R830waTQkT2wsLB
 xJlg==
X-Gm-Message-State: APjAAAVdnIn0Q10kNtAOL0Q2e6cDDqTF88amtNCf2n+6Bmv0fhJgPIyk
 PhP6frv5XbGR7UsHrmJRTxngBQV8e1es4LUl9vA=
X-Google-Smtp-Source: APXvYqwDmNTqWZW+leKA59a8gVyfZird0232HELGZmTDZotesfmREMjGXBz0jjcX0ntchFAScxKEm4Gi5Tuy0oass+U=
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr16913087wru.40.1576870773493; 
 Fri, 20 Dec 2019 11:39:33 -0800 (PST)
MIME-Version: 1.0
References: <1576824253-47863-1-git-send-email-mafeng.ma@huawei.com>
In-Reply-To: <1576824253-47863-1-git-send-email-mafeng.ma@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Dec 2019 14:39:20 -0500
Message-ID: <CADnq5_PBt3LeLPc48C5rP=G9d8TgBNj71XiyXo6kZChr30hyWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unneeded variable 'ret' in
 amdgpu_device.c
To: Ma Feng <mafeng.ma@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 10:10 AM Ma Feng <mafeng.ma@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1036:5-8: Unneeded variable: "ret". Return "0" on line 1079
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ma Feng <mafeng.ma@huawei.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 080ec18..6a4b142 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1033,8 +1033,6 @@ static void amdgpu_device_check_smu_prv_buffer_size(struct amdgpu_device *adev)
>   */
>  static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>  {
> -       int ret = 0;
> -
>         if (amdgpu_sched_jobs < 4) {
>                 dev_warn(adev->dev, "sched jobs (%d) must be at least 4\n",
>                          amdgpu_sched_jobs);
> @@ -1076,7 +1074,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>
>         adev->tmz.enabled = amdgpu_is_tmz(adev);
>
> -       return ret;
> +       return 0;
>  }
>
>  /**
> --
> 2.6.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
