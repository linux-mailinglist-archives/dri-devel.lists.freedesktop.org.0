Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E45891B98
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 14:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510731121B9;
	Fri, 29 Mar 2024 13:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IUDXgm2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509AE11270F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711718918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b2+syugljaMrrOP++3j3QqL3+aM8ytb7iOaLk3Q4wQ=;
 b=IUDXgm2kOl9/CN/lhCVgoBjWiVVVwUt5rBIo9bSfsN0DUnUCU2Di83i8B8QVZ9/uRrHU2v
 HiWjjesvrN8Qf3DWBUSub7BKFKH5vNhk02uIBr3cj/ZDu/ZGZKKbSzLesA1/nL3E2h0Ed7
 NXmppQUWSIftHX8LY7SCkJOAH64TCms=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-a8cpDuSNNQGmoFi_RYGyJg-1; Fri, 29 Mar 2024 09:28:36 -0400
X-MC-Unique: a8cpDuSNNQGmoFi_RYGyJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33ed26afd99so1048597f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711718915; x=1712323715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9b2+syugljaMrrOP++3j3QqL3+aM8ytb7iOaLk3Q4wQ=;
 b=Hop70jFjM/QrNICuyo22GfD9MGvpxrR5CKummR3WKBSH1eVwOpdLk+abyErM1U8MCM
 2lAralltlh9tvIblSdcxlXdBLfSqjZaeGG7SqUIflA5MpRsJJfkIjTdB7Uc/LduDjQ7D
 QWmjx1bTTrjwW9LXN8KeaFjQ0LVPqJNuf+0FagjlGUjMt7MsOtdgaiJ3hfRPXIz9JDwT
 LILeRygCvQTMwZI/b4cb1RRIPmS6kXMhA5ZkjRj5PvkujQTsCmtwBvKCarHecyzaGEhf
 iQQh8LnErhdz/xkts8m4ksTA4PHMNCiIhCXHILW4RjJb6tGWnpfLfMM5T0hmAHI3phGN
 cglA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgBFzcLica5BYPKudJe9vEFwnkwqQPzqM+COGq0/0mmw0ksTFdsO9c+1HIrdnwQCH2UOjW0uHagSaifi/n0mCPCYCmlfnp+R8Wb4uRepWl
X-Gm-Message-State: AOJu0Yx6tmCs0G3IH+hEzlgDkWIX257UrDdbEw7Uxm5peb93+icr/Lon
 OcSxmBKipJeJ7LINLynwsCtL5Z5HCladdjzoEkB9PXJ0R/kK6oyqOmPBJ8qhKeYIQLlbNY07Bow
 /XByQgwmZGpvWgQjRTFlUnP6KM87vz4PsTHu3YZStnaBaS+hnYXjkE7Q8moMgTCqzjQ==
X-Received: by 2002:a05:6000:258:b0:343:3e54:6208 with SMTP id
 m24-20020a056000025800b003433e546208mr405065wrz.55.1711718915570; 
 Fri, 29 Mar 2024 06:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0y693U6Mrafzyu7YFm6f17FVsvRLIAvGL111PeLg9URymVxfxN4rrw7+XNw571qiaGR1ycw==
X-Received: by 2002:a05:6000:258:b0:343:3e54:6208 with SMTP id
 m24-20020a056000025800b003433e546208mr405040wrz.55.1711718915211; 
 Fri, 29 Mar 2024 06:28:35 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it.
 [87.12.25.33]) by smtp.gmail.com with ESMTPSA id
 e11-20020a056000194b00b00341c6b53358sm4171063wry.66.2024.03.29.06.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 06:28:34 -0700 (PDT)
Date: Fri, 29 Mar 2024 14:28:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
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
 "David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
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
Subject: Re: [PATCH 01/22] virtio: store owner from modules with
 register_virtio_driver()
Message-ID: <e2xy5kjdctpitcrev2byqc5gcwntvsd6pfutrvp3l2kfe3llgs@l2xp5opj7xu2>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
 <oaoiehcpkjs3wrhc22pwx676pompxml2z5dcq32a6fvsyntonw@hnohrbbp6wpm>
 <d01cc73e-a365-4ce8-a25f-780ea45bc581@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d01cc73e-a365-4ce8-a25f-780ea45bc581@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

On Fri, Mar 29, 2024 at 01:07:31PM +0100, Krzysztof Kozlowski wrote:
>On 29/03/2024 12:42, Stefano Garzarella wrote:
>>> };
>>>
>>> -int register_virtio_driver(struct virtio_driver *driver)
>>> +int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
>>> {
>>> 	/* Catch this early. */
>>> 	BUG_ON(driver->feature_table_size && !driver->feature_table);
>>> 	driver->driver.bus = &virtio_bus;
>>> +	driver->driver.owner = owner;
>>> +
>>
>> `.driver.name =  KBUILD_MODNAME` also seems very common, should we put
>> that in the macro as well?
>
>This is a bit different thing. Every driver is expected to set owner to
>itself (THIS_MODULE), but is every driver name KBUILD_MODNAME?

Nope, IIUC we have 2 exceptions:
- drivers/firmware/arm_scmi/virtio.c
- arch/um/drivers/virt-pci.c

>Remember that this overrides whatever driver actually put there.

They can call __register_virtio_driver() where we can add the `name`
parameter. That said, I don't have a strong opinion, we can leave it
as it is.

Thanks,
Stefano

