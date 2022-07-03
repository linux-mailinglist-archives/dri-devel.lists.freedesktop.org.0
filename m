Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F5565B07
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F53810E85D;
	Mon,  4 Jul 2022 16:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847A210E042
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 23:27:59 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 186596601649;
 Mon,  4 Jul 2022 00:27:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656890878;
 bh=5MGJ0vMu4p7gV9rxIqrR/BItCetuv+SX60W/DXOi4bY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kNILAW2SGM0fjPAJgjA5Q7E2Eg9OFPy3voluKf0iBgGPGGxxWUjpxuNF2u6LVNAYo
 GQ7LREYrzl1z0uebqCHL/MhqK7iUtc+cjQdL4ppdNYsku7C4OL/EZPrE3ZnOdiMDo/
 zeJWU17zsgBUkNV1CN+JP93mO5OeCwwV/FKENkQ2I3+5O9xrjH3a4Y/3tp+n8c574T
 6irq/tViuRXkiamCCpw2yD2AqhMDpnERrQAoAhuB6U42nnpT0au3XoRvLNn1qup4h3
 9jm7Vj3ub0O9elhNb3mFrlh5FCexSYeZO2SMB2wxTXTyEuLzP/kyLNJryaReSSQzk6
 NB3SNin0fpbwA==
Message-ID: <ddc8352b-655c-23aa-1907-d4e3815dae90@collabora.com>
Date: Mon, 4 Jul 2022 02:27:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220529180548.9942-1-clamor95@gmail.com>
 <b7715f7d-c69d-2bb0-8226-bcb29e5bf91c@collabora.com>
 <YsHmTdvSyX/DYAzP@ravnborg.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YsHmTdvSyX/DYAzP@ravnborg.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/3/22 21:56, Sam Ravnborg wrote:
> Hi Dmitry,
> On Thu, Jun 30, 2022 at 08:23:06PM +0300, Dmitry Osipenko wrote:
>> Hello Sam,
>>
>> On 5/29/22 21:05, Svyatoslav Ryhel wrote:
>>> This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
>>> display panels that are used by Asus Transformer tablets, which we're
>>> planning to support since 5.17 kernel.
>>
>> The tablets now supported since 5.17 and awaiting for the panel patches.
>>
>>> Changelog:
>>> v5: - previously patches were sent by Dmitry and he asked me to resend them
>>>
>>> v4: - Added r-b from Rob Herring that he gave to the LQ101R1SX01 DT patch
>>>       of v2. I missed to add it to the v3 by accident.
>>>
>>> v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
>>>       these panels were merged to 5.17, so we're missing the display support.
>>>
>>> v2: - Added ack from Rob Herring to the HSD101PWW2 binding.
>>>
>>>     - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
>>>       making LQ101R1SX03 directly compatible with the LQ101R1SX01.
>>>       Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
>>>       used in DT. This removes need to update panel driver with the new
>>>       compatible.
>>>
>>>     - Improved commit message of the LQ101R1SX03 patch.
>>>
>>>     - Added my s-o-b to all patches.
>>>
>>> Anton Bambura (1):
>>>   dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
>>>
>>> Svyatoslav Ryhel (2):
>>>   dt-bindings: display: simple: Add HannStar HSD101PWW2
>>>   drm/panel: simple: Add support for HannStar HSD101PWW2 panel
>>>
>>>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>>>  .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
>>>  drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
>>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>>
>>
>> Sam, could you please take a look at these patches? They missed two
>> kernel versions already because there was nobody to apply them. Thanks
>> in advance.
> 
> I went through the panel backlog a week or two ago, but missed these.
> Likely because I did not look more than a week back.
> Sorry for letting it take so long - but I am not the most reliable linux
> developer these days (hobby time only, and time is limited).

That is totally fine. There are not that many full-time maintainers in
kernel.

> Patches are now applied to drm-misc (drm-misc-next) and should soon be
> visible in -next.

Awesome, thank you.

-- 
Best regards,
Dmitry
