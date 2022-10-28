Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16761150E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 16:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0110E851;
	Fri, 28 Oct 2022 14:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CFC10E852
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 14:47:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0623260C;
 Fri, 28 Oct 2022 14:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0623260C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1666968454; bh=UtbBjtOCDmxG1fiAjntsLrhrfFgg1H/OVy+mHU9Tdic=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YPUMK7NbZEWiVJxDd81wBZav9MFex8t217mE4PTTWDl1Wycu8GM6Ea9a1vRzQ6K4s
 LB7lTKlSS1ZmpG7NdF0hatynkN3t1WCNrag2zPTpYp8Msw6DjzzGxXOLTagWQfStM5
 OpzNr69zoX0ZplnOKZjT7c3Gdpe26YiCH/GCuvVKjggGKnoYVlW8q52BozogUqaHaf
 lqbfUUsSLqzTySycQ7oJUAd39iZ6MnYN5bJxYZfwTw6xy6OrG5GkA6RIbXH+7RLbyz
 i9pvY3yXqHCvRhxsT6z+QxdZ90sNaW8G8ij9tPpOZYwQ1kmZ7kWl3ddSJDgLnmf13s
 uYKklGhEZ+f3w==
From: Jonathan Corbet <corbet@lwn.net>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, bagasdotme@gmail.com
Subject: Re: [PATCH v2] dma-buf: cma_heap: Fix typo in comment
In-Reply-To: <20221028065907.23954-1-mark-pk.tsai@mediatek.com>
References: <Y1tSWo+eRvkVofbv@debian.me>
 <20221028065907.23954-1-mark-pk.tsai@mediatek.com>
Date: Fri, 28 Oct 2022 08:47:33 -0600
Message-ID: <87k04k6m4a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: benjamin.gaignard@collabora.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, jstultz@google.com,
 lmark@codeaurora.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 labbott@redhat.com, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark-PK Tsai <mark-pk.tsai@mediatek.com> writes:

>> [-- Attachment #1: Type: text/plain, Size: 349 bytes --]
>> 
>> On Fri, Oct 28, 2022 at 09:44:17AM +0800, Mark-PK Tsai wrote:
>> > Remove duplicated "by" from comment in cma_heap_allocate().
>> > 
>> 
>> This patch isn't typofix but duplicate word stripping, right? If so, the
>> patch subject should be "dma-buf: cma_heap: Remove duplicated 'by'".
>
> Okay, I've update the title in v3.
> Sorry for the horrible commit description.
> Thanks.

Your original commit description was just fine, you just had the bad
luck to draw the attention of somebody who likes telling other
contributors what to do.

Thanks,

jon
