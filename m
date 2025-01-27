Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE4EA1CFD5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 04:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6309410E136;
	Mon, 27 Jan 2025 03:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FD0JVqwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C633010E136
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 03:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737950183;
 bh=IObs1/3ftVIXcrcHAAaEO9FHqrki8Lsf9n0KXWbAnH4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FD0JVqwuCY7goV2eSFKvQ9Ma3n/rm9HCWDy/ljIWZyjXbpYkX3L59auKgQcm3oO00
 8k5ZSt6oB7JpqV0rkK+45NMZoqhpXbE7xoyODimPbFff2aPEiRwy6jY5ZfjAZVmqDS
 WnM+w/SMrGzO7F4SWskUqzkr6BMYOSakoVMkJZfbCkN9wguQdsXTZ5YQhd21knoE7U
 ZD7ageo0jO5rZs5xmGXdki03e06ZhBdpOAUiJau9WtVnh+SfWfVGRO+btx1BuifKLA
 iDGRyy34W2gZlOoDQcw/KQ/b88BKMBoHLYOb6qVYKvF8Lo90tS5oAXPuBkvro8Hfkr
 3nn7wfTD2U64g==
Received: from [192.168.50.250] (unknown [171.76.81.174])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D93317E0B25;
 Mon, 27 Jan 2025 04:56:14 +0100 (CET)
Message-ID: <47538328-670e-4c71-a07f-b313f99e56cd@collabora.com>
Date: Mon, 27 Jan 2025 09:26:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] kci-gitlab: docs: Add images
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com, spbnick@gmail.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, laura.nao@collabora.com, kernel@collabora.com,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, leobras.c@gmail.com,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, jarkko@kernel.org
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <20250123135342.1468787-6-vignesh.raman@collabora.com>
 <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
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

Hi Linus,

On 23/01/25 21:16, Linus Torvalds wrote:
> On Thu, 23 Jan 2025 at 05:56, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>
>>   Documentation/ci/gitlab-ci/images/drm-vkms.png | Bin 0 -> 73810 bytes
>>   .../ci/gitlab-ci/images/job-matrix.png         | Bin 0 -> 20000 bytes
>>   .../ci/gitlab-ci/images/new-project-runner.png | Bin 0 -> 607737 bytes
>>   .../ci/gitlab-ci/images/pipelines-on-push.png  | Bin 0 -> 532143 bytes
>>   .../ci/gitlab-ci/images/the-pipeline.png       | Bin 0 -> 62464 bytes
>>   .../ci/gitlab-ci/images/variables.png          | Bin 0 -> 277518 bytes
> 
> 
> This seems excessive.
> 
> We have a few images in the tree, but they tend to be either the
> penguin logo or various source SVGs.
> 
> Not a set of random screenshots or whatever.

We will remove this commit and update the documentation. Thanks.

Regards,
Vignesh

> 
>           Linus
