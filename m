Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD67D8240
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 14:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D3C10E118;
	Thu, 26 Oct 2023 12:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD2010E118
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 12:08:12 +0000 (UTC)
Received: from [192.168.68.129] (unknown [177.98.22.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F24296607331;
 Thu, 26 Oct 2023 13:08:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698322091;
 bh=KMs2jbNoAI12ot9iw4tW+YtsbBkE/lhxhwDz5nJ0GIk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=crbsuKnPC/k6n1Ol2C98TiL5gbkJ0+KvJPsgy1kB6qyAalrt5XEm5iAr3XvwYTZ7O
 jrlw0Aoeeu2tyPcXvIeon4c8JEUjDIIH5omCkFlpkFxh3CsqFsg1U2bEXeNK8JL+Os
 wdmvCA2eGrnMXlaHV2BzPFe2Gb+ndBWn4ce/LQzstRe7SmaHzY1IkmE32dHKMBV74L
 Dmf7mKGzq7ExWbCHl6XJ22xhWwwj8/3ydho1QhQFS4ZqKgDr1s0sC7NjTIwHbRNaRF
 xrZMn9/OlHvYVJkCVHFlLyuLid/vOUHpdK8LiN9IrKwgrTzaVcNTs1oOIgot1rcVhH
 Nia24HCh4vYzg==
Message-ID: <22723536-dc2e-4973-984b-1504367d84a0@collabora.com>
Date: Thu, 26 Oct 2023 09:08:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] drm/doc: ci: Require more context for flaky
 tests
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20231025142441.745947-1-mripard@kernel.org>
 <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
 <62542ca6-d2c2-4330-8423-3edbdc3b4bd8@collabora.com>
In-Reply-To: <62542ca6-d2c2-4330-8423-3edbdc3b4bd8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/10/2023 09:01, Helen Koike wrote:
> 
> 
> On 26/10/2023 07:58, Maxime Ripard wrote:
>> On Wed, 25 Oct 2023 16:24:41 +0200, Maxime Ripard wrote:
>>> Flaky tests can be very difficult to reproduce after the facts, which
>>> will make it even harder to ever fix.
>>>
>>> Let's document the metadata we agreed on to provide more context to
>>> anyone trying to address these fixes.
>>>
>>>
>>> [...]
>>
>> Applied to drm/drm-misc (drm-misc-next).
> 
> Thanks!
> 
> Could you also apply 
> https://patchwork.kernel.org/project/dri-devel/cover/20231024004525.169002-1-helen.koike@collabora.com/ (and the dependencies listed on it).

For some reason, commit message 7/10 (drm/ci: increase i915 job timeout 
to 1h30m) looks incomplete in patchwork, but it looks fine in my branch:

https://gitlab.freedesktop.org/helen.fornazier/linux/-/commits/for-drm-misc-wip/

Let me know if you prefer that I send it again or if you could pull from 
the branch.

Thanks
Helen

> 
> Drm/ci in drm-misc is broken atm, there are some people asking me how to 
> run it, and this unbreaks it.
> 
> 
> Thanks again
> Helen
> 
>>
>> Thanks!
>> Maxime
>>
