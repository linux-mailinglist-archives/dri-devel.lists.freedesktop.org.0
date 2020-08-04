Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E723B6F7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 10:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45B96E178;
	Tue,  4 Aug 2020 08:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8429C6E178
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 08:43:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0748gu8o008394;
 Tue, 4 Aug 2020 03:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596530576;
 bh=UclWkNkfzOmdE1HQWxtPsELGDs2wEVpPegALj6LL3Gg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zCkdtrTqjkqJtfGU0SIGqi9cdN/vaywjBSMr4BWMpgwg8yh/vhaW7EK5YP3QJJHz4
 lb1jEerZMEaIwZrbdRidJDvJNrr8Q84oHM4NT17pyyLTEmJVWCL3xSzXmmVJ9G3+y7
 /zBy29EelXv+WgyfKj9MhNVkPRzkXXJBbL7lryfQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0748gu4i021040;
 Tue, 4 Aug 2020 03:42:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 03:42:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 03:42:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0748grsQ122178;
 Tue, 4 Aug 2020 03:42:54 -0500
Subject: Re: [PATCH] drm: omapdrm: Delete surplus GPIO includes
To: Linus Walleij <linus.walleij@linaro.org>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20200626220606.340937-1-linus.walleij@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f2b0399e-16ac-e90a-ba36-69de0a0e5880@ti.com>
Date: Tue, 4 Aug 2020 11:42:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200626220606.340937-1-linus.walleij@linaro.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2020 01:06, Linus Walleij wrote:
> The OMAP DRM driver includes <linux/gpio.h> into the two
> hdmi4.c and hdmi5.c files but does not use any symbols from
> these files. Drop the includes.
> 
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c | 1 -
>  2 files changed, 2 deletions(-)

Thanks, I have picked this up.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
