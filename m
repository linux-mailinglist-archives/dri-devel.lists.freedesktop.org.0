Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EDE4ECAC8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 19:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C645110E1D7;
	Wed, 30 Mar 2022 17:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2081310E2AD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 17:36:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so465338wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=si9BL6chisoTSaeqo99DJ1ZOvEtq2ZLE18b5aCraSsg=;
 b=dBTJr/GJXkcyRZzP1rEtXVt5Y4oXfOfUJqY1SbiNl9CFA5AueD//DYeDzQ4Au2Qz+W
 CPFc5Ga24RUstM4ay5k2cvKYCvDgrjZEKJg+QApmv7CGcNvnxCt1Iuk8cUI7HMUbjIrO
 AOkKpA8ApAfMpa/N9xH4CD/uTsVSkK/CB4Vy7vxMiNMUltQInBa/82AxemIc6YavH6ef
 GunkgXr9VifDVb7nD0gzP5/gDmq8/OUn7OHSGbJkHHB4mixLOKXNK9/kPmDmW8/Vv0hG
 9eZMOxQFGaOArRDGnTM0tSNopEP1VA50qqtI2SX7/Jqmt3FFqOD8SfHXGHoFaYEvsALh
 1myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=si9BL6chisoTSaeqo99DJ1ZOvEtq2ZLE18b5aCraSsg=;
 b=0oGHGq8R5UEIlRWSxykFLKNaNNlqfRLL2CcUXh75xCy8sKj45n9Ltvyqb2+ZI2W8Mb
 i9qxaZMgoiCfEjWjCQCBFJTOSqg2e93PelEO2IyV44WLYT54RgpcaWA9PMFmExxdgH1w
 1/0qJ3OXCc8IAtDnXUVjn2PChH8B3N9yAvRL3Q3jTPIwK/lxobrVeEuygzvCQ4L8Wsks
 KFz/Z5AAKPa8MxPTc7Ub01sLgrDRYHpeNG31P1Iwq9zuRKqF2DdmOis95IoyRk0PRvT9
 PcejYim9xADEtYM0th7HAM09Q1uPmMj7jhn2hDFFfvK1ngWzVS3Ms8kCXTj0JjRo1eWw
 UeZA==
X-Gm-Message-State: AOAM532sU3MaPhyoH/TaIs6cxtF7z2HUo/s03d4UJ7Lj8JUSMF3V1HVx
 joQs80voZRq9xMqMWLpf67B+Lg==
X-Google-Smtp-Source: ABdhPJySbMOHLeU5/XzBjryTSJpkyIppInBQPU+ymDQ0hfmSX4UC3FGqGyZmA0Oo3LbLxLf3acxdrw==
X-Received: by 2002:a05:600c:4296:b0:38c:1b43:1562 with SMTP id
 v22-20020a05600c429600b0038c1b431562mr528312wmc.122.1648661778522; 
 Wed, 30 Mar 2022 10:36:18 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 i31-20020adf90a2000000b00205ad559c87sm12823380wri.21.2022.03.30.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:36:16 -0700 (PDT)
Date: Wed, 30 Mar 2022 18:36:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Create file descriptor after client is
 added to smi_clients list
Message-ID: <YkSVDnolf1jltrSR@google.com>
References: <20220330075115.426035-1-lee.jones@linaro.org>
 <a85f7751-8e60-d8f4-a281-4fb50389ae7e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a85f7751-8e60-d8f4-a281-4fb50389ae7e@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022, Felix Kuehling wrote:

> 
> Am 2022-03-30 um 03:51 schrieb Lee Jones:
> > This ensures userspace cannot prematurely clean-up the client before
> > it is fully initialised which has been proven to cause issues in the
> > past.
> > 
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > index e4beebb1c80a2..c5d5398d45cbf 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > @@ -247,15 +247,6 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
> >   		return ret;
> >   	}
> > -	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
> > -			       O_RDWR);
> > -	if (ret < 0) {
> > -		kfifo_free(&client->fifo);
> > -		kfree(client);
> > -		return ret;
> > -	}
> > -	*fd = ret;
> > -
> >   	init_waitqueue_head(&client->wait_queue);
> >   	spin_lock_init(&client->lock);
> >   	client->events = 0;
> > @@ -265,5 +256,14 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
> >   	list_add_rcu(&client->list, &dev->smi_clients);
> >   	spin_unlock(&dev->smi_lock);
> > +	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
> > +			       O_RDWR);
> > +	if (ret < 0) {
> 
> Thank you for the patch. This looks like the correct solution. But you also
> need to remove the client from the dev->smi_clients list here before
> kfree(client). With that fixed, the patch is

Yes, that makes perfect sense.

> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks Felix.  I will provide a follow-up tomorrow.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
