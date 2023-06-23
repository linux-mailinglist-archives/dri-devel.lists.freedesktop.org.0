Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778773C8DB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99410E0D1;
	Sat, 24 Jun 2023 08:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C303610E63E;
 Fri, 23 Jun 2023 14:18:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f8775126d3so858156e87.1; 
 Fri, 23 Jun 2023 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687529904; x=1690121904;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U03ByJLEXBVMFxhG8e0O73cGqPopBbGVt9AAt3CnnZM=;
 b=TywO85a77leSYCYVzYOanKoYa/s0ry32wpUrlEPzIhxZoGCaQs4jLZLSuvKMxBRSr+
 TbsGogQpwLOF+rgYk/CyTwqloBlNuD8fJEweLuRiNozRHTFlrD5lDd7+9avg+CQ9MgTM
 3NeNQ6SjuKvYW/h/6rmzX6ITBol7wIruscuj+zEIp+E6QNcBcAXEMSQV0OAye1V+K0WH
 IzEPw2+nBwMnUlvmly78g7ZGJr/xOC4JJohFIcJfH+Novulicc/nemrxnOoESSeW3KYG
 JFw/aKSW1VA6uVKgz1V2F9qLKxnTP/2DNimF/UcFJFDvaNOEmrMQ2SGXFJk5USkAjMlR
 TvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687529904; x=1690121904;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U03ByJLEXBVMFxhG8e0O73cGqPopBbGVt9AAt3CnnZM=;
 b=az+qAgWk2jtn4T4nKJ2Io8Lhfehohb5KYe1a+2EVD5r9WuHYszOBz6UvBIcBVqT8Bm
 4iM7s4wLoxGj1cUpyAyQ2UiLYmzvQpUyWUuvXPxv9J93h/HNjNdZq0t3Qwvxs2QnxSVG
 SISNn9gjl5FEXeXQbIl2cgMU/uueCWP34EXdD6XzwL2srgYQfqXYdzbfVC7XNxj6NqoP
 qw3BKGat7Dei6x5FH2sRVM9oEEMcwZ8K8bf49H/euTP0h2vg7uyxPpI1o/EfNN0S8ePM
 F4MY/hheJ96UH2piQXSkPNBAM0Gj7UexuJXP5wqkDLxsRhdM6DvhoO5BU1lCPeNDZ4qg
 avZQ==
X-Gm-Message-State: AC+VfDxe6+MT3ZtPHpHEmH0SAe6HzFUAlRRhfJa/ysmF5TKtQGUoJWS3
 DT8WfJg9o+O655P+/2uB9yP/5DLG3/s6e1SMh3M=
X-Google-Smtp-Source: ACHHUZ5gD5e0fXJGAEuWY1GjpdaeAwxiN2MHag9P+QRePRiowthqZsR1lYoSq+npkE5Bp5epdKwCAQwNu+Xp8lfnykI=
X-Received: by 2002:ac2:4f13:0:b0:4f9:6b06:129e with SMTP id
 k19-20020ac24f13000000b004f96b06129emr3293665lfr.65.1687529904252; Fri, 23
 Jun 2023 07:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-6-zhengqi.arch@bytedance.com>
In-Reply-To: <20230622085335.77010-6-zhengqi.arch@bytedance.com>
From: Bobs_Email <robertharoldlee@gmail.com>
Date: Fri, 23 Jun 2023 07:18:11 -0700
Message-ID: <CADMFwCv+BsVM51nBNwMTAe5LbfSFGrjzkWEww-ZtGwrhAV+_4Q@mail.gmail.com>
Subject: Re: [PATCH 05/29] drm/panfrost: dynamically allocate the drm-panfrost
 shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: multipart/alternative; boundary="0000000000007dacb305feccace6"
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: djwong@kernel.org, roman.gushchin@linux.dev, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-ext4@vger.kernel.org,
 paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, vbabka@suse.cz,
 brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007dacb305feccace6
Content-Type: text/plain; charset="UTF-8"

Please remove Bob Lee from this email group.
He is deceased


