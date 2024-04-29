Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C88B611A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 20:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF83110E764;
	Mon, 29 Apr 2024 18:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0X/Z9ZQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B3910E764
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714415367;
 bh=Kh7KSfT+afhrnsg/RQIvoajaDFYQEIaiPqgWKjXCJy0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0X/Z9ZQQM+OMzKu1s03bXpB1wke6mXW1ad6sbvv7KS9RrZSweIEFRv6QJlg/bAXlo
 SONDUyUOfhsE7XGhqpocPvQFifEkA9CP+9UwXPtM7nPm6Fq2i2WPX4Eqdxq2Q3UvdH
 4Qq+HpKXYZYoMsE+vO85vRQbH/gx2MsE5DCO3Ul9E3QMQYNT1iGnxUEFyawAc4nxR0
 ED9vOAyoD1jroLiBdof5M8w394s8skIS3sKIZMYz9JINamqjPwCXKJzNMtYHuSnmIa
 PZVFyjVT0wMqFNbr98VbuOo9F8NWv/pV8ZDpju5nt9uaGJ7yfpE2p9NnTxyp0UXEvn
 8zSlpmkhxgHlw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58EDC3782171;
 Mon, 29 Apr 2024 18:29:25 +0000 (UTC)
Message-ID: <5ec8add9-7cd1-46dc-be6d-2e2d9808867c@collabora.com>
Date: Mon, 29 Apr 2024 15:29:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-misc migration to Gitlab server
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240312-bizarre-rational-sawfish-ccee0a@houat>
 <2ddb4f5e-504e-4ce3-95d2-179dc7e6bf7b@ursulin.net>
 <90390c46-27ee-4dd3-b250-3fa950960725@collabora.com>
 <87sez42gtg.fsf@intel.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <87sez42gtg.fsf@intel.com>
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



On 29/04/2024 14:56, Jani Nikula wrote:
> On Mon, 29 Apr 2024, Helen Koike <helen.koike@collabora.com> wrote:
>> On 01/04/2024 13:49, Tvrtko Ursulin wrote:
>>> No issues accessing the repo just a slight confusion and how to handle
>>> the workflow. More specifically, if I have a patch which wants to be
>>> merged to drm-misc-next, is the mailing list based worklflow still the
>>> way to go, or I should create a merge request, or I should apply for
>>> commit access via some new method other than adding permissions to my
>>> legacy fdo ssh account?
>>
>> I have this same question, I thought we would keep the workflow with dim
>> tool, but after I pointed drm-misc remote to gitlab, dim is not happy.
>>
>> If I don't point drm-misc to gitlab, dim say it is outdated (but I'm
>> using the last top of the tree of maintainer-tools).
>>
>> So I was wondering if dim requires changes or if the workflow changed.
> 
> The workflow has not changed, only the location of the repo.

Thanks for confirming.

> 
> I'm afraid there's insufficient info here to say what exactly is going
> on though.

I re-executed dim setup and it seems to be working now.

Thanks.
Helen

> 
> BR,
> Jani.
> 
> 
