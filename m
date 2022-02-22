Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B014BF3D2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DEE10F52F;
	Tue, 22 Feb 2022 08:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82E10F52D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fY8k2STnR5+RK9IDQgN/eppZnxcQVA2GD760hanPcdw=; b=S5ppBVU5yncGjqFGtu0TAPQySd
 mY3u031G6mQWQB5B6yoUbSAQJMx6FQ4R2zXTqIK8hAzrZG5Cmwh6QLateUWu4qh5XJelU/nDHCDox
 kxQ+ifpeo7oY8ZZE4nmsfWuG9ni7zyFl4//LbYTYclX0N5LnGhPgTBOTVuFJ3rMGCL0q5wJBsniXW
 3QBIVUN3iJg3M4FpIuy2IocCMD5f3fMaAWcNc0qE/mo17u4JWS61Qpx7LEH+Zw6e91QnRWDoBvnai
 VUbe60H4l1l9XzuKH2xSBajQ4Db9Mipy1VvGaZEg7MtgC3OPbONr790tAoZPSkHdidzp93AoPAp6i
 sb4hFA1A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nMQjJ-00079k-Vu; Tue, 22 Feb 2022 10:41:06 +0200
Message-ID: <79444c32-64a7-ff54-95b5-b743cbc0a97d@kapsi.fi>
Date: Tue, 22 Feb 2022 10:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
 <c207663d-7d7e-6c10-6ee4-3dd0378181f9@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <c207663d-7d7e-6c10-6ee4-3dd0378181f9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 22:29, Dmitry Osipenko wrote:
> 18.02.2022 12:31, Mikko Perttunen пишет:
>> On 2/17/22 21:16, Thierry Reding wrote:
>>> ...
>>
>> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Left one cosmetic comment in the VIC4.0 patch, but overall looks OK. I
>> think it would be fine to have some basic tests in libdrm as well.
> 
> There is a question about who is going to use this libdrm API. Are you
> going to use it in the VAAPI driver?
> 
> Grate drivers can't use this API because:
> 
> 1. More features are needed
> 2. There is no stable API
> 3. It's super painful to keep all drivers and libdrm in sync from a
> packaging perspective.
> 
> It's much more practical nowadays to use DRM directly, without
> SoC-specific libdrm API, i.e. to bundle that SoC-specific API within the
> drivers.

I'm not planning to use this in the VAAPI driver -- I don't personally 
have any use case for the libdrm API.

Mikko
