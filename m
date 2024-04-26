Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D808B397F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D986B10F44E;
	Fri, 26 Apr 2024 14:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="hFUkgExE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A91210F1D9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=RxhcjK/A9ltE8vS9iwHLvd+KtyalxnkR44emY4L0uhc=; b=hFUkgExEUfg9oDD0ogIkTAkBOI
 fw/jSV+0O2urwyQvLHdy5d4tRxSlc9+nSWIa5V53NLipFvjYdHsOFl2xwhCiFpE7dEVTzOgsRHw/p
 MONoU/CVwNA65I0wHJuwa152nUn+Qv04/HmfY0tBfJ70AVAJmzzKSm6P1IC9SjT2ZuvBUOMMKy/UI
 jFuSQwRC27hYh42iBdh6ID/xsFFaTAMv5bQooPrLANAtv+m3zO4CK+LxsazLyUpLhQ4APGZwZXZw/
 4iccGcUrke5EHrBFM7LXR8WZt2ge150vswksmmYboEkTfVn7Col2X9cVu6cWVLPz6I4uZFefAF0e1
 XryZ2MBw==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=49646)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1s0MG0-00E0w1-P7;
 Fri, 26 Apr 2024 16:08:56 +0200
Message-ID: <06ff6468-be94-4ebc-826a-15c22af4e34d@tronnes.org>
Date: Fri, 26 Apr 2024 16:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/tiny: ili9225: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Lechner <david@lechnology.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240327174842.519758-1-krzysztof.kozlowski@linaro.org>
 <74fe0120-379c-4a18-a680-536304b8ac2e@linaro.org>
Content-Language: en-US
Cc: noralf@tronnes.org
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <74fe0120-379c-4a18-a680-536304b8ac2e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 4/24/24 08:45, Krzysztof Kozlowski wrote:
> On 27/03/2024 18:48, Krzysztof Kozlowski wrote:
>> Core in spi_register_driver() already sets the .owner, so driver
>> does not need to.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/tiny/ili9225.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> It has been almost a month. Any comments on this patchset? Can this be
> picked up?
> 

Thanks for cleaning up, patches applied to drm-misc-next.

Noralf.
