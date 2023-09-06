Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734587934C5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 07:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7768E10E1C6;
	Wed,  6 Sep 2023 05:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0E210E1C6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 05:11:44 +0000 (UTC)
Received: from [192.168.1.23] (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AF446606EE0;
 Wed,  6 Sep 2023 06:11:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693977103;
 bh=fBJ3Kvxa7kDKwh6Ep4cHrxUMmOzW8yApsuqM6ao47lM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rw2OLms0VnNCk29BxEi3Hq+Ws4UWpvLBZXwBJvgde8cFJM6Wvje1/Wa6UvWYnjQTR
 xkU9U+z7pLLUQAAgREx4eWlMfUkJZ61a/g6gqHpyMgj1CBq234EsopA1kQVGBTycIP
 UE/maCTN9z4BZI47yTVosrV92BxO5j059+Kv50M49tOvrZ7wtqJzJ7xS9JV0O/vTwr
 ReJSR0RYkQbnxRcDXO/mqt0iHLeOnjNWHMXeV7TuNX4NfcJM/BWBBbrGey/B1tzJft
 kxQ3/YWB7z+WLmqBh1fPC+IMr7+Jt6lLddXHDkeU2g1Aru95rLiubscoFGmP+wLFGW
 OsWEwwGTcPq+w==
Message-ID: <2bbce9cd-8b0d-6021-639b-8198620d7a99@collabora.com>
Date: Wed, 6 Sep 2023 10:41:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
 <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
 <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
 <427ceb32-054f-41ff-df95-446b18aa178f@collabora.com>
 <6uusq7jlofbztz34yksxbr6vgqq35a3x7ibuqm62dyrpzve4g5@boaladlcrjnv>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <6uusq7jlofbztz34yksxbr6vgqq35a3x7ibuqm62dyrpzve4g5@boaladlcrjnv>
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 05/09/23 19:10, Maxime Ripard wrote:
>> With,
>> &usb {
>> 	dr_mode = "host";
>> };
>>
>> The target is <0xffffffff> and fdtoverlay fails to apply the dtbo.
> 
> You do have /plugin/ and have compiled the base device tree with overlay
> support, right?

After compiling base dtbs with overlay support (make DTC_FLAGS=-@ dtbs) 
it works.

> 
>> With,
>> &{/soc@0/usb} {
>>           dr_mode = "host";
>> };
>>
>> The target-path is "/soc@0/usb" (usb: usb@78d9000)
> 
> Right, and that's not the path you want to modify. The path you want to
> modify is /soc@0/usb@78d9000. usb is the label, it's absolute, and you
> can't mix and match a path ("/soc@0/") and a label ("usb")

Thanks for the clarification.

Regards,
Vignesh

