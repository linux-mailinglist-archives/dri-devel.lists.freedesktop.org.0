Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5A7315B0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 12:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0165410E4C6;
	Thu, 15 Jun 2023 10:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AAC10E4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686825944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHWwBHTJp1Vn4qAEH/pruPeL51SLcm+LpRyTXT0qhN4=;
 b=EA8DXNL36Alm/Gszjm79ndavYqsnPUUWWlnRlAFj6wqeiYFH+sHvUlPZer2Nz5mMXl+PG5
 vPTeZkuMvKuqMFUTIq51OQv6/mnVAC+XdfTwmkwpJBVbiGvDuLVRR4sFUMoawLPJOG7OFX
 RzsSI1iDHbqGnDmp1j1sy3U2BKDdYqQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-3duoc2nyOyaxvv7WftdoLw-1; Thu, 15 Jun 2023 06:45:43 -0400
X-MC-Unique: 3duoc2nyOyaxvv7WftdoLw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f847ac9912so24525e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 03:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686825941; x=1689417941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHWwBHTJp1Vn4qAEH/pruPeL51SLcm+LpRyTXT0qhN4=;
 b=jk+/ayDfORMpznLSXF2OK/+vp6DWp5AKg+l5nPQi7tW+SbMQoolWT1bWjfjdKyBbm1
 H2QBasi//ZHMuKnPpzAZ/0avp54AMD1PMLZHzLt61XhAIBzZCFrUU5rySqvWSlpbtTd0
 SCbnw9iTgUJmJx3A9CfXyS5K8poMRBd3PGRgn3C/Vgit8Q0XKWACc82qlOO4oei5/m8q
 oc9/Em37KFwLfJppw1M3ySRDFd45aRdfiwilHGTkbMAGk3UTJEFJ0SlKaWecG6H5fAJi
 IrjSI4GR4mS+CjqZjgVYh5d+uckkHjpdvyItmetT6i/j61MxFzh5GWHiktmtGLVhbo8T
 NBcA==
X-Gm-Message-State: AC+VfDw/IWxtzJeaL4ieVQ69txSjHoB14ps32frVZ0Syii8YgDh3lb1G
 qtp+qdhNBo0WdXDy2RX4LrgyJM0aG65QBTsOBBqBBQVKlBvbi9fxpEaxlWPjOrM+RPvOhq2f5pJ
 eyKjAaclAx4bc2pcEOJ8L/wo4unh2/k+TDgc1tA1NA/+1b8/o0WSRDKs=
X-Received: by 2002:a05:651c:2ce:b0:2b1:a69e:6a8e with SMTP id
 f14-20020a05651c02ce00b002b1a69e6a8emr9402562ljo.3.1686825941503; 
 Thu, 15 Jun 2023 03:45:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Q4vX5zZFomYqfMNpktFZ16xOdgqcXPX8qJP6jMJ3sfsXqjTu+NqlZxadaRl8dQDuneTOnLb+fdes1W34dTyc=
X-Received: by 2002:a05:651c:2ce:b0:2b1:a69e:6a8e with SMTP id
 f14-20020a05651c02ce00b002b1a69e6a8emr9402546ljo.3.1686825941171; Thu, 15 Jun
 2023 03:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230615024008.1600281-1-airlied@gmail.com>
In-Reply-To: <20230615024008.1600281-1-airlied@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Jun 2023 12:45:30 +0200
Message-ID: <CACO55ttzqSXaA8F_Se_rYDCoqyp7ridVkR4_0tSWOTMSGH4v5A@mail.gmail.com>
Subject: Re: [PATCH] nouveau: fix client work fence deletion race
To: Dave Airlie <airlied@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 4:47=E2=80=AFAM Dave Airlie <airlied@gmail.com> wro=
te:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This seems to have existed for ever but is now more apparant after
> 9bff18d13473a9fdf81d5158248472a9d8ecf2bd (drm/ttm: use per BO cleanup wor=
kers)
>
> My analysis:
> two threads are running,
> one in the irq signalling the fence, in dma_fence_signal_timestamp_locked=
,
> it has done the DMA_FENCE_FLAG_SIGNALLED_BIT setting, but hasn't yet reac=
hed the callbacks.
>
> second thread in nouveau_cli_work_ready, where it sees the fence is signa=
lled, so then puts the
> fence, cleanups the object and frees the work item, which contains the ca=
llback.
>
> thread one goes again and tries to call the callback and causes the use-a=
fter-free.
>
> Proposed fix:
> lock the fence signalled check in nouveau_cli_work_ready, so either the c=
allbacks are done
> or the memory is freed.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Fixes: 11e451e74050 ("drm/nouveau: remove fence wait code from
deferred client work handler")

Is I think the most reasonable commit to tag to ensure backports.

> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index cc7c5b4a05fd..1a45be769848 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -137,10 +137,16 @@ nouveau_name(struct drm_device *dev)
>  static inline bool
>  nouveau_cli_work_ready(struct dma_fence *fence)
>  {
> -       if (!dma_fence_is_signaled(fence))
> -               return false;
> -       dma_fence_put(fence);
> -       return true;
> +       unsigned long flags;
> +       bool ret =3D true;
> +       spin_lock_irqsave(fence->lock, flags);
> +       if (!dma_fence_is_signaled_locked(fence))
> +               ret =3D false;
> +       spin_unlock_irqrestore(fence->lock, flags);

I agree with the code being always broken as
`dma_fence_is_signaled_locked` specifies: "This function requires
&dma_fence.lock to be held."

> +
> +       if (ret =3D=3D true)
> +               dma_fence_put(fence);
> +       return ret;
>  }
>
>  static void
> --
> 2.40.1
>

regardless of the patch fixing the issue users have seen:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

