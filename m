Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B04EBF0E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E64110E1F1;
	Wed, 30 Mar 2022 10:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AA610E1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648637011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BF3xhFCyLrxCQP5ABQE0ta5feJB/SrzL4G5wThcA57E=;
 b=LdIl4BW2ZYWtSh7iVvGvUTwokcrspFVLgcfEEK21iI67SQcsw4di/IS22EX4sd2fr2gUNd
 J+NVnv0zUmGOll3xsd2+dv34vdOy7bWdqhnCanE98vHyvJSvNkZgPr42l1ahnZ6q1Kd9uW
 YHuj6y823iSPtQjGKznIciotTOUglL8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-zLsOqgFHPAOfed9rjvoofw-1; Wed, 30 Mar 2022 06:43:30 -0400
X-MC-Unique: zLsOqgFHPAOfed9rjvoofw-1
Received: by mail-oo1-f69.google.com with SMTP id
 d3-20020a4aeb83000000b00324f07ebc76so5375112ooj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 03:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BF3xhFCyLrxCQP5ABQE0ta5feJB/SrzL4G5wThcA57E=;
 b=ZCpKMzAO6gKvhhUBO6uELLSIJwycXJkPwdw0GagoU2zuwZdTIE+1VqVIcOiVHZB+jU
 vj8FH/8OWIjmqdoKnObTq6ixI+Wtrd3R1Uct9w6Sv38Tnhs9G/WEFXl6QljEZNCqeDdH
 FYgPeygyU9UKhnhvBfVqBRLlYRHutp8OObkhigyhNI2U0gvd98KbMs6+6uSBN1WMcPjs
 V87gL5HeE/8FI/qhJMBheErGS1TrNIenzUGoXPdASvxwF6Y7GMyhnPpAMRqVUmLaMKhb
 G6Rfo7smMhTqBJBrc6IX+H3gBko+I+sN+ot3Vsd4JipOQqGeZWYQKHshzr16wBQzCUUm
 D7bw==
X-Gm-Message-State: AOAM530cQWswCu5weizpSWItfHcnNmbfil4nFbPqC/2VZRnnZBKVt+UT
 vHeC9PpGhrKasc0ZLFr2M1hTu0c/rqqvE9BmPppW+LA8I/kLgbj8UmIHWiThpR0sIXT7WfPWFKM
 W+xpver8MQBO527Oyppr93kmU3eTe1uXs1O89S2YBsen7
X-Received: by 2002:a05:6870:1714:b0:dd:a30e:d23e with SMTP id
 h20-20020a056870171400b000dda30ed23emr1742733oae.85.1648637009386; 
 Wed, 30 Mar 2022 03:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaEBKXl6GGXGtVuocZYplGp6rtO1QKwBVCHAaEWlTJ5cnjGCD6V7uPD2eiQ9au5HJ6l3QhAGAyP9E6jI3nR6A=
X-Received: by 2002:a05:6870:1714:b0:dd:a30e:d23e with SMTP id
 h20-20020a056870171400b000dda30ed23emr1742723oae.85.1648637009168; Wed, 30
 Mar 2022 03:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <12eba824-ee80-0aac-56ed-e13084c9cae7@amd.com>
 <20220324104928.2959545-1-liucong2@kylinos.cn>
 <982d233d-7e30-f44e-f49d-473c3c41721e@amd.com>
 <a1ceefb7-32d8-9ce3-e56f-7684e6d3ee58@kylinos.cn>
In-Reply-To: <a1ceefb7-32d8-9ce3-e56f-7684e6d3ee58@kylinos.cn>
From: David Airlie <airlied@redhat.com>
Date: Wed, 30 Mar 2022 20:43:18 +1000
Message-ID: <CAMwc25r3ER2Mi4jo2W=VtZcusNhpsyhQ0Mjx+qHhmZAK-fSjZQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/qxl: fix qxl can't use in arm64
To: Cong Liu <liucong2@kylinos.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: airlied <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, ray.huang@amd.com, "Hoffmann,
 Gerd" <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 robin.murphy@arm.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'd like to make sure this has no side effects on x86 guests, it
probably is safe, but keep an eye for regression reports.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Dave.

On Wed, Mar 30, 2022 at 8:20 PM Cong Liu <liucong2@kylinos.cn> wrote:
>
> any suggestions or extra test I can do now?
>
> Regards,
> Cong
>
> On 2022/3/25 15:45, Christian K=C3=B6nig wrote:
> > Am 24.03.22 um 11:49 schrieb Cong Liu:
> >> qxl use ioremap to map ram_header and rom, in the arm64 implementation=
,
> >> the device is mapped as DEVICE_nGnRE, it can not support unaligned
> >> access. and qxl is a virtual device, it can be treated more like RAM
> >> than actual MMIO registers. use ioremap_wc() replace it.
> >>
> >> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> >
> > Looks sane to me, but I'm really not involved enough to fully judge.
> >
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> >> ---
> >>   drivers/gpu/drm/qxl/qxl_kms.c | 4 ++--
> >>   drivers/gpu/drm/qxl/qxl_ttm.c | 4 ++--
> >>   2 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c
> >> b/drivers/gpu/drm/qxl/qxl_kms.c
> >> index 4dc5ad13f12c..a054e4a00fe8 100644
> >> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> >> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> >> @@ -165,7 +165,7 @@ int qxl_device_init(struct qxl_device *qdev,
> >>            (int)qdev->surfaceram_size / 1024,
> >>            (sb =3D=3D 4) ? "64bit" : "32bit");
> >> -    qdev->rom =3D ioremap(qdev->rom_base, qdev->rom_size);
> >> +    qdev->rom =3D ioremap_wc(qdev->rom_base, qdev->rom_size);
> >>       if (!qdev->rom) {
> >>           pr_err("Unable to ioremap ROM\n");
> >>           r =3D -ENOMEM;
> >> @@ -183,7 +183,7 @@ int qxl_device_init(struct qxl_device *qdev,
> >>           goto rom_unmap;
> >>       }
> >> -    qdev->ram_header =3D ioremap(qdev->vram_base +
> >> +    qdev->ram_header =3D ioremap_wc(qdev->vram_base +
> >>                      qdev->rom->ram_header_offset,
> >>                      sizeof(*qdev->ram_header));
> >>       if (!qdev->ram_header) {
> >> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c
> >> b/drivers/gpu/drm/qxl/qxl_ttm.c
> >> index b2e33d5ba5d0..95df5750f47f 100644
> >> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> >> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> >> @@ -82,13 +82,13 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev=
,
> >>       case TTM_PL_VRAM:
> >>           mem->bus.is_iomem =3D true;
> >>           mem->bus.offset =3D (mem->start << PAGE_SHIFT) + qdev->vram_=
base;
> >> -        mem->bus.caching =3D ttm_cached;
> >> +        mem->bus.caching =3D ttm_write_combined;
> >>           break;
> >>       case TTM_PL_PRIV:
> >>           mem->bus.is_iomem =3D true;
> >>           mem->bus.offset =3D (mem->start << PAGE_SHIFT) +
> >>               qdev->surfaceram_base;
> >> -        mem->bus.caching =3D ttm_cached;
> >> +        mem->bus.caching =3D ttm_write_combined;
> >>           break;
> >>       default:
> >>           return -EINVAL;
> >
>

