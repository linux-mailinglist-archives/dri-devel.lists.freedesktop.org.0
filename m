Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AEB7FF0B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 14:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060F10E12B;
	Thu, 30 Nov 2023 13:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C846810E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 13:50:59 +0000 (UTC)
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 037796607345;
 Thu, 30 Nov 2023 13:50:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701352258;
 bh=HGnD8bUQWOaK+6RFgKTsVFZmO6HTrfFGIJlJrDox4v8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H58wh8CHNeyKhFKLgOKBi4cHe/A5GWRrfro7BiyeAt4Jr5iSpHtao56/5Xpa0WFNt
 iL9p94K8uIyTXndAwxXyrdNoIHY9sXoa5oBmnefTqKNP3R0jrZm8Swjg7huYA2KQi2
 qA2dhqdwQ0MRA5G3Od4dScyaTjrYKG0aYkBzU0D3kIBfKadg5E9uG5RT6kHtSoFYVf
 4V0V4odklj4B0h1o/kAGP/l1KaQWj1PwW92dO9KW8DxzbwFbO/+nUqH7C+XFTFeJ/d
 058/Sgc7SGQkJBFyU3cqme3tnGtkMBUFdWLM7lBBh92rCW62iY4m/GSvtgeOyxYAOI
 yAE7gIc4P+R8w==
Message-ID: <893192db-0431-4d1f-7281-952da9979345@collabora.com>
Date: Thu, 30 Nov 2023 19:20:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for
 mt8173
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-7-vignesh.raman@collabora.com>
 <CAPj87rPKywWa8KxTCeJQz4vvgTwhPzL+y4aCX9zxZDkkfrvsoQ@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rPKywWa8KxTCeJQz4vvgTwhPzL+y4aCX9zxZDkkfrvsoQ@mail.gmail.com>
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
Cc: daniels@collabora.com, emma@anholt.net, david.heidelberg@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 gustavo.padovan@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 29/11/23 18:52, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Wed, 29 Nov 2023 at 12:19, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Expected driver for mt8173 is "mediatek" and for mt8183
>> it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
>> the expected driver for mt8173.
> 
> Actually, for mt8183 it's both. And for mt8173 it will probably be
> mediatek+pvr pretty soon. Each of these SoCs (like most Arm devices)
> have a separate display controller and GPU, with different drivers for
> each. They'll run different tests with different xfails. So we should
> figure out a way to support igt running for both devices on the one
> system.

Agree. Will work on separate patch to test both the drivers for these 
devices.

Regards,
Vignesh
