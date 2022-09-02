Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6B5AAC6B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 12:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A001010E7EE;
	Fri,  2 Sep 2022 10:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8584C10E7EE;
 Fri,  2 Sep 2022 10:32:00 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bx38so1777106ljb.10;
 Fri, 02 Sep 2022 03:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=oS1FPn188GwYqcEpeAiuLHN0qFHFB655DOQwCXbqud0=;
 b=n3OAhLhYLpZxMnQfsFjiyUnhcv12eKqug64v55vPtpE/UCjJaNIZHCA+Wwv+6WbtT/
 qWkYjCAk4Yjkuctjw0fBnbyysWH+4pCHaxR5XU+s4CKQjBA8zqhlLNk/otAC43pVbwk/
 +Oxsn+VvggqMRnSHBrZ+4CWc9VjYKgT5IxVQ6II8ncEcyJrTjiDJmp2cyMJgIaGZlVbQ
 +Ann9KO6Y/CoglJHcaRMsiN1jERvtH9CBEqaVN6GF/whofd6gb7RHL1HfeSFl8tQ1bkZ
 Wfhpb2x7/mkxuV0CZPD44CTBUcnCyTj5Pbq+/Suo58ul0XAxasomkcmrFrUsPxyLaF5j
 07AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oS1FPn188GwYqcEpeAiuLHN0qFHFB655DOQwCXbqud0=;
 b=ULCCHWBTU80dUFDMZFDJCClZW2z8Ur4DC9njl3kAkF6yDkgeeYxEfzgOwV29Qz+lPj
 DgmroyIC5zVihudJylUWSASRFPUOJmkWmwoYkJycuzSEwgqA6nMr/6c4kojAv5RLIV1b
 KVOwIXeuLiuAkF/06H3TwikwHm7SMyeOgNHQyjpmU3XhwdbrqXSq+uXcn32dEBBh1Pm0
 8CXEcwYodfDdLjWUOqhxkay9DYVUkUMjrXT3ThGToLDNe/moRd8jrM9t0pTheD9t/BML
 BpE246yxWHjY8Jhm2PQZZyAeOtl8JXs3uAt3WNnBw1gyOm2R/CGGzEEpYUgDzxcDkQU0
 C8Sw==
X-Gm-Message-State: ACgBeo1mCcSF4d002UyHOaTmrHxCf/Sq/s4e2heM44FGQZ3lwoAYKZxO
 o7ntH7KUjp4slOSzUXUy1IM=
X-Google-Smtp-Source: AA6agR6ou/2uO4ZwPmqiUBrbDeggu1Vc3sPE8fBViDweS453cB4ryN7X8CzDyYJrxfL2DeihrtrS8A==
X-Received: by 2002:a05:651c:4cf:b0:265:3ba8:92f7 with SMTP id
 e15-20020a05651c04cf00b002653ba892f7mr6302546lji.105.1662114718656; 
 Fri, 02 Sep 2022 03:31:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru.
 [109.252.119.13]) by smtp.googlemail.com with ESMTPSA id
 u9-20020ac258c9000000b0048b064707ebsm205794lfo.103.2022.09.02.03.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 03:31:58 -0700 (PDT)
Message-ID: <760b999f-b15d-102e-8bc7-c3e69f07f43f@gmail.com>
Date: Fri, 2 Sep 2022 13:31:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-7-dmitry.osipenko@collabora.com>
 <DM5PR11MB1324088635FDE00B0D957816C17B9@DM5PR11MB1324.namprd11.prod.outlook.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <DM5PR11MB1324088635FDE00B0D957816C17B9@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Gross,
 Jurgen" <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomba@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Qiang Yu <yuq825@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

01.09.2022 17:02, Ruhl, Michael J пишет:
...
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct
>> drm_i915_private *i915,
>> 			continue;
>> 		}
>>
>> +		/*
>> +		 * dma_buf_unmap_attachment() requires reservation to be
>> +		 * locked. The imported GEM shouldn't share reservation lock,
>> +		 * so it's safe to take the lock.
>> +		 */
>> +		if (obj->base.import_attach)
>> +			i915_gem_object_lock(obj, NULL);
> 
> There is a lot of stuff going here.  Taking the lock may be premature...
> 
>> 		__i915_gem_object_pages_fini(obj);
> 
> The i915_gem_dmabuf.c:i915_gem_object_put_pages_dmabuf is where
> unmap_attachment is actually called, would it make more sense to make
> do the locking there?

The __i915_gem_object_put_pages() is invoked with a held reservation
lock, while freeing object is a special time when we know that GEM is
unused.

The __i915_gem_free_objects() was taking the lock two weeks ago until
the change made Chris Wilson [1] reached linux-next.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2826d447fbd60e6a05e53d5f918bceb8c04e315c

I don't think we can take the lock within
i915_gem_object_put_pages_dmabuf(), it may/should deadlock other code paths.
