Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992584EF424
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CF210F60E;
	Fri,  1 Apr 2022 15:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7841A10E421;
 Fri,  1 Apr 2022 15:29:48 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v75so3183082oie.1;
 Fri, 01 Apr 2022 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gyt7OhDDJG/Jjk7Y/BmbMpmUgwu226u2PaT2lDpwvxc=;
 b=j0CYlUEivF/RCALCdJ2Z4wBED5Vbr8IWDxV7p4iIFjdEPkXzwTWODhj30CjLvZmhe7
 2UFCyytz3MgGot99GXMHJIHAVUXsGifPAMzVoAGEz6haXmV9xVL4H6iEFgRz73A/vW/b
 29CVR98yCdyUfqh0UAPAjP3ZbeD46Sh1qT+yaQ1UN1jsn3QMZoCYa8ERKMjHfHjidTF9
 lFwKqatt6pTzk/OJxda5PyWzuYt9NX8ZI/j8WUd1wXS1/sEINWSM1JxS60XJ0msC3Y14
 8opdr8vTS0FJnpA3d+EwYGG8S8YqmX/+EluBLGit5cQrhQrEr84rf6ar3uqf/I5BA2Qj
 o2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gyt7OhDDJG/Jjk7Y/BmbMpmUgwu226u2PaT2lDpwvxc=;
 b=p4RVPc/sdj4WXBbI0qH2ftQJ8abmpcJBddNlT70Zl7GF690fN2R0t4yw+Pjle76PWe
 GLGsxZqax0QsRMKw2e1YflhsS9qJbuya8nuDChp9EorCtn2vwAL5sDhi1BBTR4BQUTlY
 /YLi7ClsZKM2pWbm5cZrAPjTIy/DGaJ9CShXC2H2fqXc5c0yf9W2IRPkH4wWghuSvK8Q
 LqaZNpy0kNxxFBUEPabFOPTygi4GliGV8yhFZTkLN2xX8XuYats0K6OnDLpQTYtkfabn
 HpHJEuetRsPGYfspSHa5gZyFp7oRqdJ0gkfTToq0lfwGu5Hf5sf0v0ZVIMy0iFUAtx5k
 t8Ew==
X-Gm-Message-State: AOAM5307nLJHimIp4xf0xVbrZ5sy9qKsJXHvMwFqSB8kX7tbWtIPpDvD
 uNATicEdN2pVgeNNYesWqunSv8ZJTURHAZU1WEE=
X-Google-Smtp-Source: ABdhPJwyrU8W6jyhWPl9Bn2XENn1UJZ4nH2sM7UDccpjUlXDCe8pBNG9QRtRKHuBY2hCPZOYMIk9gwEPzLWS1mVKl+0=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr4719251oic.200.1648826987831; Fri, 01
 Apr 2022 08:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
 <1648794486-23302-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1648794486-23302-1-git-send-email-baihaowen@meizu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Apr 2022 11:29:36 -0400
Message-ID: <CADnq5_MyjrUus0BZpzRKLei-asBepNGjZanLgHiFVUFWSmggcQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm/amdgpu/vcn: Remove unneeded semicolon
To: Haowen Bai <baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tao Zhou <tao.zhou1@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Mohammad Zafar Ziya <Mohammadzafar.ziya@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Apr 1, 2022 at 3:23 AM Haowen Bai <baihaowen@meizu.com> wrote:
>
> report by coccicheck:
> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1951:2-3: Unneeded semicolon
>
> Fixes: c543dcbe4237 ("drm/amdgpu/vcn: Add VCN ras error query support")
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
> V1->V2: change title; change Fixed info;
>
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index 3e1de8c..17d44be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -1948,7 +1948,7 @@ static uint32_t vcn_v2_6_query_poison_by_instance(struct amdgpu_device *adev,
>                 break;
>         default:
>                 break;
> -       };
> +       }
>
>         if (poison_stat)
>                 dev_info(adev->dev, "Poison detected in VCN%d, sub_block%d\n",
> --
> 2.7.4
>
