Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A3893B5E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 15:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6C710F145;
	Mon,  1 Apr 2024 13:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NHa0hk6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEBD10EA6C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ztbKwxnOONze6uE5KAh6nif3N82SFeibbZIcAhXlYU=; b=NHa0hk6sMYXxr+xwUvnjlKQUnF
 MEqYyBd6WXe4P9ZmqgpFKFUvIBNOHaBie9S5C1YhSJv8Rs/O97U7tb1LxxqHskQdD1UlbinKsB+aB
 EktpoqosJWLm0tByrCD4QbzTiyNWz9U4N/Lz06EG+U+fHcpR6RTubhijoN4D12R1a3RbKhjqZzytW
 BkIacfu/lXSbvo+KO4MFTQKStY32m8k4CV+MStArowuITtWgTKdneNI3tp8JsNjLFZjrEcpdNHE19
 hhvZAfb+PsOkhrCrlY+7s1vWxZsBUXWOlsu967nT+FyNAomPB6W6ny8IGWR/HeEKvfcdFSlVpXgY8
 UuMW3vEw==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rrHbF-0001WQ-89; Mon, 01 Apr 2024 15:21:21 +0200
Message-ID: <4342d02c-a180-4a7e-8ef6-4ece51aba946@igalia.com>
Date: Mon, 1 Apr 2024 14:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Do not build debugfs related code when
 !CONFIG_DEBUG_FS
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, "T.J. Mercier"
 <tjmercier@google.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20240328145323.68872-1-tursulin@igalia.com>
 <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
 <9a063c39-6d2f-43c3-98b3-e4f8c3c6e9c4@ursulin.net>
 <1e94363a-b449-4efb-b2fe-c1dd710b57c9@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <1e94363a-b449-4efb-b2fe-c1dd710b57c9@amd.com>
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


On 01/04/2024 13:45, Christian König wrote:
> Am 01.04.24 um 14:39 schrieb Tvrtko Ursulin:
>>
>> On 29/03/2024 00:00, T.J. Mercier wrote:
>>> On Thu, Mar 28, 2024 at 7:53 AM Tvrtko Ursulin <tursulin@igalia.com> 
>>> wrote:
>>>>
>>>> From: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>
>>>> There is no point in compiling in the list and mutex operations 
>>>> which are
>>>> only used from the dma-buf debugfs code, if debugfs is not compiled in.
>>>>
>>>> Put the code in questions behind some kconfig guards and so save 
>>>> some text
>>>> and maybe even a pointer per object at runtime when not enabled.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>
>>>
>>> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>>
>> Thanks!
>>
>> How would patches to dma-buf be typically landed? Via what tree I 
>> mean? drm-misc-next?
> 
> That should go through drm-misc-next.
> 
> And feel free to add Reviewed-by: Christian König 
> <christian.koenig@amd.com> as well.

Thanks!

Maarten if I got it right you are handling the next drm-misc-next pull - 
could you merge this one please?

Regards,

Tvrtko
