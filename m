Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50A4A7275
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 15:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069A89D7C;
	Wed,  2 Feb 2022 14:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BAB10E319
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 14:00:24 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z19so40750885lfq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 06:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RfWPagEh50UG5AQsw4YG/NPcNcgAiuaDDHKAvh28Pfo=;
 b=gWuBXj+qXx0RfDEcvw60W9ulUvSlUlHE8bFwjkCfpL4a47/GFof5cDKoPsXVQOVdfv
 EoO/yOcOEOxWxZ+MjVdX7iyZPFgVwM02RaYqc2bEldH7dNpAk8Gz7W8FP+iIox80alGi
 ki+u1RmCp17bDsTFYcmQTQih55MQLrYSwxFrcA4IxoD4E9dIIAwpfYriXo1sCRgdWBYN
 Xaaq1tg/2s9jh+qpLM4o79OewjUhdEwvIJoUI42zNqiwAcbE0jU17Q/h7u1dRGdK/dUc
 1zc/YOEkzjGJLcIWNOwDw5RydsIi2qQrrtwGpClnqtKYbpzyMK8KHPOjxihh0nCbMYXH
 ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RfWPagEh50UG5AQsw4YG/NPcNcgAiuaDDHKAvh28Pfo=;
 b=MIzEhlBFOpheZgM1wqiz9zPG9ebVZjcjM2BO6b2hffBFfk/eSuhTjE9Xyw2W6p5RBX
 lW3Nc/s1r5bz2u0cM7mHq2JfLrNj52iLOWKJ3QZrDpHNW1M2xSSqfmIrWaXMWkKIQn82
 8ruf5iKxAOy4x2/UEjOmjZjeXH9JISJ3BlJI0VnZd0EGWQNd/3mKV5d0IyMAJaHnHzpD
 wACj/17+j7b6ymAigJEltSdFKmPbUZWTEC8vK7IgyB/if+xhumn8/BotgDLeUiFJaBBZ
 NKhGWRIvsHRFoJSJs82cUkk9SXNSfS7ov7TbFHMHEyKpBjg/UPVvScrHu3WdqNmXV3D8
 72kw==
X-Gm-Message-State: AOAM533ilKIJxa2c19jqJ/o/9YoUUdZAQxQtQTJkyPzyMZtBnEfPSHpI
 BJopnf/5ziSn4hqMuJWGDS4OrcrSZ5UFbiUJkH6NIg==
X-Google-Smtp-Source: ABdhPJyStv54EPifbmyjjo5mPhJzT0KvmzQ4l/aBbOIzs2lV1jYzKtxILnikfpnxSP/qWf4MckalpLs8F3T1He52QnI=
X-Received: by 2002:a05:6512:2342:: with SMTP id
 p2mr23187896lfu.382.1643810422358; 
 Wed, 02 Feb 2022 06:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20220202091134.3565514-1-lucas.demarchi@intel.com>
 <514cdee2-655e-7e52-d6a5-a7176ee603cc@amd.com>
 <20220202093814.i5z2nmlunrwm2n6c@ldmartin-desk2>
In-Reply-To: <20220202093814.i5z2nmlunrwm2n6c@ldmartin-desk2>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 2 Feb 2022 19:30:10 +0530
Message-ID: <CAO_48GGeZqzAMEBfspWAR5N1RWh0QAdQFSxgyhrPQHiE3ooJsA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf-map: Rename to iosys-map
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
 tzimmermann@suse.de, daniel.vetter@ffwll.ch, nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Lucas,

On Wed, 2 Feb 2022 at 15:08, Lucas De Marchi <lucas.demarchi@intel.com> wro=
te:
>
> On Wed, Feb 02, 2022 at 10:25:28AM +0100, Christian K=C3=B6nig wrote:
> >Am 02.02.22 um 10:11 schrieb Lucas De Marchi:
> >>[SNIP]
> >>diff --git a/MAINTAINERS b/MAINTAINERS
> >>index d03ad8da1f36..112676f11792 100644
> >>--- a/MAINTAINERS
> >>+++ b/MAINTAINERS
> >>@@ -5675,7 +5675,6 @@ T:      git git://anongit.freedesktop.org/drm/drm=
-misc
> >>  F:  Documentation/driver-api/dma-buf.rst
> >>  F:  drivers/dma-buf/
> >>  F:  include/linux/*fence.h
> >
> >Oh, that is not correct to begin with.
>
> right, include/linux/dma-fence*
>
> >
> >>-F:   include/linux/dma-buf*
> >
> >That here should probably be changed to point directly to
> >include/linux/dma-buf.h, but that can come later on.
>
> thanks for catching that. I will change it on next version and add your
> (and any additional) ack.
>
> Lucas De Marchi
>
> >
> >Feel free to add an Acked-by: Christian K=C3=B6nig
> ><christian.koenig@amd.com> to the patch.
> >
> >If nobody objects I'm going to push it drm-misc-next and provide a
> >follow up to cleanup the MAINTAINERS file a bit more.
Thank you for the patch; apologies for not being able to respond
earlier (was out due to covid, just getting back slowly).

With Christian's suggestions, looks good to me as well - feel free to add a=
n
Acked-by: Sumit Semwal <sumit.semwal@linaro.org> to the same.

> >
> >Regards,
> >Christian.
Best,
Sumit.

> >
> >>  F:  include/linux/dma-resv.h
> >>  K:  \bdma_(?:buf|fence|resv)\b
> >>@@ -9976,6 +9975,13 @@ F:     include/linux/iova.h
> >>  F:  include/linux/of_iommu.h
> >>  F:  include/uapi/linux/iommu.h
> >>+IOSYS-MAP HELPERS
> >>+M:   Thomas Zimmermann <tzimmermann@suse.de>
> >>+L:   dri-devel@lists.freedesktop.org
> >>+S:   Maintained
> >>+T:   git git://anongit.freedesktop.org/drm/drm-misc
> >>+F:   include/linux/iosys-map.h
> >>+
> >
