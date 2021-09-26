Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B7418AB8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 21:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55B6E544;
	Sun, 26 Sep 2021 19:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A645F6E53C;
 Sun, 26 Sep 2021 19:10:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id dj4so59860221edb.5;
 Sun, 26 Sep 2021 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/z4b+ZlOW6IOAYv+nmY4e5Fiqjg581HHJvfOVe6AWyI=;
 b=FUejexteXAplj0iM0girVHBZzZ+pSrgSlEEYEqR5btN26YhMIrBuWLXiwYsqTqXbEe
 jJocjRlRbAmKXvqiqTOP6tneW+ofVYWlRahsTlNlqDXMJbvHc4/SzBzHGAxfR2Polw5M
 rsA0t/37JqenO3rT4wOfrilXqcm64cHw1KyuL/EFRHSzK3CRFzkVyTH/ot3KcJ5t1sUT
 MyEmCZoEvQ38cxsyCpJRoahdCZwyMfHIy4YrzjBWIu15io3RtqDPebZfrsDxkIAoZ6zg
 jDI3PvYggsvBdHWkdgzuyBHBKY/B1+nNkXBfxNXa2qhKHVPPaU6I63cdkQUdhKWFJZbd
 rbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/z4b+ZlOW6IOAYv+nmY4e5Fiqjg581HHJvfOVe6AWyI=;
 b=hqAdEsTzZfPMCOkiRejm09/ZosEcN4+kA4EekrKKyjvYNeGT5aVp4KtBdshqgp5gcX
 ms8y2Dc1U4l+Tlvgbc7YJ+65lLDogFGbOUqgSIWQLY97UkKGn//cbe5kipf6Zk+XbzXA
 Yjdua4L9J/gNy3qtOp3bsJyKaxj/zVIbl8mDK0QsxBlaULs3drONMkzQuTeXbudO2a1G
 tlkc6kVUCKFfUNNpaDAUg93B0OQxQD+MGrGWgkUyX67UkDCmtFlyneRb4/BPojCFOaNv
 vuXO2xlGcLBtMUKQFBopgbjiz+JUKvkvdCLlOr0jgpOZB6AVS4Wf6+zsnfGI1DQ1GfJM
 qcOw==
X-Gm-Message-State: AOAM5320rbjwoMMozlK/AxGWc7W9VwXm0VlFo9OHJWyugkzoxHrUA8pY
 gWDpfAQw6cBPcfoejuZV6EIeo/DSDF6xPlPuZ0oGKrnfliY=
X-Google-Smtp-Source: ABdhPJxxky1LCzPjincNKps8fXB/iI9VPpw+nJnqSXZTQuKXkSr4r7QFRMtUboNrhS13atoLQyplJJypBbaqs6pG2Pk=
X-Received: by 2002:a17:906:ece7:: with SMTP id
 qt7mr11555062ejb.250.1632683425057; 
 Sun, 26 Sep 2021 12:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <1632640580-61609-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1632640580-61609-1-git-send-email-yang.lee@linux.alibaba.com>
From: Amos Jianjun Kong <kongjianjun@gmail.com>
Date: Mon, 27 Sep 2021 03:10:13 +0800
Message-ID: <CAFeW=pYwkZ8=pVi9f-kHGwr-7Gb2OuWYd=LPzHt+yPWRP_gn8w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix resource_size.cocci warnings
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, Felix.Kuehling@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="00000000000094d0c705cceabbb7"
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

--00000000000094d0c705cceabbb7
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 26, 2021 at 3:17 PM Yang Li <yang.lee@linux.alibaba.com> wrote:

> Use resource_size function on resource object
> instead of explicit computation.
>
> Clean up coccicheck warning:
> ./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:905:10-13: ERROR: Missing
> resource_size with res
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 4a16e3c..f53e17a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -901,8 +901,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
>
>                 /* Disable SVM support capability */
>                 pgmap->type = 0;
> -               devm_release_mem_region(adev->dev, res->start,
> -                                       res->end - res->start + 1);
> +               devm_release_mem_region(adev->dev, res->start,
> resource_size(res));
>

Looks good.
Reviewed-by: Amos Kong <kongjianjun@gmail.com>



>                 return PTR_ERR(r);
>         }
>
> --
> 1.8.3.1
>
>

--00000000000094d0c705cceabbb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Sep 26, 2021 at 3:17 PM Yang Li &=
lt;<a href=3D"mailto:yang.lee@linux.alibaba.com">yang.lee@linux.alibaba.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Use resource_size function on resource object<br=
>
instead of explicit computation.<br>
<br>
Clean up coccicheck warning:<br>
./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:905:10-13: ERROR: Missing<br>
resource_size with res<br>
<br>
Reported-by: Abaci Robot &lt;<a href=3D"mailto:abaci@linux.alibaba.com" tar=
get=3D"_blank">abaci@linux.alibaba.com</a>&gt;<br>
Signed-off-by: Yang Li &lt;<a href=3D"mailto:yang.lee@linux.alibaba.com" ta=
rget=3D"_blank">yang.lee@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_migrate.c<br>
index 4a16e3c..f53e17a 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c<br>
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c<br>
@@ -901,8 +901,7 @@ int svm_migrate_init(struct amdgpu_device *adev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable SVM supp=
ort capability */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgmap-&gt;type =3D =
0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devm_release_mem_re=
gion(adev-&gt;dev, res-&gt;start,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res-&gt;e=
nd - res-&gt;start + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devm_release_mem_re=
gion(adev-&gt;dev, res-&gt;start, resource_size(res));<br></blockquote><div=
><br></div><div>Looks good.</div><div>Reviewed-by: Amos Kong &lt;<a href=3D=
"mailto:kongjianjun@gmail.com">kongjianjun@gmail.com</a>&gt;</div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(r);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--00000000000094d0c705cceabbb7--
