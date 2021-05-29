Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7239394CE2
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 17:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766956E217;
	Sat, 29 May 2021 15:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457BB6E217
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 15:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 26DFF3FB4F;
 Sat, 29 May 2021 17:23:16 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="mlpu/hVo";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVMSEvI7OeIM; Sat, 29 May 2021 17:23:15 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 88AD13FB33;
 Sat, 29 May 2021 17:23:14 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 262793600DD;
 Sat, 29 May 2021 17:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622301794; bh=5mdr/iu1/EZeMAkwEh7XJb0J+fHjgQw9ZUmaysPq2YA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=mlpu/hVoYIEt127bg7s7LCLbtTVnYPJ4cqjirCp8mS/2IdDjNJO5Rv+OT2K+Hf3z7
 wjR09/rQRHQl5dqlEHLtPSABvATn9foq9WcExd6fLE7/x6R6fXDyAVcJny80W2Kdhd
 WU4rf2+7U6LWbit+aQnkF7jW4R1HqgW6f3D0Q5yU=
Subject: Re: ttm_resource_manager::use_tt
To: Zack Rusin <zackr@vmware.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
References: <3ed92523-df06-87cd-f926-e632b780f69b@vmware.com>
 <b743342e-5151-110e-e29e-bf89a34d085a@amd.com>
 <54e4bb04-602b-b1d3-7361-8badce45206a@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <60c9d566-608e-95c1-59d1-4d5051c1997e@shipmail.org>
Date: Sat, 29 May 2021 17:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <54e4bb04-602b-b1d3-7361-8badce45206a@vmware.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/28/21 9:30 PM, Zack Rusin wrote:
> On 5/22/21 3:13 AM, Christian König wrote:
>> Hi Zack,
>>
>> IIRC that was for the VMW_PL_GMR type, wasn't it?
>>
>> As far as I have seen that backend was just giving out unique numbers 
>> and it looked questionable that we allocated pages for that.
>>
>> E.g. when you set that flag then for each allocation we also allocate 
>> a TTM tt structure and a corresponding page.
>>
>
> Got ya. Yea, it's a little messy. I think it's correct. Those unique 
> numbers are just identifiers for the bo's but the actual memory for 
> them is regular system memory (e.g. we just tell our virtual hardware, 
> here's some guest system pages and here's a unique id that we'll be 
> using the refer to them).
>
>
Yes, allocating pages for that memory type is correct. The main 
difference to other hardware here is that on other hardware those are 
bound to gpu using a range in a translation table. With vmwgfx they are 
bound using a slot with a unique integer..

/Thomas


