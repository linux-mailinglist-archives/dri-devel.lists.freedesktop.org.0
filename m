Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD947D78E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBF410E1D6;
	Wed, 22 Dec 2021 19:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B10910E1D6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:17:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E03D983049;
 Wed, 22 Dec 2021 20:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1640200658;
 bh=wEfdjarYrVixRNvRPuXJZ/5YTjPMrHENxldNGxFm+JU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GzJrBRREBgJ/8m8xGayVxcZ8FxeashG4re+DLgQScsGhJrJoCc0s1PTErGuiruMle
 SzQt5yXbS6DYhZ1ZVYS+BNGXmfaeU6A2lq8SIK1MiweJQJaB7ENz2VJJHzupM4fhwx
 HsMpTWdvBBCBtH6zdxBMWihFcxTuKWU2ED09xb+MgSYOW/hyqZ8adx+z11A7jJl2MZ
 rg05+xE0klXLoU5rKBu+1tqKbPZgd4TyEuNPvuvQpqO754XJZhY+GxIHUT1rZ2Hz6I
 4IXG+9yfaqkS2TRCikbjftb0uBYYvwXwnI+zWouMzOL7RNxYlrrYny7fYaNb4ZhIhw
 Racsgc2iWjJpA==
Message-ID: <7818a1cf-50df-7ec4-4718-18cfae37e5e2@denx.de>
Date: Wed, 22 Dec 2021 20:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix duplicate
 key
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20211220125147.519880-1-thierry.reding@gmail.com>
 <YcNobgVJADzY8waQ@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YcNobgVJADzY8waQ@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/22/21 19:03, Rob Herring wrote:
> On Mon, 20 Dec 2021 13:51:47 +0100, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> In order to validate multiple "if" conditionals, they must be part of an
>> "allOf:" list, otherwise they will cause a failure in parsing the schema
>> because of the duplicated "if" property.
>>
>> Fixes: d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select")
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   .../bindings/display/bridge/lvds-codec.yaml   | 43 ++++++++++---------
>>   1 file changed, 22 insertions(+), 21 deletions(-)
>>
> 
> I went ahead and applied to drm-misc, so linux-next is fixed.

Thank you
