Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7F63D0A7B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 10:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DCC6E8D0;
	Wed, 21 Jul 2021 08:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E496E8D0;
 Wed, 21 Jul 2021 08:30:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c15so1224977wrs.5;
 Wed, 21 Jul 2021 01:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yUJHVWQTlhcEWMO4DydR2xNVcklNcrzSF7aJbrXgfvg=;
 b=GwdmBlYvKMUbfBL/G94R3vphXcZlpRXLWB5bF6QGSKL6pV85wsV22JWa094sGOGZ7g
 P7qZ2LHJQBo4PwG/TNgCHOaSgH2i2SjcyzRNDuX20bIJxYhvzaR4zaGWcHvYfz7FosQ1
 +yN7E9DcdXpiJYZyNTefp+5fVA6/p0Iih4ldiljoRyOGgUM/UJfxsJv02X3wzob4Rndq
 IFXhZkCFEChrGwQ0t0RNvLKWhe0VX5MuIqQGR6jl1KGLr0E0wvw3SXlB/oyfvLUR0i77
 BLKvwGfPp8i9fxGt49K+cQN7ANcz5BjuZM8eJYMmSGGv2iBwzBMt/VngBYxrBWcVPqtB
 SFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yUJHVWQTlhcEWMO4DydR2xNVcklNcrzSF7aJbrXgfvg=;
 b=QVG+z32ihdZiZyAC+TXXqgHdxQgCwvLrvO48rlX3wa1s3W9Nmvsz0AxyTDlBuqMpFE
 /TSVz9EOTiTOm1zK0y5HNRNlBdtgDbyie591cQJekHBo8tBIMAPY6CWGgB31azywLS+e
 X6T722oETBip0oLgJSa4LZ5YnB5o58s882RTbjYUPsWJ1rLgYXrrMkSQP+8wVe7DjqkQ
 iGQEzR2R7nDNaX53QhBsjc1+0mCUtTDpCtYZKgM2+Cz4qrFxun5O/dw8iybgWqBQ4JlV
 wkaemjzw52WdVtsFLk3FZe/ohTsNNhanQngsJen1UyZBVD0SPW7CK9IauZqR0j1rr/D8
 ao3w==
X-Gm-Message-State: AOAM531SPMlzgTmo03pzs0LXmA6z9BrDEl1CPSmd4Q7MuF5/s4G2bet2
 w9/4D+UeuBq2Kx/mGlrhcdw=
X-Google-Smtp-Source: ABdhPJw/bXojKZq/3rBVxc6LypfZ1k0EVFJuDmJugmtJ7S6ZqIPs+VTOFVKLsKXR1S8VTaSs6Vqj4A==
X-Received: by 2002:adf:b605:: with SMTP id f5mr41299570wre.419.1626856219104; 
 Wed, 21 Jul 2021 01:30:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66?
 ([2a02:908:1252:fb60:9bcf:837a:d18c:dc66])
 by smtp.gmail.com with ESMTPSA id w3sm26068057wrt.55.2021.07.21.01.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:30:18 -0700 (PDT)
Subject: Re: [PATCH 1/7] vgaarb: remove VGA_DEFAULT_DEVICE
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210716061634.2446357-1-hch@lst.de>
 <20210716061634.2446357-2-hch@lst.de>
 <f171831b-3281-5a5a-04d3-2d69cb77f1a2@amd.com>
 <YPbUvIYmu3WfyM2C@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <81094b7d-1846-9d43-dc58-44ff9bd60995@gmail.com>
Date: Wed, 21 Jul 2021 10:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbUvIYmu3WfyM2C@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.07.21 um 15:50 schrieb Daniel Vetter:
> On Fri, Jul 16, 2021 at 09:14:02AM +0200, Christian König wrote:
>> Am 16.07.21 um 08:16 schrieb Christoph Hellwig:
>>> The define is entirely unused.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> I'm not an expert for this particular code, but at least of hand everything
>> you do here makes totally sense.
>>
>> Whole series is Acked-by: Christian König <christian.koenig@amd.com>
> Care to also push this into drm-misc-next since you looked already?

Done.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> ---
>>>    include/linux/vgaarb.h | 6 ------
>>>    1 file changed, 6 deletions(-)
>>>
>>> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
>>> index dc6ddce92066..26ec8a057d2a 100644
>>> --- a/include/linux/vgaarb.h
>>> +++ b/include/linux/vgaarb.h
>>> @@ -42,12 +42,6 @@
>>>    #define VGA_RSRC_NORMAL_IO     0x04
>>>    #define VGA_RSRC_NORMAL_MEM    0x08
>>> -/* Passing that instead of a pci_dev to use the system "default"
>>> - * device, that is the one used by vgacon. Archs will probably
>>> - * have to provide their own vga_default_device();
>>> - */
>>> -#define VGA_DEFAULT_DEVICE     (NULL)
>>> -
>>>    struct pci_dev;
>>>    /* For use by clients */

