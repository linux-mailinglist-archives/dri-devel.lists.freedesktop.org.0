Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A451C623
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AD510EE13;
	Thu,  5 May 2022 17:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BC010EE13
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 17:32:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 79EA183F2A;
 Thu,  5 May 2022 19:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651771944;
 bh=0+pwS0p0alTyaeEe9Mt36qu9y3oWXT4UCFiEoaX3Bi8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QabCJfJoXm9Oq65fIpd2NzLCQWqjzJxAomi6+CG5CiVWeEXi+6pSdIIcEkwI9Y/uK
 E0IvXjowapRDDMoccyriuVq5F5vf1Be09sjVoML9eBuS2Vzir8oVMEYEk+NjiChqZc
 ajmwm0LXum2irb8WrOO4hIYmnuchwolEG7yrxkUHXFuNPquLDZck9D0zsM5BhQxuBk
 I77C49xLjIbIGzs29Ad34Z8GRi9XC9rj7GicJYd9yq2xW/WzScsy0OD0JrL3237W0E
 jGTyNQZjNOBa5UU2Xa+f+1IrnQd8Qhu6Mr0pUKOr1UmpWijtGFkagzZNazK0Pi2/is
 NqXvRvp3nVerw==
Message-ID: <88edf09b-fca9-26b1-1366-94976c6ce2a0@denx.de>
Date: Thu, 5 May 2022 19:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: robert.foss@linaro.org, sam@ravnborg.org, jagan@amarulasolutions.com,
 tzimmermann@suse.de, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/22 17:12, Mark Brown wrote:
> On Sat, 30 Apr 2022 04:51:44 +0200, Marek Vasut wrote:
>> Currently the regmap_config structure only allows the user to implement
>> single element register read/write using .reg_read/.reg_write callbacks.
>> The regmap_bus already implements bulk counterparts of both, and is being
>> misused as a workaround for the missing bulk read/write callbacks in
>> regmap_config by a couple of drivers. To stop this misuse, add the bulk
>> read/write callbacks to regmap_config and call them from the regmap core
>> code.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
> 
> Thanks!
> 
> [1/2] regmap: Add bulk read/write callbacks into regmap_config
>        commit: d77e745613680c54708470402e2b623dcd769681

I was really hoping this would get a lot more review / comments before 
this is applied.
