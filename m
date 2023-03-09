Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14256B1E41
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6310E7A6;
	Thu,  9 Mar 2023 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 416 seconds by postgrey-1.36 at gabe;
 Thu, 09 Mar 2023 08:33:52 UTC
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488A210E7B0;
 Thu,  9 Mar 2023 08:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0643B3FC59;
 Thu,  9 Mar 2023 09:26:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vm4R8wD9F9hQ; Thu,  9 Mar 2023 09:26:53 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 26F553FBBA;
 Thu,  9 Mar 2023 09:26:51 +0100 (CET)
Received: from [192.168.0.209] (unknown [134.191.232.81])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 883D236282E;
 Thu,  9 Mar 2023 09:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1678350411; bh=o3fpVkC4JEAowJfwwTzpjQqBTQsfq4yAsJ+zbt3Xr5g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mc+8YIzCIAmuQ/l6GuFyVHOQaU8EngomCGfPZardpO3bVYgoK6tbRyTkvCIbc94Me
 tGctiuK5tbZxQDbN/Xxt4YxmrR+q1HhkNP/cL/BYA6L7+FhFznaIHYAWDletmd+gf/
 D3SiYGtwG3/JREXn0bUdr5xV/OKiLEkiNF0sBUXM=
Message-ID: <f88566ae-b450-9183-b262-07c0b63d45c3@shipmail.org>
Date: Thu, 9 Mar 2023 09:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Zack Rusin <zackr@vmware.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-10-christian.koenig@amd.com>
 <b4beeee4b2a004938adc6c502443f7b3311aad50.camel@vmware.com>
 <6933b07b-af79-5350-b161-12ee73732b30@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <6933b07b-af79-5350-b161-12ee73732b30@gmail.com>
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
Cc: "dakr@redhat.com" <dakr@redhat.com>,
 "arunpravin.paneerselvam@amd.com" <arunpravin.paneerselvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/23 10:10, Christian König wrote:
> Am 08.03.23 um 06:14 schrieb Zack Rusin:
>> On Tue, 2023-02-28 at 09:34 +0100, Christian König wrote:
>>> VMWGFX is the only remaining user of this and should probably moved 
>>> over
>>> to drm_exec when it starts using GEM as well.
>> Is this because vmwgfx piggybacks buffer-id relocations on top of ttm 
>> validations or
>> did you just find it too hard to port it over? I'd prefer to avoid 
>> ttm moves to
>> vmwgfx and at least have a clear idea of what we need to do to port.
>
> I've just found it to hard to port it over because vmwgfx does some 
> strange things with the validation code here.
>
> If you want we can take a deeper look at this together, but I need to 
> find some time.
>
> Alternatively just tell me how to do it and I will add that to the 
> patch set :)
>
> Regards,
> Christian.

Hmm.

It turns out Xe was using these from the very start as well. But I will 
take a look at what it take to deprecate that usage, so don't let that 
stop this removal. We need a more flexible WW transaction handling anyway.

/Thomas

>
>>
>> z
