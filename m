Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1CA526286
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0768A10EFED;
	Fri, 13 May 2022 13:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CCA10EFED
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:03:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bv19so16140255ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kclrIN8ifFEDuJyNifTpq/rYVCXQC5KZVGm1Wqu3qDw=;
 b=BchFzQ0aefLoLZhrquKxzg5F5t6pQmtetpqsK5z+2ZNZhGfvIEmAylZGjTpl5wAy3R
 5Ll0TPkysB9e+CnOfT81CCr6wbAQdcezOVIjaKLLR5ZkcBypZMNBh4sR+Onkd1niI37l
 vIfgEfEwIiAOL+3Q7fAWiKhvSkDqBqtGlSsDUNXq765E92Hydo/Jwye04CCmTG4GdUxq
 JJRch4tyFPo8+shFUM9/Pwc8JFz7LNuZFfnmassGgNyWaPykJs0/jymWggSXROzz5rfk
 CNBx8nHqTQw1KiSDaLzPQt0+SomjONWSGBRSJqr20+lZzT+pclrbU2+F4QGyoLcEeIpW
 Q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kclrIN8ifFEDuJyNifTpq/rYVCXQC5KZVGm1Wqu3qDw=;
 b=etX9VS52kGqdbSqkLtroDhwHE8DoKRNVVTRnaTWkQrkj9o6/ehU6DO9jEYFu8kM0oQ
 J6NNup/WX4adp/vSz10iq+u7ReMBd3fdiMG2rtJu7bZ6ZY1ne5lfZU/H4VfJub1drP/9
 lIqPmwv6ucT2E4Aj0aMIXY9RkBQmnFFCyLp9t/jNQC9Pad67Xcnk+KRfE1QEUdlouyjR
 X2VemkZ4aNH1qX+6DNweShv9CpKTZh8y1vFFvdRuXAI/FUGgsvC/Za5lIOyLNI15o0zq
 MRlxlypA+U/toWp+ylV1AHok4n8YqTcqzjdk6+TtzQa8w/DMNaZh7PyMHoQDBNTnHWuG
 Bd3w==
X-Gm-Message-State: AOAM530ca2wDmaop5ygflGIsRw/EquAZQsfgXFXferq3EUBkIAGj8aml
 sGCkZJDqRjcZpivSapmuQCc=
X-Google-Smtp-Source: ABdhPJyJOONKaBvHu5wW/GNtzaNqSn2AwH6zoV2f5Z+RgxdJKZHA/nsu32GBUxbMgD9KRu2Vo+cI+A==
X-Received: by 2002:a17:907:9482:b0:6f5:171d:f7f5 with SMTP id
 dm2-20020a170907948200b006f5171df7f5mr4246840ejc.68.1652446987530; 
 Fri, 13 May 2022 06:03:07 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:4107:8049:874f:2444?
 ([2a02:908:1256:79a0:4107:8049:874f:2444])
 by smtp.gmail.com with ESMTPSA id
 ml23-20020a170906cc1700b006f3ef214e19sm739245ejb.127.2022.05.13.06.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 06:03:06 -0700 (PDT)
Message-ID: <2ce56d0f-3009-f717-f1c9-d6e4bab70501@gmail.com>
Date: Fri, 13 May 2022 15:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Improve TTMs empty object handling
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
 <CAM0jSHOiWtYXAOy_jN_MN-fc8JMWNBxuaZ1bXa5KO3VANP7Eow@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHOiWtYXAOy_jN_MN-fc8JMWNBxuaZ1bXa5KO3VANP7Eow@mail.gmail.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.05.22 um 11:21 schrieb Matthew Auld:
> On Mon, 9 May 2022 at 14:09, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi everyone,
>>
>> re-sending this because Daniel was requesting a background why this is
>> useful.
>>
>> When TTM creates a buffer this object initially should not have any
>> backing store and there no resource object associated with it. The same
>> can happen when a driver requests that the backing store of an object is
>> destroyed without allocating a new one.
>>
>> This is really useful during initial buffer creation as well as temporary
>> buffers and page tables which content doesn't need to be preserved when
>> they are evicted.
>>
>> Currently TTM allocates dummy system resources for that because drivers
>> couldn't handle a NULL pointer there. Audit the drivers and then clean
>> up TTM to stop making those dummy allocations.
>>
>> Please review and comment,
> Any chance we can throw this at intel-ci? Series seems to apply to drm-tip.

It should be enough to CC intel-gfx@lists.freedesktop.org when sending 
the patch set out, right?

Christian.

>
>> Christian.
>>
>>

