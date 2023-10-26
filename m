Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D67D8229
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 14:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E2F10E7B7;
	Thu, 26 Oct 2023 12:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B577710E7B7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 12:01:54 +0000 (UTC)
Received: from [192.168.68.129] (unknown [177.98.22.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D4536600BB0;
 Thu, 26 Oct 2023 13:01:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698321713;
 bh=P7miSVC5nUR1pfCEBltf+JRzaMvQ8U2VaH/muxbKod8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ba0ZMgj+ESqmli3iVMsDFO/ZGRpWBG8UIr0uB9mU8B/tLsfTmu+ysS2r+u8Rajo5p
 d9IYWepvTu6mQKpwfavWuqSz2pam4EHS8eGXDBJXCz4yQ89XNw2G6VOu+Nyy6wbSx5
 yYOR/GNVbd7xJ1UNbMo/IPmrw4pzs5Nidd2Jnbxg4ZR6fC52yVKchwP1vZilVn/CBH
 qM4ozqlPC1R78F+pOqNmKX+UkGAYhs8XbAGCpurxsOhtWOcM60G7Jeky9tq1vQmXgM
 4/TykXXBBnS9fgv+/rUSuqeld5DAFAfi9X++1JNG0tLEU9K9DMxMxCBhoaaILG4JN8
 U7NJ5KLBvOUIA==
Message-ID: <62542ca6-d2c2-4330-8423-3edbdc3b4bd8@collabora.com>
Date: Thu, 26 Oct 2023 09:01:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] drm/doc: ci: Require more context for flaky
 tests
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20231025142441.745947-1-mripard@kernel.org>
 <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
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



On 26/10/2023 07:58, Maxime Ripard wrote:
> On Wed, 25 Oct 2023 16:24:41 +0200, Maxime Ripard wrote:
>> Flaky tests can be very difficult to reproduce after the facts, which
>> will make it even harder to ever fix.
>>
>> Let's document the metadata we agreed on to provide more context to
>> anyone trying to address these fixes.
>>
>>
>> [...]
> 
> Applied to drm/drm-misc (drm-misc-next).

Thanks!

Could you also apply 
https://patchwork.kernel.org/project/dri-devel/cover/20231024004525.169002-1-helen.koike@collabora.com/ 
(and the dependencies listed on it).

Drm/ci in drm-misc is broken atm, there are some people asking me how to 
run it, and this unbreaks it.


Thanks again
Helen

> 
> Thanks!
> Maxime
> 
