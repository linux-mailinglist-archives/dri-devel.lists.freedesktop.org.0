Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476C060F6EB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E9B10E5EA;
	Thu, 27 Oct 2022 12:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9541810E5EA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:14:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q9so4054314ejd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ozR3pFF6qvev8k9P0jdmPJjlIVCpHvZvFTrYrZyvlug=;
 b=PZjRFX7hCJSMc+Y64bXTjS1Y0HjMKr7mBuRJEyhLjLFHCu86uE4HnLAuCExy6utvd1
 FOgBhXiiAJSLrrUG20YbdRvbVsNsZwCbTOPXaDHJFE88JKd+2iypeS1yDOEDzE57VkjJ
 UqWne/R3v2Wnj8Xa4C6S+5rj0k7XRgR9qoxXW4GzTzZDgcO+MzbvkuT1O61ovT/wJi+D
 Ha3tj9vLaD9yQYMZ/8SkAKkNiZ/YgGPwpKyMnOgfHSbBlgl4run+/9wq3qhNRVlg17Ki
 vDrwt6JEo/l/1NL27ZVsNuW2qV7SdZinurpZSn7BRkWNw1fV8rlE01TvkJBC9O4zTpDK
 1seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ozR3pFF6qvev8k9P0jdmPJjlIVCpHvZvFTrYrZyvlug=;
 b=GqkCzA4tcdb4h8L4jjPN2Ej1NbaGcCes+r5H9M1zTuObdTDIoVJB9XVrdQkt07RI6R
 nGETzSvXLX7Sq90a5FfZ2BT6IB+2v+bju3xxTlCB3wYpsKAsfgtLB82NpXhvUp7rC8fq
 k6FgQ6BGcaUZ4WjiAmcGkN5IMgcHtoZPj9EJreI47OTjqIz69p1uH5w6R5lTjoiEKEMy
 ez4LUb98ad3X1xI5XvYJnzul/R3T0y56fQBYzzQcbee9prv9Gnocbm6ToMy1Ai0thIed
 q04hGEoMNRSeASJt4CjA5BYai7oyX4axuDuYd7dRgM2VhnZ9epkFYM7Wcgdy/UpGOElp
 Uh5A==
X-Gm-Message-State: ACrzQf3feH+kcL5IM6mfBJtKXf4B4AMeZK48EO0QdHXMPcttAWHFciFS
 pZbJXR0KFncoiX26NYW8WWk=
X-Google-Smtp-Source: AMsMyM4Sne+rY2Ji3vF5c/d7Ew6GneR38fuCK0QW1XQVz5EfmwMiRau9oJnErgKoc5ml8Y39s8E8kA==
X-Received: by 2002:a17:907:1dda:b0:7a6:8ffc:7dc with SMTP id
 og26-20020a1709071dda00b007a68ffc07dcmr20109443ejc.163.1666872855035; 
 Thu, 27 Oct 2022 05:14:15 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 bm27-20020a0564020b1b00b004615f7495e0sm917790edb.8.2022.10.27.05.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 05:14:14 -0700 (PDT)
Message-ID: <59ac9998-a838-abf8-124c-8fd98c4f0f7a@gmail.com>
Date: Thu, 27 Oct 2022 14:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 20.10.22 um 14:13 schrieb Christian König:
> Hi guys,
>
> after finding that we essentially have two separate worlds for coherent sharing
> of buffer through DMA-buf I thought I will tackle that problem a bit and at
> least allow the framework to reject attachments which won't work.
>
> So those patches here add a new dma_coherent flag to each DMA-buf object
> telling the framework that dev_is_dma_coherent() needs to return true for an
> importing device to be able to attach. Since we should always have a fallback
> path this should give userspace the chance to still keep the use case working,
> either by doing a CPU copy instead or reversing the roles of exporter and
> importer.
>
> For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
> return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
> the flag for their buffers if special handling like the USWC flag in amdgpu or
> the uncached allocations for radeon/nouveau are in use.
>
> Additional to that importers can also check the flag if they have some
> non-snooping operations like the special scanout case for amdgpu for example.
>
> The patches are only smoke tested and the solution isn't ideal, but as far as
> I can see should at least keep things working.

Gentle ping on this. Lucas, Daniel and Nicolas you have been rather 
active in the last discussion. Do you mind taking a look?

Thanks,
Christian.

>
> Please review and/or comment,
> Christian.
>
>