On Thu, Jun 22, 2023, 1:56 AM Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> In preparation for implementing lockless slab shrink,
> we need to dynamically allocate the drm-panfrost shrinker,
> so that it can be freed asynchronously using kfree_rcu().
> Then it doesn't need to wait for RCU read-side critical
> section when releasing the struct panfrost_device.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 24 ++++++++++---------
>  2 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h
> b/drivers/gpu/drm/panfrost/panfrost_device.h
> index b0126b9fbadc..e667e5689353 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -118,7 +118,7 @@ struct panfrost_device {
>
>         struct mutex shrinker_lock;
>         struct list_head shrinker_list;
> -       struct shrinker shrinker;
> +       struct shrinker *shrinker;
>
>         struct panfrost_devfreq pfdevfreq;
>  };
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> index bf0170782f25..2a5513eb9e1f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -18,8 +18,7 @@
>  static unsigned long
>  panfrost_gem_shrinker_count(struct shrinker *shrinker, struct
> shrink_control *sc)
>  {
> -       struct panfrost_device *pfdev =
> -               container_of(shrinker, struct panfrost_device, shrinker);
> +       struct panfrost_device *pfdev = shrinker->private_data;
>         struct drm_gem_shmem_object *shmem;
>         unsigned long count = 0;
>
> @@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object
> *obj)
>  static unsigned long
>  panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct
> shrink_control *sc)
>  {
> -       struct panfrost_device *pfdev =
> -               container_of(shrinker, struct panfrost_device, shrinker);
> +       struct panfrost_device *pfdev = shrinker->private_data;
>         struct drm_gem_shmem_object *shmem, *tmp;
>         unsigned long freed = 0;
>
> @@ -100,10 +98,15 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker,
> struct shrink_control *sc)
>  void panfrost_gem_shrinker_init(struct drm_device *dev)
>  {
>         struct panfrost_device *pfdev = dev->dev_private;
> -       pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
> -       pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
> -       pfdev->shrinker.seeks = DEFAULT_SEEKS;
> -       WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
> +
> +       pfdev->shrinker =
> shrinker_alloc_and_init(panfrost_gem_shrinker_count,
> +
>  panfrost_gem_shrinker_scan, 0,
> +                                                 DEFAULT_SEEKS, 0, pfdev);
> +       if (pfdev->shrinker &&
> +           register_shrinker(pfdev->shrinker, "drm-panfrost")) {
> +               shrinker_free(pfdev->shrinker);
> +               WARN_ON(1);
> +       }
>  }
>
>  /**
> @@ -116,7 +119,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device
> *dev)
>  {
>         struct panfrost_device *pfdev = dev->dev_private;
>
> -       if (pfdev->shrinker.nr_deferred) {
> -               unregister_shrinker(&pfdev->shrinker);
> -       }
> +       if (pfdev->shrinker->nr_deferred)
> +               unregister_and_free_shrinker(pfdev->shrinker);
>  }
> --
> 2.30.2
>
>

--0000000000007dacb305feccace6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please remove Bob Lee from this email group.<div dir=3D"a=
uto">He is deceased</div><div dir=3D"auto"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 22, 2023=
, 1:56 AM Qi Zheng &lt;<a href=3D"mailto:zhengqi.arch@bytedance.com">zhengq=
i.arch@bytedance.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>In preparation for implementing lockless slab shrink,<br>
we need to dynamically allocate the drm-panfrost shrinker,<br>
so that it can be freed asynchronously using kfree_rcu().<br>
Then it doesn&#39;t need to wait for RCU read-side critical<br>
section when releasing the struct panfrost_device.<br>
<br>
Signed-off-by: Qi Zheng &lt;<a href=3D"mailto:zhengqi.arch@bytedance.com" t=
arget=3D"_blank" rel=3D"noreferrer">zhengqi.arch@bytedance.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/panfrost/panfrost_device.h=C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0.../gpu/drm/panfrost/panfrost_gem_shrinker.c=C2=A0 | 24 ++++++++++---=
------<br>
=C2=A02 files changed, 14 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/p=
anfrost/panfrost_device.h<br>
index b0126b9fbadc..e667e5689353 100644<br>
--- a/drivers/gpu/drm/panfrost/panfrost_device.h<br>
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h<br>
@@ -118,7 +118,7 @@ struct panfrost_device {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mutex shrinker_lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct list_head shrinker_list;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct shrinker shrinker;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct shrinker *shrinker;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct panfrost_devfreq pfdevfreq;<br>
=C2=A0};<br>
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu=
/drm/panfrost/panfrost_gem_shrinker.c<br>
index bf0170782f25..2a5513eb9e1f 100644<br>
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c<br>
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c<br>
@@ -18,8 +18,7 @@<br>
=C2=A0static unsigned long<br>
=C2=A0panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_=
control *sc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct panfrost_device *pfdev =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(shrink=
er, struct panfrost_device, shrinker);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct panfrost_device *pfdev =3D shrinker-&gt;=
private_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_shmem_object *shmem;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long count =3D 0;<br>
<br>
@@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj=
)<br>
=C2=A0static unsigned long<br>
=C2=A0panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_c=
ontrol *sc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct panfrost_device *pfdev =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(shrink=
er, struct panfrost_device, shrinker);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct panfrost_device *pfdev =3D shrinker-&gt;=
private_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_shmem_object *shmem, *tmp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long freed =3D 0;<br>
<br>
@@ -100,10 +98,15 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, =
struct shrink_control *sc)<br>
=C2=A0void panfrost_gem_shrinker_init(struct drm_device *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct panfrost_device *pfdev =3D dev-&gt;dev_p=
rivate;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pfdev-&gt;shrinker.count_objects =3D panfrost_g=
em_shrinker_count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pfdev-&gt;shrinker.scan_objects =3D panfrost_ge=
m_shrinker_scan;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pfdev-&gt;shrinker.seeks =3D DEFAULT_SEEKS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(register_shrinker(&amp;pfdev-&gt;shrink=
er, &quot;drm-panfrost&quot;));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pfdev-&gt;shrinker =3D shrinker_alloc_and_init(=
panfrost_gem_shrinker_count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0panfrost_gem_shrinker_scan, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFAULT_SEEKS, 0, pfdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pfdev-&gt;shrinker &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0register_shrinker(pfdev-&gt;shrin=
ker, &quot;drm-panfrost&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shrinker_free(pfdev=
-&gt;shrinker);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -116,7 +119,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *d=
ev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct panfrost_device *pfdev =3D dev-&gt;dev_p=
rivate;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pfdev-&gt;shrinker.nr_deferred) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_shrinker=
(&amp;pfdev-&gt;shrinker);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pfdev-&gt;shrinker-&gt;nr_deferred)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_and_free=
_shrinker(pfdev-&gt;shrinker);<br>
=C2=A0}<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--0000000000007dacb305feccace6--
