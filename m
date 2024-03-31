Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4BF893201
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 16:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC07710E9E9;
	Sun, 31 Mar 2024 14:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VRmJ8Wss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220A310E9E9
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 14:49:11 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-7de446125f7so768636241.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711896549; x=1712501349; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZrhGWnam5ewIEKvi1J/+KImvnv5s5c+ztrxTkd52KY=;
 b=VRmJ8WssmC2VTizqZtCy9EM1qGfQhblT7dKbiNCshcY9RMbbSUPQMtVhXBnsQ260Mt
 pJWZfmRj80vHEIBfHz4har81485ZgDXHD+0cN90fvQhZ5tga5WYavHRLaGx3KkpW8Hes
 /RlptaDu+v9EJbwFJSkw6td2HCAUZCxTwXwdu4GaM1QN6t4Gf5CixVBX3YC4F8WerhDa
 2zk89oYihcvH9tBZxUXIsNeg3y0AuXqNkUEMTxvxtqEwZ+lhk8BZ64AMrG//jqmycmN3
 dkfMSV4O2ZLbAh5G3wyg02DpD2Uc5nNEp3eDdczjW/YTMaHlMG/CEMfFpoEEW+MQvjtR
 AbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711896550; x=1712501350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ZrhGWnam5ewIEKvi1J/+KImvnv5s5c+ztrxTkd52KY=;
 b=NLFNJYjAhm2A8MeQiuPdyV1q6vkLhfnIiaSfgTQVSmH1r1odfjFdqrk1+yOqUiN1Lj
 6xlicbXVyGArAaSMJiR8fmwO2aJ02to8KiycmR3Sy9a4EKIoP2BRh0MFgiOJ6tr/bLk2
 WxMQHau8EZf6cPssI5S7DSVrAIPqEIhmjbRZ3Xgesq1X4N/PgN7KJQPYYYM3YWr5GzMF
 WyEz/hFR5ynF8/2ll6n2mwpPAXt33v9ojImUKpYGpBbJwpKAfWTWYY6iPXh4H87F1h7e
 p34WhX1XzVDQ3FldqpJkF8TJ+zyAdzUQJZ3wnTEcGJApCG2yFoG8Vxc7FIxs5MBNEKpB
 cEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeWByhpTj/Qn9OHwvQh6ZxmQtTfYRNb6qFU89FcPvwWY4jSI0IH3CIzRontCHQG+AbbdHJwSlBMVV9XfrY4Z/6Toiogb+Btvt/r2JwNdOl
X-Gm-Message-State: AOJu0YzVV4bvrjDpr66cv0JxY7vQlYrWAkyOGfJa3LohRLb7aAixMMHR
 OFUaMx9btAMM99bMyTtLIYdBou2cs7IsN2rsqr1Z6hBK+0Y8/mgF9qboM/EH9kB9nTgpuN1+8yA
 tmnvYWyUFO9hvIljzwbxd6woMvmY=
X-Google-Smtp-Source: AGHT+IFvToDn2sP8Wi5+v8cPfIOyxQBhtd8MxUHO86mJJT0esgw5Bcm/X9E3+Vmr6W4QD1kjdvDaweIsXuHn0rSW0s8=
X-Received: by 2002:a05:6122:318a:b0:4d4:1fe2:c398 with SMTP id
 ch10-20020a056122318a00b004d41fe2c398mr4258181vkb.2.1711896549612; Sun, 31
 Mar 2024 07:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
 <20240331-module-owner-virtio-v2-21-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-21-98f04bfaf46a@linaro.org>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Sun, 31 Mar 2024 16:48:57 +0200
Message-ID: <CAM9Jb+jMsVVWufi=E2+rfgHtSsgg+M5CAE0HoqsEVFEOvnNy1Q@mail.gmail.com>
Subject: Re: [PATCH v2 21/25] nvdimm: virtio_pmem: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, 
 "David S. Miller" <davem@davemloft.net>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, 
 Alexander Graf <graf@amazon.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Kalle Valo <kvalo@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux.dev, 
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
 netdev@vger.kernel.org, v9fs@lists.linux.dev, kvm@vger.kernel.org, 
 linux-wireless@vger.kernel.org, Linux NVDIMM <nvdimm@lists.linux.dev>, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000bb63b70614f5f9fc"
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

--000000000000bb63b70614f5f9fc
Content-Type: text/plain; charset="UTF-8"

virtio core already sets the .owner, so driver does not need to.
>
> Acked-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com


---
>
> Depends on the first patch.
> ---
>  drivers/nvdimm/virtio_pmem.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
> index 4ceced5cefcf..c9b97aeabf85 100644
> --- a/drivers/nvdimm/virtio_pmem.c
> +++ b/drivers/nvdimm/virtio_pmem.c
> @@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver = {
>         .feature_table          = features,
>         .feature_table_size     = ARRAY_SIZE(features),
>         .driver.name            = KBUILD_MODNAME,
> -       .driver.owner           = THIS_MODULE,
>         .id_table               = id_table,
>         .validate               = virtio_pmem_validate,
>         .probe                  = virtio_pmem_probe,
>
> --
> 2.34.1
>
>

--000000000000bb63b70614f5f9fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">virtio core alrea=
dy sets the .owner, so driver does not need to.<br>
<br>
Acked-by: Dave Jiang &lt;<a href=3D"mailto:dave.jiang@intel.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">dave.jiang@intel.com</a>&gt;<br>
Signed-off-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowsk=
i@linaro.org" rel=3D"noreferrer noreferrer" target=3D"_blank">krzysztof.koz=
lowski@linaro.org</a>&gt;<br></blockquote></div></div><div dir=3D"auto"><pr=
e style=3D"font-family:&quot;courier new&quot;,courier,monospace;font-size:=
16px;font-weight:600">Reviewed-by: Pankaj Gupta &lt;<a href=3D"mailto:panka=
j.gupta.linux@gmail.com">pankaj.gupta.linux@gmail.com</a></pre></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
---<br>
<br>
Depends on the first patch.<br>
---<br>
=C2=A0drivers/nvdimm/virtio_pmem.c | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c<br=
>
index 4ceced5cefcf..c9b97aeabf85 100644<br>
--- a/drivers/nvdimm/virtio_pmem.c<br>
+++ b/drivers/nvdimm/virtio_pmem.c<br>
@@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .feature_table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D features,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .feature_table_size=C2=A0 =C2=A0 =C2=A0=3D ARRA=
Y_SIZE(features),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .<a href=3D"http://driver.name" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D KBUILD_MODNAME,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D THIS_MODULE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D id_table,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .validate=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D virtio_pmem_validate,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D virtio_pmem_probe,<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div></div>

--000000000000bb63b70614f5f9fc--
