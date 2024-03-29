Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A1E89173A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 11:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB11B10F583;
	Fri, 29 Mar 2024 10:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QbLejqej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4310F818
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711709889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObmCChwbxI4fnx/oMY/3duoto3dJqKFQjwXK6r0ebbk=;
 b=QbLejqejcTXYnpi6v7P/hoStHyYIo+wo9scz/Tc21eZlzdurPz0hDHn0u7VKd+9Qp0eSEF
 m62Hk0k8EnkFDeazd8L6AH5Qina9/+ibheUyOUNdXuW//tJ7croU+Hbw0j3p2AjtmDyqBg
 ad+MedvinPyTUtcIQ53sR+lJuC914dU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-5gBzh5ARPLaPFdLdC0GfGA-1; Fri, 29 Mar 2024 06:58:08 -0400
X-MC-Unique: 5gBzh5ARPLaPFdLdC0GfGA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-515d1395657so331660e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 03:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711709886; x=1712314686;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ObmCChwbxI4fnx/oMY/3duoto3dJqKFQjwXK6r0ebbk=;
 b=tCLRKEvu3q6M0MHOqPwRRtZ8pbjdRF3x+PhR/wZkkrGdAa6DkFTEqFjbOei1sK3Ya4
 rtEm+bazXJc4FSFmfJcxsAcbnx1QsQvKTGwkHnWWgl10kv6Z9Q74Ml3lf8hYR17cJ9bv
 NRNznB75U0nhFr92vATsT+qcRPPC+owvJZRbx0me1y9ntiCJS7xLDcThvLfL6MT7lDIE
 13UVfSOyvEoX/9g7GvROJPwt4BqFuOi7wRhYHYgganHboxLIFKwXgVqWMMse+32ZBWWd
 HKbNkTYb3Qm315E2ZV8VSBnNmMlrkIS+9WErl89xKpTGuQaFCXZvDP1YJTnBLUp4sOAX
 MTSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEiJljNhe9b+xkuQxsnptxG5xtYFTgwN5vRBOXkAJv5CpjxI0j4GeTEx+f3Siw1T84ykfzCQib/YA+HvTDNUV7HuRcZ95BEBA4dDImfyOi
X-Gm-Message-State: AOJu0YxwRzVm59beTu1kJIPSL4bPSHW2sTz2C7Wuf1nFrMFeovvG6BFx
 NGTmYIbvX5UYEu1Pblusoi1CV7GkfOzC7/jUUimQM9HFy7kTuvPj5hqAtTSObksq3UKpr/8HNeC
 RZy2gK1Zhr7KrcqSmPrIiWUBAiZEZu3R4k7kRuOsqG3P7svx1COG3Hjgb2KrJb6j6qw==
X-Received: by 2002:ac2:4197:0:b0:513:d3c0:f66 with SMTP id
 z23-20020ac24197000000b00513d3c00f66mr1297970lfh.51.1711709886664; 
 Fri, 29 Mar 2024 03:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG29WemiigJFVRUgtZdZmONK+lboYNHffuMAIXm6vtZQPUrBU42pJdYIugnsyliFC3CMebqVw==
X-Received: by 2002:ac2:4197:0:b0:513:d3c0:f66 with SMTP id
 z23-20020ac24197000000b00513d3c00f66mr1297956lfh.51.1711709886231; 
 Fri, 29 Mar 2024 03:58:06 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it.
 [87.12.25.33]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056402194400b0056c4cdc987esm1879596edz.8.2024.03.29.03.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 03:58:05 -0700 (PDT)
Date: Fri, 29 Mar 2024 11:58:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, 
 "David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, Kalle Valo <kvalo@kernel.org>,
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
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, kvm@vger.kernel.org, linux-wireless@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 09/22] gpio: virtio: drop owner assignment
Message-ID: <wevexb25pa4cwa73tmmlpqyf527drjyfr56j46ddrglofh2mew@sv5hxdqpiu73>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Fri, Mar 29, 2024 at 11:27:19AM +0100, Bartosz Golaszewski wrote:
>On Wed, Mar 27, 2024 at 1:45 PM Krzysztof Kozlowski
><krzysztof.kozlowski@linaro.org> wrote:
>>
>> virtio core already sets the .owner, so driver does not need to.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Depends on the first patch.
>> ---
>>  drivers/gpio/gpio-virtio.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
>> index fcc5e8c08973..9fae8e396c58 100644
>> --- a/drivers/gpio/gpio-virtio.c
>> +++ b/drivers/gpio/gpio-virtio.c
>> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver = {
>>         .remove                 = virtio_gpio_remove,
>>         .driver                 = {
>>                 .name           = KBUILD_MODNAME,
>> -               .owner          = THIS_MODULE,
>>         },
>>  };
>>  module_virtio_driver(virtio_gpio_driver);
>>
>> --
>> 2.34.1
>>
>
>Applied, thanks!

Did you also applied the first patch of this series?

Without that I'm not sure it's a good idea to apply this patch as also
Krzysztof mentioned after ---.

Thanks,
Stefano

