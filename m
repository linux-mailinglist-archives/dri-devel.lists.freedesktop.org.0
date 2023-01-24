Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4567A5BB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 23:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48A510E262;
	Tue, 24 Jan 2023 22:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EE010E262
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 22:31:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 9F7B699C;
 Tue, 24 Jan 2023 22:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9F7B699C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1674599465; bh=XqcEf/qNRLT2aV1bbKur1IhHtd76BW7B0JhjDT5HwFI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZApMAIuRAyoIabeOgjAMNxRwU/2kNRV273PbxciM9O36U73aGeWc/DO8VSevQ5rCi
 ROCdgLKEh6MVSCZ5u8GADIkyUrD5ZeCNS2hM07r9fheqr0U3WWgS6Q4C7HlU/Kv8r+
 Y9Yn4Me05P5ArehCeyXNdZO9UVEdpjoo5PM451G3BC3P9e4tmpgD1L0I+S2JVd/iTH
 cn6xIDH7KqfMZIFB7H6VJoGNaZoZ0SFwmbUDNL6cOGUEQJCESq1Asb8q6SRkvhXpJw
 4k8RsMK/Umllp9557D2GafnWs/7OYF4E6yf+4AUSiK4TCgxYIXpuHfEVLzO8bLfGv1
 YHORfjJnVTYTg==
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
Date: Tue, 24 Jan 2023 15:31:04 -0700
Message-ID: <87a627ftuf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-mm@kvack.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SeongJae Park <sj@kernel.org> writes:

> Some subsystem documents are missing SPDX license identifiers on index
> files.  This patchset adds those.
>
> Changes from v1
> (https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
> - Separate from index file content changes
> - Separate patch for each subsystem doc (Alex Deucher)
> - Use MIT license for gpu (Alex Deucher)
>
> SeongJae Park (8):
>   Docs/crypto/index: Add missing SPDX License Identifier
>   Docs/driver-api/index: Add missing SPDX License Identifier
>   Docs/gpu/index: Add missing SPDX License Identifier
>   Docs/hwmon/index: Add missing SPDX License Identifier
>   Docs/input/index: Add missing SPDX License Identifier
>   Docs/mm/index: Add missing SPDX License Identifier
>   Docs/scheduler/index: Add missing SPDX License Identifier
>   Docs/sound/index: Add missing SPDX License Identifier

So I've applied patches 2 (since I wrote the initial file) and 8 (with
Takashi's ack).  The others are also fine, I think, but I hesitate to
apply license texts to files without knowing that they match the
author's intent.  I hate to say it, but I think the best approach is to
send each of the remaining patches to the appropriate maintainers for
the subsystem involved.

Thanks,

jon
