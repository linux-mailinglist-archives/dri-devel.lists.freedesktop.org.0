Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC768D4A8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4A410E4BF;
	Tue,  7 Feb 2023 10:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957F810E00A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675766623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9w8e2JcvMX6iMDnX/Jbx1d9onPql+IXVufG06c+nXs=;
 b=CWr2TY3bkpiHSA9OMEFpvNQ3EB+h/JmRrfHwHkpg+bAzAXaE9vWXfnUkcAzRvSX379md9c
 JsoawLCBokXsnvrHkP8mM0NdV6mVNXE240G+PtNJJ3OcSi0qCMVzcnnhCIJRmvJKz2PVF7
 4Ri6Hl5Hs0XrKRxl9YB3NuvJo+C0AdM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-Z9-IsqmQPgC0YbIMCOUNEA-1; Tue, 07 Feb 2023 05:43:41 -0500
X-MC-Unique: Z9-IsqmQPgC0YbIMCOUNEA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so7960764wms.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 02:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e9w8e2JcvMX6iMDnX/Jbx1d9onPql+IXVufG06c+nXs=;
 b=krgwLWVx+ISVd0AGNwDlp/S4w/UBU+Pub6GY7JHJ23QYx2Q3SOCqNCryVLcOgl3rDL
 pnnm+OM6lx3ejPVRT1IG4PO8EsKp1xEhfUw95NRagFov8LmF1fDeDhHQ/UDYgmTJblbh
 JsESxX/0SnDNdk86RhyDtFqJFJAcn+Vxo39eCT2511a44S69DtYC/ZOQVrK45bs1Izwz
 zcojk1MilOW+04THiTUFA0EMXaKF0TkaacZA3KjWMqisYQ6CSxDqn0znYLt8pCMVpq2f
 7EiaI/ny7XLCKTNsd3QI4jBHEilN6lqwoOafPJLwijmbbw1ss9oRGdVMf5VTO8OcCugq
 /glQ==
X-Gm-Message-State: AO0yUKU1KmyAhpXcRmUMIHjNbhdng+reoHA8PM6WCJRTdCb6Mt1YdOq2
 BDhF4Ciz2yqXFJw95O1bhfjYWa8wnvb3dIqyH+cs3fsD7ouHGrD654ZcgY4Y1aYEG+OnU683mh6
 DCXiF9x28X2SSO18zo0bQb6D+YfX6
X-Received: by 2002:a05:600c:a68f:b0:3db:1f68:28f with SMTP id
 ip15-20020a05600ca68f00b003db1f68028fmr2479699wmb.24.1675766620729; 
 Tue, 07 Feb 2023 02:43:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+3X9OYULToFjxq0/e5ycg2dn+KVQVTkxzR4pq1pJZIYm4hVjPpyQn+MPCc8jKQ+WKwgg9A/w==
X-Received: by 2002:a05:600c:a68f:b0:3db:1f68:28f with SMTP id
 ip15-20020a05600ca68f00b003db1f68028fmr2479685wmb.24.1675766620553; 
 Tue, 07 Feb 2023 02:43:40 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003e00c9888besm2692340wmo.30.2023.02.07.02.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:43:40 -0800 (PST)
Message-ID: <a69c7362-52a5-ed26-ce12-69364d12fcf6@redhat.com>
Date: Tue, 7 Feb 2023 11:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
 <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
 <d3331cf8-02df-bf15-586b-af9d10830758@asahilina.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d3331cf8-02df-bf15-586b-af9d10830758@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/23 11:33, Asahi Lina wrote:
> On 07/02/2023 03.47, Javier Martinez Canillas wrote:
>> Hello Lina,
>>
>> On 2/5/23 13:51, Asahi Lina wrote:
>>> Other functions touching shmem->sgt take the pages lock, so do that here
>>> too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
>>> _locked() variants to avoid recursive locking.
>>>
>>> Discovered while auditing locking to write the Rust abstractions.
>>>
>>> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
>>> Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>
>> Good catch. The patch looks good to me.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> What about drm_gem_shmem_free() BTW, I believe that the helper should also
>> grab the lock before unmap / free the sgtable?
> 
> That's called from driver free callbacks, so it should only be called
> when there are no other users left and the refcount is zero, right? If
> there's anyone else racing it I think we have bigger problems than the
> pages lock at that point, since the last thing it does is `kfree(shmem);` ^^
>

Yes, I was wondering only for the critical section that does:

		if (shmem->sgt) {
			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
					  DMA_BIDIRECTIONAL, 0);
			sg_free_table(shmem->sgt);
			kfree(shmem->sgt);
		}
		if (shmem->pages)
			drm_gem_shmem_put_pages(shmem);
 
> (In Rust terms this is equivalent to the Drop trait, which takes a
> mutable/exclusive reference, which means no other reference to the
> object can exist at that point, so no races are possible. And in fact in
> my Rust abstraction I trigger a drop of the Rust object embedded in the
> shmem object before calling drm_gem_shmem_free(), so if this invariant
> doesn't hold that code would be wrong too!)
>

But I guess you are correct and would be safe to assume that the .free
callback won't race against other struct drm_gem_object_funcs handlers.
I just felt to ask since wasn't sure about that.
 
I'll wait a few days in case someone else wants to take a look to your
patch and then push it to drm-misc. Thanks again! 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

