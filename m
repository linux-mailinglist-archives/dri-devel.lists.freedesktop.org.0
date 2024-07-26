Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584493D041
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 11:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F0310E389;
	Fri, 26 Jul 2024 09:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eeis9VVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05F10E389
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721985347;
 bh=RTeg7a5/NBnZzeXWaxhUT9VJlh63EkpCYf65DHwKFvM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eeis9VVWUc/vDnNE7fv53g8nbt6B5Ka0RNjZ+/KjfWlGd2LpMSnWoBe9HjNUp9CoB
 N5nEByoGgV0A3u7Pta7M33OkXANIA/6bwZ7R1O5jDcFUHBdvIhDpJAmfmhGyMeBXSL
 Ly+HNtfzSEvKS59rs17LnYmwDkscWSR9rkGAhBKmb28YpWKhBbfHVW/QK9D5lb47sR
 fAsdZM3NeNoFxm3mmp7KDcXvM3Ii9iT+/4hv54gUkDzvnleX1haSe+uwdFG7yubvwB
 mJz1jsmWiqvDW/IS0dajDDeivsY1FnKFDx356uMUskCVhovZv1yf0mnnyOEpYUk3Gb
 4YEoIGwftfXMA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8605C37804D4;
 Fri, 26 Jul 2024 09:15:44 +0000 (UTC)
Message-ID: <2cbaf9a5-faf5-4019-9ae9-709fa1647a40@collabora.com>
Date: Fri, 26 Jul 2024 14:45:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] drm/ci: mediatek: add tests for mediatek display
 driver
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
 <20240724101015.523535-3-vignesh.raman@collabora.com>
 <CAPj87rMfs+_EMyJT1PoLTXmrosDiqQy_N4VYSA+M3R5q4sit5Q@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rMfs+_EMyJT1PoLTXmrosDiqQy_N4VYSA+M3R5q4sit5Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 26/07/24 12:54, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Wed, 24 Jul 2024 at 11:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> +dumb_buffer@create-clear,Fail
>> +dumb_buffer@create-valid-dumb,Fail
>> +dumb_buffer@invalid-bpp,Fail
>> +dumb_buffer@map-invalid-size,Fail
>> +dumb_buffer@map-uaf,Fail
>> +dumb_buffer@map-valid,Fail
>> +fbdev@eof,Fail
>> +fbdev@read,Fail
>> +fbdev@unaligned-read,Fail
> 
> Please skip dumb_buffer and fbdev tests for all GPU-only drivers,
> because those are testing display functionality.

Will skip these tests for gpu-only drivers. Thanks.

Regards,
Vignesh
