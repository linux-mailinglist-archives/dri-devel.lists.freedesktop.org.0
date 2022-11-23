Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF9635DCC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9B08908B;
	Wed, 23 Nov 2022 12:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111978908B;
 Wed, 23 Nov 2022 12:49:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so1223751wmg.2; 
 Wed, 23 Nov 2022 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bAXiwhITo1fYPFHeaxZuA3JnvtciKXegmNlmVm1MLTo=;
 b=QcDOmyJPMmV74tHIYH2f3pF018aonfW3C+atn7ceR7fOjNdM7WpYgKbl2TOcGlAfNf
 eS6geetBOAXpvAu1ByBRfnE1WtA5FjJ7po22QR0Hau5dh+ZOr4Vf+rUpnP1qOaSUU3gK
 xP7WLbATr1oEA0BwcHpPIVVoIjma1yOMMBcSs0QkZAdvqUt3iSH7RrYeGOuVFF1Thnd/
 DFdglq37JxouigDQDU1kqqUTT+l6o8mNES99yXFoOFjifePHX0doUNVZsto2RyJA0/3B
 4nO04XCDC1bCb2DPKhY1FHcr+ZlcPgldYLiQgYA4d7TG6tiuDsEPB/Jcmow6G5hiuE+H
 Ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAXiwhITo1fYPFHeaxZuA3JnvtciKXegmNlmVm1MLTo=;
 b=R7W+Mwg77AjnStYWwnxRX1BQ33H+6NN0hsAyQ7AUnhkeavNk5m/hszqo0LTSnek/sv
 UTJn4SKSlRAcUA5WIdXoPDiLcikv91FY+OQkKmukR9KTUtSiIWBUriN/JIAmuEHV6ifq
 7AozjrIppFpmW2IQHtoazU2eqnRDpuj++/iree7za+PUSbuxF+t+pQMz4DZmwyePFpsO
 F4jgvzX45N5SzSslXF8g26l3wTtbzhMuEG7aM4s5X3IVVPalUx5TBHwinDW8vWRmxVK2
 x2EFkxYTAHMAW4kLDvPmd03PZYrw6ZmzMQCHjahlT/2p14wgSpkDRH33e7U2wEIYFVyy
 LjIw==
X-Gm-Message-State: ANoB5pkj3R7Q9uWOp6IPyU0EyCmQLfzvINUe1hVJTCKPreN20Ssdkshg
 kKQ+H3bFA2AS4AWajIfAC78=
X-Google-Smtp-Source: AA0mqf58T+ReNLwV7A/JFKqP0idHpqbq4k2Ql3MVFCyZKZT2MWOwbf7fqQlJHYiTQN9oEiyfL76KUg==
X-Received: by 2002:a7b:cd18:0:b0:3cf:a359:de90 with SMTP id
 f24-20020a7bcd18000000b003cfa359de90mr9926352wmj.122.1669207785530; 
 Wed, 23 Nov 2022 04:49:45 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d2d7:ceea:efc2:af43?
 ([2a02:908:1256:79a0:d2d7:ceea:efc2:af43])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003cfa3a12660sm7774387wms.1.2022.11.23.04.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 04:49:44 -0800 (PST)
Message-ID: <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
Date: Wed, 23 Nov 2022 13:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y34WI9SZdiH/p1tA@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
> On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
>
>>> Maybe a GFP flag to set the page reference count to zero or something
>>> like this?
>> Hm yeah that might work. I'm not sure what it will all break though?
>> And we'd need to make sure that underflowing the page refcount dies in
>> a backtrace.
> Mucking with the refcount like this to protect against crazy out of
> tree drives seems horrible..

Well not only out of tree drivers. The intree KVM got that horrible 
wrong as well, those where the latest guys complaining about it.

>
> The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
> though, though you must combine this with the special PTE flag..

That's not sufficient. The pages are released much later than things 
actually go wrong. In most cases this WARN_ON here won't hit.

Christian.

>
> Jason

