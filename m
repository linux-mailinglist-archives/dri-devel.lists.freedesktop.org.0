Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712454ECBEB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 20:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C4610E766;
	Wed, 30 Mar 2022 18:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D4010E766
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 18:24:56 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m3so37294100lfj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AdJ8ve3qHqvvd1c/19/c++F2nvBXXpoJRywWLK1c6GA=;
 b=VzF/bjKqvvZH4+Vs+UicO3gdz9nsJEXm+dcg6UGPbVU/yoLYmVm1YueOWKdDhZNgix
 FY/hHbfESYn9c5fsPZWbC3dGHSEHNdwzq2Na4EsfiTXsSN3f9AEGxQ7WX6R9UspJpGIg
 GjAPpxb4luejAubvpVp9DqPmBzV/k+Uifz+4m6bxdYb3PW5nh+qg64xIFbJpwXxDGbma
 qoDOQnqngwklcxTK5GIuOH1jbuWUIQruO6S704/oPf42LwNUqsE0xxqSPXlF1vvPC2Cb
 1wypDNZE3Rt183RhPwh9ASNC2gk7NFZ98o916r+4FtmsWO03lLUfD25XLuDJcZGZ57IA
 e1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AdJ8ve3qHqvvd1c/19/c++F2nvBXXpoJRywWLK1c6GA=;
 b=H86JcVYQ/gVOr1nYhXAIbxCPSSlTFqnLPPjhXHLMwVnIxkQrifos71zdEl3bqEu1J1
 7hHGehsK1V6CUBoswWzlOeT3ZlYR5bmYiRLG1g1/YHICC/rO0GdpHJ8DlXN/7R9FQK6o
 feYbMnpuEKI0pAkNwH2zm8kCPcCNxzxCUlTmLkn7tl+3cxovjb5vRYKPrq258ALp6g0s
 oIa2ZqJW7sGzaXJn63RE3QfBF4HHQb2HzEOb6vBJvD6e1ksc4HS2naHshLfZaMbq2KQd
 p8dcukW4pZ/WkKm16nbe2L1z3cB0e2qoL/0Cbqs71Lvf7fOQ9ZT1BGuvvrX7BMg43SK1
 e+8g==
X-Gm-Message-State: AOAM531hx8VO2eOH7AZdPkAJXLsYTLgCzUFSUv+tJzxKHtf/y4DfUZLD
 XPnW//+IWap8xWSoTQ16hV2bmL2tk3A=
X-Google-Smtp-Source: ABdhPJy/021JKKynej47Sox209kOnGV7+kHTY+Ir+6FxgM4yrCyy/XHL3xiVimSA0AHiJ0FmcxKMmw==
X-Received: by 2002:a19:4f5d:0:b0:44a:2905:84ea with SMTP id
 a29-20020a194f5d000000b0044a290584eamr7774216lfk.120.1648664694266; 
 Wed, 30 Mar 2022 11:24:54 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a198c03000000b00448b7b1780csm2410866lfd.63.2022.03.30.11.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:24:53 -0700 (PDT)
Message-ID: <ecf7ccdd-0d6f-9407-6778-ae7f0a6bf538@gmail.com>
Date: Wed, 30 Mar 2022 21:24:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Linaro-mm-sig] [PATCH next] dma-buf/sync-file: do not allow zero
 size allocations
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
References: <20220329221425.22691-1-paskripkin@gmail.com>
 <8af3d213-6cb7-a021-c198-e1bd37c47e7c@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <8af3d213-6cb7-a021-c198-e1bd37c47e7c@gmail.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 3/30/22 10:09, Christian König wrote:
> That problem is already fixed with patch 21d139d73f77 dma-buf/sync-file:
> fix logic error in new fence merge code.
> 
> Am 30.03.22 um 00:14 schrieb Pavel Skripkin:
>> syzbot reported GPF in dma_fence_array_first(), which is caused by
>> dereferencing ZERO_PTR in dma-buf internals.
>>
>> ZERO_PTR was generated in sync_file_merge(). This functuion tries to
>> reduce allocation size, but does not check if it reducing to 0.
> 
> This is actually perfectly ok. The code above should have prevented the
> size to become 0.
> 
> Regards,
> Christian.
> 

Thanks for your reply! I see that 21d139d73f77 fixes GPF in 
dma_fence_array_first(), but what about this part:

>>   
>> -	if (num_fences > INT_MAX)
>> +	if (num_fences > INT_MAX || !num_fences)
>>   		goto err_free_sync_file;
>>   
>>   	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>> @@ -264,7 +264,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>>   	if (index == 0)

If num_fences is equal to zero then fences dereference will cause an 
oops. Or this one is also fixed in your tree?


Thanks!




With regards,
Pavel Skripkin
