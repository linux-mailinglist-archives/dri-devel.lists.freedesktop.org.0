Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5E8918A1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3756310E37D;
	Fri, 29 Mar 2024 12:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z+PeAg+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1508F10E37D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 12:23:29 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d4515ec3aaso16324081fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711714946; x=1712319746;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdH2/uZDyLmBSFlZ529ZdmMTMc2xJjXR5We9XRvPLc8=;
 b=Z+PeAg+q8sAq81WrLahcR4mxuGkFsUGYtlJpZvglHv0GBtcPmhJa4tRH+PhONlMi61
 F6daVsgkR5ek5rgHppNJRQb1AOvNS8/suqHC+sOrI+sQOQleVZjfIfNj/wSs5m/4Q93X
 f3hxmt9qFYB707FxaVYvU67NeeLtYZ+VcsX3ND12/9rv0vz9KILowYI9gfOdw8/cAoXs
 /1yPUOsbN6xdV4JqFkEJQJgOfMlHP92rdIwNx3SPeNZ/UDFL0//TVveu8tRjvWOALgVA
 kW/sOi1thKMi0v0ULXHeGxacUHt/LxsUJCp/nSyLuRgZeyKG3yPXDYXgFAGThjL6KN7H
 BltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711714946; x=1712319746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdH2/uZDyLmBSFlZ529ZdmMTMc2xJjXR5We9XRvPLc8=;
 b=xNqr4SsECHG12vML5iOQfpPnM90/ogEY23Fl19Ntn84cIPafHtQ7sshxe4/jhZlltF
 gstxpKi4D/GCscuwPTJcw5JZwEMRpusDDcbuWZO7KEjm2fXKq7gCZuCNr8DWu5rSdhdK
 lOD5rPxBdNyfHwqYs0mPFaom9997G5XHtlDb5rO2Vi6Ml1SPZPaNeAaWDDVkrn0bBRWc
 whgOdouFTXAFGksI7/gR16Yz3iVM1hVUE3npVz/If2u1/G1qTAf2ZP9dyMyhCGzgZT/z
 WosdHK006q5SYsHNf7MFa6vDEzrfbUsggWpKn95wKTIpFC3SG6G50W/nSttCQNUCBgJK
 z91w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq7P4hIRpOdeOH4RUlwaYm86yPmaiv9l0O064XvCzEIzv+y3diX+6DvuJax3NNNvx6OcTQZu7/U0fDM9R6Zq6bXiiu1tkvuhEEuPZvVKJT
X-Gm-Message-State: AOJu0Ywx2DySqjsFWBlvn4Xxq0IRoch8Bwnjn0H8V7XfOJqBvZwMWjox
 hcyZoUKJukLISAaq8274iz0wJLFt/GF+TLheIejgJu6a7qt+tWmhBo/HpTDKcsKWTdJXM6mHbp7
 x0zS5pumK+BWWDxiNbKlCmmB/zq68fOUcnN0EDg==
X-Google-Smtp-Source: AGHT+IE+HnSCJL2quawa1K1lMrp38Nm79TgJqcEd/z4x+7H7IfVDrdpUOVuBJN0I2Fw0lOyMRLNfqEQZZUdPpNwT2ZM=
X-Received: by 2002:a2e:8350:0:b0:2d3:5480:92aa with SMTP id
 l16-20020a2e8350000000b002d3548092aamr644831ljh.25.1711714946358; Fri, 29 Mar
 2024 05:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
 <1303b572-719e-410d-a11a-3f17a5bb3b63@linaro.org>
In-Reply-To: <1303b572-719e-410d-a11a-3f17a5bb3b63@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 13:22:15 +0100
Message-ID: <CAMRc=Mfeez9kXkkVxdmUk5dy=L=rbnYkYujO6jSCT5WAyUw2HA@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpio: virtio: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, 
 "David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
 netdev@vger.kernel.org, v9fs@lists.linux.dev, kvm@vger.kernel.org, 
 linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org
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

On Fri, Mar 29, 2024 at 12:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/03/2024 11:27, Bartosz Golaszewski wrote:
> > On Wed, Mar 27, 2024 at 1:45=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> virtio core already sets the .owner, so driver does not need to.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Depends on the first patch.
> >> ---
> >>  drivers/gpio/gpio-virtio.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> >> index fcc5e8c08973..9fae8e396c58 100644
> >> --- a/drivers/gpio/gpio-virtio.c
> >> +++ b/drivers/gpio/gpio-virtio.c
> >> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver =3D=
 {
> >>         .remove                 =3D virtio_gpio_remove,
> >>         .driver                 =3D {
> >>                 .name           =3D KBUILD_MODNAME,
> >> -               .owner          =3D THIS_MODULE,
> >>         },
> >>  };
> >>  module_virtio_driver(virtio_gpio_driver);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Applied, thanks!
>
> I expressed dependency in two places: cover letter and this patch.
> Please drop it, because without dependency this won't work. Patch could
> go with the dependency and with your ack or next cycle.
>
> Best regards,
> Krzysztof
>

Dropped, and:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
